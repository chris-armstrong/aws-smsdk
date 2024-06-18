open Http_types

module type S = sig
  type t

  module Response : sig
    type t

    val status : t -> int
    val headers : t -> headers
  end

  module Body : sig
    type t

    val to_string : t -> string
    val drain : t -> unit
  end

  val request :
    method_:Http_types.method_ ->
    uri:Uri.t ->
    ?headers:headers ->
    ?body:input_body ->
    t ->
    (Response.t * Body.t, Http_types.http_failure) result
end
