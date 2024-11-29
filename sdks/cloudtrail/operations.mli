open Types 
module AddTags : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_request ->
        (add_tags_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `TagsLimitExceededException of tags_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Adds one or more tags to a trail, event data store, or channel, up to a limit of 50. Overwrites an existing tag's value when a new value is specified for an existing tag key. Tag key names must be unique; you cannot have two keys with the same name but different values. If you specify a key without a value, the tag will be created with the specified key and a value of null. You can tag a trail or event data store that applies to all Amazon Web Services Regions only from the Region in which the trail or event data store was created (also known as its home Region).
     *)

  
end

module CancelQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_query_request ->
        (cancel_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InactiveQueryException of inactive_query_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `QueryIdNotFoundException of query_id_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Cancels a query if the query is not in a terminated state, such as [CANCELLED], [FAILED], [TIMED_OUT], or [FINISHED]. You must specify an ARN value for [EventDataStore]. The ID of the query that you want to cancel is also required. When you run [CancelQuery], the query status might show as [CANCELLED] even if the operation is not yet finished.
     *)

  
end

module CreateChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      create_channel_request ->
        (create_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelAlreadyExistsException of channel_already_exists_exception
            | `ChannelMaxLimitExceededException of channel_max_limit_exceeded_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidSourceException of invalid_source_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `TagsLimitExceededException of tags_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a channel for CloudTrail to ingest events from a partner or external source. After you create a channel, a CloudTrail Lake event data store can log events from the partner or source that you specify.
     *)

  
end

module CreateEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      create_event_data_store_request ->
        (create_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConflictException of conflict_exception
            | `EventDataStoreAlreadyExistsException of event_data_store_already_exists_exception
            | `EventDataStoreMaxLimitExceededException of event_data_store_max_limit_exceeded_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InvalidEventSelectorsException of invalid_event_selectors_exception
            | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `KmsException of kms_exception
            | `KmsKeyNotFoundException of kms_key_not_found_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a new event data store.
     *)

  
end

module CreateTrail : sig
  val request :
    Smaws_Lib.Context.t ->
      create_trail_request ->
        (create_trail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `CloudTrailInvalidClientTokenIdException of cloud_trail_invalid_client_token_id_exception
            | `CloudWatchLogsDeliveryUnavailableException of cloud_watch_logs_delivery_unavailable_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
            | `InsufficientSnsTopicPolicyException of insufficient_sns_topic_policy_exception
            | `InvalidCloudWatchLogsLogGroupArnException of invalid_cloud_watch_logs_log_group_arn_exception
            | `InvalidCloudWatchLogsRoleArnException of invalid_cloud_watch_logs_role_arn_exception
            | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception
            | `InvalidS3PrefixException of invalid_s3_prefix_exception
            | `InvalidSnsTopicNameException of invalid_sns_topic_name_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `KmsException of kms_exception
            | `KmsKeyDisabledException of kms_key_disabled_exception
            | `KmsKeyNotFoundException of kms_key_not_found_exception
            | `MaximumNumberOfTrailsExceededException of maximum_number_of_trails_exceeded_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
            | `TagsLimitExceededException of tags_limit_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `TrailAlreadyExistsException of trail_already_exists_exception
            | `TrailNotProvidedException of trail_not_provided_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a trail that specifies the settings for delivery of log data to an Amazon S3 bucket.
     *)

  
end

module DeleteChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_channel_request ->
        (delete_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Deletes a channel.
     *)

  
end

module DeleteEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_event_data_store_request ->
        (delete_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelExistsForEDSException of channel_exists_for_eds_exception
            | `ConflictException of conflict_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreFederationEnabledException of event_data_store_federation_enabled_exception
            | `EventDataStoreHasOngoingImportException of event_data_store_has_ongoing_import_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `EventDataStoreTerminationProtectedException of event_data_store_termination_protected_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Disables the event data store specified by [EventDataStore], which accepts an event data store ARN. After you run [DeleteEventDataStore], the event data store enters a [PENDING_DELETION] state, and is automatically deleted after a wait period of seven days. [TerminationProtectionEnabled] must be set to [False] on the event data store and the [FederationStatus] must be [DISABLED]. You cannot delete an event data store if [TerminationProtectionEnabled] is [True] or the [FederationStatus] is [ENABLED].
    
     After you run [DeleteEventDataStore] on an event data store, you cannot run [ListQueries], [DescribeQuery], or [GetQueryResults] on queries that are using an event data store in a [PENDING_DELETION] state. An event data store in the [PENDING_DELETION] state does not incur costs.
      *)

  
end

module DeleteResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_request ->
        (delete_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceARNNotValidException of resource_arn_not_valid_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Deletes the resource-based policy attached to the CloudTrail channel.
     *)

  
end

module DeleteTrail : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_trail_request ->
        (delete_trail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Deletes a trail. This operation must be called from the Region in which the trail was created. [DeleteTrail] cannot be called on the shadow trails (replicated trails in other Regions) of a trail that is enabled in all Regions.
     *)

  
end

module DeregisterOrganizationDelegatedAdmin : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_organization_delegated_admin_request ->
        (deregister_organization_delegated_admin_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccountNotFoundException of account_not_found_exception
            | `AccountNotRegisteredException of account_not_registered_exception
            | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotOrganizationManagementAccountException of not_organization_management_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Removes CloudTrail delegated administrator permissions from a member account in an organization.
     *)

  
end

module DescribeQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_query_request ->
        (describe_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `QueryIdNotFoundException of query_id_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns metadata about a query, including query run time in milliseconds, number of events scanned and matched, and query status. If the query results were delivered to an S3 bucket, the response also provides the S3 URI and the delivery status.
    
     You must specify either a [QueryID] or a [QueryAlias]. Specifying the [QueryAlias] parameter returns information about the last query run for the alias.
      *)

  
end

module DescribeTrails : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_trails_request ->
        (describe_trails_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Retrieves settings for one or more trails associated with the current Region for your account.
     *)

  
end

module DisableFederation : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_federation_request ->
        (disable_federation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Disables Lake query federation on the specified event data store. When you disable federation, CloudTrail disables the integration with Glue, Lake Formation, and Amazon Athena. After disabling Lake query federation, you can no longer query your event data in Amazon Athena.
    
     No CloudTrail Lake data is deleted when you disable federation and you can continue to run queries in CloudTrail Lake.
      *)

  
end

module EnableFederation : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_federation_request ->
        (enable_federation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreFederationEnabledException of event_data_store_federation_enabled_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Enables Lake query federation on the specified event data store. Federating an event data store lets you view the metadata associated with the event data store in the Glue {{:https://docs.aws.amazon.com/glue/latest/dg/components-overview.html#data-catalog-intro}Data Catalog} and run SQL queries against your event data using Amazon Athena. The table metadata stored in the Glue Data Catalog lets the Athena query engine know how to find, read, and process the data that you want to query.
    
     When you enable Lake query federation, CloudTrail creates a managed database named [aws:cloudtrail] (if the database doesn't already exist) and a managed federated table in the Glue Data Catalog. The event data store ID is used for the table name. CloudTrail registers the role ARN and event data store in {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation-lake-formation.html}Lake Formation}, the service responsible for allowing fine-grained access control of the federated resources in the Glue Data Catalog.
     
      For more information about Lake query federation, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html}Federate an event data store}.
       *)

  
end

module GetChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      get_channel_request ->
        (get_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about a specific channel.
     *)

  
end

module GetEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      get_event_data_store_request ->
        (get_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about an event data store specified as either an ARN or the ID portion of the ARN.
     *)

  
end

module GetEventSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
      get_event_selectors_request ->
        (get_event_selectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Describes the settings for the event selectors that you configured for your trail. The information returned for your event selectors includes the following:
    
     {ul
          {- If your event selector includes read-only events, write-only events, or all events. This applies to both management events and data events.
             
             }
           {- If your event selector includes management events.
              
              }
           {- If your event selector includes data events, the resources on which you are logging data events.
              
              }
          
      }
       For more information about logging management and data events, see the following topics in the {i CloudTrail User Guide}:
       
        {ul
             {- {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging management events}
                
                }
              {- {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events}
                 
                 }
             
      }
       *)

  
end

module GetImport : sig
  val request :
    Smaws_Lib.Context.t ->
      get_import_request ->
        (get_import_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ImportNotFoundException of import_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about a specific import.
     *)

  
end

module GetInsightSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
      get_insight_selectors_request ->
        (get_insight_selectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InsightNotEnabledException of insight_not_enabled_exception
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Describes the settings for the Insights event selectors that you configured for your trail or event data store. [GetInsightSelectors] shows if CloudTrail Insights event logging is enabled on the trail or event data store, and if it is, which Insights types are enabled. If you run [GetInsightSelectors] on a trail or event data store that does not have Insights events enabled, the operation throws the exception [InsightNotEnabledException]
    
     Specify either the [EventDataStore] parameter to get Insights event selectors for an event data store, or the [TrailName] parameter to the get Insights event selectors for a trail. You cannot specify these parameters together.
     
      For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Logging CloudTrail Insights events} in the {i CloudTrail User Guide}.
       *)

  
end

module GetQueryResults : sig
  val request :
    Smaws_Lib.Context.t ->
      get_query_results_request ->
        (get_query_results_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InvalidMaxResultsException of invalid_max_results_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `QueryIdNotFoundException of query_id_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Gets event data results of a query. You must specify the [QueryID] value returned by the [StartQuery] operation.
     *)

  
end

module GetResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policy_request ->
        (get_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceARNNotValidException of resource_arn_not_valid_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Retrieves the JSON text of the resource-based policy document attached to the CloudTrail channel.
     *)

  
end

module GetTrail : sig
  val request :
    Smaws_Lib.Context.t ->
      get_trail_request ->
        (get_trail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns settings information for a specified trail.
     *)

  
end

module GetTrailStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_trail_status_request ->
        (get_trail_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns a JSON-formatted list of information about the specified trail. Fields include information on delivery errors, Amazon SNS and Amazon S3 errors, and start and stop logging times for each trail. This operation returns trail status from a single Region. To return trail status from all Regions, you must call the operation on each Region.
     *)

  
end

module ListChannels : sig
  val request :
    Smaws_Lib.Context.t ->
      list_channels_request ->
        (list_channels_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists the channels in the current account, and their source names.
     *)

  
end

module ListEventDataStores : sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_data_stores_request ->
        (list_event_data_stores_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidMaxResultsException of invalid_max_results_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about all event data stores in the account, in the current Region.
     *)

  
end

module ListImportFailures : sig
  val request :
    Smaws_Lib.Context.t ->
      list_import_failures_request ->
        (list_import_failures_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns a list of failures for the specified import.
     *)

  
end

module ListImports : sig
  val request :
    Smaws_Lib.Context.t ->
      list_imports_request ->
        (list_imports_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information on all imports, or a select set of imports by [ImportStatus] or [Destination].
     *)

  
end

module ListInsightsMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      list_insights_metric_data_request ->
        (list_insights_metric_data_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns Insights metrics data for trails that have enabled Insights. The request must include the [EventSource], [EventName], and [InsightType] parameters.
    
     If the [InsightType] is set to [ApiErrorRateInsight], the request must also include the [ErrorCode] parameter.
     
      The following are the available time periods for [ListInsightsMetricData]. Each cutoff is inclusive.
      
       {ul
            {- Data points with a period of 60 seconds (1-minute) are available for 15 days.
               
               }
             {- Data points with a period of 300 seconds (5-minute) are available for 63 days.
                
                }
             {- Data points with a period of 3600 seconds (1 hour) are available for 90 days.
                
                }
            
      }
       Access to the [ListInsightsMetricData] API operation is linked to the [cloudtrail:LookupEvents] action. To use this operation, you must have permissions to perform the [cloudtrail:LookupEvents] action.
        *)

  
end

module ListPublicKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      list_public_keys_request ->
        (list_public_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidTimeRangeException of invalid_time_range_exception
            | `InvalidTokenException of invalid_token_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns all public keys whose private keys were used to sign the digest files within the specified time range. The public key is needed to validate digest files that were signed with its corresponding private key.
    
     CloudTrail uses different private and public key pairs per Region. Each digest file is signed with a private key unique to its Region. When you validate a digest file from a specific Region, you must look in the same Region for its corresponding public key.
     
      *)

  
end

module ListQueries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_queries_request ->
        (list_queries_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidDateRangeException of invalid_date_range_exception
            | `InvalidMaxResultsException of invalid_max_results_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidQueryStatusException of invalid_query_status_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns a list of queries and query statuses for the past seven days. You must specify an ARN value for [EventDataStore]. Optionally, to shorten the list of results, you can specify a time range, formatted as timestamps, by adding [StartTime] and [EndTime] parameters, and a [QueryStatus] value. Valid values for [QueryStatus] include [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED].
     *)

  
end

module ListTags : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_request ->
        (list_tags_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidTokenException of invalid_token_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists the tags for the specified trails, event data stores, or channels in the current Region.
     *)

  
end

module ListTrails : sig
  val request :
    Smaws_Lib.Context.t ->
      list_trails_request ->
        (list_trails_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists trails that are in the current account.
     *)

  
end

module LookupEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      lookup_events_request ->
        (lookup_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidEventCategoryException of invalid_event_category_exception
            | `InvalidLookupAttributesException of invalid_lookup_attributes_exception
            | `InvalidMaxResultsException of invalid_max_results_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidTimeRangeException of invalid_time_range_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Looks up {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-management-events}management events} or {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-insights-events}CloudTrail Insights events} that are captured by CloudTrail. You can look up events that occurred in a Region within the last 90 days.
    
     [LookupEvents] returns recent Insights events for trails that enable Insights. To view Insights events for an event data store, you can run queries on your Insights event data store, and you can also view the Lake dashboard for Insights.
     
      Lookup supports the following attributes for management events:
      
       {ul
            {- Amazon Web Services access key
               
               }
             {- Event ID
                
                }
             {- Event name
                
                }
             {- Event source
                
                }
             {- Read only
                
                }
             {- Resource name
                
                }
             {- Resource type
                
                }
             {- User name
                
                }
            
      }
       Lookup supports the following attributes for Insights events:
       
        {ul
             {- Event ID
                
                }
              {- Event name
                 
                 }
              {- Event source
                 
                 }
             
      }
       All attributes are optional. The default number of results returned is 50, with a maximum of 50 possible. The response includes a token that you can use to get the next page of results.
       
        The rate of lookup requests is limited to two per second, per account, per Region. If this limit is exceeded, a throttling error occurs.
        
         *)

  
end

module PutEventSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
      put_event_selectors_request ->
        (put_event_selectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidEventSelectorsException of invalid_event_selectors_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Configures an event selector or advanced event selectors for your trail. Use event selectors or advanced event selectors to specify management and data event settings for your trail. If you want your trail to log Insights events, be sure the event selector enables logging of the Insights event types you want configured for your trail. For more information about logging Insights events, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Logging Insights events} in the {i CloudTrail User Guide}. By default, trails created without specific event selectors are configured to log all read and write management events, and no data events.
    
     When an event occurs in your account, CloudTrail evaluates the event selectors or advanced event selectors in all trails. For each trail, if the event matches any event selector, the trail processes and logs the event. If the event doesn't match any event selector, the trail doesn't log the event.
     
      Example
      
       {ol
            {- You create an event selector for a trail and specify that you want write-only events.
               
               }
             {- The EC2 [GetConsoleOutput] and [RunInstances] API operations occur in your account.
                
                }
             {- CloudTrail evaluates whether the events match your event selectors.
                
                }
             {- The [RunInstances] is a write-only event and it matches your event selector. The trail logs the event.
                
                }
             {- The [GetConsoleOutput] is a read-only event that doesn't match your event selector. The trail doesn't log the event.
                
                }
            
      }
       The [PutEventSelectors] operation must be called from the Region in which the trail was created; otherwise, an [InvalidHomeRegionException] exception is thrown.
       
        You can configure up to five event selectors for each trail. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging management events}, {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events}, and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html}Quotas in CloudTrail} in the {i CloudTrail User Guide}.
        
         You can add advanced event selectors, and conditions for your advanced event selectors, up to a maximum of 500 values for all conditions and selectors on a trail. You can use either [AdvancedEventSelectors] or [EventSelectors], but not both. If you apply [AdvancedEventSelectors] to a trail, any existing [EventSelectors] are overwritten. For more information about advanced event selectors, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events} in the {i CloudTrail User Guide}.
          *)

  
end

module PutInsightSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
      put_insight_selectors_request ->
        (put_insight_selectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidInsightSelectorsException of invalid_insight_selectors_exception
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `KmsException of kms_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lets you enable Insights event logging by specifying the Insights selectors that you want to enable on an existing trail or event data store. You also use [PutInsightSelectors] to turn off Insights event logging, by passing an empty list of Insights types. The valid Insights event types are [ApiErrorRateInsight] and [ApiCallRateInsight].
    
     To enable Insights on an event data store, you must specify the ARNs (or ID suffix of the ARNs) for the source event data store ([EventDataStore]) and the destination event data store ([InsightsDestination]). The source event data store logs management events and enables Insights. The destination event data store logs Insights events based upon the management event activity of the source event data store. The source and destination event data stores must belong to the same Amazon Web Services account.
     
      To log Insights events for a trail, you must specify the name ([TrailName]) of the CloudTrail trail for which you want to change or add Insights selectors.
      
       To log CloudTrail Insights events on API call volume, the trail or event data store must log [write] management events. To log CloudTrail Insights events on API error rate, the trail or event data store must log [read] or [write] management events. You can call [GetEventSelectors] on a trail to check whether the trail logs management events. You can call [GetEventDataStore] on an event data store to check whether the event data store logs management events.
       
        For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Logging CloudTrail Insights events} in the {i CloudTrail User Guide}.
         *)

  
end

module PutResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_request ->
        (put_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceARNNotValidException of resource_arn_not_valid_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyNotValidException of resource_policy_not_valid_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Attaches a resource-based permission policy to a CloudTrail channel that is used for an integration with an event source outside of Amazon Web Services. For more information about resource-based policies, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html}CloudTrail resource-based policy examples} in the {i CloudTrail User Guide}.
     *)

  
end

module RegisterOrganizationDelegatedAdmin : sig
  val request :
    Smaws_Lib.Context.t ->
      register_organization_delegated_admin_request ->
        (register_organization_delegated_admin_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccountNotFoundException of account_not_found_exception
            | `AccountRegisteredException of account_registered_exception
            | `CannotDelegateManagementAccountException of cannot_delegate_management_account_exception
            | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConflictException of conflict_exception
            | `DelegatedAdminAccountLimitExceededException of delegated_admin_account_limit_exceeded_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotOrganizationManagementAccountException of not_organization_management_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Registers an organization’s member account as the CloudTrail {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-delegated-administrator.html}delegated administrator}.
     *)

  
end

module RemoveTags : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_request ->
        (remove_tags_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Removes the specified tags from a trail, event data store, or channel.
     *)

  
end

module RestoreEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_event_data_store_request ->
        (restore_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreMaxLimitExceededException of event_data_store_max_limit_exceeded_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Restores a deleted event data store specified by [EventDataStore], which accepts an event data store ARN. You can only restore a deleted event data store within the seven-day wait period after deletion. Restoring an event data store can take several minutes, depending on the size of the event data store.
     *)

  
end

module StartEventDataStoreIngestion : sig
  val request :
    Smaws_Lib.Context.t ->
      start_event_data_store_ingestion_request ->
        (start_event_data_store_ingestion_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Starts the ingestion of live events on an event data store specified as either an ARN or the ID portion of the ARN. To start ingestion, the event data store [Status] must be [STOPPED_INGESTION] and the [eventCategory] must be [Management], [Data], or [ConfigurationItem].
     *)

  
end

module StartImport : sig
  val request :
    Smaws_Lib.Context.t ->
      start_import_request ->
        (start_import_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccountHasOngoingImportException of account_has_ongoing_import_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `ImportNotFoundException of import_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
            | `InvalidImportSourceException of invalid_import_source_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Starts an import of logged trail events from a source S3 bucket to a destination event data store. By default, CloudTrail only imports events contained in the S3 bucket's [CloudTrail] prefix and the prefixes inside the [CloudTrail] prefix, and does not check prefixes for other Amazon Web Services services. If you want to import CloudTrail events contained in another prefix, you must include the prefix in the [S3LocationUri]. For more considerations about importing trail events, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-copy-trail-to-lake.html#cloudtrail-trail-copy-considerations}Considerations for copying trail events} in the {i CloudTrail User Guide}.
    
     When you start a new import, the [Destinations] and [ImportSource] parameters are required. Before starting a new import, disable any access control lists (ACLs) attached to the source S3 bucket. For more information about disabling ACLs, see {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html}Controlling ownership of objects and disabling ACLs for your bucket}.
     
      When you retry an import, the [ImportID] parameter is required.
      
       If the destination event data store is for an organization, you must use the management account to import trail events. You cannot use the delegated administrator account for the organization.
       
        *)

  
end

module StartLogging : sig
  val request :
    Smaws_Lib.Context.t ->
      start_logging_request ->
        (start_logging_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Starts the recording of Amazon Web Services API calls and log file delivery for a trail. For a trail that is enabled in all Regions, this operation must be called from the Region in which the trail was created. This operation cannot be called on the shadow trails (replicated trails in other Regions) of a trail that is enabled in all Regions.
     *)

  
end

module StartQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      start_query_request ->
        (start_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidQueryStatementException of invalid_query_statement_exception
            | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception
            | `InvalidS3PrefixException of invalid_s3_prefix_exception
            | `MaxConcurrentQueriesException of max_concurrent_queries_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Starts a CloudTrail Lake query. Use the [QueryStatement] parameter to provide your SQL query, enclosed in single quotation marks. Use the optional [DeliveryS3Uri] parameter to deliver the query results to an S3 bucket.
    
     [StartQuery] requires you specify either the [QueryStatement] parameter, or a [QueryAlias] and any [QueryParameters]. In the current release, the [QueryAlias] and [QueryParameters] parameters are used only for the queries that populate the CloudTrail Lake dashboards.
      *)

  
end

module StopEventDataStoreIngestion : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_event_data_store_ingestion_request ->
        (stop_event_data_store_ingestion_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Stops the ingestion of live events on an event data store specified as either an ARN or the ID portion of the ARN. To stop ingestion, the event data store [Status] must be [ENABLED] and the [eventCategory] must be [Management], [Data], or [ConfigurationItem].
     *)

  
end

module StopImport : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_import_request ->
        (stop_import_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ImportNotFoundException of import_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Stops a specified import.
     *)

  
end

module StopLogging : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_logging_request ->
        (stop_logging_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Suspends the recording of Amazon Web Services API calls and log file delivery for the specified trail. Under most circumstances, there is no need to use this action. You can update a trail without stopping it first. This action is the only way to stop recording. For a trail enabled in all Regions, this operation must be called from the Region in which the trail was created, or an [InvalidHomeRegionException] will occur. This operation cannot be called on the shadow trails (replicated trails in other Regions) of a trail enabled in all Regions.
     *)

  
end

module UpdateChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      update_channel_request ->
        (update_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelAlreadyExistsException of channel_already_exists_exception
            | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Updates a channel specified by a required channel ARN or UUID.
     *)

  
end

module UpdateEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      update_event_data_store_request ->
        (update_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `EventDataStoreAlreadyExistsException of event_data_store_already_exists_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreHasOngoingImportException of event_data_store_has_ongoing_import_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InvalidEventSelectorsException of invalid_event_selectors_exception
            | `InvalidInsightSelectorsException of invalid_insight_selectors_exception
            | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `KmsException of kms_exception
            | `KmsKeyNotFoundException of kms_key_not_found_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Updates an event data store. The required [EventDataStore] value is an ARN or the ID portion of the ARN. Other parameters are optional, but at least one optional parameter must be specified, or CloudTrail throws an error. [RetentionPeriod] is in days, and valid values are integers between 7 and 3653 if the [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING], or between 7 and 2557 if [BillingMode] is set to [FIXED_RETENTION_PRICING]. By default, [TerminationProtection] is enabled.
    
     For event data stores for CloudTrail events, [AdvancedEventSelectors] includes or excludes management or data events in your event data store. For more information about [AdvancedEventSelectors], see {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedEventSelector.html}AdvancedEventSelectors}.
     
      For event data stores for CloudTrail Insights events, Config configuration items, Audit Manager evidence, or non-Amazon Web Services events, [AdvancedEventSelectors] includes events of that type in your event data store.
       *)

  
end

module UpdateTrail : sig
  val request :
    Smaws_Lib.Context.t ->
      update_trail_request ->
        (update_trail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `CloudTrailInvalidClientTokenIdException of cloud_trail_invalid_client_token_id_exception
            | `CloudWatchLogsDeliveryUnavailableException of cloud_watch_logs_delivery_unavailable_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
            | `InsufficientSnsTopicPolicyException of insufficient_sns_topic_policy_exception
            | `InvalidCloudWatchLogsLogGroupArnException of invalid_cloud_watch_logs_log_group_arn_exception
            | `InvalidCloudWatchLogsRoleArnException of invalid_cloud_watch_logs_role_arn_exception
            | `InvalidEventSelectorsException of invalid_event_selectors_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception
            | `InvalidS3PrefixException of invalid_s3_prefix_exception
            | `InvalidSnsTopicNameException of invalid_sns_topic_name_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `KmsException of kms_exception
            | `KmsKeyDisabledException of kms_key_disabled_exception
            | `KmsKeyNotFoundException of kms_key_not_found_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `TrailNotProvidedException of trail_not_provided_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Updates trail settings that control what events you are logging, and how to handle log files. Changes to a trail do not require stopping the CloudTrail service. Use this action to designate an existing bucket for log delivery. If the existing bucket has previously been a target for CloudTrail log files, an IAM policy exists for the bucket. [UpdateTrail] must be called from the Region in which the trail was created; otherwise, an [InvalidHomeRegionException] is thrown.
     *)

  
end

