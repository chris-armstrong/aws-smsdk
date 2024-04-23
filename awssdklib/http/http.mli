type method_ =
  [ `GET | `POST | `CONNECT | `DELETE | `HEAD | `OPTIONS | `Other of string | `PUT | `TRACE ]
(** HTTP request method *)

val string_of_method : method_ -> string
(** string value of a HTTP request method *)

type headers = (string * string) list
(** a list of headers as an associative list *)

(** A response to a HTTP request uses this module *)
module Response : sig
  type t
  (** HTTP response type. Use the associated methods in this module to retrieve values *)

  val status : t -> int
  (** The status code of the HTTP response as an integer *)

  val headers : t -> headers
  (** The headers associated with the HTTP response *)
end

(** The response body of a HTTP request *)
module Body : sig
  type t

  val drain : t -> unit
  val to_string : t -> string
end

type input_body = [ `None | `String of string | `Form of (string * string list) list ]
(** The input body to a HTTP request *)

exception InvalidUri of Uri.t
(** The specified URI was invalid for a HTTP request *)

exception ConnectionError of H2.Client_connection.error
(** There was a connection error when making a HTTP request *)

exception NoSupportedProtocol
(** The server has no supported HTTP protocol support (HTTP 1.1 or 2.0) *)

type t
(** Instance of a HTTP client connection pool. Create one per switch (stores the switch context) *)

val make : sw:Eio.Switch.t -> t

val request :
  method_:method_ ->
  uri:Uri.t ->
  ?headers:headers ->
  ?body:input_body ->
  t ->
  < net : [> [ `Generic | `Unix ] Eio.Net.ty ] Eio.Resource.t ; .. > ->
  Response.t * Body.t
(** Make a HTTP request, establishing a connection to the host if one doesn't already exist.

    Connections are reused where possible and kept open indefinitely. Use close_all_connections to
    close any outstanding HTTP connections. *)

val close_all_connections : t -> unit
