open Smaws_Lib.Json.DeserializeHelpers

open Types

let string__of_yojson = string_of_yojson

let boolean__of_yojson = bool_of_yojson

let update_trail_response_of_yojson = 
  fun tree path : update_trail_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_trail_response = {
    is_organization_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsOrganizationTrail") _list path;
    kms_key_id = option_of_yojson (value_for_key (string__of_yojson) "KmsKeyId") _list path;
    cloud_watch_logs_role_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsRoleArn") _list path;
    cloud_watch_logs_log_group_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsLogGroupArn") _list path;
    log_file_validation_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "LogFileValidationEnabled") _list path;
    trail_ar_n = option_of_yojson (value_for_key (string__of_yojson) "TrailARN") _list path;
    is_multi_region_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsMultiRegionTrail") _list path;
    include_global_service_events = option_of_yojson (value_for_key (boolean__of_yojson) "IncludeGlobalServiceEvents") _list path;
    sns_topic_ar_n = option_of_yojson (value_for_key (string__of_yojson) "SnsTopicARN") _list path;
    sns_topic_name = option_of_yojson (value_for_key (string__of_yojson) "SnsTopicName") _list path;
    s3_key_prefix = option_of_yojson (value_for_key (string__of_yojson) "S3KeyPrefix") _list path;
    s3_bucket_name = option_of_yojson (value_for_key (string__of_yojson) "S3BucketName") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    
  }
  in _res

let update_trail_request_of_yojson = 
  fun tree path : update_trail_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_trail_request = {
    is_organization_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsOrganizationTrail") _list path;
    kms_key_id = option_of_yojson (value_for_key (string__of_yojson) "KmsKeyId") _list path;
    cloud_watch_logs_role_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsRoleArn") _list path;
    cloud_watch_logs_log_group_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsLogGroupArn") _list path;
    enable_log_file_validation = option_of_yojson (value_for_key (boolean__of_yojson) "EnableLogFileValidation") _list path;
    is_multi_region_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsMultiRegionTrail") _list path;
    include_global_service_events = option_of_yojson (value_for_key (boolean__of_yojson) "IncludeGlobalServiceEvents") _list path;
    sns_topic_name = option_of_yojson (value_for_key (string__of_yojson) "SnsTopicName") _list path;
    s3_key_prefix = option_of_yojson (value_for_key (string__of_yojson) "S3KeyPrefix") _list path;
    s3_bucket_name = option_of_yojson (value_for_key (string__of_yojson) "S3BucketName") _list path;
    name = value_for_key (string__of_yojson) "Name" _list path;
    
  }
  in _res

let error_message_of_yojson = string_of_yojson

let unsupported_operation_exception_of_yojson = 
  fun tree path : unsupported_operation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_operation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let trail_not_provided_exception_of_yojson = 
  fun tree path : trail_not_provided_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : trail_not_provided_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let trail_not_found_exception_of_yojson = 
  fun tree path : trail_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : trail_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let throttling_exception_of_yojson = 
  fun tree path : throttling_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : throttling_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let s3_bucket_does_not_exist_exception_of_yojson = 
  fun tree path : s3_bucket_does_not_exist_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_bucket_does_not_exist_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let organizations_not_in_use_exception_of_yojson = 
  fun tree path : organizations_not_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : organizations_not_in_use_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let organization_not_in_all_features_mode_exception_of_yojson = 
  fun tree path : organization_not_in_all_features_mode_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_not_in_all_features_mode_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let operation_not_permitted_exception_of_yojson = 
  fun tree path : operation_not_permitted_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : operation_not_permitted_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let not_organization_master_account_exception_of_yojson = 
  fun tree path : not_organization_master_account_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : not_organization_master_account_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let no_management_account_slr_exists_exception_of_yojson = 
  fun tree path : no_management_account_slr_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_management_account_slr_exists_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let kms_key_not_found_exception_of_yojson = 
  fun tree path : kms_key_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_key_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let kms_key_disabled_exception_of_yojson = 
  fun tree path : kms_key_disabled_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_key_disabled_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let kms_exception_of_yojson = 
  fun tree path : kms_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_trail_name_exception_of_yojson = 
  fun tree path : invalid_trail_name_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_trail_name_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_sns_topic_name_exception_of_yojson = 
  fun tree path : invalid_sns_topic_name_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_sns_topic_name_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_s3_prefix_exception_of_yojson = 
  fun tree path : invalid_s3_prefix_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_s3_prefix_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_s3_bucket_name_exception_of_yojson = 
  fun tree path : invalid_s3_bucket_name_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_s3_bucket_name_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_parameter_exception_of_yojson = 
  fun tree path : invalid_parameter_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_parameter_combination_exception_of_yojson = 
  fun tree path : invalid_parameter_combination_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_combination_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_kms_key_id_exception_of_yojson = 
  fun tree path : invalid_kms_key_id_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_kms_key_id_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_home_region_exception_of_yojson = 
  fun tree path : invalid_home_region_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_home_region_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_event_selectors_exception_of_yojson = 
  fun tree path : invalid_event_selectors_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_event_selectors_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_cloud_watch_logs_role_arn_exception_of_yojson = 
  fun tree path : invalid_cloud_watch_logs_role_arn_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_cloud_watch_logs_role_arn_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_cloud_watch_logs_log_group_arn_exception_of_yojson = 
  fun tree path : invalid_cloud_watch_logs_log_group_arn_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_cloud_watch_logs_log_group_arn_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let insufficient_sns_topic_policy_exception_of_yojson = 
  fun tree path : insufficient_sns_topic_policy_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : insufficient_sns_topic_policy_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let insufficient_s3_bucket_policy_exception_of_yojson = 
  fun tree path : insufficient_s3_bucket_policy_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : insufficient_s3_bucket_policy_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let insufficient_encryption_policy_exception_of_yojson = 
  fun tree path : insufficient_encryption_policy_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : insufficient_encryption_policy_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let insufficient_dependency_service_access_permission_exception_of_yojson = 
  fun tree path : insufficient_dependency_service_access_permission_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : insufficient_dependency_service_access_permission_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let conflict_exception_of_yojson = 
  fun tree path : conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let cloud_watch_logs_delivery_unavailable_exception_of_yojson = 
  fun tree path : cloud_watch_logs_delivery_unavailable_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_watch_logs_delivery_unavailable_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let cloud_trail_invalid_client_token_id_exception_of_yojson = 
  fun tree path : cloud_trail_invalid_client_token_id_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_trail_invalid_client_token_id_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let cloud_trail_arn_invalid_exception_of_yojson = 
  fun tree path : cloud_trail_arn_invalid_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_trail_arn_invalid_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let cloud_trail_access_not_enabled_exception_of_yojson = 
  fun tree path : cloud_trail_access_not_enabled_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_trail_access_not_enabled_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let event_data_store_arn_of_yojson = string_of_yojson

let event_data_store_name_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let event_data_store_status_of_yojson = 
  fun (tree: t) path : event_data_store_status -> match tree with 
    | `String "STOPPED_INGESTION" -> STOPPED_INGESTION
    | `String "STOPPING_INGESTION" -> STOPPING_INGESTION
    | `String "STARTING_INGESTION" -> STARTING_INGESTION
    | `String "PENDING_DELETION" -> PENDING_DELETION
    | `String "ENABLED" -> ENABLED
    | `String "CREATED" -> CREATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventDataStoreStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EventDataStoreStatus")

let selector_name_of_yojson = string_of_yojson

let selector_field_of_yojson = string_of_yojson

let operator_value_of_yojson = string_of_yojson

let operator_of_yojson = 
  fun tree path -> list_of_yojson operator_value_of_yojson tree path 

let advanced_field_selector_of_yojson = 
  fun tree path : advanced_field_selector ->
  let _list = assoc_of_yojson tree path in
  let _res : advanced_field_selector = {
    not_ends_with = option_of_yojson (value_for_key (operator_of_yojson) "NotEndsWith") _list path;
    not_starts_with = option_of_yojson (value_for_key (operator_of_yojson) "NotStartsWith") _list path;
    not_equals = option_of_yojson (value_for_key (operator_of_yojson) "NotEquals") _list path;
    ends_with = option_of_yojson (value_for_key (operator_of_yojson) "EndsWith") _list path;
    starts_with = option_of_yojson (value_for_key (operator_of_yojson) "StartsWith") _list path;
    equals = option_of_yojson (value_for_key (operator_of_yojson) "Equals") _list path;
    field = value_for_key (selector_field_of_yojson) "Field" _list path;
    
  }
  in _res

let advanced_field_selectors_of_yojson = 
  fun tree path -> list_of_yojson advanced_field_selector_of_yojson tree path 

let advanced_event_selector_of_yojson = 
  fun tree path : advanced_event_selector ->
  let _list = assoc_of_yojson tree path in
  let _res : advanced_event_selector = {
    field_selectors = value_for_key (advanced_field_selectors_of_yojson) "FieldSelectors" _list path;
    name = option_of_yojson (value_for_key (selector_name_of_yojson) "Name") _list path;
    
  }
  in _res

let advanced_event_selectors_of_yojson = 
  fun tree path -> list_of_yojson advanced_event_selector_of_yojson tree path 

let retention_period_of_yojson = int_of_yojson

let termination_protection_enabled_of_yojson = bool_of_yojson

let date_of_yojson = timestamp_of_yojson

let event_data_store_kms_key_id_of_yojson = string_of_yojson

let billing_mode_of_yojson = 
  fun (tree: t) path : billing_mode -> match tree with 
    | `String "FIXED_RETENTION_PRICING" -> FIXED_RETENTION_PRICING
    | `String "EXTENDABLE_RETENTION_PRICING" -> EXTENDABLE_RETENTION_PRICING
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingMode")

let federation_status_of_yojson = 
  fun (tree: t) path : federation_status -> match tree with 
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "FederationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FederationStatus")

let federation_role_arn_of_yojson = string_of_yojson

let update_event_data_store_response_of_yojson = 
  fun tree path : update_event_data_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_event_data_store_response = {
    federation_role_arn = option_of_yojson (value_for_key (federation_role_arn_of_yojson) "FederationRoleArn") _list path;
    federation_status = option_of_yojson (value_for_key (federation_status_of_yojson) "FederationStatus") _list path;
    billing_mode = option_of_yojson (value_for_key (billing_mode_of_yojson) "BillingMode") _list path;
    kms_key_id = option_of_yojson (value_for_key (event_data_store_kms_key_id_of_yojson) "KmsKeyId") _list path;
    updated_timestamp = option_of_yojson (value_for_key (date_of_yojson) "UpdatedTimestamp") _list path;
    created_timestamp = option_of_yojson (value_for_key (date_of_yojson) "CreatedTimestamp") _list path;
    termination_protection_enabled = option_of_yojson (value_for_key (termination_protection_enabled_of_yojson) "TerminationProtectionEnabled") _list path;
    retention_period = option_of_yojson (value_for_key (retention_period_of_yojson) "RetentionPeriod") _list path;
    organization_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "OrganizationEnabled") _list path;
    multi_region_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "MultiRegionEnabled") _list path;
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    status = option_of_yojson (value_for_key (event_data_store_status_of_yojson) "Status") _list path;
    name = option_of_yojson (value_for_key (event_data_store_name_of_yojson) "Name") _list path;
    event_data_store_arn = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStoreArn") _list path;
    
  }
  in _res

let update_event_data_store_request_of_yojson = 
  fun tree path : update_event_data_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_event_data_store_request = {
    billing_mode = option_of_yojson (value_for_key (billing_mode_of_yojson) "BillingMode") _list path;
    kms_key_id = option_of_yojson (value_for_key (event_data_store_kms_key_id_of_yojson) "KmsKeyId") _list path;
    termination_protection_enabled = option_of_yojson (value_for_key (termination_protection_enabled_of_yojson) "TerminationProtectionEnabled") _list path;
    retention_period = option_of_yojson (value_for_key (retention_period_of_yojson) "RetentionPeriod") _list path;
    organization_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "OrganizationEnabled") _list path;
    multi_region_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "MultiRegionEnabled") _list path;
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    name = option_of_yojson (value_for_key (event_data_store_name_of_yojson) "Name") _list path;
    event_data_store = value_for_key (event_data_store_arn_of_yojson) "EventDataStore" _list path;
    
  }
  in _res

let invalid_insight_selectors_exception_of_yojson = 
  fun tree path : invalid_insight_selectors_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_insight_selectors_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let inactive_event_data_store_exception_of_yojson = 
  fun tree path : inactive_event_data_store_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : inactive_event_data_store_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let event_data_store_not_found_exception_of_yojson = 
  fun tree path : event_data_store_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : event_data_store_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let event_data_store_has_ongoing_import_exception_of_yojson = 
  fun tree path : event_data_store_has_ongoing_import_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : event_data_store_has_ongoing_import_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let event_data_store_arn_invalid_exception_of_yojson = 
  fun tree path : event_data_store_arn_invalid_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : event_data_store_arn_invalid_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let event_data_store_already_exists_exception_of_yojson = 
  fun tree path : event_data_store_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : event_data_store_already_exists_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let channel_arn_of_yojson = string_of_yojson

let channel_name_of_yojson = string_of_yojson

let source_of_yojson = string_of_yojson

let destination_type_of_yojson = 
  fun (tree: t) path : destination_type -> match tree with 
    | `String "AWS_SERVICE" -> AWS_SERVICE
    | `String "EVENT_DATA_STORE" -> EVENT_DATA_STORE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DestinationType" value)
    | _ -> raise (deserialize_wrong_type_error path "DestinationType")

let location_of_yojson = string_of_yojson

let destination_of_yojson = 
  fun tree path : destination ->
  let _list = assoc_of_yojson tree path in
  let _res : destination = {
    location = value_for_key (location_of_yojson) "Location" _list path;
    type_ = value_for_key (destination_type_of_yojson) "Type" _list path;
    
  }
  in _res

let destinations_of_yojson = 
  fun tree path -> list_of_yojson destination_of_yojson tree path 

let update_channel_response_of_yojson = 
  fun tree path : update_channel_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_channel_response = {
    destinations = option_of_yojson (value_for_key (destinations_of_yojson) "Destinations") _list path;
    source = option_of_yojson (value_for_key (source_of_yojson) "Source") _list path;
    name = option_of_yojson (value_for_key (channel_name_of_yojson) "Name") _list path;
    channel_arn = option_of_yojson (value_for_key (channel_arn_of_yojson) "ChannelArn") _list path;
    
  }
  in _res

let update_channel_request_of_yojson = 
  fun tree path : update_channel_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_channel_request = {
    name = option_of_yojson (value_for_key (channel_name_of_yojson) "Name") _list path;
    destinations = option_of_yojson (value_for_key (destinations_of_yojson) "Destinations") _list path;
    channel = value_for_key (channel_arn_of_yojson) "Channel" _list path;
    
  }
  in _res

let invalid_event_data_store_category_exception_of_yojson = 
  fun tree path : invalid_event_data_store_category_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_event_data_store_category_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let channel_not_found_exception_of_yojson = 
  fun tree path : channel_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : channel_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let channel_arn_invalid_exception_of_yojson = 
  fun tree path : channel_arn_invalid_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : channel_arn_invalid_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let channel_already_exists_exception_of_yojson = 
  fun tree path : channel_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : channel_already_exists_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let uui_d_of_yojson = string_of_yojson

let trail_info_of_yojson = 
  fun tree path : trail_info ->
  let _list = assoc_of_yojson tree path in
  let _res : trail_info = {
    home_region = option_of_yojson (value_for_key (string__of_yojson) "HomeRegion") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    trail_ar_n = option_of_yojson (value_for_key (string__of_yojson) "TrailARN") _list path;
    
  }
  in _res

let trails_of_yojson = 
  fun tree path -> list_of_yojson trail_info_of_yojson tree path 

let trail_name_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let trail_of_yojson = 
  fun tree path : trail ->
  let _list = assoc_of_yojson tree path in
  let _res : trail = {
    is_organization_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsOrganizationTrail") _list path;
    has_insight_selectors = option_of_yojson (value_for_key (boolean__of_yojson) "HasInsightSelectors") _list path;
    has_custom_event_selectors = option_of_yojson (value_for_key (boolean__of_yojson) "HasCustomEventSelectors") _list path;
    kms_key_id = option_of_yojson (value_for_key (string__of_yojson) "KmsKeyId") _list path;
    cloud_watch_logs_role_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsRoleArn") _list path;
    cloud_watch_logs_log_group_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsLogGroupArn") _list path;
    log_file_validation_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "LogFileValidationEnabled") _list path;
    trail_ar_n = option_of_yojson (value_for_key (string__of_yojson) "TrailARN") _list path;
    home_region = option_of_yojson (value_for_key (string__of_yojson) "HomeRegion") _list path;
    is_multi_region_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsMultiRegionTrail") _list path;
    include_global_service_events = option_of_yojson (value_for_key (boolean__of_yojson) "IncludeGlobalServiceEvents") _list path;
    sns_topic_ar_n = option_of_yojson (value_for_key (string__of_yojson) "SnsTopicARN") _list path;
    sns_topic_name = option_of_yojson (value_for_key (string__of_yojson) "SnsTopicName") _list path;
    s3_key_prefix = option_of_yojson (value_for_key (string__of_yojson) "S3KeyPrefix") _list path;
    s3_bucket_name = option_of_yojson (value_for_key (string__of_yojson) "S3BucketName") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    
  }
  in _res

let trail_list_of_yojson = 
  fun tree path -> list_of_yojson trail_of_yojson tree path 

let trail_already_exists_exception_of_yojson = 
  fun tree path : trail_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : trail_already_exists_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let timestamps_of_yojson = 
  fun tree path -> list_of_yojson date_of_yojson tree path 

let tag_key_of_yojson = string_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = option_of_yojson (value_for_key (tag_value_of_yojson) "Value") _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tags_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tags_limit_exceeded_exception_of_yojson = 
  fun tree path : tags_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : tags_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let stop_logging_response_of_yojson = 
  fun tree path : stop_logging_response ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_logging_response = ()
  in _res

let stop_logging_request_of_yojson = 
  fun tree path : stop_logging_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_logging_request = {
    name = value_for_key (string__of_yojson) "Name" _list path;
    
  }
  in _res

let s3_import_source_of_yojson = 
  fun tree path : s3_import_source ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_import_source = {
    s3_bucket_access_role_arn = value_for_key (string__of_yojson) "S3BucketAccessRoleArn" _list path;
    s3_bucket_region = value_for_key (string__of_yojson) "S3BucketRegion" _list path;
    s3_location_uri = value_for_key (string__of_yojson) "S3LocationUri" _list path;
    
  }
  in _res

let import_source_of_yojson = 
  fun tree path : import_source ->
  let _list = assoc_of_yojson tree path in
  let _res : import_source = {
    s3 = value_for_key (s3_import_source_of_yojson) "S3" _list path;
    
  }
  in _res

let import_destinations_of_yojson = 
  fun tree path -> list_of_yojson event_data_store_arn_of_yojson tree path 

let import_status_of_yojson = 
  fun (tree: t) path : import_status -> match tree with 
    | `String "COMPLETED" -> COMPLETED
    | `String "STOPPED" -> STOPPED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "INITIALIZING" -> INITIALIZING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportStatus")

let long_of_yojson = long_of_yojson

let import_statistics_of_yojson = 
  fun tree path : import_statistics ->
  let _list = assoc_of_yojson tree path in
  let _res : import_statistics = {
    failed_entries = option_of_yojson (value_for_key (long_of_yojson) "FailedEntries") _list path;
    events_completed = option_of_yojson (value_for_key (long_of_yojson) "EventsCompleted") _list path;
    files_completed = option_of_yojson (value_for_key (long_of_yojson) "FilesCompleted") _list path;
    prefixes_completed = option_of_yojson (value_for_key (long_of_yojson) "PrefixesCompleted") _list path;
    prefixes_found = option_of_yojson (value_for_key (long_of_yojson) "PrefixesFound") _list path;
    
  }
  in _res

let stop_import_response_of_yojson = 
  fun tree path : stop_import_response ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_import_response = {
    import_statistics = option_of_yojson (value_for_key (import_statistics_of_yojson) "ImportStatistics") _list path;
    end_event_time = option_of_yojson (value_for_key (date_of_yojson) "EndEventTime") _list path;
    start_event_time = option_of_yojson (value_for_key (date_of_yojson) "StartEventTime") _list path;
    updated_timestamp = option_of_yojson (value_for_key (date_of_yojson) "UpdatedTimestamp") _list path;
    created_timestamp = option_of_yojson (value_for_key (date_of_yojson) "CreatedTimestamp") _list path;
    import_status = option_of_yojson (value_for_key (import_status_of_yojson) "ImportStatus") _list path;
    destinations = option_of_yojson (value_for_key (import_destinations_of_yojson) "Destinations") _list path;
    import_source = option_of_yojson (value_for_key (import_source_of_yojson) "ImportSource") _list path;
    import_id = option_of_yojson (value_for_key (uui_d_of_yojson) "ImportId") _list path;
    
  }
  in _res

let stop_import_request_of_yojson = 
  fun tree path : stop_import_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_import_request = {
    import_id = value_for_key (uui_d_of_yojson) "ImportId" _list path;
    
  }
  in _res

let import_not_found_exception_of_yojson = 
  fun tree path : import_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : import_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let stop_event_data_store_ingestion_response_of_yojson = 
  fun tree path : stop_event_data_store_ingestion_response ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_event_data_store_ingestion_response = ()
  in _res

let stop_event_data_store_ingestion_request_of_yojson = 
  fun tree path : stop_event_data_store_ingestion_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_event_data_store_ingestion_request = {
    event_data_store = value_for_key (event_data_store_arn_of_yojson) "EventDataStore" _list path;
    
  }
  in _res

let invalid_event_data_store_status_exception_of_yojson = 
  fun tree path : invalid_event_data_store_status_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_event_data_store_status_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let start_query_response_of_yojson = 
  fun tree path : start_query_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_query_response = {
    query_id = option_of_yojson (value_for_key (uui_d_of_yojson) "QueryId") _list path;
    
  }
  in _res

let query_statement_of_yojson = string_of_yojson

let delivery_s3_uri_of_yojson = string_of_yojson

let query_alias_of_yojson = string_of_yojson

let query_parameter_of_yojson = string_of_yojson

let query_parameters_of_yojson = 
  fun tree path -> list_of_yojson query_parameter_of_yojson tree path 

let start_query_request_of_yojson = 
  fun tree path : start_query_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_query_request = {
    query_parameters = option_of_yojson (value_for_key (query_parameters_of_yojson) "QueryParameters") _list path;
    query_alias = option_of_yojson (value_for_key (query_alias_of_yojson) "QueryAlias") _list path;
    delivery_s3_uri = option_of_yojson (value_for_key (delivery_s3_uri_of_yojson) "DeliveryS3Uri") _list path;
    query_statement = option_of_yojson (value_for_key (query_statement_of_yojson) "QueryStatement") _list path;
    
  }
  in _res

let max_concurrent_queries_exception_of_yojson = 
  fun tree path : max_concurrent_queries_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : max_concurrent_queries_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_query_statement_exception_of_yojson = 
  fun tree path : invalid_query_statement_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_query_statement_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let start_logging_response_of_yojson = 
  fun tree path : start_logging_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_logging_response = ()
  in _res

let start_logging_request_of_yojson = 
  fun tree path : start_logging_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_logging_request = {
    name = value_for_key (string__of_yojson) "Name" _list path;
    
  }
  in _res

let start_import_response_of_yojson = 
  fun tree path : start_import_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_import_response = {
    updated_timestamp = option_of_yojson (value_for_key (date_of_yojson) "UpdatedTimestamp") _list path;
    created_timestamp = option_of_yojson (value_for_key (date_of_yojson) "CreatedTimestamp") _list path;
    import_status = option_of_yojson (value_for_key (import_status_of_yojson) "ImportStatus") _list path;
    end_event_time = option_of_yojson (value_for_key (date_of_yojson) "EndEventTime") _list path;
    start_event_time = option_of_yojson (value_for_key (date_of_yojson) "StartEventTime") _list path;
    import_source = option_of_yojson (value_for_key (import_source_of_yojson) "ImportSource") _list path;
    destinations = option_of_yojson (value_for_key (import_destinations_of_yojson) "Destinations") _list path;
    import_id = option_of_yojson (value_for_key (uui_d_of_yojson) "ImportId") _list path;
    
  }
  in _res

let start_import_request_of_yojson = 
  fun tree path : start_import_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_import_request = {
    import_id = option_of_yojson (value_for_key (uui_d_of_yojson) "ImportId") _list path;
    end_event_time = option_of_yojson (value_for_key (date_of_yojson) "EndEventTime") _list path;
    start_event_time = option_of_yojson (value_for_key (date_of_yojson) "StartEventTime") _list path;
    import_source = option_of_yojson (value_for_key (import_source_of_yojson) "ImportSource") _list path;
    destinations = option_of_yojson (value_for_key (import_destinations_of_yojson) "Destinations") _list path;
    
  }
  in _res

let invalid_import_source_exception_of_yojson = 
  fun tree path : invalid_import_source_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_import_source_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let account_has_ongoing_import_exception_of_yojson = 
  fun tree path : account_has_ongoing_import_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : account_has_ongoing_import_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let start_event_data_store_ingestion_response_of_yojson = 
  fun tree path : start_event_data_store_ingestion_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_event_data_store_ingestion_response = ()
  in _res

let start_event_data_store_ingestion_request_of_yojson = 
  fun tree path : start_event_data_store_ingestion_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_event_data_store_ingestion_request = {
    event_data_store = value_for_key (event_data_store_arn_of_yojson) "EventDataStore" _list path;
    
  }
  in _res

let source_config_of_yojson = 
  fun tree path : source_config ->
  let _list = assoc_of_yojson tree path in
  let _res : source_config = {
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    apply_to_all_regions = option_of_yojson (value_for_key (boolean__of_yojson) "ApplyToAllRegions") _list path;
    
  }
  in _res

let restore_event_data_store_response_of_yojson = 
  fun tree path : restore_event_data_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : restore_event_data_store_response = {
    billing_mode = option_of_yojson (value_for_key (billing_mode_of_yojson) "BillingMode") _list path;
    kms_key_id = option_of_yojson (value_for_key (event_data_store_kms_key_id_of_yojson) "KmsKeyId") _list path;
    updated_timestamp = option_of_yojson (value_for_key (date_of_yojson) "UpdatedTimestamp") _list path;
    created_timestamp = option_of_yojson (value_for_key (date_of_yojson) "CreatedTimestamp") _list path;
    termination_protection_enabled = option_of_yojson (value_for_key (termination_protection_enabled_of_yojson) "TerminationProtectionEnabled") _list path;
    retention_period = option_of_yojson (value_for_key (retention_period_of_yojson) "RetentionPeriod") _list path;
    organization_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "OrganizationEnabled") _list path;
    multi_region_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "MultiRegionEnabled") _list path;
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    status = option_of_yojson (value_for_key (event_data_store_status_of_yojson) "Status") _list path;
    name = option_of_yojson (value_for_key (event_data_store_name_of_yojson) "Name") _list path;
    event_data_store_arn = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStoreArn") _list path;
    
  }
  in _res

let restore_event_data_store_request_of_yojson = 
  fun tree path : restore_event_data_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : restore_event_data_store_request = {
    event_data_store = value_for_key (event_data_store_arn_of_yojson) "EventDataStore" _list path;
    
  }
  in _res

let event_data_store_max_limit_exceeded_exception_of_yojson = 
  fun tree path : event_data_store_max_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : event_data_store_max_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let resource_type_not_supported_exception_of_yojson = 
  fun tree path : resource_type_not_supported_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_type_not_supported_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let resource_tag_of_yojson = 
  fun tree path : resource_tag ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_tag = {
    tags_list = option_of_yojson (value_for_key (tags_list_of_yojson) "TagsList") _list path;
    resource_id = option_of_yojson (value_for_key (string__of_yojson) "ResourceId") _list path;
    
  }
  in _res

let resource_tag_list_of_yojson = 
  fun tree path -> list_of_yojson resource_tag_of_yojson tree path 

let resource_policy_not_valid_exception_of_yojson = 
  fun tree path : resource_policy_not_valid_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_policy_not_valid_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let resource_policy_not_found_exception_of_yojson = 
  fun tree path : resource_policy_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_policy_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let resource_policy_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let resource_of_yojson = 
  fun tree path : resource ->
  let _list = assoc_of_yojson tree path in
  let _res : resource = {
    resource_name = option_of_yojson (value_for_key (string__of_yojson) "ResourceName") _list path;
    resource_type = option_of_yojson (value_for_key (string__of_yojson) "ResourceType") _list path;
    
  }
  in _res

let resource_list_of_yojson = 
  fun tree path -> list_of_yojson resource_of_yojson tree path 

let resource_id_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let resource_arn_of_yojson = string_of_yojson

let resource_arn_not_valid_exception_of_yojson = 
  fun tree path : resource_arn_not_valid_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_arn_not_valid_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let remove_tags_response_of_yojson = 
  fun tree path : remove_tags_response ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_tags_response = ()
  in _res

let remove_tags_request_of_yojson = 
  fun tree path : remove_tags_request ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_tags_request = {
    tags_list = value_for_key (tags_list_of_yojson) "TagsList" _list path;
    resource_id = value_for_key (string__of_yojson) "ResourceId" _list path;
    
  }
  in _res

let invalid_tag_parameter_exception_of_yojson = 
  fun tree path : invalid_tag_parameter_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_tag_parameter_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let register_organization_delegated_admin_response_of_yojson = 
  fun tree path : register_organization_delegated_admin_response ->
  let _list = assoc_of_yojson tree path in
  let _res : register_organization_delegated_admin_response = ()
  in _res

let account_id_of_yojson = string_of_yojson

let register_organization_delegated_admin_request_of_yojson = 
  fun tree path : register_organization_delegated_admin_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_organization_delegated_admin_request = {
    member_account_id = value_for_key (account_id_of_yojson) "MemberAccountId" _list path;
    
  }
  in _res

let not_organization_management_account_exception_of_yojson = 
  fun tree path : not_organization_management_account_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : not_organization_management_account_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let delegated_admin_account_limit_exceeded_exception_of_yojson = 
  fun tree path : delegated_admin_account_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : delegated_admin_account_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let cannot_delegate_management_account_exception_of_yojson = 
  fun tree path : cannot_delegate_management_account_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cannot_delegate_management_account_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let account_registered_exception_of_yojson = 
  fun tree path : account_registered_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : account_registered_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let account_not_found_exception_of_yojson = 
  fun tree path : account_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : account_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let read_write_type_of_yojson = 
  fun (tree: t) path : read_write_type -> match tree with 
    | `String "All" -> All
    | `String "WriteOnly" -> WriteOnly
    | `String "ReadOnly" -> ReadOnly
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReadWriteType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReadWriteType")

let query_status_of_yojson = 
  fun (tree: t) path : query_status -> match tree with 
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "CANCELLED" -> CANCELLED
    | `String "FAILED" -> FAILED
    | `String "FINISHED" -> FINISHED
    | `String "RUNNING" -> RUNNING
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "QueryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "QueryStatus")

let integer__of_yojson = int_of_yojson

let query_statistics_for_describe_query_of_yojson = 
  fun tree path : query_statistics_for_describe_query ->
  let _list = assoc_of_yojson tree path in
  let _res : query_statistics_for_describe_query = {
    creation_time = option_of_yojson (value_for_key (date_of_yojson) "CreationTime") _list path;
    execution_time_in_millis = option_of_yojson (value_for_key (integer__of_yojson) "ExecutionTimeInMillis") _list path;
    bytes_scanned = option_of_yojson (value_for_key (long_of_yojson) "BytesScanned") _list path;
    events_scanned = option_of_yojson (value_for_key (long_of_yojson) "EventsScanned") _list path;
    events_matched = option_of_yojson (value_for_key (long_of_yojson) "EventsMatched") _list path;
    
  }
  in _res

let query_statistics_of_yojson = 
  fun tree path : query_statistics ->
  let _list = assoc_of_yojson tree path in
  let _res : query_statistics = {
    bytes_scanned = option_of_yojson (value_for_key (long_of_yojson) "BytesScanned") _list path;
    total_results_count = option_of_yojson (value_for_key (integer__of_yojson) "TotalResultsCount") _list path;
    results_count = option_of_yojson (value_for_key (integer__of_yojson) "ResultsCount") _list path;
    
  }
  in _res

let query_result_value_of_yojson = string_of_yojson

let query_result_key_of_yojson = string_of_yojson

let query_result_column_of_yojson = 
  fun tree path -> map_of_yojson query_result_value_of_yojson tree path

let query_result_row_of_yojson = 
  fun tree path -> list_of_yojson query_result_column_of_yojson tree path 

let query_result_rows_of_yojson = 
  fun tree path -> list_of_yojson query_result_row_of_yojson tree path 

let query_id_not_found_exception_of_yojson = 
  fun tree path : query_id_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : query_id_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let query_of_yojson = 
  fun tree path : query ->
  let _list = assoc_of_yojson tree path in
  let _res : query = {
    creation_time = option_of_yojson (value_for_key (date_of_yojson) "CreationTime") _list path;
    query_status = option_of_yojson (value_for_key (query_status_of_yojson) "QueryStatus") _list path;
    query_id = option_of_yojson (value_for_key (uui_d_of_yojson) "QueryId") _list path;
    
  }
  in _res

let queries_of_yojson = 
  fun tree path -> list_of_yojson query_of_yojson tree path 

let put_resource_policy_response_of_yojson = 
  fun tree path : put_resource_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_resource_policy_response = {
    resource_policy = option_of_yojson (value_for_key (resource_policy_of_yojson) "ResourcePolicy") _list path;
    resource_arn = option_of_yojson (value_for_key (resource_arn_of_yojson) "ResourceArn") _list path;
    
  }
  in _res

let put_resource_policy_request_of_yojson = 
  fun tree path : put_resource_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_resource_policy_request = {
    resource_policy = value_for_key (resource_policy_of_yojson) "ResourcePolicy" _list path;
    resource_arn = value_for_key (resource_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let insight_type_of_yojson = 
  fun (tree: t) path : insight_type -> match tree with 
    | `String "ApiErrorRateInsight" -> ApiErrorRateInsight
    | `String "ApiCallRateInsight" -> ApiCallRateInsight
    | `String value -> raise (deserialize_unknown_enum_value_error path "InsightType" value)
    | _ -> raise (deserialize_wrong_type_error path "InsightType")

let insight_selector_of_yojson = 
  fun tree path : insight_selector ->
  let _list = assoc_of_yojson tree path in
  let _res : insight_selector = {
    insight_type = option_of_yojson (value_for_key (insight_type_of_yojson) "InsightType") _list path;
    
  }
  in _res

let insight_selectors_of_yojson = 
  fun tree path -> list_of_yojson insight_selector_of_yojson tree path 

let put_insight_selectors_response_of_yojson = 
  fun tree path : put_insight_selectors_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_insight_selectors_response = {
    insights_destination = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "InsightsDestination") _list path;
    event_data_store_arn = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStoreArn") _list path;
    insight_selectors = option_of_yojson (value_for_key (insight_selectors_of_yojson) "InsightSelectors") _list path;
    trail_ar_n = option_of_yojson (value_for_key (string__of_yojson) "TrailARN") _list path;
    
  }
  in _res

let put_insight_selectors_request_of_yojson = 
  fun tree path : put_insight_selectors_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_insight_selectors_request = {
    insights_destination = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "InsightsDestination") _list path;
    event_data_store = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStore") _list path;
    insight_selectors = value_for_key (insight_selectors_of_yojson) "InsightSelectors" _list path;
    trail_name = option_of_yojson (value_for_key (string__of_yojson) "TrailName") _list path;
    
  }
  in _res

let data_resource_values_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let data_resource_of_yojson = 
  fun tree path : data_resource ->
  let _list = assoc_of_yojson tree path in
  let _res : data_resource = {
    values = option_of_yojson (value_for_key (data_resource_values_of_yojson) "Values") _list path;
    type_ = option_of_yojson (value_for_key (string__of_yojson) "Type") _list path;
    
  }
  in _res

let data_resources_of_yojson = 
  fun tree path -> list_of_yojson data_resource_of_yojson tree path 

let exclude_management_event_sources_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let event_selector_of_yojson = 
  fun tree path : event_selector ->
  let _list = assoc_of_yojson tree path in
  let _res : event_selector = {
    exclude_management_event_sources = option_of_yojson (value_for_key (exclude_management_event_sources_of_yojson) "ExcludeManagementEventSources") _list path;
    data_resources = option_of_yojson (value_for_key (data_resources_of_yojson) "DataResources") _list path;
    include_management_events = option_of_yojson (value_for_key (boolean__of_yojson) "IncludeManagementEvents") _list path;
    read_write_type = option_of_yojson (value_for_key (read_write_type_of_yojson) "ReadWriteType") _list path;
    
  }
  in _res

let event_selectors_of_yojson = 
  fun tree path -> list_of_yojson event_selector_of_yojson tree path 

let put_event_selectors_response_of_yojson = 
  fun tree path : put_event_selectors_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_event_selectors_response = {
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    event_selectors = option_of_yojson (value_for_key (event_selectors_of_yojson) "EventSelectors") _list path;
    trail_ar_n = option_of_yojson (value_for_key (string__of_yojson) "TrailARN") _list path;
    
  }
  in _res

let put_event_selectors_request_of_yojson = 
  fun tree path : put_event_selectors_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_event_selectors_request = {
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    event_selectors = option_of_yojson (value_for_key (event_selectors_of_yojson) "EventSelectors") _list path;
    trail_name = value_for_key (string__of_yojson) "TrailName" _list path;
    
  }
  in _res

let byte_buffer_of_yojson = blob_of_yojson

let public_key_of_yojson = 
  fun tree path : public_key ->
  let _list = assoc_of_yojson tree path in
  let _res : public_key = {
    fingerprint = option_of_yojson (value_for_key (string__of_yojson) "Fingerprint") _list path;
    validity_end_time = option_of_yojson (value_for_key (date_of_yojson) "ValidityEndTime") _list path;
    validity_start_time = option_of_yojson (value_for_key (date_of_yojson) "ValidityStartTime") _list path;
    value = option_of_yojson (value_for_key (byte_buffer_of_yojson) "Value") _list path;
    
  }
  in _res

let public_key_list_of_yojson = 
  fun tree path -> list_of_yojson public_key_of_yojson tree path 

let partition_key_type_of_yojson = string_of_yojson

let partition_key_name_of_yojson = string_of_yojson

let partition_key_of_yojson = 
  fun tree path : partition_key ->
  let _list = assoc_of_yojson tree path in
  let _res : partition_key = {
    type_ = value_for_key (partition_key_type_of_yojson) "Type" _list path;
    name = value_for_key (partition_key_name_of_yojson) "Name" _list path;
    
  }
  in _res

let partition_key_list_of_yojson = 
  fun tree path -> list_of_yojson partition_key_of_yojson tree path 

let pagination_token_of_yojson = string_of_yojson

let next_token_of_yojson = string_of_yojson

let maximum_number_of_trails_exceeded_exception_of_yojson = 
  fun tree path : maximum_number_of_trails_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : maximum_number_of_trails_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let max_results_of_yojson = int_of_yojson

let max_query_results_of_yojson = int_of_yojson

let event_of_yojson = 
  fun tree path : event ->
  let _list = assoc_of_yojson tree path in
  let _res : event = {
    cloud_trail_event = option_of_yojson (value_for_key (string__of_yojson) "CloudTrailEvent") _list path;
    resources = option_of_yojson (value_for_key (resource_list_of_yojson) "Resources") _list path;
    username = option_of_yojson (value_for_key (string__of_yojson) "Username") _list path;
    event_source = option_of_yojson (value_for_key (string__of_yojson) "EventSource") _list path;
    event_time = option_of_yojson (value_for_key (date_of_yojson) "EventTime") _list path;
    access_key_id = option_of_yojson (value_for_key (string__of_yojson) "AccessKeyId") _list path;
    read_only = option_of_yojson (value_for_key (string__of_yojson) "ReadOnly") _list path;
    event_name = option_of_yojson (value_for_key (string__of_yojson) "EventName") _list path;
    event_id = option_of_yojson (value_for_key (string__of_yojson) "EventId") _list path;
    
  }
  in _res

let events_list_of_yojson = 
  fun tree path -> list_of_yojson event_of_yojson tree path 

let lookup_events_response_of_yojson = 
  fun tree path : lookup_events_response ->
  let _list = assoc_of_yojson tree path in
  let _res : lookup_events_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    events = option_of_yojson (value_for_key (events_list_of_yojson) "Events") _list path;
    
  }
  in _res

let lookup_attribute_key_of_yojson = 
  fun (tree: t) path : lookup_attribute_key -> match tree with 
    | `String "AccessKeyId" -> ACCESS_KEY_ID
    | `String "EventSource" -> EVENT_SOURCE
    | `String "ResourceName" -> RESOURCE_NAME
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "Username" -> USERNAME
    | `String "ReadOnly" -> READ_ONLY
    | `String "EventName" -> EVENT_NAME
    | `String "EventId" -> EVENT_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "LookupAttributeKey" value)
    | _ -> raise (deserialize_wrong_type_error path "LookupAttributeKey")

let lookup_attribute_value_of_yojson = string_of_yojson

let lookup_attribute_of_yojson = 
  fun tree path : lookup_attribute ->
  let _list = assoc_of_yojson tree path in
  let _res : lookup_attribute = {
    attribute_value = value_for_key (lookup_attribute_value_of_yojson) "AttributeValue" _list path;
    attribute_key = value_for_key (lookup_attribute_key_of_yojson) "AttributeKey" _list path;
    
  }
  in _res

let lookup_attributes_list_of_yojson = 
  fun tree path -> list_of_yojson lookup_attribute_of_yojson tree path 

let event_category_of_yojson = 
  fun (tree: t) path : event_category -> match tree with 
    | `String "insight" -> Insight
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "EventCategory")

let lookup_events_request_of_yojson = 
  fun tree path : lookup_events_request ->
  let _list = assoc_of_yojson tree path in
  let _res : lookup_events_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    event_category = option_of_yojson (value_for_key (event_category_of_yojson) "EventCategory") _list path;
    end_time = option_of_yojson (value_for_key (date_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_of_yojson) "StartTime") _list path;
    lookup_attributes = option_of_yojson (value_for_key (lookup_attributes_list_of_yojson) "LookupAttributes") _list path;
    
  }
  in _res

let invalid_time_range_exception_of_yojson = 
  fun tree path : invalid_time_range_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_time_range_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_next_token_exception_of_yojson = 
  fun tree path : invalid_next_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_next_token_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_max_results_exception_of_yojson = 
  fun tree path : invalid_max_results_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_max_results_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_lookup_attributes_exception_of_yojson = 
  fun tree path : invalid_lookup_attributes_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_lookup_attributes_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_event_category_exception_of_yojson = 
  fun tree path : invalid_event_category_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_event_category_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let list_trails_response_of_yojson = 
  fun tree path : list_trails_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_trails_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    trails = option_of_yojson (value_for_key (trails_of_yojson) "Trails") _list path;
    
  }
  in _res

let list_trails_request_of_yojson = 
  fun tree path : list_trails_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_trails_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let list_tags_response_of_yojson = 
  fun tree path : list_tags_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    resource_tag_list = option_of_yojson (value_for_key (resource_tag_list_of_yojson) "ResourceTagList") _list path;
    
  }
  in _res

let list_tags_request_of_yojson = 
  fun tree path : list_tags_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    resource_id_list = value_for_key (resource_id_list_of_yojson) "ResourceIdList" _list path;
    
  }
  in _res

let invalid_token_exception_of_yojson = 
  fun tree path : invalid_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_token_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let list_queries_response_of_yojson = 
  fun tree path : list_queries_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_queries_response = {
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    queries = option_of_yojson (value_for_key (queries_of_yojson) "Queries") _list path;
    
  }
  in _res

let list_queries_max_results_count_of_yojson = int_of_yojson

let list_queries_request_of_yojson = 
  fun tree path : list_queries_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_queries_request = {
    query_status = option_of_yojson (value_for_key (query_status_of_yojson) "QueryStatus") _list path;
    end_time = option_of_yojson (value_for_key (date_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_of_yojson) "StartTime") _list path;
    max_results = option_of_yojson (value_for_key (list_queries_max_results_count_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    event_data_store = value_for_key (event_data_store_arn_of_yojson) "EventDataStore" _list path;
    
  }
  in _res

let invalid_query_status_exception_of_yojson = 
  fun tree path : invalid_query_status_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_query_status_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_date_range_exception_of_yojson = 
  fun tree path : invalid_date_range_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_date_range_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let list_public_keys_response_of_yojson = 
  fun tree path : list_public_keys_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_public_keys_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    public_key_list = option_of_yojson (value_for_key (public_key_list_of_yojson) "PublicKeyList") _list path;
    
  }
  in _res

let list_public_keys_request_of_yojson = 
  fun tree path : list_public_keys_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_public_keys_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    end_time = option_of_yojson (value_for_key (date_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_of_yojson) "StartTime") _list path;
    
  }
  in _res

let event_source_of_yojson = string_of_yojson

let event_name_of_yojson = string_of_yojson

let error_code_of_yojson = string_of_yojson

let double_of_yojson = double_of_yojson

let insights_metric_values_of_yojson = 
  fun tree path -> list_of_yojson double_of_yojson tree path 

let insights_metric_next_token_of_yojson = string_of_yojson

let list_insights_metric_data_response_of_yojson = 
  fun tree path : list_insights_metric_data_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_insights_metric_data_response = {
    next_token = option_of_yojson (value_for_key (insights_metric_next_token_of_yojson) "NextToken") _list path;
    values = option_of_yojson (value_for_key (insights_metric_values_of_yojson) "Values") _list path;
    timestamps = option_of_yojson (value_for_key (timestamps_of_yojson) "Timestamps") _list path;
    error_code = option_of_yojson (value_for_key (error_code_of_yojson) "ErrorCode") _list path;
    insight_type = option_of_yojson (value_for_key (insight_type_of_yojson) "InsightType") _list path;
    event_name = option_of_yojson (value_for_key (event_name_of_yojson) "EventName") _list path;
    event_source = option_of_yojson (value_for_key (event_source_of_yojson) "EventSource") _list path;
    
  }
  in _res

let insights_metric_period_of_yojson = int_of_yojson

let insights_metric_data_type_of_yojson = 
  fun (tree: t) path : insights_metric_data_type -> match tree with 
    | `String "NonZeroData" -> NON_ZERO_DATA
    | `String "FillWithZeros" -> FILL_WITH_ZEROS
    | `String value -> raise (deserialize_unknown_enum_value_error path "InsightsMetricDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "InsightsMetricDataType")

let insights_metric_max_results_of_yojson = int_of_yojson

let list_insights_metric_data_request_of_yojson = 
  fun tree path : list_insights_metric_data_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_insights_metric_data_request = {
    next_token = option_of_yojson (value_for_key (insights_metric_next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (insights_metric_max_results_of_yojson) "MaxResults") _list path;
    data_type = option_of_yojson (value_for_key (insights_metric_data_type_of_yojson) "DataType") _list path;
    period = option_of_yojson (value_for_key (insights_metric_period_of_yojson) "Period") _list path;
    end_time = option_of_yojson (value_for_key (date_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_of_yojson) "StartTime") _list path;
    error_code = option_of_yojson (value_for_key (error_code_of_yojson) "ErrorCode") _list path;
    insight_type = value_for_key (insight_type_of_yojson) "InsightType" _list path;
    event_name = value_for_key (event_name_of_yojson) "EventName" _list path;
    event_source = value_for_key (event_source_of_yojson) "EventSource" _list path;
    
  }
  in _res

let imports_list_item_of_yojson = 
  fun tree path : imports_list_item ->
  let _list = assoc_of_yojson tree path in
  let _res : imports_list_item = {
    updated_timestamp = option_of_yojson (value_for_key (date_of_yojson) "UpdatedTimestamp") _list path;
    created_timestamp = option_of_yojson (value_for_key (date_of_yojson) "CreatedTimestamp") _list path;
    destinations = option_of_yojson (value_for_key (import_destinations_of_yojson) "Destinations") _list path;
    import_status = option_of_yojson (value_for_key (import_status_of_yojson) "ImportStatus") _list path;
    import_id = option_of_yojson (value_for_key (uui_d_of_yojson) "ImportId") _list path;
    
  }
  in _res

let imports_list_of_yojson = 
  fun tree path -> list_of_yojson imports_list_item_of_yojson tree path 

let list_imports_response_of_yojson = 
  fun tree path : list_imports_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_imports_response = {
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    imports = option_of_yojson (value_for_key (imports_list_of_yojson) "Imports") _list path;
    
  }
  in _res

let list_imports_max_results_count_of_yojson = int_of_yojson

let list_imports_request_of_yojson = 
  fun tree path : list_imports_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_imports_request = {
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    import_status = option_of_yojson (value_for_key (import_status_of_yojson) "ImportStatus") _list path;
    destination = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "Destination") _list path;
    max_results = option_of_yojson (value_for_key (list_imports_max_results_count_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let import_failure_status_of_yojson = 
  fun (tree: t) path : import_failure_status -> match tree with 
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RETRY" -> RETRY
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportFailureStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportFailureStatus")

let import_failure_list_item_of_yojson = 
  fun tree path : import_failure_list_item ->
  let _list = assoc_of_yojson tree path in
  let _res : import_failure_list_item = {
    last_updated_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdatedTime") _list path;
    error_message = option_of_yojson (value_for_key (string__of_yojson) "ErrorMessage") _list path;
    error_type = option_of_yojson (value_for_key (string__of_yojson) "ErrorType") _list path;
    status = option_of_yojson (value_for_key (import_failure_status_of_yojson) "Status") _list path;
    location = option_of_yojson (value_for_key (string__of_yojson) "Location") _list path;
    
  }
  in _res

let import_failure_list_of_yojson = 
  fun tree path -> list_of_yojson import_failure_list_item_of_yojson tree path 

let list_import_failures_response_of_yojson = 
  fun tree path : list_import_failures_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_import_failures_response = {
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    failures = option_of_yojson (value_for_key (import_failure_list_of_yojson) "Failures") _list path;
    
  }
  in _res

let list_import_failures_max_results_count_of_yojson = int_of_yojson

let list_import_failures_request_of_yojson = 
  fun tree path : list_import_failures_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_import_failures_request = {
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_import_failures_max_results_count_of_yojson) "MaxResults") _list path;
    import_id = value_for_key (uui_d_of_yojson) "ImportId" _list path;
    
  }
  in _res

let event_data_store_of_yojson = 
  fun tree path : event_data_store ->
  let _list = assoc_of_yojson tree path in
  let _res : event_data_store = {
    updated_timestamp = option_of_yojson (value_for_key (date_of_yojson) "UpdatedTimestamp") _list path;
    created_timestamp = option_of_yojson (value_for_key (date_of_yojson) "CreatedTimestamp") _list path;
    retention_period = option_of_yojson (value_for_key (retention_period_of_yojson) "RetentionPeriod") _list path;
    organization_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "OrganizationEnabled") _list path;
    multi_region_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "MultiRegionEnabled") _list path;
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    status = option_of_yojson (value_for_key (event_data_store_status_of_yojson) "Status") _list path;
    termination_protection_enabled = option_of_yojson (value_for_key (termination_protection_enabled_of_yojson) "TerminationProtectionEnabled") _list path;
    name = option_of_yojson (value_for_key (event_data_store_name_of_yojson) "Name") _list path;
    event_data_store_arn = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStoreArn") _list path;
    
  }
  in _res

let event_data_stores_of_yojson = 
  fun tree path -> list_of_yojson event_data_store_of_yojson tree path 

let list_event_data_stores_response_of_yojson = 
  fun tree path : list_event_data_stores_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_event_data_stores_response = {
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    event_data_stores = option_of_yojson (value_for_key (event_data_stores_of_yojson) "EventDataStores") _list path;
    
  }
  in _res

let list_event_data_stores_max_results_count_of_yojson = int_of_yojson

let list_event_data_stores_request_of_yojson = 
  fun tree path : list_event_data_stores_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_event_data_stores_request = {
    max_results = option_of_yojson (value_for_key (list_event_data_stores_max_results_count_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let channel_of_yojson = 
  fun tree path : channel ->
  let _list = assoc_of_yojson tree path in
  let _res : channel = {
    name = option_of_yojson (value_for_key (channel_name_of_yojson) "Name") _list path;
    channel_arn = option_of_yojson (value_for_key (channel_arn_of_yojson) "ChannelArn") _list path;
    
  }
  in _res

let channels_of_yojson = 
  fun tree path -> list_of_yojson channel_of_yojson tree path 

let list_channels_response_of_yojson = 
  fun tree path : list_channels_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_channels_response = {
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    channels = option_of_yojson (value_for_key (channels_of_yojson) "Channels") _list path;
    
  }
  in _res

let list_channels_max_results_count_of_yojson = int_of_yojson

let list_channels_request_of_yojson = 
  fun tree path : list_channels_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_channels_request = {
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_channels_max_results_count_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let invalid_source_exception_of_yojson = 
  fun tree path : invalid_source_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_source_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let insight_not_enabled_exception_of_yojson = 
  fun tree path : insight_not_enabled_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : insight_not_enabled_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let ingestion_status_of_yojson = 
  fun tree path : ingestion_status ->
  let _list = assoc_of_yojson tree path in
  let _res : ingestion_status = {
    latest_ingestion_attempt_event_i_d = option_of_yojson (value_for_key (uui_d_of_yojson) "LatestIngestionAttemptEventID") _list path;
    latest_ingestion_attempt_time = option_of_yojson (value_for_key (date_of_yojson) "LatestIngestionAttemptTime") _list path;
    latest_ingestion_error_code = option_of_yojson (value_for_key (error_message_of_yojson) "LatestIngestionErrorCode") _list path;
    latest_ingestion_success_event_i_d = option_of_yojson (value_for_key (uui_d_of_yojson) "LatestIngestionSuccessEventID") _list path;
    latest_ingestion_success_time = option_of_yojson (value_for_key (date_of_yojson) "LatestIngestionSuccessTime") _list path;
    
  }
  in _res

let inactive_query_exception_of_yojson = 
  fun tree path : inactive_query_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : inactive_query_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let get_trail_status_response_of_yojson = 
  fun tree path : get_trail_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_trail_status_response = {
    time_logging_stopped = option_of_yojson (value_for_key (string__of_yojson) "TimeLoggingStopped") _list path;
    time_logging_started = option_of_yojson (value_for_key (string__of_yojson) "TimeLoggingStarted") _list path;
    latest_delivery_attempt_succeeded = option_of_yojson (value_for_key (string__of_yojson) "LatestDeliveryAttemptSucceeded") _list path;
    latest_notification_attempt_succeeded = option_of_yojson (value_for_key (string__of_yojson) "LatestNotificationAttemptSucceeded") _list path;
    latest_notification_attempt_time = option_of_yojson (value_for_key (string__of_yojson) "LatestNotificationAttemptTime") _list path;
    latest_delivery_attempt_time = option_of_yojson (value_for_key (string__of_yojson) "LatestDeliveryAttemptTime") _list path;
    latest_digest_delivery_error = option_of_yojson (value_for_key (string__of_yojson) "LatestDigestDeliveryError") _list path;
    latest_digest_delivery_time = option_of_yojson (value_for_key (date_of_yojson) "LatestDigestDeliveryTime") _list path;
    latest_cloud_watch_logs_delivery_time = option_of_yojson (value_for_key (date_of_yojson) "LatestCloudWatchLogsDeliveryTime") _list path;
    latest_cloud_watch_logs_delivery_error = option_of_yojson (value_for_key (string__of_yojson) "LatestCloudWatchLogsDeliveryError") _list path;
    stop_logging_time = option_of_yojson (value_for_key (date_of_yojson) "StopLoggingTime") _list path;
    start_logging_time = option_of_yojson (value_for_key (date_of_yojson) "StartLoggingTime") _list path;
    latest_notification_time = option_of_yojson (value_for_key (date_of_yojson) "LatestNotificationTime") _list path;
    latest_delivery_time = option_of_yojson (value_for_key (date_of_yojson) "LatestDeliveryTime") _list path;
    latest_notification_error = option_of_yojson (value_for_key (string__of_yojson) "LatestNotificationError") _list path;
    latest_delivery_error = option_of_yojson (value_for_key (string__of_yojson) "LatestDeliveryError") _list path;
    is_logging = option_of_yojson (value_for_key (boolean__of_yojson) "IsLogging") _list path;
    
  }
  in _res

let get_trail_status_request_of_yojson = 
  fun tree path : get_trail_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_trail_status_request = {
    name = value_for_key (string__of_yojson) "Name" _list path;
    
  }
  in _res

let get_trail_response_of_yojson = 
  fun tree path : get_trail_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_trail_response = {
    trail = option_of_yojson (value_for_key (trail_of_yojson) "Trail") _list path;
    
  }
  in _res

let get_trail_request_of_yojson = 
  fun tree path : get_trail_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_trail_request = {
    name = value_for_key (string__of_yojson) "Name" _list path;
    
  }
  in _res

let get_resource_policy_response_of_yojson = 
  fun tree path : get_resource_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_policy_response = {
    resource_policy = option_of_yojson (value_for_key (resource_policy_of_yojson) "ResourcePolicy") _list path;
    resource_arn = option_of_yojson (value_for_key (resource_arn_of_yojson) "ResourceArn") _list path;
    
  }
  in _res

let get_resource_policy_request_of_yojson = 
  fun tree path : get_resource_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_policy_request = {
    resource_arn = value_for_key (resource_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let get_query_results_response_of_yojson = 
  fun tree path : get_query_results_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_query_results_response = {
    error_message = option_of_yojson (value_for_key (error_message_of_yojson) "ErrorMessage") _list path;
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    query_result_rows = option_of_yojson (value_for_key (query_result_rows_of_yojson) "QueryResultRows") _list path;
    query_statistics = option_of_yojson (value_for_key (query_statistics_of_yojson) "QueryStatistics") _list path;
    query_status = option_of_yojson (value_for_key (query_status_of_yojson) "QueryStatus") _list path;
    
  }
  in _res

let get_query_results_request_of_yojson = 
  fun tree path : get_query_results_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_query_results_request = {
    max_query_results = option_of_yojson (value_for_key (max_query_results_of_yojson) "MaxQueryResults") _list path;
    next_token = option_of_yojson (value_for_key (pagination_token_of_yojson) "NextToken") _list path;
    query_id = value_for_key (uui_d_of_yojson) "QueryId" _list path;
    event_data_store = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStore") _list path;
    
  }
  in _res

let get_insight_selectors_response_of_yojson = 
  fun tree path : get_insight_selectors_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_insight_selectors_response = {
    insights_destination = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "InsightsDestination") _list path;
    event_data_store_arn = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStoreArn") _list path;
    insight_selectors = option_of_yojson (value_for_key (insight_selectors_of_yojson) "InsightSelectors") _list path;
    trail_ar_n = option_of_yojson (value_for_key (string__of_yojson) "TrailARN") _list path;
    
  }
  in _res

let get_insight_selectors_request_of_yojson = 
  fun tree path : get_insight_selectors_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_insight_selectors_request = {
    event_data_store = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStore") _list path;
    trail_name = option_of_yojson (value_for_key (string__of_yojson) "TrailName") _list path;
    
  }
  in _res

let get_import_response_of_yojson = 
  fun tree path : get_import_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_import_response = {
    import_statistics = option_of_yojson (value_for_key (import_statistics_of_yojson) "ImportStatistics") _list path;
    updated_timestamp = option_of_yojson (value_for_key (date_of_yojson) "UpdatedTimestamp") _list path;
    created_timestamp = option_of_yojson (value_for_key (date_of_yojson) "CreatedTimestamp") _list path;
    import_status = option_of_yojson (value_for_key (import_status_of_yojson) "ImportStatus") _list path;
    end_event_time = option_of_yojson (value_for_key (date_of_yojson) "EndEventTime") _list path;
    start_event_time = option_of_yojson (value_for_key (date_of_yojson) "StartEventTime") _list path;
    import_source = option_of_yojson (value_for_key (import_source_of_yojson) "ImportSource") _list path;
    destinations = option_of_yojson (value_for_key (import_destinations_of_yojson) "Destinations") _list path;
    import_id = option_of_yojson (value_for_key (uui_d_of_yojson) "ImportId") _list path;
    
  }
  in _res

let get_import_request_of_yojson = 
  fun tree path : get_import_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_import_request = {
    import_id = value_for_key (uui_d_of_yojson) "ImportId" _list path;
    
  }
  in _res

let get_event_selectors_response_of_yojson = 
  fun tree path : get_event_selectors_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_event_selectors_response = {
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    event_selectors = option_of_yojson (value_for_key (event_selectors_of_yojson) "EventSelectors") _list path;
    trail_ar_n = option_of_yojson (value_for_key (string__of_yojson) "TrailARN") _list path;
    
  }
  in _res

let get_event_selectors_request_of_yojson = 
  fun tree path : get_event_selectors_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_event_selectors_request = {
    trail_name = value_for_key (string__of_yojson) "TrailName" _list path;
    
  }
  in _res

let get_event_data_store_response_of_yojson = 
  fun tree path : get_event_data_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_event_data_store_response = {
    partition_keys = option_of_yojson (value_for_key (partition_key_list_of_yojson) "PartitionKeys") _list path;
    federation_role_arn = option_of_yojson (value_for_key (federation_role_arn_of_yojson) "FederationRoleArn") _list path;
    federation_status = option_of_yojson (value_for_key (federation_status_of_yojson) "FederationStatus") _list path;
    billing_mode = option_of_yojson (value_for_key (billing_mode_of_yojson) "BillingMode") _list path;
    kms_key_id = option_of_yojson (value_for_key (event_data_store_kms_key_id_of_yojson) "KmsKeyId") _list path;
    updated_timestamp = option_of_yojson (value_for_key (date_of_yojson) "UpdatedTimestamp") _list path;
    created_timestamp = option_of_yojson (value_for_key (date_of_yojson) "CreatedTimestamp") _list path;
    termination_protection_enabled = option_of_yojson (value_for_key (termination_protection_enabled_of_yojson) "TerminationProtectionEnabled") _list path;
    retention_period = option_of_yojson (value_for_key (retention_period_of_yojson) "RetentionPeriod") _list path;
    organization_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "OrganizationEnabled") _list path;
    multi_region_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "MultiRegionEnabled") _list path;
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    status = option_of_yojson (value_for_key (event_data_store_status_of_yojson) "Status") _list path;
    name = option_of_yojson (value_for_key (event_data_store_name_of_yojson) "Name") _list path;
    event_data_store_arn = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStoreArn") _list path;
    
  }
  in _res

let get_event_data_store_request_of_yojson = 
  fun tree path : get_event_data_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_event_data_store_request = {
    event_data_store = value_for_key (event_data_store_arn_of_yojson) "EventDataStore" _list path;
    
  }
  in _res

let get_channel_response_of_yojson = 
  fun tree path : get_channel_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_channel_response = {
    ingestion_status = option_of_yojson (value_for_key (ingestion_status_of_yojson) "IngestionStatus") _list path;
    destinations = option_of_yojson (value_for_key (destinations_of_yojson) "Destinations") _list path;
    source_config = option_of_yojson (value_for_key (source_config_of_yojson) "SourceConfig") _list path;
    source = option_of_yojson (value_for_key (source_of_yojson) "Source") _list path;
    name = option_of_yojson (value_for_key (channel_name_of_yojson) "Name") _list path;
    channel_arn = option_of_yojson (value_for_key (channel_arn_of_yojson) "ChannelArn") _list path;
    
  }
  in _res

let get_channel_request_of_yojson = 
  fun tree path : get_channel_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_channel_request = {
    channel = value_for_key (channel_arn_of_yojson) "Channel" _list path;
    
  }
  in _res

let event_data_store_termination_protected_exception_of_yojson = 
  fun tree path : event_data_store_termination_protected_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : event_data_store_termination_protected_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let event_data_store_federation_enabled_exception_of_yojson = 
  fun tree path : event_data_store_federation_enabled_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : event_data_store_federation_enabled_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let enable_federation_response_of_yojson = 
  fun tree path : enable_federation_response ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_federation_response = {
    federation_role_arn = option_of_yojson (value_for_key (federation_role_arn_of_yojson) "FederationRoleArn") _list path;
    federation_status = option_of_yojson (value_for_key (federation_status_of_yojson) "FederationStatus") _list path;
    event_data_store_arn = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStoreArn") _list path;
    
  }
  in _res

let enable_federation_request_of_yojson = 
  fun tree path : enable_federation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_federation_request = {
    federation_role_arn = value_for_key (federation_role_arn_of_yojson) "FederationRoleArn" _list path;
    event_data_store = value_for_key (event_data_store_arn_of_yojson) "EventDataStore" _list path;
    
  }
  in _res

let concurrent_modification_exception_of_yojson = 
  fun tree path : concurrent_modification_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : concurrent_modification_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let access_denied_exception_of_yojson = 
  fun tree path : access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : access_denied_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let disable_federation_response_of_yojson = 
  fun tree path : disable_federation_response ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_federation_response = {
    federation_status = option_of_yojson (value_for_key (federation_status_of_yojson) "FederationStatus") _list path;
    event_data_store_arn = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStoreArn") _list path;
    
  }
  in _res

let disable_federation_request_of_yojson = 
  fun tree path : disable_federation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_federation_request = {
    event_data_store = value_for_key (event_data_store_arn_of_yojson) "EventDataStore" _list path;
    
  }
  in _res

let describe_trails_response_of_yojson = 
  fun tree path : describe_trails_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_trails_response = {
    trail_list = option_of_yojson (value_for_key (trail_list_of_yojson) "trailList") _list path;
    
  }
  in _res

let describe_trails_request_of_yojson = 
  fun tree path : describe_trails_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_trails_request = {
    include_shadow_trails = option_of_yojson (value_for_key (boolean__of_yojson) "includeShadowTrails") _list path;
    trail_name_list = option_of_yojson (value_for_key (trail_name_list_of_yojson) "trailNameList") _list path;
    
  }
  in _res

let delivery_status_of_yojson = 
  fun (tree: t) path : delivery_status -> match tree with 
    | `String "UNKNOWN" -> UNKNOWN
    | `String "CANCELLED" -> CANCELLED
    | `String "ACCESS_DENIED_SIGNING_FILE" -> ACCESS_DENIED_SIGNING_FILE
    | `String "ACCESS_DENIED" -> ACCESS_DENIED
    | `String "RESOURCE_NOT_FOUND" -> RESOURCE_NOT_FOUND
    | `String "PENDING" -> PENDING
    | `String "FAILED_SIGNING_FILE" -> FAILED_SIGNING_FILE
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeliveryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryStatus")

let describe_query_response_of_yojson = 
  fun tree path : describe_query_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_query_response = {
    delivery_status = option_of_yojson (value_for_key (delivery_status_of_yojson) "DeliveryStatus") _list path;
    delivery_s3_uri = option_of_yojson (value_for_key (delivery_s3_uri_of_yojson) "DeliveryS3Uri") _list path;
    error_message = option_of_yojson (value_for_key (error_message_of_yojson) "ErrorMessage") _list path;
    query_statistics = option_of_yojson (value_for_key (query_statistics_for_describe_query_of_yojson) "QueryStatistics") _list path;
    query_status = option_of_yojson (value_for_key (query_status_of_yojson) "QueryStatus") _list path;
    query_string = option_of_yojson (value_for_key (query_statement_of_yojson) "QueryString") _list path;
    query_id = option_of_yojson (value_for_key (uui_d_of_yojson) "QueryId") _list path;
    
  }
  in _res

let describe_query_request_of_yojson = 
  fun tree path : describe_query_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_query_request = {
    query_alias = option_of_yojson (value_for_key (query_alias_of_yojson) "QueryAlias") _list path;
    query_id = option_of_yojson (value_for_key (uui_d_of_yojson) "QueryId") _list path;
    event_data_store = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStore") _list path;
    
  }
  in _res

let deregister_organization_delegated_admin_response_of_yojson = 
  fun tree path : deregister_organization_delegated_admin_response ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_organization_delegated_admin_response = ()
  in _res

let deregister_organization_delegated_admin_request_of_yojson = 
  fun tree path : deregister_organization_delegated_admin_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_organization_delegated_admin_request = {
    delegated_admin_account_id = value_for_key (account_id_of_yojson) "DelegatedAdminAccountId" _list path;
    
  }
  in _res

let account_not_registered_exception_of_yojson = 
  fun tree path : account_not_registered_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : account_not_registered_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let delete_trail_response_of_yojson = 
  fun tree path : delete_trail_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_trail_response = ()
  in _res

let delete_trail_request_of_yojson = 
  fun tree path : delete_trail_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_trail_request = {
    name = value_for_key (string__of_yojson) "Name" _list path;
    
  }
  in _res

let delete_resource_policy_response_of_yojson = 
  fun tree path : delete_resource_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_policy_response = ()
  in _res

let delete_resource_policy_request_of_yojson = 
  fun tree path : delete_resource_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_policy_request = {
    resource_arn = value_for_key (resource_arn_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let delete_event_data_store_response_of_yojson = 
  fun tree path : delete_event_data_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_event_data_store_response = ()
  in _res

let delete_event_data_store_request_of_yojson = 
  fun tree path : delete_event_data_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_event_data_store_request = {
    event_data_store = value_for_key (event_data_store_arn_of_yojson) "EventDataStore" _list path;
    
  }
  in _res

let channel_exists_for_eds_exception_of_yojson = 
  fun tree path : channel_exists_for_eds_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : channel_exists_for_eds_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let delete_channel_response_of_yojson = 
  fun tree path : delete_channel_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_channel_response = ()
  in _res

let delete_channel_request_of_yojson = 
  fun tree path : delete_channel_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_channel_request = {
    channel = value_for_key (channel_arn_of_yojson) "Channel" _list path;
    
  }
  in _res

let create_trail_response_of_yojson = 
  fun tree path : create_trail_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_trail_response = {
    is_organization_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsOrganizationTrail") _list path;
    kms_key_id = option_of_yojson (value_for_key (string__of_yojson) "KmsKeyId") _list path;
    cloud_watch_logs_role_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsRoleArn") _list path;
    cloud_watch_logs_log_group_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsLogGroupArn") _list path;
    log_file_validation_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "LogFileValidationEnabled") _list path;
    trail_ar_n = option_of_yojson (value_for_key (string__of_yojson) "TrailARN") _list path;
    is_multi_region_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsMultiRegionTrail") _list path;
    include_global_service_events = option_of_yojson (value_for_key (boolean__of_yojson) "IncludeGlobalServiceEvents") _list path;
    sns_topic_ar_n = option_of_yojson (value_for_key (string__of_yojson) "SnsTopicARN") _list path;
    sns_topic_name = option_of_yojson (value_for_key (string__of_yojson) "SnsTopicName") _list path;
    s3_key_prefix = option_of_yojson (value_for_key (string__of_yojson) "S3KeyPrefix") _list path;
    s3_bucket_name = option_of_yojson (value_for_key (string__of_yojson) "S3BucketName") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    
  }
  in _res

let create_trail_request_of_yojson = 
  fun tree path : create_trail_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_trail_request = {
    tags_list = option_of_yojson (value_for_key (tags_list_of_yojson) "TagsList") _list path;
    is_organization_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsOrganizationTrail") _list path;
    kms_key_id = option_of_yojson (value_for_key (string__of_yojson) "KmsKeyId") _list path;
    cloud_watch_logs_role_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsRoleArn") _list path;
    cloud_watch_logs_log_group_arn = option_of_yojson (value_for_key (string__of_yojson) "CloudWatchLogsLogGroupArn") _list path;
    enable_log_file_validation = option_of_yojson (value_for_key (boolean__of_yojson) "EnableLogFileValidation") _list path;
    is_multi_region_trail = option_of_yojson (value_for_key (boolean__of_yojson) "IsMultiRegionTrail") _list path;
    include_global_service_events = option_of_yojson (value_for_key (boolean__of_yojson) "IncludeGlobalServiceEvents") _list path;
    sns_topic_name = option_of_yojson (value_for_key (string__of_yojson) "SnsTopicName") _list path;
    s3_key_prefix = option_of_yojson (value_for_key (string__of_yojson) "S3KeyPrefix") _list path;
    s3_bucket_name = value_for_key (string__of_yojson) "S3BucketName" _list path;
    name = value_for_key (string__of_yojson) "Name" _list path;
    
  }
  in _res

let create_event_data_store_response_of_yojson = 
  fun tree path : create_event_data_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_event_data_store_response = {
    billing_mode = option_of_yojson (value_for_key (billing_mode_of_yojson) "BillingMode") _list path;
    kms_key_id = option_of_yojson (value_for_key (event_data_store_kms_key_id_of_yojson) "KmsKeyId") _list path;
    updated_timestamp = option_of_yojson (value_for_key (date_of_yojson) "UpdatedTimestamp") _list path;
    created_timestamp = option_of_yojson (value_for_key (date_of_yojson) "CreatedTimestamp") _list path;
    tags_list = option_of_yojson (value_for_key (tags_list_of_yojson) "TagsList") _list path;
    termination_protection_enabled = option_of_yojson (value_for_key (termination_protection_enabled_of_yojson) "TerminationProtectionEnabled") _list path;
    retention_period = option_of_yojson (value_for_key (retention_period_of_yojson) "RetentionPeriod") _list path;
    organization_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "OrganizationEnabled") _list path;
    multi_region_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "MultiRegionEnabled") _list path;
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    status = option_of_yojson (value_for_key (event_data_store_status_of_yojson) "Status") _list path;
    name = option_of_yojson (value_for_key (event_data_store_name_of_yojson) "Name") _list path;
    event_data_store_arn = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStoreArn") _list path;
    
  }
  in _res

let create_event_data_store_request_of_yojson = 
  fun tree path : create_event_data_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_event_data_store_request = {
    billing_mode = option_of_yojson (value_for_key (billing_mode_of_yojson) "BillingMode") _list path;
    start_ingestion = option_of_yojson (value_for_key (boolean__of_yojson) "StartIngestion") _list path;
    kms_key_id = option_of_yojson (value_for_key (event_data_store_kms_key_id_of_yojson) "KmsKeyId") _list path;
    tags_list = option_of_yojson (value_for_key (tags_list_of_yojson) "TagsList") _list path;
    termination_protection_enabled = option_of_yojson (value_for_key (termination_protection_enabled_of_yojson) "TerminationProtectionEnabled") _list path;
    retention_period = option_of_yojson (value_for_key (retention_period_of_yojson) "RetentionPeriod") _list path;
    organization_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "OrganizationEnabled") _list path;
    multi_region_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "MultiRegionEnabled") _list path;
    advanced_event_selectors = option_of_yojson (value_for_key (advanced_event_selectors_of_yojson) "AdvancedEventSelectors") _list path;
    name = value_for_key (event_data_store_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_channel_response_of_yojson = 
  fun tree path : create_channel_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_channel_response = {
    tags = option_of_yojson (value_for_key (tags_list_of_yojson) "Tags") _list path;
    destinations = option_of_yojson (value_for_key (destinations_of_yojson) "Destinations") _list path;
    source = option_of_yojson (value_for_key (source_of_yojson) "Source") _list path;
    name = option_of_yojson (value_for_key (channel_name_of_yojson) "Name") _list path;
    channel_arn = option_of_yojson (value_for_key (channel_arn_of_yojson) "ChannelArn") _list path;
    
  }
  in _res

let create_channel_request_of_yojson = 
  fun tree path : create_channel_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_channel_request = {
    tags = option_of_yojson (value_for_key (tags_list_of_yojson) "Tags") _list path;
    destinations = value_for_key (destinations_of_yojson) "Destinations" _list path;
    source = value_for_key (source_of_yojson) "Source" _list path;
    name = value_for_key (channel_name_of_yojson) "Name" _list path;
    
  }
  in _res

let channel_max_limit_exceeded_exception_of_yojson = 
  fun tree path : channel_max_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : channel_max_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let cancel_query_response_of_yojson = 
  fun tree path : cancel_query_response ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_query_response = {
    query_status = value_for_key (query_status_of_yojson) "QueryStatus" _list path;
    query_id = value_for_key (uui_d_of_yojson) "QueryId" _list path;
    
  }
  in _res

let cancel_query_request_of_yojson = 
  fun tree path : cancel_query_request ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_query_request = {
    query_id = value_for_key (uui_d_of_yojson) "QueryId" _list path;
    event_data_store = option_of_yojson (value_for_key (event_data_store_arn_of_yojson) "EventDataStore") _list path;
    
  }
  in _res

let add_tags_response_of_yojson = 
  fun tree path : add_tags_response ->
  let _list = assoc_of_yojson tree path in
  let _res : add_tags_response = ()
  in _res

let add_tags_request_of_yojson = 
  fun tree path : add_tags_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_tags_request = {
    tags_list = value_for_key (tags_list_of_yojson) "TagsList" _list path;
    resource_id = value_for_key (string__of_yojson) "ResourceId" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

