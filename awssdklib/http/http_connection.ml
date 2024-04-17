open Import

type connection_info = { host : string; port : int; scheme : string }
type connection = (module Protocol_intf.HttpClientImpl)

let connection_info_to_string { host; port; _ } =
  let hostname = (host |> String.lowercase_ascii) ^ ":" ^ (port |> Int.to_string) in
  hostname

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
    | Some "h2" -> begin Http2_impl.make_http2_client ~sw ~scheme ssl_socket end
    | Some "http/1.1" -> Http1_1_impl.make_http_1_1_client ~sw ~scheme ssl_socket
    | _ -> raise Http_intf.NoSupportedProtocol
  in
  client
