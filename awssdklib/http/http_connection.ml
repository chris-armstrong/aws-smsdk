open Import
open Http_intf

let ( let* ) = Result.bind

type connection_info = { host : string; port : int; scheme : string }

let default_timeout = 5.0

type connection = {
  http_client : (module Protocol_intf.HttpClientImpl);
  socket : Eio_unix.Net.stream_socket_ty Eio.Net.stream_socket;
  last_error : http_failure option ref;
}

let connection_info_to_string { host; port; _ } =
  let hostname = (host |> String.lowercase_ascii) ^ ":" ^ (port |> Int.to_string) in
  hostname

let shutdown connection =
  let module ProtocolImpl = (val connection.http_client : Protocol_intf.HttpClientImpl) in
  ProtocolImpl.shutdown ()

let is_valid connection = Option.is_none !(connection.last_error)

exception ConnectionFailure of http_failure

let connect_within_timeout ?(timeout = Eio.Time.Timeout.none) ~host ~service t =
  let open Eio in
  Switch.run ~name:"with_tcp_connect" @@ fun sw ->
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
      ~host ~service:"https" network
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
    | Some "h2" -> Http2_impl.make_http2_client ~sw ~scheme ssl_socket
    | Some "http/1.1" -> Http1_1_impl.make_http_1_1_client ~sw ~scheme ssl_socket
    | _ -> raise (ConnectionFailure NoSupportedProtocol)
  in

  { http_client = client; socket; last_error = ref None }

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
