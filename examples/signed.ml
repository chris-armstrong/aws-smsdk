Logs.set_reporter (Logs.format_reporter ());;
Logs.set_level (Some Logs.Debug)

let _ =
  Eio_main.run (fun env ->
      Eio.Switch.run (fun sw ->
          let open AwsSdkLib in
          let credentials = AwsSdkLib.Aws.Auth.fromProfile env () in
          Fmt.pr
            "has_access_key_id has_secret_access_key has_session_token=%b\n"
            (credentials.sessionToken |> Option.is_some);

          let config : Aws.config =
            {
              resolveRegion = (fun () -> "ap-southeast-2");
              resolveAuth = (fun () -> Aws.Auth.fromProfile env ());
            }
          in
          let body = {| {} |} in
          let descriptor =
            Aws.Service.
              { namespace = "sqs"; endpointPrefix = "sqs"; version = "" }
          in
          let uri = Aws.Service.makeUri config descriptor in
          let headers =
            [
              ("X-Amz-Target", "AmazonSQS.ListQueues");
              ("Content-Type", "application/x-amz-json-1.0");
              ("Content-Length", body |> String.length |> Int.to_string);
            ]
          in
          let headers =
            AwsSdkLib.Aws.Sign.sign_request ~auth:credentials
              ~region:(config.resolveRegion ()) ~service:descriptor ~uri
              ~method_:`POST ~headers ~body
          in
          let body = `String body in

          try
            let response, body =
              Http.request ~sw ~method_:`POST ~uri ~headers ~body env
            in
            Fmt.pr "Response %d: %s\n"
              (Http.Response.status response)
              (Http.Body.to_string body)
          with error -> Fmt.pr "Error! %s\n" (Printexc.to_string error)))
