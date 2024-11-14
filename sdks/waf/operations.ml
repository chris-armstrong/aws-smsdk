open Types 
let (let+) res map = Result.map map res
module UpdateXssMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_xss_match_set_request) ->
    let input = Serializers.update_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateXssMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_xss_match_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFSubscriptionNotFoundException" ->
         (`WAFSubscriptionNotFoundException (waf_subscription_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_web_acl_request) ->
    let input = Serializers.update_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_web_acl_response_of_yojson
      ~error_deserializer
      
end

module UpdateSqlInjectionMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_sql_injection_match_set_request) ->
    let input = Serializers.update_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateSqlInjectionMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_sql_injection_match_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateSizeConstraintSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_size_constraint_set_request) ->
    let input = Serializers.update_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateSizeConstraintSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_size_constraint_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_rule_group_request) ->
    let input = Serializers.update_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_rule_group_response_of_yojson
      ~error_deserializer
      
end

module UpdateRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_rule_request) ->
    let input = Serializers.update_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_rule_response_of_yojson
      ~error_deserializer
      
end

module UpdateRegexPatternSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidRegexPatternException" ->
         (`WAFInvalidRegexPatternException (waf_invalid_regex_pattern_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_regex_pattern_set_request) ->
    let input = Serializers.update_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateRegexPatternSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_regex_pattern_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateRegexMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_regex_match_set_request) ->
    let input = Serializers.update_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateRegexMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_regex_match_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateRateBasedRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_rate_based_rule_request) ->
    let input = Serializers.update_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateRateBasedRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_rate_based_rule_response_of_yojson
      ~error_deserializer
      
end

module UpdateIPSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_ip_set_request) ->
    let input = Serializers.update_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateIPSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_ip_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateGeoMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_geo_match_set_request) ->
    let input = Serializers.update_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateGeoMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_geo_match_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateByteMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentContainerException" ->
         (`WAFNonexistentContainerException (waf_nonexistent_container_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_byte_match_set_request) ->
    let input = Serializers.update_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UpdateByteMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_byte_match_set_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFBadRequestException" ->
         (`WAFBadRequestException (waf_bad_request_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFBadRequestException" ->
         (`WAFBadRequestException (waf_bad_request_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module PutPermissionPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidPermissionPolicyException" ->
         (`WAFInvalidPermissionPolicyException (waf_invalid_permission_policy_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_permission_policy_request) ->
    let input = Serializers.put_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.PutPermissionPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_permission_policy_response_of_yojson
      ~error_deserializer
      
end

module PutLoggingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFServiceLinkedRoleErrorException" ->
         (`WAFServiceLinkedRoleErrorException (waf_service_linked_role_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_logging_configuration_request) ->
    let input = Serializers.put_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.PutLoggingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_logging_configuration_response_of_yojson
      ~error_deserializer
      
end

module ListXssMatchSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_xss_match_sets_request) ->
    let input = Serializers.list_xss_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListXssMatchSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_xss_match_sets_response_of_yojson
      ~error_deserializer
      
end

module ListWebACLs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_web_ac_ls_request) ->
    let input = Serializers.list_web_ac_ls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListWebACLs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_web_ac_ls_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFBadRequestException" ->
         (`WAFBadRequestException (waf_bad_request_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListSubscribedRuleGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_subscribed_rule_groups_request) ->
    let input = Serializers.list_subscribed_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListSubscribedRuleGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_subscribed_rule_groups_response_of_yojson
      ~error_deserializer
      
end

module ListSqlInjectionMatchSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_sql_injection_match_sets_request) ->
    let input = Serializers.list_sql_injection_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListSqlInjectionMatchSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_sql_injection_match_sets_response_of_yojson
      ~error_deserializer
      
end

module ListSizeConstraintSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_size_constraint_sets_request) ->
    let input = Serializers.list_size_constraint_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListSizeConstraintSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_size_constraint_sets_response_of_yojson
      ~error_deserializer
      
end

module ListRules = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_rules_request) ->
    let input = Serializers.list_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListRules" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_rules_response_of_yojson
      ~error_deserializer
      
end

module ListRuleGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_rule_groups_request) ->
    let input = Serializers.list_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListRuleGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_rule_groups_response_of_yojson
      ~error_deserializer
      
end

module ListRegexPatternSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_regex_pattern_sets_request) ->
    let input = Serializers.list_regex_pattern_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListRegexPatternSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_regex_pattern_sets_response_of_yojson
      ~error_deserializer
      
end

module ListRegexMatchSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_regex_match_sets_request) ->
    let input = Serializers.list_regex_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListRegexMatchSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_regex_match_sets_response_of_yojson
      ~error_deserializer
      
end

module ListRateBasedRules = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_rate_based_rules_request) ->
    let input = Serializers.list_rate_based_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListRateBasedRules" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_rate_based_rules_response_of_yojson
      ~error_deserializer
      
end

module ListLoggingConfigurations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_logging_configurations_request) ->
    let input = Serializers.list_logging_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListLoggingConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_logging_configurations_response_of_yojson
      ~error_deserializer
      
end

module ListIPSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_ip_sets_request) ->
    let input = Serializers.list_ip_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListIPSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_ip_sets_response_of_yojson
      ~error_deserializer
      
end

module ListGeoMatchSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_geo_match_sets_request) ->
    let input = Serializers.list_geo_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListGeoMatchSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_geo_match_sets_response_of_yojson
      ~error_deserializer
      
end

module ListByteMatchSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_byte_match_sets_request) ->
    let input = Serializers.list_byte_match_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListByteMatchSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_byte_match_sets_response_of_yojson
      ~error_deserializer
      
end

module ListActivatedRulesInRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_activated_rules_in_rule_group_request) ->
    let input = Serializers.list_activated_rules_in_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.ListActivatedRulesInRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_activated_rules_in_rule_group_response_of_yojson
      ~error_deserializer
      
end

module GetXssMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_xss_match_set_request) ->
    let input = Serializers.get_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetXssMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_xss_match_set_response_of_yojson
      ~error_deserializer
      
end

module GetWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_web_acl_request) ->
    let input = Serializers.get_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_web_acl_response_of_yojson
      ~error_deserializer
      
end

module GetSqlInjectionMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_sql_injection_match_set_request) ->
    let input = Serializers.get_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetSqlInjectionMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_sql_injection_match_set_response_of_yojson
      ~error_deserializer
      
end

module GetSizeConstraintSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_size_constraint_set_request) ->
    let input = Serializers.get_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetSizeConstraintSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_size_constraint_set_response_of_yojson
      ~error_deserializer
      
end

module GetSampledRequests = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_sampled_requests_request) ->
    let input = Serializers.get_sampled_requests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetSampledRequests" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_sampled_requests_response_of_yojson
      ~error_deserializer
      
end

module GetRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_rule_group_request) ->
    let input = Serializers.get_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_rule_group_response_of_yojson
      ~error_deserializer
      
end

module GetRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_rule_request) ->
    let input = Serializers.get_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_rule_response_of_yojson
      ~error_deserializer
      
end

module GetRegexPatternSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_regex_pattern_set_request) ->
    let input = Serializers.get_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetRegexPatternSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_regex_pattern_set_response_of_yojson
      ~error_deserializer
      
end

module GetRegexMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_regex_match_set_request) ->
    let input = Serializers.get_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetRegexMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_regex_match_set_response_of_yojson
      ~error_deserializer
      
end

module GetRateBasedRuleManagedKeys = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_rate_based_rule_managed_keys_request) ->
    let input = Serializers.get_rate_based_rule_managed_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetRateBasedRuleManagedKeys" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_rate_based_rule_managed_keys_response_of_yojson
      ~error_deserializer
      
end

module GetRateBasedRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_rate_based_rule_request) ->
    let input = Serializers.get_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetRateBasedRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_rate_based_rule_response_of_yojson
      ~error_deserializer
      
end

module GetPermissionPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_permission_policy_request) ->
    let input = Serializers.get_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetPermissionPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_permission_policy_response_of_yojson
      ~error_deserializer
      
end

module GetLoggingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_logging_configuration_request) ->
    let input = Serializers.get_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetLoggingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_logging_configuration_response_of_yojson
      ~error_deserializer
      
end

module GetIPSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_ip_set_request) ->
    let input = Serializers.get_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetIPSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_ip_set_response_of_yojson
      ~error_deserializer
      
end

module GetGeoMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_geo_match_set_request) ->
    let input = Serializers.get_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetGeoMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_geo_match_set_response_of_yojson
      ~error_deserializer
      
end

module GetChangeTokenStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_change_token_status_request) ->
    let input = Serializers.get_change_token_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetChangeTokenStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_change_token_status_response_of_yojson
      ~error_deserializer
      
end

module GetChangeToken = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_change_token_request) ->
    let input = Serializers.get_change_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetChangeToken" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_change_token_response_of_yojson
      ~error_deserializer
      
end

module GetByteMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_byte_match_set_request) ->
    let input = Serializers.get_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.GetByteMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_byte_match_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteXssMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_xss_match_set_request) ->
    let input = Serializers.delete_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteXssMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_xss_match_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_web_acl_request) ->
    let input = Serializers.delete_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_web_acl_response_of_yojson
      ~error_deserializer
      
end

module DeleteSqlInjectionMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_sql_injection_match_set_request) ->
    let input = Serializers.delete_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteSqlInjectionMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_sql_injection_match_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteSizeConstraintSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_size_constraint_set_request) ->
    let input = Serializers.delete_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteSizeConstraintSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_size_constraint_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_rule_group_request) ->
    let input = Serializers.delete_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_rule_group_response_of_yojson
      ~error_deserializer
      
end

module DeleteRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_rule_request) ->
    let input = Serializers.delete_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_rule_response_of_yojson
      ~error_deserializer
      
end

module DeleteRegexPatternSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_regex_pattern_set_request) ->
    let input = Serializers.delete_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteRegexPatternSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_regex_pattern_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteRegexMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_regex_match_set_request) ->
    let input = Serializers.delete_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteRegexMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_regex_match_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteRateBasedRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_rate_based_rule_request) ->
    let input = Serializers.delete_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteRateBasedRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_rate_based_rule_response_of_yojson
      ~error_deserializer
      
end

module DeletePermissionPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_permission_policy_request) ->
    let input = Serializers.delete_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeletePermissionPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_permission_policy_response_of_yojson
      ~error_deserializer
      
end

module DeleteLoggingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_logging_configuration_request) ->
    let input = Serializers.delete_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteLoggingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_logging_configuration_response_of_yojson
      ~error_deserializer
      
end

module DeleteIPSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_ip_set_request) ->
    let input = Serializers.delete_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteIPSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_ip_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteGeoMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_geo_match_set_request) ->
    let input = Serializers.delete_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteGeoMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_geo_match_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteByteMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonEmptyEntityException" ->
         (`WAFNonEmptyEntityException (waf_non_empty_entity_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFReferencedItemException" ->
         (`WAFReferencedItemException (waf_referenced_item_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_byte_match_set_request) ->
    let input = Serializers.delete_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.DeleteByteMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_byte_match_set_response_of_yojson
      ~error_deserializer
      
end

module CreateXssMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_xss_match_set_request) ->
    let input = Serializers.create_xss_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateXssMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_xss_match_set_response_of_yojson
      ~error_deserializer
      
end

module CreateWebACLMigrationStack = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFEntityMigrationException" ->
         (`WAFEntityMigrationException (waf_entity_migration_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_web_acl_migration_stack_request) ->
    let input = Serializers.create_web_acl_migration_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateWebACLMigrationStack" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_web_acl_migration_stack_response_of_yojson
      ~error_deserializer
      
end

module CreateWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFBadRequestException" ->
         (`WAFBadRequestException (waf_bad_request_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_web_acl_request) ->
    let input = Serializers.create_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_web_acl_response_of_yojson
      ~error_deserializer
      
end

module CreateSqlInjectionMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_sql_injection_match_set_request) ->
    let input = Serializers.create_sql_injection_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateSqlInjectionMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_sql_injection_match_set_response_of_yojson
      ~error_deserializer
      
end

module CreateSizeConstraintSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_size_constraint_set_request) ->
    let input = Serializers.create_size_constraint_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateSizeConstraintSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_size_constraint_set_response_of_yojson
      ~error_deserializer
      
end

module CreateRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFBadRequestException" ->
         (`WAFBadRequestException (waf_bad_request_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_rule_group_request) ->
    let input = Serializers.create_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_rule_group_response_of_yojson
      ~error_deserializer
      
end

module CreateRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFBadRequestException" ->
         (`WAFBadRequestException (waf_bad_request_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_rule_request) ->
    let input = Serializers.create_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_rule_response_of_yojson
      ~error_deserializer
      
end

module CreateRegexPatternSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_regex_pattern_set_request) ->
    let input = Serializers.create_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateRegexPatternSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_regex_pattern_set_response_of_yojson
      ~error_deserializer
      
end

module CreateRegexMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_regex_match_set_request) ->
    let input = Serializers.create_regex_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateRegexMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_regex_match_set_response_of_yojson
      ~error_deserializer
      
end

module CreateRateBasedRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFBadRequestException" ->
         (`WAFBadRequestException (waf_bad_request_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_rate_based_rule_request) ->
    let input = Serializers.create_rate_based_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateRateBasedRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_rate_based_rule_response_of_yojson
      ~error_deserializer
      
end

module CreateIPSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_ip_set_request) ->
    let input = Serializers.create_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateIPSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_ip_set_response_of_yojson
      ~error_deserializer
      
end

module CreateGeoMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_geo_match_set_request) ->
    let input = Serializers.create_geo_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateGeoMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_geo_match_set_response_of_yojson
      ~error_deserializer
      
end

module CreateByteMatchSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.waf", "WAFDisallowedNameException" ->
         (`WAFDisallowedNameException (waf_disallowed_name_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidAccountException" ->
         (`WAFInvalidAccountException (waf_invalid_account_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.waf", "WAFStaleDataException" ->
         (`WAFStaleDataException (waf_stale_data_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_byte_match_set_request) ->
    let input = Serializers.create_byte_match_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20150824.CreateByteMatchSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_byte_match_set_response_of_yojson
      ~error_deserializer
      
end

