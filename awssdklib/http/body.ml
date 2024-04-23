open Protocol_intf

type t = { reader : (module BodyImpl); resolver : unit Eio.Promise.u }

let drain body =
  let module BodyReader = (val body.reader : BodyImpl) in
  let promise, resolver = Eio.Promise.create () in
  let rec read () =
    BodyReader.schedule_read
      ~on_read:(fun _ ~off:_ ~len:_ ->
        read ();
        Eio.Fiber.yield ())
      ~on_eof:(fun () ->
        Eio.Promise.resolve resolver ();
        Eio.Promise.resolve body.resolver ())
  in
  read ();
  Eio.Promise.await promise

let to_string body =
  let module BodyReader = (val body.reader : BodyImpl) in
  let promise, resolver = Eio.Promise.create () in
  let body_string = ref String.empty in
  let rec read () =
    BodyReader.schedule_read
      ~on_read:(fun s ~off ~len ->
        Fmt.pr "Read body string %d@." len;
        body_string := String.cat !body_string (Bigstringaf.to_string s);
        read ())
      ~on_eof:(fun () ->
        Fmt.pr "EOF@.";
        Eio.Promise.resolve resolver !body_string;
        Eio.Promise.resolve body.resolver ())
  in
  read ();
  Eio.Promise.await promise
