open Smaws_Lib
val service : Service.descriptor

type update_trail_response = {
  is_organization_trail: bool option;
  kms_key_id: string option;
  cloud_watch_logs_role_arn: string option;
  cloud_watch_logs_log_group_arn: string option;
  log_file_validation_enabled: bool option;
  trail_ar_n: string option;
  is_multi_region_trail: bool option;
  include_global_service_events: bool option;
  sns_topic_ar_n: string option;
  sns_topic_name: string option;
  s3_key_prefix: string option;
  s3_bucket_name: string option;
  name: string option
}

type update_trail_request = {
  is_organization_trail: bool option;
  kms_key_id: string option;
  cloud_watch_logs_role_arn: string option;
  cloud_watch_logs_log_group_arn: string option;
  enable_log_file_validation: bool option;
  is_multi_region_trail: bool option;
  include_global_service_events: bool option;
  sns_topic_name: string option;
  s3_key_prefix: string option;
  s3_bucket_name: string option;
  name: string
}

type unsupported_operation_exception = {
  message: string option
}

type trail_not_provided_exception = {
  message: string option
}

type trail_not_found_exception = {
  message: string option
}

type throttling_exception = {
  message: string option
}

type s3_bucket_does_not_exist_exception = {
  message: string option
}

type organizations_not_in_use_exception = {
  message: string option
}

type organization_not_in_all_features_mode_exception = {
  message: string option
}

type operation_not_permitted_exception = {
  message: string option
}

type not_organization_master_account_exception = {
  message: string option
}

type no_management_account_slr_exists_exception = {
  message: string option
}

type kms_key_not_found_exception = {
  message: string option
}

type kms_key_disabled_exception = {
  message: string option
}

type kms_exception = {
  message: string option
}

type invalid_trail_name_exception = {
  message: string option
}

type invalid_sns_topic_name_exception = {
  message: string option
}

type invalid_s3_prefix_exception = {
  message: string option
}

type invalid_s3_bucket_name_exception = {
  message: string option
}

type invalid_parameter_exception = {
  message: string option
}

type invalid_parameter_combination_exception = {
  message: string option
}

type invalid_kms_key_id_exception = {
  message: string option
}

type invalid_home_region_exception = {
  message: string option
}

type invalid_event_selectors_exception = {
  message: string option
}

type invalid_cloud_watch_logs_role_arn_exception = {
  message: string option
}

type invalid_cloud_watch_logs_log_group_arn_exception = {
  message: string option
}

type insufficient_sns_topic_policy_exception = {
  message: string option
}

type insufficient_s3_bucket_policy_exception = {
  message: string option
}

type insufficient_encryption_policy_exception = {
  message: string option
}

type insufficient_dependency_service_access_permission_exception = {
  message: string option
}

type conflict_exception = {
  message: string option
}

type cloud_watch_logs_delivery_unavailable_exception = {
  message: string option
}

type cloud_trail_invalid_client_token_id_exception = {
  message: string option
}

type cloud_trail_arn_invalid_exception = {
  message: string option
}

type cloud_trail_access_not_enabled_exception = {
  message: string option
}

type event_data_store_status = | STOPPED_INGESTION
  | STOPPING_INGESTION
  | STARTING_INGESTION
  | PENDING_DELETION
  | ENABLED
  | CREATED

type advanced_field_selector = {
  not_ends_with: string list option;
  not_starts_with: string list option;
  not_equals: string list option;
  ends_with: string list option;
  starts_with: string list option;
  equals: string list option;
  field: string
}

type advanced_event_selector = {
  field_selectors: advanced_field_selector list;
  name: string option
}

type billing_mode = | FIXED_RETENTION_PRICING
  | EXTENDABLE_RETENTION_PRICING

type federation_status = | DISABLED
  | DISABLING
  | ENABLED
  | ENABLING

type update_event_data_store_response = {
  federation_role_arn: string option;
  federation_status: federation_status option;
  billing_mode: billing_mode option;
  kms_key_id: string option;
  updated_timestamp: float option;
  created_timestamp: float option;
  termination_protection_enabled: bool option;
  retention_period: int option;
  organization_enabled: bool option;
  multi_region_enabled: bool option;
  advanced_event_selectors: advanced_event_selector list option;
  status: event_data_store_status option;
  name: string option;
  event_data_store_arn: string option
}

type update_event_data_store_request = {
  billing_mode: billing_mode option;
  kms_key_id: string option;
  termination_protection_enabled: bool option;
  retention_period: int option;
  organization_enabled: bool option;
  multi_region_enabled: bool option;
  advanced_event_selectors: advanced_event_selector list option;
  name: string option;
  event_data_store: string
}

type invalid_insight_selectors_exception = {
  message: string option
}

type inactive_event_data_store_exception = {
  message: string option
}

type event_data_store_not_found_exception = {
  message: string option
}

type event_data_store_has_ongoing_import_exception = {
  message: string option
}

type event_data_store_arn_invalid_exception = {
  message: string option
}

type event_data_store_already_exists_exception = {
  message: string option
}

type destination_type = | AWS_SERVICE
  | EVENT_DATA_STORE

type destination = {
  location: string;
  type_: destination_type
}

type update_channel_response = {
  destinations: destination list option;
  source: string option;
  name: string option;
  channel_arn: string option
}

type update_channel_request = {
  name: string option;
  destinations: destination list option;
  channel: string
}

type invalid_event_data_store_category_exception = {
  message: string option
}

type channel_not_found_exception = {
  message: string option
}

type channel_arn_invalid_exception = {
  message: string option
}

type channel_already_exists_exception = {
  message: string option
}

type trail_info = {
  home_region: string option;
  name: string option;
  trail_ar_n: string option
}

type trail = {
  is_organization_trail: bool option;
  has_insight_selectors: bool option;
  has_custom_event_selectors: bool option;
  kms_key_id: string option;
  cloud_watch_logs_role_arn: string option;
  cloud_watch_logs_log_group_arn: string option;
  log_file_validation_enabled: bool option;
  trail_ar_n: string option;
  home_region: string option;
  is_multi_region_trail: bool option;
  include_global_service_events: bool option;
  sns_topic_ar_n: string option;
  sns_topic_name: string option;
  s3_key_prefix: string option;
  s3_bucket_name: string option;
  name: string option
}

type trail_already_exists_exception = {
  message: string option
}

type tag = {
  value: string option;
  key: string
}

type tags_limit_exceeded_exception = {
  message: string option
}

type stop_logging_response = unit

type stop_logging_request = {
  name: string
}

type s3_import_source = {
  s3_bucket_access_role_arn: string;
  s3_bucket_region: string;
  s3_location_uri: string
}

type import_source = {
  s3: s3_import_source
}

type import_status = | COMPLETED
  | STOPPED
  | FAILED
  | IN_PROGRESS
  | INITIALIZING

type import_statistics = {
  failed_entries: int option;
  events_completed: int option;
  files_completed: int option;
  prefixes_completed: int option;
  prefixes_found: int option
}

type stop_import_response = {
  import_statistics: import_statistics option;
  end_event_time: float option;
  start_event_time: float option;
  updated_timestamp: float option;
  created_timestamp: float option;
  import_status: import_status option;
  destinations: string list option;
  import_source: import_source option;
  import_id: string option
}

type stop_import_request = {
  import_id: string
}

type import_not_found_exception = {
  message: string option
}

type stop_event_data_store_ingestion_response = unit

type stop_event_data_store_ingestion_request = {
  event_data_store: string
}

type invalid_event_data_store_status_exception = {
  message: string option
}

type start_query_response = {
  query_id: string option
}

type start_query_request = {
  query_parameters: string list option;
  query_alias: string option;
  delivery_s3_uri: string option;
  query_statement: string option
}

type max_concurrent_queries_exception = {
  message: string option
}

type invalid_query_statement_exception = {
  message: string option
}

type start_logging_response = unit

type start_logging_request = {
  name: string
}

type start_import_response = {
  updated_timestamp: float option;
  created_timestamp: float option;
  import_status: import_status option;
  end_event_time: float option;
  start_event_time: float option;
  import_source: import_source option;
  destinations: string list option;
  import_id: string option
}

type start_import_request = {
  import_id: string option;
  end_event_time: float option;
  start_event_time: float option;
  import_source: import_source option;
  destinations: string list option
}

type invalid_import_source_exception = {
  message: string option
}

type account_has_ongoing_import_exception = {
  message: string option
}

type start_event_data_store_ingestion_response = unit

type start_event_data_store_ingestion_request = {
  event_data_store: string
}

type source_config = {
  advanced_event_selectors: advanced_event_selector list option;
  apply_to_all_regions: bool option
}

type restore_event_data_store_response = {
  billing_mode: billing_mode option;
  kms_key_id: string option;
  updated_timestamp: float option;
  created_timestamp: float option;
  termination_protection_enabled: bool option;
  retention_period: int option;
  organization_enabled: bool option;
  multi_region_enabled: bool option;
  advanced_event_selectors: advanced_event_selector list option;
  status: event_data_store_status option;
  name: string option;
  event_data_store_arn: string option
}

type restore_event_data_store_request = {
  event_data_store: string
}

type event_data_store_max_limit_exceeded_exception = {
  message: string option
}

type resource_type_not_supported_exception = {
  message: string option
}

type resource_tag = {
  tags_list: tag list option;
  resource_id: string option
}

type resource_policy_not_valid_exception = {
  message: string option
}

type resource_policy_not_found_exception = {
  message: string option
}

type resource_not_found_exception = {
  message: string option
}

type resource = {
  resource_name: string option;
  resource_type: string option
}

type resource_arn_not_valid_exception = {
  message: string option
}

type remove_tags_response = unit

type remove_tags_request = {
  tags_list: tag list;
  resource_id: string
}

type invalid_tag_parameter_exception = {
  message: string option
}

type register_organization_delegated_admin_response = unit

type register_organization_delegated_admin_request = {
  member_account_id: string
}

type not_organization_management_account_exception = {
  message: string option
}

type delegated_admin_account_limit_exceeded_exception = {
  message: string option
}

type cannot_delegate_management_account_exception = {
  message: string option
}

type account_registered_exception = {
  message: string option
}

type account_not_found_exception = {
  message: string option
}

type read_write_type = | All
  | WriteOnly
  | ReadOnly

type query_status = | TIMED_OUT
  | CANCELLED
  | FAILED
  | FINISHED
  | RUNNING
  | QUEUED

type query_statistics_for_describe_query = {
  creation_time: float option;
  execution_time_in_millis: int option;
  bytes_scanned: int option;
  events_scanned: int option;
  events_matched: int option
}

type query_statistics = {
  bytes_scanned: int option;
  total_results_count: int option;
  results_count: int option
}

type query_id_not_found_exception = {
  message: string option
}

type query = {
  creation_time: float option;
  query_status: query_status option;
  query_id: string option
}

type put_resource_policy_response = {
  resource_policy: string option;
  resource_arn: string option
}

type put_resource_policy_request = {
  resource_policy: string;
  resource_arn: string
}

type insight_type = | ApiErrorRateInsight
  | ApiCallRateInsight

type insight_selector = {
  insight_type: insight_type option
}

type put_insight_selectors_response = {
  insights_destination: string option;
  event_data_store_arn: string option;
  insight_selectors: insight_selector list option;
  trail_ar_n: string option
}

type put_insight_selectors_request = {
  insights_destination: string option;
  event_data_store: string option;
  insight_selectors: insight_selector list;
  trail_name: string option
}

type data_resource = {
  values: string list option;
  type_: string option
}

type event_selector = {
  exclude_management_event_sources: string list option;
  data_resources: data_resource list option;
  include_management_events: bool option;
  read_write_type: read_write_type option
}

type put_event_selectors_response = {
  advanced_event_selectors: advanced_event_selector list option;
  event_selectors: event_selector list option;
  trail_ar_n: string option
}

type put_event_selectors_request = {
  advanced_event_selectors: advanced_event_selector list option;
  event_selectors: event_selector list option;
  trail_name: string
}

type public_key = {
  fingerprint: string option;
  validity_end_time: float option;
  validity_start_time: float option;
  value: bytes option
}

type partition_key = {
  type_: string;
  name: string
}

type maximum_number_of_trails_exceeded_exception = {
  message: string option
}

type event = {
  cloud_trail_event: string option;
  resources: resource list option;
  username: string option;
  event_source: string option;
  event_time: float option;
  access_key_id: string option;
  read_only: string option;
  event_name: string option;
  event_id: string option
}

type lookup_events_response = {
  next_token: string option;
  events: event list option
}

type lookup_attribute_key = | ACCESS_KEY_ID
  | EVENT_SOURCE
  | RESOURCE_NAME
  | RESOURCE_TYPE
  | USERNAME
  | READ_ONLY
  | EVENT_NAME
  | EVENT_ID

type lookup_attribute = {
  attribute_value: string;
  attribute_key: lookup_attribute_key
}

type event_category = | Insight

type lookup_events_request = {
  next_token: string option;
  max_results: int option;
  event_category: event_category option;
  end_time: float option;
  start_time: float option;
  lookup_attributes: lookup_attribute list option
}

type invalid_time_range_exception = {
  message: string option
}

type invalid_next_token_exception = {
  message: string option
}

type invalid_max_results_exception = {
  message: string option
}

type invalid_lookup_attributes_exception = {
  message: string option
}

type invalid_event_category_exception = {
  message: string option
}

type list_trails_response = {
  next_token: string option;
  trails: trail_info list option
}

type list_trails_request = {
  next_token: string option
}

type list_tags_response = {
  next_token: string option;
  resource_tag_list: resource_tag list option
}

type list_tags_request = {
  next_token: string option;
  resource_id_list: string list
}

type invalid_token_exception = {
  message: string option
}

type list_queries_response = {
  next_token: string option;
  queries: query list option
}

type list_queries_request = {
  query_status: query_status option;
  end_time: float option;
  start_time: float option;
  max_results: int option;
  next_token: string option;
  event_data_store: string
}

type invalid_query_status_exception = {
  message: string option
}

type invalid_date_range_exception = {
  message: string option
}

type list_public_keys_response = {
  next_token: string option;
  public_key_list: public_key list option
}

type list_public_keys_request = {
  next_token: string option;
  end_time: float option;
  start_time: float option
}

type list_insights_metric_data_response = {
  next_token: string option;
  values: float list option;
  timestamps: float list option;
  error_code: string option;
  insight_type: insight_type option;
  event_name: string option;
  event_source: string option
}

type insights_metric_data_type = | NON_ZERO_DATA
  | FILL_WITH_ZEROS

type list_insights_metric_data_request = {
  next_token: string option;
  max_results: int option;
  data_type: insights_metric_data_type option;
  period: int option;
  end_time: float option;
  start_time: float option;
  error_code: string option;
  insight_type: insight_type;
  event_name: string;
  event_source: string
}

type imports_list_item = {
  updated_timestamp: float option;
  created_timestamp: float option;
  destinations: string list option;
  import_status: import_status option;
  import_id: string option
}

type list_imports_response = {
  next_token: string option;
  imports: imports_list_item list option
}

type list_imports_request = {
  next_token: string option;
  import_status: import_status option;
  destination: string option;
  max_results: int option
}

type import_failure_status = | SUCCEEDED
  | RETRY
  | FAILED

type import_failure_list_item = {
  last_updated_time: float option;
  error_message: string option;
  error_type: string option;
  status: import_failure_status option;
  location: string option
}

type list_import_failures_response = {
  next_token: string option;
  failures: import_failure_list_item list option
}

type list_import_failures_request = {
  next_token: string option;
  max_results: int option;
  import_id: string
}

type event_data_store = {
  updated_timestamp: float option;
  created_timestamp: float option;
  retention_period: int option;
  organization_enabled: bool option;
  multi_region_enabled: bool option;
  advanced_event_selectors: advanced_event_selector list option;
  status: event_data_store_status option;
  termination_protection_enabled: bool option;
  name: string option;
  event_data_store_arn: string option
}

type list_event_data_stores_response = {
  next_token: string option;
  event_data_stores: event_data_store list option
}

type list_event_data_stores_request = {
  max_results: int option;
  next_token: string option
}

type channel = {
  name: string option;
  channel_arn: string option
}

type list_channels_response = {
  next_token: string option;
  channels: channel list option
}

type list_channels_request = {
  next_token: string option;
  max_results: int option
}

type invalid_source_exception = {
  message: string option
}

type insight_not_enabled_exception = {
  message: string option
}

type ingestion_status = {
  latest_ingestion_attempt_event_i_d: string option;
  latest_ingestion_attempt_time: float option;
  latest_ingestion_error_code: string option;
  latest_ingestion_success_event_i_d: string option;
  latest_ingestion_success_time: float option
}

type inactive_query_exception = {
  message: string option
}

type get_trail_status_response = {
  time_logging_stopped: string option;
  time_logging_started: string option;
  latest_delivery_attempt_succeeded: string option;
  latest_notification_attempt_succeeded: string option;
  latest_notification_attempt_time: string option;
  latest_delivery_attempt_time: string option;
  latest_digest_delivery_error: string option;
  latest_digest_delivery_time: float option;
  latest_cloud_watch_logs_delivery_time: float option;
  latest_cloud_watch_logs_delivery_error: string option;
  stop_logging_time: float option;
  start_logging_time: float option;
  latest_notification_time: float option;
  latest_delivery_time: float option;
  latest_notification_error: string option;
  latest_delivery_error: string option;
  is_logging: bool option
}

type get_trail_status_request = {
  name: string
}

type get_trail_response = {
  trail: trail option
}

type get_trail_request = {
  name: string
}

type get_resource_policy_response = {
  resource_policy: string option;
  resource_arn: string option
}

type get_resource_policy_request = {
  resource_arn: string
}

type get_query_results_response = {
  error_message: string option;
  next_token: string option;
  query_result_rows: (string * string) list list list option;
  query_statistics: query_statistics option;
  query_status: query_status option
}

type get_query_results_request = {
  max_query_results: int option;
  next_token: string option;
  query_id: string;
  event_data_store: string option
}

type get_insight_selectors_response = {
  insights_destination: string option;
  event_data_store_arn: string option;
  insight_selectors: insight_selector list option;
  trail_ar_n: string option
}

type get_insight_selectors_request = {
  event_data_store: string option;
  trail_name: string option
}

type get_import_response = {
  import_statistics: import_statistics option;
  updated_timestamp: float option;
  created_timestamp: float option;
  import_status: import_status option;
  end_event_time: float option;
  start_event_time: float option;
  import_source: import_source option;
  destinations: string list option;
  import_id: string option
}

type get_import_request = {
  import_id: string
}

type get_event_selectors_response = {
  advanced_event_selectors: advanced_event_selector list option;
  event_selectors: event_selector list option;
  trail_ar_n: string option
}

type get_event_selectors_request = {
  trail_name: string
}

type get_event_data_store_response = {
  partition_keys: partition_key list option;
  federation_role_arn: string option;
  federation_status: federation_status option;
  billing_mode: billing_mode option;
  kms_key_id: string option;
  updated_timestamp: float option;
  created_timestamp: float option;
  termination_protection_enabled: bool option;
  retention_period: int option;
  organization_enabled: bool option;
  multi_region_enabled: bool option;
  advanced_event_selectors: advanced_event_selector list option;
  status: event_data_store_status option;
  name: string option;
  event_data_store_arn: string option
}

type get_event_data_store_request = {
  event_data_store: string
}

type get_channel_response = {
  ingestion_status: ingestion_status option;
  destinations: destination list option;
  source_config: source_config option;
  source: string option;
  name: string option;
  channel_arn: string option
}

type get_channel_request = {
  channel: string
}

type event_data_store_termination_protected_exception = {
  message: string option
}

type event_data_store_federation_enabled_exception = {
  message: string option
}

type enable_federation_response = {
  federation_role_arn: string option;
  federation_status: federation_status option;
  event_data_store_arn: string option
}

type enable_federation_request = {
  federation_role_arn: string;
  event_data_store: string
}

type concurrent_modification_exception = {
  message: string option
}

type access_denied_exception = {
  message: string option
}

type disable_federation_response = {
  federation_status: federation_status option;
  event_data_store_arn: string option
}

type disable_federation_request = {
  event_data_store: string
}

type describe_trails_response = {
  trail_list: trail list option
}

type describe_trails_request = {
  include_shadow_trails: bool option;
  trail_name_list: string list option
}

type delivery_status = | UNKNOWN
  | CANCELLED
  | ACCESS_DENIED_SIGNING_FILE
  | ACCESS_DENIED
  | RESOURCE_NOT_FOUND
  | PENDING
  | FAILED_SIGNING_FILE
  | FAILED
  | SUCCESS

type describe_query_response = {
  delivery_status: delivery_status option;
  delivery_s3_uri: string option;
  error_message: string option;
  query_statistics: query_statistics_for_describe_query option;
  query_status: query_status option;
  query_string: string option;
  query_id: string option
}

type describe_query_request = {
  query_alias: string option;
  query_id: string option;
  event_data_store: string option
}

type deregister_organization_delegated_admin_response = unit

type deregister_organization_delegated_admin_request = {
  delegated_admin_account_id: string
}

type account_not_registered_exception = {
  message: string option
}

type delete_trail_response = unit

type delete_trail_request = {
  name: string
}

type delete_resource_policy_response = unit

type delete_resource_policy_request = {
  resource_arn: string
}

type delete_event_data_store_response = unit

type delete_event_data_store_request = {
  event_data_store: string
}

type channel_exists_for_eds_exception = {
  message: string option
}

type delete_channel_response = unit

type delete_channel_request = {
  channel: string
}

type create_trail_response = {
  is_organization_trail: bool option;
  kms_key_id: string option;
  cloud_watch_logs_role_arn: string option;
  cloud_watch_logs_log_group_arn: string option;
  log_file_validation_enabled: bool option;
  trail_ar_n: string option;
  is_multi_region_trail: bool option;
  include_global_service_events: bool option;
  sns_topic_ar_n: string option;
  sns_topic_name: string option;
  s3_key_prefix: string option;
  s3_bucket_name: string option;
  name: string option
}

type create_trail_request = {
  tags_list: tag list option;
  is_organization_trail: bool option;
  kms_key_id: string option;
  cloud_watch_logs_role_arn: string option;
  cloud_watch_logs_log_group_arn: string option;
  enable_log_file_validation: bool option;
  is_multi_region_trail: bool option;
  include_global_service_events: bool option;
  sns_topic_name: string option;
  s3_key_prefix: string option;
  s3_bucket_name: string;
  name: string
}

type create_event_data_store_response = {
  billing_mode: billing_mode option;
  kms_key_id: string option;
  updated_timestamp: float option;
  created_timestamp: float option;
  tags_list: tag list option;
  termination_protection_enabled: bool option;
  retention_period: int option;
  organization_enabled: bool option;
  multi_region_enabled: bool option;
  advanced_event_selectors: advanced_event_selector list option;
  status: event_data_store_status option;
  name: string option;
  event_data_store_arn: string option
}

type create_event_data_store_request = {
  billing_mode: billing_mode option;
  start_ingestion: bool option;
  kms_key_id: string option;
  tags_list: tag list option;
  termination_protection_enabled: bool option;
  retention_period: int option;
  organization_enabled: bool option;
  multi_region_enabled: bool option;
  advanced_event_selectors: advanced_event_selector list option;
  name: string
}

type create_channel_response = {
  tags: tag list option;
  destinations: destination list option;
  source: string option;
  name: string option;
  channel_arn: string option
}

type create_channel_request = {
  tags: tag list option;
  destinations: destination list;
  source: string;
  name: string
}

type channel_max_limit_exceeded_exception = {
  message: string option
}

type cancel_query_response = {
  query_status: query_status;
  query_id: string
}

type cancel_query_request = {
  query_id: string;
  event_data_store: string option
}

type add_tags_response = unit

type add_tags_request = {
  tags_list: tag list;
  resource_id: string
}



type base_document = Json.t

val make_update_trail_response :
  ?is_organization_trail:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?log_file_validation_enabled:bool ->
  ?trail_ar_n:string ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_ar_n:string ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  ?name:string ->
  unit -> update_trail_response

val make_update_trail_request :
  ?is_organization_trail:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?enable_log_file_validation:bool ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  name:string ->
  unit -> update_trail_request

val make_advanced_field_selector :
  ?not_ends_with:string list ->
  ?not_starts_with:string list ->
  ?not_equals:string list ->
  ?ends_with:string list ->
  ?starts_with:string list ->
  ?equals:string list ->
  field:string ->
  unit -> advanced_field_selector

val make_advanced_event_selector :
  ?name:string -> field_selectors:advanced_field_selector list -> unit
-> advanced_event_selector

val make_update_event_data_store_response :
  ?federation_role_arn:string ->
  ?federation_status:federation_status ->
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit
-> update_event_data_store_response

val make_update_event_data_store_request :
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?name:string ->
  event_data_store:string ->
  unit -> update_event_data_store_request

val make_destination : location:string -> type_:destination_type -> unit
-> destination

val make_update_channel_response :
  ?destinations:destination list ->
  ?source:string ->
  ?name:string ->
  ?channel_arn:string ->
  unit -> update_channel_response

val make_update_channel_request :
  ?name:string -> ?destinations:destination list -> channel:string -> unit
-> update_channel_request

val make_trail_info :
  ?home_region:string -> ?name:string -> ?trail_ar_n:string -> unit
-> trail_info

val make_trail :
  ?is_organization_trail:bool ->
  ?has_insight_selectors:bool ->
  ?has_custom_event_selectors:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?log_file_validation_enabled:bool ->
  ?trail_ar_n:string ->
  ?home_region:string ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_ar_n:string ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  ?name:string ->
  unit -> trail

val make_tag : ?value:string -> key:string -> unit
-> tag

val make_stop_logging_response : unit
-> stop_logging_response

val make_stop_logging_request : name:string -> unit
-> stop_logging_request

val make_s3_import_source :
  s3_bucket_access_role_arn:string ->
  s3_bucket_region:string ->
  s3_location_uri:string ->
  unit -> s3_import_source

val make_import_source : s3:s3_import_source -> unit
-> import_source

val make_import_statistics :
  ?failed_entries:int ->
  ?events_completed:int ->
  ?files_completed:int ->
  ?prefixes_completed:int ->
  ?prefixes_found:int ->
  unit -> import_statistics

val make_stop_import_response :
  ?import_statistics:import_statistics ->
  ?end_event_time:float ->
  ?start_event_time:float ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?import_status:import_status ->
  ?destinations:string list ->
  ?import_source:import_source ->
  ?import_id:string ->
  unit -> stop_import_response

val make_stop_import_request : import_id:string -> unit
-> stop_import_request

val make_stop_event_data_store_ingestion_response : unit
-> stop_event_data_store_ingestion_response

val make_stop_event_data_store_ingestion_request :
  event_data_store:string -> unit
-> stop_event_data_store_ingestion_request

val make_start_query_response : ?query_id:string -> unit
-> start_query_response

val make_start_query_request :
  ?query_parameters:string list ->
  ?query_alias:string ->
  ?delivery_s3_uri:string ->
  ?query_statement:string ->
  unit -> start_query_request

val make_start_logging_response : unit
-> start_logging_response

val make_start_logging_request : name:string -> unit
-> start_logging_request

val make_start_import_response :
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?import_status:import_status ->
  ?end_event_time:float ->
  ?start_event_time:float ->
  ?import_source:import_source ->
  ?destinations:string list ->
  ?import_id:string ->
  unit -> start_import_response

val make_start_import_request :
  ?import_id:string ->
  ?end_event_time:float ->
  ?start_event_time:float ->
  ?import_source:import_source ->
  ?destinations:string list ->
  unit
-> start_import_request

val make_start_event_data_store_ingestion_response : unit
-> start_event_data_store_ingestion_response

val make_start_event_data_store_ingestion_request :
  event_data_store:string -> unit
-> start_event_data_store_ingestion_request

val make_source_config :
  ?advanced_event_selectors:advanced_event_selector list ->
  ?apply_to_all_regions:bool ->
  unit -> source_config

val make_restore_event_data_store_response :
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit
-> restore_event_data_store_response

val make_restore_event_data_store_request : event_data_store:string -> unit
-> restore_event_data_store_request

val make_resource_tag : ?tags_list:tag list -> ?resource_id:string -> unit
-> resource_tag

val make_resource : ?resource_name:string -> ?resource_type:string -> unit
-> resource

val make_remove_tags_response : unit
-> remove_tags_response

val make_remove_tags_request :
  tags_list:tag list -> resource_id:string -> unit
-> remove_tags_request

val make_register_organization_delegated_admin_response : unit
-> register_organization_delegated_admin_response

val make_register_organization_delegated_admin_request :
  member_account_id:string -> unit
-> register_organization_delegated_admin_request

val make_query_statistics_for_describe_query :
  ?creation_time:float ->
  ?execution_time_in_millis:int ->
  ?bytes_scanned:int ->
  ?events_scanned:int ->
  ?events_matched:int ->
  unit -> query_statistics_for_describe_query

val make_query_statistics :
  ?bytes_scanned:int ->
  ?total_results_count:int ->
  ?results_count:int ->
  unit -> query_statistics

val make_query :
  ?creation_time:float ->
  ?query_status:query_status ->
  ?query_id:string ->
  unit -> query

val make_put_resource_policy_response :
  ?resource_policy:string -> ?resource_arn:string -> unit
-> put_resource_policy_response

val make_put_resource_policy_request :
  resource_policy:string -> resource_arn:string -> unit
-> put_resource_policy_request

val make_insight_selector : ?insight_type:insight_type -> unit
-> insight_selector

val make_put_insight_selectors_response :
  ?insights_destination:string ->
  ?event_data_store_arn:string ->
  ?insight_selectors:insight_selector list ->
  ?trail_ar_n:string ->
  unit
-> put_insight_selectors_response

val make_put_insight_selectors_request :
  ?insights_destination:string ->
  ?event_data_store:string ->
  ?trail_name:string ->
  insight_selectors:insight_selector list ->
  unit -> put_insight_selectors_request

val make_data_resource : ?values:string list -> ?type_:string -> unit
-> data_resource

val make_event_selector :
  ?exclude_management_event_sources:string list ->
  ?data_resources:data_resource list ->
  ?include_management_events:bool ->
  ?read_write_type:read_write_type ->
  unit -> event_selector

val make_put_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selector list ->
  ?event_selectors:event_selector list ->
  ?trail_ar_n:string ->
  unit -> put_event_selectors_response

val make_put_event_selectors_request :
  ?advanced_event_selectors:advanced_event_selector list ->
  ?event_selectors:event_selector list ->
  trail_name:string ->
  unit -> put_event_selectors_request

val make_public_key :
  ?fingerprint:string ->
  ?validity_end_time:float ->
  ?validity_start_time:float ->
  ?value:bytes ->
  unit -> public_key

val make_partition_key : type_:string -> name:string -> unit
-> partition_key

val make_event :
  ?cloud_trail_event:string ->
  ?resources:resource list ->
  ?username:string ->
  ?event_source:string ->
  ?event_time:float ->
  ?access_key_id:string ->
  ?read_only:string ->
  ?event_name:string ->
  ?event_id:string ->
  unit -> event

val make_lookup_events_response :
  ?next_token:string -> ?events:event list -> unit
-> lookup_events_response

val make_lookup_attribute :
  attribute_value:string -> attribute_key:lookup_attribute_key -> unit
-> lookup_attribute

val make_lookup_events_request :
  ?next_token:string ->
  ?max_results:int ->
  ?event_category:event_category ->
  ?end_time:float ->
  ?start_time:float ->
  ?lookup_attributes:lookup_attribute list ->
  unit -> lookup_events_request

val make_list_trails_response :
  ?next_token:string -> ?trails:trail_info list -> unit
-> list_trails_response

val make_list_trails_request : ?next_token:string -> unit
-> list_trails_request

val make_list_tags_response :
  ?next_token:string -> ?resource_tag_list:resource_tag list -> unit
-> list_tags_response

val make_list_tags_request :
  ?next_token:string -> resource_id_list:string list -> unit
-> list_tags_request

val make_list_queries_response :
  ?next_token:string -> ?queries:query list -> unit
-> list_queries_response

val make_list_queries_request :
  ?query_status:query_status ->
  ?end_time:float ->
  ?start_time:float ->
  ?max_results:int ->
  ?next_token:string ->
  event_data_store:string ->
  unit -> list_queries_request

val make_list_public_keys_response :
  ?next_token:string -> ?public_key_list:public_key list -> unit
-> list_public_keys_response

val make_list_public_keys_request :
  ?next_token:string -> ?end_time:float -> ?start_time:float -> unit
-> list_public_keys_request

val make_list_insights_metric_data_response :
  ?next_token:string ->
  ?values:float list ->
  ?timestamps:float list ->
  ?error_code:string ->
  ?insight_type:insight_type ->
  ?event_name:string ->
  ?event_source:string ->
  unit
-> list_insights_metric_data_response

val make_list_insights_metric_data_request :
  ?next_token:string ->
  ?max_results:int ->
  ?data_type:insights_metric_data_type ->
  ?period:int ->
  ?end_time:float ->
  ?start_time:float ->
  ?error_code:string ->
  insight_type:insight_type ->
  event_name:string ->
  event_source:string ->
  unit -> list_insights_metric_data_request

val make_imports_list_item :
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?destinations:string list ->
  ?import_status:import_status ->
  ?import_id:string ->
  unit -> imports_list_item

val make_list_imports_response :
  ?next_token:string -> ?imports:imports_list_item list -> unit
-> list_imports_response

val make_list_imports_request :
  ?next_token:string ->
  ?import_status:import_status ->
  ?destination:string ->
  ?max_results:int ->
  unit -> list_imports_request

val make_import_failure_list_item :
  ?last_updated_time:float ->
  ?error_message:string ->
  ?error_type:string ->
  ?status:import_failure_status ->
  ?location:string ->
  unit -> import_failure_list_item

val make_list_import_failures_response :
  ?next_token:string -> ?failures:import_failure_list_item list -> unit
-> list_import_failures_response

val make_list_import_failures_request :
  ?next_token:string -> ?max_results:int -> import_id:string -> unit
-> list_import_failures_request

val make_event_data_store :
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?termination_protection_enabled:bool ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit -> event_data_store

val make_list_event_data_stores_response :
  ?next_token:string -> ?event_data_stores:event_data_store list -> unit
-> list_event_data_stores_response

val make_list_event_data_stores_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_event_data_stores_request

val make_channel : ?name:string -> ?channel_arn:string -> unit
-> channel

val make_list_channels_response :
  ?next_token:string -> ?channels:channel list -> unit
-> list_channels_response

val make_list_channels_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_channels_request

val make_ingestion_status :
  ?latest_ingestion_attempt_event_i_d:string ->
  ?latest_ingestion_attempt_time:float ->
  ?latest_ingestion_error_code:string ->
  ?latest_ingestion_success_event_i_d:string ->
  ?latest_ingestion_success_time:float ->
  unit -> ingestion_status

val make_get_trail_status_response :
  ?time_logging_stopped:string ->
  ?time_logging_started:string ->
  ?latest_delivery_attempt_succeeded:string ->
  ?latest_notification_attempt_succeeded:string ->
  ?latest_notification_attempt_time:string ->
  ?latest_delivery_attempt_time:string ->
  ?latest_digest_delivery_error:string ->
  ?latest_digest_delivery_time:float ->
  ?latest_cloud_watch_logs_delivery_time:float ->
  ?latest_cloud_watch_logs_delivery_error:string ->
  ?stop_logging_time:float ->
  ?start_logging_time:float ->
  ?latest_notification_time:float ->
  ?latest_delivery_time:float ->
  ?latest_notification_error:string ->
  ?latest_delivery_error:string ->
  ?is_logging:bool ->
  unit -> get_trail_status_response

val make_get_trail_status_request : name:string -> unit
-> get_trail_status_request

val make_get_trail_response : ?trail:trail -> unit
-> get_trail_response

val make_get_trail_request : name:string -> unit
-> get_trail_request

val make_get_resource_policy_response :
  ?resource_policy:string -> ?resource_arn:string -> unit
-> get_resource_policy_response

val make_get_resource_policy_request : resource_arn:string -> unit
-> get_resource_policy_request

val make_get_query_results_response :
  ?error_message:string ->
  ?next_token:string ->
  ?query_result_rows:(string * string) list list list ->
  ?query_statistics:query_statistics ->
  ?query_status:query_status ->
  unit -> get_query_results_response

val make_get_query_results_request :
  ?max_query_results:int ->
  ?next_token:string ->
  ?event_data_store:string ->
  query_id:string ->
  unit -> get_query_results_request

val make_get_insight_selectors_response :
  ?insights_destination:string ->
  ?event_data_store_arn:string ->
  ?insight_selectors:insight_selector list ->
  ?trail_ar_n:string ->
  unit
-> get_insight_selectors_response

val make_get_insight_selectors_request :
  ?event_data_store:string -> ?trail_name:string -> unit
-> get_insight_selectors_request

val make_get_import_response :
  ?import_statistics:import_statistics ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?import_status:import_status ->
  ?end_event_time:float ->
  ?start_event_time:float ->
  ?import_source:import_source ->
  ?destinations:string list ->
  ?import_id:string ->
  unit -> get_import_response

val make_get_import_request : import_id:string -> unit
-> get_import_request

val make_get_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selector list ->
  ?event_selectors:event_selector list ->
  ?trail_ar_n:string ->
  unit -> get_event_selectors_response

val make_get_event_selectors_request : trail_name:string -> unit
-> get_event_selectors_request

val make_get_event_data_store_response :
  ?partition_keys:partition_key list ->
  ?federation_role_arn:string ->
  ?federation_status:federation_status ->
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit
-> get_event_data_store_response

val make_get_event_data_store_request : event_data_store:string -> unit
-> get_event_data_store_request

val make_get_channel_response :
  ?ingestion_status:ingestion_status ->
  ?destinations:destination list ->
  ?source_config:source_config ->
  ?source:string ->
  ?name:string ->
  ?channel_arn:string ->
  unit -> get_channel_response

val make_get_channel_request : channel:string -> unit
-> get_channel_request

val make_enable_federation_response :
  ?federation_role_arn:string ->
  ?federation_status:federation_status ->
  ?event_data_store_arn:string ->
  unit -> enable_federation_response

val make_enable_federation_request :
  federation_role_arn:string -> event_data_store:string -> unit
-> enable_federation_request

val make_disable_federation_response :
  ?federation_status:federation_status ->
  ?event_data_store_arn:string ->
  unit -> disable_federation_response

val make_disable_federation_request : event_data_store:string -> unit
-> disable_federation_request

val make_describe_trails_response : ?trail_list:trail list -> unit
-> describe_trails_response

val make_describe_trails_request :
  ?include_shadow_trails:bool -> ?trail_name_list:string list -> unit
-> describe_trails_request

val make_describe_query_response :
  ?delivery_status:delivery_status ->
  ?delivery_s3_uri:string ->
  ?error_message:string ->
  ?query_statistics:query_statistics_for_describe_query ->
  ?query_status:query_status ->
  ?query_string:string ->
  ?query_id:string ->
  unit -> describe_query_response

val make_describe_query_request :
  ?query_alias:string -> ?query_id:string -> ?event_data_store:string -> unit
-> describe_query_request

val make_deregister_organization_delegated_admin_response : unit
-> deregister_organization_delegated_admin_response

val make_deregister_organization_delegated_admin_request :
  delegated_admin_account_id:string -> unit
-> deregister_organization_delegated_admin_request

val make_delete_trail_response : unit
-> delete_trail_response

val make_delete_trail_request : name:string -> unit
-> delete_trail_request

val make_delete_resource_policy_response : unit
-> delete_resource_policy_response

val make_delete_resource_policy_request : resource_arn:string -> unit
-> delete_resource_policy_request

val make_delete_event_data_store_response : unit
-> delete_event_data_store_response

val make_delete_event_data_store_request : event_data_store:string -> unit
-> delete_event_data_store_request

val make_delete_channel_response : unit
-> delete_channel_response

val make_delete_channel_request : channel:string -> unit
-> delete_channel_request

val make_create_trail_response :
  ?is_organization_trail:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?log_file_validation_enabled:bool ->
  ?trail_ar_n:string ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_ar_n:string ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  ?name:string ->
  unit -> create_trail_response

val make_create_trail_request :
  ?tags_list:tag list ->
  ?is_organization_trail:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?enable_log_file_validation:bool ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  s3_bucket_name:string ->
  name:string ->
  unit -> create_trail_request

val make_create_event_data_store_response :
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?tags_list:tag list ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit
-> create_event_data_store_response

val make_create_event_data_store_request :
  ?billing_mode:billing_mode ->
  ?start_ingestion:bool ->
  ?kms_key_id:string ->
  ?tags_list:tag list ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  name:string ->
  unit -> create_event_data_store_request

val make_create_channel_response :
  ?tags:tag list ->
  ?destinations:destination list ->
  ?source:string ->
  ?name:string ->
  ?channel_arn:string ->
  unit -> create_channel_response

val make_create_channel_request :
  ?tags:tag list ->
  destinations:destination list ->
  source:string ->
  name:string ->
  unit -> create_channel_request

val make_cancel_query_response :
  query_status:query_status -> query_id:string -> unit
-> cancel_query_response

val make_cancel_query_request :
  ?event_data_store:string -> query_id:string -> unit
-> cancel_query_request

val make_add_tags_response : unit
-> add_tags_response

val make_add_tags_request : tags_list:tag list -> resource_id:string -> unit
-> add_tags_request

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

