open Types
val make_validate_state_machine_definition_diagnostic :
  ?location:string ->
  message:string ->
  code:string ->
  severity:validate_state_machine_definition_severity ->
  unit
-> validate_state_machine_definition_diagnostic
(** Create a {!type-validate_state_machine_definition_diagnostic} type *)

val make_validate_state_machine_definition_output :
  diagnostics:validate_state_machine_definition_diagnostic list ->
  result:validate_state_machine_definition_result_code ->
  unit
-> validate_state_machine_definition_output
(** Create a {!type-validate_state_machine_definition_output} type *)

val make_validate_state_machine_definition_input :
  ?type_:state_machine_type -> definition:string -> unit
-> validate_state_machine_definition_input
(** Create a {!type-validate_state_machine_definition_input} type *)

val make_update_state_machine_output :
  ?state_machine_version_arn:string ->
  ?revision_id:string ->
  update_date:float ->
  unit
-> update_state_machine_output
(** Create a {!type-update_state_machine_output} type *)

val make_cloud_watch_logs_log_group : ?log_group_arn:string -> unit
-> cloud_watch_logs_log_group
(** Create a {!type-cloud_watch_logs_log_group} type *)

val make_log_destination :
  ?cloud_watch_logs_log_group:cloud_watch_logs_log_group -> unit
-> log_destination
(** Create a {!type-log_destination} type *)

val make_logging_configuration :
  ?destinations:log_destination list ->
  ?include_execution_data:bool ->
  ?level:log_level ->
  unit
-> logging_configuration
(** Create a {!type-logging_configuration} type *)

val make_tracing_configuration : ?enabled:bool -> unit
-> tracing_configuration
(** Create a {!type-tracing_configuration} type *)

val make_update_state_machine_input :
  ?version_description:string ->
  ?publish:bool ->
  ?tracing_configuration:tracing_configuration ->
  ?logging_configuration:logging_configuration ->
  ?role_arn:string ->
  ?definition:string ->
  state_machine_arn:string ->
  unit
-> update_state_machine_input
(** Create a {!type-update_state_machine_input} type *)

val make_update_state_machine_alias_output : update_date:float -> unit
-> update_state_machine_alias_output
(** Create a {!type-update_state_machine_alias_output} type *)

val make_routing_configuration_list_item :
  weight:int -> state_machine_version_arn:string -> unit
-> routing_configuration_list_item
(** Create a {!type-routing_configuration_list_item} type *)

val make_update_state_machine_alias_input :
  ?routing_configuration:routing_configuration_list_item list ->
  ?description:string ->
  state_machine_alias_arn:string ->
  unit
-> update_state_machine_alias_input
(** Create a {!type-update_state_machine_alias_input} type *)

val make_update_map_run_output : unit
-> update_map_run_output
(** Create a {!type-update_map_run_output} type *)

val make_update_map_run_input :
  ?tolerated_failure_count:int ->
  ?tolerated_failure_percentage:float ->
  ?max_concurrency:int ->
  map_run_arn:string ->
  unit
-> update_map_run_input
(** Create a {!type-update_map_run_input} type *)

val make_untag_resource_output : unit
-> untag_resource_output
(** Create a {!type-untag_resource_output} type *)

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input
(** Create a {!type-untag_resource_input} type *)

val make_inspection_data_request :
  ?body:string ->
  ?headers:string ->
  ?url:string ->
  ?method_:string ->
  ?protocol:string ->
  unit
-> inspection_data_request
(** Create a {!type-inspection_data_request} type *)

val make_inspection_data_response :
  ?body:string ->
  ?headers:string ->
  ?status_message:string ->
  ?status_code:string ->
  ?protocol:string ->
  unit
-> inspection_data_response
(** Create a {!type-inspection_data_response} type *)

val make_inspection_data :
  ?response:inspection_data_response ->
  ?request:inspection_data_request ->
  ?after_result_path:string ->
  ?after_result_selector:string ->
  ?result:string ->
  ?after_parameters:string ->
  ?after_input_path:string ->
  ?input:string ->
  unit
-> inspection_data
(** Create a {!type-inspection_data} type *)

val make_test_state_output :
  ?status:test_execution_status ->
  ?next_state:string ->
  ?inspection_data:inspection_data ->
  ?cause:string ->
  ?error:string ->
  ?output:string ->
  unit
-> test_state_output
(** Create a {!type-test_state_output} type *)

val make_test_state_input :
  ?reveal_secrets:bool ->
  ?inspection_level:inspection_level ->
  ?input:string ->
  role_arn:string ->
  definition:string ->
  unit
-> test_state_input
(** Create a {!type-test_state_input} type *)

val make_task_timed_out_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_timed_out_event_details
(** Create a {!type-task_timed_out_event_details} type *)

val make_history_event_execution_data_details : ?truncated:bool -> unit
-> history_event_execution_data_details
(** Create a {!type-history_event_execution_data_details} type *)

val make_task_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_succeeded_event_details
(** Create a {!type-task_succeeded_event_details} type *)

val make_task_submitted_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_submitted_event_details
(** Create a {!type-task_submitted_event_details} type *)

val make_task_submit_failed_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_submit_failed_event_details
(** Create a {!type-task_submit_failed_event_details} type *)

val make_task_started_event_details :
  resource:string -> resource_type:string -> unit
-> task_started_event_details
(** Create a {!type-task_started_event_details} type *)

val make_task_start_failed_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_start_failed_event_details
(** Create a {!type-task_start_failed_event_details} type *)

val make_task_credentials : ?role_arn:string -> unit
-> task_credentials
(** Create a {!type-task_credentials} type *)

val make_task_scheduled_event_details :
  ?task_credentials:task_credentials ->
  ?heartbeat_in_seconds:int ->
  ?timeout_in_seconds:int ->
  parameters:string ->
  region:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_scheduled_event_details
(** Create a {!type-task_scheduled_event_details} type *)

val make_task_failed_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_failed_event_details
(** Create a {!type-task_failed_event_details} type *)

val make_tag_resource_output : unit
-> tag_resource_output
(** Create a {!type-tag_resource_output} type *)

val make_tag : ?value:string -> ?key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input
(** Create a {!type-tag_resource_input} type *)

val make_stop_execution_output : stop_date:float -> unit
-> stop_execution_output
(** Create a {!type-stop_execution_output} type *)

val make_stop_execution_input :
  ?cause:string -> ?error:string -> execution_arn:string -> unit
-> stop_execution_input
(** Create a {!type-stop_execution_input} type *)

val make_state_machine_version_list_item :
  creation_date:float -> state_machine_version_arn:string -> unit
-> state_machine_version_list_item
(** Create a {!type-state_machine_version_list_item} type *)

val make_state_machine_list_item :
  creation_date:float ->
  type_:state_machine_type ->
  name:string ->
  state_machine_arn:string ->
  unit
-> state_machine_list_item
(** Create a {!type-state_machine_list_item} type *)

val make_state_machine_alias_list_item :
  creation_date:float -> state_machine_alias_arn:string -> unit
-> state_machine_alias_list_item
(** Create a {!type-state_machine_alias_list_item} type *)

val make_state_exited_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  name:string ->
  unit
-> state_exited_event_details
(** Create a {!type-state_exited_event_details} type *)

val make_state_entered_event_details :
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  name:string ->
  unit
-> state_entered_event_details
(** Create a {!type-state_entered_event_details} type *)

val make_cloud_watch_events_execution_data_details : ?included:bool -> unit
-> cloud_watch_events_execution_data_details
(** Create a {!type-cloud_watch_events_execution_data_details} type *)

val make_billing_details :
  ?billed_duration_in_milliseconds:int ->
  ?billed_memory_used_in_m_b:int ->
  unit
-> billing_details
(** Create a {!type-billing_details} type *)

val make_start_sync_execution_output :
  ?billing_details:billing_details ->
  ?trace_header:string ->
  ?output_details:cloud_watch_events_execution_data_details ->
  ?output:string ->
  ?input_details:cloud_watch_events_execution_data_details ->
  ?input:string ->
  ?cause:string ->
  ?error:string ->
  ?name:string ->
  ?state_machine_arn:string ->
  status:sync_execution_status ->
  stop_date:float ->
  start_date:float ->
  execution_arn:string ->
  unit
-> start_sync_execution_output
(** Create a {!type-start_sync_execution_output} type *)

val make_start_sync_execution_input :
  ?trace_header:string ->
  ?input:string ->
  ?name:string ->
  state_machine_arn:string ->
  unit
-> start_sync_execution_input
(** Create a {!type-start_sync_execution_input} type *)

val make_start_execution_output :
  start_date:float -> execution_arn:string -> unit
-> start_execution_output
(** Create a {!type-start_execution_output} type *)

val make_start_execution_input :
  ?trace_header:string ->
  ?input:string ->
  ?name:string ->
  state_machine_arn:string ->
  unit
-> start_execution_input
(** Create a {!type-start_execution_input} type *)

val make_send_task_success_output : unit
-> send_task_success_output
(** Create a {!type-send_task_success_output} type *)

val make_send_task_success_input : output:string -> task_token:string -> unit
-> send_task_success_input
(** Create a {!type-send_task_success_input} type *)

val make_send_task_heartbeat_output : unit
-> send_task_heartbeat_output
(** Create a {!type-send_task_heartbeat_output} type *)

val make_send_task_heartbeat_input : task_token:string -> unit
-> send_task_heartbeat_input
(** Create a {!type-send_task_heartbeat_input} type *)

val make_send_task_failure_output : unit
-> send_task_failure_output
(** Create a {!type-send_task_failure_output} type *)

val make_send_task_failure_input :
  ?cause:string -> ?error:string -> task_token:string -> unit
-> send_task_failure_input
(** Create a {!type-send_task_failure_input} type *)

val make_redrive_execution_output : redrive_date:float -> unit
-> redrive_execution_output
(** Create a {!type-redrive_execution_output} type *)

val make_redrive_execution_input :
  ?client_token:string -> execution_arn:string -> unit
-> redrive_execution_input
(** Create a {!type-redrive_execution_input} type *)

val make_publish_state_machine_version_output :
  state_machine_version_arn:string -> creation_date:float -> unit
-> publish_state_machine_version_output
(** Create a {!type-publish_state_machine_version_output} type *)

val make_publish_state_machine_version_input :
  ?description:string ->
  ?revision_id:string ->
  state_machine_arn:string ->
  unit
-> publish_state_machine_version_input
(** Create a {!type-publish_state_machine_version_input} type *)

val make_map_state_started_event_details : ?length:int -> unit
-> map_state_started_event_details
(** Create a {!type-map_state_started_event_details} type *)

val make_map_run_started_event_details : ?map_run_arn:string -> unit
-> map_run_started_event_details
(** Create a {!type-map_run_started_event_details} type *)

val make_map_run_redriven_event_details :
  ?redrive_count:int -> ?map_run_arn:string -> unit
-> map_run_redriven_event_details
(** Create a {!type-map_run_redriven_event_details} type *)

val make_map_run_list_item :
  ?stop_date:float ->
  start_date:float ->
  state_machine_arn:string ->
  map_run_arn:string ->
  execution_arn:string ->
  unit
-> map_run_list_item
(** Create a {!type-map_run_list_item} type *)

val make_map_run_item_counts :
  ?pending_redrive:int ->
  ?failures_not_redrivable:int ->
  results_written:int ->
  total:int ->
  aborted:int ->
  timed_out:int ->
  failed:int ->
  succeeded:int ->
  running:int ->
  pending:int ->
  unit
-> map_run_item_counts
(** Create a {!type-map_run_item_counts} type *)

val make_map_run_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> map_run_failed_event_details
(** Create a {!type-map_run_failed_event_details} type *)

val make_map_run_execution_counts :
  ?pending_redrive:int ->
  ?failures_not_redrivable:int ->
  results_written:int ->
  total:int ->
  aborted:int ->
  timed_out:int ->
  failed:int ->
  succeeded:int ->
  running:int ->
  pending:int ->
  unit
-> map_run_execution_counts
(** Create a {!type-map_run_execution_counts} type *)

val make_map_iteration_event_details : ?index:int -> ?name:string -> unit
-> map_iteration_event_details
(** Create a {!type-map_iteration_event_details} type *)

val make_list_tags_for_resource_output : ?tags:tag list -> unit
-> list_tags_for_resource_output
(** Create a {!type-list_tags_for_resource_output} type *)

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input
(** Create a {!type-list_tags_for_resource_input} type *)

val make_list_state_machines_output :
  ?next_token:string -> state_machines:state_machine_list_item list -> unit
-> list_state_machines_output
(** Create a {!type-list_state_machines_output} type *)

val make_list_state_machines_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_state_machines_input
(** Create a {!type-list_state_machines_input} type *)

val make_list_state_machine_versions_output :
  ?next_token:string ->
  state_machine_versions:state_machine_version_list_item list ->
  unit
-> list_state_machine_versions_output
(** Create a {!type-list_state_machine_versions_output} type *)

val make_list_state_machine_versions_input :
  ?max_results:int -> ?next_token:string -> state_machine_arn:string -> unit
-> list_state_machine_versions_input
(** Create a {!type-list_state_machine_versions_input} type *)

val make_list_state_machine_aliases_output :
  ?next_token:string ->
  state_machine_aliases:state_machine_alias_list_item list ->
  unit
-> list_state_machine_aliases_output
(** Create a {!type-list_state_machine_aliases_output} type *)

val make_list_state_machine_aliases_input :
  ?max_results:int -> ?next_token:string -> state_machine_arn:string -> unit
-> list_state_machine_aliases_input
(** Create a {!type-list_state_machine_aliases_input} type *)

val make_list_map_runs_output :
  ?next_token:string -> map_runs:map_run_list_item list -> unit
-> list_map_runs_output
(** Create a {!type-list_map_runs_output} type *)

val make_list_map_runs_input :
  ?next_token:string -> ?max_results:int -> execution_arn:string -> unit
-> list_map_runs_input
(** Create a {!type-list_map_runs_input} type *)

val make_execution_list_item :
  ?redrive_date:float ->
  ?redrive_count:int ->
  ?state_machine_alias_arn:string ->
  ?state_machine_version_arn:string ->
  ?item_count:int ->
  ?map_run_arn:string ->
  ?stop_date:float ->
  start_date:float ->
  status:execution_status ->
  name:string ->
  state_machine_arn:string ->
  execution_arn:string ->
  unit
-> execution_list_item
(** Create a {!type-execution_list_item} type *)

val make_list_executions_output :
  ?next_token:string -> executions:execution_list_item list -> unit
-> list_executions_output
(** Create a {!type-list_executions_output} type *)

val make_list_executions_input :
  ?redrive_filter:execution_redrive_filter ->
  ?map_run_arn:string ->
  ?next_token:string ->
  ?max_results:int ->
  ?status_filter:execution_status ->
  ?state_machine_arn:string ->
  unit
-> list_executions_input
(** Create a {!type-list_executions_input} type *)

val make_activity_list_item :
  creation_date:float -> name:string -> activity_arn:string -> unit
-> activity_list_item
(** Create a {!type-activity_list_item} type *)

val make_list_activities_output :
  ?next_token:string -> activities:activity_list_item list -> unit
-> list_activities_output
(** Create a {!type-list_activities_output} type *)

val make_list_activities_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_activities_input
(** Create a {!type-list_activities_input} type *)

val make_lambda_function_timed_out_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_timed_out_event_details
(** Create a {!type-lambda_function_timed_out_event_details} type *)

val make_lambda_function_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  unit
-> lambda_function_succeeded_event_details
(** Create a {!type-lambda_function_succeeded_event_details} type *)

val make_lambda_function_start_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_start_failed_event_details
(** Create a {!type-lambda_function_start_failed_event_details} type *)

val make_lambda_function_scheduled_event_details :
  ?task_credentials:task_credentials ->
  ?timeout_in_seconds:int ->
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  resource:string ->
  unit
-> lambda_function_scheduled_event_details
(** Create a {!type-lambda_function_scheduled_event_details} type *)

val make_lambda_function_schedule_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_schedule_failed_event_details
(** Create a {!type-lambda_function_schedule_failed_event_details} type *)

val make_lambda_function_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_failed_event_details
(** Create a {!type-lambda_function_failed_event_details} type *)

val make_activity_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> activity_failed_event_details
(** Create a {!type-activity_failed_event_details} type *)

val make_activity_schedule_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> activity_schedule_failed_event_details
(** Create a {!type-activity_schedule_failed_event_details} type *)

val make_activity_scheduled_event_details :
  ?heartbeat_in_seconds:int ->
  ?timeout_in_seconds:int ->
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  resource:string ->
  unit
-> activity_scheduled_event_details
(** Create a {!type-activity_scheduled_event_details} type *)

val make_activity_started_event_details : ?worker_name:string -> unit
-> activity_started_event_details
(** Create a {!type-activity_started_event_details} type *)

val make_activity_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  unit
-> activity_succeeded_event_details
(** Create a {!type-activity_succeeded_event_details} type *)

val make_activity_timed_out_event_details :
  ?cause:string -> ?error:string -> unit
-> activity_timed_out_event_details
(** Create a {!type-activity_timed_out_event_details} type *)

val make_execution_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> execution_failed_event_details
(** Create a {!type-execution_failed_event_details} type *)

val make_execution_started_event_details :
  ?state_machine_version_arn:string ->
  ?state_machine_alias_arn:string ->
  ?role_arn:string ->
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  unit
-> execution_started_event_details
(** Create a {!type-execution_started_event_details} type *)

val make_execution_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  unit
-> execution_succeeded_event_details
(** Create a {!type-execution_succeeded_event_details} type *)

val make_execution_aborted_event_details :
  ?cause:string -> ?error:string -> unit
-> execution_aborted_event_details
(** Create a {!type-execution_aborted_event_details} type *)

val make_execution_timed_out_event_details :
  ?cause:string -> ?error:string -> unit
-> execution_timed_out_event_details
(** Create a {!type-execution_timed_out_event_details} type *)

val make_execution_redriven_event_details : ?redrive_count:int -> unit
-> execution_redriven_event_details
(** Create a {!type-execution_redriven_event_details} type *)

val make_history_event :
  ?map_run_redriven_event_details:map_run_redriven_event_details ->
  ?map_run_failed_event_details:map_run_failed_event_details ->
  ?map_run_started_event_details:map_run_started_event_details ->
  ?state_exited_event_details:state_exited_event_details ->
  ?state_entered_event_details:state_entered_event_details ->
  ?lambda_function_timed_out_event_details:lambda_function_timed_out_event_details ->
  ?lambda_function_succeeded_event_details:lambda_function_succeeded_event_details ->
  ?lambda_function_start_failed_event_details:lambda_function_start_failed_event_details ->
  ?lambda_function_scheduled_event_details:lambda_function_scheduled_event_details ->
  ?lambda_function_schedule_failed_event_details:lambda_function_schedule_failed_event_details ->
  ?lambda_function_failed_event_details:lambda_function_failed_event_details ->
  ?map_iteration_aborted_event_details:map_iteration_event_details ->
  ?map_iteration_failed_event_details:map_iteration_event_details ->
  ?map_iteration_succeeded_event_details:map_iteration_event_details ->
  ?map_iteration_started_event_details:map_iteration_event_details ->
  ?map_state_started_event_details:map_state_started_event_details ->
  ?execution_redriven_event_details:execution_redriven_event_details ->
  ?execution_timed_out_event_details:execution_timed_out_event_details ->
  ?execution_aborted_event_details:execution_aborted_event_details ->
  ?execution_succeeded_event_details:execution_succeeded_event_details ->
  ?execution_started_event_details:execution_started_event_details ->
  ?execution_failed_event_details:execution_failed_event_details ->
  ?task_timed_out_event_details:task_timed_out_event_details ->
  ?task_succeeded_event_details:task_succeeded_event_details ->
  ?task_submitted_event_details:task_submitted_event_details ->
  ?task_submit_failed_event_details:task_submit_failed_event_details ->
  ?task_started_event_details:task_started_event_details ->
  ?task_start_failed_event_details:task_start_failed_event_details ->
  ?task_scheduled_event_details:task_scheduled_event_details ->
  ?task_failed_event_details:task_failed_event_details ->
  ?activity_timed_out_event_details:activity_timed_out_event_details ->
  ?activity_succeeded_event_details:activity_succeeded_event_details ->
  ?activity_started_event_details:activity_started_event_details ->
  ?activity_scheduled_event_details:activity_scheduled_event_details ->
  ?activity_schedule_failed_event_details:activity_schedule_failed_event_details ->
  ?activity_failed_event_details:activity_failed_event_details ->
  ?previous_event_id:int ->
  id:int ->
  type_:history_event_type ->
  timestamp_:float ->
  unit
-> history_event
(** Create a {!type-history_event} type *)

val make_get_execution_history_output :
  ?next_token:string -> events:history_event list -> unit
-> get_execution_history_output
(** Create a {!type-get_execution_history_output} type *)

val make_get_execution_history_input :
  ?include_execution_data:bool ->
  ?next_token:string ->
  ?reverse_order:bool ->
  ?max_results:int ->
  execution_arn:string ->
  unit
-> get_execution_history_input
(** Create a {!type-get_execution_history_input} type *)

val make_get_activity_task_output :
  ?input:string -> ?task_token:string -> unit
-> get_activity_task_output
(** Create a {!type-get_activity_task_output} type *)

val make_get_activity_task_input :
  ?worker_name:string -> activity_arn:string -> unit
-> get_activity_task_input
(** Create a {!type-get_activity_task_input} type *)

val make_describe_state_machine_output :
  ?description:string ->
  ?revision_id:string ->
  ?label:string ->
  ?tracing_configuration:tracing_configuration ->
  ?logging_configuration:logging_configuration ->
  ?status:state_machine_status ->
  creation_date:float ->
  type_:state_machine_type ->
  role_arn:string ->
  definition:string ->
  name:string ->
  state_machine_arn:string ->
  unit
-> describe_state_machine_output
(** Create a {!type-describe_state_machine_output} type *)

val make_describe_state_machine_input : state_machine_arn:string -> unit
-> describe_state_machine_input
(** Create a {!type-describe_state_machine_input} type *)

val make_describe_state_machine_for_execution_output :
  ?revision_id:string ->
  ?label:string ->
  ?map_run_arn:string ->
  ?tracing_configuration:tracing_configuration ->
  ?logging_configuration:logging_configuration ->
  update_date:float ->
  role_arn:string ->
  definition:string ->
  name:string ->
  state_machine_arn:string ->
  unit
-> describe_state_machine_for_execution_output
(** Create a {!type-describe_state_machine_for_execution_output} type *)

val make_describe_state_machine_for_execution_input :
  execution_arn:string -> unit
-> describe_state_machine_for_execution_input
(** Create a {!type-describe_state_machine_for_execution_input} type *)

val make_describe_state_machine_alias_output :
  ?update_date:float ->
  ?creation_date:float ->
  ?routing_configuration:routing_configuration_list_item list ->
  ?description:string ->
  ?name:string ->
  ?state_machine_alias_arn:string ->
  unit
-> describe_state_machine_alias_output
(** Create a {!type-describe_state_machine_alias_output} type *)

val make_describe_state_machine_alias_input :
  state_machine_alias_arn:string -> unit
-> describe_state_machine_alias_input
(** Create a {!type-describe_state_machine_alias_input} type *)

val make_describe_map_run_output :
  ?redrive_date:float ->
  ?redrive_count:int ->
  ?stop_date:float ->
  execution_counts:map_run_execution_counts ->
  item_counts:map_run_item_counts ->
  tolerated_failure_count:int ->
  tolerated_failure_percentage:float ->
  max_concurrency:int ->
  start_date:float ->
  status:map_run_status ->
  execution_arn:string ->
  map_run_arn:string ->
  unit
-> describe_map_run_output
(** Create a {!type-describe_map_run_output} type *)

val make_describe_map_run_input : map_run_arn:string -> unit
-> describe_map_run_input
(** Create a {!type-describe_map_run_input} type *)

val make_describe_execution_output :
  ?redrive_status_reason:string ->
  ?redrive_status:execution_redrive_status ->
  ?redrive_date:float ->
  ?redrive_count:int ->
  ?state_machine_alias_arn:string ->
  ?state_machine_version_arn:string ->
  ?cause:string ->
  ?error:string ->
  ?map_run_arn:string ->
  ?trace_header:string ->
  ?output_details:cloud_watch_events_execution_data_details ->
  ?output:string ->
  ?input_details:cloud_watch_events_execution_data_details ->
  ?input:string ->
  ?stop_date:float ->
  ?name:string ->
  start_date:float ->
  status:execution_status ->
  state_machine_arn:string ->
  execution_arn:string ->
  unit
-> describe_execution_output
(** Create a {!type-describe_execution_output} type *)

val make_describe_execution_input : execution_arn:string -> unit
-> describe_execution_input
(** Create a {!type-describe_execution_input} type *)

val make_describe_activity_output :
  creation_date:float -> name:string -> activity_arn:string -> unit
-> describe_activity_output
(** Create a {!type-describe_activity_output} type *)

val make_describe_activity_input : activity_arn:string -> unit
-> describe_activity_input
(** Create a {!type-describe_activity_input} type *)

val make_delete_state_machine_version_output : unit
-> delete_state_machine_version_output
(** Create a {!type-delete_state_machine_version_output} type *)

val make_delete_state_machine_version_input :
  state_machine_version_arn:string -> unit
-> delete_state_machine_version_input
(** Create a {!type-delete_state_machine_version_input} type *)

val make_delete_state_machine_output : unit
-> delete_state_machine_output
(** Create a {!type-delete_state_machine_output} type *)

val make_delete_state_machine_input : state_machine_arn:string -> unit
-> delete_state_machine_input
(** Create a {!type-delete_state_machine_input} type *)

val make_delete_state_machine_alias_output : unit
-> delete_state_machine_alias_output
(** Create a {!type-delete_state_machine_alias_output} type *)

val make_delete_state_machine_alias_input :
  state_machine_alias_arn:string -> unit
-> delete_state_machine_alias_input
(** Create a {!type-delete_state_machine_alias_input} type *)

val make_delete_activity_output : unit
-> delete_activity_output
(** Create a {!type-delete_activity_output} type *)

val make_delete_activity_input : activity_arn:string -> unit
-> delete_activity_input
(** Create a {!type-delete_activity_input} type *)

val make_create_state_machine_output :
  ?state_machine_version_arn:string ->
  creation_date:float ->
  state_machine_arn:string ->
  unit
-> create_state_machine_output
(** Create a {!type-create_state_machine_output} type *)

val make_create_state_machine_input :
  ?version_description:string ->
  ?publish:bool ->
  ?tracing_configuration:tracing_configuration ->
  ?tags:tag list ->
  ?logging_configuration:logging_configuration ->
  ?type_:state_machine_type ->
  role_arn:string ->
  definition:string ->
  name:string ->
  unit
-> create_state_machine_input
(** Create a {!type-create_state_machine_input} type *)

val make_create_state_machine_alias_output :
  creation_date:float -> state_machine_alias_arn:string -> unit
-> create_state_machine_alias_output
(** Create a {!type-create_state_machine_alias_output} type *)

val make_create_state_machine_alias_input :
  ?description:string ->
  routing_configuration:routing_configuration_list_item list ->
  name:string ->
  unit
-> create_state_machine_alias_input
(** Create a {!type-create_state_machine_alias_input} type *)

val make_create_activity_output :
  creation_date:float -> activity_arn:string -> unit
-> create_activity_output
(** Create a {!type-create_activity_output} type *)

val make_create_activity_input : ?tags:tag list -> name:string -> unit
-> create_activity_input
(** Create a {!type-create_activity_input} type *)

