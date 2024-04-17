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

[@@@warning "-37"]

let string_of_method = H2.Method.to_string

let make_connection_error_handler error_promise err =
  let _ =
    match err with `Exn exn -> Log.warn (fun m -> m "Exception: %s" (Printexc.to_string exn))
  in
  Eio.Promise.resolve error_promise (Error err)

module HttpConnectionPool = Connection_pool.Make (Http_connection)

let close_all_connections () = ()

let request ~sw ~method_ ~uri ?(headers : headers option) ?(body : input_body option) env =
  let network = Eio.Stdenv.net env in
  let host = Uri.host uri |> Option.map String.lowercase_ascii in
  let port = Uri.port uri |> Option.value ~default:443 in
  let path = Uri.path uri in
  let path = if String.length path = 0 then "/" else path in
  let scheme = Uri.scheme uri |> Option.value ~default:"https" in
  let headers = headers |> Option.value ~default:[] in
  let body = body |> Option.value ~default:`None in
  let body_reader_promise, body_reader_resolver =
    Eio.Promise.create ~label:"HTTP Response Body Read" ()
  in
  let response_promise, response_resolver = Eio.Promise.create ~label:"SSL Connection" () in
  let error_handler = make_connection_error_handler response_resolver in
  match host with
  | Some host ->
      let info = Http_connection.{ host; port; scheme } in
      let connection = HttpConnectionPool.get_connection ~info ~sw env in
      connection.state := ConnectionInRequest;
      let module ProtocolImpl = (val connection.client : HttpClientImpl) in
      let response, body_reader = ProtocolImpl.request ~body ~method_ ~headers host path in
      let body = Body.{ reader = body_reader; resolver = body_reader_resolver } in
      (* Return connection to the pool once the body is read *)
      Eio.Fiber.fork ~sw (fun () ->
          Eio.Promise.await body_reader_promise;
          Logs.debug (fun m -> m "Response body consumed");
          connection.state := ConnectionAvailable);
      (response, body)
  | _ -> raise (InvalidUri uri)
