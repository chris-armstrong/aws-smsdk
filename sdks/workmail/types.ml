open Smaws_Lib
let service =
  Service.{
    namespace = "workmail";
    endpointPrefix = "workmail";
    version = "2017-10-01";
    protocol = AwsJson_1_1
  };
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

