open Http_intf
open Protocol_intf
open Import

let make_http2_body_reader reader =
  let module Http2Reader = struct
    let schedule_read = H2.Body.Reader.schedule_read reader
    let close () = H2.Body.Reader.close reader
  end in
  (module Http2Reader : BodyImpl)

let make_http2_error_handler error_promise err =
  let error =
    match err with
    | `Exn exn -> HttpException exn
    | `Invalid_response_body_length response -> InvalidResponseBodyLength
    | `Malformed_response s -> MalformedResponse s
    | `Protocol_error (err, s) -> ProtocolError (Fmt.str "%a %S" H2.Error_code.pp_hum err s)
  in
  Eio.Promise.resolve_error error_promise error

let make_http2_response_handler response_promise response body_reader =
  Logs.debug (fun m -> m "Response: %a@." H2.Response.pp_hum response);
  let status_code = H2.Status.to_code H2.Response.(response.status) in
  let new_headers = H2.Headers.to_list H2.Response.(response.headers) in
  Eio.Promise.resolve_ok response_promise
    (Response.{ status = status_code; headers = new_headers }, make_http2_body_reader body_reader)

let make_http2_client ~sw ~scheme ssl_socket =
  let config = H2.Config.default in
  let error_promise, error_resolver = Eio.Promise.create () in
  let error_handler = make_http2_error_handler error_resolver in
  let client = H2_eio.Client.create_connection ~config ~sw ~error_handler ssl_socket in
  let module Http2Client = struct
    let shutdown () = H2_eio.Client.shutdown client

    let request ~body ~method_ ~headers host path =
      let response_promise, response_resolver = Eio.Promise.create () in
      let response_handler = make_http2_response_handler response_resolver in
      let error_handler = make_http2_error_handler response_resolver in
      let headers =
        List.concat
          [ [ (":authority", host); ("user-agent", "ocaml/1.0.0-experimental") ]; headers ]
      in
      Format.printf "Request: %s %s@." (H2.Method.to_string method_) path;
      let request = H2.Request.create ~headers:(H2.Headers.of_list headers) ~scheme method_ path in
      let body_string =
        match body with
        | `String body ->
            Log.debug (fun m -> m "Writing string body %d bytes@." (body |> String.length));
            Some body
        | `Form body_values ->
            Log.debug (fun m -> m "Writing form body@.");
            let body_string = Uri.encoded_of_query ~scheme:"utf-8" body_values in
            Some body_string
        | `None ->
            Log.debug (fun m -> m "Write empty request body@.");
            None
      in
      let body_writer =
        H2_eio.Client.request client request ~error_handler ~response_handler
          ~flush_headers_immediately:true
      in
      Option.iter
        (fun body_string -> H2.Body.Writer.write_string body_writer body_string)
        body_string;
      H2.Body.Writer.close body_writer;
      Log.debug (fun m -> m "Written request body");
      match Eio.Promise.await response_promise with
      | Ok res -> Ok res
      | Error connection_error -> Error connection_error

    let max_concurrency = 10
  end in
  (module Http2Client : HttpClientImpl)
