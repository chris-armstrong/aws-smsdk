module Response : sig
  type t

  val status : t -> int
end

module Body : sig
  type t

  val to_string : t -> string
end

type input_body = [ `String of string | `Form of (string * string list) list ]

exception InvalidUri of Uri.t
exception ConnectionError of H2.Client_connection.error

type method_ =
  [ `GET
  | `POST
  | `CONNECT
  | `DELETE
  | `HEAD
  | `OPTIONS
  | `Other of string
  | `PUT
  | `TRACE ]

val string_of_method : method_ -> string

type headers = (string * string) list

(* val body_to_string : body -> string Lwt.t *)
(* val body_of_string : string -> body *)
val request :
  sw:Eio.Switch.t ->
  method_:method_ ->
  uri:Uri.t ->
  ?headers:headers ->
  ?body:input_body ->
  < net : [> [ `Generic | `Unix ] Eio.Net.ty ] Eio.Resource.t ; .. > ->
  Response.t * Body.t
(* val response_status_code : response -> int *)
