open Types 
module AssociateAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateThirdPartyFirewall : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_third_party_firewall_request ->
        (associate_third_party_firewall_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module BatchAssociateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_associate_resource_request ->
        (batch_associate_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module BatchDisassociateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_disassociate_resource_request ->
        (batch_disassociate_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_apps_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_notification_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeletePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_policy_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protocols_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_set_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateThirdPartyFirewall : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_third_party_firewall_request ->
        (disassociate_third_party_firewall_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_account_request ->
        (get_admin_account_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetAdminScope : sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_scope_request ->
        (get_admin_scope_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      get_apps_list_request ->
        (get_apps_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetComplianceDetail : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_detail_request ->
        (get_compliance_detail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      get_notification_channel_request ->
        (get_notification_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_policy_request ->
        (get_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidTypeException of invalid_type_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetProtectionStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_protection_status_request ->
        (get_protection_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      get_protocols_list_request ->
        (get_protocols_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_set_request ->
        (get_resource_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetThirdPartyFirewallAssociationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_third_party_firewall_association_status_request ->
        (get_third_party_firewall_association_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetViolationDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_violation_details_request ->
        (get_violation_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListAdminAccountsForOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      list_admin_accounts_for_organization_request ->
        (list_admin_accounts_for_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListAdminsManagingAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      list_admins_managing_account_request ->
        (list_admins_managing_account_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListAppsLists : sig
  val request :
    Smaws_Lib.Context.t ->
      list_apps_lists_request ->
        (list_apps_lists_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListComplianceStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_status_request ->
        (list_compliance_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            
        ]
      ) result
end

module ListMemberAccounts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_member_accounts_request ->
        (list_member_accounts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_policies_request ->
        (list_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListProtocolsLists : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protocols_lists_request ->
        (list_protocols_lists_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListResourceSetResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_set_resources_request ->
        (list_resource_set_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListResourceSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_sets_request ->
        (list_resource_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListThirdPartyFirewallFirewallPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_third_party_firewall_firewall_policies_request ->
        (list_third_party_firewall_firewall_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      put_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module PutAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      put_apps_list_request ->
        (put_apps_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      put_notification_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_policy_request ->
        (put_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidTypeException of invalid_type_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      put_protocols_list_request ->
        (put_protocols_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_set_request ->
        (put_resource_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

