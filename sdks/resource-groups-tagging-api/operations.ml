open Types 
let (let+) res map = Result.map map res
module DescribeReportCreation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.resourcegroupstaggingapi", "ConstraintViolationException" ->
         (`ConstraintViolationException (constraint_violation_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InternalServiceException" ->
         (`InternalServiceException (internal_service_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "ThrottledException" ->
         (`ThrottledException (throttled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_report_creation_input) ->
    let input = Serializers.describe_report_creation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.DescribeReportCreation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_report_creation_output_of_yojson
      ~error_deserializer
      
end

module GetComplianceSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.resourcegroupstaggingapi", "ConstraintViolationException" ->
         (`ConstraintViolationException (constraint_violation_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InternalServiceException" ->
         (`InternalServiceException (internal_service_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "ThrottledException" ->
         (`ThrottledException (throttled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_compliance_summary_input) ->
    let input = Serializers.get_compliance_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.GetComplianceSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_compliance_summary_output_of_yojson
      ~error_deserializer
      
end

module GetResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.resourcegroupstaggingapi", "InternalServiceException" ->
         (`InternalServiceException (internal_service_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "PaginationTokenExpiredException" ->
         (`PaginationTokenExpiredException (pagination_token_expired_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "ThrottledException" ->
         (`ThrottledException (throttled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resources_input) ->
    let input = Serializers.get_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.GetResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resources_output_of_yojson
      ~error_deserializer
      
end

module GetTagKeys = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.resourcegroupstaggingapi", "InternalServiceException" ->
         (`InternalServiceException (internal_service_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "PaginationTokenExpiredException" ->
         (`PaginationTokenExpiredException (pagination_token_expired_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "ThrottledException" ->
         (`ThrottledException (throttled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_tag_keys_input) ->
    let input = Serializers.get_tag_keys_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.GetTagKeys" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_tag_keys_output_of_yojson
      ~error_deserializer
      
end

module GetTagValues = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.resourcegroupstaggingapi", "InternalServiceException" ->
         (`InternalServiceException (internal_service_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "PaginationTokenExpiredException" ->
         (`PaginationTokenExpiredException (pagination_token_expired_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "ThrottledException" ->
         (`ThrottledException (throttled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_tag_values_input) ->
    let input = Serializers.get_tag_values_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.GetTagValues" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_tag_values_output_of_yojson
      ~error_deserializer
      
end

module StartReportCreation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.resourcegroupstaggingapi", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "ConstraintViolationException" ->
         (`ConstraintViolationException (constraint_violation_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InternalServiceException" ->
         (`InternalServiceException (internal_service_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "ThrottledException" ->
         (`ThrottledException (throttled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_report_creation_input) ->
    let input = Serializers.start_report_creation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.StartReportCreation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_report_creation_output_of_yojson
      ~error_deserializer
      
end

module TagResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.resourcegroupstaggingapi", "InternalServiceException" ->
         (`InternalServiceException (internal_service_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "ThrottledException" ->
         (`ThrottledException (throttled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resources_input) ->
    let input = Serializers.tag_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.TagResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resources_output_of_yojson
      ~error_deserializer
      
end

module UntagResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.resourcegroupstaggingapi", "InternalServiceException" ->
         (`InternalServiceException (internal_service_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.resourcegroupstaggingapi", "ThrottledException" ->
         (`ThrottledException (throttled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resources_input) ->
    let input = Serializers.untag_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ResourceGroupsTaggingAPI_20170126.UntagResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resources_output_of_yojson
      ~error_deserializer
      
end

