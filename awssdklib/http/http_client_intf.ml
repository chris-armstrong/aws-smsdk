module type S = sig
  type t

  module Response = Response
  module Body = Body

  type input_body = Http_types.input_body
  type headers = Http_types.headers

  val request :
    method_:Http_types.method_ ->
    uri:Uri.t ->
    ?headers:headers ->
    ?body:input_body ->
    t ->
    (Response.t * Body.t, Http_types.http_failure) result
end
