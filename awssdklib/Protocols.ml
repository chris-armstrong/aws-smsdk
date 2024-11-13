module Unbound = struct
  module AwsJson = AwsJson
  module AwsQuery = AwsQuery
end

type http_error = [ `HttpError of Http.http_failure ]
type aws_service_error = [ `AWSServiceError of AwsErrors.aws_service_error ]

module AwsJson = AwsJson.Make (Http.Client)
module AwsQuery = AwsQuery.Make (Http.Client)
