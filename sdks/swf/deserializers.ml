open Smaws_Lib.Json.DeserializeHelpers

open Types

let name_of_yojson = string_of_yojson

let version_of_yojson = string_of_yojson

let workflow_type_of_yojson = 
  fun tree path : workflow_type ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_type = {
    version = value_for_key (version_of_yojson) "version" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    
  }
  in _res

let base_unit_of_yojson = unit_of_yojson

let registration_status_of_yojson = 
  fun (tree: t) path : registration_status -> match tree with 
    | `String "DEPRECATED" -> DEPRECATED
    | `String "REGISTERED" -> REGISTERED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegistrationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationStatus")

let description_of_yojson = string_of_yojson

let timestamp__of_yojson = timestamp_of_yojson

let workflow_type_info_of_yojson = 
  fun tree path : workflow_type_info ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_type_info = {
    deprecation_date = option_of_yojson (value_for_key (timestamp__of_yojson) "deprecationDate") _list path;
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    status = value_for_key (registration_status_of_yojson) "status" _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    
  }
  in _res

let workflow_type_info_list_of_yojson = 
  fun tree path -> list_of_yojson workflow_type_info_of_yojson tree path 

let page_token_of_yojson = string_of_yojson

let workflow_type_infos_of_yojson = 
  fun tree path : workflow_type_infos ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_type_infos = {
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    type_infos = value_for_key (workflow_type_info_list_of_yojson) "typeInfos" _list path;
    
  }
  in _res

let version_optional_of_yojson = string_of_yojson

let workflow_type_filter_of_yojson = 
  fun tree path : workflow_type_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_type_filter = {
    version = option_of_yojson (value_for_key (version_optional_of_yojson) "version") _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    
  }
  in _res

let duration_in_seconds_optional_of_yojson = string_of_yojson

let task_list_of_yojson = 
  fun tree path : task_list ->
  let _list = assoc_of_yojson tree path in
  let _res : task_list = {
    name = value_for_key (name_of_yojson) "name" _list path;
    
  }
  in _res

let task_priority_of_yojson = string_of_yojson

let child_policy_of_yojson = 
  fun (tree: t) path : child_policy -> match tree with 
    | `String "ABANDON" -> ABANDON
    | `String "REQUEST_CANCEL" -> REQUEST_CANCEL
    | `String "TERMINATE" -> TERMINATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChildPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "ChildPolicy")

let arn_of_yojson = string_of_yojson

let workflow_type_configuration_of_yojson = 
  fun tree path : workflow_type_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_type_configuration = {
    default_lambda_role = option_of_yojson (value_for_key (arn_of_yojson) "defaultLambdaRole") _list path;
    default_child_policy = option_of_yojson (value_for_key (child_policy_of_yojson) "defaultChildPolicy") _list path;
    default_task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "defaultTaskPriority") _list path;
    default_task_list = option_of_yojson (value_for_key (task_list_of_yojson) "defaultTaskList") _list path;
    default_execution_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultExecutionStartToCloseTimeout") _list path;
    default_task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskStartToCloseTimeout") _list path;
    
  }
  in _res

let workflow_type_detail_of_yojson = 
  fun tree path : workflow_type_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_type_detail = {
    configuration = value_for_key (workflow_type_configuration_of_yojson) "configuration" _list path;
    type_info = value_for_key (workflow_type_info_of_yojson) "typeInfo" _list path;
    
  }
  in _res

let workflow_run_id_optional_of_yojson = string_of_yojson

let workflow_run_id_of_yojson = string_of_yojson

let workflow_id_of_yojson = string_of_yojson

let workflow_execution_timeout_type_of_yojson = 
  fun (tree: t) path : workflow_execution_timeout_type -> match tree with 
    | `String "START_TO_CLOSE" -> START_TO_CLOSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkflowExecutionTimeoutType" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowExecutionTimeoutType")

let workflow_execution_timed_out_event_attributes_of_yojson = 
  fun tree path : workflow_execution_timed_out_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_timed_out_event_attributes = {
    child_policy = value_for_key (child_policy_of_yojson) "childPolicy" _list path;
    timeout_type = value_for_key (workflow_execution_timeout_type_of_yojson) "timeoutType" _list path;
    
  }
  in _res

let terminate_reason_of_yojson = string_of_yojson

let data_of_yojson = string_of_yojson

let workflow_execution_terminated_cause_of_yojson = 
  fun (tree: t) path : workflow_execution_terminated_cause -> match tree with 
    | `String "OPERATOR_INITIATED" -> OPERATOR_INITIATED
    | `String "EVENT_LIMIT_EXCEEDED" -> EVENT_LIMIT_EXCEEDED
    | `String "CHILD_POLICY_APPLIED" -> CHILD_POLICY_APPLIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkflowExecutionTerminatedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowExecutionTerminatedCause")

let workflow_execution_terminated_event_attributes_of_yojson = 
  fun tree path : workflow_execution_terminated_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_terminated_event_attributes = {
    cause = option_of_yojson (value_for_key (workflow_execution_terminated_cause_of_yojson) "cause") _list path;
    child_policy = value_for_key (child_policy_of_yojson) "childPolicy" _list path;
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    reason = option_of_yojson (value_for_key (terminate_reason_of_yojson) "reason") _list path;
    
  }
  in _res

let tag_of_yojson = string_of_yojson

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let workflow_execution_of_yojson = 
  fun tree path : workflow_execution ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution = {
    run_id = value_for_key (workflow_run_id_of_yojson) "runId" _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    
  }
  in _res

let event_id_of_yojson = long_of_yojson

let workflow_execution_started_event_attributes_of_yojson = 
  fun tree path : workflow_execution_started_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_started_event_attributes = {
    lambda_role = option_of_yojson (value_for_key (arn_of_yojson) "lambdaRole") _list path;
    parent_initiated_event_id = option_of_yojson (value_for_key (event_id_of_yojson) "parentInitiatedEventId") _list path;
    parent_workflow_execution = option_of_yojson (value_for_key (workflow_execution_of_yojson) "parentWorkflowExecution") _list path;
    continued_execution_run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "continuedExecutionRunId") _list path;
    tag_list = option_of_yojson (value_for_key (tag_list_of_yojson) "tagList") _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    child_policy = value_for_key (child_policy_of_yojson) "childPolicy" _list path;
    task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "taskStartToCloseTimeout") _list path;
    execution_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "executionStartToCloseTimeout") _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    
  }
  in _res

let signal_name_of_yojson = string_of_yojson

let workflow_execution_signaled_event_attributes_of_yojson = 
  fun tree path : workflow_execution_signaled_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_signaled_event_attributes = {
    external_initiated_event_id = option_of_yojson (value_for_key (event_id_of_yojson) "externalInitiatedEventId") _list path;
    external_workflow_execution = option_of_yojson (value_for_key (workflow_execution_of_yojson) "externalWorkflowExecution") _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    signal_name = value_for_key (signal_name_of_yojson) "signalName" _list path;
    
  }
  in _res

let count_of_yojson = int_of_yojson

let open_decision_tasks_count_of_yojson = int_of_yojson

let workflow_execution_open_counts_of_yojson = 
  fun tree path : workflow_execution_open_counts ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_open_counts = {
    open_lambda_functions = option_of_yojson (value_for_key (count_of_yojson) "openLambdaFunctions") _list path;
    open_child_workflow_executions = value_for_key (count_of_yojson) "openChildWorkflowExecutions" _list path;
    open_timers = value_for_key (count_of_yojson) "openTimers" _list path;
    open_decision_tasks = value_for_key (open_decision_tasks_count_of_yojson) "openDecisionTasks" _list path;
    open_activity_tasks = value_for_key (count_of_yojson) "openActivityTasks" _list path;
    
  }
  in _res

let execution_status_of_yojson = 
  fun (tree: t) path : execution_status -> match tree with 
    | `String "CLOSED" -> CLOSED
    | `String "OPEN" -> OPEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatus")

let close_status_of_yojson = 
  fun (tree: t) path : close_status -> match tree with 
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "CONTINUED_AS_NEW" -> CONTINUED_AS_NEW
    | `String "TERMINATED" -> TERMINATED
    | `String "CANCELED" -> CANCELED
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CloseStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CloseStatus")

let canceled_of_yojson = bool_of_yojson

let workflow_execution_info_of_yojson = 
  fun tree path : workflow_execution_info ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_info = {
    cancel_requested = option_of_yojson (value_for_key (canceled_of_yojson) "cancelRequested") _list path;
    tag_list = option_of_yojson (value_for_key (tag_list_of_yojson) "tagList") _list path;
    parent = option_of_yojson (value_for_key (workflow_execution_of_yojson) "parent") _list path;
    close_status = option_of_yojson (value_for_key (close_status_of_yojson) "closeStatus") _list path;
    execution_status = value_for_key (execution_status_of_yojson) "executionStatus" _list path;
    close_timestamp = option_of_yojson (value_for_key (timestamp__of_yojson) "closeTimestamp") _list path;
    start_timestamp = value_for_key (timestamp__of_yojson) "startTimestamp" _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    execution = value_for_key (workflow_execution_of_yojson) "execution" _list path;
    
  }
  in _res

let workflow_execution_info_list_of_yojson = 
  fun tree path -> list_of_yojson workflow_execution_info_of_yojson tree path 

let workflow_execution_infos_of_yojson = 
  fun tree path : workflow_execution_infos ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_infos = {
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    execution_infos = value_for_key (workflow_execution_info_list_of_yojson) "executionInfos" _list path;
    
  }
  in _res

let workflow_execution_filter_of_yojson = 
  fun tree path : workflow_execution_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_filter = {
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    
  }
  in _res

let failure_reason_of_yojson = string_of_yojson

let workflow_execution_failed_event_attributes_of_yojson = 
  fun tree path : workflow_execution_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "reason") _list path;
    
  }
  in _res

let duration_in_seconds_of_yojson = string_of_yojson

let workflow_execution_configuration_of_yojson = 
  fun tree path : workflow_execution_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_configuration = {
    lambda_role = option_of_yojson (value_for_key (arn_of_yojson) "lambdaRole") _list path;
    child_policy = value_for_key (child_policy_of_yojson) "childPolicy" _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    execution_start_to_close_timeout = value_for_key (duration_in_seconds_of_yojson) "executionStartToCloseTimeout" _list path;
    task_start_to_close_timeout = value_for_key (duration_in_seconds_of_yojson) "taskStartToCloseTimeout" _list path;
    
  }
  in _res

let workflow_execution_detail_of_yojson = 
  fun tree path : workflow_execution_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_detail = {
    latest_execution_context = option_of_yojson (value_for_key (data_of_yojson) "latestExecutionContext") _list path;
    latest_activity_task_timestamp = option_of_yojson (value_for_key (timestamp__of_yojson) "latestActivityTaskTimestamp") _list path;
    open_counts = value_for_key (workflow_execution_open_counts_of_yojson) "openCounts" _list path;
    execution_configuration = value_for_key (workflow_execution_configuration_of_yojson) "executionConfiguration" _list path;
    execution_info = value_for_key (workflow_execution_info_of_yojson) "executionInfo" _list path;
    
  }
  in _res

let truncated_of_yojson = bool_of_yojson

let workflow_execution_count_of_yojson = 
  fun tree path : workflow_execution_count ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_count = {
    truncated = option_of_yojson (value_for_key (truncated_of_yojson) "truncated") _list path;
    count = value_for_key (count_of_yojson) "count" _list path;
    
  }
  in _res

let workflow_execution_continued_as_new_event_attributes_of_yojson = 
  fun tree path : workflow_execution_continued_as_new_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_continued_as_new_event_attributes = {
    lambda_role = option_of_yojson (value_for_key (arn_of_yojson) "lambdaRole") _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    tag_list = option_of_yojson (value_for_key (tag_list_of_yojson) "tagList") _list path;
    child_policy = value_for_key (child_policy_of_yojson) "childPolicy" _list path;
    task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "taskStartToCloseTimeout") _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    execution_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "executionStartToCloseTimeout") _list path;
    new_execution_run_id = value_for_key (workflow_run_id_of_yojson) "newExecutionRunId" _list path;
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    
  }
  in _res

let workflow_execution_completed_event_attributes_of_yojson = 
  fun tree path : workflow_execution_completed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_completed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    result = option_of_yojson (value_for_key (data_of_yojson) "result") _list path;
    
  }
  in _res

let workflow_execution_canceled_event_attributes_of_yojson = 
  fun tree path : workflow_execution_canceled_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_canceled_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    
  }
  in _res

let workflow_execution_cancel_requested_cause_of_yojson = 
  fun (tree: t) path : workflow_execution_cancel_requested_cause -> match tree with 
    | `String "CHILD_POLICY_APPLIED" -> CHILD_POLICY_APPLIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "WorkflowExecutionCancelRequestedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkflowExecutionCancelRequestedCause")

let workflow_execution_cancel_requested_event_attributes_of_yojson = 
  fun tree path : workflow_execution_cancel_requested_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_cancel_requested_event_attributes = {
    cause = option_of_yojson (value_for_key (workflow_execution_cancel_requested_cause_of_yojson) "cause") _list path;
    external_initiated_event_id = option_of_yojson (value_for_key (event_id_of_yojson) "externalInitiatedEventId") _list path;
    external_workflow_execution = option_of_yojson (value_for_key (workflow_execution_of_yojson) "externalWorkflowExecution") _list path;
    
  }
  in _res

let error_message_of_yojson = string_of_yojson

let workflow_execution_already_started_fault_of_yojson = 
  fun tree path : workflow_execution_already_started_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : workflow_execution_already_started_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let resource_tag_key_of_yojson = string_of_yojson

let resource_tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson resource_tag_key_of_yojson tree path 

let untag_resource_input_of_yojson = 
  fun tree path : untag_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_input = {
    tag_keys = value_for_key (resource_tag_key_list_of_yojson) "tagKeys" _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let unknown_resource_fault_of_yojson = 
  fun tree path : unknown_resource_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : unknown_resource_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let operation_not_permitted_fault_of_yojson = 
  fun tree path : operation_not_permitted_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : operation_not_permitted_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let limit_exceeded_fault_of_yojson = 
  fun tree path : limit_exceeded_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let domain_name_of_yojson = string_of_yojson

let undeprecate_workflow_type_input_of_yojson = 
  fun tree path : undeprecate_workflow_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : undeprecate_workflow_type_input = {
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let type_already_exists_fault_of_yojson = 
  fun tree path : type_already_exists_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : type_already_exists_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let undeprecate_domain_input_of_yojson = 
  fun tree path : undeprecate_domain_input ->
  let _list = assoc_of_yojson tree path in
  let _res : undeprecate_domain_input = {
    name = value_for_key (domain_name_of_yojson) "name" _list path;
    
  }
  in _res

let domain_already_exists_fault_of_yojson = 
  fun tree path : domain_already_exists_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_already_exists_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let activity_type_of_yojson = 
  fun tree path : activity_type ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_type = {
    version = value_for_key (version_of_yojson) "version" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    
  }
  in _res

let undeprecate_activity_type_input_of_yojson = 
  fun tree path : undeprecate_activity_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : undeprecate_activity_type_input = {
    activity_type = value_for_key (activity_type_of_yojson) "activityType" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let type_not_deprecated_fault_of_yojson = 
  fun tree path : type_not_deprecated_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : type_not_deprecated_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let type_deprecated_fault_of_yojson = 
  fun tree path : type_deprecated_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : type_deprecated_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let too_many_tags_fault_of_yojson = 
  fun tree path : too_many_tags_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : too_many_tags_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let timer_id_of_yojson = string_of_yojson

let timer_started_event_attributes_of_yojson = 
  fun tree path : timer_started_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : timer_started_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    start_to_fire_timeout = value_for_key (duration_in_seconds_of_yojson) "startToFireTimeout" _list path;
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    timer_id = value_for_key (timer_id_of_yojson) "timerId" _list path;
    
  }
  in _res

let timer_fired_event_attributes_of_yojson = 
  fun tree path : timer_fired_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : timer_fired_event_attributes = {
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    timer_id = value_for_key (timer_id_of_yojson) "timerId" _list path;
    
  }
  in _res

let timer_canceled_event_attributes_of_yojson = 
  fun tree path : timer_canceled_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : timer_canceled_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    timer_id = value_for_key (timer_id_of_yojson) "timerId" _list path;
    
  }
  in _res

let terminate_workflow_execution_input_of_yojson = 
  fun tree path : terminate_workflow_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : terminate_workflow_execution_input = {
    child_policy = option_of_yojson (value_for_key (child_policy_of_yojson) "childPolicy") _list path;
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    reason = option_of_yojson (value_for_key (terminate_reason_of_yojson) "reason") _list path;
    run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "runId") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let task_token_of_yojson = string_of_yojson

let resource_tag_value_of_yojson = string_of_yojson

let resource_tag_of_yojson = 
  fun tree path : resource_tag ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_tag = {
    value = option_of_yojson (value_for_key (resource_tag_value_of_yojson) "value") _list path;
    key = value_for_key (resource_tag_key_of_yojson) "key" _list path;
    
  }
  in _res

let resource_tag_list_of_yojson = 
  fun tree path -> list_of_yojson resource_tag_of_yojson tree path 

let tag_resource_input_of_yojson = 
  fun tree path : tag_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_input = {
    tags = value_for_key (resource_tag_list_of_yojson) "tags" _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let tag_filter_of_yojson = 
  fun tree path : tag_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_filter = {
    tag = value_for_key (tag_of_yojson) "tag" _list path;
    
  }
  in _res

let start_workflow_execution_input_of_yojson = 
  fun tree path : start_workflow_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : start_workflow_execution_input = {
    lambda_role = option_of_yojson (value_for_key (arn_of_yojson) "lambdaRole") _list path;
    child_policy = option_of_yojson (value_for_key (child_policy_of_yojson) "childPolicy") _list path;
    task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "taskStartToCloseTimeout") _list path;
    tag_list = option_of_yojson (value_for_key (tag_list_of_yojson) "tagList") _list path;
    execution_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "executionStartToCloseTimeout") _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = option_of_yojson (value_for_key (task_list_of_yojson) "taskList") _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let default_undefined_fault_of_yojson = 
  fun tree path : default_undefined_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : default_undefined_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let run_of_yojson = 
  fun tree path : run ->
  let _list = assoc_of_yojson tree path in
  let _res : run = {
    run_id = option_of_yojson (value_for_key (workflow_run_id_of_yojson) "runId") _list path;
    
  }
  in _res

let start_timer_failed_cause_of_yojson = 
  fun (tree: t) path : start_timer_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "TIMER_CREATION_RATE_EXCEEDED" -> TIMER_CREATION_RATE_EXCEEDED
    | `String "OPEN_TIMERS_LIMIT_EXCEEDED" -> OPEN_TIMERS_LIMIT_EXCEEDED
    | `String "TIMER_ID_ALREADY_IN_USE" -> TIMER_ID_ALREADY_IN_USE
    | `String value -> raise (deserialize_unknown_enum_value_error path "StartTimerFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "StartTimerFailedCause")

let start_timer_failed_event_attributes_of_yojson = 
  fun tree path : start_timer_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : start_timer_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (start_timer_failed_cause_of_yojson) "cause" _list path;
    timer_id = value_for_key (timer_id_of_yojson) "timerId" _list path;
    
  }
  in _res

let start_timer_decision_attributes_of_yojson = 
  fun tree path : start_timer_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : start_timer_decision_attributes = {
    start_to_fire_timeout = value_for_key (duration_in_seconds_of_yojson) "startToFireTimeout" _list path;
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    timer_id = value_for_key (timer_id_of_yojson) "timerId" _list path;
    
  }
  in _res

let start_lambda_function_failed_cause_of_yojson = 
  fun (tree: t) path : start_lambda_function_failed_cause -> match tree with 
    | `String "ASSUME_ROLE_FAILED" -> ASSUME_ROLE_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StartLambdaFunctionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "StartLambdaFunctionFailedCause")

let cause_message_of_yojson = string_of_yojson

let start_lambda_function_failed_event_attributes_of_yojson = 
  fun tree path : start_lambda_function_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : start_lambda_function_failed_event_attributes = {
    message = option_of_yojson (value_for_key (cause_message_of_yojson) "message") _list path;
    cause = option_of_yojson (value_for_key (start_lambda_function_failed_cause_of_yojson) "cause") _list path;
    scheduled_event_id = option_of_yojson (value_for_key (event_id_of_yojson) "scheduledEventId") _list path;
    
  }
  in _res

let start_child_workflow_execution_initiated_event_attributes_of_yojson = 
  fun tree path : start_child_workflow_execution_initiated_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : start_child_workflow_execution_initiated_event_attributes = {
    lambda_role = option_of_yojson (value_for_key (arn_of_yojson) "lambdaRole") _list path;
    tag_list = option_of_yojson (value_for_key (tag_list_of_yojson) "tagList") _list path;
    task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "taskStartToCloseTimeout") _list path;
    child_policy = value_for_key (child_policy_of_yojson) "childPolicy" _list path;
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    execution_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "executionStartToCloseTimeout") _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    
  }
  in _res

let start_child_workflow_execution_failed_cause_of_yojson = 
  fun (tree: t) path : start_child_workflow_execution_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "DEFAULT_CHILD_POLICY_UNDEFINED" -> DEFAULT_CHILD_POLICY_UNDEFINED
    | `String "DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED" -> DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "DEFAULT_TASK_LIST_UNDEFINED" -> DEFAULT_TASK_LIST_UNDEFINED
    | `String "DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED" -> DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "WORKFLOW_ALREADY_RUNNING" -> WORKFLOW_ALREADY_RUNNING
    | `String "CHILD_CREATION_RATE_EXCEEDED" -> CHILD_CREATION_RATE_EXCEEDED
    | `String "OPEN_WORKFLOWS_LIMIT_EXCEEDED" -> OPEN_WORKFLOWS_LIMIT_EXCEEDED
    | `String "OPEN_CHILDREN_LIMIT_EXCEEDED" -> OPEN_CHILDREN_LIMIT_EXCEEDED
    | `String "WORKFLOW_TYPE_DEPRECATED" -> WORKFLOW_TYPE_DEPRECATED
    | `String "WORKFLOW_TYPE_DOES_NOT_EXIST" -> WORKFLOW_TYPE_DOES_NOT_EXIST
    | `String value -> raise (deserialize_unknown_enum_value_error path "StartChildWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "StartChildWorkflowExecutionFailedCause")

let start_child_workflow_execution_failed_event_attributes_of_yojson = 
  fun tree path : start_child_workflow_execution_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : start_child_workflow_execution_failed_event_attributes = {
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    cause = value_for_key (start_child_workflow_execution_failed_cause_of_yojson) "cause" _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    
  }
  in _res

let start_child_workflow_execution_decision_attributes_of_yojson = 
  fun tree path : start_child_workflow_execution_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : start_child_workflow_execution_decision_attributes = {
    lambda_role = option_of_yojson (value_for_key (arn_of_yojson) "lambdaRole") _list path;
    tag_list = option_of_yojson (value_for_key (tag_list_of_yojson) "tagList") _list path;
    child_policy = option_of_yojson (value_for_key (child_policy_of_yojson) "childPolicy") _list path;
    task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "taskStartToCloseTimeout") _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = option_of_yojson (value_for_key (task_list_of_yojson) "taskList") _list path;
    execution_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "executionStartToCloseTimeout") _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    
  }
  in _res

let start_at_previous_started_event_of_yojson = bool_of_yojson

let signal_workflow_execution_input_of_yojson = 
  fun tree path : signal_workflow_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : signal_workflow_execution_input = {
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    signal_name = value_for_key (signal_name_of_yojson) "signalName" _list path;
    run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "runId") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let decision_type_of_yojson = 
  fun (tree: t) path : decision_type -> match tree with 
    | `String "ScheduleLambdaFunction" -> ScheduleLambdaFunction
    | `String "StartChildWorkflowExecution" -> StartChildWorkflowExecution
    | `String "RequestCancelExternalWorkflowExecution" -> RequestCancelExternalWorkflowExecution
    | `String "SignalExternalWorkflowExecution" -> SignalExternalWorkflowExecution
    | `String "CancelTimer" -> CancelTimer
    | `String "StartTimer" -> StartTimer
    | `String "RecordMarker" -> RecordMarker
    | `String "ContinueAsNewWorkflowExecution" -> ContinueAsNewWorkflowExecution
    | `String "CancelWorkflowExecution" -> CancelWorkflowExecution
    | `String "FailWorkflowExecution" -> FailWorkflowExecution
    | `String "CompleteWorkflowExecution" -> CompleteWorkflowExecution
    | `String "RequestCancelActivityTask" -> RequestCancelActivityTask
    | `String "ScheduleActivityTask" -> ScheduleActivityTask
    | `String value -> raise (deserialize_unknown_enum_value_error path "DecisionType" value)
    | _ -> raise (deserialize_wrong_type_error path "DecisionType")

let activity_id_of_yojson = string_of_yojson

let schedule_activity_task_decision_attributes_of_yojson = 
  fun tree path : schedule_activity_task_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : schedule_activity_task_decision_attributes = {
    heartbeat_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "heartbeatTimeout") _list path;
    start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "startToCloseTimeout") _list path;
    schedule_to_start_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "scheduleToStartTimeout") _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = option_of_yojson (value_for_key (task_list_of_yojson) "taskList") _list path;
    schedule_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "scheduleToCloseTimeout") _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    activity_id = value_for_key (activity_id_of_yojson) "activityId" _list path;
    activity_type = value_for_key (activity_type_of_yojson) "activityType" _list path;
    
  }
  in _res

let request_cancel_activity_task_decision_attributes_of_yojson = 
  fun tree path : request_cancel_activity_task_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : request_cancel_activity_task_decision_attributes = {
    activity_id = value_for_key (activity_id_of_yojson) "activityId" _list path;
    
  }
  in _res

let complete_workflow_execution_decision_attributes_of_yojson = 
  fun tree path : complete_workflow_execution_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : complete_workflow_execution_decision_attributes = {
    result = option_of_yojson (value_for_key (data_of_yojson) "result") _list path;
    
  }
  in _res

let fail_workflow_execution_decision_attributes_of_yojson = 
  fun tree path : fail_workflow_execution_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : fail_workflow_execution_decision_attributes = {
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "reason") _list path;
    
  }
  in _res

let cancel_workflow_execution_decision_attributes_of_yojson = 
  fun tree path : cancel_workflow_execution_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_workflow_execution_decision_attributes = {
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    
  }
  in _res

let continue_as_new_workflow_execution_decision_attributes_of_yojson = 
  fun tree path : continue_as_new_workflow_execution_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : continue_as_new_workflow_execution_decision_attributes = {
    lambda_role = option_of_yojson (value_for_key (arn_of_yojson) "lambdaRole") _list path;
    workflow_type_version = option_of_yojson (value_for_key (version_of_yojson) "workflowTypeVersion") _list path;
    tag_list = option_of_yojson (value_for_key (tag_list_of_yojson) "tagList") _list path;
    child_policy = option_of_yojson (value_for_key (child_policy_of_yojson) "childPolicy") _list path;
    task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "taskStartToCloseTimeout") _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = option_of_yojson (value_for_key (task_list_of_yojson) "taskList") _list path;
    execution_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "executionStartToCloseTimeout") _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    
  }
  in _res

let marker_name_of_yojson = string_of_yojson

let record_marker_decision_attributes_of_yojson = 
  fun tree path : record_marker_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : record_marker_decision_attributes = {
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    marker_name = value_for_key (marker_name_of_yojson) "markerName" _list path;
    
  }
  in _res

let cancel_timer_decision_attributes_of_yojson = 
  fun tree path : cancel_timer_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_timer_decision_attributes = {
    timer_id = value_for_key (timer_id_of_yojson) "timerId" _list path;
    
  }
  in _res

let signal_external_workflow_execution_decision_attributes_of_yojson = 
  fun tree path : signal_external_workflow_execution_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : signal_external_workflow_execution_decision_attributes = {
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    signal_name = value_for_key (signal_name_of_yojson) "signalName" _list path;
    run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "runId") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    
  }
  in _res

let request_cancel_external_workflow_execution_decision_attributes_of_yojson
= 
  fun tree path : request_cancel_external_workflow_execution_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : request_cancel_external_workflow_execution_decision_attributes = {
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "runId") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    
  }
  in _res

let function_id_of_yojson = string_of_yojson

let function_name_of_yojson = string_of_yojson

let function_input_of_yojson = string_of_yojson

let schedule_lambda_function_decision_attributes_of_yojson = 
  fun tree path : schedule_lambda_function_decision_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : schedule_lambda_function_decision_attributes = {
    start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "startToCloseTimeout") _list path;
    input = option_of_yojson (value_for_key (function_input_of_yojson) "input") _list path;
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    name = value_for_key (function_name_of_yojson) "name" _list path;
    id = value_for_key (function_id_of_yojson) "id" _list path;
    
  }
  in _res

let decision_of_yojson = 
  fun tree path : decision ->
  let _list = assoc_of_yojson tree path in
  let _res : decision = {
    schedule_lambda_function_decision_attributes = option_of_yojson (value_for_key (schedule_lambda_function_decision_attributes_of_yojson) "scheduleLambdaFunctionDecisionAttributes") _list path;
    start_child_workflow_execution_decision_attributes = option_of_yojson (value_for_key (start_child_workflow_execution_decision_attributes_of_yojson) "startChildWorkflowExecutionDecisionAttributes") _list path;
    request_cancel_external_workflow_execution_decision_attributes = option_of_yojson (value_for_key (request_cancel_external_workflow_execution_decision_attributes_of_yojson) "requestCancelExternalWorkflowExecutionDecisionAttributes") _list path;
    signal_external_workflow_execution_decision_attributes = option_of_yojson (value_for_key (signal_external_workflow_execution_decision_attributes_of_yojson) "signalExternalWorkflowExecutionDecisionAttributes") _list path;
    cancel_timer_decision_attributes = option_of_yojson (value_for_key (cancel_timer_decision_attributes_of_yojson) "cancelTimerDecisionAttributes") _list path;
    start_timer_decision_attributes = option_of_yojson (value_for_key (start_timer_decision_attributes_of_yojson) "startTimerDecisionAttributes") _list path;
    record_marker_decision_attributes = option_of_yojson (value_for_key (record_marker_decision_attributes_of_yojson) "recordMarkerDecisionAttributes") _list path;
    continue_as_new_workflow_execution_decision_attributes = option_of_yojson (value_for_key (continue_as_new_workflow_execution_decision_attributes_of_yojson) "continueAsNewWorkflowExecutionDecisionAttributes") _list path;
    cancel_workflow_execution_decision_attributes = option_of_yojson (value_for_key (cancel_workflow_execution_decision_attributes_of_yojson) "cancelWorkflowExecutionDecisionAttributes") _list path;
    fail_workflow_execution_decision_attributes = option_of_yojson (value_for_key (fail_workflow_execution_decision_attributes_of_yojson) "failWorkflowExecutionDecisionAttributes") _list path;
    complete_workflow_execution_decision_attributes = option_of_yojson (value_for_key (complete_workflow_execution_decision_attributes_of_yojson) "completeWorkflowExecutionDecisionAttributes") _list path;
    request_cancel_activity_task_decision_attributes = option_of_yojson (value_for_key (request_cancel_activity_task_decision_attributes_of_yojson) "requestCancelActivityTaskDecisionAttributes") _list path;
    schedule_activity_task_decision_attributes = option_of_yojson (value_for_key (schedule_activity_task_decision_attributes_of_yojson) "scheduleActivityTaskDecisionAttributes") _list path;
    decision_type = value_for_key (decision_type_of_yojson) "decisionType" _list path;
    
  }
  in _res

let decision_list_of_yojson = 
  fun tree path -> list_of_yojson decision_of_yojson tree path 

let respond_decision_task_completed_input_of_yojson = 
  fun tree path : respond_decision_task_completed_input ->
  let _list = assoc_of_yojson tree path in
  let _res : respond_decision_task_completed_input = {
    task_list_schedule_to_start_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "taskListScheduleToStartTimeout") _list path;
    task_list = option_of_yojson (value_for_key (task_list_of_yojson) "taskList") _list path;
    execution_context = option_of_yojson (value_for_key (data_of_yojson) "executionContext") _list path;
    decisions = option_of_yojson (value_for_key (decision_list_of_yojson) "decisions") _list path;
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let respond_activity_task_failed_input_of_yojson = 
  fun tree path : respond_activity_task_failed_input ->
  let _list = assoc_of_yojson tree path in
  let _res : respond_activity_task_failed_input = {
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "reason") _list path;
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let respond_activity_task_completed_input_of_yojson = 
  fun tree path : respond_activity_task_completed_input ->
  let _list = assoc_of_yojson tree path in
  let _res : respond_activity_task_completed_input = {
    result = option_of_yojson (value_for_key (data_of_yojson) "result") _list path;
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let respond_activity_task_canceled_input_of_yojson = 
  fun tree path : respond_activity_task_canceled_input ->
  let _list = assoc_of_yojson tree path in
  let _res : respond_activity_task_canceled_input = {
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let request_cancel_workflow_execution_input_of_yojson = 
  fun tree path : request_cancel_workflow_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : request_cancel_workflow_execution_input = {
    run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "runId") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let register_workflow_type_input_of_yojson = 
  fun tree path : register_workflow_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : register_workflow_type_input = {
    default_lambda_role = option_of_yojson (value_for_key (arn_of_yojson) "defaultLambdaRole") _list path;
    default_child_policy = option_of_yojson (value_for_key (child_policy_of_yojson) "defaultChildPolicy") _list path;
    default_task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "defaultTaskPriority") _list path;
    default_task_list = option_of_yojson (value_for_key (task_list_of_yojson) "defaultTaskList") _list path;
    default_execution_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultExecutionStartToCloseTimeout") _list path;
    default_task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskStartToCloseTimeout") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    version = value_for_key (version_of_yojson) "version" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let duration_in_days_of_yojson = string_of_yojson

let register_domain_input_of_yojson = 
  fun tree path : register_domain_input ->
  let _list = assoc_of_yojson tree path in
  let _res : register_domain_input = {
    tags = option_of_yojson (value_for_key (resource_tag_list_of_yojson) "tags") _list path;
    workflow_execution_retention_period_in_days = value_for_key (duration_in_days_of_yojson) "workflowExecutionRetentionPeriodInDays" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    name = value_for_key (domain_name_of_yojson) "name" _list path;
    
  }
  in _res

let register_activity_type_input_of_yojson = 
  fun tree path : register_activity_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : register_activity_type_input = {
    default_task_schedule_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskScheduleToCloseTimeout") _list path;
    default_task_schedule_to_start_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskScheduleToStartTimeout") _list path;
    default_task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "defaultTaskPriority") _list path;
    default_task_list = option_of_yojson (value_for_key (task_list_of_yojson) "defaultTaskList") _list path;
    default_task_heartbeat_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskHeartbeatTimeout") _list path;
    default_task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskStartToCloseTimeout") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    version = value_for_key (version_of_yojson) "version" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let activity_task_status_of_yojson = 
  fun tree path : activity_task_status ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_task_status = {
    cancel_requested = value_for_key (canceled_of_yojson) "cancelRequested" _list path;
    
  }
  in _res

let limited_data_of_yojson = string_of_yojson

let record_activity_task_heartbeat_input_of_yojson = 
  fun tree path : record_activity_task_heartbeat_input ->
  let _list = assoc_of_yojson tree path in
  let _res : record_activity_task_heartbeat_input = {
    details = option_of_yojson (value_for_key (limited_data_of_yojson) "details") _list path;
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let event_type_of_yojson = 
  fun (tree: t) path : event_type -> match tree with 
    | `String "StartLambdaFunctionFailed" -> StartLambdaFunctionFailed
    | `String "ScheduleLambdaFunctionFailed" -> ScheduleLambdaFunctionFailed
    | `String "LambdaFunctionTimedOut" -> LambdaFunctionTimedOut
    | `String "LambdaFunctionFailed" -> LambdaFunctionFailed
    | `String "LambdaFunctionCompleted" -> LambdaFunctionCompleted
    | `String "LambdaFunctionStarted" -> LambdaFunctionStarted
    | `String "LambdaFunctionScheduled" -> LambdaFunctionScheduled
    | `String "ExternalWorkflowExecutionCancelRequested" -> ExternalWorkflowExecutionCancelRequested
    | `String "RequestCancelExternalWorkflowExecutionFailed" -> RequestCancelExternalWorkflowExecutionFailed
    | `String "RequestCancelExternalWorkflowExecutionInitiated" -> RequestCancelExternalWorkflowExecutionInitiated
    | `String "ExternalWorkflowExecutionSignaled" -> ExternalWorkflowExecutionSignaled
    | `String "SignalExternalWorkflowExecutionFailed" -> SignalExternalWorkflowExecutionFailed
    | `String "SignalExternalWorkflowExecutionInitiated" -> SignalExternalWorkflowExecutionInitiated
    | `String "ChildWorkflowExecutionTerminated" -> ChildWorkflowExecutionTerminated
    | `String "ChildWorkflowExecutionCanceled" -> ChildWorkflowExecutionCanceled
    | `String "ChildWorkflowExecutionTimedOut" -> ChildWorkflowExecutionTimedOut
    | `String "ChildWorkflowExecutionFailed" -> ChildWorkflowExecutionFailed
    | `String "ChildWorkflowExecutionCompleted" -> ChildWorkflowExecutionCompleted
    | `String "ChildWorkflowExecutionStarted" -> ChildWorkflowExecutionStarted
    | `String "StartChildWorkflowExecutionFailed" -> StartChildWorkflowExecutionFailed
    | `String "StartChildWorkflowExecutionInitiated" -> StartChildWorkflowExecutionInitiated
    | `String "CancelTimerFailed" -> CancelTimerFailed
    | `String "TimerCanceled" -> TimerCanceled
    | `String "TimerFired" -> TimerFired
    | `String "StartTimerFailed" -> StartTimerFailed
    | `String "TimerStarted" -> TimerStarted
    | `String "RecordMarkerFailed" -> RecordMarkerFailed
    | `String "MarkerRecorded" -> MarkerRecorded
    | `String "WorkflowExecutionSignaled" -> WorkflowExecutionSignaled
    | `String "RequestCancelActivityTaskFailed" -> RequestCancelActivityTaskFailed
    | `String "ActivityTaskCancelRequested" -> ActivityTaskCancelRequested
    | `String "ActivityTaskCanceled" -> ActivityTaskCanceled
    | `String "ActivityTaskTimedOut" -> ActivityTaskTimedOut
    | `String "ActivityTaskFailed" -> ActivityTaskFailed
    | `String "ActivityTaskCompleted" -> ActivityTaskCompleted
    | `String "ActivityTaskStarted" -> ActivityTaskStarted
    | `String "ScheduleActivityTaskFailed" -> ScheduleActivityTaskFailed
    | `String "ActivityTaskScheduled" -> ActivityTaskScheduled
    | `String "DecisionTaskTimedOut" -> DecisionTaskTimedOut
    | `String "DecisionTaskCompleted" -> DecisionTaskCompleted
    | `String "DecisionTaskStarted" -> DecisionTaskStarted
    | `String "DecisionTaskScheduled" -> DecisionTaskScheduled
    | `String "WorkflowExecutionTerminated" -> WorkflowExecutionTerminated
    | `String "ContinueAsNewWorkflowExecutionFailed" -> ContinueAsNewWorkflowExecutionFailed
    | `String "WorkflowExecutionContinuedAsNew" -> WorkflowExecutionContinuedAsNew
    | `String "CancelWorkflowExecutionFailed" -> CancelWorkflowExecutionFailed
    | `String "WorkflowExecutionCanceled" -> WorkflowExecutionCanceled
    | `String "WorkflowExecutionTimedOut" -> WorkflowExecutionTimedOut
    | `String "FailWorkflowExecutionFailed" -> FailWorkflowExecutionFailed
    | `String "WorkflowExecutionFailed" -> WorkflowExecutionFailed
    | `String "CompleteWorkflowExecutionFailed" -> CompleteWorkflowExecutionFailed
    | `String "WorkflowExecutionCompleted" -> WorkflowExecutionCompleted
    | `String "WorkflowExecutionCancelRequested" -> WorkflowExecutionCancelRequested
    | `String "WorkflowExecutionStarted" -> WorkflowExecutionStarted
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")

let complete_workflow_execution_failed_cause_of_yojson = 
  fun (tree: t) path : complete_workflow_execution_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "UNHANDLED_DECISION" -> UNHANDLED_DECISION
    | `String value -> raise (deserialize_unknown_enum_value_error path "CompleteWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "CompleteWorkflowExecutionFailedCause")

let complete_workflow_execution_failed_event_attributes_of_yojson = 
  fun tree path : complete_workflow_execution_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : complete_workflow_execution_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (complete_workflow_execution_failed_cause_of_yojson) "cause" _list path;
    
  }
  in _res

let fail_workflow_execution_failed_cause_of_yojson = 
  fun (tree: t) path : fail_workflow_execution_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "UNHANDLED_DECISION" -> UNHANDLED_DECISION
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "FailWorkflowExecutionFailedCause")

let fail_workflow_execution_failed_event_attributes_of_yojson = 
  fun tree path : fail_workflow_execution_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : fail_workflow_execution_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (fail_workflow_execution_failed_cause_of_yojson) "cause" _list path;
    
  }
  in _res

let cancel_workflow_execution_failed_cause_of_yojson = 
  fun (tree: t) path : cancel_workflow_execution_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "UNHANDLED_DECISION" -> UNHANDLED_DECISION
    | `String value -> raise (deserialize_unknown_enum_value_error path "CancelWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "CancelWorkflowExecutionFailedCause")

let cancel_workflow_execution_failed_event_attributes_of_yojson = 
  fun tree path : cancel_workflow_execution_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_workflow_execution_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (cancel_workflow_execution_failed_cause_of_yojson) "cause" _list path;
    
  }
  in _res

let continue_as_new_workflow_execution_failed_cause_of_yojson = 
  fun (tree: t) path : continue_as_new_workflow_execution_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED" -> CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED
    | `String "DEFAULT_CHILD_POLICY_UNDEFINED" -> DEFAULT_CHILD_POLICY_UNDEFINED
    | `String "DEFAULT_TASK_LIST_UNDEFINED" -> DEFAULT_TASK_LIST_UNDEFINED
    | `String "DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED" -> DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED" -> DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "WORKFLOW_TYPE_DOES_NOT_EXIST" -> WORKFLOW_TYPE_DOES_NOT_EXIST
    | `String "WORKFLOW_TYPE_DEPRECATED" -> WORKFLOW_TYPE_DEPRECATED
    | `String "UNHANDLED_DECISION" -> UNHANDLED_DECISION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContinueAsNewWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "ContinueAsNewWorkflowExecutionFailedCause")

let continue_as_new_workflow_execution_failed_event_attributes_of_yojson = 
  fun tree path : continue_as_new_workflow_execution_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : continue_as_new_workflow_execution_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (continue_as_new_workflow_execution_failed_cause_of_yojson) "cause" _list path;
    
  }
  in _res

let decision_task_scheduled_event_attributes_of_yojson = 
  fun tree path : decision_task_scheduled_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : decision_task_scheduled_event_attributes = {
    schedule_to_start_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "scheduleToStartTimeout") _list path;
    start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "startToCloseTimeout") _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    
  }
  in _res

let identity_of_yojson = string_of_yojson

let decision_task_started_event_attributes_of_yojson = 
  fun tree path : decision_task_started_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : decision_task_started_event_attributes = {
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    identity = option_of_yojson (value_for_key (identity_of_yojson) "identity") _list path;
    
  }
  in _res

let decision_task_completed_event_attributes_of_yojson = 
  fun tree path : decision_task_completed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : decision_task_completed_event_attributes = {
    task_list_schedule_to_start_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "taskListScheduleToStartTimeout") _list path;
    task_list = option_of_yojson (value_for_key (task_list_of_yojson) "taskList") _list path;
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    execution_context = option_of_yojson (value_for_key (data_of_yojson) "executionContext") _list path;
    
  }
  in _res

let decision_task_timeout_type_of_yojson = 
  fun (tree: t) path : decision_task_timeout_type -> match tree with 
    | `String "SCHEDULE_TO_START" -> SCHEDULE_TO_START
    | `String "START_TO_CLOSE" -> START_TO_CLOSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DecisionTaskTimeoutType" value)
    | _ -> raise (deserialize_wrong_type_error path "DecisionTaskTimeoutType")

let decision_task_timed_out_event_attributes_of_yojson = 
  fun tree path : decision_task_timed_out_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : decision_task_timed_out_event_attributes = {
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    timeout_type = value_for_key (decision_task_timeout_type_of_yojson) "timeoutType" _list path;
    
  }
  in _res

let activity_task_scheduled_event_attributes_of_yojson = 
  fun tree path : activity_task_scheduled_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_task_scheduled_event_attributes = {
    heartbeat_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "heartbeatTimeout") _list path;
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "taskPriority") _list path;
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "startToCloseTimeout") _list path;
    schedule_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "scheduleToCloseTimeout") _list path;
    schedule_to_start_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "scheduleToStartTimeout") _list path;
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    activity_id = value_for_key (activity_id_of_yojson) "activityId" _list path;
    activity_type = value_for_key (activity_type_of_yojson) "activityType" _list path;
    
  }
  in _res

let activity_task_started_event_attributes_of_yojson = 
  fun tree path : activity_task_started_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_task_started_event_attributes = {
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    identity = option_of_yojson (value_for_key (identity_of_yojson) "identity") _list path;
    
  }
  in _res

let activity_task_completed_event_attributes_of_yojson = 
  fun tree path : activity_task_completed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_task_completed_event_attributes = {
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    result = option_of_yojson (value_for_key (data_of_yojson) "result") _list path;
    
  }
  in _res

let activity_task_failed_event_attributes_of_yojson = 
  fun tree path : activity_task_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_task_failed_event_attributes = {
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "reason") _list path;
    
  }
  in _res

let activity_task_timeout_type_of_yojson = 
  fun (tree: t) path : activity_task_timeout_type -> match tree with 
    | `String "HEARTBEAT" -> HEARTBEAT
    | `String "SCHEDULE_TO_CLOSE" -> SCHEDULE_TO_CLOSE
    | `String "SCHEDULE_TO_START" -> SCHEDULE_TO_START
    | `String "START_TO_CLOSE" -> START_TO_CLOSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActivityTaskTimeoutType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActivityTaskTimeoutType")

let activity_task_timed_out_event_attributes_of_yojson = 
  fun tree path : activity_task_timed_out_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_task_timed_out_event_attributes = {
    details = option_of_yojson (value_for_key (limited_data_of_yojson) "details") _list path;
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    timeout_type = value_for_key (activity_task_timeout_type_of_yojson) "timeoutType" _list path;
    
  }
  in _res

let activity_task_canceled_event_attributes_of_yojson = 
  fun tree path : activity_task_canceled_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_task_canceled_event_attributes = {
    latest_cancel_requested_event_id = option_of_yojson (value_for_key (event_id_of_yojson) "latestCancelRequestedEventId") _list path;
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    
  }
  in _res

let activity_task_cancel_requested_event_attributes_of_yojson = 
  fun tree path : activity_task_cancel_requested_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_task_cancel_requested_event_attributes = {
    activity_id = value_for_key (activity_id_of_yojson) "activityId" _list path;
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    
  }
  in _res

let marker_recorded_event_attributes_of_yojson = 
  fun tree path : marker_recorded_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : marker_recorded_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    marker_name = value_for_key (marker_name_of_yojson) "markerName" _list path;
    
  }
  in _res

let record_marker_failed_cause_of_yojson = 
  fun (tree: t) path : record_marker_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordMarkerFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordMarkerFailedCause")

let record_marker_failed_event_attributes_of_yojson = 
  fun tree path : record_marker_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : record_marker_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (record_marker_failed_cause_of_yojson) "cause" _list path;
    marker_name = value_for_key (marker_name_of_yojson) "markerName" _list path;
    
  }
  in _res

let child_workflow_execution_started_event_attributes_of_yojson = 
  fun tree path : child_workflow_execution_started_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : child_workflow_execution_started_event_attributes = {
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    
  }
  in _res

let child_workflow_execution_completed_event_attributes_of_yojson = 
  fun tree path : child_workflow_execution_completed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : child_workflow_execution_completed_event_attributes = {
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    result = option_of_yojson (value_for_key (data_of_yojson) "result") _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    
  }
  in _res

let child_workflow_execution_failed_event_attributes_of_yojson = 
  fun tree path : child_workflow_execution_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : child_workflow_execution_failed_event_attributes = {
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "reason") _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    
  }
  in _res

let child_workflow_execution_timed_out_event_attributes_of_yojson = 
  fun tree path : child_workflow_execution_timed_out_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : child_workflow_execution_timed_out_event_attributes = {
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    timeout_type = value_for_key (workflow_execution_timeout_type_of_yojson) "timeoutType" _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    
  }
  in _res

let child_workflow_execution_canceled_event_attributes_of_yojson = 
  fun tree path : child_workflow_execution_canceled_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : child_workflow_execution_canceled_event_attributes = {
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    
  }
  in _res

let child_workflow_execution_terminated_event_attributes_of_yojson = 
  fun tree path : child_workflow_execution_terminated_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : child_workflow_execution_terminated_event_attributes = {
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    
  }
  in _res

let signal_external_workflow_execution_initiated_event_attributes_of_yojson = 
  fun tree path : signal_external_workflow_execution_initiated_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : signal_external_workflow_execution_initiated_event_attributes = {
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    signal_name = value_for_key (signal_name_of_yojson) "signalName" _list path;
    run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "runId") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    
  }
  in _res

let external_workflow_execution_signaled_event_attributes_of_yojson = 
  fun tree path : external_workflow_execution_signaled_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : external_workflow_execution_signaled_event_attributes = {
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    
  }
  in _res

let signal_external_workflow_execution_failed_cause_of_yojson = 
  fun (tree: t) path : signal_external_workflow_execution_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED" -> SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED
    | `String "UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION" -> UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignalExternalWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalExternalWorkflowExecutionFailedCause")

let signal_external_workflow_execution_failed_event_attributes_of_yojson = 
  fun tree path : signal_external_workflow_execution_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : signal_external_workflow_execution_failed_event_attributes = {
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    cause = value_for_key (signal_external_workflow_execution_failed_cause_of_yojson) "cause" _list path;
    run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "runId") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    
  }
  in _res

let external_workflow_execution_cancel_requested_event_attributes_of_yojson = 
  fun tree path : external_workflow_execution_cancel_requested_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : external_workflow_execution_cancel_requested_event_attributes = {
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    
  }
  in _res

let
request_cancel_external_workflow_execution_initiated_event_attributes_of_yojson
= 
  fun tree path : request_cancel_external_workflow_execution_initiated_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : request_cancel_external_workflow_execution_initiated_event_attributes = {
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "runId") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    
  }
  in _res

let request_cancel_external_workflow_execution_failed_cause_of_yojson = 
  fun (tree: t) path : request_cancel_external_workflow_execution_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED" -> REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED
    | `String "UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION" -> UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "RequestCancelExternalWorkflowExecutionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "RequestCancelExternalWorkflowExecutionFailedCause")

let
request_cancel_external_workflow_execution_failed_event_attributes_of_yojson
= 
  fun tree path : request_cancel_external_workflow_execution_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : request_cancel_external_workflow_execution_failed_event_attributes = {
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    initiated_event_id = value_for_key (event_id_of_yojson) "initiatedEventId" _list path;
    cause = value_for_key (request_cancel_external_workflow_execution_failed_cause_of_yojson) "cause" _list path;
    run_id = option_of_yojson (value_for_key (workflow_run_id_optional_of_yojson) "runId") _list path;
    workflow_id = value_for_key (workflow_id_of_yojson) "workflowId" _list path;
    
  }
  in _res

let schedule_activity_task_failed_cause_of_yojson = 
  fun (tree: t) path : schedule_activity_task_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED" -> DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED
    | `String "DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED" -> DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED" -> DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED
    | `String "DEFAULT_TASK_LIST_UNDEFINED" -> DEFAULT_TASK_LIST_UNDEFINED
    | `String "DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED" -> DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED
    | `String "ACTIVITY_CREATION_RATE_EXCEEDED" -> ACTIVITY_CREATION_RATE_EXCEEDED
    | `String "OPEN_ACTIVITIES_LIMIT_EXCEEDED" -> OPEN_ACTIVITIES_LIMIT_EXCEEDED
    | `String "ACTIVITY_ID_ALREADY_IN_USE" -> ACTIVITY_ID_ALREADY_IN_USE
    | `String "ACTIVITY_TYPE_DOES_NOT_EXIST" -> ACTIVITY_TYPE_DOES_NOT_EXIST
    | `String "ACTIVITY_TYPE_DEPRECATED" -> ACTIVITY_TYPE_DEPRECATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduleActivityTaskFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleActivityTaskFailedCause")

let schedule_activity_task_failed_event_attributes_of_yojson = 
  fun tree path : schedule_activity_task_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : schedule_activity_task_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (schedule_activity_task_failed_cause_of_yojson) "cause" _list path;
    activity_id = value_for_key (activity_id_of_yojson) "activityId" _list path;
    activity_type = value_for_key (activity_type_of_yojson) "activityType" _list path;
    
  }
  in _res

let request_cancel_activity_task_failed_cause_of_yojson = 
  fun (tree: t) path : request_cancel_activity_task_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "ACTIVITY_ID_UNKNOWN" -> ACTIVITY_ID_UNKNOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "RequestCancelActivityTaskFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "RequestCancelActivityTaskFailedCause")

let request_cancel_activity_task_failed_event_attributes_of_yojson = 
  fun tree path : request_cancel_activity_task_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : request_cancel_activity_task_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (request_cancel_activity_task_failed_cause_of_yojson) "cause" _list path;
    activity_id = value_for_key (activity_id_of_yojson) "activityId" _list path;
    
  }
  in _res

let cancel_timer_failed_cause_of_yojson = 
  fun (tree: t) path : cancel_timer_failed_cause -> match tree with 
    | `String "OPERATION_NOT_PERMITTED" -> OPERATION_NOT_PERMITTED
    | `String "TIMER_ID_UNKNOWN" -> TIMER_ID_UNKNOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "CancelTimerFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "CancelTimerFailedCause")

let cancel_timer_failed_event_attributes_of_yojson = 
  fun tree path : cancel_timer_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_timer_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (cancel_timer_failed_cause_of_yojson) "cause" _list path;
    timer_id = value_for_key (timer_id_of_yojson) "timerId" _list path;
    
  }
  in _res

let lambda_function_scheduled_event_attributes_of_yojson = 
  fun tree path : lambda_function_scheduled_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_scheduled_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "startToCloseTimeout") _list path;
    input = option_of_yojson (value_for_key (function_input_of_yojson) "input") _list path;
    control = option_of_yojson (value_for_key (data_of_yojson) "control") _list path;
    name = value_for_key (function_name_of_yojson) "name" _list path;
    id = value_for_key (function_id_of_yojson) "id" _list path;
    
  }
  in _res

let lambda_function_started_event_attributes_of_yojson = 
  fun tree path : lambda_function_started_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_started_event_attributes = {
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    
  }
  in _res

let lambda_function_completed_event_attributes_of_yojson = 
  fun tree path : lambda_function_completed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_completed_event_attributes = {
    result = option_of_yojson (value_for_key (data_of_yojson) "result") _list path;
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    
  }
  in _res

let lambda_function_failed_event_attributes_of_yojson = 
  fun tree path : lambda_function_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_failed_event_attributes = {
    details = option_of_yojson (value_for_key (data_of_yojson) "details") _list path;
    reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "reason") _list path;
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    
  }
  in _res

let lambda_function_timeout_type_of_yojson = 
  fun (tree: t) path : lambda_function_timeout_type -> match tree with 
    | `String "START_TO_CLOSE" -> START_TO_CLOSE
    | `String value -> raise (deserialize_unknown_enum_value_error path "LambdaFunctionTimeoutType" value)
    | _ -> raise (deserialize_wrong_type_error path "LambdaFunctionTimeoutType")

let lambda_function_timed_out_event_attributes_of_yojson = 
  fun tree path : lambda_function_timed_out_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_timed_out_event_attributes = {
    timeout_type = option_of_yojson (value_for_key (lambda_function_timeout_type_of_yojson) "timeoutType") _list path;
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    scheduled_event_id = value_for_key (event_id_of_yojson) "scheduledEventId" _list path;
    
  }
  in _res

let schedule_lambda_function_failed_cause_of_yojson = 
  fun (tree: t) path : schedule_lambda_function_failed_cause -> match tree with 
    | `String "LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION" -> LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION
    | `String "LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED" -> LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED
    | `String "OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED" -> OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED
    | `String "ID_ALREADY_IN_USE" -> ID_ALREADY_IN_USE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduleLambdaFunctionFailedCause" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleLambdaFunctionFailedCause")

let schedule_lambda_function_failed_event_attributes_of_yojson = 
  fun tree path : schedule_lambda_function_failed_event_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : schedule_lambda_function_failed_event_attributes = {
    decision_task_completed_event_id = value_for_key (event_id_of_yojson) "decisionTaskCompletedEventId" _list path;
    cause = value_for_key (schedule_lambda_function_failed_cause_of_yojson) "cause" _list path;
    name = value_for_key (function_name_of_yojson) "name" _list path;
    id = value_for_key (function_id_of_yojson) "id" _list path;
    
  }
  in _res

let history_event_of_yojson = 
  fun tree path : history_event ->
  let _list = assoc_of_yojson tree path in
  let _res : history_event = {
    start_lambda_function_failed_event_attributes = option_of_yojson (value_for_key (start_lambda_function_failed_event_attributes_of_yojson) "startLambdaFunctionFailedEventAttributes") _list path;
    schedule_lambda_function_failed_event_attributes = option_of_yojson (value_for_key (schedule_lambda_function_failed_event_attributes_of_yojson) "scheduleLambdaFunctionFailedEventAttributes") _list path;
    lambda_function_timed_out_event_attributes = option_of_yojson (value_for_key (lambda_function_timed_out_event_attributes_of_yojson) "lambdaFunctionTimedOutEventAttributes") _list path;
    lambda_function_failed_event_attributes = option_of_yojson (value_for_key (lambda_function_failed_event_attributes_of_yojson) "lambdaFunctionFailedEventAttributes") _list path;
    lambda_function_completed_event_attributes = option_of_yojson (value_for_key (lambda_function_completed_event_attributes_of_yojson) "lambdaFunctionCompletedEventAttributes") _list path;
    lambda_function_started_event_attributes = option_of_yojson (value_for_key (lambda_function_started_event_attributes_of_yojson) "lambdaFunctionStartedEventAttributes") _list path;
    lambda_function_scheduled_event_attributes = option_of_yojson (value_for_key (lambda_function_scheduled_event_attributes_of_yojson) "lambdaFunctionScheduledEventAttributes") _list path;
    start_child_workflow_execution_failed_event_attributes = option_of_yojson (value_for_key (start_child_workflow_execution_failed_event_attributes_of_yojson) "startChildWorkflowExecutionFailedEventAttributes") _list path;
    cancel_timer_failed_event_attributes = option_of_yojson (value_for_key (cancel_timer_failed_event_attributes_of_yojson) "cancelTimerFailedEventAttributes") _list path;
    start_timer_failed_event_attributes = option_of_yojson (value_for_key (start_timer_failed_event_attributes_of_yojson) "startTimerFailedEventAttributes") _list path;
    request_cancel_activity_task_failed_event_attributes = option_of_yojson (value_for_key (request_cancel_activity_task_failed_event_attributes_of_yojson) "requestCancelActivityTaskFailedEventAttributes") _list path;
    schedule_activity_task_failed_event_attributes = option_of_yojson (value_for_key (schedule_activity_task_failed_event_attributes_of_yojson) "scheduleActivityTaskFailedEventAttributes") _list path;
    request_cancel_external_workflow_execution_failed_event_attributes = option_of_yojson (value_for_key (request_cancel_external_workflow_execution_failed_event_attributes_of_yojson) "requestCancelExternalWorkflowExecutionFailedEventAttributes") _list path;
    request_cancel_external_workflow_execution_initiated_event_attributes = option_of_yojson (value_for_key (request_cancel_external_workflow_execution_initiated_event_attributes_of_yojson) "requestCancelExternalWorkflowExecutionInitiatedEventAttributes") _list path;
    external_workflow_execution_cancel_requested_event_attributes = option_of_yojson (value_for_key (external_workflow_execution_cancel_requested_event_attributes_of_yojson) "externalWorkflowExecutionCancelRequestedEventAttributes") _list path;
    signal_external_workflow_execution_failed_event_attributes = option_of_yojson (value_for_key (signal_external_workflow_execution_failed_event_attributes_of_yojson) "signalExternalWorkflowExecutionFailedEventAttributes") _list path;
    external_workflow_execution_signaled_event_attributes = option_of_yojson (value_for_key (external_workflow_execution_signaled_event_attributes_of_yojson) "externalWorkflowExecutionSignaledEventAttributes") _list path;
    signal_external_workflow_execution_initiated_event_attributes = option_of_yojson (value_for_key (signal_external_workflow_execution_initiated_event_attributes_of_yojson) "signalExternalWorkflowExecutionInitiatedEventAttributes") _list path;
    child_workflow_execution_terminated_event_attributes = option_of_yojson (value_for_key (child_workflow_execution_terminated_event_attributes_of_yojson) "childWorkflowExecutionTerminatedEventAttributes") _list path;
    child_workflow_execution_canceled_event_attributes = option_of_yojson (value_for_key (child_workflow_execution_canceled_event_attributes_of_yojson) "childWorkflowExecutionCanceledEventAttributes") _list path;
    child_workflow_execution_timed_out_event_attributes = option_of_yojson (value_for_key (child_workflow_execution_timed_out_event_attributes_of_yojson) "childWorkflowExecutionTimedOutEventAttributes") _list path;
    child_workflow_execution_failed_event_attributes = option_of_yojson (value_for_key (child_workflow_execution_failed_event_attributes_of_yojson) "childWorkflowExecutionFailedEventAttributes") _list path;
    child_workflow_execution_completed_event_attributes = option_of_yojson (value_for_key (child_workflow_execution_completed_event_attributes_of_yojson) "childWorkflowExecutionCompletedEventAttributes") _list path;
    child_workflow_execution_started_event_attributes = option_of_yojson (value_for_key (child_workflow_execution_started_event_attributes_of_yojson) "childWorkflowExecutionStartedEventAttributes") _list path;
    start_child_workflow_execution_initiated_event_attributes = option_of_yojson (value_for_key (start_child_workflow_execution_initiated_event_attributes_of_yojson) "startChildWorkflowExecutionInitiatedEventAttributes") _list path;
    timer_canceled_event_attributes = option_of_yojson (value_for_key (timer_canceled_event_attributes_of_yojson) "timerCanceledEventAttributes") _list path;
    timer_fired_event_attributes = option_of_yojson (value_for_key (timer_fired_event_attributes_of_yojson) "timerFiredEventAttributes") _list path;
    timer_started_event_attributes = option_of_yojson (value_for_key (timer_started_event_attributes_of_yojson) "timerStartedEventAttributes") _list path;
    record_marker_failed_event_attributes = option_of_yojson (value_for_key (record_marker_failed_event_attributes_of_yojson) "recordMarkerFailedEventAttributes") _list path;
    marker_recorded_event_attributes = option_of_yojson (value_for_key (marker_recorded_event_attributes_of_yojson) "markerRecordedEventAttributes") _list path;
    workflow_execution_signaled_event_attributes = option_of_yojson (value_for_key (workflow_execution_signaled_event_attributes_of_yojson) "workflowExecutionSignaledEventAttributes") _list path;
    activity_task_cancel_requested_event_attributes = option_of_yojson (value_for_key (activity_task_cancel_requested_event_attributes_of_yojson) "activityTaskCancelRequestedEventAttributes") _list path;
    activity_task_canceled_event_attributes = option_of_yojson (value_for_key (activity_task_canceled_event_attributes_of_yojson) "activityTaskCanceledEventAttributes") _list path;
    activity_task_timed_out_event_attributes = option_of_yojson (value_for_key (activity_task_timed_out_event_attributes_of_yojson) "activityTaskTimedOutEventAttributes") _list path;
    activity_task_failed_event_attributes = option_of_yojson (value_for_key (activity_task_failed_event_attributes_of_yojson) "activityTaskFailedEventAttributes") _list path;
    activity_task_completed_event_attributes = option_of_yojson (value_for_key (activity_task_completed_event_attributes_of_yojson) "activityTaskCompletedEventAttributes") _list path;
    activity_task_started_event_attributes = option_of_yojson (value_for_key (activity_task_started_event_attributes_of_yojson) "activityTaskStartedEventAttributes") _list path;
    activity_task_scheduled_event_attributes = option_of_yojson (value_for_key (activity_task_scheduled_event_attributes_of_yojson) "activityTaskScheduledEventAttributes") _list path;
    decision_task_timed_out_event_attributes = option_of_yojson (value_for_key (decision_task_timed_out_event_attributes_of_yojson) "decisionTaskTimedOutEventAttributes") _list path;
    decision_task_completed_event_attributes = option_of_yojson (value_for_key (decision_task_completed_event_attributes_of_yojson) "decisionTaskCompletedEventAttributes") _list path;
    decision_task_started_event_attributes = option_of_yojson (value_for_key (decision_task_started_event_attributes_of_yojson) "decisionTaskStartedEventAttributes") _list path;
    decision_task_scheduled_event_attributes = option_of_yojson (value_for_key (decision_task_scheduled_event_attributes_of_yojson) "decisionTaskScheduledEventAttributes") _list path;
    workflow_execution_cancel_requested_event_attributes = option_of_yojson (value_for_key (workflow_execution_cancel_requested_event_attributes_of_yojson) "workflowExecutionCancelRequestedEventAttributes") _list path;
    workflow_execution_terminated_event_attributes = option_of_yojson (value_for_key (workflow_execution_terminated_event_attributes_of_yojson) "workflowExecutionTerminatedEventAttributes") _list path;
    continue_as_new_workflow_execution_failed_event_attributes = option_of_yojson (value_for_key (continue_as_new_workflow_execution_failed_event_attributes_of_yojson) "continueAsNewWorkflowExecutionFailedEventAttributes") _list path;
    workflow_execution_continued_as_new_event_attributes = option_of_yojson (value_for_key (workflow_execution_continued_as_new_event_attributes_of_yojson) "workflowExecutionContinuedAsNewEventAttributes") _list path;
    cancel_workflow_execution_failed_event_attributes = option_of_yojson (value_for_key (cancel_workflow_execution_failed_event_attributes_of_yojson) "cancelWorkflowExecutionFailedEventAttributes") _list path;
    workflow_execution_canceled_event_attributes = option_of_yojson (value_for_key (workflow_execution_canceled_event_attributes_of_yojson) "workflowExecutionCanceledEventAttributes") _list path;
    workflow_execution_timed_out_event_attributes = option_of_yojson (value_for_key (workflow_execution_timed_out_event_attributes_of_yojson) "workflowExecutionTimedOutEventAttributes") _list path;
    fail_workflow_execution_failed_event_attributes = option_of_yojson (value_for_key (fail_workflow_execution_failed_event_attributes_of_yojson) "failWorkflowExecutionFailedEventAttributes") _list path;
    workflow_execution_failed_event_attributes = option_of_yojson (value_for_key (workflow_execution_failed_event_attributes_of_yojson) "workflowExecutionFailedEventAttributes") _list path;
    complete_workflow_execution_failed_event_attributes = option_of_yojson (value_for_key (complete_workflow_execution_failed_event_attributes_of_yojson) "completeWorkflowExecutionFailedEventAttributes") _list path;
    workflow_execution_completed_event_attributes = option_of_yojson (value_for_key (workflow_execution_completed_event_attributes_of_yojson) "workflowExecutionCompletedEventAttributes") _list path;
    workflow_execution_started_event_attributes = option_of_yojson (value_for_key (workflow_execution_started_event_attributes_of_yojson) "workflowExecutionStartedEventAttributes") _list path;
    event_id = value_for_key (event_id_of_yojson) "eventId" _list path;
    event_type = value_for_key (event_type_of_yojson) "eventType" _list path;
    event_timestamp = value_for_key (timestamp__of_yojson) "eventTimestamp" _list path;
    
  }
  in _res

let history_event_list_of_yojson = 
  fun tree path -> list_of_yojson history_event_of_yojson tree path 

let decision_task_of_yojson = 
  fun tree path : decision_task ->
  let _list = assoc_of_yojson tree path in
  let _res : decision_task = {
    previous_started_event_id = option_of_yojson (value_for_key (event_id_of_yojson) "previousStartedEventId") _list path;
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    events = value_for_key (history_event_list_of_yojson) "events" _list path;
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let page_size_of_yojson = int_of_yojson

let reverse_order_of_yojson = bool_of_yojson

let poll_for_decision_task_input_of_yojson = 
  fun tree path : poll_for_decision_task_input ->
  let _list = assoc_of_yojson tree path in
  let _res : poll_for_decision_task_input = {
    start_at_previous_started_event = option_of_yojson (value_for_key (start_at_previous_started_event_of_yojson) "startAtPreviousStartedEvent") _list path;
    reverse_order = option_of_yojson (value_for_key (reverse_order_of_yojson) "reverseOrder") _list path;
    maximum_page_size = option_of_yojson (value_for_key (page_size_of_yojson) "maximumPageSize") _list path;
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    identity = option_of_yojson (value_for_key (identity_of_yojson) "identity") _list path;
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let activity_task_of_yojson = 
  fun tree path : activity_task ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_task = {
    input = option_of_yojson (value_for_key (data_of_yojson) "input") _list path;
    activity_type = value_for_key (activity_type_of_yojson) "activityType" _list path;
    workflow_execution = value_for_key (workflow_execution_of_yojson) "workflowExecution" _list path;
    started_event_id = value_for_key (event_id_of_yojson) "startedEventId" _list path;
    activity_id = value_for_key (activity_id_of_yojson) "activityId" _list path;
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let poll_for_activity_task_input_of_yojson = 
  fun tree path : poll_for_activity_task_input ->
  let _list = assoc_of_yojson tree path in
  let _res : poll_for_activity_task_input = {
    identity = option_of_yojson (value_for_key (identity_of_yojson) "identity") _list path;
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let list_workflow_types_input_of_yojson = 
  fun tree path : list_workflow_types_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_workflow_types_input = {
    reverse_order = option_of_yojson (value_for_key (reverse_order_of_yojson) "reverseOrder") _list path;
    maximum_page_size = option_of_yojson (value_for_key (page_size_of_yojson) "maximumPageSize") _list path;
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    registration_status = value_for_key (registration_status_of_yojson) "registrationStatus" _list path;
    name = option_of_yojson (value_for_key (name_of_yojson) "name") _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let list_tags_for_resource_output_of_yojson = 
  fun tree path : list_tags_for_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_output = {
    tags = option_of_yojson (value_for_key (resource_tag_list_of_yojson) "tags") _list path;
    
  }
  in _res

let list_tags_for_resource_input_of_yojson = 
  fun tree path : list_tags_for_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_input = {
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let execution_time_filter_of_yojson = 
  fun tree path : execution_time_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_time_filter = {
    latest_date = option_of_yojson (value_for_key (timestamp__of_yojson) "latestDate") _list path;
    oldest_date = value_for_key (timestamp__of_yojson) "oldestDate" _list path;
    
  }
  in _res

let list_open_workflow_executions_input_of_yojson = 
  fun tree path : list_open_workflow_executions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_open_workflow_executions_input = {
    execution_filter = option_of_yojson (value_for_key (workflow_execution_filter_of_yojson) "executionFilter") _list path;
    reverse_order = option_of_yojson (value_for_key (reverse_order_of_yojson) "reverseOrder") _list path;
    maximum_page_size = option_of_yojson (value_for_key (page_size_of_yojson) "maximumPageSize") _list path;
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    tag_filter = option_of_yojson (value_for_key (tag_filter_of_yojson) "tagFilter") _list path;
    type_filter = option_of_yojson (value_for_key (workflow_type_filter_of_yojson) "typeFilter") _list path;
    start_time_filter = value_for_key (execution_time_filter_of_yojson) "startTimeFilter" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let domain_info_of_yojson = 
  fun tree path : domain_info ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_info = {
    arn = option_of_yojson (value_for_key (arn_of_yojson) "arn") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    status = value_for_key (registration_status_of_yojson) "status" _list path;
    name = value_for_key (domain_name_of_yojson) "name" _list path;
    
  }
  in _res

let domain_info_list_of_yojson = 
  fun tree path -> list_of_yojson domain_info_of_yojson tree path 

let domain_infos_of_yojson = 
  fun tree path : domain_infos ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_infos = {
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    domain_infos = value_for_key (domain_info_list_of_yojson) "domainInfos" _list path;
    
  }
  in _res

let list_domains_input_of_yojson = 
  fun tree path : list_domains_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_domains_input = {
    reverse_order = option_of_yojson (value_for_key (reverse_order_of_yojson) "reverseOrder") _list path;
    maximum_page_size = option_of_yojson (value_for_key (page_size_of_yojson) "maximumPageSize") _list path;
    registration_status = value_for_key (registration_status_of_yojson) "registrationStatus" _list path;
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    
  }
  in _res

let close_status_filter_of_yojson = 
  fun tree path : close_status_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : close_status_filter = {
    status = value_for_key (close_status_of_yojson) "status" _list path;
    
  }
  in _res

let list_closed_workflow_executions_input_of_yojson = 
  fun tree path : list_closed_workflow_executions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_closed_workflow_executions_input = {
    reverse_order = option_of_yojson (value_for_key (reverse_order_of_yojson) "reverseOrder") _list path;
    maximum_page_size = option_of_yojson (value_for_key (page_size_of_yojson) "maximumPageSize") _list path;
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    tag_filter = option_of_yojson (value_for_key (tag_filter_of_yojson) "tagFilter") _list path;
    type_filter = option_of_yojson (value_for_key (workflow_type_filter_of_yojson) "typeFilter") _list path;
    close_status_filter = option_of_yojson (value_for_key (close_status_filter_of_yojson) "closeStatusFilter") _list path;
    execution_filter = option_of_yojson (value_for_key (workflow_execution_filter_of_yojson) "executionFilter") _list path;
    close_time_filter = option_of_yojson (value_for_key (execution_time_filter_of_yojson) "closeTimeFilter") _list path;
    start_time_filter = option_of_yojson (value_for_key (execution_time_filter_of_yojson) "startTimeFilter") _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let activity_type_info_of_yojson = 
  fun tree path : activity_type_info ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_type_info = {
    deprecation_date = option_of_yojson (value_for_key (timestamp__of_yojson) "deprecationDate") _list path;
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    status = value_for_key (registration_status_of_yojson) "status" _list path;
    activity_type = value_for_key (activity_type_of_yojson) "activityType" _list path;
    
  }
  in _res

let activity_type_info_list_of_yojson = 
  fun tree path -> list_of_yojson activity_type_info_of_yojson tree path 

let activity_type_infos_of_yojson = 
  fun tree path : activity_type_infos ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_type_infos = {
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    type_infos = value_for_key (activity_type_info_list_of_yojson) "typeInfos" _list path;
    
  }
  in _res

let list_activity_types_input_of_yojson = 
  fun tree path : list_activity_types_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_activity_types_input = {
    reverse_order = option_of_yojson (value_for_key (reverse_order_of_yojson) "reverseOrder") _list path;
    maximum_page_size = option_of_yojson (value_for_key (page_size_of_yojson) "maximumPageSize") _list path;
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    registration_status = value_for_key (registration_status_of_yojson) "registrationStatus" _list path;
    name = option_of_yojson (value_for_key (name_of_yojson) "name") _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let history_of_yojson = 
  fun tree path : history ->
  let _list = assoc_of_yojson tree path in
  let _res : history = {
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    events = value_for_key (history_event_list_of_yojson) "events" _list path;
    
  }
  in _res

let get_workflow_execution_history_input_of_yojson = 
  fun tree path : get_workflow_execution_history_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_workflow_execution_history_input = {
    reverse_order = option_of_yojson (value_for_key (reverse_order_of_yojson) "reverseOrder") _list path;
    maximum_page_size = option_of_yojson (value_for_key (page_size_of_yojson) "maximumPageSize") _list path;
    next_page_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextPageToken") _list path;
    execution = value_for_key (workflow_execution_of_yojson) "execution" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let describe_workflow_type_input_of_yojson = 
  fun tree path : describe_workflow_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_workflow_type_input = {
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let describe_workflow_execution_input_of_yojson = 
  fun tree path : describe_workflow_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_workflow_execution_input = {
    execution = value_for_key (workflow_execution_of_yojson) "execution" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let domain_configuration_of_yojson = 
  fun tree path : domain_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_configuration = {
    workflow_execution_retention_period_in_days = value_for_key (duration_in_days_of_yojson) "workflowExecutionRetentionPeriodInDays" _list path;
    
  }
  in _res

let domain_detail_of_yojson = 
  fun tree path : domain_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_detail = {
    configuration = value_for_key (domain_configuration_of_yojson) "configuration" _list path;
    domain_info = value_for_key (domain_info_of_yojson) "domainInfo" _list path;
    
  }
  in _res

let describe_domain_input_of_yojson = 
  fun tree path : describe_domain_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_domain_input = {
    name = value_for_key (domain_name_of_yojson) "name" _list path;
    
  }
  in _res

let activity_type_configuration_of_yojson = 
  fun tree path : activity_type_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_type_configuration = {
    default_task_schedule_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskScheduleToCloseTimeout") _list path;
    default_task_schedule_to_start_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskScheduleToStartTimeout") _list path;
    default_task_priority = option_of_yojson (value_for_key (task_priority_of_yojson) "defaultTaskPriority") _list path;
    default_task_list = option_of_yojson (value_for_key (task_list_of_yojson) "defaultTaskList") _list path;
    default_task_heartbeat_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskHeartbeatTimeout") _list path;
    default_task_start_to_close_timeout = option_of_yojson (value_for_key (duration_in_seconds_optional_of_yojson) "defaultTaskStartToCloseTimeout") _list path;
    
  }
  in _res

let activity_type_detail_of_yojson = 
  fun tree path : activity_type_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_type_detail = {
    configuration = value_for_key (activity_type_configuration_of_yojson) "configuration" _list path;
    type_info = value_for_key (activity_type_info_of_yojson) "typeInfo" _list path;
    
  }
  in _res

let describe_activity_type_input_of_yojson = 
  fun tree path : describe_activity_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_activity_type_input = {
    activity_type = value_for_key (activity_type_of_yojson) "activityType" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let deprecate_workflow_type_input_of_yojson = 
  fun tree path : deprecate_workflow_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : deprecate_workflow_type_input = {
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let domain_deprecated_fault_of_yojson = 
  fun tree path : domain_deprecated_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_deprecated_fault = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let deprecate_domain_input_of_yojson = 
  fun tree path : deprecate_domain_input ->
  let _list = assoc_of_yojson tree path in
  let _res : deprecate_domain_input = {
    name = value_for_key (domain_name_of_yojson) "name" _list path;
    
  }
  in _res

let deprecate_activity_type_input_of_yojson = 
  fun tree path : deprecate_activity_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : deprecate_activity_type_input = {
    activity_type = value_for_key (activity_type_of_yojson) "activityType" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let delete_workflow_type_input_of_yojson = 
  fun tree path : delete_workflow_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_workflow_type_input = {
    workflow_type = value_for_key (workflow_type_of_yojson) "workflowType" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let delete_activity_type_input_of_yojson = 
  fun tree path : delete_activity_type_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_activity_type_input = {
    activity_type = value_for_key (activity_type_of_yojson) "activityType" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let pending_task_count_of_yojson = 
  fun tree path : pending_task_count ->
  let _list = assoc_of_yojson tree path in
  let _res : pending_task_count = {
    truncated = option_of_yojson (value_for_key (truncated_of_yojson) "truncated") _list path;
    count = value_for_key (count_of_yojson) "count" _list path;
    
  }
  in _res

let count_pending_decision_tasks_input_of_yojson = 
  fun tree path : count_pending_decision_tasks_input ->
  let _list = assoc_of_yojson tree path in
  let _res : count_pending_decision_tasks_input = {
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let count_pending_activity_tasks_input_of_yojson = 
  fun tree path : count_pending_activity_tasks_input ->
  let _list = assoc_of_yojson tree path in
  let _res : count_pending_activity_tasks_input = {
    task_list = value_for_key (task_list_of_yojson) "taskList" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let count_open_workflow_executions_input_of_yojson = 
  fun tree path : count_open_workflow_executions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : count_open_workflow_executions_input = {
    execution_filter = option_of_yojson (value_for_key (workflow_execution_filter_of_yojson) "executionFilter") _list path;
    tag_filter = option_of_yojson (value_for_key (tag_filter_of_yojson) "tagFilter") _list path;
    type_filter = option_of_yojson (value_for_key (workflow_type_filter_of_yojson) "typeFilter") _list path;
    start_time_filter = value_for_key (execution_time_filter_of_yojson) "startTimeFilter" _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let count_closed_workflow_executions_input_of_yojson = 
  fun tree path : count_closed_workflow_executions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : count_closed_workflow_executions_input = {
    close_status_filter = option_of_yojson (value_for_key (close_status_filter_of_yojson) "closeStatusFilter") _list path;
    tag_filter = option_of_yojson (value_for_key (tag_filter_of_yojson) "tagFilter") _list path;
    type_filter = option_of_yojson (value_for_key (workflow_type_filter_of_yojson) "typeFilter") _list path;
    execution_filter = option_of_yojson (value_for_key (workflow_execution_filter_of_yojson) "executionFilter") _list path;
    close_time_filter = option_of_yojson (value_for_key (execution_time_filter_of_yojson) "closeTimeFilter") _list path;
    start_time_filter = option_of_yojson (value_for_key (execution_time_filter_of_yojson) "startTimeFilter") _list path;
    domain = value_for_key (domain_name_of_yojson) "domain" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

