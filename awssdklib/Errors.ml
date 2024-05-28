type namespaced_error = string * string
type 'a handler = Json.DeserializeHelpers.t -> string list -> string * string -> 'a
type aws_service_error = { message : string option; _type : string * string }
type t = [ `AWSServiceError of aws_service_error ]

let default_deserializer tree path _type =
  let open Json.DeserializeHelpers in
  let obj = assoc_of_yojson tree path in
  let message = option_of_yojson (value_for_key string_of_yojson "message") obj path in
  { message; _type }

let default_handler (tree : Json.DeserializeHelpers.t) (path : string list)
    (_type : string * string) : [> t ] =
  `AWSServiceError (default_deserializer tree path _type)
