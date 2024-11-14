open Types 
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
end

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
end

