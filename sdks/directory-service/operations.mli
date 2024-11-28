open Types 
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
  (** 
    Accepts a directory sharing request that was sent from the directory owner account.
     *)

  
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
  (** 
    If the DNS server for your self-managed domain uses a publicly addressable IP address, you must add a CIDR address block to correctly route traffic to and from your Microsoft AD on Amazon Web Services. {i AddIpRoutes} adds this address block. You can also use {i AddIpRoutes} to facilitate routing traffic that uses public IP ranges from your Microsoft AD on Amazon Web Services to a peer VPC.
    
     Before you call {i AddIpRoutes}, ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the {i AddIpRoutes} operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
      *)

  
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
  (** 
    Adds two domain controllers in the specified Region for the specified directory.
     *)

  
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
  (** 
    Adds or overwrites one or more tags for the specified directory. Each directory can have a maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique to each resource.
     *)

  
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
  (** 
    Cancels an in-progress schema extension to a Microsoft AD directory. Once a schema extension has started replicating to all domain controllers, the task can no longer be canceled. A schema extension can be canceled during any of the following states; [Initializing], [CreatingSnapshot], and [UpdatingSchema].
     *)

  
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
  (** 
    Creates an AD Connector to connect to a self-managed directory.
    
     Before you call [ConnectDirectory], ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the [ConnectDirectory] operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
      *)

  
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
  (** 
    Creates an alias for a directory and assigns the alias to the directory. The alias is used to construct the access URL for the directory, such as 
    {[
    http://.awsapps.com
    ]}
    .
    
     After an alias has been created, it cannot be deleted or reused, so this operation should only be used when absolutely necessary.
     
      *)

  
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
  (** 
    Creates an Active Directory computer object in the specified directory.
     *)

  
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
  (** 
    Creates a conditional forwarder associated with your Amazon Web Services directory. Conditional forwarders are required in order to set up a trust relationship with another domain. The conditional forwarder points to the trusted domain.
     *)

  
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
  (** 
    Creates a Simple AD directory. For more information, see {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_simple_ad.html}Simple Active Directory} in the {i Directory Service Admin Guide}.
    
     Before you call [CreateDirectory], ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the [CreateDirectory] operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
      *)

  
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
  (** 
    Creates a subscription to forward real-time Directory Service domain controller security logs to the specified Amazon CloudWatch log group in your Amazon Web Services account.
     *)

  
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
  (** 
    Creates a Microsoft AD directory in the Amazon Web Services Cloud. For more information, see {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html}Managed Microsoft AD} in the {i Directory Service Admin Guide}.
    
     Before you call {i CreateMicrosoftAD}, ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the {i CreateMicrosoftAD} operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
      *)

  
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
  (** 
    Creates a snapshot of a Simple AD or Microsoft AD directory in the Amazon Web Services cloud.
    
     You cannot take snapshots of AD Connector directories.
     
      *)

  
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
  (** 
    Directory Service for Microsoft Active Directory allows you to configure trust relationships. For example, you can establish a trust between your Managed Microsoft AD directory, and your existing self-managed Microsoft Active Directory. This would allow you to provide users and groups access to resources in either domain, with a single set of credentials.
    
     This action initiates the creation of the Amazon Web Services side of a trust relationship between an Managed Microsoft AD directory and an external domain. You can create either a forest trust or an external trust.
      *)

  
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
  (** 
    Deletes a conditional forwarder that has been set up for your Amazon Web Services directory.
     *)

  
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
  (** 
    Deletes an Directory Service directory.
    
     Before you call [DeleteDirectory], ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the [DeleteDirectory] operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
      *)

  
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
  (** 
    Deletes the specified log subscription.
     *)

  
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
  (** 
    Deletes a directory snapshot.
     *)

  
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
  (** 
    Deletes an existing trust relationship between your Managed Microsoft AD directory and an external domain.
     *)

  
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
  (** 
    Deletes from the system the certificate that was registered for secure LDAP or client certificate authentication.
     *)

  
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
  (** 
    Removes the specified directory as a publisher to the specified Amazon SNS topic.
     *)

  
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
  (** 
    Displays information about the certificate registered for secure LDAP or client certificate authentication.
     *)

  
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
  (** 
    Retrieves information about the type of client authentication for the specified directory, if the type is specified. If no type is specified, information about all client authentication types that are supported for the specified directory is retrieved. Currently, only [SmartCard] is supported.
     *)

  
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
  (** 
    Obtains information about the conditional forwarders for this account.
    
     If no input parameters are provided for RemoteDomainNames, this request describes all conditional forwarders for the specified directory ID.
      *)

  
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
  (** 
    Obtains information about the directories that belong to this account.
    
     You can retrieve information about specific directories by passing the directory identifiers in the [DirectoryIds] parameter. Otherwise, all directories that belong to the current account are returned.
     
      This operation supports pagination with the use of the [NextToken] request and response parameters. If more results are available, the [DescribeDirectoriesResult.NextToken] member contains a token that you pass in the next call to [DescribeDirectories] to retrieve the next set of items.
      
       You can also specify a maximum number of return results with the [Limit] parameter.
        *)

  
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
  (** 
    Provides information about any domain controllers in your directory.
     *)

  
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
  (** 
    Obtains information about which Amazon SNS topics receive status messages from the specified directory.
    
     If no input parameters are provided, such as DirectoryId or TopicName, this request describes all of the associations in the account.
      *)

  
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
  (** 
    Describes the status of LDAP security for the specified directory.
     *)

  
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
  (** 
    Provides information about the Regions that are configured for multi-Region replication.
     *)

  
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
  (** 
    Retrieves information about the configurable settings for the specified directory.
     *)

  
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
  (** 
    Returns the shared directories in your account.
     *)

  
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
  (** 
    Obtains information about the directory snapshots that belong to this account.
    
     This operation supports pagination with the use of the {i NextToken} request and response parameters. If more results are available, the {i DescribeSnapshots.NextToken} member contains a token that you pass in the next call to [DescribeSnapshots] to retrieve the next set of items.
     
      You can also specify a maximum number of return results with the {i Limit} parameter.
       *)

  
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
  (** 
    Obtains information about the trust relationships for this account.
    
     If no input parameters are provided, such as DirectoryId or TrustIds, this request describes all the trust relationships belonging to the account.
      *)

  
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
  (** 
    Describes the updates of a directory for a particular update type.
     *)

  
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
  (** 
    Disables alternative client authentication methods for the specified directory.
     *)

  
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
  (** 
    Deactivates LDAP secure calls for the specified directory.
     *)

  
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
  (** 
    Disables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD directory.
     *)

  
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
  (** 
    Disables single-sign on for a directory.
     *)

  
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
  (** 
    Enables alternative client authentication methods for the specified directory.
     *)

  
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
  (** 
    Activates the switch for the specific directory to always use LDAP secure calls.
     *)

  
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
  (** 
    Enables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD directory.
     *)

  
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
  (** 
    Enables single sign-on for a directory. Single sign-on allows users in your directory to access certain Amazon Web Services services from a computer joined to the directory without having to enter their credentials separately.
     *)

  
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
  (** 
    Obtains directory limit information for the current Region.
     *)

  
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
  (** 
    Obtains the manual snapshot limits for a directory.
     *)

  
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
  (** 
    For the specified directory, lists all the certificates registered for a secure LDAP or client certificate authentication.
     *)

  
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
  (** 
    Lists the address blocks that you have added to a directory.
     *)

  
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
  (** 
    Lists the active log subscriptions for the Amazon Web Services account.
     *)

  
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
  (** 
    Lists all schema extensions applied to a Microsoft AD Directory.
     *)

  
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
  (** 
    Lists all tags on a directory.
     *)

  
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
  (** 
    Registers a certificate for a secure LDAP or client certificate authentication.
     *)

  
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
  (** 
    Associates a directory with an Amazon SNS topic. This establishes the directory as a publisher to the specified Amazon SNS topic. You can then receive email or text (SMS) messages when the status of your directory changes. You get notified if your directory goes from an Active status to an Impaired or Inoperable status. You also receive a notification when the directory returns to an Active status.
     *)

  
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
  (** 
    Rejects a directory sharing request that was sent from the directory owner account.
     *)

  
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
  (** 
    Removes IP address blocks from a directory.
     *)

  
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
  (** 
    Stops all replication and removes the domain controllers from the specified Region. You cannot remove the primary Region with this operation. Instead, use the [DeleteDirectory] API.
     *)

  
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
  (** 
    Removes tags from a directory.
     *)

  
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
  (** 
    Resets the password for any user in your Managed Microsoft AD or Simple AD directory.
    
     You can reset the password for any user in your directory with the following exceptions:
     
      {ul
           {- For Simple AD, you cannot reset the password for any user that is a member of either the {b Domain Admins} or {b Enterprise Admins} group except for the administrator user.
              
              }
            {- For Managed Microsoft AD, you can only reset the password for a user that is in an OU based off of the NetBIOS name that you typed when you created your directory. For example, you cannot reset the password for a user in the {b Amazon Web Services Reserved} OU. For more information about the OU structure for an Managed Microsoft AD directory, see {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_getting_started_what_gets_created.html}What Gets Created} in the {i Directory Service Administration Guide}.
               
               }
           
      }
       *)

  
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
  (** 
    Restores a directory using an existing directory snapshot.
    
     When you restore a directory from a snapshot, any changes made to the directory after the snapshot date are overwritten.
     
      This action returns as soon as the restore operation is initiated. You can monitor the progress of the restore operation by calling the [DescribeDirectories] operation with the directory identifier. When the {b DirectoryDescription.Stage} value changes to [Active], the restore operation is complete.
       *)

  
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
  (** 
    Shares a specified directory ([DirectoryId]) in your Amazon Web Services account (directory owner) with another Amazon Web Services account (directory consumer). With this operation you can use your directory from any Amazon Web Services account and from any Amazon VPC within an Amazon Web Services Region.
    
     When you share your Managed Microsoft AD directory, Directory Service creates a shared directory in the directory consumer account. This shared directory contains the metadata to provide access to the directory within the directory owner account. The shared directory is visible in all VPCs in the directory consumer account.
     
      The [ShareMethod] parameter determines whether the specified directory can be shared between Amazon Web Services accounts inside the same Amazon Web Services organization ([ORGANIZATIONS]). It also determines whether you can share the directory with any other Amazon Web Services account either inside or outside of the organization ([HANDSHAKE]).
      
       The [ShareNotes] parameter is only used when [HANDSHAKE] is called, which sends a directory sharing request to the directory consumer.
        *)

  
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
  (** 
    Applies a schema extension to a Microsoft AD directory.
     *)

  
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
  (** 
    Stops the directory sharing between the directory owner and consumer accounts.
     *)

  
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
  (** 
    Updates a conditional forwarder that has been set up for your Amazon Web Services directory.
     *)

  
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
  (** 
    Updates the directory for a particular update type.
     *)

  
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
  (** 
    Adds or removes domain controllers to or from the directory. Based on the difference between current value and new value (provided through this API call), domain controllers will be added or removed. It may take up to 45 minutes for any new domain controllers to become fully active once the requested number of domain controllers is updated. During this time, you cannot make another update request.
     *)

  
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
  (** 
    Updates the Remote Authentication Dial In User Service (RADIUS) server information for an AD Connector or Microsoft AD directory.
     *)

  
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
  (** 
    Updates the configurable settings for the specified directory.
     *)

  
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
  (** 
    Updates the trust that has been set up between your Managed Microsoft AD directory and an self-managed Active Directory.
     *)

  
end

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
  (** 
    Directory Service for Microsoft Active Directory allows you to configure and verify trust relationships.
    
     This action verifies a trust relationship between your Managed Microsoft AD directory and an external domain.
      *)

  
end

