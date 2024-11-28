open Smaws_Lib
val service : Service.descriptor

(** 
    You can't perform a write operation against a read-only directory.
     *)
type unsupported_operation_exception = {
  message: string option;
  
}

(** 
    The organization must have a valid state to perform certain operations on the organization or its members.
     *)
type organization_state_exception = {
  message: string option;
  
}

(** 
    An operation received a valid organization identifier that either doesn't belong or exist in the system.
     *)
type organization_not_found_exception = {
  message: string option;
  
}

(** 
    One or more of the input parameters don't match the service's restrictions.
     *)
type invalid_parameter_exception = {
  message: string option;
  
}

(** 
    You are performing an operation on a user, group, or resource that isn't in the expected state, such as trying to delete an active user.
     *)
type entity_state_exception = {
  message: string option;
  
}

(** 
    The identifier supplied for the user, group, or resource does not exist in your organization.
     *)
type entity_not_found_exception = {
  message: string option;
  
}

(** 
    The directory is unavailable. It might be located in another Region or deleted.
     *)
type directory_unavailable_exception = {
  message: string option;
  
}

(** 
    The directory service doesn't recognize the credentials supplied by WorkMail.
     *)
type directory_service_authentication_failed_exception = {
  message: string option;
  
}

type update_user_response = unit

type user_role = | REMOTE_USER
  | SYSTEM_USER
  | RESOURCE
  | USER

type update_user_request = {
  office: string option;
  (** 
    Updates the user's office.
     *)

  country: string option;
  (** 
    Updates the user's country.
     *)

  department: string option;
  (** 
    Updates the user's department.
     *)

  zip_code: string option;
  (** 
    Updates the user's zipcode.
     *)

  company: string option;
  (** 
    Updates the user's company.
     *)

  city: string option;
  (** 
    Updates the user's city.
     *)

  job_title: string option;
  (** 
    Updates the user's job title.
     *)

  street: string option;
  (** 
    Updates the user's street address.
     *)

  telephone: string option;
  (** 
    Updates the user's contact details.
     *)

  initials: string option;
  (** 
    Updates the user's initials.
     *)

  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the user is hidden from the global address list.
     *)

  last_name: string option;
  (** 
    Updates the user's last name.
     *)

  first_name: string option;
  (** 
    Updates the user's first name.
     *)

  display_name: string option;
  (** 
    Updates the display name of the user.
     *)

  role: user_role option;
  (** 
    Updates the user role.
    
     You cannot pass {i SYSTEM_USER} or {i RESOURCE}.
      *)

  user_id: string;
  (** 
    The identifier for the user to be updated.
    
     The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: user@domain.tld
               
               }
            {- User name: user
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the user exists.
     *)

}

(** 
    The user, group, or resource name isn't unique in WorkMail.
     *)
type name_availability_exception = {
  message: string option;
  
}

(** 
    After a domain has been added to the organization, it must be verified. The domain is not yet verified.
     *)
type mail_domain_state_exception = {
  message: string option;
  
}

(** 
    The domain specified is not found in your organization.
     *)
type mail_domain_not_found_exception = {
  message: string option;
  
}

(** 
    The configuration for a resource isn't valid. A resource must either be able to auto-respond to requests or have at least one delegate associated that can do so on its behalf.
     *)
type invalid_configuration_exception = {
  message: string option;
  
}

(** 
    The email address that you're trying to assign is already created for a different user, group, or resource.
     *)
type email_address_in_use_exception = {
  message: string option;
  
}

type update_resource_response = unit

(** 
    At least one delegate must be associated to the resource to disable automatic replies from the resource.
     *)
type booking_options = {
  auto_decline_conflicting_requests: bool option;
  (** 
    The resource's ability to automatically decline any conflicting requests.
     *)

  auto_decline_recurring_requests: bool option;
  (** 
    The resource's ability to automatically decline any recurring requests.
     *)

  auto_accept_requests: bool option;
  (** 
    The resource's ability to automatically reply to requests. If disabled, delegates must be associated to the resource.
     *)

}

type resource_type = | EQUIPMENT
  | ROOM

type update_resource_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the resource is hidden from the global address list.
     *)

  type_: resource_type option;
  (** 
    Updates the resource type.
     *)

  description: string option;
  (** 
    Updates the resource description.
     *)

  booking_options: booking_options option;
  (** 
    The resource's booking options to be updated.
     *)

  name: string option;
  (** 
    The name of the resource to be updated.
     *)

  resource_id: string;
  (** 
    The identifier of the resource to be updated.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier associated with the organization for which the resource is updated.
     *)

}

type update_primary_email_address_response = unit

type update_primary_email_address_request = {
  email: string;
  (** 
    The value of the email to be updated as primary.
     *)

  entity_id: string;
  (** 
    The user, group, or resource to update.
    
     The identifier can accept {i UseriD, ResourceId, or GroupId}, {i Username, Resourcename, or Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization that contains the user, group, or resource to update.
     *)

}

type update_mobile_device_access_rule_response = unit

type mobile_device_access_rule_effect = | DENY
  | ALLOW

type update_mobile_device_access_rule_request = {
  not_device_user_agents: string list option;
  (** 
    User agents that the updated rule {b will not} match. All other user agents will match.
     *)

  device_user_agents: string list option;
  (** 
    User agents that the updated rule will match.
     *)

  not_device_operating_systems: string list option;
  (** 
    Device operating systems that the updated rule {b will not} match. All other device operating systems will match.
     *)

  device_operating_systems: string list option;
  (** 
    Device operating systems that the updated rule will match.
     *)

  not_device_models: string list option;
  (** 
    Device models that the updated rule {b will not} match. All other device models will match.
     *)

  device_models: string list option;
  (** 
    Device models that the updated rule will match.
     *)

  not_device_types: string list option;
  (** 
    Device types that the updated rule {b will not} match. All other device types will match.
     *)

  device_types: string list option;
  (** 
    Device types that the updated rule will match.
     *)

  effect_: mobile_device_access_rule_effect;
  (** 
    The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].
     *)

  description: string option;
  (** 
    The updated rule description.
     *)

  name: string;
  (** 
    The updated rule name.
     *)

  mobile_device_access_rule_id: string;
  (** 
    The identifier of the rule to be updated.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which the rule will be updated.
     *)

}

type update_mailbox_quota_response = unit

type update_mailbox_quota_request = {
  mailbox_quota: int;
  (** 
    The updated mailbox quota, in MB, for the specified user.
     *)

  user_id: string;
  (** 
    The identifer for the user for whom to update the mailbox quota.
    
     The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: user@domain.tld
               
               }
            {- User name: user
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization that contains the user for whom to update the mailbox quota.
     *)

}

(** 
    The resource cannot be found.
     *)
type resource_not_found_exception = {
  message: string option;
  
}

(** 
    The request exceeds the limit of the resource.
     *)
type limit_exceeded_exception = {
  message: string option;
  
}

type update_impersonation_role_response = unit

type impersonation_role_type = | READ_ONLY
  | FULL_ACCESS

type access_effect = | DENY
  | ALLOW

(** 
    The rules for the given impersonation role.
     *)
type impersonation_rule = {
  not_target_users: string list option;
  (** 
    A list of user IDs that don't match the rule.
     *)

  target_users: string list option;
  (** 
    A list of user IDs that match the rule.
     *)

  effect_: access_effect;
  (** 
    The effect of the rule when it matches the input. Allowed effect values are [ALLOW] or [DENY].
     *)

  description: string option;
  (** 
    The rule description.
     *)

  name: string option;
  (** 
    The rule name.
     *)

  impersonation_rule_id: string;
  (** 
    The identifier of the rule.
     *)

}

type update_impersonation_role_request = {
  rules: impersonation_rule list;
  (** 
    The updated list of rules.
     *)

  description: string option;
  (** 
    The updated impersonation role description.
     *)

  type_: impersonation_role_type;
  (** 
    The updated impersonation role type.
     *)

  name: string;
  (** 
    The updated impersonation role name.
     *)

  impersonation_role_id: string;
  (** 
    The ID of the impersonation role to update.
     *)

  organization_id: string;
  (** 
    The WorkMail organization that contains the impersonation role to update.
     *)

}

type update_group_response = unit

type update_group_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the group is hidden from the global address list.
     *)

  group_id: string;
  (** 
    The identifier for the group to be updated.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the group exists.
     *)

}

type update_default_mail_domain_response = unit

type update_default_mail_domain_request = {
  domain_name: string;
  (** 
    The domain name that will become the default domain.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which to list domains.
     *)

}

type update_availability_configuration_response = unit

(** 
    Describes an EWS based availability provider. This is only used as input to the service.
     *)
type ews_availability_provider = {
  ews_password: string;
  (** 
    The password used to authenticate the remote EWS server.
     *)

  ews_username: string;
  (** 
    The username used to authenticate the remote EWS server.
     *)

  ews_endpoint: string;
  (** 
    The endpoint of the remote EWS server.
     *)

}

(** 
    Describes a Lambda based availability provider.
     *)
type lambda_availability_provider = {
  lambda_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the Lambda that acts as the availability provider.
     *)

}

type update_availability_configuration_request = {
  lambda_provider: lambda_availability_provider option;
  (** 
    The Lambda availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider]. The previously stored provider will be overridden by the one provided.
     *)

  ews_provider: ews_availability_provider option;
  (** 
    The EWS availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider]. The previously stored provider will be overridden by the one provided.
     *)

  domain_name: string;
  (** 
    The domain to which the provider applies the availability configuration.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the [AvailabilityConfiguration] will be updated.
     *)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  (** 
    The tag keys.
     *)

  resource_ar_n: string;
  (** 
    The resource ARN.
     *)

}

type test_availability_configuration_response = {
  failure_reason: string option;
  (** 
    String containing the reason for a failed test if [TestPassed] is false.
     *)

  test_passed: bool option;
  (** 
    Boolean indicating whether the test passed or failed.
     *)

}

type test_availability_configuration_request = {
  lambda_provider: lambda_availability_provider option;
  
  ews_provider: ews_availability_provider option;
  
  domain_name: string option;
  (** 
    The domain to which the provider applies. If this field is provided, a stored availability provider associated to this domain name will be tested.
     *)

  organization_id: string;
  (** 
    The WorkMail organization where the availability provider will be tested.
     *)

}

(** 
    The resource can have up to 50 user-applied tags.
     *)
type too_many_tags_exception = {
  message: string option;
  
}

type tag_resource_response = unit

(** 
    Describes a tag applied to a resource.
     *)
type tag = {
  value: string;
  (** 
    The value of the tag.
     *)

  key: string;
  (** 
    The key of the tag.
     *)

}

type tag_resource_request = {
  tags: tag list;
  (** 
    The tag key-value pairs.
     *)

  resource_ar_n: string;
  (** 
    The resource ARN.
     *)

}

type start_mailbox_export_job_response = {
  job_id: string option;
  (** 
    The job ID.
     *)

}

type start_mailbox_export_job_request = {
  s3_prefix: string;
  (** 
    The S3 bucket prefix.
     *)

  s3_bucket_name: string;
  (** 
    The name of the S3 bucket.
     *)

  kms_key_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key that encrypts the exported mailbox content.
     *)

  role_arn: string;
  (** 
    The ARN of the AWS Identity and Access Management (IAM) role that grants write permission to the S3 bucket.
     *)

  description: string option;
  (** 
    The mailbox export job description.
     *)

  entity_id: string;
  (** 
    The identifier of the user or resource associated with the mailbox.
    
     The identifier can accept {i UserId or ResourceId}, {i Username or Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789 , or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier associated with the organization.
     *)

  client_token: string;
  (** 
    The idempotency token for the client request.
     *)

}

(** 
    The supplied password doesn't match the minimum security constraints, such as length or use of special characters.
     *)
type invalid_password_exception = {
  message: string option;
  
}

type reset_password_response = unit

type reset_password_request = {
  password: string;
  (** 
    The new password for the user.
     *)

  user_id: string;
  (** 
    The identifier of the user for whom the password is reset.
     *)

  organization_id: string;
  (** 
    The identifier of the organization that contains the user for which the password is reset.
     *)

}

(** 
    The user, group, or resource that you're trying to register is already registered.
     *)
type entity_already_registered_exception = {
  message: string option;
  
}

type register_to_work_mail_response = unit

type register_to_work_mail_request = {
  email: string;
  (** 
    The email for the user, group, or resource to be updated.
     *)

  entity_id: string;
  (** 
    The identifier for the user, group, or resource to be updated.
    
     The identifier can accept {i UserId, ResourceId, or GroupId}, or {i Username, Resourcename, or Groupname}. The following identity formats are available:
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the user, group, or resource exists.
     *)

}

(** 
    The domain you're trying to change is in use by another user or organization in your account. See the error message for details.
     *)
type mail_domain_in_use_exception = {
  message: string option;
  
}

type register_mail_domain_response = unit

type register_mail_domain_request = {
  domain_name: string;
  (** 
    The name of the mail domain to create in WorkMail and SES.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which you're creating the domain.
     *)

  client_token: string option;
  (** 
    Idempotency token used when retrying requests.
     *)

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

(** 
    The configuration applied to an organization's folders by its retention policy.
     *)
type folder_configuration = {
  period: int option;
  (** 
    The number of days for which the folder-configuration action applies.
     *)

  action: retention_action;
  (** 
    The action to take on the folder contents at the end of the folder configuration period.
     *)

  name: folder_name;
  (** 
    The folder name.
     *)

}

type put_retention_policy_request = {
  folder_configurations: folder_configuration list;
  (** 
    The retention policy folder configurations.
     *)

  description: string option;
  (** 
    The retention policy description.
     *)

  name: string;
  (** 
    The retention policy name.
     *)

  id: string option;
  (** 
    The retention policy ID.
     *)

  organization_id: string;
  (** 
    The organization ID.
     *)

}

type put_mobile_device_access_override_response = unit

type put_mobile_device_access_override_request = {
  description: string option;
  (** 
    A description of the override.
     *)

  effect_: mobile_device_access_rule_effect;
  (** 
    The effect of the override, [ALLOW] or [DENY].
     *)

  device_id: string;
  (** 
    The mobile device for which you create the override. [DeviceId] is case insensitive.
     *)

  user_id: string;
  (** 
    The WorkMail user for which you create the override. Accepts the following types of user identities:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  organization_id: string;
  (** 
    Identifies the WorkMail organization for which you create the override.
     *)

}

type put_mailbox_permissions_response = unit

type permission_type = | SEND_ON_BEHALF
  | SEND_AS
  | FULL_ACCESS

type put_mailbox_permissions_request = {
  permission_values: permission_type list;
  (** 
    The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other folder-level permissions set on the mailbox.
     *)

  grantee_id: string;
  (** 
    The identifier of the user, group, or resource to which to grant the permissions.
    
     The identifier can be {i UserId, ResourceID, or Group Id}, {i Username, Resourcename, or Groupname}, or {i email}.
     
      {ul
           {- Grantee ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: grantee@domain.tld
               
               }
            {- Grantee name: grantee
               
               }
           
      }
       *)

  entity_id: string;
  (** 
    The identifier of the user or resource for which to update mailbox permissions.
    
     The identifier can be {i UserId, ResourceID, or Group Id}, {i Username, Resourcename, or Groupname}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier of the organization under which the user, group, or resource exists.
     *)

}

type put_inbound_dmarc_settings_response = unit

type put_inbound_dmarc_settings_request = {
  enforced: bool;
  (** 
    Enforces or suspends a policy after it's applied.
     *)

  organization_id: string;
  (** 
    The ID of the organization that you are applying the DMARC policy to.
     *)

}

type put_email_monitoring_configuration_response = unit

type put_email_monitoring_configuration_request = {
  log_group_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email monitoring configuration.
     *)

  role_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring configuration.
     *)

  organization_id: string;
  (** 
    The ID of the organization for which the email monitoring configuration is set.
     *)

}

type put_access_control_rule_response = unit

type access_control_rule_effect = | DENY
  | ALLOW

type put_access_control_rule_request = {
  not_impersonation_role_ids: string list option;
  (** 
    Impersonation role IDs to exclude from the rule.
     *)

  impersonation_role_ids: string list option;
  (** 
    Impersonation role IDs to include in the rule.
     *)

  organization_id: string;
  (** 
    The identifier of the organization.
     *)

  not_user_ids: string list option;
  (** 
    User IDs to exclude from the rule.
     *)

  user_ids: string list option;
  (** 
    User IDs to include in the rule.
     *)

  not_actions: string list option;
  (** 
    Access protocol actions to exclude from the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  actions: string list option;
  (** 
    Access protocol actions to include in the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  not_ip_ranges: string list option;
  (** 
    IPv4 CIDR ranges to exclude from the rule.
     *)

  ip_ranges: string list option;
  (** 
    IPv4 CIDR ranges to include in the rule.
     *)

  description: string;
  (** 
    The rule description.
     *)

  effect_: access_control_rule_effect;
  (** 
    The rule effect.
     *)

  name: string;
  (** 
    The rule name.
     *)

}

type entity_state = | DELETED
  | DISABLED
  | ENABLED

(** 
    The representation of an WorkMail user.
     *)
type user = {
  disabled_date: float option;
  (** 
    The date indicating when the user was disabled from WorkMail use.
     *)

  enabled_date: float option;
  (** 
    The date indicating when the user was enabled for WorkMail use.
     *)

  user_role: user_role option;
  (** 
    The role of the user.
     *)

  state: entity_state option;
  (** 
    The state of the user, which can be ENABLED, DISABLED, or DELETED.
     *)

  display_name: string option;
  (** 
    The display name of the user.
     *)

  name: string option;
  (** 
    The name of the user.
     *)

  email: string option;
  (** 
    The email of the user.
     *)

  id: string option;
  (** 
    The identifier of the user.
     *)

}

type list_users_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. This value is `null` when there are no more results to return.
     *)

  users: user list option;
  (** 
    The overview of users for an organization.
     *)

}

(** 
    Filtering options for {i ListUsers} operation. This is only used as input to Operation.
     *)
type list_users_filters = {
  state: entity_state option;
  (** 
    Filters only users with the provided state.
     *)

  primary_email_prefix: string option;
  (** 
    Filters only users with the provided email prefix.
     *)

  display_name_prefix: string option;
  (** 
    Filters only users with the provided display name prefix.
     *)

  username_prefix: string option;
  (** 
    Filters only users with the provided username prefix.
     *)

}

type list_users_request = {
  filters: list_users_filters option;
  (** 
    Limit the user search results based on the filter criteria. You can only use one filter per request.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the users exist.
     *)

}

type list_tags_for_resource_response = {
  tags: tag list option;
  (** 
    A list of tag key-value pairs.
     *)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  (** 
    The resource ARN.
     *)

}

(** 
    The representation of a resource.
     *)
type resource = {
  description: string option;
  (** 
    Resource description.
     *)

  disabled_date: float option;
  (** 
    The date indicating when the resource was disabled from WorkMail use.
     *)

  enabled_date: float option;
  (** 
    The date indicating when the resource was enabled for WorkMail use.
     *)

  state: entity_state option;
  (** 
    The state of the resource, which can be ENABLED, DISABLED, or DELETED.
     *)

  type_: resource_type option;
  (** 
    The type of the resource: equipment or room.
     *)

  name: string option;
  (** 
    The name of the resource.
     *)

  email: string option;
  (** 
    The email of the resource.
     *)

  id: string option;
  (** 
    The identifier of the resource.
     *)

}

type list_resources_response = {
  next_token: string option;
  (** 
    The token used to paginate through all the organization's resources. While results are still available, it has an associated value. When the last page is reached, the token is empty.
     *)

  resources: resource list option;
  (** 
    One page of the organization's resource representation.
     *)

}

(** 
    Filtering options for {i ListResources} operation. This is only used as input to Operation.
     *)
type list_resources_filters = {
  state: entity_state option;
  (** 
    Filters only resource with the provided state.
     *)

  primary_email_prefix: string option;
  (** 
    Filters only resource with the provided primary email prefix.
     *)

  name_prefix: string option;
  (** 
    Filters only resource that start with the entered name prefix .
     *)

}

type list_resources_request = {
  filters: list_resources_filters option;
  (** 
    Limit the resource search results based on the filter criteria. You can only use one filter per request.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the resources exist.
     *)

}

type member_type = | USER
  | GROUP

(** 
    The name of the attribute, which is one of the values defined in the UserAttribute enumeration.
     *)
type delegate = {
  type_: member_type;
  (** 
    The type of the delegate: user or group.
     *)

  id: string;
  (** 
    The identifier for the user or group associated as the resource's delegate.
     *)

}

type list_resource_delegates_response = {
  next_token: string option;
  (** 
    The token used to paginate through the delegates associated with a resource. While results are still available, it has an associated value. When the last page is reached, the token is empty.
     *)

  delegates: delegate list option;
  (** 
    One page of the resource's delegates.
     *)

}

type list_resource_delegates_request = {
  max_results: int option;
  (** 
    The number of maximum results in a page.
     *)

  next_token: string option;
  (** 
    The token used to paginate through the delegates associated with a resource.
     *)

  resource_id: string;
  (** 
    The identifier for the resource whose delegates are listed.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization that contains the resource for which delegates are listed.
     *)

}

(** 
    The representation of an organization.
     *)
type organization_summary = {
  state: string option;
  (** 
    The state associated with the organization.
     *)

  error_message: string option;
  (** 
    The error message associated with the organization. It is only present if unexpected behavior has occurred with regards to the organization. It provides insight or solutions regarding unexpected behavior.
     *)

  default_mail_domain: string option;
  (** 
    The default email domain associated with the organization.
     *)

  alias: string option;
  (** 
    The alias associated with the organization.
     *)

  organization_id: string option;
  (** 
    The identifier associated with the organization.
     *)

}

type list_organizations_response = {
  next_token: string option;
  [@ocaml.doc {| 
    The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.
     |}]

  organization_summaries: organization_summary list option;
  (** 
    The overview of owned organizations presented as a list of organization summaries.
     *)

}

type list_organizations_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

}

(** 
    A rule that controls access to mobile devices for an WorkMail group.
     *)
type mobile_device_access_rule = {
  date_modified: float option;
  (** 
    The date and time at which an access rule was modified.
     *)

  date_created: float option;
  (** 
    The date and time at which an access rule was created.
     *)

  not_device_user_agents: string list option;
  (** 
    Device user agents that a rule {b will not} match. All other device user agents will match.
     *)

  device_user_agents: string list option;
  (** 
    Device user agents that a rule will match.
     *)

  not_device_operating_systems: string list option;
  (** 
    Device operating systems that a rule {b will not} match. All other device types will match.
     *)

  device_operating_systems: string list option;
  (** 
    Device operating systems that a rule will match.
     *)

  not_device_models: string list option;
  (** 
    Device models that a rule {b will not} match. All other device models will match.
     *)

  device_models: string list option;
  (** 
    Device models that a rule will match.
     *)

  not_device_types: string list option;
  (** 
    Device types that a rule {b will not} match. All other device types will match.
     *)

  device_types: string list option;
  (** 
    Device types that a rule will match.
     *)

  effect_: mobile_device_access_rule_effect option;
  (** 
    The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].
     *)

  description: string option;
  (** 
    The description of a mobile access rule.
     *)

  name: string option;
  (** 
    The name of a mobile access rule.
     *)

  mobile_device_access_rule_id: string option;
  (** 
    The ID assigned to a mobile access rule.
     *)

}

type list_mobile_device_access_rules_response = {
  rules: mobile_device_access_rule list option;
  (** 
    The list of mobile device access rules that exist under the specified WorkMail organization.
     *)

}

type list_mobile_device_access_rules_request = {
  organization_id: string;
  (** 
    The WorkMail organization for which to list the rules.
     *)

}

(** 
    The override object.
     *)
type mobile_device_access_override = {
  date_modified: float option;
  (** 
    The date the override was last modified.
     *)

  date_created: float option;
  (** 
    The date the override was first created.
     *)

  description: string option;
  (** 
    A description of the override.
     *)

  effect_: mobile_device_access_rule_effect option;
  (** 
    The effect of the override, [ALLOW] or [DENY].
     *)

  device_id: string option;
  (** 
    The device to which the override applies.
     *)

  user_id: string option;
  (** 
    The WorkMail user to which the access override applies.
     *)

}

type list_mobile_device_access_overrides_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The value is “null” when there are no more results to return.
     *)

  overrides: mobile_device_access_override list option;
  (** 
    The list of mobile device access overrides that exist for the specified WorkMail organization and user.
     *)

}

type list_mobile_device_access_overrides_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not require a token.
     *)

  device_id: string option;
  (** 
    The mobile device to which the access override applies.
     *)

  user_id: string option;
  (** 
    The WorkMail user under which you list the mobile device access overrides. Accepts the following types of user identities:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  organization_id: string;
  (** 
    The WorkMail organization under which to list mobile device access overrides.
     *)

}

(** 
    The data for a given domain.
     *)
type mail_domain_summary = {
  default_domain: bool option;
  (** 
    Whether the domain is default or not.
     *)

  domain_name: string option;
  (** 
    The domain name.
     *)

}

type list_mail_domains_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The value becomes [null] when there are no more results to return.
     *)

  mail_domains: mail_domain_summary list option;
  (** 
    The list of mail domain summaries, specifying domains that exist in the specified WorkMail organization, along with the information about whether the domain is or isn't the default.
     *)

}

type list_mail_domains_request = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not require a token.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which to list domains.
     *)

}

(** 
    Permission granted to a user, group, or resource to access a certain aspect of another user, group, or resource mailbox.
     *)
type permission = {
  permission_values: permission_type list;
  (** 
    The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other folder-level permissions set on the mailbox.
     *)

  grantee_type: member_type;
  (** 
    The type of user, group, or resource referred to in GranteeId.
     *)

  grantee_id: string;
  (** 
    The identifier of the user, group, or resource to which the permissions are granted.
     *)

}

type list_mailbox_permissions_response = {
  next_token: string option;
  [@ocaml.doc {| 
    The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.
     |}]

  permissions: permission list option;
  (** 
    One page of the user, group, or resource mailbox permissions.
     *)

}

type list_mailbox_permissions_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  entity_id: string;
  (** 
    The identifier of the user, or resource for which to list mailbox permissions.
    
     The entity ID can accept {i UserId or ResourceId}, {i Username or Resourcename}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, or r-0123456789a0123456789b0123456789
              
              }
            {- Email address: entity@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier of the organization under which the user, group, or resource exists.
     *)

}

type mailbox_export_job_state = | CANCELLED
  | FAILED
  | COMPLETED
  | RUNNING

(** 
    The details of a mailbox export job, including the user or resource ID associated with the mailbox and the S3 bucket that the mailbox contents are exported to.
     *)
type mailbox_export_job = {
  end_time: float option;
  (** 
    The mailbox export job end timestamp.
     *)

  start_time: float option;
  (** 
    The mailbox export job start timestamp.
     *)

  state: mailbox_export_job_state option;
  (** 
    The state of the mailbox export job.
     *)

  estimated_progress: int option;
  (** 
    The estimated progress of the mailbox export job, in percentage points.
     *)

  s3_path: string option;
  (** 
    The path to the S3 bucket and file that the mailbox export job exports to.
     *)

  s3_bucket_name: string option;
  (** 
    The name of the S3 bucket.
     *)

  description: string option;
  (** 
    The mailbox export job description.
     *)

  entity_id: string option;
  (** 
    The identifier of the user or resource associated with the mailbox.
     *)

  job_id: string option;
  (** 
    The identifier of the mailbox export job.
     *)

}

type list_mailbox_export_jobs_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results.
     *)

  jobs: mailbox_export_job list option;
  (** 
    The mailbox export job details.
     *)

}

type list_mailbox_export_jobs_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results.
     *)

  organization_id: string;
  (** 
    The organization ID.
     *)

}

(** 
    An impersonation role for the given WorkMail organization.
     *)
type impersonation_role = {
  date_modified: float option;
  (** 
    The date when the impersonation role was last modified.
     *)

  date_created: float option;
  (** 
    The date when the impersonation role was created.
     *)

  type_: impersonation_role_type option;
  (** 
    The impersonation role type.
     *)

  name: string option;
  (** 
    The impersonation role name.
     *)

  impersonation_role_id: string option;
  (** 
    The identifier of the impersonation role.
     *)

}

type list_impersonation_roles_response = {
  next_token: string option;
  (** 
    The token to retrieve the next page of results. The value is [null] when there are no results to return.
     *)

  roles: impersonation_role list option;
  (** 
    The list of impersonation roles under the given WorkMail organization.
     *)

}

type list_impersonation_roles_request = {
  max_results: int option;
  (** 
    The maximum number of results returned in a single call.
     *)

  next_token: string option;
  (** 
    The token used to retrieve the next page of results. The first call doesn't require a token.
     *)

  organization_id: string;
  (** 
    The WorkMail organization to which the listed impersonation roles belong.
     *)

}

(** 
    The identifier that contains the Group ID and name of a group.
     *)
type group_identifier = {
  group_name: string option;
  (** 
    Group name that matched the group.
     *)

  group_id: string option;
  (** 
    Group ID that matched the group.
     *)

}

type list_groups_for_entity_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. This value is `null` when there are no more results to return.
     *)

  groups: group_identifier list option;
  (** 
    The overview of groups in an organization.
     *)

}

(** 
    Filtering options for {i ListGroupsForEntity} operation. This is only used as input to Operation.
     *)
type list_groups_for_entity_filters = {
  group_name_prefix: string option;
  (** 
    Filters only group names that start with the provided name prefix.
     *)

}

type list_groups_for_entity_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  filters: list_groups_for_entity_filters option;
  (** 
    Limit the search results based on the filter criteria.
     *)

  entity_id: string;
  (** 
    The identifier for the entity.
    
     The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the entity exists.
     *)

}

(** 
    The representation of an WorkMail group.
     *)
type group = {
  disabled_date: float option;
  (** 
    The date indicating when the group was disabled from WorkMail use.
     *)

  enabled_date: float option;
  (** 
    The date indicating when the group was enabled for WorkMail use.
     *)

  state: entity_state option;
  (** 
    The state of the group, which can be ENABLED, DISABLED, or DELETED.
     *)

  name: string option;
  (** 
    The name of the group.
     *)

  email: string option;
  (** 
    The email of the group.
     *)

  id: string option;
  (** 
    The identifier of the group.
     *)

}

type list_groups_response = {
  next_token: string option;
  [@ocaml.doc {| 
    The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.
     |}]

  groups: group list option;
  (** 
    The overview of groups for an organization.
     *)

}

(** 
    Filtering options for {i ListGroups} operation. This is only used as input to Operation.
     *)
type list_groups_filters = {
  state: entity_state option;
  (** 
    Filters only groups with the provided state.
     *)

  primary_email_prefix: string option;
  (** 
    Filters only groups with the provided primary email prefix.
     *)

  name_prefix: string option;
  (** 
    Filters only groups with the provided name prefix.
     *)

}

type list_groups_request = {
  filters: list_groups_filters option;
  (** 
    Limit the search results based on the filter criteria. Only one filter per request is supported.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the groups exist.
     *)

}

(** 
    The representation of a user or group.
     *)
type member = {
  disabled_date: float option;
  (** 
    The date indicating when the member was disabled from WorkMail use.
     *)

  enabled_date: float option;
  (** 
    The date indicating when the member was enabled for WorkMail use.
     *)

  state: entity_state option;
  (** 
    The state of the member, which can be ENABLED, DISABLED, or DELETED.
     *)

  type_: member_type option;
  (** 
    A member can be a user or group.
     *)

  name: string option;
  (** 
    The name of the member.
     *)

  id: string option;
  (** 
    The identifier of the member.
     *)

}

type list_group_members_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  members: member list option;
  (** 
    The members associated to the group.
     *)

}

type list_group_members_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  group_id: string;
  (** 
    The identifier for the group to which the members (users or groups) are associated.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the group exists.
     *)

}

type availability_provider_type = | LAMBDA
  | EWS

(** 
    Describes an EWS based availability provider when returned from the service. It does not contain the password of the endpoint.
     *)
type redacted_ews_availability_provider = {
  ews_username: string option;
  (** 
    The username used to authenticate the remote EWS server.
     *)

  ews_endpoint: string option;
  (** 
    The endpoint of the remote EWS server.
     *)

}

(** 
    List all the [AvailabilityConfiguration]'s for the given WorkMail organization.
     *)
type availability_configuration = {
  date_modified: float option;
  (** 
    The date and time at which the availability configuration was last modified.
     *)

  date_created: float option;
  (** 
    The date and time at which the availability configuration was created.
     *)

  lambda_provider: lambda_availability_provider option;
  (** 
    If ProviderType is [LAMBDA] then this field contains [LambdaAvailabilityProvider]. Otherwise, it is not required.
     *)

  ews_provider: redacted_ews_availability_provider option;
  (** 
    If [ProviderType] is [EWS], then this field contains [RedactedEwsAvailabilityProvider]. Otherwise, it is not required.
     *)

  provider_type: availability_provider_type option;
  (** 
    Displays the provider type that applies to this domain.
     *)

  domain_name: string option;
  (** 
    Displays the domain to which the provider applies.
     *)

}

type list_availability_configurations_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The value is [null] when there are no further results to return.
     *)

  availability_configurations: availability_configuration list option;
  (** 
    The list of [AvailabilityConfiguration]'s that exist for the specified WorkMail organization.
     *)

}

type list_availability_configurations_request = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not require a token.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the [AvailabilityConfiguration]'s will be listed.
     *)

}

type list_aliases_response = {
  next_token: string option;
  [@ocaml.doc {| 
    The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.
     |}]

  aliases: string list option;
  (** 
    The entity's paginated aliases.
     *)

}

type list_aliases_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  entity_id: string;
  (** 
    The identifier for the entity for which to list the aliases.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the entity exists.
     *)

}

(** 
    A rule that controls access to an WorkMail organization.
     *)
type access_control_rule = {
  not_impersonation_role_ids: string list option;
  (** 
    Impersonation role IDs to exclude from the rule.
     *)

  impersonation_role_ids: string list option;
  (** 
    Impersonation role IDs to include in the rule.
     *)

  date_modified: float option;
  (** 
    The date that the rule was modified.
     *)

  date_created: float option;
  (** 
    The date that the rule was created.
     *)

  not_user_ids: string list option;
  (** 
    User IDs to exclude from the rule.
     *)

  user_ids: string list option;
  (** 
    User IDs to include in the rule.
     *)

  not_actions: string list option;
  (** 
    Access protocol actions to exclude from the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  actions: string list option;
  (** 
    Access protocol actions to include in the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  not_ip_ranges: string list option;
  (** 
    IPv4 CIDR ranges to exclude from the rule.
     *)

  ip_ranges: string list option;
  (** 
    IPv4 CIDR ranges to include in the rule.
     *)

  description: string option;
  (** 
    The rule description.
     *)

  effect_: access_control_rule_effect option;
  (** 
    The rule effect.
     *)

  name: string option;
  (** 
    The rule name.
     *)

}

type list_access_control_rules_response = {
  rules: access_control_rule list option;
  (** 
    The access control rules.
     *)

}

type list_access_control_rules_request = {
  organization_id: string;
  (** 
    The identifier for the organization.
     *)

}

type get_mobile_device_access_override_response = {
  date_modified: float option;
  (** 
    The date the description was last modified.
     *)

  date_created: float option;
  (** 
    The date the override was first created.
     *)

  description: string option;
  (** 
    A description of the override.
     *)

  effect_: mobile_device_access_rule_effect option;
  (** 
    The effect of the override, [ALLOW] or [DENY].
     *)

  device_id: string option;
  (** 
    The device to which the access override applies.
     *)

  user_id: string option;
  (** 
    The WorkMail user to which the access override applies.
     *)

}

type get_mobile_device_access_override_request = {
  device_id: string;
  (** 
    The mobile device to which the override applies. [DeviceId] is case insensitive.
     *)

  user_id: string;
  (** 
    Identifies the WorkMail user for the override. Accepts the following types of user identities:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  organization_id: string;
  (** 
    The WorkMail organization to which you want to apply the override.
     *)

}

(** 
    The rule that a simulated user matches.
     *)
type mobile_device_access_matched_rule = {
  name: string option;
  (** 
    Name of a rule that a simulated user matches.
     *)

  mobile_device_access_rule_id: string option;
  (** 
    Identifier of the rule that a simulated user matches.
     *)

}

type get_mobile_device_access_effect_response = {
  matched_rules: mobile_device_access_matched_rule list option;
  (** 
    A list of the rules which matched the simulated user input and produced the effect.
     *)

  effect_: mobile_device_access_rule_effect option;
  (** 
    The effect of the simulated access, [ALLOW] or [DENY], after evaluating mobile device access rules in the WorkMail organization for the simulated user parameters.
     *)

}

type get_mobile_device_access_effect_request = {
  device_user_agent: string option;
  (** 
    Device user agent the simulated user will report.
     *)

  device_operating_system: string option;
  (** 
    Device operating system the simulated user will report.
     *)

  device_model: string option;
  (** 
    Device model the simulated user will report.
     *)

  device_type: string option;
  (** 
    Device type the simulated user will report.
     *)

  organization_id: string;
  (** 
    The WorkMail organization to simulate the access effect for.
     *)

}

(** 
    A DNS record uploaded to your DNS provider.
     *)
type dns_record = {
  value: string option;
  (** 
    The value returned by the DNS for a query to that hostname and record type.
     *)

  hostname: string option;
  (** 
    The DNS hostname.- For example, [domain.example.com].
     *)

  type_: string option;
  (** 
    The RFC 1035 record type. Possible values: [CNAME], [A], [MX].
     *)

}

type dns_record_verification_status = | FAILED
  | VERIFIED
  | PENDING

type get_mail_domain_response = {
  dkim_verification_status: dns_record_verification_status option;
  (** 
    Indicates the status of a DKIM verification.
     *)

  ownership_verification_status: dns_record_verification_status option;
  (** 
    Indicates the status of the domain ownership verification.
     *)

  is_default: bool option;
  (** 
    Specifies whether the domain is the default domain for your organization.
     *)

  is_test_domain: bool option;
  (** 
    Specifies whether the domain is a test domain provided by WorkMail, or a custom domain.
     *)

  records: dns_record list option;
  (** 
    A list of the DNS records that WorkMail recommends adding in your DNS provider for the best user experience. The records configure your domain with DMARC, SPF, DKIM, and direct incoming email traffic to SES. See admin guide for more details.
     *)

}

type get_mail_domain_request = {
  domain_name: string;
  (** 
    The domain from which you want to retrieve details.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the domain is retrieved.
     *)

}

type get_mailbox_details_response = {
  mailbox_size: float option;
  (** 
    The current mailbox size, in MB, for the specified user.
     *)

  mailbox_quota: int option;
  (** 
    The maximum allowed mailbox size, in MB, for the specified user.
     *)

}

type get_mailbox_details_request = {
  user_id: string;
  (** 
    The identifier for the user whose mailbox details are being requested.
    
     The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: user@domain.tld
               
               }
            {- User name: user
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization that contains the user whose mailbox details are being requested.
     *)

}

(** 
    The impersonation rule that matched the input.
     *)
type impersonation_matched_rule = {
  name: string option;
  (** 
    The name of the rule that matched the input.
     *)

  impersonation_rule_id: string option;
  (** 
    The ID of the rule that matched the input
     *)

}

type get_impersonation_role_effect_response = {
  matched_rules: impersonation_matched_rule list option;
  (** 
    A list of the rules that match the input and produce the configured effect.
     *)

  effect_: access_effect option;
  (** 
    []Effect of the impersonation role on the target user based on its rules. Available effects are [ALLOW] or [DENY].
     *)

  type_: impersonation_role_type option;
  (** 
    The impersonation role type.
     *)

}

type get_impersonation_role_effect_request = {
  target_user: string;
  (** 
    The WorkMail organization user chosen to test the impersonation role. The following identity formats are available:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  impersonation_role_id: string;
  (** 
    The impersonation role ID to test.
     *)

  organization_id: string;
  (** 
    The WorkMail organization where the impersonation role is defined.
     *)

}

type get_impersonation_role_response = {
  date_modified: float option;
  (** 
    The date when the impersonation role was last modified.
     *)

  date_created: float option;
  (** 
    The date when the impersonation role was created.
     *)

  rules: impersonation_rule list option;
  (** 
    The list of rules for the given impersonation role.
     *)

  description: string option;
  (** 
    The impersonation role description.
     *)

  type_: impersonation_role_type option;
  (** 
    The impersonation role type.
     *)

  name: string option;
  (** 
    The impersonation role name.
     *)

  impersonation_role_id: string option;
  (** 
    The impersonation role ID.
     *)

}

type get_impersonation_role_request = {
  impersonation_role_id: string;
  (** 
    The impersonation role ID to retrieve.
     *)

  organization_id: string;
  (** 
    The WorkMail organization from which to retrieve the impersonation role.
     *)

}

type get_default_retention_policy_response = {
  folder_configurations: folder_configuration list option;
  (** 
    The retention policy folder configurations.
     *)

  description: string option;
  (** 
    The retention policy description.
     *)

  name: string option;
  (** 
    The retention policy name.
     *)

  id: string option;
  (** 
    The retention policy ID.
     *)

}

type get_default_retention_policy_request = {
  organization_id: string;
  (** 
    The organization ID.
     *)

}

type get_access_control_effect_response = {
  matched_rules: string list option;
  (** 
    The rules that match the given parameters, resulting in an effect.
     *)

  effect_: access_control_rule_effect option;
  (** 
    The rule effect.
     *)

}

type get_access_control_effect_request = {
  impersonation_role_id: string option;
  (** 
    The impersonation role ID.
     *)

  user_id: string option;
  (** 
    The user ID.
     *)

  action: string;
  (** 
    The access protocol action. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  ip_address: string;
  (** 
    The IPv4 address.
     *)

  organization_id: string;
  (** 
    The identifier for the organization.
     *)

}

type disassociate_member_from_group_response = unit

type disassociate_member_from_group_request = {
  member_id: string;
  (** 
    The identifier for the member to be removed from the group.
    
     The member ID can accept {i UserID or GroupId}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Member ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: member@domain.tld
               
               }
            {- Member name: member
               
               }
           
      }
       *)

  group_id: string;
  (** 
    The identifier for the group from which members are removed.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the group exists.
     *)

}

type disassociate_delegate_from_resource_response = unit

type disassociate_delegate_from_resource_request = {
  entity_id: string;
  (** 
    The identifier for the member (user, group) to be removed from the resource's delegates.
    
     The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Entity: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity@domain.tld
               
               }
            {- Entity: entity
               
               }
           
      }
       *)

  resource_id: string;
  (** 
    The identifier of the resource from which delegates' set members are removed.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the resource exists.
     *)

}

type describe_user_response = {
  office: string option;
  (** 
    Office where the user is located.
     *)

  country: string option;
  (** 
    Country where the user is located.
     *)

  department: string option;
  (** 
    Department of the user.
     *)

  zip_code: string option;
  (** 
    Zip code of the user.
     *)

  company: string option;
  (** 
    Company of the user.
     *)

  city: string option;
  (** 
    City where the user is located.
     *)

  job_title: string option;
  (** 
    Job title of the user.
     *)

  street: string option;
  (** 
    Street where the user is located.
     *)

  telephone: string option;
  (** 
    User's contact number.
     *)

  initials: string option;
  (** 
    Initials of the user.
     *)

  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the user is hidden from the global address list.
     *)

  last_name: string option;
  (** 
    Last name of the user.
     *)

  first_name: string option;
  (** 
    First name of the user.
     *)

  mailbox_deprovisioned_date: float option;
  (** 
    The date when the mailbox was removed for the user.
     *)

  mailbox_provisioned_date: float option;
  (** 
    The date when the mailbox was created for the user.
     *)

  disabled_date: float option;
  (** 
    The date and time at which the user was disabled for WorkMail usage, in UNIX epoch time format.
     *)

  enabled_date: float option;
  (** 
    The date and time at which the user was enabled for WorkMailusage, in UNIX epoch time format.
     *)

  user_role: user_role option;
  (** 
    In certain cases, other entities are modeled as users. If interoperability is enabled, resources are imported into WorkMail as users. Because different WorkMail organizations rely on different directory types, administrators can distinguish between an unregistered user (account is disabled and has a user role) and the directory administrators. The values are USER, RESOURCE, SYSTEM_USER, and REMOTE_USER.
     *)

  state: entity_state option;
  (** 
    The state of a user: enabled (registered to WorkMail) or disabled (deregistered or never registered to WorkMail).
     *)

  display_name: string option;
  (** 
    The display name of the user.
     *)

  email: string option;
  (** 
    The email of the user.
     *)

  name: string option;
  (** 
    The name for the user.
     *)

  user_id: string option;
  (** 
    The identifier for the described user.
     *)

}

type describe_user_request = {
  user_id: string;
  (** 
    The identifier for the user to be described.
    
     The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: user@domain.tld
               
               }
            {- User name: user
               
               }
           
      }
       
        *)

  organization_id: string;
  (** 
    The identifier for the organization under which the user exists.
     *)

}

type describe_resource_response = {
  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the resource is hidden from the global address list.
     *)

  description: string option;
  (** 
    Description of the resource.
     *)

  disabled_date: float option;
  (** 
    The date and time when a resource was disabled from WorkMail, in UNIX epoch time format.
     *)

  enabled_date: float option;
  (** 
    The date and time when a resource was enabled for WorkMail, in UNIX epoch time format.
     *)

  state: entity_state option;
  (** 
    The state of the resource: enabled (registered to WorkMail), disabled (deregistered or never registered to WorkMail), or deleted.
     *)

  booking_options: booking_options option;
  (** 
    The booking options for the described resource.
     *)

  type_: resource_type option;
  (** 
    The type of the described resource.
     *)

  name: string option;
  (** 
    The name of the described resource.
     *)

  email: string option;
  (** 
    The email of the described resource.
     *)

  resource_id: string option;
  (** 
    The identifier of the described resource.
     *)

}

type describe_resource_request = {
  resource_id: string;
  (** 
    The identifier of the resource to be described.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier associated with the organization for which the resource is described.
     *)

}

type describe_organization_response = {
  interoperability_enabled: bool option;
  (** 
    Indicates if interoperability is enabled for this organization.
     *)

  migration_admin: string option;
  (** 
    The user ID of the migration admin if migration is enabled for the organization.
     *)

  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the organization.
     *)

  error_message: string option;
  (** 
    (Optional) The error message indicating if unexpected behavior was encountered with regards to the organization.
     *)

  completed_date: float option;
  (** 
    The date at which the organization became usable in the WorkMail context, in UNIX epoch time format.
     *)

  default_mail_domain: string option;
  (** 
    The default mail domain associated with the organization.
     *)

  directory_type: string option;
  (** 
    The type of directory associated with the WorkMail organization.
     *)

  directory_id: string option;
  (** 
    The identifier for the directory associated with an WorkMail organization.
     *)

  state: string option;
  (** 
    The state of an organization.
     *)

  alias: string option;
  (** 
    The alias for an organization.
     *)

  organization_id: string option;
  (** 
    The identifier of an organization.
     *)

}

type describe_organization_request = {
  organization_id: string;
  (** 
    The identifier for the organization to be described.
     *)

}

type describe_mailbox_export_job_response = {
  end_time: float option;
  (** 
    The mailbox export job end timestamp.
     *)

  start_time: float option;
  (** 
    The mailbox export job start timestamp.
     *)

  error_info: string option;
  (** 
    Error information for failed mailbox export jobs.
     *)

  state: mailbox_export_job_state option;
  (** 
    The state of the mailbox export job.
     *)

  estimated_progress: int option;
  (** 
    The estimated progress of the mailbox export job, in percentage points.
     *)

  s3_path: string option;
  (** 
    The path to the S3 bucket and file that the mailbox export job is exporting to.
     *)

  s3_prefix: string option;
  (** 
    The S3 bucket prefix.
     *)

  s3_bucket_name: string option;
  (** 
    The name of the S3 bucket.
     *)

  kms_key_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key that encrypts the exported mailbox content.
     *)

  role_arn: string option;
  (** 
    The ARN of the AWS Identity and Access Management (IAM) role that grants write permission to the Amazon Simple Storage Service (Amazon S3) bucket.
     *)

  description: string option;
  (** 
    The mailbox export job description.
     *)

  entity_id: string option;
  (** 
    The identifier of the user or resource associated with the mailbox.
     *)

}

type describe_mailbox_export_job_request = {
  organization_id: string;
  (** 
    The organization ID.
     *)

  job_id: string;
  (** 
    The mailbox export job ID.
     *)

}

type describe_inbound_dmarc_settings_response = {
  enforced: bool option;
  (** 
    Lists the enforcement setting of the applied policy.
     *)

}

type describe_inbound_dmarc_settings_request = {
  organization_id: string;
  (** 
    Lists the ID of the given organization.
     *)

}

type describe_group_response = {
  hidden_from_global_address_list: bool option;
  (** 
    If the value is set to {i true}, the group is hidden from the address book.
     *)

  disabled_date: float option;
  (** 
    The date and time when a user was deregistered from WorkMail, in UNIX epoch time format.
     *)

  enabled_date: float option;
  (** 
    The date and time when a user was registered to WorkMail, in UNIX epoch time format.
     *)

  state: entity_state option;
  (** 
    The state of the user: enabled (registered to WorkMail) or disabled (deregistered or never registered to WorkMail).
     *)

  email: string option;
  (** 
    The email of the described group.
     *)

  name: string option;
  (** 
    The name of the described group.
     *)

  group_id: string option;
  (** 
    The identifier of the described group.
     *)

}

type describe_group_request = {
  group_id: string;
  (** 
    The identifier for the group to be described.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the group exists.
     *)

}

type entity_type = | RESOURCE
  | USER
  | GROUP

type describe_entity_response = {
  type_: entity_type option;
  (** 
    Entity type.
     *)

  name: string option;
  (** 
    Username, GroupName, or ResourceName based on entity type.
     *)

  entity_id: string option;
  (** 
    The entity ID under which the entity exists.
     *)

}

type describe_entity_request = {
  email: string;
  (** 
    The email under which the entity exists.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the entity exists.
     *)

}

type describe_email_monitoring_configuration_response = {
  log_group_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email monitoring configuration.
     *)

  role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring configuration.
     *)

}

type describe_email_monitoring_configuration_request = {
  organization_id: string;
  (** 
    The ID of the organization for which the email monitoring configuration is described.
     *)

}

(** 
    You SES configuration has customizations that WorkMail cannot save. The error message lists the invalid setting. For examples of invalid settings, refer to {{:https://docs.aws.amazon.com/ses/latest/APIReference/API_CreateReceiptRule.html}CreateReceiptRule}.
     *)
type invalid_custom_ses_configuration_exception = {
  message: string option;
  
}

type deregister_mail_domain_response = unit

type deregister_mail_domain_request = {
  domain_name: string;
  (** 
    The domain to deregister in WorkMail and SES.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the domain will be deregistered.
     *)

}

type deregister_from_work_mail_response = unit

type deregister_from_work_mail_request = {
  entity_id: string;
  (** 
    The identifier for the member to be updated.
    
     The identifier can be {i UserId, ResourceId, or Group Id}, {i Username, Resourcename, or Groupname}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the WorkMail entity exists.
     *)

}

type delete_user_response = unit

type delete_user_request = {
  user_id: string;
  (** 
    The identifier of the user to be deleted.
    
     The identifier can be the {i UserId} or {i Username}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- User name: user
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization that contains the user to be deleted.
     *)

}

type delete_retention_policy_response = unit

type delete_retention_policy_request = {
  id: string;
  (** 
    The retention policy ID.
     *)

  organization_id: string;
  (** 
    The organization ID.
     *)

}

type delete_resource_response = unit

type delete_resource_request = {
  resource_id: string;
  (** 
    The identifier of the resource to be deleted.
    
     The identifier can accept {i ResourceId}, or {i Resourcename}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier associated with the organization from which the resource is deleted.
     *)

}

type delete_organization_response = {
  state: string option;
  (** 
    The state of the organization.
     *)

  organization_id: string option;
  (** 
    The organization ID.
     *)

}

type delete_organization_request = {
  force_delete: bool option;
  (** 
    Deletes a WorkMail organization even if the organization has enabled users.
     *)

  delete_directory: bool;
  (** 
    If true, deletes the AWS Directory Service directory associated with the organization.
     *)

  organization_id: string;
  (** 
    The organization ID.
     *)

  client_token: string option;
  (** 
    The idempotency token associated with the request.
     *)

}

type delete_mobile_device_access_rule_response = unit

type delete_mobile_device_access_rule_request = {
  mobile_device_access_rule_id: string;
  (** 
    The identifier of the rule to be deleted.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which the rule will be deleted.
     *)

}

type delete_mobile_device_access_override_response = unit

type delete_mobile_device_access_override_request = {
  device_id: string;
  (** 
    The mobile device for which you delete the override. [DeviceId] is case insensitive.
     *)

  user_id: string;
  (** 
    The WorkMail user for which you want to delete the override. Accepts the following types of user identities:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  organization_id: string;
  (** 
    The WorkMail organization for which the access override will be deleted.
     *)

}

type delete_mailbox_permissions_response = unit

type delete_mailbox_permissions_request = {
  grantee_id: string;
  (** 
    The identifier of the entity for which to delete granted permissions.
    
     The identifier can be {i UserId, ResourceID, or Group Id}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Grantee ID: 12345678-1234-1234-1234-123456789012,r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: grantee@domain.tld
               
               }
            {- Grantee name: grantee
               
               }
           
      }
       *)

  entity_id: string;
  (** 
    The identifier of the entity that owns the mailbox.
    
     The identifier can be {i UserId or Group Id}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier of the organization under which the member (user or group) exists.
     *)

}

type delete_impersonation_role_response = unit

type delete_impersonation_role_request = {
  impersonation_role_id: string;
  (** 
    The ID of the impersonation role to delete.
     *)

  organization_id: string;
  (** 
    The WorkMail organization from which to delete the impersonation role.
     *)

}

type delete_group_response = unit

type delete_group_request = {
  group_id: string;
  (** 
    The identifier of the group to be deleted.
    
     The identifier can be the {i GroupId}, or {i Groupname}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization that contains the group.
     *)

}

type delete_email_monitoring_configuration_response = unit

type delete_email_monitoring_configuration_request = {
  organization_id: string;
  (** 
    The ID of the organization from which the email monitoring configuration is deleted.
     *)

}

type delete_availability_configuration_response = unit

type delete_availability_configuration_request = {
  domain_name: string;
  (** 
    The domain for which the [AvailabilityConfiguration] will be deleted.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the [AvailabilityConfiguration] will be deleted.
     *)

}

type delete_alias_response = unit

type delete_alias_request = {
  alias: string;
  (** 
    The aliases to be removed from the user's set of aliases. Duplicate entries in the list are collapsed into single entries (the list is transformed into a set).
     *)

  entity_id: string;
  (** 
    The identifier for the member (user or group) from which to have the aliases removed.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the user exists.
     *)

}

type delete_access_control_rule_response = unit

type delete_access_control_rule_request = {
  name: string;
  (** 
    The name of the access control rule.
     *)

  organization_id: string;
  (** 
    The identifier for the organization.
     *)

}

(** 
    This user, group, or resource name is not allowed in WorkMail.
     *)
type reserved_name_exception = {
  message: string option;
  
}

type create_user_response = {
  user_id: string option;
  (** 
    The identifier for the new user.
     *)

}

type create_user_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If this parameter is enabled, the user will be hidden from the address book.
     *)

  last_name: string option;
  (** 
    The last name of the new user.
     *)

  first_name: string option;
  (** 
    The first name of the new user.
     *)

  role: user_role option;
  (** 
    The role of the new user.
    
     You cannot pass {i SYSTEM_USER} or {i RESOURCE} role in a single request. When a user role is not selected, the default role of {i USER} is selected.
      *)

  password: string option;
  (** 
    The password for the new user.
     *)

  display_name: string;
  (** 
    The display name for the new user.
     *)

  name: string;
  (** 
    The name for the new user. WorkMail directory user names have a maximum length of 64. All others have a maximum length of 20.
     *)

  organization_id: string;
  (** 
    The identifier of the organization for which the user is created.
     *)

}

type create_resource_response = {
  resource_id: string option;
  (** 
    The identifier of the new resource.
     *)

}

type create_resource_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If this parameter is enabled, the resource will be hidden from the address book.
     *)

  description: string option;
  (** 
    Resource description.
     *)

  type_: resource_type;
  (** 
    The type of the new resource. The available types are [equipment] and [room].
     *)

  name: string;
  (** 
    The name of the new resource.
     *)

  organization_id: string;
  (** 
    The identifier associated with the organization for which the resource is created.
     *)

}

(** 
    The directory is already in use by another WorkMail organization in the same account and Region.
     *)
type directory_in_use_exception = {
  message: string option;
  
}

type create_organization_response = {
  organization_id: string option;
  (** 
    The organization ID.
     *)

}

(** 
    The domain to associate with an WorkMail organization.
    
     When you configure a domain hosted in Amazon Route 53 (Route 53), all recommended DNS records are added to the organization when you create it. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html}Adding a domain} in the {i WorkMail Administrator Guide}.
      *)
type domain = {
  hosted_zone_id: string option;
  (** 
    The hosted zone ID for a domain hosted in Route 53. Required when configuring a domain hosted in Route 53.
     *)

  domain_name: string;
  (** 
    The fully qualified domain name.
     *)

}

type create_organization_request = {
  enable_interoperability: bool option;
  (** 
    When [true], allows organization interoperability between WorkMail and Microsoft Exchange. If [true], you must include a AD Connector directory ID in the request.
     *)

  kms_key_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of a customer managed key from AWS KMS.
     *)

  domains: domain list option;
  (** 
    The email domains to associate with the organization.
     *)

  client_token: string option;
  (** 
    The idempotency token associated with the request.
     *)

  alias: string;
  (** 
    The organization alias.
     *)

  directory_id: string option;
  (** 
    The AWS Directory Service directory ID.
     *)

}

type create_mobile_device_access_rule_response = {
  mobile_device_access_rule_id: string option;
  (** 
    The identifier for the newly created mobile device access rule.
     *)

}

type create_mobile_device_access_rule_request = {
  not_device_user_agents: string list option;
  (** 
    Device user agents that the rule {b will not} match. All other device user agents will match.
     *)

  device_user_agents: string list option;
  (** 
    Device user agents that the rule will match.
     *)

  not_device_operating_systems: string list option;
  (** 
    Device operating systems that the rule {b will not} match. All other device operating systems will match.
     *)

  device_operating_systems: string list option;
  (** 
    Device operating systems that the rule will match.
     *)

  not_device_models: string list option;
  (** 
    Device models that the rule {b will not} match. All other device models will match.
     *)

  device_models: string list option;
  (** 
    Device models that the rule will match.
     *)

  not_device_types: string list option;
  (** 
    Device types that the rule {b will not} match. All other device types will match.
     *)

  device_types: string list option;
  (** 
    Device types that the rule will match.
     *)

  effect_: mobile_device_access_rule_effect;
  (** 
    The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].
     *)

  description: string option;
  (** 
    The rule description.
     *)

  name: string;
  (** 
    The rule name.
     *)

  client_token: string option;
  (** 
    The idempotency token for the client request.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which the rule will be created.
     *)

}

type create_impersonation_role_response = {
  impersonation_role_id: string option;
  (** 
    The new impersonation role ID.
     *)

}

type create_impersonation_role_request = {
  rules: impersonation_rule list;
  (** 
    The list of rules for the impersonation role.
     *)

  description: string option;
  (** 
    The description of the new impersonation role.
     *)

  type_: impersonation_role_type;
  (** 
    The impersonation role's type. The available impersonation role types are [READ_ONLY] or [FULL_ACCESS].
     *)

  name: string;
  (** 
    The name of the new impersonation role.
     *)

  organization_id: string;
  (** 
    The WorkMail organization to create the new impersonation role within.
     *)

  client_token: string option;
  (** 
    The idempotency token for the client request.
     *)

}

type create_group_response = {
  group_id: string option;
  (** 
    The identifier of the group.
     *)

}

type create_group_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If this parameter is enabled, the group will be hidden from the address book.
     *)

  name: string;
  (** 
    The name of the group.
     *)

  organization_id: string;
  (** 
    The organization under which the group is to be created.
     *)

}

type create_availability_configuration_response = unit

type create_availability_configuration_request = {
  lambda_provider: lambda_availability_provider option;
  (** 
    Lambda availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider].
     *)

  ews_provider: ews_availability_provider option;
  (** 
    Exchange Web Services (EWS) availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider].
     *)

  domain_name: string;
  (** 
    The domain to which the provider applies.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the [AvailabilityConfiguration] will be created.
     *)

  client_token: string option;
  (** 
    An idempotent token that ensures that an API request is executed only once.
     *)

}

type create_alias_response = unit

type create_alias_request = {
  alias: string;
  (** 
    The alias to add to the member set.
     *)

  entity_id: string;
  (** 
    The member (user or group) to which this alias is added.
     *)

  organization_id: string;
  (** 
    The organization under which the member (user or group) exists.
     *)

}

type cancel_mailbox_export_job_response = unit

type cancel_mailbox_export_job_request = {
  organization_id: string;
  (** 
    The organization ID.
     *)

  job_id: string;
  (** 
    The job ID.
     *)

  client_token: string;
  (** 
    The idempotency token for the client request.
     *)

}

type assume_impersonation_role_response = {
  expires_in: int option;
  (** 
    The authentication token's validity, in seconds.
     *)

  token: string option;
  (** 
    The authentication token for the impersonation role.
     *)

}

type assume_impersonation_role_request = {
  impersonation_role_id: string;
  (** 
    The impersonation role ID to assume.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which the impersonation role will be assumed.
     *)

}

type associate_member_to_group_response = unit

type associate_member_to_group_request = {
  member_id: string;
  (** 
    The member (user or group) to associate to the group.
    
     The member ID can accept {i UserID or GroupId}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Member: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: member@domain.tld
               
               }
            {- Member name: member
               
               }
           
      }
       *)

  group_id: string;
  (** 
    The group to which the member (user or group) is associated.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization under which the group exists.
     *)

}

type associate_delegate_to_resource_response = unit

type associate_delegate_to_resource_request = {
  entity_id: string;
  (** 
    The member (user or group) to associate to the resource.
    
     The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Entity: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity@domain.tld
               
               }
            {- Entity: entity
               
               }
           
      }
       *)

  resource_id: string;
  (** 
    The resource for which members (users or groups) are associated.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization under which the resource exists.
     *)

}

(** 
    WorkMail is a secure, managed business email and calendaring service with support for existing desktop and mobile email clients. You can access your email, contacts, and calendars using Microsoft Outlook, your browser, or other native iOS and Android email applications. You can integrate WorkMail with your existing corporate directory and control both the keys that encrypt your data and the location in which your data is stored.
    
     The WorkMail API is designed for the following scenarios:
     
      {ul
           {- Listing and describing organizations
              
              }
           
      }
       {ul
            {- Managing users
               
               }
            
      }
       {ul
            {- Managing groups
               
               }
            
      }
       {ul
            {- Managing resources
               
               }
            
      }
       All WorkMail API operations are Amazon-authenticated and certificate-signed. They not only require the use of the AWS SDK, but also allow for the exclusive use of AWS Identity and Access Management users and roles to help facilitate access, trust, and permission policies. By creating a role and allowing an IAM user to access the WorkMail site, the IAM user gains full administrative visibility into the entire WorkMail organization (or as set in the IAM policy). This includes, but is not limited to, the ability to create, update, and delete users, groups, and resources. This allows developers to perform the scenarios listed above, as well as give users the ability to grant access on a selective basis using the IAM model.
        *)


type base_document = Json.t

