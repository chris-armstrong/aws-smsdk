open Smaws_Lib
val service : Service.descriptor

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

val make_certificate_options :
  ?certificate_transparency_logging_preference:certificate_transparency_logging_preference ->
  unit -> certificate_options

val make_update_certificate_options_request :
  options:certificate_options -> certificate_arn:string -> unit
-> update_certificate_options_request

val make_tag : ?value:string -> key:string -> unit
-> tag

val make_resource_record :
  value:string -> type_:record_type -> name:string -> unit
-> resource_record

val make_resend_validation_email_request :
  validation_domain:string -> domain:string -> certificate_arn:string -> unit
-> resend_validation_email_request

val make_request_certificate_response : ?certificate_arn:string -> unit
-> request_certificate_response

val make_domain_validation_option :
  validation_domain:string -> domain_name:string -> unit
-> domain_validation_option

val make_request_certificate_request :
  ?key_algorithm:key_algorithm ->
  ?tags:tag list ->
  ?certificate_authority_arn:string ->
  ?options:certificate_options ->
  ?domain_validation_options:domain_validation_option list ->
  ?idempotency_token:string ->
  ?subject_alternative_names:string list ->
  ?validation_method:validation_method ->
  domain_name:string ->
  unit -> request_certificate_request

val make_domain_validation :
  ?validation_method:validation_method ->
  ?resource_record:resource_record ->
  ?validation_status:domain_status ->
  ?validation_domain:string ->
  ?validation_emails:string list ->
  domain_name:string ->
  unit -> domain_validation

val make_renewal_summary :
  ?renewal_status_reason:failure_reason ->
  updated_at:float ->
  domain_validation_options:domain_validation list ->
  renewal_status:renewal_status ->
  unit -> renewal_summary

val make_renew_certificate_request : certificate_arn:string -> unit
-> renew_certificate_request

val make_remove_tags_from_certificate_request :
  tags:tag list -> certificate_arn:string -> unit
-> remove_tags_from_certificate_request

val make_expiry_events_configuration : ?days_before_expiry:int -> unit
-> expiry_events_configuration

val make_put_account_configuration_request :
  ?expiry_events:expiry_events_configuration ->
  idempotency_token:string ->
  unit
-> put_account_configuration_request

val make_list_tags_for_certificate_response : ?tags:tag list -> unit
-> list_tags_for_certificate_response

val make_list_tags_for_certificate_request : certificate_arn:string -> unit
-> list_tags_for_certificate_request

val make_certificate_summary :
  ?revoked_at:float ->
  ?imported_at:float ->
  ?issued_at:float ->
  ?created_at:float ->
  ?not_after:float ->
  ?not_before:float ->
  ?renewal_eligibility:renewal_eligibility ->
  ?exported:bool ->
  ?in_use:bool ->
  ?extended_key_usages:extended_key_usage_name list ->
  ?key_usages:key_usage_name list ->
  ?key_algorithm:key_algorithm ->
  ?type_:certificate_type ->
  ?status:certificate_status ->
  ?has_additional_subject_alternative_names:bool ->
  ?subject_alternative_name_summaries:string list ->
  ?domain_name:string ->
  ?certificate_arn:string ->
  unit -> certificate_summary

val make_list_certificates_response :
  ?certificate_summary_list:certificate_summary list ->
  ?next_token:string ->
  unit -> list_certificates_response

val make_filters :
  ?key_types:key_algorithm list ->
  ?key_usage:key_usage_name list ->
  ?extended_key_usage:extended_key_usage_name list ->
  unit -> filters

val make_list_certificates_request :
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?max_items:int ->
  ?next_token:string ->
  ?includes:filters ->
  ?certificate_statuses:certificate_status list ->
  unit -> list_certificates_request

val make_key_usage : ?name:key_usage_name -> unit
-> key_usage

val make_import_certificate_response : ?certificate_arn:string -> unit
-> import_certificate_response

val make_import_certificate_request :
  ?tags:tag list ->
  ?certificate_chain:bytes ->
  ?certificate_arn:string ->
  private_key:bytes ->
  certificate:bytes ->
  unit -> import_certificate_request

val make_get_certificate_response :
  ?certificate_chain:string -> ?certificate:string -> unit
-> get_certificate_response

val make_get_certificate_request : certificate_arn:string -> unit
-> get_certificate_request

val make_get_account_configuration_response :
  ?expiry_events:expiry_events_configuration -> unit
-> get_account_configuration_response

val make_extended_key_usage :
  ?oi_d:string -> ?name:extended_key_usage_name -> unit
-> extended_key_usage

val make_export_certificate_response :
  ?private_key:string ->
  ?certificate_chain:string ->
  ?certificate:string ->
  unit -> export_certificate_response

val make_export_certificate_request :
  passphrase:bytes -> certificate_arn:string -> unit
-> export_certificate_request

val make_certificate_detail :
  ?options:certificate_options ->
  ?renewal_eligibility:renewal_eligibility ->
  ?certificate_authority_arn:string ->
  ?extended_key_usages:extended_key_usage list ->
  ?key_usages:key_usage list ->
  ?renewal_summary:renewal_summary ->
  ?type_:certificate_type ->
  ?failure_reason:failure_reason ->
  ?in_use_by:string list ->
  ?signature_algorithm:string ->
  ?key_algorithm:key_algorithm ->
  ?not_after:float ->
  ?not_before:float ->
  ?revocation_reason:revocation_reason ->
  ?revoked_at:float ->
  ?status:certificate_status ->
  ?imported_at:float ->
  ?issued_at:float ->
  ?created_at:float ->
  ?issuer:string ->
  ?subject:string ->
  ?serial:string ->
  ?domain_validation_options:domain_validation list ->
  ?subject_alternative_names:string list ->
  ?domain_name:string ->
  ?certificate_arn:string ->
  unit -> certificate_detail

val make_describe_certificate_response :
  ?certificate:certificate_detail -> unit
-> describe_certificate_response

val make_describe_certificate_request : certificate_arn:string -> unit
-> describe_certificate_request

val make_delete_certificate_request : certificate_arn:string -> unit
-> delete_certificate_request

val make_add_tags_to_certificate_request :
  tags:tag list -> certificate_arn:string -> unit
-> add_tags_to_certificate_request

module UpdateCertificateOptions : sig
  val request :
    Smaws_Lib.Context.t ->
      update_certificate_options_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidStateException of invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ResendValidationEmail : sig
  val request :
    Smaws_Lib.Context.t ->
      resend_validation_email_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RequestCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      request_certificate_request ->
        (request_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidDomainValidationOptionsException of invalid_domain_validation_options_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TagPolicyException of tag_policy_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module RenewCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      renew_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RemoveTagsFromCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module PutAccountConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_account_configuration_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListTagsForCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_certificate_request ->
        (list_tags_for_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_certificates_request ->
        (list_certificates_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgsException of invalid_args_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ImportCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      import_certificate_request ->
        (import_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module GetCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_certificate_request ->
        (get_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `RequestInProgressException of request_in_progress_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetAccountConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_account_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ExportCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      export_certificate_request ->
        (export_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `RequestInProgressException of request_in_progress_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_certificate_request ->
        (describe_certificate_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InvalidArnException of invalid_arn_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module AddTagsToCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_certificate_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArnException of invalid_arn_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagException of invalid_tag_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TagPolicyException of tag_policy_exception
            | `ThrottlingException of throttling_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

