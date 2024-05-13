open Protocol_intf

type t = { reader : (module BodyImpl); resolver : unit Eio.Promise.u }

let drain body =
  Logs.debug (fun m -> m "BodyImpl.drain");
  let module BodyReader = (val body.reader : BodyImpl) in
  BodyReader.close ()

let to_string body =
  Logs.debug (fun m -> m "BodyImpl.to_string");
  let module BodyReader = (val body.reader : BodyImpl) in
  let promise, resolver = Eio.Promise.create () in
  let body_string = ref String.empty in
  let rec read () =
    BodyReader.schedule_read
      ~on_read:(fun s ~off ~len ->
        Logs.debug (fun m -> m "on_read offset=%d len=%d" off len);
        body_string := String.cat !body_string (Bigstringaf.substring s ~off ~len);
        read ())
      ~on_eof:(fun () ->
        Logs.debug (fun m -> m "on_eof len=%d %s" (!body_string |> String.length) !body_string);
        Eio.Promise.resolve resolver !body_string;
        Eio.Promise.resolve body.resolver ())
  in
  read ();
  Eio.Promise.await promise
