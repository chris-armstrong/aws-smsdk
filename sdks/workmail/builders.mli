open Types
val make_update_user_response : unit
-> update_user_response

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
  unit -> update_user_request

val make_update_resource_response : unit
-> update_resource_response

val make_booking_options :
  ?auto_decline_conflicting_requests:bool ->
  ?auto_decline_recurring_requests:bool ->
  ?auto_accept_requests:bool ->
  unit -> booking_options

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

val make_update_primary_email_address_response : unit
-> update_primary_email_address_response

val make_update_primary_email_address_request :
  email:string -> entity_id:string -> organization_id:string -> unit
-> update_primary_email_address_request

val make_update_mobile_device_access_rule_response : unit
-> update_mobile_device_access_rule_response

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
  effect:mobile_device_access_rule_effect ->
  name:string ->
  mobile_device_access_rule_id:string ->
  organization_id:string ->
  unit
-> update_mobile_device_access_rule_request

val make_update_mailbox_quota_response : unit
-> update_mailbox_quota_response

val make_update_mailbox_quota_request :
  mailbox_quota:int -> user_id:string -> organization_id:string -> unit
-> update_mailbox_quota_request

val make_update_impersonation_role_response : unit
-> update_impersonation_role_response

val make_impersonation_rule :
  ?not_target_users:string list ->
  ?target_users:string list ->
  ?description:string ->
  ?name:string ->
  effect:access_effect ->
  impersonation_rule_id:string ->
  unit -> impersonation_rule

val make_update_impersonation_role_request :
  ?description:string ->
  rules:impersonation_rule list ->
  type_:impersonation_role_type ->
  name:string ->
  impersonation_role_id:string ->
  organization_id:string ->
  unit -> update_impersonation_role_request

val make_update_group_response : unit
-> update_group_response

val make_update_group_request :
  ?hidden_from_global_address_list:bool ->
  group_id:string ->
  organization_id:string ->
  unit -> update_group_request

val make_update_default_mail_domain_response : unit
-> update_default_mail_domain_response

val make_update_default_mail_domain_request :
  domain_name:string -> organization_id:string -> unit
-> update_default_mail_domain_request

val make_update_availability_configuration_response : unit
-> update_availability_configuration_response

val make_ews_availability_provider :
  ews_password:string -> ews_username:string -> ews_endpoint:string -> unit
-> ews_availability_provider

val make_lambda_availability_provider : lambda_arn:string -> unit
-> lambda_availability_provider

val make_update_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:ews_availability_provider ->
  domain_name:string ->
  organization_id:string ->
  unit
-> update_availability_configuration_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request

val make_test_availability_configuration_response :
  ?failure_reason:string -> ?test_passed:bool -> unit
-> test_availability_configuration_response

val make_test_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:ews_availability_provider ->
  ?domain_name:string ->
  organization_id:string ->
  unit
-> test_availability_configuration_request

val make_tag_resource_response : unit -> tag_resource_response

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request

val make_start_mailbox_export_job_response : ?job_id:string -> unit
-> start_mailbox_export_job_response

val make_start_mailbox_export_job_request :
  ?description:string ->
  s3_prefix:string ->
  s3_bucket_name:string ->
  kms_key_arn:string ->
  role_arn:string ->
  entity_id:string ->
  organization_id:string ->
  client_token:string ->
  unit -> start_mailbox_export_job_request

val make_reset_password_response : unit
-> reset_password_response

val make_reset_password_request :
  password:string -> user_id:string -> organization_id:string -> unit
-> reset_password_request

val make_register_to_work_mail_response : unit
-> register_to_work_mail_response

val make_register_to_work_mail_request :
  email:string -> entity_id:string -> organization_id:string -> unit
-> register_to_work_mail_request

val make_register_mail_domain_response : unit
-> register_mail_domain_response

val make_register_mail_domain_request :
  ?client_token:string ->
  domain_name:string ->
  organization_id:string ->
  unit
-> register_mail_domain_request

val make_put_retention_policy_response : unit
-> put_retention_policy_response

val make_folder_configuration :
  ?period:int -> action:retention_action -> name:folder_name -> unit
-> folder_configuration

val make_put_retention_policy_request :
  ?description:string ->
  ?id:string ->
  folder_configurations:folder_configuration list ->
  name:string ->
  organization_id:string ->
  unit
-> put_retention_policy_request

val make_put_mobile_device_access_override_response : unit
-> put_mobile_device_access_override_response

val make_put_mobile_device_access_override_request :
  ?description:string ->
  effect:mobile_device_access_rule_effect ->
  device_id:string ->
  user_id:string ->
  organization_id:string ->
  unit
-> put_mobile_device_access_override_request

val make_put_mailbox_permissions_response : unit
-> put_mailbox_permissions_response

val make_put_mailbox_permissions_request :
  permission_values:permission_type list ->
  grantee_id:string ->
  entity_id:string ->
  organization_id:string ->
  unit
-> put_mailbox_permissions_request

val make_put_inbound_dmarc_settings_response : unit
-> put_inbound_dmarc_settings_response

val make_put_inbound_dmarc_settings_request :
  enforced:bool -> organization_id:string -> unit
-> put_inbound_dmarc_settings_request

val make_put_email_monitoring_configuration_response : unit
-> put_email_monitoring_configuration_response

val make_put_email_monitoring_configuration_request :
  log_group_arn:string -> role_arn:string -> organization_id:string -> unit
-> put_email_monitoring_configuration_request

val make_put_access_control_rule_response : unit
-> put_access_control_rule_response

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
  effect:access_control_rule_effect ->
  name:string ->
  unit -> put_access_control_rule_request

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

val make_list_users_response : ?next_token:string -> ?users:user list -> unit
-> list_users_response

val make_list_users_filters :
  ?state:entity_state ->
  ?primary_email_prefix:string ->
  ?display_name_prefix:string ->
  ?username_prefix:string ->
  unit -> list_users_filters

val make_list_users_request :
  ?filters:list_users_filters ->
  ?max_results:int ->
  ?next_token:string ->
  organization_id:string ->
  unit -> list_users_request

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_resource :
  ?description:string ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?type_:resource_type ->
  ?name:string ->
  ?email:string ->
  ?id:string ->
  unit -> resource

val make_list_resources_response :
  ?next_token:string -> ?resources:resource list -> unit
-> list_resources_response

val make_list_resources_filters :
  ?state:entity_state ->
  ?primary_email_prefix:string ->
  ?name_prefix:string ->
  unit -> list_resources_filters

val make_list_resources_request :
  ?filters:list_resources_filters ->
  ?max_results:int ->
  ?next_token:string ->
  organization_id:string ->
  unit -> list_resources_request

val make_delegate : type_:member_type -> id:string -> unit
-> delegate

val make_list_resource_delegates_response :
  ?next_token:string -> ?delegates:delegate list -> unit
-> list_resource_delegates_response

val make_list_resource_delegates_request :
  ?max_results:int ->
  ?next_token:string ->
  resource_id:string ->
  organization_id:string ->
  unit -> list_resource_delegates_request

val make_organization_summary :
  ?state:string ->
  ?error_message:string ->
  ?default_mail_domain:string ->
  ?alias:string ->
  ?organization_id:string ->
  unit -> organization_summary

val make_list_organizations_response :
  ?next_token:string ->
  ?organization_summaries:organization_summary list ->
  unit -> list_organizations_response

val make_list_organizations_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_organizations_request

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
  ?effect:mobile_device_access_rule_effect ->
  ?description:string ->
  ?name:string ->
  ?mobile_device_access_rule_id:string ->
  unit
-> mobile_device_access_rule

val make_list_mobile_device_access_rules_response :
  ?rules:mobile_device_access_rule list -> unit
-> list_mobile_device_access_rules_response

val make_list_mobile_device_access_rules_request :
  organization_id:string -> unit
-> list_mobile_device_access_rules_request

val make_mobile_device_access_override :
  ?date_modified:float ->
  ?date_created:float ->
  ?description:string ->
  ?effect:mobile_device_access_rule_effect ->
  ?device_id:string ->
  ?user_id:string ->
  unit
-> mobile_device_access_override

val make_list_mobile_device_access_overrides_response :
  ?next_token:string -> ?overrides:mobile_device_access_override list -> unit
-> list_mobile_device_access_overrides_response

val make_list_mobile_device_access_overrides_request :
  ?max_results:int ->
  ?next_token:string ->
  ?device_id:string ->
  ?user_id:string ->
  organization_id:string ->
  unit
-> list_mobile_device_access_overrides_request

val make_mail_domain_summary :
  ?default_domain:bool -> ?domain_name:string -> unit
-> mail_domain_summary

val make_list_mail_domains_response :
  ?next_token:string -> ?mail_domains:mail_domain_summary list -> unit
-> list_mail_domains_response

val make_list_mail_domains_request :
  ?next_token:string -> ?max_results:int -> organization_id:string -> unit
-> list_mail_domains_request

val make_permission :
  permission_values:permission_type list ->
  grantee_type:member_type ->
  grantee_id:string ->
  unit -> permission

val make_list_mailbox_permissions_response :
  ?next_token:string -> ?permissions:permission list -> unit
-> list_mailbox_permissions_response

val make_list_mailbox_permissions_request :
  ?max_results:int ->
  ?next_token:string ->
  entity_id:string ->
  organization_id:string ->
  unit -> list_mailbox_permissions_request

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
  unit -> mailbox_export_job

val make_list_mailbox_export_jobs_response :
  ?next_token:string -> ?jobs:mailbox_export_job list -> unit
-> list_mailbox_export_jobs_response

val make_list_mailbox_export_jobs_request :
  ?max_results:int -> ?next_token:string -> organization_id:string -> unit
-> list_mailbox_export_jobs_request

val make_impersonation_role :
  ?date_modified:float ->
  ?date_created:float ->
  ?type_:impersonation_role_type ->
  ?name:string ->
  ?impersonation_role_id:string ->
  unit -> impersonation_role

val make_list_impersonation_roles_response :
  ?next_token:string -> ?roles:impersonation_role list -> unit
-> list_impersonation_roles_response

val make_list_impersonation_roles_request :
  ?max_results:int -> ?next_token:string -> organization_id:string -> unit
-> list_impersonation_roles_request

val make_group_identifier : ?group_name:string -> ?group_id:string -> unit
-> group_identifier

val make_list_groups_for_entity_response :
  ?next_token:string -> ?groups:group_identifier list -> unit
-> list_groups_for_entity_response

val make_list_groups_for_entity_filters : ?group_name_prefix:string -> unit
-> list_groups_for_entity_filters

val make_list_groups_for_entity_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:list_groups_for_entity_filters ->
  entity_id:string ->
  organization_id:string ->
  unit -> list_groups_for_entity_request

val make_group :
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?name:string ->
  ?email:string ->
  ?id:string ->
  unit -> group

val make_list_groups_response :
  ?next_token:string -> ?groups:group list -> unit
-> list_groups_response

val make_list_groups_filters :
  ?state:entity_state ->
  ?primary_email_prefix:string ->
  ?name_prefix:string ->
  unit -> list_groups_filters

val make_list_groups_request :
  ?filters:list_groups_filters ->
  ?max_results:int ->
  ?next_token:string ->
  organization_id:string ->
  unit -> list_groups_request

val make_member :
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?type_:member_type ->
  ?name:string ->
  ?id:string ->
  unit -> member

val make_list_group_members_response :
  ?next_token:string -> ?members:member list -> unit
-> list_group_members_response

val make_list_group_members_request :
  ?max_results:int ->
  ?next_token:string ->
  group_id:string ->
  organization_id:string ->
  unit
-> list_group_members_request

val make_redacted_ews_availability_provider :
  ?ews_username:string -> ?ews_endpoint:string -> unit
-> redacted_ews_availability_provider

val make_availability_configuration :
  ?date_modified:float ->
  ?date_created:float ->
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:redacted_ews_availability_provider ->
  ?provider_type:availability_provider_type ->
  ?domain_name:string ->
  unit
-> availability_configuration

val make_list_availability_configurations_response :
  ?next_token:string ->
  ?availability_configurations:availability_configuration list ->
  unit
-> list_availability_configurations_response

val make_list_availability_configurations_request :
  ?next_token:string -> ?max_results:int -> organization_id:string -> unit
-> list_availability_configurations_request

val make_list_aliases_response :
  ?next_token:string -> ?aliases:string list -> unit
-> list_aliases_response

val make_list_aliases_request :
  ?max_results:int ->
  ?next_token:string ->
  entity_id:string ->
  organization_id:string ->
  unit -> list_aliases_request

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
  ?effect:access_control_rule_effect ->
  ?name:string ->
  unit -> access_control_rule

val make_list_access_control_rules_response :
  ?rules:access_control_rule list -> unit
-> list_access_control_rules_response

val make_list_access_control_rules_request : organization_id:string -> unit
-> list_access_control_rules_request

val make_get_mobile_device_access_override_response :
  ?date_modified:float ->
  ?date_created:float ->
  ?description:string ->
  ?effect:mobile_device_access_rule_effect ->
  ?device_id:string ->
  ?user_id:string ->
  unit
-> get_mobile_device_access_override_response

val make_get_mobile_device_access_override_request :
  device_id:string -> user_id:string -> organization_id:string -> unit
-> get_mobile_device_access_override_request

val make_mobile_device_access_matched_rule :
  ?name:string -> ?mobile_device_access_rule_id:string -> unit
-> mobile_device_access_matched_rule

val make_get_mobile_device_access_effect_response :
  ?matched_rules:mobile_device_access_matched_rule list ->
  ?effect:mobile_device_access_rule_effect ->
  unit
-> get_mobile_device_access_effect_response

val make_get_mobile_device_access_effect_request :
  ?device_user_agent:string ->
  ?device_operating_system:string ->
  ?device_model:string ->
  ?device_type:string ->
  organization_id:string ->
  unit -> get_mobile_device_access_effect_request

val make_dns_record :
  ?value:string -> ?hostname:string -> ?type_:string -> unit
-> dns_record

val make_get_mail_domain_response :
  ?dkim_verification_status:dns_record_verification_status ->
  ?ownership_verification_status:dns_record_verification_status ->
  ?is_default:bool ->
  ?is_test_domain:bool ->
  ?records:dns_record list ->
  unit -> get_mail_domain_response

val make_get_mail_domain_request :
  domain_name:string -> organization_id:string -> unit
-> get_mail_domain_request

val make_get_mailbox_details_response :
  ?mailbox_size:float -> ?mailbox_quota:int -> unit
-> get_mailbox_details_response

val make_get_mailbox_details_request :
  user_id:string -> organization_id:string -> unit
-> get_mailbox_details_request

val make_impersonation_matched_rule :
  ?name:string -> ?impersonation_rule_id:string -> unit
-> impersonation_matched_rule

val make_get_impersonation_role_effect_response :
  ?matched_rules:impersonation_matched_rule list ->
  ?effect:access_effect ->
  ?type_:impersonation_role_type ->
  unit
-> get_impersonation_role_effect_response

val make_get_impersonation_role_effect_request :
  target_user:string ->
  impersonation_role_id:string ->
  organization_id:string ->
  unit
-> get_impersonation_role_effect_request

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

val make_get_impersonation_role_request :
  impersonation_role_id:string -> organization_id:string -> unit
-> get_impersonation_role_request

val make_get_default_retention_policy_response :
  ?folder_configurations:folder_configuration list ->
  ?description:string ->
  ?name:string ->
  ?id:string ->
  unit
-> get_default_retention_policy_response

val make_get_default_retention_policy_request :
  organization_id:string -> unit
-> get_default_retention_policy_request

val make_get_access_control_effect_response :
  ?matched_rules:string list -> ?effect:access_control_rule_effect -> unit
-> get_access_control_effect_response

val make_get_access_control_effect_request :
  ?impersonation_role_id:string ->
  ?user_id:string ->
  action:string ->
  ip_address:string ->
  organization_id:string ->
  unit
-> get_access_control_effect_request

val make_disassociate_member_from_group_response : unit
-> disassociate_member_from_group_response

val make_disassociate_member_from_group_request :
  member_id:string -> group_id:string -> organization_id:string -> unit
-> disassociate_member_from_group_request

val make_disassociate_delegate_from_resource_response : unit
-> disassociate_delegate_from_resource_response

val make_disassociate_delegate_from_resource_request :
  entity_id:string -> resource_id:string -> organization_id:string -> unit
-> disassociate_delegate_from_resource_request

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
  unit -> describe_user_response

val make_describe_user_request :
  user_id:string -> organization_id:string -> unit
-> describe_user_request

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
  unit -> describe_resource_response

val make_describe_resource_request :
  resource_id:string -> organization_id:string -> unit
-> describe_resource_request

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

val make_describe_organization_request : organization_id:string -> unit
-> describe_organization_request

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

val make_describe_mailbox_export_job_request :
  organization_id:string -> job_id:string -> unit
-> describe_mailbox_export_job_request

val make_describe_inbound_dmarc_settings_response : ?enforced:bool -> unit
-> describe_inbound_dmarc_settings_response

val make_describe_inbound_dmarc_settings_request :
  organization_id:string -> unit
-> describe_inbound_dmarc_settings_request

val make_describe_group_response :
  ?hidden_from_global_address_list:bool ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?email:string ->
  ?name:string ->
  ?group_id:string ->
  unit -> describe_group_response

val make_describe_group_request :
  group_id:string -> organization_id:string -> unit
-> describe_group_request

val make_describe_entity_response :
  ?type_:entity_type -> ?name:string -> ?entity_id:string -> unit
-> describe_entity_response

val make_describe_entity_request :
  email:string -> organization_id:string -> unit
-> describe_entity_request

val make_describe_email_monitoring_configuration_response :
  ?log_group_arn:string -> ?role_arn:string -> unit
-> describe_email_monitoring_configuration_response

val make_describe_email_monitoring_configuration_request :
  organization_id:string -> unit
-> describe_email_monitoring_configuration_request

val make_deregister_mail_domain_response : unit
-> deregister_mail_domain_response

val make_deregister_mail_domain_request :
  domain_name:string -> organization_id:string -> unit
-> deregister_mail_domain_request

val make_deregister_from_work_mail_response : unit
-> deregister_from_work_mail_response

val make_deregister_from_work_mail_request :
  entity_id:string -> organization_id:string -> unit
-> deregister_from_work_mail_request

val make_delete_user_response : unit
-> delete_user_response

val make_delete_user_request :
  user_id:string -> organization_id:string -> unit
-> delete_user_request

val make_delete_retention_policy_response : unit
-> delete_retention_policy_response

val make_delete_retention_policy_request :
  id:string -> organization_id:string -> unit
-> delete_retention_policy_request

val make_delete_resource_response : unit
-> delete_resource_response

val make_delete_resource_request :
  resource_id:string -> organization_id:string -> unit
-> delete_resource_request

val make_delete_organization_response :
  ?state:string -> ?organization_id:string -> unit
-> delete_organization_response

val make_delete_organization_request :
  ?force_delete:bool ->
  ?client_token:string ->
  delete_directory:bool ->
  organization_id:string ->
  unit
-> delete_organization_request

val make_delete_mobile_device_access_rule_response : unit
-> delete_mobile_device_access_rule_response

val make_delete_mobile_device_access_rule_request :
  mobile_device_access_rule_id:string -> organization_id:string -> unit
-> delete_mobile_device_access_rule_request

val make_delete_mobile_device_access_override_response : unit
-> delete_mobile_device_access_override_response

val make_delete_mobile_device_access_override_request :
  device_id:string -> user_id:string -> organization_id:string -> unit
-> delete_mobile_device_access_override_request

val make_delete_mailbox_permissions_response : unit
-> delete_mailbox_permissions_response

val make_delete_mailbox_permissions_request :
  grantee_id:string -> entity_id:string -> organization_id:string -> unit
-> delete_mailbox_permissions_request

val make_delete_impersonation_role_response : unit
-> delete_impersonation_role_response

val make_delete_impersonation_role_request :
  impersonation_role_id:string -> organization_id:string -> unit
-> delete_impersonation_role_request

val make_delete_group_response : unit
-> delete_group_response

val make_delete_group_request :
  group_id:string -> organization_id:string -> unit
-> delete_group_request

val make_delete_email_monitoring_configuration_response : unit
-> delete_email_monitoring_configuration_response

val make_delete_email_monitoring_configuration_request :
  organization_id:string -> unit
-> delete_email_monitoring_configuration_request

val make_delete_availability_configuration_response : unit
-> delete_availability_configuration_response

val make_delete_availability_configuration_request :
  domain_name:string -> organization_id:string -> unit
-> delete_availability_configuration_request

val make_delete_alias_response : unit
-> delete_alias_response

val make_delete_alias_request :
  alias:string -> entity_id:string -> organization_id:string -> unit
-> delete_alias_request

val make_delete_access_control_rule_response : unit
-> delete_access_control_rule_response

val make_delete_access_control_rule_request :
  name:string -> organization_id:string -> unit
-> delete_access_control_rule_request

val make_create_user_response : ?user_id:string -> unit
-> create_user_response

val make_create_user_request :
  ?hidden_from_global_address_list:bool ->
  ?last_name:string ->
  ?first_name:string ->
  ?role:user_role ->
  ?password:string ->
  display_name:string ->
  name:string ->
  organization_id:string ->
  unit -> create_user_request

val make_create_resource_response : ?resource_id:string -> unit
-> create_resource_response

val make_create_resource_request :
  ?hidden_from_global_address_list:bool ->
  ?description:string ->
  type_:resource_type ->
  name:string ->
  organization_id:string ->
  unit -> create_resource_request

val make_create_organization_response : ?organization_id:string -> unit
-> create_organization_response

val make_domain : ?hosted_zone_id:string -> domain_name:string -> unit
-> domain

val make_create_organization_request :
  ?enable_interoperability:bool ->
  ?kms_key_arn:string ->
  ?domains:domain list ->
  ?client_token:string ->
  ?directory_id:string ->
  alias:string ->
  unit
-> create_organization_request

val make_create_mobile_device_access_rule_response :
  ?mobile_device_access_rule_id:string -> unit
-> create_mobile_device_access_rule_response

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
  effect:mobile_device_access_rule_effect ->
  name:string ->
  organization_id:string ->
  unit
-> create_mobile_device_access_rule_request

val make_create_impersonation_role_response :
  ?impersonation_role_id:string -> unit
-> create_impersonation_role_response

val make_create_impersonation_role_request :
  ?description:string ->
  ?client_token:string ->
  rules:impersonation_rule list ->
  type_:impersonation_role_type ->
  name:string ->
  organization_id:string ->
  unit -> create_impersonation_role_request

val make_create_group_response : ?group_id:string -> unit
-> create_group_response

val make_create_group_request :
  ?hidden_from_global_address_list:bool ->
  name:string ->
  organization_id:string ->
  unit
-> create_group_request

val make_create_availability_configuration_response : unit
-> create_availability_configuration_response

val make_create_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:ews_availability_provider ->
  ?client_token:string ->
  domain_name:string ->
  organization_id:string ->
  unit
-> create_availability_configuration_request

val make_create_alias_response : unit
-> create_alias_response

val make_create_alias_request :
  alias:string -> entity_id:string -> organization_id:string -> unit
-> create_alias_request

val make_cancel_mailbox_export_job_response : unit
-> cancel_mailbox_export_job_response

val make_cancel_mailbox_export_job_request :
  organization_id:string -> job_id:string -> client_token:string -> unit
-> cancel_mailbox_export_job_request

val make_assume_impersonation_role_response :
  ?expires_in:int -> ?token:string -> unit
-> assume_impersonation_role_response

val make_assume_impersonation_role_request :
  impersonation_role_id:string -> organization_id:string -> unit
-> assume_impersonation_role_request

val make_associate_member_to_group_response : unit
-> associate_member_to_group_response

val make_associate_member_to_group_request :
  member_id:string -> group_id:string -> organization_id:string -> unit
-> associate_member_to_group_request

val make_associate_delegate_to_resource_response : unit
-> associate_delegate_to_resource_response

val make_associate_delegate_to_resource_request :
  entity_id:string -> resource_id:string -> organization_id:string -> unit
-> associate_delegate_to_resource_request

