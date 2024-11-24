open Types 
module AssociateDelegateToResource : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_delegate_to_resource_request ->
        (associate_delegate_to_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module AssociateMemberToGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_member_to_group_request ->
        (associate_member_to_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module AssumeImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      assume_impersonation_role_request ->
        (assume_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CancelMailboxExportJob : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_mailbox_export_job_request ->
        (cancel_mailbox_export_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CreateAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (create_alias_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CreateAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_availability_configuration_request ->
        (create_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CreateGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_group_request ->
        (create_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ReservedNameException of reserved_name_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      create_impersonation_role_request ->
        (create_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CreateMobileDeviceAccessRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_mobile_device_access_rule_request ->
        (create_mobile_device_access_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CreateOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      create_organization_request ->
        (create_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryInUseException of directory_in_use_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NameAvailabilityException of name_availability_exception
            
        ]
      ) result
end

module CreateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      create_resource_request ->
        (create_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ReservedNameException of reserved_name_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateUser : sig
  val request :
    Smaws_Lib.Context.t ->
      create_user_request ->
        (create_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidPasswordException of invalid_password_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ReservedNameException of reserved_name_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteAccessControlRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_control_rule_request ->
        (delete_access_control_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alias_request ->
        (delete_alias_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_availability_configuration_request ->
        (delete_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteEmailMonitoringConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_email_monitoring_configuration_request ->
        (delete_email_monitoring_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_group_request ->
        (delete_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_impersonation_role_request ->
        (delete_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteMailboxPermissions : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mailbox_permissions_request ->
        (delete_mailbox_permissions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteMobileDeviceAccessOverride : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mobile_device_access_override_request ->
        (delete_mobile_device_access_override_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteMobileDeviceAccessRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mobile_device_access_rule_request ->
        (delete_mobile_device_access_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_request ->
        (delete_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteResource : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_request ->
        (delete_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteRetentionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_retention_policy_request ->
        (delete_retention_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteUser : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_user_request ->
        (delete_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeregisterFromWorkMail : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_from_work_mail_request ->
        (deregister_from_work_mail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeregisterMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_mail_domain_request ->
        (deregister_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidCustomSesConfigurationException of invalid_custom_ses_configuration_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainInUseException of mail_domain_in_use_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeEmailMonitoringConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_email_monitoring_configuration_request ->
        (describe_email_monitoring_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEntity : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_entity_request ->
        (describe_entity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_group_request ->
        (describe_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeInboundDmarcSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_inbound_dmarc_settings_request ->
        (describe_inbound_dmarc_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeMailboxExportJob : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_mailbox_export_job_request ->
        (describe_mailbox_export_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_request ->
        (describe_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            
        ]
      ) result
end

module DescribeResource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_resource_request ->
        (describe_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeUser : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_user_request ->
        (describe_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DisassociateDelegateFromResource : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_delegate_from_resource_request ->
        (disassociate_delegate_from_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DisassociateMemberFromGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_member_from_group_request ->
        (disassociate_member_from_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module GetAccessControlEffect : sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_control_effect_request ->
        (get_access_control_effect_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetDefaultRetentionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_default_retention_policy_request ->
        (get_default_retention_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module GetImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      get_impersonation_role_request ->
        (get_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetImpersonationRoleEffect : sig
  val request :
    Smaws_Lib.Context.t ->
      get_impersonation_role_effect_request ->
        (get_impersonation_role_effect_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetMailboxDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mailbox_details_request ->
        (get_mailbox_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module GetMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mail_domain_request ->
        (get_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module GetMobileDeviceAccessEffect : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_device_access_effect_request ->
        (get_mobile_device_access_effect_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module GetMobileDeviceAccessOverride : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_device_access_override_request ->
        (get_mobile_device_access_override_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListAccessControlRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_control_rules_request ->
        (list_access_control_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListAliases : sig
  val request :
    Smaws_Lib.Context.t ->
      list_aliases_request ->
        (list_aliases_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListAvailabilityConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_availability_configurations_request ->
        (list_availability_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListGroupMembers : sig
  val request :
    Smaws_Lib.Context.t ->
      list_group_members_request ->
        (list_group_members_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_request ->
        (list_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListGroupsForEntity : sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_for_entity_request ->
        (list_groups_for_entity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListImpersonationRoles : sig
  val request :
    Smaws_Lib.Context.t ->
      list_impersonation_roles_request ->
        (list_impersonation_roles_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListMailboxExportJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mailbox_export_jobs_request ->
        (list_mailbox_export_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListMailboxPermissions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mailbox_permissions_request ->
        (list_mailbox_permissions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListMailDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mail_domains_request ->
        (list_mail_domains_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListMobileDeviceAccessOverrides : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_device_access_overrides_request ->
        (list_mobile_device_access_overrides_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListMobileDeviceAccessRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_device_access_rules_request ->
        (list_mobile_device_access_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListOrganizations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_organizations_request ->
        (list_organizations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            
        ]
      ) result
end

module ListResourceDelegates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_delegates_request ->
        (list_resource_delegates_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ListResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_request ->
        (list_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListUsers : sig
  val request :
    Smaws_Lib.Context.t ->
      list_users_request ->
        (list_users_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module PutAccessControlRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_access_control_rule_request ->
        (put_access_control_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutEmailMonitoringConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_email_monitoring_configuration_request ->
        (put_email_monitoring_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutInboundDmarcSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      put_inbound_dmarc_settings_request ->
        (put_inbound_dmarc_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module PutMailboxPermissions : sig
  val request :
    Smaws_Lib.Context.t ->
      put_mailbox_permissions_request ->
        (put_mailbox_permissions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module PutMobileDeviceAccessOverride : sig
  val request :
    Smaws_Lib.Context.t ->
      put_mobile_device_access_override_request ->
        (put_mobile_device_access_override_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module PutRetentionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_retention_policy_request ->
        (put_retention_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module RegisterMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      register_mail_domain_request ->
        (register_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `MailDomainInUseException of mail_domain_in_use_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module RegisterToWorkMail : sig
  val request :
    Smaws_Lib.Context.t ->
      register_to_work_mail_request ->
        (register_to_work_mail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityAlreadyRegisteredException of entity_already_registered_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ResetPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_password_request ->
        (reset_password_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidPasswordException of invalid_password_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module StartMailboxExportJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_mailbox_export_job_request ->
        (start_mailbox_export_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module TestAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      test_availability_configuration_request ->
        (test_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_availability_configuration_request ->
        (update_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateDefaultMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      update_default_mail_domain_request ->
        (update_default_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module UpdateGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_group_request ->
        (update_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      update_impersonation_role_request ->
        (update_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateMailboxQuota : sig
  val request :
    Smaws_Lib.Context.t ->
      update_mailbox_quota_request ->
        (update_mailbox_quota_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module UpdateMobileDeviceAccessRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_mobile_device_access_rule_request ->
        (update_mobile_device_access_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module UpdatePrimaryEmailAddress : sig
  val request :
    Smaws_Lib.Context.t ->
      update_primary_email_address_request ->
        (update_primary_email_address_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      update_resource_request ->
        (update_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryUnavailableException of directory_unavailable_exception
            | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidConfigurationException of invalid_configuration_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateUser : sig
  val request :
    Smaws_Lib.Context.t ->
      update_user_request ->
        (update_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

