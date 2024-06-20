open Import

module Log =
  (val Logs.src_log
         (Logs.Src.create "awssdklib.http.http_connection" ~doc:"AwsSdkLib Http Connection wrapper")
      : Logs.LOG)

module type S = sig
  include Connection_pool.ConnectionType

  val make_connection_info : Uri.t -> connection_info
  val connection_info_host : connection_info -> string
  val connection_info_port : connection_info -> int
  val connection_info_scheme : connection_info -> string

  exception ConnectionFailure of Http_types.http_failure

  val request :
    connection:connection ->
    body:Http_types.input_body ->
    method_:Http_types.method_ ->
    headers:Http_types.headers ->
    sw:Eio.Switch.t ->
    on_ready:(unit -> unit) ->
    string ->
    string ->
    (Response.t * Body.t, Http_types.http_failure) result
end

module M : S = struct
  let ( let* ) = Result.bind

  type connection_info = { host : string; port : int; scheme : string }

  let default_timeout = 5.0

  exception ConnectionFailure of Http_types.http_failure

  type connection = {
    http_client : (module Protocol_intf.HttpClientImpl);
    last_error : Http_types.http_failure option ref;
  }

  let make_connection_info uri =
    let host = Uri.host uri |> Option.map String.lowercase_ascii in
    let port = Uri.port uri |> Option.value ~default:443 in
    let path = Uri.path uri in
    let path = if String.length path = 0 then "/" else path in
    let scheme = Uri.scheme uri |> Option.value ~default:"https" in
    match host with
    | Some host -> { host; port; scheme }
    | None -> raise (ConnectionFailure (Http_types.InvalidUri uri))

  let connection_info_to_string { host; port; _ } =
    let hostname = (host |> String.lowercase_ascii) ^ ":" ^ (port |> Int.to_string) in
    hostname

  let connection_info_host ci = ci.host
  let connection_info_port ci = ci.port
  let connection_info_scheme ci = ci.scheme

  let shutdown connection =
    let module ProtocolImpl = (val connection.http_client : Protocol_intf.HttpClientImpl) in
    ProtocolImpl.shutdown ()

  let is_valid connection = Option.is_none !(connection.last_error)

  let connect_within_timeout ?(timeout = Eio.Time.Timeout.none) ~host ~service sw t =
    let open Eio in
    match
      let rec aux = function
        | [] -> raise @@ Net.err Net.(Connection_failure No_matching_addresses)
        | addr :: addrs -> (
            try Time.Timeout.run_exn timeout (fun () -> Net.connect ~sw t addr) with
            | (Time.Timeout | Eio.Exn.Io _) when addrs <> [] -> aux addrs
            | Time.Timeout -> raise @@ Net.err (Net.Connection_failure Timeout))
      in
      Net.getaddrinfo_stream ~service t host
      |> List.filter_map (function `Tcp _ as x -> Some x | `Unix _ -> None)
      |> aux
    with
    | conn -> conn
    | exception (Eio.Exn.Io _ as ex) ->
        let bt = Printexc.get_raw_backtrace () in
        Eio.Exn.reraise_with_context ex bt "connecting to %S:%s" host service

  let connect ~info:{ host; port; scheme } ~sw env =
    let network = Eio.Stdenv.net env in
    let mono_clock = Eio.Stdenv.mono_clock env in
    let hostname = (host |> String.lowercase_ascii) ^ ":" ^ (port |> Int.to_string) in
    Logs.debug (fun m -> m "Creating new connection to hostname %s" hostname);
    let ctx = Ssl_helpers.create_ssl_context () in
    Log.debug (fun m -> m "Establishing SSL Connection to %s:%d" host port);
    let socket =
      connect_within_timeout
        ~timeout:(Eio.Time.Timeout.seconds mono_clock default_timeout)
        ~host ~service:"https" sw network
    in
    let ssl_context = Eio_ssl.Context.create ~ctx socket in

    let ssl_socket = Eio_ssl.Context.ssl_socket ssl_context in
    Ssl.set_client_SNI_hostname ssl_socket host;
    Ssl.set_hostflags ssl_socket [ Ssl.No_partial_wildcards ];
    Ssl.set_host ssl_socket host;
    let ssl_socket = Eio_ssl.connect ssl_context in
    let alpn = ssl_context |> Eio_ssl.Context.ssl_socket |> Ssl.get_negotiated_alpn_protocol in
    Log.debug (fun m ->
        m "Established SSL Connection with protocol %s" (alpn |> Option.value ~default:"<none>"));
    let client =
      match alpn with
      | Some "http/1.1" ->
          Http_eio_http1_1_protocol_impl.make_http_1_1_client ~sw ~scheme ssl_socket
      | _ -> raise (ConnectionFailure NoSupportedProtocol)
    in

    { http_client = client; last_error = ref None }

  let request ~connection ~body ~method_ ~headers ~sw ~on_ready host path =
    let body_reader_promise, body_reader_resolver =
      Eio.Promise.create ~label:"HTTP Response Body Read" ()
    in
    let module ProtocolImpl = (val connection.http_client : Protocol_intf.HttpClientImpl) in
    match ProtocolImpl.request ~body ~method_ ~headers host path with
    | Ok (response, body_reader) ->
        let body = Body.{ reader = body_reader; resolver = body_reader_resolver } in
        (* Return connection to the pool once the body is read *)
        Eio.Fiber.fork ~sw (fun () ->
            Eio.Promise.await body_reader_promise;
            Logs.debug (fun m -> m "[%d] Response body consumed" response.status);
            on_ready ());
        Ok (response, body)
    | Error http_failure ->
        connection.last_error := Some http_failure;
        Error http_failure
end
