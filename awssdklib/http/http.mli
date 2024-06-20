type http_failure =
  | NameLookupFailure
      (** DNS resolution failure - an IP address could not be resolved for the specified host **)
  | NoSupportedProtocol  (** The server has no supported HTTP protocol support (HTTP 1.1 or 2.0) *)
  | InvalidUri of Uri.t  (** The specified URI was invalid for a HTTP request *)
  | MalformedResponse of string
  | InvalidResponseBodyLength
  | ProtocolError of string
  | HttpException of exn

val pp_http_failure : Format.formatter -> http_failure -> unit
val equal_http_failure : http_failure -> http_failure -> bool

type headers = (string * string) list
type input_body = [ `None | `String of string | `Form of (string * string list) list ]

val pp_input_body : Format.formatter -> input_body -> unit
val equal_input_body : input_body -> input_body -> bool

type method_ =
  [ `GET | `POST | `CONNECT | `DELETE | `HEAD | `OPTIONS | `Other of string | `PUT | `TRACE ]

val pp_method_ : Format.formatter -> method_ -> unit
val equal_method_ : method_ -> method_ -> bool
val string_of_method : method_ -> string

module type Client_intf = sig
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
    method_:method_ ->
    uri:Uri.t ->
    ?headers:headers ->
    ?body:input_body ->
    t ->
    (Response.t * Body.t, http_failure) result
end

module Client : sig
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
    method_:method_ ->
    uri:Uri.t ->
    ?headers:headers ->
    ?body:input_body ->
    t ->
    (Response.t * Body.t, http_failure) result

  val make :
    sw:Eio.Switch.t ->
    < mono_clock : [> `Clock of Mtime.t ] Eio.Resource.t
    ; net : [> `Network | `Platform of [> `Generic | `Unix ] ] Eio.Resource.t
    ; .. > ->
    t
end
