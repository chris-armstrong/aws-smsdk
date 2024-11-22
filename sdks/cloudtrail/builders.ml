[@@@warning "-39"]
open Types
let make_update_trail_response 
  ?(is_organization_trail : bool option)
  ?(kms_key_id : string option)
  ?(cloud_watch_logs_role_arn : string option)
  ?(cloud_watch_logs_log_group_arn : string option)
  ?(log_file_validation_enabled : bool option)
  ?(trail_ar_n : string option)
  ?(is_multi_region_trail : bool option)
  ?(include_global_service_events : bool option)
  ?(sns_topic_ar_n : string option)
  ?(sns_topic_name : string option)
  ?(s3_key_prefix : string option)
  ?(s3_bucket_name : string option)
  ?(name : string option)
  () : update_trail_response = {
  is_organization_trail;
  kms_key_id;
  cloud_watch_logs_role_arn;
  cloud_watch_logs_log_group_arn;
  log_file_validation_enabled;
  trail_ar_n;
  is_multi_region_trail;
  include_global_service_events;
  sns_topic_ar_n;
  sns_topic_name;
  s3_key_prefix;
  s3_bucket_name;
  name;
   }

let make_update_trail_request 
  ?(is_organization_trail : bool option)
  ?(kms_key_id : string option)
  ?(cloud_watch_logs_role_arn : string option)
  ?(cloud_watch_logs_log_group_arn : string option)
  ?(enable_log_file_validation : bool option)
  ?(is_multi_region_trail : bool option)
  ?(include_global_service_events : bool option)
  ?(sns_topic_name : string option)
  ?(s3_key_prefix : string option)
  ?(s3_bucket_name : string option)
  ~(name : string)
  () : update_trail_request = {
  is_organization_trail;
  kms_key_id;
  cloud_watch_logs_role_arn;
  cloud_watch_logs_log_group_arn;
  enable_log_file_validation;
  is_multi_region_trail;
  include_global_service_events;
  sns_topic_name;
  s3_key_prefix;
  s3_bucket_name;
  name;
   }

let make_advanced_field_selector 
  ?(not_ends_with : string list option)
  ?(not_starts_with : string list option)
  ?(not_equals : string list option)
  ?(ends_with : string list option)
  ?(starts_with : string list option)
  ?(equals : string list option)
  ~(field : string)
  () : advanced_field_selector = {
  not_ends_with;
  not_starts_with;
  not_equals;
  ends_with;
  starts_with;
  equals;
  field;
   }

let make_advanced_event_selector 
  ?(name : string option)
  ~(field_selectors : advanced_field_selector list)
  () : advanced_event_selector = { field_selectors; name; 
}

let make_update_event_data_store_response 
  ?(federation_role_arn : string option)
  ?(federation_status : federation_status option)
  ?(billing_mode : billing_mode option)
  ?(kms_key_id : string option)
  ?(updated_timestamp : float option)
  ?(created_timestamp : float option)
  ?(termination_protection_enabled : bool option)
  ?(retention_period : int option)
  ?(organization_enabled : bool option)
  ?(multi_region_enabled : bool option)
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(status : event_data_store_status option)
  ?(name : string option)
  ?(event_data_store_arn : string option)
  () : update_event_data_store_response = {
  federation_role_arn;
  federation_status;
  billing_mode;
  kms_key_id;
  updated_timestamp;
  created_timestamp;
  termination_protection_enabled;
  retention_period;
  organization_enabled;
  multi_region_enabled;
  advanced_event_selectors;
  status;
  name;
  event_data_store_arn;
   }

let make_update_event_data_store_request 
  ?(billing_mode : billing_mode option)
  ?(kms_key_id : string option)
  ?(termination_protection_enabled : bool option)
  ?(retention_period : int option)
  ?(organization_enabled : bool option)
  ?(multi_region_enabled : bool option)
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(name : string option)
  ~(event_data_store : string)
  () : update_event_data_store_request = {
  billing_mode;
  kms_key_id;
  termination_protection_enabled;
  retention_period;
  organization_enabled;
  multi_region_enabled;
  advanced_event_selectors;
  name;
  event_data_store;
   }

let make_destination  ~(location : string) ~(type_ : destination_type) ()
: destination = { location; type_;  }

let make_update_channel_response 
  ?(destinations : destination list option)
  ?(source : string option)
  ?(name : string option)
  ?(channel_arn : string option)
  () : update_channel_response = { destinations; source; name; channel_arn; 
}

let make_update_channel_request 
  ?(name : string option)
  ?(destinations : destination list option)
  ~(channel : string)
  () : update_channel_request = { name; destinations; channel; 
}

let make_trail_info 
  ?(home_region : string option)
  ?(name : string option)
  ?(trail_ar_n : string option)
  () : trail_info = { home_region; name; trail_ar_n;  }

let make_trail 
  ?(is_organization_trail : bool option)
  ?(has_insight_selectors : bool option)
  ?(has_custom_event_selectors : bool option)
  ?(kms_key_id : string option)
  ?(cloud_watch_logs_role_arn : string option)
  ?(cloud_watch_logs_log_group_arn : string option)
  ?(log_file_validation_enabled : bool option)
  ?(trail_ar_n : string option)
  ?(home_region : string option)
  ?(is_multi_region_trail : bool option)
  ?(include_global_service_events : bool option)
  ?(sns_topic_ar_n : string option)
  ?(sns_topic_name : string option)
  ?(s3_key_prefix : string option)
  ?(s3_bucket_name : string option)
  ?(name : string option)
  () : trail = {
  is_organization_trail;
  has_insight_selectors;
  has_custom_event_selectors;
  kms_key_id;
  cloud_watch_logs_role_arn;
  cloud_watch_logs_log_group_arn;
  log_file_validation_enabled;
  trail_ar_n;
  home_region;
  is_multi_region_trail;
  include_global_service_events;
  sns_topic_ar_n;
  sns_topic_name;
  s3_key_prefix;
  s3_bucket_name;
  name;
   }

let make_tag  ?(value : string option) ~(key : string) () : tag = {
  value; key;  }

let make_stop_logging_response  () : stop_logging_response =
()

let make_stop_logging_request  ~(name : string) () : stop_logging_request = {
  name;  }

let make_s3_import_source 
  ~(s3_bucket_access_role_arn : string)
  ~(s3_bucket_region : string)
  ~(s3_location_uri : string)
  () : s3_import_source = {
  s3_bucket_access_role_arn; s3_bucket_region; s3_location_uri; 
}

let make_import_source  ~(s3 : s3_import_source) () : import_source = { 
s3;  }

let make_import_statistics 
  ?(failed_entries : int option)
  ?(events_completed : int option)
  ?(files_completed : int option)
  ?(prefixes_completed : int option)
  ?(prefixes_found : int option)
  () : import_statistics = {
  failed_entries;
  events_completed;
  files_completed;
  prefixes_completed;
  prefixes_found;
   }

let make_stop_import_response 
  ?(import_statistics : import_statistics option)
  ?(end_event_time : float option)
  ?(start_event_time : float option)
  ?(updated_timestamp : float option)
  ?(created_timestamp : float option)
  ?(import_status : import_status option)
  ?(destinations : string list option)
  ?(import_source : import_source option)
  ?(import_id : string option)
  () : stop_import_response = {
  import_statistics;
  end_event_time;
  start_event_time;
  updated_timestamp;
  created_timestamp;
  import_status;
  destinations;
  import_source;
  import_id;
   }

let make_stop_import_request  ~(import_id : string) () : stop_import_request
= { import_id;  }

let make_stop_event_data_store_ingestion_response  ()
: stop_event_data_store_ingestion_response =
()

let make_stop_event_data_store_ingestion_request 
  ~(event_data_store : string) () : stop_event_data_store_ingestion_request =
{ event_data_store;  }

let make_start_query_response  ?(query_id : string option) ()
: start_query_response = { query_id;  }

let make_start_query_request 
  ?(query_parameters : string list option)
  ?(query_alias : string option)
  ?(delivery_s3_uri : string option)
  ?(query_statement : string option)
  () : start_query_request = {
  query_parameters; query_alias; delivery_s3_uri; query_statement; 
}

let make_start_logging_response  () : start_logging_response =
()

let make_start_logging_request  ~(name : string) () : start_logging_request =
{ name;  }

let make_start_import_response 
  ?(updated_timestamp : float option)
  ?(created_timestamp : float option)
  ?(import_status : import_status option)
  ?(end_event_time : float option)
  ?(start_event_time : float option)
  ?(import_source : import_source option)
  ?(destinations : string list option)
  ?(import_id : string option)
  () : start_import_response = {
  updated_timestamp;
  created_timestamp;
  import_status;
  end_event_time;
  start_event_time;
  import_source;
  destinations;
  import_id;
   }

let make_start_import_request 
  ?(import_id : string option)
  ?(end_event_time : float option)
  ?(start_event_time : float option)
  ?(import_source : import_source option)
  ?(destinations : string list option)
  () : start_import_request = {
  import_id; end_event_time; start_event_time; import_source; destinations; 
}

let make_start_event_data_store_ingestion_response  ()
: start_event_data_store_ingestion_response =
()

let make_start_event_data_store_ingestion_request 
  ~(event_data_store : string) () : start_event_data_store_ingestion_request
= { event_data_store;  }

let make_source_config 
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(apply_to_all_regions : bool option)
  () : source_config = { advanced_event_selectors; apply_to_all_regions; 
}

let make_restore_event_data_store_response 
  ?(billing_mode : billing_mode option)
  ?(kms_key_id : string option)
  ?(updated_timestamp : float option)
  ?(created_timestamp : float option)
  ?(termination_protection_enabled : bool option)
  ?(retention_period : int option)
  ?(organization_enabled : bool option)
  ?(multi_region_enabled : bool option)
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(status : event_data_store_status option)
  ?(name : string option)
  ?(event_data_store_arn : string option)
  () : restore_event_data_store_response = {
  billing_mode;
  kms_key_id;
  updated_timestamp;
  created_timestamp;
  termination_protection_enabled;
  retention_period;
  organization_enabled;
  multi_region_enabled;
  advanced_event_selectors;
  status;
  name;
  event_data_store_arn;
   }

let make_restore_event_data_store_request  ~(event_data_store : string) ()
: restore_event_data_store_request = { event_data_store; 
}

let make_resource_tag 
  ?(tags_list : tag list option) ?(resource_id : string option) ()
: resource_tag = { tags_list; resource_id;  }

let make_resource 
  ?(resource_name : string option) ?(resource_type : string option) ()
: resource = { resource_name; resource_type;  }

let make_remove_tags_response  () : remove_tags_response =
()

let make_remove_tags_request 
  ~(tags_list : tag list) ~(resource_id : string) () : remove_tags_request =
{ tags_list; resource_id; 
}

let make_register_organization_delegated_admin_response  ()
: register_organization_delegated_admin_response =
()

let make_register_organization_delegated_admin_request 
  ~(member_account_id : string) ()
: register_organization_delegated_admin_request = { member_account_id; 
}

let make_query_statistics_for_describe_query 
  ?(creation_time : float option)
  ?(execution_time_in_millis : int option)
  ?(bytes_scanned : int option)
  ?(events_scanned : int option)
  ?(events_matched : int option)
  () : query_statistics_for_describe_query = {
  creation_time;
  execution_time_in_millis;
  bytes_scanned;
  events_scanned;
  events_matched;
   }

let make_query_statistics 
  ?(bytes_scanned : int option)
  ?(total_results_count : int option)
  ?(results_count : int option)
  () : query_statistics = {
  bytes_scanned; total_results_count; results_count;  }

let make_query 
  ?(creation_time : float option)
  ?(query_status : query_status option)
  ?(query_id : string option)
  () : query = { creation_time; query_status; query_id; 
}

let make_put_resource_policy_response 
  ?(resource_policy : string option) ?(resource_arn : string option) ()
: put_resource_policy_response = { resource_policy; resource_arn; 
}

let make_put_resource_policy_request 
  ~(resource_policy : string) ~(resource_arn : string) ()
: put_resource_policy_request = { resource_policy; resource_arn; 
}

let make_insight_selector  ?(insight_type : insight_type option) ()
: insight_selector = { insight_type; 
}

let make_put_insight_selectors_response 
  ?(insights_destination : string option)
  ?(event_data_store_arn : string option)
  ?(insight_selectors : insight_selector list option)
  ?(trail_ar_n : string option)
  () : put_insight_selectors_response = {
  insights_destination; event_data_store_arn; insight_selectors; trail_ar_n; 
}

let make_put_insight_selectors_request 
  ?(insights_destination : string option)
  ?(event_data_store : string option)
  ?(trail_name : string option)
  ~(insight_selectors : insight_selector list)
  () : put_insight_selectors_request = {
  insights_destination; event_data_store; insight_selectors; trail_name; 
}

let make_data_resource 
  ?(values : string list option) ?(type_ : string option) () : data_resource
= { values; type_;  }

let make_event_selector 
  ?(exclude_management_event_sources : string list option)
  ?(data_resources : data_resource list option)
  ?(include_management_events : bool option)
  ?(read_write_type : read_write_type option)
  () : event_selector = {
  exclude_management_event_sources;
  data_resources;
  include_management_events;
  read_write_type;
   }

let make_put_event_selectors_response 
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(event_selectors : event_selector list option)
  ?(trail_ar_n : string option)
  () : put_event_selectors_response = {
  advanced_event_selectors; event_selectors; trail_ar_n; 
}

let make_put_event_selectors_request 
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(event_selectors : event_selector list option)
  ~(trail_name : string)
  () : put_event_selectors_request = {
  advanced_event_selectors; event_selectors; trail_name; 
}

let make_public_key 
  ?(fingerprint : string option)
  ?(validity_end_time : float option)
  ?(validity_start_time : float option)
  ?(value : bytes option)
  () : public_key = {
  fingerprint; validity_end_time; validity_start_time; value; 
}

let make_partition_key  ~(type_ : string) ~(name : string) () : partition_key
= { type_; name;  }

let make_event 
  ?(cloud_trail_event : string option)
  ?(resources : resource list option)
  ?(username : string option)
  ?(event_source : string option)
  ?(event_time : float option)
  ?(access_key_id : string option)
  ?(read_only : string option)
  ?(event_name : string option)
  ?(event_id : string option)
  () : event = {
  cloud_trail_event;
  resources;
  username;
  event_source;
  event_time;
  access_key_id;
  read_only;
  event_name;
  event_id;
   }

let make_lookup_events_response 
  ?(next_token : string option) ?(events : event list option) ()
: lookup_events_response = { next_token; events;  }

let make_lookup_attribute 
  ~(attribute_value : string) ~(attribute_key : lookup_attribute_key) ()
: lookup_attribute = { attribute_value; attribute_key; 
}

let make_lookup_events_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(event_category : event_category option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(lookup_attributes : lookup_attribute list option)
  () : lookup_events_request = {
  next_token;
  max_results;
  event_category;
  end_time;
  start_time;
  lookup_attributes;
   }

let make_list_trails_response 
  ?(next_token : string option) ?(trails : trail_info list option) ()
: list_trails_response = { next_token; trails; 
}

let make_list_trails_request  ?(next_token : string option) ()
: list_trails_request = { next_token;  }

let make_list_tags_response 
  ?(next_token : string option)
  ?(resource_tag_list : resource_tag list option)
  () : list_tags_response = { next_token; resource_tag_list; 
}

let make_list_tags_request 
  ?(next_token : string option) ~(resource_id_list : string list) ()
: list_tags_request = { next_token; resource_id_list; 
}

let make_list_queries_response 
  ?(next_token : string option) ?(queries : query list option) ()
: list_queries_response = { next_token; queries; 
}

let make_list_queries_request 
  ?(query_status : query_status option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(max_results : int option)
  ?(next_token : string option)
  ~(event_data_store : string)
  () : list_queries_request = {
  query_status;
  end_time;
  start_time;
  max_results;
  next_token;
  event_data_store;
   }

let make_list_public_keys_response 
  ?(next_token : string option)
  ?(public_key_list : public_key list option)
  () : list_public_keys_response = { next_token; public_key_list; 
}

let make_list_public_keys_request 
  ?(next_token : string option)
  ?(end_time : float option)
  ?(start_time : float option)
  () : list_public_keys_request = { next_token; end_time; start_time; 
}

let make_list_insights_metric_data_response 
  ?(next_token : string option)
  ?(values : float list option)
  ?(timestamps : float list option)
  ?(error_code : string option)
  ?(insight_type : insight_type option)
  ?(event_name : string option)
  ?(event_source : string option)
  () : list_insights_metric_data_response = {
  next_token;
  values;
  timestamps;
  error_code;
  insight_type;
  event_name;
  event_source;
   }

let make_list_insights_metric_data_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(data_type : insights_metric_data_type option)
  ?(period : int option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(error_code : string option)
  ~(insight_type : insight_type)
  ~(event_name : string)
  ~(event_source : string)
  () : list_insights_metric_data_request = {
  next_token;
  max_results;
  data_type;
  period;
  end_time;
  start_time;
  error_code;
  insight_type;
  event_name;
  event_source;
   }

let make_imports_list_item 
  ?(updated_timestamp : float option)
  ?(created_timestamp : float option)
  ?(destinations : string list option)
  ?(import_status : import_status option)
  ?(import_id : string option)
  () : imports_list_item = {
  updated_timestamp;
  created_timestamp;
  destinations;
  import_status;
  import_id;
   }

let make_list_imports_response 
  ?(next_token : string option) ?(imports : imports_list_item list option) ()
: list_imports_response = { next_token; imports; 
}

let make_list_imports_request 
  ?(next_token : string option)
  ?(import_status : import_status option)
  ?(destination : string option)
  ?(max_results : int option)
  () : list_imports_request = {
  next_token; import_status; destination; max_results; 
}

let make_import_failure_list_item 
  ?(last_updated_time : float option)
  ?(error_message : string option)
  ?(error_type : string option)
  ?(status : import_failure_status option)
  ?(location : string option)
  () : import_failure_list_item = {
  last_updated_time; error_message; error_type; status; location; 
}

let make_list_import_failures_response 
  ?(next_token : string option)
  ?(failures : import_failure_list_item list option)
  () : list_import_failures_response = { next_token; failures; 
}

let make_list_import_failures_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(import_id : string)
  () : list_import_failures_request = { next_token; max_results; import_id; 
}

let make_event_data_store 
  ?(updated_timestamp : float option)
  ?(created_timestamp : float option)
  ?(retention_period : int option)
  ?(organization_enabled : bool option)
  ?(multi_region_enabled : bool option)
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(status : event_data_store_status option)
  ?(termination_protection_enabled : bool option)
  ?(name : string option)
  ?(event_data_store_arn : string option)
  () : event_data_store = {
  updated_timestamp;
  created_timestamp;
  retention_period;
  organization_enabled;
  multi_region_enabled;
  advanced_event_selectors;
  status;
  termination_protection_enabled;
  name;
  event_data_store_arn;
   }

let make_list_event_data_stores_response 
  ?(next_token : string option)
  ?(event_data_stores : event_data_store list option)
  () : list_event_data_stores_response = { next_token; event_data_stores; 
}

let make_list_event_data_stores_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_event_data_stores_request = { max_results; next_token; 
}

let make_channel  ?(name : string option) ?(channel_arn : string option) ()
: channel = { name; channel_arn;  }

let make_list_channels_response 
  ?(next_token : string option) ?(channels : channel list option) ()
: list_channels_response = { next_token; channels; 
}

let make_list_channels_request 
  ?(next_token : string option) ?(max_results : int option) ()
: list_channels_request = { next_token; max_results; 
}

let make_ingestion_status 
  ?(latest_ingestion_attempt_event_i_d : string option)
  ?(latest_ingestion_attempt_time : float option)
  ?(latest_ingestion_error_code : string option)
  ?(latest_ingestion_success_event_i_d : string option)
  ?(latest_ingestion_success_time : float option)
  () : ingestion_status = {
  latest_ingestion_attempt_event_i_d;
  latest_ingestion_attempt_time;
  latest_ingestion_error_code;
  latest_ingestion_success_event_i_d;
  latest_ingestion_success_time;
   }

let make_get_trail_status_response 
  ?(time_logging_stopped : string option)
  ?(time_logging_started : string option)
  ?(latest_delivery_attempt_succeeded : string option)
  ?(latest_notification_attempt_succeeded : string option)
  ?(latest_notification_attempt_time : string option)
  ?(latest_delivery_attempt_time : string option)
  ?(latest_digest_delivery_error : string option)
  ?(latest_digest_delivery_time : float option)
  ?(latest_cloud_watch_logs_delivery_time : float option)
  ?(latest_cloud_watch_logs_delivery_error : string option)
  ?(stop_logging_time : float option)
  ?(start_logging_time : float option)
  ?(latest_notification_time : float option)
  ?(latest_delivery_time : float option)
  ?(latest_notification_error : string option)
  ?(latest_delivery_error : string option)
  ?(is_logging : bool option)
  () : get_trail_status_response = {
  time_logging_stopped;
  time_logging_started;
  latest_delivery_attempt_succeeded;
  latest_notification_attempt_succeeded;
  latest_notification_attempt_time;
  latest_delivery_attempt_time;
  latest_digest_delivery_error;
  latest_digest_delivery_time;
  latest_cloud_watch_logs_delivery_time;
  latest_cloud_watch_logs_delivery_error;
  stop_logging_time;
  start_logging_time;
  latest_notification_time;
  latest_delivery_time;
  latest_notification_error;
  latest_delivery_error;
  is_logging;
   }

let make_get_trail_status_request  ~(name : string) ()
: get_trail_status_request = { name;  }

let make_get_trail_response  ?(trail : trail option) () : get_trail_response
= { trail;  }

let make_get_trail_request  ~(name : string) () : get_trail_request = {
  name;  }

let make_get_resource_policy_response 
  ?(resource_policy : string option) ?(resource_arn : string option) ()
: get_resource_policy_response = { resource_policy; resource_arn; 
}

let make_get_resource_policy_request  ~(resource_arn : string) ()
: get_resource_policy_request = { resource_arn; 
}

let make_get_query_results_response 
  ?(error_message : string option)
  ?(next_token : string option)
  ?(query_result_rows : (string * string) list list list option)
  ?(query_statistics : query_statistics option)
  ?(query_status : query_status option)
  () : get_query_results_response = {
  error_message;
  next_token;
  query_result_rows;
  query_statistics;
  query_status;
   }

let make_get_query_results_request 
  ?(max_query_results : int option)
  ?(next_token : string option)
  ?(event_data_store : string option)
  ~(query_id : string)
  () : get_query_results_request = {
  max_query_results; next_token; query_id; event_data_store; 
}

let make_get_insight_selectors_response 
  ?(insights_destination : string option)
  ?(event_data_store_arn : string option)
  ?(insight_selectors : insight_selector list option)
  ?(trail_ar_n : string option)
  () : get_insight_selectors_response = {
  insights_destination; event_data_store_arn; insight_selectors; trail_ar_n; 
}

let make_get_insight_selectors_request 
  ?(event_data_store : string option) ?(trail_name : string option) ()
: get_insight_selectors_request = { event_data_store; trail_name; 
}

let make_get_import_response 
  ?(import_statistics : import_statistics option)
  ?(updated_timestamp : float option)
  ?(created_timestamp : float option)
  ?(import_status : import_status option)
  ?(end_event_time : float option)
  ?(start_event_time : float option)
  ?(import_source : import_source option)
  ?(destinations : string list option)
  ?(import_id : string option)
  () : get_import_response = {
  import_statistics;
  updated_timestamp;
  created_timestamp;
  import_status;
  end_event_time;
  start_event_time;
  import_source;
  destinations;
  import_id;
   }

let make_get_import_request  ~(import_id : string) () : get_import_request =
{ import_id;  }

let make_get_event_selectors_response 
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(event_selectors : event_selector list option)
  ?(trail_ar_n : string option)
  () : get_event_selectors_response = {
  advanced_event_selectors; event_selectors; trail_ar_n; 
}

let make_get_event_selectors_request  ~(trail_name : string) ()
: get_event_selectors_request = { trail_name; 
}

let make_get_event_data_store_response 
  ?(partition_keys : partition_key list option)
  ?(federation_role_arn : string option)
  ?(federation_status : federation_status option)
  ?(billing_mode : billing_mode option)
  ?(kms_key_id : string option)
  ?(updated_timestamp : float option)
  ?(created_timestamp : float option)
  ?(termination_protection_enabled : bool option)
  ?(retention_period : int option)
  ?(organization_enabled : bool option)
  ?(multi_region_enabled : bool option)
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(status : event_data_store_status option)
  ?(name : string option)
  ?(event_data_store_arn : string option)
  () : get_event_data_store_response = {
  partition_keys;
  federation_role_arn;
  federation_status;
  billing_mode;
  kms_key_id;
  updated_timestamp;
  created_timestamp;
  termination_protection_enabled;
  retention_period;
  organization_enabled;
  multi_region_enabled;
  advanced_event_selectors;
  status;
  name;
  event_data_store_arn;
   }

let make_get_event_data_store_request  ~(event_data_store : string) ()
: get_event_data_store_request = { event_data_store; 
}

let make_get_channel_response 
  ?(ingestion_status : ingestion_status option)
  ?(destinations : destination list option)
  ?(source_config : source_config option)
  ?(source : string option)
  ?(name : string option)
  ?(channel_arn : string option)
  () : get_channel_response = {
  ingestion_status; destinations; source_config; source; name; channel_arn; 
}

let make_get_channel_request  ~(channel : string) () : get_channel_request =
{ channel;  }

let make_enable_federation_response 
  ?(federation_role_arn : string option)
  ?(federation_status : federation_status option)
  ?(event_data_store_arn : string option)
  () : enable_federation_response = {
  federation_role_arn; federation_status; event_data_store_arn; 
}

let make_enable_federation_request 
  ~(federation_role_arn : string) ~(event_data_store : string) ()
: enable_federation_request = { federation_role_arn; event_data_store; 
}

let make_disable_federation_response 
  ?(federation_status : federation_status option)
  ?(event_data_store_arn : string option)
  () : disable_federation_response = {
  federation_status; event_data_store_arn; 
}

let make_disable_federation_request  ~(event_data_store : string) ()
: disable_federation_request = { event_data_store; 
}

let make_describe_trails_response  ?(trail_list : trail list option) ()
: describe_trails_response = { trail_list; 
}

let make_describe_trails_request 
  ?(include_shadow_trails : bool option)
  ?(trail_name_list : string list option)
  () : describe_trails_request = { include_shadow_trails; trail_name_list; 
}

let make_describe_query_response 
  ?(delivery_status : delivery_status option)
  ?(delivery_s3_uri : string option)
  ?(error_message : string option)
  ?(query_statistics : query_statistics_for_describe_query option)
  ?(query_status : query_status option)
  ?(query_string : string option)
  ?(query_id : string option)
  () : describe_query_response = {
  delivery_status;
  delivery_s3_uri;
  error_message;
  query_statistics;
  query_status;
  query_string;
  query_id;
   }

let make_describe_query_request 
  ?(query_alias : string option)
  ?(query_id : string option)
  ?(event_data_store : string option)
  () : describe_query_request = { query_alias; query_id; event_data_store; 
}

let make_deregister_organization_delegated_admin_response  ()
: deregister_organization_delegated_admin_response =
()

let make_deregister_organization_delegated_admin_request 
  ~(delegated_admin_account_id : string) ()
: deregister_organization_delegated_admin_request = {
  delegated_admin_account_id;  }

let make_delete_trail_response  () : delete_trail_response =
()

let make_delete_trail_request  ~(name : string) () : delete_trail_request = {
  name;  }

let make_delete_resource_policy_response  ()
: delete_resource_policy_response =
()

let make_delete_resource_policy_request  ~(resource_arn : string) ()
: delete_resource_policy_request = { resource_arn; 
}

let make_delete_event_data_store_response  ()
: delete_event_data_store_response =
()

let make_delete_event_data_store_request  ~(event_data_store : string) ()
: delete_event_data_store_request = { event_data_store; 
}

let make_delete_channel_response  () : delete_channel_response =
()

let make_delete_channel_request  ~(channel : string) ()
: delete_channel_request = { channel;  }

let make_create_trail_response 
  ?(is_organization_trail : bool option)
  ?(kms_key_id : string option)
  ?(cloud_watch_logs_role_arn : string option)
  ?(cloud_watch_logs_log_group_arn : string option)
  ?(log_file_validation_enabled : bool option)
  ?(trail_ar_n : string option)
  ?(is_multi_region_trail : bool option)
  ?(include_global_service_events : bool option)
  ?(sns_topic_ar_n : string option)
  ?(sns_topic_name : string option)
  ?(s3_key_prefix : string option)
  ?(s3_bucket_name : string option)
  ?(name : string option)
  () : create_trail_response = {
  is_organization_trail;
  kms_key_id;
  cloud_watch_logs_role_arn;
  cloud_watch_logs_log_group_arn;
  log_file_validation_enabled;
  trail_ar_n;
  is_multi_region_trail;
  include_global_service_events;
  sns_topic_ar_n;
  sns_topic_name;
  s3_key_prefix;
  s3_bucket_name;
  name;
   }

let make_create_trail_request 
  ?(tags_list : tag list option)
  ?(is_organization_trail : bool option)
  ?(kms_key_id : string option)
  ?(cloud_watch_logs_role_arn : string option)
  ?(cloud_watch_logs_log_group_arn : string option)
  ?(enable_log_file_validation : bool option)
  ?(is_multi_region_trail : bool option)
  ?(include_global_service_events : bool option)
  ?(sns_topic_name : string option)
  ?(s3_key_prefix : string option)
  ~(s3_bucket_name : string)
  ~(name : string)
  () : create_trail_request = {
  tags_list;
  is_organization_trail;
  kms_key_id;
  cloud_watch_logs_role_arn;
  cloud_watch_logs_log_group_arn;
  enable_log_file_validation;
  is_multi_region_trail;
  include_global_service_events;
  sns_topic_name;
  s3_key_prefix;
  s3_bucket_name;
  name;
   }

let make_create_event_data_store_response 
  ?(billing_mode : billing_mode option)
  ?(kms_key_id : string option)
  ?(updated_timestamp : float option)
  ?(created_timestamp : float option)
  ?(tags_list : tag list option)
  ?(termination_protection_enabled : bool option)
  ?(retention_period : int option)
  ?(organization_enabled : bool option)
  ?(multi_region_enabled : bool option)
  ?(advanced_event_selectors : advanced_event_selector list option)
  ?(status : event_data_store_status option)
  ?(name : string option)
  ?(event_data_store_arn : string option)
  () : create_event_data_store_response = {
  billing_mode;
  kms_key_id;
  updated_timestamp;
  created_timestamp;
  tags_list;
  termination_protection_enabled;
  retention_period;
  organization_enabled;
  multi_region_enabled;
  advanced_event_selectors;
  status;
  name;
  event_data_store_arn;
   }

let make_create_event_data_store_request 
  ?(billing_mode : billing_mode option)
  ?(start_ingestion : bool option)
  ?(kms_key_id : string option)
  ?(tags_list : tag list option)
  ?(termination_protection_enabled : bool option)
  ?(retention_period : int option)
  ?(organization_enabled : bool option)
  ?(multi_region_enabled : bool option)
  ?(advanced_event_selectors : advanced_event_selector list option)
  ~(name : string)
  () : create_event_data_store_request = {
  billing_mode;
  start_ingestion;
  kms_key_id;
  tags_list;
  termination_protection_enabled;
  retention_period;
  organization_enabled;
  multi_region_enabled;
  advanced_event_selectors;
  name;
   }

let make_create_channel_response 
  ?(tags : tag list option)
  ?(destinations : destination list option)
  ?(source : string option)
  ?(name : string option)
  ?(channel_arn : string option)
  () : create_channel_response = {
  tags; destinations; source; name; channel_arn; 
}

let make_create_channel_request 
  ?(tags : tag list option)
  ~(destinations : destination list)
  ~(source : string)
  ~(name : string)
  () : create_channel_request = { tags; destinations; source; name; 
}

let make_cancel_query_response 
  ~(query_status : query_status) ~(query_id : string) ()
: cancel_query_response = { query_status; query_id; 
}

let make_cancel_query_request 
  ?(event_data_store : string option) ~(query_id : string) ()
: cancel_query_request = { query_id; event_data_store; 
}

let make_add_tags_response  () : add_tags_response =
()

let make_add_tags_request  ~(tags_list : tag list) ~(resource_id : string) ()
: add_tags_request = { tags_list; resource_id; 
}

