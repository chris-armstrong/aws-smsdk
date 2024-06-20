open Import

module Log =
  (val Logs.src_log (Logs.Src.create "awssdklib.http.http_eio" ~doc:"AwsSdkLib HTTP EIO")
      : Logs.LOG)

module type S = sig
  include Http_client_intf.S

  val make :
    sw:Eio.Switch.t ->
    < mono_clock : [> `Clock of Mtime.t ] Eio.Resource.t
    ; net : [> `Network | `Platform of [> `Generic | `Unix ] ] Eio.Resource.t
    ; .. > ->
    t
end

module Make (Connection : Http_eio_connection.S) : S = struct
  module Connection_pool = Connection_pool.Make (Connection)
  module Response = Response
  module Body = Body

  type input_body = Http_types.input_body
  type headers = Http_types.headers

  type http_failure = Http_types.http_failure =
    | NameLookupFailure
        (** DNS resolution failure - an IP address could not be resolved for the specified host **)
    | NoSupportedProtocol
        (** The server has no supported HTTP protocol support (HTTP 1.1 or 2.0) *)
    | InvalidUri of Uri.t  (** The specified URI was invalid for a HTTP request *)
    | MalformedResponse of string
    | InvalidResponseBodyLength
    | ProtocolError of string
    | HttpException of exn

  let make_connection_error_handler error_promise err =
    let _ =
      match err with `Exn exn -> Log.warn (fun m -> m "Exception: %s" (Printexc.to_string exn))
    in
    Eio.Promise.resolve error_promise (Error err)

  type env_type =
    < net : [ `Generic | `Unix ] Eio.Net.ty Eio.Resource.t
    ; mono_clock : [ `Clock of Mtime.t ] Eio.Resource.t >

  type t = { sw : Eio.Switch.t; pool : Connection_pool.t; env : env_type }

  let make ~sw env =
    let env = (env :> env_type) in
    { pool = Connection_pool.make ~sw; sw; env }

  let request ~method_ ~uri ?(headers : headers option) ?(body : input_body option) http =
    let { pool; sw; env } = http in
    let network = Eio.Stdenv.net env in
    let mono_clock = Eio.Stdenv.mono_clock env in
    let headers = headers |> Option.value ~default:[] in
    let body = body |> Option.value ~default:`None in

    let response_promise, response_resolver = Eio.Promise.create ~label:"HTTP Response" () in
    let host, path =
      ( Uri.host uri |> Option.value_exn ~exn:(Connection.ConnectionFailure (InvalidUri uri)),
        Uri.path uri )
    in
    let info = Connection.make_connection_info uri in
    let ( let* ) res map = Result.bind res map in
    Eio.Fiber.fork ~sw (fun () ->
        try
          Connection_pool.run_in_connection ~pool ~info env (fun connection ->
              let ready_promise, ready_resolver =
                Eio.Promise.create ~label:"Connection finished" ()
              in
              let result =
                Connection.request ~sw
                  ~connection:(Connection_pool.client connection)
                  ~method_ ~headers ~body
                  ~on_ready:(fun () -> Eio.Promise.resolve ready_resolver ())
                  (Connection.connection_info_host info)
                  path
              in
              Eio.Promise.resolve response_resolver result;
              Eio.Promise.await ready_promise)
        with Connection.ConnectionFailure http_failure ->
          Eio.Promise.resolve_error response_resolver http_failure);
    Eio.Promise.await response_promise
end
