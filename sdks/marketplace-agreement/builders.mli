open Types
val make_validity_term :
  ?agreement_end_date:float ->
  ?agreement_start_date:float ->
  ?agreement_duration:string ->
  ?type_:string ->
  unit
-> validity_term
(** Create a {!type-validity_term} type *)

val make_validation_exception_field : message:string -> name:string -> unit
-> validation_exception_field
(** Create a {!type-validation_exception_field} type *)

val make_rate_card_item : ?price:string -> ?dimension_key:string -> unit
-> rate_card_item
(** Create a {!type-rate_card_item} type *)

val make_usage_based_rate_card_item : ?rate_card:rate_card_item list -> unit
-> usage_based_rate_card_item
(** Create a {!type-usage_based_rate_card_item} type *)

val make_usage_based_pricing_term :
  ?rate_cards:usage_based_rate_card_item list ->
  ?currency_code:string ->
  ?type_:string ->
  unit
-> usage_based_pricing_term
(** Create a {!type-usage_based_pricing_term} type *)

val make_support_term : ?refund_policy:string -> ?type_:string -> unit
-> support_term
(** Create a {!type-support_term} type *)

val make_sort : ?sort_order:sort_order -> ?sort_by:string -> unit
-> sort
(** Create a {!type-sort} type *)

val make_selector : ?value:string -> ?type_:string -> unit
-> selector
(** Create a {!type-selector} type *)

val make_acceptor : ?account_id:string -> unit
-> acceptor
(** Create a {!type-acceptor} type *)

val make_proposer : ?account_id:string -> unit
-> proposer
(** Create a {!type-proposer} type *)

val make_resource : ?type_:string -> ?id:string -> unit
-> resource
(** Create a {!type-resource} type *)

val make_proposal_summary :
  ?offer_id:string -> ?resources:resource list -> unit
-> proposal_summary
(** Create a {!type-proposal_summary} type *)

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
  unit
-> agreement_view_summary
(** Create a {!type-agreement_view_summary} type *)

val make_search_agreements_output :
  ?next_token:string ->
  ?agreement_view_summaries:agreement_view_summary list ->
  unit
-> search_agreements_output
(** Create a {!type-search_agreements_output} type *)

val make_filter : ?values:string list -> ?name:string -> unit
-> filter
(** Create a {!type-filter} type *)

val make_search_agreements_input :
  ?next_token:string ->
  ?max_results:int ->
  ?sort:sort ->
  ?filters:filter list ->
  ?catalog:string ->
  unit
-> search_agreements_input
(** Create a {!type-search_agreements_input} type *)

val make_schedule_item : ?charge_amount:string -> ?charge_date:float -> unit
-> schedule_item
(** Create a {!type-schedule_item} type *)

val make_renewal_term_configuration : enable_auto_renew:bool -> unit
-> renewal_term_configuration
(** Create a {!type-renewal_term_configuration} type *)

val make_renewal_term :
  ?configuration:renewal_term_configuration -> ?type_:string -> unit
-> renewal_term
(** Create a {!type-renewal_term} type *)

val make_recurring_payment_term :
  ?price:string ->
  ?billing_period:string ->
  ?currency_code:string ->
  ?type_:string ->
  unit
-> recurring_payment_term
(** Create a {!type-recurring_payment_term} type *)

val make_payment_schedule_term :
  ?schedule:schedule_item list ->
  ?currency_code:string ->
  ?type_:string ->
  unit
-> payment_schedule_term
(** Create a {!type-payment_schedule_term} type *)

val make_document_item :
  ?version:string -> ?url:string -> ?type_:string -> unit
-> document_item
(** Create a {!type-document_item} type *)

val make_legal_term : ?documents:document_item list -> ?type_:string -> unit
-> legal_term
(** Create a {!type-legal_term} type *)

val make_grant_item : ?max_quantity:int -> ?dimension_key:string -> unit
-> grant_item
(** Create a {!type-grant_item} type *)

val make_constraints :
  ?quantity_configuration:string ->
  ?multiple_dimension_selection:string ->
  unit
-> constraints
(** Create a {!type-constraints} type *)

val make_configurable_upfront_rate_card_item :
  ?rate_card:rate_card_item list ->
  ?constraints:constraints ->
  ?selector:selector ->
  unit
-> configurable_upfront_rate_card_item
(** Create a {!type-configurable_upfront_rate_card_item} type *)

val make_dimension : dimension_value:int -> dimension_key:string -> unit
-> dimension
(** Create a {!type-dimension} type *)

val make_configurable_upfront_pricing_term_configuration :
  dimensions:dimension list -> selector_value:string -> unit
-> configurable_upfront_pricing_term_configuration
(** Create a {!type-configurable_upfront_pricing_term_configuration} type *)

val make_configurable_upfront_pricing_term :
  ?configuration:configurable_upfront_pricing_term_configuration ->
  ?rate_cards:configurable_upfront_rate_card_item list ->
  ?currency_code:string ->
  ?type_:string ->
  unit
-> configurable_upfront_pricing_term
(** Create a {!type-configurable_upfront_pricing_term} type *)

val make_byol_pricing_term : ?type_:string -> unit
-> byol_pricing_term
(** Create a {!type-byol_pricing_term} type *)

val make_free_trial_pricing_term :
  ?grants:grant_item list -> ?duration:string -> ?type_:string -> unit
-> free_trial_pricing_term
(** Create a {!type-free_trial_pricing_term} type *)

val make_fixed_upfront_pricing_term :
  ?grants:grant_item list ->
  ?price:string ->
  ?duration:string ->
  ?currency_code:string ->
  ?type_:string ->
  unit
-> fixed_upfront_pricing_term
(** Create a {!type-fixed_upfront_pricing_term} type *)

val make_get_agreement_terms_output :
  ?next_token:string -> ?accepted_terms:accepted_term list -> unit
-> get_agreement_terms_output
(** Create a {!type-get_agreement_terms_output} type *)

val make_get_agreement_terms_input :
  ?next_token:string -> ?max_results:int -> agreement_id:string -> unit
-> get_agreement_terms_input
(** Create a {!type-get_agreement_terms_input} type *)

val make_estimated_charges :
  ?agreement_value:string -> ?currency_code:string -> unit
-> estimated_charges
(** Create a {!type-estimated_charges} type *)

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
  unit
-> describe_agreement_output
(** Create a {!type-describe_agreement_output} type *)

val make_describe_agreement_input : agreement_id:string -> unit
-> describe_agreement_input
(** Create a {!type-describe_agreement_input} type *)

