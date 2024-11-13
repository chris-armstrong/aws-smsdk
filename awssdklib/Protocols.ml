(** This module provides the underlying Smithy protocol implementations that are used by the AWS
    Service SDKs *)

type http_error = [ `HttpError of Http.http_failure ]
type aws_service_error = [ `AWSServiceError of AwsErrors.aws_service_error ]

module AwsJson = AwsJson.Make (Http.Client)
(** AwsJson_1.0 and AwsJson_1.1 protocol support (over eio-based httpun client) *)

module AwsQuery = AwsQuery.Make (Http.Client)
(** AwsQuery protocol support (over eio-based httpun client) *)

(** The unbound protocol functors (not tied to any particular client implementation) *)
module Unbound = struct
  module AwsJson = AwsJson
  module AwsQuery = AwsQuery
end
