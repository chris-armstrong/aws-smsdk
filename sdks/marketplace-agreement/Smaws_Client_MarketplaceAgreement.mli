open Smaws_Lib
val service : Service.descriptor

type validity_term = {
  agreement_end_date: float option;
  agreement_start_date: float option;
  agreement_duration: string option;
  type_: string option
}

type validation_exception_reason = | OTHER
  | UNSUPPORTED_FILTERS
  | INVALID_MAX_RESULTS
  | INVALID_NEXT_TOKEN
  | INVALID_SORT_ORDER
  | INVALID_SORT_BY
  | INVALID_FILTER_VALUES
  | INVALID_FILTER_NAME
  | INVALID_CATALOG
  | MISSING_AGREEMENT_ID
  | INVALID_AGREEMENT_ID

type validation_exception_field = {
  message: string;
  name: string
}

type validation_exception = {
  fields: validation_exception_field list option;
  reason: validation_exception_reason option;
  message: string option;
  request_id: string option
}

type rate_card_item = {
  price: string option;
  dimension_key: string option
}

type usage_based_rate_card_item = {
  rate_card: rate_card_item list option
}

type usage_based_pricing_term = {
  rate_cards: usage_based_rate_card_item list option;
  currency_code: string option;
  type_: string option
}

type throttling_exception = {
  message: string option;
  request_id: string option
}

type support_term = {
  refund_policy: string option;
  type_: string option
}

type sort_order = | DESCENDING
  | ASCENDING

type sort = {
  sort_order: sort_order option;
  sort_by: string option
}

type selector = {
  value: string option;
  type_: string option
}

type acceptor = {
  account_id: string option
}

type proposer = {
  account_id: string option
}

type resource = {
  type_: string option;
  id: string option
}

type proposal_summary = {
  offer_id: string option;
  resources: resource list option
}

type agreement_status = | TERMINATED
  | SUPERSEDED
  | ROLLED_BACK
  | REPLACED
  | RENEWED
  | EXPIRED
  | CANCELLED
  | ARCHIVED
  | ACTIVE

type agreement_view_summary = {
  status: agreement_status option;
  proposal_summary: proposal_summary option;
  proposer: proposer option;
  acceptor: acceptor option;
  agreement_type: string option;
  end_time: float option;
  start_time: float option;
  acceptance_time: float option;
  agreement_id: string option
}

type search_agreements_output = {
  next_token: string option;
  agreement_view_summaries: agreement_view_summary list option
}

type filter = {
  values: string list option;
  name: string option
}

type search_agreements_input = {
  next_token: string option;
  max_results: int option;
  sort: sort option;
  filters: filter list option;
  catalog: string option
}

type internal_server_exception = {
  message: string option;
  request_id: string option
}

type access_denied_exception = {
  message: string option;
  request_id: string option
}

type schedule_item = {
  charge_amount: string option;
  charge_date: float option
}

type resource_type = | AGREEMENT

type resource_not_found_exception = {
  resource_type: resource_type option;
  resource_id: string option;
  message: string option;
  request_id: string option
}

type renewal_term_configuration = {
  enable_auto_renew: bool
}

type renewal_term = {
  configuration: renewal_term_configuration option;
  type_: string option
}

type recurring_payment_term = {
  price: string option;
  billing_period: string option;
  currency_code: string option;
  type_: string option
}

type payment_schedule_term = {
  schedule: schedule_item list option;
  currency_code: string option;
  type_: string option
}

type document_item = {
  version: string option;
  url: string option;
  type_: string option
}

type legal_term = {
  documents: document_item list option;
  type_: string option
}

type grant_item = {
  max_quantity: int option;
  dimension_key: string option
}

type constraints = {
  quantity_configuration: string option;
  multiple_dimension_selection: string option
}

type configurable_upfront_rate_card_item = {
  rate_card: rate_card_item list option;
  constraints: constraints option;
  selector: selector option
}

type dimension = {
  dimension_value: int;
  dimension_key: string
}

type configurable_upfront_pricing_term_configuration = {
  dimensions: dimension list;
  selector_value: string
}

type configurable_upfront_pricing_term = {
  configuration: configurable_upfront_pricing_term_configuration option;
  rate_cards: configurable_upfront_rate_card_item list option;
  currency_code: string option;
  type_: string option
}

type byol_pricing_term = {
  type_: string option
}

type free_trial_pricing_term = {
  grants: grant_item list option;
  duration: string option;
  type_: string option
}

type fixed_upfront_pricing_term = {
  grants: grant_item list option;
  price: string option;
  duration: string option;
  currency_code: string option;
  type_: string option
}

type accepted_term = FixedUpfrontPricingTerm of fixed_upfront_pricing_term | FreeTrialPricingTerm of free_trial_pricing_term | PaymentScheduleTerm of payment_schedule_term | ValidityTerm of validity_term | RecurringPaymentTerm of recurring_payment_term | ByolPricingTerm of byol_pricing_term | ConfigurableUpfrontPricingTerm of configurable_upfront_pricing_term | UsageBasedPricingTerm of usage_based_pricing_term | RenewalTerm of renewal_term | SupportTerm of support_term | LegalTerm of legal_term

type get_agreement_terms_output = {
  next_token: string option;
  accepted_terms: accepted_term list option
}

type get_agreement_terms_input = {
  next_token: string option;
  max_results: int option;
  agreement_id: string
}

type estimated_charges = {
  agreement_value: string option;
  currency_code: string option
}

type describe_agreement_output = {
  status: agreement_status option;
  proposal_summary: proposal_summary option;
  estimated_charges: estimated_charges option;
  agreement_type: string option;
  acceptance_time: float option;
  end_time: float option;
  start_time: float option;
  proposer: proposer option;
  acceptor: acceptor option;
  agreement_id: string option
}

type describe_agreement_input = {
  agreement_id: string
}



type base_document = Json.t

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

module SearchAgreements : sig
  val request :
    Smaws_Lib.Context.t ->
      search_agreements_input ->
        (search_agreements_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetAgreementTerms : sig
  val request :
    Smaws_Lib.Context.t ->
      get_agreement_terms_input ->
        (get_agreement_terms_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeAgreement : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_agreement_input ->
        (describe_agreement_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

