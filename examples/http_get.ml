open Aws_SmSdk_Lib;;

Logs.set_reporter (Logs.format_reporter ());
Logs.set_level (Some Logs.Debug);

Eio_main.run (fun env ->
    Eio.Switch.run (fun sw ->
        let ( let@ ) res map = Result.iter map res in
        let http = Http.make ~sw env in
        Format.printf "Making request@.";
        let@ response, body =
          Http.request ~method_:`GET ~uri:(Uri.of_string "https://www.abc.net.au/") http
        in

        let body = Http.Body.drain body in
        Eio.Fiber.yield ();
        Format.printf "Retrieve news@.";
        Eio.Fiber.both
          (fun () ->
            match
              Http.request ~method_:`GET ~uri:(Uri.of_string "https://www.abc.net.au/news") http
            with
            | Ok (response, body) ->
                let body = Http.Body.to_string body in
                Format.printf "Response 1: %d@." (Http.Response.status response)
            | Error error -> Format.printf "")
          (fun () ->
            match
              Http.request ~method_:`GET
                ~uri:(Uri.of_string "https://www.abc.net.au/news/business")
                http
            with
            | Ok (response, body) ->
                let body = Http.Body.to_string body in
                Format.printf "Response 2: %d@." (Http.Response.status response)
            | Error err -> Format.printf "")))
