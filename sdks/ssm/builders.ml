[@@@warning "-39"]
open Types
let make_update_service_setting_request 
  ~(setting_value : string) ~(setting_id : string) ()
: update_service_setting_request = { setting_value; setting_id; 
}

let make_resource_data_sync_organizational_unit 
  ?(organizational_unit_id : string option) ()
: resource_data_sync_organizational_unit = { organizational_unit_id; 
}

let make_resource_data_sync_aws_organizations_source 
  ?(organizational_units : resource_data_sync_organizational_unit list option)
  ~(organization_source_type : string)
  () : resource_data_sync_aws_organizations_source = {
  organizational_units; organization_source_type; 
}

let make_resource_data_sync_source 
  ?(enable_all_ops_data_sources : bool option)
  ?(include_future_regions : bool option)
  ?(aws_organizations_source : resource_data_sync_aws_organizations_source option)
  ~(source_regions : string list)
  ~(source_type : string)
  () : resource_data_sync_source = {
  enable_all_ops_data_sources;
  include_future_regions;
  source_regions;
  aws_organizations_source;
  source_type;
   }

let make_update_resource_data_sync_request 
  ~(sync_source : resource_data_sync_source)
  ~(sync_type : string)
  ~(sync_name : string)
  () : update_resource_data_sync_request = {
  sync_source; sync_type; sync_name;  }

let make_patch_filter  ~(values : string list) ~(key : patch_filter_key) ()
: patch_filter = { values; key;  }

let make_patch_filter_group  ~(patch_filters : patch_filter list) ()
: patch_filter_group = { patch_filters;  }

let make_patch_rule 
  ?(enable_non_security : bool option)
  ?(approve_until_date : string option)
  ?(approve_after_days : int option)
  ?(compliance_level : patch_compliance_level option)
  ~(patch_filter_group : patch_filter_group)
  () : patch_rule = {
  enable_non_security;
  approve_until_date;
  approve_after_days;
  compliance_level;
  patch_filter_group;
   }

let make_patch_rule_group  ~(patch_rules : patch_rule list) ()
: patch_rule_group = { patch_rules;  }

let make_patch_source 
  ~(configuration : string) ~(products : string list) ~(name : string) ()
: patch_source = { configuration; products; name; 
}

let make_update_patch_baseline_request 
  ?(replace : bool option)
  ?(sources : patch_source list option)
  ?(description : string option)
  ?(rejected_patches_action : patch_action option)
  ?(rejected_patches : string list option)
  ?(approved_patches_enable_non_security : bool option)
  ?(approved_patches_compliance_level : patch_compliance_level option)
  ?(approved_patches : string list option)
  ?(approval_rules : patch_rule_group option)
  ?(global_filters : patch_filter_group option)
  ?(name : string option)
  ~(baseline_id : string)
  () : update_patch_baseline_request = {
  replace;
  sources;
  description;
  rejected_patches_action;
  rejected_patches;
  approved_patches_enable_non_security;
  approved_patches_compliance_level;
  approved_patches;
  approval_rules;
  global_filters;
  name;
  baseline_id;
   }

let make_metadata_value  ?(value : string option) () : metadata_value = {
  value;  }

let make_update_ops_metadata_request 
  ?(keys_to_delete : string list option)
  ?(metadata_to_update : (string * metadata_value) list option)
  ~(ops_metadata_arn : string)
  () : update_ops_metadata_request = {
  keys_to_delete; metadata_to_update; ops_metadata_arn; 
}

let make_update_ops_item_response  () : update_ops_item_response =
()

let make_ops_item_data_value 
  ?(type_ : ops_item_data_type option) ?(value : string option) ()
: ops_item_data_value = { type_; value;  }

let make_ops_item_notification  ?(arn : string option) ()
: ops_item_notification = { arn;  }

let make_related_ops_item  ~(ops_item_id : string) () : related_ops_item = {
  ops_item_id;  }

let make_update_ops_item_request 
  ?(ops_item_arn : string option)
  ?(planned_end_time : float option)
  ?(planned_start_time : float option)
  ?(actual_end_time : float option)
  ?(actual_start_time : float option)
  ?(severity : string option)
  ?(category : string option)
  ?(title : string option)
  ?(status : ops_item_status option)
  ?(related_ops_items : related_ops_item list option)
  ?(priority : int option)
  ?(notifications : ops_item_notification list option)
  ?(operational_data_to_delete : string list option)
  ?(operational_data : (string * ops_item_data_value) list option)
  ?(description : string option)
  ~(ops_item_id : string)
  () : update_ops_item_request = {
  ops_item_arn;
  planned_end_time;
  planned_start_time;
  actual_end_time;
  actual_start_time;
  severity;
  category;
  title;
  ops_item_id;
  status;
  related_ops_items;
  priority;
  notifications;
  operational_data_to_delete;
  operational_data;
  description;
   }

let make_update_managed_instance_role_request 
  ~(iam_role : string) ~(instance_id : string) ()
: update_managed_instance_role_request = { iam_role; instance_id; 
}

let make_target  ?(values : string list option) ?(key : string option) ()
: target = { values; key; 
}

let make_maintenance_window_task_parameter_value_expression 
  ?(values : string list option) ()
: maintenance_window_task_parameter_value_expression = { values; 
}

let make_cloud_watch_output_config 
  ?(cloud_watch_output_enabled : bool option)
  ?(cloud_watch_log_group_name : string option)
  () : cloud_watch_output_config = {
  cloud_watch_output_enabled; cloud_watch_log_group_name; 
}

let make_notification_config 
  ?(notification_type : notification_type option)
  ?(notification_events : notification_event list option)
  ?(notification_arn : string option)
  () : notification_config = {
  notification_type; notification_events; notification_arn; 
}

let make_maintenance_window_run_command_parameters 
  ?(timeout_seconds : int option)
  ?(service_role_arn : string option)
  ?(parameters : (string * string list) list option)
  ?(output_s3_key_prefix : string option)
  ?(output_s3_bucket_name : string option)
  ?(notification_config : notification_config option)
  ?(document_version : string option)
  ?(document_hash_type : document_hash_type option)
  ?(document_hash : string option)
  ?(cloud_watch_output_config : cloud_watch_output_config option)
  ?(comment : string option)
  () : maintenance_window_run_command_parameters = {
  timeout_seconds;
  service_role_arn;
  parameters;
  output_s3_key_prefix;
  output_s3_bucket_name;
  notification_config;
  document_version;
  document_hash_type;
  document_hash;
  cloud_watch_output_config;
  comment;
   }

let make_maintenance_window_automation_parameters 
  ?(parameters : (string * string list) list option)
  ?(document_version : string option)
  () : maintenance_window_automation_parameters = {
  parameters; document_version; 
}

let make_maintenance_window_step_functions_parameters 
  ?(name : string option) ?(input : string option) ()
: maintenance_window_step_functions_parameters = { name; input; 
}

let make_maintenance_window_lambda_parameters 
  ?(payload : bytes option)
  ?(qualifier : string option)
  ?(client_context : string option)
  () : maintenance_window_lambda_parameters = {
  payload; qualifier; client_context; 
}

let make_maintenance_window_task_invocation_parameters 
  ?(lambda : maintenance_window_lambda_parameters option)
  ?(step_functions : maintenance_window_step_functions_parameters option)
  ?(automation : maintenance_window_automation_parameters option)
  ?(run_command : maintenance_window_run_command_parameters option)
  () : maintenance_window_task_invocation_parameters = {
  lambda; step_functions; automation; run_command;  }

let make_logging_info 
  ?(s3_key_prefix : string option)
  ~(s3_region : string)
  ~(s3_bucket_name : string)
  () : logging_info = { s3_region; s3_key_prefix; s3_bucket_name; 
}

let make_alarm  ~(name : string) () : alarm = { name; 
}

let make_alarm_configuration 
  ?(ignore_poll_alarm_failure : bool option) ~(alarms : alarm list) ()
: alarm_configuration = { alarms; ignore_poll_alarm_failure; 
}

let make_update_maintenance_window_task_request 
  ?(alarm_configuration : alarm_configuration option)
  ?(cutoff_behavior : maintenance_window_task_cutoff_behavior option)
  ?(replace : bool option)
  ?(description : string option)
  ?(name : string option)
  ?(logging_info : logging_info option)
  ?(max_errors : string option)
  ?(max_concurrency : string option)
  ?(priority : int option)
  ?(task_invocation_parameters : maintenance_window_task_invocation_parameters option)
  ?(task_parameters : (string * maintenance_window_task_parameter_value_expression) list option)
  ?(service_role_arn : string option)
  ?(task_arn : string option)
  ?(targets : target list option)
  ~(window_task_id : string)
  ~(window_id : string)
  () : update_maintenance_window_task_request = {
  alarm_configuration;
  cutoff_behavior;
  replace;
  description;
  name;
  logging_info;
  max_errors;
  max_concurrency;
  priority;
  task_invocation_parameters;
  task_parameters;
  service_role_arn;
  task_arn;
  targets;
  window_task_id;
  window_id;
   }

let make_update_maintenance_window_target_request 
  ?(replace : bool option)
  ?(description : string option)
  ?(name : string option)
  ?(owner_information : string option)
  ?(targets : target list option)
  ~(window_target_id : string)
  ~(window_id : string)
  () : update_maintenance_window_target_request = {
  replace;
  description;
  name;
  owner_information;
  targets;
  window_target_id;
  window_id;
   }

let make_update_maintenance_window_request 
  ?(replace : bool option)
  ?(enabled : bool option)
  ?(allow_unassociated_targets : bool option)
  ?(cutoff : int option)
  ?(duration : int option)
  ?(schedule_offset : int option)
  ?(schedule_timezone : string option)
  ?(schedule : string option)
  ?(end_date : string option)
  ?(start_date : string option)
  ?(description : string option)
  ?(name : string option)
  ~(window_id : string)
  () : update_maintenance_window_request = {
  replace;
  enabled;
  allow_unassociated_targets;
  cutoff;
  duration;
  schedule_offset;
  schedule_timezone;
  schedule;
  end_date;
  start_date;
  description;
  name;
  window_id;
   }

let make_document_parameter 
  ?(default_value : string option)
  ?(description : string option)
  ?(type_ : document_parameter_type option)
  ?(name : string option)
  () : document_parameter = { default_value; description; type_; name; 
}

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_attachment_information  ?(name : string option) ()
: attachment_information = { name;  }

let make_document_requires 
  ?(version_name : string option)
  ?(require_type : string option)
  ?(version : string option)
  ~(name : string)
  () : document_requires = { version_name; require_type; version; name; 
}

let make_review_information 
  ?(reviewer : string option)
  ?(status : review_status option)
  ?(reviewed_time : float option)
  () : review_information = { reviewer; status; reviewed_time; 
}

let make_document_description 
  ?(category_enum : string list option)
  ?(category : string list option)
  ?(review_status : review_status option)
  ?(pending_review_version : string option)
  ?(approved_version : string option)
  ?(review_information : review_information list option)
  ?(author : string option)
  ?(requires : document_requires list option)
  ?(attachments_information : attachment_information list option)
  ?(tags : tag list option)
  ?(target_type : string option)
  ?(document_format : document_format option)
  ?(default_version : string option)
  ?(latest_version : string option)
  ?(schema_version : string option)
  ?(document_type : document_type option)
  ?(platform_types : platform_type list option)
  ?(parameters : document_parameter list option)
  ?(description : string option)
  ?(document_version : string option)
  ?(status_information : string option)
  ?(status : document_status option)
  ?(created_date : float option)
  ?(owner : string option)
  ?(version_name : string option)
  ?(display_name : string option)
  ?(name : string option)
  ?(hash_type : document_hash_type option)
  ?(hash : string option)
  ?(sha1 : string option)
  () : document_description = {
  category_enum;
  category;
  review_status;
  pending_review_version;
  approved_version;
  review_information;
  author;
  requires;
  attachments_information;
  tags;
  target_type;
  document_format;
  default_version;
  latest_version;
  schema_version;
  document_type;
  platform_types;
  parameters;
  description;
  document_version;
  status_information;
  status;
  created_date;
  owner;
  version_name;
  display_name;
  name;
  hash_type;
  hash;
  sha1;
   }

let make_attachments_source 
  ?(name : string option)
  ?(values : string list option)
  ?(key : attachments_source_key option)
  () : attachments_source = { name; values; key; 
}

let make_update_document_request 
  ?(target_type : string option)
  ?(document_format : document_format option)
  ?(document_version : string option)
  ?(version_name : string option)
  ?(display_name : string option)
  ?(attachments : attachments_source list option)
  ~(name : string)
  ~(content : string)
  () : update_document_request = {
  target_type;
  document_format;
  document_version;
  version_name;
  display_name;
  name;
  attachments;
  content;
   }

let make_update_document_metadata_response  ()
: update_document_metadata_response =
()

let make_document_review_comment_source 
  ?(content : string option)
  ?(type_ : document_review_comment_type option)
  () : document_review_comment_source = { content; type_; 
}

let make_document_reviews 
  ?(comment : document_review_comment_source list option)
  ~(action : document_review_action)
  () : document_reviews = { comment; action; 
}

let make_update_document_metadata_request 
  ?(document_version : string option)
  ~(document_reviews : document_reviews)
  ~(name : string)
  () : update_document_metadata_request = {
  document_reviews; document_version; name; 
}

let make_document_default_version_description 
  ?(default_version_name : string option)
  ?(default_version : string option)
  ?(name : string option)
  () : document_default_version_description = {
  default_version_name; default_version; name; 
}

let make_update_document_default_version_request 
  ~(document_version : string) ~(name : string) ()
: update_document_default_version_request = { document_version; name; 
}

let make_association_status 
  ?(additional_info : string option)
  ~(message : string)
  ~(name : association_status_name)
  ~(date : float)
  () : association_status = { additional_info; message; name; date; 
}

let make_association_overview 
  ?(association_status_aggregated_count : (string * int) list option)
  ?(detailed_status : string option)
  ?(status : string option)
  () : association_overview = {
  association_status_aggregated_count; detailed_status; status; 
}

let make_s3_output_location 
  ?(output_s3_key_prefix : string option)
  ?(output_s3_bucket_name : string option)
  ?(output_s3_region : string option)
  () : s3_output_location = {
  output_s3_key_prefix; output_s3_bucket_name; output_s3_region; 
}

let make_instance_association_output_location 
  ?(s3_location : s3_output_location option) ()
: instance_association_output_location = { s3_location; 
}

let make_target_location 
  ?(target_location_alarm_configuration : alarm_configuration option)
  ?(execution_role_name : string option)
  ?(target_location_max_errors : string option)
  ?(target_location_max_concurrency : string option)
  ?(regions : string list option)
  ?(accounts : string list option)
  () : target_location = {
  target_location_alarm_configuration;
  execution_role_name;
  target_location_max_errors;
  target_location_max_concurrency;
  regions;
  accounts;
   }

let make_alarm_state_information 
  ~(state : external_alarm_state) ~(name : string) ()
: alarm_state_information = { state; name; 
}

let make_association_description 
  ?(triggered_alarms : alarm_state_information list option)
  ?(alarm_configuration : alarm_configuration option)
  ?(target_maps : (string * string list) list list option)
  ?(duration : int option)
  ?(schedule_offset : int option)
  ?(target_locations : target_location list option)
  ?(calendar_names : string list option)
  ?(apply_only_at_cron_interval : bool option)
  ?(sync_compliance : association_sync_compliance option)
  ?(compliance_severity : association_compliance_severity option)
  ?(max_concurrency : string option)
  ?(max_errors : string option)
  ?(association_name : string option)
  ?(last_successful_execution_date : float option)
  ?(last_execution_date : float option)
  ?(output_location : instance_association_output_location option)
  ?(schedule_expression : string option)
  ?(targets : target list option)
  ?(association_id : string option)
  ?(parameters : (string * string list) list option)
  ?(automation_target_parameter_name : string option)
  ?(document_version : string option)
  ?(overview : association_overview option)
  ?(status : association_status option)
  ?(last_update_association_date : float option)
  ?(date : float option)
  ?(association_version : string option)
  ?(instance_id : string option)
  ?(name : string option)
  () : association_description = {
  triggered_alarms;
  alarm_configuration;
  target_maps;
  duration;
  schedule_offset;
  target_locations;
  calendar_names;
  apply_only_at_cron_interval;
  sync_compliance;
  compliance_severity;
  max_concurrency;
  max_errors;
  association_name;
  last_successful_execution_date;
  last_execution_date;
  output_location;
  schedule_expression;
  targets;
  association_id;
  parameters;
  automation_target_parameter_name;
  document_version;
  overview;
  status;
  last_update_association_date;
  date;
  association_version;
  instance_id;
  name;
   }

let make_update_association_status_request 
  ~(association_status : association_status)
  ~(instance_id : string)
  ~(name : string)
  () : update_association_status_request = {
  association_status; instance_id; name; 
}

let make_update_association_request 
  ?(alarm_configuration : alarm_configuration option)
  ?(target_maps : (string * string list) list list option)
  ?(duration : int option)
  ?(schedule_offset : int option)
  ?(target_locations : target_location list option)
  ?(calendar_names : string list option)
  ?(apply_only_at_cron_interval : bool option)
  ?(sync_compliance : association_sync_compliance option)
  ?(compliance_severity : association_compliance_severity option)
  ?(max_concurrency : string option)
  ?(max_errors : string option)
  ?(automation_target_parameter_name : string option)
  ?(association_version : string option)
  ?(association_name : string option)
  ?(targets : target list option)
  ?(name : string option)
  ?(output_location : instance_association_output_location option)
  ?(schedule_expression : string option)
  ?(document_version : string option)
  ?(parameters : (string * string list) list option)
  ~(association_id : string)
  () : update_association_request = {
  alarm_configuration;
  target_maps;
  duration;
  schedule_offset;
  target_locations;
  calendar_names;
  apply_only_at_cron_interval;
  sync_compliance;
  compliance_severity;
  max_concurrency;
  max_errors;
  automation_target_parameter_name;
  association_version;
  association_name;
  targets;
  name;
  output_location;
  schedule_expression;
  document_version;
  parameters;
  association_id;
   }

let make_unlabel_parameter_version_request 
  ~(labels : string list) ~(parameter_version : int) ~(name : string) ()
: unlabel_parameter_version_request = { labels; parameter_version; name; 
}

let make_terminate_session_response  ?(session_id : string option) ()
: terminate_session_response = { session_id; 
}

let make_terminate_session_request  ~(session_id : string) ()
: terminate_session_request = { session_id; 
}

let make_stop_automation_execution_request 
  ?(type_ : stop_type option) ~(automation_execution_id : string) ()
: stop_automation_execution_request = { type_; automation_execution_id; 
}

let make_failure_details 
  ?(details : (string * string list) list option)
  ?(failure_type : string option)
  ?(failure_stage : string option)
  () : failure_details = { details; failure_type; failure_stage; 
}

let make_parent_step_details 
  ?(iterator_value : string option)
  ?(iteration : int option)
  ?(action : string option)
  ?(step_name : string option)
  ?(step_execution_id : string option)
  () : parent_step_details = {
  iterator_value; iteration; action; step_name; step_execution_id; 
}

let make_step_execution 
  ?(parent_step_details : parent_step_details option)
  ?(triggered_alarms : alarm_state_information list option)
  ?(target_location : target_location option)
  ?(targets : target list option)
  ?(valid_next_steps : string list option)
  ?(is_critical : bool option)
  ?(next_step : string option)
  ?(is_end : bool option)
  ?(overridden_parameters : (string * string list) list option)
  ?(step_execution_id : string option)
  ?(failure_details : failure_details option)
  ?(failure_message : string option)
  ?(response : string option)
  ?(outputs : (string * string list) list option)
  ?(inputs : (string * string) list option)
  ?(response_code : string option)
  ?(step_status : automation_execution_status option)
  ?(execution_end_time : float option)
  ?(execution_start_time : float option)
  ?(max_attempts : int option)
  ?(on_failure : string option)
  ?(timeout_seconds : int option)
  ?(action : string option)
  ?(step_name : string option)
  () : step_execution = {
  parent_step_details;
  triggered_alarms;
  target_location;
  targets;
  valid_next_steps;
  is_critical;
  next_step;
  is_end;
  overridden_parameters;
  step_execution_id;
  failure_details;
  failure_message;
  response;
  outputs;
  inputs;
  response_code;
  step_status;
  execution_end_time;
  execution_start_time;
  max_attempts;
  on_failure;
  timeout_seconds;
  action;
  step_name;
   }

let make_step_execution_filter 
  ~(values : string list) ~(key : step_execution_filter_key) ()
: step_execution_filter = { values; key;  }

let make_start_session_response 
  ?(stream_url : string option)
  ?(token_value : string option)
  ?(session_id : string option)
  () : start_session_response = { stream_url; token_value; session_id; 
}

let make_start_session_request 
  ?(parameters : (string * string list) list option)
  ?(reason : string option)
  ?(document_name : string option)
  ~(target : string)
  () : start_session_request = { parameters; reason; document_name; target; 
}

let make_runbook 
  ?(target_locations : target_location list option)
  ?(max_errors : string option)
  ?(max_concurrency : string option)
  ?(target_maps : (string * string list) list list option)
  ?(targets : target list option)
  ?(target_parameter_name : string option)
  ?(parameters : (string * string list) list option)
  ?(document_version : string option)
  ~(document_name : string)
  () : runbook = {
  target_locations;
  max_errors;
  max_concurrency;
  target_maps;
  targets;
  target_parameter_name;
  parameters;
  document_version;
  document_name;
   }

let make_start_change_request_execution_request 
  ?(change_details : string option)
  ?(scheduled_end_time : float option)
  ?(tags : tag list option)
  ?(auto_approve : bool option)
  ?(client_token : string option)
  ?(change_request_name : string option)
  ?(parameters : (string * string list) list option)
  ?(document_version : string option)
  ?(scheduled_time : float option)
  ~(runbooks : runbook list)
  ~(document_name : string)
  () : start_change_request_execution_request = {
  change_details;
  scheduled_end_time;
  tags;
  runbooks;
  auto_approve;
  client_token;
  change_request_name;
  parameters;
  document_version;
  document_name;
  scheduled_time;
   }

let make_start_automation_execution_request 
  ?(alarm_configuration : alarm_configuration option)
  ?(tags : tag list option)
  ?(target_locations : target_location list option)
  ?(max_errors : string option)
  ?(max_concurrency : string option)
  ?(target_maps : (string * string list) list list option)
  ?(targets : target list option)
  ?(target_parameter_name : string option)
  ?(mode : execution_mode option)
  ?(client_token : string option)
  ?(parameters : (string * string list) list option)
  ?(document_version : string option)
  ~(document_name : string)
  () : start_automation_execution_request = {
  alarm_configuration;
  tags;
  target_locations;
  max_errors;
  max_concurrency;
  target_maps;
  targets;
  target_parameter_name;
  mode;
  client_token;
  parameters;
  document_version;
  document_name;
   }

let make_start_associations_once_request  ~(association_ids : string list) ()
: start_associations_once_request = { association_ids; 
}

let make_severity_summary 
  ?(unspecified_count : int option)
  ?(informational_count : int option)
  ?(low_count : int option)
  ?(medium_count : int option)
  ?(high_count : int option)
  ?(critical_count : int option)
  () : severity_summary = {
  unspecified_count;
  informational_count;
  low_count;
  medium_count;
  high_count;
  critical_count;
   }

let make_session_manager_output_url 
  ?(cloud_watch_output_url : string option)
  ?(s3_output_url : string option)
  () : session_manager_output_url = { cloud_watch_output_url; s3_output_url; 
}

let make_session 
  ?(max_session_duration : string option)
  ?(output_url : session_manager_output_url option)
  ?(details : string option)
  ?(reason : string option)
  ?(owner : string option)
  ?(document_name : string option)
  ?(end_date : float option)
  ?(start_date : float option)
  ?(status : session_status option)
  ?(target : string option)
  ?(session_id : string option)
  () : session = {
  max_session_duration;
  output_url;
  details;
  reason;
  owner;
  document_name;
  end_date;
  start_date;
  status;
  target;
  session_id;
   }

let make_session_filter  ~(value : string) ~(key : session_filter_key) ()
: session_filter = { value; key;  }

let make_service_setting 
  ?(status : string option)
  ?(ar_n : string option)
  ?(last_modified_user : string option)
  ?(last_modified_date : float option)
  ?(setting_value : string option)
  ?(setting_id : string option)
  () : service_setting = {
  status;
  ar_n;
  last_modified_user;
  last_modified_date;
  setting_value;
  setting_id;
   }

let make_command 
  ?(triggered_alarms : alarm_state_information list option)
  ?(alarm_configuration : alarm_configuration option)
  ?(timeout_seconds : int option)
  ?(cloud_watch_output_config : cloud_watch_output_config option)
  ?(notification_config : notification_config option)
  ?(service_role : string option)
  ?(delivery_timed_out_count : int option)
  ?(error_count : int option)
  ?(completed_count : int option)
  ?(target_count : int option)
  ?(max_errors : string option)
  ?(max_concurrency : string option)
  ?(output_s3_key_prefix : string option)
  ?(output_s3_bucket_name : string option)
  ?(output_s3_region : string option)
  ?(status_details : string option)
  ?(status : command_status option)
  ?(requested_date_time : float option)
  ?(targets : target list option)
  ?(instance_ids : string list option)
  ?(parameters : (string * string list) list option)
  ?(expires_after : float option)
  ?(comment : string option)
  ?(document_version : string option)
  ?(document_name : string option)
  ?(command_id : string option)
  () : command = {
  triggered_alarms;
  alarm_configuration;
  timeout_seconds;
  cloud_watch_output_config;
  notification_config;
  service_role;
  delivery_timed_out_count;
  error_count;
  completed_count;
  target_count;
  max_errors;
  max_concurrency;
  output_s3_key_prefix;
  output_s3_bucket_name;
  output_s3_region;
  status_details;
  status;
  requested_date_time;
  targets;
  instance_ids;
  parameters;
  expires_after;
  comment;
  document_version;
  document_name;
  command_id;
   }

let make_send_command_request 
  ?(alarm_configuration : alarm_configuration option)
  ?(cloud_watch_output_config : cloud_watch_output_config option)
  ?(notification_config : notification_config option)
  ?(service_role_arn : string option)
  ?(max_errors : string option)
  ?(max_concurrency : string option)
  ?(output_s3_key_prefix : string option)
  ?(output_s3_bucket_name : string option)
  ?(output_s3_region : string option)
  ?(parameters : (string * string list) list option)
  ?(comment : string option)
  ?(timeout_seconds : int option)
  ?(document_hash_type : document_hash_type option)
  ?(document_hash : string option)
  ?(document_version : string option)
  ?(targets : target list option)
  ?(instance_ids : string list option)
  ~(document_name : string)
  () : send_command_request = {
  alarm_configuration;
  cloud_watch_output_config;
  notification_config;
  service_role_arn;
  max_errors;
  max_concurrency;
  output_s3_key_prefix;
  output_s3_bucket_name;
  output_s3_region;
  parameters;
  comment;
  timeout_seconds;
  document_hash_type;
  document_hash;
  document_version;
  document_name;
  targets;
  instance_ids;
   }

let make_send_automation_signal_request 
  ?(payload : (string * string list) list option)
  ~(signal_type : signal_type)
  ~(automation_execution_id : string)
  () : send_automation_signal_request = {
  payload; signal_type; automation_execution_id; 
}

let make_scheduled_window_execution 
  ?(execution_time : string option)
  ?(name : string option)
  ?(window_id : string option)
  () : scheduled_window_execution = { execution_time; name; window_id; 
}

let make_s3_output_url  ?(output_url : string option) () : s3_output_url = {
  output_url;  }

let make_resume_session_response 
  ?(stream_url : string option)
  ?(token_value : string option)
  ?(session_id : string option)
  () : resume_session_response = { stream_url; token_value; session_id; 
}

let make_resume_session_request  ~(session_id : string) ()
: resume_session_request = { session_id;  }

let make_result_attribute  ~(type_name : string) () : result_attribute = {
  type_name;  }

let make_resource_data_sync_source_with_state 
  ?(enable_all_ops_data_sources : bool option)
  ?(state : string option)
  ?(include_future_regions : bool option)
  ?(source_regions : string list option)
  ?(aws_organizations_source : resource_data_sync_aws_organizations_source option)
  ?(source_type : string option)
  () : resource_data_sync_source_with_state = {
  enable_all_ops_data_sources;
  state;
  include_future_regions;
  source_regions;
  aws_organizations_source;
  source_type;
   }

let make_resource_data_sync_destination_data_sharing 
  ?(destination_data_sharing_type : string option) ()
: resource_data_sync_destination_data_sharing = {
  destination_data_sharing_type; 
}

let make_resource_data_sync_s3_destination 
  ?(destination_data_sharing : resource_data_sync_destination_data_sharing option)
  ?(awskms_key_ar_n : string option)
  ?(prefix : string option)
  ~(region : string)
  ~(sync_format : resource_data_sync_s3_format)
  ~(bucket_name : string)
  () : resource_data_sync_s3_destination = {
  destination_data_sharing;
  awskms_key_ar_n;
  region;
  sync_format;
  prefix;
  bucket_name;
   }

let make_resource_data_sync_item 
  ?(last_sync_status_message : string option)
  ?(sync_created_time : float option)
  ?(last_status : last_resource_data_sync_status option)
  ?(sync_last_modified_time : float option)
  ?(last_successful_sync_time : float option)
  ?(last_sync_time : float option)
  ?(s3_destination : resource_data_sync_s3_destination option)
  ?(sync_source : resource_data_sync_source_with_state option)
  ?(sync_type : string option)
  ?(sync_name : string option)
  () : resource_data_sync_item = {
  last_sync_status_message;
  sync_created_time;
  last_status;
  sync_last_modified_time;
  last_successful_sync_time;
  last_sync_time;
  s3_destination;
  sync_source;
  sync_type;
  sync_name;
   }

let make_compliance_execution_summary 
  ?(execution_type : string option)
  ?(execution_id : string option)
  ~(execution_time : float)
  () : compliance_execution_summary = {
  execution_type; execution_id; execution_time;  }

let make_compliant_summary 
  ?(severity_summary : severity_summary option)
  ?(compliant_count : int option)
  () : compliant_summary = { severity_summary; compliant_count; 
}

let make_non_compliant_summary 
  ?(severity_summary : severity_summary option)
  ?(non_compliant_count : int option)
  () : non_compliant_summary = { severity_summary; non_compliant_count; 
}

let make_resource_compliance_summary_item 
  ?(non_compliant_summary : non_compliant_summary option)
  ?(compliant_summary : compliant_summary option)
  ?(execution_summary : compliance_execution_summary option)
  ?(overall_severity : compliance_severity option)
  ?(status : compliance_status option)
  ?(resource_id : string option)
  ?(resource_type : string option)
  ?(compliance_type : string option)
  () : resource_compliance_summary_item = {
  non_compliant_summary;
  compliant_summary;
  execution_summary;
  overall_severity;
  status;
  resource_id;
  resource_type;
  compliance_type;
   }

let make_resolved_targets 
  ?(truncated : bool option) ?(parameter_values : string list option) ()
: resolved_targets = { truncated; parameter_values; 
}

let make_reset_service_setting_request  ~(setting_id : string) ()
: reset_service_setting_request = { setting_id; 
}

let make_remove_tags_from_resource_request 
  ~(tag_keys : string list)
  ~(resource_id : string)
  ~(resource_type : resource_type_for_tagging)
  () : remove_tags_from_resource_request = {
  tag_keys; resource_id; resource_type; 
}

let make_registration_metadata_item  ~(value : string) ~(key : string) ()
: registration_metadata_item = { value; key; 
}

let make_register_task_with_maintenance_window_request 
  ?(alarm_configuration : alarm_configuration option)
  ?(cutoff_behavior : maintenance_window_task_cutoff_behavior option)
  ?(client_token : string option)
  ?(description : string option)
  ?(name : string option)
  ?(logging_info : logging_info option)
  ?(max_errors : string option)
  ?(max_concurrency : string option)
  ?(priority : int option)
  ?(task_invocation_parameters : maintenance_window_task_invocation_parameters option)
  ?(task_parameters : (string * maintenance_window_task_parameter_value_expression) list option)
  ?(service_role_arn : string option)
  ?(targets : target list option)
  ~(task_type : maintenance_window_task_type)
  ~(task_arn : string)
  ~(window_id : string)
  () : register_task_with_maintenance_window_request = {
  alarm_configuration;
  cutoff_behavior;
  client_token;
  description;
  name;
  logging_info;
  max_errors;
  max_concurrency;
  priority;
  task_invocation_parameters;
  task_parameters;
  task_type;
  service_role_arn;
  task_arn;
  targets;
  window_id;
   }

let make_register_target_with_maintenance_window_request 
  ?(client_token : string option)
  ?(description : string option)
  ?(name : string option)
  ?(owner_information : string option)
  ~(targets : target list)
  ~(resource_type : maintenance_window_resource_type)
  ~(window_id : string)
  () : register_target_with_maintenance_window_request = {
  client_token;
  description;
  name;
  owner_information;
  targets;
  resource_type;
  window_id;
   }

let make_register_patch_baseline_for_patch_group_request 
  ~(patch_group : string) ~(baseline_id : string) ()
: register_patch_baseline_for_patch_group_request = {
  patch_group; baseline_id; 
}

let make_register_default_patch_baseline_request  ~(baseline_id : string) ()
: register_default_patch_baseline_request = { baseline_id; 
}

let make_put_resource_policy_response 
  ?(policy_hash : string option) ?(policy_id : string option) ()
: put_resource_policy_response = { policy_hash; policy_id; 
}

let make_put_resource_policy_request 
  ?(policy_hash : string option)
  ?(policy_id : string option)
  ~(policy : string)
  ~(resource_arn : string)
  () : put_resource_policy_request = {
  policy_hash; policy_id; policy; resource_arn; 
}

let make_put_parameter_request 
  ?(data_type : string option)
  ?(policies : string option)
  ?(tier : parameter_tier option)
  ?(tags : tag list option)
  ?(allowed_pattern : string option)
  ?(overwrite : bool option)
  ?(key_id : string option)
  ?(type_ : parameter_type option)
  ?(description : string option)
  ~(value : string)
  ~(name : string)
  () : put_parameter_request = {
  data_type;
  policies;
  tier;
  tags;
  allowed_pattern;
  overwrite;
  key_id;
  type_;
  value;
  description;
  name;
   }

let make_inventory_item 
  ?(context : (string * string) list option)
  ?(content : (string * string) list list option)
  ?(content_hash : string option)
  ~(capture_time : string)
  ~(schema_version : string)
  ~(type_name : string)
  () : inventory_item = {
  context; content; content_hash; capture_time; schema_version; type_name; 
}

let make_put_inventory_request 
  ~(items : inventory_item list) ~(instance_id : string) ()
: put_inventory_request = { items; instance_id; 
}

let make_compliance_item_entry 
  ?(details : (string * string) list option)
  ?(title : string option)
  ?(id : string option)
  ~(status : compliance_status)
  ~(severity : compliance_severity)
  () : compliance_item_entry = { details; status; severity; title; id; 
}

let make_put_compliance_items_request 
  ?(upload_type : compliance_upload_type option)
  ?(item_content_hash : string option)
  ~(items : compliance_item_entry list)
  ~(execution_summary : compliance_execution_summary)
  ~(compliance_type : string)
  ~(resource_type : string)
  ~(resource_id : string)
  () : put_compliance_items_request = {
  upload_type;
  item_content_hash;
  items;
  execution_summary;
  compliance_type;
  resource_type;
  resource_id;
   }

let make_progress_counters 
  ?(timed_out_steps : int option)
  ?(cancelled_steps : int option)
  ?(failed_steps : int option)
  ?(success_steps : int option)
  ?(total_steps : int option)
  () : progress_counters = {
  timed_out_steps; cancelled_steps; failed_steps; success_steps; total_steps; 
}

let make_patch_status 
  ?(approval_date : float option)
  ?(compliance_level : patch_compliance_level option)
  ?(deployment_status : patch_deployment_status option)
  () : patch_status = { approval_date; compliance_level; deployment_status; 
}

let make_patch_orchestrator_filter 
  ?(values : string list option) ?(key : string option) ()
: patch_orchestrator_filter = { values; key;  }

let make_patch 
  ?(repository : string option)
  ?(severity : string option)
  ?(arch : string option)
  ?(release : string option)
  ?(version : string option)
  ?(epoch : int option)
  ?(name : string option)
  ?(cve_ids : string list option)
  ?(bugzilla_ids : string list option)
  ?(advisory_ids : string list option)
  ?(language : string option)
  ?(msrc_number : string option)
  ?(kb_number : string option)
  ?(msrc_severity : string option)
  ?(classification : string option)
  ?(product : string option)
  ?(product_family : string option)
  ?(vendor : string option)
  ?(content_url : string option)
  ?(description : string option)
  ?(title : string option)
  ?(release_date : float option)
  ?(id : string option)
  () : patch = {
  repository;
  severity;
  arch;
  release;
  version;
  epoch;
  name;
  cve_ids;
  bugzilla_ids;
  advisory_ids;
  language;
  msrc_number;
  kb_number;
  msrc_severity;
  classification;
  product;
  product_family;
  vendor;
  content_url;
  description;
  title;
  release_date;
  id;
   }

let make_patch_baseline_identity 
  ?(default_baseline : bool option)
  ?(baseline_description : string option)
  ?(operating_system : operating_system option)
  ?(baseline_name : string option)
  ?(baseline_id : string option)
  () : patch_baseline_identity = {
  default_baseline;
  baseline_description;
  operating_system;
  baseline_name;
  baseline_id;
   }

let make_patch_group_patch_baseline_mapping 
  ?(baseline_identity : patch_baseline_identity option)
  ?(patch_group : string option)
  () : patch_group_patch_baseline_mapping = {
  baseline_identity; patch_group;  }

let make_patch_compliance_data 
  ?(cve_ids : string option)
  ~(installed_time : float)
  ~(state : patch_compliance_data_state)
  ~(severity : string)
  ~(classification : string)
  ~(kb_id : string)
  ~(title : string)
  () : patch_compliance_data = {
  cve_ids; installed_time; state; severity; classification; kb_id; title; 
}

let make_parameters_filter 
  ~(values : string list) ~(key : parameters_filter_key) ()
: parameters_filter = { values; key;  }

let make_parameter_string_filter 
  ?(values : string list option)
  ?(option_ : string option)
  ~(key : string)
  () : parameter_string_filter = { values; option_; key; 
}

let make_parameter_inline_policy 
  ?(policy_status : string option)
  ?(policy_type : string option)
  ?(policy_text : string option)
  () : parameter_inline_policy = { policy_status; policy_type; policy_text; 
}

let make_parameter_metadata 
  ?(data_type : string option)
  ?(policies : parameter_inline_policy list option)
  ?(tier : parameter_tier option)
  ?(version : int option)
  ?(allowed_pattern : string option)
  ?(description : string option)
  ?(last_modified_user : string option)
  ?(last_modified_date : float option)
  ?(key_id : string option)
  ?(type_ : parameter_type option)
  ?(ar_n : string option)
  ?(name : string option)
  () : parameter_metadata = {
  data_type;
  policies;
  tier;
  version;
  allowed_pattern;
  description;
  last_modified_user;
  last_modified_date;
  key_id;
  type_;
  ar_n;
  name;
   }

let make_parameter 
  ?(data_type : string option)
  ?(ar_n : string option)
  ?(last_modified_date : float option)
  ?(source_result : string option)
  ?(selector : string option)
  ?(version : int option)
  ?(value : string option)
  ?(type_ : parameter_type option)
  ?(name : string option)
  () : parameter = {
  data_type;
  ar_n;
  last_modified_date;
  source_result;
  selector;
  version;
  value;
  type_;
  name;
   }

let make_parameter_history 
  ?(data_type : string option)
  ?(policies : parameter_inline_policy list option)
  ?(tier : parameter_tier option)
  ?(labels : string list option)
  ?(version : int option)
  ?(allowed_pattern : string option)
  ?(value : string option)
  ?(description : string option)
  ?(last_modified_user : string option)
  ?(last_modified_date : float option)
  ?(key_id : string option)
  ?(type_ : parameter_type option)
  ?(name : string option)
  () : parameter_history = {
  data_type;
  policies;
  tier;
  labels;
  version;
  allowed_pattern;
  value;
  description;
  last_modified_user;
  last_modified_date;
  key_id;
  type_;
  name;
   }

let make_output_source 
  ?(output_source_type : string option)
  ?(output_source_id : string option)
  () : output_source = { output_source_type; output_source_id; 
}

let make_ops_result_attribute  ~(type_name : string) ()
: ops_result_attribute = { type_name;  }

let make_ops_metadata 
  ?(creation_date : float option)
  ?(last_modified_user : string option)
  ?(last_modified_date : float option)
  ?(ops_metadata_arn : string option)
  ?(resource_id : string option)
  () : ops_metadata = {
  creation_date;
  last_modified_user;
  last_modified_date;
  ops_metadata_arn;
  resource_id;
   }

let make_ops_metadata_filter  ~(values : string list) ~(key : string) ()
: ops_metadata_filter = { values; key;  }

let make_ops_item_summary 
  ?(planned_end_time : float option)
  ?(planned_start_time : float option)
  ?(actual_end_time : float option)
  ?(actual_start_time : float option)
  ?(ops_item_type : string option)
  ?(severity : string option)
  ?(category : string option)
  ?(operational_data : (string * ops_item_data_value) list option)
  ?(title : string option)
  ?(ops_item_id : string option)
  ?(status : ops_item_status option)
  ?(source : string option)
  ?(priority : int option)
  ?(last_modified_time : float option)
  ?(last_modified_by : string option)
  ?(created_time : float option)
  ?(created_by : string option)
  () : ops_item_summary = {
  planned_end_time;
  planned_start_time;
  actual_end_time;
  actual_start_time;
  ops_item_type;
  severity;
  category;
  operational_data;
  title;
  ops_item_id;
  status;
  source;
  priority;
  last_modified_time;
  last_modified_by;
  created_time;
  created_by;
   }

let make_ops_item_related_items_filter 
  ~(operator : ops_item_related_items_filter_operator)
  ~(values : string list)
  ~(key : ops_item_related_items_filter_key)
  () : ops_item_related_items_filter = { operator; values; key; 
}

let make_ops_item_identity  ?(arn : string option) () : ops_item_identity = {
  arn;  }

let make_ops_item_related_item_summary 
  ?(last_modified_time : float option)
  ?(last_modified_by : ops_item_identity option)
  ?(created_time : float option)
  ?(created_by : ops_item_identity option)
  ?(resource_uri : string option)
  ?(association_type : string option)
  ?(resource_type : string option)
  ?(association_id : string option)
  ?(ops_item_id : string option)
  () : ops_item_related_item_summary = {
  last_modified_time;
  last_modified_by;
  created_time;
  created_by;
  resource_uri;
  association_type;
  resource_type;
  association_id;
  ops_item_id;
   }

let make_ops_item_filter 
  ~(operator : ops_item_filter_operator)
  ~(values : string list)
  ~(key : ops_item_filter_key)
  () : ops_item_filter = { operator; values; key; 
}

let make_ops_item_event_summary 
  ?(created_time : float option)
  ?(created_by : ops_item_identity option)
  ?(detail : string option)
  ?(detail_type : string option)
  ?(source : string option)
  ?(event_id : string option)
  ?(ops_item_id : string option)
  () : ops_item_event_summary = {
  created_time;
  created_by;
  detail;
  detail_type;
  source;
  event_id;
  ops_item_id;
   }

let make_ops_item_event_filter 
  ~(operator : ops_item_event_filter_operator)
  ~(values : string list)
  ~(key : ops_item_event_filter_key)
  () : ops_item_event_filter = { operator; values; key;  }

let make_ops_item 
  ?(ops_item_arn : string option)
  ?(planned_end_time : float option)
  ?(planned_start_time : float option)
  ?(actual_end_time : float option)
  ?(actual_start_time : float option)
  ?(severity : string option)
  ?(category : string option)
  ?(operational_data : (string * ops_item_data_value) list option)
  ?(source : string option)
  ?(title : string option)
  ?(version : string option)
  ?(ops_item_id : string option)
  ?(status : ops_item_status option)
  ?(related_ops_items : related_ops_item list option)
  ?(priority : int option)
  ?(notifications : ops_item_notification list option)
  ?(last_modified_time : float option)
  ?(last_modified_by : string option)
  ?(description : string option)
  ?(created_time : float option)
  ?(ops_item_type : string option)
  ?(created_by : string option)
  () : ops_item = {
  ops_item_arn;
  planned_end_time;
  planned_start_time;
  actual_end_time;
  actual_start_time;
  severity;
  category;
  operational_data;
  source;
  title;
  version;
  ops_item_id;
  status;
  related_ops_items;
  priority;
  notifications;
  last_modified_time;
  last_modified_by;
  description;
  created_time;
  ops_item_type;
  created_by;
   }

let make_ops_filter 
  ?(type_ : ops_filter_operator_type option)
  ~(values : string list)
  ~(key : string)
  () : ops_filter = { type_; values; key;  }

let make_ops_entity_item 
  ?(content : (string * string) list list option)
  ?(capture_time : string option)
  () : ops_entity_item = { content; capture_time;  }

let make_ops_entity 
  ?(data : (string * ops_entity_item) list option) ?(id : string option) ()
: ops_entity = { data; id;  }

let make_ops_aggregator 
  ?(aggregators : ops_aggregator list option)
  ?(filters : ops_filter list option)
  ?(values : (string * string) list option)
  ?(attribute_name : string option)
  ?(type_name : string option)
  ?(aggregator_type : string option)
  () : ops_aggregator = {
  aggregators; filters; values; attribute_name; type_name; aggregator_type; 
}

let make_modify_document_permission_response  ()
: modify_document_permission_response =
()

let make_modify_document_permission_request 
  ?(shared_document_version : string option)
  ?(account_ids_to_remove : string list option)
  ?(account_ids_to_add : string list option)
  ~(permission_type : document_permission_type)
  ~(name : string)
  () : modify_document_permission_request = {
  shared_document_version;
  account_ids_to_remove;
  account_ids_to_add;
  permission_type;
  name;
   }

let make_maintenance_window_identity_for_target 
  ?(name : string option) ?(window_id : string option) ()
: maintenance_window_identity_for_target = { name; window_id; 
}

let make_maintenance_window_task 
  ?(alarm_configuration : alarm_configuration option)
  ?(cutoff_behavior : maintenance_window_task_cutoff_behavior option)
  ?(description : string option)
  ?(name : string option)
  ?(max_errors : string option)
  ?(max_concurrency : string option)
  ?(service_role_arn : string option)
  ?(logging_info : logging_info option)
  ?(priority : int option)
  ?(task_parameters : (string * maintenance_window_task_parameter_value_expression) list option)
  ?(targets : target list option)
  ?(type_ : maintenance_window_task_type option)
  ?(task_arn : string option)
  ?(window_task_id : string option)
  ?(window_id : string option)
  () : maintenance_window_task = {
  alarm_configuration;
  cutoff_behavior;
  description;
  name;
  max_errors;
  max_concurrency;
  service_role_arn;
  logging_info;
  priority;
  task_parameters;
  targets;
  type_;
  task_arn;
  window_task_id;
  window_id;
   }

let make_maintenance_window_target 
  ?(description : string option)
  ?(name : string option)
  ?(owner_information : string option)
  ?(targets : target list option)
  ?(resource_type : maintenance_window_resource_type option)
  ?(window_target_id : string option)
  ?(window_id : string option)
  () : maintenance_window_target = {
  description;
  name;
  owner_information;
  targets;
  resource_type;
  window_target_id;
  window_id;
   }

let make_maintenance_window_identity 
  ?(next_execution_time : string option)
  ?(start_date : string option)
  ?(end_date : string option)
  ?(schedule_offset : int option)
  ?(schedule_timezone : string option)
  ?(schedule : string option)
  ?(cutoff : int option)
  ?(duration : int option)
  ?(enabled : bool option)
  ?(description : string option)
  ?(name : string option)
  ?(window_id : string option)
  () : maintenance_window_identity = {
  next_execution_time;
  start_date;
  end_date;
  schedule_offset;
  schedule_timezone;
  schedule;
  cutoff;
  duration;
  enabled;
  description;
  name;
  window_id;
   }

let make_maintenance_window_filter 
  ?(values : string list option) ?(key : string option) ()
: maintenance_window_filter = { values; key; 
}

let make_maintenance_window_execution_task_invocation_identity 
  ?(window_target_id : string option)
  ?(owner_information : string option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(status_details : string option)
  ?(status : maintenance_window_execution_status option)
  ?(parameters : string option)
  ?(task_type : maintenance_window_task_type option)
  ?(execution_id : string option)
  ?(invocation_id : string option)
  ?(task_execution_id : string option)
  ?(window_execution_id : string option)
  () : maintenance_window_execution_task_invocation_identity = {
  window_target_id;
  owner_information;
  end_time;
  start_time;
  status_details;
  status;
  parameters;
  task_type;
  execution_id;
  invocation_id;
  task_execution_id;
  window_execution_id;
   }

let make_maintenance_window_execution_task_identity 
  ?(triggered_alarms : alarm_state_information list option)
  ?(alarm_configuration : alarm_configuration option)
  ?(task_type : maintenance_window_task_type option)
  ?(task_arn : string option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(status_details : string option)
  ?(status : maintenance_window_execution_status option)
  ?(task_execution_id : string option)
  ?(window_execution_id : string option)
  () : maintenance_window_execution_task_identity = {
  triggered_alarms;
  alarm_configuration;
  task_type;
  task_arn;
  end_time;
  start_time;
  status_details;
  status;
  task_execution_id;
  window_execution_id;
   }

let make_maintenance_window_execution 
  ?(end_time : float option)
  ?(start_time : float option)
  ?(status_details : string option)
  ?(status : maintenance_window_execution_status option)
  ?(window_execution_id : string option)
  ?(window_id : string option)
  () : maintenance_window_execution = {
  end_time;
  start_time;
  status_details;
  status;
  window_execution_id;
  window_id;
   }

let make_list_tags_for_resource_request 
  ~(resource_id : string) ~(resource_type : resource_type_for_tagging) ()
: list_tags_for_resource_request = { resource_id; resource_type; 
}

let make_list_resource_data_sync_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(sync_type : string option)
  () : list_resource_data_sync_request = {
  max_results; next_token; sync_type;  }

let make_compliance_string_filter 
  ?(type_ : compliance_query_operator_type option)
  ?(values : string list option)
  ?(key : string option)
  () : compliance_string_filter = { type_; values; key; 
}

let make_list_resource_compliance_summaries_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(filters : compliance_string_filter list option)
  () : list_resource_compliance_summaries_request = {
  max_results; next_token; filters;  }

let make_list_ops_metadata_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : ops_metadata_filter list option)
  () : list_ops_metadata_request = { next_token; max_results; filters; 
}

let make_list_ops_item_related_items_response 
  ?(summaries : ops_item_related_item_summary list option)
  ?(next_token : string option)
  () : list_ops_item_related_items_response = { summaries; next_token; 
}

let make_list_ops_item_related_items_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : ops_item_related_items_filter list option)
  ?(ops_item_id : string option)
  () : list_ops_item_related_items_request = {
  next_token; max_results; filters; ops_item_id; 
}

let make_list_ops_item_events_response 
  ?(summaries : ops_item_event_summary list option)
  ?(next_token : string option)
  () : list_ops_item_events_response = { summaries; next_token; 
}

let make_list_ops_item_events_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : ops_item_event_filter list option)
  () : list_ops_item_events_request = { next_token; max_results; filters; 
}

let make_inventory_filter 
  ?(type_ : inventory_query_operator_type option)
  ~(values : string list)
  ~(key : string)
  () : inventory_filter = { type_; values; key; 
}

let make_list_inventory_entries_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(filters : inventory_filter list option)
  ~(type_name : string)
  ~(instance_id : string)
  () : list_inventory_entries_request = {
  max_results; next_token; filters; type_name; instance_id; 
}

let make_document_identifier 
  ?(author : string option)
  ?(review_status : review_status option)
  ?(requires : document_requires list option)
  ?(tags : tag list option)
  ?(target_type : string option)
  ?(document_format : document_format option)
  ?(schema_version : string option)
  ?(document_type : document_type option)
  ?(document_version : string option)
  ?(platform_types : platform_type list option)
  ?(version_name : string option)
  ?(owner : string option)
  ?(display_name : string option)
  ?(created_date : float option)
  ?(name : string option)
  () : document_identifier = {
  author;
  review_status;
  requires;
  tags;
  target_type;
  document_format;
  schema_version;
  document_type;
  document_version;
  platform_types;
  version_name;
  owner;
  display_name;
  created_date;
  name;
   }

let make_document_filter  ~(value : string) ~(key : document_filter_key) ()
: document_filter = { value; key;  }

let make_document_key_values_filter 
  ?(values : string list option) ?(key : string option) ()
: document_key_values_filter = { values; key; 
}

let make_list_documents_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : document_key_values_filter list option)
  ?(document_filter_list : document_filter list option)
  () : list_documents_request = {
  next_token; max_results; filters; document_filter_list; 
}

let make_document_version_info 
  ?(review_status : review_status option)
  ?(status_information : string option)
  ?(status : document_status option)
  ?(document_format : document_format option)
  ?(is_default_version : bool option)
  ?(created_date : float option)
  ?(version_name : string option)
  ?(document_version : string option)
  ?(display_name : string option)
  ?(name : string option)
  () : document_version_info = {
  review_status;
  status_information;
  status;
  document_format;
  is_default_version;
  created_date;
  version_name;
  document_version;
  display_name;
  name;
   }

let make_list_document_versions_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(name : string)
  () : list_document_versions_request = { next_token; max_results; name; 
}

let make_document_reviewer_response_source 
  ?(reviewer : string option)
  ?(comment : document_review_comment_source list option)
  ?(review_status : review_status option)
  ?(updated_time : float option)
  ?(create_time : float option)
  () : document_reviewer_response_source = {
  reviewer; comment; review_status; updated_time; create_time; 
}

let make_document_metadata_response_info 
  ?(reviewer_response : document_reviewer_response_source list option) ()
: document_metadata_response_info = { reviewer_response; 
}

let make_list_document_metadata_history_response 
  ?(next_token : string option)
  ?(metadata : document_metadata_response_info option)
  ?(author : string option)
  ?(document_version : string option)
  ?(name : string option)
  () : list_document_metadata_history_response = {
  next_token; metadata; author; document_version; name; 
}

let make_list_document_metadata_history_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(document_version : string option)
  ~(metadata : document_metadata_enum)
  ~(name : string)
  () : list_document_metadata_history_request = {
  max_results; next_token; metadata; document_version; name; 
}

let make_compliance_summary_item 
  ?(non_compliant_summary : non_compliant_summary option)
  ?(compliant_summary : compliant_summary option)
  ?(compliance_type : string option)
  () : compliance_summary_item = {
  non_compliant_summary; compliant_summary; compliance_type; 
}

let make_list_compliance_summaries_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(filters : compliance_string_filter list option)
  () : list_compliance_summaries_request = {
  max_results; next_token; filters;  }

let make_compliance_item 
  ?(details : (string * string) list option)
  ?(execution_summary : compliance_execution_summary option)
  ?(severity : compliance_severity option)
  ?(status : compliance_status option)
  ?(title : string option)
  ?(id : string option)
  ?(resource_id : string option)
  ?(resource_type : string option)
  ?(compliance_type : string option)
  () : compliance_item = {
  details;
  execution_summary;
  severity;
  status;
  title;
  id;
  resource_id;
  resource_type;
  compliance_type;
   }

let make_list_compliance_items_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(resource_types : string list option)
  ?(resource_ids : string list option)
  ?(filters : compliance_string_filter list option)
  () : list_compliance_items_request = {
  max_results; next_token; resource_types; resource_ids; filters; 
}

let make_command_filter  ~(value : string) ~(key : command_filter_key) ()
: command_filter = { value; key;  }

let make_list_commands_request 
  ?(filters : command_filter list option)
  ?(next_token : string option)
  ?(max_results : int option)
  ?(instance_id : string option)
  ?(command_id : string option)
  () : list_commands_request = {
  filters; next_token; max_results; instance_id; command_id; 
}

let make_command_plugin 
  ?(output_s3_key_prefix : string option)
  ?(output_s3_bucket_name : string option)
  ?(output_s3_region : string option)
  ?(standard_error_url : string option)
  ?(standard_output_url : string option)
  ?(output : string option)
  ?(response_finish_date_time : float option)
  ?(response_start_date_time : float option)
  ?(response_code : int option)
  ?(status_details : string option)
  ?(status : command_plugin_status option)
  ?(name : string option)
  () : command_plugin = {
  output_s3_key_prefix;
  output_s3_bucket_name;
  output_s3_region;
  standard_error_url;
  standard_output_url;
  output;
  response_finish_date_time;
  response_start_date_time;
  response_code;
  status_details;
  status;
  name;
   }

let make_command_invocation 
  ?(cloud_watch_output_config : cloud_watch_output_config option)
  ?(notification_config : notification_config option)
  ?(service_role : string option)
  ?(command_plugins : command_plugin list option)
  ?(standard_error_url : string option)
  ?(standard_output_url : string option)
  ?(trace_output : string option)
  ?(status_details : string option)
  ?(status : command_invocation_status option)
  ?(requested_date_time : float option)
  ?(document_version : string option)
  ?(document_name : string option)
  ?(comment : string option)
  ?(instance_name : string option)
  ?(instance_id : string option)
  ?(command_id : string option)
  () : command_invocation = {
  cloud_watch_output_config;
  notification_config;
  service_role;
  command_plugins;
  standard_error_url;
  standard_output_url;
  trace_output;
  status_details;
  status;
  requested_date_time;
  document_version;
  document_name;
  comment;
  instance_name;
  instance_id;
  command_id;
   }

let make_list_command_invocations_request 
  ?(details : bool option)
  ?(filters : command_filter list option)
  ?(next_token : string option)
  ?(max_results : int option)
  ?(instance_id : string option)
  ?(command_id : string option)
  () : list_command_invocations_request = {
  details; filters; next_token; max_results; instance_id; command_id; 
}

let make_association 
  ?(target_maps : (string * string list) list list option)
  ?(duration : int option)
  ?(schedule_offset : int option)
  ?(association_name : string option)
  ?(schedule_expression : string option)
  ?(overview : association_overview option)
  ?(last_execution_date : float option)
  ?(targets : target list option)
  ?(document_version : string option)
  ?(association_version : string option)
  ?(association_id : string option)
  ?(instance_id : string option)
  ?(name : string option)
  () : association = {
  target_maps;
  duration;
  schedule_offset;
  association_name;
  schedule_expression;
  overview;
  last_execution_date;
  targets;
  document_version;
  association_version;
  association_id;
  instance_id;
  name;
   }

let make_association_filter 
  ~(value : string) ~(key : association_filter_key) () : association_filter =
{ value; key;  }

let make_list_associations_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(association_filter_list : association_filter list option)
  () : list_associations_request = {
  next_token; max_results; association_filter_list; 
}

let make_association_version_info 
  ?(target_maps : (string * string list) list list option)
  ?(duration : int option)
  ?(schedule_offset : int option)
  ?(target_locations : target_location list option)
  ?(calendar_names : string list option)
  ?(apply_only_at_cron_interval : bool option)
  ?(sync_compliance : association_sync_compliance option)
  ?(compliance_severity : association_compliance_severity option)
  ?(max_concurrency : string option)
  ?(max_errors : string option)
  ?(association_name : string option)
  ?(output_location : instance_association_output_location option)
  ?(schedule_expression : string option)
  ?(targets : target list option)
  ?(parameters : (string * string list) list option)
  ?(document_version : string option)
  ?(name : string option)
  ?(created_date : float option)
  ?(association_version : string option)
  ?(association_id : string option)
  () : association_version_info = {
  target_maps;
  duration;
  schedule_offset;
  target_locations;
  calendar_names;
  apply_only_at_cron_interval;
  sync_compliance;
  compliance_severity;
  max_concurrency;
  max_errors;
  association_name;
  output_location;
  schedule_expression;
  targets;
  parameters;
  document_version;
  name;
  created_date;
  association_version;
  association_id;
   }

let make_list_association_versions_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(association_id : string)
  () : list_association_versions_request = {
  next_token; max_results; association_id; 
}

let make_label_parameter_version_request 
  ?(parameter_version : int option)
  ~(labels : string list)
  ~(name : string)
  () : label_parameter_version_request = { labels; parameter_version; name; 
}

let make_inventory_result_item 
  ?(content_hash : string option)
  ?(capture_time : string option)
  ~(content : (string * string) list list)
  ~(schema_version : string)
  ~(type_name : string)
  () : inventory_result_item = {
  content; content_hash; capture_time; schema_version; type_name; 
}

let make_inventory_result_entity 
  ?(data : (string * inventory_result_item) list option)
  ?(id : string option)
  () : inventory_result_entity = { data; id; 
}

let make_inventory_item_attribute 
  ~(data_type : inventory_attribute_data_type) ~(name : string) ()
: inventory_item_attribute = { data_type; name; 
}

let make_inventory_item_schema 
  ?(display_name : string option)
  ?(version : string option)
  ~(attributes : inventory_item_attribute list)
  ~(type_name : string)
  () : inventory_item_schema = {
  display_name; attributes; version; type_name;  }

let make_inventory_group 
  ~(filters : inventory_filter list) ~(name : string) () : inventory_group =
{ filters; name;  }

let make_inventory_deletion_summary_item 
  ?(remaining_count : int option)
  ?(count : int option)
  ?(version : string option)
  () : inventory_deletion_summary_item = { remaining_count; count; version; 
}

let make_inventory_deletion_summary 
  ?(summary_items : inventory_deletion_summary_item list option)
  ?(remaining_count : int option)
  ?(total_count : int option)
  () : inventory_deletion_summary = {
  summary_items; remaining_count; total_count; 
}

let make_inventory_deletion_status_item 
  ?(last_status_update_time : float option)
  ?(deletion_summary : inventory_deletion_summary option)
  ?(last_status_message : string option)
  ?(last_status : inventory_deletion_status option)
  ?(deletion_start_time : float option)
  ?(type_name : string option)
  ?(deletion_id : string option)
  () : inventory_deletion_status_item = {
  last_status_update_time;
  deletion_summary;
  last_status_message;
  last_status;
  deletion_start_time;
  type_name;
  deletion_id;
   }

let make_inventory_aggregator 
  ?(groups : inventory_group list option)
  ?(aggregators : inventory_aggregator list option)
  ?(expression : string option)
  () : inventory_aggregator = { groups; aggregators; expression; 
}

let make_instance_property_string_filter 
  ?(operator : instance_property_filter_operator option)
  ~(values : string list)
  ~(key : string)
  () : instance_property_string_filter = { operator; values; key; 
}

let make_instance_property_filter 
  ~(value_set : string list) ~(key : instance_property_filter_key) ()
: instance_property_filter = { value_set; key; 
}

let make_instance_aggregated_association_overview 
  ?(instance_association_status_aggregated_count : (string * int) list option)
  ?(detailed_status : string option)
  () : instance_aggregated_association_overview = {
  instance_association_status_aggregated_count; detailed_status; 
}

let make_instance_property 
  ?(source_type : source_type option)
  ?(source_id : string option)
  ?(association_overview : instance_aggregated_association_overview option)
  ?(last_successful_association_execution_date : float option)
  ?(last_association_execution_date : float option)
  ?(association_status : string option)
  ?(computer_name : string option)
  ?(resource_type : string option)
  ?(registration_date : float option)
  ?(iam_role : string option)
  ?(activation_id : string option)
  ?(platform_version : string option)
  ?(platform_name : string option)
  ?(platform_type : platform_type option)
  ?(agent_version : string option)
  ?(last_ping_date_time : float option)
  ?(ping_status : ping_status option)
  ?(launch_time : float option)
  ?(ip_address : string option)
  ?(architecture : string option)
  ?(instance_state : string option)
  ?(key_name : string option)
  ?(instance_role : string option)
  ?(instance_type : string option)
  ?(instance_id : string option)
  ?(name : string option)
  () : instance_property = {
  source_type;
  source_id;
  association_overview;
  last_successful_association_execution_date;
  last_association_execution_date;
  association_status;
  computer_name;
  resource_type;
  registration_date;
  iam_role;
  activation_id;
  platform_version;
  platform_name;
  platform_type;
  agent_version;
  last_ping_date_time;
  ping_status;
  launch_time;
  ip_address;
  architecture;
  instance_state;
  key_name;
  instance_role;
  instance_type;
  instance_id;
  name;
   }

let make_instance_patch_state 
  ?(other_non_compliant_count : int option)
  ?(security_non_compliant_count : int option)
  ?(critical_non_compliant_count : int option)
  ?(reboot_option : reboot_option option)
  ?(last_no_reboot_install_operation_time : float option)
  ?(not_applicable_count : int option)
  ?(unreported_not_applicable_count : int option)
  ?(failed_count : int option)
  ?(missing_count : int option)
  ?(installed_rejected_count : int option)
  ?(installed_pending_reboot_count : int option)
  ?(installed_other_count : int option)
  ?(installed_count : int option)
  ?(owner_information : string option)
  ?(install_override_list : string option)
  ?(snapshot_id : string option)
  ~(operation : patch_operation_type)
  ~(operation_end_time : float)
  ~(operation_start_time : float)
  ~(baseline_id : string)
  ~(patch_group : string)
  ~(instance_id : string)
  () : instance_patch_state = {
  other_non_compliant_count;
  security_non_compliant_count;
  critical_non_compliant_count;
  reboot_option;
  last_no_reboot_install_operation_time;
  operation;
  operation_end_time;
  operation_start_time;
  not_applicable_count;
  unreported_not_applicable_count;
  failed_count;
  missing_count;
  installed_rejected_count;
  installed_pending_reboot_count;
  installed_other_count;
  installed_count;
  owner_information;
  install_override_list;
  snapshot_id;
  baseline_id;
  patch_group;
  instance_id;
   }

let make_instance_patch_state_filter 
  ~(type_ : instance_patch_state_operator_type)
  ~(values : string list)
  ~(key : string)
  () : instance_patch_state_filter = { type_; values; key; 
}

let make_instance_information_string_filter 
  ~(values : string list) ~(key : string) ()
: instance_information_string_filter = { values; key; 
}

let make_instance_information 
  ?(source_type : source_type option)
  ?(source_id : string option)
  ?(association_overview : instance_aggregated_association_overview option)
  ?(last_successful_association_execution_date : float option)
  ?(last_association_execution_date : float option)
  ?(association_status : string option)
  ?(computer_name : string option)
  ?(ip_address : string option)
  ?(name : string option)
  ?(resource_type : resource_type option)
  ?(registration_date : float option)
  ?(iam_role : string option)
  ?(activation_id : string option)
  ?(platform_version : string option)
  ?(platform_name : string option)
  ?(platform_type : platform_type option)
  ?(is_latest_version : bool option)
  ?(agent_version : string option)
  ?(last_ping_date_time : float option)
  ?(ping_status : ping_status option)
  ?(instance_id : string option)
  () : instance_information = {
  source_type;
  source_id;
  association_overview;
  last_successful_association_execution_date;
  last_association_execution_date;
  association_status;
  computer_name;
  ip_address;
  name;
  resource_type;
  registration_date;
  iam_role;
  activation_id;
  platform_version;
  platform_name;
  platform_type;
  is_latest_version;
  agent_version;
  last_ping_date_time;
  ping_status;
  instance_id;
   }

let make_instance_information_filter 
  ~(value_set : string list) ~(key : instance_information_filter_key) ()
: instance_information_filter = { value_set; key; 
}

let make_instance_association_output_url 
  ?(s3_output_url : s3_output_url option) ()
: instance_association_output_url = { s3_output_url; 
}

let make_instance_association_status_info 
  ?(association_name : string option)
  ?(output_url : instance_association_output_url option)
  ?(error_code : string option)
  ?(execution_summary : string option)
  ?(detailed_status : string option)
  ?(status : string option)
  ?(execution_date : float option)
  ?(instance_id : string option)
  ?(association_version : string option)
  ?(document_version : string option)
  ?(name : string option)
  ?(association_id : string option)
  () : instance_association_status_info = {
  association_name;
  output_url;
  error_code;
  execution_summary;
  detailed_status;
  status;
  execution_date;
  instance_id;
  association_version;
  document_version;
  name;
  association_id;
   }

let make_instance_association 
  ?(association_version : string option)
  ?(content : string option)
  ?(instance_id : string option)
  ?(association_id : string option)
  () : instance_association = {
  association_version; content; instance_id; association_id; 
}

let make_get_service_setting_request  ~(setting_id : string) ()
: get_service_setting_request = { setting_id; 
}

let make_get_resource_policies_response_entry 
  ?(policy : string option)
  ?(policy_hash : string option)
  ?(policy_id : string option)
  () : get_resource_policies_response_entry = {
  policy; policy_hash; policy_id;  }

let make_get_resource_policies_response 
  ?(policies : get_resource_policies_response_entry list option)
  ?(next_token : string option)
  () : get_resource_policies_response = { policies; next_token; 
}

let make_get_resource_policies_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(resource_arn : string)
  () : get_resource_policies_request = {
  max_results; next_token; resource_arn; 
}

let make_get_patch_baseline_request  ~(baseline_id : string) ()
: get_patch_baseline_request = { baseline_id; 
}

let make_get_patch_baseline_for_patch_group_request 
  ?(operating_system : operating_system option) ~(patch_group : string) ()
: get_patch_baseline_for_patch_group_request = {
  operating_system; patch_group;  }

let make_get_parameters_request 
  ?(with_decryption : bool option) ~(names : string list) ()
: get_parameters_request = { with_decryption; names; 
}

let make_get_parameters_by_path_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(with_decryption : bool option)
  ?(parameter_filters : parameter_string_filter list option)
  ?(recursive : bool option)
  ~(path : string)
  () : get_parameters_by_path_request = {
  next_token;
  max_results;
  with_decryption;
  parameter_filters;
  recursive;
  path;
   }

let make_get_parameter_request 
  ?(with_decryption : bool option) ~(name : string) ()
: get_parameter_request = { with_decryption; name; 
}

let make_get_parameter_history_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(with_decryption : bool option)
  ~(name : string)
  () : get_parameter_history_request = {
  next_token; max_results; with_decryption; name; 
}

let make_get_ops_summary_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(result_attributes : ops_result_attribute list option)
  ?(aggregators : ops_aggregator list option)
  ?(filters : ops_filter list option)
  ?(sync_name : string option)
  () : get_ops_summary_request = {
  max_results;
  next_token;
  result_attributes;
  aggregators;
  filters;
  sync_name;
   }

let make_get_ops_metadata_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(ops_metadata_arn : string)
  () : get_ops_metadata_request = {
  next_token; max_results; ops_metadata_arn; 
}

let make_get_ops_item_response  ?(ops_item : ops_item option) ()
: get_ops_item_response = { ops_item;  }

let make_get_ops_item_request 
  ?(ops_item_arn : string option) ~(ops_item_id : string) ()
: get_ops_item_request = { ops_item_arn; ops_item_id; 
}

let make_get_maintenance_window_task_request 
  ~(window_task_id : string) ~(window_id : string) ()
: get_maintenance_window_task_request = { window_task_id; window_id; 
}

let make_get_maintenance_window_request  ~(window_id : string) ()
: get_maintenance_window_request = { window_id; 
}

let make_get_maintenance_window_execution_task_request 
  ~(task_id : string) ~(window_execution_id : string) ()
: get_maintenance_window_execution_task_request = {
  task_id; window_execution_id; 
}

let make_get_maintenance_window_execution_task_invocation_request 
  ~(invocation_id : string)
  ~(task_id : string)
  ~(window_execution_id : string)
  () : get_maintenance_window_execution_task_invocation_request = {
  invocation_id; task_id; window_execution_id; 
}

let make_get_maintenance_window_execution_request 
  ~(window_execution_id : string) ()
: get_maintenance_window_execution_request = { window_execution_id; 
}

let make_get_inventory_schema_request 
  ?(sub_type : bool option)
  ?(aggregator : bool option)
  ?(max_results : int option)
  ?(next_token : string option)
  ?(type_name : string option)
  () : get_inventory_schema_request = {
  sub_type; aggregator; max_results; next_token; type_name; 
}

let make_get_inventory_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(result_attributes : result_attribute list option)
  ?(aggregators : inventory_aggregator list option)
  ?(filters : inventory_filter list option)
  () : get_inventory_request = {
  max_results; next_token; result_attributes; aggregators; filters; 
}

let make_attachment_content 
  ?(url : string option)
  ?(hash_type : attachment_hash_type option)
  ?(hash : string option)
  ?(size : int option)
  ?(name : string option)
  () : attachment_content = { url; hash_type; hash; size; name; 
}

let make_get_document_request 
  ?(document_format : document_format option)
  ?(document_version : string option)
  ?(version_name : string option)
  ~(name : string)
  () : get_document_request = {
  document_format; document_version; version_name; name; 
}

let make_baseline_override 
  ?(sources : patch_source list option)
  ?(approved_patches_enable_non_security : bool option)
  ?(rejected_patches_action : patch_action option)
  ?(rejected_patches : string list option)
  ?(approved_patches_compliance_level : patch_compliance_level option)
  ?(approved_patches : string list option)
  ?(approval_rules : patch_rule_group option)
  ?(global_filters : patch_filter_group option)
  ?(operating_system : operating_system option)
  () : baseline_override = {
  sources;
  approved_patches_enable_non_security;
  rejected_patches_action;
  rejected_patches;
  approved_patches_compliance_level;
  approved_patches;
  approval_rules;
  global_filters;
  operating_system;
   }

let make_get_deployable_patch_snapshot_for_instance_request 
  ?(baseline_override : baseline_override option)
  ~(snapshot_id : string)
  ~(instance_id : string)
  () : get_deployable_patch_snapshot_for_instance_request = {
  baseline_override; snapshot_id; instance_id; 
}

let make_get_default_patch_baseline_request 
  ?(operating_system : operating_system option) ()
: get_default_patch_baseline_request = { operating_system; 
}

let make_get_connection_status_response 
  ?(status : connection_status option) ?(target : string option) ()
: get_connection_status_response = { status; target; 
}

let make_get_connection_status_request  ~(target : string) ()
: get_connection_status_request = { target; 
}

let make_get_command_invocation_request 
  ?(plugin_name : string option)
  ~(instance_id : string)
  ~(command_id : string)
  () : get_command_invocation_request = {
  plugin_name; instance_id; command_id; 
}

let make_get_calendar_state_response 
  ?(next_transition_time : string option)
  ?(at_time : string option)
  ?(state : calendar_state option)
  () : get_calendar_state_response = { next_transition_time; at_time; state; 
}

let make_get_calendar_state_request 
  ?(at_time : string option) ~(calendar_names : string list) ()
: get_calendar_state_request = { at_time; calendar_names; 
}

let make_automation_execution 
  ?(variables : (string * string list) list option)
  ?(change_request_name : string option)
  ?(association_id : string option)
  ?(ops_item_id : string option)
  ?(runbooks : runbook list option)
  ?(scheduled_time : float option)
  ?(automation_subtype : automation_subtype option)
  ?(triggered_alarms : alarm_state_information list option)
  ?(alarm_configuration : alarm_configuration option)
  ?(progress_counters : progress_counters option)
  ?(target_locations : target_location list option)
  ?(target : string option)
  ?(max_errors : string option)
  ?(max_concurrency : string option)
  ?(resolved_targets : resolved_targets option)
  ?(target_maps : (string * string list) list list option)
  ?(targets : target list option)
  ?(target_parameter_name : string option)
  ?(current_action : string option)
  ?(current_step_name : string option)
  ?(executed_by : string option)
  ?(parent_automation_execution_id : string option)
  ?(mode : execution_mode option)
  ?(failure_message : string option)
  ?(outputs : (string * string list) list option)
  ?(parameters : (string * string list) list option)
  ?(step_executions_truncated : bool option)
  ?(step_executions : step_execution list option)
  ?(automation_execution_status : automation_execution_status option)
  ?(execution_end_time : float option)
  ?(execution_start_time : float option)
  ?(document_version : string option)
  ?(document_name : string option)
  ?(automation_execution_id : string option)
  () : automation_execution = {
  variables;
  change_request_name;
  association_id;
  ops_item_id;
  runbooks;
  scheduled_time;
  automation_subtype;
  triggered_alarms;
  alarm_configuration;
  progress_counters;
  target_locations;
  target;
  max_errors;
  max_concurrency;
  resolved_targets;
  target_maps;
  targets;
  target_parameter_name;
  current_action;
  current_step_name;
  executed_by;
  parent_automation_execution_id;
  mode;
  failure_message;
  outputs;
  parameters;
  step_executions_truncated;
  step_executions;
  automation_execution_status;
  execution_end_time;
  execution_start_time;
  document_version;
  document_name;
  automation_execution_id;
   }

let make_get_automation_execution_request 
  ~(automation_execution_id : string) () : get_automation_execution_request =
{ automation_execution_id;  }

let make_create_association_batch_request_entry 
  ?(alarm_configuration : alarm_configuration option)
  ?(target_maps : (string * string list) list list option)
  ?(duration : int option)
  ?(schedule_offset : int option)
  ?(target_locations : target_location list option)
  ?(calendar_names : string list option)
  ?(apply_only_at_cron_interval : bool option)
  ?(sync_compliance : association_sync_compliance option)
  ?(compliance_severity : association_compliance_severity option)
  ?(max_concurrency : string option)
  ?(max_errors : string option)
  ?(association_name : string option)
  ?(output_location : instance_association_output_location option)
  ?(schedule_expression : string option)
  ?(targets : target list option)
  ?(document_version : string option)
  ?(automation_target_parameter_name : string option)
  ?(parameters : (string * string list) list option)
  ?(instance_id : string option)
  ~(name : string)
  () : create_association_batch_request_entry = {
  alarm_configuration;
  target_maps;
  duration;
  schedule_offset;
  target_locations;
  calendar_names;
  apply_only_at_cron_interval;
  sync_compliance;
  compliance_severity;
  max_concurrency;
  max_errors;
  association_name;
  output_location;
  schedule_expression;
  targets;
  document_version;
  automation_target_parameter_name;
  parameters;
  instance_id;
  name;
   }

let make_failed_create_association 
  ?(fault : fault option)
  ?(message : string option)
  ?(entry : create_association_batch_request_entry option)
  () : failed_create_association = { fault; message; entry; 
}

let make_effective_patch 
  ?(patch_status : patch_status option) ?(patch : patch option) ()
: effective_patch = { patch_status; patch; 
}

let make_disassociate_ops_item_related_item_response  ()
: disassociate_ops_item_related_item_response =
()

let make_disassociate_ops_item_related_item_request 
  ~(association_id : string) ~(ops_item_id : string) ()
: disassociate_ops_item_related_item_request = {
  association_id; ops_item_id;  }

let make_describe_sessions_response 
  ?(next_token : string option) ?(sessions : session list option) ()
: describe_sessions_response = { next_token; sessions; 
}

let make_describe_sessions_request 
  ?(filters : session_filter list option)
  ?(next_token : string option)
  ?(max_results : int option)
  ~(state : session_state)
  () : describe_sessions_request = {
  filters; next_token; max_results; state; 
}

let make_describe_patch_properties_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(patch_set : patch_set option)
  ~(property : patch_property)
  ~(operating_system : operating_system)
  () : describe_patch_properties_request = {
  next_token; max_results; patch_set; property; operating_system; 
}

let make_describe_patch_groups_request 
  ?(next_token : string option)
  ?(filters : patch_orchestrator_filter list option)
  ?(max_results : int option)
  () : describe_patch_groups_request = { next_token; filters; max_results; 
}

let make_describe_patch_group_state_request  ~(patch_group : string) ()
: describe_patch_group_state_request = { patch_group; 
}

let make_describe_patch_baselines_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : patch_orchestrator_filter list option)
  () : describe_patch_baselines_request = {
  next_token; max_results; filters;  }

let make_describe_parameters_request 
  ?(shared : bool option)
  ?(next_token : string option)
  ?(max_results : int option)
  ?(parameter_filters : parameter_string_filter list option)
  ?(filters : parameters_filter list option)
  () : describe_parameters_request = {
  shared; next_token; max_results; parameter_filters; filters; 
}

let make_describe_ops_items_response 
  ?(ops_item_summaries : ops_item_summary list option)
  ?(next_token : string option)
  () : describe_ops_items_response = { ops_item_summaries; next_token; 
}

let make_describe_ops_items_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(ops_item_filters : ops_item_filter list option)
  () : describe_ops_items_request = {
  next_token; max_results; ops_item_filters; 
}

let make_describe_maintenance_windows_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : maintenance_window_filter list option)
  () : describe_maintenance_windows_request = {
  next_token; max_results; filters; 
}

let make_describe_maintenance_windows_for_target_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(resource_type : maintenance_window_resource_type)
  ~(targets : target list)
  () : describe_maintenance_windows_for_target_request = {
  next_token; max_results; resource_type; targets; 
}

let make_describe_maintenance_window_tasks_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : maintenance_window_filter list option)
  ~(window_id : string)
  () : describe_maintenance_window_tasks_request = {
  next_token; max_results; filters; window_id; 
}

let make_describe_maintenance_window_targets_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : maintenance_window_filter list option)
  ~(window_id : string)
  () : describe_maintenance_window_targets_request = {
  next_token; max_results; filters; window_id; 
}

let make_describe_maintenance_window_schedule_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : patch_orchestrator_filter list option)
  ?(resource_type : maintenance_window_resource_type option)
  ?(targets : target list option)
  ?(window_id : string option)
  () : describe_maintenance_window_schedule_request = {
  next_token; max_results; filters; resource_type; targets; window_id; 
}

let make_describe_maintenance_window_executions_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : maintenance_window_filter list option)
  ~(window_id : string)
  () : describe_maintenance_window_executions_request = {
  next_token; max_results; filters; window_id; 
}

let make_describe_maintenance_window_execution_tasks_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : maintenance_window_filter list option)
  ~(window_execution_id : string)
  () : describe_maintenance_window_execution_tasks_request = {
  next_token; max_results; filters; window_execution_id; 
}

let make_describe_maintenance_window_execution_task_invocations_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : maintenance_window_filter list option)
  ~(task_id : string)
  ~(window_execution_id : string)
  () : describe_maintenance_window_execution_task_invocations_request = {
  next_token; max_results; filters; task_id; window_execution_id; 
}

let make_describe_inventory_deletions_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(deletion_id : string option)
  () : describe_inventory_deletions_request = {
  max_results; next_token; deletion_id; 
}

let make_describe_instance_properties_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters_with_operator : instance_property_string_filter list option)
  ?(instance_property_filter_list : instance_property_filter list option)
  () : describe_instance_properties_request = {
  next_token;
  max_results;
  filters_with_operator;
  instance_property_filter_list;
   }

let make_describe_instance_patches_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(filters : patch_orchestrator_filter list option)
  ~(instance_id : string)
  () : describe_instance_patches_request = {
  max_results; next_token; filters; instance_id; 
}

let make_describe_instance_patch_states_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(instance_ids : string list)
  () : describe_instance_patch_states_request = {
  max_results; next_token; instance_ids; 
}

let make_describe_instance_patch_states_for_patch_group_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(filters : instance_patch_state_filter list option)
  ~(patch_group : string)
  () : describe_instance_patch_states_for_patch_group_request = {
  max_results; next_token; filters; patch_group; 
}

let make_describe_instance_information_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : instance_information_string_filter list option)
  ?(instance_information_filter_list : instance_information_filter list option)
  () : describe_instance_information_request = {
  next_token; max_results; filters; instance_information_filter_list; 
}

let make_describe_instance_associations_status_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(instance_id : string)
  () : describe_instance_associations_status_request = {
  next_token; max_results; instance_id; 
}

let make_describe_effective_patches_for_patch_baseline_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(baseline_id : string)
  () : describe_effective_patches_for_patch_baseline_request = {
  next_token; max_results; baseline_id; 
}

let make_describe_effective_instance_associations_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(instance_id : string)
  () : describe_effective_instance_associations_request = {
  next_token; max_results; instance_id;  }

let make_describe_document_request 
  ?(version_name : string option)
  ?(document_version : string option)
  ~(name : string)
  () : describe_document_request = { version_name; document_version; name; 
}

let make_account_sharing_info 
  ?(shared_document_version : string option) ?(account_id : string option) ()
: account_sharing_info = { shared_document_version; account_id; 
}

let make_describe_document_permission_response 
  ?(next_token : string option)
  ?(account_sharing_info_list : account_sharing_info list option)
  ?(account_ids : string list option)
  () : describe_document_permission_response = {
  next_token; account_sharing_info_list; account_ids; 
}

let make_describe_document_permission_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(permission_type : document_permission_type)
  ~(name : string)
  () : describe_document_permission_request = {
  next_token; max_results; permission_type; name; 
}

let make_describe_available_patches_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : patch_orchestrator_filter list option)
  () : describe_available_patches_request = {
  next_token; max_results; filters; 
}

let make_describe_automation_step_executions_request 
  ?(reverse_order : bool option)
  ?(max_results : int option)
  ?(next_token : string option)
  ?(filters : step_execution_filter list option)
  ~(automation_execution_id : string)
  () : describe_automation_step_executions_request = {
  reverse_order; max_results; next_token; filters; automation_execution_id; 
}

let make_automation_execution_metadata 
  ?(change_request_name : string option)
  ?(association_id : string option)
  ?(ops_item_id : string option)
  ?(runbooks : runbook list option)
  ?(scheduled_time : float option)
  ?(automation_subtype : automation_subtype option)
  ?(triggered_alarms : alarm_state_information list option)
  ?(alarm_configuration : alarm_configuration option)
  ?(automation_type : automation_type option)
  ?(target : string option)
  ?(max_errors : string option)
  ?(max_concurrency : string option)
  ?(resolved_targets : resolved_targets option)
  ?(target_maps : (string * string list) list list option)
  ?(targets : target list option)
  ?(target_parameter_name : string option)
  ?(failure_message : string option)
  ?(current_action : string option)
  ?(current_step_name : string option)
  ?(parent_automation_execution_id : string option)
  ?(mode : execution_mode option)
  ?(outputs : (string * string list) list option)
  ?(log_file : string option)
  ?(executed_by : string option)
  ?(execution_end_time : float option)
  ?(execution_start_time : float option)
  ?(automation_execution_status : automation_execution_status option)
  ?(document_version : string option)
  ?(document_name : string option)
  ?(automation_execution_id : string option)
  () : automation_execution_metadata = {
  change_request_name;
  association_id;
  ops_item_id;
  runbooks;
  scheduled_time;
  automation_subtype;
  triggered_alarms;
  alarm_configuration;
  automation_type;
  target;
  max_errors;
  max_concurrency;
  resolved_targets;
  target_maps;
  targets;
  target_parameter_name;
  failure_message;
  current_action;
  current_step_name;
  parent_automation_execution_id;
  mode;
  outputs;
  log_file;
  executed_by;
  execution_end_time;
  execution_start_time;
  automation_execution_status;
  document_version;
  document_name;
  automation_execution_id;
   }

let make_automation_execution_filter 
  ~(values : string list) ~(key : automation_execution_filter_key) ()
: automation_execution_filter = { values; key; 
}

let make_describe_automation_executions_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : automation_execution_filter list option)
  () : describe_automation_executions_request = {
  next_token; max_results; filters;  }

let make_describe_association_request 
  ?(association_version : string option)
  ?(association_id : string option)
  ?(instance_id : string option)
  ?(name : string option)
  () : describe_association_request = {
  association_version; association_id; instance_id; name; 
}

let make_association_execution 
  ?(triggered_alarms : alarm_state_information list option)
  ?(alarm_configuration : alarm_configuration option)
  ?(resource_count_by_status : string option)
  ?(last_execution_date : float option)
  ?(created_time : float option)
  ?(detailed_status : string option)
  ?(status : string option)
  ?(execution_id : string option)
  ?(association_version : string option)
  ?(association_id : string option)
  () : association_execution = {
  triggered_alarms;
  alarm_configuration;
  resource_count_by_status;
  last_execution_date;
  created_time;
  detailed_status;
  status;
  execution_id;
  association_version;
  association_id;
   }

let make_association_execution_filter 
  ~(type_ : association_filter_operator_type)
  ~(value : string)
  ~(key : association_execution_filter_key)
  () : association_execution_filter = { type_; value; key; 
}

let make_describe_association_executions_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : association_execution_filter list option)
  ~(association_id : string)
  () : describe_association_executions_request = {
  next_token; max_results; filters; association_id; 
}

let make_association_execution_target 
  ?(output_source : output_source option)
  ?(last_execution_date : float option)
  ?(detailed_status : string option)
  ?(status : string option)
  ?(resource_type : string option)
  ?(resource_id : string option)
  ?(execution_id : string option)
  ?(association_version : string option)
  ?(association_id : string option)
  () : association_execution_target = {
  output_source;
  last_execution_date;
  detailed_status;
  status;
  resource_type;
  resource_id;
  execution_id;
  association_version;
  association_id;
   }

let make_association_execution_targets_filter 
  ~(value : string) ~(key : association_execution_targets_filter_key) ()
: association_execution_targets_filter = { value; key; 
}

let make_describe_association_execution_targets_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : association_execution_targets_filter list option)
  ~(execution_id : string)
  ~(association_id : string)
  () : describe_association_execution_targets_request = {
  next_token; max_results; filters; execution_id; association_id; 
}

let make_activation 
  ?(tags : tag list option)
  ?(created_date : float option)
  ?(expired : bool option)
  ?(expiration_date : float option)
  ?(registrations_count : int option)
  ?(registration_limit : int option)
  ?(iam_role : string option)
  ?(default_instance_name : string option)
  ?(description : string option)
  ?(activation_id : string option)
  () : activation = {
  tags;
  created_date;
  expired;
  expiration_date;
  registrations_count;
  registration_limit;
  iam_role;
  default_instance_name;
  description;
  activation_id;
   }

let make_describe_activations_filter 
  ?(filter_values : string list option)
  ?(filter_key : describe_activations_filter_keys option)
  () : describe_activations_filter = { filter_values; filter_key; 
}

let make_describe_activations_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filters : describe_activations_filter list option)
  () : describe_activations_request = { next_token; max_results; filters; 
}

let make_deregister_task_from_maintenance_window_request 
  ~(window_task_id : string) ~(window_id : string) ()
: deregister_task_from_maintenance_window_request = {
  window_task_id; window_id; 
}

let make_deregister_target_from_maintenance_window_request 
  ?(safe : bool option) ~(window_target_id : string) ~(window_id : string) ()
: deregister_target_from_maintenance_window_request = {
  safe; window_target_id; window_id; 
}

let make_deregister_patch_baseline_for_patch_group_request 
  ~(patch_group : string) ~(baseline_id : string) ()
: deregister_patch_baseline_for_patch_group_request = {
  patch_group; baseline_id;  }

let make_deregister_managed_instance_request  ~(instance_id : string) ()
: deregister_managed_instance_request = { instance_id; 
}

let make_delete_resource_policy_response  ()
: delete_resource_policy_response =
()

let make_delete_resource_policy_request 
  ~(policy_hash : string) ~(policy_id : string) ~(resource_arn : string) ()
: delete_resource_policy_request = { policy_hash; policy_id; resource_arn; 
}

let make_delete_resource_data_sync_request 
  ?(sync_type : string option) ~(sync_name : string) ()
: delete_resource_data_sync_request = { sync_type; sync_name; 
}

let make_delete_patch_baseline_request  ~(baseline_id : string) ()
: delete_patch_baseline_request = { baseline_id; 
}

let make_delete_parameters_request  ~(names : string list) ()
: delete_parameters_request = { names;  }

let make_delete_parameter_request  ~(name : string) ()
: delete_parameter_request = { name;  }

let make_delete_ops_metadata_request  ~(ops_metadata_arn : string) ()
: delete_ops_metadata_request = { ops_metadata_arn; 
}

let make_delete_ops_item_response  () : delete_ops_item_response =
()

let make_delete_ops_item_request  ~(ops_item_id : string) ()
: delete_ops_item_request = { ops_item_id; 
}

let make_delete_maintenance_window_request  ~(window_id : string) ()
: delete_maintenance_window_request = { window_id; 
}

let make_delete_inventory_request 
  ?(client_token : string option)
  ?(dry_run : bool option)
  ?(schema_delete_option : inventory_schema_delete_option option)
  ~(type_name : string)
  () : delete_inventory_request = {
  client_token; dry_run; schema_delete_option; type_name; 
}

let make_delete_document_request 
  ?(force : bool option)
  ?(version_name : string option)
  ?(document_version : string option)
  ~(name : string)
  () : delete_document_request = {
  force; version_name; document_version; name; 
}

let make_delete_association_request 
  ?(association_id : string option)
  ?(instance_id : string option)
  ?(name : string option)
  () : delete_association_request = { association_id; instance_id; name; 
}

let make_delete_activation_request  ~(activation_id : string) ()
: delete_activation_request = { activation_id; 
}

let make_create_resource_data_sync_request 
  ?(sync_source : resource_data_sync_source option)
  ?(sync_type : string option)
  ?(s3_destination : resource_data_sync_s3_destination option)
  ~(sync_name : string)
  () : create_resource_data_sync_request = {
  sync_source; sync_type; s3_destination; sync_name; 
}

let make_create_patch_baseline_request 
  ?(tags : tag list option)
  ?(client_token : string option)
  ?(sources : patch_source list option)
  ?(description : string option)
  ?(rejected_patches_action : patch_action option)
  ?(rejected_patches : string list option)
  ?(approved_patches_enable_non_security : bool option)
  ?(approved_patches_compliance_level : patch_compliance_level option)
  ?(approved_patches : string list option)
  ?(approval_rules : patch_rule_group option)
  ?(global_filters : patch_filter_group option)
  ?(operating_system : operating_system option)
  ~(name : string)
  () : create_patch_baseline_request = {
  tags;
  client_token;
  sources;
  description;
  rejected_patches_action;
  rejected_patches;
  approved_patches_enable_non_security;
  approved_patches_compliance_level;
  approved_patches;
  approval_rules;
  global_filters;
  name;
  operating_system;
   }

let make_create_ops_metadata_request 
  ?(tags : tag list option)
  ?(metadata : (string * metadata_value) list option)
  ~(resource_id : string)
  () : create_ops_metadata_request = { tags; metadata; resource_id; 
}

let make_create_ops_item_response 
  ?(ops_item_arn : string option) ?(ops_item_id : string option) ()
: create_ops_item_response = { ops_item_arn; ops_item_id; 
}

let make_create_ops_item_request 
  ?(account_id : string option)
  ?(planned_end_time : float option)
  ?(planned_start_time : float option)
  ?(actual_end_time : float option)
  ?(actual_start_time : float option)
  ?(severity : string option)
  ?(category : string option)
  ?(tags : tag list option)
  ?(related_ops_items : related_ops_item list option)
  ?(priority : int option)
  ?(notifications : ops_item_notification list option)
  ?(operational_data : (string * ops_item_data_value) list option)
  ?(ops_item_type : string option)
  ~(title : string)
  ~(source : string)
  ~(description : string)
  () : create_ops_item_request = {
  account_id;
  planned_end_time;
  planned_start_time;
  actual_end_time;
  actual_start_time;
  severity;
  category;
  tags;
  title;
  source;
  related_ops_items;
  priority;
  notifications;
  operational_data;
  ops_item_type;
  description;
   }

let make_create_maintenance_window_request 
  ?(tags : tag list option)
  ?(client_token : string option)
  ?(schedule_offset : int option)
  ?(schedule_timezone : string option)
  ?(end_date : string option)
  ?(start_date : string option)
  ?(description : string option)
  ~(allow_unassociated_targets : bool)
  ~(cutoff : int)
  ~(duration : int)
  ~(schedule : string)
  ~(name : string)
  () : create_maintenance_window_request = {
  tags;
  client_token;
  allow_unassociated_targets;
  cutoff;
  duration;
  schedule_offset;
  schedule_timezone;
  schedule;
  end_date;
  start_date;
  description;
  name;
   }

let make_create_document_request 
  ?(tags : tag list option)
  ?(target_type : string option)
  ?(document_format : document_format option)
  ?(document_type : document_type option)
  ?(version_name : string option)
  ?(display_name : string option)
  ?(attachments : attachments_source list option)
  ?(requires : document_requires list option)
  ~(name : string)
  ~(content : string)
  () : create_document_request = {
  tags;
  target_type;
  document_format;
  document_type;
  version_name;
  display_name;
  name;
  attachments;
  requires;
  content;
   }

let make_create_association_request 
  ?(alarm_configuration : alarm_configuration option)
  ?(tags : tag list option)
  ?(target_maps : (string * string list) list list option)
  ?(duration : int option)
  ?(schedule_offset : int option)
  ?(target_locations : target_location list option)
  ?(calendar_names : string list option)
  ?(apply_only_at_cron_interval : bool option)
  ?(sync_compliance : association_sync_compliance option)
  ?(compliance_severity : association_compliance_severity option)
  ?(max_concurrency : string option)
  ?(max_errors : string option)
  ?(automation_target_parameter_name : string option)
  ?(association_name : string option)
  ?(output_location : instance_association_output_location option)
  ?(schedule_expression : string option)
  ?(targets : target list option)
  ?(parameters : (string * string list) list option)
  ?(instance_id : string option)
  ?(document_version : string option)
  ~(name : string)
  () : create_association_request = {
  alarm_configuration;
  tags;
  target_maps;
  duration;
  schedule_offset;
  target_locations;
  calendar_names;
  apply_only_at_cron_interval;
  sync_compliance;
  compliance_severity;
  max_concurrency;
  max_errors;
  automation_target_parameter_name;
  association_name;
  output_location;
  schedule_expression;
  targets;
  parameters;
  instance_id;
  document_version;
  name;
   }

let make_create_association_batch_request 
  ~(entries : create_association_batch_request_entry list) ()
: create_association_batch_request = { entries; 
}

let make_create_activation_request 
  ?(registration_metadata : registration_metadata_item list option)
  ?(tags : tag list option)
  ?(expiration_date : float option)
  ?(registration_limit : int option)
  ?(default_instance_name : string option)
  ?(description : string option)
  ~(iam_role : string)
  () : create_activation_request = {
  registration_metadata;
  tags;
  expiration_date;
  registration_limit;
  iam_role;
  default_instance_name;
  description;
   }

let make_cancel_maintenance_window_execution_request 
  ~(window_execution_id : string) ()
: cancel_maintenance_window_execution_request = { window_execution_id; 
}

let make_cancel_command_request 
  ?(instance_ids : string list option) ~(command_id : string) ()
: cancel_command_request = { instance_ids; command_id; 
}

let make_associate_ops_item_related_item_response 
  ?(association_id : string option) ()
: associate_ops_item_related_item_response = { association_id; 
}

let make_associate_ops_item_related_item_request 
  ~(resource_uri : string)
  ~(resource_type : string)
  ~(association_type : string)
  ~(ops_item_id : string)
  () : associate_ops_item_related_item_request = {
  resource_uri; resource_type; association_type; ops_item_id; 
}

let make_add_tags_to_resource_request 
  ~(tags : tag list)
  ~(resource_id : string)
  ~(resource_type : resource_type_for_tagging)
  () : add_tags_to_resource_request = { tags; resource_id; resource_type; 
}

