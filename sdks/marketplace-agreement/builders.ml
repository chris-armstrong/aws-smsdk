[@@@warning "-39"]
open Types
let make_validity_term 
  ?(agreement_end_date : float option)
  ?(agreement_start_date : float option)
  ?(agreement_duration : string option)
  ?(type_ : string option)
  () : validity_term = {
  agreement_end_date; agreement_start_date; agreement_duration; type_; 
}

let make_validation_exception_field  ~(message : string) ~(name : string) ()
: validation_exception_field = { message; name;  }

let make_rate_card_item 
  ?(price : string option) ?(dimension_key : string option) ()
: rate_card_item = { price; dimension_key; 
}

let make_usage_based_rate_card_item 
  ?(rate_card : rate_card_item list option) () : usage_based_rate_card_item =
{ rate_card;  }

let make_usage_based_pricing_term 
  ?(rate_cards : usage_based_rate_card_item list option)
  ?(currency_code : string option)
  ?(type_ : string option)
  () : usage_based_pricing_term = { rate_cards; currency_code; type_; 
}

let make_support_term 
  ?(refund_policy : string option) ?(type_ : string option) () : support_term
= { refund_policy; type_;  }

let make_sort 
  ?(sort_order : sort_order option) ?(sort_by : string option) () : sort = {
  sort_order; sort_by;  }

let make_selector  ?(value : string option) ?(type_ : string option) ()
: selector = { value; type_;  }

let make_acceptor  ?(account_id : string option) () : acceptor = {
  account_id;  }

let make_proposer  ?(account_id : string option) () : proposer = {
  account_id;  }

let make_resource  ?(type_ : string option) ?(id : string option) ()
: resource = { type_; id;  }

let make_proposal_summary 
  ?(offer_id : string option) ?(resources : resource list option) ()
: proposal_summary = { offer_id; resources; 
}

let make_agreement_view_summary 
  ?(status : agreement_status option)
  ?(proposal_summary : proposal_summary option)
  ?(proposer : proposer option)
  ?(acceptor : acceptor option)
  ?(agreement_type : string option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(acceptance_time : float option)
  ?(agreement_id : string option)
  () : agreement_view_summary = {
  status;
  proposal_summary;
  proposer;
  acceptor;
  agreement_type;
  end_time;
  start_time;
  acceptance_time;
  agreement_id;
   }

let make_search_agreements_output 
  ?(next_token : string option)
  ?(agreement_view_summaries : agreement_view_summary list option)
  () : search_agreements_output = { next_token; agreement_view_summaries; 
}

let make_filter  ?(values : string list option) ?(name : string option) ()
: filter = { values; name;  }

let make_search_agreements_input 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(sort : sort option)
  ?(filters : filter list option)
  ?(catalog : string option)
  () : search_agreements_input = {
  next_token; max_results; sort; filters; catalog;  }

let make_schedule_item 
  ?(charge_amount : string option) ?(charge_date : float option) ()
: schedule_item = { charge_amount; charge_date; 
}

let make_renewal_term_configuration  ~(enable_auto_renew : bool) ()
: renewal_term_configuration = { enable_auto_renew;  }

let make_renewal_term 
  ?(configuration : renewal_term_configuration option)
  ?(type_ : string option)
  () : renewal_term = { configuration; type_; 
}

let make_recurring_payment_term 
  ?(price : string option)
  ?(billing_period : string option)
  ?(currency_code : string option)
  ?(type_ : string option)
  () : recurring_payment_term = {
  price; billing_period; currency_code; type_; 
}

let make_payment_schedule_term 
  ?(schedule : schedule_item list option)
  ?(currency_code : string option)
  ?(type_ : string option)
  () : payment_schedule_term = { schedule; currency_code; type_; 
}

let make_document_item 
  ?(version : string option)
  ?(url : string option)
  ?(type_ : string option)
  () : document_item = { version; url; type_;  }

let make_legal_term 
  ?(documents : document_item list option) ?(type_ : string option) ()
: legal_term = { documents; type_;  }

let make_grant_item 
  ?(max_quantity : int option) ?(dimension_key : string option) ()
: grant_item = { max_quantity; dimension_key;  }

let make_constraints 
  ?(quantity_configuration : string option)
  ?(multiple_dimension_selection : string option)
  () : constraints = { quantity_configuration; multiple_dimension_selection; 
}

let make_configurable_upfront_rate_card_item 
  ?(rate_card : rate_card_item list option)
  ?(constraints : constraints option)
  ?(selector : selector option)
  () : configurable_upfront_rate_card_item = {
  rate_card; constraints; selector;  }

let make_dimension  ~(dimension_value : int) ~(dimension_key : string) ()
: dimension = { dimension_value; dimension_key; 
}

let make_configurable_upfront_pricing_term_configuration 
  ~(dimensions : dimension list) ~(selector_value : string) ()
: configurable_upfront_pricing_term_configuration = {
  dimensions; selector_value;  }

let make_configurable_upfront_pricing_term 
  ?(configuration : configurable_upfront_pricing_term_configuration option)
  ?(rate_cards : configurable_upfront_rate_card_item list option)
  ?(currency_code : string option)
  ?(type_ : string option)
  () : configurable_upfront_pricing_term = {
  configuration; rate_cards; currency_code; type_; 
}

let make_byol_pricing_term  ?(type_ : string option) () : byol_pricing_term =
{ type_;  }

let make_free_trial_pricing_term 
  ?(grants : grant_item list option)
  ?(duration : string option)
  ?(type_ : string option)
  () : free_trial_pricing_term = { grants; duration; type_; 
}

let make_fixed_upfront_pricing_term 
  ?(grants : grant_item list option)
  ?(price : string option)
  ?(duration : string option)
  ?(currency_code : string option)
  ?(type_ : string option)
  () : fixed_upfront_pricing_term = {
  grants; price; duration; currency_code; type_; 
}

let make_get_agreement_terms_output 
  ?(next_token : string option)
  ?(accepted_terms : accepted_term list option)
  () : get_agreement_terms_output = { next_token; accepted_terms; 
}

let make_get_agreement_terms_input 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(agreement_id : string)
  () : get_agreement_terms_input = { next_token; max_results; agreement_id; 
}

let make_estimated_charges 
  ?(agreement_value : string option) ?(currency_code : string option) ()
: estimated_charges = { agreement_value; currency_code; 
}

let make_describe_agreement_output 
  ?(status : agreement_status option)
  ?(proposal_summary : proposal_summary option)
  ?(estimated_charges : estimated_charges option)
  ?(agreement_type : string option)
  ?(acceptance_time : float option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(proposer : proposer option)
  ?(acceptor : acceptor option)
  ?(agreement_id : string option)
  () : describe_agreement_output = {
  status;
  proposal_summary;
  estimated_charges;
  agreement_type;
  acceptance_time;
  end_time;
  start_time;
  proposer;
  acceptor;
  agreement_id;
   }

let make_describe_agreement_input  ~(agreement_id : string) ()
: describe_agreement_input = { agreement_id; 
}

