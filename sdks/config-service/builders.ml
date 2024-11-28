[@@@warning "-39"]
open Types
let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_request = { tag_keys; resource_arn; 
}

let make_aggregate_resource_identifier 
  ?(resource_name : string option)
  ~(resource_type : resource_type)
  ~(resource_id : string)
  ~(source_region : string)
  ~(source_account_id : string)
  () : aggregate_resource_identifier = {
  resource_name;
  resource_type;
  resource_id;
  source_region;
  source_account_id;
   }

let make_time_window 
  ?(end_time : float option) ?(start_time : float option) () : time_window =
{ end_time; start_time;  }

let make_template_ssm_document_details 
  ?(document_version : string option) ~(document_name : string) ()
: template_ssm_document_details = { document_version; document_name; 
}

let make_tag  ?(value : string option) ?(key : string option) () : tag = {
  value; key;  }

let make_tag_resource_request  ~(tags : tag list) ~(resource_arn : string) ()
: tag_resource_request = { tags; resource_arn; 
}

let make_stored_query_metadata 
  ?(description : string option)
  ~(query_name : string)
  ~(query_arn : string)
  ~(query_id : string)
  () : stored_query_metadata = {
  description; query_name; query_arn; query_id;  }

let make_stored_query 
  ?(expression : string option)
  ?(description : string option)
  ?(query_arn : string option)
  ?(query_id : string option)
  ~(query_name : string)
  () : stored_query = {
  expression; description; query_name; query_arn; query_id; 
}

let make_stop_configuration_recorder_request 
  ~(configuration_recorder_name : string) ()
: stop_configuration_recorder_request = { configuration_recorder_name; 
}

let make_status_detail_filters 
  ?(member_account_rule_status : member_account_rule_status option)
  ?(account_id : string option)
  () : status_detail_filters = { member_account_rule_status; account_id; 
}

let make_static_value  ~(values : string list) () : static_value = { 
values;  }

let make_start_resource_evaluation_response 
  ?(resource_evaluation_id : string option) ()
: start_resource_evaluation_response = { resource_evaluation_id; 
}

let make_resource_details 
  ?(resource_configuration_schema_type : resource_configuration_schema_type option)
  ~(resource_configuration : string)
  ~(resource_type : string)
  ~(resource_id : string)
  () : resource_details = {
  resource_configuration_schema_type;
  resource_configuration;
  resource_type;
  resource_id;
   }

let make_evaluation_context 
  ?(evaluation_context_identifier : string option) () : evaluation_context =
{ evaluation_context_identifier; 
}

let make_start_resource_evaluation_request 
  ?(client_token : string option)
  ?(evaluation_timeout : int option)
  ?(evaluation_context : evaluation_context option)
  ~(evaluation_mode : evaluation_mode)
  ~(resource_details : resource_details)
  () : start_resource_evaluation_request = {
  client_token;
  evaluation_timeout;
  evaluation_mode;
  evaluation_context;
  resource_details;
   }

let make_resource_key 
  ~(resource_id : string) ~(resource_type : resource_type) () : resource_key
= { resource_id; resource_type; 
}

let make_start_remediation_execution_response 
  ?(failed_items : resource_key list option)
  ?(failure_message : string option)
  () : start_remediation_execution_response = {
  failed_items; failure_message; 
}

let make_start_remediation_execution_request 
  ~(resource_keys : resource_key list) ~(config_rule_name : string) ()
: start_remediation_execution_request = { resource_keys; config_rule_name; 
}

let make_start_configuration_recorder_request 
  ~(configuration_recorder_name : string) ()
: start_configuration_recorder_request = { configuration_recorder_name; 
}

let make_start_config_rules_evaluation_response  ()
: start_config_rules_evaluation_response =
()

let make_start_config_rules_evaluation_request 
  ?(config_rule_names : string list option) ()
: start_config_rules_evaluation_request = { config_rule_names; 
}

let make_field_info  ?(name : string option) () : field_info = { name; 
}

let make_query_info  ?(select_fields : field_info list option) ()
: query_info = { select_fields;  }

let make_select_resource_config_response 
  ?(next_token : string option)
  ?(query_info : query_info option)
  ?(results : string list option)
  () : select_resource_config_response = { next_token; query_info; results; 
}

let make_select_resource_config_request 
  ?(next_token : string option)
  ?(limit : int option)
  ~(expression : string)
  () : select_resource_config_request = { next_token; limit; expression; 
}

let make_select_aggregate_resource_config_response 
  ?(next_token : string option)
  ?(query_info : query_info option)
  ?(results : string list option)
  () : select_aggregate_resource_config_response = {
  next_token; query_info; results; 
}

let make_select_aggregate_resource_config_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(limit : int option)
  ~(configuration_aggregator_name : string)
  ~(expression : string)
  () : select_aggregate_resource_config_request = {
  next_token; max_results; limit; configuration_aggregator_name; expression; 
}

let make_put_stored_query_response  ?(query_arn : string option) ()
: put_stored_query_response = { query_arn; 
}

let make_put_stored_query_request 
  ?(tags : tag list option) ~(stored_query : stored_query) ()
: put_stored_query_request = { tags; stored_query; 
}

let make_retention_configuration 
  ~(retention_period_in_days : int) ~(name : string) ()
: retention_configuration = { retention_period_in_days; name; 
}

let make_put_retention_configuration_response 
  ?(retention_configuration : retention_configuration option) ()
: put_retention_configuration_response = { retention_configuration; 
}

let make_put_retention_configuration_request 
  ~(retention_period_in_days : int) () : put_retention_configuration_request
= { retention_period_in_days;  }

let make_put_resource_config_request 
  ?(tags : (string * string) list option)
  ?(resource_name : string option)
  ~(configuration : string)
  ~(resource_id : string)
  ~(schema_version_id : string)
  ~(resource_type : string)
  () : put_resource_config_request = {
  tags;
  configuration;
  resource_name;
  resource_id;
  schema_version_id;
  resource_type;
   }

let make_remediation_exception 
  ?(expiration_time : float option)
  ?(message : string option)
  ~(resource_id : string)
  ~(resource_type : string)
  ~(config_rule_name : string)
  () : remediation_exception = {
  expiration_time; message; resource_id; resource_type; config_rule_name; 
}

let make_failed_remediation_exception_batch 
  ?(failed_items : remediation_exception list option)
  ?(failure_message : string option)
  () : failed_remediation_exception_batch = { failed_items; failure_message; 
}

let make_put_remediation_exceptions_response 
  ?(failed_batches : failed_remediation_exception_batch list option) ()
: put_remediation_exceptions_response = { failed_batches; 
}

let make_remediation_exception_resource_key 
  ?(resource_id : string option) ?(resource_type : string option) ()
: remediation_exception_resource_key = { resource_id; resource_type; 
}

let make_put_remediation_exceptions_request 
  ?(expiration_time : float option)
  ?(message : string option)
  ~(resource_keys : remediation_exception_resource_key list)
  ~(config_rule_name : string)
  () : put_remediation_exceptions_request = {
  expiration_time; message; resource_keys; config_rule_name; 
}

let make_resource_value  ~(value : resource_value_type) () : resource_value =
{ value;  }

let make_remediation_parameter_value 
  ?(static_value : static_value option)
  ?(resource_value : resource_value option)
  () : remediation_parameter_value = { static_value; resource_value; 
}

let make_ssm_controls 
  ?(error_percentage : int option)
  ?(concurrent_execution_rate_percentage : int option)
  () : ssm_controls = {
  error_percentage; concurrent_execution_rate_percentage; 
}

let make_execution_controls  ?(ssm_controls : ssm_controls option) ()
: execution_controls = { ssm_controls;  }

let make_remediation_configuration 
  ?(created_by_service : string option)
  ?(arn : string option)
  ?(retry_attempt_seconds : int option)
  ?(maximum_automatic_attempts : int option)
  ?(execution_controls : execution_controls option)
  ?(automatic : bool option)
  ?(resource_type : string option)
  ?(parameters : (string * remediation_parameter_value) list option)
  ?(target_version : string option)
  ~(target_id : string)
  ~(target_type : remediation_target_type)
  ~(config_rule_name : string)
  () : remediation_configuration = {
  created_by_service;
  arn;
  retry_attempt_seconds;
  maximum_automatic_attempts;
  execution_controls;
  automatic;
  resource_type;
  parameters;
  target_version;
  target_id;
  target_type;
  config_rule_name;
   }

let make_failed_remediation_batch 
  ?(failed_items : remediation_configuration list option)
  ?(failure_message : string option)
  () : failed_remediation_batch = { failed_items; failure_message; 
}

let make_put_remediation_configurations_response 
  ?(failed_batches : failed_remediation_batch list option) ()
: put_remediation_configurations_response = { failed_batches; 
}

let make_put_remediation_configurations_request 
  ~(remediation_configurations : remediation_configuration list) ()
: put_remediation_configurations_request = { remediation_configurations; 
}

let make_put_organization_conformance_pack_response 
  ?(organization_conformance_pack_arn : string option) ()
: put_organization_conformance_pack_response = {
  organization_conformance_pack_arn; 
}

let make_conformance_pack_input_parameter 
  ~(parameter_value : string) ~(parameter_name : string) ()
: conformance_pack_input_parameter = { parameter_value; parameter_name; 
}

let make_put_organization_conformance_pack_request 
  ?(excluded_accounts : string list option)
  ?(conformance_pack_input_parameters : conformance_pack_input_parameter list option)
  ?(delivery_s3_key_prefix : string option)
  ?(delivery_s3_bucket : string option)
  ?(template_body : string option)
  ?(template_s3_uri : string option)
  ~(organization_conformance_pack_name : string)
  () : put_organization_conformance_pack_request = {
  excluded_accounts;
  conformance_pack_input_parameters;
  delivery_s3_key_prefix;
  delivery_s3_bucket;
  template_body;
  template_s3_uri;
  organization_conformance_pack_name;
   }

let make_put_organization_config_rule_response 
  ?(organization_config_rule_arn : string option) ()
: put_organization_config_rule_response = { organization_config_rule_arn; 
}

let make_organization_managed_rule_metadata 
  ?(tag_value_scope : string option)
  ?(tag_key_scope : string option)
  ?(resource_id_scope : string option)
  ?(resource_types_scope : string list option)
  ?(maximum_execution_frequency : maximum_execution_frequency option)
  ?(input_parameters : string option)
  ?(description : string option)
  ~(rule_identifier : string)
  () : organization_managed_rule_metadata = {
  tag_value_scope;
  tag_key_scope;
  resource_id_scope;
  resource_types_scope;
  maximum_execution_frequency;
  input_parameters;
  rule_identifier;
  description;
   }

let make_organization_custom_rule_metadata 
  ?(tag_value_scope : string option)
  ?(tag_key_scope : string option)
  ?(resource_id_scope : string option)
  ?(resource_types_scope : string list option)
  ?(maximum_execution_frequency : maximum_execution_frequency option)
  ?(input_parameters : string option)
  ?(description : string option)
  ~(organization_config_rule_trigger_types : organization_config_rule_trigger_type list)
  ~(lambda_function_arn : string)
  () : organization_custom_rule_metadata = {
  tag_value_scope;
  tag_key_scope;
  resource_id_scope;
  resource_types_scope;
  maximum_execution_frequency;
  input_parameters;
  organization_config_rule_trigger_types;
  lambda_function_arn;
  description;
   }

let make_organization_custom_policy_rule_metadata 
  ?(debug_log_delivery_accounts : string list option)
  ?(tag_value_scope : string option)
  ?(tag_key_scope : string option)
  ?(resource_id_scope : string option)
  ?(resource_types_scope : string list option)
  ?(maximum_execution_frequency : maximum_execution_frequency option)
  ?(input_parameters : string option)
  ?(organization_config_rule_trigger_types : organization_config_rule_trigger_type_no_s_n list option)
  ?(description : string option)
  ~(policy_text : string)
  ~(policy_runtime : string)
  () : organization_custom_policy_rule_metadata = {
  debug_log_delivery_accounts;
  policy_text;
  policy_runtime;
  tag_value_scope;
  tag_key_scope;
  resource_id_scope;
  resource_types_scope;
  maximum_execution_frequency;
  input_parameters;
  organization_config_rule_trigger_types;
  description;
   }

let make_put_organization_config_rule_request 
  ?(organization_custom_policy_rule_metadata : organization_custom_policy_rule_metadata option)
  ?(excluded_accounts : string list option)
  ?(organization_custom_rule_metadata : organization_custom_rule_metadata option)
  ?(organization_managed_rule_metadata : organization_managed_rule_metadata option)
  ~(organization_config_rule_name : string)
  () : put_organization_config_rule_request = {
  organization_custom_policy_rule_metadata;
  excluded_accounts;
  organization_custom_rule_metadata;
  organization_managed_rule_metadata;
  organization_config_rule_name;
   }

let make_put_external_evaluation_response  ()
: put_external_evaluation_response = ()

let make_external_evaluation 
  ?(annotation : string option)
  ~(ordering_timestamp : float)
  ~(compliance_type : compliance_type)
  ~(compliance_resource_id : string)
  ~(compliance_resource_type : string)
  () : external_evaluation = {
  ordering_timestamp;
  annotation;
  compliance_type;
  compliance_resource_id;
  compliance_resource_type;
   }

let make_put_external_evaluation_request 
  ~(external_evaluation : external_evaluation)
  ~(config_rule_name : string)
  () : put_external_evaluation_request = {
  external_evaluation; config_rule_name;  }

let make_evaluation 
  ?(annotation : string option)
  ~(ordering_timestamp : float)
  ~(compliance_type : compliance_type)
  ~(compliance_resource_id : string)
  ~(compliance_resource_type : string)
  () : evaluation = {
  ordering_timestamp;
  annotation;
  compliance_type;
  compliance_resource_id;
  compliance_resource_type;
   }

let make_put_evaluations_response 
  ?(failed_evaluations : evaluation list option) ()
: put_evaluations_response = { failed_evaluations; 
}

let make_put_evaluations_request 
  ?(test_mode : bool option)
  ?(evaluations : evaluation list option)
  ~(result_token : string)
  () : put_evaluations_request = { test_mode; result_token; evaluations; 
}

let make_config_snapshot_delivery_properties 
  ?(delivery_frequency : maximum_execution_frequency option) ()
: config_snapshot_delivery_properties = { delivery_frequency; 
}

let make_delivery_channel 
  ?(config_snapshot_delivery_properties : config_snapshot_delivery_properties option)
  ?(sns_topic_ar_n : string option)
  ?(s3_kms_key_arn : string option)
  ?(s3_key_prefix : string option)
  ?(s3_bucket_name : string option)
  ?(name : string option)
  () : delivery_channel = {
  config_snapshot_delivery_properties;
  sns_topic_ar_n;
  s3_kms_key_arn;
  s3_key_prefix;
  s3_bucket_name;
  name;
   }

let make_put_delivery_channel_request 
  ~(delivery_channel : delivery_channel) () : put_delivery_channel_request =
{ delivery_channel;  }

let make_put_conformance_pack_response 
  ?(conformance_pack_arn : string option) () : put_conformance_pack_response
= { conformance_pack_arn;  }

let make_put_conformance_pack_request 
  ?(template_ssm_document_details : template_ssm_document_details option)
  ?(conformance_pack_input_parameters : conformance_pack_input_parameter list option)
  ?(delivery_s3_key_prefix : string option)
  ?(delivery_s3_bucket : string option)
  ?(template_body : string option)
  ?(template_s3_uri : string option)
  ~(conformance_pack_name : string)
  () : put_conformance_pack_request = {
  template_ssm_document_details;
  conformance_pack_input_parameters;
  delivery_s3_key_prefix;
  delivery_s3_bucket;
  template_body;
  template_s3_uri;
  conformance_pack_name;
   }

let make_exclusion_by_resource_types 
  ?(resource_types : resource_type list option) ()
: exclusion_by_resource_types = { resource_types; 
}

let make_recording_strategy  ?(use_only : recording_strategy_type option) ()
: recording_strategy = { use_only;  }

let make_recording_group 
  ?(recording_strategy : recording_strategy option)
  ?(exclusion_by_resource_types : exclusion_by_resource_types option)
  ?(resource_types : resource_type list option)
  ?(include_global_resource_types : bool option)
  ?(all_supported : bool option)
  () : recording_group = {
  recording_strategy;
  exclusion_by_resource_types;
  resource_types;
  include_global_resource_types;
  all_supported;
   }

let make_recording_mode_override 
  ?(description : string option)
  ~(recording_frequency : recording_frequency)
  ~(resource_types : resource_type list)
  () : recording_mode_override = {
  recording_frequency; resource_types; description; 
}

let make_recording_mode 
  ?(recording_mode_overrides : recording_mode_override list option)
  ~(recording_frequency : recording_frequency)
  () : recording_mode = { recording_mode_overrides; recording_frequency; 
}

let make_configuration_recorder 
  ?(recording_mode : recording_mode option)
  ?(recording_group : recording_group option)
  ?(role_ar_n : string option)
  ?(name : string option)
  () : configuration_recorder = {
  recording_mode; recording_group; role_ar_n; name; 
}

let make_put_configuration_recorder_request 
  ~(configuration_recorder : configuration_recorder) ()
: put_configuration_recorder_request = { configuration_recorder; 
}

let make_account_aggregation_source 
  ?(aws_regions : string list option)
  ?(all_aws_regions : bool option)
  ~(account_ids : string list)
  () : account_aggregation_source = {
  aws_regions; all_aws_regions; account_ids; 
}

let make_organization_aggregation_source 
  ?(all_aws_regions : bool option)
  ?(aws_regions : string list option)
  ~(role_arn : string)
  () : organization_aggregation_source = {
  all_aws_regions; aws_regions; role_arn; 
}

let make_configuration_aggregator 
  ?(created_by : string option)
  ?(last_updated_time : float option)
  ?(creation_time : float option)
  ?(organization_aggregation_source : organization_aggregation_source option)
  ?(account_aggregation_sources : account_aggregation_source list option)
  ?(configuration_aggregator_arn : string option)
  ?(configuration_aggregator_name : string option)
  () : configuration_aggregator = {
  created_by;
  last_updated_time;
  creation_time;
  organization_aggregation_source;
  account_aggregation_sources;
  configuration_aggregator_arn;
  configuration_aggregator_name;
   }

let make_put_configuration_aggregator_response 
  ?(configuration_aggregator : configuration_aggregator option) ()
: put_configuration_aggregator_response = { configuration_aggregator; 
}

let make_put_configuration_aggregator_request 
  ?(tags : tag list option)
  ?(organization_aggregation_source : organization_aggregation_source option)
  ?(account_aggregation_sources : account_aggregation_source list option)
  ~(configuration_aggregator_name : string)
  () : put_configuration_aggregator_request = {
  tags;
  organization_aggregation_source;
  account_aggregation_sources;
  configuration_aggregator_name;
   }

let make_scope 
  ?(compliance_resource_id : string option)
  ?(tag_value : string option)
  ?(tag_key : string option)
  ?(compliance_resource_types : string list option)
  () : scope = {
  compliance_resource_id; tag_value; tag_key; compliance_resource_types; 
}

let make_source_detail 
  ?(maximum_execution_frequency : maximum_execution_frequency option)
  ?(message_type : message_type option)
  ?(event_source : event_source option)
  () : source_detail = {
  maximum_execution_frequency; message_type; event_source; 
}

let make_custom_policy_details 
  ?(enable_debug_log_delivery : bool option)
  ~(policy_text : string)
  ~(policy_runtime : string)
  () : custom_policy_details = {
  enable_debug_log_delivery; policy_text; policy_runtime;  }

let make_source 
  ?(custom_policy_details : custom_policy_details option)
  ?(source_details : source_detail list option)
  ?(source_identifier : string option)
  ~(owner : owner)
  () : source = {
  custom_policy_details; source_details; source_identifier; owner; 
}

let make_evaluation_mode_configuration  ?(mode : evaluation_mode option) ()
: evaluation_mode_configuration = { mode;  }

let make_config_rule 
  ?(evaluation_modes : evaluation_mode_configuration list option)
  ?(created_by : string option)
  ?(config_rule_state : config_rule_state option)
  ?(maximum_execution_frequency : maximum_execution_frequency option)
  ?(input_parameters : string option)
  ?(scope : scope option)
  ?(description : string option)
  ?(config_rule_id : string option)
  ?(config_rule_arn : string option)
  ?(config_rule_name : string option)
  ~(source : source)
  () : config_rule = {
  evaluation_modes;
  created_by;
  config_rule_state;
  maximum_execution_frequency;
  input_parameters;
  source;
  scope;
  description;
  config_rule_id;
  config_rule_arn;
  config_rule_name;
   }

let make_put_config_rule_request 
  ?(tags : tag list option) ~(config_rule : config_rule) ()
: put_config_rule_request = { tags; config_rule; 
}

let make_aggregation_authorization 
  ?(creation_time : float option)
  ?(authorized_aws_region : string option)
  ?(authorized_account_id : string option)
  ?(aggregation_authorization_arn : string option)
  () : aggregation_authorization = {
  creation_time;
  authorized_aws_region;
  authorized_account_id;
  aggregation_authorization_arn;
   }

let make_put_aggregation_authorization_response 
  ?(aggregation_authorization : aggregation_authorization option) ()
: put_aggregation_authorization_response = { aggregation_authorization; 
}

let make_put_aggregation_authorization_request 
  ?(tags : tag list option)
  ~(authorized_aws_region : string)
  ~(authorized_account_id : string)
  () : put_aggregation_authorization_request = {
  tags; authorized_aws_region; authorized_account_id; 
}

let make_list_tags_for_resource_response 
  ?(next_token : string option) ?(tags : tag list option) ()
: list_tags_for_resource_response = { next_token; tags; 
}

let make_list_tags_for_resource_request 
  ?(next_token : string option)
  ?(limit : int option)
  ~(resource_arn : string)
  () : list_tags_for_resource_request = { next_token; limit; resource_arn; 
}

let make_list_stored_queries_response 
  ?(next_token : string option)
  ?(stored_query_metadata : stored_query_metadata list option)
  () : list_stored_queries_response = { next_token; stored_query_metadata; 
}

let make_list_stored_queries_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_stored_queries_request = { max_results; next_token; 
}

let make_resource_evaluation 
  ?(evaluation_start_timestamp : float option)
  ?(evaluation_mode : evaluation_mode option)
  ?(resource_evaluation_id : string option)
  () : resource_evaluation = {
  evaluation_start_timestamp; evaluation_mode; resource_evaluation_id; 
}

let make_list_resource_evaluations_response 
  ?(next_token : string option)
  ?(resource_evaluations : resource_evaluation list option)
  () : list_resource_evaluations_response = {
  next_token; resource_evaluations;  }

let make_resource_evaluation_filters 
  ?(evaluation_context_identifier : string option)
  ?(time_window : time_window option)
  ?(evaluation_mode : evaluation_mode option)
  () : resource_evaluation_filters = {
  evaluation_context_identifier; time_window; evaluation_mode; 
}

let make_list_resource_evaluations_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(filters : resource_evaluation_filters option)
  () : list_resource_evaluations_request = { next_token; limit; filters; 
}

let make_resource_identifier 
  ?(resource_deletion_time : float option)
  ?(resource_name : string option)
  ?(resource_id : string option)
  ?(resource_type : resource_type option)
  () : resource_identifier = {
  resource_deletion_time; resource_name; resource_id; resource_type; 
}

let make_list_discovered_resources_response 
  ?(next_token : string option)
  ?(resource_identifiers : resource_identifier list option)
  () : list_discovered_resources_response = {
  next_token; resource_identifiers; 
}

let make_list_discovered_resources_request 
  ?(next_token : string option)
  ?(include_deleted_resources : bool option)
  ?(limit : int option)
  ?(resource_name : string option)
  ?(resource_ids : string list option)
  ~(resource_type : resource_type)
  () : list_discovered_resources_request = {
  next_token;
  include_deleted_resources;
  limit;
  resource_name;
  resource_ids;
  resource_type;
   }

let make_conformance_pack_compliance_score 
  ?(last_updated_time : float option)
  ?(conformance_pack_name : string option)
  ?(score : string option)
  () : conformance_pack_compliance_score = {
  last_updated_time; conformance_pack_name; score; 
}

let make_list_conformance_pack_compliance_scores_response 
  ?(next_token : string option)
  ~(conformance_pack_compliance_scores : conformance_pack_compliance_score list)
  () : list_conformance_pack_compliance_scores_response = {
  conformance_pack_compliance_scores; next_token; 
}

let make_conformance_pack_compliance_scores_filters 
  ~(conformance_pack_names : string list) ()
: conformance_pack_compliance_scores_filters = { conformance_pack_names; 
}

let make_list_conformance_pack_compliance_scores_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(sort_by : sort_by option)
  ?(sort_order : sort_order option)
  ?(filters : conformance_pack_compliance_scores_filters option)
  () : list_conformance_pack_compliance_scores_request = {
  next_token; limit; sort_by; sort_order; filters; 
}

let make_list_aggregate_discovered_resources_response 
  ?(next_token : string option)
  ?(resource_identifiers : aggregate_resource_identifier list option)
  () : list_aggregate_discovered_resources_response = {
  next_token; resource_identifiers;  }

let make_resource_filters 
  ?(region : string option)
  ?(resource_name : string option)
  ?(resource_id : string option)
  ?(account_id : string option)
  () : resource_filters = { region; resource_name; resource_id; account_id; 
}

let make_list_aggregate_discovered_resources_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(filters : resource_filters option)
  ~(resource_type : resource_type)
  ~(configuration_aggregator_name : string)
  () : list_aggregate_discovered_resources_request = {
  next_token; limit; filters; resource_type; configuration_aggregator_name; 
}

let make_get_stored_query_response  ?(stored_query : stored_query option) ()
: get_stored_query_response = { stored_query; 
}

let make_get_stored_query_request  ~(query_name : string) ()
: get_stored_query_request = { query_name;  }

let make_evaluation_status 
  ?(failure_reason : string option) ~(status : resource_evaluation_status) ()
: evaluation_status = { failure_reason; status; 
}

let make_get_resource_evaluation_summary_response 
  ?(resource_details : resource_details option)
  ?(evaluation_context : evaluation_context option)
  ?(compliance : compliance_type option)
  ?(evaluation_start_timestamp : float option)
  ?(evaluation_status : evaluation_status option)
  ?(evaluation_mode : evaluation_mode option)
  ?(resource_evaluation_id : string option)
  () : get_resource_evaluation_summary_response = {
  resource_details;
  evaluation_context;
  compliance;
  evaluation_start_timestamp;
  evaluation_status;
  evaluation_mode;
  resource_evaluation_id;
   }

let make_get_resource_evaluation_summary_request 
  ~(resource_evaluation_id : string) ()
: get_resource_evaluation_summary_request = { resource_evaluation_id; 
}

let make_relationship 
  ?(relationship_name : string option)
  ?(resource_name : string option)
  ?(resource_id : string option)
  ?(resource_type : resource_type option)
  () : relationship = {
  relationship_name; resource_name; resource_id; resource_type; 
}

let make_configuration_item 
  ?(configuration_item_delivery_time : float option)
  ?(recording_frequency : recording_frequency option)
  ?(supplementary_configuration : (string * string) list option)
  ?(configuration : string option)
  ?(relationships : relationship list option)
  ?(related_events : string list option)
  ?(tags : (string * string) list option)
  ?(resource_creation_time : float option)
  ?(availability_zone : string option)
  ?(aws_region : string option)
  ?(resource_name : string option)
  ?(resource_id : string option)
  ?(resource_type : resource_type option)
  ?(arn : string option)
  ?(configuration_item_md5_hash : string option)
  ?(configuration_state_id : string option)
  ?(configuration_item_status : configuration_item_status option)
  ?(configuration_item_capture_time : float option)
  ?(account_id : string option)
  ?(version : string option)
  () : configuration_item = {
  configuration_item_delivery_time;
  recording_frequency;
  supplementary_configuration;
  configuration;
  relationships;
  related_events;
  tags;
  resource_creation_time;
  availability_zone;
  aws_region;
  resource_name;
  resource_id;
  resource_type;
  arn;
  configuration_item_md5_hash;
  configuration_state_id;
  configuration_item_status;
  configuration_item_capture_time;
  account_id;
  version;
   }

let make_get_resource_config_history_response 
  ?(next_token : string option)
  ?(configuration_items : configuration_item list option)
  () : get_resource_config_history_response = {
  next_token; configuration_items; 
}

let make_get_resource_config_history_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(chronological_order : chronological_order option)
  ?(earlier_time : float option)
  ?(later_time : float option)
  ~(resource_id : string)
  ~(resource_type : resource_type)
  () : get_resource_config_history_request = {
  next_token;
  limit;
  chronological_order;
  earlier_time;
  later_time;
  resource_id;
  resource_type;
   }

let make_get_organization_custom_rule_policy_response 
  ?(policy_text : string option) ()
: get_organization_custom_rule_policy_response = { policy_text; 
}

let make_get_organization_custom_rule_policy_request 
  ~(organization_config_rule_name : string) ()
: get_organization_custom_rule_policy_request = {
  organization_config_rule_name; 
}

let make_organization_conformance_pack_detailed_status 
  ?(last_update_time : float option)
  ?(error_message : string option)
  ?(error_code : string option)
  ~(status : organization_resource_detailed_status)
  ~(conformance_pack_name : string)
  ~(account_id : string)
  () : organization_conformance_pack_detailed_status = {
  last_update_time;
  error_message;
  error_code;
  status;
  conformance_pack_name;
  account_id;
   }

let make_get_organization_conformance_pack_detailed_status_response 
  ?(next_token : string option)
  ?(organization_conformance_pack_detailed_statuses : organization_conformance_pack_detailed_status list option)
  () : get_organization_conformance_pack_detailed_status_response = {
  next_token; organization_conformance_pack_detailed_statuses; 
}

let make_organization_resource_detailed_status_filters 
  ?(status : organization_resource_detailed_status option)
  ?(account_id : string option)
  () : organization_resource_detailed_status_filters = { status; account_id; 
}

let make_get_organization_conformance_pack_detailed_status_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(filters : organization_resource_detailed_status_filters option)
  ~(organization_conformance_pack_name : string)
  () : get_organization_conformance_pack_detailed_status_request = {
  next_token; limit; filters; organization_conformance_pack_name; 
}

let make_member_account_status 
  ?(last_update_time : float option)
  ?(error_message : string option)
  ?(error_code : string option)
  ~(member_account_rule_status : member_account_rule_status)
  ~(config_rule_name : string)
  ~(account_id : string)
  () : member_account_status = {
  last_update_time;
  error_message;
  error_code;
  member_account_rule_status;
  config_rule_name;
  account_id;
   }

let make_get_organization_config_rule_detailed_status_response 
  ?(next_token : string option)
  ?(organization_config_rule_detailed_status : member_account_status list option)
  () : get_organization_config_rule_detailed_status_response = {
  next_token; organization_config_rule_detailed_status; 
}

let make_get_organization_config_rule_detailed_status_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(filters : status_detail_filters option)
  ~(organization_config_rule_name : string)
  () : get_organization_config_rule_detailed_status_request = {
  next_token; limit; filters; organization_config_rule_name; 
}

let make_resource_count 
  ?(count : int option) ?(resource_type : resource_type option) ()
: resource_count = { count; resource_type; 
}

let make_get_discovered_resource_counts_response 
  ?(next_token : string option)
  ?(resource_counts : resource_count list option)
  ?(total_discovered_resources : int option)
  () : get_discovered_resource_counts_response = {
  next_token; resource_counts; total_discovered_resources; 
}

let make_get_discovered_resource_counts_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(resource_types : string list option)
  () : get_discovered_resource_counts_request = {
  next_token; limit; resource_types; 
}

let make_get_custom_rule_policy_response  ?(policy_text : string option) ()
: get_custom_rule_policy_response = { policy_text; 
}

let make_get_custom_rule_policy_request 
  ?(config_rule_name : string option) () : get_custom_rule_policy_request = {
  config_rule_name;  }

let make_conformance_pack_compliance_summary 
  ~(conformance_pack_compliance_status : conformance_pack_compliance_type)
  ~(conformance_pack_name : string)
  () : conformance_pack_compliance_summary = {
  conformance_pack_compliance_status; conformance_pack_name; 
}

let make_get_conformance_pack_compliance_summary_response 
  ?(next_token : string option)
  ?(conformance_pack_compliance_summary_list : conformance_pack_compliance_summary list option)
  () : get_conformance_pack_compliance_summary_response = {
  next_token; conformance_pack_compliance_summary_list; 
}

let make_get_conformance_pack_compliance_summary_request 
  ?(next_token : string option)
  ?(limit : int option)
  ~(conformance_pack_names : string list)
  () : get_conformance_pack_compliance_summary_request = {
  next_token; limit; conformance_pack_names; 
}

let make_evaluation_result_qualifier 
  ?(evaluation_mode : evaluation_mode option)
  ?(resource_id : string option)
  ?(resource_type : string option)
  ?(config_rule_name : string option)
  () : evaluation_result_qualifier = {
  evaluation_mode; resource_id; resource_type; config_rule_name; 
}

let make_evaluation_result_identifier 
  ?(resource_evaluation_id : string option)
  ?(ordering_timestamp : float option)
  ?(evaluation_result_qualifier : evaluation_result_qualifier option)
  () : evaluation_result_identifier = {
  resource_evaluation_id; ordering_timestamp; evaluation_result_qualifier; 
}

let make_get_conformance_pack_compliance_details_response 
  ?(next_token : string option)
  ?(conformance_pack_rule_evaluation_results : conformance_pack_evaluation_result list option)
  ~(conformance_pack_name : string)
  () : get_conformance_pack_compliance_details_response = {
  next_token;
  conformance_pack_rule_evaluation_results;
  conformance_pack_name;
   }

let make_conformance_pack_evaluation_filters 
  ?(resource_ids : string list option)
  ?(resource_type : string option)
  ?(compliance_type : conformance_pack_compliance_type option)
  ?(config_rule_names : string list option)
  () : conformance_pack_evaluation_filters = {
  resource_ids; resource_type; compliance_type; config_rule_names; 
}

let make_get_conformance_pack_compliance_details_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(filters : conformance_pack_evaluation_filters option)
  ~(conformance_pack_name : string)
  () : get_conformance_pack_compliance_details_request = {
  next_token; limit; filters; conformance_pack_name; 
}

let make_compliance_contributor_count 
  ?(cap_exceeded : bool option) ?(capped_count : int option) ()
: compliance_contributor_count = { cap_exceeded; capped_count; 
}

let make_compliance_summary 
  ?(compliance_summary_timestamp : float option)
  ?(non_compliant_resource_count : compliance_contributor_count option)
  ?(compliant_resource_count : compliance_contributor_count option)
  () : compliance_summary = {
  compliance_summary_timestamp;
  non_compliant_resource_count;
  compliant_resource_count;
   }

let make_compliance_summary_by_resource_type 
  ?(compliance_summary : compliance_summary option)
  ?(resource_type : string option)
  () : compliance_summary_by_resource_type = {
  compliance_summary; resource_type; 
}

let make_get_compliance_summary_by_resource_type_response 
  ?(compliance_summaries_by_resource_type : compliance_summary_by_resource_type list option)
  () : get_compliance_summary_by_resource_type_response = {
  compliance_summaries_by_resource_type; 
}

let make_get_compliance_summary_by_resource_type_request 
  ?(resource_types : string list option) ()
: get_compliance_summary_by_resource_type_request = { resource_types; 
}

let make_get_compliance_summary_by_config_rule_response 
  ?(compliance_summary : compliance_summary option) ()
: get_compliance_summary_by_config_rule_response = { compliance_summary; 
}

let make_get_compliance_details_by_resource_response 
  ?(next_token : string option)
  ?(evaluation_results : evaluation_result list option)
  () : get_compliance_details_by_resource_response = {
  next_token; evaluation_results; 
}

let make_get_compliance_details_by_resource_request 
  ?(resource_evaluation_id : string option)
  ?(next_token : string option)
  ?(compliance_types : compliance_type list option)
  ?(resource_id : string option)
  ?(resource_type : string option)
  () : get_compliance_details_by_resource_request = {
  resource_evaluation_id;
  next_token;
  compliance_types;
  resource_id;
  resource_type;
   }

let make_get_compliance_details_by_config_rule_response 
  ?(next_token : string option)
  ?(evaluation_results : evaluation_result list option)
  () : get_compliance_details_by_config_rule_response = {
  next_token; evaluation_results; 
}

let make_get_compliance_details_by_config_rule_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(compliance_types : compliance_type list option)
  ~(config_rule_name : string)
  () : get_compliance_details_by_config_rule_request = {
  next_token; limit; compliance_types; config_rule_name; 
}

let make_get_aggregate_resource_config_response 
  ?(configuration_item : configuration_item option) ()
: get_aggregate_resource_config_response = { configuration_item; 
}

let make_get_aggregate_resource_config_request 
  ~(resource_identifier : aggregate_resource_identifier)
  ~(configuration_aggregator_name : string)
  () : get_aggregate_resource_config_request = {
  resource_identifier; configuration_aggregator_name; 
}

let make_grouped_resource_count 
  ~(resource_count : int) ~(group_name : string) () : grouped_resource_count
= { resource_count; group_name; 
}

let make_get_aggregate_discovered_resource_counts_response 
  ?(next_token : string option)
  ?(grouped_resource_counts : grouped_resource_count list option)
  ?(group_by_key : string option)
  ~(total_discovered_resources : int)
  () : get_aggregate_discovered_resource_counts_response = {
  next_token;
  grouped_resource_counts;
  group_by_key;
  total_discovered_resources;
   }

let make_resource_count_filters 
  ?(region : string option)
  ?(account_id : string option)
  ?(resource_type : resource_type option)
  () : resource_count_filters = { region; account_id; resource_type; 
}

let make_get_aggregate_discovered_resource_counts_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(group_by_key : resource_count_group_key option)
  ?(filters : resource_count_filters option)
  ~(configuration_aggregator_name : string)
  () : get_aggregate_discovered_resource_counts_request = {
  next_token; limit; group_by_key; filters; configuration_aggregator_name; 
}

let make_aggregate_conformance_pack_compliance_count 
  ?(non_compliant_conformance_pack_count : int option)
  ?(compliant_conformance_pack_count : int option)
  () : aggregate_conformance_pack_compliance_count = {
  non_compliant_conformance_pack_count; compliant_conformance_pack_count; 
}

let make_aggregate_conformance_pack_compliance_summary 
  ?(group_name : string option)
  ?(compliance_summary : aggregate_conformance_pack_compliance_count option)
  () : aggregate_conformance_pack_compliance_summary = {
  group_name; compliance_summary; 
}

let make_get_aggregate_conformance_pack_compliance_summary_response 
  ?(next_token : string option)
  ?(group_by_key : string option)
  ?(aggregate_conformance_pack_compliance_summaries : aggregate_conformance_pack_compliance_summary list option)
  () : get_aggregate_conformance_pack_compliance_summary_response = {
  next_token; group_by_key; aggregate_conformance_pack_compliance_summaries; 
}

let make_aggregate_conformance_pack_compliance_summary_filters 
  ?(aws_region : string option) ?(account_id : string option) ()
: aggregate_conformance_pack_compliance_summary_filters = {
  aws_region; account_id; 
}

let make_get_aggregate_conformance_pack_compliance_summary_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(group_by_key : aggregate_conformance_pack_compliance_summary_group_key option)
  ?(filters : aggregate_conformance_pack_compliance_summary_filters option)
  ~(configuration_aggregator_name : string)
  () : get_aggregate_conformance_pack_compliance_summary_request = {
  next_token; limit; group_by_key; filters; configuration_aggregator_name; 
}

let make_aggregate_compliance_count 
  ?(compliance_summary : compliance_summary option)
  ?(group_name : string option)
  () : aggregate_compliance_count = { compliance_summary; group_name; 
}

let make_get_aggregate_config_rule_compliance_summary_response 
  ?(next_token : string option)
  ?(aggregate_compliance_counts : aggregate_compliance_count list option)
  ?(group_by_key : string option)
  () : get_aggregate_config_rule_compliance_summary_response = {
  next_token; aggregate_compliance_counts; group_by_key; 
}

let make_config_rule_compliance_summary_filters 
  ?(aws_region : string option) ?(account_id : string option) ()
: config_rule_compliance_summary_filters = { aws_region; account_id; 
}

let make_get_aggregate_config_rule_compliance_summary_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(group_by_key : config_rule_compliance_summary_group_key option)
  ?(filters : config_rule_compliance_summary_filters option)
  ~(configuration_aggregator_name : string)
  () : get_aggregate_config_rule_compliance_summary_request = {
  next_token; limit; group_by_key; filters; configuration_aggregator_name; 
}

let make_get_aggregate_compliance_details_by_config_rule_response 
  ?(next_token : string option)
  ?(aggregate_evaluation_results : aggregate_evaluation_result list option)
  () : get_aggregate_compliance_details_by_config_rule_response = {
  next_token; aggregate_evaluation_results; 
}

let make_get_aggregate_compliance_details_by_config_rule_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(compliance_type : compliance_type option)
  ~(aws_region : string)
  ~(account_id : string)
  ~(config_rule_name : string)
  ~(configuration_aggregator_name : string)
  () : get_aggregate_compliance_details_by_config_rule_request = {
  next_token;
  limit;
  compliance_type;
  aws_region;
  account_id;
  config_rule_name;
  configuration_aggregator_name;
   }

let make_describe_retention_configurations_response 
  ?(next_token : string option)
  ?(retention_configurations : retention_configuration list option)
  () : describe_retention_configurations_response = {
  next_token; retention_configurations; 
}

let make_describe_retention_configurations_request 
  ?(next_token : string option)
  ?(retention_configuration_names : string list option)
  () : describe_retention_configurations_request = {
  next_token; retention_configuration_names; 
}

let make_remediation_execution_step 
  ?(stop_time : float option)
  ?(start_time : float option)
  ?(error_message : string option)
  ?(state : remediation_execution_step_state option)
  ?(name : string option)
  () : remediation_execution_step = {
  stop_time; start_time; error_message; state; name; 
}

let make_remediation_execution_status 
  ?(last_updated_time : float option)
  ?(invocation_time : float option)
  ?(step_details : remediation_execution_step list option)
  ?(state : remediation_execution_state option)
  ?(resource_key : resource_key option)
  () : remediation_execution_status = {
  last_updated_time; invocation_time; step_details; state; resource_key; 
}

let make_describe_remediation_execution_status_response 
  ?(next_token : string option)
  ?(remediation_execution_statuses : remediation_execution_status list option)
  () : describe_remediation_execution_status_response = {
  next_token; remediation_execution_statuses; 
}

let make_describe_remediation_execution_status_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(resource_keys : resource_key list option)
  ~(config_rule_name : string)
  () : describe_remediation_execution_status_request = {
  next_token; limit; resource_keys; config_rule_name; 
}

let make_describe_remediation_exceptions_response 
  ?(next_token : string option)
  ?(remediation_exceptions : remediation_exception list option)
  () : describe_remediation_exceptions_response = {
  next_token; remediation_exceptions; 
}

let make_describe_remediation_exceptions_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(resource_keys : remediation_exception_resource_key list option)
  ~(config_rule_name : string)
  () : describe_remediation_exceptions_request = {
  next_token; limit; resource_keys; config_rule_name; 
}

let make_describe_remediation_configurations_response 
  ?(remediation_configurations : remediation_configuration list option) ()
: describe_remediation_configurations_response = {
  remediation_configurations; 
}

let make_describe_remediation_configurations_request 
  ~(config_rule_names : string list) ()
: describe_remediation_configurations_request = { config_rule_names; 
}

let make_pending_aggregation_request 
  ?(requester_aws_region : string option)
  ?(requester_account_id : string option)
  () : pending_aggregation_request = {
  requester_aws_region; requester_account_id; 
}

let make_describe_pending_aggregation_requests_response 
  ?(next_token : string option)
  ?(pending_aggregation_requests : pending_aggregation_request list option)
  () : describe_pending_aggregation_requests_response = {
  next_token; pending_aggregation_requests; 
}

let make_describe_pending_aggregation_requests_request 
  ?(next_token : string option) ?(limit : int option) ()
: describe_pending_aggregation_requests_request = { next_token; limit; 
}

let make_organization_conformance_pack_status 
  ?(last_update_time : float option)
  ?(error_message : string option)
  ?(error_code : string option)
  ~(status : organization_resource_status)
  ~(organization_conformance_pack_name : string)
  () : organization_conformance_pack_status = {
  last_update_time;
  error_message;
  error_code;
  status;
  organization_conformance_pack_name;
   }

let make_describe_organization_conformance_pack_statuses_response 
  ?(next_token : string option)
  ?(organization_conformance_pack_statuses : organization_conformance_pack_status list option)
  () : describe_organization_conformance_pack_statuses_response = {
  next_token; organization_conformance_pack_statuses; 
}

let make_describe_organization_conformance_pack_statuses_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(organization_conformance_pack_names : string list option)
  () : describe_organization_conformance_pack_statuses_request = {
  next_token; limit; organization_conformance_pack_names; 
}

let make_organization_conformance_pack 
  ?(excluded_accounts : string list option)
  ?(conformance_pack_input_parameters : conformance_pack_input_parameter list option)
  ?(delivery_s3_key_prefix : string option)
  ?(delivery_s3_bucket : string option)
  ~(last_update_time : float)
  ~(organization_conformance_pack_arn : string)
  ~(organization_conformance_pack_name : string)
  () : organization_conformance_pack = {
  last_update_time;
  excluded_accounts;
  conformance_pack_input_parameters;
  delivery_s3_key_prefix;
  delivery_s3_bucket;
  organization_conformance_pack_arn;
  organization_conformance_pack_name;
   }

let make_describe_organization_conformance_packs_response 
  ?(next_token : string option)
  ?(organization_conformance_packs : organization_conformance_pack list option)
  () : describe_organization_conformance_packs_response = {
  next_token; organization_conformance_packs; 
}

let make_describe_organization_conformance_packs_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(organization_conformance_pack_names : string list option)
  () : describe_organization_conformance_packs_request = {
  next_token; limit; organization_conformance_pack_names; 
}

let make_organization_config_rule_status 
  ?(last_update_time : float option)
  ?(error_message : string option)
  ?(error_code : string option)
  ~(organization_rule_status : organization_rule_status)
  ~(organization_config_rule_name : string)
  () : organization_config_rule_status = {
  last_update_time;
  error_message;
  error_code;
  organization_rule_status;
  organization_config_rule_name;
   }

let make_describe_organization_config_rule_statuses_response 
  ?(next_token : string option)
  ?(organization_config_rule_statuses : organization_config_rule_status list option)
  () : describe_organization_config_rule_statuses_response = {
  next_token; organization_config_rule_statuses; 
}

let make_describe_organization_config_rule_statuses_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(organization_config_rule_names : string list option)
  () : describe_organization_config_rule_statuses_request = {
  next_token; limit; organization_config_rule_names; 
}

let make_organization_custom_policy_rule_metadata_no_policy 
  ?(debug_log_delivery_accounts : string list option)
  ?(policy_runtime : string option)
  ?(tag_value_scope : string option)
  ?(tag_key_scope : string option)
  ?(resource_id_scope : string option)
  ?(resource_types_scope : string list option)
  ?(maximum_execution_frequency : maximum_execution_frequency option)
  ?(input_parameters : string option)
  ?(organization_config_rule_trigger_types : organization_config_rule_trigger_type_no_s_n list option)
  ?(description : string option)
  () : organization_custom_policy_rule_metadata_no_policy = {
  debug_log_delivery_accounts;
  policy_runtime;
  tag_value_scope;
  tag_key_scope;
  resource_id_scope;
  resource_types_scope;
  maximum_execution_frequency;
  input_parameters;
  organization_config_rule_trigger_types;
  description;
   }

let make_organization_config_rule 
  ?(organization_custom_policy_rule_metadata : organization_custom_policy_rule_metadata_no_policy option)
  ?(last_update_time : float option)
  ?(excluded_accounts : string list option)
  ?(organization_custom_rule_metadata : organization_custom_rule_metadata option)
  ?(organization_managed_rule_metadata : organization_managed_rule_metadata option)
  ~(organization_config_rule_arn : string)
  ~(organization_config_rule_name : string)
  () : organization_config_rule = {
  organization_custom_policy_rule_metadata;
  last_update_time;
  excluded_accounts;
  organization_custom_rule_metadata;
  organization_managed_rule_metadata;
  organization_config_rule_arn;
  organization_config_rule_name;
   }

let make_describe_organization_config_rules_response 
  ?(next_token : string option)
  ?(organization_config_rules : organization_config_rule list option)
  () : describe_organization_config_rules_response = {
  next_token; organization_config_rules; 
}

let make_describe_organization_config_rules_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(organization_config_rule_names : string list option)
  () : describe_organization_config_rules_request = {
  next_token; limit; organization_config_rule_names; 
}

let make_config_export_delivery_info 
  ?(next_delivery_time : float option)
  ?(last_successful_time : float option)
  ?(last_attempt_time : float option)
  ?(last_error_message : string option)
  ?(last_error_code : string option)
  ?(last_status : delivery_status option)
  () : config_export_delivery_info = {
  next_delivery_time;
  last_successful_time;
  last_attempt_time;
  last_error_message;
  last_error_code;
  last_status;
   }

let make_config_stream_delivery_info 
  ?(last_status_change_time : float option)
  ?(last_error_message : string option)
  ?(last_error_code : string option)
  ?(last_status : delivery_status option)
  () : config_stream_delivery_info = {
  last_status_change_time; last_error_message; last_error_code; last_status; 
}

let make_delivery_channel_status 
  ?(config_stream_delivery_info : config_stream_delivery_info option)
  ?(config_history_delivery_info : config_export_delivery_info option)
  ?(config_snapshot_delivery_info : config_export_delivery_info option)
  ?(name : string option)
  () : delivery_channel_status = {
  config_stream_delivery_info;
  config_history_delivery_info;
  config_snapshot_delivery_info;
  name;
   }

let make_describe_delivery_channel_status_response 
  ?(delivery_channels_status : delivery_channel_status list option) ()
: describe_delivery_channel_status_response = { delivery_channels_status; 
}

let make_describe_delivery_channel_status_request 
  ?(delivery_channel_names : string list option) ()
: describe_delivery_channel_status_request = { delivery_channel_names; 
}

let make_describe_delivery_channels_response 
  ?(delivery_channels : delivery_channel list option) ()
: describe_delivery_channels_response = { delivery_channels; 
}

let make_describe_delivery_channels_request 
  ?(delivery_channel_names : string list option) ()
: describe_delivery_channels_request = { delivery_channel_names; 
}

let make_conformance_pack_status_detail 
  ?(last_update_completed_time : float option)
  ?(conformance_pack_status_reason : string option)
  ~(last_update_requested_time : float)
  ~(stack_arn : string)
  ~(conformance_pack_state : conformance_pack_state)
  ~(conformance_pack_arn : string)
  ~(conformance_pack_id : string)
  ~(conformance_pack_name : string)
  () : conformance_pack_status_detail = {
  last_update_completed_time;
  last_update_requested_time;
  conformance_pack_status_reason;
  stack_arn;
  conformance_pack_state;
  conformance_pack_arn;
  conformance_pack_id;
  conformance_pack_name;
   }

let make_describe_conformance_pack_status_response 
  ?(next_token : string option)
  ?(conformance_pack_status_details : conformance_pack_status_detail list option)
  () : describe_conformance_pack_status_response = {
  next_token; conformance_pack_status_details; 
}

let make_describe_conformance_pack_status_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(conformance_pack_names : string list option)
  () : describe_conformance_pack_status_request = {
  next_token; limit; conformance_pack_names; 
}

let make_conformance_pack_detail 
  ?(template_ssm_document_details : template_ssm_document_details option)
  ?(created_by : string option)
  ?(last_update_requested_time : float option)
  ?(conformance_pack_input_parameters : conformance_pack_input_parameter list option)
  ?(delivery_s3_key_prefix : string option)
  ?(delivery_s3_bucket : string option)
  ~(conformance_pack_id : string)
  ~(conformance_pack_arn : string)
  ~(conformance_pack_name : string)
  () : conformance_pack_detail = {
  template_ssm_document_details;
  created_by;
  last_update_requested_time;
  conformance_pack_input_parameters;
  delivery_s3_key_prefix;
  delivery_s3_bucket;
  conformance_pack_id;
  conformance_pack_arn;
  conformance_pack_name;
   }

let make_describe_conformance_packs_response 
  ?(next_token : string option)
  ?(conformance_pack_details : conformance_pack_detail list option)
  () : describe_conformance_packs_response = {
  next_token; conformance_pack_details; 
}

let make_describe_conformance_packs_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(conformance_pack_names : string list option)
  () : describe_conformance_packs_request = {
  next_token; limit; conformance_pack_names; 
}

let make_conformance_pack_rule_compliance 
  ?(controls : string list option)
  ?(compliance_type : conformance_pack_compliance_type option)
  ?(config_rule_name : string option)
  () : conformance_pack_rule_compliance = {
  controls; compliance_type; config_rule_name; 
}

let make_describe_conformance_pack_compliance_response 
  ?(next_token : string option)
  ~(conformance_pack_rule_compliance_list : conformance_pack_rule_compliance list)
  ~(conformance_pack_name : string)
  () : describe_conformance_pack_compliance_response = {
  next_token; conformance_pack_rule_compliance_list; conformance_pack_name; 
}

let make_conformance_pack_compliance_filters 
  ?(compliance_type : conformance_pack_compliance_type option)
  ?(config_rule_names : string list option)
  () : conformance_pack_compliance_filters = {
  compliance_type; config_rule_names; 
}

let make_describe_conformance_pack_compliance_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(filters : conformance_pack_compliance_filters option)
  ~(conformance_pack_name : string)
  () : describe_conformance_pack_compliance_request = {
  next_token; limit; filters; conformance_pack_name; 
}

let make_configuration_recorder_status 
  ?(last_status_change_time : float option)
  ?(last_error_message : string option)
  ?(last_error_code : string option)
  ?(last_status : recorder_status option)
  ?(recording : bool option)
  ?(last_stop_time : float option)
  ?(last_start_time : float option)
  ?(name : string option)
  () : configuration_recorder_status = {
  last_status_change_time;
  last_error_message;
  last_error_code;
  last_status;
  recording;
  last_stop_time;
  last_start_time;
  name;
   }

let make_describe_configuration_recorder_status_response 
  ?(configuration_recorders_status : configuration_recorder_status list option)
  () : describe_configuration_recorder_status_response = {
  configuration_recorders_status; 
}

let make_describe_configuration_recorder_status_request 
  ?(configuration_recorder_names : string list option) ()
: describe_configuration_recorder_status_request = {
  configuration_recorder_names; 
}

let make_describe_configuration_recorders_response 
  ?(configuration_recorders : configuration_recorder list option) ()
: describe_configuration_recorders_response = { configuration_recorders; 
}

let make_describe_configuration_recorders_request 
  ?(configuration_recorder_names : string list option) ()
: describe_configuration_recorders_request = { configuration_recorder_names; 
}

let make_aggregated_source_status 
  ?(last_error_message : string option)
  ?(last_error_code : string option)
  ?(last_update_time : float option)
  ?(last_update_status : aggregated_source_status_type option)
  ?(aws_region : string option)
  ?(source_type : aggregated_source_type option)
  ?(source_id : string option)
  () : aggregated_source_status = {
  last_error_message;
  last_error_code;
  last_update_time;
  last_update_status;
  aws_region;
  source_type;
  source_id;
   }

let make_describe_configuration_aggregator_sources_status_response 
  ?(next_token : string option)
  ?(aggregated_source_status_list : aggregated_source_status list option)
  () : describe_configuration_aggregator_sources_status_response = {
  next_token; aggregated_source_status_list; 
}

let make_describe_configuration_aggregator_sources_status_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(update_status : aggregated_source_status_type list option)
  ~(configuration_aggregator_name : string)
  () : describe_configuration_aggregator_sources_status_request = {
  limit; next_token; update_status; configuration_aggregator_name; 
}

let make_describe_configuration_aggregators_response 
  ?(next_token : string option)
  ?(configuration_aggregators : configuration_aggregator list option)
  () : describe_configuration_aggregators_response = {
  next_token; configuration_aggregators; 
}

let make_describe_configuration_aggregators_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(configuration_aggregator_names : string list option)
  () : describe_configuration_aggregators_request = {
  limit; next_token; configuration_aggregator_names; 
}

let make_describe_config_rules_response 
  ?(next_token : string option) ?(config_rules : config_rule list option) ()
: describe_config_rules_response = { next_token; config_rules; 
}

let make_describe_config_rules_filters 
  ?(evaluation_mode : evaluation_mode option) ()
: describe_config_rules_filters = { evaluation_mode; 
}

let make_describe_config_rules_request 
  ?(filters : describe_config_rules_filters option)
  ?(next_token : string option)
  ?(config_rule_names : string list option)
  () : describe_config_rules_request = {
  filters; next_token; config_rule_names; 
}

let make_config_rule_evaluation_status 
  ?(last_debug_log_delivery_time : float option)
  ?(last_debug_log_delivery_status_reason : string option)
  ?(last_debug_log_delivery_status : string option)
  ?(first_evaluation_started : bool option)
  ?(last_error_message : string option)
  ?(last_error_code : string option)
  ?(last_deactivated_time : float option)
  ?(first_activated_time : float option)
  ?(last_failed_evaluation_time : float option)
  ?(last_successful_evaluation_time : float option)
  ?(last_failed_invocation_time : float option)
  ?(last_successful_invocation_time : float option)
  ?(config_rule_id : string option)
  ?(config_rule_arn : string option)
  ?(config_rule_name : string option)
  () : config_rule_evaluation_status = {
  last_debug_log_delivery_time;
  last_debug_log_delivery_status_reason;
  last_debug_log_delivery_status;
  first_evaluation_started;
  last_error_message;
  last_error_code;
  last_deactivated_time;
  first_activated_time;
  last_failed_evaluation_time;
  last_successful_evaluation_time;
  last_failed_invocation_time;
  last_successful_invocation_time;
  config_rule_id;
  config_rule_arn;
  config_rule_name;
   }

let make_describe_config_rule_evaluation_status_response 
  ?(next_token : string option)
  ?(config_rules_evaluation_status : config_rule_evaluation_status list option)
  () : describe_config_rule_evaluation_status_response = {
  next_token; config_rules_evaluation_status; 
}

let make_describe_config_rule_evaluation_status_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(config_rule_names : string list option)
  () : describe_config_rule_evaluation_status_request = {
  limit; next_token; config_rule_names;  }

let make_compliance 
  ?(compliance_contributor_count : compliance_contributor_count option)
  ?(compliance_type : compliance_type option)
  () : compliance = { compliance_contributor_count; compliance_type; 
}

let make_compliance_by_resource 
  ?(compliance : compliance option)
  ?(resource_id : string option)
  ?(resource_type : string option)
  () : compliance_by_resource = { compliance; resource_id; resource_type; 
}

let make_describe_compliance_by_resource_response 
  ?(next_token : string option)
  ?(compliance_by_resources : compliance_by_resource list option)
  () : describe_compliance_by_resource_response = {
  next_token; compliance_by_resources; 
}

let make_describe_compliance_by_resource_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(compliance_types : compliance_type list option)
  ?(resource_id : string option)
  ?(resource_type : string option)
  () : describe_compliance_by_resource_request = {
  next_token; limit; compliance_types; resource_id; resource_type; 
}

let make_compliance_by_config_rule 
  ?(compliance : compliance option) ?(config_rule_name : string option) ()
: compliance_by_config_rule = { compliance; config_rule_name; 
}

let make_describe_compliance_by_config_rule_response 
  ?(next_token : string option)
  ?(compliance_by_config_rules : compliance_by_config_rule list option)
  () : describe_compliance_by_config_rule_response = {
  next_token; compliance_by_config_rules; 
}

let make_describe_compliance_by_config_rule_request 
  ?(next_token : string option)
  ?(compliance_types : compliance_type list option)
  ?(config_rule_names : string list option)
  () : describe_compliance_by_config_rule_request = {
  next_token; compliance_types; config_rule_names; 
}

let make_describe_aggregation_authorizations_response 
  ?(next_token : string option)
  ?(aggregation_authorizations : aggregation_authorization list option)
  () : describe_aggregation_authorizations_response = {
  next_token; aggregation_authorizations; 
}

let make_describe_aggregation_authorizations_request 
  ?(next_token : string option) ?(limit : int option) ()
: describe_aggregation_authorizations_request = { next_token; limit; 
}

let make_aggregate_conformance_pack_compliance 
  ?(total_rule_count : int option)
  ?(non_compliant_rule_count : int option)
  ?(compliant_rule_count : int option)
  ?(compliance_type : conformance_pack_compliance_type option)
  () : aggregate_conformance_pack_compliance = {
  total_rule_count;
  non_compliant_rule_count;
  compliant_rule_count;
  compliance_type;
   }

let make_aggregate_compliance_by_conformance_pack 
  ?(aws_region : string option)
  ?(account_id : string option)
  ?(compliance : aggregate_conformance_pack_compliance option)
  ?(conformance_pack_name : string option)
  () : aggregate_compliance_by_conformance_pack = {
  aws_region; account_id; compliance; conformance_pack_name; 
}

let make_describe_aggregate_compliance_by_conformance_packs_response 
  ?(next_token : string option)
  ?(aggregate_compliance_by_conformance_packs : aggregate_compliance_by_conformance_pack list option)
  () : describe_aggregate_compliance_by_conformance_packs_response = {
  next_token; aggregate_compliance_by_conformance_packs; 
}

let make_aggregate_conformance_pack_compliance_filters 
  ?(aws_region : string option)
  ?(account_id : string option)
  ?(compliance_type : conformance_pack_compliance_type option)
  ?(conformance_pack_name : string option)
  () : aggregate_conformance_pack_compliance_filters = {
  aws_region; account_id; compliance_type; conformance_pack_name; 
}

let make_describe_aggregate_compliance_by_conformance_packs_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(filters : aggregate_conformance_pack_compliance_filters option)
  ~(configuration_aggregator_name : string)
  () : describe_aggregate_compliance_by_conformance_packs_request = {
  next_token; limit; filters; configuration_aggregator_name; 
}

let make_aggregate_compliance_by_config_rule 
  ?(aws_region : string option)
  ?(account_id : string option)
  ?(compliance : compliance option)
  ?(config_rule_name : string option)
  () : aggregate_compliance_by_config_rule = {
  aws_region; account_id; compliance; config_rule_name; 
}

let make_describe_aggregate_compliance_by_config_rules_response 
  ?(next_token : string option)
  ?(aggregate_compliance_by_config_rules : aggregate_compliance_by_config_rule list option)
  () : describe_aggregate_compliance_by_config_rules_response = {
  next_token; aggregate_compliance_by_config_rules; 
}

let make_config_rule_compliance_filters 
  ?(aws_region : string option)
  ?(account_id : string option)
  ?(compliance_type : compliance_type option)
  ?(config_rule_name : string option)
  () : config_rule_compliance_filters = {
  aws_region; account_id; compliance_type; config_rule_name; 
}

let make_describe_aggregate_compliance_by_config_rules_request 
  ?(next_token : string option)
  ?(limit : int option)
  ?(filters : config_rule_compliance_filters option)
  ~(configuration_aggregator_name : string)
  () : describe_aggregate_compliance_by_config_rules_request = {
  next_token; limit; filters; configuration_aggregator_name; 
}

let make_deliver_config_snapshot_response 
  ?(config_snapshot_id : string option) () : deliver_config_snapshot_response
= { config_snapshot_id;  }

let make_deliver_config_snapshot_request 
  ~(delivery_channel_name : string) () : deliver_config_snapshot_request = {
  delivery_channel_name;  }

let make_delete_stored_query_response  () : delete_stored_query_response =
()

let make_delete_stored_query_request  ~(query_name : string) ()
: delete_stored_query_request = { query_name; 
}

let make_delete_retention_configuration_request 
  ~(retention_configuration_name : string) ()
: delete_retention_configuration_request = { retention_configuration_name; 
}

let make_delete_resource_config_request 
  ~(resource_id : string) ~(resource_type : string) ()
: delete_resource_config_request = { resource_id; resource_type; 
}

let make_failed_delete_remediation_exceptions_batch 
  ?(failed_items : remediation_exception_resource_key list option)
  ?(failure_message : string option)
  () : failed_delete_remediation_exceptions_batch = {
  failed_items; failure_message; 
}

let make_delete_remediation_exceptions_response 
  ?(failed_batches : failed_delete_remediation_exceptions_batch list option)
  () : delete_remediation_exceptions_response = { failed_batches; 
}

let make_delete_remediation_exceptions_request 
  ~(resource_keys : remediation_exception_resource_key list)
  ~(config_rule_name : string)
  () : delete_remediation_exceptions_request = {
  resource_keys; config_rule_name; 
}

let make_delete_remediation_configuration_response  ()
: delete_remediation_configuration_response =
()

let make_delete_remediation_configuration_request 
  ?(resource_type : string option) ~(config_rule_name : string) ()
: delete_remediation_configuration_request = {
  resource_type; config_rule_name; 
}

let make_delete_pending_aggregation_request_request 
  ~(requester_aws_region : string) ~(requester_account_id : string) ()
: delete_pending_aggregation_request_request = {
  requester_aws_region; requester_account_id; 
}

let make_delete_organization_conformance_pack_request 
  ~(organization_conformance_pack_name : string) ()
: delete_organization_conformance_pack_request = {
  organization_conformance_pack_name; 
}

let make_delete_organization_config_rule_request 
  ~(organization_config_rule_name : string) ()
: delete_organization_config_rule_request = { organization_config_rule_name; 
}

let make_delete_evaluation_results_response  ()
: delete_evaluation_results_response =
()

let make_delete_evaluation_results_request  ~(config_rule_name : string) ()
: delete_evaluation_results_request = { config_rule_name; 
}

let make_delete_delivery_channel_request 
  ~(delivery_channel_name : string) () : delete_delivery_channel_request = {
  delivery_channel_name;  }

let make_delete_conformance_pack_request 
  ~(conformance_pack_name : string) () : delete_conformance_pack_request = {
  conformance_pack_name;  }

let make_delete_configuration_recorder_request 
  ~(configuration_recorder_name : string) ()
: delete_configuration_recorder_request = { configuration_recorder_name; 
}

let make_delete_configuration_aggregator_request 
  ~(configuration_aggregator_name : string) ()
: delete_configuration_aggregator_request = { configuration_aggregator_name; 
}

let make_delete_config_rule_request  ~(config_rule_name : string) ()
: delete_config_rule_request = { config_rule_name; 
}

let make_delete_aggregation_authorization_request 
  ~(authorized_aws_region : string) ~(authorized_account_id : string) ()
: delete_aggregation_authorization_request = {
  authorized_aws_region; authorized_account_id; 
}

let make_base_configuration_item 
  ?(configuration_item_delivery_time : float option)
  ?(recording_frequency : recording_frequency option)
  ?(supplementary_configuration : (string * string) list option)
  ?(configuration : string option)
  ?(resource_creation_time : float option)
  ?(availability_zone : string option)
  ?(aws_region : string option)
  ?(resource_name : string option)
  ?(resource_id : string option)
  ?(resource_type : resource_type option)
  ?(arn : string option)
  ?(configuration_state_id : string option)
  ?(configuration_item_status : configuration_item_status option)
  ?(configuration_item_capture_time : float option)
  ?(account_id : string option)
  ?(version : string option)
  () : base_configuration_item = {
  configuration_item_delivery_time;
  recording_frequency;
  supplementary_configuration;
  configuration;
  resource_creation_time;
  availability_zone;
  aws_region;
  resource_name;
  resource_id;
  resource_type;
  arn;
  configuration_state_id;
  configuration_item_status;
  configuration_item_capture_time;
  account_id;
  version;
   }

let make_batch_get_resource_config_response 
  ?(unprocessed_resource_keys : resource_key list option)
  ?(base_configuration_items : base_configuration_item list option)
  () : batch_get_resource_config_response = {
  unprocessed_resource_keys; base_configuration_items; 
}

let make_batch_get_resource_config_request 
  ~(resource_keys : resource_key list) () : batch_get_resource_config_request
= { resource_keys;  }

let make_batch_get_aggregate_resource_config_response 
  ?(unprocessed_resource_identifiers : aggregate_resource_identifier list option)
  ?(base_configuration_items : base_configuration_item list option)
  () : batch_get_aggregate_resource_config_response = {
  unprocessed_resource_identifiers; base_configuration_items; 
}

let make_batch_get_aggregate_resource_config_request 
  ~(resource_identifiers : aggregate_resource_identifier list)
  ~(configuration_aggregator_name : string)
  () : batch_get_aggregate_resource_config_request = {
  resource_identifiers; configuration_aggregator_name; 
}

