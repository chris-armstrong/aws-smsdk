module type BodyImpl = sig
  val schedule_read :
    on_eof:(unit -> unit) -> on_read:(Bigstringaf.t -> off:int -> len:int -> unit) -> unit

  val close : unit -> unit
end

module type HttpClientImpl = sig
  val request :
    body:Http_types.input_body ->
    method_:Http_types.method_ ->
    headers:Http_types.headers ->
    string ->
    string ->
    (Response.t * (module BodyImpl), Http_types.http_failure) result

  val shutdown : unit -> unit Eio.Promise.t
end
