module Log =
  (val Logs.src_log (Logs.Src.create "awssdklib.http" ~doc:"AwsSdkLib Http implementation")
      : Logs.LOG)

open Import
open Protocol_intf
module Response = Response
module Body = Body

type input_body = Http_intf.input_body
type headers = Http_intf.headers
type method_ = Http_intf.method_

exception NoSupportedProtocol = Http_intf.NoSupportedProtocol
exception InvalidUri = Http_intf.InvalidUri
exception ConnectionError = Http_intf.ConnectionError

type connectionState = ConnectionPending | ConnectionAvailable | ConnectionInRequest
type connection = { client : (module HttpClientImpl); state : connectionState }

let connections : connection StringHash.t = StringHash.create 5
let string_of_method = H2.Method.to_string

let close_all_connections () =
  connections |> StringHash.to_seq_values
  |> Seq.iter (fun connection ->
         let module Client = (val connection.client : Protocol_intf.HttpClientImpl) in
         Log.debug (fun m -> m "Closing connection@.");
         Client.shutdown () |> Eio.Promise.await)

let create_ssl_context () =
  let ctx = Ssl.create_context Ssl.TLSv1_2 Ssl.Client_context in
  Ssl.honor_cipher_order ctx;
  Ssl.set_context_alpn_protos ctx [ "h2"; "http/1.1" ];
  Ssl.set_min_protocol_version ctx Ssl.TLSv1_2;
  Ssl.set_max_protocol_version ctx Ssl.TLSv1_3;
  let _ = Ssl.set_default_verify_paths ctx in
  Ssl.set_verify ctx [ Ssl.Verify_peer ] (Some Ssl.client_verify_callback);
  Ssl.set_verify_depth ctx 5;
  ctx

let resolve_address host port =
  let addresses =
    Eio_unix.run_in_systhread (fun () ->
        Unix.getaddrinfo host (Int.to_string port) [ Unix.AI_FAMILY Unix.PF_INET ])
    |> List.filter_map (fun (addr : Unix.addr_info) ->
           match addr.ai_addr with Unix.ADDR_INET (addr, port) -> Some (addr, port) | _ -> None)
  in
  let addr =
    let inet, port = List.hd addresses in
    Logs.debug (fun m ->
        m "resolve_address: %s:%d -> %s:%d" host port (Unix.string_of_inet_addr inet) port);
    `Tcp (Eio_unix.Net.Ipaddr.of_unix inet, port)
  in
  addr

let create_or_retrieve_connection ~host ~port ~scheme ~error_handler ~sw network =
  match StringHash.find_opt connections host with
  | Some connection -> connection
  | None ->
      let ctx = create_ssl_context () in
      Log.debug (fun m -> m "Resolving address for %s://%s:%d" scheme host port);
      let addr = resolve_address host port in
      Log.debug (fun m -> m "Establishing SSL Connection to %s:%d" host port);
      let socket = Eio.Net.connect ~sw network addr in
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
        | Some "h2" -> begin
            let client = Http2_impl.make_http2_client ~sw ~scheme ssl_socket in
            client
          end
        | Some "http/1.1" -> Http1_1_impl.make_http_1_1_client ~sw ~scheme ssl_socket
        | _ -> raise NoSupportedProtocol
      in
      let connection = { client } in
      StringHash.add connections host connection;
      connection

let make_connection_error_handler error_promise err =
  let _ =
    match err with `Exn exn -> Log.warn (fun m -> m "Exception: %s" (Printexc.to_string exn))
  in
  Eio.Promise.resolve error_promise (Error err)

let request ~sw ~method_ ~uri ?(headers : headers option) ?(body : input_body option) env =
  let network = Eio.Stdenv.net env in
  let host = Uri.host uri |> Option.map String.lowercase_ascii in
  let port = Uri.port uri |> Option.value ~default:443 in
  let path = Uri.path uri in
  let path = if String.length path = 0 then "/" else path in
  let scheme = Uri.scheme uri |> Option.value ~default:"https" in
  let headers = headers |> Option.value ~default:[] in
  let body = body |> Option.value ~default:`None in
  let response_promise, response_resolver = Eio.Promise.create ~label:"SSL Connection" () in
  let error_handler = make_connection_error_handler response_resolver in
  match host with
  | Some host ->
      let connection =
        create_or_retrieve_connection ~host ~port ~scheme ~sw ~error_handler network
      in
      let module ProtocolImpl = (val connection.client : HttpClientImpl) in
      let response, body_reader = ProtocolImpl.request ~body ~method_ ~headers host path in
      let body = Body.{ body_reader } in
      (response, body)
  | _ -> raise (InvalidUri uri)
