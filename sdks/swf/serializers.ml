open Smaws_Lib.Json.SerializeHelpers

open Types

let name_to_yojson = string_to_yojson

let version_to_yojson = string_to_yojson

let workflow_type_to_yojson = 
  fun (x: workflow_type) -> assoc_to_yojson(
    [(
         "version",
         (Some (version_to_yojson x.version)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let registration_status_to_yojson = 
  fun (x: registration_status) -> match x with 
  | DEPRECATED -> `String "DEPRECATED"
    | REGISTERED -> `String "REGISTERED"
     

let description_to_yojson = string_to_yojson

let timestamp__to_yojson = timestamp_to_yojson

let workflow_type_info_to_yojson = 
  fun (x: workflow_type_info) -> assoc_to_yojson(
    [(
         "deprecationDate",
         (option_to_yojson timestamp__to_yojson x.deprecation_date));
       (
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "status",
         (Some (registration_status_to_yojson x.status)));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       
  ])

let workflow_type_info_list_to_yojson = 
  fun tree -> list_to_yojson workflow_type_info_to_yojson tree

let page_token_to_yojson = string_to_yojson

let workflow_type_infos_to_yojson = 
  fun (x: workflow_type_infos) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "typeInfos",
         (Some (workflow_type_info_list_to_yojson x.type_infos)));
       
  ])

let version_optional_to_yojson = string_to_yojson

let workflow_type_filter_to_yojson = 
  fun (x: workflow_type_filter) -> assoc_to_yojson(
    [(
         "version",
         (option_to_yojson version_optional_to_yojson x.version));
       (
         "name",
         (Some (name_to_yojson x.name)));
       
  ])

let duration_in_seconds_optional_to_yojson = string_to_yojson

let task_list_to_yojson = 
  fun (x: task_list) -> assoc_to_yojson(
    [(
         "name",
         (Some (name_to_yojson x.name)));
       
  ])

let task_priority_to_yojson = string_to_yojson

let child_policy_to_yojson = 
  fun (x: child_policy) -> match x with 
 
| ABANDON -> `String "ABANDON"
  | REQUEST_CANCEL -> `String "REQUEST_CANCEL"
  | TERMINATE -> `String "TERMINATE"
   

let arn_to_yojson = string_to_yojson

let workflow_type_configuration_to_yojson = 
  fun (x: workflow_type_configuration) -> assoc_to_yojson(
    [(
         "defaultLambdaRole",
         (option_to_yojson arn_to_yojson x.default_lambda_role));
       (
         "defaultChildPolicy",
         (option_to_yojson child_policy_to_yojson x.default_child_policy));
       (
         "defaultTaskPriority",
         (option_to_yojson task_priority_to_yojson x.default_task_priority));
       (
         "defaultTaskList",
         (option_to_yojson task_list_to_yojson x.default_task_list));
       (
         "defaultExecutionStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_execution_start_to_close_timeout));
       (
         "defaultTaskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_start_to_close_timeout));
       
  ])

let workflow_type_detail_to_yojson = 
  fun (x: workflow_type_detail) -> assoc_to_yojson(
    [(
         "configuration",
         (Some (workflow_type_configuration_to_yojson x.configuration)));
       (
         "typeInfo",
         (Some (workflow_type_info_to_yojson x.type_info)));
       
  ])

let workflow_run_id_optional_to_yojson = string_to_yojson

let workflow_run_id_to_yojson = string_to_yojson

let workflow_id_to_yojson = string_to_yojson

let workflow_execution_timeout_type_to_yojson = 
  fun (x: workflow_execution_timeout_type) -> match x with 
  | START_TO_CLOSE -> `String "START_TO_CLOSE"
     

let workflow_execution_timed_out_event_attributes_to_yojson = 
  fun (x: workflow_execution_timed_out_event_attributes) -> assoc_to_yojson(
    [(
         "childPolicy",
         (Some (child_policy_to_yojson x.child_policy)));
       (
         "timeoutType",
         (Some (workflow_execution_timeout_type_to_yojson x.timeout_type)));
       
  ])

let terminate_reason_to_yojson = string_to_yojson

let data_to_yojson = string_to_yojson

let workflow_execution_terminated_cause_to_yojson = 
  fun (x: workflow_execution_terminated_cause) -> match x with 
 
| OPERATOR_INITIATED -> `String "OPERATOR_INITIATED"
  | EVENT_LIMIT_EXCEEDED -> `String "EVENT_LIMIT_EXCEEDED"
  | CHILD_POLICY_APPLIED -> `String "CHILD_POLICY_APPLIED"
   

let workflow_execution_terminated_event_attributes_to_yojson = 
  fun (x: workflow_execution_terminated_event_attributes) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson workflow_execution_terminated_cause_to_yojson x.cause));
       (
         "childPolicy",
         (Some (child_policy_to_yojson x.child_policy)));
       (
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "reason",
         (option_to_yojson terminate_reason_to_yojson x.reason));
       
  ])

let tag_to_yojson = string_to_yojson

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let workflow_execution_to_yojson = 
  fun (x: workflow_execution) -> assoc_to_yojson(
    [(
         "runId",
         (Some (workflow_run_id_to_yojson x.run_id)));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       
  ])

let event_id_to_yojson = long_to_yojson

let workflow_execution_started_event_attributes_to_yojson = 
  fun (x: workflow_execution_started_event_attributes) -> assoc_to_yojson(
    [(
         "lambdaRole",
         (option_to_yojson arn_to_yojson x.lambda_role));
       (
         "parentInitiatedEventId",
         (option_to_yojson event_id_to_yojson x.parent_initiated_event_id));
       (
         "parentWorkflowExecution",
         (option_to_yojson workflow_execution_to_yojson x.parent_workflow_execution));
       (
         "continuedExecutionRunId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.continued_execution_run_id));
       (
         "tagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       (
         "childPolicy",
         (Some (child_policy_to_yojson x.child_policy)));
       (
         "taskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout));
       (
         "executionStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       
  ])

let signal_name_to_yojson = string_to_yojson

let workflow_execution_signaled_event_attributes_to_yojson = 
  fun (x: workflow_execution_signaled_event_attributes) -> assoc_to_yojson(
    [(
         "externalInitiatedEventId",
         (option_to_yojson event_id_to_yojson x.external_initiated_event_id));
       (
         "externalWorkflowExecution",
         (option_to_yojson workflow_execution_to_yojson x.external_workflow_execution));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "signalName",
         (Some (signal_name_to_yojson x.signal_name)));
       
  ])

let count_to_yojson = int_to_yojson

let open_decision_tasks_count_to_yojson = int_to_yojson

let workflow_execution_open_counts_to_yojson = 
  fun (x: workflow_execution_open_counts) -> assoc_to_yojson(
    [(
         "openLambdaFunctions",
         (option_to_yojson count_to_yojson x.open_lambda_functions));
       (
         "openChildWorkflowExecutions",
         (Some (count_to_yojson x.open_child_workflow_executions)));
       (
         "openTimers",
         (Some (count_to_yojson x.open_timers)));
       (
         "openDecisionTasks",
         (Some (open_decision_tasks_count_to_yojson x.open_decision_tasks)));
       (
         "openActivityTasks",
         (Some (count_to_yojson x.open_activity_tasks)));
       
  ])

let execution_status_to_yojson = 
  fun (x: execution_status) -> match x with 
  | CLOSED -> `String "CLOSED"
    | OPEN -> `String "OPEN"
     

let close_status_to_yojson = 
  fun (x: close_status) -> match x with 
 
| TIMED_OUT -> `String "TIMED_OUT"
  | CONTINUED_AS_NEW -> `String "CONTINUED_AS_NEW"
  | TERMINATED -> `String "TERMINATED"
  | CANCELED -> `String "CANCELED"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
   

let canceled_to_yojson = bool_to_yojson

let workflow_execution_info_to_yojson = 
  fun (x: workflow_execution_info) -> assoc_to_yojson(
    [(
         "cancelRequested",
         (option_to_yojson canceled_to_yojson x.cancel_requested));
       (
         "tagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "parent",
         (option_to_yojson workflow_execution_to_yojson x.parent));
       (
         "closeStatus",
         (option_to_yojson close_status_to_yojson x.close_status));
       (
         "executionStatus",
         (Some (execution_status_to_yojson x.execution_status)));
       (
         "closeTimestamp",
         (option_to_yojson timestamp__to_yojson x.close_timestamp));
       (
         "startTimestamp",
         (Some (timestamp__to_yojson x.start_timestamp)));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "execution",
         (Some (workflow_execution_to_yojson x.execution)));
       
  ])

let workflow_execution_info_list_to_yojson = 
  fun tree -> list_to_yojson workflow_execution_info_to_yojson tree

let workflow_execution_infos_to_yojson = 
  fun (x: workflow_execution_infos) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "executionInfos",
         (Some (workflow_execution_info_list_to_yojson x.execution_infos)));
       
  ])

let workflow_execution_filter_to_yojson = 
  fun (x: workflow_execution_filter) -> assoc_to_yojson(
    [(
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       
  ])

let failure_reason_to_yojson = string_to_yojson

let workflow_execution_failed_event_attributes_to_yojson = 
  fun (x: workflow_execution_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "reason",
         (option_to_yojson failure_reason_to_yojson x.reason));
       
  ])

let duration_in_seconds_to_yojson = string_to_yojson

let workflow_execution_configuration_to_yojson = 
  fun (x: workflow_execution_configuration) -> assoc_to_yojson(
    [(
         "lambdaRole",
         (option_to_yojson arn_to_yojson x.lambda_role));
       (
         "childPolicy",
         (Some (child_policy_to_yojson x.child_policy)));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       (
         "executionStartToCloseTimeout",
         (Some (duration_in_seconds_to_yojson x.execution_start_to_close_timeout)));
       (
         "taskStartToCloseTimeout",
         (Some (duration_in_seconds_to_yojson x.task_start_to_close_timeout)));
       
  ])

let workflow_execution_detail_to_yojson = 
  fun (x: workflow_execution_detail) -> assoc_to_yojson(
    [(
         "latestExecutionContext",
         (option_to_yojson data_to_yojson x.latest_execution_context));
       (
         "latestActivityTaskTimestamp",
         (option_to_yojson timestamp__to_yojson x.latest_activity_task_timestamp));
       (
         "openCounts",
         (Some (workflow_execution_open_counts_to_yojson x.open_counts)));
       (
         "executionConfiguration",
         (Some (workflow_execution_configuration_to_yojson x.execution_configuration)));
       (
         "executionInfo",
         (Some (workflow_execution_info_to_yojson x.execution_info)));
       
  ])

let truncated_to_yojson = bool_to_yojson

let workflow_execution_count_to_yojson = 
  fun (x: workflow_execution_count) -> assoc_to_yojson(
    [(
         "truncated",
         (option_to_yojson truncated_to_yojson x.truncated));
       (
         "count",
         (Some (count_to_yojson x.count)));
       
  ])

let workflow_execution_continued_as_new_event_attributes_to_yojson = 
  fun (x: workflow_execution_continued_as_new_event_attributes) -> assoc_to_yojson(
    [(
         "lambdaRole",
         (option_to_yojson arn_to_yojson x.lambda_role));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "tagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "childPolicy",
         (Some (child_policy_to_yojson x.child_policy)));
       (
         "taskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       (
         "executionStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout));
       (
         "newExecutionRunId",
         (Some (workflow_run_id_to_yojson x.new_execution_run_id)));
       (
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       
  ])

let workflow_execution_completed_event_attributes_to_yojson = 
  fun (x: workflow_execution_completed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "result",
         (option_to_yojson data_to_yojson x.result));
       
  ])

let workflow_execution_canceled_event_attributes_to_yojson = 
  fun (x: workflow_execution_canceled_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "details",
         (option_to_yojson data_to_yojson x.details));
       
  ])

let workflow_execution_cancel_requested_cause_to_yojson = 
  fun (x: workflow_execution_cancel_requested_cause) -> match x with 
  | CHILD_POLICY_APPLIED -> `String "CHILD_POLICY_APPLIED"
     

let workflow_execution_cancel_requested_event_attributes_to_yojson = 
  fun (x: workflow_execution_cancel_requested_event_attributes) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson workflow_execution_cancel_requested_cause_to_yojson x.cause));
       (
         "externalInitiatedEventId",
         (option_to_yojson event_id_to_yojson x.external_initiated_event_id));
       (
         "externalWorkflowExecution",
         (option_to_yojson workflow_execution_to_yojson x.external_workflow_execution));
       
  ])

let error_message_to_yojson = string_to_yojson

let workflow_execution_already_started_fault_to_yojson = 
  fun (x: workflow_execution_already_started_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_tag_key_to_yojson = string_to_yojson

let resource_tag_key_list_to_yojson = 
  fun tree -> list_to_yojson resource_tag_key_to_yojson tree

let untag_resource_input_to_yojson = 
  fun (x: untag_resource_input) -> assoc_to_yojson(
    [(
         "tagKeys",
         (Some (resource_tag_key_list_to_yojson x.tag_keys)));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let unknown_resource_fault_to_yojson = 
  fun (x: unknown_resource_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let operation_not_permitted_fault_to_yojson = 
  fun (x: operation_not_permitted_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let limit_exceeded_fault_to_yojson = 
  fun (x: limit_exceeded_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let domain_name_to_yojson = string_to_yojson

let undeprecate_workflow_type_input_to_yojson = 
  fun (x: undeprecate_workflow_type_input) -> assoc_to_yojson(
    [(
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let type_already_exists_fault_to_yojson = 
  fun (x: type_already_exists_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let undeprecate_domain_input_to_yojson = 
  fun (x: undeprecate_domain_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (domain_name_to_yojson x.name)));
       
  ])

let domain_already_exists_fault_to_yojson = 
  fun (x: domain_already_exists_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let activity_type_to_yojson = 
  fun (x: activity_type) -> assoc_to_yojson(
    [(
         "version",
         (Some (version_to_yojson x.version)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       
  ])

let undeprecate_activity_type_input_to_yojson = 
  fun (x: undeprecate_activity_type_input) -> assoc_to_yojson(
    [(
         "activityType",
         (Some (activity_type_to_yojson x.activity_type)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let type_not_deprecated_fault_to_yojson = 
  fun (x: type_not_deprecated_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let type_deprecated_fault_to_yojson = 
  fun (x: type_deprecated_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let too_many_tags_fault_to_yojson = 
  fun (x: too_many_tags_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let timer_id_to_yojson = string_to_yojson

let timer_started_event_attributes_to_yojson = 
  fun (x: timer_started_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "startToFireTimeout",
         (Some (duration_in_seconds_to_yojson x.start_to_fire_timeout)));
       (
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "timerId",
         (Some (timer_id_to_yojson x.timer_id)));
       
  ])

let timer_fired_event_attributes_to_yojson = 
  fun (x: timer_fired_event_attributes) -> assoc_to_yojson(
    [(
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "timerId",
         (Some (timer_id_to_yojson x.timer_id)));
       
  ])

let timer_canceled_event_attributes_to_yojson = 
  fun (x: timer_canceled_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "timerId",
         (Some (timer_id_to_yojson x.timer_id)));
       
  ])

let terminate_workflow_execution_input_to_yojson = 
  fun (x: terminate_workflow_execution_input) -> assoc_to_yojson(
    [(
         "childPolicy",
         (option_to_yojson child_policy_to_yojson x.child_policy));
       (
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "reason",
         (option_to_yojson terminate_reason_to_yojson x.reason));
       (
         "runId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.run_id));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let task_token_to_yojson = string_to_yojson

let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson = 
  fun (x: resource_tag) -> assoc_to_yojson(
    [(
         "value",
         (option_to_yojson resource_tag_value_to_yojson x.value));
       (
         "key",
         (Some (resource_tag_key_to_yojson x.key)));
       
  ])

let resource_tag_list_to_yojson = 
  fun tree -> list_to_yojson resource_tag_to_yojson tree

let tag_resource_input_to_yojson = 
  fun (x: tag_resource_input) -> assoc_to_yojson(
    [(
         "tags",
         (Some (resource_tag_list_to_yojson x.tags)));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let tag_filter_to_yojson = 
  fun (x: tag_filter) -> assoc_to_yojson(
    [(
         "tag",
         (Some (tag_to_yojson x.tag)));
       
  ])

let start_workflow_execution_input_to_yojson = 
  fun (x: start_workflow_execution_input) -> assoc_to_yojson(
    [(
         "lambdaRole",
         (option_to_yojson arn_to_yojson x.lambda_role));
       (
         "childPolicy",
         (option_to_yojson child_policy_to_yojson x.child_policy));
       (
         "taskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout));
       (
         "tagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "executionStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (option_to_yojson task_list_to_yojson x.task_list));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let default_undefined_fault_to_yojson = 
  fun (x: default_undefined_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let run_to_yojson = 
  fun (x: run) -> assoc_to_yojson(
    [(
         "runId",
         (option_to_yojson workflow_run_id_to_yojson x.run_id));
       
  ])

let start_timer_failed_cause_to_yojson = 
  fun (x: start_timer_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | TIMER_CREATION_RATE_EXCEEDED -> `String "TIMER_CREATION_RATE_EXCEEDED"
  | OPEN_TIMERS_LIMIT_EXCEEDED -> `String "OPEN_TIMERS_LIMIT_EXCEEDED"
  | TIMER_ID_ALREADY_IN_USE -> `String "TIMER_ID_ALREADY_IN_USE"
   

let start_timer_failed_event_attributes_to_yojson = 
  fun (x: start_timer_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (start_timer_failed_cause_to_yojson x.cause)));
       (
         "timerId",
         (Some (timer_id_to_yojson x.timer_id)));
       
  ])

let start_timer_decision_attributes_to_yojson = 
  fun (x: start_timer_decision_attributes) -> assoc_to_yojson(
    [(
         "startToFireTimeout",
         (Some (duration_in_seconds_to_yojson x.start_to_fire_timeout)));
       (
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "timerId",
         (Some (timer_id_to_yojson x.timer_id)));
       
  ])

let start_lambda_function_failed_cause_to_yojson = 
  fun (x: start_lambda_function_failed_cause) -> match x with 
  | ASSUME_ROLE_FAILED -> `String "ASSUME_ROLE_FAILED"
     

let cause_message_to_yojson = string_to_yojson

let start_lambda_function_failed_event_attributes_to_yojson = 
  fun (x: start_lambda_function_failed_event_attributes) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson cause_message_to_yojson x.message));
       (
         "cause",
         (option_to_yojson start_lambda_function_failed_cause_to_yojson x.cause));
       (
         "scheduledEventId",
         (option_to_yojson event_id_to_yojson x.scheduled_event_id));
       
  ])

let start_child_workflow_execution_initiated_event_attributes_to_yojson = 
  fun (x: start_child_workflow_execution_initiated_event_attributes) -> assoc_to_yojson(
    [(
         "lambdaRole",
         (option_to_yojson arn_to_yojson x.lambda_role));
       (
         "tagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "taskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout));
       (
         "childPolicy",
         (Some (child_policy_to_yojson x.child_policy)));
       (
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       (
         "executionStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       
  ])

let start_child_workflow_execution_failed_cause_to_yojson = 
  fun (x: start_child_workflow_execution_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | DEFAULT_CHILD_POLICY_UNDEFINED -> `String "DEFAULT_CHILD_POLICY_UNDEFINED"
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED -> `String "DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | DEFAULT_TASK_LIST_UNDEFINED -> `String "DEFAULT_TASK_LIST_UNDEFINED"
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED -> `String "DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | WORKFLOW_ALREADY_RUNNING -> `String "WORKFLOW_ALREADY_RUNNING"
  | CHILD_CREATION_RATE_EXCEEDED -> `String "CHILD_CREATION_RATE_EXCEEDED"
  | OPEN_WORKFLOWS_LIMIT_EXCEEDED -> `String "OPEN_WORKFLOWS_LIMIT_EXCEEDED"
  | OPEN_CHILDREN_LIMIT_EXCEEDED -> `String "OPEN_CHILDREN_LIMIT_EXCEEDED"
  | WORKFLOW_TYPE_DEPRECATED -> `String "WORKFLOW_TYPE_DEPRECATED"
  | WORKFLOW_TYPE_DOES_NOT_EXIST -> `String "WORKFLOW_TYPE_DOES_NOT_EXIST"
   

let start_child_workflow_execution_failed_event_attributes_to_yojson = 
  fun (x: start_child_workflow_execution_failed_event_attributes) -> assoc_to_yojson(
    [(
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       (
         "cause",
         (Some (start_child_workflow_execution_failed_cause_to_yojson x.cause)));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       
  ])

let start_child_workflow_execution_decision_attributes_to_yojson = 
  fun (x: start_child_workflow_execution_decision_attributes) -> assoc_to_yojson(
    [(
         "lambdaRole",
         (option_to_yojson arn_to_yojson x.lambda_role));
       (
         "tagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "childPolicy",
         (option_to_yojson child_policy_to_yojson x.child_policy));
       (
         "taskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (option_to_yojson task_list_to_yojson x.task_list));
       (
         "executionStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       
  ])

let start_at_previous_started_event_to_yojson = bool_to_yojson

let signal_workflow_execution_input_to_yojson = 
  fun (x: signal_workflow_execution_input) -> assoc_to_yojson(
    [(
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "signalName",
         (Some (signal_name_to_yojson x.signal_name)));
       (
         "runId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.run_id));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let decision_type_to_yojson = 
  fun (x: decision_type) -> match x with 
 
| ScheduleLambdaFunction -> `String "ScheduleLambdaFunction"
  | StartChildWorkflowExecution -> `String "StartChildWorkflowExecution"
  | RequestCancelExternalWorkflowExecution -> `String "RequestCancelExternalWorkflowExecution"
  | SignalExternalWorkflowExecution -> `String "SignalExternalWorkflowExecution"
  | CancelTimer -> `String "CancelTimer"
  | StartTimer -> `String "StartTimer"
  | RecordMarker -> `String "RecordMarker"
  | ContinueAsNewWorkflowExecution -> `String "ContinueAsNewWorkflowExecution"
  | CancelWorkflowExecution -> `String "CancelWorkflowExecution"
  | FailWorkflowExecution -> `String "FailWorkflowExecution"
  | CompleteWorkflowExecution -> `String "CompleteWorkflowExecution"
  | RequestCancelActivityTask -> `String "RequestCancelActivityTask"
  | ScheduleActivityTask -> `String "ScheduleActivityTask"
   

let activity_id_to_yojson = string_to_yojson

let schedule_activity_task_decision_attributes_to_yojson = 
  fun (x: schedule_activity_task_decision_attributes) -> assoc_to_yojson(
    [(
         "heartbeatTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.heartbeat_timeout));
       (
         "startToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout));
       (
         "scheduleToStartTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_start_timeout));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (option_to_yojson task_list_to_yojson x.task_list));
       (
         "scheduleToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_close_timeout));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "activityId",
         (Some (activity_id_to_yojson x.activity_id)));
       (
         "activityType",
         (Some (activity_type_to_yojson x.activity_type)));
       
  ])

let request_cancel_activity_task_decision_attributes_to_yojson = 
  fun (x: request_cancel_activity_task_decision_attributes) -> assoc_to_yojson(
    [(
         "activityId",
         (Some (activity_id_to_yojson x.activity_id)));
       
  ])

let complete_workflow_execution_decision_attributes_to_yojson = 
  fun (x: complete_workflow_execution_decision_attributes) -> assoc_to_yojson(
    [(
         "result",
         (option_to_yojson data_to_yojson x.result));
       
  ])

let fail_workflow_execution_decision_attributes_to_yojson = 
  fun (x: fail_workflow_execution_decision_attributes) -> assoc_to_yojson(
    [(
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "reason",
         (option_to_yojson failure_reason_to_yojson x.reason));
       
  ])

let cancel_workflow_execution_decision_attributes_to_yojson = 
  fun (x: cancel_workflow_execution_decision_attributes) -> assoc_to_yojson(
    [(
         "details",
         (option_to_yojson data_to_yojson x.details));
       
  ])

let continue_as_new_workflow_execution_decision_attributes_to_yojson = 
  fun (x: continue_as_new_workflow_execution_decision_attributes) -> assoc_to_yojson(
    [(
         "lambdaRole",
         (option_to_yojson arn_to_yojson x.lambda_role));
       (
         "workflowTypeVersion",
         (option_to_yojson version_to_yojson x.workflow_type_version));
       (
         "tagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "childPolicy",
         (option_to_yojson child_policy_to_yojson x.child_policy));
       (
         "taskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.task_start_to_close_timeout));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (option_to_yojson task_list_to_yojson x.task_list));
       (
         "executionStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.execution_start_to_close_timeout));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       
  ])

let marker_name_to_yojson = string_to_yojson

let record_marker_decision_attributes_to_yojson = 
  fun (x: record_marker_decision_attributes) -> assoc_to_yojson(
    [(
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "markerName",
         (Some (marker_name_to_yojson x.marker_name)));
       
  ])

let cancel_timer_decision_attributes_to_yojson = 
  fun (x: cancel_timer_decision_attributes) -> assoc_to_yojson(
    [(
         "timerId",
         (Some (timer_id_to_yojson x.timer_id)));
       
  ])

let signal_external_workflow_execution_decision_attributes_to_yojson = 
  fun (x: signal_external_workflow_execution_decision_attributes) -> assoc_to_yojson(
    [(
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "signalName",
         (Some (signal_name_to_yojson x.signal_name)));
       (
         "runId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.run_id));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       
  ])

let request_cancel_external_workflow_execution_decision_attributes_to_yojson
= 
  fun (x: request_cancel_external_workflow_execution_decision_attributes) -> assoc_to_yojson(
    [(
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "runId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.run_id));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       
  ])

let function_id_to_yojson = string_to_yojson

let function_name_to_yojson = string_to_yojson

let function_input_to_yojson = string_to_yojson

let schedule_lambda_function_decision_attributes_to_yojson = 
  fun (x: schedule_lambda_function_decision_attributes) -> assoc_to_yojson(
    [(
         "startToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout));
       (
         "input",
         (option_to_yojson function_input_to_yojson x.input));
       (
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "name",
         (Some (function_name_to_yojson x.name)));
       (
         "id",
         (Some (function_id_to_yojson x.id)));
       
  ])

let decision_to_yojson = 
  fun (x: decision) -> assoc_to_yojson(
    [(
         "scheduleLambdaFunctionDecisionAttributes",
         (option_to_yojson schedule_lambda_function_decision_attributes_to_yojson x.schedule_lambda_function_decision_attributes));
       (
         "startChildWorkflowExecutionDecisionAttributes",
         (option_to_yojson start_child_workflow_execution_decision_attributes_to_yojson x.start_child_workflow_execution_decision_attributes));
       (
         "requestCancelExternalWorkflowExecutionDecisionAttributes",
         (option_to_yojson request_cancel_external_workflow_execution_decision_attributes_to_yojson x.request_cancel_external_workflow_execution_decision_attributes));
       (
         "signalExternalWorkflowExecutionDecisionAttributes",
         (option_to_yojson signal_external_workflow_execution_decision_attributes_to_yojson x.signal_external_workflow_execution_decision_attributes));
       (
         "cancelTimerDecisionAttributes",
         (option_to_yojson cancel_timer_decision_attributes_to_yojson x.cancel_timer_decision_attributes));
       (
         "startTimerDecisionAttributes",
         (option_to_yojson start_timer_decision_attributes_to_yojson x.start_timer_decision_attributes));
       (
         "recordMarkerDecisionAttributes",
         (option_to_yojson record_marker_decision_attributes_to_yojson x.record_marker_decision_attributes));
       (
         "continueAsNewWorkflowExecutionDecisionAttributes",
         (option_to_yojson continue_as_new_workflow_execution_decision_attributes_to_yojson x.continue_as_new_workflow_execution_decision_attributes));
       (
         "cancelWorkflowExecutionDecisionAttributes",
         (option_to_yojson cancel_workflow_execution_decision_attributes_to_yojson x.cancel_workflow_execution_decision_attributes));
       (
         "failWorkflowExecutionDecisionAttributes",
         (option_to_yojson fail_workflow_execution_decision_attributes_to_yojson x.fail_workflow_execution_decision_attributes));
       (
         "completeWorkflowExecutionDecisionAttributes",
         (option_to_yojson complete_workflow_execution_decision_attributes_to_yojson x.complete_workflow_execution_decision_attributes));
       (
         "requestCancelActivityTaskDecisionAttributes",
         (option_to_yojson request_cancel_activity_task_decision_attributes_to_yojson x.request_cancel_activity_task_decision_attributes));
       (
         "scheduleActivityTaskDecisionAttributes",
         (option_to_yojson schedule_activity_task_decision_attributes_to_yojson x.schedule_activity_task_decision_attributes));
       (
         "decisionType",
         (Some (decision_type_to_yojson x.decision_type)));
       
  ])

let decision_list_to_yojson = 
  fun tree -> list_to_yojson decision_to_yojson tree

let respond_decision_task_completed_input_to_yojson = 
  fun (x: respond_decision_task_completed_input) -> assoc_to_yojson(
    [(
         "taskListScheduleToStartTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.task_list_schedule_to_start_timeout));
       (
         "taskList",
         (option_to_yojson task_list_to_yojson x.task_list));
       (
         "executionContext",
         (option_to_yojson data_to_yojson x.execution_context));
       (
         "decisions",
         (option_to_yojson decision_list_to_yojson x.decisions));
       (
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let respond_activity_task_failed_input_to_yojson = 
  fun (x: respond_activity_task_failed_input) -> assoc_to_yojson(
    [(
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "reason",
         (option_to_yojson failure_reason_to_yojson x.reason));
       (
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let respond_activity_task_completed_input_to_yojson = 
  fun (x: respond_activity_task_completed_input) -> assoc_to_yojson(
    [(
         "result",
         (option_to_yojson data_to_yojson x.result));
       (
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let respond_activity_task_canceled_input_to_yojson = 
  fun (x: respond_activity_task_canceled_input) -> assoc_to_yojson(
    [(
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let request_cancel_workflow_execution_input_to_yojson = 
  fun (x: request_cancel_workflow_execution_input) -> assoc_to_yojson(
    [(
         "runId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.run_id));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let register_workflow_type_input_to_yojson = 
  fun (x: register_workflow_type_input) -> assoc_to_yojson(
    [(
         "defaultLambdaRole",
         (option_to_yojson arn_to_yojson x.default_lambda_role));
       (
         "defaultChildPolicy",
         (option_to_yojson child_policy_to_yojson x.default_child_policy));
       (
         "defaultTaskPriority",
         (option_to_yojson task_priority_to_yojson x.default_task_priority));
       (
         "defaultTaskList",
         (option_to_yojson task_list_to_yojson x.default_task_list));
       (
         "defaultExecutionStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_execution_start_to_close_timeout));
       (
         "defaultTaskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_start_to_close_timeout));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "version",
         (Some (version_to_yojson x.version)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let duration_in_days_to_yojson = string_to_yojson

let register_domain_input_to_yojson = 
  fun (x: register_domain_input) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson resource_tag_list_to_yojson x.tags));
       (
         "workflowExecutionRetentionPeriodInDays",
         (Some (duration_in_days_to_yojson x.workflow_execution_retention_period_in_days)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "name",
         (Some (domain_name_to_yojson x.name)));
       
  ])

let register_activity_type_input_to_yojson = 
  fun (x: register_activity_type_input) -> assoc_to_yojson(
    [(
         "defaultTaskScheduleToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_schedule_to_close_timeout));
       (
         "defaultTaskScheduleToStartTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_schedule_to_start_timeout));
       (
         "defaultTaskPriority",
         (option_to_yojson task_priority_to_yojson x.default_task_priority));
       (
         "defaultTaskList",
         (option_to_yojson task_list_to_yojson x.default_task_list));
       (
         "defaultTaskHeartbeatTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_heartbeat_timeout));
       (
         "defaultTaskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_start_to_close_timeout));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "version",
         (Some (version_to_yojson x.version)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let activity_task_status_to_yojson = 
  fun (x: activity_task_status) -> assoc_to_yojson(
    [(
         "cancelRequested",
         (Some (canceled_to_yojson x.cancel_requested)));
       
  ])

let limited_data_to_yojson = string_to_yojson

let record_activity_task_heartbeat_input_to_yojson = 
  fun (x: record_activity_task_heartbeat_input) -> assoc_to_yojson(
    [(
         "details",
         (option_to_yojson limited_data_to_yojson x.details));
       (
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let event_type_to_yojson = 
  fun (x: event_type) -> match x with 
 
| StartLambdaFunctionFailed -> `String "StartLambdaFunctionFailed"
  | ScheduleLambdaFunctionFailed -> `String "ScheduleLambdaFunctionFailed"
  | LambdaFunctionTimedOut -> `String "LambdaFunctionTimedOut"
  | LambdaFunctionFailed -> `String "LambdaFunctionFailed"
  | LambdaFunctionCompleted -> `String "LambdaFunctionCompleted"
  | LambdaFunctionStarted -> `String "LambdaFunctionStarted"
  | LambdaFunctionScheduled -> `String "LambdaFunctionScheduled"
  | ExternalWorkflowExecutionCancelRequested -> `String "ExternalWorkflowExecutionCancelRequested"
  | RequestCancelExternalWorkflowExecutionFailed -> `String "RequestCancelExternalWorkflowExecutionFailed"
  | RequestCancelExternalWorkflowExecutionInitiated -> `String "RequestCancelExternalWorkflowExecutionInitiated"
  | ExternalWorkflowExecutionSignaled -> `String "ExternalWorkflowExecutionSignaled"
  | SignalExternalWorkflowExecutionFailed -> `String "SignalExternalWorkflowExecutionFailed"
  | SignalExternalWorkflowExecutionInitiated -> `String "SignalExternalWorkflowExecutionInitiated"
  | ChildWorkflowExecutionTerminated -> `String "ChildWorkflowExecutionTerminated"
  | ChildWorkflowExecutionCanceled -> `String "ChildWorkflowExecutionCanceled"
  | ChildWorkflowExecutionTimedOut -> `String "ChildWorkflowExecutionTimedOut"
  | ChildWorkflowExecutionFailed -> `String "ChildWorkflowExecutionFailed"
  | ChildWorkflowExecutionCompleted -> `String "ChildWorkflowExecutionCompleted"
  | ChildWorkflowExecutionStarted -> `String "ChildWorkflowExecutionStarted"
  | StartChildWorkflowExecutionFailed -> `String "StartChildWorkflowExecutionFailed"
  | StartChildWorkflowExecutionInitiated -> `String "StartChildWorkflowExecutionInitiated"
  | CancelTimerFailed -> `String "CancelTimerFailed"
  | TimerCanceled -> `String "TimerCanceled"
  | TimerFired -> `String "TimerFired"
  | StartTimerFailed -> `String "StartTimerFailed"
  | TimerStarted -> `String "TimerStarted"
  | RecordMarkerFailed -> `String "RecordMarkerFailed"
  | MarkerRecorded -> `String "MarkerRecorded"
  | WorkflowExecutionSignaled -> `String "WorkflowExecutionSignaled"
  | RequestCancelActivityTaskFailed -> `String "RequestCancelActivityTaskFailed"
  | ActivityTaskCancelRequested -> `String "ActivityTaskCancelRequested"
  | ActivityTaskCanceled -> `String "ActivityTaskCanceled"
  | ActivityTaskTimedOut -> `String "ActivityTaskTimedOut"
  | ActivityTaskFailed -> `String "ActivityTaskFailed"
  | ActivityTaskCompleted -> `String "ActivityTaskCompleted"
  | ActivityTaskStarted -> `String "ActivityTaskStarted"
  | ScheduleActivityTaskFailed -> `String "ScheduleActivityTaskFailed"
  | ActivityTaskScheduled -> `String "ActivityTaskScheduled"
  | DecisionTaskTimedOut -> `String "DecisionTaskTimedOut"
  | DecisionTaskCompleted -> `String "DecisionTaskCompleted"
  | DecisionTaskStarted -> `String "DecisionTaskStarted"
  | DecisionTaskScheduled -> `String "DecisionTaskScheduled"
  | WorkflowExecutionTerminated -> `String "WorkflowExecutionTerminated"
  | ContinueAsNewWorkflowExecutionFailed -> `String "ContinueAsNewWorkflowExecutionFailed"
  | WorkflowExecutionContinuedAsNew -> `String "WorkflowExecutionContinuedAsNew"
  | CancelWorkflowExecutionFailed -> `String "CancelWorkflowExecutionFailed"
  | WorkflowExecutionCanceled -> `String "WorkflowExecutionCanceled"
  | WorkflowExecutionTimedOut -> `String "WorkflowExecutionTimedOut"
  | FailWorkflowExecutionFailed -> `String "FailWorkflowExecutionFailed"
  | WorkflowExecutionFailed -> `String "WorkflowExecutionFailed"
  | CompleteWorkflowExecutionFailed -> `String "CompleteWorkflowExecutionFailed"
  | WorkflowExecutionCompleted -> `String "WorkflowExecutionCompleted"
  | WorkflowExecutionCancelRequested -> `String "WorkflowExecutionCancelRequested"
  | WorkflowExecutionStarted -> `String "WorkflowExecutionStarted"
   

let complete_workflow_execution_failed_cause_to_yojson = 
  fun (x: complete_workflow_execution_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | UNHANDLED_DECISION -> `String "UNHANDLED_DECISION"
   

let complete_workflow_execution_failed_event_attributes_to_yojson = 
  fun (x: complete_workflow_execution_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (complete_workflow_execution_failed_cause_to_yojson x.cause)));
       
  ])

let fail_workflow_execution_failed_cause_to_yojson = 
  fun (x: fail_workflow_execution_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | UNHANDLED_DECISION -> `String "UNHANDLED_DECISION"
   

let fail_workflow_execution_failed_event_attributes_to_yojson = 
  fun (x: fail_workflow_execution_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (fail_workflow_execution_failed_cause_to_yojson x.cause)));
       
  ])

let cancel_workflow_execution_failed_cause_to_yojson = 
  fun (x: cancel_workflow_execution_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | UNHANDLED_DECISION -> `String "UNHANDLED_DECISION"
   

let cancel_workflow_execution_failed_event_attributes_to_yojson = 
  fun (x: cancel_workflow_execution_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (cancel_workflow_execution_failed_cause_to_yojson x.cause)));
       
  ])

let continue_as_new_workflow_execution_failed_cause_to_yojson = 
  fun (x: continue_as_new_workflow_execution_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED -> `String "CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED"
  | DEFAULT_CHILD_POLICY_UNDEFINED -> `String "DEFAULT_CHILD_POLICY_UNDEFINED"
  | DEFAULT_TASK_LIST_UNDEFINED -> `String "DEFAULT_TASK_LIST_UNDEFINED"
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED -> `String "DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED -> `String "DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | WORKFLOW_TYPE_DOES_NOT_EXIST -> `String "WORKFLOW_TYPE_DOES_NOT_EXIST"
  | WORKFLOW_TYPE_DEPRECATED -> `String "WORKFLOW_TYPE_DEPRECATED"
  | UNHANDLED_DECISION -> `String "UNHANDLED_DECISION"
   

let continue_as_new_workflow_execution_failed_event_attributes_to_yojson = 
  fun (x: continue_as_new_workflow_execution_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (continue_as_new_workflow_execution_failed_cause_to_yojson x.cause)));
       
  ])

let decision_task_scheduled_event_attributes_to_yojson = 
  fun (x: decision_task_scheduled_event_attributes) -> assoc_to_yojson(
    [(
         "scheduleToStartTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_start_timeout));
       (
         "startToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       
  ])

let identity_to_yojson = string_to_yojson

let decision_task_started_event_attributes_to_yojson = 
  fun (x: decision_task_started_event_attributes) -> assoc_to_yojson(
    [(
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       (
         "identity",
         (option_to_yojson identity_to_yojson x.identity));
       
  ])

let decision_task_completed_event_attributes_to_yojson = 
  fun (x: decision_task_completed_event_attributes) -> assoc_to_yojson(
    [(
         "taskListScheduleToStartTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.task_list_schedule_to_start_timeout));
       (
         "taskList",
         (option_to_yojson task_list_to_yojson x.task_list));
       (
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       (
         "executionContext",
         (option_to_yojson data_to_yojson x.execution_context));
       
  ])

let decision_task_timeout_type_to_yojson = 
  fun (x: decision_task_timeout_type) -> match x with 
 
| SCHEDULE_TO_START -> `String "SCHEDULE_TO_START"
  | START_TO_CLOSE -> `String "START_TO_CLOSE"
   

let decision_task_timed_out_event_attributes_to_yojson = 
  fun (x: decision_task_timed_out_event_attributes) -> assoc_to_yojson(
    [(
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       (
         "timeoutType",
         (Some (decision_task_timeout_type_to_yojson x.timeout_type)));
       
  ])

let activity_task_scheduled_event_attributes_to_yojson = 
  fun (x: activity_task_scheduled_event_attributes) -> assoc_to_yojson(
    [(
         "heartbeatTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.heartbeat_timeout));
       (
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "taskPriority",
         (option_to_yojson task_priority_to_yojson x.task_priority));
       (
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       (
         "startToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout));
       (
         "scheduleToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_close_timeout));
       (
         "scheduleToStartTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.schedule_to_start_timeout));
       (
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "activityId",
         (Some (activity_id_to_yojson x.activity_id)));
       (
         "activityType",
         (Some (activity_type_to_yojson x.activity_type)));
       
  ])

let activity_task_started_event_attributes_to_yojson = 
  fun (x: activity_task_started_event_attributes) -> assoc_to_yojson(
    [(
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       (
         "identity",
         (option_to_yojson identity_to_yojson x.identity));
       
  ])

let activity_task_completed_event_attributes_to_yojson = 
  fun (x: activity_task_completed_event_attributes) -> assoc_to_yojson(
    [(
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       (
         "result",
         (option_to_yojson data_to_yojson x.result));
       
  ])

let activity_task_failed_event_attributes_to_yojson = 
  fun (x: activity_task_failed_event_attributes) -> assoc_to_yojson(
    [(
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       (
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "reason",
         (option_to_yojson failure_reason_to_yojson x.reason));
       
  ])

let activity_task_timeout_type_to_yojson = 
  fun (x: activity_task_timeout_type) -> match x with 
 
| HEARTBEAT -> `String "HEARTBEAT"
  | SCHEDULE_TO_CLOSE -> `String "SCHEDULE_TO_CLOSE"
  | SCHEDULE_TO_START -> `String "SCHEDULE_TO_START"
  | START_TO_CLOSE -> `String "START_TO_CLOSE"
   

let activity_task_timed_out_event_attributes_to_yojson = 
  fun (x: activity_task_timed_out_event_attributes) -> assoc_to_yojson(
    [(
         "details",
         (option_to_yojson limited_data_to_yojson x.details));
       (
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       (
         "timeoutType",
         (Some (activity_task_timeout_type_to_yojson x.timeout_type)));
       
  ])

let activity_task_canceled_event_attributes_to_yojson = 
  fun (x: activity_task_canceled_event_attributes) -> assoc_to_yojson(
    [(
         "latestCancelRequestedEventId",
         (option_to_yojson event_id_to_yojson x.latest_cancel_requested_event_id));
       (
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       (
         "details",
         (option_to_yojson data_to_yojson x.details));
       
  ])

let activity_task_cancel_requested_event_attributes_to_yojson = 
  fun (x: activity_task_cancel_requested_event_attributes) -> assoc_to_yojson(
    [(
         "activityId",
         (Some (activity_id_to_yojson x.activity_id)));
       (
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       
  ])

let marker_recorded_event_attributes_to_yojson = 
  fun (x: marker_recorded_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "markerName",
         (Some (marker_name_to_yojson x.marker_name)));
       
  ])

let record_marker_failed_cause_to_yojson = 
  fun (x: record_marker_failed_cause) -> match x with 
  | OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
     

let record_marker_failed_event_attributes_to_yojson = 
  fun (x: record_marker_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (record_marker_failed_cause_to_yojson x.cause)));
       (
         "markerName",
         (Some (marker_name_to_yojson x.marker_name)));
       
  ])

let child_workflow_execution_started_event_attributes_to_yojson = 
  fun (x: child_workflow_execution_started_event_attributes) -> assoc_to_yojson(
    [(
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       
  ])

let child_workflow_execution_completed_event_attributes_to_yojson = 
  fun (x: child_workflow_execution_completed_event_attributes) -> assoc_to_yojson(
    [(
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "result",
         (option_to_yojson data_to_yojson x.result));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       
  ])

let child_workflow_execution_failed_event_attributes_to_yojson = 
  fun (x: child_workflow_execution_failed_event_attributes) -> assoc_to_yojson(
    [(
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "reason",
         (option_to_yojson failure_reason_to_yojson x.reason));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       
  ])

let child_workflow_execution_timed_out_event_attributes_to_yojson = 
  fun (x: child_workflow_execution_timed_out_event_attributes) -> assoc_to_yojson(
    [(
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "timeoutType",
         (Some (workflow_execution_timeout_type_to_yojson x.timeout_type)));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       
  ])

let child_workflow_execution_canceled_event_attributes_to_yojson = 
  fun (x: child_workflow_execution_canceled_event_attributes) -> assoc_to_yojson(
    [(
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       
  ])

let child_workflow_execution_terminated_event_attributes_to_yojson = 
  fun (x: child_workflow_execution_terminated_event_attributes) -> assoc_to_yojson(
    [(
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       
  ])

let signal_external_workflow_execution_initiated_event_attributes_to_yojson = 
  fun (x: signal_external_workflow_execution_initiated_event_attributes) -> assoc_to_yojson(
    [(
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "signalName",
         (Some (signal_name_to_yojson x.signal_name)));
       (
         "runId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.run_id));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       
  ])

let external_workflow_execution_signaled_event_attributes_to_yojson = 
  fun (x: external_workflow_execution_signaled_event_attributes) -> assoc_to_yojson(
    [(
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       
  ])

let signal_external_workflow_execution_failed_cause_to_yojson = 
  fun (x: signal_external_workflow_execution_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED -> `String "SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED"
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION -> `String "UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION"
   

let signal_external_workflow_execution_failed_event_attributes_to_yojson = 
  fun (x: signal_external_workflow_execution_failed_event_attributes) -> assoc_to_yojson(
    [(
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "cause",
         (Some (signal_external_workflow_execution_failed_cause_to_yojson x.cause)));
       (
         "runId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.run_id));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       
  ])

let external_workflow_execution_cancel_requested_event_attributes_to_yojson = 
  fun (x: external_workflow_execution_cancel_requested_event_attributes) -> assoc_to_yojson(
    [(
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       
  ])

let
request_cancel_external_workflow_execution_initiated_event_attributes_to_yojson
= 
  fun (x: request_cancel_external_workflow_execution_initiated_event_attributes) -> assoc_to_yojson(
    [(
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "runId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.run_id));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       
  ])

let request_cancel_external_workflow_execution_failed_cause_to_yojson = 
  fun (x: request_cancel_external_workflow_execution_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED -> `String "REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED"
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION -> `String "UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION"
   

let
request_cancel_external_workflow_execution_failed_event_attributes_to_yojson
= 
  fun (x: request_cancel_external_workflow_execution_failed_event_attributes) -> assoc_to_yojson(
    [(
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "initiatedEventId",
         (Some (event_id_to_yojson x.initiated_event_id)));
       (
         "cause",
         (Some (request_cancel_external_workflow_execution_failed_cause_to_yojson x.cause)));
       (
         "runId",
         (option_to_yojson workflow_run_id_optional_to_yojson x.run_id));
       (
         "workflowId",
         (Some (workflow_id_to_yojson x.workflow_id)));
       
  ])

let schedule_activity_task_failed_cause_to_yojson = 
  fun (x: schedule_activity_task_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED -> `String "DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED"
  | DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED -> `String "DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED"
  | DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED -> `String "DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED"
  | DEFAULT_TASK_LIST_UNDEFINED -> `String "DEFAULT_TASK_LIST_UNDEFINED"
  | DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED -> `String "DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED"
  | ACTIVITY_CREATION_RATE_EXCEEDED -> `String "ACTIVITY_CREATION_RATE_EXCEEDED"
  | OPEN_ACTIVITIES_LIMIT_EXCEEDED -> `String "OPEN_ACTIVITIES_LIMIT_EXCEEDED"
  | ACTIVITY_ID_ALREADY_IN_USE -> `String "ACTIVITY_ID_ALREADY_IN_USE"
  | ACTIVITY_TYPE_DOES_NOT_EXIST -> `String "ACTIVITY_TYPE_DOES_NOT_EXIST"
  | ACTIVITY_TYPE_DEPRECATED -> `String "ACTIVITY_TYPE_DEPRECATED"
   

let schedule_activity_task_failed_event_attributes_to_yojson = 
  fun (x: schedule_activity_task_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (schedule_activity_task_failed_cause_to_yojson x.cause)));
       (
         "activityId",
         (Some (activity_id_to_yojson x.activity_id)));
       (
         "activityType",
         (Some (activity_type_to_yojson x.activity_type)));
       
  ])

let request_cancel_activity_task_failed_cause_to_yojson = 
  fun (x: request_cancel_activity_task_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | ACTIVITY_ID_UNKNOWN -> `String "ACTIVITY_ID_UNKNOWN"
   

let request_cancel_activity_task_failed_event_attributes_to_yojson = 
  fun (x: request_cancel_activity_task_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (request_cancel_activity_task_failed_cause_to_yojson x.cause)));
       (
         "activityId",
         (Some (activity_id_to_yojson x.activity_id)));
       
  ])

let cancel_timer_failed_cause_to_yojson = 
  fun (x: cancel_timer_failed_cause) -> match x with 
 
| OPERATION_NOT_PERMITTED -> `String "OPERATION_NOT_PERMITTED"
  | TIMER_ID_UNKNOWN -> `String "TIMER_ID_UNKNOWN"
   

let cancel_timer_failed_event_attributes_to_yojson = 
  fun (x: cancel_timer_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (cancel_timer_failed_cause_to_yojson x.cause)));
       (
         "timerId",
         (Some (timer_id_to_yojson x.timer_id)));
       
  ])

let lambda_function_scheduled_event_attributes_to_yojson = 
  fun (x: lambda_function_scheduled_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "startToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.start_to_close_timeout));
       (
         "input",
         (option_to_yojson function_input_to_yojson x.input));
       (
         "control",
         (option_to_yojson data_to_yojson x.control));
       (
         "name",
         (Some (function_name_to_yojson x.name)));
       (
         "id",
         (Some (function_id_to_yojson x.id)));
       
  ])

let lambda_function_started_event_attributes_to_yojson = 
  fun (x: lambda_function_started_event_attributes) -> assoc_to_yojson(
    [(
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       
  ])

let lambda_function_completed_event_attributes_to_yojson = 
  fun (x: lambda_function_completed_event_attributes) -> assoc_to_yojson(
    [(
         "result",
         (option_to_yojson data_to_yojson x.result));
       (
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       
  ])

let lambda_function_failed_event_attributes_to_yojson = 
  fun (x: lambda_function_failed_event_attributes) -> assoc_to_yojson(
    [(
         "details",
         (option_to_yojson data_to_yojson x.details));
       (
         "reason",
         (option_to_yojson failure_reason_to_yojson x.reason));
       (
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       
  ])

let lambda_function_timeout_type_to_yojson = 
  fun (x: lambda_function_timeout_type) -> match x with 
  | START_TO_CLOSE -> `String "START_TO_CLOSE"
     

let lambda_function_timed_out_event_attributes_to_yojson = 
  fun (x: lambda_function_timed_out_event_attributes) -> assoc_to_yojson(
    [(
         "timeoutType",
         (option_to_yojson lambda_function_timeout_type_to_yojson x.timeout_type));
       (
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "scheduledEventId",
         (Some (event_id_to_yojson x.scheduled_event_id)));
       
  ])

let schedule_lambda_function_failed_cause_to_yojson = 
  fun (x: schedule_lambda_function_failed_cause) -> match x with 
 
| LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION -> `String "LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION"
  | LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED -> `String "LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED"
  | OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED -> `String "OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED"
  | ID_ALREADY_IN_USE -> `String "ID_ALREADY_IN_USE"
   

let schedule_lambda_function_failed_event_attributes_to_yojson = 
  fun (x: schedule_lambda_function_failed_event_attributes) -> assoc_to_yojson(
    [(
         "decisionTaskCompletedEventId",
         (Some (event_id_to_yojson x.decision_task_completed_event_id)));
       (
         "cause",
         (Some (schedule_lambda_function_failed_cause_to_yojson x.cause)));
       (
         "name",
         (Some (function_name_to_yojson x.name)));
       (
         "id",
         (Some (function_id_to_yojson x.id)));
       
  ])

let history_event_to_yojson = 
  fun (x: history_event) -> assoc_to_yojson(
    [(
         "startLambdaFunctionFailedEventAttributes",
         (option_to_yojson start_lambda_function_failed_event_attributes_to_yojson x.start_lambda_function_failed_event_attributes));
       (
         "scheduleLambdaFunctionFailedEventAttributes",
         (option_to_yojson schedule_lambda_function_failed_event_attributes_to_yojson x.schedule_lambda_function_failed_event_attributes));
       (
         "lambdaFunctionTimedOutEventAttributes",
         (option_to_yojson lambda_function_timed_out_event_attributes_to_yojson x.lambda_function_timed_out_event_attributes));
       (
         "lambdaFunctionFailedEventAttributes",
         (option_to_yojson lambda_function_failed_event_attributes_to_yojson x.lambda_function_failed_event_attributes));
       (
         "lambdaFunctionCompletedEventAttributes",
         (option_to_yojson lambda_function_completed_event_attributes_to_yojson x.lambda_function_completed_event_attributes));
       (
         "lambdaFunctionStartedEventAttributes",
         (option_to_yojson lambda_function_started_event_attributes_to_yojson x.lambda_function_started_event_attributes));
       (
         "lambdaFunctionScheduledEventAttributes",
         (option_to_yojson lambda_function_scheduled_event_attributes_to_yojson x.lambda_function_scheduled_event_attributes));
       (
         "startChildWorkflowExecutionFailedEventAttributes",
         (option_to_yojson start_child_workflow_execution_failed_event_attributes_to_yojson x.start_child_workflow_execution_failed_event_attributes));
       (
         "cancelTimerFailedEventAttributes",
         (option_to_yojson cancel_timer_failed_event_attributes_to_yojson x.cancel_timer_failed_event_attributes));
       (
         "startTimerFailedEventAttributes",
         (option_to_yojson start_timer_failed_event_attributes_to_yojson x.start_timer_failed_event_attributes));
       (
         "requestCancelActivityTaskFailedEventAttributes",
         (option_to_yojson request_cancel_activity_task_failed_event_attributes_to_yojson x.request_cancel_activity_task_failed_event_attributes));
       (
         "scheduleActivityTaskFailedEventAttributes",
         (option_to_yojson schedule_activity_task_failed_event_attributes_to_yojson x.schedule_activity_task_failed_event_attributes));
       (
         "requestCancelExternalWorkflowExecutionFailedEventAttributes",
         (option_to_yojson request_cancel_external_workflow_execution_failed_event_attributes_to_yojson x.request_cancel_external_workflow_execution_failed_event_attributes));
       (
         "requestCancelExternalWorkflowExecutionInitiatedEventAttributes",
         (option_to_yojson request_cancel_external_workflow_execution_initiated_event_attributes_to_yojson x.request_cancel_external_workflow_execution_initiated_event_attributes));
       (
         "externalWorkflowExecutionCancelRequestedEventAttributes",
         (option_to_yojson external_workflow_execution_cancel_requested_event_attributes_to_yojson x.external_workflow_execution_cancel_requested_event_attributes));
       (
         "signalExternalWorkflowExecutionFailedEventAttributes",
         (option_to_yojson signal_external_workflow_execution_failed_event_attributes_to_yojson x.signal_external_workflow_execution_failed_event_attributes));
       (
         "externalWorkflowExecutionSignaledEventAttributes",
         (option_to_yojson external_workflow_execution_signaled_event_attributes_to_yojson x.external_workflow_execution_signaled_event_attributes));
       (
         "signalExternalWorkflowExecutionInitiatedEventAttributes",
         (option_to_yojson signal_external_workflow_execution_initiated_event_attributes_to_yojson x.signal_external_workflow_execution_initiated_event_attributes));
       (
         "childWorkflowExecutionTerminatedEventAttributes",
         (option_to_yojson child_workflow_execution_terminated_event_attributes_to_yojson x.child_workflow_execution_terminated_event_attributes));
       (
         "childWorkflowExecutionCanceledEventAttributes",
         (option_to_yojson child_workflow_execution_canceled_event_attributes_to_yojson x.child_workflow_execution_canceled_event_attributes));
       (
         "childWorkflowExecutionTimedOutEventAttributes",
         (option_to_yojson child_workflow_execution_timed_out_event_attributes_to_yojson x.child_workflow_execution_timed_out_event_attributes));
       (
         "childWorkflowExecutionFailedEventAttributes",
         (option_to_yojson child_workflow_execution_failed_event_attributes_to_yojson x.child_workflow_execution_failed_event_attributes));
       (
         "childWorkflowExecutionCompletedEventAttributes",
         (option_to_yojson child_workflow_execution_completed_event_attributes_to_yojson x.child_workflow_execution_completed_event_attributes));
       (
         "childWorkflowExecutionStartedEventAttributes",
         (option_to_yojson child_workflow_execution_started_event_attributes_to_yojson x.child_workflow_execution_started_event_attributes));
       (
         "startChildWorkflowExecutionInitiatedEventAttributes",
         (option_to_yojson start_child_workflow_execution_initiated_event_attributes_to_yojson x.start_child_workflow_execution_initiated_event_attributes));
       (
         "timerCanceledEventAttributes",
         (option_to_yojson timer_canceled_event_attributes_to_yojson x.timer_canceled_event_attributes));
       (
         "timerFiredEventAttributes",
         (option_to_yojson timer_fired_event_attributes_to_yojson x.timer_fired_event_attributes));
       (
         "timerStartedEventAttributes",
         (option_to_yojson timer_started_event_attributes_to_yojson x.timer_started_event_attributes));
       (
         "recordMarkerFailedEventAttributes",
         (option_to_yojson record_marker_failed_event_attributes_to_yojson x.record_marker_failed_event_attributes));
       (
         "markerRecordedEventAttributes",
         (option_to_yojson marker_recorded_event_attributes_to_yojson x.marker_recorded_event_attributes));
       (
         "workflowExecutionSignaledEventAttributes",
         (option_to_yojson workflow_execution_signaled_event_attributes_to_yojson x.workflow_execution_signaled_event_attributes));
       (
         "activityTaskCancelRequestedEventAttributes",
         (option_to_yojson activity_task_cancel_requested_event_attributes_to_yojson x.activity_task_cancel_requested_event_attributes));
       (
         "activityTaskCanceledEventAttributes",
         (option_to_yojson activity_task_canceled_event_attributes_to_yojson x.activity_task_canceled_event_attributes));
       (
         "activityTaskTimedOutEventAttributes",
         (option_to_yojson activity_task_timed_out_event_attributes_to_yojson x.activity_task_timed_out_event_attributes));
       (
         "activityTaskFailedEventAttributes",
         (option_to_yojson activity_task_failed_event_attributes_to_yojson x.activity_task_failed_event_attributes));
       (
         "activityTaskCompletedEventAttributes",
         (option_to_yojson activity_task_completed_event_attributes_to_yojson x.activity_task_completed_event_attributes));
       (
         "activityTaskStartedEventAttributes",
         (option_to_yojson activity_task_started_event_attributes_to_yojson x.activity_task_started_event_attributes));
       (
         "activityTaskScheduledEventAttributes",
         (option_to_yojson activity_task_scheduled_event_attributes_to_yojson x.activity_task_scheduled_event_attributes));
       (
         "decisionTaskTimedOutEventAttributes",
         (option_to_yojson decision_task_timed_out_event_attributes_to_yojson x.decision_task_timed_out_event_attributes));
       (
         "decisionTaskCompletedEventAttributes",
         (option_to_yojson decision_task_completed_event_attributes_to_yojson x.decision_task_completed_event_attributes));
       (
         "decisionTaskStartedEventAttributes",
         (option_to_yojson decision_task_started_event_attributes_to_yojson x.decision_task_started_event_attributes));
       (
         "decisionTaskScheduledEventAttributes",
         (option_to_yojson decision_task_scheduled_event_attributes_to_yojson x.decision_task_scheduled_event_attributes));
       (
         "workflowExecutionCancelRequestedEventAttributes",
         (option_to_yojson workflow_execution_cancel_requested_event_attributes_to_yojson x.workflow_execution_cancel_requested_event_attributes));
       (
         "workflowExecutionTerminatedEventAttributes",
         (option_to_yojson workflow_execution_terminated_event_attributes_to_yojson x.workflow_execution_terminated_event_attributes));
       (
         "continueAsNewWorkflowExecutionFailedEventAttributes",
         (option_to_yojson continue_as_new_workflow_execution_failed_event_attributes_to_yojson x.continue_as_new_workflow_execution_failed_event_attributes));
       (
         "workflowExecutionContinuedAsNewEventAttributes",
         (option_to_yojson workflow_execution_continued_as_new_event_attributes_to_yojson x.workflow_execution_continued_as_new_event_attributes));
       (
         "cancelWorkflowExecutionFailedEventAttributes",
         (option_to_yojson cancel_workflow_execution_failed_event_attributes_to_yojson x.cancel_workflow_execution_failed_event_attributes));
       (
         "workflowExecutionCanceledEventAttributes",
         (option_to_yojson workflow_execution_canceled_event_attributes_to_yojson x.workflow_execution_canceled_event_attributes));
       (
         "workflowExecutionTimedOutEventAttributes",
         (option_to_yojson workflow_execution_timed_out_event_attributes_to_yojson x.workflow_execution_timed_out_event_attributes));
       (
         "failWorkflowExecutionFailedEventAttributes",
         (option_to_yojson fail_workflow_execution_failed_event_attributes_to_yojson x.fail_workflow_execution_failed_event_attributes));
       (
         "workflowExecutionFailedEventAttributes",
         (option_to_yojson workflow_execution_failed_event_attributes_to_yojson x.workflow_execution_failed_event_attributes));
       (
         "completeWorkflowExecutionFailedEventAttributes",
         (option_to_yojson complete_workflow_execution_failed_event_attributes_to_yojson x.complete_workflow_execution_failed_event_attributes));
       (
         "workflowExecutionCompletedEventAttributes",
         (option_to_yojson workflow_execution_completed_event_attributes_to_yojson x.workflow_execution_completed_event_attributes));
       (
         "workflowExecutionStartedEventAttributes",
         (option_to_yojson workflow_execution_started_event_attributes_to_yojson x.workflow_execution_started_event_attributes));
       (
         "eventId",
         (Some (event_id_to_yojson x.event_id)));
       (
         "eventType",
         (Some (event_type_to_yojson x.event_type)));
       (
         "eventTimestamp",
         (Some (timestamp__to_yojson x.event_timestamp)));
       
  ])

let history_event_list_to_yojson = 
  fun tree -> list_to_yojson history_event_to_yojson tree

let decision_task_to_yojson = 
  fun (x: decision_task) -> assoc_to_yojson(
    [(
         "previousStartedEventId",
         (option_to_yojson event_id_to_yojson x.previous_started_event_id));
       (
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "events",
         (Some (history_event_list_to_yojson x.events)));
       (
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       (
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let page_size_to_yojson = int_to_yojson

let reverse_order_to_yojson = bool_to_yojson

let poll_for_decision_task_input_to_yojson = 
  fun (x: poll_for_decision_task_input) -> assoc_to_yojson(
    [(
         "startAtPreviousStartedEvent",
         (option_to_yojson start_at_previous_started_event_to_yojson x.start_at_previous_started_event));
       (
         "reverseOrder",
         (option_to_yojson reverse_order_to_yojson x.reverse_order));
       (
         "maximumPageSize",
         (option_to_yojson page_size_to_yojson x.maximum_page_size));
       (
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "identity",
         (option_to_yojson identity_to_yojson x.identity));
       (
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let activity_task_to_yojson = 
  fun (x: activity_task) -> assoc_to_yojson(
    [(
         "input",
         (option_to_yojson data_to_yojson x.input));
       (
         "activityType",
         (Some (activity_type_to_yojson x.activity_type)));
       (
         "workflowExecution",
         (Some (workflow_execution_to_yojson x.workflow_execution)));
       (
         "startedEventId",
         (Some (event_id_to_yojson x.started_event_id)));
       (
         "activityId",
         (Some (activity_id_to_yojson x.activity_id)));
       (
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let poll_for_activity_task_input_to_yojson = 
  fun (x: poll_for_activity_task_input) -> assoc_to_yojson(
    [(
         "identity",
         (option_to_yojson identity_to_yojson x.identity));
       (
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let list_workflow_types_input_to_yojson = 
  fun (x: list_workflow_types_input) -> assoc_to_yojson(
    [(
         "reverseOrder",
         (option_to_yojson reverse_order_to_yojson x.reverse_order));
       (
         "maximumPageSize",
         (option_to_yojson page_size_to_yojson x.maximum_page_size));
       (
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "registrationStatus",
         (Some (registration_status_to_yojson x.registration_status)));
       (
         "name",
         (option_to_yojson name_to_yojson x.name));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let list_tags_for_resource_output_to_yojson = 
  fun (x: list_tags_for_resource_output) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson resource_tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_input_to_yojson = 
  fun (x: list_tags_for_resource_input) -> assoc_to_yojson(
    [(
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let execution_time_filter_to_yojson = 
  fun (x: execution_time_filter) -> assoc_to_yojson(
    [(
         "latestDate",
         (option_to_yojson timestamp__to_yojson x.latest_date));
       (
         "oldestDate",
         (Some (timestamp__to_yojson x.oldest_date)));
       
  ])

let list_open_workflow_executions_input_to_yojson = 
  fun (x: list_open_workflow_executions_input) -> assoc_to_yojson(
    [(
         "executionFilter",
         (option_to_yojson workflow_execution_filter_to_yojson x.execution_filter));
       (
         "reverseOrder",
         (option_to_yojson reverse_order_to_yojson x.reverse_order));
       (
         "maximumPageSize",
         (option_to_yojson page_size_to_yojson x.maximum_page_size));
       (
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "tagFilter",
         (option_to_yojson tag_filter_to_yojson x.tag_filter));
       (
         "typeFilter",
         (option_to_yojson workflow_type_filter_to_yojson x.type_filter));
       (
         "startTimeFilter",
         (Some (execution_time_filter_to_yojson x.start_time_filter)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let domain_info_to_yojson = 
  fun (x: domain_info) -> assoc_to_yojson(
    [(
         "arn",
         (option_to_yojson arn_to_yojson x.arn));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "status",
         (Some (registration_status_to_yojson x.status)));
       (
         "name",
         (Some (domain_name_to_yojson x.name)));
       
  ])

let domain_info_list_to_yojson = 
  fun tree -> list_to_yojson domain_info_to_yojson tree

let domain_infos_to_yojson = 
  fun (x: domain_infos) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "domainInfos",
         (Some (domain_info_list_to_yojson x.domain_infos)));
       
  ])

let list_domains_input_to_yojson = 
  fun (x: list_domains_input) -> assoc_to_yojson(
    [(
         "reverseOrder",
         (option_to_yojson reverse_order_to_yojson x.reverse_order));
       (
         "maximumPageSize",
         (option_to_yojson page_size_to_yojson x.maximum_page_size));
       (
         "registrationStatus",
         (Some (registration_status_to_yojson x.registration_status)));
       (
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       
  ])

let close_status_filter_to_yojson = 
  fun (x: close_status_filter) -> assoc_to_yojson(
    [(
         "status",
         (Some (close_status_to_yojson x.status)));
       
  ])

let list_closed_workflow_executions_input_to_yojson = 
  fun (x: list_closed_workflow_executions_input) -> assoc_to_yojson(
    [(
         "reverseOrder",
         (option_to_yojson reverse_order_to_yojson x.reverse_order));
       (
         "maximumPageSize",
         (option_to_yojson page_size_to_yojson x.maximum_page_size));
       (
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "tagFilter",
         (option_to_yojson tag_filter_to_yojson x.tag_filter));
       (
         "typeFilter",
         (option_to_yojson workflow_type_filter_to_yojson x.type_filter));
       (
         "closeStatusFilter",
         (option_to_yojson close_status_filter_to_yojson x.close_status_filter));
       (
         "executionFilter",
         (option_to_yojson workflow_execution_filter_to_yojson x.execution_filter));
       (
         "closeTimeFilter",
         (option_to_yojson execution_time_filter_to_yojson x.close_time_filter));
       (
         "startTimeFilter",
         (option_to_yojson execution_time_filter_to_yojson x.start_time_filter));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let activity_type_info_to_yojson = 
  fun (x: activity_type_info) -> assoc_to_yojson(
    [(
         "deprecationDate",
         (option_to_yojson timestamp__to_yojson x.deprecation_date));
       (
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       (
         "status",
         (Some (registration_status_to_yojson x.status)));
       (
         "activityType",
         (Some (activity_type_to_yojson x.activity_type)));
       
  ])

let activity_type_info_list_to_yojson = 
  fun tree -> list_to_yojson activity_type_info_to_yojson tree

let activity_type_infos_to_yojson = 
  fun (x: activity_type_infos) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "typeInfos",
         (Some (activity_type_info_list_to_yojson x.type_infos)));
       
  ])

let list_activity_types_input_to_yojson = 
  fun (x: list_activity_types_input) -> assoc_to_yojson(
    [(
         "reverseOrder",
         (option_to_yojson reverse_order_to_yojson x.reverse_order));
       (
         "maximumPageSize",
         (option_to_yojson page_size_to_yojson x.maximum_page_size));
       (
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "registrationStatus",
         (Some (registration_status_to_yojson x.registration_status)));
       (
         "name",
         (option_to_yojson name_to_yojson x.name));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let history_to_yojson = 
  fun (x: history) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "events",
         (Some (history_event_list_to_yojson x.events)));
       
  ])

let get_workflow_execution_history_input_to_yojson = 
  fun (x: get_workflow_execution_history_input) -> assoc_to_yojson(
    [(
         "reverseOrder",
         (option_to_yojson reverse_order_to_yojson x.reverse_order));
       (
         "maximumPageSize",
         (option_to_yojson page_size_to_yojson x.maximum_page_size));
       (
         "nextPageToken",
         (option_to_yojson page_token_to_yojson x.next_page_token));
       (
         "execution",
         (Some (workflow_execution_to_yojson x.execution)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let describe_workflow_type_input_to_yojson = 
  fun (x: describe_workflow_type_input) -> assoc_to_yojson(
    [(
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let describe_workflow_execution_input_to_yojson = 
  fun (x: describe_workflow_execution_input) -> assoc_to_yojson(
    [(
         "execution",
         (Some (workflow_execution_to_yojson x.execution)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let domain_configuration_to_yojson = 
  fun (x: domain_configuration) -> assoc_to_yojson(
    [(
         "workflowExecutionRetentionPeriodInDays",
         (Some (duration_in_days_to_yojson x.workflow_execution_retention_period_in_days)));
       
  ])

let domain_detail_to_yojson = 
  fun (x: domain_detail) -> assoc_to_yojson(
    [(
         "configuration",
         (Some (domain_configuration_to_yojson x.configuration)));
       (
         "domainInfo",
         (Some (domain_info_to_yojson x.domain_info)));
       
  ])

let describe_domain_input_to_yojson = 
  fun (x: describe_domain_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (domain_name_to_yojson x.name)));
       
  ])

let activity_type_configuration_to_yojson = 
  fun (x: activity_type_configuration) -> assoc_to_yojson(
    [(
         "defaultTaskScheduleToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_schedule_to_close_timeout));
       (
         "defaultTaskScheduleToStartTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_schedule_to_start_timeout));
       (
         "defaultTaskPriority",
         (option_to_yojson task_priority_to_yojson x.default_task_priority));
       (
         "defaultTaskList",
         (option_to_yojson task_list_to_yojson x.default_task_list));
       (
         "defaultTaskHeartbeatTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_heartbeat_timeout));
       (
         "defaultTaskStartToCloseTimeout",
         (option_to_yojson duration_in_seconds_optional_to_yojson x.default_task_start_to_close_timeout));
       
  ])

let activity_type_detail_to_yojson = 
  fun (x: activity_type_detail) -> assoc_to_yojson(
    [(
         "configuration",
         (Some (activity_type_configuration_to_yojson x.configuration)));
       (
         "typeInfo",
         (Some (activity_type_info_to_yojson x.type_info)));
       
  ])

let describe_activity_type_input_to_yojson = 
  fun (x: describe_activity_type_input) -> assoc_to_yojson(
    [(
         "activityType",
         (Some (activity_type_to_yojson x.activity_type)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let deprecate_workflow_type_input_to_yojson = 
  fun (x: deprecate_workflow_type_input) -> assoc_to_yojson(
    [(
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let domain_deprecated_fault_to_yojson = 
  fun (x: domain_deprecated_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let deprecate_domain_input_to_yojson = 
  fun (x: deprecate_domain_input) -> assoc_to_yojson(
    [(
         "name",
         (Some (domain_name_to_yojson x.name)));
       
  ])

let deprecate_activity_type_input_to_yojson = 
  fun (x: deprecate_activity_type_input) -> assoc_to_yojson(
    [(
         "activityType",
         (Some (activity_type_to_yojson x.activity_type)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let delete_workflow_type_input_to_yojson = 
  fun (x: delete_workflow_type_input) -> assoc_to_yojson(
    [(
         "workflowType",
         (Some (workflow_type_to_yojson x.workflow_type)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let delete_activity_type_input_to_yojson = 
  fun (x: delete_activity_type_input) -> assoc_to_yojson(
    [(
         "activityType",
         (Some (activity_type_to_yojson x.activity_type)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let pending_task_count_to_yojson = 
  fun (x: pending_task_count) -> assoc_to_yojson(
    [(
         "truncated",
         (option_to_yojson truncated_to_yojson x.truncated));
       (
         "count",
         (Some (count_to_yojson x.count)));
       
  ])

let count_pending_decision_tasks_input_to_yojson = 
  fun (x: count_pending_decision_tasks_input) -> assoc_to_yojson(
    [(
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let count_pending_activity_tasks_input_to_yojson = 
  fun (x: count_pending_activity_tasks_input) -> assoc_to_yojson(
    [(
         "taskList",
         (Some (task_list_to_yojson x.task_list)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let count_open_workflow_executions_input_to_yojson = 
  fun (x: count_open_workflow_executions_input) -> assoc_to_yojson(
    [(
         "executionFilter",
         (option_to_yojson workflow_execution_filter_to_yojson x.execution_filter));
       (
         "tagFilter",
         (option_to_yojson tag_filter_to_yojson x.tag_filter));
       (
         "typeFilter",
         (option_to_yojson workflow_type_filter_to_yojson x.type_filter));
       (
         "startTimeFilter",
         (Some (execution_time_filter_to_yojson x.start_time_filter)));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let count_closed_workflow_executions_input_to_yojson = 
  fun (x: count_closed_workflow_executions_input) -> assoc_to_yojson(
    [(
         "closeStatusFilter",
         (option_to_yojson close_status_filter_to_yojson x.close_status_filter));
       (
         "tagFilter",
         (option_to_yojson tag_filter_to_yojson x.tag_filter));
       (
         "typeFilter",
         (option_to_yojson workflow_type_filter_to_yojson x.type_filter));
       (
         "executionFilter",
         (option_to_yojson workflow_execution_filter_to_yojson x.execution_filter));
       (
         "closeTimeFilter",
         (option_to_yojson execution_time_filter_to_yojson x.close_time_filter));
       (
         "startTimeFilter",
         (option_to_yojson execution_time_filter_to_yojson x.start_time_filter));
       (
         "domain",
         (Some (domain_name_to_yojson x.domain)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

