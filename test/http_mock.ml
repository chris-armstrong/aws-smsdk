open Aws_SmSdk_Lib

module type HttpMock_intf = sig
  open Http
  include Http.Client_intf

  type request = {
    uri : Uri.t;
    headers : (string * string) list;
    body : input_body option;
    method_ : Http.method_;
  }

  val make : unit -> t
  val mock_response : ?headers:headers -> ?status:int -> body:string -> unit -> unit
  val last_request : unit -> request
end

let create_http_mock () =
  let module HttpMock = struct
    type t = unit
    type input_body = Aws_SmSdk_Lib.Http.input_body

    let make () = ()

    module Response = struct
      type t = { status_ : int; headers_ : (string * string) list }

      let status x = x.status_
      let headers x = x.headers_
    end

    module Body = struct
      type t = string

      let to_string x = x
      let drain _ = ()
    end

    type request = {
      uri : Uri.t;
      headers : (string * string) list;
      body : input_body option;
      method_ : Http.method_;
    }
    (** A saved request from calling {!request} against the mock *)

    let requests = Stack.create ()
    let responses = Queue.create ()

    let mock_response ?(headers = []) ?(status = 200) ~body () =
      let response : Response.t = { headers_ = headers; status_ = status } in
      let body = body in
      Queue.push (Ok (response, body)) responses

    let mock_error error = Queue.push (Error error)

    let request ~method_ ~uri ?headers ?body http =
      Stack.push { body; headers = Option.value headers ~default:[]; uri; method_ } requests;
      Queue.take responses

    let last_request () = Stack.pop requests
  end in
  (module HttpMock : HttpMock_intf)
