open Smaws_Lib
let service =
  Service.{
    namespace = "swf";
    endpointPrefix = "swf";
    version = "2012-01-25";
    protocol = AwsJson_1_0
  };
type workflow_type = {
  version: string;
  name: string
}

type registration_status = | DEPRECATED
  | REGISTERED

type workflow_type_info = {
  deprecation_date: float option;
  creation_date: float;
  description: string option;
  status: registration_status;
  workflow_type: workflow_type
}

type workflow_type_infos = {
  next_page_token: string option;
  type_infos: workflow_type_info list
}

type workflow_type_filter = {
  version: string option;
  name: string
}

type task_list = {
  name: string
}

type child_policy = | ABANDON
  | REQUEST_CANCEL
  | TERMINATE

type workflow_type_configuration = {
  default_lambda_role: string option;
  default_child_policy: child_policy option;
  default_task_priority: string option;
  default_task_list: task_list option;
  default_execution_start_to_close_timeout: string option;
  default_task_start_to_close_timeout: string option
}

type workflow_type_detail = {
  configuration: workflow_type_configuration;
  type_info: workflow_type_info
}

type workflow_execution_timeout_type = | START_TO_CLOSE

type workflow_execution_timed_out_event_attributes = {
  child_policy: child_policy;
  timeout_type: workflow_execution_timeout_type
}

type workflow_execution_terminated_cause = | OPERATOR_INITIATED
  | EVENT_LIMIT_EXCEEDED
  | CHILD_POLICY_APPLIED

type workflow_execution_terminated_event_attributes = {
  cause: workflow_execution_terminated_cause option;
  child_policy: child_policy;
  details: string option;
  reason: string option
}

type workflow_execution = {
  run_id: string;
  workflow_id: string
}

type workflow_execution_started_event_attributes = {
  lambda_role: string option;
  parent_initiated_event_id: int option;
  parent_workflow_execution: workflow_execution option;
  continued_execution_run_id: string option;
  tag_list: string list option;
  workflow_type: workflow_type;
  task_priority: string option;
  task_list: task_list;
  child_policy: child_policy;
  task_start_to_close_timeout: string option;
  execution_start_to_close_timeout: string option;
  input: string option
}

type workflow_execution_signaled_event_attributes = {
  external_initiated_event_id: int option;
  external_workflow_execution: workflow_execution option;
  input: string option;
  signal_name: string
}

type workflow_execution_open_counts = {
  open_lambda_functions: int option;
  open_child_workflow_executions: int;
  open_timers: int;
  open_decision_tasks: int;
  open_activity_tasks: int
}

type execution_status = | CLOSED
  | OPEN

type close_status = | TIMED_OUT
  | CONTINUED_AS_NEW
  | TERMINATED
  | CANCELED
  | FAILED
  | COMPLETED

type workflow_execution_info = {
  cancel_requested: bool option;
  tag_list: string list option;
  parent: workflow_execution option;
  close_status: close_status option;
  execution_status: execution_status;
  close_timestamp: float option;
  start_timestamp: float;
  workflow_type: workflow_type;
  execution: workflow_execution
}

type workflow_execution_infos = {
  next_page_token: string option;
  execution_infos: workflow_execution_info list
}

type workflow_execution_filter = {
  workflow_id: string
}

type workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  details: string option;
  reason: string option
}

type workflow_execution_configuration = {
  lambda_role: string option;
  child_policy: child_policy;
  task_priority: string option;
  task_list: task_list;
  execution_start_to_close_timeout: string;
  task_start_to_close_timeout: string
}

type workflow_execution_detail = {
  latest_execution_context: string option;
  latest_activity_task_timestamp: float option;
  open_counts: workflow_execution_open_counts;
  execution_configuration: workflow_execution_configuration;
  execution_info: workflow_execution_info
}

type workflow_execution_count = {
  truncated: bool option;
  count: int
}

type workflow_execution_continued_as_new_event_attributes = {
  lambda_role: string option;
  workflow_type: workflow_type;
  tag_list: string list option;
  child_policy: child_policy;
  task_start_to_close_timeout: string option;
  task_priority: string option;
  task_list: task_list;
  execution_start_to_close_timeout: string option;
  new_execution_run_id: string;
  decision_task_completed_event_id: int;
  input: string option
}

type workflow_execution_completed_event_attributes = {
  decision_task_completed_event_id: int;
  result: string option
}

type workflow_execution_canceled_event_attributes = {
  decision_task_completed_event_id: int;
  details: string option
}

type workflow_execution_cancel_requested_cause = | CHILD_POLICY_APPLIED

type workflow_execution_cancel_requested_event_attributes = {
  cause: workflow_execution_cancel_requested_cause option;
  external_initiated_event_id: int option;
  external_workflow_execution: workflow_execution option
}

type workflow_execution_already_started_fault = {
  message: string option
}

type untag_resource_input = {
  tag_keys: string list;
  resource_arn: string
}

type unknown_resource_fault = {
  message: string option
}

type operation_not_permitted_fault = {
  message: string option
}

type limit_exceeded_fault = {
  message: string option
}

type undeprecate_workflow_type_input = {
  workflow_type: workflow_type;
  domain: string
}

type type_already_exists_fault = {
  message: string option
}

type undeprecate_domain_input = {
  name: string
}

type domain_already_exists_fault = {
  message: string option
}

type activity_type = {
  version: string;
  name: string
}

type undeprecate_activity_type_input = {
  activity_type: activity_type;
  domain: string
}

type type_not_deprecated_fault = {
  message: string option
}

type type_deprecated_fault = {
  message: string option
}

type too_many_tags_fault = {
  message: string option
}

type timer_started_event_attributes = {
  decision_task_completed_event_id: int;
  start_to_fire_timeout: string;
  control: string option;
  timer_id: string
}

type timer_fired_event_attributes = {
  started_event_id: int;
  timer_id: string
}

type timer_canceled_event_attributes = {
  decision_task_completed_event_id: int;
  started_event_id: int;
  timer_id: string
}

type terminate_workflow_execution_input = {
  child_policy: child_policy option;
  details: string option;
  reason: string option;
  run_id: string option;
  workflow_id: string;
  domain: string
}

type resource_tag = {
  value: string option;
  key: string
}

type tag_resource_input = {
  tags: resource_tag list;
  resource_arn: string
}

type tag_filter = {
  tag: string
}

type start_workflow_execution_input = {
  lambda_role: string option;
  child_policy: child_policy option;
  task_start_to_close_timeout: string option;
  tag_list: string list option;
  execution_start_to_close_timeout: string option;
  input: string option;
  task_priority: string option;
  task_list: task_list option;
  workflow_type: workflow_type;
  workflow_id: string;
  domain: string
}

type default_undefined_fault = {
  message: string option
}

type run = {
  run_id: string option
}

type start_timer_failed_cause = | OPERATION_NOT_PERMITTED
  | TIMER_CREATION_RATE_EXCEEDED
  | OPEN_TIMERS_LIMIT_EXCEEDED
  | TIMER_ID_ALREADY_IN_USE

type start_timer_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: start_timer_failed_cause;
  timer_id: string
}

type start_timer_decision_attributes = {
  start_to_fire_timeout: string;
  control: string option;
  timer_id: string
}

type start_lambda_function_failed_cause = | ASSUME_ROLE_FAILED

type start_lambda_function_failed_event_attributes = {
  message: string option;
  cause: start_lambda_function_failed_cause option;
  scheduled_event_id: int option
}

type start_child_workflow_execution_initiated_event_attributes = {
  lambda_role: string option;
  tag_list: string list option;
  task_start_to_close_timeout: string option;
  child_policy: child_policy;
  decision_task_completed_event_id: int;
  task_priority: string option;
  task_list: task_list;
  execution_start_to_close_timeout: string option;
  input: string option;
  control: string option;
  workflow_type: workflow_type;
  workflow_id: string
}

type start_child_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | DEFAULT_CHILD_POLICY_UNDEFINED
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | DEFAULT_TASK_LIST_UNDEFINED
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | WORKFLOW_ALREADY_RUNNING
  | CHILD_CREATION_RATE_EXCEEDED
  | OPEN_WORKFLOWS_LIMIT_EXCEEDED
  | OPEN_CHILDREN_LIMIT_EXCEEDED
  | WORKFLOW_TYPE_DEPRECATED
  | WORKFLOW_TYPE_DOES_NOT_EXIST

type start_child_workflow_execution_failed_event_attributes = {
  control: string option;
  decision_task_completed_event_id: int;
  initiated_event_id: int;
  workflow_id: string;
  cause: start_child_workflow_execution_failed_cause;
  workflow_type: workflow_type
}

type start_child_workflow_execution_decision_attributes = {
  lambda_role: string option;
  tag_list: string list option;
  child_policy: child_policy option;
  task_start_to_close_timeout: string option;
  task_priority: string option;
  task_list: task_list option;
  execution_start_to_close_timeout: string option;
  input: string option;
  control: string option;
  workflow_id: string;
  workflow_type: workflow_type
}

type signal_workflow_execution_input = {
  input: string option;
  signal_name: string;
  run_id: string option;
  workflow_id: string;
  domain: string
}

type decision_type = | ScheduleLambdaFunction
  | StartChildWorkflowExecution
  | RequestCancelExternalWorkflowExecution
  | SignalExternalWorkflowExecution
  | CancelTimer
  | StartTimer
  | RecordMarker
  | ContinueAsNewWorkflowExecution
  | CancelWorkflowExecution
  | FailWorkflowExecution
  | CompleteWorkflowExecution
  | RequestCancelActivityTask
  | ScheduleActivityTask

type schedule_activity_task_decision_attributes = {
  heartbeat_timeout: string option;
  start_to_close_timeout: string option;
  schedule_to_start_timeout: string option;
  task_priority: string option;
  task_list: task_list option;
  schedule_to_close_timeout: string option;
  input: string option;
  control: string option;
  activity_id: string;
  activity_type: activity_type
}

type request_cancel_activity_task_decision_attributes = {
  activity_id: string
}

type complete_workflow_execution_decision_attributes = {
  result: string option
}

type fail_workflow_execution_decision_attributes = {
  details: string option;
  reason: string option
}

type cancel_workflow_execution_decision_attributes = {
  details: string option
}

type continue_as_new_workflow_execution_decision_attributes = {
  lambda_role: string option;
  workflow_type_version: string option;
  tag_list: string list option;
  child_policy: child_policy option;
  task_start_to_close_timeout: string option;
  task_priority: string option;
  task_list: task_list option;
  execution_start_to_close_timeout: string option;
  input: string option
}

type record_marker_decision_attributes = {
  details: string option;
  marker_name: string
}

type cancel_timer_decision_attributes = {
  timer_id: string
}

type signal_external_workflow_execution_decision_attributes = {
  control: string option;
  input: string option;
  signal_name: string;
  run_id: string option;
  workflow_id: string
}

type request_cancel_external_workflow_execution_decision_attributes = {
  control: string option;
  run_id: string option;
  workflow_id: string
}

type schedule_lambda_function_decision_attributes = {
  start_to_close_timeout: string option;
  input: string option;
  control: string option;
  name: string;
  id: string
}

type decision = {
  schedule_lambda_function_decision_attributes: schedule_lambda_function_decision_attributes option;
  start_child_workflow_execution_decision_attributes: start_child_workflow_execution_decision_attributes option;
  request_cancel_external_workflow_execution_decision_attributes: request_cancel_external_workflow_execution_decision_attributes option;
  signal_external_workflow_execution_decision_attributes: signal_external_workflow_execution_decision_attributes option;
  cancel_timer_decision_attributes: cancel_timer_decision_attributes option;
  start_timer_decision_attributes: start_timer_decision_attributes option;
  record_marker_decision_attributes: record_marker_decision_attributes option;
  continue_as_new_workflow_execution_decision_attributes: continue_as_new_workflow_execution_decision_attributes option;
  cancel_workflow_execution_decision_attributes: cancel_workflow_execution_decision_attributes option;
  fail_workflow_execution_decision_attributes: fail_workflow_execution_decision_attributes option;
  complete_workflow_execution_decision_attributes: complete_workflow_execution_decision_attributes option;
  request_cancel_activity_task_decision_attributes: request_cancel_activity_task_decision_attributes option;
  schedule_activity_task_decision_attributes: schedule_activity_task_decision_attributes option;
  decision_type: decision_type
}

type respond_decision_task_completed_input = {
  task_list_schedule_to_start_timeout: string option;
  task_list: task_list option;
  execution_context: string option;
  decisions: decision list option;
  task_token: string
}

type respond_activity_task_failed_input = {
  details: string option;
  reason: string option;
  task_token: string
}

type respond_activity_task_completed_input = {
  result: string option;
  task_token: string
}

type respond_activity_task_canceled_input = {
  details: string option;
  task_token: string
}

type request_cancel_workflow_execution_input = {
  run_id: string option;
  workflow_id: string;
  domain: string
}

type register_workflow_type_input = {
  default_lambda_role: string option;
  default_child_policy: child_policy option;
  default_task_priority: string option;
  default_task_list: task_list option;
  default_execution_start_to_close_timeout: string option;
  default_task_start_to_close_timeout: string option;
  description: string option;
  version: string;
  name: string;
  domain: string
}

type register_domain_input = {
  tags: resource_tag list option;
  workflow_execution_retention_period_in_days: string;
  description: string option;
  name: string
}

type register_activity_type_input = {
  default_task_schedule_to_close_timeout: string option;
  default_task_schedule_to_start_timeout: string option;
  default_task_priority: string option;
  default_task_list: task_list option;
  default_task_heartbeat_timeout: string option;
  default_task_start_to_close_timeout: string option;
  description: string option;
  version: string;
  name: string;
  domain: string
}

type activity_task_status = {
  cancel_requested: bool
}

type record_activity_task_heartbeat_input = {
  details: string option;
  task_token: string
}

type event_type = | StartLambdaFunctionFailed
  | ScheduleLambdaFunctionFailed
  | LambdaFunctionTimedOut
  | LambdaFunctionFailed
  | LambdaFunctionCompleted
  | LambdaFunctionStarted
  | LambdaFunctionScheduled
  | ExternalWorkflowExecutionCancelRequested
  | RequestCancelExternalWorkflowExecutionFailed
  | RequestCancelExternalWorkflowExecutionInitiated
  | ExternalWorkflowExecutionSignaled
  | SignalExternalWorkflowExecutionFailed
  | SignalExternalWorkflowExecutionInitiated
  | ChildWorkflowExecutionTerminated
  | ChildWorkflowExecutionCanceled
  | ChildWorkflowExecutionTimedOut
  | ChildWorkflowExecutionFailed
  | ChildWorkflowExecutionCompleted
  | ChildWorkflowExecutionStarted
  | StartChildWorkflowExecutionFailed
  | StartChildWorkflowExecutionInitiated
  | CancelTimerFailed
  | TimerCanceled
  | TimerFired
  | StartTimerFailed
  | TimerStarted
  | RecordMarkerFailed
  | MarkerRecorded
  | WorkflowExecutionSignaled
  | RequestCancelActivityTaskFailed
  | ActivityTaskCancelRequested
  | ActivityTaskCanceled
  | ActivityTaskTimedOut
  | ActivityTaskFailed
  | ActivityTaskCompleted
  | ActivityTaskStarted
  | ScheduleActivityTaskFailed
  | ActivityTaskScheduled
  | DecisionTaskTimedOut
  | DecisionTaskCompleted
  | DecisionTaskStarted
  | DecisionTaskScheduled
  | WorkflowExecutionTerminated
  | ContinueAsNewWorkflowExecutionFailed
  | WorkflowExecutionContinuedAsNew
  | CancelWorkflowExecutionFailed
  | WorkflowExecutionCanceled
  | WorkflowExecutionTimedOut
  | FailWorkflowExecutionFailed
  | WorkflowExecutionFailed
  | CompleteWorkflowExecutionFailed
  | WorkflowExecutionCompleted
  | WorkflowExecutionCancelRequested
  | WorkflowExecutionStarted

type complete_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | UNHANDLED_DECISION

type complete_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: complete_workflow_execution_failed_cause
}

type fail_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | UNHANDLED_DECISION

type fail_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: fail_workflow_execution_failed_cause
}

type cancel_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | UNHANDLED_DECISION

type cancel_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: cancel_workflow_execution_failed_cause
}

type continue_as_new_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED
  | DEFAULT_CHILD_POLICY_UNDEFINED
  | DEFAULT_TASK_LIST_UNDEFINED
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | WORKFLOW_TYPE_DOES_NOT_EXIST
  | WORKFLOW_TYPE_DEPRECATED
  | UNHANDLED_DECISION

type continue_as_new_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: continue_as_new_workflow_execution_failed_cause
}

type decision_task_scheduled_event_attributes = {
  schedule_to_start_timeout: string option;
  start_to_close_timeout: string option;
  task_priority: string option;
  task_list: task_list
}

type decision_task_started_event_attributes = {
  scheduled_event_id: int;
  identity: string option
}

type decision_task_completed_event_attributes = {
  task_list_schedule_to_start_timeout: string option;
  task_list: task_list option;
  started_event_id: int;
  scheduled_event_id: int;
  execution_context: string option
}

type decision_task_timeout_type = | SCHEDULE_TO_START
  | START_TO_CLOSE

type decision_task_timed_out_event_attributes = {
  started_event_id: int;
  scheduled_event_id: int;
  timeout_type: decision_task_timeout_type
}

type activity_task_scheduled_event_attributes = {
  heartbeat_timeout: string option;
  decision_task_completed_event_id: int;
  task_priority: string option;
  task_list: task_list;
  start_to_close_timeout: string option;
  schedule_to_close_timeout: string option;
  schedule_to_start_timeout: string option;
  control: string option;
  input: string option;
  activity_id: string;
  activity_type: activity_type
}

type activity_task_started_event_attributes = {
  scheduled_event_id: int;
  identity: string option
}

type activity_task_completed_event_attributes = {
  started_event_id: int;
  scheduled_event_id: int;
  result: string option
}

type activity_task_failed_event_attributes = {
  started_event_id: int;
  scheduled_event_id: int;
  details: string option;
  reason: string option
}

type activity_task_timeout_type = | HEARTBEAT
  | SCHEDULE_TO_CLOSE
  | SCHEDULE_TO_START
  | START_TO_CLOSE

type activity_task_timed_out_event_attributes = {
  details: string option;
  started_event_id: int;
  scheduled_event_id: int;
  timeout_type: activity_task_timeout_type
}

type activity_task_canceled_event_attributes = {
  latest_cancel_requested_event_id: int option;
  started_event_id: int;
  scheduled_event_id: int;
  details: string option
}

type activity_task_cancel_requested_event_attributes = {
  activity_id: string;
  decision_task_completed_event_id: int
}

type marker_recorded_event_attributes = {
  decision_task_completed_event_id: int;
  details: string option;
  marker_name: string
}

type record_marker_failed_cause = | OPERATION_NOT_PERMITTED

type record_marker_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: record_marker_failed_cause;
  marker_name: string
}

type child_workflow_execution_started_event_attributes = {
  initiated_event_id: int;
  workflow_type: workflow_type;
  workflow_execution: workflow_execution
}

type child_workflow_execution_completed_event_attributes = {
  started_event_id: int;
  initiated_event_id: int;
  result: string option;
  workflow_type: workflow_type;
  workflow_execution: workflow_execution
}

type child_workflow_execution_failed_event_attributes = {
  started_event_id: int;
  initiated_event_id: int;
  details: string option;
  reason: string option;
  workflow_type: workflow_type;
  workflow_execution: workflow_execution
}

type child_workflow_execution_timed_out_event_attributes = {
  started_event_id: int;
  initiated_event_id: int;
  timeout_type: workflow_execution_timeout_type;
  workflow_type: workflow_type;
  workflow_execution: workflow_execution
}

type child_workflow_execution_canceled_event_attributes = {
  started_event_id: int;
  initiated_event_id: int;
  details: string option;
  workflow_type: workflow_type;
  workflow_execution: workflow_execution
}

type child_workflow_execution_terminated_event_attributes = {
  started_event_id: int;
  initiated_event_id: int;
  workflow_type: workflow_type;
  workflow_execution: workflow_execution
}

type signal_external_workflow_execution_initiated_event_attributes = {
  control: string option;
  decision_task_completed_event_id: int;
  input: string option;
  signal_name: string;
  run_id: string option;
  workflow_id: string
}

type external_workflow_execution_signaled_event_attributes = {
  initiated_event_id: int;
  workflow_execution: workflow_execution
}

type signal_external_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION

type signal_external_workflow_execution_failed_event_attributes = {
  control: string option;
  decision_task_completed_event_id: int;
  initiated_event_id: int;
  cause: signal_external_workflow_execution_failed_cause;
  run_id: string option;
  workflow_id: string
}

type external_workflow_execution_cancel_requested_event_attributes = {
  initiated_event_id: int;
  workflow_execution: workflow_execution
}

type request_cancel_external_workflow_execution_initiated_event_attributes = {
  control: string option;
  decision_task_completed_event_id: int;
  run_id: string option;
  workflow_id: string
}

type request_cancel_external_workflow_execution_failed_cause = | OPERATION_NOT_PERMITTED
  | REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION

type request_cancel_external_workflow_execution_failed_event_attributes = {
  control: string option;
  decision_task_completed_event_id: int;
  initiated_event_id: int;
  cause: request_cancel_external_workflow_execution_failed_cause;
  run_id: string option;
  workflow_id: string
}

type schedule_activity_task_failed_cause = | OPERATION_NOT_PERMITTED
  | DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED
  | DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED
  | DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED
  | DEFAULT_TASK_LIST_UNDEFINED
  | DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED
  | ACTIVITY_CREATION_RATE_EXCEEDED
  | OPEN_ACTIVITIES_LIMIT_EXCEEDED
  | ACTIVITY_ID_ALREADY_IN_USE
  | ACTIVITY_TYPE_DOES_NOT_EXIST
  | ACTIVITY_TYPE_DEPRECATED

type schedule_activity_task_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: schedule_activity_task_failed_cause;
  activity_id: string;
  activity_type: activity_type
}

type request_cancel_activity_task_failed_cause = | OPERATION_NOT_PERMITTED
  | ACTIVITY_ID_UNKNOWN

type request_cancel_activity_task_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: request_cancel_activity_task_failed_cause;
  activity_id: string
}

type cancel_timer_failed_cause = | OPERATION_NOT_PERMITTED
  | TIMER_ID_UNKNOWN

type cancel_timer_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: cancel_timer_failed_cause;
  timer_id: string
}

type lambda_function_scheduled_event_attributes = {
  decision_task_completed_event_id: int;
  start_to_close_timeout: string option;
  input: string option;
  control: string option;
  name: string;
  id: string
}

type lambda_function_started_event_attributes = {
  scheduled_event_id: int
}

type lambda_function_completed_event_attributes = {
  result: string option;
  started_event_id: int;
  scheduled_event_id: int
}

type lambda_function_failed_event_attributes = {
  details: string option;
  reason: string option;
  started_event_id: int;
  scheduled_event_id: int
}

type lambda_function_timeout_type = | START_TO_CLOSE

type lambda_function_timed_out_event_attributes = {
  timeout_type: lambda_function_timeout_type option;
  started_event_id: int;
  scheduled_event_id: int
}

type schedule_lambda_function_failed_cause = | LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION
  | LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED
  | OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED
  | ID_ALREADY_IN_USE

type schedule_lambda_function_failed_event_attributes = {
  decision_task_completed_event_id: int;
  cause: schedule_lambda_function_failed_cause;
  name: string;
  id: string
}

type history_event = {
  start_lambda_function_failed_event_attributes: start_lambda_function_failed_event_attributes option;
  schedule_lambda_function_failed_event_attributes: schedule_lambda_function_failed_event_attributes option;
  lambda_function_timed_out_event_attributes: lambda_function_timed_out_event_attributes option;
  lambda_function_failed_event_attributes: lambda_function_failed_event_attributes option;
  lambda_function_completed_event_attributes: lambda_function_completed_event_attributes option;
  lambda_function_started_event_attributes: lambda_function_started_event_attributes option;
  lambda_function_scheduled_event_attributes: lambda_function_scheduled_event_attributes option;
  start_child_workflow_execution_failed_event_attributes: start_child_workflow_execution_failed_event_attributes option;
  cancel_timer_failed_event_attributes: cancel_timer_failed_event_attributes option;
  start_timer_failed_event_attributes: start_timer_failed_event_attributes option;
  request_cancel_activity_task_failed_event_attributes: request_cancel_activity_task_failed_event_attributes option;
  schedule_activity_task_failed_event_attributes: schedule_activity_task_failed_event_attributes option;
  request_cancel_external_workflow_execution_failed_event_attributes: request_cancel_external_workflow_execution_failed_event_attributes option;
  request_cancel_external_workflow_execution_initiated_event_attributes: request_cancel_external_workflow_execution_initiated_event_attributes option;
  external_workflow_execution_cancel_requested_event_attributes: external_workflow_execution_cancel_requested_event_attributes option;
  signal_external_workflow_execution_failed_event_attributes: signal_external_workflow_execution_failed_event_attributes option;
  external_workflow_execution_signaled_event_attributes: external_workflow_execution_signaled_event_attributes option;
  signal_external_workflow_execution_initiated_event_attributes: signal_external_workflow_execution_initiated_event_attributes option;
  child_workflow_execution_terminated_event_attributes: child_workflow_execution_terminated_event_attributes option;
  child_workflow_execution_canceled_event_attributes: child_workflow_execution_canceled_event_attributes option;
  child_workflow_execution_timed_out_event_attributes: child_workflow_execution_timed_out_event_attributes option;
  child_workflow_execution_failed_event_attributes: child_workflow_execution_failed_event_attributes option;
  child_workflow_execution_completed_event_attributes: child_workflow_execution_completed_event_attributes option;
  child_workflow_execution_started_event_attributes: child_workflow_execution_started_event_attributes option;
  start_child_workflow_execution_initiated_event_attributes: start_child_workflow_execution_initiated_event_attributes option;
  timer_canceled_event_attributes: timer_canceled_event_attributes option;
  timer_fired_event_attributes: timer_fired_event_attributes option;
  timer_started_event_attributes: timer_started_event_attributes option;
  record_marker_failed_event_attributes: record_marker_failed_event_attributes option;
  marker_recorded_event_attributes: marker_recorded_event_attributes option;
  workflow_execution_signaled_event_attributes: workflow_execution_signaled_event_attributes option;
  activity_task_cancel_requested_event_attributes: activity_task_cancel_requested_event_attributes option;
  activity_task_canceled_event_attributes: activity_task_canceled_event_attributes option;
  activity_task_timed_out_event_attributes: activity_task_timed_out_event_attributes option;
  activity_task_failed_event_attributes: activity_task_failed_event_attributes option;
  activity_task_completed_event_attributes: activity_task_completed_event_attributes option;
  activity_task_started_event_attributes: activity_task_started_event_attributes option;
  activity_task_scheduled_event_attributes: activity_task_scheduled_event_attributes option;
  decision_task_timed_out_event_attributes: decision_task_timed_out_event_attributes option;
  decision_task_completed_event_attributes: decision_task_completed_event_attributes option;
  decision_task_started_event_attributes: decision_task_started_event_attributes option;
  decision_task_scheduled_event_attributes: decision_task_scheduled_event_attributes option;
  workflow_execution_cancel_requested_event_attributes: workflow_execution_cancel_requested_event_attributes option;
  workflow_execution_terminated_event_attributes: workflow_execution_terminated_event_attributes option;
  continue_as_new_workflow_execution_failed_event_attributes: continue_as_new_workflow_execution_failed_event_attributes option;
  workflow_execution_continued_as_new_event_attributes: workflow_execution_continued_as_new_event_attributes option;
  cancel_workflow_execution_failed_event_attributes: cancel_workflow_execution_failed_event_attributes option;
  workflow_execution_canceled_event_attributes: workflow_execution_canceled_event_attributes option;
  workflow_execution_timed_out_event_attributes: workflow_execution_timed_out_event_attributes option;
  fail_workflow_execution_failed_event_attributes: fail_workflow_execution_failed_event_attributes option;
  workflow_execution_failed_event_attributes: workflow_execution_failed_event_attributes option;
  complete_workflow_execution_failed_event_attributes: complete_workflow_execution_failed_event_attributes option;
  workflow_execution_completed_event_attributes: workflow_execution_completed_event_attributes option;
  workflow_execution_started_event_attributes: workflow_execution_started_event_attributes option;
  event_id: int;
  event_type: event_type;
  event_timestamp: float
}

type decision_task = {
  previous_started_event_id: int option;
  next_page_token: string option;
  events: history_event list;
  workflow_type: workflow_type;
  workflow_execution: workflow_execution;
  started_event_id: int;
  task_token: string
}

type poll_for_decision_task_input = {
  start_at_previous_started_event: bool option;
  reverse_order: bool option;
  maximum_page_size: int option;
  next_page_token: string option;
  identity: string option;
  task_list: task_list;
  domain: string
}

type activity_task = {
  input: string option;
  activity_type: activity_type;
  workflow_execution: workflow_execution;
  started_event_id: int;
  activity_id: string;
  task_token: string
}

type poll_for_activity_task_input = {
  identity: string option;
  task_list: task_list;
  domain: string
}

type list_workflow_types_input = {
  reverse_order: bool option;
  maximum_page_size: int option;
  next_page_token: string option;
  registration_status: registration_status;
  name: string option;
  domain: string
}

type list_tags_for_resource_output = {
  tags: resource_tag list option
}

type list_tags_for_resource_input = {
  resource_arn: string
}

type execution_time_filter = {
  latest_date: float option;
  oldest_date: float
}

type list_open_workflow_executions_input = {
  execution_filter: workflow_execution_filter option;
  reverse_order: bool option;
  maximum_page_size: int option;
  next_page_token: string option;
  tag_filter: tag_filter option;
  type_filter: workflow_type_filter option;
  start_time_filter: execution_time_filter;
  domain: string
}

type domain_info = {
  arn: string option;
  description: string option;
  status: registration_status;
  name: string
}

type domain_infos = {
  next_page_token: string option;
  domain_infos: domain_info list
}

type list_domains_input = {
  reverse_order: bool option;
  maximum_page_size: int option;
  registration_status: registration_status;
  next_page_token: string option
}

type close_status_filter = {
  status: close_status
}

type list_closed_workflow_executions_input = {
  reverse_order: bool option;
  maximum_page_size: int option;
  next_page_token: string option;
  tag_filter: tag_filter option;
  type_filter: workflow_type_filter option;
  close_status_filter: close_status_filter option;
  execution_filter: workflow_execution_filter option;
  close_time_filter: execution_time_filter option;
  start_time_filter: execution_time_filter option;
  domain: string
}

type activity_type_info = {
  deprecation_date: float option;
  creation_date: float;
  description: string option;
  status: registration_status;
  activity_type: activity_type
}

type activity_type_infos = {
  next_page_token: string option;
  type_infos: activity_type_info list
}

type list_activity_types_input = {
  reverse_order: bool option;
  maximum_page_size: int option;
  next_page_token: string option;
  registration_status: registration_status;
  name: string option;
  domain: string
}

type history = {
  next_page_token: string option;
  events: history_event list
}

type get_workflow_execution_history_input = {
  reverse_order: bool option;
  maximum_page_size: int option;
  next_page_token: string option;
  execution: workflow_execution;
  domain: string
}

type describe_workflow_type_input = {
  workflow_type: workflow_type;
  domain: string
}

type describe_workflow_execution_input = {
  execution: workflow_execution;
  domain: string
}

type domain_configuration = {
  workflow_execution_retention_period_in_days: string
}

type domain_detail = {
  configuration: domain_configuration;
  domain_info: domain_info
}

type describe_domain_input = {
  name: string
}

type activity_type_configuration = {
  default_task_schedule_to_close_timeout: string option;
  default_task_schedule_to_start_timeout: string option;
  default_task_priority: string option;
  default_task_list: task_list option;
  default_task_heartbeat_timeout: string option;
  default_task_start_to_close_timeout: string option
}

type activity_type_detail = {
  configuration: activity_type_configuration;
  type_info: activity_type_info
}

type describe_activity_type_input = {
  activity_type: activity_type;
  domain: string
}

type deprecate_workflow_type_input = {
  workflow_type: workflow_type;
  domain: string
}

type domain_deprecated_fault = {
  message: string option
}

type deprecate_domain_input = {
  name: string
}

type deprecate_activity_type_input = {
  activity_type: activity_type;
  domain: string
}

type delete_workflow_type_input = {
  workflow_type: workflow_type;
  domain: string
}

type delete_activity_type_input = {
  activity_type: activity_type;
  domain: string
}

type pending_task_count = {
  truncated: bool option;
  count: int
}

type count_pending_decision_tasks_input = {
  task_list: task_list;
  domain: string
}

type count_pending_activity_tasks_input = {
  task_list: task_list;
  domain: string
}

type count_open_workflow_executions_input = {
  execution_filter: workflow_execution_filter option;
  tag_filter: tag_filter option;
  type_filter: workflow_type_filter option;
  start_time_filter: execution_time_filter;
  domain: string
}

type count_closed_workflow_executions_input = {
  close_status_filter: close_status_filter option;
  tag_filter: tag_filter option;
  type_filter: workflow_type_filter option;
  execution_filter: workflow_execution_filter option;
  close_time_filter: execution_time_filter option;
  start_time_filter: execution_time_filter option;
  domain: string
}



type base_document = Json.t

