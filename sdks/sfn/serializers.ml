open Smaws_Lib.Json.SerializeHelpers

open Types

let truncated_to_yojson = bool_to_yojson

let included_details_to_yojson = bool_to_yojson

let version_weight_to_yojson = int_to_yojson

let version_description_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let validation_exception_reason_to_yojson = 
  fun (x: validation_exception_reason) -> match x with 
 
| INVALID_ROUTING_CONFIGURATION -> `String "INVALID_ROUTING_CONFIGURATION"
  | CANNOT_UPDATE_COMPLETED_MAP_RUN -> `String "CANNOT_UPDATE_COMPLETED_MAP_RUN"
  | MISSING_REQUIRED_PARAMETER -> `String "MISSING_REQUIRED_PARAMETER"
  | API_DOES_NOT_SUPPORT_LABELED_ARNS -> `String "API_DOES_NOT_SUPPORT_LABELED_ARNS"
   

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "reason",
         (option_to_yojson validation_exception_reason_to_yojson x.reason));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let validate_state_machine_definition_severity_to_yojson = 
  fun (x: validate_state_machine_definition_severity) -> match x with 
  | ERROR -> `String "ERROR"
     

let validate_state_machine_definition_result_code_to_yojson = 
  fun (x: validate_state_machine_definition_result_code) -> match x with 
  | FAIL -> `String "FAIL"
    | OK -> `String "OK"
     

let validate_state_machine_definition_code_to_yojson = string_to_yojson

let validate_state_machine_definition_message_to_yojson = string_to_yojson

let validate_state_machine_definition_location_to_yojson = 
  string_to_yojson

let validate_state_machine_definition_diagnostic_to_yojson = 
  fun (x: validate_state_machine_definition_diagnostic) -> assoc_to_yojson(
    [(
         "location",
         (option_to_yojson validate_state_machine_definition_location_to_yojson x.location));
       (
         "message",
         (Some (validate_state_machine_definition_message_to_yojson x.message)));
       (
         "code",
         (Some (validate_state_machine_definition_code_to_yojson x.code)));
       (
         "severity",
         (Some (validate_state_machine_definition_severity_to_yojson x.severity)));
       
  ])

let validate_state_machine_definition_diagnostic_list_to_yojson = 
  fun tree -> list_to_yojson validate_state_machine_definition_diagnostic_to_yojson tree

let validate_state_machine_definition_output_to_yojson = 
  fun (x: validate_state_machine_definition_output) -> assoc_to_yojson(
    [(
         "diagnostics",
         (Some (validate_state_machine_definition_diagnostic_list_to_yojson x.diagnostics)));
       (
         "result",
         (Some (validate_state_machine_definition_result_code_to_yojson x.result)));
       
  ])

let definition_to_yojson = string_to_yojson

let state_machine_type_to_yojson = 
  fun (x: state_machine_type) -> match x with 
  | EXPRESS -> `String "EXPRESS"
    | STANDARD -> `String "STANDARD"
     

let validate_state_machine_definition_input_to_yojson = 
  fun (x: validate_state_machine_definition_input) -> assoc_to_yojson(
    [(
         "type",
         (option_to_yojson state_machine_type_to_yojson x.type_));
       (
         "definition",
         (Some (definition_to_yojson x.definition)));
       
  ])

let timestamp__to_yojson = timestamp_to_yojson

let revision_id_to_yojson = string_to_yojson

let arn_to_yojson = string_to_yojson

let update_state_machine_output_to_yojson = 
  fun (x: update_state_machine_output) -> assoc_to_yojson(
    [(
         "stateMachineVersionArn",
         (option_to_yojson arn_to_yojson x.state_machine_version_arn));
       (
         "revisionId",
         (option_to_yojson revision_id_to_yojson x.revision_id));
       (
         "updateDate",
         (Some (timestamp__to_yojson x.update_date)));
       
  ])

let log_level_to_yojson = 
  fun (x: log_level) -> match x with 
 
| OFF -> `String "OFF"
  | FATAL -> `String "FATAL"
  | ERROR -> `String "ERROR"
  | ALL -> `String "ALL"
   

let include_execution_data_to_yojson = bool_to_yojson

let cloud_watch_logs_log_group_to_yojson = 
  fun (x: cloud_watch_logs_log_group) -> assoc_to_yojson(
    [(
         "logGroupArn",
         (option_to_yojson arn_to_yojson x.log_group_arn));
       
  ])

let log_destination_to_yojson = 
  fun (x: log_destination) -> assoc_to_yojson(
    [(
         "cloudWatchLogsLogGroup",
         (option_to_yojson cloud_watch_logs_log_group_to_yojson x.cloud_watch_logs_log_group));
       
  ])

let log_destination_list_to_yojson = 
  fun tree -> list_to_yojson log_destination_to_yojson tree

let logging_configuration_to_yojson = 
  fun (x: logging_configuration) -> assoc_to_yojson(
    [(
         "destinations",
         (option_to_yojson log_destination_list_to_yojson x.destinations));
       (
         "includeExecutionData",
         (option_to_yojson include_execution_data_to_yojson x.include_execution_data));
       (
         "level",
         (option_to_yojson log_level_to_yojson x.level));
       
  ])

let enabled_to_yojson = bool_to_yojson

let tracing_configuration_to_yojson = 
  fun (x: tracing_configuration) -> assoc_to_yojson(
    [(
         "enabled",
         (option_to_yojson enabled_to_yojson x.enabled));
       
  ])

let publish_to_yojson = bool_to_yojson

let update_state_machine_input_to_yojson = 
  fun (x: update_state_machine_input) -> assoc_to_yojson(
    [(
         "versionDescription",
         (option_to_yojson version_description_to_yojson x.version_description));
       (
         "publish",
         (option_to_yojson publish_to_yojson x.publish));
       (
         "tracingConfiguration",
         (option_to_yojson tracing_configuration_to_yojson x.tracing_configuration));
       (
         "loggingConfiguration",
         (option_to_yojson logging_configuration_to_yojson x.logging_configuration));
       (
         "roleArn",
         (option_to_yojson arn_to_yojson x.role_arn));
       (
         "definition",
         (option_to_yojson definition_to_yojson x.definition));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let update_state_machine_alias_output_to_yojson = 
  fun (x: update_state_machine_alias_output) -> assoc_to_yojson(
    [(
         "updateDate",
         (Some (timestamp__to_yojson x.update_date)));
       
  ])

let alias_description_to_yojson = string_to_yojson

let routing_configuration_list_item_to_yojson = 
  fun (x: routing_configuration_list_item) -> assoc_to_yojson(
    [(
         "weight",
         (Some (version_weight_to_yojson x.weight)));
       (
         "stateMachineVersionArn",
         (Some (arn_to_yojson x.state_machine_version_arn)));
       
  ])

let routing_configuration_list_to_yojson = 
  fun tree -> list_to_yojson routing_configuration_list_item_to_yojson tree

let update_state_machine_alias_input_to_yojson = 
  fun (x: update_state_machine_alias_input) -> assoc_to_yojson(
    [(
         "routingConfiguration",
         (option_to_yojson routing_configuration_list_to_yojson x.routing_configuration));
       (
         "description",
         (option_to_yojson alias_description_to_yojson x.description));
       (
         "stateMachineAliasArn",
         (Some (arn_to_yojson x.state_machine_alias_arn)));
       
  ])

let state_machine_deleting_to_yojson = 
  fun (x: state_machine_deleting) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_not_found_to_yojson = 
  fun (x: resource_not_found) -> assoc_to_yojson(
    [(
         "resourceName",
         (option_to_yojson arn_to_yojson x.resource_name));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_arn_to_yojson = 
  fun (x: invalid_arn) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let state_machine_does_not_exist_to_yojson = 
  fun (x: state_machine_does_not_exist) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let service_quota_exceeded_exception_to_yojson = 
  fun (x: service_quota_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let missing_required_parameter_to_yojson = 
  fun (x: missing_required_parameter) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_tracing_configuration_to_yojson = 
  fun (x: invalid_tracing_configuration) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_logging_configuration_to_yojson = 
  fun (x: invalid_logging_configuration) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_definition_to_yojson = 
  fun (x: invalid_definition) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let update_map_run_output_to_yojson = 
  fun (x: update_map_run_output) -> assoc_to_yojson(
    [
  ])

let long_arn_to_yojson = string_to_yojson

let max_concurrency_to_yojson = int_to_yojson

let tolerated_failure_percentage_to_yojson = float_to_yojson

let tolerated_failure_count_to_yojson = long_to_yojson

let update_map_run_input_to_yojson = 
  fun (x: update_map_run_input) -> assoc_to_yojson(
    [(
         "toleratedFailureCount",
         (option_to_yojson tolerated_failure_count_to_yojson x.tolerated_failure_count));
       (
         "toleratedFailurePercentage",
         (option_to_yojson tolerated_failure_percentage_to_yojson x.tolerated_failure_percentage));
       (
         "maxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "mapRunArn",
         (Some (long_arn_to_yojson x.map_run_arn)));
       
  ])

let untag_resource_output_to_yojson = 
  fun (x: untag_resource_output) -> assoc_to_yojson(
    [
  ])

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson = 
  fun (x: untag_resource_input) -> assoc_to_yojson(
    [(
         "tagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let unsigned_long_to_yojson = long_to_yojson

let unsigned_integer_to_yojson = int_to_yojson

let ur_l_to_yojson = string_to_yojson

let trace_header_to_yojson = string_to_yojson

let too_many_tags_to_yojson = 
  fun (x: too_many_tags) -> assoc_to_yojson(
    [(
         "resourceName",
         (option_to_yojson arn_to_yojson x.resource_name));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let timeout_in_seconds_to_yojson = long_to_yojson

let sensitive_data_to_yojson = string_to_yojson

let sensitive_error_to_yojson = string_to_yojson

let sensitive_cause_to_yojson = string_to_yojson

let http_protocol_to_yojson = string_to_yojson

let http_method_to_yojson = string_to_yojson

let http_headers_to_yojson = string_to_yojson

let http_body_to_yojson = string_to_yojson

let inspection_data_request_to_yojson = 
  fun (x: inspection_data_request) -> assoc_to_yojson(
    [(
         "body",
         (option_to_yojson http_body_to_yojson x.body));
       (
         "headers",
         (option_to_yojson http_headers_to_yojson x.headers));
       (
         "url",
         (option_to_yojson ur_l_to_yojson x.url));
       (
         "method",
         (option_to_yojson http_method_to_yojson x.method_));
       (
         "protocol",
         (option_to_yojson http_protocol_to_yojson x.protocol));
       
  ])

let http_status_code_to_yojson = string_to_yojson

let http_status_message_to_yojson = string_to_yojson

let inspection_data_response_to_yojson = 
  fun (x: inspection_data_response) -> assoc_to_yojson(
    [(
         "body",
         (option_to_yojson http_body_to_yojson x.body));
       (
         "headers",
         (option_to_yojson http_headers_to_yojson x.headers));
       (
         "statusMessage",
         (option_to_yojson http_status_message_to_yojson x.status_message));
       (
         "statusCode",
         (option_to_yojson http_status_code_to_yojson x.status_code));
       (
         "protocol",
         (option_to_yojson http_protocol_to_yojson x.protocol));
       
  ])

let inspection_data_to_yojson = 
  fun (x: inspection_data) -> assoc_to_yojson(
    [(
         "response",
         (option_to_yojson inspection_data_response_to_yojson x.response));
       (
         "request",
         (option_to_yojson inspection_data_request_to_yojson x.request));
       (
         "afterResultPath",
         (option_to_yojson sensitive_data_to_yojson x.after_result_path));
       (
         "afterResultSelector",
         (option_to_yojson sensitive_data_to_yojson x.after_result_selector));
       (
         "result",
         (option_to_yojson sensitive_data_to_yojson x.result));
       (
         "afterParameters",
         (option_to_yojson sensitive_data_to_yojson x.after_parameters));
       (
         "afterInputPath",
         (option_to_yojson sensitive_data_to_yojson x.after_input_path));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       
  ])

let state_name_to_yojson = string_to_yojson

let test_execution_status_to_yojson = 
  fun (x: test_execution_status) -> match x with 
 
| CAUGHT_ERROR -> `String "CAUGHT_ERROR"
  | RETRIABLE -> `String "RETRIABLE"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
   

let test_state_output_to_yojson = 
  fun (x: test_state_output) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson test_execution_status_to_yojson x.status));
       (
         "nextState",
         (option_to_yojson state_name_to_yojson x.next_state));
       (
         "inspectionData",
         (option_to_yojson inspection_data_to_yojson x.inspection_data));
       (
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       (
         "output",
         (option_to_yojson sensitive_data_to_yojson x.output));
       
  ])

let inspection_level_to_yojson = 
  fun (x: inspection_level) -> match x with 
 
| TRACE -> `String "TRACE"
  | DEBUG -> `String "DEBUG"
  | INFO -> `String "INFO"
   

let reveal_secrets_to_yojson = bool_to_yojson

let test_state_input_to_yojson = 
  fun (x: test_state_input) -> assoc_to_yojson(
    [(
         "revealSecrets",
         (option_to_yojson reveal_secrets_to_yojson x.reveal_secrets));
       (
         "inspectionLevel",
         (option_to_yojson inspection_level_to_yojson x.inspection_level));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       (
         "roleArn",
         (Some (arn_to_yojson x.role_arn)));
       (
         "definition",
         (Some (definition_to_yojson x.definition)));
       
  ])

let invalid_execution_input_to_yojson = 
  fun (x: invalid_execution_input) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let task_token_to_yojson = string_to_yojson

let name_to_yojson = string_to_yojson

let task_timed_out_event_details_to_yojson = 
  fun (x: task_timed_out_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       (
         "resource",
         (Some (name_to_yojson x.resource)));
       (
         "resourceType",
         (Some (name_to_yojson x.resource_type)));
       
  ])

let task_timed_out_to_yojson = 
  fun (x: task_timed_out) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let history_event_execution_data_details_to_yojson = 
  fun (x: history_event_execution_data_details) -> assoc_to_yojson(
    [(
         "truncated",
         (option_to_yojson truncated_to_yojson x.truncated));
       
  ])

let task_succeeded_event_details_to_yojson = 
  fun (x: task_succeeded_event_details) -> assoc_to_yojson(
    [(
         "outputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.output_details));
       (
         "output",
         (option_to_yojson sensitive_data_to_yojson x.output));
       (
         "resource",
         (Some (name_to_yojson x.resource)));
       (
         "resourceType",
         (Some (name_to_yojson x.resource_type)));
       
  ])

let task_submitted_event_details_to_yojson = 
  fun (x: task_submitted_event_details) -> assoc_to_yojson(
    [(
         "outputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.output_details));
       (
         "output",
         (option_to_yojson sensitive_data_to_yojson x.output));
       (
         "resource",
         (Some (name_to_yojson x.resource)));
       (
         "resourceType",
         (Some (name_to_yojson x.resource_type)));
       
  ])

let task_submit_failed_event_details_to_yojson = 
  fun (x: task_submit_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       (
         "resource",
         (Some (name_to_yojson x.resource)));
       (
         "resourceType",
         (Some (name_to_yojson x.resource_type)));
       
  ])

let task_started_event_details_to_yojson = 
  fun (x: task_started_event_details) -> assoc_to_yojson(
    [(
         "resource",
         (Some (name_to_yojson x.resource)));
       (
         "resourceType",
         (Some (name_to_yojson x.resource_type)));
       
  ])

let task_start_failed_event_details_to_yojson = 
  fun (x: task_start_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       (
         "resource",
         (Some (name_to_yojson x.resource)));
       (
         "resourceType",
         (Some (name_to_yojson x.resource_type)));
       
  ])

let connector_parameters_to_yojson = string_to_yojson

let task_credentials_to_yojson = 
  fun (x: task_credentials) -> assoc_to_yojson(
    [(
         "roleArn",
         (option_to_yojson long_arn_to_yojson x.role_arn));
       
  ])

let task_scheduled_event_details_to_yojson = 
  fun (x: task_scheduled_event_details) -> assoc_to_yojson(
    [(
         "taskCredentials",
         (option_to_yojson task_credentials_to_yojson x.task_credentials));
       (
         "heartbeatInSeconds",
         (option_to_yojson timeout_in_seconds_to_yojson x.heartbeat_in_seconds));
       (
         "timeoutInSeconds",
         (option_to_yojson timeout_in_seconds_to_yojson x.timeout_in_seconds));
       (
         "parameters",
         (Some (connector_parameters_to_yojson x.parameters)));
       (
         "region",
         (Some (name_to_yojson x.region)));
       (
         "resource",
         (Some (name_to_yojson x.resource)));
       (
         "resourceType",
         (Some (name_to_yojson x.resource_type)));
       
  ])

let task_failed_event_details_to_yojson = 
  fun (x: task_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       (
         "resource",
         (Some (name_to_yojson x.resource)));
       (
         "resourceType",
         (Some (name_to_yojson x.resource_type)));
       
  ])

let task_does_not_exist_to_yojson = 
  fun (x: task_does_not_exist) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let tag_value_to_yojson = string_to_yojson

let tag_resource_output_to_yojson = 
  fun (x: tag_resource_output) -> assoc_to_yojson(
    [
  ])

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "value",
         (option_to_yojson tag_value_to_yojson x.value));
       (
         "key",
         (option_to_yojson tag_key_to_yojson x.key));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson = 
  fun (x: tag_resource_input) -> assoc_to_yojson(
    [(
         "tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let sync_execution_status_to_yojson = 
  fun (x: sync_execution_status) -> match x with 
 
| TIMED_OUT -> `String "TIMED_OUT"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
   

let stop_execution_output_to_yojson = 
  fun (x: stop_execution_output) -> assoc_to_yojson(
    [(
         "stopDate",
         (Some (timestamp__to_yojson x.stop_date)));
       
  ])

let stop_execution_input_to_yojson = 
  fun (x: stop_execution_input) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let execution_does_not_exist_to_yojson = 
  fun (x: execution_does_not_exist) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let state_machine_version_list_item_to_yojson = 
  fun (x: state_machine_version_list_item) -> assoc_to_yojson(
    [(
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "stateMachineVersionArn",
         (Some (long_arn_to_yojson x.state_machine_version_arn)));
       
  ])

let state_machine_version_list_to_yojson = 
  fun tree -> list_to_yojson state_machine_version_list_item_to_yojson tree

let state_machine_type_not_supported_to_yojson = 
  fun (x: state_machine_type_not_supported) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let state_machine_status_to_yojson = 
  fun (x: state_machine_status) -> match x with 
  | DELETING -> `String "DELETING"
    | ACTIVE -> `String "ACTIVE"
     

let state_machine_list_item_to_yojson = 
  fun (x: state_machine_list_item) -> assoc_to_yojson(
    [(
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "type",
         (Some (state_machine_type_to_yojson x.type_)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let state_machine_list_to_yojson = 
  fun tree -> list_to_yojson state_machine_list_item_to_yojson tree

let state_machine_limit_exceeded_to_yojson = 
  fun (x: state_machine_limit_exceeded) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let state_machine_already_exists_to_yojson = 
  fun (x: state_machine_already_exists) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let state_machine_alias_list_item_to_yojson = 
  fun (x: state_machine_alias_list_item) -> assoc_to_yojson(
    [(
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "stateMachineAliasArn",
         (Some (long_arn_to_yojson x.state_machine_alias_arn)));
       
  ])

let state_machine_alias_list_to_yojson = 
  fun tree -> list_to_yojson state_machine_alias_list_item_to_yojson tree

let state_exited_event_details_to_yojson = 
  fun (x: state_exited_event_details) -> assoc_to_yojson(
    [(
         "outputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.output_details));
       (
         "output",
         (option_to_yojson sensitive_data_to_yojson x.output));
       (
         "name",
         (Some (name_to_yojson x.name)));
       
  ])

let state_entered_event_details_to_yojson = 
  fun (x: state_entered_event_details) -> assoc_to_yojson(
    [(
         "inputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.input_details));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       (
         "name",
         (Some (name_to_yojson x.name)));
       
  ])

let cloud_watch_events_execution_data_details_to_yojson = 
  fun (x: cloud_watch_events_execution_data_details) -> assoc_to_yojson(
    [(
         "included",
         (option_to_yojson included_details_to_yojson x.included));
       
  ])

let billed_memory_used_to_yojson = long_to_yojson

let billed_duration_to_yojson = long_to_yojson

let billing_details_to_yojson = 
  fun (x: billing_details) -> assoc_to_yojson(
    [(
         "billedDurationInMilliseconds",
         (option_to_yojson billed_duration_to_yojson x.billed_duration_in_milliseconds));
       (
         "billedMemoryUsedInMB",
         (option_to_yojson billed_memory_used_to_yojson x.billed_memory_used_in_m_b));
       
  ])

let start_sync_execution_output_to_yojson = 
  fun (x: start_sync_execution_output) -> assoc_to_yojson(
    [(
         "billingDetails",
         (option_to_yojson billing_details_to_yojson x.billing_details));
       (
         "traceHeader",
         (option_to_yojson trace_header_to_yojson x.trace_header));
       (
         "outputDetails",
         (option_to_yojson cloud_watch_events_execution_data_details_to_yojson x.output_details));
       (
         "output",
         (option_to_yojson sensitive_data_to_yojson x.output));
       (
         "inputDetails",
         (option_to_yojson cloud_watch_events_execution_data_details_to_yojson x.input_details));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       (
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       (
         "status",
         (Some (sync_execution_status_to_yojson x.status)));
       (
         "stopDate",
         (Some (timestamp__to_yojson x.stop_date)));
       (
         "startDate",
         (Some (timestamp__to_yojson x.start_date)));
       (
         "name",
         (option_to_yojson name_to_yojson x.name));
       (
         "stateMachineArn",
         (option_to_yojson arn_to_yojson x.state_machine_arn));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let start_sync_execution_input_to_yojson = 
  fun (x: start_sync_execution_input) -> assoc_to_yojson(
    [(
         "traceHeader",
         (option_to_yojson trace_header_to_yojson x.trace_header));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       (
         "name",
         (option_to_yojson name_to_yojson x.name));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let invalid_name_to_yojson = 
  fun (x: invalid_name) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let start_execution_output_to_yojson = 
  fun (x: start_execution_output) -> assoc_to_yojson(
    [(
         "startDate",
         (Some (timestamp__to_yojson x.start_date)));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let start_execution_input_to_yojson = 
  fun (x: start_execution_input) -> assoc_to_yojson(
    [(
         "traceHeader",
         (option_to_yojson trace_header_to_yojson x.trace_header));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       (
         "name",
         (option_to_yojson name_to_yojson x.name));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let execution_limit_exceeded_to_yojson = 
  fun (x: execution_limit_exceeded) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let execution_already_exists_to_yojson = 
  fun (x: execution_already_exists) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let sensitive_data_job_input_to_yojson = string_to_yojson

let send_task_success_output_to_yojson = 
  fun (x: send_task_success_output) -> assoc_to_yojson(
    [
  ])

let send_task_success_input_to_yojson = 
  fun (x: send_task_success_input) -> assoc_to_yojson(
    [(
         "output",
         (Some (sensitive_data_to_yojson x.output)));
       (
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let invalid_token_to_yojson = 
  fun (x: invalid_token) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_output_to_yojson = 
  fun (x: invalid_output) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let send_task_heartbeat_output_to_yojson = 
  fun (x: send_task_heartbeat_output) -> assoc_to_yojson(
    [
  ])

let send_task_heartbeat_input_to_yojson = 
  fun (x: send_task_heartbeat_input) -> assoc_to_yojson(
    [(
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let send_task_failure_output_to_yojson = 
  fun (x: send_task_failure_output) -> assoc_to_yojson(
    [
  ])

let send_task_failure_input_to_yojson = 
  fun (x: send_task_failure_input) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       (
         "taskToken",
         (Some (task_token_to_yojson x.task_token)));
       
  ])

let reverse_order_to_yojson = bool_to_yojson

let redrive_execution_output_to_yojson = 
  fun (x: redrive_execution_output) -> assoc_to_yojson(
    [(
         "redriveDate",
         (Some (timestamp__to_yojson x.redrive_date)));
       
  ])

let client_token_to_yojson = string_to_yojson

let redrive_execution_input_to_yojson = 
  fun (x: redrive_execution_input) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let execution_not_redrivable_to_yojson = 
  fun (x: execution_not_redrivable) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let redrive_count_to_yojson = int_to_yojson

let publish_state_machine_version_output_to_yojson = 
  fun (x: publish_state_machine_version_output) -> assoc_to_yojson(
    [(
         "stateMachineVersionArn",
         (Some (arn_to_yojson x.state_machine_version_arn)));
       (
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       
  ])

let publish_state_machine_version_input_to_yojson = 
  fun (x: publish_state_machine_version_input) -> assoc_to_yojson(
    [(
         "description",
         (option_to_yojson version_description_to_yojson x.description));
       (
         "revisionId",
         (option_to_yojson revision_id_to_yojson x.revision_id));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let page_token_to_yojson = string_to_yojson

let page_size_to_yojson = int_to_yojson

let map_state_started_event_details_to_yojson = 
  fun (x: map_state_started_event_details) -> assoc_to_yojson(
    [(
         "length",
         (option_to_yojson unsigned_integer_to_yojson x.length));
       
  ])

let map_run_status_to_yojson = 
  fun (x: map_run_status) -> match x with 
 
| ABORTED -> `String "ABORTED"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | RUNNING -> `String "RUNNING"
   

let map_run_started_event_details_to_yojson = 
  fun (x: map_run_started_event_details) -> assoc_to_yojson(
    [(
         "mapRunArn",
         (option_to_yojson long_arn_to_yojson x.map_run_arn));
       
  ])

let map_run_redriven_event_details_to_yojson = 
  fun (x: map_run_redriven_event_details) -> assoc_to_yojson(
    [(
         "redriveCount",
         (option_to_yojson redrive_count_to_yojson x.redrive_count));
       (
         "mapRunArn",
         (option_to_yojson long_arn_to_yojson x.map_run_arn));
       
  ])

let map_run_list_item_to_yojson = 
  fun (x: map_run_list_item) -> assoc_to_yojson(
    [(
         "stopDate",
         (option_to_yojson timestamp__to_yojson x.stop_date));
       (
         "startDate",
         (Some (timestamp__to_yojson x.start_date)));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       (
         "mapRunArn",
         (Some (long_arn_to_yojson x.map_run_arn)));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let map_run_list_to_yojson = 
  fun tree -> list_to_yojson map_run_list_item_to_yojson tree

let map_run_label_to_yojson = string_to_yojson

let long_object_to_yojson = long_to_yojson

let map_run_item_counts_to_yojson = 
  fun (x: map_run_item_counts) -> assoc_to_yojson(
    [(
         "pendingRedrive",
         (option_to_yojson long_object_to_yojson x.pending_redrive));
       (
         "failuresNotRedrivable",
         (option_to_yojson long_object_to_yojson x.failures_not_redrivable));
       (
         "resultsWritten",
         (Some (unsigned_long_to_yojson x.results_written)));
       (
         "total",
         (Some (unsigned_long_to_yojson x.total)));
       (
         "aborted",
         (Some (unsigned_long_to_yojson x.aborted)));
       (
         "timedOut",
         (Some (unsigned_long_to_yojson x.timed_out)));
       (
         "failed",
         (Some (unsigned_long_to_yojson x.failed)));
       (
         "succeeded",
         (Some (unsigned_long_to_yojson x.succeeded)));
       (
         "running",
         (Some (unsigned_long_to_yojson x.running)));
       (
         "pending",
         (Some (unsigned_long_to_yojson x.pending)));
       
  ])

let map_run_failed_event_details_to_yojson = 
  fun (x: map_run_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let map_run_execution_counts_to_yojson = 
  fun (x: map_run_execution_counts) -> assoc_to_yojson(
    [(
         "pendingRedrive",
         (option_to_yojson long_object_to_yojson x.pending_redrive));
       (
         "failuresNotRedrivable",
         (option_to_yojson long_object_to_yojson x.failures_not_redrivable));
       (
         "resultsWritten",
         (Some (unsigned_long_to_yojson x.results_written)));
       (
         "total",
         (Some (unsigned_long_to_yojson x.total)));
       (
         "aborted",
         (Some (unsigned_long_to_yojson x.aborted)));
       (
         "timedOut",
         (Some (unsigned_long_to_yojson x.timed_out)));
       (
         "failed",
         (Some (unsigned_long_to_yojson x.failed)));
       (
         "succeeded",
         (Some (unsigned_long_to_yojson x.succeeded)));
       (
         "running",
         (Some (unsigned_long_to_yojson x.running)));
       (
         "pending",
         (Some (unsigned_long_to_yojson x.pending)));
       
  ])

let map_iteration_event_details_to_yojson = 
  fun (x: map_iteration_event_details) -> assoc_to_yojson(
    [(
         "index",
         (option_to_yojson unsigned_integer_to_yojson x.index));
       (
         "name",
         (option_to_yojson name_to_yojson x.name));
       
  ])

let list_tags_for_resource_output_to_yojson = 
  fun (x: list_tags_for_resource_output) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_input_to_yojson = 
  fun (x: list_tags_for_resource_input) -> assoc_to_yojson(
    [(
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let list_state_machines_output_to_yojson = 
  fun (x: list_state_machines_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "stateMachines",
         (Some (state_machine_list_to_yojson x.state_machines)));
       
  ])

let list_state_machines_input_to_yojson = 
  fun (x: list_state_machines_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "maxResults",
         (option_to_yojson page_size_to_yojson x.max_results));
       
  ])

let list_state_machine_versions_output_to_yojson = 
  fun (x: list_state_machine_versions_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "stateMachineVersions",
         (Some (state_machine_version_list_to_yojson x.state_machine_versions)));
       
  ])

let list_state_machine_versions_input_to_yojson = 
  fun (x: list_state_machine_versions_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson page_size_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let list_state_machine_aliases_output_to_yojson = 
  fun (x: list_state_machine_aliases_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "stateMachineAliases",
         (Some (state_machine_alias_list_to_yojson x.state_machine_aliases)));
       
  ])

let list_state_machine_aliases_input_to_yojson = 
  fun (x: list_state_machine_aliases_input) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson page_size_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let list_map_runs_output_to_yojson = 
  fun (x: list_map_runs_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "mapRuns",
         (Some (map_run_list_to_yojson x.map_runs)));
       
  ])

let list_map_runs_input_to_yojson = 
  fun (x: list_map_runs_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "maxResults",
         (option_to_yojson page_size_to_yojson x.max_results));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let list_executions_page_token_to_yojson = string_to_yojson

let execution_status_to_yojson = 
  fun (x: execution_status) -> match x with 
 
| PENDING_REDRIVE -> `String "PENDING_REDRIVE"
  | ABORTED -> `String "ABORTED"
  | TIMED_OUT -> `String "TIMED_OUT"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | RUNNING -> `String "RUNNING"
   

let execution_list_item_to_yojson = 
  fun (x: execution_list_item) -> assoc_to_yojson(
    [(
         "redriveDate",
         (option_to_yojson timestamp__to_yojson x.redrive_date));
       (
         "redriveCount",
         (option_to_yojson redrive_count_to_yojson x.redrive_count));
       (
         "stateMachineAliasArn",
         (option_to_yojson arn_to_yojson x.state_machine_alias_arn));
       (
         "stateMachineVersionArn",
         (option_to_yojson arn_to_yojson x.state_machine_version_arn));
       (
         "itemCount",
         (option_to_yojson unsigned_integer_to_yojson x.item_count));
       (
         "mapRunArn",
         (option_to_yojson long_arn_to_yojson x.map_run_arn));
       (
         "stopDate",
         (option_to_yojson timestamp__to_yojson x.stop_date));
       (
         "startDate",
         (Some (timestamp__to_yojson x.start_date)));
       (
         "status",
         (Some (execution_status_to_yojson x.status)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let execution_list_to_yojson = 
  fun tree -> list_to_yojson execution_list_item_to_yojson tree

let list_executions_output_to_yojson = 
  fun (x: list_executions_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson list_executions_page_token_to_yojson x.next_token));
       (
         "executions",
         (Some (execution_list_to_yojson x.executions)));
       
  ])

let execution_redrive_filter_to_yojson = 
  fun (x: execution_redrive_filter) -> match x with 
  | NOT_REDRIVEN -> `String "NOT_REDRIVEN"
    | REDRIVEN -> `String "REDRIVEN"
     

let list_executions_input_to_yojson = 
  fun (x: list_executions_input) -> assoc_to_yojson(
    [(
         "redriveFilter",
         (option_to_yojson execution_redrive_filter_to_yojson x.redrive_filter));
       (
         "mapRunArn",
         (option_to_yojson long_arn_to_yojson x.map_run_arn));
       (
         "nextToken",
         (option_to_yojson list_executions_page_token_to_yojson x.next_token));
       (
         "maxResults",
         (option_to_yojson page_size_to_yojson x.max_results));
       (
         "statusFilter",
         (option_to_yojson execution_status_to_yojson x.status_filter));
       (
         "stateMachineArn",
         (option_to_yojson arn_to_yojson x.state_machine_arn));
       
  ])

let activity_list_item_to_yojson = 
  fun (x: activity_list_item) -> assoc_to_yojson(
    [(
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       (
         "activityArn",
         (Some (arn_to_yojson x.activity_arn)));
       
  ])

let activity_list_to_yojson = 
  fun tree -> list_to_yojson activity_list_item_to_yojson tree

let list_activities_output_to_yojson = 
  fun (x: list_activities_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "activities",
         (Some (activity_list_to_yojson x.activities)));
       
  ])

let list_activities_input_to_yojson = 
  fun (x: list_activities_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "maxResults",
         (option_to_yojson page_size_to_yojson x.max_results));
       
  ])

let lambda_function_timed_out_event_details_to_yojson = 
  fun (x: lambda_function_timed_out_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let lambda_function_succeeded_event_details_to_yojson = 
  fun (x: lambda_function_succeeded_event_details) -> assoc_to_yojson(
    [(
         "outputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.output_details));
       (
         "output",
         (option_to_yojson sensitive_data_to_yojson x.output));
       
  ])

let lambda_function_start_failed_event_details_to_yojson = 
  fun (x: lambda_function_start_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let lambda_function_scheduled_event_details_to_yojson = 
  fun (x: lambda_function_scheduled_event_details) -> assoc_to_yojson(
    [(
         "taskCredentials",
         (option_to_yojson task_credentials_to_yojson x.task_credentials));
       (
         "timeoutInSeconds",
         (option_to_yojson timeout_in_seconds_to_yojson x.timeout_in_seconds));
       (
         "inputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.input_details));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       (
         "resource",
         (Some (arn_to_yojson x.resource)));
       
  ])

let lambda_function_schedule_failed_event_details_to_yojson = 
  fun (x: lambda_function_schedule_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let lambda_function_failed_event_details_to_yojson = 
  fun (x: lambda_function_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let include_execution_data_get_execution_history_to_yojson = 
  bool_to_yojson

let identity_to_yojson = string_to_yojson

let history_event_type_to_yojson = 
  fun (x: history_event_type) -> match x with 
 
| MapRunRedriven -> `String "MapRunRedriven"
  | ExecutionRedriven -> `String "ExecutionRedriven"
  | MapRunSucceeded -> `String "MapRunSucceeded"
  | MapRunStarted -> `String "MapRunStarted"
  | MapRunFailed -> `String "MapRunFailed"
  | MapRunAborted -> `String "MapRunAborted"
  | WaitStateExited -> `String "WaitStateExited"
  | WaitStateEntered -> `String "WaitStateEntered"
  | WaitStateAborted -> `String "WaitStateAborted"
  | TaskTimedOut -> `String "TaskTimedOut"
  | TaskSucceeded -> `String "TaskSucceeded"
  | TaskSubmitted -> `String "TaskSubmitted"
  | TaskSubmitFailed -> `String "TaskSubmitFailed"
  | TaskStateExited -> `String "TaskStateExited"
  | TaskStateEntered -> `String "TaskStateEntered"
  | TaskStateAborted -> `String "TaskStateAborted"
  | TaskStartFailed -> `String "TaskStartFailed"
  | TaskStarted -> `String "TaskStarted"
  | TaskScheduled -> `String "TaskScheduled"
  | TaskFailed -> `String "TaskFailed"
  | SucceedStateExited -> `String "SucceedStateExited"
  | SucceedStateEntered -> `String "SucceedStateEntered"
  | PassStateExited -> `String "PassStateExited"
  | PassStateEntered -> `String "PassStateEntered"
  | ParallelStateSucceeded -> `String "ParallelStateSucceeded"
  | ParallelStateStarted -> `String "ParallelStateStarted"
  | ParallelStateFailed -> `String "ParallelStateFailed"
  | ParallelStateExited -> `String "ParallelStateExited"
  | ParallelStateEntered -> `String "ParallelStateEntered"
  | ParallelStateAborted -> `String "ParallelStateAborted"
  | MapStateSucceeded -> `String "MapStateSucceeded"
  | MapStateStarted -> `String "MapStateStarted"
  | MapStateFailed -> `String "MapStateFailed"
  | MapStateExited -> `String "MapStateExited"
  | MapStateEntered -> `String "MapStateEntered"
  | MapStateAborted -> `String "MapStateAborted"
  | MapIterationSucceeded -> `String "MapIterationSucceeded"
  | MapIterationStarted -> `String "MapIterationStarted"
  | MapIterationFailed -> `String "MapIterationFailed"
  | MapIterationAborted -> `String "MapIterationAborted"
  | LambdaFunctionTimedOut -> `String "LambdaFunctionTimedOut"
  | LambdaFunctionSucceeded -> `String "LambdaFunctionSucceeded"
  | LambdaFunctionStartFailed -> `String "LambdaFunctionStartFailed"
  | LambdaFunctionStarted -> `String "LambdaFunctionStarted"
  | LambdaFunctionScheduleFailed -> `String "LambdaFunctionScheduleFailed"
  | LambdaFunctionScheduled -> `String "LambdaFunctionScheduled"
  | LambdaFunctionFailed -> `String "LambdaFunctionFailed"
  | FailStateEntered -> `String "FailStateEntered"
  | ExecutionTimedOut -> `String "ExecutionTimedOut"
  | ExecutionSucceeded -> `String "ExecutionSucceeded"
  | ExecutionStarted -> `String "ExecutionStarted"
  | ExecutionFailed -> `String "ExecutionFailed"
  | ExecutionAborted -> `String "ExecutionAborted"
  | ChoiceStateExited -> `String "ChoiceStateExited"
  | ChoiceStateEntered -> `String "ChoiceStateEntered"
  | ActivityTimedOut -> `String "ActivityTimedOut"
  | ActivitySucceeded -> `String "ActivitySucceeded"
  | ActivityStarted -> `String "ActivityStarted"
  | ActivityScheduleFailed -> `String "ActivityScheduleFailed"
  | ActivityScheduled -> `String "ActivityScheduled"
  | ActivityFailed -> `String "ActivityFailed"
   

let event_id_to_yojson = long_to_yojson

let activity_failed_event_details_to_yojson = 
  fun (x: activity_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let activity_schedule_failed_event_details_to_yojson = 
  fun (x: activity_schedule_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let activity_scheduled_event_details_to_yojson = 
  fun (x: activity_scheduled_event_details) -> assoc_to_yojson(
    [(
         "heartbeatInSeconds",
         (option_to_yojson timeout_in_seconds_to_yojson x.heartbeat_in_seconds));
       (
         "timeoutInSeconds",
         (option_to_yojson timeout_in_seconds_to_yojson x.timeout_in_seconds));
       (
         "inputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.input_details));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       (
         "resource",
         (Some (arn_to_yojson x.resource)));
       
  ])

let activity_started_event_details_to_yojson = 
  fun (x: activity_started_event_details) -> assoc_to_yojson(
    [(
         "workerName",
         (option_to_yojson identity_to_yojson x.worker_name));
       
  ])

let activity_succeeded_event_details_to_yojson = 
  fun (x: activity_succeeded_event_details) -> assoc_to_yojson(
    [(
         "outputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.output_details));
       (
         "output",
         (option_to_yojson sensitive_data_to_yojson x.output));
       
  ])

let activity_timed_out_event_details_to_yojson = 
  fun (x: activity_timed_out_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let execution_failed_event_details_to_yojson = 
  fun (x: execution_failed_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let execution_started_event_details_to_yojson = 
  fun (x: execution_started_event_details) -> assoc_to_yojson(
    [(
         "stateMachineVersionArn",
         (option_to_yojson arn_to_yojson x.state_machine_version_arn));
       (
         "stateMachineAliasArn",
         (option_to_yojson arn_to_yojson x.state_machine_alias_arn));
       (
         "roleArn",
         (option_to_yojson arn_to_yojson x.role_arn));
       (
         "inputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.input_details));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       
  ])

let execution_succeeded_event_details_to_yojson = 
  fun (x: execution_succeeded_event_details) -> assoc_to_yojson(
    [(
         "outputDetails",
         (option_to_yojson history_event_execution_data_details_to_yojson x.output_details));
       (
         "output",
         (option_to_yojson sensitive_data_to_yojson x.output));
       
  ])

let execution_aborted_event_details_to_yojson = 
  fun (x: execution_aborted_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let execution_timed_out_event_details_to_yojson = 
  fun (x: execution_timed_out_event_details) -> assoc_to_yojson(
    [(
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       
  ])

let execution_redriven_event_details_to_yojson = 
  fun (x: execution_redriven_event_details) -> assoc_to_yojson(
    [(
         "redriveCount",
         (option_to_yojson redrive_count_to_yojson x.redrive_count));
       
  ])

let history_event_to_yojson = 
  fun (x: history_event) -> assoc_to_yojson(
    [(
         "mapRunRedrivenEventDetails",
         (option_to_yojson map_run_redriven_event_details_to_yojson x.map_run_redriven_event_details));
       (
         "mapRunFailedEventDetails",
         (option_to_yojson map_run_failed_event_details_to_yojson x.map_run_failed_event_details));
       (
         "mapRunStartedEventDetails",
         (option_to_yojson map_run_started_event_details_to_yojson x.map_run_started_event_details));
       (
         "stateExitedEventDetails",
         (option_to_yojson state_exited_event_details_to_yojson x.state_exited_event_details));
       (
         "stateEnteredEventDetails",
         (option_to_yojson state_entered_event_details_to_yojson x.state_entered_event_details));
       (
         "lambdaFunctionTimedOutEventDetails",
         (option_to_yojson lambda_function_timed_out_event_details_to_yojson x.lambda_function_timed_out_event_details));
       (
         "lambdaFunctionSucceededEventDetails",
         (option_to_yojson lambda_function_succeeded_event_details_to_yojson x.lambda_function_succeeded_event_details));
       (
         "lambdaFunctionStartFailedEventDetails",
         (option_to_yojson lambda_function_start_failed_event_details_to_yojson x.lambda_function_start_failed_event_details));
       (
         "lambdaFunctionScheduledEventDetails",
         (option_to_yojson lambda_function_scheduled_event_details_to_yojson x.lambda_function_scheduled_event_details));
       (
         "lambdaFunctionScheduleFailedEventDetails",
         (option_to_yojson lambda_function_schedule_failed_event_details_to_yojson x.lambda_function_schedule_failed_event_details));
       (
         "lambdaFunctionFailedEventDetails",
         (option_to_yojson lambda_function_failed_event_details_to_yojson x.lambda_function_failed_event_details));
       (
         "mapIterationAbortedEventDetails",
         (option_to_yojson map_iteration_event_details_to_yojson x.map_iteration_aborted_event_details));
       (
         "mapIterationFailedEventDetails",
         (option_to_yojson map_iteration_event_details_to_yojson x.map_iteration_failed_event_details));
       (
         "mapIterationSucceededEventDetails",
         (option_to_yojson map_iteration_event_details_to_yojson x.map_iteration_succeeded_event_details));
       (
         "mapIterationStartedEventDetails",
         (option_to_yojson map_iteration_event_details_to_yojson x.map_iteration_started_event_details));
       (
         "mapStateStartedEventDetails",
         (option_to_yojson map_state_started_event_details_to_yojson x.map_state_started_event_details));
       (
         "executionRedrivenEventDetails",
         (option_to_yojson execution_redriven_event_details_to_yojson x.execution_redriven_event_details));
       (
         "executionTimedOutEventDetails",
         (option_to_yojson execution_timed_out_event_details_to_yojson x.execution_timed_out_event_details));
       (
         "executionAbortedEventDetails",
         (option_to_yojson execution_aborted_event_details_to_yojson x.execution_aborted_event_details));
       (
         "executionSucceededEventDetails",
         (option_to_yojson execution_succeeded_event_details_to_yojson x.execution_succeeded_event_details));
       (
         "executionStartedEventDetails",
         (option_to_yojson execution_started_event_details_to_yojson x.execution_started_event_details));
       (
         "executionFailedEventDetails",
         (option_to_yojson execution_failed_event_details_to_yojson x.execution_failed_event_details));
       (
         "taskTimedOutEventDetails",
         (option_to_yojson task_timed_out_event_details_to_yojson x.task_timed_out_event_details));
       (
         "taskSucceededEventDetails",
         (option_to_yojson task_succeeded_event_details_to_yojson x.task_succeeded_event_details));
       (
         "taskSubmittedEventDetails",
         (option_to_yojson task_submitted_event_details_to_yojson x.task_submitted_event_details));
       (
         "taskSubmitFailedEventDetails",
         (option_to_yojson task_submit_failed_event_details_to_yojson x.task_submit_failed_event_details));
       (
         "taskStartedEventDetails",
         (option_to_yojson task_started_event_details_to_yojson x.task_started_event_details));
       (
         "taskStartFailedEventDetails",
         (option_to_yojson task_start_failed_event_details_to_yojson x.task_start_failed_event_details));
       (
         "taskScheduledEventDetails",
         (option_to_yojson task_scheduled_event_details_to_yojson x.task_scheduled_event_details));
       (
         "taskFailedEventDetails",
         (option_to_yojson task_failed_event_details_to_yojson x.task_failed_event_details));
       (
         "activityTimedOutEventDetails",
         (option_to_yojson activity_timed_out_event_details_to_yojson x.activity_timed_out_event_details));
       (
         "activitySucceededEventDetails",
         (option_to_yojson activity_succeeded_event_details_to_yojson x.activity_succeeded_event_details));
       (
         "activityStartedEventDetails",
         (option_to_yojson activity_started_event_details_to_yojson x.activity_started_event_details));
       (
         "activityScheduledEventDetails",
         (option_to_yojson activity_scheduled_event_details_to_yojson x.activity_scheduled_event_details));
       (
         "activityScheduleFailedEventDetails",
         (option_to_yojson activity_schedule_failed_event_details_to_yojson x.activity_schedule_failed_event_details));
       (
         "activityFailedEventDetails",
         (option_to_yojson activity_failed_event_details_to_yojson x.activity_failed_event_details));
       (
         "previousEventId",
         (option_to_yojson event_id_to_yojson x.previous_event_id));
       (
         "id",
         (Some (event_id_to_yojson x.id)));
       (
         "type",
         (Some (history_event_type_to_yojson x.type_)));
       (
         "timestamp",
         (Some (timestamp__to_yojson x.timestamp_)));
       
  ])

let history_event_list_to_yojson = 
  fun tree -> list_to_yojson history_event_to_yojson tree

let get_execution_history_output_to_yojson = 
  fun (x: get_execution_history_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "events",
         (Some (history_event_list_to_yojson x.events)));
       
  ])

let get_execution_history_input_to_yojson = 
  fun (x: get_execution_history_input) -> assoc_to_yojson(
    [(
         "includeExecutionData",
         (option_to_yojson include_execution_data_get_execution_history_to_yojson x.include_execution_data));
       (
         "nextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "reverseOrder",
         (option_to_yojson reverse_order_to_yojson x.reverse_order));
       (
         "maxResults",
         (option_to_yojson page_size_to_yojson x.max_results));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let get_activity_task_output_to_yojson = 
  fun (x: get_activity_task_output) -> assoc_to_yojson(
    [(
         "input",
         (option_to_yojson sensitive_data_job_input_to_yojson x.input));
       (
         "taskToken",
         (option_to_yojson task_token_to_yojson x.task_token));
       
  ])

let get_activity_task_input_to_yojson = 
  fun (x: get_activity_task_input) -> assoc_to_yojson(
    [(
         "workerName",
         (option_to_yojson name_to_yojson x.worker_name));
       (
         "activityArn",
         (Some (arn_to_yojson x.activity_arn)));
       
  ])

let activity_worker_limit_exceeded_to_yojson = 
  fun (x: activity_worker_limit_exceeded) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let activity_does_not_exist_to_yojson = 
  fun (x: activity_does_not_exist) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let execution_redrive_status_to_yojson = 
  fun (x: execution_redrive_status) -> match x with 
 
| REDRIVABLE_BY_MAP_RUN -> `String "REDRIVABLE_BY_MAP_RUN"
  | NOT_REDRIVABLE -> `String "NOT_REDRIVABLE"
  | REDRIVABLE -> `String "REDRIVABLE"
   

let describe_state_machine_output_to_yojson = 
  fun (x: describe_state_machine_output) -> assoc_to_yojson(
    [(
         "description",
         (option_to_yojson version_description_to_yojson x.description));
       (
         "revisionId",
         (option_to_yojson revision_id_to_yojson x.revision_id));
       (
         "label",
         (option_to_yojson map_run_label_to_yojson x.label));
       (
         "tracingConfiguration",
         (option_to_yojson tracing_configuration_to_yojson x.tracing_configuration));
       (
         "loggingConfiguration",
         (option_to_yojson logging_configuration_to_yojson x.logging_configuration));
       (
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "type",
         (Some (state_machine_type_to_yojson x.type_)));
       (
         "roleArn",
         (Some (arn_to_yojson x.role_arn)));
       (
         "definition",
         (Some (definition_to_yojson x.definition)));
       (
         "status",
         (option_to_yojson state_machine_status_to_yojson x.status));
       (
         "name",
         (Some (name_to_yojson x.name)));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let describe_state_machine_input_to_yojson = 
  fun (x: describe_state_machine_input) -> assoc_to_yojson(
    [(
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let describe_state_machine_for_execution_output_to_yojson = 
  fun (x: describe_state_machine_for_execution_output) -> assoc_to_yojson(
    [(
         "revisionId",
         (option_to_yojson revision_id_to_yojson x.revision_id));
       (
         "label",
         (option_to_yojson map_run_label_to_yojson x.label));
       (
         "mapRunArn",
         (option_to_yojson long_arn_to_yojson x.map_run_arn));
       (
         "tracingConfiguration",
         (option_to_yojson tracing_configuration_to_yojson x.tracing_configuration));
       (
         "loggingConfiguration",
         (option_to_yojson logging_configuration_to_yojson x.logging_configuration));
       (
         "updateDate",
         (Some (timestamp__to_yojson x.update_date)));
       (
         "roleArn",
         (Some (arn_to_yojson x.role_arn)));
       (
         "definition",
         (Some (definition_to_yojson x.definition)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let describe_state_machine_for_execution_input_to_yojson = 
  fun (x: describe_state_machine_for_execution_input) -> assoc_to_yojson(
    [(
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let describe_state_machine_alias_output_to_yojson = 
  fun (x: describe_state_machine_alias_output) -> assoc_to_yojson(
    [(
         "updateDate",
         (option_to_yojson timestamp__to_yojson x.update_date));
       (
         "creationDate",
         (option_to_yojson timestamp__to_yojson x.creation_date));
       (
         "routingConfiguration",
         (option_to_yojson routing_configuration_list_to_yojson x.routing_configuration));
       (
         "description",
         (option_to_yojson alias_description_to_yojson x.description));
       (
         "name",
         (option_to_yojson name_to_yojson x.name));
       (
         "stateMachineAliasArn",
         (option_to_yojson arn_to_yojson x.state_machine_alias_arn));
       
  ])

let describe_state_machine_alias_input_to_yojson = 
  fun (x: describe_state_machine_alias_input) -> assoc_to_yojson(
    [(
         "stateMachineAliasArn",
         (Some (arn_to_yojson x.state_machine_alias_arn)));
       
  ])

let describe_map_run_output_to_yojson = 
  fun (x: describe_map_run_output) -> assoc_to_yojson(
    [(
         "redriveDate",
         (option_to_yojson timestamp__to_yojson x.redrive_date));
       (
         "redriveCount",
         (option_to_yojson redrive_count_to_yojson x.redrive_count));
       (
         "executionCounts",
         (Some (map_run_execution_counts_to_yojson x.execution_counts)));
       (
         "itemCounts",
         (Some (map_run_item_counts_to_yojson x.item_counts)));
       (
         "toleratedFailureCount",
         (Some (tolerated_failure_count_to_yojson x.tolerated_failure_count)));
       (
         "toleratedFailurePercentage",
         (Some (tolerated_failure_percentage_to_yojson x.tolerated_failure_percentage)));
       (
         "maxConcurrency",
         (Some (max_concurrency_to_yojson x.max_concurrency)));
       (
         "stopDate",
         (option_to_yojson timestamp__to_yojson x.stop_date));
       (
         "startDate",
         (Some (timestamp__to_yojson x.start_date)));
       (
         "status",
         (Some (map_run_status_to_yojson x.status)));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       (
         "mapRunArn",
         (Some (long_arn_to_yojson x.map_run_arn)));
       
  ])

let describe_map_run_input_to_yojson = 
  fun (x: describe_map_run_input) -> assoc_to_yojson(
    [(
         "mapRunArn",
         (Some (long_arn_to_yojson x.map_run_arn)));
       
  ])

let describe_execution_output_to_yojson = 
  fun (x: describe_execution_output) -> assoc_to_yojson(
    [(
         "redriveStatusReason",
         (option_to_yojson sensitive_data_to_yojson x.redrive_status_reason));
       (
         "redriveStatus",
         (option_to_yojson execution_redrive_status_to_yojson x.redrive_status));
       (
         "redriveDate",
         (option_to_yojson timestamp__to_yojson x.redrive_date));
       (
         "redriveCount",
         (option_to_yojson redrive_count_to_yojson x.redrive_count));
       (
         "stateMachineAliasArn",
         (option_to_yojson arn_to_yojson x.state_machine_alias_arn));
       (
         "stateMachineVersionArn",
         (option_to_yojson arn_to_yojson x.state_machine_version_arn));
       (
         "cause",
         (option_to_yojson sensitive_cause_to_yojson x.cause));
       (
         "error",
         (option_to_yojson sensitive_error_to_yojson x.error));
       (
         "mapRunArn",
         (option_to_yojson long_arn_to_yojson x.map_run_arn));
       (
         "traceHeader",
         (option_to_yojson trace_header_to_yojson x.trace_header));
       (
         "outputDetails",
         (option_to_yojson cloud_watch_events_execution_data_details_to_yojson x.output_details));
       (
         "output",
         (option_to_yojson sensitive_data_to_yojson x.output));
       (
         "inputDetails",
         (option_to_yojson cloud_watch_events_execution_data_details_to_yojson x.input_details));
       (
         "input",
         (option_to_yojson sensitive_data_to_yojson x.input));
       (
         "stopDate",
         (option_to_yojson timestamp__to_yojson x.stop_date));
       (
         "startDate",
         (Some (timestamp__to_yojson x.start_date)));
       (
         "status",
         (Some (execution_status_to_yojson x.status)));
       (
         "name",
         (option_to_yojson name_to_yojson x.name));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       (
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let describe_execution_input_to_yojson = 
  fun (x: describe_execution_input) -> assoc_to_yojson(
    [(
         "executionArn",
         (Some (arn_to_yojson x.execution_arn)));
       
  ])

let describe_activity_output_to_yojson = 
  fun (x: describe_activity_output) -> assoc_to_yojson(
    [(
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       (
         "activityArn",
         (Some (arn_to_yojson x.activity_arn)));
       
  ])

let describe_activity_input_to_yojson = 
  fun (x: describe_activity_input) -> assoc_to_yojson(
    [(
         "activityArn",
         (Some (arn_to_yojson x.activity_arn)));
       
  ])

let delete_state_machine_version_output_to_yojson = 
  fun (x: delete_state_machine_version_output) -> assoc_to_yojson(
    [
  ])

let delete_state_machine_version_input_to_yojson = 
  fun (x: delete_state_machine_version_input) -> assoc_to_yojson(
    [(
         "stateMachineVersionArn",
         (Some (long_arn_to_yojson x.state_machine_version_arn)));
       
  ])

let delete_state_machine_output_to_yojson = 
  fun (x: delete_state_machine_output) -> assoc_to_yojson(
    [
  ])

let delete_state_machine_input_to_yojson = 
  fun (x: delete_state_machine_input) -> assoc_to_yojson(
    [(
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let delete_state_machine_alias_output_to_yojson = 
  fun (x: delete_state_machine_alias_output) -> assoc_to_yojson(
    [
  ])

let delete_state_machine_alias_input_to_yojson = 
  fun (x: delete_state_machine_alias_input) -> assoc_to_yojson(
    [(
         "stateMachineAliasArn",
         (Some (arn_to_yojson x.state_machine_alias_arn)));
       
  ])

let delete_activity_output_to_yojson = 
  fun (x: delete_activity_output) -> assoc_to_yojson(
    [
  ])

let delete_activity_input_to_yojson = 
  fun (x: delete_activity_input) -> assoc_to_yojson(
    [(
         "activityArn",
         (Some (arn_to_yojson x.activity_arn)));
       
  ])

let create_state_machine_output_to_yojson = 
  fun (x: create_state_machine_output) -> assoc_to_yojson(
    [(
         "stateMachineVersionArn",
         (option_to_yojson arn_to_yojson x.state_machine_version_arn));
       (
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "stateMachineArn",
         (Some (arn_to_yojson x.state_machine_arn)));
       
  ])

let create_state_machine_input_to_yojson = 
  fun (x: create_state_machine_input) -> assoc_to_yojson(
    [(
         "versionDescription",
         (option_to_yojson version_description_to_yojson x.version_description));
       (
         "publish",
         (option_to_yojson publish_to_yojson x.publish));
       (
         "tracingConfiguration",
         (option_to_yojson tracing_configuration_to_yojson x.tracing_configuration));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "loggingConfiguration",
         (option_to_yojson logging_configuration_to_yojson x.logging_configuration));
       (
         "type",
         (option_to_yojson state_machine_type_to_yojson x.type_));
       (
         "roleArn",
         (Some (arn_to_yojson x.role_arn)));
       (
         "definition",
         (Some (definition_to_yojson x.definition)));
       (
         "name",
         (Some (name_to_yojson x.name)));
       
  ])

let create_state_machine_alias_output_to_yojson = 
  fun (x: create_state_machine_alias_output) -> assoc_to_yojson(
    [(
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "stateMachineAliasArn",
         (Some (arn_to_yojson x.state_machine_alias_arn)));
       
  ])

let character_restricted_name_to_yojson = string_to_yojson

let create_state_machine_alias_input_to_yojson = 
  fun (x: create_state_machine_alias_input) -> assoc_to_yojson(
    [(
         "routingConfiguration",
         (Some (routing_configuration_list_to_yojson x.routing_configuration)));
       (
         "name",
         (Some (character_restricted_name_to_yojson x.name)));
       (
         "description",
         (option_to_yojson alias_description_to_yojson x.description));
       
  ])

let create_activity_output_to_yojson = 
  fun (x: create_activity_output) -> assoc_to_yojson(
    [(
         "creationDate",
         (Some (timestamp__to_yojson x.creation_date)));
       (
         "activityArn",
         (Some (arn_to_yojson x.activity_arn)));
       
  ])

let create_activity_input_to_yojson = 
  fun (x: create_activity_input) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "name",
         (Some (name_to_yojson x.name)));
       
  ])

let activity_limit_exceeded_to_yojson = 
  fun (x: activity_limit_exceeded) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

