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
    connection

  val shutdown : connection -> unit Eio.Promise.t
  val max_concurrency : connection -> int
  val is_valid : connection -> bool
end

module type S = sig
  type client
  type client_info
  type connection
  type t

  val make : sw:Eio.Switch.t -> t
  val client : connection -> client

  val run_in_connection :
    pool:t ->
    info:client_info ->
    < net : [> [ `Generic | `Unix ] Eio.Net.ty ] Eio.Resource.t ; .. > ->
    (connection -> 'a) ->
    'a
end

module Make (Connection : ConnectionType) :
  S with type client_info = Connection.connection_info and type client = Connection.connection =
struct
  type client = Connection.connection
  type client_info = Connection.connection_info
  type connection = { client : client }
  type t = { sw : Eio.Switch.t; connections : connection Eio.Pool.t StringHash.t }

  let make ~sw = { sw; connections = StringHash.create 5 }
  let client connection = connection.client

  let create_pool ~sw ~info env =
    Eio.Pool.create
      ~validate:(fun connection -> Connection.is_valid connection.client)
      ~dispose:(fun connection -> Eio.Promise.await (Connection.shutdown connection.client))
      50
      (fun () -> { client = Connection.connect ~info ~sw env })

  let run_in_connection ~pool ~info env executor =
    let info_id = Connection.connection_info_to_string info in
    let connections =
      StringHash.find_opt pool.connections info_id
      |> Option.value ~default:(create_pool ~sw:pool.sw ~info env)
    in
    StringHash.replace pool.connections info_id connections;
    Eio.Pool.use connections executor
end
