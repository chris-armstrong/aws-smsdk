open Types 
let (let+) res map = Result.map map res
module AddTags = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ChannelARNInvalidException" ->
         (`ChannelARNInvalidException (channel_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ChannelNotFoundException" ->
         (`ChannelNotFoundException (channel_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTagParameterException" ->
         (`InvalidTagParameterException (invalid_tag_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceTypeNotSupportedException" ->
         (`ResourceTypeNotSupportedException (resource_type_not_supported_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TagsLimitExceededException" ->
         (`TagsLimitExceededException (tags_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_tags_request) ->
    let input = Serializers.add_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.AddTags" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_tags_response_of_yojson
      ~error_deserializer
      
end

module CancelQuery = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveQueryException" ->
         (`InactiveQueryException (inactive_query_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "QueryIdNotFoundException" ->
         (`QueryIdNotFoundException (query_id_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_query_request) ->
    let input = Serializers.cancel_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.CancelQuery" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_query_response_of_yojson
      ~error_deserializer
      
end

module CreateChannel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ChannelAlreadyExistsException" ->
         (`ChannelAlreadyExistsException (channel_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ChannelMaxLimitExceededException" ->
         (`ChannelMaxLimitExceededException (channel_max_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventDataStoreCategoryException" ->
         (`InvalidEventDataStoreCategoryException (invalid_event_data_store_category_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidSourceException" ->
         (`InvalidSourceException (invalid_source_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTagParameterException" ->
         (`InvalidTagParameterException (invalid_tag_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TagsLimitExceededException" ->
         (`TagsLimitExceededException (tags_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_channel_request) ->
    let input = Serializers.create_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.CreateChannel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_channel_response_of_yojson
      ~error_deserializer
      
end

module CreateEventDataStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailAccessNotEnabledException" ->
         (`CloudTrailAccessNotEnabledException (cloud_trail_access_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreAlreadyExistsException" ->
         (`EventDataStoreAlreadyExistsException (event_data_store_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreMaxLimitExceededException" ->
         (`EventDataStoreMaxLimitExceededException (event_data_store_max_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientEncryptionPolicyException" ->
         (`InsufficientEncryptionPolicyException (insufficient_encryption_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventSelectorsException" ->
         (`InvalidEventSelectorsException (invalid_event_selectors_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidKmsKeyIdException" ->
         (`InvalidKmsKeyIdException (invalid_kms_key_id_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTagParameterException" ->
         (`InvalidTagParameterException (invalid_tag_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsException" ->
         (`KmsException (kms_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsKeyNotFoundException" ->
         (`KmsKeyNotFoundException (kms_key_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationNotInAllFeaturesModeException" ->
         (`OrganizationNotInAllFeaturesModeException (organization_not_in_all_features_mode_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationsNotInUseException" ->
         (`OrganizationsNotInUseException (organizations_not_in_use_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_event_data_store_request) ->
    let input = Serializers.create_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.CreateEventDataStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_event_data_store_response_of_yojson
      ~error_deserializer
      
end

module CreateTrail = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailAccessNotEnabledException" ->
         (`CloudTrailAccessNotEnabledException (cloud_trail_access_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailInvalidClientTokenIdException" ->
         (`CloudTrailInvalidClientTokenIdException (cloud_trail_invalid_client_token_id_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudWatchLogsDeliveryUnavailableException" ->
         (`CloudWatchLogsDeliveryUnavailableException (cloud_watch_logs_delivery_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientEncryptionPolicyException" ->
         (`InsufficientEncryptionPolicyException (insufficient_encryption_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientS3BucketPolicyException" ->
         (`InsufficientS3BucketPolicyException (insufficient_s3_bucket_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientSnsTopicPolicyException" ->
         (`InsufficientSnsTopicPolicyException (insufficient_sns_topic_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidCloudWatchLogsLogGroupArnException" ->
         (`InvalidCloudWatchLogsLogGroupArnException (invalid_cloud_watch_logs_log_group_arn_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidCloudWatchLogsRoleArnException" ->
         (`InvalidCloudWatchLogsRoleArnException (invalid_cloud_watch_logs_role_arn_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidKmsKeyIdException" ->
         (`InvalidKmsKeyIdException (invalid_kms_key_id_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidS3BucketNameException" ->
         (`InvalidS3BucketNameException (invalid_s3_bucket_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidS3PrefixException" ->
         (`InvalidS3PrefixException (invalid_s3_prefix_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidSnsTopicNameException" ->
         (`InvalidSnsTopicNameException (invalid_sns_topic_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTagParameterException" ->
         (`InvalidTagParameterException (invalid_tag_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsException" ->
         (`KmsException (kms_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsKeyDisabledException" ->
         (`KmsKeyDisabledException (kms_key_disabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsKeyNotFoundException" ->
         (`KmsKeyNotFoundException (kms_key_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "MaximumNumberOfTrailsExceededException" ->
         (`MaximumNumberOfTrailsExceededException (maximum_number_of_trails_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationNotInAllFeaturesModeException" ->
         (`OrganizationNotInAllFeaturesModeException (organization_not_in_all_features_mode_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationsNotInUseException" ->
         (`OrganizationsNotInUseException (organizations_not_in_use_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "S3BucketDoesNotExistException" ->
         (`S3BucketDoesNotExistException (s3_bucket_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TagsLimitExceededException" ->
         (`TagsLimitExceededException (tags_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailAlreadyExistsException" ->
         (`TrailAlreadyExistsException (trail_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotProvidedException" ->
         (`TrailNotProvidedException (trail_not_provided_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_trail_request) ->
    let input = Serializers.create_trail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.CreateTrail" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_trail_response_of_yojson
      ~error_deserializer
      
end

module DeleteChannel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ChannelARNInvalidException" ->
         (`ChannelARNInvalidException (channel_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ChannelNotFoundException" ->
         (`ChannelNotFoundException (channel_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_channel_request) ->
    let input = Serializers.delete_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.DeleteChannel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_channel_response_of_yojson
      ~error_deserializer
      
end

module DeleteEventDataStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ChannelExistsForEDSException" ->
         (`ChannelExistsForEDSException (channel_exists_for_eds_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreFederationEnabledException" ->
         (`EventDataStoreFederationEnabledException (event_data_store_federation_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreHasOngoingImportException" ->
         (`EventDataStoreHasOngoingImportException (event_data_store_has_ongoing_import_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreTerminationProtectedException" ->
         (`EventDataStoreTerminationProtectedException (event_data_store_termination_protected_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_event_data_store_request) ->
    let input = Serializers.delete_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.DeleteEventDataStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_event_data_store_response_of_yojson
      ~error_deserializer
      
end

module DeleteResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceARNNotValidException" ->
         (`ResourceARNNotValidException (resource_arn_not_valid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourcePolicyNotFoundException" ->
         (`ResourcePolicyNotFoundException (resource_policy_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceTypeNotSupportedException" ->
         (`ResourceTypeNotSupportedException (resource_type_not_supported_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_resource_policy_request) ->
    let input = Serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.DeleteResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
      
end

module DeleteTrail = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidHomeRegionException" ->
         (`InvalidHomeRegionException (invalid_home_region_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_trail_request) ->
    let input = Serializers.delete_trail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.DeleteTrail" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_trail_response_of_yojson
      ~error_deserializer
      
end

module DeregisterOrganizationDelegatedAdmin = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "AccountNotFoundException" ->
         (`AccountNotFoundException (account_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "AccountNotRegisteredException" ->
         (`AccountNotRegisteredException (account_not_registered_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailAccessNotEnabledException" ->
         (`CloudTrailAccessNotEnabledException (cloud_trail_access_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationManagementAccountException" ->
         (`NotOrganizationManagementAccountException (not_organization_management_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationNotInAllFeaturesModeException" ->
         (`OrganizationNotInAllFeaturesModeException (organization_not_in_all_features_mode_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationsNotInUseException" ->
         (`OrganizationsNotInUseException (organizations_not_in_use_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_organization_delegated_admin_request) ->
    let input = Serializers.deregister_organization_delegated_admin_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.DeregisterOrganizationDelegatedAdmin" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_organization_delegated_admin_response_of_yojson
      ~error_deserializer
      
end

module DescribeQuery = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "QueryIdNotFoundException" ->
         (`QueryIdNotFoundException (query_id_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_query_request) ->
    let input = Serializers.describe_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.DescribeQuery" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_query_response_of_yojson
      ~error_deserializer
      
end

module DescribeTrails = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_trails_request) ->
    let input = Serializers.describe_trails_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.DescribeTrails" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_trails_response_of_yojson
      ~error_deserializer
      
end

module DisableFederation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailAccessNotEnabledException" ->
         (`CloudTrailAccessNotEnabledException (cloud_trail_access_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationNotInAllFeaturesModeException" ->
         (`OrganizationNotInAllFeaturesModeException (organization_not_in_all_features_mode_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationsNotInUseException" ->
         (`OrganizationsNotInUseException (organizations_not_in_use_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_federation_request) ->
    let input = Serializers.disable_federation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.DisableFederation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disable_federation_response_of_yojson
      ~error_deserializer
      
end

module EnableFederation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailAccessNotEnabledException" ->
         (`CloudTrailAccessNotEnabledException (cloud_trail_access_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreFederationEnabledException" ->
         (`EventDataStoreFederationEnabledException (event_data_store_federation_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationNotInAllFeaturesModeException" ->
         (`OrganizationNotInAllFeaturesModeException (organization_not_in_all_features_mode_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationsNotInUseException" ->
         (`OrganizationsNotInUseException (organizations_not_in_use_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_federation_request) ->
    let input = Serializers.enable_federation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.EnableFederation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enable_federation_response_of_yojson
      ~error_deserializer
      
end

module GetChannel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ChannelARNInvalidException" ->
         (`ChannelARNInvalidException (channel_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ChannelNotFoundException" ->
         (`ChannelNotFoundException (channel_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_channel_request) ->
    let input = Serializers.get_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.GetChannel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_channel_response_of_yojson
      ~error_deserializer
      
end

module GetEventDataStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_event_data_store_request) ->
    let input = Serializers.get_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.GetEventDataStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_event_data_store_response_of_yojson
      ~error_deserializer
      
end

module GetEventSelectors = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_event_selectors_request) ->
    let input = Serializers.get_event_selectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.GetEventSelectors" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_event_selectors_response_of_yojson
      ~error_deserializer
      
end

module GetImport = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ImportNotFoundException" ->
         (`ImportNotFoundException (import_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_import_request) ->
    let input = Serializers.get_import_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.GetImport" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_import_response_of_yojson
      ~error_deserializer
      
end

module GetInsightSelectors = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsightNotEnabledException" ->
         (`InsightNotEnabledException (insight_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_insight_selectors_request) ->
    let input = Serializers.get_insight_selectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.GetInsightSelectors" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_insight_selectors_response_of_yojson
      ~error_deserializer
      
end

module GetQueryResults = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientEncryptionPolicyException" ->
         (`InsufficientEncryptionPolicyException (insufficient_encryption_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidMaxResultsException" ->
         (`InvalidMaxResultsException (invalid_max_results_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "QueryIdNotFoundException" ->
         (`QueryIdNotFoundException (query_id_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_query_results_request) ->
    let input = Serializers.get_query_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.GetQueryResults" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_query_results_response_of_yojson
      ~error_deserializer
      
end

module GetResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceARNNotValidException" ->
         (`ResourceARNNotValidException (resource_arn_not_valid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourcePolicyNotFoundException" ->
         (`ResourcePolicyNotFoundException (resource_policy_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceTypeNotSupportedException" ->
         (`ResourceTypeNotSupportedException (resource_type_not_supported_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_policy_request) ->
    let input = Serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.GetResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer
      
end

module GetTrail = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_trail_request) ->
    let input = Serializers.get_trail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.GetTrail" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_trail_response_of_yojson
      ~error_deserializer
      
end

module GetTrailStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_trail_status_request) ->
    let input = Serializers.get_trail_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.GetTrailStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_trail_status_response_of_yojson
      ~error_deserializer
      
end

module ListChannels = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_channels_request) ->
    let input = Serializers.list_channels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.ListChannels" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_channels_response_of_yojson
      ~error_deserializer
      
end

module ListEventDataStores = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "InvalidMaxResultsException" ->
         (`InvalidMaxResultsException (invalid_max_results_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_event_data_stores_request) ->
    let input = Serializers.list_event_data_stores_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.ListEventDataStores" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_event_data_stores_response_of_yojson
      ~error_deserializer
      
end

module ListImportFailures = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_import_failures_request) ->
    let input = Serializers.list_import_failures_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.ListImportFailures" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_import_failures_response_of_yojson
      ~error_deserializer
      
end

module ListImports = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_imports_request) ->
    let input = Serializers.list_imports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.ListImports" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_imports_response_of_yojson
      ~error_deserializer
      
end

module ListInsightsMetricData = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_insights_metric_data_request) ->
    let input = Serializers.list_insights_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.ListInsightsMetricData" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_insights_metric_data_response_of_yojson
      ~error_deserializer
      
end

module ListPublicKeys = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "InvalidTimeRangeException" ->
         (`InvalidTimeRangeException (invalid_time_range_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTokenException" ->
         (`InvalidTokenException (invalid_token_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_public_keys_request) ->
    let input = Serializers.list_public_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.ListPublicKeys" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_public_keys_response_of_yojson
      ~error_deserializer
      
end

module ListQueries = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidDateRangeException" ->
         (`InvalidDateRangeException (invalid_date_range_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidMaxResultsException" ->
         (`InvalidMaxResultsException (invalid_max_results_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidQueryStatusException" ->
         (`InvalidQueryStatusException (invalid_query_status_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_queries_request) ->
    let input = Serializers.list_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.ListQueries" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_queries_response_of_yojson
      ~error_deserializer
      
end

module ListTags = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ChannelARNInvalidException" ->
         (`ChannelARNInvalidException (channel_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTokenException" ->
         (`InvalidTokenException (invalid_token_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceTypeNotSupportedException" ->
         (`ResourceTypeNotSupportedException (resource_type_not_supported_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_request) ->
    let input = Serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.ListTags" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_response_of_yojson
      ~error_deserializer
      
end

module ListTrails = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_trails_request) ->
    let input = Serializers.list_trails_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.ListTrails" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_trails_response_of_yojson
      ~error_deserializer
      
end

module LookupEvents = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "InvalidEventCategoryException" ->
         (`InvalidEventCategoryException (invalid_event_category_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidLookupAttributesException" ->
         (`InvalidLookupAttributesException (invalid_lookup_attributes_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidMaxResultsException" ->
         (`InvalidMaxResultsException (invalid_max_results_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTimeRangeException" ->
         (`InvalidTimeRangeException (invalid_time_range_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: lookup_events_request) ->
    let input = Serializers.lookup_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.LookupEvents" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.lookup_events_response_of_yojson
      ~error_deserializer
      
end

module PutEventSelectors = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventSelectorsException" ->
         (`InvalidEventSelectorsException (invalid_event_selectors_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidHomeRegionException" ->
         (`InvalidHomeRegionException (invalid_home_region_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_event_selectors_request) ->
    let input = Serializers.put_event_selectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.PutEventSelectors" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_event_selectors_response_of_yojson
      ~error_deserializer
      
end

module PutInsightSelectors = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientEncryptionPolicyException" ->
         (`InsufficientEncryptionPolicyException (insufficient_encryption_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientS3BucketPolicyException" ->
         (`InsufficientS3BucketPolicyException (insufficient_s3_bucket_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidHomeRegionException" ->
         (`InvalidHomeRegionException (invalid_home_region_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidInsightSelectorsException" ->
         (`InvalidInsightSelectorsException (invalid_insight_selectors_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsException" ->
         (`KmsException (kms_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "S3BucketDoesNotExistException" ->
         (`S3BucketDoesNotExistException (s3_bucket_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_insight_selectors_request) ->
    let input = Serializers.put_insight_selectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.PutInsightSelectors" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_insight_selectors_response_of_yojson
      ~error_deserializer
      
end

module PutResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceARNNotValidException" ->
         (`ResourceARNNotValidException (resource_arn_not_valid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourcePolicyNotValidException" ->
         (`ResourcePolicyNotValidException (resource_policy_not_valid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceTypeNotSupportedException" ->
         (`ResourceTypeNotSupportedException (resource_type_not_supported_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_resource_policy_request) ->
    let input = Serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.PutResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
      
end

module RegisterOrganizationDelegatedAdmin = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "AccountNotFoundException" ->
         (`AccountNotFoundException (account_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "AccountRegisteredException" ->
         (`AccountRegisteredException (account_registered_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CannotDelegateManagementAccountException" ->
         (`CannotDelegateManagementAccountException (cannot_delegate_management_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailAccessNotEnabledException" ->
         (`CloudTrailAccessNotEnabledException (cloud_trail_access_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "DelegatedAdminAccountLimitExceededException" ->
         (`DelegatedAdminAccountLimitExceededException (delegated_admin_account_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationManagementAccountException" ->
         (`NotOrganizationManagementAccountException (not_organization_management_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationNotInAllFeaturesModeException" ->
         (`OrganizationNotInAllFeaturesModeException (organization_not_in_all_features_mode_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationsNotInUseException" ->
         (`OrganizationsNotInUseException (organizations_not_in_use_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_organization_delegated_admin_request) ->
    let input = Serializers.register_organization_delegated_admin_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.RegisterOrganizationDelegatedAdmin" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_organization_delegated_admin_response_of_yojson
      ~error_deserializer
      
end

module RemoveTags = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ChannelARNInvalidException" ->
         (`ChannelARNInvalidException (channel_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ChannelNotFoundException" ->
         (`ChannelNotFoundException (channel_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTagParameterException" ->
         (`InvalidTagParameterException (invalid_tag_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ResourceTypeNotSupportedException" ->
         (`ResourceTypeNotSupportedException (resource_type_not_supported_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_tags_request) ->
    let input = Serializers.remove_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.RemoveTags" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.remove_tags_response_of_yojson
      ~error_deserializer
      
end

module RestoreEventDataStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailAccessNotEnabledException" ->
         (`CloudTrailAccessNotEnabledException (cloud_trail_access_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreMaxLimitExceededException" ->
         (`EventDataStoreMaxLimitExceededException (event_data_store_max_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventDataStoreStatusException" ->
         (`InvalidEventDataStoreStatusException (invalid_event_data_store_status_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationNotInAllFeaturesModeException" ->
         (`OrganizationNotInAllFeaturesModeException (organization_not_in_all_features_mode_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationsNotInUseException" ->
         (`OrganizationsNotInUseException (organizations_not_in_use_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: restore_event_data_store_request) ->
    let input = Serializers.restore_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.RestoreEventDataStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.restore_event_data_store_response_of_yojson
      ~error_deserializer
      
end

module StartEventDataStoreIngestion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventDataStoreCategoryException" ->
         (`InvalidEventDataStoreCategoryException (invalid_event_data_store_category_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventDataStoreStatusException" ->
         (`InvalidEventDataStoreStatusException (invalid_event_data_store_status_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_event_data_store_ingestion_request) ->
    let input = Serializers.start_event_data_store_ingestion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.StartEventDataStoreIngestion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_event_data_store_ingestion_response_of_yojson
      ~error_deserializer
      
end

module StartImport = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "AccountHasOngoingImportException" ->
         (`AccountHasOngoingImportException (account_has_ongoing_import_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ImportNotFoundException" ->
         (`ImportNotFoundException (import_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientEncryptionPolicyException" ->
         (`InsufficientEncryptionPolicyException (insufficient_encryption_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventDataStoreCategoryException" ->
         (`InvalidEventDataStoreCategoryException (invalid_event_data_store_category_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventDataStoreStatusException" ->
         (`InvalidEventDataStoreStatusException (invalid_event_data_store_status_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidImportSourceException" ->
         (`InvalidImportSourceException (invalid_import_source_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_import_request) ->
    let input = Serializers.start_import_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.StartImport" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_import_response_of_yojson
      ~error_deserializer
      
end

module StartLogging = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidHomeRegionException" ->
         (`InvalidHomeRegionException (invalid_home_region_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_logging_request) ->
    let input = Serializers.start_logging_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.StartLogging" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_logging_response_of_yojson
      ~error_deserializer
      
end

module StartQuery = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientEncryptionPolicyException" ->
         (`InsufficientEncryptionPolicyException (insufficient_encryption_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientS3BucketPolicyException" ->
         (`InsufficientS3BucketPolicyException (insufficient_s3_bucket_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidQueryStatementException" ->
         (`InvalidQueryStatementException (invalid_query_statement_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidS3BucketNameException" ->
         (`InvalidS3BucketNameException (invalid_s3_bucket_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidS3PrefixException" ->
         (`InvalidS3PrefixException (invalid_s3_prefix_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "MaxConcurrentQueriesException" ->
         (`MaxConcurrentQueriesException (max_concurrent_queries_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "S3BucketDoesNotExistException" ->
         (`S3BucketDoesNotExistException (s3_bucket_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_query_request) ->
    let input = Serializers.start_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.StartQuery" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_query_response_of_yojson
      ~error_deserializer
      
end

module StopEventDataStoreIngestion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventDataStoreCategoryException" ->
         (`InvalidEventDataStoreCategoryException (invalid_event_data_store_category_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventDataStoreStatusException" ->
         (`InvalidEventDataStoreStatusException (invalid_event_data_store_status_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_event_data_store_ingestion_request) ->
    let input = Serializers.stop_event_data_store_ingestion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.StopEventDataStoreIngestion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.stop_event_data_store_ingestion_response_of_yojson
      ~error_deserializer
      
end

module StopImport = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ImportNotFoundException" ->
         (`ImportNotFoundException (import_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_import_request) ->
    let input = Serializers.stop_import_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.StopImport" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.stop_import_response_of_yojson
      ~error_deserializer
      
end

module StopLogging = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidHomeRegionException" ->
         (`InvalidHomeRegionException (invalid_home_region_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_logging_request) ->
    let input = Serializers.stop_logging_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.StopLogging" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.stop_logging_response_of_yojson
      ~error_deserializer
      
end

module UpdateChannel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "ChannelAlreadyExistsException" ->
         (`ChannelAlreadyExistsException (channel_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ChannelARNInvalidException" ->
         (`ChannelARNInvalidException (channel_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ChannelNotFoundException" ->
         (`ChannelNotFoundException (channel_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventDataStoreCategoryException" ->
         (`InvalidEventDataStoreCategoryException (invalid_event_data_store_category_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_channel_request) ->
    let input = Serializers.update_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.UpdateChannel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_channel_response_of_yojson
      ~error_deserializer
      
end

module UpdateEventDataStore = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailAccessNotEnabledException" ->
         (`CloudTrailAccessNotEnabledException (cloud_trail_access_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreAlreadyExistsException" ->
         (`EventDataStoreAlreadyExistsException (event_data_store_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreARNInvalidException" ->
         (`EventDataStoreARNInvalidException (event_data_store_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreHasOngoingImportException" ->
         (`EventDataStoreHasOngoingImportException (event_data_store_has_ongoing_import_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "EventDataStoreNotFoundException" ->
         (`EventDataStoreNotFoundException (event_data_store_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InactiveEventDataStoreException" ->
         (`InactiveEventDataStoreException (inactive_event_data_store_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientEncryptionPolicyException" ->
         (`InsufficientEncryptionPolicyException (insufficient_encryption_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventSelectorsException" ->
         (`InvalidEventSelectorsException (invalid_event_selectors_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidInsightSelectorsException" ->
         (`InvalidInsightSelectorsException (invalid_insight_selectors_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidKmsKeyIdException" ->
         (`InvalidKmsKeyIdException (invalid_kms_key_id_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsException" ->
         (`KmsException (kms_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsKeyNotFoundException" ->
         (`KmsKeyNotFoundException (kms_key_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationNotInAllFeaturesModeException" ->
         (`OrganizationNotInAllFeaturesModeException (organization_not_in_all_features_mode_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationsNotInUseException" ->
         (`OrganizationsNotInUseException (organizations_not_in_use_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_event_data_store_request) ->
    let input = Serializers.update_event_data_store_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.UpdateEventDataStore" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_event_data_store_response_of_yojson
      ~error_deserializer
      
end

module UpdateTrail = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.cloudtrail", "CloudTrailAccessNotEnabledException" ->
         (`CloudTrailAccessNotEnabledException (cloud_trail_access_not_enabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailARNInvalidException" ->
         (`CloudTrailARNInvalidException (cloud_trail_arn_invalid_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudTrailInvalidClientTokenIdException" ->
         (`CloudTrailInvalidClientTokenIdException (cloud_trail_invalid_client_token_id_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "CloudWatchLogsDeliveryUnavailableException" ->
         (`CloudWatchLogsDeliveryUnavailableException (cloud_watch_logs_delivery_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientDependencyServiceAccessPermissionException" ->
         (`InsufficientDependencyServiceAccessPermissionException (insufficient_dependency_service_access_permission_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientEncryptionPolicyException" ->
         (`InsufficientEncryptionPolicyException (insufficient_encryption_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientS3BucketPolicyException" ->
         (`InsufficientS3BucketPolicyException (insufficient_s3_bucket_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InsufficientSnsTopicPolicyException" ->
         (`InsufficientSnsTopicPolicyException (insufficient_sns_topic_policy_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidCloudWatchLogsLogGroupArnException" ->
         (`InvalidCloudWatchLogsLogGroupArnException (invalid_cloud_watch_logs_log_group_arn_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidCloudWatchLogsRoleArnException" ->
         (`InvalidCloudWatchLogsRoleArnException (invalid_cloud_watch_logs_role_arn_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidEventSelectorsException" ->
         (`InvalidEventSelectorsException (invalid_event_selectors_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidHomeRegionException" ->
         (`InvalidHomeRegionException (invalid_home_region_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidKmsKeyIdException" ->
         (`InvalidKmsKeyIdException (invalid_kms_key_id_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidS3BucketNameException" ->
         (`InvalidS3BucketNameException (invalid_s3_bucket_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidS3PrefixException" ->
         (`InvalidS3PrefixException (invalid_s3_prefix_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidSnsTopicNameException" ->
         (`InvalidSnsTopicNameException (invalid_sns_topic_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "InvalidTrailNameException" ->
         (`InvalidTrailNameException (invalid_trail_name_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsException" ->
         (`KmsException (kms_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsKeyDisabledException" ->
         (`KmsKeyDisabledException (kms_key_disabled_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "KmsKeyNotFoundException" ->
         (`KmsKeyNotFoundException (kms_key_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NoManagementAccountSLRExistsException" ->
         (`NoManagementAccountSLRExistsException (no_management_account_slr_exists_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "NotOrganizationMasterAccountException" ->
         (`NotOrganizationMasterAccountException (not_organization_master_account_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OperationNotPermittedException" ->
         (`OperationNotPermittedException (operation_not_permitted_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationNotInAllFeaturesModeException" ->
         (`OrganizationNotInAllFeaturesModeException (organization_not_in_all_features_mode_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "OrganizationsNotInUseException" ->
         (`OrganizationsNotInUseException (organizations_not_in_use_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "S3BucketDoesNotExistException" ->
         (`S3BucketDoesNotExistException (s3_bucket_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotFoundException" ->
         (`TrailNotFoundException (trail_not_found_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "TrailNotProvidedException" ->
         (`TrailNotProvidedException (trail_not_provided_exception_of_yojson tree path))
      | "com.amazonaws.cloudtrail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_trail_request) ->
    let input = Serializers.update_trail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CloudTrail_20131101.UpdateTrail" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_trail_response_of_yojson
      ~error_deserializer
      
end

