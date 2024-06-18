Logs.set_reporter (Logs.format_reporter ());;
Logs.set_level (Some Logs.Debug)

let _ =
  Eio_main.run (fun env ->
      Eio.Switch.run (fun sw ->
          let open Aws_SmSdk_Lib in
          let credentials = Auth.fromProfile env () in
          Fmt.pr "has_access_key_id has_secret_access_key has_session_token=%b\n"
            (credentials.session_token |> Option.is_some);

          let config : Config.t =
            {
              resolveRegion = (fun () -> "ap-southeast-2");
              resolveAuth = (fun () -> Auth.fromProfile env ());
            }
          in
          let body = {|{}|} in
          Fmt.pr "before context@.";
          let context = Context.make ~sw ~config env in
          let service = Service.{ namespace = "sqs"; endpointPrefix = "sqs"; version = "" } in
          let uri = Service.makeUri ~config ~service in
          let headers =
            [
              ("X-Amz-Target", "AmazonSQS.ListQueues");
              ("Content-Type", "application/x-amz-json-1.0");
              ("Accept", "application/json");
            ]
          in
          Fmt.pr "before signing@.";
          let headers = Sign.sign_request_v4 ~config ~service ~uri ~method_:`POST ~headers ~body in
          let body = `String body in

          let ( let* ) res map = Result.map map res in
          let module Http = Http.Client in
          match
            let* response, body = Http.request ~method_:`POST ~uri ~headers ~body context.http in
            let body = Http.Body.to_string body in
            Fmt.pr "Headers %a@."
              (Fmt.list ~sep:Fmt.comma Fmt.string)
              (response |> Http.Response.headers |> List.map (fun (k, v) -> k ^ ":" ^ v));

            Fmt.pr "Response %d: [%d]%s@." (Http.Response.status response) (body |> String.length)
              body
          with
          | Ok body -> ()
          | Error error -> Fmt.pr "Error! %a\n" Aws_SmSdk_Lib.Http.pp_http_failure error))
