open Import
open Http_intf

let ( let* ) = Result.bind

type connection_info = { host : string; port : int; scheme : string }

type connection = {
  http_client : (module Protocol_intf.HttpClientImpl);
  socket : Eio_unix.Net.stream_socket_ty Eio.Net.stream_socket;
}

let connection_info_to_string { host; port; _ } =
  let hostname = (host |> String.lowercase_ascii) ^ ":" ^ (port |> Int.to_string) in
  hostname

let shutdown connection =
  let module ProtocolImpl = (val connection.http_client : Protocol_intf.HttpClientImpl) in
  ProtocolImpl.shutdown ()

let max_concurrency connection =
  let module ProtocolImpl = (val connection.http_client : Protocol_intf.HttpClientImpl) in
  ProtocolImpl.max_concurrency

let connect ~info:{ host; port; scheme } ~sw env =
  let network = Eio.Stdenv.net env in
  let hostname = (host |> String.lowercase_ascii) ^ ":" ^ (port |> Int.to_string) in
  Logs.debug (fun m -> m "Creating new connection to hostname %s" hostname);
  let ctx = Ssl_helpers.create_ssl_context () in
  Log.debug (fun m -> m "Resolving address for %s://%s:%d" scheme host port);
  let addr = Dns.resolve_address host port in
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
    | Some "h2" -> Ok (Http2_impl.make_http2_client ~sw ~scheme ssl_socket)
    | Some "http/1.1" -> Ok (Http1_1_impl.make_http_1_1_client ~sw ~scheme ssl_socket)
    | _ -> Error NoSupportedProtocol
  in

  Result.map (fun client -> { http_client = client; socket }) client

let request ~connection ~body ~method_ ~headers ~sw ~on_ready host path =
  let body_reader_promise, body_reader_resolver =
    Eio.Promise.create ~label:"HTTP Response Body Read" ()
  in
  let module ProtocolImpl = (val connection.http_client : Protocol_intf.HttpClientImpl) in
  let* response, body_reader = ProtocolImpl.request ~body ~method_ ~headers host path in
  let body = Body.{ reader = body_reader; resolver = body_reader_resolver } in
  (* Return connection to the pool once the body is read *)
  Eio.Fiber.fork ~sw (fun () ->
      Eio.Promise.await body_reader_promise;
      Logs.debug (fun m -> m "[%d] Response body consumed" response.status);
      on_ready ());
  Ok (response, body)
