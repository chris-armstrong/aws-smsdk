open Smaws_Lib
val service : Service.descriptor

type unsupported_operation_exception = {
  message: string option
}

type organization_state_exception = {
  message: string option
}

type organization_not_found_exception = {
  message: string option
}

type invalid_parameter_exception = {
  message: string option
}

type entity_state_exception = {
  message: string option
}

type entity_not_found_exception = {
  message: string option
}

type directory_unavailable_exception = {
  message: string option
}

type directory_service_authentication_failed_exception = {
  message: string option
}

type update_user_response = unit

type user_role = | REMOTE_USER
  | SYSTEM_USER
  | RESOURCE
  | USER

type update_user_request = {
  office: string option;
  country: string option;
  department: string option;
  zip_code: string option;
  company: string option;
  city: string option;
  job_title: string option;
  street: string option;
  telephone: string option;
  initials: string option;
  hidden_from_global_address_list: bool option;
  last_name: string option;
  first_name: string option;
  display_name: string option;
  role: user_role option;
  user_id: string;
  organization_id: string
}

type name_availability_exception = {
  message: string option
}

type mail_domain_state_exception = {
  message: string option
}

type mail_domain_not_found_exception = {
  message: string option
}

type invalid_configuration_exception = {
  message: string option
}

type email_address_in_use_exception = {
  message: string option
}

type update_resource_response = unit

type booking_options = {
  auto_decline_conflicting_requests: bool option;
  auto_decline_recurring_requests: bool option;
  auto_accept_requests: bool option
}

type resource_type = | EQUIPMENT
  | ROOM

type update_resource_request = {
  hidden_from_global_address_list: bool option;
  type_: resource_type option;
  description: string option;
  booking_options: booking_options option;
  name: string option;
  resource_id: string;
  organization_id: string
}

type update_primary_email_address_response = unit

type update_primary_email_address_request = {
  email: string;
  entity_id: string;
  organization_id: string
}

type update_mobile_device_access_rule_response = unit

type mobile_device_access_rule_effect = | DENY
  | ALLOW

type update_mobile_device_access_rule_request = {
  not_device_user_agents: string list option;
  device_user_agents: string list option;
  not_device_operating_systems: string list option;
  device_operating_systems: string list option;
  not_device_models: string list option;
  device_models: string list option;
  not_device_types: string list option;
  device_types: string list option;
  effect: mobile_device_access_rule_effect;
  description: string option;
  name: string;
  mobile_device_access_rule_id: string;
  organization_id: string
}

type update_mailbox_quota_response = unit

type update_mailbox_quota_request = {
  mailbox_quota: int;
  user_id: string;
  organization_id: string
}

type resource_not_found_exception = {
  message: string option
}

type limit_exceeded_exception = {
  message: string option
}

type update_impersonation_role_response = unit

type impersonation_role_type = | READ_ONLY
  | FULL_ACCESS

type access_effect = | DENY
  | ALLOW

type impersonation_rule = {
  not_target_users: string list option;
  target_users: string list option;
  effect: access_effect;
  description: string option;
  name: string option;
  impersonation_rule_id: string
}

type update_impersonation_role_request = {
  rules: impersonation_rule list;
  description: string option;
  type_: impersonation_role_type;
  name: string;
  impersonation_role_id: string;
  organization_id: string
}

type update_group_response = unit

type update_group_request = {
  hidden_from_global_address_list: bool option;
  group_id: string;
  organization_id: string
}

type update_default_mail_domain_response = unit

type update_default_mail_domain_request = {
  domain_name: string;
  organization_id: string
}

type update_availability_configuration_response = unit

type ews_availability_provider = {
  ews_password: string;
  ews_username: string;
  ews_endpoint: string
}

type lambda_availability_provider = {
  lambda_arn: string
}

type update_availability_configuration_request = {
  lambda_provider: lambda_availability_provider option;
  ews_provider: ews_availability_provider option;
  domain_name: string;
  organization_id: string
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_ar_n: string
}

type test_availability_configuration_response = {
  failure_reason: string option;
  test_passed: bool option
}

type test_availability_configuration_request = {
  lambda_provider: lambda_availability_provider option;
  ews_provider: ews_availability_provider option;
  domain_name: string option;
  organization_id: string
}

type too_many_tags_exception = {
  message: string option
}

type tag_resource_response = unit

type tag = {
  value: string;
  key: string
}

type tag_resource_request = {
  tags: tag list;
  resource_ar_n: string
}

type start_mailbox_export_job_response = {
  job_id: string option
}

type start_mailbox_export_job_request = {
  s3_prefix: string;
  s3_bucket_name: string;
  kms_key_arn: string;
  role_arn: string;
  description: string option;
  entity_id: string;
  organization_id: string;
  client_token: string
}

type invalid_password_exception = {
  message: string option
}

type reset_password_response = unit

type reset_password_request = {
  password: string;
  user_id: string;
  organization_id: string
}

type entity_already_registered_exception = {
  message: string option
}

type register_to_work_mail_response = unit

type register_to_work_mail_request = {
  email: string;
  entity_id: string;
  organization_id: string
}

type mail_domain_in_use_exception = {
  message: string option
}

type register_mail_domain_response = unit

type register_mail_domain_request = {
  domain_name: string;
  organization_id: string;
  client_token: string option
}

type put_retention_policy_response = unit

type folder_name = | JUNK_EMAIL
  | DRAFTS
  | SENT_ITEMS
  | DELETED_ITEMS
  | INBOX

type retention_action = | PERMANENTLY_DELETE
  | DELETE
  | NONE

type folder_configuration = {
  period: int option;
  action: retention_action;
  name: folder_name
}

type put_retention_policy_request = {
  folder_configurations: folder_configuration list;
  description: string option;
  name: string;
  id: string option;
  organization_id: string
}

type put_mobile_device_access_override_response = unit

type put_mobile_device_access_override_request = {
  description: string option;
  effect: mobile_device_access_rule_effect;
  device_id: string;
  user_id: string;
  organization_id: string
}

type put_mailbox_permissions_response = unit

type permission_type = | SEND_ON_BEHALF
  | SEND_AS
  | FULL_ACCESS

type put_mailbox_permissions_request = {
  permission_values: permission_type list;
  grantee_id: string;
  entity_id: string;
  organization_id: string
}

type put_inbound_dmarc_settings_response = unit

type put_inbound_dmarc_settings_request = {
  enforced: bool;
  organization_id: string
}

type put_email_monitoring_configuration_response = unit

type put_email_monitoring_configuration_request = {
  log_group_arn: string;
  role_arn: string;
  organization_id: string
}

type put_access_control_rule_response = unit

type access_control_rule_effect = | DENY
  | ALLOW

type put_access_control_rule_request = {
  not_impersonation_role_ids: string list option;
  impersonation_role_ids: string list option;
  organization_id: string;
  not_user_ids: string list option;
  user_ids: string list option;
  not_actions: string list option;
  actions: string list option;
  not_ip_ranges: string list option;
  ip_ranges: string list option;
  description: string;
  effect: access_control_rule_effect;
  name: string
}

type entity_state = | DELETED
  | DISABLED
  | ENABLED

type user = {
  disabled_date: float option;
  enabled_date: float option;
  user_role: user_role option;
  state: entity_state option;
  display_name: string option;
  name: string option;
  email: string option;
  id: string option
}

type list_users_response = {
  next_token: string option;
  users: user list option
}

type list_users_filters = {
  state: entity_state option;
  primary_email_prefix: string option;
  display_name_prefix: string option;
  username_prefix: string option
}

type list_users_request = {
  filters: list_users_filters option;
  max_results: int option;
  next_token: string option;
  organization_id: string
}

type list_tags_for_resource_response = {
  tags: tag list option
}

type list_tags_for_resource_request = {
  resource_ar_n: string
}

type resource = {
  description: string option;
  disabled_date: float option;
  enabled_date: float option;
  state: entity_state option;
  type_: resource_type option;
  name: string option;
  email: string option;
  id: string option
}

type list_resources_response = {
  next_token: string option;
  resources: resource list option
}

type list_resources_filters = {
  state: entity_state option;
  primary_email_prefix: string option;
  name_prefix: string option
}

type list_resources_request = {
  filters: list_resources_filters option;
  max_results: int option;
  next_token: string option;
  organization_id: string
}

type member_type = | USER
  | GROUP

type delegate = {
  type_: member_type;
  id: string
}

type list_resource_delegates_response = {
  next_token: string option;
  delegates: delegate list option
}

type list_resource_delegates_request = {
  max_results: int option;
  next_token: string option;
  resource_id: string;
  organization_id: string
}

type organization_summary = {
  state: string option;
  error_message: string option;
  default_mail_domain: string option;
  alias: string option;
  organization_id: string option
}

type list_organizations_response = {
  next_token: string option;
  organization_summaries: organization_summary list option
}

type list_organizations_request = {
  max_results: int option;
  next_token: string option
}

type mobile_device_access_rule = {
  date_modified: float option;
  date_created: float option;
  not_device_user_agents: string list option;
  device_user_agents: string list option;
  not_device_operating_systems: string list option;
  device_operating_systems: string list option;
  not_device_models: string list option;
  device_models: string list option;
  not_device_types: string list option;
  device_types: string list option;
  effect: mobile_device_access_rule_effect option;
  description: string option;
  name: string option;
  mobile_device_access_rule_id: string option
}

type list_mobile_device_access_rules_response = {
  rules: mobile_device_access_rule list option
}

type list_mobile_device_access_rules_request = {
  organization_id: string
}

type mobile_device_access_override = {
  date_modified: float option;
  date_created: float option;
  description: string option;
  effect: mobile_device_access_rule_effect option;
  device_id: string option;
  user_id: string option
}

type list_mobile_device_access_overrides_response = {
  next_token: string option;
  overrides: mobile_device_access_override list option
}

type list_mobile_device_access_overrides_request = {
  max_results: int option;
  next_token: string option;
  device_id: string option;
  user_id: string option;
  organization_id: string
}

type mail_domain_summary = {
  default_domain: bool option;
  domain_name: string option
}

type list_mail_domains_response = {
  next_token: string option;
  mail_domains: mail_domain_summary list option
}

type list_mail_domains_request = {
  next_token: string option;
  max_results: int option;
  organization_id: string
}

type permission = {
  permission_values: permission_type list;
  grantee_type: member_type;
  grantee_id: string
}

type list_mailbox_permissions_response = {
  next_token: string option;
  permissions: permission list option
}

type list_mailbox_permissions_request = {
  max_results: int option;
  next_token: string option;
  entity_id: string;
  organization_id: string
}

type mailbox_export_job_state = | CANCELLED
  | FAILED
  | COMPLETED
  | RUNNING

type mailbox_export_job = {
  end_time: float option;
  start_time: float option;
  state: mailbox_export_job_state option;
  estimated_progress: int option;
  s3_path: string option;
  s3_bucket_name: string option;
  description: string option;
  entity_id: string option;
  job_id: string option
}

type list_mailbox_export_jobs_response = {
  next_token: string option;
  jobs: mailbox_export_job list option
}

type list_mailbox_export_jobs_request = {
  max_results: int option;
  next_token: string option;
  organization_id: string
}

type impersonation_role = {
  date_modified: float option;
  date_created: float option;
  type_: impersonation_role_type option;
  name: string option;
  impersonation_role_id: string option
}

type list_impersonation_roles_response = {
  next_token: string option;
  roles: impersonation_role list option
}

type list_impersonation_roles_request = {
  max_results: int option;
  next_token: string option;
  organization_id: string
}

type group_identifier = {
  group_name: string option;
  group_id: string option
}

type list_groups_for_entity_response = {
  next_token: string option;
  groups: group_identifier list option
}

type list_groups_for_entity_filters = {
  group_name_prefix: string option
}

type list_groups_for_entity_request = {
  max_results: int option;
  next_token: string option;
  filters: list_groups_for_entity_filters option;
  entity_id: string;
  organization_id: string
}

type group = {
  disabled_date: float option;
  enabled_date: float option;
  state: entity_state option;
  name: string option;
  email: string option;
  id: string option
}

type list_groups_response = {
  next_token: string option;
  groups: group list option
}

type list_groups_filters = {
  state: entity_state option;
  primary_email_prefix: string option;
  name_prefix: string option
}

type list_groups_request = {
  filters: list_groups_filters option;
  max_results: int option;
  next_token: string option;
  organization_id: string
}

type member = {
  disabled_date: float option;
  enabled_date: float option;
  state: entity_state option;
  type_: member_type option;
  name: string option;
  id: string option
}

type list_group_members_response = {
  next_token: string option;
  members: member list option
}

type list_group_members_request = {
  max_results: int option;
  next_token: string option;
  group_id: string;
  organization_id: string
}

type availability_provider_type = | LAMBDA
  | EWS

type redacted_ews_availability_provider = {
  ews_username: string option;
  ews_endpoint: string option
}

type availability_configuration = {
  date_modified: float option;
  date_created: float option;
  lambda_provider: lambda_availability_provider option;
  ews_provider: redacted_ews_availability_provider option;
  provider_type: availability_provider_type option;
  domain_name: string option
}

type list_availability_configurations_response = {
  next_token: string option;
  availability_configurations: availability_configuration list option
}

type list_availability_configurations_request = {
  next_token: string option;
  max_results: int option;
  organization_id: string
}

type list_aliases_response = {
  next_token: string option;
  aliases: string list option
}

type list_aliases_request = {
  max_results: int option;
  next_token: string option;
  entity_id: string;
  organization_id: string
}

type access_control_rule = {
  not_impersonation_role_ids: string list option;
  impersonation_role_ids: string list option;
  date_modified: float option;
  date_created: float option;
  not_user_ids: string list option;
  user_ids: string list option;
  not_actions: string list option;
  actions: string list option;
  not_ip_ranges: string list option;
  ip_ranges: string list option;
  description: string option;
  effect: access_control_rule_effect option;
  name: string option
}

type list_access_control_rules_response = {
  rules: access_control_rule list option
}

type list_access_control_rules_request = {
  organization_id: string
}

type get_mobile_device_access_override_response = {
  date_modified: float option;
  date_created: float option;
  description: string option;
  effect: mobile_device_access_rule_effect option;
  device_id: string option;
  user_id: string option
}

type get_mobile_device_access_override_request = {
  device_id: string;
  user_id: string;
  organization_id: string
}

type mobile_device_access_matched_rule = {
  name: string option;
  mobile_device_access_rule_id: string option
}

type get_mobile_device_access_effect_response = {
  matched_rules: mobile_device_access_matched_rule list option;
  effect: mobile_device_access_rule_effect option
}

type get_mobile_device_access_effect_request = {
  device_user_agent: string option;
  device_operating_system: string option;
  device_model: string option;
  device_type: string option;
  organization_id: string
}

type dns_record = {
  value: string option;
  hostname: string option;
  type_: string option
}

type dns_record_verification_status = | FAILED
  | VERIFIED
  | PENDING

type get_mail_domain_response = {
  dkim_verification_status: dns_record_verification_status option;
  ownership_verification_status: dns_record_verification_status option;
  is_default: bool option;
  is_test_domain: bool option;
  records: dns_record list option
}

type get_mail_domain_request = {
  domain_name: string;
  organization_id: string
}

type get_mailbox_details_response = {
  mailbox_size: float option;
  mailbox_quota: int option
}

type get_mailbox_details_request = {
  user_id: string;
  organization_id: string
}

type impersonation_matched_rule = {
  name: string option;
  impersonation_rule_id: string option
}

type get_impersonation_role_effect_response = {
  matched_rules: impersonation_matched_rule list option;
  effect: access_effect option;
  type_: impersonation_role_type option
}

type get_impersonation_role_effect_request = {
  target_user: string;
  impersonation_role_id: string;
  organization_id: string
}

type get_impersonation_role_response = {
  date_modified: float option;
  date_created: float option;
  rules: impersonation_rule list option;
  description: string option;
  type_: impersonation_role_type option;
  name: string option;
  impersonation_role_id: string option
}

type get_impersonation_role_request = {
  impersonation_role_id: string;
  organization_id: string
}

type get_default_retention_policy_response = {
  folder_configurations: folder_configuration list option;
  description: string option;
  name: string option;
  id: string option
}

type get_default_retention_policy_request = {
  organization_id: string
}

type get_access_control_effect_response = {
  matched_rules: string list option;
  effect: access_control_rule_effect option
}

type get_access_control_effect_request = {
  impersonation_role_id: string option;
  user_id: string option;
  action: string;
  ip_address: string;
  organization_id: string
}

type disassociate_member_from_group_response = unit

type disassociate_member_from_group_request = {
  member_id: string;
  group_id: string;
  organization_id: string
}

type disassociate_delegate_from_resource_response = unit

type disassociate_delegate_from_resource_request = {
  entity_id: string;
  resource_id: string;
  organization_id: string
}

type describe_user_response = {
  office: string option;
  country: string option;
  department: string option;
  zip_code: string option;
  company: string option;
  city: string option;
  job_title: string option;
  street: string option;
  telephone: string option;
  initials: string option;
  hidden_from_global_address_list: bool option;
  last_name: string option;
  first_name: string option;
  mailbox_deprovisioned_date: float option;
  mailbox_provisioned_date: float option;
  disabled_date: float option;
  enabled_date: float option;
  user_role: user_role option;
  state: entity_state option;
  display_name: string option;
  email: string option;
  name: string option;
  user_id: string option
}

type describe_user_request = {
  user_id: string;
  organization_id: string
}

type describe_resource_response = {
  hidden_from_global_address_list: bool option;
  description: string option;
  disabled_date: float option;
  enabled_date: float option;
  state: entity_state option;
  booking_options: booking_options option;
  type_: resource_type option;
  name: string option;
  email: string option;
  resource_id: string option
}

type describe_resource_request = {
  resource_id: string;
  organization_id: string
}

type describe_organization_response = {
  interoperability_enabled: bool option;
  migration_admin: string option;
  ar_n: string option;
  error_message: string option;
  completed_date: float option;
  default_mail_domain: string option;
  directory_type: string option;
  directory_id: string option;
  state: string option;
  alias: string option;
  organization_id: string option
}

type describe_organization_request = {
  organization_id: string
}

type describe_mailbox_export_job_response = {
  end_time: float option;
  start_time: float option;
  error_info: string option;
  state: mailbox_export_job_state option;
  estimated_progress: int option;
  s3_path: string option;
  s3_prefix: string option;
  s3_bucket_name: string option;
  kms_key_arn: string option;
  role_arn: string option;
  description: string option;
  entity_id: string option
}

type describe_mailbox_export_job_request = {
  organization_id: string;
  job_id: string
}

type describe_inbound_dmarc_settings_response = {
  enforced: bool option
}

type describe_inbound_dmarc_settings_request = {
  organization_id: string
}

type describe_group_response = {
  hidden_from_global_address_list: bool option;
  disabled_date: float option;
  enabled_date: float option;
  state: entity_state option;
  email: string option;
  name: string option;
  group_id: string option
}

type describe_group_request = {
  group_id: string;
  organization_id: string
}

type entity_type = | RESOURCE
  | USER
  | GROUP

type describe_entity_response = {
  type_: entity_type option;
  name: string option;
  entity_id: string option
}

type describe_entity_request = {
  email: string;
  organization_id: string
}

type describe_email_monitoring_configuration_response = {
  log_group_arn: string option;
  role_arn: string option
}

type describe_email_monitoring_configuration_request = {
  organization_id: string
}

type invalid_custom_ses_configuration_exception = {
  message: string option
}

type deregister_mail_domain_response = unit

type deregister_mail_domain_request = {
  domain_name: string;
  organization_id: string
}

type deregister_from_work_mail_response = unit

type deregister_from_work_mail_request = {
  entity_id: string;
  organization_id: string
}

type delete_user_response = unit

type delete_user_request = {
  user_id: string;
  organization_id: string
}

type delete_retention_policy_response = unit

type delete_retention_policy_request = {
  id: string;
  organization_id: string
}

type delete_resource_response = unit

type delete_resource_request = {
  resource_id: string;
  organization_id: string
}

type delete_organization_response = {
  state: string option;
  organization_id: string option
}

type delete_organization_request = {
  force_delete: bool option;
  delete_directory: bool;
  organization_id: string;
  client_token: string option
}

type delete_mobile_device_access_rule_response = unit

type delete_mobile_device_access_rule_request = {
  mobile_device_access_rule_id: string;
  organization_id: string
}

type delete_mobile_device_access_override_response = unit

type delete_mobile_device_access_override_request = {
  device_id: string;
  user_id: string;
  organization_id: string
}

type delete_mailbox_permissions_response = unit

type delete_mailbox_permissions_request = {
  grantee_id: string;
  entity_id: string;
  organization_id: string
}

type delete_impersonation_role_response = unit

type delete_impersonation_role_request = {
  impersonation_role_id: string;
  organization_id: string
}

type delete_group_response = unit

type delete_group_request = {
  group_id: string;
  organization_id: string
}

type delete_email_monitoring_configuration_response = unit

type delete_email_monitoring_configuration_request = {
  organization_id: string
}

type delete_availability_configuration_response = unit

type delete_availability_configuration_request = {
  domain_name: string;
  organization_id: string
}

type delete_alias_response = unit

type delete_alias_request = {
  alias: string;
  entity_id: string;
  organization_id: string
}

type delete_access_control_rule_response = unit

type delete_access_control_rule_request = {
  name: string;
  organization_id: string
}

type reserved_name_exception = {
  message: string option
}

type create_user_response = {
  user_id: string option
}

type create_user_request = {
  hidden_from_global_address_list: bool option;
  last_name: string option;
  first_name: string option;
  role: user_role option;
  password: string option;
  display_name: string;
  name: string;
  organization_id: string
}

type create_resource_response = {
  resource_id: string option
}

type create_resource_request = {
  hidden_from_global_address_list: bool option;
  description: string option;
  type_: resource_type;
  name: string;
  organization_id: string
}

type directory_in_use_exception = {
  message: string option
}

type create_organization_response = {
  organization_id: string option
}

type domain = {
  hosted_zone_id: string option;
  domain_name: string
}

type create_organization_request = {
  enable_interoperability: bool option;
  kms_key_arn: string option;
  domains: domain list option;
  client_token: string option;
  alias: string;
  directory_id: string option
}

type create_mobile_device_access_rule_response = {
  mobile_device_access_rule_id: string option
}

type create_mobile_device_access_rule_request = {
  not_device_user_agents: string list option;
  device_user_agents: string list option;
  not_device_operating_systems: string list option;
  device_operating_systems: string list option;
  not_device_models: string list option;
  device_models: string list option;
  not_device_types: string list option;
  device_types: string list option;
  effect: mobile_device_access_rule_effect;
  description: string option;
  name: string;
  client_token: string option;
  organization_id: string
}

type create_impersonation_role_response = {
  impersonation_role_id: string option
}

type create_impersonation_role_request = {
  rules: impersonation_rule list;
  description: string option;
  type_: impersonation_role_type;
  name: string;
  organization_id: string;
  client_token: string option
}

type create_group_response = {
  group_id: string option
}

type create_group_request = {
  hidden_from_global_address_list: bool option;
  name: string;
  organization_id: string
}

type create_availability_configuration_response = unit

type create_availability_configuration_request = {
  lambda_provider: lambda_availability_provider option;
  ews_provider: ews_availability_provider option;
  domain_name: string;
  organization_id: string;
  client_token: string option
}

type create_alias_response = unit

type create_alias_request = {
  alias: string;
  entity_id: string;
  organization_id: string
}

type cancel_mailbox_export_job_response = unit

type cancel_mailbox_export_job_request = {
  organization_id: string;
  job_id: string;
  client_token: string
}

type assume_impersonation_role_response = {
  expires_in: int option;
  token: string option
}

type assume_impersonation_role_request = {
  impersonation_role_id: string;
  organization_id: string
}

type associate_member_to_group_response = unit

type associate_member_to_group_request = {
  member_id: string;
  group_id: string;
  organization_id: string
}

type associate_delegate_to_resource_response = unit

type associate_delegate_to_resource_request = {
  entity_id: string;
  resource_id: string;
  organization_id: string
}



type base_document = Json.t

val make_update_user_response :
  unit -> update_user_response

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

module UpdateUser : sig
  val request :
    Smaws_Lib.Context.t ->
      update_user_request ->
        (update_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      update_resource_request ->
        (update_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryUnavailableException of directory_unavailable_exception
            | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidConfigurationException of invalid_configuration_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdatePrimaryEmailAddress : sig
  val request :
    Smaws_Lib.Context.t ->
      update_primary_email_address_request ->
        (update_primary_email_address_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateMobileDeviceAccessRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_mobile_device_access_rule_request ->
        (update_mobile_device_access_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module UpdateMailboxQuota : sig
  val request :
    Smaws_Lib.Context.t ->
      update_mailbox_quota_request ->
        (update_mailbox_quota_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module UpdateImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      update_impersonation_role_request ->
        (update_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_group_request ->
        (update_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateDefaultMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      update_default_mail_domain_request ->
        (update_default_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module UpdateAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_availability_configuration_request ->
        (update_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TestAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      test_availability_configuration_request ->
        (test_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module StartMailboxExportJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_mailbox_export_job_request ->
        (start_mailbox_export_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ResetPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_password_request ->
        (reset_password_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidPasswordException of invalid_password_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module RegisterToWorkMail : sig
  val request :
    Smaws_Lib.Context.t ->
      register_to_work_mail_request ->
        (register_to_work_mail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityAlreadyRegisteredException of entity_already_registered_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module RegisterMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      register_mail_domain_request ->
        (register_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `MailDomainInUseException of mail_domain_in_use_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module PutRetentionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_retention_policy_request ->
        (put_retention_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module PutMobileDeviceAccessOverride : sig
  val request :
    Smaws_Lib.Context.t ->
      put_mobile_device_access_override_request ->
        (put_mobile_device_access_override_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module PutMailboxPermissions : sig
  val request :
    Smaws_Lib.Context.t ->
      put_mailbox_permissions_request ->
        (put_mailbox_permissions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module PutInboundDmarcSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      put_inbound_dmarc_settings_request ->
        (put_inbound_dmarc_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module PutEmailMonitoringConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_email_monitoring_configuration_request ->
        (put_email_monitoring_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutAccessControlRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_access_control_rule_request ->
        (put_access_control_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListUsers : sig
  val request :
    Smaws_Lib.Context.t ->
      list_users_request ->
        (list_users_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_request ->
        (list_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ListResourceDelegates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_delegates_request ->
        (list_resource_delegates_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ListOrganizations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_organizations_request ->
        (list_organizations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            
        ]
      ) result
end

module ListMobileDeviceAccessRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_device_access_rules_request ->
        (list_mobile_device_access_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListMobileDeviceAccessOverrides : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_device_access_overrides_request ->
        (list_mobile_device_access_overrides_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListMailDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mail_domains_request ->
        (list_mail_domains_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListMailboxPermissions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mailbox_permissions_request ->
        (list_mailbox_permissions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListMailboxExportJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mailbox_export_jobs_request ->
        (list_mailbox_export_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListImpersonationRoles : sig
  val request :
    Smaws_Lib.Context.t ->
      list_impersonation_roles_request ->
        (list_impersonation_roles_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListGroupsForEntity : sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_for_entity_request ->
        (list_groups_for_entity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_request ->
        (list_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListGroupMembers : sig
  val request :
    Smaws_Lib.Context.t ->
      list_group_members_request ->
        (list_group_members_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListAvailabilityConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_availability_configurations_request ->
        (list_availability_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListAliases : sig
  val request :
    Smaws_Lib.Context.t ->
      list_aliases_request ->
        (list_aliases_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module ListAccessControlRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_control_rules_request ->
        (list_access_control_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module GetMobileDeviceAccessOverride : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_device_access_override_request ->
        (get_mobile_device_access_override_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetMobileDeviceAccessEffect : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_device_access_effect_request ->
        (get_mobile_device_access_effect_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module GetMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mail_domain_request ->
        (get_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module GetMailboxDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mailbox_details_request ->
        (get_mailbox_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module GetImpersonationRoleEffect : sig
  val request :
    Smaws_Lib.Context.t ->
      get_impersonation_role_effect_request ->
        (get_impersonation_role_effect_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      get_impersonation_role_request ->
        (get_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetDefaultRetentionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_default_retention_policy_request ->
        (get_default_retention_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module GetAccessControlEffect : sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_control_effect_request ->
        (get_access_control_effect_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateMemberFromGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_member_from_group_request ->
        (disassociate_member_from_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DisassociateDelegateFromResource : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_delegate_from_resource_request ->
        (disassociate_delegate_from_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeUser : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_user_request ->
        (describe_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeResource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_resource_request ->
        (describe_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_request ->
        (describe_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            
        ]
      ) result
end

module DescribeMailboxExportJob : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_mailbox_export_job_request ->
        (describe_mailbox_export_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeInboundDmarcSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_inbound_dmarc_settings_request ->
        (describe_inbound_dmarc_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_group_request ->
        (describe_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeEntity : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_entity_request ->
        (describe_entity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DescribeEmailMonitoringConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_email_monitoring_configuration_request ->
        (describe_email_monitoring_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeregisterMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_mail_domain_request ->
        (deregister_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidCustomSesConfigurationException of invalid_custom_ses_configuration_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainInUseException of mail_domain_in_use_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeregisterFromWorkMail : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_from_work_mail_request ->
        (deregister_from_work_mail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteUser : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_user_request ->
        (delete_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteRetentionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_retention_policy_request ->
        (delete_retention_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteResource : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_request ->
        (delete_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_request ->
        (delete_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteMobileDeviceAccessRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mobile_device_access_rule_request ->
        (delete_mobile_device_access_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteMobileDeviceAccessOverride : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mobile_device_access_override_request ->
        (delete_mobile_device_access_override_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteMailboxPermissions : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mailbox_permissions_request ->
        (delete_mailbox_permissions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_impersonation_role_request ->
        (delete_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_group_request ->
        (delete_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteEmailMonitoringConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_email_monitoring_configuration_request ->
        (delete_email_monitoring_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_availability_configuration_request ->
        (delete_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alias_request ->
        (delete_alias_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module DeleteAccessControlRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_control_rule_request ->
        (delete_access_control_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CreateUser : sig
  val request :
    Smaws_Lib.Context.t ->
      create_user_request ->
        (create_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidPasswordException of invalid_password_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ReservedNameException of reserved_name_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      create_resource_request ->
        (create_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ReservedNameException of reserved_name_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      create_organization_request ->
        (create_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryInUseException of directory_in_use_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NameAvailabilityException of name_availability_exception
            
        ]
      ) result
end

module CreateMobileDeviceAccessRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_mobile_device_access_rule_request ->
        (create_mobile_device_access_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CreateImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      create_impersonation_role_request ->
        (create_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CreateGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_group_request ->
        (create_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ReservedNameException of reserved_name_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_availability_configuration_request ->
        (create_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CreateAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (create_alias_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module CancelMailboxExportJob : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_mailbox_export_job_request ->
        (cancel_mailbox_export_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
end

module AssumeImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      assume_impersonation_role_request ->
        (assume_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateMemberToGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_member_to_group_request ->
        (associate_member_to_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module AssociateDelegateToResource : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_delegate_to_resource_request ->
        (associate_delegate_to_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

