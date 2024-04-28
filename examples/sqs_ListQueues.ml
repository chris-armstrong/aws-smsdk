Logs.set_reporter (Logs.format_reporter ());;
Logs.set_level (Some Logs.Debug)

let _ =
  Eio_main.run (fun env ->
      Eio.Switch.run (fun sw ->
          let open AwsSdkLib in
          let credentials = AwsSdkLib.Aws.Auth.fromProfile env () in
          let config : Aws.Config.t =
            {
              resolveRegion =
                (fun () -> Sys.getenv_opt "AWS_REGION" |> Option.value ~default:"ap-southeast-2");
              resolveAuth = (fun () -> Aws.Auth.fromProfile env ());
            }
          in
          let input = `Assoc [] in
          let context = Aws.Context.make ~sw ~config () in
          let service = Aws.Service.{ namespace = "sqs"; endpointPrefix = "sqs"; version = "" } in
          let ( let* ) = Result.bind in
          let ( and* ) = Result.bind in

          let res =
            begin
              let* response, body =
                AwsJson.make_request ~shapeName:"AmazonSQS.ListQueues" ~service ~context ~input env
              in
              Fmt.pr "[%d]: %s@."
                (response |> Http.Response.status)
                (body |> Yojson.Basic.to_string ~std:true);
              Ok ()
            end
          in
          match res with
          | Ok res -> ()
          | Error error -> Fmt.pr "Error: %s@." (Printexc.to_string error)))
