open Types
val make_validity_term :
  ?agreement_end_date:float ->
  ?agreement_start_date:float ->
  ?agreement_duration:string ->
  ?type_:string ->
  unit -> validity_term

val make_validation_exception_field : message:string -> name:string -> unit
-> validation_exception_field

val make_rate_card_item : ?price:string -> ?dimension_key:string -> unit
-> rate_card_item

val make_usage_based_rate_card_item : ?rate_card:rate_card_item list -> unit
-> usage_based_rate_card_item

val make_usage_based_pricing_term :
  ?rate_cards:usage_based_rate_card_item list ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> usage_based_pricing_term

val make_support_term : ?refund_policy:string -> ?type_:string -> unit
-> support_term

val make_sort : ?sort_order:sort_order -> ?sort_by:string -> unit
-> sort

val make_selector : ?value:string -> ?type_:string -> unit
-> selector

val make_acceptor : ?account_id:string -> unit -> acceptor

val make_proposer : ?account_id:string -> unit -> proposer

val make_resource : ?type_:string -> ?id:string -> unit
-> resource

val make_proposal_summary :
  ?offer_id:string -> ?resources:resource list -> unit
-> proposal_summary

val make_agreement_view_summary :
  ?status:agreement_status ->
  ?proposal_summary:proposal_summary ->
  ?proposer:proposer ->
  ?acceptor:acceptor ->
  ?agreement_type:string ->
  ?end_time:float ->
  ?start_time:float ->
  ?acceptance_time:float ->
  ?agreement_id:string ->
  unit -> agreement_view_summary

val make_search_agreements_output :
  ?next_token:string ->
  ?agreement_view_summaries:agreement_view_summary list ->
  unit -> search_agreements_output

val make_filter : ?values:string list -> ?name:string -> unit
-> filter

val make_search_agreements_input :
  ?next_token:string ->
  ?max_results:int ->
  ?sort:sort ->
  ?filters:filter list ->
  ?catalog:string ->
  unit -> search_agreements_input

val make_schedule_item : ?charge_amount:string -> ?charge_date:float -> unit
-> schedule_item

val make_renewal_term_configuration : enable_auto_renew:bool -> unit
-> renewal_term_configuration

val make_renewal_term :
  ?configuration:renewal_term_configuration -> ?type_:string -> unit
-> renewal_term

val make_recurring_payment_term :
  ?price:string ->
  ?billing_period:string ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> recurring_payment_term

val make_payment_schedule_term :
  ?schedule:schedule_item list ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> payment_schedule_term

val make_document_item :
  ?version:string -> ?url:string -> ?type_:string -> unit
-> document_item

val make_legal_term : ?documents:document_item list -> ?type_:string -> unit
-> legal_term

val make_grant_item : ?max_quantity:int -> ?dimension_key:string -> unit
-> grant_item

val make_constraints :
  ?quantity_configuration:string ->
  ?multiple_dimension_selection:string ->
  unit -> constraints

val make_configurable_upfront_rate_card_item :
  ?rate_card:rate_card_item list ->
  ?constraints:constraints ->
  ?selector:selector ->
  unit -> configurable_upfront_rate_card_item

val make_dimension : dimension_value:int -> dimension_key:string -> unit
-> dimension

val make_configurable_upfront_pricing_term_configuration :
  dimensions:dimension list -> selector_value:string -> unit
-> configurable_upfront_pricing_term_configuration

val make_configurable_upfront_pricing_term :
  ?configuration:configurable_upfront_pricing_term_configuration ->
  ?rate_cards:configurable_upfront_rate_card_item list ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> configurable_upfront_pricing_term

val make_byol_pricing_term : ?type_:string -> unit
-> byol_pricing_term

val make_free_trial_pricing_term :
  ?grants:grant_item list -> ?duration:string -> ?type_:string -> unit
-> free_trial_pricing_term

val make_fixed_upfront_pricing_term :
  ?grants:grant_item list ->
  ?price:string ->
  ?duration:string ->
  ?currency_code:string ->
  ?type_:string ->
  unit -> fixed_upfront_pricing_term

val make_get_agreement_terms_output :
  ?next_token:string -> ?accepted_terms:accepted_term list -> unit
-> get_agreement_terms_output

val make_get_agreement_terms_input :
  ?next_token:string -> ?max_results:int -> agreement_id:string -> unit
-> get_agreement_terms_input

val make_estimated_charges :
  ?agreement_value:string -> ?currency_code:string -> unit
-> estimated_charges

val make_describe_agreement_output :
  ?status:agreement_status ->
  ?proposal_summary:proposal_summary ->
  ?estimated_charges:estimated_charges ->
  ?agreement_type:string ->
  ?acceptance_time:float ->
  ?end_time:float ->
  ?start_time:float ->
  ?proposer:proposer ->
  ?acceptor:acceptor ->
  ?agreement_id:string ->
  unit -> describe_agreement_output

val make_describe_agreement_input : agreement_id:string -> unit
-> describe_agreement_input

