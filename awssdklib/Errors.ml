type namespaced_error = string * string
type 'a handler = Json.DeserializeHelpers.t -> string list -> string * string -> 'a
type t = { message : string option; _type : string * string }

let default_deserializer tree path _type =
  let open Json.DeserializeHelpers in
  let obj = assoc_of_yojson tree path in
  let message = option_of_yojson (value_for_key string_of_yojson "message") obj path in
  { message; _type }

(* module Common = struct *)
(*   let handler (handler : 'a handler) (tree : Json.DeserializeHelpers.t) (path : string list) *)
(*       (_type : string * string) = *)
(*     match _type with *)
(*     | _, "AccessDeniedException" -> `AccessDeniedException (default_deserializer tree path) *)
(*     | _, "IncompleteSignature" -> `IncompleteSignature (default_deserializer tree path) *)
(*     | _, "InternalFailure" -> `InternalFailure (default_deserializer tree path) *)
(*     | _, "InvalidAction" -> `InvalidAction (default_deserializer tree path) *)
(*     | _, "InvalidClientTokenId" -> `InvalidClientTokenId (default_deserializer tree path) *)
(*     | _, "InvalidParameterCombination" -> *)
(*         `InvalidParameterCombination (default_deserializer tree path) *)
(*     | _, "InvalidParameterValue" -> `InvalidParameterValue (default_deserializer tree path) *)
(*     | _, "InvalidParameterValueException" -> *)
(*         `InvalidParameterValueException (default_deserializer tree path) *)
(*     | _, "InvalidQueryParameter" -> `InvalidQueryParameter (default_deserializer tree path) *)
(*     | _, "MalformedQueryString" -> `MalformedQueryString (default_deserializer tree path) *)
(*     | _, "MissingAction" -> `MissingAction (default_deserializer tree path) *)
(*     | _, "MissingAuthenticationToken" -> *)
(*         `MissingAuthenticationToken (default_deserializer tree path) *)
(*     | _, "MissingParameter" -> `MissingParameter (default_deserializer tree path) *)
(*     | _, "OptInRequired" -> `OptInRequired (default_deserializer tree path) *)
(*     | _, "RequestExpired" -> `RequestExpired (default_deserializer tree path) *)
(*     | _, "ServiceUnavailable" -> `ServiceUnavailable (default_deserializer tree path) *)
(*     | _, "ThrottlingException" -> `ThrottlingException (default_deserializer tree path) *)
(*     | _, "ValidationException" -> `ValidationException (default_deserializer tree path) *)
(*     | _type -> handler tree path _type *)
(* end *)

let default_handler (tree : Json.DeserializeHelpers.t) (path : string list)
    (_type : string * string) : [> `AWSServiceError of t ] =
  `AWSServiceError (default_deserializer tree path _type)
