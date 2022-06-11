open Base;
open Cohttp;
open Cohttp_lwt_unix;

let get_sync = (url) => Lwt_main.run({
  open Lwt.Syntax;
  Stdio.print_endline("Sending request");

  let* (response, body) = Client.get(Uri.of_string(url));
  if ((response |> Response.status |> Code.code_of_status) == 200) {
    let* body = Cohttp_lwt.Body.to_string(body);
    Lwt.return(Ok((body)));
  } else {
    let message = Code.string_of_status(response.status);
    Lwt.return(Error(message))
  }
});

// get_sync("https://www.abc.net.au/")|>fun
//   | Ok(body) => Stdio.printf("result body: %s\n", body)
//   | Error(error) => Stdio.print_endline((error));