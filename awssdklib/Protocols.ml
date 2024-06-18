module Unbound = struct
  module AwsJson = AwsJson
  module AwsQuery = AwsQuery
end

module AwsJson = AwsJson.Make (Http.Client)
module AwsQuery = AwsQuery.Make (Http.Client)
