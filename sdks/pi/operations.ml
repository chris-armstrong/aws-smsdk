open Types 
let (let+) res map = Result.map map res
module CreatePerformanceAnalysisReport = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_performance_analysis_report_request) ->
    let input = Serializers.create_performance_analysis_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.CreatePerformanceAnalysisReport" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_performance_analysis_report_response_of_yojson
      ~error_deserializer
      
end

module DeletePerformanceAnalysisReport = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_performance_analysis_report_request) ->
    let input = Serializers.delete_performance_analysis_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.DeletePerformanceAnalysisReport" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_performance_analysis_report_response_of_yojson
      ~error_deserializer
      
end

module DescribeDimensionKeys = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_dimension_keys_request) ->
    let input = Serializers.describe_dimension_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.DescribeDimensionKeys" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_dimension_keys_response_of_yojson
      ~error_deserializer
      
end

module GetDimensionKeyDetails = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_dimension_key_details_request) ->
    let input = Serializers.get_dimension_key_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.GetDimensionKeyDetails" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_dimension_key_details_response_of_yojson
      ~error_deserializer
      
end

module GetPerformanceAnalysisReport = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_performance_analysis_report_request) ->
    let input = Serializers.get_performance_analysis_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.GetPerformanceAnalysisReport" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_performance_analysis_report_response_of_yojson
      ~error_deserializer
      
end

module GetResourceMetadata = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_metadata_request) ->
    let input = Serializers.get_resource_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.GetResourceMetadata" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_metadata_response_of_yojson
      ~error_deserializer
      
end

module GetResourceMetrics = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_metrics_request) ->
    let input = Serializers.get_resource_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.GetResourceMetrics" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_metrics_response_of_yojson
      ~error_deserializer
      
end

module ListAvailableResourceDimensions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_available_resource_dimensions_request) ->
    let input = Serializers.list_available_resource_dimensions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.ListAvailableResourceDimensions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_available_resource_dimensions_response_of_yojson
      ~error_deserializer
      
end

module ListAvailableResourceMetrics = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_available_resource_metrics_request) ->
    let input = Serializers.list_available_resource_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.ListAvailableResourceMetrics" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_available_resource_metrics_response_of_yojson
      ~error_deserializer
      
end

module ListPerformanceAnalysisReports = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_performance_analysis_reports_request) ->
    let input = Serializers.list_performance_analysis_reports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.ListPerformanceAnalysisReports" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_performance_analysis_reports_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.pi", "InternalServiceError" ->
         (`InternalServiceError (internal_service_error_of_yojson tree path))
      | "com.amazonaws.pi", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.pi", "NotAuthorizedException" ->
         (`NotAuthorizedException (not_authorized_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"PerformanceInsightsv20180227.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

