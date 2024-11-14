open Smaws_Lib.Json.DeserializeHelpers

open Types

let base_unit_of_yojson = unit_of_yojson

let validation_method_of_yojson = 
  fun (tree: t) path : validation_method -> match tree with 
    | `String "DNS" -> DNS
    | `String "EMAIL" -> EMAIL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ValidationMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationMethod")

let validation_exception_message_of_yojson = string_of_yojson

let validation_exception_of_yojson = 
  fun tree path : validation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : validation_exception = {
    message = option_of_yojson (value_for_key (validation_exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let string__of_yojson = string_of_yojson

let validation_email_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let arn_of_yojson = string_of_yojson

let certificate_transparency_logging_preference_of_yojson = 
  fun (tree: t) path : certificate_transparency_logging_preference -> match tree with 
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateTransparencyLoggingPreference" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateTransparencyLoggingPreference")

let certificate_options_of_yojson = 
  fun tree path : certificate_options ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate_options = {
    certificate_transparency_logging_preference = option_of_yojson (value_for_key (certificate_transparency_logging_preference_of_yojson) "CertificateTransparencyLoggingPreference") _list path;
    
  }
  in _res

let update_certificate_options_request_of_yojson = 
  fun tree path : update_certificate_options_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_certificate_options_request = {
    options = value_for_key (certificate_options_of_yojson) "Options" _list path;
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let limit_exceeded_exception_of_yojson = 
  fun tree path : limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_state_exception_of_yojson = 
  fun tree path : invalid_state_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_state_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_arn_exception_of_yojson = 
  fun tree path : invalid_arn_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_arn_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let too_many_tags_exception_of_yojson = 
  fun tree path : too_many_tags_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : too_many_tags_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let availability_error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson = 
  fun tree path : throttling_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : throttling_exception = {
    message = option_of_yojson (value_for_key (availability_error_message_of_yojson) "message") _list path;
    
  }
  in _res

let tag_value_of_yojson = string_of_yojson

let tag_policy_exception_of_yojson = 
  fun tree path : tag_policy_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_policy_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let tag_key_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = option_of_yojson (value_for_key (tag_value_of_yojson) "Value") _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let t_stamp_of_yojson = timestamp_of_yojson

let sort_order_of_yojson = 
  fun (tree: t) path : sort_order -> match tree with 
    | `String "DESCENDING" -> DESCENDING
    | `String "ASCENDING" -> ASCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")

let sort_by_of_yojson = 
  fun (tree: t) path : sort_by -> match tree with 
    | `String "CREATED_AT" -> CREATED_AT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "SortBy")

let service_error_message_of_yojson = string_of_yojson

let revocation_reason_of_yojson = 
  fun (tree: t) path : revocation_reason -> match tree with 
    | `String "A_A_COMPROMISE" -> A_A_COMPROMISE
    | `String "PRIVILEGE_WITHDRAWN" -> PRIVILEGE_WITHDRAWN
    | `String "REMOVE_FROM_CRL" -> REMOVE_FROM_CRL
    | `String "CERTIFICATE_HOLD" -> CERTIFICATE_HOLD
    | `String "CESSATION_OF_OPERATION" -> CESSATION_OF_OPERATION
    | `String "SUPERCEDED" -> SUPERCEDED
    | `String "AFFILIATION_CHANGED" -> AFFILIATION_CHANGED
    | `String "CA_COMPROMISE" -> CA_COMPROMISE
    | `String "KEY_COMPROMISE" -> KEY_COMPROMISE
    | `String "UNSPECIFIED" -> UNSPECIFIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RevocationReason" value)
    | _ -> raise (deserialize_wrong_type_error path "RevocationReason")

let record_type_of_yojson = 
  fun (tree: t) path : record_type -> match tree with 
    | `String "CNAME" -> CNAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordType")

let resource_record_of_yojson = 
  fun tree path : resource_record ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_record = {
    value = value_for_key (string__of_yojson) "Value" _list path;
    type_ = value_for_key (record_type_of_yojson) "Type" _list path;
    name = value_for_key (string__of_yojson) "Name" _list path;
    
  }
  in _res

let resource_in_use_exception_of_yojson = 
  fun tree path : resource_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_in_use_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let domain_name_string_of_yojson = string_of_yojson

let resend_validation_email_request_of_yojson = 
  fun tree path : resend_validation_email_request ->
  let _list = assoc_of_yojson tree path in
  let _res : resend_validation_email_request = {
    validation_domain = value_for_key (domain_name_string_of_yojson) "ValidationDomain" _list path;
    domain = value_for_key (domain_name_string_of_yojson) "Domain" _list path;
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let invalid_domain_validation_options_exception_of_yojson = 
  fun tree path : invalid_domain_validation_options_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_domain_validation_options_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let request_in_progress_exception_of_yojson = 
  fun tree path : request_in_progress_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : request_in_progress_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let request_certificate_response_of_yojson = 
  fun tree path : request_certificate_response ->
  let _list = assoc_of_yojson tree path in
  let _res : request_certificate_response = {
    certificate_arn = option_of_yojson (value_for_key (arn_of_yojson) "CertificateArn") _list path;
    
  }
  in _res

let domain_list_of_yojson = 
  fun tree path -> list_of_yojson domain_name_string_of_yojson tree path 

let idempotency_token_of_yojson = string_of_yojson

let domain_validation_option_of_yojson = 
  fun tree path : domain_validation_option ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_validation_option = {
    validation_domain = value_for_key (domain_name_string_of_yojson) "ValidationDomain" _list path;
    domain_name = value_for_key (domain_name_string_of_yojson) "DomainName" _list path;
    
  }
  in _res

let domain_validation_option_list_of_yojson = 
  fun tree path -> list_of_yojson domain_validation_option_of_yojson tree path 

let pca_arn_of_yojson = string_of_yojson

let key_algorithm_of_yojson = 
  fun (tree: t) path : key_algorithm -> match tree with 
    | `String "EC_secp521r1" -> EC_secp521r1
    | `String "EC_secp384r1" -> EC_secp384r1
    | `String "EC_prime256v1" -> EC_prime256v1
    | `String "RSA_4096" -> RSA_4096
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_2048" -> RSA_2048
    | `String "RSA_1024" -> RSA_1024
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyAlgorithm" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyAlgorithm")

let request_certificate_request_of_yojson = 
  fun tree path : request_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : request_certificate_request = {
    key_algorithm = option_of_yojson (value_for_key (key_algorithm_of_yojson) "KeyAlgorithm") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    certificate_authority_arn = option_of_yojson (value_for_key (pca_arn_of_yojson) "CertificateAuthorityArn") _list path;
    options = option_of_yojson (value_for_key (certificate_options_of_yojson) "Options") _list path;
    domain_validation_options = option_of_yojson (value_for_key (domain_validation_option_list_of_yojson) "DomainValidationOptions") _list path;
    idempotency_token = option_of_yojson (value_for_key (idempotency_token_of_yojson) "IdempotencyToken") _list path;
    subject_alternative_names = option_of_yojson (value_for_key (domain_list_of_yojson) "SubjectAlternativeNames") _list path;
    validation_method = option_of_yojson (value_for_key (validation_method_of_yojson) "ValidationMethod") _list path;
    domain_name = value_for_key (domain_name_string_of_yojson) "DomainName" _list path;
    
  }
  in _res

let invalid_tag_exception_of_yojson = 
  fun tree path : invalid_tag_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_tag_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_parameter_exception_of_yojson = 
  fun tree path : invalid_parameter_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let renewal_status_of_yojson = 
  fun (tree: t) path : renewal_status -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String "PENDING_AUTO_RENEWAL" -> PENDING_AUTO_RENEWAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "RenewalStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RenewalStatus")

let domain_status_of_yojson = 
  fun (tree: t) path : domain_status -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "DomainStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainStatus")

let domain_validation_of_yojson = 
  fun tree path : domain_validation ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_validation = {
    validation_method = option_of_yojson (value_for_key (validation_method_of_yojson) "ValidationMethod") _list path;
    resource_record = option_of_yojson (value_for_key (resource_record_of_yojson) "ResourceRecord") _list path;
    validation_status = option_of_yojson (value_for_key (domain_status_of_yojson) "ValidationStatus") _list path;
    validation_domain = option_of_yojson (value_for_key (domain_name_string_of_yojson) "ValidationDomain") _list path;
    validation_emails = option_of_yojson (value_for_key (validation_email_list_of_yojson) "ValidationEmails") _list path;
    domain_name = value_for_key (domain_name_string_of_yojson) "DomainName" _list path;
    
  }
  in _res

let domain_validation_list_of_yojson = 
  fun tree path -> list_of_yojson domain_validation_of_yojson tree path 

let failure_reason_of_yojson = 
  fun (tree: t) path : failure_reason -> match tree with 
    | `String "OTHER" -> OTHER
    | `String "SLR_NOT_FOUND" -> SLR_NOT_FOUND
    | `String "PCA_ACCESS_DENIED" -> PCA_ACCESS_DENIED
    | `String "PCA_INVALID_DURATION" -> PCA_INVALID_DURATION
    | `String "PCA_INVALID_ARGS" -> PCA_INVALID_ARGS
    | `String "PCA_RESOURCE_NOT_FOUND" -> PCA_RESOURCE_NOT_FOUND
    | `String "PCA_NAME_CONSTRAINTS_VALIDATION" -> PCA_NAME_CONSTRAINTS_VALIDATION
    | `String "PCA_REQUEST_FAILED" -> PCA_REQUEST_FAILED
    | `String "PCA_INVALID_STATE" -> PCA_INVALID_STATE
    | `String "PCA_INVALID_ARN" -> PCA_INVALID_ARN
    | `String "PCA_LIMIT_EXCEEDED" -> PCA_LIMIT_EXCEEDED
    | `String "CAA_ERROR" -> CAA_ERROR
    | `String "DOMAIN_VALIDATION_DENIED" -> DOMAIN_VALIDATION_DENIED
    | `String "INVALID_PUBLIC_DOMAIN" -> INVALID_PUBLIC_DOMAIN
    | `String "DOMAIN_NOT_ALLOWED" -> DOMAIN_NOT_ALLOWED
    | `String "ADDITIONAL_VERIFICATION_REQUIRED" -> ADDITIONAL_VERIFICATION_REQUIRED
    | `String "NO_AVAILABLE_CONTACTS" -> NO_AVAILABLE_CONTACTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "FailureReason")

let renewal_summary_of_yojson = 
  fun tree path : renewal_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : renewal_summary = {
    updated_at = value_for_key (t_stamp_of_yojson) "UpdatedAt" _list path;
    renewal_status_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "RenewalStatusReason") _list path;
    domain_validation_options = value_for_key (domain_validation_list_of_yojson) "DomainValidationOptions" _list path;
    renewal_status = value_for_key (renewal_status_of_yojson) "RenewalStatus" _list path;
    
  }
  in _res

let renewal_eligibility_of_yojson = 
  fun (tree: t) path : renewal_eligibility -> match tree with 
    | `String "INELIGIBLE" -> INELIGIBLE
    | `String "ELIGIBLE" -> ELIGIBLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RenewalEligibility" value)
    | _ -> raise (deserialize_wrong_type_error path "RenewalEligibility")

let renew_certificate_request_of_yojson = 
  fun tree path : renew_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : renew_certificate_request = {
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let remove_tags_from_certificate_request_of_yojson = 
  fun tree path : remove_tags_from_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_tags_from_certificate_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let positive_integer_of_yojson = int_of_yojson

let expiry_events_configuration_of_yojson = 
  fun tree path : expiry_events_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : expiry_events_configuration = {
    days_before_expiry = option_of_yojson (value_for_key (positive_integer_of_yojson) "DaysBeforeExpiry") _list path;
    
  }
  in _res

let put_account_configuration_request_of_yojson = 
  fun tree path : put_account_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_account_configuration_request = {
    idempotency_token = value_for_key (idempotency_token_of_yojson) "IdempotencyToken" _list path;
    expiry_events = option_of_yojson (value_for_key (expiry_events_configuration_of_yojson) "ExpiryEvents") _list path;
    
  }
  in _res

let conflict_exception_of_yojson = 
  fun tree path : conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let access_denied_exception_of_yojson = 
  fun tree path : access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : access_denied_exception = {
    message = option_of_yojson (value_for_key (service_error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let private_key_blob_of_yojson = blob_of_yojson

let private_key_of_yojson = string_of_yojson

let passphrase_blob_of_yojson = blob_of_yojson

let nullable_boolean_of_yojson = bool_of_yojson

let next_token_of_yojson = string_of_yojson

let max_items_of_yojson = int_of_yojson

let list_tags_for_certificate_response_of_yojson = 
  fun tree path : list_tags_for_certificate_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_certificate_response = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_tags_for_certificate_request_of_yojson = 
  fun tree path : list_tags_for_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_certificate_request = {
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let certificate_status_of_yojson = 
  fun (tree: t) path : certificate_status -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "REVOKED" -> REVOKED
    | `String "VALIDATION_TIMED_OUT" -> VALIDATION_TIMED_OUT
    | `String "EXPIRED" -> EXPIRED
    | `String "INACTIVE" -> INACTIVE
    | `String "ISSUED" -> ISSUED
    | `String "PENDING_VALIDATION" -> PENDING_VALIDATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateStatus")

let certificate_type_of_yojson = 
  fun (tree: t) path : certificate_type -> match tree with 
    | `String "PRIVATE" -> PRIVATE
    | `String "AMAZON_ISSUED" -> AMAZON_ISSUED
    | `String "IMPORTED" -> IMPORTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateType")

let key_usage_name_of_yojson = 
  fun (tree: t) path : key_usage_name -> match tree with 
    | `String "CUSTOM" -> CUSTOM
    | `String "ANY" -> ANY
    | `String "DECIPHER_ONLY" -> DECIPHER_ONLY
    | `String "ENCIPHER_ONLY" -> ENCHIPER_ONLY
    | `String "CRL_SIGNING" -> CRL_SIGNING
    | `String "CERTIFICATE_SIGNING" -> CERTIFICATE_SIGNING
    | `String "KEY_AGREEMENT" -> KEY_AGREEMENT
    | `String "DATA_ENCIPHERMENT" -> DATA_ENCIPHERMENT
    | `String "KEY_ENCIPHERMENT" -> KEY_ENCIPHERMENT
    | `String "NON_REPUDIATION" -> NON_REPUDATION
    | `String "DIGITAL_SIGNATURE" -> DIGITAL_SIGNATURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyUsageName" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyUsageName")

let key_usage_names_of_yojson = 
  fun tree path -> list_of_yojson key_usage_name_of_yojson tree path 

let extended_key_usage_name_of_yojson = 
  fun (tree: t) path : extended_key_usage_name -> match tree with 
    | `String "CUSTOM" -> CUSTOM
    | `String "NONE" -> NONE
    | `String "ANY" -> ANY
    | `String "IPSEC_USER" -> IPSEC_USER
    | `String "IPSEC_TUNNEL" -> IPSEC_TUNNEL
    | `String "IPSEC_END_SYSTEM" -> IPSEC_END_SYSTEM
    | `String "OCSP_SIGNING" -> OCSP_SIGNING
    | `String "TIME_STAMPING" -> TIME_STAMPING
    | `String "EMAIL_PROTECTION" -> EMAIL_PROTECTION
    | `String "CODE_SIGNING" -> CODE_SIGNING
    | `String "TLS_WEB_CLIENT_AUTHENTICATION" -> TLS_WEB_CLIENT_AUTHENTICATION
    | `String "TLS_WEB_SERVER_AUTHENTICATION" -> TLS_WEB_SERVER_AUTHENTICATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExtendedKeyUsageName" value)
    | _ -> raise (deserialize_wrong_type_error path "ExtendedKeyUsageName")

let extended_key_usage_names_of_yojson = 
  fun tree path -> list_of_yojson extended_key_usage_name_of_yojson tree path 

let certificate_summary_of_yojson = 
  fun tree path : certificate_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate_summary = {
    revoked_at = option_of_yojson (value_for_key (t_stamp_of_yojson) "RevokedAt") _list path;
    imported_at = option_of_yojson (value_for_key (t_stamp_of_yojson) "ImportedAt") _list path;
    issued_at = option_of_yojson (value_for_key (t_stamp_of_yojson) "IssuedAt") _list path;
    created_at = option_of_yojson (value_for_key (t_stamp_of_yojson) "CreatedAt") _list path;
    not_after = option_of_yojson (value_for_key (t_stamp_of_yojson) "NotAfter") _list path;
    not_before = option_of_yojson (value_for_key (t_stamp_of_yojson) "NotBefore") _list path;
    renewal_eligibility = option_of_yojson (value_for_key (renewal_eligibility_of_yojson) "RenewalEligibility") _list path;
    exported = option_of_yojson (value_for_key (nullable_boolean_of_yojson) "Exported") _list path;
    in_use = option_of_yojson (value_for_key (nullable_boolean_of_yojson) "InUse") _list path;
    extended_key_usages = option_of_yojson (value_for_key (extended_key_usage_names_of_yojson) "ExtendedKeyUsages") _list path;
    key_usages = option_of_yojson (value_for_key (key_usage_names_of_yojson) "KeyUsages") _list path;
    key_algorithm = option_of_yojson (value_for_key (key_algorithm_of_yojson) "KeyAlgorithm") _list path;
    type_ = option_of_yojson (value_for_key (certificate_type_of_yojson) "Type") _list path;
    status = option_of_yojson (value_for_key (certificate_status_of_yojson) "Status") _list path;
    has_additional_subject_alternative_names = option_of_yojson (value_for_key (nullable_boolean_of_yojson) "HasAdditionalSubjectAlternativeNames") _list path;
    subject_alternative_name_summaries = option_of_yojson (value_for_key (domain_list_of_yojson) "SubjectAlternativeNameSummaries") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_string_of_yojson) "DomainName") _list path;
    certificate_arn = option_of_yojson (value_for_key (arn_of_yojson) "CertificateArn") _list path;
    
  }
  in _res

let certificate_summary_list_of_yojson = 
  fun tree path -> list_of_yojson certificate_summary_of_yojson tree path 

let list_certificates_response_of_yojson = 
  fun tree path : list_certificates_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_certificates_response = {
    certificate_summary_list = option_of_yojson (value_for_key (certificate_summary_list_of_yojson) "CertificateSummaryList") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let certificate_statuses_of_yojson = 
  fun tree path -> list_of_yojson certificate_status_of_yojson tree path 

let extended_key_usage_filter_list_of_yojson = 
  fun tree path -> list_of_yojson extended_key_usage_name_of_yojson tree path 

let key_usage_filter_list_of_yojson = 
  fun tree path -> list_of_yojson key_usage_name_of_yojson tree path 

let key_algorithm_list_of_yojson = 
  fun tree path -> list_of_yojson key_algorithm_of_yojson tree path 

let filters_of_yojson = 
  fun tree path : filters ->
  let _list = assoc_of_yojson tree path in
  let _res : filters = {
    key_types = option_of_yojson (value_for_key (key_algorithm_list_of_yojson) "keyTypes") _list path;
    key_usage = option_of_yojson (value_for_key (key_usage_filter_list_of_yojson) "keyUsage") _list path;
    extended_key_usage = option_of_yojson (value_for_key (extended_key_usage_filter_list_of_yojson) "extendedKeyUsage") _list path;
    
  }
  in _res

let list_certificates_request_of_yojson = 
  fun tree path : list_certificates_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_certificates_request = {
    sort_order = option_of_yojson (value_for_key (sort_order_of_yojson) "SortOrder") _list path;
    sort_by = option_of_yojson (value_for_key (sort_by_of_yojson) "SortBy") _list path;
    max_items = option_of_yojson (value_for_key (max_items_of_yojson) "MaxItems") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    includes = option_of_yojson (value_for_key (filters_of_yojson) "Includes") _list path;
    certificate_statuses = option_of_yojson (value_for_key (certificate_statuses_of_yojson) "CertificateStatuses") _list path;
    
  }
  in _res

let invalid_args_exception_of_yojson = 
  fun tree path : invalid_args_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_args_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let key_usage_of_yojson = 
  fun tree path : key_usage ->
  let _list = assoc_of_yojson tree path in
  let _res : key_usage = {
    name = option_of_yojson (value_for_key (key_usage_name_of_yojson) "Name") _list path;
    
  }
  in _res

let key_usage_list_of_yojson = 
  fun tree path -> list_of_yojson key_usage_of_yojson tree path 

let in_use_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let import_certificate_response_of_yojson = 
  fun tree path : import_certificate_response ->
  let _list = assoc_of_yojson tree path in
  let _res : import_certificate_response = {
    certificate_arn = option_of_yojson (value_for_key (arn_of_yojson) "CertificateArn") _list path;
    
  }
  in _res

let certificate_body_blob_of_yojson = blob_of_yojson

let certificate_chain_blob_of_yojson = blob_of_yojson

let import_certificate_request_of_yojson = 
  fun tree path : import_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : import_certificate_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    certificate_chain = option_of_yojson (value_for_key (certificate_chain_blob_of_yojson) "CertificateChain") _list path;
    private_key = value_for_key (private_key_blob_of_yojson) "PrivateKey" _list path;
    certificate = value_for_key (certificate_body_blob_of_yojson) "Certificate" _list path;
    certificate_arn = option_of_yojson (value_for_key (arn_of_yojson) "CertificateArn") _list path;
    
  }
  in _res

let certificate_body_of_yojson = string_of_yojson

let certificate_chain_of_yojson = string_of_yojson

let get_certificate_response_of_yojson = 
  fun tree path : get_certificate_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_certificate_response = {
    certificate_chain = option_of_yojson (value_for_key (certificate_chain_of_yojson) "CertificateChain") _list path;
    certificate = option_of_yojson (value_for_key (certificate_body_of_yojson) "Certificate") _list path;
    
  }
  in _res

let get_certificate_request_of_yojson = 
  fun tree path : get_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_certificate_request = {
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let get_account_configuration_response_of_yojson = 
  fun tree path : get_account_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_account_configuration_response = {
    expiry_events = option_of_yojson (value_for_key (expiry_events_configuration_of_yojson) "ExpiryEvents") _list path;
    
  }
  in _res

let extended_key_usage_of_yojson = 
  fun tree path : extended_key_usage ->
  let _list = assoc_of_yojson tree path in
  let _res : extended_key_usage = {
    oi_d = option_of_yojson (value_for_key (string__of_yojson) "OID") _list path;
    name = option_of_yojson (value_for_key (extended_key_usage_name_of_yojson) "Name") _list path;
    
  }
  in _res

let extended_key_usage_list_of_yojson = 
  fun tree path -> list_of_yojson extended_key_usage_of_yojson tree path 

let export_certificate_response_of_yojson = 
  fun tree path : export_certificate_response ->
  let _list = assoc_of_yojson tree path in
  let _res : export_certificate_response = {
    private_key = option_of_yojson (value_for_key (private_key_of_yojson) "PrivateKey") _list path;
    certificate_chain = option_of_yojson (value_for_key (certificate_chain_of_yojson) "CertificateChain") _list path;
    certificate = option_of_yojson (value_for_key (certificate_body_of_yojson) "Certificate") _list path;
    
  }
  in _res

let export_certificate_request_of_yojson = 
  fun tree path : export_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : export_certificate_request = {
    passphrase = value_for_key (passphrase_blob_of_yojson) "Passphrase" _list path;
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let certificate_detail_of_yojson = 
  fun tree path : certificate_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate_detail = {
    options = option_of_yojson (value_for_key (certificate_options_of_yojson) "Options") _list path;
    renewal_eligibility = option_of_yojson (value_for_key (renewal_eligibility_of_yojson) "RenewalEligibility") _list path;
    certificate_authority_arn = option_of_yojson (value_for_key (arn_of_yojson) "CertificateAuthorityArn") _list path;
    extended_key_usages = option_of_yojson (value_for_key (extended_key_usage_list_of_yojson) "ExtendedKeyUsages") _list path;
    key_usages = option_of_yojson (value_for_key (key_usage_list_of_yojson) "KeyUsages") _list path;
    renewal_summary = option_of_yojson (value_for_key (renewal_summary_of_yojson) "RenewalSummary") _list path;
    type_ = option_of_yojson (value_for_key (certificate_type_of_yojson) "Type") _list path;
    failure_reason = option_of_yojson (value_for_key (failure_reason_of_yojson) "FailureReason") _list path;
    in_use_by = option_of_yojson (value_for_key (in_use_list_of_yojson) "InUseBy") _list path;
    signature_algorithm = option_of_yojson (value_for_key (string__of_yojson) "SignatureAlgorithm") _list path;
    key_algorithm = option_of_yojson (value_for_key (key_algorithm_of_yojson) "KeyAlgorithm") _list path;
    not_after = option_of_yojson (value_for_key (t_stamp_of_yojson) "NotAfter") _list path;
    not_before = option_of_yojson (value_for_key (t_stamp_of_yojson) "NotBefore") _list path;
    revocation_reason = option_of_yojson (value_for_key (revocation_reason_of_yojson) "RevocationReason") _list path;
    revoked_at = option_of_yojson (value_for_key (t_stamp_of_yojson) "RevokedAt") _list path;
    status = option_of_yojson (value_for_key (certificate_status_of_yojson) "Status") _list path;
    imported_at = option_of_yojson (value_for_key (t_stamp_of_yojson) "ImportedAt") _list path;
    issued_at = option_of_yojson (value_for_key (t_stamp_of_yojson) "IssuedAt") _list path;
    created_at = option_of_yojson (value_for_key (t_stamp_of_yojson) "CreatedAt") _list path;
    issuer = option_of_yojson (value_for_key (string__of_yojson) "Issuer") _list path;
    subject = option_of_yojson (value_for_key (string__of_yojson) "Subject") _list path;
    serial = option_of_yojson (value_for_key (string__of_yojson) "Serial") _list path;
    domain_validation_options = option_of_yojson (value_for_key (domain_validation_list_of_yojson) "DomainValidationOptions") _list path;
    subject_alternative_names = option_of_yojson (value_for_key (domain_list_of_yojson) "SubjectAlternativeNames") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_string_of_yojson) "DomainName") _list path;
    certificate_arn = option_of_yojson (value_for_key (arn_of_yojson) "CertificateArn") _list path;
    
  }
  in _res

let describe_certificate_response_of_yojson = 
  fun tree path : describe_certificate_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_certificate_response = {
    certificate = option_of_yojson (value_for_key (certificate_detail_of_yojson) "Certificate") _list path;
    
  }
  in _res

let describe_certificate_request_of_yojson = 
  fun tree path : describe_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_certificate_request = {
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let delete_certificate_request_of_yojson = 
  fun tree path : delete_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_certificate_request = {
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let add_tags_to_certificate_request_of_yojson = 
  fun tree path : add_tags_to_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_tags_to_certificate_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    certificate_arn = value_for_key (arn_of_yojson) "CertificateArn" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

