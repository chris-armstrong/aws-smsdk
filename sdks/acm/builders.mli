open Types
val make_certificate_options :
  ?certificate_transparency_logging_preference:certificate_transparency_logging_preference ->
  unit
-> certificate_options
(** Create a {!type-certificate_options} type *)

val make_update_certificate_options_request :
  options:certificate_options -> certificate_arn:string -> unit
-> update_certificate_options_request
(** Create a {!type-update_certificate_options_request} type *)

val make_tag : ?value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_resource_record :
  value:string -> type_:record_type -> name:string -> unit
-> resource_record
(** Create a {!type-resource_record} type *)

val make_resend_validation_email_request :
  validation_domain:string -> domain:string -> certificate_arn:string -> unit
-> resend_validation_email_request
(** Create a {!type-resend_validation_email_request} type *)

val make_request_certificate_response : ?certificate_arn:string -> unit
-> request_certificate_response
(** Create a {!type-request_certificate_response} type *)

val make_domain_validation_option :
  validation_domain:string -> domain_name:string -> unit
-> domain_validation_option
(** Create a {!type-domain_validation_option} type *)

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
  unit
-> request_certificate_request
(** Create a {!type-request_certificate_request} type *)

val make_domain_validation :
  ?validation_method:validation_method ->
  ?resource_record:resource_record ->
  ?validation_status:domain_status ->
  ?validation_domain:string ->
  ?validation_emails:string list ->
  domain_name:string ->
  unit
-> domain_validation
(** Create a {!type-domain_validation} type *)

val make_renewal_summary :
  ?renewal_status_reason:failure_reason ->
  updated_at:float ->
  domain_validation_options:domain_validation list ->
  renewal_status:renewal_status ->
  unit
-> renewal_summary
(** Create a {!type-renewal_summary} type *)

val make_renew_certificate_request : certificate_arn:string -> unit
-> renew_certificate_request
(** Create a {!type-renew_certificate_request} type *)

val make_remove_tags_from_certificate_request :
  tags:tag list -> certificate_arn:string -> unit
-> remove_tags_from_certificate_request
(** Create a {!type-remove_tags_from_certificate_request} type *)

val make_expiry_events_configuration : ?days_before_expiry:int -> unit
-> expiry_events_configuration
(** Create a {!type-expiry_events_configuration} type *)

val make_put_account_configuration_request :
  ?expiry_events:expiry_events_configuration ->
  idempotency_token:string ->
  unit
-> put_account_configuration_request
(** Create a {!type-put_account_configuration_request} type *)

val make_list_tags_for_certificate_response : ?tags:tag list -> unit
-> list_tags_for_certificate_response
(** Create a {!type-list_tags_for_certificate_response} type *)

val make_list_tags_for_certificate_request : certificate_arn:string -> unit
-> list_tags_for_certificate_request
(** Create a {!type-list_tags_for_certificate_request} type *)

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
  unit
-> certificate_summary
(** Create a {!type-certificate_summary} type *)

val make_list_certificates_response :
  ?certificate_summary_list:certificate_summary list ->
  ?next_token:string ->
  unit
-> list_certificates_response
(** Create a {!type-list_certificates_response} type *)

val make_filters :
  ?key_types:key_algorithm list ->
  ?key_usage:key_usage_name list ->
  ?extended_key_usage:extended_key_usage_name list ->
  unit
-> filters
(** Create a {!type-filters} type *)

val make_list_certificates_request :
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?max_items:int ->
  ?next_token:string ->
  ?includes:filters ->
  ?certificate_statuses:certificate_status list ->
  unit
-> list_certificates_request
(** Create a {!type-list_certificates_request} type *)

val make_key_usage : ?name:key_usage_name -> unit
-> key_usage
(** Create a {!type-key_usage} type *)

val make_import_certificate_response : ?certificate_arn:string -> unit
-> import_certificate_response
(** Create a {!type-import_certificate_response} type *)

val make_import_certificate_request :
  ?tags:tag list ->
  ?certificate_chain:bytes ->
  ?certificate_arn:string ->
  private_key:bytes ->
  certificate:bytes ->
  unit
-> import_certificate_request
(** Create a {!type-import_certificate_request} type *)

val make_get_certificate_response :
  ?certificate_chain:string -> ?certificate:string -> unit
-> get_certificate_response
(** Create a {!type-get_certificate_response} type *)

val make_get_certificate_request : certificate_arn:string -> unit
-> get_certificate_request
(** Create a {!type-get_certificate_request} type *)

val make_get_account_configuration_response :
  ?expiry_events:expiry_events_configuration -> unit
-> get_account_configuration_response
(** Create a {!type-get_account_configuration_response} type *)

val make_extended_key_usage :
  ?oi_d:string -> ?name:extended_key_usage_name -> unit
-> extended_key_usage
(** Create a {!type-extended_key_usage} type *)

val make_export_certificate_response :
  ?private_key:string ->
  ?certificate_chain:string ->
  ?certificate:string ->
  unit
-> export_certificate_response
(** Create a {!type-export_certificate_response} type *)

val make_export_certificate_request :
  passphrase:bytes -> certificate_arn:string -> unit
-> export_certificate_request
(** Create a {!type-export_certificate_request} type *)

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
  unit
-> certificate_detail
(** Create a {!type-certificate_detail} type *)

val make_describe_certificate_response :
  ?certificate:certificate_detail -> unit
-> describe_certificate_response
(** Create a {!type-describe_certificate_response} type *)

val make_describe_certificate_request : certificate_arn:string -> unit
-> describe_certificate_request
(** Create a {!type-describe_certificate_request} type *)

val make_delete_certificate_request : certificate_arn:string -> unit
-> delete_certificate_request
(** Create a {!type-delete_certificate_request} type *)

val make_add_tags_to_certificate_request :
  tags:tag list -> certificate_arn:string -> unit
-> add_tags_to_certificate_request
(** Create a {!type-add_tags_to_certificate_request} type *)

