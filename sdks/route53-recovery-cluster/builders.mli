open Types
val make_validation_exception_field : message:string -> name:string -> unit
-> validation_exception_field
(** Create a {!type-validation_exception_field} type *)

val make_update_routing_control_states_response : unit
-> update_routing_control_states_response
(** Create a {!type-update_routing_control_states_response} type *)

val make_update_routing_control_state_entry :
  routing_control_state:routing_control_state ->
  routing_control_arn:string ->
  unit
-> update_routing_control_state_entry
(** Create a {!type-update_routing_control_state_entry} type *)

val make_update_routing_control_states_request :
  ?safety_rules_to_override:string list ->
  update_routing_control_state_entries:update_routing_control_state_entry list ->
  unit
-> update_routing_control_states_request
(** Create a {!type-update_routing_control_states_request} type *)

val make_update_routing_control_state_response : unit
-> update_routing_control_state_response
(** Create a {!type-update_routing_control_state_response} type *)

val make_update_routing_control_state_request :
  ?safety_rules_to_override:string list ->
  routing_control_state:routing_control_state ->
  routing_control_arn:string ->
  unit
-> update_routing_control_state_request
(** Create a {!type-update_routing_control_state_request} type *)

val make_routing_control :
  ?owner:string ->
  ?routing_control_state:routing_control_state ->
  ?routing_control_name:string ->
  ?routing_control_arn:string ->
  ?control_panel_name:string ->
  ?control_panel_arn:string ->
  unit
-> routing_control
(** Create a {!type-routing_control} type *)

val make_list_routing_controls_response :
  ?next_token:string -> routing_controls:routing_control list -> unit
-> list_routing_controls_response
(** Create a {!type-list_routing_controls_response} type *)

val make_list_routing_controls_request :
  ?max_results:int -> ?next_token:string -> ?control_panel_arn:string -> unit
-> list_routing_controls_request
(** Create a {!type-list_routing_controls_request} type *)

val make_get_routing_control_state_response :
  ?routing_control_name:string ->
  routing_control_state:routing_control_state ->
  routing_control_arn:string ->
  unit
-> get_routing_control_state_response
(** Create a {!type-get_routing_control_state_response} type *)

val make_get_routing_control_state_request :
  routing_control_arn:string -> unit
-> get_routing_control_state_request
(** Create a {!type-get_routing_control_state_request} type *)

