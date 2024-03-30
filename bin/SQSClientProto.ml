open Base
open Cohttp
open Cohttp_lwt_unix
let get_sync url =
  Lwt_main.run
    (let open Lwt.Syntax in
       Stdio.print_endline "Sending request";
       (let* (response, body) = Client.get (Uri.of_string url)
         in
        if ((response |> Response.status) |> Code.code_of_status) = 200
        then
          let* body = Cohttp_lwt.Body.to_string body
           in Lwt.return ((Ok (body))[@explicit_arity ])
        else
          (let message = Code.string_of_status response.status in
           Lwt.return ((Error (message))[@explicit_arity ]))))