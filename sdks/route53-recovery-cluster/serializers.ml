open Smaws_Lib.Json.SerializeHelpers

open Types

let base_unit_to_yojson = unit_to_yojson

let validation_exception_reason_to_yojson = 
  fun (x: validation_exception_reason) -> match x with 
 
| OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"
   

let string__to_yojson = string_to_yojson

let validation_exception_field_to_yojson = 
  fun (x: validation_exception_field) -> assoc_to_yojson(
    [(
         "message",
         (Some (string__to_yojson x.message)));
       (
         "name",
         (Some (string__to_yojson x.name)));
       
  ])

let validation_exception_field_list_to_yojson = 
  fun tree -> list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "fields",
         (option_to_yojson validation_exception_field_list_to_yojson x.fields));
       (
         "reason",
         (option_to_yojson validation_exception_reason_to_yojson x.reason));
       (
         "message",
         (Some (string__to_yojson x.message)));
       
  ])

let update_routing_control_states_response_to_yojson = 
  fun (x: update_routing_control_states_response) -> assoc_to_yojson(
    [
  ])

let arn_to_yojson = string_to_yojson

let routing_control_state_to_yojson = 
  fun (x: routing_control_state) -> match x with 
  | Off -> `String "Off"
    | On -> `String "On"
     

let update_routing_control_state_entry_to_yojson = 
  fun (x: update_routing_control_state_entry) -> assoc_to_yojson(
    [(
         "RoutingControlState",
         (Some (routing_control_state_to_yojson x.routing_control_state)));
       (
         "RoutingControlArn",
         (Some (arn_to_yojson x.routing_control_arn)));
       
  ])

let update_routing_control_state_entries_to_yojson = 
  fun tree -> list_to_yojson update_routing_control_state_entry_to_yojson tree

let arns_to_yojson = fun tree -> list_to_yojson arn_to_yojson tree

let update_routing_control_states_request_to_yojson = 
  fun (x: update_routing_control_states_request) -> assoc_to_yojson(
    [(
         "SafetyRulesToOverride",
         (option_to_yojson arns_to_yojson x.safety_rules_to_override));
       (
         "UpdateRoutingControlStateEntries",
         (Some (update_routing_control_state_entries_to_yojson x.update_routing_control_state_entries)));
       
  ])

let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson = 
  fun (x: throttling_exception) -> assoc_to_yojson(
    [(
         "retryAfterSeconds",
         (option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds));
       (
         "message",
         (Some (string__to_yojson x.message)));
       
  ])

let service_limit_exceeded_exception_to_yojson = 
  fun (x: service_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "serviceCode",
         (Some (string__to_yojson x.service_code)));
       (
         "limitCode",
         (Some (string__to_yojson x.limit_code)));
       (
         "resourceType",
         (option_to_yojson string__to_yojson x.resource_type));
       (
         "resourceId",
         (option_to_yojson string__to_yojson x.resource_id));
       (
         "message",
         (Some (string__to_yojson x.message)));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "resourceType",
         (Some (string__to_yojson x.resource_type)));
       (
         "resourceId",
         (Some (string__to_yojson x.resource_id)));
       (
         "message",
         (Some (string__to_yojson x.message)));
       
  ])

let internal_server_exception_to_yojson = 
  fun (x: internal_server_exception) -> assoc_to_yojson(
    [(
         "retryAfterSeconds",
         (option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds));
       (
         "message",
         (Some (string__to_yojson x.message)));
       
  ])

let endpoint_temporarily_unavailable_exception_to_yojson = 
  fun (x: endpoint_temporarily_unavailable_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (string__to_yojson x.message)));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "resourceType",
         (Some (string__to_yojson x.resource_type)));
       (
         "resourceId",
         (Some (string__to_yojson x.resource_id)));
       (
         "message",
         (Some (string__to_yojson x.message)));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (string__to_yojson x.message)));
       
  ])

let update_routing_control_state_response_to_yojson = 
  fun (x: update_routing_control_state_response) -> assoc_to_yojson(
    [
  ])

let update_routing_control_state_request_to_yojson = 
  fun (x: update_routing_control_state_request) -> assoc_to_yojson(
    [(
         "SafetyRulesToOverride",
         (option_to_yojson arns_to_yojson x.safety_rules_to_override));
       (
         "RoutingControlState",
         (Some (routing_control_state_to_yojson x.routing_control_state)));
       (
         "RoutingControlArn",
         (Some (arn_to_yojson x.routing_control_arn)));
       
  ])

let control_panel_name_to_yojson = string_to_yojson

let routing_control_name_to_yojson = string_to_yojson

let owner_to_yojson = string_to_yojson

let routing_control_to_yojson = 
  fun (x: routing_control) -> assoc_to_yojson(
    [(
         "Owner",
         (option_to_yojson owner_to_yojson x.owner));
       (
         "RoutingControlState",
         (option_to_yojson routing_control_state_to_yojson x.routing_control_state));
       (
         "RoutingControlName",
         (option_to_yojson routing_control_name_to_yojson x.routing_control_name));
       (
         "RoutingControlArn",
         (option_to_yojson arn_to_yojson x.routing_control_arn));
       (
         "ControlPanelName",
         (option_to_yojson control_panel_name_to_yojson x.control_panel_name));
       (
         "ControlPanelArn",
         (option_to_yojson arn_to_yojson x.control_panel_arn));
       
  ])

let routing_controls_to_yojson = 
  fun tree -> list_to_yojson routing_control_to_yojson tree

let page_token_to_yojson = string_to_yojson

let list_routing_controls_response_to_yojson = 
  fun (x: list_routing_controls_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "RoutingControls",
         (Some (routing_controls_to_yojson x.routing_controls)));
       
  ])

let max_results_to_yojson = int_to_yojson

let list_routing_controls_request_to_yojson = 
  fun (x: list_routing_controls_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson page_token_to_yojson x.next_token));
       (
         "ControlPanelArn",
         (option_to_yojson arn_to_yojson x.control_panel_arn));
       
  ])

let get_routing_control_state_response_to_yojson = 
  fun (x: get_routing_control_state_response) -> assoc_to_yojson(
    [(
         "RoutingControlName",
         (option_to_yojson routing_control_name_to_yojson x.routing_control_name));
       (
         "RoutingControlState",
         (Some (routing_control_state_to_yojson x.routing_control_state)));
       (
         "RoutingControlArn",
         (Some (arn_to_yojson x.routing_control_arn)));
       
  ])

let get_routing_control_state_request_to_yojson = 
  fun (x: get_routing_control_state_request) -> assoc_to_yojson(
    [(
         "RoutingControlArn",
         (Some (arn_to_yojson x.routing_control_arn)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

