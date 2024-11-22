open Types
val make_validation_exception_field : message:string -> name:string -> unit
-> validation_exception_field

val make_update_routing_control_states_response : unit
-> update_routing_control_states_response

val make_update_routing_control_state_entry :
  routing_control_state:routing_control_state ->
  routing_control_arn:string ->
  unit
-> update_routing_control_state_entry

val make_update_routing_control_states_request :
  ?safety_rules_to_override:string list ->
  update_routing_control_state_entries:update_routing_control_state_entry list ->
  unit
-> update_routing_control_states_request

val make_update_routing_control_state_response : unit
-> update_routing_control_state_response

val make_update_routing_control_state_request :
  ?safety_rules_to_override:string list ->
  routing_control_state:routing_control_state ->
  routing_control_arn:string ->
  unit -> update_routing_control_state_request

val make_routing_control :
  ?owner:string ->
  ?routing_control_state:routing_control_state ->
  ?routing_control_name:string ->
  ?routing_control_arn:string ->
  ?control_panel_name:string ->
  ?control_panel_arn:string ->
  unit -> routing_control

val make_list_routing_controls_response :
  ?next_token:string -> routing_controls:routing_control list -> unit
-> list_routing_controls_response

val make_list_routing_controls_request :
  ?max_results:int -> ?next_token:string -> ?control_panel_arn:string -> unit
-> list_routing_controls_request

val make_get_routing_control_state_response :
  ?routing_control_name:string ->
  routing_control_state:routing_control_state ->
  routing_control_arn:string ->
  unit
-> get_routing_control_state_response

val make_get_routing_control_state_request :
  routing_control_arn:string -> unit
-> get_routing_control_state_request

