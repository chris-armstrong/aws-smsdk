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
  (** 
    Adds a member (user or group) to the resource's set of delegates.
     *)

  
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
  (** 
    Adds a member (user or group) to the group's set.
     *)

  
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
  (** 
    Assumes an impersonation role for the given WorkMail organization. This method returns an authentication token you can use to make impersonated calls.
     *)

  
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
  (** 
    Cancels a mailbox export job.
    
     If the mailbox export job is near completion, it might not be possible to cancel it.
     
      *)

  
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
  (** 
    Adds an alias to the set of a given member (user or group) of WorkMail.
     *)

  
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
  (** 
    Creates an [AvailabilityConfiguration] for the given WorkMail organization and domain.
     *)

  
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
  (** 
    Creates a group that can be used in WorkMail by calling the [RegisterToWorkMail] operation.
     *)

  
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
  (** 
    Creates an impersonation role for the given WorkMail organization.
    
     {i Idempotency} ensures that an API request completes no more than one time. With an idempotent request, if the original request completes successfully, any subsequent retries also complete successfully without performing any further actions.
      *)

  
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
  (** 
    Creates a new mobile device access rule for the specified WorkMail organization.
     *)

  
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
  (** 
    Creates a new WorkMail organization. Optionally, you can choose to associate an existing AWS Directory Service directory with your organization. If an AWS Directory Service directory ID is specified, the organization alias must match the directory alias. If you choose not to associate an existing directory with your organization, then we create a new WorkMail directory for you. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_new_organization.html}Adding an organization} in the {i WorkMail Administrator Guide}.
    
     You can associate multiple email domains with an organization, then choose your default email domain from the WorkMail console. You can also associate a domain that is managed in an Amazon Route 53 public hosted zone. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html}Adding a domain} and {{:https://docs.aws.amazon.com/workmail/latest/adminguide/default_domain.html}Choosing the default domain} in the {i WorkMail Administrator Guide}.
     
      Optionally, you can use a customer managed key from AWS Key Management Service (AWS KMS) to encrypt email for your organization. If you don't associate an AWS KMS key, WorkMail creates a default, AWS managed key for you.
       *)

  
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
  (** 
    Creates a new WorkMail resource.
     *)

  
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
  (** 
    Creates a user who can be used in WorkMail by calling the [RegisterToWorkMail] operation.
     *)

  
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
  (** 
    Deletes an access control rule for the specified WorkMail organization.
    
     Deleting already deleted and non-existing rules does not produce an error. In those cases, the service sends back an HTTP 200 response with an empty HTTP body.
     
      *)

  
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
  (** 
    Remove one or more specified aliases from a set of aliases for a given user.
     *)

  
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
  (** 
    Deletes the [AvailabilityConfiguration] for the given WorkMail organization and domain.
     *)

  
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
  (** 
    Deletes the email monitoring configuration for a specified organization.
     *)

  
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
  (** 
    Deletes a group from WorkMail.
     *)

  
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
  (** 
    Deletes an impersonation role for the given WorkMail organization.
     *)

  
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
  (** 
    Deletes permissions granted to a member (user or group).
     *)

  
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
  (** 
    Deletes the mobile device access override for the given WorkMail organization, user, and device.
    
     Deleting already deleted and non-existing overrides does not produce an error. In those cases, the service sends back an HTTP 200 response with an empty HTTP body.
     
      *)

  
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
  (** 
    Deletes a mobile device access rule for the specified WorkMail organization.
    
     Deleting already deleted and non-existing rules does not produce an error. In those cases, the service sends back an HTTP 200 response with an empty HTTP body.
     
      *)

  
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
  (** 
    Deletes an WorkMail organization and all underlying AWS resources managed by WorkMail as part of the organization. You can choose whether to delete the associated directory. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/remove_organization.html}Removing an organization} in the {i WorkMail Administrator Guide}.
     *)

  
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
  (** 
    Deletes the specified resource.
     *)

  
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
  (** 
    Deletes the specified retention policy from the specified organization.
     *)

  
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
  (** 
    Deletes a user from WorkMail and all subsequent systems. Before you can delete a user, the user state must be [DISABLED]. Use the [DescribeUser] action to confirm the user state.
    
     Deleting a user is permanent and cannot be undone. WorkMail archives user mailboxes for 30 days before they are permanently removed.
      *)

  
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
  (** 
    Mark a user, group, or resource as no longer used in WorkMail. This action disassociates the mailbox and schedules it for clean-up. WorkMail keeps mailboxes for 30 days before they are permanently removed. The functionality in the console is {i Disable}.
     *)

  
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
  (** 
    Removes a domain from WorkMail, stops email routing to WorkMail, and removes the authorization allowing WorkMail use. SES keeps the domain because other applications may use it. You must first remove any email address used by WorkMail entities before you remove the domain.
     *)

  
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
  (** 
    Describes the current email monitoring configuration for a specified organization.
     *)

  
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
  (** 
    Returns basic details about an entity in WorkMail.
     *)

  
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
  (** 
    Returns the data available for the group.
     *)

  
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
  (** 
    Lists the settings in a DMARC policy for a specified organization.
     *)

  
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
  (** 
    Describes the current status of a mailbox export job.
     *)

  
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
  (** 
    Provides more information regarding a given organization based on its identifier.
     *)

  
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
  (** 
    Returns the data available for the resource.
     *)

  
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
  (** 
    Provides information regarding the user.
     *)

  
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
  (** 
    Removes a member from the resource's set of delegates.
     *)

  
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
  (** 
    Removes a member from a group.
     *)

  
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
  (** 
    Gets the effects of an organization's access control rules as they apply to a specified IPv4 address, access protocol action, and user ID or impersonation role ID. You must provide either the user ID or impersonation role ID. Impersonation role ID can only be used with Action EWS.
     *)

  
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
  (** 
    Gets the default retention policy details for the specified organization.
     *)

  
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
  (** 
    Gets the impersonation role details for the given WorkMail organization.
     *)

  
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
  (** 
    Tests whether the given impersonation role can impersonate a target user.
     *)

  
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
  (** 
    Requests a user's mailbox details for a specified organization and user.
     *)

  
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
  (** 
    Gets details for a mail domain, including domain records required to configure your domain with recommended security.
     *)

  
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
  (** 
    Simulates the effect of the mobile device access rules for the given attributes of a sample access event. Use this method to test the effects of the current set of mobile device access rules for the WorkMail organization for a particular user's attributes.
     *)

  
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
  (** 
    Gets the mobile device access override for the given WorkMail organization, user, and device.
     *)

  
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
  (** 
    Lists the access control rules for the specified organization.
     *)

  
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
  (** 
    Creates a paginated call to list the aliases associated with a given entity.
     *)

  
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
  (** 
    List all the [AvailabilityConfiguration]'s for the given WorkMail organization.
     *)

  
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
  (** 
    Returns an overview of the members of a group. Users and groups can be members of a group.
     *)

  
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
  (** 
    Returns summaries of the organization's groups.
     *)

  
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
  (** 
    Returns all the groups to which an entity belongs.
     *)

  
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
  (** 
    Lists all the impersonation roles for the given WorkMail organization.
     *)

  
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
  (** 
    Lists the mailbox export jobs started for the specified organization within the last seven days.
     *)

  
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
  (** 
    Lists the mailbox permissions associated with a user, group, or resource mailbox.
     *)

  
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
  (** 
    Lists the mail domains in a given WorkMail organization.
     *)

  
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
  (** 
    Lists all the mobile device access overrides for any given combination of WorkMail organization, user, or device.
     *)

  
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
  (** 
    Lists the mobile device access rules for the specified WorkMail organization.
     *)

  
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
  (** 
    Returns summaries of the customer's organizations.
     *)

  
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
  (** 
    Lists the delegates associated with a resource. Users and groups can be resource delegates and answer requests on behalf of the resource.
     *)

  
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
  (** 
    Returns summaries of the organization's resources.
     *)

  
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
  (** 
    Lists the tags applied to an WorkMail organization resource.
     *)

  
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
  (** 
    Returns summaries of the organization's users.
     *)

  
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
  (** 
    Adds a new access control rule for the specified organization. The rule allows or denies access to the organization for the specified IPv4 addresses, access protocol actions, user IDs and impersonation IDs. Adding a new rule with the same name as an existing rule replaces the older rule.
     *)

  
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
  (** 
    Creates or updates the email monitoring configuration for a specified organization.
     *)

  
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
  (** 
    Enables or disables a DMARC policy for a given organization.
     *)

  
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
  (** 
    Sets permissions for a user, group, or resource. This replaces any pre-existing permissions.
     *)

  
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
  (** 
    Creates or updates a mobile device access override for the given WorkMail organization, user, and device.
     *)

  
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
  (** 
    Puts a retention policy to the specified organization.
     *)

  
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
  (** 
    Registers a new domain in WorkMail and SES, and configures it for use by WorkMail. Emails received by SES for this domain are routed to the specified WorkMail organization, and WorkMail has permanent permission to use the specified domain for sending your users' emails.
     *)

  
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
  (** 
    Registers an existing and disabled user, group, or resource for WorkMail use by associating a mailbox and calendaring capabilities. It performs no change if the user, group, or resource is enabled and fails if the user, group, or resource is deleted. This operation results in the accumulation of costs. For more information, see {{:https://aws.amazon.com/workmail/pricing}Pricing}. The equivalent console functionality for this operation is {i Enable}.
    
     Users can either be created by calling the [CreateUser] API operation or they can be synchronized from your directory. For more information, see [DeregisterFromWorkMail].
      *)

  
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
  (** 
    Allows the administrator to reset the password for a user.
     *)

  
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
  (** 
    Starts a mailbox export job to export MIME-format email messages and calendar items from the specified mailbox to the specified Amazon Simple Storage Service (Amazon S3) bucket. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/mail-export.html}Exporting mailbox content} in the {i WorkMail Administrator Guide}.
     *)

  
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
  (** 
    Applies the specified tags to the specified WorkMailorganization resource.
     *)

  
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
  (** 
    Performs a test on an availability provider to ensure that access is allowed. For EWS, it verifies the provided credentials can be used to successfully log in. For Lambda, it verifies that the Lambda function can be invoked and that the resource access policy was configured to deny anonymous access. An anonymous invocation is one done without providing either a [SourceArn] or [SourceAccount] header.
    
     The request must contain either one provider definition ([EwsProvider] or [LambdaProvider]) or the [DomainName] parameter. If the [DomainName] parameter is provided, the configuration stored under the [DomainName] will be tested.
     
      *)

  
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
  (** 
    Untags the specified tags from the specified WorkMail organization resource.
     *)

  
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
  (** 
    Updates an existing [AvailabilityConfiguration] for the given WorkMail organization and domain.
     *)

  
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
  (** 
    Updates the default mail domain for an organization. The default mail domain is used by the WorkMail AWS Console to suggest an email address when enabling a mail user. You can only have one default domain.
     *)

  
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
  (** 
    Updates attibutes in a group.
     *)

  
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
  (** 
    Updates an impersonation role for the given WorkMail organization.
     *)

  
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
  (** 
    Updates a user's current mailbox quota for a specified organization and user.
     *)

  
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
  (** 
    Updates a mobile device access rule for the specified WorkMail organization.
     *)

  
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
  (** 
    Updates the primary email for a user, group, or resource. The current email is moved into the list of aliases (or swapped between an existing alias and the current primary email), and the email provided in the input is promoted as the primary.
     *)

  
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
  (** 
    Updates data for the resource. To have the latest information, it must be preceded by a [DescribeResource] call. The dataset in the request should be the one expected when performing another [DescribeResource] call.
     *)

  
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
  (** 
    Updates data for the user. To have the latest information, it must be preceded by a [DescribeUser] call. The dataset in the request should be the one expected when performing another [DescribeUser] call.
     *)

  
end

