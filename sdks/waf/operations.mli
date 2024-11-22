open Types 
module UpdateXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_xss_match_set_request ->
        (update_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      update_web_acl_request ->
        (update_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            
        ]
      ) result
end

module UpdateSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sql_injection_match_set_request ->
        (update_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_size_constraint_set_request ->
        (update_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_group_request ->
        (update_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_request ->
        (update_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_pattern_set_request ->
        (update_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidRegexPatternException of waf_invalid_regex_pattern_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_match_set_request ->
        (update_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rate_based_rule_request ->
        (update_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ip_set_request ->
        (update_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_geo_match_set_request ->
        (update_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_byte_match_set_request ->
        (update_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module PutPermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_policy_request ->
        (put_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidPermissionPolicyException of waf_invalid_permission_policy_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module PutLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_logging_configuration_request ->
        (put_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFServiceLinkedRoleErrorException of waf_service_linked_role_error_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module ListXssMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_xss_match_sets_request ->
        (list_xss_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListWebACLs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_web_ac_ls_request ->
        (list_web_ac_ls_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module ListSubscribedRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_subscribed_rule_groups_request ->
        (list_subscribed_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module ListSqlInjectionMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_sql_injection_match_sets_request ->
        (list_sql_injection_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListSizeConstraintSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_size_constraint_sets_request ->
        (list_size_constraint_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rules_request ->
        (list_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_groups_request ->
        (list_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            
        ]
      ) result
end

module ListRegexPatternSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_pattern_sets_request ->
        (list_regex_pattern_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListRegexMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_match_sets_request ->
        (list_regex_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListRateBasedRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rate_based_rules_request ->
        (list_rate_based_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListLoggingConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_logging_configurations_request ->
        (list_logging_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module ListIPSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_sets_request ->
        (list_ip_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListGeoMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_geo_match_sets_request ->
        (list_geo_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListByteMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_byte_match_sets_request ->
        (list_byte_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListActivatedRulesInRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      list_activated_rules_in_rule_group_request ->
        (list_activated_rules_in_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_xss_match_set_request ->
        (get_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_request ->
        (get_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sql_injection_match_set_request ->
        (get_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_size_constraint_set_request ->
        (get_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetSampledRequests : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sampled_requests_request ->
        (get_sampled_requests_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_group_request ->
        (get_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_request ->
        (get_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_pattern_set_request ->
        (get_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_match_set_request ->
        (get_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRateBasedRuleManagedKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_rule_managed_keys_request ->
        (get_rate_based_rule_managed_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_rule_request ->
        (get_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetPermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_permission_policy_request ->
        (get_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      get_logging_configuration_request ->
        (get_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ip_set_request ->
        (get_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_geo_match_set_request ->
        (get_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetChangeTokenStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_change_token_status_request ->
        (get_change_token_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetChangeToken : sig
  val request :
    Smaws_Lib.Context.t ->
      get_change_token_request ->
        (get_change_token_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            
        ]
      ) result
end

module GetByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_byte_match_set_request ->
        (get_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module DeleteXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_xss_match_set_request ->
        (delete_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_web_acl_request ->
        (delete_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_sql_injection_match_set_request ->
        (delete_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_size_constraint_set_request ->
        (delete_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_group_request ->
        (delete_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_request ->
        (delete_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_pattern_set_request ->
        (delete_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_match_set_request ->
        (delete_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rate_based_rule_request ->
        (delete_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeletePermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_permission_policy_request ->
        (delete_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_logging_configuration_request ->
        (delete_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ip_set_request ->
        (delete_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_geo_match_set_request ->
        (delete_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_byte_match_set_request ->
        (delete_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_xss_match_set_request ->
        (create_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateWebACLMigrationStack : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_migration_stack_request ->
        (create_web_acl_migration_stack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFEntityMigrationException of waf_entity_migration_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module CreateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_request ->
        (create_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_sql_injection_match_set_request ->
        (create_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_size_constraint_set_request ->
        (create_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_group_request ->
        (create_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_request ->
        (create_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_pattern_set_request ->
        (create_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_match_set_request ->
        (create_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rate_based_rule_request ->
        (create_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_ip_set_request ->
        (create_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_geo_match_set_request ->
        (create_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_byte_match_set_request ->
        (create_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

