open Types
val make_update_user_response : unit
-> update_user_response
(** Create a {!type-update_user_response} type *)

val make_update_user_request :
  ?office:string ->
  ?country:string ->
  ?department:string ->
  ?zip_code:string ->
  ?company:string ->
  ?city:string ->
  ?job_title:string ->
  ?street:string ->
  ?telephone:string ->
  ?initials:string ->
  ?hidden_from_global_address_list:bool ->
  ?last_name:string ->
  ?first_name:string ->
  ?display_name:string ->
  ?role:user_role ->
  user_id:string ->
  organization_id:string ->
  unit
-> update_user_request
(** Create a {!type-update_user_request} type *)

val make_update_resource_response : unit
-> update_resource_response
(** Create a {!type-update_resource_response} type *)

val make_booking_options :
  ?auto_decline_conflicting_requests:bool ->
  ?auto_decline_recurring_requests:bool ->
  ?auto_accept_requests:bool ->
  unit
-> booking_options
(** Create a {!type-booking_options} type *)

val make_update_resource_request :
  ?hidden_from_global_address_list:bool ->
  ?type_:resource_type ->
  ?description:string ->
  ?booking_options:booking_options ->
  ?name:string ->
  resource_id:string ->
  organization_id:string ->
  unit
-> update_resource_request
(** Create a {!type-update_resource_request} type *)

val make_update_primary_email_address_response : unit
-> update_primary_email_address_response
(** Create a {!type-update_primary_email_address_response} type *)

val make_update_primary_email_address_request :
  email:string -> entity_id:string -> organization_id:string -> unit
-> update_primary_email_address_request
(** Create a {!type-update_primary_email_address_request} type *)

val make_update_mobile_device_access_rule_response : unit
-> update_mobile_device_access_rule_response
(** Create a {!type-update_mobile_device_access_rule_response} type *)

val make_update_mobile_device_access_rule_request :
  ?not_device_user_agents:string list ->
  ?device_user_agents:string list ->
  ?not_device_operating_systems:string list ->
  ?device_operating_systems:string list ->
  ?not_device_models:string list ->
  ?device_models:string list ->
  ?not_device_types:string list ->
  ?device_types:string list ->
  ?description:string ->
  effect_:mobile_device_access_rule_effect ->
  name:string ->
  mobile_device_access_rule_id:string ->
  organization_id:string ->
  unit
-> update_mobile_device_access_rule_request
(** Create a {!type-update_mobile_device_access_rule_request} type *)

val make_update_mailbox_quota_response : unit
-> update_mailbox_quota_response
(** Create a {!type-update_mailbox_quota_response} type *)

val make_update_mailbox_quota_request :
  mailbox_quota:int -> user_id:string -> organization_id:string -> unit
-> update_mailbox_quota_request
(** Create a {!type-update_mailbox_quota_request} type *)

val make_update_impersonation_role_response : unit
-> update_impersonation_role_response
(** Create a {!type-update_impersonation_role_response} type *)

val make_impersonation_rule :
  ?not_target_users:string list ->
  ?target_users:string list ->
  ?description:string ->
  ?name:string ->
  effect_:access_effect ->
  impersonation_rule_id:string ->
  unit
-> impersonation_rule
(** Create a {!type-impersonation_rule} type *)

val make_update_impersonation_role_request :
  ?description:string ->
  rules:impersonation_rule list ->
  type_:impersonation_role_type ->
  name:string ->
  impersonation_role_id:string ->
  organization_id:string ->
  unit
-> update_impersonation_role_request
(** Create a {!type-update_impersonation_role_request} type *)

val make_update_group_response : unit
-> update_group_response
(** Create a {!type-update_group_response} type *)

val make_update_group_request :
  ?hidden_from_global_address_list:bool ->
  group_id:string ->
  organization_id:string ->
  unit
-> update_group_request
(** Create a {!type-update_group_request} type *)

val make_update_default_mail_domain_response : unit
-> update_default_mail_domain_response
(** Create a {!type-update_default_mail_domain_response} type *)

val make_update_default_mail_domain_request :
  domain_name:string -> organization_id:string -> unit
-> update_default_mail_domain_request
(** Create a {!type-update_default_mail_domain_request} type *)

val make_update_availability_configuration_response : unit
-> update_availability_configuration_response
(** Create a {!type-update_availability_configuration_response} type *)

val make_ews_availability_provider :
  ews_password:string -> ews_username:string -> ews_endpoint:string -> unit
-> ews_availability_provider
(** Create a {!type-ews_availability_provider} type *)

val make_lambda_availability_provider : lambda_arn:string -> unit
-> lambda_availability_provider
(** Create a {!type-lambda_availability_provider} type *)

val make_update_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:ews_availability_provider ->
  domain_name:string ->
  organization_id:string ->
  unit
-> update_availability_configuration_request
(** Create a {!type-update_availability_configuration_request} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_test_availability_configuration_response :
  ?failure_reason:string -> ?test_passed:bool -> unit
-> test_availability_configuration_response
(** Create a {!type-test_availability_configuration_response} type *)

val make_test_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:ews_availability_provider ->
  ?domain_name:string ->
  organization_id:string ->
  unit
-> test_availability_configuration_request
(** Create a {!type-test_availability_configuration_request} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_start_mailbox_export_job_response : ?job_id:string -> unit
-> start_mailbox_export_job_response
(** Create a {!type-start_mailbox_export_job_response} type *)

val make_start_mailbox_export_job_request :
  ?description:string ->
  s3_prefix:string ->
  s3_bucket_name:string ->
  kms_key_arn:string ->
  role_arn:string ->
  entity_id:string ->
  organization_id:string ->
  client_token:string ->
  unit
-> start_mailbox_export_job_request
(** Create a {!type-start_mailbox_export_job_request} type *)

val make_reset_password_response : unit
-> reset_password_response
(** Create a {!type-reset_password_response} type *)

val make_reset_password_request :
  password:string -> user_id:string -> organization_id:string -> unit
-> reset_password_request
(** Create a {!type-reset_password_request} type *)

val make_register_to_work_mail_response : unit
-> register_to_work_mail_response
(** Create a {!type-register_to_work_mail_response} type *)

val make_register_to_work_mail_request :
  email:string -> entity_id:string -> organization_id:string -> unit
-> register_to_work_mail_request
(** Create a {!type-register_to_work_mail_request} type *)

val make_register_mail_domain_response : unit
-> register_mail_domain_response
(** Create a {!type-register_mail_domain_response} type *)

val make_register_mail_domain_request :
  ?client_token:string ->
  domain_name:string ->
  organization_id:string ->
  unit
-> register_mail_domain_request
(** Create a {!type-register_mail_domain_request} type *)

val make_put_retention_policy_response : unit
-> put_retention_policy_response
(** Create a {!type-put_retention_policy_response} type *)

val make_folder_configuration :
  ?period:int -> action:retention_action -> name:folder_name -> unit
-> folder_configuration
(** Create a {!type-folder_configuration} type *)

val make_put_retention_policy_request :
  ?description:string ->
  ?id:string ->
  folder_configurations:folder_configuration list ->
  name:string ->
  organization_id:string ->
  unit
-> put_retention_policy_request
(** Create a {!type-put_retention_policy_request} type *)

val make_put_mobile_device_access_override_response : unit
-> put_mobile_device_access_override_response
(** Create a {!type-put_mobile_device_access_override_response} type *)

val make_put_mobile_device_access_override_request :
  ?description:string ->
  effect_:mobile_device_access_rule_effect ->
  device_id:string ->
  user_id:string ->
  organization_id:string ->
  unit
-> put_mobile_device_access_override_request
(** Create a {!type-put_mobile_device_access_override_request} type *)

val make_put_mailbox_permissions_response : unit
-> put_mailbox_permissions_response
(** Create a {!type-put_mailbox_permissions_response} type *)

val make_put_mailbox_permissions_request :
  permission_values:permission_type list ->
  grantee_id:string ->
  entity_id:string ->
  organization_id:string ->
  unit
-> put_mailbox_permissions_request
(** Create a {!type-put_mailbox_permissions_request} type *)

val make_put_inbound_dmarc_settings_response : unit
-> put_inbound_dmarc_settings_response
(** Create a {!type-put_inbound_dmarc_settings_response} type *)

val make_put_inbound_dmarc_settings_request :
  enforced:bool -> organization_id:string -> unit
-> put_inbound_dmarc_settings_request
(** Create a {!type-put_inbound_dmarc_settings_request} type *)

val make_put_email_monitoring_configuration_response : unit
-> put_email_monitoring_configuration_response
(** Create a {!type-put_email_monitoring_configuration_response} type *)

val make_put_email_monitoring_configuration_request :
  log_group_arn:string -> role_arn:string -> organization_id:string -> unit
-> put_email_monitoring_configuration_request
(** Create a {!type-put_email_monitoring_configuration_request} type *)

val make_put_access_control_rule_response : unit
-> put_access_control_rule_response
(** Create a {!type-put_access_control_rule_response} type *)

val make_put_access_control_rule_request :
  ?not_impersonation_role_ids:string list ->
  ?impersonation_role_ids:string list ->
  ?not_user_ids:string list ->
  ?user_ids:string list ->
  ?not_actions:string list ->
  ?actions:string list ->
  ?not_ip_ranges:string list ->
  ?ip_ranges:string list ->
  organization_id:string ->
  description:string ->
  effect_:access_control_rule_effect ->
  name:string ->
  unit
-> put_access_control_rule_request
(** Create a {!type-put_access_control_rule_request} type *)

val make_user :
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?user_role:user_role ->
  ?state:entity_state ->
  ?display_name:string ->
  ?name:string ->
  ?email:string ->
  ?id:string ->
  unit -> user
(** Create a {!type-user} type *)

val make_list_users_response : ?next_token:string -> ?users:user list -> unit
-> list_users_response
(** Create a {!type-list_users_response} type *)

val make_list_users_filters :
  ?state:entity_state ->
  ?primary_email_prefix:string ->
  ?display_name_prefix:string ->
  ?username_prefix:string ->
  unit
-> list_users_filters
(** Create a {!type-list_users_filters} type *)

val make_list_users_request :
  ?filters:list_users_filters ->
  ?max_results:int ->
  ?next_token:string ->
  organization_id:string ->
  unit
-> list_users_request
(** Create a {!type-list_users_request} type *)

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_resource :
  ?description:string ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?type_:resource_type ->
  ?name:string ->
  ?email:string ->
  ?id:string ->
  unit
-> resource
(** Create a {!type-resource} type *)

val make_list_resources_response :
  ?next_token:string -> ?resources:resource list -> unit
-> list_resources_response
(** Create a {!type-list_resources_response} type *)

val make_list_resources_filters :
  ?state:entity_state ->
  ?primary_email_prefix:string ->
  ?name_prefix:string ->
  unit
-> list_resources_filters
(** Create a {!type-list_resources_filters} type *)

val make_list_resources_request :
  ?filters:list_resources_filters ->
  ?max_results:int ->
  ?next_token:string ->
  organization_id:string ->
  unit
-> list_resources_request
(** Create a {!type-list_resources_request} type *)

val make_delegate : type_:member_type -> id:string -> unit
-> delegate
(** Create a {!type-delegate} type *)

val make_list_resource_delegates_response :
  ?next_token:string -> ?delegates:delegate list -> unit
-> list_resource_delegates_response
(** Create a {!type-list_resource_delegates_response} type *)

val make_list_resource_delegates_request :
  ?max_results:int ->
  ?next_token:string ->
  resource_id:string ->
  organization_id:string ->
  unit
-> list_resource_delegates_request
(** Create a {!type-list_resource_delegates_request} type *)

val make_organization_summary :
  ?state:string ->
  ?error_message:string ->
  ?default_mail_domain:string ->
  ?alias:string ->
  ?organization_id:string ->
  unit
-> organization_summary
(** Create a {!type-organization_summary} type *)

val make_list_organizations_response :
  ?next_token:string ->
  ?organization_summaries:organization_summary list ->
  unit
-> list_organizations_response
(** Create a {!type-list_organizations_response} type *)

val make_list_organizations_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_organizations_request
(** Create a {!type-list_organizations_request} type *)

val make_mobile_device_access_rule :
  ?date_modified:float ->
  ?date_created:float ->
  ?not_device_user_agents:string list ->
  ?device_user_agents:string list ->
  ?not_device_operating_systems:string list ->
  ?device_operating_systems:string list ->
  ?not_device_models:string list ->
  ?device_models:string list ->
  ?not_device_types:string list ->
  ?device_types:string list ->
  ?effect_:mobile_device_access_rule_effect ->
  ?description:string ->
  ?name:string ->
  ?mobile_device_access_rule_id:string ->
  unit
-> mobile_device_access_rule
(** Create a {!type-mobile_device_access_rule} type *)

val make_list_mobile_device_access_rules_response :
  ?rules:mobile_device_access_rule list -> unit
-> list_mobile_device_access_rules_response
(** Create a {!type-list_mobile_device_access_rules_response} type *)

val make_list_mobile_device_access_rules_request :
  organization_id:string -> unit
-> list_mobile_device_access_rules_request
(** Create a {!type-list_mobile_device_access_rules_request} type *)

val make_mobile_device_access_override :
  ?date_modified:float ->
  ?date_created:float ->
  ?description:string ->
  ?effect_:mobile_device_access_rule_effect ->
  ?device_id:string ->
  ?user_id:string ->
  unit
-> mobile_device_access_override
(** Create a {!type-mobile_device_access_override} type *)

val make_list_mobile_device_access_overrides_response :
  ?next_token:string -> ?overrides:mobile_device_access_override list -> unit
-> list_mobile_device_access_overrides_response
(** Create a {!type-list_mobile_device_access_overrides_response} type *)

val make_list_mobile_device_access_overrides_request :
  ?max_results:int ->
  ?next_token:string ->
  ?device_id:string ->
  ?user_id:string ->
  organization_id:string ->
  unit
-> list_mobile_device_access_overrides_request
(** Create a {!type-list_mobile_device_access_overrides_request} type *)

val make_mail_domain_summary :
  ?default_domain:bool -> ?domain_name:string -> unit
-> mail_domain_summary
(** Create a {!type-mail_domain_summary} type *)

val make_list_mail_domains_response :
  ?next_token:string -> ?mail_domains:mail_domain_summary list -> unit
-> list_mail_domains_response
(** Create a {!type-list_mail_domains_response} type *)

val make_list_mail_domains_request :
  ?next_token:string -> ?max_results:int -> organization_id:string -> unit
-> list_mail_domains_request
(** Create a {!type-list_mail_domains_request} type *)

val make_permission :
  permission_values:permission_type list ->
  grantee_type:member_type ->
  grantee_id:string ->
  unit
-> permission
(** Create a {!type-permission} type *)

val make_list_mailbox_permissions_response :
  ?next_token:string -> ?permissions:permission list -> unit
-> list_mailbox_permissions_response
(** Create a {!type-list_mailbox_permissions_response} type *)

val make_list_mailbox_permissions_request :
  ?max_results:int ->
  ?next_token:string ->
  entity_id:string ->
  organization_id:string ->
  unit
-> list_mailbox_permissions_request
(** Create a {!type-list_mailbox_permissions_request} type *)

val make_mailbox_export_job :
  ?end_time:float ->
  ?start_time:float ->
  ?state:mailbox_export_job_state ->
  ?estimated_progress:int ->
  ?s3_path:string ->
  ?s3_bucket_name:string ->
  ?description:string ->
  ?entity_id:string ->
  ?job_id:string ->
  unit
-> mailbox_export_job
(** Create a {!type-mailbox_export_job} type *)

val make_list_mailbox_export_jobs_response :
  ?next_token:string -> ?jobs:mailbox_export_job list -> unit
-> list_mailbox_export_jobs_response
(** Create a {!type-list_mailbox_export_jobs_response} type *)

val make_list_mailbox_export_jobs_request :
  ?max_results:int -> ?next_token:string -> organization_id:string -> unit
-> list_mailbox_export_jobs_request
(** Create a {!type-list_mailbox_export_jobs_request} type *)

val make_impersonation_role :
  ?date_modified:float ->
  ?date_created:float ->
  ?type_:impersonation_role_type ->
  ?name:string ->
  ?impersonation_role_id:string ->
  unit
-> impersonation_role
(** Create a {!type-impersonation_role} type *)

val make_list_impersonation_roles_response :
  ?next_token:string -> ?roles:impersonation_role list -> unit
-> list_impersonation_roles_response
(** Create a {!type-list_impersonation_roles_response} type *)

val make_list_impersonation_roles_request :
  ?max_results:int -> ?next_token:string -> organization_id:string -> unit
-> list_impersonation_roles_request
(** Create a {!type-list_impersonation_roles_request} type *)

val make_group_identifier : ?group_name:string -> ?group_id:string -> unit
-> group_identifier
(** Create a {!type-group_identifier} type *)

val make_list_groups_for_entity_response :
  ?next_token:string -> ?groups:group_identifier list -> unit
-> list_groups_for_entity_response
(** Create a {!type-list_groups_for_entity_response} type *)

val make_list_groups_for_entity_filters : ?group_name_prefix:string -> unit
-> list_groups_for_entity_filters
(** Create a {!type-list_groups_for_entity_filters} type *)

val make_list_groups_for_entity_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:list_groups_for_entity_filters ->
  entity_id:string ->
  organization_id:string ->
  unit
-> list_groups_for_entity_request
(** Create a {!type-list_groups_for_entity_request} type *)

val make_group :
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?name:string ->
  ?email:string ->
  ?id:string ->
  unit
-> group
(** Create a {!type-group} type *)

val make_list_groups_response :
  ?next_token:string -> ?groups:group list -> unit
-> list_groups_response
(** Create a {!type-list_groups_response} type *)

val make_list_groups_filters :
  ?state:entity_state ->
  ?primary_email_prefix:string ->
  ?name_prefix:string ->
  unit
-> list_groups_filters
(** Create a {!type-list_groups_filters} type *)

val make_list_groups_request :
  ?filters:list_groups_filters ->
  ?max_results:int ->
  ?next_token:string ->
  organization_id:string ->
  unit
-> list_groups_request
(** Create a {!type-list_groups_request} type *)

val make_member :
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?type_:member_type ->
  ?name:string ->
  ?id:string ->
  unit
-> member
(** Create a {!type-member} type *)

val make_list_group_members_response :
  ?next_token:string -> ?members:member list -> unit
-> list_group_members_response
(** Create a {!type-list_group_members_response} type *)

val make_list_group_members_request :
  ?max_results:int ->
  ?next_token:string ->
  group_id:string ->
  organization_id:string ->
  unit
-> list_group_members_request
(** Create a {!type-list_group_members_request} type *)

val make_redacted_ews_availability_provider :
  ?ews_username:string -> ?ews_endpoint:string -> unit
-> redacted_ews_availability_provider
(** Create a {!type-redacted_ews_availability_provider} type *)

val make_availability_configuration :
  ?date_modified:float ->
  ?date_created:float ->
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:redacted_ews_availability_provider ->
  ?provider_type:availability_provider_type ->
  ?domain_name:string ->
  unit
-> availability_configuration
(** Create a {!type-availability_configuration} type *)

val make_list_availability_configurations_response :
  ?next_token:string ->
  ?availability_configurations:availability_configuration list ->
  unit
-> list_availability_configurations_response
(** Create a {!type-list_availability_configurations_response} type *)

val make_list_availability_configurations_request :
  ?next_token:string -> ?max_results:int -> organization_id:string -> unit
-> list_availability_configurations_request
(** Create a {!type-list_availability_configurations_request} type *)

val make_list_aliases_response :
  ?next_token:string -> ?aliases:string list -> unit
-> list_aliases_response
(** Create a {!type-list_aliases_response} type *)

val make_list_aliases_request :
  ?max_results:int ->
  ?next_token:string ->
  entity_id:string ->
  organization_id:string ->
  unit
-> list_aliases_request
(** Create a {!type-list_aliases_request} type *)

val make_access_control_rule :
  ?not_impersonation_role_ids:string list ->
  ?impersonation_role_ids:string list ->
  ?date_modified:float ->
  ?date_created:float ->
  ?not_user_ids:string list ->
  ?user_ids:string list ->
  ?not_actions:string list ->
  ?actions:string list ->
  ?not_ip_ranges:string list ->
  ?ip_ranges:string list ->
  ?description:string ->
  ?effect_:access_control_rule_effect ->
  ?name:string ->
  unit
-> access_control_rule
(** Create a {!type-access_control_rule} type *)

val make_list_access_control_rules_response :
  ?rules:access_control_rule list -> unit
-> list_access_control_rules_response
(** Create a {!type-list_access_control_rules_response} type *)

val make_list_access_control_rules_request : organization_id:string -> unit
-> list_access_control_rules_request
(** Create a {!type-list_access_control_rules_request} type *)

val make_get_mobile_device_access_override_response :
  ?date_modified:float ->
  ?date_created:float ->
  ?description:string ->
  ?effect_:mobile_device_access_rule_effect ->
  ?device_id:string ->
  ?user_id:string ->
  unit
-> get_mobile_device_access_override_response
(** Create a {!type-get_mobile_device_access_override_response} type *)

val make_get_mobile_device_access_override_request :
  device_id:string -> user_id:string -> organization_id:string -> unit
-> get_mobile_device_access_override_request
(** Create a {!type-get_mobile_device_access_override_request} type *)

val make_mobile_device_access_matched_rule :
  ?name:string -> ?mobile_device_access_rule_id:string -> unit
-> mobile_device_access_matched_rule
(** Create a {!type-mobile_device_access_matched_rule} type *)

val make_get_mobile_device_access_effect_response :
  ?matched_rules:mobile_device_access_matched_rule list ->
  ?effect_:mobile_device_access_rule_effect ->
  unit
-> get_mobile_device_access_effect_response
(** Create a {!type-get_mobile_device_access_effect_response} type *)

val make_get_mobile_device_access_effect_request :
  ?device_user_agent:string ->
  ?device_operating_system:string ->
  ?device_model:string ->
  ?device_type:string ->
  organization_id:string ->
  unit
-> get_mobile_device_access_effect_request
(** Create a {!type-get_mobile_device_access_effect_request} type *)

val make_dns_record :
  ?value:string -> ?hostname:string -> ?type_:string -> unit
-> dns_record
(** Create a {!type-dns_record} type *)

val make_get_mail_domain_response :
  ?dkim_verification_status:dns_record_verification_status ->
  ?ownership_verification_status:dns_record_verification_status ->
  ?is_default:bool ->
  ?is_test_domain:bool ->
  ?records:dns_record list ->
  unit
-> get_mail_domain_response
(** Create a {!type-get_mail_domain_response} type *)

val make_get_mail_domain_request :
  domain_name:string -> organization_id:string -> unit
-> get_mail_domain_request
(** Create a {!type-get_mail_domain_request} type *)

val make_get_mailbox_details_response :
  ?mailbox_size:float -> ?mailbox_quota:int -> unit
-> get_mailbox_details_response
(** Create a {!type-get_mailbox_details_response} type *)

val make_get_mailbox_details_request :
  user_id:string -> organization_id:string -> unit
-> get_mailbox_details_request
(** Create a {!type-get_mailbox_details_request} type *)

val make_impersonation_matched_rule :
  ?name:string -> ?impersonation_rule_id:string -> unit
-> impersonation_matched_rule
(** Create a {!type-impersonation_matched_rule} type *)

val make_get_impersonation_role_effect_response :
  ?matched_rules:impersonation_matched_rule list ->
  ?effect_:access_effect ->
  ?type_:impersonation_role_type ->
  unit
-> get_impersonation_role_effect_response
(** Create a {!type-get_impersonation_role_effect_response} type *)

val make_get_impersonation_role_effect_request :
  target_user:string ->
  impersonation_role_id:string ->
  organization_id:string ->
  unit
-> get_impersonation_role_effect_request
(** Create a {!type-get_impersonation_role_effect_request} type *)

val make_get_impersonation_role_response :
  ?date_modified:float ->
  ?date_created:float ->
  ?rules:impersonation_rule list ->
  ?description:string ->
  ?type_:impersonation_role_type ->
  ?name:string ->
  ?impersonation_role_id:string ->
  unit
-> get_impersonation_role_response
(** Create a {!type-get_impersonation_role_response} type *)

val make_get_impersonation_role_request :
  impersonation_role_id:string -> organization_id:string -> unit
-> get_impersonation_role_request
(** Create a {!type-get_impersonation_role_request} type *)

val make_get_default_retention_policy_response :
  ?folder_configurations:folder_configuration list ->
  ?description:string ->
  ?name:string ->
  ?id:string ->
  unit
-> get_default_retention_policy_response
(** Create a {!type-get_default_retention_policy_response} type *)

val make_get_default_retention_policy_request :
  organization_id:string -> unit
-> get_default_retention_policy_request
(** Create a {!type-get_default_retention_policy_request} type *)

val make_get_access_control_effect_response :
  ?matched_rules:string list -> ?effect_:access_control_rule_effect -> unit
-> get_access_control_effect_response
(** Create a {!type-get_access_control_effect_response} type *)

val make_get_access_control_effect_request :
  ?impersonation_role_id:string ->
  ?user_id:string ->
  action:string ->
  ip_address:string ->
  organization_id:string ->
  unit
-> get_access_control_effect_request
(** Create a {!type-get_access_control_effect_request} type *)

val make_disassociate_member_from_group_response : unit
-> disassociate_member_from_group_response
(** Create a {!type-disassociate_member_from_group_response} type *)

val make_disassociate_member_from_group_request :
  member_id:string -> group_id:string -> organization_id:string -> unit
-> disassociate_member_from_group_request
(** Create a {!type-disassociate_member_from_group_request} type *)

val make_disassociate_delegate_from_resource_response : unit
-> disassociate_delegate_from_resource_response
(** Create a {!type-disassociate_delegate_from_resource_response} type *)

val make_disassociate_delegate_from_resource_request :
  entity_id:string -> resource_id:string -> organization_id:string -> unit
-> disassociate_delegate_from_resource_request
(** Create a {!type-disassociate_delegate_from_resource_request} type *)

val make_describe_user_response :
  ?office:string ->
  ?country:string ->
  ?department:string ->
  ?zip_code:string ->
  ?company:string ->
  ?city:string ->
  ?job_title:string ->
  ?street:string ->
  ?telephone:string ->
  ?initials:string ->
  ?hidden_from_global_address_list:bool ->
  ?last_name:string ->
  ?first_name:string ->
  ?mailbox_deprovisioned_date:float ->
  ?mailbox_provisioned_date:float ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?user_role:user_role ->
  ?state:entity_state ->
  ?display_name:string ->
  ?email:string ->
  ?name:string ->
  ?user_id:string ->
  unit
-> describe_user_response
(** Create a {!type-describe_user_response} type *)

val make_describe_user_request :
  user_id:string -> organization_id:string -> unit
-> describe_user_request
(** Create a {!type-describe_user_request} type *)

val make_describe_resource_response :
  ?hidden_from_global_address_list:bool ->
  ?description:string ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?booking_options:booking_options ->
  ?type_:resource_type ->
  ?name:string ->
  ?email:string ->
  ?resource_id:string ->
  unit
-> describe_resource_response
(** Create a {!type-describe_resource_response} type *)

val make_describe_resource_request :
  resource_id:string -> organization_id:string -> unit
-> describe_resource_request
(** Create a {!type-describe_resource_request} type *)

val make_describe_organization_response :
  ?interoperability_enabled:bool ->
  ?migration_admin:string ->
  ?ar_n:string ->
  ?error_message:string ->
  ?completed_date:float ->
  ?default_mail_domain:string ->
  ?directory_type:string ->
  ?directory_id:string ->
  ?state:string ->
  ?alias:string ->
  ?organization_id:string ->
  unit
-> describe_organization_response
(** Create a {!type-describe_organization_response} type *)

val make_describe_organization_request : organization_id:string -> unit
-> describe_organization_request
(** Create a {!type-describe_organization_request} type *)

val make_describe_mailbox_export_job_response :
  ?end_time:float ->
  ?start_time:float ->
  ?error_info:string ->
  ?state:mailbox_export_job_state ->
  ?estimated_progress:int ->
  ?s3_path:string ->
  ?s3_prefix:string ->
  ?s3_bucket_name:string ->
  ?kms_key_arn:string ->
  ?role_arn:string ->
  ?description:string ->
  ?entity_id:string ->
  unit
-> describe_mailbox_export_job_response
(** Create a {!type-describe_mailbox_export_job_response} type *)

val make_describe_mailbox_export_job_request :
  organization_id:string -> job_id:string -> unit
-> describe_mailbox_export_job_request
(** Create a {!type-describe_mailbox_export_job_request} type *)

val make_describe_inbound_dmarc_settings_response : ?enforced:bool -> unit
-> describe_inbound_dmarc_settings_response
(** Create a {!type-describe_inbound_dmarc_settings_response} type *)

val make_describe_inbound_dmarc_settings_request :
  organization_id:string -> unit
-> describe_inbound_dmarc_settings_request
(** Create a {!type-describe_inbound_dmarc_settings_request} type *)

val make_describe_group_response :
  ?hidden_from_global_address_list:bool ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?email:string ->
  ?name:string ->
  ?group_id:string ->
  unit
-> describe_group_response
(** Create a {!type-describe_group_response} type *)

val make_describe_group_request :
  group_id:string -> organization_id:string -> unit
-> describe_group_request
(** Create a {!type-describe_group_request} type *)

val make_describe_entity_response :
  ?type_:entity_type -> ?name:string -> ?entity_id:string -> unit
-> describe_entity_response
(** Create a {!type-describe_entity_response} type *)

val make_describe_entity_request :
  email:string -> organization_id:string -> unit
-> describe_entity_request
(** Create a {!type-describe_entity_request} type *)

val make_describe_email_monitoring_configuration_response :
  ?log_group_arn:string -> ?role_arn:string -> unit
-> describe_email_monitoring_configuration_response
(** Create a {!type-describe_email_monitoring_configuration_response} type *)

val make_describe_email_monitoring_configuration_request :
  organization_id:string -> unit
-> describe_email_monitoring_configuration_request
(** Create a {!type-describe_email_monitoring_configuration_request} type *)

val make_deregister_mail_domain_response : unit
-> deregister_mail_domain_response
(** Create a {!type-deregister_mail_domain_response} type *)

val make_deregister_mail_domain_request :
  domain_name:string -> organization_id:string -> unit
-> deregister_mail_domain_request
(** Create a {!type-deregister_mail_domain_request} type *)

val make_deregister_from_work_mail_response : unit
-> deregister_from_work_mail_response
(** Create a {!type-deregister_from_work_mail_response} type *)

val make_deregister_from_work_mail_request :
  entity_id:string -> organization_id:string -> unit
-> deregister_from_work_mail_request
(** Create a {!type-deregister_from_work_mail_request} type *)

val make_delete_user_response : unit
-> delete_user_response
(** Create a {!type-delete_user_response} type *)

val make_delete_user_request :
  user_id:string -> organization_id:string -> unit
-> delete_user_request
(** Create a {!type-delete_user_request} type *)

val make_delete_retention_policy_response : unit
-> delete_retention_policy_response
(** Create a {!type-delete_retention_policy_response} type *)

val make_delete_retention_policy_request :
  id:string -> organization_id:string -> unit
-> delete_retention_policy_request
(** Create a {!type-delete_retention_policy_request} type *)

val make_delete_resource_response : unit
-> delete_resource_response
(** Create a {!type-delete_resource_response} type *)

val make_delete_resource_request :
  resource_id:string -> organization_id:string -> unit
-> delete_resource_request
(** Create a {!type-delete_resource_request} type *)

val make_delete_organization_response :
  ?state:string -> ?organization_id:string -> unit
-> delete_organization_response
(** Create a {!type-delete_organization_response} type *)

val make_delete_organization_request :
  ?force_delete:bool ->
  ?client_token:string ->
  delete_directory:bool ->
  organization_id:string ->
  unit
-> delete_organization_request
(** Create a {!type-delete_organization_request} type *)

val make_delete_mobile_device_access_rule_response : unit
-> delete_mobile_device_access_rule_response
(** Create a {!type-delete_mobile_device_access_rule_response} type *)

val make_delete_mobile_device_access_rule_request :
  mobile_device_access_rule_id:string -> organization_id:string -> unit
-> delete_mobile_device_access_rule_request
(** Create a {!type-delete_mobile_device_access_rule_request} type *)

val make_delete_mobile_device_access_override_response : unit
-> delete_mobile_device_access_override_response
(** Create a {!type-delete_mobile_device_access_override_response} type *)

val make_delete_mobile_device_access_override_request :
  device_id:string -> user_id:string -> organization_id:string -> unit
-> delete_mobile_device_access_override_request
(** Create a {!type-delete_mobile_device_access_override_request} type *)

val make_delete_mailbox_permissions_response : unit
-> delete_mailbox_permissions_response
(** Create a {!type-delete_mailbox_permissions_response} type *)

val make_delete_mailbox_permissions_request :
  grantee_id:string -> entity_id:string -> organization_id:string -> unit
-> delete_mailbox_permissions_request
(** Create a {!type-delete_mailbox_permissions_request} type *)

val make_delete_impersonation_role_response : unit
-> delete_impersonation_role_response
(** Create a {!type-delete_impersonation_role_response} type *)

val make_delete_impersonation_role_request :
  impersonation_role_id:string -> organization_id:string -> unit
-> delete_impersonation_role_request
(** Create a {!type-delete_impersonation_role_request} type *)

val make_delete_group_response : unit
-> delete_group_response
(** Create a {!type-delete_group_response} type *)

val make_delete_group_request :
  group_id:string -> organization_id:string -> unit
-> delete_group_request
(** Create a {!type-delete_group_request} type *)

val make_delete_email_monitoring_configuration_response : unit
-> delete_email_monitoring_configuration_response
(** Create a {!type-delete_email_monitoring_configuration_response} type *)

val make_delete_email_monitoring_configuration_request :
  organization_id:string -> unit
-> delete_email_monitoring_configuration_request
(** Create a {!type-delete_email_monitoring_configuration_request} type *)

val make_delete_availability_configuration_response : unit
-> delete_availability_configuration_response
(** Create a {!type-delete_availability_configuration_response} type *)

val make_delete_availability_configuration_request :
  domain_name:string -> organization_id:string -> unit
-> delete_availability_configuration_request
(** Create a {!type-delete_availability_configuration_request} type *)

val make_delete_alias_response : unit
-> delete_alias_response
(** Create a {!type-delete_alias_response} type *)

val make_delete_alias_request :
  alias:string -> entity_id:string -> organization_id:string -> unit
-> delete_alias_request
(** Create a {!type-delete_alias_request} type *)

val make_delete_access_control_rule_response : unit
-> delete_access_control_rule_response
(** Create a {!type-delete_access_control_rule_response} type *)

val make_delete_access_control_rule_request :
  name:string -> organization_id:string -> unit
-> delete_access_control_rule_request
(** Create a {!type-delete_access_control_rule_request} type *)

val make_create_user_response : ?user_id:string -> unit
-> create_user_response
(** Create a {!type-create_user_response} type *)

val make_create_user_request :
  ?hidden_from_global_address_list:bool ->
  ?last_name:string ->
  ?first_name:string ->
  ?role:user_role ->
  ?password:string ->
  display_name:string ->
  name:string ->
  organization_id:string ->
  unit
-> create_user_request
(** Create a {!type-create_user_request} type *)

val make_create_resource_response : ?resource_id:string -> unit
-> create_resource_response
(** Create a {!type-create_resource_response} type *)

val make_create_resource_request :
  ?hidden_from_global_address_list:bool ->
  ?description:string ->
  type_:resource_type ->
  name:string ->
  organization_id:string ->
  unit
-> create_resource_request
(** Create a {!type-create_resource_request} type *)

val make_create_organization_response : ?organization_id:string -> unit
-> create_organization_response
(** Create a {!type-create_organization_response} type *)

val make_domain : ?hosted_zone_id:string -> domain_name:string -> unit
-> domain
(** Create a {!type-domain} type *)

val make_create_organization_request :
  ?enable_interoperability:bool ->
  ?kms_key_arn:string ->
  ?domains:domain list ->
  ?client_token:string ->
  ?directory_id:string ->
  alias:string ->
  unit
-> create_organization_request
(** Create a {!type-create_organization_request} type *)

val make_create_mobile_device_access_rule_response :
  ?mobile_device_access_rule_id:string -> unit
-> create_mobile_device_access_rule_response
(** Create a {!type-create_mobile_device_access_rule_response} type *)

val make_create_mobile_device_access_rule_request :
  ?not_device_user_agents:string list ->
  ?device_user_agents:string list ->
  ?not_device_operating_systems:string list ->
  ?device_operating_systems:string list ->
  ?not_device_models:string list ->
  ?device_models:string list ->
  ?not_device_types:string list ->
  ?device_types:string list ->
  ?description:string ->
  ?client_token:string ->
  effect_:mobile_device_access_rule_effect ->
  name:string ->
  organization_id:string ->
  unit
-> create_mobile_device_access_rule_request
(** Create a {!type-create_mobile_device_access_rule_request} type *)

val make_create_impersonation_role_response :
  ?impersonation_role_id:string -> unit
-> create_impersonation_role_response
(** Create a {!type-create_impersonation_role_response} type *)

val make_create_impersonation_role_request :
  ?description:string ->
  ?client_token:string ->
  rules:impersonation_rule list ->
  type_:impersonation_role_type ->
  name:string ->
  organization_id:string ->
  unit
-> create_impersonation_role_request
(** Create a {!type-create_impersonation_role_request} type *)

val make_create_group_response : ?group_id:string -> unit
-> create_group_response
(** Create a {!type-create_group_response} type *)

val make_create_group_request :
  ?hidden_from_global_address_list:bool ->
  name:string ->
  organization_id:string ->
  unit
-> create_group_request
(** Create a {!type-create_group_request} type *)

val make_create_availability_configuration_response : unit
-> create_availability_configuration_response
(** Create a {!type-create_availability_configuration_response} type *)

val make_create_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:ews_availability_provider ->
  ?client_token:string ->
  domain_name:string ->
  organization_id:string ->
  unit
-> create_availability_configuration_request
(** Create a {!type-create_availability_configuration_request} type *)

val make_create_alias_response : unit
-> create_alias_response
(** Create a {!type-create_alias_response} type *)

val make_create_alias_request :
  alias:string -> entity_id:string -> organization_id:string -> unit
-> create_alias_request
(** Create a {!type-create_alias_request} type *)

val make_cancel_mailbox_export_job_response : unit
-> cancel_mailbox_export_job_response
(** Create a {!type-cancel_mailbox_export_job_response} type *)

val make_cancel_mailbox_export_job_request :
  organization_id:string -> job_id:string -> client_token:string -> unit
-> cancel_mailbox_export_job_request
(** Create a {!type-cancel_mailbox_export_job_request} type *)

val make_assume_impersonation_role_response :
  ?expires_in:int -> ?token:string -> unit
-> assume_impersonation_role_response
(** Create a {!type-assume_impersonation_role_response} type *)

val make_assume_impersonation_role_request :
  impersonation_role_id:string -> organization_id:string -> unit
-> assume_impersonation_role_request
(** Create a {!type-assume_impersonation_role_request} type *)

val make_associate_member_to_group_response : unit
-> associate_member_to_group_response
(** Create a {!type-associate_member_to_group_response} type *)

val make_associate_member_to_group_request :
  member_id:string -> group_id:string -> organization_id:string -> unit
-> associate_member_to_group_request
(** Create a {!type-associate_member_to_group_request} type *)

val make_associate_delegate_to_resource_response : unit
-> associate_delegate_to_resource_response
(** Create a {!type-associate_delegate_to_resource_response} type *)

val make_associate_delegate_to_resource_request :
  entity_id:string -> resource_id:string -> organization_id:string -> unit
-> associate_delegate_to_resource_request
(** Create a {!type-associate_delegate_to_resource_request} type *)

