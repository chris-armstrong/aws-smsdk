open Import

module Log =
  (val Logs.src_log (Logs.Src.create "awssdklib.http.pool" ~doc:"AwsSdkLib Http implementation")
      : Logs.LOG)

module type ConnectionType = sig
  type connection_info
  type connection

  val connection_info_to_string : connection_info -> string

  val connect :
    info:connection_info ->
    sw:Eio.Switch.t ->
    < net : [> [ `Generic | `Unix ] Eio.Net.ty ] Eio.Resource.t ; .. > ->
    (connection, Http_intf.http_failure) result

  val shutdown : connection -> unit Eio.Promise.t
  val max_concurrency : connection -> int
end

module type S = sig
  type client
  type client_info
  type connection
  type t

  val make : sw:Eio.Switch.t -> t
  val return_connection : connection -> unit
  val client : connection -> client

  val get_connection :
    pool:t ->
    info:client_info ->
    < net : [> [ `Generic | `Unix ] Eio.Net.ty ] Eio.Resource.t ; .. > ->
    (connection, Http_intf.http_failure) result

  val close_all_connections : pool:t -> unit
end

module Make (Connection : ConnectionType) :
  S with type client_info = Connection.connection_info and type client = Connection.connection =
struct
  type client = Connection.connection
  type client_info = Connection.connection_info

  (* type state = ConnectionAvailable | ConnectionInRequest *)
  type connection = { client : client; count : int ref }
  type t = { sw : Eio.Switch.t; connections : connection list StringHash.t }

  let make ~sw = { sw; connections = StringHash.create 5 }

  let return_connection connection =
    Logs.debug (fun m -> m "Returning connection at %d" !(connection.count));
    connection.count := !(connection.count) - 1

  let client connection = connection.client

  let get_connection ~pool ~info env =
    let info_id = Connection.connection_info_to_string info in
    let connections = StringHash.find_opt pool.connections info_id |> Option.value ~default:[] in
    let available_connection =
      connections
      |> List.find_opt (fun connection ->
             !(connection.count) < Connection.max_concurrency connection.client)
    in
    match available_connection with
    | Some connection ->
        Logs.debug (fun m ->
            m "Found available connection with ID %s and ref count %d" info_id !(connection.count));
        connection.count := !(connection.count) + 1;
        Ok connection
    | None ->
        let ( let* ) = Result.bind in
        Logs.debug (fun m -> m "No available connection, establishing new one with ID %s" info_id);
        let* client = Connection.connect ~info ~sw:pool.sw env in
        let connection = { client; count = ref 1 } in
        let connections = connection :: connections in
        StringHash.replace pool.connections info_id connections;
        Ok connection

  let close_all_connections ~pool =
    pool.connections |> StringHash.to_seq_values
    |> Seq.iter (fun connections ->
           connections |> List.to_seq
           |> Seq.iter (fun connection ->
                  Log.debug (fun m -> m "Closing connection@.");
                  Eio.Promise.await (Connection.shutdown connection.client)))
end
