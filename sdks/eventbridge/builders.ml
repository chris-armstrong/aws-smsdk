[@@@warning "-39"]
open Types
let make_dead_letter_config  ?(arn : string option) () : dead_letter_config =
{ arn;  }

let make_update_event_bus_response 
  ?(dead_letter_config : dead_letter_config option)
  ?(description : string option)
  ?(kms_key_identifier : string option)
  ?(name : string option)
  ?(arn : string option)
  () : update_event_bus_response = {
  dead_letter_config; description; kms_key_identifier; name; arn; 
}

let make_update_event_bus_request 
  ?(dead_letter_config : dead_letter_config option)
  ?(description : string option)
  ?(kms_key_identifier : string option)
  ?(name : string option)
  () : update_event_bus_request = {
  dead_letter_config; description; kms_key_identifier; name; 
}

let make_primary  ~(health_check : string) () : primary = { health_check; 
}

let make_secondary  ~(route : string) () : secondary = { route; 
}

let make_failover_config  ~(secondary : secondary) ~(primary : primary) ()
: failover_config = { secondary; primary;  }

let make_routing_config  ~(failover_config : failover_config) ()
: routing_config = { failover_config;  }

let make_replication_config  ?(state : replication_state option) ()
: replication_config = { state;  }

let make_endpoint_event_bus  ~(event_bus_arn : string) ()
: endpoint_event_bus = { event_bus_arn;  }

let make_update_endpoint_response 
  ?(state : endpoint_state option)
  ?(endpoint_url : string option)
  ?(endpoint_id : string option)
  ?(role_arn : string option)
  ?(event_buses : endpoint_event_bus list option)
  ?(replication_config : replication_config option)
  ?(routing_config : routing_config option)
  ?(arn : string option)
  ?(name : string option)
  () : update_endpoint_response = {
  state;
  endpoint_url;
  endpoint_id;
  role_arn;
  event_buses;
  replication_config;
  routing_config;
  arn;
  name;
   }

let make_update_endpoint_request 
  ?(role_arn : string option)
  ?(event_buses : endpoint_event_bus list option)
  ?(replication_config : replication_config option)
  ?(routing_config : routing_config option)
  ?(description : string option)
  ~(name : string)
  () : update_endpoint_request = {
  role_arn;
  event_buses;
  replication_config;
  routing_config;
  description;
  name;
   }

let make_update_connection_response 
  ?(last_authorized_time : float option)
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(connection_state : connection_state option)
  ?(connection_arn : string option)
  () : update_connection_response = {
  last_authorized_time;
  last_modified_time;
  creation_time;
  connection_state;
  connection_arn;
   }

let make_update_connection_basic_auth_request_parameters 
  ?(password : string option) ?(username : string option) ()
: update_connection_basic_auth_request_parameters = { password; username; 
}

let make_update_connection_o_auth_client_request_parameters 
  ?(client_secret : string option) ?(client_i_d : string option) ()
: update_connection_o_auth_client_request_parameters = {
  client_secret; client_i_d;  }

let make_connection_header_parameter 
  ?(is_value_secret : bool option)
  ?(value : string option)
  ?(key : string option)
  () : connection_header_parameter = { is_value_secret; value; key; 
}

let make_connection_query_string_parameter 
  ?(is_value_secret : bool option)
  ?(value : string option)
  ?(key : string option)
  () : connection_query_string_parameter = { is_value_secret; value; key; 
}

let make_connection_body_parameter 
  ?(is_value_secret : bool option)
  ?(value : string option)
  ?(key : string option)
  () : connection_body_parameter = { is_value_secret; value; key; 
}

let make_connection_http_parameters 
  ?(body_parameters : connection_body_parameter list option)
  ?(query_string_parameters : connection_query_string_parameter list option)
  ?(header_parameters : connection_header_parameter list option)
  () : connection_http_parameters = {
  body_parameters; query_string_parameters; header_parameters; 
}

let make_update_connection_o_auth_request_parameters 
  ?(o_auth_http_parameters : connection_http_parameters option)
  ?(http_method : connection_o_auth_http_method option)
  ?(authorization_endpoint : string option)
  ?(client_parameters : update_connection_o_auth_client_request_parameters option)
  () : update_connection_o_auth_request_parameters = {
  o_auth_http_parameters;
  http_method;
  authorization_endpoint;
  client_parameters;
   }

let make_update_connection_api_key_auth_request_parameters 
  ?(api_key_value : string option) ?(api_key_name : string option) ()
: update_connection_api_key_auth_request_parameters = {
  api_key_value; api_key_name; 
}

let make_update_connection_auth_request_parameters 
  ?(invocation_http_parameters : connection_http_parameters option)
  ?(api_key_auth_parameters : update_connection_api_key_auth_request_parameters option)
  ?(o_auth_parameters : update_connection_o_auth_request_parameters option)
  ?(basic_auth_parameters : update_connection_basic_auth_request_parameters option)
  () : update_connection_auth_request_parameters = {
  invocation_http_parameters;
  api_key_auth_parameters;
  o_auth_parameters;
  basic_auth_parameters;
   }

let make_update_connection_request 
  ?(auth_parameters : update_connection_auth_request_parameters option)
  ?(authorization_type : connection_authorization_type option)
  ?(description : string option)
  ~(name : string)
  () : update_connection_request = {
  auth_parameters; authorization_type; description; name; 
}

let make_update_archive_response 
  ?(creation_time : float option)
  ?(state_reason : string option)
  ?(state : archive_state option)
  ?(archive_arn : string option)
  () : update_archive_response = {
  creation_time; state_reason; state; archive_arn; 
}

let make_update_archive_request 
  ?(retention_days : int option)
  ?(event_pattern : string option)
  ?(description : string option)
  ~(archive_name : string)
  () : update_archive_request = {
  retention_days; event_pattern; description; archive_name; 
}

let make_update_api_destination_response 
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(api_destination_state : api_destination_state option)
  ?(api_destination_arn : string option)
  () : update_api_destination_response = {
  last_modified_time;
  creation_time;
  api_destination_state;
  api_destination_arn;
   }

let make_update_api_destination_request 
  ?(invocation_rate_limit_per_second : int option)
  ?(http_method : api_destination_http_method option)
  ?(invocation_endpoint : string option)
  ?(connection_arn : string option)
  ?(description : string option)
  ~(name : string)
  () : update_api_destination_request = {
  invocation_rate_limit_per_second;
  http_method;
  invocation_endpoint;
  connection_arn;
  description;
  name;
   }

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_ar_n : string) ()
: untag_resource_request = { tag_keys; resource_ar_n; 
}

let make_test_event_pattern_response  ?(result : bool option) ()
: test_event_pattern_response = { result; 
}

let make_test_event_pattern_request 
  ~(event : string) ~(event_pattern : string) () : test_event_pattern_request
= { event; event_pattern;  }

let make_input_transformer 
  ?(input_paths_map : (string * string) list option)
  ~(input_template : string)
  () : input_transformer = { input_template; input_paths_map; 
}

let make_kinesis_parameters  ~(partition_key_path : string) ()
: kinesis_parameters = { partition_key_path;  }

let make_run_command_target  ~(values : string list) ~(key : string) ()
: run_command_target = { values; key;  }

let make_run_command_parameters 
  ~(run_command_targets : run_command_target list) ()
: run_command_parameters = { run_command_targets; 
}

let make_aws_vpc_configuration 
  ?(assign_public_ip : assign_public_ip option)
  ?(security_groups : string list option)
  ~(subnets : string list)
  () : aws_vpc_configuration = { assign_public_ip; security_groups; subnets; 
}

let make_network_configuration 
  ?(awsvpc_configuration : aws_vpc_configuration option) ()
: network_configuration = { awsvpc_configuration; 
}

let make_capacity_provider_strategy_item 
  ?(base : int option)
  ?(weight : int option)
  ~(capacity_provider : string)
  () : capacity_provider_strategy_item = { base; weight; capacity_provider; 
}

let make_placement_constraint 
  ?(expression : string option)
  ?(type_ : placement_constraint_type option)
  () : placement_constraint = { expression; type_; 
}

let make_placement_strategy 
  ?(field : string option) ?(type_ : placement_strategy_type option) ()
: placement_strategy = { field; type_;  }

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_ecs_parameters 
  ?(tags : tag list option)
  ?(reference_id : string option)
  ?(propagate_tags : propagate_tags option)
  ?(placement_strategy : placement_strategy list option)
  ?(placement_constraints : placement_constraint list option)
  ?(enable_execute_command : bool option)
  ?(enable_ecs_managed_tags : bool option)
  ?(capacity_provider_strategy : capacity_provider_strategy_item list option)
  ?(group : string option)
  ?(platform_version : string option)
  ?(network_configuration : network_configuration option)
  ?(launch_type : launch_type option)
  ?(task_count : int option)
  ~(task_definition_arn : string)
  () : ecs_parameters = {
  tags;
  reference_id;
  propagate_tags;
  placement_strategy;
  placement_constraints;
  enable_execute_command;
  enable_ecs_managed_tags;
  capacity_provider_strategy;
  group;
  platform_version;
  network_configuration;
  launch_type;
  task_count;
  task_definition_arn;
   }

let make_batch_array_properties  ?(size : int option) ()
: batch_array_properties = { size;  }

let make_batch_retry_strategy  ?(attempts : int option) ()
: batch_retry_strategy = { attempts;  }

let make_batch_parameters 
  ?(retry_strategy : batch_retry_strategy option)
  ?(array_properties : batch_array_properties option)
  ~(job_name : string)
  ~(job_definition : string)
  () : batch_parameters = {
  retry_strategy; array_properties; job_name; job_definition; 
}

let make_sqs_parameters  ?(message_group_id : string option) ()
: sqs_parameters = { message_group_id;  }

let make_http_parameters 
  ?(query_string_parameters : (string * string) list option)
  ?(header_parameters : (string * string) list option)
  ?(path_parameter_values : string list option)
  () : http_parameters = {
  query_string_parameters; header_parameters; path_parameter_values; 
}

let make_redshift_data_parameters 
  ?(sqls : string list option)
  ?(with_event : bool option)
  ?(statement_name : string option)
  ?(sql : string option)
  ?(db_user : string option)
  ?(secret_manager_arn : string option)
  ~(database : string)
  () : redshift_data_parameters = {
  sqls;
  with_event;
  statement_name;
  sql;
  db_user;
  database;
  secret_manager_arn;
   }

let make_sage_maker_pipeline_parameter  ~(value : string) ~(name : string) ()
: sage_maker_pipeline_parameter = { value; name; 
}

let make_sage_maker_pipeline_parameters 
  ?(pipeline_parameter_list : sage_maker_pipeline_parameter list option) ()
: sage_maker_pipeline_parameters = { pipeline_parameter_list; 
}

let make_retry_policy 
  ?(maximum_event_age_in_seconds : int option)
  ?(maximum_retry_attempts : int option)
  () : retry_policy = {
  maximum_event_age_in_seconds; maximum_retry_attempts; 
}

let make_app_sync_parameters  ?(graph_ql_operation : string option) ()
: app_sync_parameters = { graph_ql_operation;  }

let make_target 
  ?(app_sync_parameters : app_sync_parameters option)
  ?(retry_policy : retry_policy option)
  ?(dead_letter_config : dead_letter_config option)
  ?(sage_maker_pipeline_parameters : sage_maker_pipeline_parameters option)
  ?(redshift_data_parameters : redshift_data_parameters option)
  ?(http_parameters : http_parameters option)
  ?(sqs_parameters : sqs_parameters option)
  ?(batch_parameters : batch_parameters option)
  ?(ecs_parameters : ecs_parameters option)
  ?(run_command_parameters : run_command_parameters option)
  ?(kinesis_parameters : kinesis_parameters option)
  ?(input_transformer : input_transformer option)
  ?(input_path : string option)
  ?(input : string option)
  ?(role_arn : string option)
  ~(arn : string)
  ~(id : string)
  () : target = {
  app_sync_parameters;
  retry_policy;
  dead_letter_config;
  sage_maker_pipeline_parameters;
  redshift_data_parameters;
  http_parameters;
  sqs_parameters;
  batch_parameters;
  ecs_parameters;
  run_command_parameters;
  kinesis_parameters;
  input_transformer;
  input_path;
  input;
  role_arn;
  arn;
  id;
   }

let make_tag_resource_response  () : tag_resource_response =
()

let make_tag_resource_request 
  ~(tags : tag list) ~(resource_ar_n : string) () : tag_resource_request = {
  tags; resource_ar_n;  }

let make_start_replay_response 
  ?(replay_start_time : float option)
  ?(state_reason : string option)
  ?(state : replay_state option)
  ?(replay_arn : string option)
  () : start_replay_response = {
  replay_start_time; state_reason; state; replay_arn; 
}

let make_replay_destination 
  ?(filter_arns : string list option) ~(arn : string) () : replay_destination
= { filter_arns; arn;  }

let make_start_replay_request 
  ?(description : string option)
  ~(destination : replay_destination)
  ~(event_end_time : float)
  ~(event_start_time : float)
  ~(event_source_arn : string)
  ~(replay_name : string)
  () : start_replay_request = {
  destination;
  event_end_time;
  event_start_time;
  event_source_arn;
  description;
  replay_name;
   }

let make_rule 
  ?(event_bus_name : string option)
  ?(managed_by : string option)
  ?(role_arn : string option)
  ?(schedule_expression : string option)
  ?(description : string option)
  ?(state : rule_state option)
  ?(event_pattern : string option)
  ?(arn : string option)
  ?(name : string option)
  () : rule = {
  event_bus_name;
  managed_by;
  role_arn;
  schedule_expression;
  description;
  state;
  event_pattern;
  arn;
  name;
   }

let make_replay 
  ?(replay_end_time : float option)
  ?(replay_start_time : float option)
  ?(event_last_replayed_time : float option)
  ?(event_end_time : float option)
  ?(event_start_time : float option)
  ?(state_reason : string option)
  ?(state : replay_state option)
  ?(event_source_arn : string option)
  ?(replay_name : string option)
  () : replay = {
  replay_end_time;
  replay_start_time;
  event_last_replayed_time;
  event_end_time;
  event_start_time;
  state_reason;
  state;
  event_source_arn;
  replay_name;
   }

let make_remove_targets_result_entry 
  ?(error_message : string option)
  ?(error_code : string option)
  ?(target_id : string option)
  () : remove_targets_result_entry = { error_message; error_code; target_id; 
}

let make_remove_targets_response 
  ?(failed_entries : remove_targets_result_entry list option)
  ?(failed_entry_count : int option)
  () : remove_targets_response = { failed_entries; failed_entry_count; 
}

let make_remove_targets_request 
  ?(force : bool option)
  ?(event_bus_name : string option)
  ~(ids : string list)
  ~(rule : string)
  () : remove_targets_request = { force; ids; event_bus_name; rule; 
}

let make_remove_permission_request 
  ?(event_bus_name : string option)
  ?(remove_all_permissions : bool option)
  ?(statement_id : string option)
  () : remove_permission_request = {
  event_bus_name; remove_all_permissions; statement_id; 
}

let make_put_targets_result_entry 
  ?(error_message : string option)
  ?(error_code : string option)
  ?(target_id : string option)
  () : put_targets_result_entry = { error_message; error_code; target_id; 
}

let make_put_targets_response 
  ?(failed_entries : put_targets_result_entry list option)
  ?(failed_entry_count : int option)
  () : put_targets_response = { failed_entries; failed_entry_count; 
}

let make_put_targets_request 
  ?(event_bus_name : string option)
  ~(targets : target list)
  ~(rule : string)
  () : put_targets_request = { targets; event_bus_name; rule; 
}

let make_put_rule_response  ?(rule_arn : string option) ()
: put_rule_response = { rule_arn;  }

let make_put_rule_request 
  ?(event_bus_name : string option)
  ?(tags : tag list option)
  ?(role_arn : string option)
  ?(description : string option)
  ?(state : rule_state option)
  ?(event_pattern : string option)
  ?(schedule_expression : string option)
  ~(name : string)
  () : put_rule_request = {
  event_bus_name;
  tags;
  role_arn;
  description;
  state;
  event_pattern;
  schedule_expression;
  name;
   }

let make_condition  ~(value : string) ~(key : string) ~(type_ : string) ()
: condition = { value; key; type_;  }

let make_put_permission_request 
  ?(policy : string option)
  ?(condition : condition option)
  ?(statement_id : string option)
  ?(principal : string option)
  ?(action : string option)
  ?(event_bus_name : string option)
  () : put_permission_request = {
  policy; condition; statement_id; principal; action; event_bus_name; 
}

let make_put_partner_events_result_entry 
  ?(error_message : string option)
  ?(error_code : string option)
  ?(event_id : string option)
  () : put_partner_events_result_entry = {
  error_message; error_code; event_id; 
}

let make_put_partner_events_response 
  ?(entries : put_partner_events_result_entry list option)
  ?(failed_entry_count : int option)
  () : put_partner_events_response = { entries; failed_entry_count; 
}

let make_put_partner_events_request_entry 
  ?(detail : string option)
  ?(detail_type : string option)
  ?(resources : string list option)
  ?(source : string option)
  ?(time : float option)
  () : put_partner_events_request_entry = {
  detail; detail_type; resources; source; time; 
}

let make_put_partner_events_request 
  ~(entries : put_partner_events_request_entry list) ()
: put_partner_events_request = { entries;  }

let make_put_events_result_entry 
  ?(error_message : string option)
  ?(error_code : string option)
  ?(event_id : string option)
  () : put_events_result_entry = { error_message; error_code; event_id; 
}

let make_put_events_response 
  ?(entries : put_events_result_entry list option)
  ?(failed_entry_count : int option)
  () : put_events_response = { entries; failed_entry_count; 
}

let make_put_events_request_entry 
  ?(trace_header : string option)
  ?(event_bus_name : string option)
  ?(detail : string option)
  ?(detail_type : string option)
  ?(resources : string list option)
  ?(source : string option)
  ?(time : float option)
  () : put_events_request_entry = {
  trace_header; event_bus_name; detail; detail_type; resources; source; time; 
}

let make_put_events_request 
  ?(endpoint_id : string option)
  ~(entries : put_events_request_entry list)
  () : put_events_request = { endpoint_id; entries; 
}

let make_partner_event_source 
  ?(name : string option) ?(arn : string option) () : partner_event_source =
{ name; arn;  }

let make_partner_event_source_account 
  ?(state : event_source_state option)
  ?(expiration_time : float option)
  ?(creation_time : float option)
  ?(account : string option)
  () : partner_event_source_account = {
  state; expiration_time; creation_time; account; 
}

let make_list_targets_by_rule_response 
  ?(next_token : string option) ?(targets : target list option) ()
: list_targets_by_rule_response = { next_token; targets; 
}

let make_list_targets_by_rule_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(event_bus_name : string option)
  ~(rule : string)
  () : list_targets_by_rule_request = {
  limit; next_token; event_bus_name; rule; 
}

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request  ~(resource_ar_n : string) ()
: list_tags_for_resource_request = { resource_ar_n; 
}

let make_list_rules_response 
  ?(next_token : string option) ?(rules : rule list option) ()
: list_rules_response = { next_token; rules;  }

let make_list_rules_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(event_bus_name : string option)
  ?(name_prefix : string option)
  () : list_rules_request = {
  limit; next_token; event_bus_name; name_prefix; 
}

let make_list_rule_names_by_target_response 
  ?(next_token : string option) ?(rule_names : string list option) ()
: list_rule_names_by_target_response = { next_token; rule_names; 
}

let make_list_rule_names_by_target_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(event_bus_name : string option)
  ~(target_arn : string)
  () : list_rule_names_by_target_request = {
  limit; next_token; event_bus_name; target_arn; 
}

let make_list_replays_response 
  ?(next_token : string option) ?(replays : replay list option) ()
: list_replays_response = { next_token; replays; 
}

let make_list_replays_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(event_source_arn : string option)
  ?(state : replay_state option)
  ?(name_prefix : string option)
  () : list_replays_request = {
  limit; next_token; event_source_arn; state; name_prefix; 
}

let make_list_partner_event_sources_response 
  ?(next_token : string option)
  ?(partner_event_sources : partner_event_source list option)
  () : list_partner_event_sources_response = {
  next_token; partner_event_sources; 
}

let make_list_partner_event_sources_request 
  ?(limit : int option)
  ?(next_token : string option)
  ~(name_prefix : string)
  () : list_partner_event_sources_request = {
  limit; next_token; name_prefix; 
}

let make_list_partner_event_source_accounts_response 
  ?(next_token : string option)
  ?(partner_event_source_accounts : partner_event_source_account list option)
  () : list_partner_event_source_accounts_response = {
  next_token; partner_event_source_accounts; 
}

let make_list_partner_event_source_accounts_request 
  ?(limit : int option)
  ?(next_token : string option)
  ~(event_source_name : string)
  () : list_partner_event_source_accounts_request = {
  limit; next_token; event_source_name;  }

let make_event_source 
  ?(state : event_source_state option)
  ?(name : string option)
  ?(expiration_time : float option)
  ?(creation_time : float option)
  ?(created_by : string option)
  ?(arn : string option)
  () : event_source = {
  state; name; expiration_time; creation_time; created_by; arn; 
}

let make_list_event_sources_response 
  ?(next_token : string option)
  ?(event_sources : event_source list option)
  () : list_event_sources_response = { next_token; event_sources; 
}

let make_list_event_sources_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(name_prefix : string option)
  () : list_event_sources_request = { limit; next_token; name_prefix; 
}

let make_event_bus 
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(policy : string option)
  ?(description : string option)
  ?(arn : string option)
  ?(name : string option)
  () : event_bus = {
  last_modified_time; creation_time; policy; description; arn; name; 
}

let make_list_event_buses_response 
  ?(next_token : string option) ?(event_buses : event_bus list option) ()
: list_event_buses_response = { next_token; event_buses; 
}

let make_list_event_buses_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(name_prefix : string option)
  () : list_event_buses_request = { limit; next_token; name_prefix; 
}

let make_endpoint 
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(state_reason : string option)
  ?(state : endpoint_state option)
  ?(endpoint_url : string option)
  ?(endpoint_id : string option)
  ?(role_arn : string option)
  ?(event_buses : endpoint_event_bus list option)
  ?(replication_config : replication_config option)
  ?(routing_config : routing_config option)
  ?(arn : string option)
  ?(description : string option)
  ?(name : string option)
  () : endpoint = {
  last_modified_time;
  creation_time;
  state_reason;
  state;
  endpoint_url;
  endpoint_id;
  role_arn;
  event_buses;
  replication_config;
  routing_config;
  arn;
  description;
  name;
   }

let make_list_endpoints_response 
  ?(next_token : string option) ?(endpoints : endpoint list option) ()
: list_endpoints_response = { next_token; endpoints; 
}

let make_list_endpoints_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(home_region : string option)
  ?(name_prefix : string option)
  () : list_endpoints_request = {
  max_results; next_token; home_region; name_prefix;  }

let make_connection 
  ?(last_authorized_time : float option)
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(authorization_type : connection_authorization_type option)
  ?(state_reason : string option)
  ?(connection_state : connection_state option)
  ?(name : string option)
  ?(connection_arn : string option)
  () : connection = {
  last_authorized_time;
  last_modified_time;
  creation_time;
  authorization_type;
  state_reason;
  connection_state;
  name;
  connection_arn;
   }

let make_list_connections_response 
  ?(next_token : string option) ?(connections : connection list option) ()
: list_connections_response = { next_token; connections; 
}

let make_list_connections_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(connection_state : connection_state option)
  ?(name_prefix : string option)
  () : list_connections_request = {
  limit; next_token; connection_state; name_prefix;  }

let make_archive 
  ?(creation_time : float option)
  ?(event_count : int option)
  ?(size_bytes : int option)
  ?(retention_days : int option)
  ?(state_reason : string option)
  ?(state : archive_state option)
  ?(event_source_arn : string option)
  ?(archive_name : string option)
  () : archive = {
  creation_time;
  event_count;
  size_bytes;
  retention_days;
  state_reason;
  state;
  event_source_arn;
  archive_name;
   }

let make_list_archives_response 
  ?(next_token : string option) ?(archives : archive list option) ()
: list_archives_response = { next_token; archives; 
}

let make_list_archives_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(state : archive_state option)
  ?(event_source_arn : string option)
  ?(name_prefix : string option)
  () : list_archives_request = {
  limit; next_token; state; event_source_arn; name_prefix; 
}

let make_api_destination 
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(invocation_rate_limit_per_second : int option)
  ?(http_method : api_destination_http_method option)
  ?(invocation_endpoint : string option)
  ?(connection_arn : string option)
  ?(api_destination_state : api_destination_state option)
  ?(name : string option)
  ?(api_destination_arn : string option)
  () : api_destination = {
  last_modified_time;
  creation_time;
  invocation_rate_limit_per_second;
  http_method;
  invocation_endpoint;
  connection_arn;
  api_destination_state;
  name;
  api_destination_arn;
   }

let make_list_api_destinations_response 
  ?(next_token : string option)
  ?(api_destinations : api_destination list option)
  () : list_api_destinations_response = { next_token; api_destinations; 
}

let make_list_api_destinations_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(connection_arn : string option)
  ?(name_prefix : string option)
  () : list_api_destinations_request = {
  limit; next_token; connection_arn; name_prefix; 
}

let make_enable_rule_request 
  ?(event_bus_name : string option) ~(name : string) () : enable_rule_request
= { event_bus_name; name;  }

let make_disable_rule_request 
  ?(event_bus_name : string option) ~(name : string) ()
: disable_rule_request = { event_bus_name; name; 
}

let make_describe_rule_response 
  ?(created_by : string option)
  ?(event_bus_name : string option)
  ?(managed_by : string option)
  ?(role_arn : string option)
  ?(description : string option)
  ?(state : rule_state option)
  ?(schedule_expression : string option)
  ?(event_pattern : string option)
  ?(arn : string option)
  ?(name : string option)
  () : describe_rule_response = {
  created_by;
  event_bus_name;
  managed_by;
  role_arn;
  description;
  state;
  schedule_expression;
  event_pattern;
  arn;
  name;
   }

let make_describe_rule_request 
  ?(event_bus_name : string option) ~(name : string) ()
: describe_rule_request = { event_bus_name; name; 
}

let make_describe_replay_response 
  ?(replay_end_time : float option)
  ?(replay_start_time : float option)
  ?(event_last_replayed_time : float option)
  ?(event_end_time : float option)
  ?(event_start_time : float option)
  ?(destination : replay_destination option)
  ?(event_source_arn : string option)
  ?(state_reason : string option)
  ?(state : replay_state option)
  ?(description : string option)
  ?(replay_arn : string option)
  ?(replay_name : string option)
  () : describe_replay_response = {
  replay_end_time;
  replay_start_time;
  event_last_replayed_time;
  event_end_time;
  event_start_time;
  destination;
  event_source_arn;
  state_reason;
  state;
  description;
  replay_arn;
  replay_name;
   }

let make_describe_replay_request  ~(replay_name : string) ()
: describe_replay_request = { replay_name; 
}

let make_describe_partner_event_source_response 
  ?(name : string option) ?(arn : string option) ()
: describe_partner_event_source_response = { name; arn; 
}

let make_describe_partner_event_source_request  ~(name : string) ()
: describe_partner_event_source_request = { name; 
}

let make_describe_event_source_response 
  ?(state : event_source_state option)
  ?(name : string option)
  ?(expiration_time : float option)
  ?(creation_time : float option)
  ?(created_by : string option)
  ?(arn : string option)
  () : describe_event_source_response = {
  state; name; expiration_time; creation_time; created_by; arn; 
}

let make_describe_event_source_request  ~(name : string) ()
: describe_event_source_request = { name; 
}

let make_describe_event_bus_response 
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(policy : string option)
  ?(dead_letter_config : dead_letter_config option)
  ?(kms_key_identifier : string option)
  ?(description : string option)
  ?(arn : string option)
  ?(name : string option)
  () : describe_event_bus_response = {
  last_modified_time;
  creation_time;
  policy;
  dead_letter_config;
  kms_key_identifier;
  description;
  arn;
  name;
   }

let make_describe_event_bus_request  ?(name : string option) ()
: describe_event_bus_request = { name;  }

let make_describe_endpoint_response 
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(state_reason : string option)
  ?(state : endpoint_state option)
  ?(endpoint_url : string option)
  ?(endpoint_id : string option)
  ?(role_arn : string option)
  ?(event_buses : endpoint_event_bus list option)
  ?(replication_config : replication_config option)
  ?(routing_config : routing_config option)
  ?(arn : string option)
  ?(description : string option)
  ?(name : string option)
  () : describe_endpoint_response = {
  last_modified_time;
  creation_time;
  state_reason;
  state;
  endpoint_url;
  endpoint_id;
  role_arn;
  event_buses;
  replication_config;
  routing_config;
  arn;
  description;
  name;
   }

let make_describe_endpoint_request 
  ?(home_region : string option) ~(name : string) ()
: describe_endpoint_request = { home_region; name; 
}

let make_connection_basic_auth_response_parameters 
  ?(username : string option) () : connection_basic_auth_response_parameters
= { username;  }

let make_connection_o_auth_client_response_parameters 
  ?(client_i_d : string option) ()
: connection_o_auth_client_response_parameters = { client_i_d; 
}

let make_connection_o_auth_response_parameters 
  ?(o_auth_http_parameters : connection_http_parameters option)
  ?(http_method : connection_o_auth_http_method option)
  ?(authorization_endpoint : string option)
  ?(client_parameters : connection_o_auth_client_response_parameters option)
  () : connection_o_auth_response_parameters = {
  o_auth_http_parameters;
  http_method;
  authorization_endpoint;
  client_parameters;
   }

let make_connection_api_key_auth_response_parameters 
  ?(api_key_name : string option) ()
: connection_api_key_auth_response_parameters = { api_key_name; 
}

let make_connection_auth_response_parameters 
  ?(invocation_http_parameters : connection_http_parameters option)
  ?(api_key_auth_parameters : connection_api_key_auth_response_parameters option)
  ?(o_auth_parameters : connection_o_auth_response_parameters option)
  ?(basic_auth_parameters : connection_basic_auth_response_parameters option)
  () : connection_auth_response_parameters = {
  invocation_http_parameters;
  api_key_auth_parameters;
  o_auth_parameters;
  basic_auth_parameters;
   }

let make_describe_connection_response 
  ?(last_authorized_time : float option)
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(auth_parameters : connection_auth_response_parameters option)
  ?(secret_arn : string option)
  ?(authorization_type : connection_authorization_type option)
  ?(state_reason : string option)
  ?(connection_state : connection_state option)
  ?(description : string option)
  ?(name : string option)
  ?(connection_arn : string option)
  () : describe_connection_response = {
  last_authorized_time;
  last_modified_time;
  creation_time;
  auth_parameters;
  secret_arn;
  authorization_type;
  state_reason;
  connection_state;
  description;
  name;
  connection_arn;
   }

let make_describe_connection_request  ~(name : string) ()
: describe_connection_request = { name;  }

let make_describe_archive_response 
  ?(creation_time : float option)
  ?(event_count : int option)
  ?(size_bytes : int option)
  ?(retention_days : int option)
  ?(state_reason : string option)
  ?(state : archive_state option)
  ?(event_pattern : string option)
  ?(description : string option)
  ?(event_source_arn : string option)
  ?(archive_name : string option)
  ?(archive_arn : string option)
  () : describe_archive_response = {
  creation_time;
  event_count;
  size_bytes;
  retention_days;
  state_reason;
  state;
  event_pattern;
  description;
  event_source_arn;
  archive_name;
  archive_arn;
   }

let make_describe_archive_request  ~(archive_name : string) ()
: describe_archive_request = { archive_name; 
}

let make_describe_api_destination_response 
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(invocation_rate_limit_per_second : int option)
  ?(http_method : api_destination_http_method option)
  ?(invocation_endpoint : string option)
  ?(connection_arn : string option)
  ?(api_destination_state : api_destination_state option)
  ?(description : string option)
  ?(name : string option)
  ?(api_destination_arn : string option)
  () : describe_api_destination_response = {
  last_modified_time;
  creation_time;
  invocation_rate_limit_per_second;
  http_method;
  invocation_endpoint;
  connection_arn;
  api_destination_state;
  description;
  name;
  api_destination_arn;
   }

let make_describe_api_destination_request  ~(name : string) ()
: describe_api_destination_request = { name;  }

let make_delete_rule_request 
  ?(force : bool option)
  ?(event_bus_name : string option)
  ~(name : string)
  () : delete_rule_request = { force; event_bus_name; name; 
}

let make_delete_partner_event_source_request 
  ~(account : string) ~(name : string) ()
: delete_partner_event_source_request = { account; name; 
}

let make_delete_event_bus_request  ~(name : string) ()
: delete_event_bus_request = { name;  }

let make_delete_endpoint_response  () : delete_endpoint_response =
()

let make_delete_endpoint_request  ~(name : string) ()
: delete_endpoint_request = { name;  }

let make_delete_connection_response 
  ?(last_authorized_time : float option)
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(connection_state : connection_state option)
  ?(connection_arn : string option)
  () : delete_connection_response = {
  last_authorized_time;
  last_modified_time;
  creation_time;
  connection_state;
  connection_arn;
   }

let make_delete_connection_request  ~(name : string) ()
: delete_connection_request = { name;  }

let make_delete_archive_response  () : delete_archive_response =
()

let make_delete_archive_request  ~(archive_name : string) ()
: delete_archive_request = { archive_name; 
}

let make_delete_api_destination_response  ()
: delete_api_destination_response =
()

let make_delete_api_destination_request  ~(name : string) ()
: delete_api_destination_request = { name; 
}

let make_deauthorize_connection_response 
  ?(last_authorized_time : float option)
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(connection_state : connection_state option)
  ?(connection_arn : string option)
  () : deauthorize_connection_response = {
  last_authorized_time;
  last_modified_time;
  creation_time;
  connection_state;
  connection_arn;
   }

let make_deauthorize_connection_request  ~(name : string) ()
: deauthorize_connection_request = { name; 
}

let make_deactivate_event_source_request  ~(name : string) ()
: deactivate_event_source_request = { name; 
}

let make_create_partner_event_source_response 
  ?(event_source_arn : string option) ()
: create_partner_event_source_response = { event_source_arn; 
}

let make_create_partner_event_source_request 
  ~(account : string) ~(name : string) ()
: create_partner_event_source_request = { account; name; 
}

let make_create_event_bus_response 
  ?(dead_letter_config : dead_letter_config option)
  ?(kms_key_identifier : string option)
  ?(description : string option)
  ?(event_bus_arn : string option)
  () : create_event_bus_response = {
  dead_letter_config; kms_key_identifier; description; event_bus_arn; 
}

let make_create_event_bus_request 
  ?(tags : tag list option)
  ?(dead_letter_config : dead_letter_config option)
  ?(kms_key_identifier : string option)
  ?(description : string option)
  ?(event_source_name : string option)
  ~(name : string)
  () : create_event_bus_request = {
  tags;
  dead_letter_config;
  kms_key_identifier;
  description;
  event_source_name;
  name;
   }

let make_create_endpoint_response 
  ?(state : endpoint_state option)
  ?(role_arn : string option)
  ?(event_buses : endpoint_event_bus list option)
  ?(replication_config : replication_config option)
  ?(routing_config : routing_config option)
  ?(arn : string option)
  ?(name : string option)
  () : create_endpoint_response = {
  state;
  role_arn;
  event_buses;
  replication_config;
  routing_config;
  arn;
  name;
   }

let make_create_endpoint_request 
  ?(role_arn : string option)
  ?(replication_config : replication_config option)
  ?(description : string option)
  ~(event_buses : endpoint_event_bus list)
  ~(routing_config : routing_config)
  ~(name : string)
  () : create_endpoint_request = {
  role_arn;
  event_buses;
  replication_config;
  routing_config;
  description;
  name;
   }

let make_create_connection_response 
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(connection_state : connection_state option)
  ?(connection_arn : string option)
  () : create_connection_response = {
  last_modified_time; creation_time; connection_state; connection_arn; 
}

let make_create_connection_basic_auth_request_parameters 
  ~(password : string) ~(username : string) ()
: create_connection_basic_auth_request_parameters = { password; username; 
}

let make_create_connection_o_auth_client_request_parameters 
  ~(client_secret : string) ~(client_i_d : string) ()
: create_connection_o_auth_client_request_parameters = {
  client_secret; client_i_d; 
}

let make_create_connection_o_auth_request_parameters 
  ?(o_auth_http_parameters : connection_http_parameters option)
  ~(http_method : connection_o_auth_http_method)
  ~(authorization_endpoint : string)
  ~(client_parameters : create_connection_o_auth_client_request_parameters)
  () : create_connection_o_auth_request_parameters = {
  o_auth_http_parameters;
  http_method;
  authorization_endpoint;
  client_parameters;
   }

let make_create_connection_api_key_auth_request_parameters 
  ~(api_key_value : string) ~(api_key_name : string) ()
: create_connection_api_key_auth_request_parameters = {
  api_key_value; api_key_name; 
}

let make_create_connection_auth_request_parameters 
  ?(invocation_http_parameters : connection_http_parameters option)
  ?(api_key_auth_parameters : create_connection_api_key_auth_request_parameters option)
  ?(o_auth_parameters : create_connection_o_auth_request_parameters option)
  ?(basic_auth_parameters : create_connection_basic_auth_request_parameters option)
  () : create_connection_auth_request_parameters = {
  invocation_http_parameters;
  api_key_auth_parameters;
  o_auth_parameters;
  basic_auth_parameters;
   }

let make_create_connection_request 
  ?(description : string option)
  ~(auth_parameters : create_connection_auth_request_parameters)
  ~(authorization_type : connection_authorization_type)
  ~(name : string)
  () : create_connection_request = {
  auth_parameters; authorization_type; description; name; 
}

let make_create_archive_response 
  ?(creation_time : float option)
  ?(state_reason : string option)
  ?(state : archive_state option)
  ?(archive_arn : string option)
  () : create_archive_response = {
  creation_time; state_reason; state; archive_arn; 
}

let make_create_archive_request 
  ?(retention_days : int option)
  ?(event_pattern : string option)
  ?(description : string option)
  ~(event_source_arn : string)
  ~(archive_name : string)
  () : create_archive_request = {
  retention_days; event_pattern; description; event_source_arn; archive_name; 
}

let make_create_api_destination_response 
  ?(last_modified_time : float option)
  ?(creation_time : float option)
  ?(api_destination_state : api_destination_state option)
  ?(api_destination_arn : string option)
  () : create_api_destination_response = {
  last_modified_time;
  creation_time;
  api_destination_state;
  api_destination_arn;
   }

let make_create_api_destination_request 
  ?(invocation_rate_limit_per_second : int option)
  ?(description : string option)
  ~(http_method : api_destination_http_method)
  ~(invocation_endpoint : string)
  ~(connection_arn : string)
  ~(name : string)
  () : create_api_destination_request = {
  invocation_rate_limit_per_second;
  http_method;
  invocation_endpoint;
  connection_arn;
  description;
  name;
   }

let make_cancel_replay_response 
  ?(state_reason : string option)
  ?(state : replay_state option)
  ?(replay_arn : string option)
  () : cancel_replay_response = { state_reason; state; replay_arn; 
}

let make_cancel_replay_request  ~(replay_name : string) ()
: cancel_replay_request = { replay_name; 
}

let make_activate_event_source_request  ~(name : string) ()
: activate_event_source_request = { name; 
}

