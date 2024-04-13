open Protocol_intf

type t = { body_reader : (module BodyImpl) }

let to_string body =
  let module BodyReader = (val body.body_reader : BodyImpl) in
  let promise, resolver = Eio.Promise.create () in
  let body_string = ref String.empty in
  let rec read () =
    BodyReader.schedule_read
      ~on_read:(fun s ~off ~len ->
        body_string := String.cat !body_string (Bigstringaf.to_string s);
        read ())
      ~on_eof:(fun () -> Eio.Promise.resolve resolver !body_string)
  in
  read ();
  Eio.Promise.await promise
