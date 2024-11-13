type namespaced_error = { namespace : string; name : string } [@@deriving show, eq]
type aws_service_error = { message : string option; _type : namespaced_error } [@@deriving show, eq]
type t = [ `AWSServiceError of aws_service_error ] [@@deriving show, eq]
