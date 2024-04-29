Logs.set_reporter (Logs.format_reporter ());;
Logs.set_level (Some Logs.Debug)

let _ =
  Eio_main.run (fun env ->
      Eio.Switch.run (fun sw ->
          let open Aws_SmSdk_Lib in
          let credentials = Aws.Auth.fromProfile env () in
          Fmt.pr "has_access_key_id has_secret_access_key has_session_token=%b\n"
            (credentials.sessionToken |> Option.is_some);

          let config : Aws.Config.t =
            {
              resolveRegion = (fun () -> "ap-southeast-2");
              resolveAuth = (fun () -> Aws.Auth.fromProfile env ());
            }
          in
          let body = {|{}|} in
          Fmt.pr "before context@.";
          let context = Aws.Context.make ~sw ~config () in
          let service = Aws.Service.{ namespace = "sqs"; endpointPrefix = "sqs"; version = "" } in
          let uri = Aws.Service.makeUri ~context ~service in
          let headers =
            [
              ("X-Amz-Target", "AmazonSQS.ListQueues");
              ("Content-Type", "application/x-amz-json-1.0");
              ("Accept", "application/json");
            ]
          in
          Fmt.pr "before signing@.";
          let headers =
            Aws.Sign.sign_request ~context ~service ~uri ~method_:`POST ~headers ~body
          in
          let body = `String body in

          try
            let response, body =
              Http.request ~method_:`POST ~uri ~headers ~body (Aws.Context.http context) env
            in
            let body = Http.Body.to_string body in
            Fmt.pr "Headers %a@."
              (Fmt.list ~sep:Fmt.comma Fmt.string)
              (response |> Http.Response.headers |> List.map (fun (k, v) -> k ^ ":" ^ v));
            Fmt.pr "Response %d: [%d]%s@." (Http.Response.status response) (body |> String.length)
              body
          with error -> (
            Fmt.pr "Error! %s\n" (Printexc.to_string error);
            try Http.close_all_connections (Aws.Context.http context)
            with error -> Fmt.pr "Error closing all connections: %s@." (Printexc.to_string error))))
