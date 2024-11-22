open Smaws_Lib
let service =
  Service.{
    namespace = "acm";
    endpointPrefix = "acm";
    version = "2015-12-08";
    protocol = AwsJson_1_1
  };
type validation_method = | DNS
  | EMAIL

type validation_exception = {
  message: string option
}

type certificate_transparency_logging_preference = | DISABLED
  | ENABLED

type certificate_options = {
  certificate_transparency_logging_preference: certificate_transparency_logging_preference option
}

type update_certificate_options_request = {
  options: certificate_options;
  certificate_arn: string
}

type resource_not_found_exception = {
  message: string option
}

type limit_exceeded_exception = {
  message: string option
}

type invalid_state_exception = {
  message: string option
}

type invalid_arn_exception = {
  message: string option
}

type too_many_tags_exception = {
  message: string option
}

type throttling_exception = {
  message: string option
}

type tag_policy_exception = {
  message: string option
}

type tag = {
  value: string option;
  key: string
}

type sort_order = | DESCENDING
  | ASCENDING

type sort_by = | CREATED_AT

type revocation_reason = | A_A_COMPROMISE
  | PRIVILEGE_WITHDRAWN
  | REMOVE_FROM_CRL
  | CERTIFICATE_HOLD
  | CESSATION_OF_OPERATION
  | SUPERCEDED
  | AFFILIATION_CHANGED
  | CA_COMPROMISE
  | KEY_COMPROMISE
  | UNSPECIFIED

type record_type = | CNAME

type resource_record = {
  value: string;
  type_: record_type;
  name: string
}

type resource_in_use_exception = {
  message: string option
}

type resend_validation_email_request = {
  validation_domain: string;
  domain: string;
  certificate_arn: string
}

type invalid_domain_validation_options_exception = {
  message: string option
}

type request_in_progress_exception = {
  message: string option
}

type request_certificate_response = {
  certificate_arn: string option
}

type domain_validation_option = {
  validation_domain: string;
  domain_name: string
}

type key_algorithm = | EC_secp521r1
  | EC_secp384r1
  | EC_prime256v1
  | RSA_4096
  | RSA_3072
  | RSA_2048
  | RSA_1024

type request_certificate_request = {
  key_algorithm: key_algorithm option;
  tags: tag list option;
  certificate_authority_arn: string option;
  options: certificate_options option;
  domain_validation_options: domain_validation_option list option;
  idempotency_token: string option;
  subject_alternative_names: string list option;
  validation_method: validation_method option;
  domain_name: string
}

type invalid_tag_exception = {
  message: string option
}

type invalid_parameter_exception = {
  message: string option
}

type renewal_status = | FAILED
  | SUCCESS
  | PENDING_VALIDATION
  | PENDING_AUTO_RENEWAL

type domain_status = | FAILED
  | SUCCESS
  | PENDING_VALIDATION

type domain_validation = {
  validation_method: validation_method option;
  resource_record: resource_record option;
  validation_status: domain_status option;
  validation_domain: string option;
  validation_emails: string list option;
  domain_name: string
}

type failure_reason = | OTHER
  | SLR_NOT_FOUND
  | PCA_ACCESS_DENIED
  | PCA_INVALID_DURATION
  | PCA_INVALID_ARGS
  | PCA_RESOURCE_NOT_FOUND
  | PCA_NAME_CONSTRAINTS_VALIDATION
  | PCA_REQUEST_FAILED
  | PCA_INVALID_STATE
  | PCA_INVALID_ARN
  | PCA_LIMIT_EXCEEDED
  | CAA_ERROR
  | DOMAIN_VALIDATION_DENIED
  | INVALID_PUBLIC_DOMAIN
  | DOMAIN_NOT_ALLOWED
  | ADDITIONAL_VERIFICATION_REQUIRED
  | NO_AVAILABLE_CONTACTS

type renewal_summary = {
  updated_at: float;
  renewal_status_reason: failure_reason option;
  domain_validation_options: domain_validation list;
  renewal_status: renewal_status
}

type renewal_eligibility = | INELIGIBLE
  | ELIGIBLE

type renew_certificate_request = {
  certificate_arn: string
}

type remove_tags_from_certificate_request = {
  tags: tag list;
  certificate_arn: string
}

type expiry_events_configuration = {
  days_before_expiry: int option
}

type put_account_configuration_request = {
  idempotency_token: string;
  expiry_events: expiry_events_configuration option
}

type conflict_exception = {
  message: string option
}

type access_denied_exception = {
  message: string option
}

type list_tags_for_certificate_response = {
  tags: tag list option
}

type list_tags_for_certificate_request = {
  certificate_arn: string
}

type certificate_status = | FAILED
  | REVOKED
  | VALIDATION_TIMED_OUT
  | EXPIRED
  | INACTIVE
  | ISSUED
  | PENDING_VALIDATION

type certificate_type = | PRIVATE
  | AMAZON_ISSUED
  | IMPORTED

type key_usage_name = | CUSTOM
  | ANY
  | DECIPHER_ONLY
  | ENCHIPER_ONLY
  | CRL_SIGNING
  | CERTIFICATE_SIGNING
  | KEY_AGREEMENT
  | DATA_ENCIPHERMENT
  | KEY_ENCIPHERMENT
  | NON_REPUDATION
  | DIGITAL_SIGNATURE

type extended_key_usage_name = | CUSTOM
  | NONE
  | ANY
  | IPSEC_USER
  | IPSEC_TUNNEL
  | IPSEC_END_SYSTEM
  | OCSP_SIGNING
  | TIME_STAMPING
  | EMAIL_PROTECTION
  | CODE_SIGNING
  | TLS_WEB_CLIENT_AUTHENTICATION
  | TLS_WEB_SERVER_AUTHENTICATION

type certificate_summary = {
  revoked_at: float option;
  imported_at: float option;
  issued_at: float option;
  created_at: float option;
  not_after: float option;
  not_before: float option;
  renewal_eligibility: renewal_eligibility option;
  exported: bool option;
  in_use: bool option;
  extended_key_usages: extended_key_usage_name list option;
  key_usages: key_usage_name list option;
  key_algorithm: key_algorithm option;
  type_: certificate_type option;
  status: certificate_status option;
  has_additional_subject_alternative_names: bool option;
  subject_alternative_name_summaries: string list option;
  domain_name: string option;
  certificate_arn: string option
}

type list_certificates_response = {
  certificate_summary_list: certificate_summary list option;
  next_token: string option
}

type filters = {
  key_types: key_algorithm list option;
  key_usage: key_usage_name list option;
  extended_key_usage: extended_key_usage_name list option
}

type list_certificates_request = {
  sort_order: sort_order option;
  sort_by: sort_by option;
  max_items: int option;
  next_token: string option;
  includes: filters option;
  certificate_statuses: certificate_status list option
}

type invalid_args_exception = {
  message: string option
}

type key_usage = {
  name: key_usage_name option
}

type import_certificate_response = {
  certificate_arn: string option
}

type import_certificate_request = {
  tags: tag list option;
  certificate_chain: bytes option;
  private_key: bytes;
  certificate: bytes;
  certificate_arn: string option
}

type get_certificate_response = {
  certificate_chain: string option;
  certificate: string option
}

type get_certificate_request = {
  certificate_arn: string
}

type get_account_configuration_response = {
  expiry_events: expiry_events_configuration option
}

type extended_key_usage = {
  oi_d: string option;
  name: extended_key_usage_name option
}

type export_certificate_response = {
  private_key: string option;
  certificate_chain: string option;
  certificate: string option
}

type export_certificate_request = {
  passphrase: bytes;
  certificate_arn: string
}

type certificate_detail = {
  options: certificate_options option;
  renewal_eligibility: renewal_eligibility option;
  certificate_authority_arn: string option;
  extended_key_usages: extended_key_usage list option;
  key_usages: key_usage list option;
  renewal_summary: renewal_summary option;
  type_: certificate_type option;
  failure_reason: failure_reason option;
  in_use_by: string list option;
  signature_algorithm: string option;
  key_algorithm: key_algorithm option;
  not_after: float option;
  not_before: float option;
  revocation_reason: revocation_reason option;
  revoked_at: float option;
  status: certificate_status option;
  imported_at: float option;
  issued_at: float option;
  created_at: float option;
  issuer: string option;
  subject: string option;
  serial: string option;
  domain_validation_options: domain_validation list option;
  subject_alternative_names: string list option;
  domain_name: string option;
  certificate_arn: string option
}

type describe_certificate_response = {
  certificate: certificate_detail option
}

type describe_certificate_request = {
  certificate_arn: string
}

type delete_certificate_request = {
  certificate_arn: string
}

type add_tags_to_certificate_request = {
  tags: tag list;
  certificate_arn: string
}



type base_document = Json.t

