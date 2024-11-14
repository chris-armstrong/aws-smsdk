open Smaws_Lib
let service =
  Service.{
    namespace = "route53-recovery-cluster";
    endpointPrefix = "route53-recovery-cluster";
    version = "2019-12-02";
    protocol = AwsJson_1_0
  };
type validation_exception_reason = | OTHER
  | FIELD_VALIDATION_FAILED
  | CANNOT_PARSE
  | UNKNOWN_OPERATION

type validation_exception_field = {
  message: string;
  name: string
}

type validation_exception = {
  fields: validation_exception_field list option;
  reason: validation_exception_reason option;
  message: string
}

type update_routing_control_states_response = unit

type routing_control_state = | Off
  | On

type update_routing_control_state_entry = {
  routing_control_state: routing_control_state;
  routing_control_arn: string
}

type update_routing_control_states_request = {
  safety_rules_to_override: string list option;
  update_routing_control_state_entries: update_routing_control_state_entry list
}

type throttling_exception = {
  retry_after_seconds: int option;
  message: string
}

type service_limit_exceeded_exception = {
  service_code: string;
  limit_code: string;
  resource_type: string option;
  resource_id: string option;
  message: string
}

type resource_not_found_exception = {
  resource_type: string;
  resource_id: string;
  message: string
}

type internal_server_exception = {
  retry_after_seconds: int option;
  message: string
}

type endpoint_temporarily_unavailable_exception = {
  message: string
}

type conflict_exception = {
  resource_type: string;
  resource_id: string;
  message: string
}

type access_denied_exception = {
  message: string
}

type update_routing_control_state_response = unit

type update_routing_control_state_request = {
  safety_rules_to_override: string list option;
  routing_control_state: routing_control_state;
  routing_control_arn: string
}

type routing_control = {
  owner: string option;
  routing_control_state: routing_control_state option;
  routing_control_name: string option;
  routing_control_arn: string option;
  control_panel_name: string option;
  control_panel_arn: string option
}

type list_routing_controls_response = {
  next_token: string option;
  routing_controls: routing_control list
}

type list_routing_controls_request = {
  max_results: int option;
  next_token: string option;
  control_panel_arn: string option
}

type get_routing_control_state_response = {
  routing_control_name: string option;
  routing_control_state: routing_control_state;
  routing_control_arn: string
}

type get_routing_control_state_request = {
  routing_control_arn: string
}



type base_document = Json.t

