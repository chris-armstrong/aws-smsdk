open Smaws_Lib.Json.DeserializeHelpers

open Types

let truncated_of_yojson = bool_of_yojson

let included_details_of_yojson = bool_of_yojson

let version_weight_of_yojson = int_of_yojson

let version_description_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let validation_exception_reason_of_yojson = 
  fun (tree: t) path : validation_exception_reason -> match tree with 
    | `String "INVALID_ROUTING_CONFIGURATION" -> INVALID_ROUTING_CONFIGURATION
    | `String "CANNOT_UPDATE_COMPLETED_MAP_RUN" -> CANNOT_UPDATE_COMPLETED_MAP_RUN
    | `String "MISSING_REQUIRED_PARAMETER" -> MISSING_REQUIRED_PARAMETER
    | `String "API_DOES_NOT_SUPPORT_LABELED_ARNS" -> API_DOES_NOT_SUPPORT_LABELED_ARNS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson = 
  fun tree path : validation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : validation_exception = {
    reason = option_of_yojson (value_for_key (validation_exception_reason_of_yojson) "reason") _list path;
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let validate_state_machine_definition_severity_of_yojson = 
  fun (tree: t) path : validate_state_machine_definition_severity -> match tree with 
    | `String "ERROR" -> ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValidateStateMachineDefinitionSeverity" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidateStateMachineDefinitionSeverity")

let validate_state_machine_definition_result_code_of_yojson = 
  fun (tree: t) path : validate_state_machine_definition_result_code -> match tree with 
    | `String "FAIL" -> FAIL
    | `String "OK" -> OK
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValidateStateMachineDefinitionResultCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidateStateMachineDefinitionResultCode")

let validate_state_machine_definition_code_of_yojson = string_of_yojson

let validate_state_machine_definition_message_of_yojson = string_of_yojson

let validate_state_machine_definition_location_of_yojson = 
  string_of_yojson

let validate_state_machine_definition_diagnostic_of_yojson = 
  fun tree path : validate_state_machine_definition_diagnostic ->
  let _list = assoc_of_yojson tree path in
  let _res : validate_state_machine_definition_diagnostic = {
    location = option_of_yojson (value_for_key (validate_state_machine_definition_location_of_yojson) "location") _list path;
    message = value_for_key (validate_state_machine_definition_message_of_yojson) "message" _list path;
    code = value_for_key (validate_state_machine_definition_code_of_yojson) "code" _list path;
    severity = value_for_key (validate_state_machine_definition_severity_of_yojson) "severity" _list path;
    
  }
  in _res

let validate_state_machine_definition_diagnostic_list_of_yojson = 
  fun tree path -> list_of_yojson validate_state_machine_definition_diagnostic_of_yojson tree path 

let validate_state_machine_definition_output_of_yojson = 
  fun tree path : validate_state_machine_definition_output ->
  let _list = assoc_of_yojson tree path in
  let _res : validate_state_machine_definition_output = {
    diagnostics = value_for_key (validate_state_machine_definition_diagnostic_list_of_yojson) "diagnostics" _list path;
    result = value_for_key (validate_state_machine_definition_result_code_of_yojson) "result" _list path;
    
  }
  in _res

let definition_of_yojson = string_of_yojson

let state_machine_type_of_yojson = 
  fun (tree: t) path : state_machine_type -> match tree with 
    | `String "EXPRESS" -> EXPRESS
    | `String "STANDARD" -> STANDARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "StateMachineType" value)
    | _ -> raise (deserialize_wrong_type_error path "StateMachineType")

let validate_state_machine_definition_input_of_yojson = 
  fun tree path : validate_state_machine_definition_input ->
  let _list = assoc_of_yojson tree path in
  let _res : validate_state_machine_definition_input = {
    type_ = option_of_yojson (value_for_key (state_machine_type_of_yojson) "type") _list path;
    definition = value_for_key (definition_of_yojson) "definition" _list path;
    
  }
  in _res

let timestamp__of_yojson = timestamp_of_yojson

let revision_id_of_yojson = string_of_yojson

let arn_of_yojson = string_of_yojson

let update_state_machine_output_of_yojson = 
  fun tree path : update_state_machine_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_state_machine_output = {
    state_machine_version_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineVersionArn") _list path;
    revision_id = option_of_yojson (value_for_key (revision_id_of_yojson) "revisionId") _list path;
    update_date = value_for_key (timestamp__of_yojson) "updateDate" _list path;
    
  }
  in _res

let log_level_of_yojson = 
  fun (tree: t) path : log_level -> match tree with 
    | `String "OFF" -> OFF
    | `String "FATAL" -> FATAL
    | `String "ERROR" -> ERROR
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "LogLevel")

let include_execution_data_of_yojson = bool_of_yojson

let cloud_watch_logs_log_group_of_yojson = 
  fun tree path : cloud_watch_logs_log_group ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_watch_logs_log_group = {
    log_group_arn = option_of_yojson (value_for_key (arn_of_yojson) "logGroupArn") _list path;
    
  }
  in _res

let log_destination_of_yojson = 
  fun tree path : log_destination ->
  let _list = assoc_of_yojson tree path in
  let _res : log_destination = {
    cloud_watch_logs_log_group = option_of_yojson (value_for_key (cloud_watch_logs_log_group_of_yojson) "cloudWatchLogsLogGroup") _list path;
    
  }
  in _res

let log_destination_list_of_yojson = 
  fun tree path -> list_of_yojson log_destination_of_yojson tree path 

let logging_configuration_of_yojson = 
  fun tree path : logging_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : logging_configuration = {
    destinations = option_of_yojson (value_for_key (log_destination_list_of_yojson) "destinations") _list path;
    include_execution_data = option_of_yojson (value_for_key (include_execution_data_of_yojson) "includeExecutionData") _list path;
    level = option_of_yojson (value_for_key (log_level_of_yojson) "level") _list path;
    
  }
  in _res

let enabled_of_yojson = bool_of_yojson

let tracing_configuration_of_yojson = 
  fun tree path : tracing_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : tracing_configuration = {
    enabled = option_of_yojson (value_for_key (enabled_of_yojson) "enabled") _list path;
    
  }
  in _res

let publish_of_yojson = bool_of_yojson

let update_state_machine_input_of_yojson = 
  fun tree path : update_state_machine_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_state_machine_input = {
    version_description = option_of_yojson (value_for_key (version_description_of_yojson) "versionDescription") _list path;
    publish = option_of_yojson (value_for_key (publish_of_yojson) "publish") _list path;
    tracing_configuration = option_of_yojson (value_for_key (tracing_configuration_of_yojson) "tracingConfiguration") _list path;
    logging_configuration = option_of_yojson (value_for_key (logging_configuration_of_yojson) "loggingConfiguration") _list path;
    role_arn = option_of_yojson (value_for_key (arn_of_yojson) "roleArn") _list path;
    definition = option_of_yojson (value_for_key (definition_of_yojson) "definition") _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let update_state_machine_alias_output_of_yojson = 
  fun tree path : update_state_machine_alias_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_state_machine_alias_output = {
    update_date = value_for_key (timestamp__of_yojson) "updateDate" _list path;
    
  }
  in _res

let alias_description_of_yojson = string_of_yojson

let routing_configuration_list_item_of_yojson = 
  fun tree path : routing_configuration_list_item ->
  let _list = assoc_of_yojson tree path in
  let _res : routing_configuration_list_item = {
    weight = value_for_key (version_weight_of_yojson) "weight" _list path;
    state_machine_version_arn = value_for_key (arn_of_yojson) "stateMachineVersionArn" _list path;
    
  }
  in _res

let routing_configuration_list_of_yojson = 
  fun tree path -> list_of_yojson routing_configuration_list_item_of_yojson tree path 

let update_state_machine_alias_input_of_yojson = 
  fun tree path : update_state_machine_alias_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_state_machine_alias_input = {
    routing_configuration = option_of_yojson (value_for_key (routing_configuration_list_of_yojson) "routingConfiguration") _list path;
    description = option_of_yojson (value_for_key (alias_description_of_yojson) "description") _list path;
    state_machine_alias_arn = value_for_key (arn_of_yojson) "stateMachineAliasArn" _list path;
    
  }
  in _res

let state_machine_deleting_of_yojson = 
  fun tree path : state_machine_deleting ->
  let _list = assoc_of_yojson tree path in
  let _res : state_machine_deleting = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let resource_not_found_of_yojson = 
  fun tree path : resource_not_found ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found = {
    resource_name = option_of_yojson (value_for_key (arn_of_yojson) "resourceName") _list path;
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_arn_of_yojson = 
  fun tree path : invalid_arn ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_arn = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let conflict_exception_of_yojson = 
  fun tree path : conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let state_machine_does_not_exist_of_yojson = 
  fun tree path : state_machine_does_not_exist ->
  let _list = assoc_of_yojson tree path in
  let _res : state_machine_does_not_exist = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let service_quota_exceeded_exception_of_yojson = 
  fun tree path : service_quota_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : service_quota_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let missing_required_parameter_of_yojson = 
  fun tree path : missing_required_parameter ->
  let _list = assoc_of_yojson tree path in
  let _res : missing_required_parameter = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_tracing_configuration_of_yojson = 
  fun tree path : invalid_tracing_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_tracing_configuration = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_logging_configuration_of_yojson = 
  fun tree path : invalid_logging_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_logging_configuration = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_definition_of_yojson = 
  fun tree path : invalid_definition ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_definition = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let update_map_run_output_of_yojson = 
  fun tree path : update_map_run_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_map_run_output = ()
  in _res

let long_arn_of_yojson = string_of_yojson

let max_concurrency_of_yojson = int_of_yojson

let tolerated_failure_percentage_of_yojson = float_of_yojson

let tolerated_failure_count_of_yojson = long_of_yojson

let update_map_run_input_of_yojson = 
  fun tree path : update_map_run_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_map_run_input = {
    tolerated_failure_count = option_of_yojson (value_for_key (tolerated_failure_count_of_yojson) "toleratedFailureCount") _list path;
    tolerated_failure_percentage = option_of_yojson (value_for_key (tolerated_failure_percentage_of_yojson) "toleratedFailurePercentage") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "maxConcurrency") _list path;
    map_run_arn = value_for_key (long_arn_of_yojson) "mapRunArn" _list path;
    
  }
  in _res

let untag_resource_output_of_yojson = 
  fun tree path : untag_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_output = ()
  in _res

let tag_key_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_input_of_yojson = 
  fun tree path : untag_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_input = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "tagKeys" _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let unsigned_long_of_yojson = long_of_yojson

let unsigned_integer_of_yojson = int_of_yojson

let ur_l_of_yojson = string_of_yojson

let trace_header_of_yojson = string_of_yojson

let too_many_tags_of_yojson = 
  fun tree path : too_many_tags ->
  let _list = assoc_of_yojson tree path in
  let _res : too_many_tags = {
    resource_name = option_of_yojson (value_for_key (arn_of_yojson) "resourceName") _list path;
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let timeout_in_seconds_of_yojson = long_of_yojson

let sensitive_data_of_yojson = string_of_yojson

let sensitive_error_of_yojson = string_of_yojson

let sensitive_cause_of_yojson = string_of_yojson

let http_protocol_of_yojson = string_of_yojson

let http_method_of_yojson = string_of_yojson

let http_headers_of_yojson = string_of_yojson

let http_body_of_yojson = string_of_yojson

let inspection_data_request_of_yojson = 
  fun tree path : inspection_data_request ->
  let _list = assoc_of_yojson tree path in
  let _res : inspection_data_request = {
    body = option_of_yojson (value_for_key (http_body_of_yojson) "body") _list path;
    headers = option_of_yojson (value_for_key (http_headers_of_yojson) "headers") _list path;
    url = option_of_yojson (value_for_key (ur_l_of_yojson) "url") _list path;
    method_ = option_of_yojson (value_for_key (http_method_of_yojson) "method") _list path;
    protocol = option_of_yojson (value_for_key (http_protocol_of_yojson) "protocol") _list path;
    
  }
  in _res

let http_status_code_of_yojson = string_of_yojson

let http_status_message_of_yojson = string_of_yojson

let inspection_data_response_of_yojson = 
  fun tree path : inspection_data_response ->
  let _list = assoc_of_yojson tree path in
  let _res : inspection_data_response = {
    body = option_of_yojson (value_for_key (http_body_of_yojson) "body") _list path;
    headers = option_of_yojson (value_for_key (http_headers_of_yojson) "headers") _list path;
    status_message = option_of_yojson (value_for_key (http_status_message_of_yojson) "statusMessage") _list path;
    status_code = option_of_yojson (value_for_key (http_status_code_of_yojson) "statusCode") _list path;
    protocol = option_of_yojson (value_for_key (http_protocol_of_yojson) "protocol") _list path;
    
  }
  in _res

let inspection_data_of_yojson = 
  fun tree path : inspection_data ->
  let _list = assoc_of_yojson tree path in
  let _res : inspection_data = {
    response = option_of_yojson (value_for_key (inspection_data_response_of_yojson) "response") _list path;
    request = option_of_yojson (value_for_key (inspection_data_request_of_yojson) "request") _list path;
    after_result_path = option_of_yojson (value_for_key (sensitive_data_of_yojson) "afterResultPath") _list path;
    after_result_selector = option_of_yojson (value_for_key (sensitive_data_of_yojson) "afterResultSelector") _list path;
    result = option_of_yojson (value_for_key (sensitive_data_of_yojson) "result") _list path;
    after_parameters = option_of_yojson (value_for_key (sensitive_data_of_yojson) "afterParameters") _list path;
    after_input_path = option_of_yojson (value_for_key (sensitive_data_of_yojson) "afterInputPath") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    
  }
  in _res

let state_name_of_yojson = string_of_yojson

let test_execution_status_of_yojson = 
  fun (tree: t) path : test_execution_status -> match tree with 
    | `String "CAUGHT_ERROR" -> CAUGHT_ERROR
    | `String "RETRIABLE" -> RETRIABLE
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TestExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TestExecutionStatus")

let test_state_output_of_yojson = 
  fun tree path : test_state_output ->
  let _list = assoc_of_yojson tree path in
  let _res : test_state_output = {
    status = option_of_yojson (value_for_key (test_execution_status_of_yojson) "status") _list path;
    next_state = option_of_yojson (value_for_key (state_name_of_yojson) "nextState") _list path;
    inspection_data = option_of_yojson (value_for_key (inspection_data_of_yojson) "inspectionData") _list path;
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    output = option_of_yojson (value_for_key (sensitive_data_of_yojson) "output") _list path;
    
  }
  in _res

let inspection_level_of_yojson = 
  fun (tree: t) path : inspection_level -> match tree with 
    | `String "TRACE" -> TRACE
    | `String "DEBUG" -> DEBUG
    | `String "INFO" -> INFO
    | `String value -> raise (deserialize_unknown_enum_value_error path "InspectionLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "InspectionLevel")

let reveal_secrets_of_yojson = bool_of_yojson

let test_state_input_of_yojson = 
  fun tree path : test_state_input ->
  let _list = assoc_of_yojson tree path in
  let _res : test_state_input = {
    reveal_secrets = option_of_yojson (value_for_key (reveal_secrets_of_yojson) "revealSecrets") _list path;
    inspection_level = option_of_yojson (value_for_key (inspection_level_of_yojson) "inspectionLevel") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    role_arn = value_for_key (arn_of_yojson) "roleArn" _list path;
    definition = value_for_key (definition_of_yojson) "definition" _list path;
    
  }
  in _res

let invalid_execution_input_of_yojson = 
  fun tree path : invalid_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_execution_input = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let task_token_of_yojson = string_of_yojson

let name_of_yojson = string_of_yojson

let task_timed_out_event_details_of_yojson = 
  fun tree path : task_timed_out_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : task_timed_out_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    resource = value_for_key (name_of_yojson) "resource" _list path;
    resource_type = value_for_key (name_of_yojson) "resourceType" _list path;
    
  }
  in _res

let task_timed_out_of_yojson = 
  fun tree path : task_timed_out ->
  let _list = assoc_of_yojson tree path in
  let _res : task_timed_out = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let history_event_execution_data_details_of_yojson = 
  fun tree path : history_event_execution_data_details ->
  let _list = assoc_of_yojson tree path in
  let _res : history_event_execution_data_details = {
    truncated = option_of_yojson (value_for_key (truncated_of_yojson) "truncated") _list path;
    
  }
  in _res

let task_succeeded_event_details_of_yojson = 
  fun tree path : task_succeeded_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : task_succeeded_event_details = {
    output_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "outputDetails") _list path;
    output = option_of_yojson (value_for_key (sensitive_data_of_yojson) "output") _list path;
    resource = value_for_key (name_of_yojson) "resource" _list path;
    resource_type = value_for_key (name_of_yojson) "resourceType" _list path;
    
  }
  in _res

let task_submitted_event_details_of_yojson = 
  fun tree path : task_submitted_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : task_submitted_event_details = {
    output_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "outputDetails") _list path;
    output = option_of_yojson (value_for_key (sensitive_data_of_yojson) "output") _list path;
    resource = value_for_key (name_of_yojson) "resource" _list path;
    resource_type = value_for_key (name_of_yojson) "resourceType" _list path;
    
  }
  in _res

let task_submit_failed_event_details_of_yojson = 
  fun tree path : task_submit_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : task_submit_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    resource = value_for_key (name_of_yojson) "resource" _list path;
    resource_type = value_for_key (name_of_yojson) "resourceType" _list path;
    
  }
  in _res

let task_started_event_details_of_yojson = 
  fun tree path : task_started_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : task_started_event_details = {
    resource = value_for_key (name_of_yojson) "resource" _list path;
    resource_type = value_for_key (name_of_yojson) "resourceType" _list path;
    
  }
  in _res

let task_start_failed_event_details_of_yojson = 
  fun tree path : task_start_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : task_start_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    resource = value_for_key (name_of_yojson) "resource" _list path;
    resource_type = value_for_key (name_of_yojson) "resourceType" _list path;
    
  }
  in _res

let connector_parameters_of_yojson = string_of_yojson

let task_credentials_of_yojson = 
  fun tree path : task_credentials ->
  let _list = assoc_of_yojson tree path in
  let _res : task_credentials = {
    role_arn = option_of_yojson (value_for_key (long_arn_of_yojson) "roleArn") _list path;
    
  }
  in _res

let task_scheduled_event_details_of_yojson = 
  fun tree path : task_scheduled_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : task_scheduled_event_details = {
    task_credentials = option_of_yojson (value_for_key (task_credentials_of_yojson) "taskCredentials") _list path;
    heartbeat_in_seconds = option_of_yojson (value_for_key (timeout_in_seconds_of_yojson) "heartbeatInSeconds") _list path;
    timeout_in_seconds = option_of_yojson (value_for_key (timeout_in_seconds_of_yojson) "timeoutInSeconds") _list path;
    parameters = value_for_key (connector_parameters_of_yojson) "parameters" _list path;
    region = value_for_key (name_of_yojson) "region" _list path;
    resource = value_for_key (name_of_yojson) "resource" _list path;
    resource_type = value_for_key (name_of_yojson) "resourceType" _list path;
    
  }
  in _res

let task_failed_event_details_of_yojson = 
  fun tree path : task_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : task_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    resource = value_for_key (name_of_yojson) "resource" _list path;
    resource_type = value_for_key (name_of_yojson) "resourceType" _list path;
    
  }
  in _res

let task_does_not_exist_of_yojson = 
  fun tree path : task_does_not_exist ->
  let _list = assoc_of_yojson tree path in
  let _res : task_does_not_exist = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let tag_value_of_yojson = string_of_yojson

let tag_resource_output_of_yojson = 
  fun tree path : tag_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_output = ()
  in _res

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = option_of_yojson (value_for_key (tag_value_of_yojson) "value") _list path;
    key = option_of_yojson (value_for_key (tag_key_of_yojson) "key") _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_resource_input_of_yojson = 
  fun tree path : tag_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_input = {
    tags = value_for_key (tag_list_of_yojson) "tags" _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let sync_execution_status_of_yojson = 
  fun (tree: t) path : sync_execution_status -> match tree with 
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SyncExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SyncExecutionStatus")

let stop_execution_output_of_yojson = 
  fun tree path : stop_execution_output ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_execution_output = {
    stop_date = value_for_key (timestamp__of_yojson) "stopDate" _list path;
    
  }
  in _res

let stop_execution_input_of_yojson = 
  fun tree path : stop_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_execution_input = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let execution_does_not_exist_of_yojson = 
  fun tree path : execution_does_not_exist ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_does_not_exist = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let state_machine_version_list_item_of_yojson = 
  fun tree path : state_machine_version_list_item ->
  let _list = assoc_of_yojson tree path in
  let _res : state_machine_version_list_item = {
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    state_machine_version_arn = value_for_key (long_arn_of_yojson) "stateMachineVersionArn" _list path;
    
  }
  in _res

let state_machine_version_list_of_yojson = 
  fun tree path -> list_of_yojson state_machine_version_list_item_of_yojson tree path 

let state_machine_type_not_supported_of_yojson = 
  fun tree path : state_machine_type_not_supported ->
  let _list = assoc_of_yojson tree path in
  let _res : state_machine_type_not_supported = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let state_machine_status_of_yojson = 
  fun (tree: t) path : state_machine_status -> match tree with 
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "StateMachineStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StateMachineStatus")

let state_machine_list_item_of_yojson = 
  fun tree path : state_machine_list_item ->
  let _list = assoc_of_yojson tree path in
  let _res : state_machine_list_item = {
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    type_ = value_for_key (state_machine_type_of_yojson) "type" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let state_machine_list_of_yojson = 
  fun tree path -> list_of_yojson state_machine_list_item_of_yojson tree path 

let state_machine_limit_exceeded_of_yojson = 
  fun tree path : state_machine_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : state_machine_limit_exceeded = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let state_machine_already_exists_of_yojson = 
  fun tree path : state_machine_already_exists ->
  let _list = assoc_of_yojson tree path in
  let _res : state_machine_already_exists = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let state_machine_alias_list_item_of_yojson = 
  fun tree path : state_machine_alias_list_item ->
  let _list = assoc_of_yojson tree path in
  let _res : state_machine_alias_list_item = {
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    state_machine_alias_arn = value_for_key (long_arn_of_yojson) "stateMachineAliasArn" _list path;
    
  }
  in _res

let state_machine_alias_list_of_yojson = 
  fun tree path -> list_of_yojson state_machine_alias_list_item_of_yojson tree path 

let state_exited_event_details_of_yojson = 
  fun tree path : state_exited_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : state_exited_event_details = {
    output_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "outputDetails") _list path;
    output = option_of_yojson (value_for_key (sensitive_data_of_yojson) "output") _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    
  }
  in _res

let state_entered_event_details_of_yojson = 
  fun tree path : state_entered_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : state_entered_event_details = {
    input_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "inputDetails") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    
  }
  in _res

let cloud_watch_events_execution_data_details_of_yojson = 
  fun tree path : cloud_watch_events_execution_data_details ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_watch_events_execution_data_details = {
    included = option_of_yojson (value_for_key (included_details_of_yojson) "included") _list path;
    
  }
  in _res

let billed_memory_used_of_yojson = long_of_yojson

let billed_duration_of_yojson = long_of_yojson

let billing_details_of_yojson = 
  fun tree path : billing_details ->
  let _list = assoc_of_yojson tree path in
  let _res : billing_details = {
    billed_duration_in_milliseconds = option_of_yojson (value_for_key (billed_duration_of_yojson) "billedDurationInMilliseconds") _list path;
    billed_memory_used_in_m_b = option_of_yojson (value_for_key (billed_memory_used_of_yojson) "billedMemoryUsedInMB") _list path;
    
  }
  in _res

let start_sync_execution_output_of_yojson = 
  fun tree path : start_sync_execution_output ->
  let _list = assoc_of_yojson tree path in
  let _res : start_sync_execution_output = {
    billing_details = option_of_yojson (value_for_key (billing_details_of_yojson) "billingDetails") _list path;
    trace_header = option_of_yojson (value_for_key (trace_header_of_yojson) "traceHeader") _list path;
    output_details = option_of_yojson (value_for_key (cloud_watch_events_execution_data_details_of_yojson) "outputDetails") _list path;
    output = option_of_yojson (value_for_key (sensitive_data_of_yojson) "output") _list path;
    input_details = option_of_yojson (value_for_key (cloud_watch_events_execution_data_details_of_yojson) "inputDetails") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    status = value_for_key (sync_execution_status_of_yojson) "status" _list path;
    stop_date = value_for_key (timestamp__of_yojson) "stopDate" _list path;
    start_date = value_for_key (timestamp__of_yojson) "startDate" _list path;
    name = option_of_yojson (value_for_key (name_of_yojson) "name") _list path;
    state_machine_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineArn") _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let start_sync_execution_input_of_yojson = 
  fun tree path : start_sync_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : start_sync_execution_input = {
    trace_header = option_of_yojson (value_for_key (trace_header_of_yojson) "traceHeader") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    name = option_of_yojson (value_for_key (name_of_yojson) "name") _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let invalid_name_of_yojson = 
  fun tree path : invalid_name ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_name = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let start_execution_output_of_yojson = 
  fun tree path : start_execution_output ->
  let _list = assoc_of_yojson tree path in
  let _res : start_execution_output = {
    start_date = value_for_key (timestamp__of_yojson) "startDate" _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let start_execution_input_of_yojson = 
  fun tree path : start_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : start_execution_input = {
    trace_header = option_of_yojson (value_for_key (trace_header_of_yojson) "traceHeader") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    name = option_of_yojson (value_for_key (name_of_yojson) "name") _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let execution_limit_exceeded_of_yojson = 
  fun tree path : execution_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_limit_exceeded = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let execution_already_exists_of_yojson = 
  fun tree path : execution_already_exists ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_already_exists = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let sensitive_data_job_input_of_yojson = string_of_yojson

let send_task_success_output_of_yojson = 
  fun tree path : send_task_success_output ->
  let _list = assoc_of_yojson tree path in
  let _res : send_task_success_output = ()
  in _res

let send_task_success_input_of_yojson = 
  fun tree path : send_task_success_input ->
  let _list = assoc_of_yojson tree path in
  let _res : send_task_success_input = {
    output = value_for_key (sensitive_data_of_yojson) "output" _list path;
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let invalid_token_of_yojson = 
  fun tree path : invalid_token ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_token = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_output_of_yojson = 
  fun tree path : invalid_output ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_output = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let send_task_heartbeat_output_of_yojson = 
  fun tree path : send_task_heartbeat_output ->
  let _list = assoc_of_yojson tree path in
  let _res : send_task_heartbeat_output = ()
  in _res

let send_task_heartbeat_input_of_yojson = 
  fun tree path : send_task_heartbeat_input ->
  let _list = assoc_of_yojson tree path in
  let _res : send_task_heartbeat_input = {
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let send_task_failure_output_of_yojson = 
  fun tree path : send_task_failure_output ->
  let _list = assoc_of_yojson tree path in
  let _res : send_task_failure_output = ()
  in _res

let send_task_failure_input_of_yojson = 
  fun tree path : send_task_failure_input ->
  let _list = assoc_of_yojson tree path in
  let _res : send_task_failure_input = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    task_token = value_for_key (task_token_of_yojson) "taskToken" _list path;
    
  }
  in _res

let reverse_order_of_yojson = bool_of_yojson

let redrive_execution_output_of_yojson = 
  fun tree path : redrive_execution_output ->
  let _list = assoc_of_yojson tree path in
  let _res : redrive_execution_output = {
    redrive_date = value_for_key (timestamp__of_yojson) "redriveDate" _list path;
    
  }
  in _res

let client_token_of_yojson = string_of_yojson

let redrive_execution_input_of_yojson = 
  fun tree path : redrive_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : redrive_execution_input = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let execution_not_redrivable_of_yojson = 
  fun tree path : execution_not_redrivable ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_not_redrivable = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let redrive_count_of_yojson = int_of_yojson

let publish_state_machine_version_output_of_yojson = 
  fun tree path : publish_state_machine_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : publish_state_machine_version_output = {
    state_machine_version_arn = value_for_key (arn_of_yojson) "stateMachineVersionArn" _list path;
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    
  }
  in _res

let publish_state_machine_version_input_of_yojson = 
  fun tree path : publish_state_machine_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : publish_state_machine_version_input = {
    description = option_of_yojson (value_for_key (version_description_of_yojson) "description") _list path;
    revision_id = option_of_yojson (value_for_key (revision_id_of_yojson) "revisionId") _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let page_token_of_yojson = string_of_yojson

let page_size_of_yojson = int_of_yojson

let map_state_started_event_details_of_yojson = 
  fun tree path : map_state_started_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : map_state_started_event_details = {
    length = option_of_yojson (value_for_key (unsigned_integer_of_yojson) "length") _list path;
    
  }
  in _res

let map_run_status_of_yojson = 
  fun (tree: t) path : map_run_status -> match tree with 
    | `String "ABORTED" -> ABORTED
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "MapRunStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MapRunStatus")

let map_run_started_event_details_of_yojson = 
  fun tree path : map_run_started_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : map_run_started_event_details = {
    map_run_arn = option_of_yojson (value_for_key (long_arn_of_yojson) "mapRunArn") _list path;
    
  }
  in _res

let map_run_redriven_event_details_of_yojson = 
  fun tree path : map_run_redriven_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : map_run_redriven_event_details = {
    redrive_count = option_of_yojson (value_for_key (redrive_count_of_yojson) "redriveCount") _list path;
    map_run_arn = option_of_yojson (value_for_key (long_arn_of_yojson) "mapRunArn") _list path;
    
  }
  in _res

let map_run_list_item_of_yojson = 
  fun tree path : map_run_list_item ->
  let _list = assoc_of_yojson tree path in
  let _res : map_run_list_item = {
    stop_date = option_of_yojson (value_for_key (timestamp__of_yojson) "stopDate") _list path;
    start_date = value_for_key (timestamp__of_yojson) "startDate" _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    map_run_arn = value_for_key (long_arn_of_yojson) "mapRunArn" _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let map_run_list_of_yojson = 
  fun tree path -> list_of_yojson map_run_list_item_of_yojson tree path 

let map_run_label_of_yojson = string_of_yojson

let long_object_of_yojson = long_of_yojson

let map_run_item_counts_of_yojson = 
  fun tree path : map_run_item_counts ->
  let _list = assoc_of_yojson tree path in
  let _res : map_run_item_counts = {
    pending_redrive = option_of_yojson (value_for_key (long_object_of_yojson) "pendingRedrive") _list path;
    failures_not_redrivable = option_of_yojson (value_for_key (long_object_of_yojson) "failuresNotRedrivable") _list path;
    results_written = value_for_key (unsigned_long_of_yojson) "resultsWritten" _list path;
    total = value_for_key (unsigned_long_of_yojson) "total" _list path;
    aborted = value_for_key (unsigned_long_of_yojson) "aborted" _list path;
    timed_out = value_for_key (unsigned_long_of_yojson) "timedOut" _list path;
    failed = value_for_key (unsigned_long_of_yojson) "failed" _list path;
    succeeded = value_for_key (unsigned_long_of_yojson) "succeeded" _list path;
    running = value_for_key (unsigned_long_of_yojson) "running" _list path;
    pending = value_for_key (unsigned_long_of_yojson) "pending" _list path;
    
  }
  in _res

let map_run_failed_event_details_of_yojson = 
  fun tree path : map_run_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : map_run_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let map_run_execution_counts_of_yojson = 
  fun tree path : map_run_execution_counts ->
  let _list = assoc_of_yojson tree path in
  let _res : map_run_execution_counts = {
    pending_redrive = option_of_yojson (value_for_key (long_object_of_yojson) "pendingRedrive") _list path;
    failures_not_redrivable = option_of_yojson (value_for_key (long_object_of_yojson) "failuresNotRedrivable") _list path;
    results_written = value_for_key (unsigned_long_of_yojson) "resultsWritten" _list path;
    total = value_for_key (unsigned_long_of_yojson) "total" _list path;
    aborted = value_for_key (unsigned_long_of_yojson) "aborted" _list path;
    timed_out = value_for_key (unsigned_long_of_yojson) "timedOut" _list path;
    failed = value_for_key (unsigned_long_of_yojson) "failed" _list path;
    succeeded = value_for_key (unsigned_long_of_yojson) "succeeded" _list path;
    running = value_for_key (unsigned_long_of_yojson) "running" _list path;
    pending = value_for_key (unsigned_long_of_yojson) "pending" _list path;
    
  }
  in _res

let map_iteration_event_details_of_yojson = 
  fun tree path : map_iteration_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : map_iteration_event_details = {
    index = option_of_yojson (value_for_key (unsigned_integer_of_yojson) "index") _list path;
    name = option_of_yojson (value_for_key (name_of_yojson) "name") _list path;
    
  }
  in _res

let list_tags_for_resource_output_of_yojson = 
  fun tree path : list_tags_for_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_output = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    
  }
  in _res

let list_tags_for_resource_input_of_yojson = 
  fun tree path : list_tags_for_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_input = {
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let list_state_machines_output_of_yojson = 
  fun tree path : list_state_machines_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_state_machines_output = {
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    state_machines = value_for_key (state_machine_list_of_yojson) "stateMachines" _list path;
    
  }
  in _res

let list_state_machines_input_of_yojson = 
  fun tree path : list_state_machines_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_state_machines_input = {
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    max_results = option_of_yojson (value_for_key (page_size_of_yojson) "maxResults") _list path;
    
  }
  in _res

let list_state_machine_versions_output_of_yojson = 
  fun tree path : list_state_machine_versions_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_state_machine_versions_output = {
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    state_machine_versions = value_for_key (state_machine_version_list_of_yojson) "stateMachineVersions" _list path;
    
  }
  in _res

let list_state_machine_versions_input_of_yojson = 
  fun tree path : list_state_machine_versions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_state_machine_versions_input = {
    max_results = option_of_yojson (value_for_key (page_size_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let list_state_machine_aliases_output_of_yojson = 
  fun tree path : list_state_machine_aliases_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_state_machine_aliases_output = {
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    state_machine_aliases = value_for_key (state_machine_alias_list_of_yojson) "stateMachineAliases" _list path;
    
  }
  in _res

let list_state_machine_aliases_input_of_yojson = 
  fun tree path : list_state_machine_aliases_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_state_machine_aliases_input = {
    max_results = option_of_yojson (value_for_key (page_size_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let list_map_runs_output_of_yojson = 
  fun tree path : list_map_runs_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_map_runs_output = {
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    map_runs = value_for_key (map_run_list_of_yojson) "mapRuns" _list path;
    
  }
  in _res

let list_map_runs_input_of_yojson = 
  fun tree path : list_map_runs_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_map_runs_input = {
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    max_results = option_of_yojson (value_for_key (page_size_of_yojson) "maxResults") _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let list_executions_page_token_of_yojson = string_of_yojson

let execution_status_of_yojson = 
  fun (tree: t) path : execution_status -> match tree with 
    | `String "PENDING_REDRIVE" -> PENDING_REDRIVE
    | `String "ABORTED" -> ABORTED
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatus")

let execution_list_item_of_yojson = 
  fun tree path : execution_list_item ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_list_item = {
    redrive_date = option_of_yojson (value_for_key (timestamp__of_yojson) "redriveDate") _list path;
    redrive_count = option_of_yojson (value_for_key (redrive_count_of_yojson) "redriveCount") _list path;
    state_machine_alias_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineAliasArn") _list path;
    state_machine_version_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineVersionArn") _list path;
    item_count = option_of_yojson (value_for_key (unsigned_integer_of_yojson) "itemCount") _list path;
    map_run_arn = option_of_yojson (value_for_key (long_arn_of_yojson) "mapRunArn") _list path;
    stop_date = option_of_yojson (value_for_key (timestamp__of_yojson) "stopDate") _list path;
    start_date = value_for_key (timestamp__of_yojson) "startDate" _list path;
    status = value_for_key (execution_status_of_yojson) "status" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let execution_list_of_yojson = 
  fun tree path -> list_of_yojson execution_list_item_of_yojson tree path 

let list_executions_output_of_yojson = 
  fun tree path : list_executions_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_executions_output = {
    next_token = option_of_yojson (value_for_key (list_executions_page_token_of_yojson) "nextToken") _list path;
    executions = value_for_key (execution_list_of_yojson) "executions" _list path;
    
  }
  in _res

let execution_redrive_filter_of_yojson = 
  fun (tree: t) path : execution_redrive_filter -> match tree with 
    | `String "NOT_REDRIVEN" -> NOT_REDRIVEN
    | `String "REDRIVEN" -> REDRIVEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionRedriveFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionRedriveFilter")

let list_executions_input_of_yojson = 
  fun tree path : list_executions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_executions_input = {
    redrive_filter = option_of_yojson (value_for_key (execution_redrive_filter_of_yojson) "redriveFilter") _list path;
    map_run_arn = option_of_yojson (value_for_key (long_arn_of_yojson) "mapRunArn") _list path;
    next_token = option_of_yojson (value_for_key (list_executions_page_token_of_yojson) "nextToken") _list path;
    max_results = option_of_yojson (value_for_key (page_size_of_yojson) "maxResults") _list path;
    status_filter = option_of_yojson (value_for_key (execution_status_of_yojson) "statusFilter") _list path;
    state_machine_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineArn") _list path;
    
  }
  in _res

let activity_list_item_of_yojson = 
  fun tree path : activity_list_item ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_list_item = {
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    activity_arn = value_for_key (arn_of_yojson) "activityArn" _list path;
    
  }
  in _res

let activity_list_of_yojson = 
  fun tree path -> list_of_yojson activity_list_item_of_yojson tree path 

let list_activities_output_of_yojson = 
  fun tree path : list_activities_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_activities_output = {
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    activities = value_for_key (activity_list_of_yojson) "activities" _list path;
    
  }
  in _res

let list_activities_input_of_yojson = 
  fun tree path : list_activities_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_activities_input = {
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    max_results = option_of_yojson (value_for_key (page_size_of_yojson) "maxResults") _list path;
    
  }
  in _res

let lambda_function_timed_out_event_details_of_yojson = 
  fun tree path : lambda_function_timed_out_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_timed_out_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let lambda_function_succeeded_event_details_of_yojson = 
  fun tree path : lambda_function_succeeded_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_succeeded_event_details = {
    output_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "outputDetails") _list path;
    output = option_of_yojson (value_for_key (sensitive_data_of_yojson) "output") _list path;
    
  }
  in _res

let lambda_function_start_failed_event_details_of_yojson = 
  fun tree path : lambda_function_start_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_start_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let lambda_function_scheduled_event_details_of_yojson = 
  fun tree path : lambda_function_scheduled_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_scheduled_event_details = {
    task_credentials = option_of_yojson (value_for_key (task_credentials_of_yojson) "taskCredentials") _list path;
    timeout_in_seconds = option_of_yojson (value_for_key (timeout_in_seconds_of_yojson) "timeoutInSeconds") _list path;
    input_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "inputDetails") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    resource = value_for_key (arn_of_yojson) "resource" _list path;
    
  }
  in _res

let lambda_function_schedule_failed_event_details_of_yojson = 
  fun tree path : lambda_function_schedule_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_schedule_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let lambda_function_failed_event_details_of_yojson = 
  fun tree path : lambda_function_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_function_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let include_execution_data_get_execution_history_of_yojson = 
  bool_of_yojson

let identity_of_yojson = string_of_yojson

let history_event_type_of_yojson = 
  fun (tree: t) path : history_event_type -> match tree with 
    | `String "MapRunRedriven" -> MapRunRedriven
    | `String "ExecutionRedriven" -> ExecutionRedriven
    | `String "MapRunSucceeded" -> MapRunSucceeded
    | `String "MapRunStarted" -> MapRunStarted
    | `String "MapRunFailed" -> MapRunFailed
    | `String "MapRunAborted" -> MapRunAborted
    | `String "WaitStateExited" -> WaitStateExited
    | `String "WaitStateEntered" -> WaitStateEntered
    | `String "WaitStateAborted" -> WaitStateAborted
    | `String "TaskTimedOut" -> TaskTimedOut
    | `String "TaskSucceeded" -> TaskSucceeded
    | `String "TaskSubmitted" -> TaskSubmitted
    | `String "TaskSubmitFailed" -> TaskSubmitFailed
    | `String "TaskStateExited" -> TaskStateExited
    | `String "TaskStateEntered" -> TaskStateEntered
    | `String "TaskStateAborted" -> TaskStateAborted
    | `String "TaskStartFailed" -> TaskStartFailed
    | `String "TaskStarted" -> TaskStarted
    | `String "TaskScheduled" -> TaskScheduled
    | `String "TaskFailed" -> TaskFailed
    | `String "SucceedStateExited" -> SucceedStateExited
    | `String "SucceedStateEntered" -> SucceedStateEntered
    | `String "PassStateExited" -> PassStateExited
    | `String "PassStateEntered" -> PassStateEntered
    | `String "ParallelStateSucceeded" -> ParallelStateSucceeded
    | `String "ParallelStateStarted" -> ParallelStateStarted
    | `String "ParallelStateFailed" -> ParallelStateFailed
    | `String "ParallelStateExited" -> ParallelStateExited
    | `String "ParallelStateEntered" -> ParallelStateEntered
    | `String "ParallelStateAborted" -> ParallelStateAborted
    | `String "MapStateSucceeded" -> MapStateSucceeded
    | `String "MapStateStarted" -> MapStateStarted
    | `String "MapStateFailed" -> MapStateFailed
    | `String "MapStateExited" -> MapStateExited
    | `String "MapStateEntered" -> MapStateEntered
    | `String "MapStateAborted" -> MapStateAborted
    | `String "MapIterationSucceeded" -> MapIterationSucceeded
    | `String "MapIterationStarted" -> MapIterationStarted
    | `String "MapIterationFailed" -> MapIterationFailed
    | `String "MapIterationAborted" -> MapIterationAborted
    | `String "LambdaFunctionTimedOut" -> LambdaFunctionTimedOut
    | `String "LambdaFunctionSucceeded" -> LambdaFunctionSucceeded
    | `String "LambdaFunctionStartFailed" -> LambdaFunctionStartFailed
    | `String "LambdaFunctionStarted" -> LambdaFunctionStarted
    | `String "LambdaFunctionScheduleFailed" -> LambdaFunctionScheduleFailed
    | `String "LambdaFunctionScheduled" -> LambdaFunctionScheduled
    | `String "LambdaFunctionFailed" -> LambdaFunctionFailed
    | `String "FailStateEntered" -> FailStateEntered
    | `String "ExecutionTimedOut" -> ExecutionTimedOut
    | `String "ExecutionSucceeded" -> ExecutionSucceeded
    | `String "ExecutionStarted" -> ExecutionStarted
    | `String "ExecutionFailed" -> ExecutionFailed
    | `String "ExecutionAborted" -> ExecutionAborted
    | `String "ChoiceStateExited" -> ChoiceStateExited
    | `String "ChoiceStateEntered" -> ChoiceStateEntered
    | `String "ActivityTimedOut" -> ActivityTimedOut
    | `String "ActivitySucceeded" -> ActivitySucceeded
    | `String "ActivityStarted" -> ActivityStarted
    | `String "ActivityScheduleFailed" -> ActivityScheduleFailed
    | `String "ActivityScheduled" -> ActivityScheduled
    | `String "ActivityFailed" -> ActivityFailed
    | `String value -> raise (deserialize_unknown_enum_value_error path "HistoryEventType" value)
    | _ -> raise (deserialize_wrong_type_error path "HistoryEventType")

let event_id_of_yojson = long_of_yojson

let activity_failed_event_details_of_yojson = 
  fun tree path : activity_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let activity_schedule_failed_event_details_of_yojson = 
  fun tree path : activity_schedule_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_schedule_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let activity_scheduled_event_details_of_yojson = 
  fun tree path : activity_scheduled_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_scheduled_event_details = {
    heartbeat_in_seconds = option_of_yojson (value_for_key (timeout_in_seconds_of_yojson) "heartbeatInSeconds") _list path;
    timeout_in_seconds = option_of_yojson (value_for_key (timeout_in_seconds_of_yojson) "timeoutInSeconds") _list path;
    input_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "inputDetails") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    resource = value_for_key (arn_of_yojson) "resource" _list path;
    
  }
  in _res

let activity_started_event_details_of_yojson = 
  fun tree path : activity_started_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_started_event_details = {
    worker_name = option_of_yojson (value_for_key (identity_of_yojson) "workerName") _list path;
    
  }
  in _res

let activity_succeeded_event_details_of_yojson = 
  fun tree path : activity_succeeded_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_succeeded_event_details = {
    output_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "outputDetails") _list path;
    output = option_of_yojson (value_for_key (sensitive_data_of_yojson) "output") _list path;
    
  }
  in _res

let activity_timed_out_event_details_of_yojson = 
  fun tree path : activity_timed_out_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_timed_out_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let execution_failed_event_details_of_yojson = 
  fun tree path : execution_failed_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_failed_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let execution_started_event_details_of_yojson = 
  fun tree path : execution_started_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_started_event_details = {
    state_machine_version_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineVersionArn") _list path;
    state_machine_alias_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineAliasArn") _list path;
    role_arn = option_of_yojson (value_for_key (arn_of_yojson) "roleArn") _list path;
    input_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "inputDetails") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    
  }
  in _res

let execution_succeeded_event_details_of_yojson = 
  fun tree path : execution_succeeded_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_succeeded_event_details = {
    output_details = option_of_yojson (value_for_key (history_event_execution_data_details_of_yojson) "outputDetails") _list path;
    output = option_of_yojson (value_for_key (sensitive_data_of_yojson) "output") _list path;
    
  }
  in _res

let execution_aborted_event_details_of_yojson = 
  fun tree path : execution_aborted_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_aborted_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let execution_timed_out_event_details_of_yojson = 
  fun tree path : execution_timed_out_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_timed_out_event_details = {
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    
  }
  in _res

let execution_redriven_event_details_of_yojson = 
  fun tree path : execution_redriven_event_details ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_redriven_event_details = {
    redrive_count = option_of_yojson (value_for_key (redrive_count_of_yojson) "redriveCount") _list path;
    
  }
  in _res

let history_event_of_yojson = 
  fun tree path : history_event ->
  let _list = assoc_of_yojson tree path in
  let _res : history_event = {
    map_run_redriven_event_details = option_of_yojson (value_for_key (map_run_redriven_event_details_of_yojson) "mapRunRedrivenEventDetails") _list path;
    map_run_failed_event_details = option_of_yojson (value_for_key (map_run_failed_event_details_of_yojson) "mapRunFailedEventDetails") _list path;
    map_run_started_event_details = option_of_yojson (value_for_key (map_run_started_event_details_of_yojson) "mapRunStartedEventDetails") _list path;
    state_exited_event_details = option_of_yojson (value_for_key (state_exited_event_details_of_yojson) "stateExitedEventDetails") _list path;
    state_entered_event_details = option_of_yojson (value_for_key (state_entered_event_details_of_yojson) "stateEnteredEventDetails") _list path;
    lambda_function_timed_out_event_details = option_of_yojson (value_for_key (lambda_function_timed_out_event_details_of_yojson) "lambdaFunctionTimedOutEventDetails") _list path;
    lambda_function_succeeded_event_details = option_of_yojson (value_for_key (lambda_function_succeeded_event_details_of_yojson) "lambdaFunctionSucceededEventDetails") _list path;
    lambda_function_start_failed_event_details = option_of_yojson (value_for_key (lambda_function_start_failed_event_details_of_yojson) "lambdaFunctionStartFailedEventDetails") _list path;
    lambda_function_scheduled_event_details = option_of_yojson (value_for_key (lambda_function_scheduled_event_details_of_yojson) "lambdaFunctionScheduledEventDetails") _list path;
    lambda_function_schedule_failed_event_details = option_of_yojson (value_for_key (lambda_function_schedule_failed_event_details_of_yojson) "lambdaFunctionScheduleFailedEventDetails") _list path;
    lambda_function_failed_event_details = option_of_yojson (value_for_key (lambda_function_failed_event_details_of_yojson) "lambdaFunctionFailedEventDetails") _list path;
    map_iteration_aborted_event_details = option_of_yojson (value_for_key (map_iteration_event_details_of_yojson) "mapIterationAbortedEventDetails") _list path;
    map_iteration_failed_event_details = option_of_yojson (value_for_key (map_iteration_event_details_of_yojson) "mapIterationFailedEventDetails") _list path;
    map_iteration_succeeded_event_details = option_of_yojson (value_for_key (map_iteration_event_details_of_yojson) "mapIterationSucceededEventDetails") _list path;
    map_iteration_started_event_details = option_of_yojson (value_for_key (map_iteration_event_details_of_yojson) "mapIterationStartedEventDetails") _list path;
    map_state_started_event_details = option_of_yojson (value_for_key (map_state_started_event_details_of_yojson) "mapStateStartedEventDetails") _list path;
    execution_redriven_event_details = option_of_yojson (value_for_key (execution_redriven_event_details_of_yojson) "executionRedrivenEventDetails") _list path;
    execution_timed_out_event_details = option_of_yojson (value_for_key (execution_timed_out_event_details_of_yojson) "executionTimedOutEventDetails") _list path;
    execution_aborted_event_details = option_of_yojson (value_for_key (execution_aborted_event_details_of_yojson) "executionAbortedEventDetails") _list path;
    execution_succeeded_event_details = option_of_yojson (value_for_key (execution_succeeded_event_details_of_yojson) "executionSucceededEventDetails") _list path;
    execution_started_event_details = option_of_yojson (value_for_key (execution_started_event_details_of_yojson) "executionStartedEventDetails") _list path;
    execution_failed_event_details = option_of_yojson (value_for_key (execution_failed_event_details_of_yojson) "executionFailedEventDetails") _list path;
    task_timed_out_event_details = option_of_yojson (value_for_key (task_timed_out_event_details_of_yojson) "taskTimedOutEventDetails") _list path;
    task_succeeded_event_details = option_of_yojson (value_for_key (task_succeeded_event_details_of_yojson) "taskSucceededEventDetails") _list path;
    task_submitted_event_details = option_of_yojson (value_for_key (task_submitted_event_details_of_yojson) "taskSubmittedEventDetails") _list path;
    task_submit_failed_event_details = option_of_yojson (value_for_key (task_submit_failed_event_details_of_yojson) "taskSubmitFailedEventDetails") _list path;
    task_started_event_details = option_of_yojson (value_for_key (task_started_event_details_of_yojson) "taskStartedEventDetails") _list path;
    task_start_failed_event_details = option_of_yojson (value_for_key (task_start_failed_event_details_of_yojson) "taskStartFailedEventDetails") _list path;
    task_scheduled_event_details = option_of_yojson (value_for_key (task_scheduled_event_details_of_yojson) "taskScheduledEventDetails") _list path;
    task_failed_event_details = option_of_yojson (value_for_key (task_failed_event_details_of_yojson) "taskFailedEventDetails") _list path;
    activity_timed_out_event_details = option_of_yojson (value_for_key (activity_timed_out_event_details_of_yojson) "activityTimedOutEventDetails") _list path;
    activity_succeeded_event_details = option_of_yojson (value_for_key (activity_succeeded_event_details_of_yojson) "activitySucceededEventDetails") _list path;
    activity_started_event_details = option_of_yojson (value_for_key (activity_started_event_details_of_yojson) "activityStartedEventDetails") _list path;
    activity_scheduled_event_details = option_of_yojson (value_for_key (activity_scheduled_event_details_of_yojson) "activityScheduledEventDetails") _list path;
    activity_schedule_failed_event_details = option_of_yojson (value_for_key (activity_schedule_failed_event_details_of_yojson) "activityScheduleFailedEventDetails") _list path;
    activity_failed_event_details = option_of_yojson (value_for_key (activity_failed_event_details_of_yojson) "activityFailedEventDetails") _list path;
    previous_event_id = option_of_yojson (value_for_key (event_id_of_yojson) "previousEventId") _list path;
    id = value_for_key (event_id_of_yojson) "id" _list path;
    type_ = value_for_key (history_event_type_of_yojson) "type" _list path;
    timestamp_ = value_for_key (timestamp__of_yojson) "timestamp" _list path;
    
  }
  in _res

let history_event_list_of_yojson = 
  fun tree path -> list_of_yojson history_event_of_yojson tree path 

let get_execution_history_output_of_yojson = 
  fun tree path : get_execution_history_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_execution_history_output = {
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    events = value_for_key (history_event_list_of_yojson) "events" _list path;
    
  }
  in _res

let get_execution_history_input_of_yojson = 
  fun tree path : get_execution_history_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_execution_history_input = {
    include_execution_data = option_of_yojson (value_for_key (include_execution_data_get_execution_history_of_yojson) "includeExecutionData") _list path;
    next_token = option_of_yojson (value_for_key (page_token_of_yojson) "nextToken") _list path;
    reverse_order = option_of_yojson (value_for_key (reverse_order_of_yojson) "reverseOrder") _list path;
    max_results = option_of_yojson (value_for_key (page_size_of_yojson) "maxResults") _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let get_activity_task_output_of_yojson = 
  fun tree path : get_activity_task_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_activity_task_output = {
    input = option_of_yojson (value_for_key (sensitive_data_job_input_of_yojson) "input") _list path;
    task_token = option_of_yojson (value_for_key (task_token_of_yojson) "taskToken") _list path;
    
  }
  in _res

let get_activity_task_input_of_yojson = 
  fun tree path : get_activity_task_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_activity_task_input = {
    worker_name = option_of_yojson (value_for_key (name_of_yojson) "workerName") _list path;
    activity_arn = value_for_key (arn_of_yojson) "activityArn" _list path;
    
  }
  in _res

let activity_worker_limit_exceeded_of_yojson = 
  fun tree path : activity_worker_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_worker_limit_exceeded = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let activity_does_not_exist_of_yojson = 
  fun tree path : activity_does_not_exist ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_does_not_exist = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let execution_redrive_status_of_yojson = 
  fun (tree: t) path : execution_redrive_status -> match tree with 
    | `String "REDRIVABLE_BY_MAP_RUN" -> REDRIVABLE_BY_MAP_RUN
    | `String "NOT_REDRIVABLE" -> NOT_REDRIVABLE
    | `String "REDRIVABLE" -> REDRIVABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionRedriveStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionRedriveStatus")

let describe_state_machine_output_of_yojson = 
  fun tree path : describe_state_machine_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_state_machine_output = {
    description = option_of_yojson (value_for_key (version_description_of_yojson) "description") _list path;
    revision_id = option_of_yojson (value_for_key (revision_id_of_yojson) "revisionId") _list path;
    label = option_of_yojson (value_for_key (map_run_label_of_yojson) "label") _list path;
    tracing_configuration = option_of_yojson (value_for_key (tracing_configuration_of_yojson) "tracingConfiguration") _list path;
    logging_configuration = option_of_yojson (value_for_key (logging_configuration_of_yojson) "loggingConfiguration") _list path;
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    type_ = value_for_key (state_machine_type_of_yojson) "type" _list path;
    role_arn = value_for_key (arn_of_yojson) "roleArn" _list path;
    definition = value_for_key (definition_of_yojson) "definition" _list path;
    status = option_of_yojson (value_for_key (state_machine_status_of_yojson) "status") _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let describe_state_machine_input_of_yojson = 
  fun tree path : describe_state_machine_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_state_machine_input = {
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let describe_state_machine_for_execution_output_of_yojson = 
  fun tree path : describe_state_machine_for_execution_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_state_machine_for_execution_output = {
    revision_id = option_of_yojson (value_for_key (revision_id_of_yojson) "revisionId") _list path;
    label = option_of_yojson (value_for_key (map_run_label_of_yojson) "label") _list path;
    map_run_arn = option_of_yojson (value_for_key (long_arn_of_yojson) "mapRunArn") _list path;
    tracing_configuration = option_of_yojson (value_for_key (tracing_configuration_of_yojson) "tracingConfiguration") _list path;
    logging_configuration = option_of_yojson (value_for_key (logging_configuration_of_yojson) "loggingConfiguration") _list path;
    update_date = value_for_key (timestamp__of_yojson) "updateDate" _list path;
    role_arn = value_for_key (arn_of_yojson) "roleArn" _list path;
    definition = value_for_key (definition_of_yojson) "definition" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let describe_state_machine_for_execution_input_of_yojson = 
  fun tree path : describe_state_machine_for_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_state_machine_for_execution_input = {
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let describe_state_machine_alias_output_of_yojson = 
  fun tree path : describe_state_machine_alias_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_state_machine_alias_output = {
    update_date = option_of_yojson (value_for_key (timestamp__of_yojson) "updateDate") _list path;
    creation_date = option_of_yojson (value_for_key (timestamp__of_yojson) "creationDate") _list path;
    routing_configuration = option_of_yojson (value_for_key (routing_configuration_list_of_yojson) "routingConfiguration") _list path;
    description = option_of_yojson (value_for_key (alias_description_of_yojson) "description") _list path;
    name = option_of_yojson (value_for_key (name_of_yojson) "name") _list path;
    state_machine_alias_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineAliasArn") _list path;
    
  }
  in _res

let describe_state_machine_alias_input_of_yojson = 
  fun tree path : describe_state_machine_alias_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_state_machine_alias_input = {
    state_machine_alias_arn = value_for_key (arn_of_yojson) "stateMachineAliasArn" _list path;
    
  }
  in _res

let describe_map_run_output_of_yojson = 
  fun tree path : describe_map_run_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_map_run_output = {
    redrive_date = option_of_yojson (value_for_key (timestamp__of_yojson) "redriveDate") _list path;
    redrive_count = option_of_yojson (value_for_key (redrive_count_of_yojson) "redriveCount") _list path;
    execution_counts = value_for_key (map_run_execution_counts_of_yojson) "executionCounts" _list path;
    item_counts = value_for_key (map_run_item_counts_of_yojson) "itemCounts" _list path;
    tolerated_failure_count = value_for_key (tolerated_failure_count_of_yojson) "toleratedFailureCount" _list path;
    tolerated_failure_percentage = value_for_key (tolerated_failure_percentage_of_yojson) "toleratedFailurePercentage" _list path;
    max_concurrency = value_for_key (max_concurrency_of_yojson) "maxConcurrency" _list path;
    stop_date = option_of_yojson (value_for_key (timestamp__of_yojson) "stopDate") _list path;
    start_date = value_for_key (timestamp__of_yojson) "startDate" _list path;
    status = value_for_key (map_run_status_of_yojson) "status" _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    map_run_arn = value_for_key (long_arn_of_yojson) "mapRunArn" _list path;
    
  }
  in _res

let describe_map_run_input_of_yojson = 
  fun tree path : describe_map_run_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_map_run_input = {
    map_run_arn = value_for_key (long_arn_of_yojson) "mapRunArn" _list path;
    
  }
  in _res

let describe_execution_output_of_yojson = 
  fun tree path : describe_execution_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_execution_output = {
    redrive_status_reason = option_of_yojson (value_for_key (sensitive_data_of_yojson) "redriveStatusReason") _list path;
    redrive_status = option_of_yojson (value_for_key (execution_redrive_status_of_yojson) "redriveStatus") _list path;
    redrive_date = option_of_yojson (value_for_key (timestamp__of_yojson) "redriveDate") _list path;
    redrive_count = option_of_yojson (value_for_key (redrive_count_of_yojson) "redriveCount") _list path;
    state_machine_alias_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineAliasArn") _list path;
    state_machine_version_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineVersionArn") _list path;
    cause = option_of_yojson (value_for_key (sensitive_cause_of_yojson) "cause") _list path;
    error = option_of_yojson (value_for_key (sensitive_error_of_yojson) "error") _list path;
    map_run_arn = option_of_yojson (value_for_key (long_arn_of_yojson) "mapRunArn") _list path;
    trace_header = option_of_yojson (value_for_key (trace_header_of_yojson) "traceHeader") _list path;
    output_details = option_of_yojson (value_for_key (cloud_watch_events_execution_data_details_of_yojson) "outputDetails") _list path;
    output = option_of_yojson (value_for_key (sensitive_data_of_yojson) "output") _list path;
    input_details = option_of_yojson (value_for_key (cloud_watch_events_execution_data_details_of_yojson) "inputDetails") _list path;
    input = option_of_yojson (value_for_key (sensitive_data_of_yojson) "input") _list path;
    stop_date = option_of_yojson (value_for_key (timestamp__of_yojson) "stopDate") _list path;
    start_date = value_for_key (timestamp__of_yojson) "startDate" _list path;
    status = value_for_key (execution_status_of_yojson) "status" _list path;
    name = option_of_yojson (value_for_key (name_of_yojson) "name") _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let describe_execution_input_of_yojson = 
  fun tree path : describe_execution_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_execution_input = {
    execution_arn = value_for_key (arn_of_yojson) "executionArn" _list path;
    
  }
  in _res

let describe_activity_output_of_yojson = 
  fun tree path : describe_activity_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_activity_output = {
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    activity_arn = value_for_key (arn_of_yojson) "activityArn" _list path;
    
  }
  in _res

let describe_activity_input_of_yojson = 
  fun tree path : describe_activity_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_activity_input = {
    activity_arn = value_for_key (arn_of_yojson) "activityArn" _list path;
    
  }
  in _res

let delete_state_machine_version_output_of_yojson = 
  fun tree path : delete_state_machine_version_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_state_machine_version_output = ()
  in _res

let delete_state_machine_version_input_of_yojson = 
  fun tree path : delete_state_machine_version_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_state_machine_version_input = {
    state_machine_version_arn = value_for_key (long_arn_of_yojson) "stateMachineVersionArn" _list path;
    
  }
  in _res

let delete_state_machine_output_of_yojson = 
  fun tree path : delete_state_machine_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_state_machine_output = ()
  in _res

let delete_state_machine_input_of_yojson = 
  fun tree path : delete_state_machine_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_state_machine_input = {
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let delete_state_machine_alias_output_of_yojson = 
  fun tree path : delete_state_machine_alias_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_state_machine_alias_output = ()
  in _res

let delete_state_machine_alias_input_of_yojson = 
  fun tree path : delete_state_machine_alias_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_state_machine_alias_input = {
    state_machine_alias_arn = value_for_key (arn_of_yojson) "stateMachineAliasArn" _list path;
    
  }
  in _res

let delete_activity_output_of_yojson = 
  fun tree path : delete_activity_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_activity_output = ()
  in _res

let delete_activity_input_of_yojson = 
  fun tree path : delete_activity_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_activity_input = {
    activity_arn = value_for_key (arn_of_yojson) "activityArn" _list path;
    
  }
  in _res

let create_state_machine_output_of_yojson = 
  fun tree path : create_state_machine_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_state_machine_output = {
    state_machine_version_arn = option_of_yojson (value_for_key (arn_of_yojson) "stateMachineVersionArn") _list path;
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    state_machine_arn = value_for_key (arn_of_yojson) "stateMachineArn" _list path;
    
  }
  in _res

let create_state_machine_input_of_yojson = 
  fun tree path : create_state_machine_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_state_machine_input = {
    version_description = option_of_yojson (value_for_key (version_description_of_yojson) "versionDescription") _list path;
    publish = option_of_yojson (value_for_key (publish_of_yojson) "publish") _list path;
    tracing_configuration = option_of_yojson (value_for_key (tracing_configuration_of_yojson) "tracingConfiguration") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    logging_configuration = option_of_yojson (value_for_key (logging_configuration_of_yojson) "loggingConfiguration") _list path;
    type_ = option_of_yojson (value_for_key (state_machine_type_of_yojson) "type") _list path;
    role_arn = value_for_key (arn_of_yojson) "roleArn" _list path;
    definition = value_for_key (definition_of_yojson) "definition" _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    
  }
  in _res

let create_state_machine_alias_output_of_yojson = 
  fun tree path : create_state_machine_alias_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_state_machine_alias_output = {
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    state_machine_alias_arn = value_for_key (arn_of_yojson) "stateMachineAliasArn" _list path;
    
  }
  in _res

let character_restricted_name_of_yojson = string_of_yojson

let create_state_machine_alias_input_of_yojson = 
  fun tree path : create_state_machine_alias_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_state_machine_alias_input = {
    routing_configuration = value_for_key (routing_configuration_list_of_yojson) "routingConfiguration" _list path;
    name = value_for_key (character_restricted_name_of_yojson) "name" _list path;
    description = option_of_yojson (value_for_key (alias_description_of_yojson) "description") _list path;
    
  }
  in _res

let create_activity_output_of_yojson = 
  fun tree path : create_activity_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_activity_output = {
    creation_date = value_for_key (timestamp__of_yojson) "creationDate" _list path;
    activity_arn = value_for_key (arn_of_yojson) "activityArn" _list path;
    
  }
  in _res

let create_activity_input_of_yojson = 
  fun tree path : create_activity_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_activity_input = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    name = value_for_key (name_of_yojson) "name" _list path;
    
  }
  in _res

let activity_limit_exceeded_of_yojson = 
  fun tree path : activity_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : activity_limit_exceeded = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

