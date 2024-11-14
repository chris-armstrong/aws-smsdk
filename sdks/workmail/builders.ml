[@@@warning "-39"]
open Types
let make_update_user_response  () : update_user_response =
()

let make_update_user_request 
  ?(office : string option)
  ?(country : string option)
  ?(department : string option)
  ?(zip_code : string option)
  ?(company : string option)
  ?(city : string option)
  ?(job_title : string option)
  ?(street : string option)
  ?(telephone : string option)
  ?(initials : string option)
  ?(hidden_from_global_address_list : bool option)
  ?(last_name : string option)
  ?(first_name : string option)
  ?(display_name : string option)
  ?(role : user_role option)
  ~(user_id : string)
  ~(organization_id : string)
  () : update_user_request = {
  office;
  country;
  department;
  zip_code;
  company;
  city;
  job_title;
  street;
  telephone;
  initials;
  hidden_from_global_address_list;
  last_name;
  first_name;
  display_name;
  role;
  user_id;
  organization_id;
   }

let make_update_resource_response  () : update_resource_response =
()

let make_booking_options 
  ?(auto_decline_conflicting_requests : bool option)
  ?(auto_decline_recurring_requests : bool option)
  ?(auto_accept_requests : bool option)
  () : booking_options = {
  auto_decline_conflicting_requests;
  auto_decline_recurring_requests;
  auto_accept_requests;
   }

let make_update_resource_request 
  ?(hidden_from_global_address_list : bool option)
  ?(type_ : resource_type option)
  ?(description : string option)
  ?(booking_options : booking_options option)
  ?(name : string option)
  ~(resource_id : string)
  ~(organization_id : string)
  () : update_resource_request = {
  hidden_from_global_address_list;
  type_;
  description;
  booking_options;
  name;
  resource_id;
  organization_id;
   }

let make_update_primary_email_address_response  ()
: update_primary_email_address_response =
()

let make_update_primary_email_address_request 
  ~(email : string) ~(entity_id : string) ~(organization_id : string) ()
: update_primary_email_address_request = {
  email; entity_id; organization_id; 
}

let make_update_mobile_device_access_rule_response  ()
: update_mobile_device_access_rule_response =
()

let make_update_mobile_device_access_rule_request 
  ?(not_device_user_agents : string list option)
  ?(device_user_agents : string list option)
  ?(not_device_operating_systems : string list option)
  ?(device_operating_systems : string list option)
  ?(not_device_models : string list option)
  ?(device_models : string list option)
  ?(not_device_types : string list option)
  ?(device_types : string list option)
  ?(description : string option)
  ~(effect_ : mobile_device_access_rule_effect)
  ~(name : string)
  ~(mobile_device_access_rule_id : string)
  ~(organization_id : string)
  () : update_mobile_device_access_rule_request = {
  not_device_user_agents;
  device_user_agents;
  not_device_operating_systems;
  device_operating_systems;
  not_device_models;
  device_models;
  not_device_types;
  device_types;
  effect_;
  description;
  name;
  mobile_device_access_rule_id;
  organization_id;
   }

let make_update_mailbox_quota_response  () : update_mailbox_quota_response =
()

let make_update_mailbox_quota_request 
  ~(mailbox_quota : int) ~(user_id : string) ~(organization_id : string) ()
: update_mailbox_quota_request = { mailbox_quota; user_id; organization_id; 
}

let make_update_impersonation_role_response  ()
: update_impersonation_role_response = ()

let make_impersonation_rule 
  ?(not_target_users : string list option)
  ?(target_users : string list option)
  ?(description : string option)
  ?(name : string option)
  ~(effect_ : access_effect)
  ~(impersonation_rule_id : string)
  () : impersonation_rule = {
  not_target_users;
  target_users;
  effect_;
  description;
  name;
  impersonation_rule_id;
   }

let make_update_impersonation_role_request 
  ?(description : string option)
  ~(rules : impersonation_rule list)
  ~(type_ : impersonation_role_type)
  ~(name : string)
  ~(impersonation_role_id : string)
  ~(organization_id : string)
  () : update_impersonation_role_request = {
  rules; description; type_; name; impersonation_role_id; organization_id; 
}

let make_update_group_response  () : update_group_response =
()

let make_update_group_request 
  ?(hidden_from_global_address_list : bool option)
  ~(group_id : string)
  ~(organization_id : string)
  () : update_group_request = {
  hidden_from_global_address_list; group_id; organization_id; 
}

let make_update_default_mail_domain_response  ()
: update_default_mail_domain_response =
()

let make_update_default_mail_domain_request 
  ~(domain_name : string) ~(organization_id : string) ()
: update_default_mail_domain_request = { domain_name; organization_id; 
}

let make_update_availability_configuration_response  ()
: update_availability_configuration_response =
()

let make_ews_availability_provider 
  ~(ews_password : string)
  ~(ews_username : string)
  ~(ews_endpoint : string)
  () : ews_availability_provider = {
  ews_password; ews_username; ews_endpoint; 
}

let make_lambda_availability_provider  ~(lambda_arn : string) ()
: lambda_availability_provider = { lambda_arn; 
}

let make_update_availability_configuration_request 
  ?(lambda_provider : lambda_availability_provider option)
  ?(ews_provider : ews_availability_provider option)
  ~(domain_name : string)
  ~(organization_id : string)
  () : update_availability_configuration_request = {
  lambda_provider; ews_provider; domain_name; organization_id; 
}

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_ar_n : string) ()
: untag_resource_request = { tag_keys; resource_ar_n; 
}

let make_test_availability_configuration_response 
  ?(failure_reason : string option) ?(test_passed : bool option) ()
: test_availability_configuration_response = { failure_reason; test_passed; 
}

let make_test_availability_configuration_request 
  ?(lambda_provider : lambda_availability_provider option)
  ?(ews_provider : ews_availability_provider option)
  ?(domain_name : string option)
  ~(organization_id : string)
  () : test_availability_configuration_request = {
  lambda_provider; ews_provider; domain_name; organization_id; 
}

let make_tag_resource_response  () : tag_resource_response = ()

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_request 
  ~(tags : tag list) ~(resource_ar_n : string) () : tag_resource_request = {
  tags; resource_ar_n;  }

let make_start_mailbox_export_job_response  ?(job_id : string option) ()
: start_mailbox_export_job_response = { job_id; 
}

let make_start_mailbox_export_job_request 
  ?(description : string option)
  ~(s3_prefix : string)
  ~(s3_bucket_name : string)
  ~(kms_key_arn : string)
  ~(role_arn : string)
  ~(entity_id : string)
  ~(organization_id : string)
  ~(client_token : string)
  () : start_mailbox_export_job_request = {
  s3_prefix;
  s3_bucket_name;
  kms_key_arn;
  role_arn;
  description;
  entity_id;
  organization_id;
  client_token;
   }

let make_reset_password_response  () : reset_password_response =
()

let make_reset_password_request 
  ~(password : string) ~(user_id : string) ~(organization_id : string) ()
: reset_password_request = { password; user_id; organization_id; 
}

let make_register_to_work_mail_response  () : register_to_work_mail_response
= ()

let make_register_to_work_mail_request 
  ~(email : string) ~(entity_id : string) ~(organization_id : string) ()
: register_to_work_mail_request = { email; entity_id; organization_id; 
}

let make_register_mail_domain_response  () : register_mail_domain_response =
()

let make_register_mail_domain_request 
  ?(client_token : string option)
  ~(domain_name : string)
  ~(organization_id : string)
  () : register_mail_domain_request = {
  domain_name; organization_id; client_token; 
}

let make_put_retention_policy_response  () : put_retention_policy_response =
()

let make_folder_configuration 
  ?(period : int option)
  ~(action : retention_action)
  ~(name : folder_name)
  () : folder_configuration = { period; action; name; 
}

let make_put_retention_policy_request 
  ?(description : string option)
  ?(id : string option)
  ~(folder_configurations : folder_configuration list)
  ~(name : string)
  ~(organization_id : string)
  () : put_retention_policy_request = {
  folder_configurations; description; name; id; organization_id; 
}

let make_put_mobile_device_access_override_response  ()
: put_mobile_device_access_override_response =
()

let make_put_mobile_device_access_override_request 
  ?(description : string option)
  ~(effect_ : mobile_device_access_rule_effect)
  ~(device_id : string)
  ~(user_id : string)
  ~(organization_id : string)
  () : put_mobile_device_access_override_request = {
  description; effect_; device_id; user_id; organization_id; 
}

let make_put_mailbox_permissions_response  ()
: put_mailbox_permissions_response =
()

let make_put_mailbox_permissions_request 
  ~(permission_values : permission_type list)
  ~(grantee_id : string)
  ~(entity_id : string)
  ~(organization_id : string)
  () : put_mailbox_permissions_request = {
  permission_values; grantee_id; entity_id; organization_id; 
}

let make_put_inbound_dmarc_settings_response  ()
: put_inbound_dmarc_settings_response =
()

let make_put_inbound_dmarc_settings_request 
  ~(enforced : bool) ~(organization_id : string) ()
: put_inbound_dmarc_settings_request = { enforced; organization_id; 
}

let make_put_email_monitoring_configuration_response  ()
: put_email_monitoring_configuration_response =
()

let make_put_email_monitoring_configuration_request 
  ~(log_group_arn : string)
  ~(role_arn : string)
  ~(organization_id : string)
  () : put_email_monitoring_configuration_request = {
  log_group_arn; role_arn; organization_id; 
}

let make_put_access_control_rule_response  ()
: put_access_control_rule_response =
()

let make_put_access_control_rule_request 
  ?(not_impersonation_role_ids : string list option)
  ?(impersonation_role_ids : string list option)
  ?(not_user_ids : string list option)
  ?(user_ids : string list option)
  ?(not_actions : string list option)
  ?(actions : string list option)
  ?(not_ip_ranges : string list option)
  ?(ip_ranges : string list option)
  ~(organization_id : string)
  ~(description : string)
  ~(effect_ : access_control_rule_effect)
  ~(name : string)
  () : put_access_control_rule_request = {
  not_impersonation_role_ids;
  impersonation_role_ids;
  organization_id;
  not_user_ids;
  user_ids;
  not_actions;
  actions;
  not_ip_ranges;
  ip_ranges;
  description;
  effect_;
  name;
   }

let make_user 
  ?(disabled_date : float option)
  ?(enabled_date : float option)
  ?(user_role : user_role option)
  ?(state : entity_state option)
  ?(display_name : string option)
  ?(name : string option)
  ?(email : string option)
  ?(id : string option)
  () : user = {
  disabled_date;
  enabled_date;
  user_role;
  state;
  display_name;
  name;
  email;
  id;
   }

let make_list_users_response 
  ?(next_token : string option) ?(users : user list option) ()
: list_users_response = { next_token; users;  }

let make_list_users_filters 
  ?(state : entity_state option)
  ?(primary_email_prefix : string option)
  ?(display_name_prefix : string option)
  ?(username_prefix : string option)
  () : list_users_filters = {
  state; primary_email_prefix; display_name_prefix; username_prefix; 
}

let make_list_users_request 
  ?(filters : list_users_filters option)
  ?(max_results : int option)
  ?(next_token : string option)
  ~(organization_id : string)
  () : list_users_request = {
  filters; max_results; next_token; organization_id; 
}

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request  ~(resource_ar_n : string) ()
: list_tags_for_resource_request = { resource_ar_n;  }

let make_resource 
  ?(description : string option)
  ?(disabled_date : float option)
  ?(enabled_date : float option)
  ?(state : entity_state option)
  ?(type_ : resource_type option)
  ?(name : string option)
  ?(email : string option)
  ?(id : string option)
  () : resource = {
  description; disabled_date; enabled_date; state; type_; name; email; id; 
}

let make_list_resources_response 
  ?(next_token : string option) ?(resources : resource list option) ()
: list_resources_response = { next_token; resources; 
}

let make_list_resources_filters 
  ?(state : entity_state option)
  ?(primary_email_prefix : string option)
  ?(name_prefix : string option)
  () : list_resources_filters = { state; primary_email_prefix; name_prefix; 
}

let make_list_resources_request 
  ?(filters : list_resources_filters option)
  ?(max_results : int option)
  ?(next_token : string option)
  ~(organization_id : string)
  () : list_resources_request = {
  filters; max_results; next_token; organization_id;  }

let make_delegate  ~(type_ : member_type) ~(id : string) () : delegate = {
  type_; id;  }

let make_list_resource_delegates_response 
  ?(next_token : string option) ?(delegates : delegate list option) ()
: list_resource_delegates_response = { next_token; delegates; 
}

let make_list_resource_delegates_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(resource_id : string)
  ~(organization_id : string)
  () : list_resource_delegates_request = {
  max_results; next_token; resource_id; organization_id; 
}

let make_organization_summary 
  ?(state : string option)
  ?(error_message : string option)
  ?(default_mail_domain : string option)
  ?(alias : string option)
  ?(organization_id : string option)
  () : organization_summary = {
  state; error_message; default_mail_domain; alias; organization_id; 
}

let make_list_organizations_response 
  ?(next_token : string option)
  ?(organization_summaries : organization_summary list option)
  () : list_organizations_response = { next_token; organization_summaries; 
}

let make_list_organizations_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_organizations_request = { max_results; next_token; 
}

let make_mobile_device_access_rule 
  ?(date_modified : float option)
  ?(date_created : float option)
  ?(not_device_user_agents : string list option)
  ?(device_user_agents : string list option)
  ?(not_device_operating_systems : string list option)
  ?(device_operating_systems : string list option)
  ?(not_device_models : string list option)
  ?(device_models : string list option)
  ?(not_device_types : string list option)
  ?(device_types : string list option)
  ?(effect_ : mobile_device_access_rule_effect option)
  ?(description : string option)
  ?(name : string option)
  ?(mobile_device_access_rule_id : string option)
  () : mobile_device_access_rule = {
  date_modified;
  date_created;
  not_device_user_agents;
  device_user_agents;
  not_device_operating_systems;
  device_operating_systems;
  not_device_models;
  device_models;
  not_device_types;
  device_types;
  effect_;
  description;
  name;
  mobile_device_access_rule_id;
   }

let make_list_mobile_device_access_rules_response 
  ?(rules : mobile_device_access_rule list option) ()
: list_mobile_device_access_rules_response = { rules; 
}

let make_list_mobile_device_access_rules_request 
  ~(organization_id : string) () : list_mobile_device_access_rules_request =
{ organization_id;  }

let make_mobile_device_access_override 
  ?(date_modified : float option)
  ?(date_created : float option)
  ?(description : string option)
  ?(effect_ : mobile_device_access_rule_effect option)
  ?(device_id : string option)
  ?(user_id : string option)
  () : mobile_device_access_override = {
  date_modified; date_created; description; effect_; device_id; user_id; 
}

let make_list_mobile_device_access_overrides_response 
  ?(next_token : string option)
  ?(overrides : mobile_device_access_override list option)
  () : list_mobile_device_access_overrides_response = {
  next_token; overrides; 
}

let make_list_mobile_device_access_overrides_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(device_id : string option)
  ?(user_id : string option)
  ~(organization_id : string)
  () : list_mobile_device_access_overrides_request = {
  max_results; next_token; device_id; user_id; organization_id; 
}

let make_mail_domain_summary 
  ?(default_domain : bool option) ?(domain_name : string option) ()
: mail_domain_summary = { default_domain; domain_name; 
}

let make_list_mail_domains_response 
  ?(next_token : string option)
  ?(mail_domains : mail_domain_summary list option)
  () : list_mail_domains_response = { next_token; mail_domains; 
}

let make_list_mail_domains_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(organization_id : string)
  () : list_mail_domains_request = {
  next_token; max_results; organization_id;  }

let make_permission 
  ~(permission_values : permission_type list)
  ~(grantee_type : member_type)
  ~(grantee_id : string)
  () : permission = { permission_values; grantee_type; grantee_id; 
}

let make_list_mailbox_permissions_response 
  ?(next_token : string option) ?(permissions : permission list option) ()
: list_mailbox_permissions_response = { next_token; permissions; 
}

let make_list_mailbox_permissions_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(entity_id : string)
  ~(organization_id : string)
  () : list_mailbox_permissions_request = {
  max_results; next_token; entity_id; organization_id; 
}

let make_mailbox_export_job 
  ?(end_time : float option)
  ?(start_time : float option)
  ?(state : mailbox_export_job_state option)
  ?(estimated_progress : int option)
  ?(s3_path : string option)
  ?(s3_bucket_name : string option)
  ?(description : string option)
  ?(entity_id : string option)
  ?(job_id : string option)
  () : mailbox_export_job = {
  end_time;
  start_time;
  state;
  estimated_progress;
  s3_path;
  s3_bucket_name;
  description;
  entity_id;
  job_id;
   }

let make_list_mailbox_export_jobs_response 
  ?(next_token : string option) ?(jobs : mailbox_export_job list option) ()
: list_mailbox_export_jobs_response = { next_token; jobs; 
}

let make_list_mailbox_export_jobs_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(organization_id : string)
  () : list_mailbox_export_jobs_request = {
  max_results; next_token; organization_id;  }

let make_impersonation_role 
  ?(date_modified : float option)
  ?(date_created : float option)
  ?(type_ : impersonation_role_type option)
  ?(name : string option)
  ?(impersonation_role_id : string option)
  () : impersonation_role = {
  date_modified; date_created; type_; name; impersonation_role_id; 
}

let make_list_impersonation_roles_response 
  ?(next_token : string option) ?(roles : impersonation_role list option) ()
: list_impersonation_roles_response = { next_token; roles; 
}

let make_list_impersonation_roles_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(organization_id : string)
  () : list_impersonation_roles_request = {
  max_results; next_token; organization_id;  }

let make_group_identifier 
  ?(group_name : string option) ?(group_id : string option) ()
: group_identifier = { group_name; group_id; 
}

let make_list_groups_for_entity_response 
  ?(next_token : string option) ?(groups : group_identifier list option) ()
: list_groups_for_entity_response = { next_token; groups; 
}

let make_list_groups_for_entity_filters 
  ?(group_name_prefix : string option) () : list_groups_for_entity_filters =
{ group_name_prefix;  }

let make_list_groups_for_entity_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(filters : list_groups_for_entity_filters option)
  ~(entity_id : string)
  ~(organization_id : string)
  () : list_groups_for_entity_request = {
  max_results; next_token; filters; entity_id; organization_id; 
}

let make_group 
  ?(disabled_date : float option)
  ?(enabled_date : float option)
  ?(state : entity_state option)
  ?(name : string option)
  ?(email : string option)
  ?(id : string option)
  () : group = { disabled_date; enabled_date; state; name; email; id; 
}

let make_list_groups_response 
  ?(next_token : string option) ?(groups : group list option) ()
: list_groups_response = { next_token; groups; 
}

let make_list_groups_filters 
  ?(state : entity_state option)
  ?(primary_email_prefix : string option)
  ?(name_prefix : string option)
  () : list_groups_filters = { state; primary_email_prefix; name_prefix; 
}

let make_list_groups_request 
  ?(filters : list_groups_filters option)
  ?(max_results : int option)
  ?(next_token : string option)
  ~(organization_id : string)
  () : list_groups_request = {
  filters; max_results; next_token; organization_id;  }

let make_member 
  ?(disabled_date : float option)
  ?(enabled_date : float option)
  ?(state : entity_state option)
  ?(type_ : member_type option)
  ?(name : string option)
  ?(id : string option)
  () : member = { disabled_date; enabled_date; state; type_; name; id; 
}

let make_list_group_members_response 
  ?(next_token : string option) ?(members : member list option) ()
: list_group_members_response = { next_token; members; 
}

let make_list_group_members_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(group_id : string)
  ~(organization_id : string)
  () : list_group_members_request = {
  max_results; next_token; group_id; organization_id; 
}

let make_redacted_ews_availability_provider 
  ?(ews_username : string option) ?(ews_endpoint : string option) ()
: redacted_ews_availability_provider = { ews_username; ews_endpoint; 
}

let make_availability_configuration 
  ?(date_modified : float option)
  ?(date_created : float option)
  ?(lambda_provider : lambda_availability_provider option)
  ?(ews_provider : redacted_ews_availability_provider option)
  ?(provider_type : availability_provider_type option)
  ?(domain_name : string option)
  () : availability_configuration = {
  date_modified;
  date_created;
  lambda_provider;
  ews_provider;
  provider_type;
  domain_name;
   }

let make_list_availability_configurations_response 
  ?(next_token : string option)
  ?(availability_configurations : availability_configuration list option)
  () : list_availability_configurations_response = {
  next_token; availability_configurations; 
}

let make_list_availability_configurations_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(organization_id : string)
  () : list_availability_configurations_request = {
  next_token; max_results; organization_id;  }

let make_list_aliases_response 
  ?(next_token : string option) ?(aliases : string list option) ()
: list_aliases_response = { next_token; aliases; 
}

let make_list_aliases_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(entity_id : string)
  ~(organization_id : string)
  () : list_aliases_request = {
  max_results; next_token; entity_id; organization_id; 
}

let make_access_control_rule 
  ?(not_impersonation_role_ids : string list option)
  ?(impersonation_role_ids : string list option)
  ?(date_modified : float option)
  ?(date_created : float option)
  ?(not_user_ids : string list option)
  ?(user_ids : string list option)
  ?(not_actions : string list option)
  ?(actions : string list option)
  ?(not_ip_ranges : string list option)
  ?(ip_ranges : string list option)
  ?(description : string option)
  ?(effect_ : access_control_rule_effect option)
  ?(name : string option)
  () : access_control_rule = {
  not_impersonation_role_ids;
  impersonation_role_ids;
  date_modified;
  date_created;
  not_user_ids;
  user_ids;
  not_actions;
  actions;
  not_ip_ranges;
  ip_ranges;
  description;
  effect_;
  name;
   }

let make_list_access_control_rules_response 
  ?(rules : access_control_rule list option) ()
: list_access_control_rules_response = { rules; 
}

let make_list_access_control_rules_request  ~(organization_id : string) ()
: list_access_control_rules_request = { organization_id; 
}

let make_get_mobile_device_access_override_response 
  ?(date_modified : float option)
  ?(date_created : float option)
  ?(description : string option)
  ?(effect_ : mobile_device_access_rule_effect option)
  ?(device_id : string option)
  ?(user_id : string option)
  () : get_mobile_device_access_override_response = {
  date_modified; date_created; description; effect_; device_id; user_id; 
}

let make_get_mobile_device_access_override_request 
  ~(device_id : string) ~(user_id : string) ~(organization_id : string) ()
: get_mobile_device_access_override_request = {
  device_id; user_id; organization_id; 
}

let make_mobile_device_access_matched_rule 
  ?(name : string option) ?(mobile_device_access_rule_id : string option) ()
: mobile_device_access_matched_rule = { name; mobile_device_access_rule_id; 
}

let make_get_mobile_device_access_effect_response 
  ?(matched_rules : mobile_device_access_matched_rule list option)
  ?(effect_ : mobile_device_access_rule_effect option)
  () : get_mobile_device_access_effect_response = { matched_rules; effect_; 
}

let make_get_mobile_device_access_effect_request 
  ?(device_user_agent : string option)
  ?(device_operating_system : string option)
  ?(device_model : string option)
  ?(device_type : string option)
  ~(organization_id : string)
  () : get_mobile_device_access_effect_request = {
  device_user_agent;
  device_operating_system;
  device_model;
  device_type;
  organization_id;
   }

let make_dns_record 
  ?(value : string option)
  ?(hostname : string option)
  ?(type_ : string option)
  () : dns_record = { value; hostname; type_; 
}

let make_get_mail_domain_response 
  ?(dkim_verification_status : dns_record_verification_status option)
  ?(ownership_verification_status : dns_record_verification_status option)
  ?(is_default : bool option)
  ?(is_test_domain : bool option)
  ?(records : dns_record list option)
  () : get_mail_domain_response = {
  dkim_verification_status;
  ownership_verification_status;
  is_default;
  is_test_domain;
  records;
   }

let make_get_mail_domain_request 
  ~(domain_name : string) ~(organization_id : string) ()
: get_mail_domain_request = { domain_name; organization_id; 
}

let make_get_mailbox_details_response 
  ?(mailbox_size : float option) ?(mailbox_quota : int option) ()
: get_mailbox_details_response = { mailbox_size; mailbox_quota; 
}

let make_get_mailbox_details_request 
  ~(user_id : string) ~(organization_id : string) ()
: get_mailbox_details_request = { user_id; organization_id; 
}

let make_impersonation_matched_rule 
  ?(name : string option) ?(impersonation_rule_id : string option) ()
: impersonation_matched_rule = { name; impersonation_rule_id; 
}

let make_get_impersonation_role_effect_response 
  ?(matched_rules : impersonation_matched_rule list option)
  ?(effect_ : access_effect option)
  ?(type_ : impersonation_role_type option)
  () : get_impersonation_role_effect_response = {
  matched_rules; effect_; type_; 
}

let make_get_impersonation_role_effect_request 
  ~(target_user : string)
  ~(impersonation_role_id : string)
  ~(organization_id : string)
  () : get_impersonation_role_effect_request = {
  target_user; impersonation_role_id; organization_id; 
}

let make_get_impersonation_role_response 
  ?(date_modified : float option)
  ?(date_created : float option)
  ?(rules : impersonation_rule list option)
  ?(description : string option)
  ?(type_ : impersonation_role_type option)
  ?(name : string option)
  ?(impersonation_role_id : string option)
  () : get_impersonation_role_response = {
  date_modified;
  date_created;
  rules;
  description;
  type_;
  name;
  impersonation_role_id;
   }

let make_get_impersonation_role_request 
  ~(impersonation_role_id : string) ~(organization_id : string) ()
: get_impersonation_role_request = { impersonation_role_id; organization_id; 
}

let make_get_default_retention_policy_response 
  ?(folder_configurations : folder_configuration list option)
  ?(description : string option)
  ?(name : string option)
  ?(id : string option)
  () : get_default_retention_policy_response = {
  folder_configurations; description; name; id; 
}

let make_get_default_retention_policy_request  ~(organization_id : string) ()
: get_default_retention_policy_request = { organization_id; 
}

let make_get_access_control_effect_response 
  ?(matched_rules : string list option)
  ?(effect_ : access_control_rule_effect option)
  () : get_access_control_effect_response = { matched_rules; effect_; 
}

let make_get_access_control_effect_request 
  ?(impersonation_role_id : string option)
  ?(user_id : string option)
  ~(action : string)
  ~(ip_address : string)
  ~(organization_id : string)
  () : get_access_control_effect_request = {
  impersonation_role_id; user_id; action; ip_address; organization_id; 
}

let make_disassociate_member_from_group_response  ()
: disassociate_member_from_group_response =
()

let make_disassociate_member_from_group_request 
  ~(member_id : string) ~(group_id : string) ~(organization_id : string) ()
: disassociate_member_from_group_request = {
  member_id; group_id; organization_id; 
}

let make_disassociate_delegate_from_resource_response  ()
: disassociate_delegate_from_resource_response =
()

let make_disassociate_delegate_from_resource_request 
  ~(entity_id : string)
  ~(resource_id : string)
  ~(organization_id : string)
  () : disassociate_delegate_from_resource_request = {
  entity_id; resource_id; organization_id;  }

let make_describe_user_response 
  ?(office : string option)
  ?(country : string option)
  ?(department : string option)
  ?(zip_code : string option)
  ?(company : string option)
  ?(city : string option)
  ?(job_title : string option)
  ?(street : string option)
  ?(telephone : string option)
  ?(initials : string option)
  ?(hidden_from_global_address_list : bool option)
  ?(last_name : string option)
  ?(first_name : string option)
  ?(mailbox_deprovisioned_date : float option)
  ?(mailbox_provisioned_date : float option)
  ?(disabled_date : float option)
  ?(enabled_date : float option)
  ?(user_role : user_role option)
  ?(state : entity_state option)
  ?(display_name : string option)
  ?(email : string option)
  ?(name : string option)
  ?(user_id : string option)
  () : describe_user_response = {
  office;
  country;
  department;
  zip_code;
  company;
  city;
  job_title;
  street;
  telephone;
  initials;
  hidden_from_global_address_list;
  last_name;
  first_name;
  mailbox_deprovisioned_date;
  mailbox_provisioned_date;
  disabled_date;
  enabled_date;
  user_role;
  state;
  display_name;
  email;
  name;
  user_id;
   }

let make_describe_user_request 
  ~(user_id : string) ~(organization_id : string) () : describe_user_request
= { user_id; organization_id;  }

let make_describe_resource_response 
  ?(hidden_from_global_address_list : bool option)
  ?(description : string option)
  ?(disabled_date : float option)
  ?(enabled_date : float option)
  ?(state : entity_state option)
  ?(booking_options : booking_options option)
  ?(type_ : resource_type option)
  ?(name : string option)
  ?(email : string option)
  ?(resource_id : string option)
  () : describe_resource_response = {
  hidden_from_global_address_list;
  description;
  disabled_date;
  enabled_date;
  state;
  booking_options;
  type_;
  name;
  email;
  resource_id;
   }

let make_describe_resource_request 
  ~(resource_id : string) ~(organization_id : string) ()
: describe_resource_request = { resource_id; organization_id; 
}

let make_describe_organization_response 
  ?(interoperability_enabled : bool option)
  ?(migration_admin : string option)
  ?(ar_n : string option)
  ?(error_message : string option)
  ?(completed_date : float option)
  ?(default_mail_domain : string option)
  ?(directory_type : string option)
  ?(directory_id : string option)
  ?(state : string option)
  ?(alias : string option)
  ?(organization_id : string option)
  () : describe_organization_response = {
  interoperability_enabled;
  migration_admin;
  ar_n;
  error_message;
  completed_date;
  default_mail_domain;
  directory_type;
  directory_id;
  state;
  alias;
  organization_id;
   }

let make_describe_organization_request  ~(organization_id : string) ()
: describe_organization_request = { organization_id; 
}

let make_describe_mailbox_export_job_response 
  ?(end_time : float option)
  ?(start_time : float option)
  ?(error_info : string option)
  ?(state : mailbox_export_job_state option)
  ?(estimated_progress : int option)
  ?(s3_path : string option)
  ?(s3_prefix : string option)
  ?(s3_bucket_name : string option)
  ?(kms_key_arn : string option)
  ?(role_arn : string option)
  ?(description : string option)
  ?(entity_id : string option)
  () : describe_mailbox_export_job_response = {
  end_time;
  start_time;
  error_info;
  state;
  estimated_progress;
  s3_path;
  s3_prefix;
  s3_bucket_name;
  kms_key_arn;
  role_arn;
  description;
  entity_id;
   }

let make_describe_mailbox_export_job_request 
  ~(organization_id : string) ~(job_id : string) ()
: describe_mailbox_export_job_request = { organization_id; job_id; 
}

let make_describe_inbound_dmarc_settings_response 
  ?(enforced : bool option) () : describe_inbound_dmarc_settings_response = {
  enforced;  }

let make_describe_inbound_dmarc_settings_request 
  ~(organization_id : string) () : describe_inbound_dmarc_settings_request =
{ organization_id;  }

let make_describe_group_response 
  ?(hidden_from_global_address_list : bool option)
  ?(disabled_date : float option)
  ?(enabled_date : float option)
  ?(state : entity_state option)
  ?(email : string option)
  ?(name : string option)
  ?(group_id : string option)
  () : describe_group_response = {
  hidden_from_global_address_list;
  disabled_date;
  enabled_date;
  state;
  email;
  name;
  group_id;
   }

let make_describe_group_request 
  ~(group_id : string) ~(organization_id : string) ()
: describe_group_request = { group_id; organization_id; 
}

let make_describe_entity_response 
  ?(type_ : entity_type option)
  ?(name : string option)
  ?(entity_id : string option)
  () : describe_entity_response = { type_; name; entity_id; 
}

let make_describe_entity_request 
  ~(email : string) ~(organization_id : string) () : describe_entity_request
= { email; organization_id; 
}

let make_describe_email_monitoring_configuration_response 
  ?(log_group_arn : string option) ?(role_arn : string option) ()
: describe_email_monitoring_configuration_response = {
  log_group_arn; role_arn; 
}

let make_describe_email_monitoring_configuration_request 
  ~(organization_id : string) ()
: describe_email_monitoring_configuration_request = { organization_id; 
}

let make_deregister_mail_domain_response  ()
: deregister_mail_domain_response =
()

let make_deregister_mail_domain_request 
  ~(domain_name : string) ~(organization_id : string) ()
: deregister_mail_domain_request = { domain_name; organization_id; 
}

let make_deregister_from_work_mail_response  ()
: deregister_from_work_mail_response =
()

let make_deregister_from_work_mail_request 
  ~(entity_id : string) ~(organization_id : string) ()
: deregister_from_work_mail_request = { entity_id; organization_id; 
}

let make_delete_user_response  () : delete_user_response =
()

let make_delete_user_request 
  ~(user_id : string) ~(organization_id : string) () : delete_user_request =
{ user_id; organization_id;  }

let make_delete_retention_policy_response  ()
: delete_retention_policy_response =
()

let make_delete_retention_policy_request 
  ~(id : string) ~(organization_id : string) ()
: delete_retention_policy_request = { id; organization_id; 
}

let make_delete_resource_response  () : delete_resource_response =
()

let make_delete_resource_request 
  ~(resource_id : string) ~(organization_id : string) ()
: delete_resource_request = { resource_id; organization_id; 
}

let make_delete_organization_response 
  ?(state : string option) ?(organization_id : string option) ()
: delete_organization_response = { state; organization_id; 
}

let make_delete_organization_request 
  ?(force_delete : bool option)
  ?(client_token : string option)
  ~(delete_directory : bool)
  ~(organization_id : string)
  () : delete_organization_request = {
  force_delete; delete_directory; organization_id; client_token; 
}

let make_delete_mobile_device_access_rule_response  ()
: delete_mobile_device_access_rule_response =
()

let make_delete_mobile_device_access_rule_request 
  ~(mobile_device_access_rule_id : string) ~(organization_id : string) ()
: delete_mobile_device_access_rule_request = {
  mobile_device_access_rule_id; organization_id; 
}

let make_delete_mobile_device_access_override_response  ()
: delete_mobile_device_access_override_response =
()

let make_delete_mobile_device_access_override_request 
  ~(device_id : string) ~(user_id : string) ~(organization_id : string) ()
: delete_mobile_device_access_override_request = {
  device_id; user_id; organization_id; 
}

let make_delete_mailbox_permissions_response  ()
: delete_mailbox_permissions_response =
()

let make_delete_mailbox_permissions_request 
  ~(grantee_id : string) ~(entity_id : string) ~(organization_id : string) ()
: delete_mailbox_permissions_request = {
  grantee_id; entity_id; organization_id; 
}

let make_delete_impersonation_role_response  ()
: delete_impersonation_role_response =
()

let make_delete_impersonation_role_request 
  ~(impersonation_role_id : string) ~(organization_id : string) ()
: delete_impersonation_role_request = {
  impersonation_role_id; organization_id;  }

let make_delete_group_response  () : delete_group_response =
()

let make_delete_group_request 
  ~(group_id : string) ~(organization_id : string) () : delete_group_request
= { group_id; organization_id; 
}

let make_delete_email_monitoring_configuration_response  ()
: delete_email_monitoring_configuration_response =
()

let make_delete_email_monitoring_configuration_request 
  ~(organization_id : string) ()
: delete_email_monitoring_configuration_request = { organization_id; 
}

let make_delete_availability_configuration_response  ()
: delete_availability_configuration_response =
()

let make_delete_availability_configuration_request 
  ~(domain_name : string) ~(organization_id : string) ()
: delete_availability_configuration_request = {
  domain_name; organization_id;  }

let make_delete_alias_response  () : delete_alias_response =
()

let make_delete_alias_request 
  ~(alias : string) ~(entity_id : string) ~(organization_id : string) ()
: delete_alias_request = { alias; entity_id; organization_id; 
}

let make_delete_access_control_rule_response  ()
: delete_access_control_rule_response =
()

let make_delete_access_control_rule_request 
  ~(name : string) ~(organization_id : string) ()
: delete_access_control_rule_request = { name; organization_id; 
}

let make_create_user_response  ?(user_id : string option) ()
: create_user_response = { user_id;  }

let make_create_user_request 
  ?(hidden_from_global_address_list : bool option)
  ?(last_name : string option)
  ?(first_name : string option)
  ?(role : user_role option)
  ?(password : string option)
  ~(display_name : string)
  ~(name : string)
  ~(organization_id : string)
  () : create_user_request = {
  hidden_from_global_address_list;
  last_name;
  first_name;
  role;
  password;
  display_name;
  name;
  organization_id;
   }

let make_create_resource_response  ?(resource_id : string option) ()
: create_resource_response = { resource_id; 
}

let make_create_resource_request 
  ?(hidden_from_global_address_list : bool option)
  ?(description : string option)
  ~(type_ : resource_type)
  ~(name : string)
  ~(organization_id : string)
  () : create_resource_request = {
  hidden_from_global_address_list; description; type_; name; organization_id; 
}

let make_create_organization_response  ?(organization_id : string option) ()
: create_organization_response = { organization_id;  }

let make_domain  ?(hosted_zone_id : string option) ~(domain_name : string) ()
: domain = { hosted_zone_id; domain_name; 
}

let make_create_organization_request 
  ?(enable_interoperability : bool option)
  ?(kms_key_arn : string option)
  ?(domains : domain list option)
  ?(client_token : string option)
  ?(directory_id : string option)
  ~(alias : string)
  () : create_organization_request = {
  enable_interoperability;
  kms_key_arn;
  domains;
  client_token;
  alias;
  directory_id;
   }

let make_create_mobile_device_access_rule_response 
  ?(mobile_device_access_rule_id : string option) ()
: create_mobile_device_access_rule_response = {
  mobile_device_access_rule_id; 
}

let make_create_mobile_device_access_rule_request 
  ?(not_device_user_agents : string list option)
  ?(device_user_agents : string list option)
  ?(not_device_operating_systems : string list option)
  ?(device_operating_systems : string list option)
  ?(not_device_models : string list option)
  ?(device_models : string list option)
  ?(not_device_types : string list option)
  ?(device_types : string list option)
  ?(description : string option)
  ?(client_token : string option)
  ~(effect_ : mobile_device_access_rule_effect)
  ~(name : string)
  ~(organization_id : string)
  () : create_mobile_device_access_rule_request = {
  not_device_user_agents;
  device_user_agents;
  not_device_operating_systems;
  device_operating_systems;
  not_device_models;
  device_models;
  not_device_types;
  device_types;
  effect_;
  description;
  name;
  client_token;
  organization_id;
   }

let make_create_impersonation_role_response 
  ?(impersonation_role_id : string option) ()
: create_impersonation_role_response = { impersonation_role_id; 
}

let make_create_impersonation_role_request 
  ?(description : string option)
  ?(client_token : string option)
  ~(rules : impersonation_rule list)
  ~(type_ : impersonation_role_type)
  ~(name : string)
  ~(organization_id : string)
  () : create_impersonation_role_request = {
  rules; description; type_; name; organization_id; client_token; 
}

let make_create_group_response  ?(group_id : string option) ()
: create_group_response = { group_id;  }

let make_create_group_request 
  ?(hidden_from_global_address_list : bool option)
  ~(name : string)
  ~(organization_id : string)
  () : create_group_request = {
  hidden_from_global_address_list; name; organization_id; 
}

let make_create_availability_configuration_response  ()
: create_availability_configuration_response =
()

let make_create_availability_configuration_request 
  ?(lambda_provider : lambda_availability_provider option)
  ?(ews_provider : ews_availability_provider option)
  ?(client_token : string option)
  ~(domain_name : string)
  ~(organization_id : string)
  () : create_availability_configuration_request = {
  lambda_provider; ews_provider; domain_name; organization_id; client_token; 
}

let make_create_alias_response  () : create_alias_response =
()

let make_create_alias_request 
  ~(alias : string) ~(entity_id : string) ~(organization_id : string) ()
: create_alias_request = { alias; entity_id; organization_id; 
}

let make_cancel_mailbox_export_job_response  ()
: cancel_mailbox_export_job_response =
()

let make_cancel_mailbox_export_job_request 
  ~(organization_id : string) ~(job_id : string) ~(client_token : string) ()
: cancel_mailbox_export_job_request = {
  organization_id; job_id; client_token; 
}

let make_assume_impersonation_role_response 
  ?(expires_in : int option) ?(token : string option) ()
: assume_impersonation_role_response = { expires_in; token; 
}

let make_assume_impersonation_role_request 
  ~(impersonation_role_id : string) ~(organization_id : string) ()
: assume_impersonation_role_request = {
  impersonation_role_id; organization_id; 
}

let make_associate_member_to_group_response  ()
: associate_member_to_group_response =
()

let make_associate_member_to_group_request 
  ~(member_id : string) ~(group_id : string) ~(organization_id : string) ()
: associate_member_to_group_request = {
  member_id; group_id; organization_id; 
}

let make_associate_delegate_to_resource_response  ()
: associate_delegate_to_resource_response =
()

let make_associate_delegate_to_resource_request 
  ~(entity_id : string)
  ~(resource_id : string)
  ~(organization_id : string)
  () : associate_delegate_to_resource_request = {
  entity_id; resource_id; organization_id; 
}

