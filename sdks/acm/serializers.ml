open Smaws_Lib.Json.SerializeHelpers

open Types

let base_unit_to_yojson = unit_to_yojson

let validation_method_to_yojson = 
  fun (x: validation_method) -> match x with 
  | DNS -> `String "DNS"
    | EMAIL -> `String "EMAIL"
     

let validation_exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson validation_exception_message_to_yojson x.message));
       
  ])

let string__to_yojson = string_to_yojson

let validation_email_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let arn_to_yojson = string_to_yojson

let certificate_transparency_logging_preference_to_yojson = 
  fun (x: certificate_transparency_logging_preference) -> match x with 
  | DISABLED -> `String "DISABLED"
    | ENABLED -> `String "ENABLED"
     

let certificate_options_to_yojson = 
  fun (x: certificate_options) -> assoc_to_yojson(
    [(
         "CertificateTransparencyLoggingPreference",
         (option_to_yojson certificate_transparency_logging_preference_to_yojson x.certificate_transparency_logging_preference));
       
  ])

let update_certificate_options_request_to_yojson = 
  fun (x: update_certificate_options_request) -> assoc_to_yojson(
    [(
         "Options",
         (Some (certificate_options_to_yojson x.options)));
       (
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_state_exception_to_yojson = 
  fun (x: invalid_state_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_arn_exception_to_yojson = 
  fun (x: invalid_arn_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let too_many_tags_exception_to_yojson = 
  fun (x: too_many_tags_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let availability_error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson = 
  fun (x: throttling_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson availability_error_message_to_yojson x.message));
       
  ])

let tag_value_to_yojson = string_to_yojson

let tag_policy_exception_to_yojson = 
  fun (x: tag_policy_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let tag_key_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson tag_value_to_yojson x.value));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let t_stamp_to_yojson = timestamp_to_yojson

let sort_order_to_yojson = 
  fun (x: sort_order) -> match x with 
  | DESCENDING -> `String "DESCENDING"
    | ASCENDING -> `String "ASCENDING"
     

let sort_by_to_yojson = 
  fun (x: sort_by) -> match x with 
  | CREATED_AT -> `String "CREATED_AT"
     

let service_error_message_to_yojson = string_to_yojson

let revocation_reason_to_yojson = 
  fun (x: revocation_reason) -> match x with 
 
| A_A_COMPROMISE -> `String "A_A_COMPROMISE"
  | PRIVILEGE_WITHDRAWN -> `String "PRIVILEGE_WITHDRAWN"
  | REMOVE_FROM_CRL -> `String "REMOVE_FROM_CRL"
  | CERTIFICATE_HOLD -> `String "CERTIFICATE_HOLD"
  | CESSATION_OF_OPERATION -> `String "CESSATION_OF_OPERATION"
  | SUPERCEDED -> `String "SUPERCEDED"
  | AFFILIATION_CHANGED -> `String "AFFILIATION_CHANGED"
  | CA_COMPROMISE -> `String "CA_COMPROMISE"
  | KEY_COMPROMISE -> `String "KEY_COMPROMISE"
  | UNSPECIFIED -> `String "UNSPECIFIED"
   

let record_type_to_yojson = 
  fun (x: record_type) -> match x with 
  | CNAME -> `String "CNAME"
     

let resource_record_to_yojson = 
  fun (x: resource_record) -> assoc_to_yojson(
    [(
         "Value",
         (Some (string__to_yojson x.value)));
       (
         "Type",
         (Some (record_type_to_yojson x.type_)));
       (
         "Name",
         (Some (string__to_yojson x.name)));
       
  ])

let resource_in_use_exception_to_yojson = 
  fun (x: resource_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let domain_name_string_to_yojson = string_to_yojson

let resend_validation_email_request_to_yojson = 
  fun (x: resend_validation_email_request) -> assoc_to_yojson(
    [(
         "ValidationDomain",
         (Some (domain_name_string_to_yojson x.validation_domain)));
       (
         "Domain",
         (Some (domain_name_string_to_yojson x.domain)));
       (
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let invalid_domain_validation_options_exception_to_yojson = 
  fun (x: invalid_domain_validation_options_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let request_in_progress_exception_to_yojson = 
  fun (x: request_in_progress_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let request_certificate_response_to_yojson = 
  fun (x: request_certificate_response) -> assoc_to_yojson(
    [(
         "CertificateArn",
         (option_to_yojson arn_to_yojson x.certificate_arn));
       
  ])

let domain_list_to_yojson = 
  fun tree -> list_to_yojson domain_name_string_to_yojson tree

let idempotency_token_to_yojson = string_to_yojson

let domain_validation_option_to_yojson = 
  fun (x: domain_validation_option) -> assoc_to_yojson(
    [(
         "ValidationDomain",
         (Some (domain_name_string_to_yojson x.validation_domain)));
       (
         "DomainName",
         (Some (domain_name_string_to_yojson x.domain_name)));
       
  ])

let domain_validation_option_list_to_yojson = 
  fun tree -> list_to_yojson domain_validation_option_to_yojson tree

let pca_arn_to_yojson = string_to_yojson

let key_algorithm_to_yojson = 
  fun (x: key_algorithm) -> match x with 
 
| EC_secp521r1 -> `String "EC_secp521r1"
  | EC_secp384r1 -> `String "EC_secp384r1"
  | EC_prime256v1 -> `String "EC_prime256v1"
  | RSA_4096 -> `String "RSA_4096"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_2048 -> `String "RSA_2048"
  | RSA_1024 -> `String "RSA_1024"
   

let request_certificate_request_to_yojson = 
  fun (x: request_certificate_request) -> assoc_to_yojson(
    [(
         "KeyAlgorithm",
         (option_to_yojson key_algorithm_to_yojson x.key_algorithm));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "CertificateAuthorityArn",
         (option_to_yojson pca_arn_to_yojson x.certificate_authority_arn));
       (
         "Options",
         (option_to_yojson certificate_options_to_yojson x.options));
       (
         "DomainValidationOptions",
         (option_to_yojson domain_validation_option_list_to_yojson x.domain_validation_options));
       (
         "IdempotencyToken",
         (option_to_yojson idempotency_token_to_yojson x.idempotency_token));
       (
         "SubjectAlternativeNames",
         (option_to_yojson domain_list_to_yojson x.subject_alternative_names));
       (
         "ValidationMethod",
         (option_to_yojson validation_method_to_yojson x.validation_method));
       (
         "DomainName",
         (Some (domain_name_string_to_yojson x.domain_name)));
       
  ])

let invalid_tag_exception_to_yojson = 
  fun (x: invalid_tag_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_parameter_exception_to_yojson = 
  fun (x: invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let renewal_status_to_yojson = 
  fun (x: renewal_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"
  | PENDING_AUTO_RENEWAL -> `String "PENDING_AUTO_RENEWAL"
   

let domain_status_to_yojson = 
  fun (x: domain_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"
   

let domain_validation_to_yojson = 
  fun (x: domain_validation) -> assoc_to_yojson(
    [(
         "ValidationMethod",
         (option_to_yojson validation_method_to_yojson x.validation_method));
       (
         "ResourceRecord",
         (option_to_yojson resource_record_to_yojson x.resource_record));
       (
         "ValidationStatus",
         (option_to_yojson domain_status_to_yojson x.validation_status));
       (
         "ValidationDomain",
         (option_to_yojson domain_name_string_to_yojson x.validation_domain));
       (
         "ValidationEmails",
         (option_to_yojson validation_email_list_to_yojson x.validation_emails));
       (
         "DomainName",
         (Some (domain_name_string_to_yojson x.domain_name)));
       
  ])

let domain_validation_list_to_yojson = 
  fun tree -> list_to_yojson domain_validation_to_yojson tree

let failure_reason_to_yojson = 
  fun (x: failure_reason) -> match x with 
 
| OTHER -> `String "OTHER"
  | SLR_NOT_FOUND -> `String "SLR_NOT_FOUND"
  | PCA_ACCESS_DENIED -> `String "PCA_ACCESS_DENIED"
  | PCA_INVALID_DURATION -> `String "PCA_INVALID_DURATION"
  | PCA_INVALID_ARGS -> `String "PCA_INVALID_ARGS"
  | PCA_RESOURCE_NOT_FOUND -> `String "PCA_RESOURCE_NOT_FOUND"
  | PCA_NAME_CONSTRAINTS_VALIDATION -> `String "PCA_NAME_CONSTRAINTS_VALIDATION"
  | PCA_REQUEST_FAILED -> `String "PCA_REQUEST_FAILED"
  | PCA_INVALID_STATE -> `String "PCA_INVALID_STATE"
  | PCA_INVALID_ARN -> `String "PCA_INVALID_ARN"
  | PCA_LIMIT_EXCEEDED -> `String "PCA_LIMIT_EXCEEDED"
  | CAA_ERROR -> `String "CAA_ERROR"
  | DOMAIN_VALIDATION_DENIED -> `String "DOMAIN_VALIDATION_DENIED"
  | INVALID_PUBLIC_DOMAIN -> `String "INVALID_PUBLIC_DOMAIN"
  | DOMAIN_NOT_ALLOWED -> `String "DOMAIN_NOT_ALLOWED"
  | ADDITIONAL_VERIFICATION_REQUIRED -> `String "ADDITIONAL_VERIFICATION_REQUIRED"
  | NO_AVAILABLE_CONTACTS -> `String "NO_AVAILABLE_CONTACTS"
   

let renewal_summary_to_yojson = 
  fun (x: renewal_summary) -> assoc_to_yojson(
    [(
         "UpdatedAt",
         (Some (t_stamp_to_yojson x.updated_at)));
       (
         "RenewalStatusReason",
         (option_to_yojson failure_reason_to_yojson x.renewal_status_reason));
       (
         "DomainValidationOptions",
         (Some (domain_validation_list_to_yojson x.domain_validation_options)));
       (
         "RenewalStatus",
         (Some (renewal_status_to_yojson x.renewal_status)));
       
  ])

let renewal_eligibility_to_yojson = 
  fun (x: renewal_eligibility) -> match x with 
  | INELIGIBLE -> `String "INELIGIBLE"
    | ELIGIBLE -> `String "ELIGIBLE"
     

let renew_certificate_request_to_yojson = 
  fun (x: renew_certificate_request) -> assoc_to_yojson(
    [(
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let remove_tags_from_certificate_request_to_yojson = 
  fun (x: remove_tags_from_certificate_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let positive_integer_to_yojson = int_to_yojson

let expiry_events_configuration_to_yojson = 
  fun (x: expiry_events_configuration) -> assoc_to_yojson(
    [(
         "DaysBeforeExpiry",
         (option_to_yojson positive_integer_to_yojson x.days_before_expiry));
       
  ])

let put_account_configuration_request_to_yojson = 
  fun (x: put_account_configuration_request) -> assoc_to_yojson(
    [(
         "IdempotencyToken",
         (Some (idempotency_token_to_yojson x.idempotency_token)));
       (
         "ExpiryEvents",
         (option_to_yojson expiry_events_configuration_to_yojson x.expiry_events));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson service_error_message_to_yojson x.message));
       
  ])

let private_key_blob_to_yojson = blob_to_yojson

let private_key_to_yojson = string_to_yojson

let passphrase_blob_to_yojson = blob_to_yojson

let nullable_boolean_to_yojson = bool_to_yojson

let next_token_to_yojson = string_to_yojson

let max_items_to_yojson = int_to_yojson

let list_tags_for_certificate_response_to_yojson = 
  fun (x: list_tags_for_certificate_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_certificate_request_to_yojson = 
  fun (x: list_tags_for_certificate_request) -> assoc_to_yojson(
    [(
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let certificate_status_to_yojson = 
  fun (x: certificate_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | REVOKED -> `String "REVOKED"
  | VALIDATION_TIMED_OUT -> `String "VALIDATION_TIMED_OUT"
  | EXPIRED -> `String "EXPIRED"
  | INACTIVE -> `String "INACTIVE"
  | ISSUED -> `String "ISSUED"
  | PENDING_VALIDATION -> `String "PENDING_VALIDATION"
   

let certificate_type_to_yojson = 
  fun (x: certificate_type) -> match x with 
 
| PRIVATE -> `String "PRIVATE"
  | AMAZON_ISSUED -> `String "AMAZON_ISSUED"
  | IMPORTED -> `String "IMPORTED"
   

let key_usage_name_to_yojson = 
  fun (x: key_usage_name) -> match x with 
 
| CUSTOM -> `String "CUSTOM"
  | ANY -> `String "ANY"
  | DECIPHER_ONLY -> `String "DECIPHER_ONLY"
  | ENCHIPER_ONLY -> `String "ENCIPHER_ONLY"
  | CRL_SIGNING -> `String "CRL_SIGNING"
  | CERTIFICATE_SIGNING -> `String "CERTIFICATE_SIGNING"
  | KEY_AGREEMENT -> `String "KEY_AGREEMENT"
  | DATA_ENCIPHERMENT -> `String "DATA_ENCIPHERMENT"
  | KEY_ENCIPHERMENT -> `String "KEY_ENCIPHERMENT"
  | NON_REPUDATION -> `String "NON_REPUDIATION"
  | DIGITAL_SIGNATURE -> `String "DIGITAL_SIGNATURE"
   

let key_usage_names_to_yojson = 
  fun tree -> list_to_yojson key_usage_name_to_yojson tree

let extended_key_usage_name_to_yojson = 
  fun (x: extended_key_usage_name) -> match x with 
 
| CUSTOM -> `String "CUSTOM"
  | NONE -> `String "NONE"
  | ANY -> `String "ANY"
  | IPSEC_USER -> `String "IPSEC_USER"
  | IPSEC_TUNNEL -> `String "IPSEC_TUNNEL"
  | IPSEC_END_SYSTEM -> `String "IPSEC_END_SYSTEM"
  | OCSP_SIGNING -> `String "OCSP_SIGNING"
  | TIME_STAMPING -> `String "TIME_STAMPING"
  | EMAIL_PROTECTION -> `String "EMAIL_PROTECTION"
  | CODE_SIGNING -> `String "CODE_SIGNING"
  | TLS_WEB_CLIENT_AUTHENTICATION -> `String "TLS_WEB_CLIENT_AUTHENTICATION"
  | TLS_WEB_SERVER_AUTHENTICATION -> `String "TLS_WEB_SERVER_AUTHENTICATION"
   

let extended_key_usage_names_to_yojson = 
  fun tree -> list_to_yojson extended_key_usage_name_to_yojson tree

let certificate_summary_to_yojson = 
  fun (x: certificate_summary) -> assoc_to_yojson(
    [(
         "RevokedAt",
         (option_to_yojson t_stamp_to_yojson x.revoked_at));
       (
         "ImportedAt",
         (option_to_yojson t_stamp_to_yojson x.imported_at));
       (
         "IssuedAt",
         (option_to_yojson t_stamp_to_yojson x.issued_at));
       (
         "CreatedAt",
         (option_to_yojson t_stamp_to_yojson x.created_at));
       (
         "NotAfter",
         (option_to_yojson t_stamp_to_yojson x.not_after));
       (
         "NotBefore",
         (option_to_yojson t_stamp_to_yojson x.not_before));
       (
         "RenewalEligibility",
         (option_to_yojson renewal_eligibility_to_yojson x.renewal_eligibility));
       (
         "Exported",
         (option_to_yojson nullable_boolean_to_yojson x.exported));
       (
         "InUse",
         (option_to_yojson nullable_boolean_to_yojson x.in_use));
       (
         "ExtendedKeyUsages",
         (option_to_yojson extended_key_usage_names_to_yojson x.extended_key_usages));
       (
         "KeyUsages",
         (option_to_yojson key_usage_names_to_yojson x.key_usages));
       (
         "KeyAlgorithm",
         (option_to_yojson key_algorithm_to_yojson x.key_algorithm));
       (
         "Type",
         (option_to_yojson certificate_type_to_yojson x.type_));
       (
         "Status",
         (option_to_yojson certificate_status_to_yojson x.status));
       (
         "HasAdditionalSubjectAlternativeNames",
         (option_to_yojson nullable_boolean_to_yojson x.has_additional_subject_alternative_names));
       (
         "SubjectAlternativeNameSummaries",
         (option_to_yojson domain_list_to_yojson x.subject_alternative_name_summaries));
       (
         "DomainName",
         (option_to_yojson domain_name_string_to_yojson x.domain_name));
       (
         "CertificateArn",
         (option_to_yojson arn_to_yojson x.certificate_arn));
       
  ])

let certificate_summary_list_to_yojson = 
  fun tree -> list_to_yojson certificate_summary_to_yojson tree

let list_certificates_response_to_yojson = 
  fun (x: list_certificates_response) -> assoc_to_yojson(
    [(
         "CertificateSummaryList",
         (option_to_yojson certificate_summary_list_to_yojson x.certificate_summary_list));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let certificate_statuses_to_yojson = 
  fun tree -> list_to_yojson certificate_status_to_yojson tree

let extended_key_usage_filter_list_to_yojson = 
  fun tree -> list_to_yojson extended_key_usage_name_to_yojson tree

let key_usage_filter_list_to_yojson = 
  fun tree -> list_to_yojson key_usage_name_to_yojson tree

let key_algorithm_list_to_yojson = 
  fun tree -> list_to_yojson key_algorithm_to_yojson tree

let filters_to_yojson = 
  fun (x: filters) -> assoc_to_yojson(
    [(
         "keyTypes",
         (option_to_yojson key_algorithm_list_to_yojson x.key_types));
       (
         "keyUsage",
         (option_to_yojson key_usage_filter_list_to_yojson x.key_usage));
       (
         "extendedKeyUsage",
         (option_to_yojson extended_key_usage_filter_list_to_yojson x.extended_key_usage));
       
  ])

let list_certificates_request_to_yojson = 
  fun (x: list_certificates_request) -> assoc_to_yojson(
    [(
         "SortOrder",
         (option_to_yojson sort_order_to_yojson x.sort_order));
       (
         "SortBy",
         (option_to_yojson sort_by_to_yojson x.sort_by));
       (
         "MaxItems",
         (option_to_yojson max_items_to_yojson x.max_items));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Includes",
         (option_to_yojson filters_to_yojson x.includes));
       (
         "CertificateStatuses",
         (option_to_yojson certificate_statuses_to_yojson x.certificate_statuses));
       
  ])

let invalid_args_exception_to_yojson = 
  fun (x: invalid_args_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let key_usage_to_yojson = 
  fun (x: key_usage) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson key_usage_name_to_yojson x.name));
       
  ])

let key_usage_list_to_yojson = 
  fun tree -> list_to_yojson key_usage_to_yojson tree

let in_use_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let import_certificate_response_to_yojson = 
  fun (x: import_certificate_response) -> assoc_to_yojson(
    [(
         "CertificateArn",
         (option_to_yojson arn_to_yojson x.certificate_arn));
       
  ])

let certificate_body_blob_to_yojson = blob_to_yojson

let certificate_chain_blob_to_yojson = blob_to_yojson

let import_certificate_request_to_yojson = 
  fun (x: import_certificate_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "CertificateChain",
         (option_to_yojson certificate_chain_blob_to_yojson x.certificate_chain));
       (
         "PrivateKey",
         (Some (private_key_blob_to_yojson x.private_key)));
       (
         "Certificate",
         (Some (certificate_body_blob_to_yojson x.certificate)));
       (
         "CertificateArn",
         (option_to_yojson arn_to_yojson x.certificate_arn));
       
  ])

let certificate_body_to_yojson = string_to_yojson

let certificate_chain_to_yojson = string_to_yojson

let get_certificate_response_to_yojson = 
  fun (x: get_certificate_response) -> assoc_to_yojson(
    [(
         "CertificateChain",
         (option_to_yojson certificate_chain_to_yojson x.certificate_chain));
       (
         "Certificate",
         (option_to_yojson certificate_body_to_yojson x.certificate));
       
  ])

let get_certificate_request_to_yojson = 
  fun (x: get_certificate_request) -> assoc_to_yojson(
    [(
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let get_account_configuration_response_to_yojson = 
  fun (x: get_account_configuration_response) -> assoc_to_yojson(
    [(
         "ExpiryEvents",
         (option_to_yojson expiry_events_configuration_to_yojson x.expiry_events));
       
  ])

let extended_key_usage_to_yojson = 
  fun (x: extended_key_usage) -> assoc_to_yojson(
    [(
         "OID",
         (option_to_yojson string__to_yojson x.oi_d));
       (
         "Name",
         (option_to_yojson extended_key_usage_name_to_yojson x.name));
       
  ])

let extended_key_usage_list_to_yojson = 
  fun tree -> list_to_yojson extended_key_usage_to_yojson tree

let export_certificate_response_to_yojson = 
  fun (x: export_certificate_response) -> assoc_to_yojson(
    [(
         "PrivateKey",
         (option_to_yojson private_key_to_yojson x.private_key));
       (
         "CertificateChain",
         (option_to_yojson certificate_chain_to_yojson x.certificate_chain));
       (
         "Certificate",
         (option_to_yojson certificate_body_to_yojson x.certificate));
       
  ])

let export_certificate_request_to_yojson = 
  fun (x: export_certificate_request) -> assoc_to_yojson(
    [(
         "Passphrase",
         (Some (passphrase_blob_to_yojson x.passphrase)));
       (
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let certificate_detail_to_yojson = 
  fun (x: certificate_detail) -> assoc_to_yojson(
    [(
         "Options",
         (option_to_yojson certificate_options_to_yojson x.options));
       (
         "RenewalEligibility",
         (option_to_yojson renewal_eligibility_to_yojson x.renewal_eligibility));
       (
         "CertificateAuthorityArn",
         (option_to_yojson arn_to_yojson x.certificate_authority_arn));
       (
         "ExtendedKeyUsages",
         (option_to_yojson extended_key_usage_list_to_yojson x.extended_key_usages));
       (
         "KeyUsages",
         (option_to_yojson key_usage_list_to_yojson x.key_usages));
       (
         "RenewalSummary",
         (option_to_yojson renewal_summary_to_yojson x.renewal_summary));
       (
         "Type",
         (option_to_yojson certificate_type_to_yojson x.type_));
       (
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "InUseBy",
         (option_to_yojson in_use_list_to_yojson x.in_use_by));
       (
         "SignatureAlgorithm",
         (option_to_yojson string__to_yojson x.signature_algorithm));
       (
         "KeyAlgorithm",
         (option_to_yojson key_algorithm_to_yojson x.key_algorithm));
       (
         "NotAfter",
         (option_to_yojson t_stamp_to_yojson x.not_after));
       (
         "NotBefore",
         (option_to_yojson t_stamp_to_yojson x.not_before));
       (
         "RevocationReason",
         (option_to_yojson revocation_reason_to_yojson x.revocation_reason));
       (
         "RevokedAt",
         (option_to_yojson t_stamp_to_yojson x.revoked_at));
       (
         "Status",
         (option_to_yojson certificate_status_to_yojson x.status));
       (
         "ImportedAt",
         (option_to_yojson t_stamp_to_yojson x.imported_at));
       (
         "IssuedAt",
         (option_to_yojson t_stamp_to_yojson x.issued_at));
       (
         "CreatedAt",
         (option_to_yojson t_stamp_to_yojson x.created_at));
       (
         "Issuer",
         (option_to_yojson string__to_yojson x.issuer));
       (
         "Subject",
         (option_to_yojson string__to_yojson x.subject));
       (
         "Serial",
         (option_to_yojson string__to_yojson x.serial));
       (
         "DomainValidationOptions",
         (option_to_yojson domain_validation_list_to_yojson x.domain_validation_options));
       (
         "SubjectAlternativeNames",
         (option_to_yojson domain_list_to_yojson x.subject_alternative_names));
       (
         "DomainName",
         (option_to_yojson domain_name_string_to_yojson x.domain_name));
       (
         "CertificateArn",
         (option_to_yojson arn_to_yojson x.certificate_arn));
       
  ])

let describe_certificate_response_to_yojson = 
  fun (x: describe_certificate_response) -> assoc_to_yojson(
    [(
         "Certificate",
         (option_to_yojson certificate_detail_to_yojson x.certificate));
       
  ])

let describe_certificate_request_to_yojson = 
  fun (x: describe_certificate_request) -> assoc_to_yojson(
    [(
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let delete_certificate_request_to_yojson = 
  fun (x: delete_certificate_request) -> assoc_to_yojson(
    [(
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let add_tags_to_certificate_request_to_yojson = 
  fun (x: add_tags_to_certificate_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "CertificateArn",
         (Some (arn_to_yojson x.certificate_arn)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

