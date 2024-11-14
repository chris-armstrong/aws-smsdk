open Types 
module UpdateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      update_web_acl_request ->
        (update_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFConfigurationWarningException of waf_configuration_warning_exception
            | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFExpiredManagedRuleGroupVersionException of waf_expired_managed_rule_group_version_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module UpdateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_group_request ->
        (update_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFConfigurationWarningException of waf_configuration_warning_exception
            | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module UpdateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_pattern_set_request ->
        (update_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module UpdateManagedRuleSetVersionExpiryDate : sig
  val request :
    Smaws_Lib.Context.t ->
      update_managed_rule_set_version_expiry_date_request ->
        (update_managed_rule_set_version_expiry_date_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module UpdateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ip_set_request ->
        (update_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
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
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidPermissionPolicyException of waf_invalid_permission_policy_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module PutManagedRuleSetVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      put_managed_rule_set_versions_request ->
        (put_managed_rule_set_versions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFLogDestinationPermissionIssueException of waf_log_destination_permission_issue_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFServiceLinkedRoleErrorException of waf_service_linked_role_error_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListResourcesForWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_for_web_acl_request ->
        (list_resources_for_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListMobileSdkReleases : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_sdk_releases_request ->
        (list_mobile_sdk_releases_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListManagedRuleSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_managed_rule_sets_request ->
        (list_managed_rule_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListAvailableManagedRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_managed_rule_groups_request ->
        (list_available_managed_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListAvailableManagedRuleGroupVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_managed_rule_group_versions_request ->
        (list_available_managed_rule_group_versions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module ListAPIKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      list_api_keys_request ->
        (list_api_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            
        ]
      ) result
end

module GetWebACLForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_for_resource_request ->
        (get_web_acl_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRateBasedStatementManagedKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_statement_managed_keys_request ->
        (get_rate_based_statement_managed_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFUnsupportedAggregateKeyTypeException of waf_unsupported_aggregate_key_type_exception
            
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
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetMobileSdkRelease : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_sdk_release_request ->
        (get_mobile_sdk_release_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetManagedRuleSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_managed_rule_set_request ->
        (get_managed_rule_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetDecryptedAPIKey : sig
  val request :
    Smaws_Lib.Context.t ->
      get_decrypted_api_key_request ->
        (get_decrypted_api_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GenerateMobileSdkReleaseUrl : sig
  val request :
    Smaws_Lib.Context.t ->
      generate_mobile_sdk_release_url_request ->
        (generate_mobile_sdk_release_url_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module DisassociateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_web_acl_request ->
        (disassociate_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module DescribeManagedRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_managed_rule_group_request ->
        (describe_managed_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFExpiredManagedRuleGroupVersionException of waf_expired_managed_rule_group_version_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module DescribeManagedProductsByVendor : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_managed_products_by_vendor_request ->
        (describe_managed_products_by_vendor_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module DescribeAllManagedProducts : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_all_managed_products_request ->
        (describe_all_managed_products_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module DeleteWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_web_acl_request ->
        (delete_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFAssociatedItemException of waf_associated_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_group_request ->
        (delete_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFAssociatedItemException of waf_associated_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `WAFAssociatedItemException of waf_associated_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
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
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module DeleteIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ip_set_request ->
        (delete_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFAssociatedItemException of waf_associated_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteFirewallManagerRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_firewall_manager_rule_groups_request ->
        (delete_firewall_manager_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module DeleteAPIKey : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_api_key_request ->
        (delete_api_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module CreateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_request ->
        (create_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFConfigurationWarningException of waf_configuration_warning_exception
            | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFExpiredManagedRuleGroupVersionException of waf_expired_managed_rule_group_version_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module CreateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_group_request ->
        (create_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module CreateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_pattern_set_request ->
        (create_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateAPIKey : sig
  val request :
    Smaws_Lib.Context.t ->
      create_api_key_request ->
        (create_api_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            
        ]
      ) result
end

module CheckCapacity : sig
  val request :
    Smaws_Lib.Context.t ->
      check_capacity_request ->
        (check_capacity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFExpiredManagedRuleGroupVersionException of waf_expired_managed_rule_group_version_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module AssociateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_web_acl_request ->
        (associate_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

