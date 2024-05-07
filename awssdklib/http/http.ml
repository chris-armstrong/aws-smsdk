module Log =
  (val Logs.src_log (Logs.Src.create "awssdklib.http" ~doc:"AwsSdkLib Http implementation")
      : Logs.LOG)

open Import
module Response = Response
module Body = Body

(* include Http_intf *)
type input_body = Http_intf.input_body
type headers = Http_intf.headers
type method_ = Http_intf.method_

type http_failure = Http_intf.http_failure =
  | NoSupportedProtocol  (** The server has no supported HTTP protocol support (HTTP 1.1 or 2.0) *)
  | InvalidUri of Uri.t  (** The specified URI was invalid for a HTTP request *)
  | ConnectionError of string
  | MalformedResponse of string
  | InvalidResponseBodyLength
  | ProtocolError of string
  | HttpException of exn

let pp_http_failure = Http_intf.pp_http_failure
let string_of_method = H2.Method.to_string

let make_connection_error_handler error_promise err =
  let _ =
    match err with `Exn exn -> Log.warn (fun m -> m "Exception: %s" (Printexc.to_string exn))
  in
  Eio.Promise.resolve error_promise (Error err)

module HttpConnectionPool = Connection_pool.Make (Http_connection)

type t = {
  sw : Eio.Switch.t;
  pool : HttpConnectionPool.t;
  env : < net : [ `Generic | `Unix ] Eio.Net.ty Eio.Resource.t >;
}

let make ~sw env =
  let env = (env :> < net : [> `Generic | `Unix ] Eio.Net.ty Eio.Resource.t >) in
  { pool = HttpConnectionPool.make ~sw; sw; env }

let close_all_connections http = HttpConnectionPool.close_all_connections ~pool:http.pool

let request ~method_ ~uri ?(headers : headers option) ?(body : input_body option) http =
  let { pool; sw; env } = http in
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
      let info = Http_connection.{ host; port; scheme } in
      let ( let* ) res map = Result.bind res map in
      let* connection = HttpConnectionPool.get_connection ~info ~pool env in
      Http_connection.request ~sw
        ~connection:(HttpConnectionPool.client connection)
        ~method_ ~headers ~body
        ~on_ready:(fun () -> HttpConnectionPool.return_connection connection)
        host path
  | _ -> Error (InvalidUri uri)
