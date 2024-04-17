open Import

module type ConnectionType = sig
  type connection_info
  type connection

  val connection_info_to_string : connection_info -> string

  val connect :
    info:connection_info ->
    sw:Eio.Switch.t ->
    < net : [> [ `Generic | `Unix ] Eio.Net.ty ] Eio.Resource.t ; .. > ->
    connection
end

module Make (Connection : ConnectionType) = struct
  type state = ConnectionAvailable | ConnectionInRequest
  type 'client_type connection = { client : 'client_type; state : state ref }

  let host_connections : 'client_type connection list StringHash.t = StringHash.create 5

  let get_connection ~info ~sw env =
    let info_id = Connection.connection_info_to_string info in
    let connections = StringHash.find_opt host_connections info_id |> Option.value ~default:[] in
    let available_connection =
      connections
      |> List.find_opt (fun connection ->
             match connection.state.contents with ConnectionAvailable -> true | _ -> false)
    in
    match available_connection with
    | Some connection ->
        Logs.debug (fun m -> m "Existing connection found for hostname %s" info_id);
        connection
    | None ->
        Logs.debug (fun m -> m "Creating new connection to hostname %s" info_id);
        let client = Connection.connect ~info ~sw env in
        let connection = { client; state = ref ConnectionAvailable } in
        let connections = connection :: connections in
        StringHash.replace host_connections info_id connections;
        connection
end

(* module ConnectionPool : *)

type connectionState = ConnectionAvailable | ConnectionInRequest
type 'client_type connection = { client : 'client_type; state : connectionState ref }

let host_connections : 'client_type connection list StringHash.t = StringHash.create 5

let close_all_connections () =
  host_connections |> StringHash.to_seq_values
  |> Seq.iter (fun connections ->
         connections |> List.to_seq
         |> Seq.iter (fun connection ->
                let module Client = (val connection.client : Protocol_intf.HttpClientImpl) in
                Log.debug (fun m -> m "Closing connection@.");
                Client.shutdown () |> Eio.Promise.await))

let create_or_retrieve_connection ~host ~port ~scheme ~sw network =
  let hostname = (host |> String.lowercase_ascii) ^ ":" ^ (port |> Int.to_string) in

  let connections = StringHash.find_opt host_connections hostname |> Option.value ~default:[] in
  let available_connection =
    connections
    |> List.find_opt (fun connection ->
           match connection.state.contents with ConnectionAvailable -> true | _ -> false)
  in
  match available_connection with
  | Some connection ->
      Logs.debug (fun m -> m "Existing connection found for hostname %s" hostname);
      connection
  | None ->
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
      let connection = { client; state = ref ConnectionAvailable } in
      let connections = connection :: connections in
      StringHash.replace host_connections hostname connections;
      connection
