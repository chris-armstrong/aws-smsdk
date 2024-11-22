open Smaws_Lib.Json.SerializeHelpers

open Types

let string__to_yojson = string_to_yojson

let boolean__to_yojson = bool_to_yojson

let update_trail_response_to_yojson = 
  fun (x: update_trail_response) -> assoc_to_yojson(
    [(
         "IsOrganizationTrail",
         (option_to_yojson boolean__to_yojson x.is_organization_trail));
       (
         "KmsKeyId",
         (option_to_yojson string__to_yojson x.kms_key_id));
       (
         "CloudWatchLogsRoleArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn));
       (
         "CloudWatchLogsLogGroupArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn));
       (
         "LogFileValidationEnabled",
         (option_to_yojson boolean__to_yojson x.log_file_validation_enabled));
       (
         "TrailARN",
         (option_to_yojson string__to_yojson x.trail_ar_n));
       (
         "IsMultiRegionTrail",
         (option_to_yojson boolean__to_yojson x.is_multi_region_trail));
       (
         "IncludeGlobalServiceEvents",
         (option_to_yojson boolean__to_yojson x.include_global_service_events));
       (
         "SnsTopicARN",
         (option_to_yojson string__to_yojson x.sns_topic_ar_n));
       (
         "SnsTopicName",
         (option_to_yojson string__to_yojson x.sns_topic_name));
       (
         "S3KeyPrefix",
         (option_to_yojson string__to_yojson x.s3_key_prefix));
       (
         "S3BucketName",
         (option_to_yojson string__to_yojson x.s3_bucket_name));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let update_trail_request_to_yojson = 
  fun (x: update_trail_request) -> assoc_to_yojson(
    [(
         "IsOrganizationTrail",
         (option_to_yojson boolean__to_yojson x.is_organization_trail));
       (
         "KmsKeyId",
         (option_to_yojson string__to_yojson x.kms_key_id));
       (
         "CloudWatchLogsRoleArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn));
       (
         "CloudWatchLogsLogGroupArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn));
       (
         "EnableLogFileValidation",
         (option_to_yojson boolean__to_yojson x.enable_log_file_validation));
       (
         "IsMultiRegionTrail",
         (option_to_yojson boolean__to_yojson x.is_multi_region_trail));
       (
         "IncludeGlobalServiceEvents",
         (option_to_yojson boolean__to_yojson x.include_global_service_events));
       (
         "SnsTopicName",
         (option_to_yojson string__to_yojson x.sns_topic_name));
       (
         "S3KeyPrefix",
         (option_to_yojson string__to_yojson x.s3_key_prefix));
       (
         "S3BucketName",
         (option_to_yojson string__to_yojson x.s3_bucket_name));
       (
         "Name",
         (Some (string__to_yojson x.name)));
       
  ])

let error_message_to_yojson = string_to_yojson

let unsupported_operation_exception_to_yojson = 
  fun (x: unsupported_operation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let trail_not_provided_exception_to_yojson = 
  fun (x: trail_not_provided_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let trail_not_found_exception_to_yojson = 
  fun (x: trail_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let throttling_exception_to_yojson = 
  fun (x: throttling_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let s3_bucket_does_not_exist_exception_to_yojson = 
  fun (x: s3_bucket_does_not_exist_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let organizations_not_in_use_exception_to_yojson = 
  fun (x: organizations_not_in_use_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let organization_not_in_all_features_mode_exception_to_yojson = 
  fun (x: organization_not_in_all_features_mode_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let operation_not_permitted_exception_to_yojson = 
  fun (x: operation_not_permitted_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let not_organization_master_account_exception_to_yojson = 
  fun (x: not_organization_master_account_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let no_management_account_slr_exists_exception_to_yojson = 
  fun (x: no_management_account_slr_exists_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let kms_key_not_found_exception_to_yojson = 
  fun (x: kms_key_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let kms_key_disabled_exception_to_yojson = 
  fun (x: kms_key_disabled_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let kms_exception_to_yojson = 
  fun (x: kms_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_trail_name_exception_to_yojson = 
  fun (x: invalid_trail_name_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_sns_topic_name_exception_to_yojson = 
  fun (x: invalid_sns_topic_name_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_s3_prefix_exception_to_yojson = 
  fun (x: invalid_s3_prefix_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_s3_bucket_name_exception_to_yojson = 
  fun (x: invalid_s3_bucket_name_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_parameter_exception_to_yojson = 
  fun (x: invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_parameter_combination_exception_to_yojson = 
  fun (x: invalid_parameter_combination_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_kms_key_id_exception_to_yojson = 
  fun (x: invalid_kms_key_id_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_home_region_exception_to_yojson = 
  fun (x: invalid_home_region_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_event_selectors_exception_to_yojson = 
  fun (x: invalid_event_selectors_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_cloud_watch_logs_role_arn_exception_to_yojson = 
  fun (x: invalid_cloud_watch_logs_role_arn_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_cloud_watch_logs_log_group_arn_exception_to_yojson = 
  fun (x: invalid_cloud_watch_logs_log_group_arn_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let insufficient_sns_topic_policy_exception_to_yojson = 
  fun (x: insufficient_sns_topic_policy_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let insufficient_s3_bucket_policy_exception_to_yojson = 
  fun (x: insufficient_s3_bucket_policy_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let insufficient_encryption_policy_exception_to_yojson = 
  fun (x: insufficient_encryption_policy_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let insufficient_dependency_service_access_permission_exception_to_yojson = 
  fun (x: insufficient_dependency_service_access_permission_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let cloud_watch_logs_delivery_unavailable_exception_to_yojson = 
  fun (x: cloud_watch_logs_delivery_unavailable_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let cloud_trail_invalid_client_token_id_exception_to_yojson = 
  fun (x: cloud_trail_invalid_client_token_id_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let cloud_trail_arn_invalid_exception_to_yojson = 
  fun (x: cloud_trail_arn_invalid_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let cloud_trail_access_not_enabled_exception_to_yojson = 
  fun (x: cloud_trail_access_not_enabled_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let event_data_store_arn_to_yojson = string_to_yojson

let event_data_store_name_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let event_data_store_status_to_yojson = 
  fun (x: event_data_store_status) -> match x with 
 
| STOPPED_INGESTION -> `String "STOPPED_INGESTION"
  | STOPPING_INGESTION -> `String "STOPPING_INGESTION"
  | STARTING_INGESTION -> `String "STARTING_INGESTION"
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | ENABLED -> `String "ENABLED"
  | CREATED -> `String "CREATED"
   

let selector_name_to_yojson = string_to_yojson

let selector_field_to_yojson = string_to_yojson

let operator_value_to_yojson = string_to_yojson

let operator_to_yojson = 
  fun tree -> list_to_yojson operator_value_to_yojson tree

let advanced_field_selector_to_yojson = 
  fun (x: advanced_field_selector) -> assoc_to_yojson(
    [(
         "NotEndsWith",
         (option_to_yojson operator_to_yojson x.not_ends_with));
       (
         "NotStartsWith",
         (option_to_yojson operator_to_yojson x.not_starts_with));
       (
         "NotEquals",
         (option_to_yojson operator_to_yojson x.not_equals));
       (
         "EndsWith",
         (option_to_yojson operator_to_yojson x.ends_with));
       (
         "StartsWith",
         (option_to_yojson operator_to_yojson x.starts_with));
       (
         "Equals",
         (option_to_yojson operator_to_yojson x.equals));
       (
         "Field",
         (Some (selector_field_to_yojson x.field)));
       
  ])

let advanced_field_selectors_to_yojson = 
  fun tree -> list_to_yojson advanced_field_selector_to_yojson tree

let advanced_event_selector_to_yojson = 
  fun (x: advanced_event_selector) -> assoc_to_yojson(
    [(
         "FieldSelectors",
         (Some (advanced_field_selectors_to_yojson x.field_selectors)));
       (
         "Name",
         (option_to_yojson selector_name_to_yojson x.name));
       
  ])

let advanced_event_selectors_to_yojson = 
  fun tree -> list_to_yojson advanced_event_selector_to_yojson tree

let retention_period_to_yojson = int_to_yojson

let termination_protection_enabled_to_yojson = bool_to_yojson

let date_to_yojson = timestamp_to_yojson

let event_data_store_kms_key_id_to_yojson = string_to_yojson

let billing_mode_to_yojson = 
  fun (x: billing_mode) -> match x with 
 
| FIXED_RETENTION_PRICING -> `String "FIXED_RETENTION_PRICING"
  | EXTENDABLE_RETENTION_PRICING -> `String "EXTENDABLE_RETENTION_PRICING"
   

let federation_status_to_yojson = 
  fun (x: federation_status) -> match x with 
 
| DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"
   

let federation_role_arn_to_yojson = string_to_yojson

let update_event_data_store_response_to_yojson = 
  fun (x: update_event_data_store_response) -> assoc_to_yojson(
    [(
         "FederationRoleArn",
         (option_to_yojson federation_role_arn_to_yojson x.federation_role_arn));
       (
         "FederationStatus",
         (option_to_yojson federation_status_to_yojson x.federation_status));
       (
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "KmsKeyId",
         (option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id));
       (
         "UpdatedTimestamp",
         (option_to_yojson date_to_yojson x.updated_timestamp));
       (
         "CreatedTimestamp",
         (option_to_yojson date_to_yojson x.created_timestamp));
       (
         "TerminationProtectionEnabled",
         (option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled));
       (
         "RetentionPeriod",
         (option_to_yojson retention_period_to_yojson x.retention_period));
       (
         "OrganizationEnabled",
         (option_to_yojson boolean__to_yojson x.organization_enabled));
       (
         "MultiRegionEnabled",
         (option_to_yojson boolean__to_yojson x.multi_region_enabled));
       (
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "Status",
         (option_to_yojson event_data_store_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson event_data_store_name_to_yojson x.name));
       (
         "EventDataStoreArn",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn));
       
  ])

let update_event_data_store_request_to_yojson = 
  fun (x: update_event_data_store_request) -> assoc_to_yojson(
    [(
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "KmsKeyId",
         (option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id));
       (
         "TerminationProtectionEnabled",
         (option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled));
       (
         "RetentionPeriod",
         (option_to_yojson retention_period_to_yojson x.retention_period));
       (
         "OrganizationEnabled",
         (option_to_yojson boolean__to_yojson x.organization_enabled));
       (
         "MultiRegionEnabled",
         (option_to_yojson boolean__to_yojson x.multi_region_enabled));
       (
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "Name",
         (option_to_yojson event_data_store_name_to_yojson x.name));
       (
         "EventDataStore",
         (Some (event_data_store_arn_to_yojson x.event_data_store)));
       
  ])

let invalid_insight_selectors_exception_to_yojson = 
  fun (x: invalid_insight_selectors_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let inactive_event_data_store_exception_to_yojson = 
  fun (x: inactive_event_data_store_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let event_data_store_not_found_exception_to_yojson = 
  fun (x: event_data_store_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let event_data_store_has_ongoing_import_exception_to_yojson = 
  fun (x: event_data_store_has_ongoing_import_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let event_data_store_arn_invalid_exception_to_yojson = 
  fun (x: event_data_store_arn_invalid_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let event_data_store_already_exists_exception_to_yojson = 
  fun (x: event_data_store_already_exists_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let channel_arn_to_yojson = string_to_yojson

let channel_name_to_yojson = string_to_yojson

let source_to_yojson = string_to_yojson

let destination_type_to_yojson = 
  fun (x: destination_type) -> match x with 
 
| AWS_SERVICE -> `String "AWS_SERVICE"
  | EVENT_DATA_STORE -> `String "EVENT_DATA_STORE"
   

let location_to_yojson = string_to_yojson

let destination_to_yojson = 
  fun (x: destination) -> assoc_to_yojson(
    [(
         "Location",
         (Some (location_to_yojson x.location)));
       (
         "Type",
         (Some (destination_type_to_yojson x.type_)));
       
  ])

let destinations_to_yojson = 
  fun tree -> list_to_yojson destination_to_yojson tree

let update_channel_response_to_yojson = 
  fun (x: update_channel_response) -> assoc_to_yojson(
    [(
         "Destinations",
         (option_to_yojson destinations_to_yojson x.destinations));
       (
         "Source",
         (option_to_yojson source_to_yojson x.source));
       (
         "Name",
         (option_to_yojson channel_name_to_yojson x.name));
       (
         "ChannelArn",
         (option_to_yojson channel_arn_to_yojson x.channel_arn));
       
  ])

let update_channel_request_to_yojson = 
  fun (x: update_channel_request) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson channel_name_to_yojson x.name));
       (
         "Destinations",
         (option_to_yojson destinations_to_yojson x.destinations));
       (
         "Channel",
         (Some (channel_arn_to_yojson x.channel)));
       
  ])

let invalid_event_data_store_category_exception_to_yojson = 
  fun (x: invalid_event_data_store_category_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let channel_not_found_exception_to_yojson = 
  fun (x: channel_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let channel_arn_invalid_exception_to_yojson = 
  fun (x: channel_arn_invalid_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let channel_already_exists_exception_to_yojson = 
  fun (x: channel_already_exists_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let uui_d_to_yojson = string_to_yojson

let trail_info_to_yojson = 
  fun (x: trail_info) -> assoc_to_yojson(
    [(
         "HomeRegion",
         (option_to_yojson string__to_yojson x.home_region));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "TrailARN",
         (option_to_yojson string__to_yojson x.trail_ar_n));
       
  ])

let trails_to_yojson = 
  fun tree -> list_to_yojson trail_info_to_yojson tree

let trail_name_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let trail_to_yojson = 
  fun (x: trail) -> assoc_to_yojson(
    [(
         "IsOrganizationTrail",
         (option_to_yojson boolean__to_yojson x.is_organization_trail));
       (
         "HasInsightSelectors",
         (option_to_yojson boolean__to_yojson x.has_insight_selectors));
       (
         "HasCustomEventSelectors",
         (option_to_yojson boolean__to_yojson x.has_custom_event_selectors));
       (
         "KmsKeyId",
         (option_to_yojson string__to_yojson x.kms_key_id));
       (
         "CloudWatchLogsRoleArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn));
       (
         "CloudWatchLogsLogGroupArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn));
       (
         "LogFileValidationEnabled",
         (option_to_yojson boolean__to_yojson x.log_file_validation_enabled));
       (
         "TrailARN",
         (option_to_yojson string__to_yojson x.trail_ar_n));
       (
         "HomeRegion",
         (option_to_yojson string__to_yojson x.home_region));
       (
         "IsMultiRegionTrail",
         (option_to_yojson boolean__to_yojson x.is_multi_region_trail));
       (
         "IncludeGlobalServiceEvents",
         (option_to_yojson boolean__to_yojson x.include_global_service_events));
       (
         "SnsTopicARN",
         (option_to_yojson string__to_yojson x.sns_topic_ar_n));
       (
         "SnsTopicName",
         (option_to_yojson string__to_yojson x.sns_topic_name));
       (
         "S3KeyPrefix",
         (option_to_yojson string__to_yojson x.s3_key_prefix));
       (
         "S3BucketName",
         (option_to_yojson string__to_yojson x.s3_bucket_name));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let trail_list_to_yojson = fun tree -> list_to_yojson trail_to_yojson tree

let trail_already_exists_exception_to_yojson = 
  fun (x: trail_already_exists_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let timestamps_to_yojson = fun tree -> list_to_yojson date_to_yojson tree

let tag_key_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson tag_value_to_yojson x.value));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tags_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tags_limit_exceeded_exception_to_yojson = 
  fun (x: tags_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let stop_logging_response_to_yojson = 
  fun (x: stop_logging_response) -> assoc_to_yojson(
    [
  ])

let stop_logging_request_to_yojson = 
  fun (x: stop_logging_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (string__to_yojson x.name)));
       
  ])

let s3_import_source_to_yojson = 
  fun (x: s3_import_source) -> assoc_to_yojson(
    [(
         "S3BucketAccessRoleArn",
         (Some (string__to_yojson x.s3_bucket_access_role_arn)));
       (
         "S3BucketRegion",
         (Some (string__to_yojson x.s3_bucket_region)));
       (
         "S3LocationUri",
         (Some (string__to_yojson x.s3_location_uri)));
       
  ])

let import_source_to_yojson = 
  fun (x: import_source) -> assoc_to_yojson(
    [(
         "S3",
         (Some (s3_import_source_to_yojson x.s3)));
       
  ])

let import_destinations_to_yojson = 
  fun tree -> list_to_yojson event_data_store_arn_to_yojson tree

let import_status_to_yojson = 
  fun (x: import_status) -> match x with 
 
| COMPLETED -> `String "COMPLETED"
  | STOPPED -> `String "STOPPED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | INITIALIZING -> `String "INITIALIZING"
   

let long_to_yojson = long_to_yojson

let import_statistics_to_yojson = 
  fun (x: import_statistics) -> assoc_to_yojson(
    [(
         "FailedEntries",
         (option_to_yojson long_to_yojson x.failed_entries));
       (
         "EventsCompleted",
         (option_to_yojson long_to_yojson x.events_completed));
       (
         "FilesCompleted",
         (option_to_yojson long_to_yojson x.files_completed));
       (
         "PrefixesCompleted",
         (option_to_yojson long_to_yojson x.prefixes_completed));
       (
         "PrefixesFound",
         (option_to_yojson long_to_yojson x.prefixes_found));
       
  ])

let stop_import_response_to_yojson = 
  fun (x: stop_import_response) -> assoc_to_yojson(
    [(
         "ImportStatistics",
         (option_to_yojson import_statistics_to_yojson x.import_statistics));
       (
         "EndEventTime",
         (option_to_yojson date_to_yojson x.end_event_time));
       (
         "StartEventTime",
         (option_to_yojson date_to_yojson x.start_event_time));
       (
         "UpdatedTimestamp",
         (option_to_yojson date_to_yojson x.updated_timestamp));
       (
         "CreatedTimestamp",
         (option_to_yojson date_to_yojson x.created_timestamp));
       (
         "ImportStatus",
         (option_to_yojson import_status_to_yojson x.import_status));
       (
         "Destinations",
         (option_to_yojson import_destinations_to_yojson x.destinations));
       (
         "ImportSource",
         (option_to_yojson import_source_to_yojson x.import_source));
       (
         "ImportId",
         (option_to_yojson uui_d_to_yojson x.import_id));
       
  ])

let stop_import_request_to_yojson = 
  fun (x: stop_import_request) -> assoc_to_yojson(
    [(
         "ImportId",
         (Some (uui_d_to_yojson x.import_id)));
       
  ])

let import_not_found_exception_to_yojson = 
  fun (x: import_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let stop_event_data_store_ingestion_response_to_yojson = 
  fun (x: stop_event_data_store_ingestion_response) -> assoc_to_yojson(
    [
  ])

let stop_event_data_store_ingestion_request_to_yojson = 
  fun (x: stop_event_data_store_ingestion_request) -> assoc_to_yojson(
    [(
         "EventDataStore",
         (Some (event_data_store_arn_to_yojson x.event_data_store)));
       
  ])

let invalid_event_data_store_status_exception_to_yojson = 
  fun (x: invalid_event_data_store_status_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let start_query_response_to_yojson = 
  fun (x: start_query_response) -> assoc_to_yojson(
    [(
         "QueryId",
         (option_to_yojson uui_d_to_yojson x.query_id));
       
  ])

let query_statement_to_yojson = string_to_yojson

let delivery_s3_uri_to_yojson = string_to_yojson

let query_alias_to_yojson = string_to_yojson

let query_parameter_to_yojson = string_to_yojson

let query_parameters_to_yojson = 
  fun tree -> list_to_yojson query_parameter_to_yojson tree

let start_query_request_to_yojson = 
  fun (x: start_query_request) -> assoc_to_yojson(
    [(
         "QueryParameters",
         (option_to_yojson query_parameters_to_yojson x.query_parameters));
       (
         "QueryAlias",
         (option_to_yojson query_alias_to_yojson x.query_alias));
       (
         "DeliveryS3Uri",
         (option_to_yojson delivery_s3_uri_to_yojson x.delivery_s3_uri));
       (
         "QueryStatement",
         (option_to_yojson query_statement_to_yojson x.query_statement));
       
  ])

let max_concurrent_queries_exception_to_yojson = 
  fun (x: max_concurrent_queries_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_query_statement_exception_to_yojson = 
  fun (x: invalid_query_statement_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let start_logging_response_to_yojson = 
  fun (x: start_logging_response) -> assoc_to_yojson(
    [
  ])

let start_logging_request_to_yojson = 
  fun (x: start_logging_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (string__to_yojson x.name)));
       
  ])

let start_import_response_to_yojson = 
  fun (x: start_import_response) -> assoc_to_yojson(
    [(
         "UpdatedTimestamp",
         (option_to_yojson date_to_yojson x.updated_timestamp));
       (
         "CreatedTimestamp",
         (option_to_yojson date_to_yojson x.created_timestamp));
       (
         "ImportStatus",
         (option_to_yojson import_status_to_yojson x.import_status));
       (
         "EndEventTime",
         (option_to_yojson date_to_yojson x.end_event_time));
       (
         "StartEventTime",
         (option_to_yojson date_to_yojson x.start_event_time));
       (
         "ImportSource",
         (option_to_yojson import_source_to_yojson x.import_source));
       (
         "Destinations",
         (option_to_yojson import_destinations_to_yojson x.destinations));
       (
         "ImportId",
         (option_to_yojson uui_d_to_yojson x.import_id));
       
  ])

let start_import_request_to_yojson = 
  fun (x: start_import_request) -> assoc_to_yojson(
    [(
         "ImportId",
         (option_to_yojson uui_d_to_yojson x.import_id));
       (
         "EndEventTime",
         (option_to_yojson date_to_yojson x.end_event_time));
       (
         "StartEventTime",
         (option_to_yojson date_to_yojson x.start_event_time));
       (
         "ImportSource",
         (option_to_yojson import_source_to_yojson x.import_source));
       (
         "Destinations",
         (option_to_yojson import_destinations_to_yojson x.destinations));
       
  ])

let invalid_import_source_exception_to_yojson = 
  fun (x: invalid_import_source_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let account_has_ongoing_import_exception_to_yojson = 
  fun (x: account_has_ongoing_import_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let start_event_data_store_ingestion_response_to_yojson = 
  fun (x: start_event_data_store_ingestion_response) -> assoc_to_yojson(
    [
  ])

let start_event_data_store_ingestion_request_to_yojson = 
  fun (x: start_event_data_store_ingestion_request) -> assoc_to_yojson(
    [(
         "EventDataStore",
         (Some (event_data_store_arn_to_yojson x.event_data_store)));
       
  ])

let source_config_to_yojson = 
  fun (x: source_config) -> assoc_to_yojson(
    [(
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "ApplyToAllRegions",
         (option_to_yojson boolean__to_yojson x.apply_to_all_regions));
       
  ])

let restore_event_data_store_response_to_yojson = 
  fun (x: restore_event_data_store_response) -> assoc_to_yojson(
    [(
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "KmsKeyId",
         (option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id));
       (
         "UpdatedTimestamp",
         (option_to_yojson date_to_yojson x.updated_timestamp));
       (
         "CreatedTimestamp",
         (option_to_yojson date_to_yojson x.created_timestamp));
       (
         "TerminationProtectionEnabled",
         (option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled));
       (
         "RetentionPeriod",
         (option_to_yojson retention_period_to_yojson x.retention_period));
       (
         "OrganizationEnabled",
         (option_to_yojson boolean__to_yojson x.organization_enabled));
       (
         "MultiRegionEnabled",
         (option_to_yojson boolean__to_yojson x.multi_region_enabled));
       (
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "Status",
         (option_to_yojson event_data_store_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson event_data_store_name_to_yojson x.name));
       (
         "EventDataStoreArn",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn));
       
  ])

let restore_event_data_store_request_to_yojson = 
  fun (x: restore_event_data_store_request) -> assoc_to_yojson(
    [(
         "EventDataStore",
         (Some (event_data_store_arn_to_yojson x.event_data_store)));
       
  ])

let event_data_store_max_limit_exceeded_exception_to_yojson = 
  fun (x: event_data_store_max_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_type_not_supported_exception_to_yojson = 
  fun (x: resource_type_not_supported_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_tag_to_yojson = 
  fun (x: resource_tag) -> assoc_to_yojson(
    [(
         "TagsList",
         (option_to_yojson tags_list_to_yojson x.tags_list));
       (
         "ResourceId",
         (option_to_yojson string__to_yojson x.resource_id));
       
  ])

let resource_tag_list_to_yojson = 
  fun tree -> list_to_yojson resource_tag_to_yojson tree

let resource_policy_not_valid_exception_to_yojson = 
  fun (x: resource_policy_not_valid_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_policy_not_found_exception_to_yojson = 
  fun (x: resource_policy_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_policy_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_to_yojson = 
  fun (x: resource) -> assoc_to_yojson(
    [(
         "ResourceName",
         (option_to_yojson string__to_yojson x.resource_name));
       (
         "ResourceType",
         (option_to_yojson string__to_yojson x.resource_type));
       
  ])

let resource_list_to_yojson = 
  fun tree -> list_to_yojson resource_to_yojson tree

let resource_id_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let resource_arn_to_yojson = string_to_yojson

let resource_arn_not_valid_exception_to_yojson = 
  fun (x: resource_arn_not_valid_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let remove_tags_response_to_yojson = 
  fun (x: remove_tags_response) -> assoc_to_yojson(
    [
  ])

let remove_tags_request_to_yojson = 
  fun (x: remove_tags_request) -> assoc_to_yojson(
    [(
         "TagsList",
         (Some (tags_list_to_yojson x.tags_list)));
       (
         "ResourceId",
         (Some (string__to_yojson x.resource_id)));
       
  ])

let invalid_tag_parameter_exception_to_yojson = 
  fun (x: invalid_tag_parameter_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let register_organization_delegated_admin_response_to_yojson = 
  fun (x: register_organization_delegated_admin_response) -> assoc_to_yojson(
    [
  ])

let account_id_to_yojson = string_to_yojson

let register_organization_delegated_admin_request_to_yojson = 
  fun (x: register_organization_delegated_admin_request) -> assoc_to_yojson(
    [(
         "MemberAccountId",
         (Some (account_id_to_yojson x.member_account_id)));
       
  ])

let not_organization_management_account_exception_to_yojson = 
  fun (x: not_organization_management_account_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let delegated_admin_account_limit_exceeded_exception_to_yojson = 
  fun (x: delegated_admin_account_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let cannot_delegate_management_account_exception_to_yojson = 
  fun (x: cannot_delegate_management_account_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let account_registered_exception_to_yojson = 
  fun (x: account_registered_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let account_not_found_exception_to_yojson = 
  fun (x: account_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let read_write_type_to_yojson = 
  fun (x: read_write_type) -> match x with 
 
| All -> `String "All"
  | WriteOnly -> `String "WriteOnly"
  | ReadOnly -> `String "ReadOnly"
   

let query_status_to_yojson = 
  fun (x: query_status) -> match x with 
 
| TIMED_OUT -> `String "TIMED_OUT"
  | CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | FINISHED -> `String "FINISHED"
  | RUNNING -> `String "RUNNING"
  | QUEUED -> `String "QUEUED"
   

let integer__to_yojson = int_to_yojson

let query_statistics_for_describe_query_to_yojson = 
  fun (x: query_statistics_for_describe_query) -> assoc_to_yojson(
    [(
         "CreationTime",
         (option_to_yojson date_to_yojson x.creation_time));
       (
         "ExecutionTimeInMillis",
         (option_to_yojson integer__to_yojson x.execution_time_in_millis));
       (
         "BytesScanned",
         (option_to_yojson long_to_yojson x.bytes_scanned));
       (
         "EventsScanned",
         (option_to_yojson long_to_yojson x.events_scanned));
       (
         "EventsMatched",
         (option_to_yojson long_to_yojson x.events_matched));
       
  ])

let query_statistics_to_yojson = 
  fun (x: query_statistics) -> assoc_to_yojson(
    [(
         "BytesScanned",
         (option_to_yojson long_to_yojson x.bytes_scanned));
       (
         "TotalResultsCount",
         (option_to_yojson integer__to_yojson x.total_results_count));
       (
         "ResultsCount",
         (option_to_yojson integer__to_yojson x.results_count));
       
  ])

let query_result_value_to_yojson = string_to_yojson

let query_result_key_to_yojson = string_to_yojson

let query_result_column_to_yojson = 
  fun tree -> map_to_yojson query_result_value_to_yojson tree

let query_result_row_to_yojson = 
  fun tree -> list_to_yojson query_result_column_to_yojson tree

let query_result_rows_to_yojson = 
  fun tree -> list_to_yojson query_result_row_to_yojson tree

let query_id_not_found_exception_to_yojson = 
  fun (x: query_id_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let query_to_yojson = 
  fun (x: query) -> assoc_to_yojson(
    [(
         "CreationTime",
         (option_to_yojson date_to_yojson x.creation_time));
       (
         "QueryStatus",
         (option_to_yojson query_status_to_yojson x.query_status));
       (
         "QueryId",
         (option_to_yojson uui_d_to_yojson x.query_id));
       
  ])

let queries_to_yojson = fun tree -> list_to_yojson query_to_yojson tree

let put_resource_policy_response_to_yojson = 
  fun (x: put_resource_policy_response) -> assoc_to_yojson(
    [(
         "ResourcePolicy",
         (option_to_yojson resource_policy_to_yojson x.resource_policy));
       (
         "ResourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       
  ])

let put_resource_policy_request_to_yojson = 
  fun (x: put_resource_policy_request) -> assoc_to_yojson(
    [(
         "ResourcePolicy",
         (Some (resource_policy_to_yojson x.resource_policy)));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let insight_type_to_yojson = 
  fun (x: insight_type) -> match x with 
 
| ApiErrorRateInsight -> `String "ApiErrorRateInsight"
  | ApiCallRateInsight -> `String "ApiCallRateInsight"
   

let insight_selector_to_yojson = 
  fun (x: insight_selector) -> assoc_to_yojson(
    [(
         "InsightType",
         (option_to_yojson insight_type_to_yojson x.insight_type));
       
  ])

let insight_selectors_to_yojson = 
  fun tree -> list_to_yojson insight_selector_to_yojson tree

let put_insight_selectors_response_to_yojson = 
  fun (x: put_insight_selectors_response) -> assoc_to_yojson(
    [(
         "InsightsDestination",
         (option_to_yojson event_data_store_arn_to_yojson x.insights_destination));
       (
         "EventDataStoreArn",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn));
       (
         "InsightSelectors",
         (option_to_yojson insight_selectors_to_yojson x.insight_selectors));
       (
         "TrailARN",
         (option_to_yojson string__to_yojson x.trail_ar_n));
       
  ])

let put_insight_selectors_request_to_yojson = 
  fun (x: put_insight_selectors_request) -> assoc_to_yojson(
    [(
         "InsightsDestination",
         (option_to_yojson event_data_store_arn_to_yojson x.insights_destination));
       (
         "EventDataStore",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store));
       (
         "InsightSelectors",
         (Some (insight_selectors_to_yojson x.insight_selectors)));
       (
         "TrailName",
         (option_to_yojson string__to_yojson x.trail_name));
       
  ])

let data_resource_values_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let data_resource_to_yojson = 
  fun (x: data_resource) -> assoc_to_yojson(
    [(
         "Values",
         (option_to_yojson data_resource_values_to_yojson x.values));
       (
         "Type",
         (option_to_yojson string__to_yojson x.type_));
       
  ])

let data_resources_to_yojson = 
  fun tree -> list_to_yojson data_resource_to_yojson tree

let exclude_management_event_sources_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let event_selector_to_yojson = 
  fun (x: event_selector) -> assoc_to_yojson(
    [(
         "ExcludeManagementEventSources",
         (option_to_yojson exclude_management_event_sources_to_yojson x.exclude_management_event_sources));
       (
         "DataResources",
         (option_to_yojson data_resources_to_yojson x.data_resources));
       (
         "IncludeManagementEvents",
         (option_to_yojson boolean__to_yojson x.include_management_events));
       (
         "ReadWriteType",
         (option_to_yojson read_write_type_to_yojson x.read_write_type));
       
  ])

let event_selectors_to_yojson = 
  fun tree -> list_to_yojson event_selector_to_yojson tree

let put_event_selectors_response_to_yojson = 
  fun (x: put_event_selectors_response) -> assoc_to_yojson(
    [(
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "EventSelectors",
         (option_to_yojson event_selectors_to_yojson x.event_selectors));
       (
         "TrailARN",
         (option_to_yojson string__to_yojson x.trail_ar_n));
       
  ])

let put_event_selectors_request_to_yojson = 
  fun (x: put_event_selectors_request) -> assoc_to_yojson(
    [(
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "EventSelectors",
         (option_to_yojson event_selectors_to_yojson x.event_selectors));
       (
         "TrailName",
         (Some (string__to_yojson x.trail_name)));
       
  ])

let byte_buffer_to_yojson = blob_to_yojson

let public_key_to_yojson = 
  fun (x: public_key) -> assoc_to_yojson(
    [(
         "Fingerprint",
         (option_to_yojson string__to_yojson x.fingerprint));
       (
         "ValidityEndTime",
         (option_to_yojson date_to_yojson x.validity_end_time));
       (
         "ValidityStartTime",
         (option_to_yojson date_to_yojson x.validity_start_time));
       (
         "Value",
         (option_to_yojson byte_buffer_to_yojson x.value));
       
  ])

let public_key_list_to_yojson = 
  fun tree -> list_to_yojson public_key_to_yojson tree

let partition_key_type_to_yojson = string_to_yojson

let partition_key_name_to_yojson = string_to_yojson

let partition_key_to_yojson = 
  fun (x: partition_key) -> assoc_to_yojson(
    [(
         "Type",
         (Some (partition_key_type_to_yojson x.type_)));
       (
         "Name",
         (Some (partition_key_name_to_yojson x.name)));
       
  ])

let partition_key_list_to_yojson = 
  fun tree -> list_to_yojson partition_key_to_yojson tree

let pagination_token_to_yojson = string_to_yojson

let next_token_to_yojson = string_to_yojson

let maximum_number_of_trails_exceeded_exception_to_yojson = 
  fun (x: maximum_number_of_trails_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let max_results_to_yojson = int_to_yojson

let max_query_results_to_yojson = int_to_yojson

let event_to_yojson = 
  fun (x: event) -> assoc_to_yojson(
    [(
         "CloudTrailEvent",
         (option_to_yojson string__to_yojson x.cloud_trail_event));
       (
         "Resources",
         (option_to_yojson resource_list_to_yojson x.resources));
       (
         "Username",
         (option_to_yojson string__to_yojson x.username));
       (
         "EventSource",
         (option_to_yojson string__to_yojson x.event_source));
       (
         "EventTime",
         (option_to_yojson date_to_yojson x.event_time));
       (
         "AccessKeyId",
         (option_to_yojson string__to_yojson x.access_key_id));
       (
         "ReadOnly",
         (option_to_yojson string__to_yojson x.read_only));
       (
         "EventName",
         (option_to_yojson string__to_yojson x.event_name));
       (
         "EventId",
         (option_to_yojson string__to_yojson x.event_id));
       
  ])

let events_list_to_yojson = 
  fun tree -> list_to_yojson event_to_yojson tree

let lookup_events_response_to_yojson = 
  fun (x: lookup_events_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Events",
         (option_to_yojson events_list_to_yojson x.events));
       
  ])

let lookup_attribute_key_to_yojson = 
  fun (x: lookup_attribute_key) -> match x with 
 
| ACCESS_KEY_ID -> `String "AccessKeyId"
  | EVENT_SOURCE -> `String "EventSource"
  | RESOURCE_NAME -> `String "ResourceName"
  | RESOURCE_TYPE -> `String "ResourceType"
  | USERNAME -> `String "Username"
  | READ_ONLY -> `String "ReadOnly"
  | EVENT_NAME -> `String "EventName"
  | EVENT_ID -> `String "EventId"
   

let lookup_attribute_value_to_yojson = string_to_yojson

let lookup_attribute_to_yojson = 
  fun (x: lookup_attribute) -> assoc_to_yojson(
    [(
         "AttributeValue",
         (Some (lookup_attribute_value_to_yojson x.attribute_value)));
       (
         "AttributeKey",
         (Some (lookup_attribute_key_to_yojson x.attribute_key)));
       
  ])

let lookup_attributes_list_to_yojson = 
  fun tree -> list_to_yojson lookup_attribute_to_yojson tree

let event_category_to_yojson = 
  fun (x: event_category) -> match x with 
  | Insight -> `String "insight"
     

let lookup_events_request_to_yojson = 
  fun (x: lookup_events_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "EventCategory",
         (option_to_yojson event_category_to_yojson x.event_category));
       (
         "EndTime",
         (option_to_yojson date_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_to_yojson x.start_time));
       (
         "LookupAttributes",
         (option_to_yojson lookup_attributes_list_to_yojson x.lookup_attributes));
       
  ])

let invalid_time_range_exception_to_yojson = 
  fun (x: invalid_time_range_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_next_token_exception_to_yojson = 
  fun (x: invalid_next_token_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_max_results_exception_to_yojson = 
  fun (x: invalid_max_results_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_lookup_attributes_exception_to_yojson = 
  fun (x: invalid_lookup_attributes_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_event_category_exception_to_yojson = 
  fun (x: invalid_event_category_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let list_trails_response_to_yojson = 
  fun (x: list_trails_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Trails",
         (option_to_yojson trails_to_yojson x.trails));
       
  ])

let list_trails_request_to_yojson = 
  fun (x: list_trails_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let list_tags_response_to_yojson = 
  fun (x: list_tags_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ResourceTagList",
         (option_to_yojson resource_tag_list_to_yojson x.resource_tag_list));
       
  ])

let list_tags_request_to_yojson = 
  fun (x: list_tags_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ResourceIdList",
         (Some (resource_id_list_to_yojson x.resource_id_list)));
       
  ])

let invalid_token_exception_to_yojson = 
  fun (x: invalid_token_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let list_queries_response_to_yojson = 
  fun (x: list_queries_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "Queries",
         (option_to_yojson queries_to_yojson x.queries));
       
  ])

let list_queries_max_results_count_to_yojson = int_to_yojson

let list_queries_request_to_yojson = 
  fun (x: list_queries_request) -> assoc_to_yojson(
    [(
         "QueryStatus",
         (option_to_yojson query_status_to_yojson x.query_status));
       (
         "EndTime",
         (option_to_yojson date_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_to_yojson x.start_time));
       (
         "MaxResults",
         (option_to_yojson list_queries_max_results_count_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "EventDataStore",
         (Some (event_data_store_arn_to_yojson x.event_data_store)));
       
  ])

let invalid_query_status_exception_to_yojson = 
  fun (x: invalid_query_status_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_date_range_exception_to_yojson = 
  fun (x: invalid_date_range_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let list_public_keys_response_to_yojson = 
  fun (x: list_public_keys_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "PublicKeyList",
         (option_to_yojson public_key_list_to_yojson x.public_key_list));
       
  ])

let list_public_keys_request_to_yojson = 
  fun (x: list_public_keys_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "EndTime",
         (option_to_yojson date_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_to_yojson x.start_time));
       
  ])

let event_source_to_yojson = string_to_yojson

let event_name_to_yojson = string_to_yojson

let error_code_to_yojson = string_to_yojson

let double_to_yojson = double_to_yojson

let insights_metric_values_to_yojson = 
  fun tree -> list_to_yojson double_to_yojson tree

let insights_metric_next_token_to_yojson = string_to_yojson

let list_insights_metric_data_response_to_yojson = 
  fun (x: list_insights_metric_data_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson insights_metric_next_token_to_yojson x.next_token));
       (
         "Values",
         (option_to_yojson insights_metric_values_to_yojson x.values));
       (
         "Timestamps",
         (option_to_yojson timestamps_to_yojson x.timestamps));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "InsightType",
         (option_to_yojson insight_type_to_yojson x.insight_type));
       (
         "EventName",
         (option_to_yojson event_name_to_yojson x.event_name));
       (
         "EventSource",
         (option_to_yojson event_source_to_yojson x.event_source));
       
  ])

let insights_metric_period_to_yojson = int_to_yojson

let insights_metric_data_type_to_yojson = 
  fun (x: insights_metric_data_type) -> match x with 
 
| NON_ZERO_DATA -> `String "NonZeroData"
  | FILL_WITH_ZEROS -> `String "FillWithZeros"
   

let insights_metric_max_results_to_yojson = int_to_yojson

let list_insights_metric_data_request_to_yojson = 
  fun (x: list_insights_metric_data_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson insights_metric_next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson insights_metric_max_results_to_yojson x.max_results));
       (
         "DataType",
         (option_to_yojson insights_metric_data_type_to_yojson x.data_type));
       (
         "Period",
         (option_to_yojson insights_metric_period_to_yojson x.period));
       (
         "EndTime",
         (option_to_yojson date_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_to_yojson x.start_time));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "InsightType",
         (Some (insight_type_to_yojson x.insight_type)));
       (
         "EventName",
         (Some (event_name_to_yojson x.event_name)));
       (
         "EventSource",
         (Some (event_source_to_yojson x.event_source)));
       
  ])

let imports_list_item_to_yojson = 
  fun (x: imports_list_item) -> assoc_to_yojson(
    [(
         "UpdatedTimestamp",
         (option_to_yojson date_to_yojson x.updated_timestamp));
       (
         "CreatedTimestamp",
         (option_to_yojson date_to_yojson x.created_timestamp));
       (
         "Destinations",
         (option_to_yojson import_destinations_to_yojson x.destinations));
       (
         "ImportStatus",
         (option_to_yojson import_status_to_yojson x.import_status));
       (
         "ImportId",
         (option_to_yojson uui_d_to_yojson x.import_id));
       
  ])

let imports_list_to_yojson = 
  fun tree -> list_to_yojson imports_list_item_to_yojson tree

let list_imports_response_to_yojson = 
  fun (x: list_imports_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "Imports",
         (option_to_yojson imports_list_to_yojson x.imports));
       
  ])

let list_imports_max_results_count_to_yojson = int_to_yojson

let list_imports_request_to_yojson = 
  fun (x: list_imports_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "ImportStatus",
         (option_to_yojson import_status_to_yojson x.import_status));
       (
         "Destination",
         (option_to_yojson event_data_store_arn_to_yojson x.destination));
       (
         "MaxResults",
         (option_to_yojson list_imports_max_results_count_to_yojson x.max_results));
       
  ])

let import_failure_status_to_yojson = 
  fun (x: import_failure_status) -> match x with 
 
| SUCCEEDED -> `String "SUCCEEDED"
  | RETRY -> `String "RETRY"
  | FAILED -> `String "FAILED"
   

let import_failure_list_item_to_yojson = 
  fun (x: import_failure_list_item) -> assoc_to_yojson(
    [(
         "LastUpdatedTime",
         (option_to_yojson date_to_yojson x.last_updated_time));
       (
         "ErrorMessage",
         (option_to_yojson string__to_yojson x.error_message));
       (
         "ErrorType",
         (option_to_yojson string__to_yojson x.error_type));
       (
         "Status",
         (option_to_yojson import_failure_status_to_yojson x.status));
       (
         "Location",
         (option_to_yojson string__to_yojson x.location));
       
  ])

let import_failure_list_to_yojson = 
  fun tree -> list_to_yojson import_failure_list_item_to_yojson tree

let list_import_failures_response_to_yojson = 
  fun (x: list_import_failures_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "Failures",
         (option_to_yojson import_failure_list_to_yojson x.failures));
       
  ])

let list_import_failures_max_results_count_to_yojson = int_to_yojson

let list_import_failures_request_to_yojson = 
  fun (x: list_import_failures_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_import_failures_max_results_count_to_yojson x.max_results));
       (
         "ImportId",
         (Some (uui_d_to_yojson x.import_id)));
       
  ])

let event_data_store_to_yojson = 
  fun (x: event_data_store) -> assoc_to_yojson(
    [(
         "UpdatedTimestamp",
         (option_to_yojson date_to_yojson x.updated_timestamp));
       (
         "CreatedTimestamp",
         (option_to_yojson date_to_yojson x.created_timestamp));
       (
         "RetentionPeriod",
         (option_to_yojson retention_period_to_yojson x.retention_period));
       (
         "OrganizationEnabled",
         (option_to_yojson boolean__to_yojson x.organization_enabled));
       (
         "MultiRegionEnabled",
         (option_to_yojson boolean__to_yojson x.multi_region_enabled));
       (
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "Status",
         (option_to_yojson event_data_store_status_to_yojson x.status));
       (
         "TerminationProtectionEnabled",
         (option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled));
       (
         "Name",
         (option_to_yojson event_data_store_name_to_yojson x.name));
       (
         "EventDataStoreArn",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn));
       
  ])

let event_data_stores_to_yojson = 
  fun tree -> list_to_yojson event_data_store_to_yojson tree

let list_event_data_stores_response_to_yojson = 
  fun (x: list_event_data_stores_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "EventDataStores",
         (option_to_yojson event_data_stores_to_yojson x.event_data_stores));
       
  ])

let list_event_data_stores_max_results_count_to_yojson = int_to_yojson

let list_event_data_stores_request_to_yojson = 
  fun (x: list_event_data_stores_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson list_event_data_stores_max_results_count_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       
  ])

let channel_to_yojson = 
  fun (x: channel) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson channel_name_to_yojson x.name));
       (
         "ChannelArn",
         (option_to_yojson channel_arn_to_yojson x.channel_arn));
       
  ])

let channels_to_yojson = fun tree -> list_to_yojson channel_to_yojson tree

let list_channels_response_to_yojson = 
  fun (x: list_channels_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "Channels",
         (option_to_yojson channels_to_yojson x.channels));
       
  ])

let list_channels_max_results_count_to_yojson = int_to_yojson

let list_channels_request_to_yojson = 
  fun (x: list_channels_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_channels_max_results_count_to_yojson x.max_results));
       
  ])

let invalid_source_exception_to_yojson = 
  fun (x: invalid_source_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let insight_not_enabled_exception_to_yojson = 
  fun (x: insight_not_enabled_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let ingestion_status_to_yojson = 
  fun (x: ingestion_status) -> assoc_to_yojson(
    [(
         "LatestIngestionAttemptEventID",
         (option_to_yojson uui_d_to_yojson x.latest_ingestion_attempt_event_i_d));
       (
         "LatestIngestionAttemptTime",
         (option_to_yojson date_to_yojson x.latest_ingestion_attempt_time));
       (
         "LatestIngestionErrorCode",
         (option_to_yojson error_message_to_yojson x.latest_ingestion_error_code));
       (
         "LatestIngestionSuccessEventID",
         (option_to_yojson uui_d_to_yojson x.latest_ingestion_success_event_i_d));
       (
         "LatestIngestionSuccessTime",
         (option_to_yojson date_to_yojson x.latest_ingestion_success_time));
       
  ])

let inactive_query_exception_to_yojson = 
  fun (x: inactive_query_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let get_trail_status_response_to_yojson = 
  fun (x: get_trail_status_response) -> assoc_to_yojson(
    [(
         "TimeLoggingStopped",
         (option_to_yojson string__to_yojson x.time_logging_stopped));
       (
         "TimeLoggingStarted",
         (option_to_yojson string__to_yojson x.time_logging_started));
       (
         "LatestDeliveryAttemptSucceeded",
         (option_to_yojson string__to_yojson x.latest_delivery_attempt_succeeded));
       (
         "LatestNotificationAttemptSucceeded",
         (option_to_yojson string__to_yojson x.latest_notification_attempt_succeeded));
       (
         "LatestNotificationAttemptTime",
         (option_to_yojson string__to_yojson x.latest_notification_attempt_time));
       (
         "LatestDeliveryAttemptTime",
         (option_to_yojson string__to_yojson x.latest_delivery_attempt_time));
       (
         "LatestDigestDeliveryError",
         (option_to_yojson string__to_yojson x.latest_digest_delivery_error));
       (
         "LatestDigestDeliveryTime",
         (option_to_yojson date_to_yojson x.latest_digest_delivery_time));
       (
         "LatestCloudWatchLogsDeliveryTime",
         (option_to_yojson date_to_yojson x.latest_cloud_watch_logs_delivery_time));
       (
         "LatestCloudWatchLogsDeliveryError",
         (option_to_yojson string__to_yojson x.latest_cloud_watch_logs_delivery_error));
       (
         "StopLoggingTime",
         (option_to_yojson date_to_yojson x.stop_logging_time));
       (
         "StartLoggingTime",
         (option_to_yojson date_to_yojson x.start_logging_time));
       (
         "LatestNotificationTime",
         (option_to_yojson date_to_yojson x.latest_notification_time));
       (
         "LatestDeliveryTime",
         (option_to_yojson date_to_yojson x.latest_delivery_time));
       (
         "LatestNotificationError",
         (option_to_yojson string__to_yojson x.latest_notification_error));
       (
         "LatestDeliveryError",
         (option_to_yojson string__to_yojson x.latest_delivery_error));
       (
         "IsLogging",
         (option_to_yojson boolean__to_yojson x.is_logging));
       
  ])

let get_trail_status_request_to_yojson = 
  fun (x: get_trail_status_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (string__to_yojson x.name)));
       
  ])

let get_trail_response_to_yojson = 
  fun (x: get_trail_response) -> assoc_to_yojson(
    [(
         "Trail",
         (option_to_yojson trail_to_yojson x.trail));
       
  ])

let get_trail_request_to_yojson = 
  fun (x: get_trail_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (string__to_yojson x.name)));
       
  ])

let get_resource_policy_response_to_yojson = 
  fun (x: get_resource_policy_response) -> assoc_to_yojson(
    [(
         "ResourcePolicy",
         (option_to_yojson resource_policy_to_yojson x.resource_policy));
       (
         "ResourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       
  ])

let get_resource_policy_request_to_yojson = 
  fun (x: get_resource_policy_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let get_query_results_response_to_yojson = 
  fun (x: get_query_results_response) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "QueryResultRows",
         (option_to_yojson query_result_rows_to_yojson x.query_result_rows));
       (
         "QueryStatistics",
         (option_to_yojson query_statistics_to_yojson x.query_statistics));
       (
         "QueryStatus",
         (option_to_yojson query_status_to_yojson x.query_status));
       
  ])

let get_query_results_request_to_yojson = 
  fun (x: get_query_results_request) -> assoc_to_yojson(
    [(
         "MaxQueryResults",
         (option_to_yojson max_query_results_to_yojson x.max_query_results));
       (
         "NextToken",
         (option_to_yojson pagination_token_to_yojson x.next_token));
       (
         "QueryId",
         (Some (uui_d_to_yojson x.query_id)));
       (
         "EventDataStore",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store));
       
  ])

let get_insight_selectors_response_to_yojson = 
  fun (x: get_insight_selectors_response) -> assoc_to_yojson(
    [(
         "InsightsDestination",
         (option_to_yojson event_data_store_arn_to_yojson x.insights_destination));
       (
         "EventDataStoreArn",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn));
       (
         "InsightSelectors",
         (option_to_yojson insight_selectors_to_yojson x.insight_selectors));
       (
         "TrailARN",
         (option_to_yojson string__to_yojson x.trail_ar_n));
       
  ])

let get_insight_selectors_request_to_yojson = 
  fun (x: get_insight_selectors_request) -> assoc_to_yojson(
    [(
         "EventDataStore",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store));
       (
         "TrailName",
         (option_to_yojson string__to_yojson x.trail_name));
       
  ])

let get_import_response_to_yojson = 
  fun (x: get_import_response) -> assoc_to_yojson(
    [(
         "ImportStatistics",
         (option_to_yojson import_statistics_to_yojson x.import_statistics));
       (
         "UpdatedTimestamp",
         (option_to_yojson date_to_yojson x.updated_timestamp));
       (
         "CreatedTimestamp",
         (option_to_yojson date_to_yojson x.created_timestamp));
       (
         "ImportStatus",
         (option_to_yojson import_status_to_yojson x.import_status));
       (
         "EndEventTime",
         (option_to_yojson date_to_yojson x.end_event_time));
       (
         "StartEventTime",
         (option_to_yojson date_to_yojson x.start_event_time));
       (
         "ImportSource",
         (option_to_yojson import_source_to_yojson x.import_source));
       (
         "Destinations",
         (option_to_yojson import_destinations_to_yojson x.destinations));
       (
         "ImportId",
         (option_to_yojson uui_d_to_yojson x.import_id));
       
  ])

let get_import_request_to_yojson = 
  fun (x: get_import_request) -> assoc_to_yojson(
    [(
         "ImportId",
         (Some (uui_d_to_yojson x.import_id)));
       
  ])

let get_event_selectors_response_to_yojson = 
  fun (x: get_event_selectors_response) -> assoc_to_yojson(
    [(
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "EventSelectors",
         (option_to_yojson event_selectors_to_yojson x.event_selectors));
       (
         "TrailARN",
         (option_to_yojson string__to_yojson x.trail_ar_n));
       
  ])

let get_event_selectors_request_to_yojson = 
  fun (x: get_event_selectors_request) -> assoc_to_yojson(
    [(
         "TrailName",
         (Some (string__to_yojson x.trail_name)));
       
  ])

let get_event_data_store_response_to_yojson = 
  fun (x: get_event_data_store_response) -> assoc_to_yojson(
    [(
         "PartitionKeys",
         (option_to_yojson partition_key_list_to_yojson x.partition_keys));
       (
         "FederationRoleArn",
         (option_to_yojson federation_role_arn_to_yojson x.federation_role_arn));
       (
         "FederationStatus",
         (option_to_yojson federation_status_to_yojson x.federation_status));
       (
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "KmsKeyId",
         (option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id));
       (
         "UpdatedTimestamp",
         (option_to_yojson date_to_yojson x.updated_timestamp));
       (
         "CreatedTimestamp",
         (option_to_yojson date_to_yojson x.created_timestamp));
       (
         "TerminationProtectionEnabled",
         (option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled));
       (
         "RetentionPeriod",
         (option_to_yojson retention_period_to_yojson x.retention_period));
       (
         "OrganizationEnabled",
         (option_to_yojson boolean__to_yojson x.organization_enabled));
       (
         "MultiRegionEnabled",
         (option_to_yojson boolean__to_yojson x.multi_region_enabled));
       (
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "Status",
         (option_to_yojson event_data_store_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson event_data_store_name_to_yojson x.name));
       (
         "EventDataStoreArn",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn));
       
  ])

let get_event_data_store_request_to_yojson = 
  fun (x: get_event_data_store_request) -> assoc_to_yojson(
    [(
         "EventDataStore",
         (Some (event_data_store_arn_to_yojson x.event_data_store)));
       
  ])

let get_channel_response_to_yojson = 
  fun (x: get_channel_response) -> assoc_to_yojson(
    [(
         "IngestionStatus",
         (option_to_yojson ingestion_status_to_yojson x.ingestion_status));
       (
         "Destinations",
         (option_to_yojson destinations_to_yojson x.destinations));
       (
         "SourceConfig",
         (option_to_yojson source_config_to_yojson x.source_config));
       (
         "Source",
         (option_to_yojson source_to_yojson x.source));
       (
         "Name",
         (option_to_yojson channel_name_to_yojson x.name));
       (
         "ChannelArn",
         (option_to_yojson channel_arn_to_yojson x.channel_arn));
       
  ])

let get_channel_request_to_yojson = 
  fun (x: get_channel_request) -> assoc_to_yojson(
    [(
         "Channel",
         (Some (channel_arn_to_yojson x.channel)));
       
  ])

let event_data_store_termination_protected_exception_to_yojson = 
  fun (x: event_data_store_termination_protected_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let event_data_store_federation_enabled_exception_to_yojson = 
  fun (x: event_data_store_federation_enabled_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let enable_federation_response_to_yojson = 
  fun (x: enable_federation_response) -> assoc_to_yojson(
    [(
         "FederationRoleArn",
         (option_to_yojson federation_role_arn_to_yojson x.federation_role_arn));
       (
         "FederationStatus",
         (option_to_yojson federation_status_to_yojson x.federation_status));
       (
         "EventDataStoreArn",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn));
       
  ])

let enable_federation_request_to_yojson = 
  fun (x: enable_federation_request) -> assoc_to_yojson(
    [(
         "FederationRoleArn",
         (Some (federation_role_arn_to_yojson x.federation_role_arn)));
       (
         "EventDataStore",
         (Some (event_data_store_arn_to_yojson x.event_data_store)));
       
  ])

let concurrent_modification_exception_to_yojson = 
  fun (x: concurrent_modification_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let disable_federation_response_to_yojson = 
  fun (x: disable_federation_response) -> assoc_to_yojson(
    [(
         "FederationStatus",
         (option_to_yojson federation_status_to_yojson x.federation_status));
       (
         "EventDataStoreArn",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn));
       
  ])

let disable_federation_request_to_yojson = 
  fun (x: disable_federation_request) -> assoc_to_yojson(
    [(
         "EventDataStore",
         (Some (event_data_store_arn_to_yojson x.event_data_store)));
       
  ])

let describe_trails_response_to_yojson = 
  fun (x: describe_trails_response) -> assoc_to_yojson(
    [(
         "trailList",
         (option_to_yojson trail_list_to_yojson x.trail_list));
       
  ])

let describe_trails_request_to_yojson = 
  fun (x: describe_trails_request) -> assoc_to_yojson(
    [(
         "includeShadowTrails",
         (option_to_yojson boolean__to_yojson x.include_shadow_trails));
       (
         "trailNameList",
         (option_to_yojson trail_name_list_to_yojson x.trail_name_list));
       
  ])

let delivery_status_to_yojson = 
  fun (x: delivery_status) -> match x with 
 
| UNKNOWN -> `String "UNKNOWN"
  | CANCELLED -> `String "CANCELLED"
  | ACCESS_DENIED_SIGNING_FILE -> `String "ACCESS_DENIED_SIGNING_FILE"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | RESOURCE_NOT_FOUND -> `String "RESOURCE_NOT_FOUND"
  | PENDING -> `String "PENDING"
  | FAILED_SIGNING_FILE -> `String "FAILED_SIGNING_FILE"
  | FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
   

let describe_query_response_to_yojson = 
  fun (x: describe_query_response) -> assoc_to_yojson(
    [(
         "DeliveryStatus",
         (option_to_yojson delivery_status_to_yojson x.delivery_status));
       (
         "DeliveryS3Uri",
         (option_to_yojson delivery_s3_uri_to_yojson x.delivery_s3_uri));
       (
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "QueryStatistics",
         (option_to_yojson query_statistics_for_describe_query_to_yojson x.query_statistics));
       (
         "QueryStatus",
         (option_to_yojson query_status_to_yojson x.query_status));
       (
         "QueryString",
         (option_to_yojson query_statement_to_yojson x.query_string));
       (
         "QueryId",
         (option_to_yojson uui_d_to_yojson x.query_id));
       
  ])

let describe_query_request_to_yojson = 
  fun (x: describe_query_request) -> assoc_to_yojson(
    [(
         "QueryAlias",
         (option_to_yojson query_alias_to_yojson x.query_alias));
       (
         "QueryId",
         (option_to_yojson uui_d_to_yojson x.query_id));
       (
         "EventDataStore",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store));
       
  ])

let deregister_organization_delegated_admin_response_to_yojson = 
  fun (x: deregister_organization_delegated_admin_response) -> assoc_to_yojson(
    [
  ])

let deregister_organization_delegated_admin_request_to_yojson = 
  fun (x: deregister_organization_delegated_admin_request) -> assoc_to_yojson(
    [(
         "DelegatedAdminAccountId",
         (Some (account_id_to_yojson x.delegated_admin_account_id)));
       
  ])

let account_not_registered_exception_to_yojson = 
  fun (x: account_not_registered_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let delete_trail_response_to_yojson = 
  fun (x: delete_trail_response) -> assoc_to_yojson(
    [
  ])

let delete_trail_request_to_yojson = 
  fun (x: delete_trail_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (string__to_yojson x.name)));
       
  ])

let delete_resource_policy_response_to_yojson = 
  fun (x: delete_resource_policy_response) -> assoc_to_yojson(
    [
  ])

let delete_resource_policy_request_to_yojson = 
  fun (x: delete_resource_policy_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let delete_event_data_store_response_to_yojson = 
  fun (x: delete_event_data_store_response) -> assoc_to_yojson(
    [
  ])

let delete_event_data_store_request_to_yojson = 
  fun (x: delete_event_data_store_request) -> assoc_to_yojson(
    [(
         "EventDataStore",
         (Some (event_data_store_arn_to_yojson x.event_data_store)));
       
  ])

let channel_exists_for_eds_exception_to_yojson = 
  fun (x: channel_exists_for_eds_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let delete_channel_response_to_yojson = 
  fun (x: delete_channel_response) -> assoc_to_yojson(
    [
  ])

let delete_channel_request_to_yojson = 
  fun (x: delete_channel_request) -> assoc_to_yojson(
    [(
         "Channel",
         (Some (channel_arn_to_yojson x.channel)));
       
  ])

let create_trail_response_to_yojson = 
  fun (x: create_trail_response) -> assoc_to_yojson(
    [(
         "IsOrganizationTrail",
         (option_to_yojson boolean__to_yojson x.is_organization_trail));
       (
         "KmsKeyId",
         (option_to_yojson string__to_yojson x.kms_key_id));
       (
         "CloudWatchLogsRoleArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn));
       (
         "CloudWatchLogsLogGroupArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn));
       (
         "LogFileValidationEnabled",
         (option_to_yojson boolean__to_yojson x.log_file_validation_enabled));
       (
         "TrailARN",
         (option_to_yojson string__to_yojson x.trail_ar_n));
       (
         "IsMultiRegionTrail",
         (option_to_yojson boolean__to_yojson x.is_multi_region_trail));
       (
         "IncludeGlobalServiceEvents",
         (option_to_yojson boolean__to_yojson x.include_global_service_events));
       (
         "SnsTopicARN",
         (option_to_yojson string__to_yojson x.sns_topic_ar_n));
       (
         "SnsTopicName",
         (option_to_yojson string__to_yojson x.sns_topic_name));
       (
         "S3KeyPrefix",
         (option_to_yojson string__to_yojson x.s3_key_prefix));
       (
         "S3BucketName",
         (option_to_yojson string__to_yojson x.s3_bucket_name));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let create_trail_request_to_yojson = 
  fun (x: create_trail_request) -> assoc_to_yojson(
    [(
         "TagsList",
         (option_to_yojson tags_list_to_yojson x.tags_list));
       (
         "IsOrganizationTrail",
         (option_to_yojson boolean__to_yojson x.is_organization_trail));
       (
         "KmsKeyId",
         (option_to_yojson string__to_yojson x.kms_key_id));
       (
         "CloudWatchLogsRoleArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_role_arn));
       (
         "CloudWatchLogsLogGroupArn",
         (option_to_yojson string__to_yojson x.cloud_watch_logs_log_group_arn));
       (
         "EnableLogFileValidation",
         (option_to_yojson boolean__to_yojson x.enable_log_file_validation));
       (
         "IsMultiRegionTrail",
         (option_to_yojson boolean__to_yojson x.is_multi_region_trail));
       (
         "IncludeGlobalServiceEvents",
         (option_to_yojson boolean__to_yojson x.include_global_service_events));
       (
         "SnsTopicName",
         (option_to_yojson string__to_yojson x.sns_topic_name));
       (
         "S3KeyPrefix",
         (option_to_yojson string__to_yojson x.s3_key_prefix));
       (
         "S3BucketName",
         (Some (string__to_yojson x.s3_bucket_name)));
       (
         "Name",
         (Some (string__to_yojson x.name)));
       
  ])

let create_event_data_store_response_to_yojson = 
  fun (x: create_event_data_store_response) -> assoc_to_yojson(
    [(
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "KmsKeyId",
         (option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id));
       (
         "UpdatedTimestamp",
         (option_to_yojson date_to_yojson x.updated_timestamp));
       (
         "CreatedTimestamp",
         (option_to_yojson date_to_yojson x.created_timestamp));
       (
         "TagsList",
         (option_to_yojson tags_list_to_yojson x.tags_list));
       (
         "TerminationProtectionEnabled",
         (option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled));
       (
         "RetentionPeriod",
         (option_to_yojson retention_period_to_yojson x.retention_period));
       (
         "OrganizationEnabled",
         (option_to_yojson boolean__to_yojson x.organization_enabled));
       (
         "MultiRegionEnabled",
         (option_to_yojson boolean__to_yojson x.multi_region_enabled));
       (
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "Status",
         (option_to_yojson event_data_store_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson event_data_store_name_to_yojson x.name));
       (
         "EventDataStoreArn",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store_arn));
       
  ])

let create_event_data_store_request_to_yojson = 
  fun (x: create_event_data_store_request) -> assoc_to_yojson(
    [(
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "StartIngestion",
         (option_to_yojson boolean__to_yojson x.start_ingestion));
       (
         "KmsKeyId",
         (option_to_yojson event_data_store_kms_key_id_to_yojson x.kms_key_id));
       (
         "TagsList",
         (option_to_yojson tags_list_to_yojson x.tags_list));
       (
         "TerminationProtectionEnabled",
         (option_to_yojson termination_protection_enabled_to_yojson x.termination_protection_enabled));
       (
         "RetentionPeriod",
         (option_to_yojson retention_period_to_yojson x.retention_period));
       (
         "OrganizationEnabled",
         (option_to_yojson boolean__to_yojson x.organization_enabled));
       (
         "MultiRegionEnabled",
         (option_to_yojson boolean__to_yojson x.multi_region_enabled));
       (
         "AdvancedEventSelectors",
         (option_to_yojson advanced_event_selectors_to_yojson x.advanced_event_selectors));
       (
         "Name",
         (Some (event_data_store_name_to_yojson x.name)));
       
  ])

let create_channel_response_to_yojson = 
  fun (x: create_channel_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_list_to_yojson x.tags));
       (
         "Destinations",
         (option_to_yojson destinations_to_yojson x.destinations));
       (
         "Source",
         (option_to_yojson source_to_yojson x.source));
       (
         "Name",
         (option_to_yojson channel_name_to_yojson x.name));
       (
         "ChannelArn",
         (option_to_yojson channel_arn_to_yojson x.channel_arn));
       
  ])

let create_channel_request_to_yojson = 
  fun (x: create_channel_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_list_to_yojson x.tags));
       (
         "Destinations",
         (Some (destinations_to_yojson x.destinations)));
       (
         "Source",
         (Some (source_to_yojson x.source)));
       (
         "Name",
         (Some (channel_name_to_yojson x.name)));
       
  ])

let channel_max_limit_exceeded_exception_to_yojson = 
  fun (x: channel_max_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let cancel_query_response_to_yojson = 
  fun (x: cancel_query_response) -> assoc_to_yojson(
    [(
         "QueryStatus",
         (Some (query_status_to_yojson x.query_status)));
       (
         "QueryId",
         (Some (uui_d_to_yojson x.query_id)));
       
  ])

let cancel_query_request_to_yojson = 
  fun (x: cancel_query_request) -> assoc_to_yojson(
    [(
         "QueryId",
         (Some (uui_d_to_yojson x.query_id)));
       (
         "EventDataStore",
         (option_to_yojson event_data_store_arn_to_yojson x.event_data_store));
       
  ])

let add_tags_response_to_yojson = 
  fun (x: add_tags_response) -> assoc_to_yojson(
    [
  ])

let add_tags_request_to_yojson = 
  fun (x: add_tags_request) -> assoc_to_yojson(
    [(
         "TagsList",
         (Some (tags_list_to_yojson x.tags_list)));
       (
         "ResourceId",
         (Some (string__to_yojson x.resource_id)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

