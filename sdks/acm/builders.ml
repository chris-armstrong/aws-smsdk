[@@@warning "-39"]
open Types
let make_certificate_options 
  ?(certificate_transparency_logging_preference : certificate_transparency_logging_preference option)
  () : certificate_options = { certificate_transparency_logging_preference; 
}

let make_update_certificate_options_request 
  ~(options : certificate_options) ~(certificate_arn : string) ()
: update_certificate_options_request = { options; certificate_arn; 
}

let make_tag  ?(value : string option) ~(key : string) () : tag = {
  value; key;  }

let make_resource_record 
  ~(value : string) ~(type_ : record_type) ~(name : string) ()
: resource_record = { value; type_; name; 
}

let make_resend_validation_email_request 
  ~(validation_domain : string)
  ~(domain : string)
  ~(certificate_arn : string)
  () : resend_validation_email_request = {
  validation_domain; domain; certificate_arn; 
}

let make_request_certificate_response  ?(certificate_arn : string option) ()
: request_certificate_response = { certificate_arn; 
}

let make_domain_validation_option 
  ~(validation_domain : string) ~(domain_name : string) ()
: domain_validation_option = { validation_domain; domain_name; 
}

let make_request_certificate_request 
  ?(key_algorithm : key_algorithm option)
  ?(tags : tag list option)
  ?(certificate_authority_arn : string option)
  ?(options : certificate_options option)
  ?(domain_validation_options : domain_validation_option list option)
  ?(idempotency_token : string option)
  ?(subject_alternative_names : string list option)
  ?(validation_method : validation_method option)
  ~(domain_name : string)
  () : request_certificate_request = {
  key_algorithm;
  tags;
  certificate_authority_arn;
  options;
  domain_validation_options;
  idempotency_token;
  subject_alternative_names;
  validation_method;
  domain_name;
   }

let make_domain_validation 
  ?(validation_method : validation_method option)
  ?(resource_record : resource_record option)
  ?(validation_status : domain_status option)
  ?(validation_domain : string option)
  ?(validation_emails : string list option)
  ~(domain_name : string)
  () : domain_validation = {
  validation_method;
  resource_record;
  validation_status;
  validation_domain;
  validation_emails;
  domain_name;
   }

let make_renewal_summary 
  ?(renewal_status_reason : failure_reason option)
  ~(updated_at : float)
  ~(domain_validation_options : domain_validation list)
  ~(renewal_status : renewal_status)
  () : renewal_summary = {
  updated_at;
  renewal_status_reason;
  domain_validation_options;
  renewal_status;
   }

let make_renew_certificate_request  ~(certificate_arn : string) ()
: renew_certificate_request = { certificate_arn; 
}

let make_remove_tags_from_certificate_request 
  ~(tags : tag list) ~(certificate_arn : string) ()
: remove_tags_from_certificate_request = { tags; certificate_arn; 
}

let make_expiry_events_configuration  ?(days_before_expiry : int option) ()
: expiry_events_configuration = { days_before_expiry; 
}

let make_put_account_configuration_request 
  ?(expiry_events : expiry_events_configuration option)
  ~(idempotency_token : string)
  () : put_account_configuration_request = {
  idempotency_token; expiry_events; 
}

let make_list_tags_for_certificate_response  ?(tags : tag list option) ()
: list_tags_for_certificate_response = { tags; 
}

let make_list_tags_for_certificate_request  ~(certificate_arn : string) ()
: list_tags_for_certificate_request = { certificate_arn; 
}

let make_certificate_summary 
  ?(revoked_at : float option)
  ?(imported_at : float option)
  ?(issued_at : float option)
  ?(created_at : float option)
  ?(not_after : float option)
  ?(not_before : float option)
  ?(renewal_eligibility : renewal_eligibility option)
  ?(exported : bool option)
  ?(in_use : bool option)
  ?(extended_key_usages : extended_key_usage_name list option)
  ?(key_usages : key_usage_name list option)
  ?(key_algorithm : key_algorithm option)
  ?(type_ : certificate_type option)
  ?(status : certificate_status option)
  ?(has_additional_subject_alternative_names : bool option)
  ?(subject_alternative_name_summaries : string list option)
  ?(domain_name : string option)
  ?(certificate_arn : string option)
  () : certificate_summary = {
  revoked_at;
  imported_at;
  issued_at;
  created_at;
  not_after;
  not_before;
  renewal_eligibility;
  exported;
  in_use;
  extended_key_usages;
  key_usages;
  key_algorithm;
  type_;
  status;
  has_additional_subject_alternative_names;
  subject_alternative_name_summaries;
  domain_name;
  certificate_arn;
   }

let make_list_certificates_response 
  ?(certificate_summary_list : certificate_summary list option)
  ?(next_token : string option)
  () : list_certificates_response = { certificate_summary_list; next_token; 
}

let make_filters 
  ?(key_types : key_algorithm list option)
  ?(key_usage : key_usage_name list option)
  ?(extended_key_usage : extended_key_usage_name list option)
  () : filters = { key_types; key_usage; extended_key_usage; 
}

let make_list_certificates_request 
  ?(sort_order : sort_order option)
  ?(sort_by : sort_by option)
  ?(max_items : int option)
  ?(next_token : string option)
  ?(includes : filters option)
  ?(certificate_statuses : certificate_status list option)
  () : list_certificates_request = {
  sort_order; sort_by; max_items; next_token; includes; certificate_statuses; 
}

let make_key_usage  ?(name : key_usage_name option) () : key_usage = { 
name;  }

let make_import_certificate_response  ?(certificate_arn : string option) ()
: import_certificate_response = { certificate_arn; 
}

let make_import_certificate_request 
  ?(tags : tag list option)
  ?(certificate_chain : bytes option)
  ?(certificate_arn : string option)
  ~(private_key : bytes)
  ~(certificate : bytes)
  () : import_certificate_request = {
  tags; certificate_chain; private_key; certificate; certificate_arn; 
}

let make_get_certificate_response 
  ?(certificate_chain : string option) ?(certificate : string option) ()
: get_certificate_response = { certificate_chain; certificate; 
}

let make_get_certificate_request  ~(certificate_arn : string) ()
: get_certificate_request = { certificate_arn; 
}

let make_get_account_configuration_response 
  ?(expiry_events : expiry_events_configuration option) ()
: get_account_configuration_response = { expiry_events; 
}

let make_extended_key_usage 
  ?(oi_d : string option) ?(name : extended_key_usage_name option) ()
: extended_key_usage = { oi_d; name;  }

let make_export_certificate_response 
  ?(private_key : string option)
  ?(certificate_chain : string option)
  ?(certificate : string option)
  () : export_certificate_response = {
  private_key; certificate_chain; certificate; 
}

let make_export_certificate_request 
  ~(passphrase : bytes) ~(certificate_arn : string) ()
: export_certificate_request = { passphrase; certificate_arn; 
}

let make_certificate_detail 
  ?(options : certificate_options option)
  ?(renewal_eligibility : renewal_eligibility option)
  ?(certificate_authority_arn : string option)
  ?(extended_key_usages : extended_key_usage list option)
  ?(key_usages : key_usage list option)
  ?(renewal_summary : renewal_summary option)
  ?(type_ : certificate_type option)
  ?(failure_reason : failure_reason option)
  ?(in_use_by : string list option)
  ?(signature_algorithm : string option)
  ?(key_algorithm : key_algorithm option)
  ?(not_after : float option)
  ?(not_before : float option)
  ?(revocation_reason : revocation_reason option)
  ?(revoked_at : float option)
  ?(status : certificate_status option)
  ?(imported_at : float option)
  ?(issued_at : float option)
  ?(created_at : float option)
  ?(issuer : string option)
  ?(subject : string option)
  ?(serial : string option)
  ?(domain_validation_options : domain_validation list option)
  ?(subject_alternative_names : string list option)
  ?(domain_name : string option)
  ?(certificate_arn : string option)
  () : certificate_detail = {
  options;
  renewal_eligibility;
  certificate_authority_arn;
  extended_key_usages;
  key_usages;
  renewal_summary;
  type_;
  failure_reason;
  in_use_by;
  signature_algorithm;
  key_algorithm;
  not_after;
  not_before;
  revocation_reason;
  revoked_at;
  status;
  imported_at;
  issued_at;
  created_at;
  issuer;
  subject;
  serial;
  domain_validation_options;
  subject_alternative_names;
  domain_name;
  certificate_arn;
   }

let make_describe_certificate_response 
  ?(certificate : certificate_detail option) ()
: describe_certificate_response = { certificate; 
}

let make_describe_certificate_request  ~(certificate_arn : string) ()
: describe_certificate_request = { certificate_arn; 
}

let make_delete_certificate_request  ~(certificate_arn : string) ()
: delete_certificate_request = { certificate_arn; 
}

let make_add_tags_to_certificate_request 
  ~(tags : tag list) ~(certificate_arn : string) ()
: add_tags_to_certificate_request = { tags; certificate_arn; 
}

