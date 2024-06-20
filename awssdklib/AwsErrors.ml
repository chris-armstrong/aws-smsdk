type namespaced_error = string * string [@@deriving show, eq]
type aws_service_error = { message : string option; _type : string * string } [@@deriving show, eq]
type t = [ `AWSServiceError of aws_service_error ] [@@deriving show, eq]
