open AwsSdkLib;;

Logs.set_reporter (Logs.format_reporter ());
Logs.set_level (Some Logs.Debug);

Eio_main.run (fun env ->
    Eio.Switch.run (fun sw ->
        Format.printf "Making request@.";
        let _ =
          match
            Http.request ~method_:`GET
              ~uri:(Uri.of_string "https://www.abc.net.au/")
              ~sw env
          with
          | Ok (response, body) ->
              Format.printf "Response: %d@." (Http.Response.status response);
              let body = Http.Body.to_string body in
              Fmt.pr "Body:@.%s@." body
          | Error exn -> Format.printf "Error!@."
        in
        Format.printf "Retrieve news";
        let _ =
          match
            Http.request ~method_:`GET
              ~uri:(Uri.of_string "https://www.abc.net.au/news")
              ~sw env
          with
          | Ok (response, body) ->
              Format.printf "Response: %d@." (Http.Response.status response);
              let body = Http.Body.to_string body in
              ()
              (* Fmt.pr "Body:@.%s@." body *)
          | Error exn -> Format.printf "Error!@."
        in
        ()))
