open Http_intf
open Protocol_intf

module Log =
  (val Logs.src_log
         (Logs.Src.create "awssdklib.http.http_1_1_impl" ~doc:"AwsSdkLib Http implementation")
      : Logs.LOG)

let make_http_1_1_body_reader reader =
  let module Http11Reader = struct
    let schedule_read = Httpaf.Body.Reader.schedule_read reader
    let close () = Httpaf.Body.Reader.close reader
  end in
  (module Http11Reader : BodyImpl)

let make_http_1_1_response_handler resolver response body_reader =
  Logs.debug (fun m -> m "HTTP 1.1 response started");
  let new_status = Httpaf.Status.to_code Httpaf.Response.(response.status) in
  let new_headers = Httpaf.(Headers.to_list Response.(response.headers)) in
  Eio.Promise.resolve_ok resolver
    (Response.{ status = new_status; headers = new_headers }, make_http_1_1_body_reader body_reader)

let make_http_1_1_error_handler resolver connection_error = ()

let make_http_1_1_client ~sw ~scheme ssl_socket =
  let config = Httpaf.Config.default in
  let client = Httpaf_eio.Client.create_connection ~config ~sw ssl_socket in
  let module Http1_1_Client = struct
    let shutdown () = Httpaf_eio.Client.shutdown client

    let request ~body ~method_ ~headers host path =
      let response_promise, response_resolver = Eio.Promise.create () in
      let response_handler = make_http_1_1_response_handler response_resolver in
      let error_handler = make_http_1_1_error_handler response_resolver in
      let body_string =
        match body with
        | `None -> None
        | `String body -> Some body
        | `Form assoc_list -> Some (Uri.encoded_of_query assoc_list)
      in
      let body_length = body_string |> Option.value ~default:"" |> String.length |> Int.to_string in
      Logs.debug (fun m ->
          m "Writing body [%s]: %s@." body_length (Option.value ~default:"" body_string));
      let headers =
        List.concat
          [
            [
              ("connection", "keep-alive");
              ("user-agent", "ocaml/1.0.0-experimental");
              ("Content-Length", body_length);
            ];
            headers;
          ]
      in
      let request =
        Httpaf.Request.create ~headers:(Httpaf.Headers.of_list headers)
          ~version:(Httpaf.Version.of_string "HTTP/1.1")
          method_ path
      in
      let body_writer =
        Httpaf_eio.Client.request ~flush_headers_immediately:true client request ~error_handler
          ~response_handler
      in

      body_string |> Option.iter (fun str -> Httpaf.Body.Writer.write_string body_writer str);
      Httpaf.Body.Writer.close body_writer;
      Log.debug (fun m -> m "Written HTTP body@.");

      match Eio.Promise.await response_promise with
      | Ok (response, body) -> (response, body)
      | Error exn -> raise (ConnectionError exn)

    let max_concurrency = 1
  end in
  (module Http1_1_Client : HttpClientImpl)
