open Smaws_Lib.Json.SerializeHelpers

open Types

let string__to_yojson = string_to_yojson

let unsupported_operation_exception_to_yojson = 
  fun (x: unsupported_operation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let organization_state_exception_to_yojson = 
  fun (x: organization_state_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let organization_not_found_exception_to_yojson = 
  fun (x: organization_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_parameter_exception_to_yojson = 
  fun (x: invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let entity_state_exception_to_yojson = 
  fun (x: entity_state_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let entity_not_found_exception_to_yojson = 
  fun (x: entity_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let directory_unavailable_exception_to_yojson = 
  fun (x: directory_unavailable_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let directory_service_authentication_failed_exception_to_yojson = 
  fun (x: directory_service_authentication_failed_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_user_response_to_yojson = 
  fun (x: update_user_response) -> assoc_to_yojson(
    [
  ])

let organization_id_to_yojson = string_to_yojson

let entity_identifier_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let user_role_to_yojson = 
  fun (x: user_role) -> match x with 
 
| REMOTE_USER -> `String "REMOTE_USER"
  | SYSTEM_USER -> `String "SYSTEM_USER"
  | RESOURCE -> `String "RESOURCE"
  | USER -> `String "USER"
   

let user_attribute_to_yojson = string_to_yojson

let boolean_object_to_yojson = bool_to_yojson

let update_user_request_to_yojson = 
  fun (x: update_user_request) -> assoc_to_yojson(
    [(
         "Office",
         (option_to_yojson user_attribute_to_yojson x.office));
       (
         "Country",
         (option_to_yojson user_attribute_to_yojson x.country));
       (
         "Department",
         (option_to_yojson user_attribute_to_yojson x.department));
       (
         "ZipCode",
         (option_to_yojson user_attribute_to_yojson x.zip_code));
       (
         "Company",
         (option_to_yojson user_attribute_to_yojson x.company));
       (
         "City",
         (option_to_yojson user_attribute_to_yojson x.city));
       (
         "JobTitle",
         (option_to_yojson user_attribute_to_yojson x.job_title));
       (
         "Street",
         (option_to_yojson user_attribute_to_yojson x.street));
       (
         "Telephone",
         (option_to_yojson user_attribute_to_yojson x.telephone));
       (
         "Initials",
         (option_to_yojson user_attribute_to_yojson x.initials));
       (
         "HiddenFromGlobalAddressList",
         (option_to_yojson boolean_object_to_yojson x.hidden_from_global_address_list));
       (
         "LastName",
         (option_to_yojson user_attribute_to_yojson x.last_name));
       (
         "FirstName",
         (option_to_yojson user_attribute_to_yojson x.first_name));
       (
         "DisplayName",
         (option_to_yojson user_attribute_to_yojson x.display_name));
       (
         "Role",
         (option_to_yojson user_role_to_yojson x.role));
       (
         "UserId",
         (Some (entity_identifier_to_yojson x.user_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let name_availability_exception_to_yojson = 
  fun (x: name_availability_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let mail_domain_state_exception_to_yojson = 
  fun (x: mail_domain_state_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let mail_domain_not_found_exception_to_yojson = 
  fun (x: mail_domain_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_configuration_exception_to_yojson = 
  fun (x: invalid_configuration_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let email_address_in_use_exception_to_yojson = 
  fun (x: email_address_in_use_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_resource_response_to_yojson = 
  fun (x: update_resource_response) -> assoc_to_yojson(
    [
  ])

let resource_name_to_yojson = string_to_yojson

let boolean__to_yojson = bool_to_yojson

let booking_options_to_yojson = 
  fun (x: booking_options) -> assoc_to_yojson(
    [(
         "AutoDeclineConflictingRequests",
         (option_to_yojson boolean__to_yojson x.auto_decline_conflicting_requests));
       (
         "AutoDeclineRecurringRequests",
         (option_to_yojson boolean__to_yojson x.auto_decline_recurring_requests));
       (
         "AutoAcceptRequests",
         (option_to_yojson boolean__to_yojson x.auto_accept_requests));
       
  ])

let new_resource_description_to_yojson = string_to_yojson

let resource_type_to_yojson = 
  fun (x: resource_type) -> match x with 
  | EQUIPMENT -> `String "EQUIPMENT"
    | ROOM -> `String "ROOM"
     

let update_resource_request_to_yojson = 
  fun (x: update_resource_request) -> assoc_to_yojson(
    [(
         "HiddenFromGlobalAddressList",
         (option_to_yojson boolean_object_to_yojson x.hidden_from_global_address_list));
       (
         "Type",
         (option_to_yojson resource_type_to_yojson x.type_));
       (
         "Description",
         (option_to_yojson new_resource_description_to_yojson x.description));
       (
         "BookingOptions",
         (option_to_yojson booking_options_to_yojson x.booking_options));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "ResourceId",
         (Some (entity_identifier_to_yojson x.resource_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let update_primary_email_address_response_to_yojson = 
  fun (x: update_primary_email_address_response) -> assoc_to_yojson(
    [
  ])

let email_address_to_yojson = string_to_yojson

let update_primary_email_address_request_to_yojson = 
  fun (x: update_primary_email_address_request) -> assoc_to_yojson(
    [(
         "Email",
         (Some (email_address_to_yojson x.email)));
       (
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let update_mobile_device_access_rule_response_to_yojson = 
  fun (x: update_mobile_device_access_rule_response) -> assoc_to_yojson(
    [
  ])

let mobile_device_access_rule_id_to_yojson = string_to_yojson

let mobile_device_access_rule_name_to_yojson = string_to_yojson

let mobile_device_access_rule_description_to_yojson = string_to_yojson

let mobile_device_access_rule_effect_to_yojson = 
  fun (x: mobile_device_access_rule_effect) -> match x with 
  | DENY -> `String "DENY"
    | ALLOW -> `String "ALLOW"
     

let device_type_to_yojson = string_to_yojson

let device_type_list_to_yojson = 
  fun tree -> list_to_yojson device_type_to_yojson tree

let device_model_to_yojson = string_to_yojson

let device_model_list_to_yojson = 
  fun tree -> list_to_yojson device_model_to_yojson tree

let device_operating_system_to_yojson = string_to_yojson

let device_operating_system_list_to_yojson = 
  fun tree -> list_to_yojson device_operating_system_to_yojson tree

let device_user_agent_to_yojson = string_to_yojson

let device_user_agent_list_to_yojson = 
  fun tree -> list_to_yojson device_user_agent_to_yojson tree

let update_mobile_device_access_rule_request_to_yojson = 
  fun (x: update_mobile_device_access_rule_request) -> assoc_to_yojson(
    [(
         "NotDeviceUserAgents",
         (option_to_yojson device_user_agent_list_to_yojson x.not_device_user_agents));
       (
         "DeviceUserAgents",
         (option_to_yojson device_user_agent_list_to_yojson x.device_user_agents));
       (
         "NotDeviceOperatingSystems",
         (option_to_yojson device_operating_system_list_to_yojson x.not_device_operating_systems));
       (
         "DeviceOperatingSystems",
         (option_to_yojson device_operating_system_list_to_yojson x.device_operating_systems));
       (
         "NotDeviceModels",
         (option_to_yojson device_model_list_to_yojson x.not_device_models));
       (
         "DeviceModels",
         (option_to_yojson device_model_list_to_yojson x.device_models));
       (
         "NotDeviceTypes",
         (option_to_yojson device_type_list_to_yojson x.not_device_types));
       (
         "DeviceTypes",
         (option_to_yojson device_type_list_to_yojson x.device_types));
       (
         "Effect",
         (Some (mobile_device_access_rule_effect_to_yojson x.effect)));
       (
         "Description",
         (option_to_yojson mobile_device_access_rule_description_to_yojson x.description));
       (
         "Name",
         (Some (mobile_device_access_rule_name_to_yojson x.name)));
       (
         "MobileDeviceAccessRuleId",
         (Some (mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let update_mailbox_quota_response_to_yojson = 
  fun (x: update_mailbox_quota_response) -> assoc_to_yojson(
    [
  ])

let mailbox_quota_to_yojson = int_to_yojson

let update_mailbox_quota_request_to_yojson = 
  fun (x: update_mailbox_quota_request) -> assoc_to_yojson(
    [(
         "MailboxQuota",
         (Some (mailbox_quota_to_yojson x.mailbox_quota)));
       (
         "UserId",
         (Some (entity_identifier_to_yojson x.user_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_impersonation_role_response_to_yojson = 
  fun (x: update_impersonation_role_response) -> assoc_to_yojson(
    [
  ])

let impersonation_role_id_to_yojson = string_to_yojson

let impersonation_role_name_to_yojson = string_to_yojson

let impersonation_role_type_to_yojson = 
  fun (x: impersonation_role_type) -> match x with 
  | READ_ONLY -> `String "READ_ONLY"
    | FULL_ACCESS -> `String "FULL_ACCESS"
     

let impersonation_role_description_to_yojson = string_to_yojson

let impersonation_rule_id_to_yojson = string_to_yojson

let impersonation_rule_name_to_yojson = string_to_yojson

let impersonation_rule_description_to_yojson = string_to_yojson

let access_effect_to_yojson = 
  fun (x: access_effect) -> match x with 
  | DENY -> `String "DENY"
    | ALLOW -> `String "ALLOW"
     

let target_users_to_yojson = 
  fun tree -> list_to_yojson entity_identifier_to_yojson tree

let impersonation_rule_to_yojson = 
  fun (x: impersonation_rule) -> assoc_to_yojson(
    [(
         "NotTargetUsers",
         (option_to_yojson target_users_to_yojson x.not_target_users));
       (
         "TargetUsers",
         (option_to_yojson target_users_to_yojson x.target_users));
       (
         "Effect",
         (Some (access_effect_to_yojson x.effect)));
       (
         "Description",
         (option_to_yojson impersonation_rule_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson impersonation_rule_name_to_yojson x.name));
       (
         "ImpersonationRuleId",
         (Some (impersonation_rule_id_to_yojson x.impersonation_rule_id)));
       
  ])

let impersonation_rule_list_to_yojson = 
  fun tree -> list_to_yojson impersonation_rule_to_yojson tree

let update_impersonation_role_request_to_yojson = 
  fun (x: update_impersonation_role_request) -> assoc_to_yojson(
    [(
         "Rules",
         (Some (impersonation_rule_list_to_yojson x.rules)));
       (
         "Description",
         (option_to_yojson impersonation_role_description_to_yojson x.description));
       (
         "Type",
         (Some (impersonation_role_type_to_yojson x.type_)));
       (
         "Name",
         (Some (impersonation_role_name_to_yojson x.name)));
       (
         "ImpersonationRoleId",
         (Some (impersonation_role_id_to_yojson x.impersonation_role_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let update_group_response_to_yojson = 
  fun (x: update_group_response) -> assoc_to_yojson(
    [
  ])

let update_group_request_to_yojson = 
  fun (x: update_group_request) -> assoc_to_yojson(
    [(
         "HiddenFromGlobalAddressList",
         (option_to_yojson boolean_object_to_yojson x.hidden_from_global_address_list));
       (
         "GroupId",
         (Some (entity_identifier_to_yojson x.group_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let update_default_mail_domain_response_to_yojson = 
  fun (x: update_default_mail_domain_response) -> assoc_to_yojson(
    [
  ])

let work_mail_domain_name_to_yojson = string_to_yojson

let update_default_mail_domain_request_to_yojson = 
  fun (x: update_default_mail_domain_request) -> assoc_to_yojson(
    [(
         "DomainName",
         (Some (work_mail_domain_name_to_yojson x.domain_name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let update_availability_configuration_response_to_yojson = 
  fun (x: update_availability_configuration_response) -> assoc_to_yojson(
    [
  ])

let domain_name_to_yojson = string_to_yojson

let url_to_yojson = string_to_yojson

let external_user_name_to_yojson = string_to_yojson

let password_to_yojson = string_to_yojson

let ews_availability_provider_to_yojson = 
  fun (x: ews_availability_provider) -> assoc_to_yojson(
    [(
         "EwsPassword",
         (Some (password_to_yojson x.ews_password)));
       (
         "EwsUsername",
         (Some (external_user_name_to_yojson x.ews_username)));
       (
         "EwsEndpoint",
         (Some (url_to_yojson x.ews_endpoint)));
       
  ])

let lambda_arn_to_yojson = string_to_yojson

let lambda_availability_provider_to_yojson = 
  fun (x: lambda_availability_provider) -> assoc_to_yojson(
    [(
         "LambdaArn",
         (Some (lambda_arn_to_yojson x.lambda_arn)));
       
  ])

let update_availability_configuration_request_to_yojson = 
  fun (x: update_availability_configuration_request) -> assoc_to_yojson(
    [(
         "LambdaProvider",
         (option_to_yojson lambda_availability_provider_to_yojson x.lambda_provider));
       (
         "EwsProvider",
         (option_to_yojson ews_availability_provider_to_yojson x.ews_provider));
       (
         "DomainName",
         (Some (domain_name_to_yojson x.domain_name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let amazon_resource_name_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       
  ])

let test_availability_configuration_response_to_yojson = 
  fun (x: test_availability_configuration_response) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson string__to_yojson x.failure_reason));
       (
         "TestPassed",
         (option_to_yojson boolean__to_yojson x.test_passed));
       
  ])

let test_availability_configuration_request_to_yojson = 
  fun (x: test_availability_configuration_request) -> assoc_to_yojson(
    [(
         "LambdaProvider",
         (option_to_yojson lambda_availability_provider_to_yojson x.lambda_provider));
       (
         "EwsProvider",
         (option_to_yojson ews_availability_provider_to_yojson x.ews_provider));
       (
         "DomainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let too_many_tags_exception_to_yojson = 
  fun (x: too_many_tags_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (Some (tag_value_to_yojson x.value)));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       
  ])

let mailbox_export_job_id_to_yojson = string_to_yojson

let start_mailbox_export_job_response_to_yojson = 
  fun (x: start_mailbox_export_job_response) -> assoc_to_yojson(
    [(
         "JobId",
         (option_to_yojson mailbox_export_job_id_to_yojson x.job_id));
       
  ])

let idempotency_client_token_to_yojson = string_to_yojson

let description_to_yojson = string_to_yojson

let role_arn_to_yojson = string_to_yojson

let kms_key_arn_to_yojson = string_to_yojson

let s3_bucket_name_to_yojson = string_to_yojson

let s3_object_key_to_yojson = string_to_yojson

let start_mailbox_export_job_request_to_yojson = 
  fun (x: start_mailbox_export_job_request) -> assoc_to_yojson(
    [(
         "S3Prefix",
         (Some (s3_object_key_to_yojson x.s3_prefix)));
       (
         "S3BucketName",
         (Some (s3_bucket_name_to_yojson x.s3_bucket_name)));
       (
         "KmsKeyArn",
         (Some (kms_key_arn_to_yojson x.kms_key_arn)));
       (
         "RoleArn",
         (Some (role_arn_to_yojson x.role_arn)));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       (
         "ClientToken",
         (Some (idempotency_client_token_to_yojson x.client_token)));
       
  ])

let invalid_password_exception_to_yojson = 
  fun (x: invalid_password_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let reset_password_response_to_yojson = 
  fun (x: reset_password_response) -> assoc_to_yojson(
    [
  ])

let work_mail_identifier_to_yojson = string_to_yojson

let reset_password_request_to_yojson = 
  fun (x: reset_password_request) -> assoc_to_yojson(
    [(
         "Password",
         (Some (password_to_yojson x.password)));
       (
         "UserId",
         (Some (work_mail_identifier_to_yojson x.user_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let entity_already_registered_exception_to_yojson = 
  fun (x: entity_already_registered_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let register_to_work_mail_response_to_yojson = 
  fun (x: register_to_work_mail_response) -> assoc_to_yojson(
    [
  ])

let register_to_work_mail_request_to_yojson = 
  fun (x: register_to_work_mail_request) -> assoc_to_yojson(
    [(
         "Email",
         (Some (email_address_to_yojson x.email)));
       (
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let mail_domain_in_use_exception_to_yojson = 
  fun (x: mail_domain_in_use_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let register_mail_domain_response_to_yojson = 
  fun (x: register_mail_domain_response) -> assoc_to_yojson(
    [
  ])

let register_mail_domain_request_to_yojson = 
  fun (x: register_mail_domain_request) -> assoc_to_yojson(
    [(
         "DomainName",
         (Some (work_mail_domain_name_to_yojson x.domain_name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       (
         "ClientToken",
         (option_to_yojson idempotency_client_token_to_yojson x.client_token));
       
  ])

let put_retention_policy_response_to_yojson = 
  fun (x: put_retention_policy_response) -> assoc_to_yojson(
    [
  ])

let short_string_to_yojson = string_to_yojson

let policy_description_to_yojson = string_to_yojson

let folder_name_to_yojson = 
  fun (x: folder_name) -> match x with 
 
| JUNK_EMAIL -> `String "JUNK_EMAIL"
  | DRAFTS -> `String "DRAFTS"
  | SENT_ITEMS -> `String "SENT_ITEMS"
  | DELETED_ITEMS -> `String "DELETED_ITEMS"
  | INBOX -> `String "INBOX"
   

let retention_action_to_yojson = 
  fun (x: retention_action) -> match x with 
 
| PERMANENTLY_DELETE -> `String "PERMANENTLY_DELETE"
  | DELETE -> `String "DELETE"
  | NONE -> `String "NONE"
   

let retention_period_to_yojson = int_to_yojson

let folder_configuration_to_yojson = 
  fun (x: folder_configuration) -> assoc_to_yojson(
    [(
         "Period",
         (option_to_yojson retention_period_to_yojson x.period));
       (
         "Action",
         (Some (retention_action_to_yojson x.action)));
       (
         "Name",
         (Some (folder_name_to_yojson x.name)));
       
  ])

let folder_configurations_to_yojson = 
  fun tree -> list_to_yojson folder_configuration_to_yojson tree

let put_retention_policy_request_to_yojson = 
  fun (x: put_retention_policy_request) -> assoc_to_yojson(
    [(
         "FolderConfigurations",
         (Some (folder_configurations_to_yojson x.folder_configurations)));
       (
         "Description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "Name",
         (Some (short_string_to_yojson x.name)));
       (
         "Id",
         (option_to_yojson short_string_to_yojson x.id));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let put_mobile_device_access_override_response_to_yojson = 
  fun (x: put_mobile_device_access_override_response) -> assoc_to_yojson(
    [
  ])

let device_id_to_yojson = string_to_yojson

let put_mobile_device_access_override_request_to_yojson = 
  fun (x: put_mobile_device_access_override_request) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson mobile_device_access_rule_description_to_yojson x.description));
       (
         "Effect",
         (Some (mobile_device_access_rule_effect_to_yojson x.effect)));
       (
         "DeviceId",
         (Some (device_id_to_yojson x.device_id)));
       (
         "UserId",
         (Some (entity_identifier_to_yojson x.user_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let put_mailbox_permissions_response_to_yojson = 
  fun (x: put_mailbox_permissions_response) -> assoc_to_yojson(
    [
  ])

let permission_type_to_yojson = 
  fun (x: permission_type) -> match x with 
 
| SEND_ON_BEHALF -> `String "SEND_ON_BEHALF"
  | SEND_AS -> `String "SEND_AS"
  | FULL_ACCESS -> `String "FULL_ACCESS"
   

let permission_values_to_yojson = 
  fun tree -> list_to_yojson permission_type_to_yojson tree

let put_mailbox_permissions_request_to_yojson = 
  fun (x: put_mailbox_permissions_request) -> assoc_to_yojson(
    [(
         "PermissionValues",
         (Some (permission_values_to_yojson x.permission_values)));
       (
         "GranteeId",
         (Some (entity_identifier_to_yojson x.grantee_id)));
       (
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let put_inbound_dmarc_settings_response_to_yojson = 
  fun (x: put_inbound_dmarc_settings_response) -> assoc_to_yojson(
    [
  ])

let put_inbound_dmarc_settings_request_to_yojson = 
  fun (x: put_inbound_dmarc_settings_request) -> assoc_to_yojson(
    [(
         "Enforced",
         (Some (boolean_object_to_yojson x.enforced)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let put_email_monitoring_configuration_response_to_yojson = 
  fun (x: put_email_monitoring_configuration_response) -> assoc_to_yojson(
    [
  ])

let log_group_arn_to_yojson = string_to_yojson

let put_email_monitoring_configuration_request_to_yojson = 
  fun (x: put_email_monitoring_configuration_request) -> assoc_to_yojson(
    [(
         "LogGroupArn",
         (Some (log_group_arn_to_yojson x.log_group_arn)));
       (
         "RoleArn",
         (Some (role_arn_to_yojson x.role_arn)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let put_access_control_rule_response_to_yojson = 
  fun (x: put_access_control_rule_response) -> assoc_to_yojson(
    [
  ])

let access_control_rule_name_to_yojson = string_to_yojson

let access_control_rule_effect_to_yojson = 
  fun (x: access_control_rule_effect) -> match x with 
  | DENY -> `String "DENY"
    | ALLOW -> `String "ALLOW"
     

let access_control_rule_description_to_yojson = string_to_yojson

let ip_range_to_yojson = string_to_yojson

let ip_range_list_to_yojson = 
  fun tree -> list_to_yojson ip_range_to_yojson tree

let access_control_rule_action_to_yojson = string_to_yojson

let actions_list_to_yojson = 
  fun tree -> list_to_yojson access_control_rule_action_to_yojson tree

let user_id_list_to_yojson = 
  fun tree -> list_to_yojson work_mail_identifier_to_yojson tree

let impersonation_role_id_list_to_yojson = 
  fun tree -> list_to_yojson impersonation_role_id_to_yojson tree

let put_access_control_rule_request_to_yojson = 
  fun (x: put_access_control_rule_request) -> assoc_to_yojson(
    [(
         "NotImpersonationRoleIds",
         (option_to_yojson impersonation_role_id_list_to_yojson x.not_impersonation_role_ids));
       (
         "ImpersonationRoleIds",
         (option_to_yojson impersonation_role_id_list_to_yojson x.impersonation_role_ids));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       (
         "NotUserIds",
         (option_to_yojson user_id_list_to_yojson x.not_user_ids));
       (
         "UserIds",
         (option_to_yojson user_id_list_to_yojson x.user_ids));
       (
         "NotActions",
         (option_to_yojson actions_list_to_yojson x.not_actions));
       (
         "Actions",
         (option_to_yojson actions_list_to_yojson x.actions));
       (
         "NotIpRanges",
         (option_to_yojson ip_range_list_to_yojson x.not_ip_ranges));
       (
         "IpRanges",
         (option_to_yojson ip_range_list_to_yojson x.ip_ranges));
       (
         "Description",
         (Some (access_control_rule_description_to_yojson x.description)));
       (
         "Effect",
         (Some (access_control_rule_effect_to_yojson x.effect)));
       (
         "Name",
         (Some (access_control_rule_name_to_yojson x.name)));
       
  ])

let user_name_to_yojson = string_to_yojson

let entity_state_to_yojson = 
  fun (x: entity_state) -> match x with 
 
| DELETED -> `String "DELETED"
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
   

let timestamp__to_yojson = timestamp_to_yojson

let user_to_yojson = 
  fun (x: user) -> assoc_to_yojson(
    [(
         "DisabledDate",
         (option_to_yojson timestamp__to_yojson x.disabled_date));
       (
         "EnabledDate",
         (option_to_yojson timestamp__to_yojson x.enabled_date));
       (
         "UserRole",
         (option_to_yojson user_role_to_yojson x.user_role));
       (
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "DisplayName",
         (option_to_yojson string__to_yojson x.display_name));
       (
         "Name",
         (option_to_yojson user_name_to_yojson x.name));
       (
         "Email",
         (option_to_yojson email_address_to_yojson x.email));
       (
         "Id",
         (option_to_yojson work_mail_identifier_to_yojson x.id));
       
  ])

let users_to_yojson = fun tree -> list_to_yojson user_to_yojson tree

let next_token_to_yojson = string_to_yojson

let list_users_response_to_yojson = 
  fun (x: list_users_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Users",
         (option_to_yojson users_to_yojson x.users));
       
  ])

let max_results_to_yojson = int_to_yojson

let list_users_filters_to_yojson = 
  fun (x: list_users_filters) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "PrimaryEmailPrefix",
         (option_to_yojson string__to_yojson x.primary_email_prefix));
       (
         "DisplayNamePrefix",
         (option_to_yojson user_attribute_to_yojson x.display_name_prefix));
       (
         "UsernamePrefix",
         (option_to_yojson string__to_yojson x.username_prefix));
       
  ])

let list_users_request_to_yojson = 
  fun (x: list_users_request) -> assoc_to_yojson(
    [(
         "Filters",
         (option_to_yojson list_users_filters_to_yojson x.filters));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       
  ])

let resource_description_to_yojson = string_to_yojson

let resource_to_yojson = 
  fun (x: resource) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "DisabledDate",
         (option_to_yojson timestamp__to_yojson x.disabled_date));
       (
         "EnabledDate",
         (option_to_yojson timestamp__to_yojson x.enabled_date));
       (
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "Type",
         (option_to_yojson resource_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "Email",
         (option_to_yojson email_address_to_yojson x.email));
       (
         "Id",
         (option_to_yojson work_mail_identifier_to_yojson x.id));
       
  ])

let resources_to_yojson = 
  fun tree -> list_to_yojson resource_to_yojson tree

let list_resources_response_to_yojson = 
  fun (x: list_resources_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Resources",
         (option_to_yojson resources_to_yojson x.resources));
       
  ])

let list_resources_filters_to_yojson = 
  fun (x: list_resources_filters) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "PrimaryEmailPrefix",
         (option_to_yojson string__to_yojson x.primary_email_prefix));
       (
         "NamePrefix",
         (option_to_yojson string__to_yojson x.name_prefix));
       
  ])

let list_resources_request_to_yojson = 
  fun (x: list_resources_request) -> assoc_to_yojson(
    [(
         "Filters",
         (option_to_yojson list_resources_filters_to_yojson x.filters));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let member_type_to_yojson = 
  fun (x: member_type) -> match x with 
  | USER -> `String "USER"
    | GROUP -> `String "GROUP"
     

let delegate_to_yojson = 
  fun (x: delegate) -> assoc_to_yojson(
    [(
         "Type",
         (Some (member_type_to_yojson x.type_)));
       (
         "Id",
         (Some (string__to_yojson x.id)));
       
  ])

let resource_delegates_to_yojson = 
  fun tree -> list_to_yojson delegate_to_yojson tree

let list_resource_delegates_response_to_yojson = 
  fun (x: list_resource_delegates_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Delegates",
         (option_to_yojson resource_delegates_to_yojson x.delegates));
       
  ])

let list_resource_delegates_request_to_yojson = 
  fun (x: list_resource_delegates_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ResourceId",
         (Some (entity_identifier_to_yojson x.resource_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let organization_name_to_yojson = string_to_yojson

let organization_summary_to_yojson = 
  fun (x: organization_summary) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson string__to_yojson x.state));
       (
         "ErrorMessage",
         (option_to_yojson string__to_yojson x.error_message));
       (
         "DefaultMailDomain",
         (option_to_yojson domain_name_to_yojson x.default_mail_domain));
       (
         "Alias",
         (option_to_yojson organization_name_to_yojson x.alias));
       (
         "OrganizationId",
         (option_to_yojson organization_id_to_yojson x.organization_id));
       
  ])

let organization_summaries_to_yojson = 
  fun tree -> list_to_yojson organization_summary_to_yojson tree

let list_organizations_response_to_yojson = 
  fun (x: list_organizations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "OrganizationSummaries",
         (option_to_yojson organization_summaries_to_yojson x.organization_summaries));
       
  ])

let list_organizations_request_to_yojson = 
  fun (x: list_organizations_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let mobile_device_access_rule_to_yojson = 
  fun (x: mobile_device_access_rule) -> assoc_to_yojson(
    [(
         "DateModified",
         (option_to_yojson timestamp__to_yojson x.date_modified));
       (
         "DateCreated",
         (option_to_yojson timestamp__to_yojson x.date_created));
       (
         "NotDeviceUserAgents",
         (option_to_yojson device_user_agent_list_to_yojson x.not_device_user_agents));
       (
         "DeviceUserAgents",
         (option_to_yojson device_user_agent_list_to_yojson x.device_user_agents));
       (
         "NotDeviceOperatingSystems",
         (option_to_yojson device_operating_system_list_to_yojson x.not_device_operating_systems));
       (
         "DeviceOperatingSystems",
         (option_to_yojson device_operating_system_list_to_yojson x.device_operating_systems));
       (
         "NotDeviceModels",
         (option_to_yojson device_model_list_to_yojson x.not_device_models));
       (
         "DeviceModels",
         (option_to_yojson device_model_list_to_yojson x.device_models));
       (
         "NotDeviceTypes",
         (option_to_yojson device_type_list_to_yojson x.not_device_types));
       (
         "DeviceTypes",
         (option_to_yojson device_type_list_to_yojson x.device_types));
       (
         "Effect",
         (option_to_yojson mobile_device_access_rule_effect_to_yojson x.effect));
       (
         "Description",
         (option_to_yojson mobile_device_access_rule_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson mobile_device_access_rule_name_to_yojson x.name));
       (
         "MobileDeviceAccessRuleId",
         (option_to_yojson mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id));
       
  ])

let mobile_device_access_rules_list_to_yojson = 
  fun tree -> list_to_yojson mobile_device_access_rule_to_yojson tree

let list_mobile_device_access_rules_response_to_yojson = 
  fun (x: list_mobile_device_access_rules_response) -> assoc_to_yojson(
    [(
         "Rules",
         (option_to_yojson mobile_device_access_rules_list_to_yojson x.rules));
       
  ])

let list_mobile_device_access_rules_request_to_yojson = 
  fun (x: list_mobile_device_access_rules_request) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let mobile_device_access_override_to_yojson = 
  fun (x: mobile_device_access_override) -> assoc_to_yojson(
    [(
         "DateModified",
         (option_to_yojson timestamp__to_yojson x.date_modified));
       (
         "DateCreated",
         (option_to_yojson timestamp__to_yojson x.date_created));
       (
         "Description",
         (option_to_yojson mobile_device_access_rule_description_to_yojson x.description));
       (
         "Effect",
         (option_to_yojson mobile_device_access_rule_effect_to_yojson x.effect));
       (
         "DeviceId",
         (option_to_yojson device_id_to_yojson x.device_id));
       (
         "UserId",
         (option_to_yojson work_mail_identifier_to_yojson x.user_id));
       
  ])

let mobile_device_access_overrides_list_to_yojson = 
  fun tree -> list_to_yojson mobile_device_access_override_to_yojson tree

let list_mobile_device_access_overrides_response_to_yojson = 
  fun (x: list_mobile_device_access_overrides_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Overrides",
         (option_to_yojson mobile_device_access_overrides_list_to_yojson x.overrides));
       
  ])

let list_mobile_device_access_overrides_request_to_yojson = 
  fun (x: list_mobile_device_access_overrides_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DeviceId",
         (option_to_yojson device_id_to_yojson x.device_id));
       (
         "UserId",
         (option_to_yojson entity_identifier_to_yojson x.user_id));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let mail_domain_summary_to_yojson = 
  fun (x: mail_domain_summary) -> assoc_to_yojson(
    [(
         "DefaultDomain",
         (option_to_yojson boolean__to_yojson x.default_domain));
       (
         "DomainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       
  ])

let mail_domains_to_yojson = 
  fun tree -> list_to_yojson mail_domain_summary_to_yojson tree

let list_mail_domains_response_to_yojson = 
  fun (x: list_mail_domains_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MailDomains",
         (option_to_yojson mail_domains_to_yojson x.mail_domains));
       
  ])

let list_mail_domains_request_to_yojson = 
  fun (x: list_mail_domains_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let permission_to_yojson = 
  fun (x: permission) -> assoc_to_yojson(
    [(
         "PermissionValues",
         (Some (permission_values_to_yojson x.permission_values)));
       (
         "GranteeType",
         (Some (member_type_to_yojson x.grantee_type)));
       (
         "GranteeId",
         (Some (work_mail_identifier_to_yojson x.grantee_id)));
       
  ])

let permissions_to_yojson = 
  fun tree -> list_to_yojson permission_to_yojson tree

let list_mailbox_permissions_response_to_yojson = 
  fun (x: list_mailbox_permissions_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Permissions",
         (option_to_yojson permissions_to_yojson x.permissions));
       
  ])

let list_mailbox_permissions_request_to_yojson = 
  fun (x: list_mailbox_permissions_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let percentage_to_yojson = int_to_yojson

let mailbox_export_job_state_to_yojson = 
  fun (x: mailbox_export_job_state) -> match x with 
 
| CANCELLED -> `String "CANCELLED"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | RUNNING -> `String "RUNNING"
   

let mailbox_export_job_to_yojson = 
  fun (x: mailbox_export_job) -> assoc_to_yojson(
    [(
         "EndTime",
         (option_to_yojson timestamp__to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson timestamp__to_yojson x.start_time));
       (
         "State",
         (option_to_yojson mailbox_export_job_state_to_yojson x.state));
       (
         "EstimatedProgress",
         (option_to_yojson percentage_to_yojson x.estimated_progress));
       (
         "S3Path",
         (option_to_yojson s3_object_key_to_yojson x.s3_path));
       (
         "S3BucketName",
         (option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "EntityId",
         (option_to_yojson work_mail_identifier_to_yojson x.entity_id));
       (
         "JobId",
         (option_to_yojson mailbox_export_job_id_to_yojson x.job_id));
       
  ])

let jobs_to_yojson = 
  fun tree -> list_to_yojson mailbox_export_job_to_yojson tree

let list_mailbox_export_jobs_response_to_yojson = 
  fun (x: list_mailbox_export_jobs_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Jobs",
         (option_to_yojson jobs_to_yojson x.jobs));
       
  ])

let list_mailbox_export_jobs_request_to_yojson = 
  fun (x: list_mailbox_export_jobs_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let impersonation_role_to_yojson = 
  fun (x: impersonation_role) -> assoc_to_yojson(
    [(
         "DateModified",
         (option_to_yojson timestamp__to_yojson x.date_modified));
       (
         "DateCreated",
         (option_to_yojson timestamp__to_yojson x.date_created));
       (
         "Type",
         (option_to_yojson impersonation_role_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson impersonation_role_name_to_yojson x.name));
       (
         "ImpersonationRoleId",
         (option_to_yojson impersonation_role_id_to_yojson x.impersonation_role_id));
       
  ])

let impersonation_role_list_to_yojson = 
  fun tree -> list_to_yojson impersonation_role_to_yojson tree

let list_impersonation_roles_response_to_yojson = 
  fun (x: list_impersonation_roles_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Roles",
         (option_to_yojson impersonation_role_list_to_yojson x.roles));
       
  ])

let list_impersonation_roles_request_to_yojson = 
  fun (x: list_impersonation_roles_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let group_name_to_yojson = string_to_yojson

let group_identifier_to_yojson = 
  fun (x: group_identifier) -> assoc_to_yojson(
    [(
         "GroupName",
         (option_to_yojson group_name_to_yojson x.group_name));
       (
         "GroupId",
         (option_to_yojson work_mail_identifier_to_yojson x.group_id));
       
  ])

let group_identifiers_to_yojson = 
  fun tree -> list_to_yojson group_identifier_to_yojson tree

let list_groups_for_entity_response_to_yojson = 
  fun (x: list_groups_for_entity_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Groups",
         (option_to_yojson group_identifiers_to_yojson x.groups));
       
  ])

let list_groups_for_entity_filters_to_yojson = 
  fun (x: list_groups_for_entity_filters) -> assoc_to_yojson(
    [(
         "GroupNamePrefix",
         (option_to_yojson string__to_yojson x.group_name_prefix));
       
  ])

let list_groups_for_entity_request_to_yojson = 
  fun (x: list_groups_for_entity_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Filters",
         (option_to_yojson list_groups_for_entity_filters_to_yojson x.filters));
       (
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let group_to_yojson = 
  fun (x: group) -> assoc_to_yojson(
    [(
         "DisabledDate",
         (option_to_yojson timestamp__to_yojson x.disabled_date));
       (
         "EnabledDate",
         (option_to_yojson timestamp__to_yojson x.enabled_date));
       (
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "Name",
         (option_to_yojson group_name_to_yojson x.name));
       (
         "Email",
         (option_to_yojson email_address_to_yojson x.email));
       (
         "Id",
         (option_to_yojson work_mail_identifier_to_yojson x.id));
       
  ])

let groups_to_yojson = fun tree -> list_to_yojson group_to_yojson tree

let list_groups_response_to_yojson = 
  fun (x: list_groups_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Groups",
         (option_to_yojson groups_to_yojson x.groups));
       
  ])

let list_groups_filters_to_yojson = 
  fun (x: list_groups_filters) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "PrimaryEmailPrefix",
         (option_to_yojson string__to_yojson x.primary_email_prefix));
       (
         "NamePrefix",
         (option_to_yojson string__to_yojson x.name_prefix));
       
  ])

let list_groups_request_to_yojson = 
  fun (x: list_groups_request) -> assoc_to_yojson(
    [(
         "Filters",
         (option_to_yojson list_groups_filters_to_yojson x.filters));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let member_to_yojson = 
  fun (x: member) -> assoc_to_yojson(
    [(
         "DisabledDate",
         (option_to_yojson timestamp__to_yojson x.disabled_date));
       (
         "EnabledDate",
         (option_to_yojson timestamp__to_yojson x.enabled_date));
       (
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "Type",
         (option_to_yojson member_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "Id",
         (option_to_yojson string__to_yojson x.id));
       
  ])

let members_to_yojson = fun tree -> list_to_yojson member_to_yojson tree

let list_group_members_response_to_yojson = 
  fun (x: list_group_members_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Members",
         (option_to_yojson members_to_yojson x.members));
       
  ])

let list_group_members_request_to_yojson = 
  fun (x: list_group_members_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "GroupId",
         (Some (entity_identifier_to_yojson x.group_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let availability_provider_type_to_yojson = 
  fun (x: availability_provider_type) -> match x with 
  | LAMBDA -> `String "LAMBDA"
    | EWS -> `String "EWS"
     

let redacted_ews_availability_provider_to_yojson = 
  fun (x: redacted_ews_availability_provider) -> assoc_to_yojson(
    [(
         "EwsUsername",
         (option_to_yojson external_user_name_to_yojson x.ews_username));
       (
         "EwsEndpoint",
         (option_to_yojson url_to_yojson x.ews_endpoint));
       
  ])

let availability_configuration_to_yojson = 
  fun (x: availability_configuration) -> assoc_to_yojson(
    [(
         "DateModified",
         (option_to_yojson timestamp__to_yojson x.date_modified));
       (
         "DateCreated",
         (option_to_yojson timestamp__to_yojson x.date_created));
       (
         "LambdaProvider",
         (option_to_yojson lambda_availability_provider_to_yojson x.lambda_provider));
       (
         "EwsProvider",
         (option_to_yojson redacted_ews_availability_provider_to_yojson x.ews_provider));
       (
         "ProviderType",
         (option_to_yojson availability_provider_type_to_yojson x.provider_type));
       (
         "DomainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       
  ])

let availability_configuration_list_to_yojson = 
  fun tree -> list_to_yojson availability_configuration_to_yojson tree

let list_availability_configurations_response_to_yojson = 
  fun (x: list_availability_configurations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AvailabilityConfigurations",
         (option_to_yojson availability_configuration_list_to_yojson x.availability_configurations));
       
  ])

let list_availability_configurations_request_to_yojson = 
  fun (x: list_availability_configurations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let aliases_to_yojson = 
  fun tree -> list_to_yojson email_address_to_yojson tree

let list_aliases_response_to_yojson = 
  fun (x: list_aliases_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Aliases",
         (option_to_yojson aliases_to_yojson x.aliases));
       
  ])

let list_aliases_request_to_yojson = 
  fun (x: list_aliases_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EntityId",
         (Some (work_mail_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let access_control_rule_to_yojson = 
  fun (x: access_control_rule) -> assoc_to_yojson(
    [(
         "NotImpersonationRoleIds",
         (option_to_yojson impersonation_role_id_list_to_yojson x.not_impersonation_role_ids));
       (
         "ImpersonationRoleIds",
         (option_to_yojson impersonation_role_id_list_to_yojson x.impersonation_role_ids));
       (
         "DateModified",
         (option_to_yojson timestamp__to_yojson x.date_modified));
       (
         "DateCreated",
         (option_to_yojson timestamp__to_yojson x.date_created));
       (
         "NotUserIds",
         (option_to_yojson user_id_list_to_yojson x.not_user_ids));
       (
         "UserIds",
         (option_to_yojson user_id_list_to_yojson x.user_ids));
       (
         "NotActions",
         (option_to_yojson actions_list_to_yojson x.not_actions));
       (
         "Actions",
         (option_to_yojson actions_list_to_yojson x.actions));
       (
         "NotIpRanges",
         (option_to_yojson ip_range_list_to_yojson x.not_ip_ranges));
       (
         "IpRanges",
         (option_to_yojson ip_range_list_to_yojson x.ip_ranges));
       (
         "Description",
         (option_to_yojson access_control_rule_description_to_yojson x.description));
       (
         "Effect",
         (option_to_yojson access_control_rule_effect_to_yojson x.effect));
       (
         "Name",
         (option_to_yojson access_control_rule_name_to_yojson x.name));
       
  ])

let access_control_rules_list_to_yojson = 
  fun tree -> list_to_yojson access_control_rule_to_yojson tree

let list_access_control_rules_response_to_yojson = 
  fun (x: list_access_control_rules_response) -> assoc_to_yojson(
    [(
         "Rules",
         (option_to_yojson access_control_rules_list_to_yojson x.rules));
       
  ])

let list_access_control_rules_request_to_yojson = 
  fun (x: list_access_control_rules_request) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let get_mobile_device_access_override_response_to_yojson = 
  fun (x: get_mobile_device_access_override_response) -> assoc_to_yojson(
    [(
         "DateModified",
         (option_to_yojson timestamp__to_yojson x.date_modified));
       (
         "DateCreated",
         (option_to_yojson timestamp__to_yojson x.date_created));
       (
         "Description",
         (option_to_yojson mobile_device_access_rule_description_to_yojson x.description));
       (
         "Effect",
         (option_to_yojson mobile_device_access_rule_effect_to_yojson x.effect));
       (
         "DeviceId",
         (option_to_yojson device_id_to_yojson x.device_id));
       (
         "UserId",
         (option_to_yojson work_mail_identifier_to_yojson x.user_id));
       
  ])

let get_mobile_device_access_override_request_to_yojson = 
  fun (x: get_mobile_device_access_override_request) -> assoc_to_yojson(
    [(
         "DeviceId",
         (Some (device_id_to_yojson x.device_id)));
       (
         "UserId",
         (Some (entity_identifier_to_yojson x.user_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let mobile_device_access_matched_rule_to_yojson = 
  fun (x: mobile_device_access_matched_rule) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson mobile_device_access_rule_name_to_yojson x.name));
       (
         "MobileDeviceAccessRuleId",
         (option_to_yojson mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id));
       
  ])

let mobile_device_access_matched_rule_list_to_yojson = 
  fun tree -> list_to_yojson mobile_device_access_matched_rule_to_yojson tree

let get_mobile_device_access_effect_response_to_yojson = 
  fun (x: get_mobile_device_access_effect_response) -> assoc_to_yojson(
    [(
         "MatchedRules",
         (option_to_yojson mobile_device_access_matched_rule_list_to_yojson x.matched_rules));
       (
         "Effect",
         (option_to_yojson mobile_device_access_rule_effect_to_yojson x.effect));
       
  ])

let get_mobile_device_access_effect_request_to_yojson = 
  fun (x: get_mobile_device_access_effect_request) -> assoc_to_yojson(
    [(
         "DeviceUserAgent",
         (option_to_yojson device_user_agent_to_yojson x.device_user_agent));
       (
         "DeviceOperatingSystem",
         (option_to_yojson device_operating_system_to_yojson x.device_operating_system));
       (
         "DeviceModel",
         (option_to_yojson device_model_to_yojson x.device_model));
       (
         "DeviceType",
         (option_to_yojson device_type_to_yojson x.device_type));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let dns_record_to_yojson = 
  fun (x: dns_record) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson string__to_yojson x.value));
       (
         "Hostname",
         (option_to_yojson string__to_yojson x.hostname));
       (
         "Type",
         (option_to_yojson string__to_yojson x.type_));
       
  ])

let dns_records_to_yojson = 
  fun tree -> list_to_yojson dns_record_to_yojson tree

let dns_record_verification_status_to_yojson = 
  fun (x: dns_record_verification_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | VERIFIED -> `String "VERIFIED"
  | PENDING -> `String "PENDING"
   

let get_mail_domain_response_to_yojson = 
  fun (x: get_mail_domain_response) -> assoc_to_yojson(
    [(
         "DkimVerificationStatus",
         (option_to_yojson dns_record_verification_status_to_yojson x.dkim_verification_status));
       (
         "OwnershipVerificationStatus",
         (option_to_yojson dns_record_verification_status_to_yojson x.ownership_verification_status));
       (
         "IsDefault",
         (option_to_yojson boolean__to_yojson x.is_default));
       (
         "IsTestDomain",
         (option_to_yojson boolean__to_yojson x.is_test_domain));
       (
         "Records",
         (option_to_yojson dns_records_to_yojson x.records));
       
  ])

let get_mail_domain_request_to_yojson = 
  fun (x: get_mail_domain_request) -> assoc_to_yojson(
    [(
         "DomainName",
         (Some (work_mail_domain_name_to_yojson x.domain_name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let mailbox_size_to_yojson = double_to_yojson

let get_mailbox_details_response_to_yojson = 
  fun (x: get_mailbox_details_response) -> assoc_to_yojson(
    [(
         "MailboxSize",
         (option_to_yojson mailbox_size_to_yojson x.mailbox_size));
       (
         "MailboxQuota",
         (option_to_yojson mailbox_quota_to_yojson x.mailbox_quota));
       
  ])

let get_mailbox_details_request_to_yojson = 
  fun (x: get_mailbox_details_request) -> assoc_to_yojson(
    [(
         "UserId",
         (Some (entity_identifier_to_yojson x.user_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let impersonation_matched_rule_to_yojson = 
  fun (x: impersonation_matched_rule) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson impersonation_rule_name_to_yojson x.name));
       (
         "ImpersonationRuleId",
         (option_to_yojson impersonation_rule_id_to_yojson x.impersonation_rule_id));
       
  ])

let impersonation_matched_rule_list_to_yojson = 
  fun tree -> list_to_yojson impersonation_matched_rule_to_yojson tree

let get_impersonation_role_effect_response_to_yojson = 
  fun (x: get_impersonation_role_effect_response) -> assoc_to_yojson(
    [(
         "MatchedRules",
         (option_to_yojson impersonation_matched_rule_list_to_yojson x.matched_rules));
       (
         "Effect",
         (option_to_yojson access_effect_to_yojson x.effect));
       (
         "Type",
         (option_to_yojson impersonation_role_type_to_yojson x.type_));
       
  ])

let get_impersonation_role_effect_request_to_yojson = 
  fun (x: get_impersonation_role_effect_request) -> assoc_to_yojson(
    [(
         "TargetUser",
         (Some (entity_identifier_to_yojson x.target_user)));
       (
         "ImpersonationRoleId",
         (Some (impersonation_role_id_to_yojson x.impersonation_role_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let get_impersonation_role_response_to_yojson = 
  fun (x: get_impersonation_role_response) -> assoc_to_yojson(
    [(
         "DateModified",
         (option_to_yojson timestamp__to_yojson x.date_modified));
       (
         "DateCreated",
         (option_to_yojson timestamp__to_yojson x.date_created));
       (
         "Rules",
         (option_to_yojson impersonation_rule_list_to_yojson x.rules));
       (
         "Description",
         (option_to_yojson impersonation_role_description_to_yojson x.description));
       (
         "Type",
         (option_to_yojson impersonation_role_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson impersonation_role_name_to_yojson x.name));
       (
         "ImpersonationRoleId",
         (option_to_yojson impersonation_role_id_to_yojson x.impersonation_role_id));
       
  ])

let get_impersonation_role_request_to_yojson = 
  fun (x: get_impersonation_role_request) -> assoc_to_yojson(
    [(
         "ImpersonationRoleId",
         (Some (impersonation_role_id_to_yojson x.impersonation_role_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let get_default_retention_policy_response_to_yojson = 
  fun (x: get_default_retention_policy_response) -> assoc_to_yojson(
    [(
         "FolderConfigurations",
         (option_to_yojson folder_configurations_to_yojson x.folder_configurations));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "Name",
         (option_to_yojson short_string_to_yojson x.name));
       (
         "Id",
         (option_to_yojson short_string_to_yojson x.id));
       
  ])

let get_default_retention_policy_request_to_yojson = 
  fun (x: get_default_retention_policy_request) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let access_control_rule_name_list_to_yojson = 
  fun tree -> list_to_yojson access_control_rule_name_to_yojson tree

let get_access_control_effect_response_to_yojson = 
  fun (x: get_access_control_effect_response) -> assoc_to_yojson(
    [(
         "MatchedRules",
         (option_to_yojson access_control_rule_name_list_to_yojson x.matched_rules));
       (
         "Effect",
         (option_to_yojson access_control_rule_effect_to_yojson x.effect));
       
  ])

let ip_address_to_yojson = string_to_yojson

let get_access_control_effect_request_to_yojson = 
  fun (x: get_access_control_effect_request) -> assoc_to_yojson(
    [(
         "ImpersonationRoleId",
         (option_to_yojson impersonation_role_id_to_yojson x.impersonation_role_id));
       (
         "UserId",
         (option_to_yojson work_mail_identifier_to_yojson x.user_id));
       (
         "Action",
         (Some (access_control_rule_action_to_yojson x.action)));
       (
         "IpAddress",
         (Some (ip_address_to_yojson x.ip_address)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let disassociate_member_from_group_response_to_yojson = 
  fun (x: disassociate_member_from_group_response) -> assoc_to_yojson(
    [
  ])

let disassociate_member_from_group_request_to_yojson = 
  fun (x: disassociate_member_from_group_request) -> assoc_to_yojson(
    [(
         "MemberId",
         (Some (entity_identifier_to_yojson x.member_id)));
       (
         "GroupId",
         (Some (entity_identifier_to_yojson x.group_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let disassociate_delegate_from_resource_response_to_yojson = 
  fun (x: disassociate_delegate_from_resource_response) -> assoc_to_yojson(
    [
  ])

let disassociate_delegate_from_resource_request_to_yojson = 
  fun (x: disassociate_delegate_from_resource_request) -> assoc_to_yojson(
    [(
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "ResourceId",
         (Some (entity_identifier_to_yojson x.resource_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let describe_user_response_to_yojson = 
  fun (x: describe_user_response) -> assoc_to_yojson(
    [(
         "Office",
         (option_to_yojson user_attribute_to_yojson x.office));
       (
         "Country",
         (option_to_yojson user_attribute_to_yojson x.country));
       (
         "Department",
         (option_to_yojson user_attribute_to_yojson x.department));
       (
         "ZipCode",
         (option_to_yojson user_attribute_to_yojson x.zip_code));
       (
         "Company",
         (option_to_yojson user_attribute_to_yojson x.company));
       (
         "City",
         (option_to_yojson user_attribute_to_yojson x.city));
       (
         "JobTitle",
         (option_to_yojson user_attribute_to_yojson x.job_title));
       (
         "Street",
         (option_to_yojson user_attribute_to_yojson x.street));
       (
         "Telephone",
         (option_to_yojson user_attribute_to_yojson x.telephone));
       (
         "Initials",
         (option_to_yojson user_attribute_to_yojson x.initials));
       (
         "HiddenFromGlobalAddressList",
         (option_to_yojson boolean__to_yojson x.hidden_from_global_address_list));
       (
         "LastName",
         (option_to_yojson user_attribute_to_yojson x.last_name));
       (
         "FirstName",
         (option_to_yojson user_attribute_to_yojson x.first_name));
       (
         "MailboxDeprovisionedDate",
         (option_to_yojson timestamp__to_yojson x.mailbox_deprovisioned_date));
       (
         "MailboxProvisionedDate",
         (option_to_yojson timestamp__to_yojson x.mailbox_provisioned_date));
       (
         "DisabledDate",
         (option_to_yojson timestamp__to_yojson x.disabled_date));
       (
         "EnabledDate",
         (option_to_yojson timestamp__to_yojson x.enabled_date));
       (
         "UserRole",
         (option_to_yojson user_role_to_yojson x.user_role));
       (
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "DisplayName",
         (option_to_yojson user_attribute_to_yojson x.display_name));
       (
         "Email",
         (option_to_yojson email_address_to_yojson x.email));
       (
         "Name",
         (option_to_yojson user_name_to_yojson x.name));
       (
         "UserId",
         (option_to_yojson work_mail_identifier_to_yojson x.user_id));
       
  ])

let describe_user_request_to_yojson = 
  fun (x: describe_user_request) -> assoc_to_yojson(
    [(
         "UserId",
         (Some (entity_identifier_to_yojson x.user_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let resource_id_to_yojson = string_to_yojson

let describe_resource_response_to_yojson = 
  fun (x: describe_resource_response) -> assoc_to_yojson(
    [(
         "HiddenFromGlobalAddressList",
         (option_to_yojson boolean__to_yojson x.hidden_from_global_address_list));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "DisabledDate",
         (option_to_yojson timestamp__to_yojson x.disabled_date));
       (
         "EnabledDate",
         (option_to_yojson timestamp__to_yojson x.enabled_date));
       (
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "BookingOptions",
         (option_to_yojson booking_options_to_yojson x.booking_options));
       (
         "Type",
         (option_to_yojson resource_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "Email",
         (option_to_yojson email_address_to_yojson x.email));
       (
         "ResourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       
  ])

let describe_resource_request_to_yojson = 
  fun (x: describe_resource_request) -> assoc_to_yojson(
    [(
         "ResourceId",
         (Some (entity_identifier_to_yojson x.resource_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let describe_organization_response_to_yojson = 
  fun (x: describe_organization_response) -> assoc_to_yojson(
    [(
         "InteroperabilityEnabled",
         (option_to_yojson boolean__to_yojson x.interoperability_enabled));
       (
         "MigrationAdmin",
         (option_to_yojson work_mail_identifier_to_yojson x.migration_admin));
       (
         "ARN",
         (option_to_yojson amazon_resource_name_to_yojson x.ar_n));
       (
         "ErrorMessage",
         (option_to_yojson string__to_yojson x.error_message));
       (
         "CompletedDate",
         (option_to_yojson timestamp__to_yojson x.completed_date));
       (
         "DefaultMailDomain",
         (option_to_yojson string__to_yojson x.default_mail_domain));
       (
         "DirectoryType",
         (option_to_yojson string__to_yojson x.directory_type));
       (
         "DirectoryId",
         (option_to_yojson string__to_yojson x.directory_id));
       (
         "State",
         (option_to_yojson string__to_yojson x.state));
       (
         "Alias",
         (option_to_yojson organization_name_to_yojson x.alias));
       (
         "OrganizationId",
         (option_to_yojson organization_id_to_yojson x.organization_id));
       
  ])

let describe_organization_request_to_yojson = 
  fun (x: describe_organization_request) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let mailbox_export_error_info_to_yojson = string_to_yojson

let describe_mailbox_export_job_response_to_yojson = 
  fun (x: describe_mailbox_export_job_response) -> assoc_to_yojson(
    [(
         "EndTime",
         (option_to_yojson timestamp__to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson timestamp__to_yojson x.start_time));
       (
         "ErrorInfo",
         (option_to_yojson mailbox_export_error_info_to_yojson x.error_info));
       (
         "State",
         (option_to_yojson mailbox_export_job_state_to_yojson x.state));
       (
         "EstimatedProgress",
         (option_to_yojson percentage_to_yojson x.estimated_progress));
       (
         "S3Path",
         (option_to_yojson s3_object_key_to_yojson x.s3_path));
       (
         "S3Prefix",
         (option_to_yojson s3_object_key_to_yojson x.s3_prefix));
       (
         "S3BucketName",
         (option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name));
       (
         "KmsKeyArn",
         (option_to_yojson kms_key_arn_to_yojson x.kms_key_arn));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "EntityId",
         (option_to_yojson work_mail_identifier_to_yojson x.entity_id));
       
  ])

let describe_mailbox_export_job_request_to_yojson = 
  fun (x: describe_mailbox_export_job_request) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       (
         "JobId",
         (Some (mailbox_export_job_id_to_yojson x.job_id)));
       
  ])

let describe_inbound_dmarc_settings_response_to_yojson = 
  fun (x: describe_inbound_dmarc_settings_response) -> assoc_to_yojson(
    [(
         "Enforced",
         (option_to_yojson boolean__to_yojson x.enforced));
       
  ])

let describe_inbound_dmarc_settings_request_to_yojson = 
  fun (x: describe_inbound_dmarc_settings_request) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let describe_group_response_to_yojson = 
  fun (x: describe_group_response) -> assoc_to_yojson(
    [(
         "HiddenFromGlobalAddressList",
         (option_to_yojson boolean__to_yojson x.hidden_from_global_address_list));
       (
         "DisabledDate",
         (option_to_yojson timestamp__to_yojson x.disabled_date));
       (
         "EnabledDate",
         (option_to_yojson timestamp__to_yojson x.enabled_date));
       (
         "State",
         (option_to_yojson entity_state_to_yojson x.state));
       (
         "Email",
         (option_to_yojson email_address_to_yojson x.email));
       (
         "Name",
         (option_to_yojson group_name_to_yojson x.name));
       (
         "GroupId",
         (option_to_yojson work_mail_identifier_to_yojson x.group_id));
       
  ])

let describe_group_request_to_yojson = 
  fun (x: describe_group_request) -> assoc_to_yojson(
    [(
         "GroupId",
         (Some (entity_identifier_to_yojson x.group_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let entity_type_to_yojson = 
  fun (x: entity_type) -> match x with 
 
| RESOURCE -> `String "RESOURCE"
  | USER -> `String "USER"
  | GROUP -> `String "GROUP"
   

let describe_entity_response_to_yojson = 
  fun (x: describe_entity_response) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson entity_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "EntityId",
         (option_to_yojson work_mail_identifier_to_yojson x.entity_id));
       
  ])

let describe_entity_request_to_yojson = 
  fun (x: describe_entity_request) -> assoc_to_yojson(
    [(
         "Email",
         (Some (email_address_to_yojson x.email)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let describe_email_monitoring_configuration_response_to_yojson = 
  fun (x: describe_email_monitoring_configuration_response) -> assoc_to_yojson(
    [(
         "LogGroupArn",
         (option_to_yojson log_group_arn_to_yojson x.log_group_arn));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       
  ])

let describe_email_monitoring_configuration_request_to_yojson = 
  fun (x: describe_email_monitoring_configuration_request) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let invalid_custom_ses_configuration_exception_to_yojson = 
  fun (x: invalid_custom_ses_configuration_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let deregister_mail_domain_response_to_yojson = 
  fun (x: deregister_mail_domain_response) -> assoc_to_yojson(
    [
  ])

let deregister_mail_domain_request_to_yojson = 
  fun (x: deregister_mail_domain_request) -> assoc_to_yojson(
    [(
         "DomainName",
         (Some (work_mail_domain_name_to_yojson x.domain_name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let deregister_from_work_mail_response_to_yojson = 
  fun (x: deregister_from_work_mail_response) -> assoc_to_yojson(
    [
  ])

let deregister_from_work_mail_request_to_yojson = 
  fun (x: deregister_from_work_mail_request) -> assoc_to_yojson(
    [(
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_user_response_to_yojson = 
  fun (x: delete_user_response) -> assoc_to_yojson(
    [
  ])

let delete_user_request_to_yojson = 
  fun (x: delete_user_request) -> assoc_to_yojson(
    [(
         "UserId",
         (Some (entity_identifier_to_yojson x.user_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_retention_policy_response_to_yojson = 
  fun (x: delete_retention_policy_response) -> assoc_to_yojson(
    [
  ])

let delete_retention_policy_request_to_yojson = 
  fun (x: delete_retention_policy_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (short_string_to_yojson x.id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_resource_response_to_yojson = 
  fun (x: delete_resource_response) -> assoc_to_yojson(
    [
  ])

let delete_resource_request_to_yojson = 
  fun (x: delete_resource_request) -> assoc_to_yojson(
    [(
         "ResourceId",
         (Some (entity_identifier_to_yojson x.resource_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_organization_response_to_yojson = 
  fun (x: delete_organization_response) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson string__to_yojson x.state));
       (
         "OrganizationId",
         (option_to_yojson organization_id_to_yojson x.organization_id));
       
  ])

let delete_organization_request_to_yojson = 
  fun (x: delete_organization_request) -> assoc_to_yojson(
    [(
         "ForceDelete",
         (option_to_yojson boolean__to_yojson x.force_delete));
       (
         "DeleteDirectory",
         (Some (boolean__to_yojson x.delete_directory)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       (
         "ClientToken",
         (option_to_yojson idempotency_client_token_to_yojson x.client_token));
       
  ])

let delete_mobile_device_access_rule_response_to_yojson = 
  fun (x: delete_mobile_device_access_rule_response) -> assoc_to_yojson(
    [
  ])

let delete_mobile_device_access_rule_request_to_yojson = 
  fun (x: delete_mobile_device_access_rule_request) -> assoc_to_yojson(
    [(
         "MobileDeviceAccessRuleId",
         (Some (mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_mobile_device_access_override_response_to_yojson = 
  fun (x: delete_mobile_device_access_override_response) -> assoc_to_yojson(
    [
  ])

let delete_mobile_device_access_override_request_to_yojson = 
  fun (x: delete_mobile_device_access_override_request) -> assoc_to_yojson(
    [(
         "DeviceId",
         (Some (device_id_to_yojson x.device_id)));
       (
         "UserId",
         (Some (entity_identifier_to_yojson x.user_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_mailbox_permissions_response_to_yojson = 
  fun (x: delete_mailbox_permissions_response) -> assoc_to_yojson(
    [
  ])

let delete_mailbox_permissions_request_to_yojson = 
  fun (x: delete_mailbox_permissions_request) -> assoc_to_yojson(
    [(
         "GranteeId",
         (Some (entity_identifier_to_yojson x.grantee_id)));
       (
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_impersonation_role_response_to_yojson = 
  fun (x: delete_impersonation_role_response) -> assoc_to_yojson(
    [
  ])

let delete_impersonation_role_request_to_yojson = 
  fun (x: delete_impersonation_role_request) -> assoc_to_yojson(
    [(
         "ImpersonationRoleId",
         (Some (impersonation_role_id_to_yojson x.impersonation_role_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_group_response_to_yojson = 
  fun (x: delete_group_response) -> assoc_to_yojson(
    [
  ])

let delete_group_request_to_yojson = 
  fun (x: delete_group_request) -> assoc_to_yojson(
    [(
         "GroupId",
         (Some (entity_identifier_to_yojson x.group_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_email_monitoring_configuration_response_to_yojson = 
  fun (x: delete_email_monitoring_configuration_response) -> assoc_to_yojson(
    [
  ])

let delete_email_monitoring_configuration_request_to_yojson = 
  fun (x: delete_email_monitoring_configuration_request) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_availability_configuration_response_to_yojson = 
  fun (x: delete_availability_configuration_response) -> assoc_to_yojson(
    [
  ])

let delete_availability_configuration_request_to_yojson = 
  fun (x: delete_availability_configuration_request) -> assoc_to_yojson(
    [(
         "DomainName",
         (Some (domain_name_to_yojson x.domain_name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_alias_response_to_yojson = 
  fun (x: delete_alias_response) -> assoc_to_yojson(
    [
  ])

let delete_alias_request_to_yojson = 
  fun (x: delete_alias_request) -> assoc_to_yojson(
    [(
         "Alias",
         (Some (email_address_to_yojson x.alias)));
       (
         "EntityId",
         (Some (work_mail_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let delete_access_control_rule_response_to_yojson = 
  fun (x: delete_access_control_rule_response) -> assoc_to_yojson(
    [
  ])

let delete_access_control_rule_request_to_yojson = 
  fun (x: delete_access_control_rule_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (access_control_rule_name_to_yojson x.name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let reserved_name_exception_to_yojson = 
  fun (x: reserved_name_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let create_user_response_to_yojson = 
  fun (x: create_user_response) -> assoc_to_yojson(
    [(
         "UserId",
         (option_to_yojson work_mail_identifier_to_yojson x.user_id));
       
  ])

let create_user_request_to_yojson = 
  fun (x: create_user_request) -> assoc_to_yojson(
    [(
         "HiddenFromGlobalAddressList",
         (option_to_yojson boolean__to_yojson x.hidden_from_global_address_list));
       (
         "LastName",
         (option_to_yojson user_attribute_to_yojson x.last_name));
       (
         "FirstName",
         (option_to_yojson user_attribute_to_yojson x.first_name));
       (
         "Role",
         (option_to_yojson user_role_to_yojson x.role));
       (
         "Password",
         (option_to_yojson password_to_yojson x.password));
       (
         "DisplayName",
         (Some (user_attribute_to_yojson x.display_name)));
       (
         "Name",
         (Some (user_name_to_yojson x.name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let create_resource_response_to_yojson = 
  fun (x: create_resource_response) -> assoc_to_yojson(
    [(
         "ResourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       
  ])

let create_resource_request_to_yojson = 
  fun (x: create_resource_request) -> assoc_to_yojson(
    [(
         "HiddenFromGlobalAddressList",
         (option_to_yojson boolean__to_yojson x.hidden_from_global_address_list));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "Type",
         (Some (resource_type_to_yojson x.type_)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let directory_in_use_exception_to_yojson = 
  fun (x: directory_in_use_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let create_organization_response_to_yojson = 
  fun (x: create_organization_response) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (option_to_yojson organization_id_to_yojson x.organization_id));
       
  ])

let directory_id_to_yojson = string_to_yojson

let hosted_zone_id_to_yojson = string_to_yojson

let domain_to_yojson = 
  fun (x: domain) -> assoc_to_yojson(
    [(
         "HostedZoneId",
         (option_to_yojson hosted_zone_id_to_yojson x.hosted_zone_id));
       (
         "DomainName",
         (Some (domain_name_to_yojson x.domain_name)));
       
  ])

let domains_to_yojson = fun tree -> list_to_yojson domain_to_yojson tree

let create_organization_request_to_yojson = 
  fun (x: create_organization_request) -> assoc_to_yojson(
    [(
         "EnableInteroperability",
         (option_to_yojson boolean__to_yojson x.enable_interoperability));
       (
         "KmsKeyArn",
         (option_to_yojson kms_key_arn_to_yojson x.kms_key_arn));
       (
         "Domains",
         (option_to_yojson domains_to_yojson x.domains));
       (
         "ClientToken",
         (option_to_yojson idempotency_client_token_to_yojson x.client_token));
       (
         "Alias",
         (Some (organization_name_to_yojson x.alias)));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let create_mobile_device_access_rule_response_to_yojson = 
  fun (x: create_mobile_device_access_rule_response) -> assoc_to_yojson(
    [(
         "MobileDeviceAccessRuleId",
         (option_to_yojson mobile_device_access_rule_id_to_yojson x.mobile_device_access_rule_id));
       
  ])

let create_mobile_device_access_rule_request_to_yojson = 
  fun (x: create_mobile_device_access_rule_request) -> assoc_to_yojson(
    [(
         "NotDeviceUserAgents",
         (option_to_yojson device_user_agent_list_to_yojson x.not_device_user_agents));
       (
         "DeviceUserAgents",
         (option_to_yojson device_user_agent_list_to_yojson x.device_user_agents));
       (
         "NotDeviceOperatingSystems",
         (option_to_yojson device_operating_system_list_to_yojson x.not_device_operating_systems));
       (
         "DeviceOperatingSystems",
         (option_to_yojson device_operating_system_list_to_yojson x.device_operating_systems));
       (
         "NotDeviceModels",
         (option_to_yojson device_model_list_to_yojson x.not_device_models));
       (
         "DeviceModels",
         (option_to_yojson device_model_list_to_yojson x.device_models));
       (
         "NotDeviceTypes",
         (option_to_yojson device_type_list_to_yojson x.not_device_types));
       (
         "DeviceTypes",
         (option_to_yojson device_type_list_to_yojson x.device_types));
       (
         "Effect",
         (Some (mobile_device_access_rule_effect_to_yojson x.effect)));
       (
         "Description",
         (option_to_yojson mobile_device_access_rule_description_to_yojson x.description));
       (
         "Name",
         (Some (mobile_device_access_rule_name_to_yojson x.name)));
       (
         "ClientToken",
         (option_to_yojson idempotency_client_token_to_yojson x.client_token));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let create_impersonation_role_response_to_yojson = 
  fun (x: create_impersonation_role_response) -> assoc_to_yojson(
    [(
         "ImpersonationRoleId",
         (option_to_yojson impersonation_role_id_to_yojson x.impersonation_role_id));
       
  ])

let create_impersonation_role_request_to_yojson = 
  fun (x: create_impersonation_role_request) -> assoc_to_yojson(
    [(
         "Rules",
         (Some (impersonation_rule_list_to_yojson x.rules)));
       (
         "Description",
         (option_to_yojson impersonation_role_description_to_yojson x.description));
       (
         "Type",
         (Some (impersonation_role_type_to_yojson x.type_)));
       (
         "Name",
         (Some (impersonation_role_name_to_yojson x.name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       (
         "ClientToken",
         (option_to_yojson idempotency_client_token_to_yojson x.client_token));
       
  ])

let create_group_response_to_yojson = 
  fun (x: create_group_response) -> assoc_to_yojson(
    [(
         "GroupId",
         (option_to_yojson work_mail_identifier_to_yojson x.group_id));
       
  ])

let create_group_request_to_yojson = 
  fun (x: create_group_request) -> assoc_to_yojson(
    [(
         "HiddenFromGlobalAddressList",
         (option_to_yojson boolean__to_yojson x.hidden_from_global_address_list));
       (
         "Name",
         (Some (group_name_to_yojson x.name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let create_availability_configuration_response_to_yojson = 
  fun (x: create_availability_configuration_response) -> assoc_to_yojson(
    [
  ])

let create_availability_configuration_request_to_yojson = 
  fun (x: create_availability_configuration_request) -> assoc_to_yojson(
    [(
         "LambdaProvider",
         (option_to_yojson lambda_availability_provider_to_yojson x.lambda_provider));
       (
         "EwsProvider",
         (option_to_yojson ews_availability_provider_to_yojson x.ews_provider));
       (
         "DomainName",
         (Some (domain_name_to_yojson x.domain_name)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       (
         "ClientToken",
         (option_to_yojson idempotency_client_token_to_yojson x.client_token));
       
  ])

let create_alias_response_to_yojson = 
  fun (x: create_alias_response) -> assoc_to_yojson(
    [
  ])

let create_alias_request_to_yojson = 
  fun (x: create_alias_request) -> assoc_to_yojson(
    [(
         "Alias",
         (Some (email_address_to_yojson x.alias)));
       (
         "EntityId",
         (Some (work_mail_identifier_to_yojson x.entity_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let cancel_mailbox_export_job_response_to_yojson = 
  fun (x: cancel_mailbox_export_job_response) -> assoc_to_yojson(
    [
  ])

let cancel_mailbox_export_job_request_to_yojson = 
  fun (x: cancel_mailbox_export_job_request) -> assoc_to_yojson(
    [(
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       (
         "JobId",
         (Some (mailbox_export_job_id_to_yojson x.job_id)));
       (
         "ClientToken",
         (Some (idempotency_client_token_to_yojson x.client_token)));
       
  ])

let impersonation_token_to_yojson = string_to_yojson

let expires_in_to_yojson = long_to_yojson

let assume_impersonation_role_response_to_yojson = 
  fun (x: assume_impersonation_role_response) -> assoc_to_yojson(
    [(
         "ExpiresIn",
         (option_to_yojson expires_in_to_yojson x.expires_in));
       (
         "Token",
         (option_to_yojson impersonation_token_to_yojson x.token));
       
  ])

let assume_impersonation_role_request_to_yojson = 
  fun (x: assume_impersonation_role_request) -> assoc_to_yojson(
    [(
         "ImpersonationRoleId",
         (Some (impersonation_role_id_to_yojson x.impersonation_role_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let associate_member_to_group_response_to_yojson = 
  fun (x: associate_member_to_group_response) -> assoc_to_yojson(
    [
  ])

let associate_member_to_group_request_to_yojson = 
  fun (x: associate_member_to_group_request) -> assoc_to_yojson(
    [(
         "MemberId",
         (Some (entity_identifier_to_yojson x.member_id)));
       (
         "GroupId",
         (Some (entity_identifier_to_yojson x.group_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let associate_delegate_to_resource_response_to_yojson = 
  fun (x: associate_delegate_to_resource_response) -> assoc_to_yojson(
    [
  ])

let associate_delegate_to_resource_request_to_yojson = 
  fun (x: associate_delegate_to_resource_request) -> assoc_to_yojson(
    [(
         "EntityId",
         (Some (entity_identifier_to_yojson x.entity_id)));
       (
         "ResourceId",
         (Some (entity_identifier_to_yojson x.resource_id)));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

