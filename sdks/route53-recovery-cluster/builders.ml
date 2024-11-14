[@@@warning "-39"]
open Types
let make_validation_exception_field  ~(message : string) ~(name : string) ()
: validation_exception_field = { message; name; 
}

let make_update_routing_control_states_response  ()
: update_routing_control_states_response =
()

let make_update_routing_control_state_entry 
  ~(routing_control_state : routing_control_state)
  ~(routing_control_arn : string)
  () : update_routing_control_state_entry = {
  routing_control_state; routing_control_arn; 
}

let make_update_routing_control_states_request 
  ?(safety_rules_to_override : string list option)
  ~(update_routing_control_state_entries : update_routing_control_state_entry list)
  () : update_routing_control_states_request = {
  safety_rules_to_override; update_routing_control_state_entries; 
}

let make_update_routing_control_state_response  ()
: update_routing_control_state_response =
()

let make_update_routing_control_state_request 
  ?(safety_rules_to_override : string list option)
  ~(routing_control_state : routing_control_state)
  ~(routing_control_arn : string)
  () : update_routing_control_state_request = {
  safety_rules_to_override; routing_control_state; routing_control_arn; 
}

let make_routing_control 
  ?(owner : string option)
  ?(routing_control_state : routing_control_state option)
  ?(routing_control_name : string option)
  ?(routing_control_arn : string option)
  ?(control_panel_name : string option)
  ?(control_panel_arn : string option)
  () : routing_control = {
  owner;
  routing_control_state;
  routing_control_name;
  routing_control_arn;
  control_panel_name;
  control_panel_arn;
   }

let make_list_routing_controls_response 
  ?(next_token : string option) ~(routing_controls : routing_control list) ()
: list_routing_controls_response = { next_token; routing_controls; 
}

let make_list_routing_controls_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(control_panel_arn : string option)
  () : list_routing_controls_request = {
  max_results; next_token; control_panel_arn; 
}

let make_get_routing_control_state_response 
  ?(routing_control_name : string option)
  ~(routing_control_state : routing_control_state)
  ~(routing_control_arn : string)
  () : get_routing_control_state_response = {
  routing_control_name; routing_control_state; routing_control_arn; 
}

let make_get_routing_control_state_request 
  ~(routing_control_arn : string) () : get_routing_control_state_request = {
  routing_control_arn; 
}

