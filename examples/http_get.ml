Logs.set_reporter (Logs.format_reporter ());
Logs.set_level (Some Logs.Debug);

Eio_main.run (fun env ->
    Eio.Switch.run (fun sw ->
        Format.printf "Making request@.";
        let response, body =
          Http.request ~method_:`GET ~uri:(Uri.of_string "https://www.abc.net.au/") ~sw env
        in
        let body = Http.Body.to_string body in
        Format.printf "Retrieve news";
        Eio.Fiber.both
          (fun () ->
            let response, body =
              Http.request ~method_:`GET ~uri:(Uri.of_string "https://www.abc.net.au/news") ~sw env
            in
            let body = Http.Body.to_string body in
            Format.printf "Response 1: %d@." (Http.Response.status response))
          (fun () ->
            let response, body =
              Http.request ~method_:`GET
                ~uri:(Uri.of_string "https://abc.net.au/news/business")
                ~sw env
            in
            let body = Http.Body.to_string body in
            Format.printf "Response 2: %d@." (Http.Response.status response));
        Format.printf "Closing all connections@.";
        Http.close_all_connections ();
        ()))
