open Smaws_Lib
val service : Service.descriptor

type validation_exception_reason = | INVALID_ROUTING_CONFIGURATION
  | CANNOT_UPDATE_COMPLETED_MAP_RUN
  | MISSING_REQUIRED_PARAMETER
  | API_DOES_NOT_SUPPORT_LABELED_ARNS

type validation_exception = {
  reason: validation_exception_reason option;
  message: string option
}

type validate_state_machine_definition_severity = | ERROR

type validate_state_machine_definition_result_code = | FAIL
  | OK

type validate_state_machine_definition_diagnostic = {
  location: string option;
  message: string;
  code: string;
  severity: validate_state_machine_definition_severity
}

type validate_state_machine_definition_output = {
  diagnostics: validate_state_machine_definition_diagnostic list;
  result: validate_state_machine_definition_result_code
}

type state_machine_type = | EXPRESS
  | STANDARD

type validate_state_machine_definition_input = {
  type_: state_machine_type option;
  definition: string
}

type update_state_machine_output = {
  state_machine_version_arn: string option;
  revision_id: string option;
  update_date: float
}

type log_level = | OFF
  | FATAL
  | ERROR
  | ALL

type cloud_watch_logs_log_group = {
  log_group_arn: string option
}

type log_destination = {
  cloud_watch_logs_log_group: cloud_watch_logs_log_group option
}

type logging_configuration = {
  destinations: log_destination list option;
  include_execution_data: bool option;
  level: log_level option
}

type tracing_configuration = {
  enabled: bool option
}

type update_state_machine_input = {
  version_description: string option;
  publish: bool option;
  tracing_configuration: tracing_configuration option;
  logging_configuration: logging_configuration option;
  role_arn: string option;
  definition: string option;
  state_machine_arn: string
}

type update_state_machine_alias_output = {
  update_date: float
}

type routing_configuration_list_item = {
  weight: int;
  state_machine_version_arn: string
}

type update_state_machine_alias_input = {
  routing_configuration: routing_configuration_list_item list option;
  description: string option;
  state_machine_alias_arn: string
}

type state_machine_deleting = {
  message: string option
}

type resource_not_found = {
  resource_name: string option;
  message: string option
}

type invalid_arn = {
  message: string option
}

type conflict_exception = {
  message: string option
}

type state_machine_does_not_exist = {
  message: string option
}

type service_quota_exceeded_exception = {
  message: string option
}

type missing_required_parameter = {
  message: string option
}

type invalid_tracing_configuration = {
  message: string option
}

type invalid_logging_configuration = {
  message: string option
}

type invalid_definition = {
  message: string option
}

type update_map_run_output = unit

type update_map_run_input = {
  tolerated_failure_count: int option;
  tolerated_failure_percentage: float option;
  max_concurrency: int option;
  map_run_arn: string
}

type untag_resource_output = unit

type untag_resource_input = {
  tag_keys: string list;
  resource_arn: string
}

type too_many_tags = {
  resource_name: string option;
  message: string option
}

type inspection_data_request = {
  body: string option;
  headers: string option;
  url: string option;
  method_: string option;
  protocol: string option
}

type inspection_data_response = {
  body: string option;
  headers: string option;
  status_message: string option;
  status_code: string option;
  protocol: string option
}

type inspection_data = {
  response: inspection_data_response option;
  request: inspection_data_request option;
  after_result_path: string option;
  after_result_selector: string option;
  result: string option;
  after_parameters: string option;
  after_input_path: string option;
  input: string option
}

type test_execution_status = | CAUGHT_ERROR
  | RETRIABLE
  | FAILED
  | SUCCEEDED

type test_state_output = {
  status: test_execution_status option;
  next_state: string option;
  inspection_data: inspection_data option;
  cause: string option;
  error: string option;
  output: string option
}

type inspection_level = | TRACE
  | DEBUG
  | INFO

type test_state_input = {
  reveal_secrets: bool option;
  inspection_level: inspection_level option;
  input: string option;
  role_arn: string;
  definition: string
}

type invalid_execution_input = {
  message: string option
}

type task_timed_out_event_details = {
  cause: string option;
  error: string option;
  resource: string;
  resource_type: string
}

type task_timed_out = {
  message: string option
}

type history_event_execution_data_details = {
  truncated: bool option
}

type task_succeeded_event_details = {
  output_details: history_event_execution_data_details option;
  output: string option;
  resource: string;
  resource_type: string
}

type task_submitted_event_details = {
  output_details: history_event_execution_data_details option;
  output: string option;
  resource: string;
  resource_type: string
}

type task_submit_failed_event_details = {
  cause: string option;
  error: string option;
  resource: string;
  resource_type: string
}

type task_started_event_details = {
  resource: string;
  resource_type: string
}

type task_start_failed_event_details = {
  cause: string option;
  error: string option;
  resource: string;
  resource_type: string
}

type task_credentials = {
  role_arn: string option
}

type task_scheduled_event_details = {
  task_credentials: task_credentials option;
  heartbeat_in_seconds: int option;
  timeout_in_seconds: int option;
  parameters: string;
  region: string;
  resource: string;
  resource_type: string
}

type task_failed_event_details = {
  cause: string option;
  error: string option;
  resource: string;
  resource_type: string
}

type task_does_not_exist = {
  message: string option
}

type tag_resource_output = unit

type tag = {
  value: string option;
  key: string option
}

type tag_resource_input = {
  tags: tag list;
  resource_arn: string
}

type sync_execution_status = | TIMED_OUT
  | FAILED
  | SUCCEEDED

type stop_execution_output = {
  stop_date: float
}

type stop_execution_input = {
  cause: string option;
  error: string option;
  execution_arn: string
}

type execution_does_not_exist = {
  message: string option
}

type state_machine_version_list_item = {
  creation_date: float;
  state_machine_version_arn: string
}

type state_machine_type_not_supported = {
  message: string option
}

type state_machine_status = | DELETING
  | ACTIVE

type state_machine_list_item = {
  creation_date: float;
  type_: state_machine_type;
  name: string;
  state_machine_arn: string
}

type state_machine_limit_exceeded = {
  message: string option
}

type state_machine_already_exists = {
  message: string option
}

type state_machine_alias_list_item = {
  creation_date: float;
  state_machine_alias_arn: string
}

type state_exited_event_details = {
  output_details: history_event_execution_data_details option;
  output: string option;
  name: string
}

type state_entered_event_details = {
  input_details: history_event_execution_data_details option;
  input: string option;
  name: string
}

type cloud_watch_events_execution_data_details = {
  included: bool option
}

type billing_details = {
  billed_duration_in_milliseconds: int option;
  billed_memory_used_in_m_b: int option
}

type start_sync_execution_output = {
  billing_details: billing_details option;
  trace_header: string option;
  output_details: cloud_watch_events_execution_data_details option;
  output: string option;
  input_details: cloud_watch_events_execution_data_details option;
  input: string option;
  cause: string option;
  error: string option;
  status: sync_execution_status;
  stop_date: float;
  start_date: float;
  name: string option;
  state_machine_arn: string option;
  execution_arn: string
}

type start_sync_execution_input = {
  trace_header: string option;
  input: string option;
  name: string option;
  state_machine_arn: string
}

type invalid_name = {
  message: string option
}

type start_execution_output = {
  start_date: float;
  execution_arn: string
}

type start_execution_input = {
  trace_header: string option;
  input: string option;
  name: string option;
  state_machine_arn: string
}

type execution_limit_exceeded = {
  message: string option
}

type execution_already_exists = {
  message: string option
}

type send_task_success_output = unit

type send_task_success_input = {
  output: string;
  task_token: string
}

type invalid_token = {
  message: string option
}

type invalid_output = {
  message: string option
}

type send_task_heartbeat_output = unit

type send_task_heartbeat_input = {
  task_token: string
}

type send_task_failure_output = unit

type send_task_failure_input = {
  cause: string option;
  error: string option;
  task_token: string
}

type redrive_execution_output = {
  redrive_date: float
}

type redrive_execution_input = {
  client_token: string option;
  execution_arn: string
}

type execution_not_redrivable = {
  message: string option
}

type publish_state_machine_version_output = {
  state_machine_version_arn: string;
  creation_date: float
}

type publish_state_machine_version_input = {
  description: string option;
  revision_id: string option;
  state_machine_arn: string
}

type map_state_started_event_details = {
  length: int option
}

type map_run_status = | ABORTED
  | FAILED
  | SUCCEEDED
  | RUNNING

type map_run_started_event_details = {
  map_run_arn: string option
}

type map_run_redriven_event_details = {
  redrive_count: int option;
  map_run_arn: string option
}

type map_run_list_item = {
  stop_date: float option;
  start_date: float;
  state_machine_arn: string;
  map_run_arn: string;
  execution_arn: string
}

type map_run_item_counts = {
  pending_redrive: int option;
  failures_not_redrivable: int option;
  results_written: int;
  total: int;
  aborted: int;
  timed_out: int;
  failed: int;
  succeeded: int;
  running: int;
  pending: int
}

type map_run_failed_event_details = {
  cause: string option;
  error: string option
}

type map_run_execution_counts = {
  pending_redrive: int option;
  failures_not_redrivable: int option;
  results_written: int;
  total: int;
  aborted: int;
  timed_out: int;
  failed: int;
  succeeded: int;
  running: int;
  pending: int
}

type map_iteration_event_details = {
  index: int option;
  name: string option
}

type list_tags_for_resource_output = {
  tags: tag list option
}

type list_tags_for_resource_input = {
  resource_arn: string
}

type list_state_machines_output = {
  next_token: string option;
  state_machines: state_machine_list_item list
}

type list_state_machines_input = {
  next_token: string option;
  max_results: int option
}

type list_state_machine_versions_output = {
  next_token: string option;
  state_machine_versions: state_machine_version_list_item list
}

type list_state_machine_versions_input = {
  max_results: int option;
  next_token: string option;
  state_machine_arn: string
}

type list_state_machine_aliases_output = {
  next_token: string option;
  state_machine_aliases: state_machine_alias_list_item list
}

type list_state_machine_aliases_input = {
  max_results: int option;
  next_token: string option;
  state_machine_arn: string
}

type list_map_runs_output = {
  next_token: string option;
  map_runs: map_run_list_item list
}

type list_map_runs_input = {
  next_token: string option;
  max_results: int option;
  execution_arn: string
}

type execution_status = | PENDING_REDRIVE
  | ABORTED
  | TIMED_OUT
  | FAILED
  | SUCCEEDED
  | RUNNING

type execution_list_item = {
  redrive_date: float option;
  redrive_count: int option;
  state_machine_alias_arn: string option;
  state_machine_version_arn: string option;
  item_count: int option;
  map_run_arn: string option;
  stop_date: float option;
  start_date: float;
  status: execution_status;
  name: string;
  state_machine_arn: string;
  execution_arn: string
}

type list_executions_output = {
  next_token: string option;
  executions: execution_list_item list
}

type execution_redrive_filter = | NOT_REDRIVEN
  | REDRIVEN

type list_executions_input = {
  redrive_filter: execution_redrive_filter option;
  map_run_arn: string option;
  next_token: string option;
  max_results: int option;
  status_filter: execution_status option;
  state_machine_arn: string option
}

type activity_list_item = {
  creation_date: float;
  name: string;
  activity_arn: string
}

type list_activities_output = {
  next_token: string option;
  activities: activity_list_item list
}

type list_activities_input = {
  next_token: string option;
  max_results: int option
}

type lambda_function_timed_out_event_details = {
  cause: string option;
  error: string option
}

type lambda_function_succeeded_event_details = {
  output_details: history_event_execution_data_details option;
  output: string option
}

type lambda_function_start_failed_event_details = {
  cause: string option;
  error: string option
}

type lambda_function_scheduled_event_details = {
  task_credentials: task_credentials option;
  timeout_in_seconds: int option;
  input_details: history_event_execution_data_details option;
  input: string option;
  resource: string
}

type lambda_function_schedule_failed_event_details = {
  cause: string option;
  error: string option
}

type lambda_function_failed_event_details = {
  cause: string option;
  error: string option
}

type history_event_type = | MapRunRedriven
  | ExecutionRedriven
  | MapRunSucceeded
  | MapRunStarted
  | MapRunFailed
  | MapRunAborted
  | WaitStateExited
  | WaitStateEntered
  | WaitStateAborted
  | TaskTimedOut
  | TaskSucceeded
  | TaskSubmitted
  | TaskSubmitFailed
  | TaskStateExited
  | TaskStateEntered
  | TaskStateAborted
  | TaskStartFailed
  | TaskStarted
  | TaskScheduled
  | TaskFailed
  | SucceedStateExited
  | SucceedStateEntered
  | PassStateExited
  | PassStateEntered
  | ParallelStateSucceeded
  | ParallelStateStarted
  | ParallelStateFailed
  | ParallelStateExited
  | ParallelStateEntered
  | ParallelStateAborted
  | MapStateSucceeded
  | MapStateStarted
  | MapStateFailed
  | MapStateExited
  | MapStateEntered
  | MapStateAborted
  | MapIterationSucceeded
  | MapIterationStarted
  | MapIterationFailed
  | MapIterationAborted
  | LambdaFunctionTimedOut
  | LambdaFunctionSucceeded
  | LambdaFunctionStartFailed
  | LambdaFunctionStarted
  | LambdaFunctionScheduleFailed
  | LambdaFunctionScheduled
  | LambdaFunctionFailed
  | FailStateEntered
  | ExecutionTimedOut
  | ExecutionSucceeded
  | ExecutionStarted
  | ExecutionFailed
  | ExecutionAborted
  | ChoiceStateExited
  | ChoiceStateEntered
  | ActivityTimedOut
  | ActivitySucceeded
  | ActivityStarted
  | ActivityScheduleFailed
  | ActivityScheduled
  | ActivityFailed

type activity_failed_event_details = {
  cause: string option;
  error: string option
}

type activity_schedule_failed_event_details = {
  cause: string option;
  error: string option
}

type activity_scheduled_event_details = {
  heartbeat_in_seconds: int option;
  timeout_in_seconds: int option;
  input_details: history_event_execution_data_details option;
  input: string option;
  resource: string
}

type activity_started_event_details = {
  worker_name: string option
}

type activity_succeeded_event_details = {
  output_details: history_event_execution_data_details option;
  output: string option
}

type activity_timed_out_event_details = {
  cause: string option;
  error: string option
}

type execution_failed_event_details = {
  cause: string option;
  error: string option
}

type execution_started_event_details = {
  state_machine_version_arn: string option;
  state_machine_alias_arn: string option;
  role_arn: string option;
  input_details: history_event_execution_data_details option;
  input: string option
}

type execution_succeeded_event_details = {
  output_details: history_event_execution_data_details option;
  output: string option
}

type execution_aborted_event_details = {
  cause: string option;
  error: string option
}

type execution_timed_out_event_details = {
  cause: string option;
  error: string option
}

type execution_redriven_event_details = {
  redrive_count: int option
}

type history_event = {
  map_run_redriven_event_details: map_run_redriven_event_details option;
  map_run_failed_event_details: map_run_failed_event_details option;
  map_run_started_event_details: map_run_started_event_details option;
  state_exited_event_details: state_exited_event_details option;
  state_entered_event_details: state_entered_event_details option;
  lambda_function_timed_out_event_details: lambda_function_timed_out_event_details option;
  lambda_function_succeeded_event_details: lambda_function_succeeded_event_details option;
  lambda_function_start_failed_event_details: lambda_function_start_failed_event_details option;
  lambda_function_scheduled_event_details: lambda_function_scheduled_event_details option;
  lambda_function_schedule_failed_event_details: lambda_function_schedule_failed_event_details option;
  lambda_function_failed_event_details: lambda_function_failed_event_details option;
  map_iteration_aborted_event_details: map_iteration_event_details option;
  map_iteration_failed_event_details: map_iteration_event_details option;
  map_iteration_succeeded_event_details: map_iteration_event_details option;
  map_iteration_started_event_details: map_iteration_event_details option;
  map_state_started_event_details: map_state_started_event_details option;
  execution_redriven_event_details: execution_redriven_event_details option;
  execution_timed_out_event_details: execution_timed_out_event_details option;
  execution_aborted_event_details: execution_aborted_event_details option;
  execution_succeeded_event_details: execution_succeeded_event_details option;
  execution_started_event_details: execution_started_event_details option;
  execution_failed_event_details: execution_failed_event_details option;
  task_timed_out_event_details: task_timed_out_event_details option;
  task_succeeded_event_details: task_succeeded_event_details option;
  task_submitted_event_details: task_submitted_event_details option;
  task_submit_failed_event_details: task_submit_failed_event_details option;
  task_started_event_details: task_started_event_details option;
  task_start_failed_event_details: task_start_failed_event_details option;
  task_scheduled_event_details: task_scheduled_event_details option;
  task_failed_event_details: task_failed_event_details option;
  activity_timed_out_event_details: activity_timed_out_event_details option;
  activity_succeeded_event_details: activity_succeeded_event_details option;
  activity_started_event_details: activity_started_event_details option;
  activity_scheduled_event_details: activity_scheduled_event_details option;
  activity_schedule_failed_event_details: activity_schedule_failed_event_details option;
  activity_failed_event_details: activity_failed_event_details option;
  previous_event_id: int option;
  id: int;
  type_: history_event_type;
  timestamp_: float
}

type get_execution_history_output = {
  next_token: string option;
  events: history_event list
}

type get_execution_history_input = {
  include_execution_data: bool option;
  next_token: string option;
  reverse_order: bool option;
  max_results: int option;
  execution_arn: string
}

type get_activity_task_output = {
  input: string option;
  task_token: string option
}

type get_activity_task_input = {
  worker_name: string option;
  activity_arn: string
}

type activity_worker_limit_exceeded = {
  message: string option
}

type activity_does_not_exist = {
  message: string option
}

type execution_redrive_status = | REDRIVABLE_BY_MAP_RUN
  | NOT_REDRIVABLE
  | REDRIVABLE

type describe_state_machine_output = {
  description: string option;
  revision_id: string option;
  label: string option;
  tracing_configuration: tracing_configuration option;
  logging_configuration: logging_configuration option;
  creation_date: float;
  type_: state_machine_type;
  role_arn: string;
  definition: string;
  status: state_machine_status option;
  name: string;
  state_machine_arn: string
}

type describe_state_machine_input = {
  state_machine_arn: string
}

type describe_state_machine_for_execution_output = {
  revision_id: string option;
  label: string option;
  map_run_arn: string option;
  tracing_configuration: tracing_configuration option;
  logging_configuration: logging_configuration option;
  update_date: float;
  role_arn: string;
  definition: string;
  name: string;
  state_machine_arn: string
}

type describe_state_machine_for_execution_input = {
  execution_arn: string
}

type describe_state_machine_alias_output = {
  update_date: float option;
  creation_date: float option;
  routing_configuration: routing_configuration_list_item list option;
  description: string option;
  name: string option;
  state_machine_alias_arn: string option
}

type describe_state_machine_alias_input = {
  state_machine_alias_arn: string
}

type describe_map_run_output = {
  redrive_date: float option;
  redrive_count: int option;
  execution_counts: map_run_execution_counts;
  item_counts: map_run_item_counts;
  tolerated_failure_count: int;
  tolerated_failure_percentage: float;
  max_concurrency: int;
  stop_date: float option;
  start_date: float;
  status: map_run_status;
  execution_arn: string;
  map_run_arn: string
}

type describe_map_run_input = {
  map_run_arn: string
}

type describe_execution_output = {
  redrive_status_reason: string option;
  redrive_status: execution_redrive_status option;
  redrive_date: float option;
  redrive_count: int option;
  state_machine_alias_arn: string option;
  state_machine_version_arn: string option;
  cause: string option;
  error: string option;
  map_run_arn: string option;
  trace_header: string option;
  output_details: cloud_watch_events_execution_data_details option;
  output: string option;
  input_details: cloud_watch_events_execution_data_details option;
  input: string option;
  stop_date: float option;
  start_date: float;
  status: execution_status;
  name: string option;
  state_machine_arn: string;
  execution_arn: string
}

type describe_execution_input = {
  execution_arn: string
}

type describe_activity_output = {
  creation_date: float;
  name: string;
  activity_arn: string
}

type describe_activity_input = {
  activity_arn: string
}

type delete_state_machine_version_output = unit

type delete_state_machine_version_input = {
  state_machine_version_arn: string
}

type delete_state_machine_output = unit

type delete_state_machine_input = {
  state_machine_arn: string
}

type delete_state_machine_alias_output = unit

type delete_state_machine_alias_input = {
  state_machine_alias_arn: string
}

type delete_activity_output = unit

type delete_activity_input = {
  activity_arn: string
}

type create_state_machine_output = {
  state_machine_version_arn: string option;
  creation_date: float;
  state_machine_arn: string
}

type create_state_machine_input = {
  version_description: string option;
  publish: bool option;
  tracing_configuration: tracing_configuration option;
  tags: tag list option;
  logging_configuration: logging_configuration option;
  type_: state_machine_type option;
  role_arn: string;
  definition: string;
  name: string
}

type create_state_machine_alias_output = {
  creation_date: float;
  state_machine_alias_arn: string
}

type create_state_machine_alias_input = {
  routing_configuration: routing_configuration_list_item list;
  name: string;
  description: string option
}

type create_activity_output = {
  creation_date: float;
  activity_arn: string
}

type create_activity_input = {
  tags: tag list option;
  name: string
}

type activity_limit_exceeded = {
  message: string option
}



type base_document = Json.t

val make_validate_state_machine_definition_diagnostic :
  ?location:string ->
  message:string ->
  code:string ->
  severity:validate_state_machine_definition_severity ->
  unit
-> validate_state_machine_definition_diagnostic

val make_validate_state_machine_definition_output :
  diagnostics:validate_state_machine_definition_diagnostic list ->
  result:validate_state_machine_definition_result_code ->
  unit
-> validate_state_machine_definition_output

val make_validate_state_machine_definition_input :
  ?type_:state_machine_type -> definition:string -> unit
-> validate_state_machine_definition_input

val make_update_state_machine_output :
  ?state_machine_version_arn:string ->
  ?revision_id:string ->
  update_date:float ->
  unit -> update_state_machine_output

val make_cloud_watch_logs_log_group : ?log_group_arn:string -> unit
-> cloud_watch_logs_log_group

val make_log_destination :
  ?cloud_watch_logs_log_group:cloud_watch_logs_log_group -> unit
-> log_destination

val make_logging_configuration :
  ?destinations:log_destination list ->
  ?include_execution_data:bool ->
  ?level:log_level ->
  unit -> logging_configuration

val make_tracing_configuration : ?enabled:bool -> unit
-> tracing_configuration

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

val make_update_state_machine_alias_output : update_date:float -> unit
-> update_state_machine_alias_output

val make_routing_configuration_list_item :
  weight:int -> state_machine_version_arn:string -> unit
-> routing_configuration_list_item

val make_update_state_machine_alias_input :
  ?routing_configuration:routing_configuration_list_item list ->
  ?description:string ->
  state_machine_alias_arn:string ->
  unit -> update_state_machine_alias_input

val make_update_map_run_output : unit
-> update_map_run_output

val make_update_map_run_input :
  ?tolerated_failure_count:int ->
  ?tolerated_failure_percentage:float ->
  ?max_concurrency:int ->
  map_run_arn:string ->
  unit -> update_map_run_input

val make_untag_resource_output : unit
-> untag_resource_output

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_inspection_data_request :
  ?body:string ->
  ?headers:string ->
  ?url:string ->
  ?method_:string ->
  ?protocol:string ->
  unit -> inspection_data_request

val make_inspection_data_response :
  ?body:string ->
  ?headers:string ->
  ?status_message:string ->
  ?status_code:string ->
  ?protocol:string ->
  unit -> inspection_data_response

val make_inspection_data :
  ?response:inspection_data_response ->
  ?request:inspection_data_request ->
  ?after_result_path:string ->
  ?after_result_selector:string ->
  ?result:string ->
  ?after_parameters:string ->
  ?after_input_path:string ->
  ?input:string ->
  unit -> inspection_data

val make_test_state_output :
  ?status:test_execution_status ->
  ?next_state:string ->
  ?inspection_data:inspection_data ->
  ?cause:string ->
  ?error:string ->
  ?output:string ->
  unit -> test_state_output

val make_test_state_input :
  ?reveal_secrets:bool ->
  ?inspection_level:inspection_level ->
  ?input:string ->
  role_arn:string ->
  definition:string ->
  unit -> test_state_input

val make_task_timed_out_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_timed_out_event_details

val make_history_event_execution_data_details : ?truncated:bool -> unit
-> history_event_execution_data_details

val make_task_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  resource:string ->
  resource_type:string ->
  unit -> task_succeeded_event_details

val make_task_submitted_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_submitted_event_details

val make_task_submit_failed_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_submit_failed_event_details

val make_task_started_event_details :
  resource:string -> resource_type:string -> unit
-> task_started_event_details

val make_task_start_failed_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit -> task_start_failed_event_details

val make_task_credentials : ?role_arn:string -> unit
-> task_credentials

val make_task_scheduled_event_details :
  ?task_credentials:task_credentials ->
  ?heartbeat_in_seconds:int ->
  ?timeout_in_seconds:int ->
  parameters:string ->
  region:string ->
  resource:string ->
  resource_type:string ->
  unit -> task_scheduled_event_details

val make_task_failed_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit -> task_failed_event_details

val make_tag_resource_output : unit -> tag_resource_output

val make_tag : ?value:string -> ?key:string -> unit
-> tag

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input

val make_stop_execution_output : stop_date:float -> unit
-> stop_execution_output

val make_stop_execution_input :
  ?cause:string -> ?error:string -> execution_arn:string -> unit
-> stop_execution_input

val make_state_machine_version_list_item :
  creation_date:float -> state_machine_version_arn:string -> unit
-> state_machine_version_list_item

val make_state_machine_list_item :
  creation_date:float ->
  type_:state_machine_type ->
  name:string ->
  state_machine_arn:string ->
  unit -> state_machine_list_item

val make_state_machine_alias_list_item :
  creation_date:float -> state_machine_alias_arn:string -> unit
-> state_machine_alias_list_item

val make_state_exited_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  name:string ->
  unit -> state_exited_event_details

val make_state_entered_event_details :
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  name:string ->
  unit
-> state_entered_event_details

val make_cloud_watch_events_execution_data_details : ?included:bool -> unit
-> cloud_watch_events_execution_data_details

val make_billing_details :
  ?billed_duration_in_milliseconds:int ->
  ?billed_memory_used_in_m_b:int ->
  unit -> billing_details

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
  unit -> start_sync_execution_output

val make_start_sync_execution_input :
  ?trace_header:string ->
  ?input:string ->
  ?name:string ->
  state_machine_arn:string ->
  unit -> start_sync_execution_input

val make_start_execution_output :
  start_date:float -> execution_arn:string -> unit
-> start_execution_output

val make_start_execution_input :
  ?trace_header:string ->
  ?input:string ->
  ?name:string ->
  state_machine_arn:string ->
  unit -> start_execution_input

val make_send_task_success_output : unit
-> send_task_success_output

val make_send_task_success_input : output:string -> task_token:string -> unit
-> send_task_success_input

val make_send_task_heartbeat_output : unit
-> send_task_heartbeat_output

val make_send_task_heartbeat_input : task_token:string -> unit
-> send_task_heartbeat_input

val make_send_task_failure_output : unit
-> send_task_failure_output

val make_send_task_failure_input :
  ?cause:string -> ?error:string -> task_token:string -> unit
-> send_task_failure_input

val make_redrive_execution_output : redrive_date:float -> unit
-> redrive_execution_output

val make_redrive_execution_input :
  ?client_token:string -> execution_arn:string -> unit
-> redrive_execution_input

val make_publish_state_machine_version_output :
  state_machine_version_arn:string -> creation_date:float -> unit
-> publish_state_machine_version_output

val make_publish_state_machine_version_input :
  ?description:string ->
  ?revision_id:string ->
  state_machine_arn:string ->
  unit
-> publish_state_machine_version_input

val make_map_state_started_event_details : ?length:int -> unit
-> map_state_started_event_details

val make_map_run_started_event_details : ?map_run_arn:string -> unit
-> map_run_started_event_details

val make_map_run_redriven_event_details :
  ?redrive_count:int -> ?map_run_arn:string -> unit
-> map_run_redriven_event_details

val make_map_run_list_item :
  ?stop_date:float ->
  start_date:float ->
  state_machine_arn:string ->
  map_run_arn:string ->
  execution_arn:string ->
  unit -> map_run_list_item

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
  unit -> map_run_item_counts

val make_map_run_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> map_run_failed_event_details

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
  unit -> map_run_execution_counts

val make_map_iteration_event_details : ?index:int -> ?name:string -> unit
-> map_iteration_event_details

val make_list_tags_for_resource_output : ?tags:tag list -> unit
-> list_tags_for_resource_output

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input

val make_list_state_machines_output :
  ?next_token:string -> state_machines:state_machine_list_item list -> unit
-> list_state_machines_output

val make_list_state_machines_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_state_machines_input

val make_list_state_machine_versions_output :
  ?next_token:string ->
  state_machine_versions:state_machine_version_list_item list ->
  unit
-> list_state_machine_versions_output

val make_list_state_machine_versions_input :
  ?max_results:int -> ?next_token:string -> state_machine_arn:string -> unit
-> list_state_machine_versions_input

val make_list_state_machine_aliases_output :
  ?next_token:string ->
  state_machine_aliases:state_machine_alias_list_item list ->
  unit
-> list_state_machine_aliases_output

val make_list_state_machine_aliases_input :
  ?max_results:int -> ?next_token:string -> state_machine_arn:string -> unit
-> list_state_machine_aliases_input

val make_list_map_runs_output :
  ?next_token:string -> map_runs:map_run_list_item list -> unit
-> list_map_runs_output

val make_list_map_runs_input :
  ?next_token:string -> ?max_results:int -> execution_arn:string -> unit
-> list_map_runs_input

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
  unit -> execution_list_item

val make_list_executions_output :
  ?next_token:string -> executions:execution_list_item list -> unit
-> list_executions_output

val make_list_executions_input :
  ?redrive_filter:execution_redrive_filter ->
  ?map_run_arn:string ->
  ?next_token:string ->
  ?max_results:int ->
  ?status_filter:execution_status ->
  ?state_machine_arn:string ->
  unit -> list_executions_input

val make_activity_list_item :
  creation_date:float -> name:string -> activity_arn:string -> unit
-> activity_list_item

val make_list_activities_output :
  ?next_token:string -> activities:activity_list_item list -> unit
-> list_activities_output

val make_list_activities_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_activities_input

val make_lambda_function_timed_out_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_timed_out_event_details

val make_lambda_function_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  unit
-> lambda_function_succeeded_event_details

val make_lambda_function_start_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_start_failed_event_details

val make_lambda_function_scheduled_event_details :
  ?task_credentials:task_credentials ->
  ?timeout_in_seconds:int ->
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  resource:string ->
  unit
-> lambda_function_scheduled_event_details

val make_lambda_function_schedule_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_schedule_failed_event_details

val make_lambda_function_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_failed_event_details

val make_activity_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> activity_failed_event_details

val make_activity_schedule_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> activity_schedule_failed_event_details

val make_activity_scheduled_event_details :
  ?heartbeat_in_seconds:int ->
  ?timeout_in_seconds:int ->
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  resource:string ->
  unit
-> activity_scheduled_event_details

val make_activity_started_event_details : ?worker_name:string -> unit
-> activity_started_event_details

val make_activity_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  unit
-> activity_succeeded_event_details

val make_activity_timed_out_event_details :
  ?cause:string -> ?error:string -> unit
-> activity_timed_out_event_details

val make_execution_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> execution_failed_event_details

val make_execution_started_event_details :
  ?state_machine_version_arn:string ->
  ?state_machine_alias_arn:string ->
  ?role_arn:string ->
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  unit
-> execution_started_event_details

val make_execution_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  unit
-> execution_succeeded_event_details

val make_execution_aborted_event_details :
  ?cause:string -> ?error:string -> unit
-> execution_aborted_event_details

val make_execution_timed_out_event_details :
  ?cause:string -> ?error:string -> unit
-> execution_timed_out_event_details

val make_execution_redriven_event_details : ?redrive_count:int -> unit
-> execution_redriven_event_details

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
  unit -> history_event

val make_get_execution_history_output :
  ?next_token:string -> events:history_event list -> unit
-> get_execution_history_output

val make_get_execution_history_input :
  ?include_execution_data:bool ->
  ?next_token:string ->
  ?reverse_order:bool ->
  ?max_results:int ->
  execution_arn:string ->
  unit -> get_execution_history_input

val make_get_activity_task_output :
  ?input:string -> ?task_token:string -> unit
-> get_activity_task_output

val make_get_activity_task_input :
  ?worker_name:string -> activity_arn:string -> unit
-> get_activity_task_input

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

val make_describe_state_machine_input : state_machine_arn:string -> unit
-> describe_state_machine_input

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

val make_describe_state_machine_for_execution_input :
  execution_arn:string -> unit
-> describe_state_machine_for_execution_input

val make_describe_state_machine_alias_output :
  ?update_date:float ->
  ?creation_date:float ->
  ?routing_configuration:routing_configuration_list_item list ->
  ?description:string ->
  ?name:string ->
  ?state_machine_alias_arn:string ->
  unit
-> describe_state_machine_alias_output

val make_describe_state_machine_alias_input :
  state_machine_alias_arn:string -> unit
-> describe_state_machine_alias_input

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
  unit -> describe_map_run_output

val make_describe_map_run_input : map_run_arn:string -> unit
-> describe_map_run_input

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
  unit -> describe_execution_output

val make_describe_execution_input : execution_arn:string -> unit
-> describe_execution_input

val make_describe_activity_output :
  creation_date:float -> name:string -> activity_arn:string -> unit
-> describe_activity_output

val make_describe_activity_input : activity_arn:string -> unit
-> describe_activity_input

val make_delete_state_machine_version_output : unit
-> delete_state_machine_version_output

val make_delete_state_machine_version_input :
  state_machine_version_arn:string -> unit
-> delete_state_machine_version_input

val make_delete_state_machine_output : unit
-> delete_state_machine_output

val make_delete_state_machine_input : state_machine_arn:string -> unit
-> delete_state_machine_input

val make_delete_state_machine_alias_output : unit
-> delete_state_machine_alias_output

val make_delete_state_machine_alias_input :
  state_machine_alias_arn:string -> unit
-> delete_state_machine_alias_input

val make_delete_activity_output : unit
-> delete_activity_output

val make_delete_activity_input : activity_arn:string -> unit
-> delete_activity_input

val make_create_state_machine_output :
  ?state_machine_version_arn:string ->
  creation_date:float ->
  state_machine_arn:string ->
  unit -> create_state_machine_output

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

val make_create_state_machine_alias_output :
  creation_date:float -> state_machine_alias_arn:string -> unit
-> create_state_machine_alias_output

val make_create_state_machine_alias_input :
  ?description:string ->
  routing_configuration:routing_configuration_list_item list ->
  name:string ->
  unit -> create_state_machine_alias_input

val make_create_activity_output :
  creation_date:float -> activity_arn:string -> unit
-> create_activity_output

val make_create_activity_input : ?tags:tag list -> name:string -> unit
-> create_activity_input

module ValidateStateMachineDefinition : sig
  val request :
    Smaws_Lib.Context.t ->
      validate_state_machine_definition_input ->
        (validate_state_machine_definition_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      update_state_machine_alias_input ->
        (update_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `StateMachineDeleting of state_machine_deleting
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      update_state_machine_input ->
        (update_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `InvalidDefinition of invalid_definition
            | `InvalidLoggingConfiguration of invalid_logging_configuration
            | `InvalidTracingConfiguration of invalid_tracing_configuration
            | `MissingRequiredParameter of missing_required_parameter
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateMapRun : sig
  val request :
    Smaws_Lib.Context.t ->
      update_map_run_input ->
        (update_map_run_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            
        ]
      ) result
end

module TestState : sig
  val request :
    Smaws_Lib.Context.t ->
      test_state_input ->
        (test_state_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidDefinition of invalid_definition
            | `InvalidExecutionInput of invalid_execution_input
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `TooManyTags of too_many_tags
            
        ]
      ) result
end

module StopExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_execution_input ->
        (stop_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module StartSyncExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_sync_execution_input ->
        (start_sync_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidExecutionInput of invalid_execution_input
            | `InvalidName of invalid_name
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `StateMachineTypeNotSupported of state_machine_type_not_supported
            
        ]
      ) result
end

module StartExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_execution_input ->
        (start_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionAlreadyExists of execution_already_exists
            | `ExecutionLimitExceeded of execution_limit_exceeded
            | `InvalidArn of invalid_arn
            | `InvalidExecutionInput of invalid_execution_input
            | `InvalidName of invalid_name
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module SendTaskSuccess : sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_success_input ->
        (send_task_success_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidOutput of invalid_output
            | `InvalidToken of invalid_token
            | `TaskDoesNotExist of task_does_not_exist
            | `TaskTimedOut of task_timed_out
            
        ]
      ) result
end

module SendTaskHeartbeat : sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_heartbeat_input ->
        (send_task_heartbeat_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            | `TaskDoesNotExist of task_does_not_exist
            | `TaskTimedOut of task_timed_out
            
        ]
      ) result
end

module SendTaskFailure : sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_failure_input ->
        (send_task_failure_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            | `TaskDoesNotExist of task_does_not_exist
            | `TaskTimedOut of task_timed_out
            
        ]
      ) result
end

module RedriveExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      redrive_execution_input ->
        (redrive_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `ExecutionLimitExceeded of execution_limit_exceeded
            | `ExecutionNotRedrivable of execution_not_redrivable
            | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module PublishStateMachineVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      publish_state_machine_version_input ->
        (publish_state_machine_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            
        ]
      ) result
end

module ListStateMachines : sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machines_input ->
        (list_state_machines_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            
        ]
      ) result
end

module ListStateMachineVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machine_versions_input ->
        (list_state_machine_versions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListStateMachineAliases : sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machine_aliases_input ->
        (list_state_machine_aliases_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            | `ResourceNotFound of resource_not_found
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            
        ]
      ) result
end

module ListMapRuns : sig
  val request :
    Smaws_Lib.Context.t ->
      list_map_runs_input ->
        (list_map_runs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            
        ]
      ) result
end

module ListExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_executions_input ->
        (list_executions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            | `ResourceNotFound of resource_not_found
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `StateMachineTypeNotSupported of state_machine_type_not_supported
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListActivities : sig
  val request :
    Smaws_Lib.Context.t ->
      list_activities_input ->
        (list_activities_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            
        ]
      ) result
end

module GetExecutionHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_execution_history_input ->
        (get_execution_history_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            
        ]
      ) result
end

module GetActivityTask : sig
  val request :
    Smaws_Lib.Context.t ->
      get_activity_task_input ->
        (get_activity_task_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ActivityDoesNotExist of activity_does_not_exist
            | `ActivityWorkerLimitExceeded of activity_worker_limit_exceeded
            | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module DescribeStateMachineForExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_for_execution_input ->
        (describe_state_machine_for_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module DescribeStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_alias_input ->
        (describe_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_input ->
        (describe_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            
        ]
      ) result
end

module DescribeMapRun : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_map_run_input ->
        (describe_map_run_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            
        ]
      ) result
end

module DescribeExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_execution_input ->
        (describe_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module DescribeActivity : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activity_input ->
        (describe_activity_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ActivityDoesNotExist of activity_does_not_exist
            | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module DeleteStateMachineVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_version_input ->
        (delete_state_machine_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_alias_input ->
        (delete_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_input ->
        (delete_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteActivity : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activity_input ->
        (delete_activity_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module CreateStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_state_machine_alias_input ->
        (create_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `InvalidName of invalid_name
            | `ResourceNotFound of resource_not_found
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `StateMachineDeleting of state_machine_deleting
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      create_state_machine_input ->
        (create_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `InvalidDefinition of invalid_definition
            | `InvalidLoggingConfiguration of invalid_logging_configuration
            | `InvalidName of invalid_name
            | `InvalidTracingConfiguration of invalid_tracing_configuration
            | `StateMachineAlreadyExists of state_machine_already_exists
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineLimitExceeded of state_machine_limit_exceeded
            | `StateMachineTypeNotSupported of state_machine_type_not_supported
            | `TooManyTags of too_many_tags
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateActivity : sig
  val request :
    Smaws_Lib.Context.t ->
      create_activity_input ->
        (create_activity_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ActivityLimitExceeded of activity_limit_exceeded
            | `InvalidName of invalid_name
            | `TooManyTags of too_many_tags
            
        ]
      ) result
end

