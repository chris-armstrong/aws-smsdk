open Smaws_Lib.Json.SerializeHelpers

open Types

let zero_value_integer_to_yojson = int_to_yojson

let unversioned_term_type_to_yojson = string_to_yojson

let bounded_string_to_yojson = string_to_yojson

let timestamp__to_yojson = timestamp_to_yojson

let validity_term_to_yojson = 
  fun (x: validity_term) -> assoc_to_yojson(
    [(
         "agreementEndDate",
         (option_to_yojson timestamp__to_yojson x.agreement_end_date));
       (
         "agreementStartDate",
         (option_to_yojson timestamp__to_yojson x.agreement_start_date));
       (
         "agreementDuration",
         (option_to_yojson bounded_string_to_yojson x.agreement_duration));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let validation_exception_reason_to_yojson = 
  fun (x: validation_exception_reason) -> match x with 
 
| OTHER -> `String "OTHER"
  | UNSUPPORTED_FILTERS -> `String "UNSUPPORTED_FILTERS"
  | INVALID_MAX_RESULTS -> `String "INVALID_MAX_RESULTS"
  | INVALID_NEXT_TOKEN -> `String "INVALID_NEXT_TOKEN"
  | INVALID_SORT_ORDER -> `String "INVALID_SORT_ORDER"
  | INVALID_SORT_BY -> `String "INVALID_SORT_BY"
  | INVALID_FILTER_VALUES -> `String "INVALID_FILTER_VALUES"
  | INVALID_FILTER_NAME -> `String "INVALID_FILTER_NAME"
  | INVALID_CATALOG -> `String "INVALID_CATALOG"
  | MISSING_AGREEMENT_ID -> `String "MISSING_AGREEMENT_ID"
  | INVALID_AGREEMENT_ID -> `String "INVALID_AGREEMENT_ID"
   

let validation_exception_field_to_yojson = 
  fun (x: validation_exception_field) -> assoc_to_yojson(
    [(
         "message",
         (Some (bounded_string_to_yojson x.message)));
       (
         "name",
         (Some (bounded_string_to_yojson x.name)));
       
  ])

let validation_exception_field_list_to_yojson = 
  fun tree -> list_to_yojson validation_exception_field_to_yojson tree

let request_id_to_yojson = string_to_yojson

let exception_message_to_yojson = string_to_yojson

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
         (option_to_yojson exception_message_to_yojson x.message));
       (
         "requestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       
  ])

let rate_card_item_to_yojson = 
  fun (x: rate_card_item) -> assoc_to_yojson(
    [(
         "price",
         (option_to_yojson bounded_string_to_yojson x.price));
       (
         "dimensionKey",
         (option_to_yojson bounded_string_to_yojson x.dimension_key));
       
  ])

let rate_card_list_to_yojson = 
  fun tree -> list_to_yojson rate_card_item_to_yojson tree

let usage_based_rate_card_item_to_yojson = 
  fun (x: usage_based_rate_card_item) -> assoc_to_yojson(
    [(
         "rateCard",
         (option_to_yojson rate_card_list_to_yojson x.rate_card));
       
  ])

let usage_based_rate_card_list_to_yojson = 
  fun tree -> list_to_yojson usage_based_rate_card_item_to_yojson tree

let currency_code_to_yojson = string_to_yojson

let usage_based_pricing_term_to_yojson = 
  fun (x: usage_based_pricing_term) -> assoc_to_yojson(
    [(
         "rateCards",
         (option_to_yojson usage_based_rate_card_list_to_yojson x.rate_cards));
       (
         "currencyCode",
         (option_to_yojson currency_code_to_yojson x.currency_code));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let throttling_exception_to_yojson = 
  fun (x: throttling_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       (
         "requestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       
  ])

let support_term_to_yojson = 
  fun (x: support_term) -> assoc_to_yojson(
    [(
         "refundPolicy",
         (option_to_yojson bounded_string_to_yojson x.refund_policy));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let sort_order_to_yojson = 
  fun (x: sort_order) -> match x with 
  | DESCENDING -> `String "DESCENDING"
    | ASCENDING -> `String "ASCENDING"
     

let sort_by_to_yojson = string_to_yojson

let sort_to_yojson = 
  fun (x: sort) -> assoc_to_yojson(
    [(
         "sortOrder",
         (option_to_yojson sort_order_to_yojson x.sort_order));
       (
         "sortBy",
         (option_to_yojson sort_by_to_yojson x.sort_by));
       
  ])

let selector_to_yojson = 
  fun (x: selector) -> assoc_to_yojson(
    [(
         "value",
         (option_to_yojson bounded_string_to_yojson x.value));
       (
         "type",
         (option_to_yojson bounded_string_to_yojson x.type_));
       
  ])

let resource_id_to_yojson = string_to_yojson

let agreement_type_to_yojson = string_to_yojson

let aws_account_id_to_yojson = string_to_yojson

let acceptor_to_yojson = 
  fun (x: acceptor) -> assoc_to_yojson(
    [(
         "accountId",
         (option_to_yojson aws_account_id_to_yojson x.account_id));
       
  ])

let proposer_to_yojson = 
  fun (x: proposer) -> assoc_to_yojson(
    [(
         "accountId",
         (option_to_yojson aws_account_id_to_yojson x.account_id));
       
  ])

let agreement_resource_type_to_yojson = string_to_yojson

let resource_to_yojson = 
  fun (x: resource) -> assoc_to_yojson(
    [(
         "type",
         (option_to_yojson agreement_resource_type_to_yojson x.type_));
       (
         "id",
         (option_to_yojson resource_id_to_yojson x.id));
       
  ])

let resources_to_yojson = 
  fun tree -> list_to_yojson resource_to_yojson tree

let offer_id_to_yojson = string_to_yojson

let proposal_summary_to_yojson = 
  fun (x: proposal_summary) -> assoc_to_yojson(
    [(
         "offerId",
         (option_to_yojson offer_id_to_yojson x.offer_id));
       (
         "resources",
         (option_to_yojson resources_to_yojson x.resources));
       
  ])

let agreement_status_to_yojson = 
  fun (x: agreement_status) -> match x with 
 
| TERMINATED -> `String "TERMINATED"
  | SUPERSEDED -> `String "SUPERSEDED"
  | ROLLED_BACK -> `String "ROLLED_BACK"
  | REPLACED -> `String "REPLACED"
  | RENEWED -> `String "RENEWED"
  | EXPIRED -> `String "EXPIRED"
  | CANCELLED -> `String "CANCELLED"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVE -> `String "ACTIVE"
   

let agreement_view_summary_to_yojson = 
  fun (x: agreement_view_summary) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson agreement_status_to_yojson x.status));
       (
         "proposalSummary",
         (option_to_yojson proposal_summary_to_yojson x.proposal_summary));
       (
         "proposer",
         (option_to_yojson proposer_to_yojson x.proposer));
       (
         "acceptor",
         (option_to_yojson acceptor_to_yojson x.acceptor));
       (
         "agreementType",
         (option_to_yojson agreement_type_to_yojson x.agreement_type));
       (
         "endTime",
         (option_to_yojson timestamp__to_yojson x.end_time));
       (
         "startTime",
         (option_to_yojson timestamp__to_yojson x.start_time));
       (
         "acceptanceTime",
         (option_to_yojson timestamp__to_yojson x.acceptance_time));
       (
         "agreementId",
         (option_to_yojson resource_id_to_yojson x.agreement_id));
       
  ])

let agreement_view_summary_list_to_yojson = 
  fun tree -> list_to_yojson agreement_view_summary_to_yojson tree

let next_token_to_yojson = string_to_yojson

let search_agreements_output_to_yojson = 
  fun (x: search_agreements_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "agreementViewSummaries",
         (option_to_yojson agreement_view_summary_list_to_yojson x.agreement_view_summaries));
       
  ])

let catalog_to_yojson = string_to_yojson

let filter_name_to_yojson = string_to_yojson

let filter_value_to_yojson = string_to_yojson

let filter_value_list_to_yojson = 
  fun tree -> list_to_yojson filter_value_to_yojson tree

let filter_to_yojson = 
  fun (x: filter) -> assoc_to_yojson(
    [(
         "values",
         (option_to_yojson filter_value_list_to_yojson x.values));
       (
         "name",
         (option_to_yojson filter_name_to_yojson x.name));
       
  ])

let filter_list_to_yojson = 
  fun tree -> list_to_yojson filter_to_yojson tree

let max_results_to_yojson = int_to_yojson

let search_agreements_input_to_yojson = 
  fun (x: search_agreements_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "maxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "sort",
         (option_to_yojson sort_to_yojson x.sort));
       (
         "filters",
         (option_to_yojson filter_list_to_yojson x.filters));
       (
         "catalog",
         (option_to_yojson catalog_to_yojson x.catalog));
       
  ])

let internal_server_exception_to_yojson = 
  fun (x: internal_server_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       (
         "requestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       (
         "requestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       
  ])

let schedule_item_to_yojson = 
  fun (x: schedule_item) -> assoc_to_yojson(
    [(
         "chargeAmount",
         (option_to_yojson bounded_string_to_yojson x.charge_amount));
       (
         "chargeDate",
         (option_to_yojson timestamp__to_yojson x.charge_date));
       
  ])

let schedule_list_to_yojson = 
  fun tree -> list_to_yojson schedule_item_to_yojson tree

let resource_type_to_yojson = 
  fun (x: resource_type) -> match x with 
  | AGREEMENT -> `String "Agreement"
     

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "resourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       (
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       (
         "requestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       
  ])

let boolean__to_yojson = bool_to_yojson

let renewal_term_configuration_to_yojson = 
  fun (x: renewal_term_configuration) -> assoc_to_yojson(
    [(
         "enableAutoRenew",
         (Some (boolean__to_yojson x.enable_auto_renew)));
       
  ])

let renewal_term_to_yojson = 
  fun (x: renewal_term) -> assoc_to_yojson(
    [(
         "configuration",
         (option_to_yojson renewal_term_configuration_to_yojson x.configuration));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let recurring_payment_term_to_yojson = 
  fun (x: recurring_payment_term) -> assoc_to_yojson(
    [(
         "price",
         (option_to_yojson bounded_string_to_yojson x.price));
       (
         "billingPeriod",
         (option_to_yojson bounded_string_to_yojson x.billing_period));
       (
         "currencyCode",
         (option_to_yojson currency_code_to_yojson x.currency_code));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let positive_integer_with_default_value_one_to_yojson = int_to_yojson

let payment_schedule_term_to_yojson = 
  fun (x: payment_schedule_term) -> assoc_to_yojson(
    [(
         "schedule",
         (option_to_yojson schedule_list_to_yojson x.schedule));
       (
         "currencyCode",
         (option_to_yojson currency_code_to_yojson x.currency_code));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let document_item_to_yojson = 
  fun (x: document_item) -> assoc_to_yojson(
    [(
         "version",
         (option_to_yojson bounded_string_to_yojson x.version));
       (
         "url",
         (option_to_yojson bounded_string_to_yojson x.url));
       (
         "type",
         (option_to_yojson bounded_string_to_yojson x.type_));
       
  ])

let document_list_to_yojson = 
  fun tree -> list_to_yojson document_item_to_yojson tree

let legal_term_to_yojson = 
  fun (x: legal_term) -> assoc_to_yojson(
    [(
         "documents",
         (option_to_yojson document_list_to_yojson x.documents));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let grant_item_to_yojson = 
  fun (x: grant_item) -> assoc_to_yojson(
    [(
         "maxQuantity",
         (option_to_yojson positive_integer_with_default_value_one_to_yojson x.max_quantity));
       (
         "dimensionKey",
         (option_to_yojson bounded_string_to_yojson x.dimension_key));
       
  ])

let grant_list_to_yojson = 
  fun tree -> list_to_yojson grant_item_to_yojson tree

let constraints_to_yojson = 
  fun (x: constraints) -> assoc_to_yojson(
    [(
         "quantityConfiguration",
         (option_to_yojson bounded_string_to_yojson x.quantity_configuration));
       (
         "multipleDimensionSelection",
         (option_to_yojson bounded_string_to_yojson x.multiple_dimension_selection));
       
  ])

let configurable_upfront_rate_card_item_to_yojson = 
  fun (x: configurable_upfront_rate_card_item) -> assoc_to_yojson(
    [(
         "rateCard",
         (option_to_yojson rate_card_list_to_yojson x.rate_card));
       (
         "constraints",
         (option_to_yojson constraints_to_yojson x.constraints));
       (
         "selector",
         (option_to_yojson selector_to_yojson x.selector));
       
  ])

let configurable_upfront_rate_card_list_to_yojson = 
  fun tree -> list_to_yojson configurable_upfront_rate_card_item_to_yojson tree

let dimension_to_yojson = 
  fun (x: dimension) -> assoc_to_yojson(
    [(
         "dimensionValue",
         (Some (zero_value_integer_to_yojson x.dimension_value)));
       (
         "dimensionKey",
         (Some (bounded_string_to_yojson x.dimension_key)));
       
  ])

let dimension_list_to_yojson = 
  fun tree -> list_to_yojson dimension_to_yojson tree

let configurable_upfront_pricing_term_configuration_to_yojson = 
  fun (x: configurable_upfront_pricing_term_configuration) -> assoc_to_yojson(
    [(
         "dimensions",
         (Some (dimension_list_to_yojson x.dimensions)));
       (
         "selectorValue",
         (Some (bounded_string_to_yojson x.selector_value)));
       
  ])

let configurable_upfront_pricing_term_to_yojson = 
  fun (x: configurable_upfront_pricing_term) -> assoc_to_yojson(
    [(
         "configuration",
         (option_to_yojson configurable_upfront_pricing_term_configuration_to_yojson x.configuration));
       (
         "rateCards",
         (option_to_yojson configurable_upfront_rate_card_list_to_yojson x.rate_cards));
       (
         "currencyCode",
         (option_to_yojson currency_code_to_yojson x.currency_code));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let byol_pricing_term_to_yojson = 
  fun (x: byol_pricing_term) -> assoc_to_yojson(
    [(
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let free_trial_pricing_term_to_yojson = 
  fun (x: free_trial_pricing_term) -> assoc_to_yojson(
    [(
         "grants",
         (option_to_yojson grant_list_to_yojson x.grants));
       (
         "duration",
         (option_to_yojson bounded_string_to_yojson x.duration));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let fixed_upfront_pricing_term_to_yojson = 
  fun (x: fixed_upfront_pricing_term) -> assoc_to_yojson(
    [(
         "grants",
         (option_to_yojson grant_list_to_yojson x.grants));
       (
         "price",
         (option_to_yojson bounded_string_to_yojson x.price));
       (
         "duration",
         (option_to_yojson bounded_string_to_yojson x.duration));
       (
         "currencyCode",
         (option_to_yojson currency_code_to_yojson x.currency_code));
       (
         "type",
         (option_to_yojson unversioned_term_type_to_yojson x.type_));
       
  ])

let accepted_term_to_yojson = 
  fun (x: accepted_term) -> 
  match x with 
    | FixedUpfrontPricingTerm(arg) -> assoc_to_yojson ["fixedUpfrontPricingTerm", Some (fixed_upfront_pricing_term_to_yojson arg)]
      | FreeTrialPricingTerm(arg) -> assoc_to_yojson ["freeTrialPricingTerm", Some (free_trial_pricing_term_to_yojson arg)]
      | PaymentScheduleTerm(arg) -> assoc_to_yojson ["paymentScheduleTerm", Some (payment_schedule_term_to_yojson arg)]
      | ValidityTerm(arg) -> assoc_to_yojson ["validityTerm", Some (validity_term_to_yojson arg)]
      | RecurringPaymentTerm(arg) -> assoc_to_yojson ["recurringPaymentTerm", Some (recurring_payment_term_to_yojson arg)]
      | ByolPricingTerm(arg) -> assoc_to_yojson ["byolPricingTerm", Some (byol_pricing_term_to_yojson arg)]
      | ConfigurableUpfrontPricingTerm(arg) -> assoc_to_yojson ["configurableUpfrontPricingTerm", Some (configurable_upfront_pricing_term_to_yojson arg)]
      | UsageBasedPricingTerm(arg) -> assoc_to_yojson ["usageBasedPricingTerm", Some (usage_based_pricing_term_to_yojson arg)]
      | RenewalTerm(arg) -> assoc_to_yojson ["renewalTerm", Some (renewal_term_to_yojson arg)]
      | SupportTerm(arg) -> assoc_to_yojson ["supportTerm", Some (support_term_to_yojson arg)]
      | LegalTerm(arg) -> assoc_to_yojson ["legalTerm", Some (legal_term_to_yojson arg)]
      
      
    

let accepted_term_list_to_yojson = 
  fun tree -> list_to_yojson accepted_term_to_yojson tree

let get_agreement_terms_output_to_yojson = 
  fun (x: get_agreement_terms_output) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "acceptedTerms",
         (option_to_yojson accepted_term_list_to_yojson x.accepted_terms));
       
  ])

let get_agreement_terms_input_to_yojson = 
  fun (x: get_agreement_terms_input) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "maxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "agreementId",
         (Some (resource_id_to_yojson x.agreement_id)));
       
  ])

let estimated_charges_to_yojson = 
  fun (x: estimated_charges) -> assoc_to_yojson(
    [(
         "agreementValue",
         (option_to_yojson bounded_string_to_yojson x.agreement_value));
       (
         "currencyCode",
         (option_to_yojson currency_code_to_yojson x.currency_code));
       
  ])

let describe_agreement_output_to_yojson = 
  fun (x: describe_agreement_output) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson agreement_status_to_yojson x.status));
       (
         "proposalSummary",
         (option_to_yojson proposal_summary_to_yojson x.proposal_summary));
       (
         "estimatedCharges",
         (option_to_yojson estimated_charges_to_yojson x.estimated_charges));
       (
         "agreementType",
         (option_to_yojson agreement_type_to_yojson x.agreement_type));
       (
         "acceptanceTime",
         (option_to_yojson timestamp__to_yojson x.acceptance_time));
       (
         "endTime",
         (option_to_yojson timestamp__to_yojson x.end_time));
       (
         "startTime",
         (option_to_yojson timestamp__to_yojson x.start_time));
       (
         "proposer",
         (option_to_yojson proposer_to_yojson x.proposer));
       (
         "acceptor",
         (option_to_yojson acceptor_to_yojson x.acceptor));
       (
         "agreementId",
         (option_to_yojson resource_id_to_yojson x.agreement_id));
       
  ])

let describe_agreement_input_to_yojson = 
  fun (x: describe_agreement_input) -> assoc_to_yojson(
    [(
         "agreementId",
         (Some (resource_id_to_yojson x.agreement_id)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

