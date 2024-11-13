open Protocol_intf

module Log =
  (val Logs.src_log
         (Logs.Src.create "awssdklib.http.http_1_1_impl" ~doc:"AwsSdkLib Http implementation")
      : Logs.LOG)

let make_http_1_1_body_reader reader =
  let module Http11Reader = struct
    let schedule_read = Httpun.Body.Reader.schedule_read reader
    let close () = Httpun.Body.Reader.close reader
  end in
  (module Http11Reader : BodyImpl)

let make_http_1_1_response_handler resolver response body_reader =
  Logs.debug (fun m -> m "HTTP 1.1 response started");
  let new_status = Httpun.Status.to_code Httpun.Response.(response.status) in
  let new_headers = Httpun.(Headers.to_list Response.(response.headers)) in
  Eio.Promise.resolve_ok resolver
    (Response.{ status = new_status; headers = new_headers }, make_http_1_1_body_reader body_reader)

let make_http_1_1_error_handler resolver (connection_error : Httpun.Client_connection.error) =
  Eio.Promise.resolve_error resolver connection_error

let make_http_1_1_client ~sw ~scheme ssl_socket =
  let config = Httpun.Config.default in
  let client = Httpun_eio.Client.create_connection ~config ~sw ssl_socket in
  let module Http1_1_Client = struct
    let shutdown () = Httpun_eio.Client.shutdown client

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
      let path = match path with "" -> "/" | _ -> path in
      let body_length = body_string |> Option.value ~default:"" |> String.length |> Int.to_string in
      Logs.debug (fun m -> m "URI: %s %s" (Httpun.Method.to_string method_) path);
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
        Httpun.Request.create ~headers:(Httpun.Headers.of_list headers)
          ~version:(Httpun.Version.of_string "HTTP/1.1")
          method_ path
      in
      let body_writer =
        Httpun_eio.Client.request ~flush_headers_immediately:true client request ~error_handler
          ~response_handler
      in

      body_string |> Option.iter (fun str -> Httpun.Body.Writer.write_string body_writer str);
      Httpun.Body.Writer.close body_writer;
      Log.debug (fun m -> m "Written HTTP body@.");

      match Eio.Promise.await response_promise with
      | Ok (response, body) ->
          Logs.debug (fun m ->
              m "Response headers: %a"
                (Fmt.list (Fmt.pair ~sep:(Fmt.any "=") Fmt.string Fmt.string) ~sep:(Fmt.any ";@;"))
                (Response.headers response));
          Ok (response, body)
      | Error error ->
          let open Http_types in
          let response_error_string =
            match error with
            | `Malformed_response x -> MalformedResponse x
            | `Invalid_response_body_length response -> InvalidResponseBodyLength
            | `Exn e -> HttpException e
          in
          Error response_error_string

    let max_concurrency = 1
  end in
  (module Http1_1_Client : HttpClientImpl)
