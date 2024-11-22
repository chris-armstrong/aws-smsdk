open Types 
module VerifyTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      verify_trust_request ->
        (verify_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      update_trust_request ->
        (update_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module UpdateSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_settings_request ->
        (update_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `IncompatibleSettingsException of incompatible_settings_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            | `UnsupportedSettingsException of unsupported_settings_exception
            
        ]
      ) result
end

module UpdateRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      update_radius_request ->
        (update_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module UpdateNumberOfDomainControllers : sig
  val request :
    Smaws_Lib.Context.t ->
      update_number_of_domain_controllers_request ->
        (update_number_of_domain_controllers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateDirectorySetup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_directory_setup_request ->
        (update_directory_setup_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryInDesiredStateException of directory_in_desired_state_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      update_conditional_forwarder_request ->
        (update_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UnshareDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      unshare_directory_request ->
        (unshare_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryNotSharedException of directory_not_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidTargetException of invalid_target_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module StartSchemaExtension : sig
  val request :
    Smaws_Lib.Context.t ->
      start_schema_extension_request ->
        (start_schema_extension_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            
        ]
      ) result
end

module ShareDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      share_directory_request ->
        (share_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTargetException of invalid_target_exception
            | `OrganizationsException of organizations_exception
            | `ServiceException of service_exception
            | `ShareLimitExceededException of share_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module RestoreFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_from_snapshot_request ->
        (restore_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ResetUserPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_user_password_request ->
        (reset_user_password_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidPasswordException of invalid_password_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            | `UserDoesNotExistException of user_does_not_exist_exception
            
        ]
      ) result
end

module RemoveTagsFromResource : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_resource_request ->
        (remove_tags_from_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RemoveRegion : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_region_request ->
        (remove_region_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module RemoveIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_ip_routes_request ->
        (remove_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RejectSharedDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      reject_shared_directory_request ->
        (reject_shared_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RegisterEventTopic : sig
  val request :
    Smaws_Lib.Context.t ->
      register_event_topic_request ->
        (register_event_topic_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RegisterCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      register_certificate_request ->
        (register_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateAlreadyExistsException of certificate_already_exists_exception
            | `CertificateLimitExceededException of certificate_limit_exceeded_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidCertificateException of invalid_certificate_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListSchemaExtensions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_schema_extensions_request ->
        (list_schema_extensions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListLogSubscriptions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_log_subscriptions_request ->
        (list_log_subscriptions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_routes_request ->
        (list_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_certificates_request ->
        (list_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module GetSnapshotLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      get_snapshot_limits_request ->
        (get_snapshot_limits_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module GetDirectoryLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      get_directory_limits_request ->
        (get_directory_limits_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module EnableSso : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_sso_request ->
        (enable_sso_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module EnableRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_radius_request ->
        (enable_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module EnableLDAPS : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_ldaps_request ->
        (enable_ldaps_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoAvailableCertificateException of no_available_certificate_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module EnableClientAuthentication : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_client_authentication_request ->
        (enable_client_authentication_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
            | `NoAvailableCertificateException of no_available_certificate_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DisableSso : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_sso_request ->
        (disable_sso_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DisableRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_radius_request ->
        (disable_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DisableLDAPS : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_ldaps_request ->
        (disable_ldaps_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DisableClientAuthentication : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_client_authentication_request ->
        (disable_client_authentication_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeUpdateDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_update_directory_request ->
        (describe_update_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeTrusts : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_trusts_request ->
        (describe_trusts_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_snapshots_request ->
        (describe_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeSharedDirectories : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_shared_directories_request ->
        (describe_shared_directories_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_settings_request ->
        (describe_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeRegions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_regions_request ->
        (describe_regions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeLDAPSSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_ldaps_settings_request ->
        (describe_ldaps_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeEventTopics : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_topics_request ->
        (describe_event_topics_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeDomainControllers : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_domain_controllers_request ->
        (describe_domain_controllers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeDirectories : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_directories_request ->
        (describe_directories_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeConditionalForwarders : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conditional_forwarders_request ->
        (describe_conditional_forwarders_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeClientAuthenticationSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_client_authentication_settings_request ->
        (describe_client_authentication_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_certificate_request ->
        (describe_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateDoesNotExistException of certificate_does_not_exist_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeregisterEventTopic : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_event_topic_request ->
        (deregister_event_topic_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DeregisterCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_certificate_request ->
        (deregister_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateDoesNotExistException of certificate_does_not_exist_exception
            | `CertificateInUseException of certificate_in_use_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_trust_request ->
        (delete_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_snapshot_request ->
        (delete_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DeleteLogSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_log_subscription_request ->
        (delete_log_subscription_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_directory_request ->
        (delete_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DeleteConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_conditional_forwarder_request ->
        (delete_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      create_trust_request ->
        (create_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_snapshot_request ->
        (create_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            
        ]
      ) result
end

module CreateMicrosoftAD : sig
  val request :
    Smaws_Lib.Context.t ->
      create_microsoft_ad_request ->
        (create_microsoft_ad_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateLogSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      create_log_subscription_request ->
        (create_log_subscription_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      create_directory_request ->
        (create_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module CreateConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      create_conditional_forwarder_request ->
        (create_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateComputer : sig
  val request :
    Smaws_Lib.Context.t ->
      create_computer_request ->
        (create_computer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (create_alias_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ConnectDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      connect_directory_request ->
        (connect_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module CancelSchemaExtension : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_schema_extension_request ->
        (cancel_schema_extension_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module AddTagsToResource : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_resource_request ->
        (add_tags_to_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `TagLimitExceededException of tag_limit_exceeded_exception
            
        ]
      ) result
end

module AddRegion : sig
  val request :
    Smaws_Lib.Context.t ->
      add_region_request ->
        (add_region_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `RegionLimitExceededException of region_limit_exceeded_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module AddIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      add_ip_routes_request ->
        (add_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module AcceptSharedDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      accept_shared_directory_request ->
        (accept_shared_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

