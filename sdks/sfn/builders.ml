[@@@warning "-39"]
open Types
let make_validate_state_machine_definition_diagnostic 
  ?(location : string option)
  ~(message : string)
  ~(code : string)
  ~(severity : validate_state_machine_definition_severity)
  () : validate_state_machine_definition_diagnostic = {
  location; message; code; severity; 
}

let make_validate_state_machine_definition_output 
  ~(diagnostics : validate_state_machine_definition_diagnostic list)
  ~(result : validate_state_machine_definition_result_code)
  () : validate_state_machine_definition_output = { diagnostics; result; 
}

let make_validate_state_machine_definition_input 
  ?(type_ : state_machine_type option) ~(definition : string) ()
: validate_state_machine_definition_input = { type_; definition; 
}

let make_update_state_machine_output 
  ?(state_machine_version_arn : string option)
  ?(revision_id : string option)
  ~(update_date : float)
  () : update_state_machine_output = {
  state_machine_version_arn; revision_id; update_date; 
}

let make_cloud_watch_logs_log_group  ?(log_group_arn : string option) ()
: cloud_watch_logs_log_group = { log_group_arn;  }

let make_log_destination 
  ?(cloud_watch_logs_log_group : cloud_watch_logs_log_group option) ()
: log_destination = { cloud_watch_logs_log_group; 
}

let make_logging_configuration 
  ?(destinations : log_destination list option)
  ?(include_execution_data : bool option)
  ?(level : log_level option)
  () : logging_configuration = {
  destinations; include_execution_data; level; 
}

let make_tracing_configuration  ?(enabled : bool option) ()
: tracing_configuration = { enabled;  }

let make_update_state_machine_input 
  ?(version_description : string option)
  ?(publish : bool option)
  ?(tracing_configuration : tracing_configuration option)
  ?(logging_configuration : logging_configuration option)
  ?(role_arn : string option)
  ?(definition : string option)
  ~(state_machine_arn : string)
  () : update_state_machine_input = {
  version_description;
  publish;
  tracing_configuration;
  logging_configuration;
  role_arn;
  definition;
  state_machine_arn;
   }

let make_update_state_machine_alias_output  ~(update_date : float) ()
: update_state_machine_alias_output = { update_date; 
}

let make_routing_configuration_list_item 
  ~(weight : int) ~(state_machine_version_arn : string) ()
: routing_configuration_list_item = { weight; state_machine_version_arn; 
}

let make_update_state_machine_alias_input 
  ?(routing_configuration : routing_configuration_list_item list option)
  ?(description : string option)
  ~(state_machine_alias_arn : string)
  () : update_state_machine_alias_input = {
  routing_configuration; description; state_machine_alias_arn; 
}

let make_update_map_run_output  () : update_map_run_output =
()

let make_update_map_run_input 
  ?(tolerated_failure_count : int option)
  ?(tolerated_failure_percentage : float option)
  ?(max_concurrency : int option)
  ~(map_run_arn : string)
  () : update_map_run_input = {
  tolerated_failure_count;
  tolerated_failure_percentage;
  max_concurrency;
  map_run_arn;
   }

let make_untag_resource_output  () : untag_resource_output =
()

let make_untag_resource_input 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_input = { tag_keys; resource_arn; 
}

let make_inspection_data_request 
  ?(body : string option)
  ?(headers : string option)
  ?(url : string option)
  ?(method_ : string option)
  ?(protocol : string option)
  () : inspection_data_request = { body; headers; url; method_; protocol; 
}

let make_inspection_data_response 
  ?(body : string option)
  ?(headers : string option)
  ?(status_message : string option)
  ?(status_code : string option)
  ?(protocol : string option)
  () : inspection_data_response = {
  body; headers; status_message; status_code; protocol; 
}

let make_inspection_data 
  ?(response : inspection_data_response option)
  ?(request : inspection_data_request option)
  ?(after_result_path : string option)
  ?(after_result_selector : string option)
  ?(result : string option)
  ?(after_parameters : string option)
  ?(after_input_path : string option)
  ?(input : string option)
  () : inspection_data = {
  response;
  request;
  after_result_path;
  after_result_selector;
  result;
  after_parameters;
  after_input_path;
  input;
   }

let make_test_state_output 
  ?(status : test_execution_status option)
  ?(next_state : string option)
  ?(inspection_data : inspection_data option)
  ?(cause : string option)
  ?(error : string option)
  ?(output : string option)
  () : test_state_output = {
  status; next_state; inspection_data; cause; error; output; 
}

let make_test_state_input 
  ?(reveal_secrets : bool option)
  ?(inspection_level : inspection_level option)
  ?(input : string option)
  ~(role_arn : string)
  ~(definition : string)
  () : test_state_input = {
  reveal_secrets; inspection_level; input; role_arn; definition; 
}

let make_task_timed_out_event_details 
  ?(cause : string option)
  ?(error : string option)
  ~(resource : string)
  ~(resource_type : string)
  () : task_timed_out_event_details = {
  cause; error; resource; resource_type; 
}

let make_history_event_execution_data_details  ?(truncated : bool option) ()
: history_event_execution_data_details = { truncated; 
}

let make_task_succeeded_event_details 
  ?(output_details : history_event_execution_data_details option)
  ?(output : string option)
  ~(resource : string)
  ~(resource_type : string)
  () : task_succeeded_event_details = {
  output_details; output; resource; resource_type; 
}

let make_task_submitted_event_details 
  ?(output_details : history_event_execution_data_details option)
  ?(output : string option)
  ~(resource : string)
  ~(resource_type : string)
  () : task_submitted_event_details = {
  output_details; output; resource; resource_type; 
}

let make_task_submit_failed_event_details 
  ?(cause : string option)
  ?(error : string option)
  ~(resource : string)
  ~(resource_type : string)
  () : task_submit_failed_event_details = {
  cause; error; resource; resource_type; 
}

let make_task_started_event_details 
  ~(resource : string) ~(resource_type : string) ()
: task_started_event_details = { resource; resource_type; 
}

let make_task_start_failed_event_details 
  ?(cause : string option)
  ?(error : string option)
  ~(resource : string)
  ~(resource_type : string)
  () : task_start_failed_event_details = {
  cause; error; resource; resource_type;  }

let make_task_credentials  ?(role_arn : string option) () : task_credentials
= { role_arn;  }

let make_task_scheduled_event_details 
  ?(task_credentials : task_credentials option)
  ?(heartbeat_in_seconds : int option)
  ?(timeout_in_seconds : int option)
  ~(parameters : string)
  ~(region : string)
  ~(resource : string)
  ~(resource_type : string)
  () : task_scheduled_event_details = {
  task_credentials;
  heartbeat_in_seconds;
  timeout_in_seconds;
  parameters;
  region;
  resource;
  resource_type;
   }

let make_task_failed_event_details 
  ?(cause : string option)
  ?(error : string option)
  ~(resource : string)
  ~(resource_type : string)
  () : task_failed_event_details = { cause; error; resource; resource_type; 
}

let make_tag_resource_output  () : tag_resource_output = ()

let make_tag  ?(value : string option) ?(key : string option) () : tag = {
  value; key;  }

let make_tag_resource_input  ~(tags : tag list) ~(resource_arn : string) ()
: tag_resource_input = { tags; resource_arn; 
}

let make_stop_execution_output  ~(stop_date : float) ()
: stop_execution_output = { stop_date;  }

let make_stop_execution_input 
  ?(cause : string option)
  ?(error : string option)
  ~(execution_arn : string)
  () : stop_execution_input = { cause; error; execution_arn; 
}

let make_state_machine_version_list_item 
  ~(creation_date : float) ~(state_machine_version_arn : string) ()
: state_machine_version_list_item = {
  creation_date; state_machine_version_arn; 
}

let make_state_machine_list_item 
  ~(creation_date : float)
  ~(type_ : state_machine_type)
  ~(name : string)
  ~(state_machine_arn : string)
  () : state_machine_list_item = {
  creation_date; type_; name; state_machine_arn; 
}

let make_state_machine_alias_list_item 
  ~(creation_date : float) ~(state_machine_alias_arn : string) ()
: state_machine_alias_list_item = { creation_date; state_machine_alias_arn; 
}

let make_state_exited_event_details 
  ?(output_details : history_event_execution_data_details option)
  ?(output : string option)
  ~(name : string)
  () : state_exited_event_details = { output_details; output; name; 
}

let make_state_entered_event_details 
  ?(input_details : history_event_execution_data_details option)
  ?(input : string option)
  ~(name : string)
  () : state_entered_event_details = { input_details; input; name; 
}

let make_cloud_watch_events_execution_data_details 
  ?(included : bool option) () : cloud_watch_events_execution_data_details =
{ included;  }

let make_billing_details 
  ?(billed_duration_in_milliseconds : int option)
  ?(billed_memory_used_in_m_b : int option)
  () : billing_details = {
  billed_duration_in_milliseconds; billed_memory_used_in_m_b; 
}

let make_start_sync_execution_output 
  ?(billing_details : billing_details option)
  ?(trace_header : string option)
  ?(output_details : cloud_watch_events_execution_data_details option)
  ?(output : string option)
  ?(input_details : cloud_watch_events_execution_data_details option)
  ?(input : string option)
  ?(cause : string option)
  ?(error : string option)
  ?(name : string option)
  ?(state_machine_arn : string option)
  ~(status : sync_execution_status)
  ~(stop_date : float)
  ~(start_date : float)
  ~(execution_arn : string)
  () : start_sync_execution_output = {
  billing_details;
  trace_header;
  output_details;
  output;
  input_details;
  input;
  cause;
  error;
  status;
  stop_date;
  start_date;
  name;
  state_machine_arn;
  execution_arn;
   }

let make_start_sync_execution_input 
  ?(trace_header : string option)
  ?(input : string option)
  ?(name : string option)
  ~(state_machine_arn : string)
  () : start_sync_execution_input = {
  trace_header; input; name; state_machine_arn; 
}

let make_start_execution_output 
  ~(start_date : float) ~(execution_arn : string) () : start_execution_output
= { start_date; execution_arn;  }

let make_start_execution_input 
  ?(trace_header : string option)
  ?(input : string option)
  ?(name : string option)
  ~(state_machine_arn : string)
  () : start_execution_input = {
  trace_header; input; name; state_machine_arn; 
}

let make_send_task_success_output  () : send_task_success_output =
()

let make_send_task_success_input 
  ~(output : string) ~(task_token : string) () : send_task_success_input = {
  output; task_token;  }

let make_send_task_heartbeat_output  () : send_task_heartbeat_output =
()

let make_send_task_heartbeat_input  ~(task_token : string) ()
: send_task_heartbeat_input = { task_token; 
}

let make_send_task_failure_output  () : send_task_failure_output =
()

let make_send_task_failure_input 
  ?(cause : string option) ?(error : string option) ~(task_token : string) ()
: send_task_failure_input = { cause; error; task_token; 
}

let make_redrive_execution_output  ~(redrive_date : float) ()
: redrive_execution_output = { redrive_date; 
}

let make_redrive_execution_input 
  ?(client_token : string option) ~(execution_arn : string) ()
: redrive_execution_input = { client_token; execution_arn; 
}

let make_publish_state_machine_version_output 
  ~(state_machine_version_arn : string) ~(creation_date : float) ()
: publish_state_machine_version_output = {
  state_machine_version_arn; creation_date; 
}

let make_publish_state_machine_version_input 
  ?(description : string option)
  ?(revision_id : string option)
  ~(state_machine_arn : string)
  () : publish_state_machine_version_input = {
  description; revision_id; state_machine_arn; 
}

let make_map_state_started_event_details  ?(length : int option) ()
: map_state_started_event_details = { length; 
}

let make_map_run_started_event_details  ?(map_run_arn : string option) ()
: map_run_started_event_details = { map_run_arn; 
}

let make_map_run_redriven_event_details 
  ?(redrive_count : int option) ?(map_run_arn : string option) ()
: map_run_redriven_event_details = { redrive_count; map_run_arn; 
}

let make_map_run_list_item 
  ?(stop_date : float option)
  ~(start_date : float)
  ~(state_machine_arn : string)
  ~(map_run_arn : string)
  ~(execution_arn : string)
  () : map_run_list_item = {
  stop_date; start_date; state_machine_arn; map_run_arn; execution_arn; 
}

let make_map_run_item_counts 
  ?(pending_redrive : int option)
  ?(failures_not_redrivable : int option)
  ~(results_written : int)
  ~(total : int)
  ~(aborted : int)
  ~(timed_out : int)
  ~(failed : int)
  ~(succeeded : int)
  ~(running : int)
  ~(pending : int)
  () : map_run_item_counts = {
  pending_redrive;
  failures_not_redrivable;
  results_written;
  total;
  aborted;
  timed_out;
  failed;
  succeeded;
  running;
  pending;
   }

let make_map_run_failed_event_details 
  ?(cause : string option) ?(error : string option) ()
: map_run_failed_event_details = { cause; error; 
}

let make_map_run_execution_counts 
  ?(pending_redrive : int option)
  ?(failures_not_redrivable : int option)
  ~(results_written : int)
  ~(total : int)
  ~(aborted : int)
  ~(timed_out : int)
  ~(failed : int)
  ~(succeeded : int)
  ~(running : int)
  ~(pending : int)
  () : map_run_execution_counts = {
  pending_redrive;
  failures_not_redrivable;
  results_written;
  total;
  aborted;
  timed_out;
  failed;
  succeeded;
  running;
  pending;
   }

let make_map_iteration_event_details 
  ?(index : int option) ?(name : string option) ()
: map_iteration_event_details = { index; name; 
}

let make_list_tags_for_resource_output  ?(tags : tag list option) ()
: list_tags_for_resource_output = { tags; 
}

let make_list_tags_for_resource_input  ~(resource_arn : string) ()
: list_tags_for_resource_input = { resource_arn; 
}

let make_list_state_machines_output 
  ?(next_token : string option)
  ~(state_machines : state_machine_list_item list)
  () : list_state_machines_output = { next_token; state_machines; 
}

let make_list_state_machines_input 
  ?(next_token : string option) ?(max_results : int option) ()
: list_state_machines_input = { next_token; max_results; 
}

let make_list_state_machine_versions_output 
  ?(next_token : string option)
  ~(state_machine_versions : state_machine_version_list_item list)
  () : list_state_machine_versions_output = {
  next_token; state_machine_versions; 
}

let make_list_state_machine_versions_input 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(state_machine_arn : string)
  () : list_state_machine_versions_input = {
  max_results; next_token; state_machine_arn; 
}

let make_list_state_machine_aliases_output 
  ?(next_token : string option)
  ~(state_machine_aliases : state_machine_alias_list_item list)
  () : list_state_machine_aliases_output = {
  next_token; state_machine_aliases; 
}

let make_list_state_machine_aliases_input 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(state_machine_arn : string)
  () : list_state_machine_aliases_input = {
  max_results; next_token; state_machine_arn; 
}

let make_list_map_runs_output 
  ?(next_token : string option) ~(map_runs : map_run_list_item list) ()
: list_map_runs_output = { next_token; map_runs; 
}

let make_list_map_runs_input 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(execution_arn : string)
  () : list_map_runs_input = { next_token; max_results; execution_arn; 
}

let make_execution_list_item 
  ?(redrive_date : float option)
  ?(redrive_count : int option)
  ?(state_machine_alias_arn : string option)
  ?(state_machine_version_arn : string option)
  ?(item_count : int option)
  ?(map_run_arn : string option)
  ?(stop_date : float option)
  ~(start_date : float)
  ~(status : execution_status)
  ~(name : string)
  ~(state_machine_arn : string)
  ~(execution_arn : string)
  () : execution_list_item = {
  redrive_date;
  redrive_count;
  state_machine_alias_arn;
  state_machine_version_arn;
  item_count;
  map_run_arn;
  stop_date;
  start_date;
  status;
  name;
  state_machine_arn;
  execution_arn;
   }

let make_list_executions_output 
  ?(next_token : string option) ~(executions : execution_list_item list) ()
: list_executions_output = { next_token; executions; 
}

let make_list_executions_input 
  ?(redrive_filter : execution_redrive_filter option)
  ?(map_run_arn : string option)
  ?(next_token : string option)
  ?(max_results : int option)
  ?(status_filter : execution_status option)
  ?(state_machine_arn : string option)
  () : list_executions_input = {
  redrive_filter;
  map_run_arn;
  next_token;
  max_results;
  status_filter;
  state_machine_arn;
   }

let make_activity_list_item 
  ~(creation_date : float) ~(name : string) ~(activity_arn : string) ()
: activity_list_item = { creation_date; name; activity_arn; 
}

let make_list_activities_output 
  ?(next_token : string option) ~(activities : activity_list_item list) ()
: list_activities_output = { next_token; activities; 
}

let make_list_activities_input 
  ?(next_token : string option) ?(max_results : int option) ()
: list_activities_input = { next_token; max_results; 
}

let make_lambda_function_timed_out_event_details 
  ?(cause : string option) ?(error : string option) ()
: lambda_function_timed_out_event_details = { cause; error; 
}

let make_lambda_function_succeeded_event_details 
  ?(output_details : history_event_execution_data_details option)
  ?(output : string option)
  () : lambda_function_succeeded_event_details = { output_details; output; 
}

let make_lambda_function_start_failed_event_details 
  ?(cause : string option) ?(error : string option) ()
: lambda_function_start_failed_event_details = { cause; error; 
}

let make_lambda_function_scheduled_event_details 
  ?(task_credentials : task_credentials option)
  ?(timeout_in_seconds : int option)
  ?(input_details : history_event_execution_data_details option)
  ?(input : string option)
  ~(resource : string)
  () : lambda_function_scheduled_event_details = {
  task_credentials; timeout_in_seconds; input_details; input; resource; 
}

let make_lambda_function_schedule_failed_event_details 
  ?(cause : string option) ?(error : string option) ()
: lambda_function_schedule_failed_event_details = { cause; error; 
}

let make_lambda_function_failed_event_details 
  ?(cause : string option) ?(error : string option) ()
: lambda_function_failed_event_details = { cause; error; 
}

let make_activity_failed_event_details 
  ?(cause : string option) ?(error : string option) ()
: activity_failed_event_details = { cause; error; 
}

let make_activity_schedule_failed_event_details 
  ?(cause : string option) ?(error : string option) ()
: activity_schedule_failed_event_details = { cause; error; 
}

let make_activity_scheduled_event_details 
  ?(heartbeat_in_seconds : int option)
  ?(timeout_in_seconds : int option)
  ?(input_details : history_event_execution_data_details option)
  ?(input : string option)
  ~(resource : string)
  () : activity_scheduled_event_details = {
  heartbeat_in_seconds; timeout_in_seconds; input_details; input; resource; 
}

let make_activity_started_event_details  ?(worker_name : string option) ()
: activity_started_event_details = { worker_name; 
}

let make_activity_succeeded_event_details 
  ?(output_details : history_event_execution_data_details option)
  ?(output : string option)
  () : activity_succeeded_event_details = { output_details; output; 
}

let make_activity_timed_out_event_details 
  ?(cause : string option) ?(error : string option) ()
: activity_timed_out_event_details = { cause; error; 
}

let make_execution_failed_event_details 
  ?(cause : string option) ?(error : string option) ()
: execution_failed_event_details = { cause; error; 
}

let make_execution_started_event_details 
  ?(state_machine_version_arn : string option)
  ?(state_machine_alias_arn : string option)
  ?(role_arn : string option)
  ?(input_details : history_event_execution_data_details option)
  ?(input : string option)
  () : execution_started_event_details = {
  state_machine_version_arn;
  state_machine_alias_arn;
  role_arn;
  input_details;
  input;
   }

let make_execution_succeeded_event_details 
  ?(output_details : history_event_execution_data_details option)
  ?(output : string option)
  () : execution_succeeded_event_details = { output_details; output; 
}

let make_execution_aborted_event_details 
  ?(cause : string option) ?(error : string option) ()
: execution_aborted_event_details = { cause; error; 
}

let make_execution_timed_out_event_details 
  ?(cause : string option) ?(error : string option) ()
: execution_timed_out_event_details = { cause; error; 
}

let make_execution_redriven_event_details  ?(redrive_count : int option) ()
: execution_redriven_event_details = { redrive_count; 
}

let make_history_event 
  ?(map_run_redriven_event_details : map_run_redriven_event_details option)
  ?(map_run_failed_event_details : map_run_failed_event_details option)
  ?(map_run_started_event_details : map_run_started_event_details option)
  ?(state_exited_event_details : state_exited_event_details option)
  ?(state_entered_event_details : state_entered_event_details option)
  ?(lambda_function_timed_out_event_details : lambda_function_timed_out_event_details option)
  ?(lambda_function_succeeded_event_details : lambda_function_succeeded_event_details option)
  ?(lambda_function_start_failed_event_details : lambda_function_start_failed_event_details option)
  ?(lambda_function_scheduled_event_details : lambda_function_scheduled_event_details option)
  ?(lambda_function_schedule_failed_event_details : lambda_function_schedule_failed_event_details option)
  ?(lambda_function_failed_event_details : lambda_function_failed_event_details option)
  ?(map_iteration_aborted_event_details : map_iteration_event_details option)
  ?(map_iteration_failed_event_details : map_iteration_event_details option)
  ?(map_iteration_succeeded_event_details : map_iteration_event_details option)
  ?(map_iteration_started_event_details : map_iteration_event_details option)
  ?(map_state_started_event_details : map_state_started_event_details option)
  ?(execution_redriven_event_details : execution_redriven_event_details option)
  ?(execution_timed_out_event_details : execution_timed_out_event_details option)
  ?(execution_aborted_event_details : execution_aborted_event_details option)
  ?(execution_succeeded_event_details : execution_succeeded_event_details option)
  ?(execution_started_event_details : execution_started_event_details option)
  ?(execution_failed_event_details : execution_failed_event_details option)
  ?(task_timed_out_event_details : task_timed_out_event_details option)
  ?(task_succeeded_event_details : task_succeeded_event_details option)
  ?(task_submitted_event_details : task_submitted_event_details option)
  ?(task_submit_failed_event_details : task_submit_failed_event_details option)
  ?(task_started_event_details : task_started_event_details option)
  ?(task_start_failed_event_details : task_start_failed_event_details option)
  ?(task_scheduled_event_details : task_scheduled_event_details option)
  ?(task_failed_event_details : task_failed_event_details option)
  ?(activity_timed_out_event_details : activity_timed_out_event_details option)
  ?(activity_succeeded_event_details : activity_succeeded_event_details option)
  ?(activity_started_event_details : activity_started_event_details option)
  ?(activity_scheduled_event_details : activity_scheduled_event_details option)
  ?(activity_schedule_failed_event_details : activity_schedule_failed_event_details option)
  ?(activity_failed_event_details : activity_failed_event_details option)
  ?(previous_event_id : int option)
  ~(id : int)
  ~(type_ : history_event_type)
  ~(timestamp_ : float)
  () : history_event = {
  map_run_redriven_event_details;
  map_run_failed_event_details;
  map_run_started_event_details;
  state_exited_event_details;
  state_entered_event_details;
  lambda_function_timed_out_event_details;
  lambda_function_succeeded_event_details;
  lambda_function_start_failed_event_details;
  lambda_function_scheduled_event_details;
  lambda_function_schedule_failed_event_details;
  lambda_function_failed_event_details;
  map_iteration_aborted_event_details;
  map_iteration_failed_event_details;
  map_iteration_succeeded_event_details;
  map_iteration_started_event_details;
  map_state_started_event_details;
  execution_redriven_event_details;
  execution_timed_out_event_details;
  execution_aborted_event_details;
  execution_succeeded_event_details;
  execution_started_event_details;
  execution_failed_event_details;
  task_timed_out_event_details;
  task_succeeded_event_details;
  task_submitted_event_details;
  task_submit_failed_event_details;
  task_started_event_details;
  task_start_failed_event_details;
  task_scheduled_event_details;
  task_failed_event_details;
  activity_timed_out_event_details;
  activity_succeeded_event_details;
  activity_started_event_details;
  activity_scheduled_event_details;
  activity_schedule_failed_event_details;
  activity_failed_event_details;
  previous_event_id;
  id;
  type_;
  timestamp_;
   }

let make_get_execution_history_output 
  ?(next_token : string option) ~(events : history_event list) ()
: get_execution_history_output = { next_token; events; 
}

let make_get_execution_history_input 
  ?(include_execution_data : bool option)
  ?(next_token : string option)
  ?(reverse_order : bool option)
  ?(max_results : int option)
  ~(execution_arn : string)
  () : get_execution_history_input = {
  include_execution_data;
  next_token;
  reverse_order;
  max_results;
  execution_arn;
   }

let make_get_activity_task_output 
  ?(input : string option) ?(task_token : string option) ()
: get_activity_task_output = { input; task_token; 
}

let make_get_activity_task_input 
  ?(worker_name : string option) ~(activity_arn : string) ()
: get_activity_task_input = { worker_name; activity_arn; 
}

let make_describe_state_machine_output 
  ?(description : string option)
  ?(revision_id : string option)
  ?(label : string option)
  ?(tracing_configuration : tracing_configuration option)
  ?(logging_configuration : logging_configuration option)
  ?(status : state_machine_status option)
  ~(creation_date : float)
  ~(type_ : state_machine_type)
  ~(role_arn : string)
  ~(definition : string)
  ~(name : string)
  ~(state_machine_arn : string)
  () : describe_state_machine_output = {
  description;
  revision_id;
  label;
  tracing_configuration;
  logging_configuration;
  creation_date;
  type_;
  role_arn;
  definition;
  status;
  name;
  state_machine_arn;
   }

let make_describe_state_machine_input  ~(state_machine_arn : string) ()
: describe_state_machine_input = { state_machine_arn; 
}

let make_describe_state_machine_for_execution_output 
  ?(revision_id : string option)
  ?(label : string option)
  ?(map_run_arn : string option)
  ?(tracing_configuration : tracing_configuration option)
  ?(logging_configuration : logging_configuration option)
  ~(update_date : float)
  ~(role_arn : string)
  ~(definition : string)
  ~(name : string)
  ~(state_machine_arn : string)
  () : describe_state_machine_for_execution_output = {
  revision_id;
  label;
  map_run_arn;
  tracing_configuration;
  logging_configuration;
  update_date;
  role_arn;
  definition;
  name;
  state_machine_arn;
   }

let make_describe_state_machine_for_execution_input 
  ~(execution_arn : string) () : describe_state_machine_for_execution_input =
{ execution_arn;  }

let make_describe_state_machine_alias_output 
  ?(update_date : float option)
  ?(creation_date : float option)
  ?(routing_configuration : routing_configuration_list_item list option)
  ?(description : string option)
  ?(name : string option)
  ?(state_machine_alias_arn : string option)
  () : describe_state_machine_alias_output = {
  update_date;
  creation_date;
  routing_configuration;
  description;
  name;
  state_machine_alias_arn;
   }

let make_describe_state_machine_alias_input 
  ~(state_machine_alias_arn : string) () : describe_state_machine_alias_input
= { state_machine_alias_arn;  }

let make_describe_map_run_output 
  ?(redrive_date : float option)
  ?(redrive_count : int option)
  ?(stop_date : float option)
  ~(execution_counts : map_run_execution_counts)
  ~(item_counts : map_run_item_counts)
  ~(tolerated_failure_count : int)
  ~(tolerated_failure_percentage : float)
  ~(max_concurrency : int)
  ~(start_date : float)
  ~(status : map_run_status)
  ~(execution_arn : string)
  ~(map_run_arn : string)
  () : describe_map_run_output = {
  redrive_date;
  redrive_count;
  execution_counts;
  item_counts;
  tolerated_failure_count;
  tolerated_failure_percentage;
  max_concurrency;
  stop_date;
  start_date;
  status;
  execution_arn;
  map_run_arn;
   }

let make_describe_map_run_input  ~(map_run_arn : string) ()
: describe_map_run_input = { map_run_arn; 
}

let make_describe_execution_output 
  ?(redrive_status_reason : string option)
  ?(redrive_status : execution_redrive_status option)
  ?(redrive_date : float option)
  ?(redrive_count : int option)
  ?(state_machine_alias_arn : string option)
  ?(state_machine_version_arn : string option)
  ?(cause : string option)
  ?(error : string option)
  ?(map_run_arn : string option)
  ?(trace_header : string option)
  ?(output_details : cloud_watch_events_execution_data_details option)
  ?(output : string option)
  ?(input_details : cloud_watch_events_execution_data_details option)
  ?(input : string option)
  ?(stop_date : float option)
  ?(name : string option)
  ~(start_date : float)
  ~(status : execution_status)
  ~(state_machine_arn : string)
  ~(execution_arn : string)
  () : describe_execution_output = {
  redrive_status_reason;
  redrive_status;
  redrive_date;
  redrive_count;
  state_machine_alias_arn;
  state_machine_version_arn;
  cause;
  error;
  map_run_arn;
  trace_header;
  output_details;
  output;
  input_details;
  input;
  stop_date;
  start_date;
  status;
  name;
  state_machine_arn;
  execution_arn;
   }

let make_describe_execution_input  ~(execution_arn : string) ()
: describe_execution_input = { execution_arn; 
}

let make_describe_activity_output 
  ~(creation_date : float) ~(name : string) ~(activity_arn : string) ()
: describe_activity_output = { creation_date; name; activity_arn; 
}

let make_describe_activity_input  ~(activity_arn : string) ()
: describe_activity_input = { activity_arn; 
}

let make_delete_state_machine_version_output  ()
: delete_state_machine_version_output =
()

let make_delete_state_machine_version_input 
  ~(state_machine_version_arn : string) ()
: delete_state_machine_version_input = { state_machine_version_arn; 
}

let make_delete_state_machine_output  () : delete_state_machine_output =
()

let make_delete_state_machine_input  ~(state_machine_arn : string) ()
: delete_state_machine_input = { state_machine_arn; 
}

let make_delete_state_machine_alias_output  ()
: delete_state_machine_alias_output =
()

let make_delete_state_machine_alias_input 
  ~(state_machine_alias_arn : string) () : delete_state_machine_alias_input =
{ state_machine_alias_arn;  }

let make_delete_activity_output  () : delete_activity_output =
()

let make_delete_activity_input  ~(activity_arn : string) ()
: delete_activity_input = { activity_arn; 
}

let make_create_state_machine_output 
  ?(state_machine_version_arn : string option)
  ~(creation_date : float)
  ~(state_machine_arn : string)
  () : create_state_machine_output = {
  state_machine_version_arn; creation_date; state_machine_arn; 
}

let make_create_state_machine_input 
  ?(version_description : string option)
  ?(publish : bool option)
  ?(tracing_configuration : tracing_configuration option)
  ?(tags : tag list option)
  ?(logging_configuration : logging_configuration option)
  ?(type_ : state_machine_type option)
  ~(role_arn : string)
  ~(definition : string)
  ~(name : string)
  () : create_state_machine_input = {
  version_description;
  publish;
  tracing_configuration;
  tags;
  logging_configuration;
  type_;
  role_arn;
  definition;
  name;
   }

let make_create_state_machine_alias_output 
  ~(creation_date : float) ~(state_machine_alias_arn : string) ()
: create_state_machine_alias_output = {
  creation_date; state_machine_alias_arn; 
}

let make_create_state_machine_alias_input 
  ?(description : string option)
  ~(routing_configuration : routing_configuration_list_item list)
  ~(name : string)
  () : create_state_machine_alias_input = {
  routing_configuration; name; description; 
}

let make_create_activity_output 
  ~(creation_date : float) ~(activity_arn : string) ()
: create_activity_output = { creation_date; activity_arn; 
}

let make_create_activity_input  ?(tags : tag list option) ~(name : string) ()
: create_activity_input = { tags; name; 
}

