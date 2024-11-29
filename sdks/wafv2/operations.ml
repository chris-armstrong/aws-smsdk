open Types 
let (let+) res map = Result.map map res
module AssociateWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFUnavailableEntityException" ->
         (`WAFUnavailableEntityException (waf_unavailable_entity_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_web_acl_request) ->
    let input = Serializers.associate_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.AssociateWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_web_acl_response_of_yojson
      ~error_deserializer
      
end

module CheckCapacity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFExpiredManagedRuleGroupVersionException" ->
         (`WAFExpiredManagedRuleGroupVersionException (waf_expired_managed_rule_group_version_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidResourceException" ->
         (`WAFInvalidResourceException (waf_invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFSubscriptionNotFoundException" ->
         (`WAFSubscriptionNotFoundException (waf_subscription_not_found_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFUnavailableEntityException" ->
         (`WAFUnavailableEntityException (waf_unavailable_entity_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: check_capacity_request) ->
    let input = Serializers.check_capacity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.CheckCapacity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.check_capacity_response_of_yojson
      ~error_deserializer
      
end

module CreateAPIKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_api_key_request) ->
    let input = Serializers.create_api_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.CreateAPIKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_api_key_response_of_yojson
      ~error_deserializer
      
end

module CreateIPSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFDuplicateItemException" ->
         (`WAFDuplicateItemException (waf_duplicate_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_ip_set_request) ->
    let input = Serializers.create_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.CreateIPSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_ip_set_response_of_yojson
      ~error_deserializer
      
end

module CreateRegexPatternSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFDuplicateItemException" ->
         (`WAFDuplicateItemException (waf_duplicate_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_regex_pattern_set_request) ->
    let input = Serializers.create_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.CreateRegexPatternSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_regex_pattern_set_response_of_yojson
      ~error_deserializer
      
end

module CreateRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFDuplicateItemException" ->
         (`WAFDuplicateItemException (waf_duplicate_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFSubscriptionNotFoundException" ->
         (`WAFSubscriptionNotFoundException (waf_subscription_not_found_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFUnavailableEntityException" ->
         (`WAFUnavailableEntityException (waf_unavailable_entity_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_rule_group_request) ->
    let input = Serializers.create_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.CreateRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_rule_group_response_of_yojson
      ~error_deserializer
      
end

module CreateWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFConfigurationWarningException" ->
         (`WAFConfigurationWarningException (waf_configuration_warning_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFDuplicateItemException" ->
         (`WAFDuplicateItemException (waf_duplicate_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFExpiredManagedRuleGroupVersionException" ->
         (`WAFExpiredManagedRuleGroupVersionException (waf_expired_managed_rule_group_version_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidResourceException" ->
         (`WAFInvalidResourceException (waf_invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFSubscriptionNotFoundException" ->
         (`WAFSubscriptionNotFoundException (waf_subscription_not_found_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFUnavailableEntityException" ->
         (`WAFUnavailableEntityException (waf_unavailable_entity_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_web_acl_request) ->
    let input = Serializers.create_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.CreateWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_web_acl_response_of_yojson
      ~error_deserializer
      
end

module DeleteAPIKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_api_key_request) ->
    let input = Serializers.delete_api_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DeleteAPIKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_api_key_response_of_yojson
      ~error_deserializer
      
end

module DeleteFirewallManagerRuleGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_firewall_manager_rule_groups_request) ->
    let input = Serializers.delete_firewall_manager_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DeleteFirewallManagerRuleGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_firewall_manager_rule_groups_response_of_yojson
      ~error_deserializer
      
end

module DeleteIPSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFAssociatedItemException" ->
         (`WAFAssociatedItemException (waf_associated_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_ip_set_request) ->
    let input = Serializers.delete_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DeleteIPSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_ip_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteLoggingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_logging_configuration_request) ->
    let input = Serializers.delete_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DeleteLoggingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_logging_configuration_response_of_yojson
      ~error_deserializer
      
end

module DeletePermissionPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_permission_policy_request) ->
    let input = Serializers.delete_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DeletePermissionPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_permission_policy_response_of_yojson
      ~error_deserializer
      
end

module DeleteRegexPatternSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFAssociatedItemException" ->
         (`WAFAssociatedItemException (waf_associated_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_regex_pattern_set_request) ->
    let input = Serializers.delete_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DeleteRegexPatternSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_regex_pattern_set_response_of_yojson
      ~error_deserializer
      
end

module DeleteRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFAssociatedItemException" ->
         (`WAFAssociatedItemException (waf_associated_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_rule_group_request) ->
    let input = Serializers.delete_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DeleteRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_rule_group_response_of_yojson
      ~error_deserializer
      
end

module DeleteWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFAssociatedItemException" ->
         (`WAFAssociatedItemException (waf_associated_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_web_acl_request) ->
    let input = Serializers.delete_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DeleteWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_web_acl_response_of_yojson
      ~error_deserializer
      
end

module DescribeAllManagedProducts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_all_managed_products_request) ->
    let input = Serializers.describe_all_managed_products_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DescribeAllManagedProducts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_all_managed_products_response_of_yojson
      ~error_deserializer
      
end

module DescribeManagedProductsByVendor = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_managed_products_by_vendor_request) ->
    let input = Serializers.describe_managed_products_by_vendor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DescribeManagedProductsByVendor" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_managed_products_by_vendor_response_of_yojson
      ~error_deserializer
      
end

module DescribeManagedRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFExpiredManagedRuleGroupVersionException" ->
         (`WAFExpiredManagedRuleGroupVersionException (waf_expired_managed_rule_group_version_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidResourceException" ->
         (`WAFInvalidResourceException (waf_invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_managed_rule_group_request) ->
    let input = Serializers.describe_managed_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DescribeManagedRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_managed_rule_group_response_of_yojson
      ~error_deserializer
      
end

module DisassociateWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_web_acl_request) ->
    let input = Serializers.disassociate_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.DisassociateWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_web_acl_response_of_yojson
      ~error_deserializer
      
end

module GenerateMobileSdkReleaseUrl = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: generate_mobile_sdk_release_url_request) ->
    let input = Serializers.generate_mobile_sdk_release_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GenerateMobileSdkReleaseUrl" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.generate_mobile_sdk_release_url_response_of_yojson
      ~error_deserializer
      
end

module GetDecryptedAPIKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidResourceException" ->
         (`WAFInvalidResourceException (waf_invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_decrypted_api_key_request) ->
    let input = Serializers.get_decrypted_api_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetDecryptedAPIKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_decrypted_api_key_response_of_yojson
      ~error_deserializer
      
end

module GetIPSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_ip_set_request) ->
    let input = Serializers.get_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetIPSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_ip_set_response_of_yojson
      ~error_deserializer
      
end

module GetLoggingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_logging_configuration_request) ->
    let input = Serializers.get_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetLoggingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_logging_configuration_response_of_yojson
      ~error_deserializer
      
end

module GetManagedRuleSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_managed_rule_set_request) ->
    let input = Serializers.get_managed_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetManagedRuleSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_managed_rule_set_response_of_yojson
      ~error_deserializer
      
end

module GetMobileSdkRelease = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_mobile_sdk_release_request) ->
    let input = Serializers.get_mobile_sdk_release_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetMobileSdkRelease" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_mobile_sdk_release_response_of_yojson
      ~error_deserializer
      
end

module GetPermissionPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_permission_policy_request) ->
    let input = Serializers.get_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetPermissionPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_permission_policy_response_of_yojson
      ~error_deserializer
      
end

module GetRateBasedStatementManagedKeys = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFUnsupportedAggregateKeyTypeException" ->
         (`WAFUnsupportedAggregateKeyTypeException (waf_unsupported_aggregate_key_type_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_rate_based_statement_managed_keys_request) ->
    let input = Serializers.get_rate_based_statement_managed_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetRateBasedStatementManagedKeys" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_rate_based_statement_managed_keys_response_of_yojson
      ~error_deserializer
      
end

module GetRegexPatternSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_regex_pattern_set_request) ->
    let input = Serializers.get_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetRegexPatternSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_regex_pattern_set_response_of_yojson
      ~error_deserializer
      
end

module GetRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_rule_group_request) ->
    let input = Serializers.get_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_rule_group_response_of_yojson
      ~error_deserializer
      
end

module GetSampledRequests = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_sampled_requests_request) ->
    let input = Serializers.get_sampled_requests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetSampledRequests" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_sampled_requests_response_of_yojson
      ~error_deserializer
      
end

module GetWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_web_acl_request) ->
    let input = Serializers.get_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_web_acl_response_of_yojson
      ~error_deserializer
      
end

module GetWebACLForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFUnavailableEntityException" ->
         (`WAFUnavailableEntityException (waf_unavailable_entity_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_web_acl_for_resource_request) ->
    let input = Serializers.get_web_acl_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.GetWebACLForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_web_acl_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListAPIKeys = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidResourceException" ->
         (`WAFInvalidResourceException (waf_invalid_resource_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_api_keys_request) ->
    let input = Serializers.list_api_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListAPIKeys" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_api_keys_response_of_yojson
      ~error_deserializer
      
end

module ListAvailableManagedRuleGroupVersions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_available_managed_rule_group_versions_request) ->
    let input = Serializers.list_available_managed_rule_group_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListAvailableManagedRuleGroupVersions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_available_managed_rule_group_versions_response_of_yojson
      ~error_deserializer
      
end

module ListAvailableManagedRuleGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_available_managed_rule_groups_request) ->
    let input = Serializers.list_available_managed_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListAvailableManagedRuleGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_available_managed_rule_groups_response_of_yojson
      ~error_deserializer
      
end

module ListIPSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_ip_sets_request) ->
    let input = Serializers.list_ip_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListIPSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_ip_sets_response_of_yojson
      ~error_deserializer
      
end

module ListLoggingConfigurations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_logging_configurations_request) ->
    let input = Serializers.list_logging_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListLoggingConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_logging_configurations_response_of_yojson
      ~error_deserializer
      
end

module ListManagedRuleSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_managed_rule_sets_request) ->
    let input = Serializers.list_managed_rule_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListManagedRuleSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_managed_rule_sets_response_of_yojson
      ~error_deserializer
      
end

module ListMobileSdkReleases = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_mobile_sdk_releases_request) ->
    let input = Serializers.list_mobile_sdk_releases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListMobileSdkReleases" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_mobile_sdk_releases_response_of_yojson
      ~error_deserializer
      
end

module ListRegexPatternSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_regex_pattern_sets_request) ->
    let input = Serializers.list_regex_pattern_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListRegexPatternSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_regex_pattern_sets_response_of_yojson
      ~error_deserializer
      
end

module ListResourcesForWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resources_for_web_acl_request) ->
    let input = Serializers.list_resources_for_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListResourcesForWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resources_for_web_acl_response_of_yojson
      ~error_deserializer
      
end

module ListRuleGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_rule_groups_request) ->
    let input = Serializers.list_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListRuleGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_rule_groups_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListWebACLs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_web_ac_ls_request) ->
    let input = Serializers.list_web_ac_ls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.ListWebACLs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_web_ac_ls_response_of_yojson
      ~error_deserializer
      
end

module PutLoggingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLogDestinationPermissionIssueException" ->
         (`WAFLogDestinationPermissionIssueException (waf_log_destination_permission_issue_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFServiceLinkedRoleErrorException" ->
         (`WAFServiceLinkedRoleErrorException (waf_service_linked_role_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_logging_configuration_request) ->
    let input = Serializers.put_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.PutLoggingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_logging_configuration_response_of_yojson
      ~error_deserializer
      
end

module PutManagedRuleSetVersions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_managed_rule_set_versions_request) ->
    let input = Serializers.put_managed_rule_set_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.PutManagedRuleSetVersions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_managed_rule_set_versions_response_of_yojson
      ~error_deserializer
      
end

module PutPermissionPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidPermissionPolicyException" ->
         (`WAFInvalidPermissionPolicyException (waf_invalid_permission_policy_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_permission_policy_request) ->
    let input = Serializers.put_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.PutPermissionPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_permission_policy_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.TagResource" 
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
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationException" ->
         (`WAFTagOperationException (waf_tag_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFTagOperationInternalErrorException" ->
         (`WAFTagOperationInternalErrorException (waf_tag_operation_internal_error_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module UpdateIPSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFDuplicateItemException" ->
         (`WAFDuplicateItemException (waf_duplicate_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_ip_set_request) ->
    let input = Serializers.update_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.UpdateIPSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_ip_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateManagedRuleSetVersionExpiryDate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_managed_rule_set_version_expiry_date_request) ->
    let input = Serializers.update_managed_rule_set_version_expiry_date_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.UpdateManagedRuleSetVersionExpiryDate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_managed_rule_set_version_expiry_date_response_of_yojson
      ~error_deserializer
      
end

module UpdateRegexPatternSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFDuplicateItemException" ->
         (`WAFDuplicateItemException (waf_duplicate_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_regex_pattern_set_request) ->
    let input = Serializers.update_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.UpdateRegexPatternSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_regex_pattern_set_response_of_yojson
      ~error_deserializer
      
end

module UpdateRuleGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFConfigurationWarningException" ->
         (`WAFConfigurationWarningException (waf_configuration_warning_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFDuplicateItemException" ->
         (`WAFDuplicateItemException (waf_duplicate_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFSubscriptionNotFoundException" ->
         (`WAFSubscriptionNotFoundException (waf_subscription_not_found_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFUnavailableEntityException" ->
         (`WAFUnavailableEntityException (waf_unavailable_entity_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_rule_group_request) ->
    let input = Serializers.update_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.UpdateRuleGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_rule_group_response_of_yojson
      ~error_deserializer
      
end

module UpdateWebACL = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.wafv2", "WAFConfigurationWarningException" ->
         (`WAFConfigurationWarningException (waf_configuration_warning_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFDuplicateItemException" ->
         (`WAFDuplicateItemException (waf_duplicate_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFExpiredManagedRuleGroupVersionException" ->
         (`WAFExpiredManagedRuleGroupVersionException (waf_expired_managed_rule_group_version_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInternalErrorException" ->
         (`WAFInternalErrorException (waf_internal_error_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidOperationException" ->
         (`WAFInvalidOperationException (waf_invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidParameterException" ->
         (`WAFInvalidParameterException (waf_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFInvalidResourceException" ->
         (`WAFInvalidResourceException (waf_invalid_resource_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFLimitsExceededException" ->
         (`WAFLimitsExceededException (waf_limits_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFNonexistentItemException" ->
         (`WAFNonexistentItemException (waf_nonexistent_item_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFOptimisticLockException" ->
         (`WAFOptimisticLockException (waf_optimistic_lock_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFSubscriptionNotFoundException" ->
         (`WAFSubscriptionNotFoundException (waf_subscription_not_found_exception_of_yojson tree path))
      | "com.amazonaws.wafv2", "WAFUnavailableEntityException" ->
         (`WAFUnavailableEntityException (waf_unavailable_entity_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_web_acl_request) ->
    let input = Serializers.update_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSWAF_20190729.UpdateWebACL" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_web_acl_response_of_yojson
      ~error_deserializer
      
end

