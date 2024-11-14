open Smaws_Lib.Json.DeserializeHelpers

open Types

let string__of_yojson = string_of_yojson

let unsupported_operation_exception_of_yojson = 
  fun tree path : unsupported_operation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_operation_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let organization_state_exception_of_yojson = 
  fun tree path : organization_state_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_state_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let organization_not_found_exception_of_yojson = 
  fun tree path : organization_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_parameter_exception_of_yojson = 
  fun tree path : invalid_parameter_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let entity_state_exception_of_yojson = 
  fun tree path : entity_state_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : entity_state_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let entity_not_found_exception_of_yojson = 
  fun tree path : entity_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : entity_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let directory_unavailable_exception_of_yojson = 
  fun tree path : directory_unavailable_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_unavailable_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let directory_service_authentication_failed_exception_of_yojson = 
  fun tree path : directory_service_authentication_failed_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_service_authentication_failed_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_user_response_of_yojson = 
  fun tree path : update_user_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_user_response = ()
  in _res

let organization_id_of_yojson = string_of_yojson

let entity_identifier_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let user_role_of_yojson = 
  fun (tree: t) path : user_role -> match tree with 
    | `String "REMOTE_USER" -> REMOTE_USER
    | `String "SYSTEM_USER" -> SYSTEM_USER
    | `String "RESOURCE" -> RESOURCE
    | `String "USER" -> USER
    | `String value -> raise (deserialize_unknown_enum_value_error path "UserRole" value)
    | _ -> raise (deserialize_wrong_type_error path "UserRole")

let user_attribute_of_yojson = string_of_yojson

let boolean_object_of_yojson = bool_of_yojson

let update_user_request_of_yojson = 
  fun tree path : update_user_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_user_request = {
    office = option_of_yojson (value_for_key (user_attribute_of_yojson) "Office") _list path;
    country = option_of_yojson (value_for_key (user_attribute_of_yojson) "Country") _list path;
    department = option_of_yojson (value_for_key (user_attribute_of_yojson) "Department") _list path;
    zip_code = option_of_yojson (value_for_key (user_attribute_of_yojson) "ZipCode") _list path;
    company = option_of_yojson (value_for_key (user_attribute_of_yojson) "Company") _list path;
    city = option_of_yojson (value_for_key (user_attribute_of_yojson) "City") _list path;
    job_title = option_of_yojson (value_for_key (user_attribute_of_yojson) "JobTitle") _list path;
    street = option_of_yojson (value_for_key (user_attribute_of_yojson) "Street") _list path;
    telephone = option_of_yojson (value_for_key (user_attribute_of_yojson) "Telephone") _list path;
    initials = option_of_yojson (value_for_key (user_attribute_of_yojson) "Initials") _list path;
    hidden_from_global_address_list = option_of_yojson (value_for_key (boolean_object_of_yojson) "HiddenFromGlobalAddressList") _list path;
    last_name = option_of_yojson (value_for_key (user_attribute_of_yojson) "LastName") _list path;
    first_name = option_of_yojson (value_for_key (user_attribute_of_yojson) "FirstName") _list path;
    display_name = option_of_yojson (value_for_key (user_attribute_of_yojson) "DisplayName") _list path;
    role = option_of_yojson (value_for_key (user_role_of_yojson) "Role") _list path;
    user_id = value_for_key (entity_identifier_of_yojson) "UserId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let name_availability_exception_of_yojson = 
  fun tree path : name_availability_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : name_availability_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let mail_domain_state_exception_of_yojson = 
  fun tree path : mail_domain_state_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : mail_domain_state_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let mail_domain_not_found_exception_of_yojson = 
  fun tree path : mail_domain_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : mail_domain_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_configuration_exception_of_yojson = 
  fun tree path : invalid_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_configuration_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let email_address_in_use_exception_of_yojson = 
  fun tree path : email_address_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : email_address_in_use_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_resource_response_of_yojson = 
  fun tree path : update_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_resource_response = ()
  in _res

let resource_name_of_yojson = string_of_yojson

let boolean__of_yojson = bool_of_yojson

let booking_options_of_yojson = 
  fun tree path : booking_options ->
  let _list = assoc_of_yojson tree path in
  let _res : booking_options = {
    auto_decline_conflicting_requests = option_of_yojson (value_for_key (boolean__of_yojson) "AutoDeclineConflictingRequests") _list path;
    auto_decline_recurring_requests = option_of_yojson (value_for_key (boolean__of_yojson) "AutoDeclineRecurringRequests") _list path;
    auto_accept_requests = option_of_yojson (value_for_key (boolean__of_yojson) "AutoAcceptRequests") _list path;
    
  }
  in _res

let new_resource_description_of_yojson = string_of_yojson

let resource_type_of_yojson = 
  fun (tree: t) path : resource_type -> match tree with 
    | `String "EQUIPMENT" -> EQUIPMENT
    | `String "ROOM" -> ROOM
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")

let update_resource_request_of_yojson = 
  fun tree path : update_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_resource_request = {
    hidden_from_global_address_list = option_of_yojson (value_for_key (boolean_object_of_yojson) "HiddenFromGlobalAddressList") _list path;
    type_ = option_of_yojson (value_for_key (resource_type_of_yojson) "Type") _list path;
    description = option_of_yojson (value_for_key (new_resource_description_of_yojson) "Description") _list path;
    booking_options = option_of_yojson (value_for_key (booking_options_of_yojson) "BookingOptions") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    resource_id = value_for_key (entity_identifier_of_yojson) "ResourceId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let update_primary_email_address_response_of_yojson = 
  fun tree path : update_primary_email_address_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_primary_email_address_response = ()
  in _res

let email_address_of_yojson = string_of_yojson

let update_primary_email_address_request_of_yojson = 
  fun tree path : update_primary_email_address_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_primary_email_address_request = {
    email = value_for_key (email_address_of_yojson) "Email" _list path;
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let update_mobile_device_access_rule_response_of_yojson = 
  fun tree path : update_mobile_device_access_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_mobile_device_access_rule_response = ()
  in _res

let mobile_device_access_rule_id_of_yojson = string_of_yojson

let mobile_device_access_rule_name_of_yojson = string_of_yojson

let mobile_device_access_rule_description_of_yojson = string_of_yojson

let mobile_device_access_rule_effect_of_yojson = 
  fun (tree: t) path : mobile_device_access_rule_effect -> match tree with 
    | `String "DENY" -> DENY
    | `String "ALLOW" -> ALLOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "MobileDeviceAccessRuleEffect" value)
    | _ -> raise (deserialize_wrong_type_error path "MobileDeviceAccessRuleEffect")

let device_type_of_yojson = string_of_yojson

let device_type_list_of_yojson = 
  fun tree path -> list_of_yojson device_type_of_yojson tree path 

let device_model_of_yojson = string_of_yojson

let device_model_list_of_yojson = 
  fun tree path -> list_of_yojson device_model_of_yojson tree path 

let device_operating_system_of_yojson = string_of_yojson

let device_operating_system_list_of_yojson = 
  fun tree path -> list_of_yojson device_operating_system_of_yojson tree path 

let device_user_agent_of_yojson = string_of_yojson

let device_user_agent_list_of_yojson = 
  fun tree path -> list_of_yojson device_user_agent_of_yojson tree path 

let update_mobile_device_access_rule_request_of_yojson = 
  fun tree path : update_mobile_device_access_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_mobile_device_access_rule_request = {
    not_device_user_agents = option_of_yojson (value_for_key (device_user_agent_list_of_yojson) "NotDeviceUserAgents") _list path;
    device_user_agents = option_of_yojson (value_for_key (device_user_agent_list_of_yojson) "DeviceUserAgents") _list path;
    not_device_operating_systems = option_of_yojson (value_for_key (device_operating_system_list_of_yojson) "NotDeviceOperatingSystems") _list path;
    device_operating_systems = option_of_yojson (value_for_key (device_operating_system_list_of_yojson) "DeviceOperatingSystems") _list path;
    not_device_models = option_of_yojson (value_for_key (device_model_list_of_yojson) "NotDeviceModels") _list path;
    device_models = option_of_yojson (value_for_key (device_model_list_of_yojson) "DeviceModels") _list path;
    not_device_types = option_of_yojson (value_for_key (device_type_list_of_yojson) "NotDeviceTypes") _list path;
    device_types = option_of_yojson (value_for_key (device_type_list_of_yojson) "DeviceTypes") _list path;
    effect = value_for_key (mobile_device_access_rule_effect_of_yojson) "Effect" _list path;
    description = option_of_yojson (value_for_key (mobile_device_access_rule_description_of_yojson) "Description") _list path;
    name = value_for_key (mobile_device_access_rule_name_of_yojson) "Name" _list path;
    mobile_device_access_rule_id = value_for_key (mobile_device_access_rule_id_of_yojson) "MobileDeviceAccessRuleId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let update_mailbox_quota_response_of_yojson = 
  fun tree path : update_mailbox_quota_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_mailbox_quota_response = ()
  in _res

let mailbox_quota_of_yojson = int_of_yojson

let update_mailbox_quota_request_of_yojson = 
  fun tree path : update_mailbox_quota_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_mailbox_quota_request = {
    mailbox_quota = value_for_key (mailbox_quota_of_yojson) "MailboxQuota" _list path;
    user_id = value_for_key (entity_identifier_of_yojson) "UserId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let limit_exceeded_exception_of_yojson = 
  fun tree path : limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_impersonation_role_response_of_yojson = 
  fun tree path : update_impersonation_role_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_impersonation_role_response = ()
  in _res

let impersonation_role_id_of_yojson = string_of_yojson

let impersonation_role_name_of_yojson = string_of_yojson

let impersonation_role_type_of_yojson = 
  fun (tree: t) path : impersonation_role_type -> match tree with 
    | `String "READ_ONLY" -> READ_ONLY
    | `String "FULL_ACCESS" -> FULL_ACCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImpersonationRoleType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImpersonationRoleType")

let impersonation_role_description_of_yojson = string_of_yojson

let impersonation_rule_id_of_yojson = string_of_yojson

let impersonation_rule_name_of_yojson = string_of_yojson

let impersonation_rule_description_of_yojson = string_of_yojson

let access_effect_of_yojson = 
  fun (tree: t) path : access_effect -> match tree with 
    | `String "DENY" -> DENY
    | `String "ALLOW" -> ALLOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessEffect" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessEffect")

let target_users_of_yojson = 
  fun tree path -> list_of_yojson entity_identifier_of_yojson tree path 

let impersonation_rule_of_yojson = 
  fun tree path : impersonation_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : impersonation_rule = {
    not_target_users = option_of_yojson (value_for_key (target_users_of_yojson) "NotTargetUsers") _list path;
    target_users = option_of_yojson (value_for_key (target_users_of_yojson) "TargetUsers") _list path;
    effect = value_for_key (access_effect_of_yojson) "Effect" _list path;
    description = option_of_yojson (value_for_key (impersonation_rule_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (impersonation_rule_name_of_yojson) "Name") _list path;
    impersonation_rule_id = value_for_key (impersonation_rule_id_of_yojson) "ImpersonationRuleId" _list path;
    
  }
  in _res

let impersonation_rule_list_of_yojson = 
  fun tree path -> list_of_yojson impersonation_rule_of_yojson tree path 

let update_impersonation_role_request_of_yojson = 
  fun tree path : update_impersonation_role_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_impersonation_role_request = {
    rules = value_for_key (impersonation_rule_list_of_yojson) "Rules" _list path;
    description = option_of_yojson (value_for_key (impersonation_role_description_of_yojson) "Description") _list path;
    type_ = value_for_key (impersonation_role_type_of_yojson) "Type" _list path;
    name = value_for_key (impersonation_role_name_of_yojson) "Name" _list path;
    impersonation_role_id = value_for_key (impersonation_role_id_of_yojson) "ImpersonationRoleId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let update_group_response_of_yojson = 
  fun tree path : update_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_group_response = ()
  in _res

let update_group_request_of_yojson = 
  fun tree path : update_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_group_request = {
    hidden_from_global_address_list = option_of_yojson (value_for_key (boolean_object_of_yojson) "HiddenFromGlobalAddressList") _list path;
    group_id = value_for_key (entity_identifier_of_yojson) "GroupId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let update_default_mail_domain_response_of_yojson = 
  fun tree path : update_default_mail_domain_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_default_mail_domain_response = ()
  in _res

let work_mail_domain_name_of_yojson = string_of_yojson

let update_default_mail_domain_request_of_yojson = 
  fun tree path : update_default_mail_domain_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_default_mail_domain_request = {
    domain_name = value_for_key (work_mail_domain_name_of_yojson) "DomainName" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let update_availability_configuration_response_of_yojson = 
  fun tree path : update_availability_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_availability_configuration_response = ()
  in _res

let domain_name_of_yojson = string_of_yojson

let url_of_yojson = string_of_yojson

let external_user_name_of_yojson = string_of_yojson

let password_of_yojson = string_of_yojson

let ews_availability_provider_of_yojson = 
  fun tree path : ews_availability_provider ->
  let _list = assoc_of_yojson tree path in
  let _res : ews_availability_provider = {
    ews_password = value_for_key (password_of_yojson) "EwsPassword" _list path;
    ews_username = value_for_key (external_user_name_of_yojson) "EwsUsername" _list path;
    ews_endpoint = value_for_key (url_of_yojson) "EwsEndpoint" _list path;
    
  }
  in _res

let lambda_arn_of_yojson = string_of_yojson

let lambda_availability_provider_of_yojson = 
  fun tree path : lambda_availability_provider ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_availability_provider = {
    lambda_arn = value_for_key (lambda_arn_of_yojson) "LambdaArn" _list path;
    
  }
  in _res

let update_availability_configuration_request_of_yojson = 
  fun tree path : update_availability_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_availability_configuration_request = {
    lambda_provider = option_of_yojson (value_for_key (lambda_availability_provider_of_yojson) "LambdaProvider") _list path;
    ews_provider = option_of_yojson (value_for_key (ews_availability_provider_of_yojson) "EwsProvider") _list path;
    domain_name = value_for_key (domain_name_of_yojson) "DomainName" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let untag_resource_response_of_yojson = 
  fun tree path : untag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_response = ()
  in _res

let amazon_resource_name_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "TagKeys" _list path;
    resource_ar_n = value_for_key (amazon_resource_name_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let test_availability_configuration_response_of_yojson = 
  fun tree path : test_availability_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : test_availability_configuration_response = {
    failure_reason = option_of_yojson (value_for_key (string__of_yojson) "FailureReason") _list path;
    test_passed = option_of_yojson (value_for_key (boolean__of_yojson) "TestPassed") _list path;
    
  }
  in _res

let test_availability_configuration_request_of_yojson = 
  fun tree path : test_availability_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : test_availability_configuration_request = {
    lambda_provider = option_of_yojson (value_for_key (lambda_availability_provider_of_yojson) "LambdaProvider") _list path;
    ews_provider = option_of_yojson (value_for_key (ews_availability_provider_of_yojson) "EwsProvider") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "DomainName") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let too_many_tags_exception_of_yojson = 
  fun tree path : too_many_tags_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : too_many_tags_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let tag_resource_response_of_yojson = 
  fun tree path : tag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_response = ()
  in _res

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = value_for_key (tag_value_of_yojson) "Value" _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    resource_ar_n = value_for_key (amazon_resource_name_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let mailbox_export_job_id_of_yojson = string_of_yojson

let start_mailbox_export_job_response_of_yojson = 
  fun tree path : start_mailbox_export_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_mailbox_export_job_response = {
    job_id = option_of_yojson (value_for_key (mailbox_export_job_id_of_yojson) "JobId") _list path;
    
  }
  in _res

let idempotency_client_token_of_yojson = string_of_yojson

let description_of_yojson = string_of_yojson

let role_arn_of_yojson = string_of_yojson

let kms_key_arn_of_yojson = string_of_yojson

let s3_bucket_name_of_yojson = string_of_yojson

let s3_object_key_of_yojson = string_of_yojson

let start_mailbox_export_job_request_of_yojson = 
  fun tree path : start_mailbox_export_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_mailbox_export_job_request = {
    s3_prefix = value_for_key (s3_object_key_of_yojson) "S3Prefix" _list path;
    s3_bucket_name = value_for_key (s3_bucket_name_of_yojson) "S3BucketName" _list path;
    kms_key_arn = value_for_key (kms_key_arn_of_yojson) "KmsKeyArn" _list path;
    role_arn = value_for_key (role_arn_of_yojson) "RoleArn" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    client_token = value_for_key (idempotency_client_token_of_yojson) "ClientToken" _list path;
    
  }
  in _res

let invalid_password_exception_of_yojson = 
  fun tree path : invalid_password_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_password_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let reset_password_response_of_yojson = 
  fun tree path : reset_password_response ->
  let _list = assoc_of_yojson tree path in
  let _res : reset_password_response = ()
  in _res

let work_mail_identifier_of_yojson = string_of_yojson

let reset_password_request_of_yojson = 
  fun tree path : reset_password_request ->
  let _list = assoc_of_yojson tree path in
  let _res : reset_password_request = {
    password = value_for_key (password_of_yojson) "Password" _list path;
    user_id = value_for_key (work_mail_identifier_of_yojson) "UserId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let entity_already_registered_exception_of_yojson = 
  fun tree path : entity_already_registered_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : entity_already_registered_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let register_to_work_mail_response_of_yojson = 
  fun tree path : register_to_work_mail_response ->
  let _list = assoc_of_yojson tree path in
  let _res : register_to_work_mail_response = ()
  in _res

let register_to_work_mail_request_of_yojson = 
  fun tree path : register_to_work_mail_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_to_work_mail_request = {
    email = value_for_key (email_address_of_yojson) "Email" _list path;
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let mail_domain_in_use_exception_of_yojson = 
  fun tree path : mail_domain_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : mail_domain_in_use_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let register_mail_domain_response_of_yojson = 
  fun tree path : register_mail_domain_response ->
  let _list = assoc_of_yojson tree path in
  let _res : register_mail_domain_response = ()
  in _res

let register_mail_domain_request_of_yojson = 
  fun tree path : register_mail_domain_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_mail_domain_request = {
    domain_name = value_for_key (work_mail_domain_name_of_yojson) "DomainName" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    client_token = option_of_yojson (value_for_key (idempotency_client_token_of_yojson) "ClientToken") _list path;
    
  }
  in _res

let put_retention_policy_response_of_yojson = 
  fun tree path : put_retention_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_retention_policy_response = ()
  in _res

let short_string_of_yojson = string_of_yojson

let policy_description_of_yojson = string_of_yojson

let folder_name_of_yojson = 
  fun (tree: t) path : folder_name -> match tree with 
    | `String "JUNK_EMAIL" -> JUNK_EMAIL
    | `String "DRAFTS" -> DRAFTS
    | `String "SENT_ITEMS" -> SENT_ITEMS
    | `String "DELETED_ITEMS" -> DELETED_ITEMS
    | `String "INBOX" -> INBOX
    | `String value -> raise (deserialize_unknown_enum_value_error path "FolderName" value)
    | _ -> raise (deserialize_wrong_type_error path "FolderName")

let retention_action_of_yojson = 
  fun (tree: t) path : retention_action -> match tree with 
    | `String "PERMANENTLY_DELETE" -> PERMANENTLY_DELETE
    | `String "DELETE" -> DELETE
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RetentionAction" value)
    | _ -> raise (deserialize_wrong_type_error path "RetentionAction")

let retention_period_of_yojson = int_of_yojson

let folder_configuration_of_yojson = 
  fun tree path : folder_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : folder_configuration = {
    period = option_of_yojson (value_for_key (retention_period_of_yojson) "Period") _list path;
    action = value_for_key (retention_action_of_yojson) "Action" _list path;
    name = value_for_key (folder_name_of_yojson) "Name" _list path;
    
  }
  in _res

let folder_configurations_of_yojson = 
  fun tree path -> list_of_yojson folder_configuration_of_yojson tree path 

let put_retention_policy_request_of_yojson = 
  fun tree path : put_retention_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_retention_policy_request = {
    folder_configurations = value_for_key (folder_configurations_of_yojson) "FolderConfigurations" _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "Description") _list path;
    name = value_for_key (short_string_of_yojson) "Name" _list path;
    id = option_of_yojson (value_for_key (short_string_of_yojson) "Id") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let put_mobile_device_access_override_response_of_yojson = 
  fun tree path : put_mobile_device_access_override_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_mobile_device_access_override_response = ()
  in _res

let device_id_of_yojson = string_of_yojson

let put_mobile_device_access_override_request_of_yojson = 
  fun tree path : put_mobile_device_access_override_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_mobile_device_access_override_request = {
    description = option_of_yojson (value_for_key (mobile_device_access_rule_description_of_yojson) "Description") _list path;
    effect = value_for_key (mobile_device_access_rule_effect_of_yojson) "Effect" _list path;
    device_id = value_for_key (device_id_of_yojson) "DeviceId" _list path;
    user_id = value_for_key (entity_identifier_of_yojson) "UserId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let put_mailbox_permissions_response_of_yojson = 
  fun tree path : put_mailbox_permissions_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_mailbox_permissions_response = ()
  in _res

let permission_type_of_yojson = 
  fun (tree: t) path : permission_type -> match tree with 
    | `String "SEND_ON_BEHALF" -> SEND_ON_BEHALF
    | `String "SEND_AS" -> SEND_AS
    | `String "FULL_ACCESS" -> FULL_ACCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "PermissionType" value)
    | _ -> raise (deserialize_wrong_type_error path "PermissionType")

let permission_values_of_yojson = 
  fun tree path -> list_of_yojson permission_type_of_yojson tree path 

let put_mailbox_permissions_request_of_yojson = 
  fun tree path : put_mailbox_permissions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_mailbox_permissions_request = {
    permission_values = value_for_key (permission_values_of_yojson) "PermissionValues" _list path;
    grantee_id = value_for_key (entity_identifier_of_yojson) "GranteeId" _list path;
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let put_inbound_dmarc_settings_response_of_yojson = 
  fun tree path : put_inbound_dmarc_settings_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_inbound_dmarc_settings_response = ()
  in _res

let put_inbound_dmarc_settings_request_of_yojson = 
  fun tree path : put_inbound_dmarc_settings_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_inbound_dmarc_settings_request = {
    enforced = value_for_key (boolean_object_of_yojson) "Enforced" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let put_email_monitoring_configuration_response_of_yojson = 
  fun tree path : put_email_monitoring_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_email_monitoring_configuration_response = ()
  in _res

let log_group_arn_of_yojson = string_of_yojson

let put_email_monitoring_configuration_request_of_yojson = 
  fun tree path : put_email_monitoring_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_email_monitoring_configuration_request = {
    log_group_arn = value_for_key (log_group_arn_of_yojson) "LogGroupArn" _list path;
    role_arn = value_for_key (role_arn_of_yojson) "RoleArn" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let put_access_control_rule_response_of_yojson = 
  fun tree path : put_access_control_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_access_control_rule_response = ()
  in _res

let access_control_rule_name_of_yojson = string_of_yojson

let access_control_rule_effect_of_yojson = 
  fun (tree: t) path : access_control_rule_effect -> match tree with 
    | `String "DENY" -> DENY
    | `String "ALLOW" -> ALLOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessControlRuleEffect" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessControlRuleEffect")

let access_control_rule_description_of_yojson = string_of_yojson

let ip_range_of_yojson = string_of_yojson

let ip_range_list_of_yojson = 
  fun tree path -> list_of_yojson ip_range_of_yojson tree path 

let access_control_rule_action_of_yojson = string_of_yojson

let actions_list_of_yojson = 
  fun tree path -> list_of_yojson access_control_rule_action_of_yojson tree path 

let user_id_list_of_yojson = 
  fun tree path -> list_of_yojson work_mail_identifier_of_yojson tree path 

let impersonation_role_id_list_of_yojson = 
  fun tree path -> list_of_yojson impersonation_role_id_of_yojson tree path 

let put_access_control_rule_request_of_yojson = 
  fun tree path : put_access_control_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_access_control_rule_request = {
    not_impersonation_role_ids = option_of_yojson (value_for_key (impersonation_role_id_list_of_yojson) "NotImpersonationRoleIds") _list path;
    impersonation_role_ids = option_of_yojson (value_for_key (impersonation_role_id_list_of_yojson) "ImpersonationRoleIds") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    not_user_ids = option_of_yojson (value_for_key (user_id_list_of_yojson) "NotUserIds") _list path;
    user_ids = option_of_yojson (value_for_key (user_id_list_of_yojson) "UserIds") _list path;
    not_actions = option_of_yojson (value_for_key (actions_list_of_yojson) "NotActions") _list path;
    actions = option_of_yojson (value_for_key (actions_list_of_yojson) "Actions") _list path;
    not_ip_ranges = option_of_yojson (value_for_key (ip_range_list_of_yojson) "NotIpRanges") _list path;
    ip_ranges = option_of_yojson (value_for_key (ip_range_list_of_yojson) "IpRanges") _list path;
    description = value_for_key (access_control_rule_description_of_yojson) "Description" _list path;
    effect = value_for_key (access_control_rule_effect_of_yojson) "Effect" _list path;
    name = value_for_key (access_control_rule_name_of_yojson) "Name" _list path;
    
  }
  in _res

let user_name_of_yojson = string_of_yojson

let entity_state_of_yojson = 
  fun (tree: t) path : entity_state -> match tree with 
    | `String "DELETED" -> DELETED
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityState" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityState")

let timestamp__of_yojson = timestamp_of_yojson

let user_of_yojson = 
  fun tree path : user ->
  let _list = assoc_of_yojson tree path in
  let _res : user = {
    disabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "DisabledDate") _list path;
    enabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "EnabledDate") _list path;
    user_role = option_of_yojson (value_for_key (user_role_of_yojson) "UserRole") _list path;
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    display_name = option_of_yojson (value_for_key (string__of_yojson) "DisplayName") _list path;
    name = option_of_yojson (value_for_key (user_name_of_yojson) "Name") _list path;
    email = option_of_yojson (value_for_key (email_address_of_yojson) "Email") _list path;
    id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "Id") _list path;
    
  }
  in _res

let users_of_yojson = 
  fun tree path -> list_of_yojson user_of_yojson tree path 

let next_token_of_yojson = string_of_yojson

let list_users_response_of_yojson = 
  fun tree path : list_users_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_users_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    users = option_of_yojson (value_for_key (users_of_yojson) "Users") _list path;
    
  }
  in _res

let max_results_of_yojson = int_of_yojson

let list_users_filters_of_yojson = 
  fun tree path : list_users_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : list_users_filters = {
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    primary_email_prefix = option_of_yojson (value_for_key (string__of_yojson) "PrimaryEmailPrefix") _list path;
    display_name_prefix = option_of_yojson (value_for_key (user_attribute_of_yojson) "DisplayNamePrefix") _list path;
    username_prefix = option_of_yojson (value_for_key (string__of_yojson) "UsernamePrefix") _list path;
    
  }
  in _res

let list_users_request_of_yojson = 
  fun tree path : list_users_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_users_request = {
    filters = option_of_yojson (value_for_key (list_users_filters_of_yojson) "Filters") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let list_tags_for_resource_response_of_yojson = 
  fun tree path : list_tags_for_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_response = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    resource_ar_n = value_for_key (amazon_resource_name_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let resource_description_of_yojson = string_of_yojson

let resource_of_yojson = 
  fun tree path : resource ->
  let _list = assoc_of_yojson tree path in
  let _res : resource = {
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    disabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "DisabledDate") _list path;
    enabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "EnabledDate") _list path;
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    type_ = option_of_yojson (value_for_key (resource_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    email = option_of_yojson (value_for_key (email_address_of_yojson) "Email") _list path;
    id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "Id") _list path;
    
  }
  in _res

let resources_of_yojson = 
  fun tree path -> list_of_yojson resource_of_yojson tree path 

let list_resources_response_of_yojson = 
  fun tree path : list_resources_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resources_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    resources = option_of_yojson (value_for_key (resources_of_yojson) "Resources") _list path;
    
  }
  in _res

let list_resources_filters_of_yojson = 
  fun tree path : list_resources_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resources_filters = {
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    primary_email_prefix = option_of_yojson (value_for_key (string__of_yojson) "PrimaryEmailPrefix") _list path;
    name_prefix = option_of_yojson (value_for_key (string__of_yojson) "NamePrefix") _list path;
    
  }
  in _res

let list_resources_request_of_yojson = 
  fun tree path : list_resources_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resources_request = {
    filters = option_of_yojson (value_for_key (list_resources_filters_of_yojson) "Filters") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let member_type_of_yojson = 
  fun (tree: t) path : member_type -> match tree with 
    | `String "USER" -> USER
    | `String "GROUP" -> GROUP
    | `String value -> raise (deserialize_unknown_enum_value_error path "MemberType" value)
    | _ -> raise (deserialize_wrong_type_error path "MemberType")

let delegate_of_yojson = 
  fun tree path : delegate ->
  let _list = assoc_of_yojson tree path in
  let _res : delegate = {
    type_ = value_for_key (member_type_of_yojson) "Type" _list path;
    id = value_for_key (string__of_yojson) "Id" _list path;
    
  }
  in _res

let resource_delegates_of_yojson = 
  fun tree path -> list_of_yojson delegate_of_yojson tree path 

let list_resource_delegates_response_of_yojson = 
  fun tree path : list_resource_delegates_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_delegates_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    delegates = option_of_yojson (value_for_key (resource_delegates_of_yojson) "Delegates") _list path;
    
  }
  in _res

let list_resource_delegates_request_of_yojson = 
  fun tree path : list_resource_delegates_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_delegates_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    resource_id = value_for_key (entity_identifier_of_yojson) "ResourceId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let organization_name_of_yojson = string_of_yojson

let organization_summary_of_yojson = 
  fun tree path : organization_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_summary = {
    state = option_of_yojson (value_for_key (string__of_yojson) "State") _list path;
    error_message = option_of_yojson (value_for_key (string__of_yojson) "ErrorMessage") _list path;
    default_mail_domain = option_of_yojson (value_for_key (domain_name_of_yojson) "DefaultMailDomain") _list path;
    alias = option_of_yojson (value_for_key (organization_name_of_yojson) "Alias") _list path;
    organization_id = option_of_yojson (value_for_key (organization_id_of_yojson) "OrganizationId") _list path;
    
  }
  in _res

let organization_summaries_of_yojson = 
  fun tree path -> list_of_yojson organization_summary_of_yojson tree path 

let list_organizations_response_of_yojson = 
  fun tree path : list_organizations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_organizations_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    organization_summaries = option_of_yojson (value_for_key (organization_summaries_of_yojson) "OrganizationSummaries") _list path;
    
  }
  in _res

let list_organizations_request_of_yojson = 
  fun tree path : list_organizations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_organizations_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let mobile_device_access_rule_of_yojson = 
  fun tree path : mobile_device_access_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : mobile_device_access_rule = {
    date_modified = option_of_yojson (value_for_key (timestamp__of_yojson) "DateModified") _list path;
    date_created = option_of_yojson (value_for_key (timestamp__of_yojson) "DateCreated") _list path;
    not_device_user_agents = option_of_yojson (value_for_key (device_user_agent_list_of_yojson) "NotDeviceUserAgents") _list path;
    device_user_agents = option_of_yojson (value_for_key (device_user_agent_list_of_yojson) "DeviceUserAgents") _list path;
    not_device_operating_systems = option_of_yojson (value_for_key (device_operating_system_list_of_yojson) "NotDeviceOperatingSystems") _list path;
    device_operating_systems = option_of_yojson (value_for_key (device_operating_system_list_of_yojson) "DeviceOperatingSystems") _list path;
    not_device_models = option_of_yojson (value_for_key (device_model_list_of_yojson) "NotDeviceModels") _list path;
    device_models = option_of_yojson (value_for_key (device_model_list_of_yojson) "DeviceModels") _list path;
    not_device_types = option_of_yojson (value_for_key (device_type_list_of_yojson) "NotDeviceTypes") _list path;
    device_types = option_of_yojson (value_for_key (device_type_list_of_yojson) "DeviceTypes") _list path;
    effect = option_of_yojson (value_for_key (mobile_device_access_rule_effect_of_yojson) "Effect") _list path;
    description = option_of_yojson (value_for_key (mobile_device_access_rule_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (mobile_device_access_rule_name_of_yojson) "Name") _list path;
    mobile_device_access_rule_id = option_of_yojson (value_for_key (mobile_device_access_rule_id_of_yojson) "MobileDeviceAccessRuleId") _list path;
    
  }
  in _res

let mobile_device_access_rules_list_of_yojson = 
  fun tree path -> list_of_yojson mobile_device_access_rule_of_yojson tree path 

let list_mobile_device_access_rules_response_of_yojson = 
  fun tree path : list_mobile_device_access_rules_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mobile_device_access_rules_response = {
    rules = option_of_yojson (value_for_key (mobile_device_access_rules_list_of_yojson) "Rules") _list path;
    
  }
  in _res

let list_mobile_device_access_rules_request_of_yojson = 
  fun tree path : list_mobile_device_access_rules_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mobile_device_access_rules_request = {
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let mobile_device_access_override_of_yojson = 
  fun tree path : mobile_device_access_override ->
  let _list = assoc_of_yojson tree path in
  let _res : mobile_device_access_override = {
    date_modified = option_of_yojson (value_for_key (timestamp__of_yojson) "DateModified") _list path;
    date_created = option_of_yojson (value_for_key (timestamp__of_yojson) "DateCreated") _list path;
    description = option_of_yojson (value_for_key (mobile_device_access_rule_description_of_yojson) "Description") _list path;
    effect = option_of_yojson (value_for_key (mobile_device_access_rule_effect_of_yojson) "Effect") _list path;
    device_id = option_of_yojson (value_for_key (device_id_of_yojson) "DeviceId") _list path;
    user_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "UserId") _list path;
    
  }
  in _res

let mobile_device_access_overrides_list_of_yojson = 
  fun tree path -> list_of_yojson mobile_device_access_override_of_yojson tree path 

let list_mobile_device_access_overrides_response_of_yojson = 
  fun tree path : list_mobile_device_access_overrides_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mobile_device_access_overrides_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    overrides = option_of_yojson (value_for_key (mobile_device_access_overrides_list_of_yojson) "Overrides") _list path;
    
  }
  in _res

let list_mobile_device_access_overrides_request_of_yojson = 
  fun tree path : list_mobile_device_access_overrides_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mobile_device_access_overrides_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    device_id = option_of_yojson (value_for_key (device_id_of_yojson) "DeviceId") _list path;
    user_id = option_of_yojson (value_for_key (entity_identifier_of_yojson) "UserId") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let mail_domain_summary_of_yojson = 
  fun tree path : mail_domain_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : mail_domain_summary = {
    default_domain = option_of_yojson (value_for_key (boolean__of_yojson) "DefaultDomain") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "DomainName") _list path;
    
  }
  in _res

let mail_domains_of_yojson = 
  fun tree path -> list_of_yojson mail_domain_summary_of_yojson tree path 

let list_mail_domains_response_of_yojson = 
  fun tree path : list_mail_domains_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mail_domains_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    mail_domains = option_of_yojson (value_for_key (mail_domains_of_yojson) "MailDomains") _list path;
    
  }
  in _res

let list_mail_domains_request_of_yojson = 
  fun tree path : list_mail_domains_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mail_domains_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let permission_of_yojson = 
  fun tree path : permission ->
  let _list = assoc_of_yojson tree path in
  let _res : permission = {
    permission_values = value_for_key (permission_values_of_yojson) "PermissionValues" _list path;
    grantee_type = value_for_key (member_type_of_yojson) "GranteeType" _list path;
    grantee_id = value_for_key (work_mail_identifier_of_yojson) "GranteeId" _list path;
    
  }
  in _res

let permissions_of_yojson = 
  fun tree path -> list_of_yojson permission_of_yojson tree path 

let list_mailbox_permissions_response_of_yojson = 
  fun tree path : list_mailbox_permissions_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mailbox_permissions_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    permissions = option_of_yojson (value_for_key (permissions_of_yojson) "Permissions") _list path;
    
  }
  in _res

let list_mailbox_permissions_request_of_yojson = 
  fun tree path : list_mailbox_permissions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mailbox_permissions_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let percentage_of_yojson = int_of_yojson

let mailbox_export_job_state_of_yojson = 
  fun (tree: t) path : mailbox_export_job_state -> match tree with 
    | `String "CANCELLED" -> CANCELLED
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "RUNNING" -> RUNNING
    | `String value -> raise (deserialize_unknown_enum_value_error path "MailboxExportJobState" value)
    | _ -> raise (deserialize_wrong_type_error path "MailboxExportJobState")

let mailbox_export_job_of_yojson = 
  fun tree path : mailbox_export_job ->
  let _list = assoc_of_yojson tree path in
  let _res : mailbox_export_job = {
    end_time = option_of_yojson (value_for_key (timestamp__of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (timestamp__of_yojson) "StartTime") _list path;
    state = option_of_yojson (value_for_key (mailbox_export_job_state_of_yojson) "State") _list path;
    estimated_progress = option_of_yojson (value_for_key (percentage_of_yojson) "EstimatedProgress") _list path;
    s3_path = option_of_yojson (value_for_key (s3_object_key_of_yojson) "S3Path") _list path;
    s3_bucket_name = option_of_yojson (value_for_key (s3_bucket_name_of_yojson) "S3BucketName") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    entity_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "EntityId") _list path;
    job_id = option_of_yojson (value_for_key (mailbox_export_job_id_of_yojson) "JobId") _list path;
    
  }
  in _res

let jobs_of_yojson = 
  fun tree path -> list_of_yojson mailbox_export_job_of_yojson tree path 

let list_mailbox_export_jobs_response_of_yojson = 
  fun tree path : list_mailbox_export_jobs_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mailbox_export_jobs_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    jobs = option_of_yojson (value_for_key (jobs_of_yojson) "Jobs") _list path;
    
  }
  in _res

let list_mailbox_export_jobs_request_of_yojson = 
  fun tree path : list_mailbox_export_jobs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_mailbox_export_jobs_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let impersonation_role_of_yojson = 
  fun tree path : impersonation_role ->
  let _list = assoc_of_yojson tree path in
  let _res : impersonation_role = {
    date_modified = option_of_yojson (value_for_key (timestamp__of_yojson) "DateModified") _list path;
    date_created = option_of_yojson (value_for_key (timestamp__of_yojson) "DateCreated") _list path;
    type_ = option_of_yojson (value_for_key (impersonation_role_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (impersonation_role_name_of_yojson) "Name") _list path;
    impersonation_role_id = option_of_yojson (value_for_key (impersonation_role_id_of_yojson) "ImpersonationRoleId") _list path;
    
  }
  in _res

let impersonation_role_list_of_yojson = 
  fun tree path -> list_of_yojson impersonation_role_of_yojson tree path 

let list_impersonation_roles_response_of_yojson = 
  fun tree path : list_impersonation_roles_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_impersonation_roles_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    roles = option_of_yojson (value_for_key (impersonation_role_list_of_yojson) "Roles") _list path;
    
  }
  in _res

let list_impersonation_roles_request_of_yojson = 
  fun tree path : list_impersonation_roles_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_impersonation_roles_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let group_name_of_yojson = string_of_yojson

let group_identifier_of_yojson = 
  fun tree path : group_identifier ->
  let _list = assoc_of_yojson tree path in
  let _res : group_identifier = {
    group_name = option_of_yojson (value_for_key (group_name_of_yojson) "GroupName") _list path;
    group_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "GroupId") _list path;
    
  }
  in _res

let group_identifiers_of_yojson = 
  fun tree path -> list_of_yojson group_identifier_of_yojson tree path 

let list_groups_for_entity_response_of_yojson = 
  fun tree path : list_groups_for_entity_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_groups_for_entity_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    groups = option_of_yojson (value_for_key (group_identifiers_of_yojson) "Groups") _list path;
    
  }
  in _res

let list_groups_for_entity_filters_of_yojson = 
  fun tree path : list_groups_for_entity_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : list_groups_for_entity_filters = {
    group_name_prefix = option_of_yojson (value_for_key (string__of_yojson) "GroupNamePrefix") _list path;
    
  }
  in _res

let list_groups_for_entity_request_of_yojson = 
  fun tree path : list_groups_for_entity_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_groups_for_entity_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    filters = option_of_yojson (value_for_key (list_groups_for_entity_filters_of_yojson) "Filters") _list path;
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let group_of_yojson = 
  fun tree path : group ->
  let _list = assoc_of_yojson tree path in
  let _res : group = {
    disabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "DisabledDate") _list path;
    enabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "EnabledDate") _list path;
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    name = option_of_yojson (value_for_key (group_name_of_yojson) "Name") _list path;
    email = option_of_yojson (value_for_key (email_address_of_yojson) "Email") _list path;
    id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "Id") _list path;
    
  }
  in _res

let groups_of_yojson = 
  fun tree path -> list_of_yojson group_of_yojson tree path 

let list_groups_response_of_yojson = 
  fun tree path : list_groups_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_groups_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    groups = option_of_yojson (value_for_key (groups_of_yojson) "Groups") _list path;
    
  }
  in _res

let list_groups_filters_of_yojson = 
  fun tree path : list_groups_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : list_groups_filters = {
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    primary_email_prefix = option_of_yojson (value_for_key (string__of_yojson) "PrimaryEmailPrefix") _list path;
    name_prefix = option_of_yojson (value_for_key (string__of_yojson) "NamePrefix") _list path;
    
  }
  in _res

let list_groups_request_of_yojson = 
  fun tree path : list_groups_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_groups_request = {
    filters = option_of_yojson (value_for_key (list_groups_filters_of_yojson) "Filters") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let member_of_yojson = 
  fun tree path : member ->
  let _list = assoc_of_yojson tree path in
  let _res : member = {
    disabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "DisabledDate") _list path;
    enabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "EnabledDate") _list path;
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    type_ = option_of_yojson (value_for_key (member_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    id = option_of_yojson (value_for_key (string__of_yojson) "Id") _list path;
    
  }
  in _res

let members_of_yojson = 
  fun tree path -> list_of_yojson member_of_yojson tree path 

let list_group_members_response_of_yojson = 
  fun tree path : list_group_members_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_group_members_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    members = option_of_yojson (value_for_key (members_of_yojson) "Members") _list path;
    
  }
  in _res

let list_group_members_request_of_yojson = 
  fun tree path : list_group_members_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_group_members_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    group_id = value_for_key (entity_identifier_of_yojson) "GroupId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let availability_provider_type_of_yojson = 
  fun (tree: t) path : availability_provider_type -> match tree with 
    | `String "LAMBDA" -> LAMBDA
    | `String "EWS" -> EWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "AvailabilityProviderType" value)
    | _ -> raise (deserialize_wrong_type_error path "AvailabilityProviderType")

let redacted_ews_availability_provider_of_yojson = 
  fun tree path : redacted_ews_availability_provider ->
  let _list = assoc_of_yojson tree path in
  let _res : redacted_ews_availability_provider = {
    ews_username = option_of_yojson (value_for_key (external_user_name_of_yojson) "EwsUsername") _list path;
    ews_endpoint = option_of_yojson (value_for_key (url_of_yojson) "EwsEndpoint") _list path;
    
  }
  in _res

let availability_configuration_of_yojson = 
  fun tree path : availability_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : availability_configuration = {
    date_modified = option_of_yojson (value_for_key (timestamp__of_yojson) "DateModified") _list path;
    date_created = option_of_yojson (value_for_key (timestamp__of_yojson) "DateCreated") _list path;
    lambda_provider = option_of_yojson (value_for_key (lambda_availability_provider_of_yojson) "LambdaProvider") _list path;
    ews_provider = option_of_yojson (value_for_key (redacted_ews_availability_provider_of_yojson) "EwsProvider") _list path;
    provider_type = option_of_yojson (value_for_key (availability_provider_type_of_yojson) "ProviderType") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "DomainName") _list path;
    
  }
  in _res

let availability_configuration_list_of_yojson = 
  fun tree path -> list_of_yojson availability_configuration_of_yojson tree path 

let list_availability_configurations_response_of_yojson = 
  fun tree path : list_availability_configurations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_availability_configurations_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    availability_configurations = option_of_yojson (value_for_key (availability_configuration_list_of_yojson) "AvailabilityConfigurations") _list path;
    
  }
  in _res

let list_availability_configurations_request_of_yojson = 
  fun tree path : list_availability_configurations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_availability_configurations_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let aliases_of_yojson = 
  fun tree path -> list_of_yojson email_address_of_yojson tree path 

let list_aliases_response_of_yojson = 
  fun tree path : list_aliases_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_aliases_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    aliases = option_of_yojson (value_for_key (aliases_of_yojson) "Aliases") _list path;
    
  }
  in _res

let list_aliases_request_of_yojson = 
  fun tree path : list_aliases_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_aliases_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    entity_id = value_for_key (work_mail_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let access_control_rule_of_yojson = 
  fun tree path : access_control_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : access_control_rule = {
    not_impersonation_role_ids = option_of_yojson (value_for_key (impersonation_role_id_list_of_yojson) "NotImpersonationRoleIds") _list path;
    impersonation_role_ids = option_of_yojson (value_for_key (impersonation_role_id_list_of_yojson) "ImpersonationRoleIds") _list path;
    date_modified = option_of_yojson (value_for_key (timestamp__of_yojson) "DateModified") _list path;
    date_created = option_of_yojson (value_for_key (timestamp__of_yojson) "DateCreated") _list path;
    not_user_ids = option_of_yojson (value_for_key (user_id_list_of_yojson) "NotUserIds") _list path;
    user_ids = option_of_yojson (value_for_key (user_id_list_of_yojson) "UserIds") _list path;
    not_actions = option_of_yojson (value_for_key (actions_list_of_yojson) "NotActions") _list path;
    actions = option_of_yojson (value_for_key (actions_list_of_yojson) "Actions") _list path;
    not_ip_ranges = option_of_yojson (value_for_key (ip_range_list_of_yojson) "NotIpRanges") _list path;
    ip_ranges = option_of_yojson (value_for_key (ip_range_list_of_yojson) "IpRanges") _list path;
    description = option_of_yojson (value_for_key (access_control_rule_description_of_yojson) "Description") _list path;
    effect = option_of_yojson (value_for_key (access_control_rule_effect_of_yojson) "Effect") _list path;
    name = option_of_yojson (value_for_key (access_control_rule_name_of_yojson) "Name") _list path;
    
  }
  in _res

let access_control_rules_list_of_yojson = 
  fun tree path -> list_of_yojson access_control_rule_of_yojson tree path 

let list_access_control_rules_response_of_yojson = 
  fun tree path : list_access_control_rules_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_access_control_rules_response = {
    rules = option_of_yojson (value_for_key (access_control_rules_list_of_yojson) "Rules") _list path;
    
  }
  in _res

let list_access_control_rules_request_of_yojson = 
  fun tree path : list_access_control_rules_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_access_control_rules_request = {
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let get_mobile_device_access_override_response_of_yojson = 
  fun tree path : get_mobile_device_access_override_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_mobile_device_access_override_response = {
    date_modified = option_of_yojson (value_for_key (timestamp__of_yojson) "DateModified") _list path;
    date_created = option_of_yojson (value_for_key (timestamp__of_yojson) "DateCreated") _list path;
    description = option_of_yojson (value_for_key (mobile_device_access_rule_description_of_yojson) "Description") _list path;
    effect = option_of_yojson (value_for_key (mobile_device_access_rule_effect_of_yojson) "Effect") _list path;
    device_id = option_of_yojson (value_for_key (device_id_of_yojson) "DeviceId") _list path;
    user_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "UserId") _list path;
    
  }
  in _res

let get_mobile_device_access_override_request_of_yojson = 
  fun tree path : get_mobile_device_access_override_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_mobile_device_access_override_request = {
    device_id = value_for_key (device_id_of_yojson) "DeviceId" _list path;
    user_id = value_for_key (entity_identifier_of_yojson) "UserId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let mobile_device_access_matched_rule_of_yojson = 
  fun tree path : mobile_device_access_matched_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : mobile_device_access_matched_rule = {
    name = option_of_yojson (value_for_key (mobile_device_access_rule_name_of_yojson) "Name") _list path;
    mobile_device_access_rule_id = option_of_yojson (value_for_key (mobile_device_access_rule_id_of_yojson) "MobileDeviceAccessRuleId") _list path;
    
  }
  in _res

let mobile_device_access_matched_rule_list_of_yojson = 
  fun tree path -> list_of_yojson mobile_device_access_matched_rule_of_yojson tree path 

let get_mobile_device_access_effect_response_of_yojson = 
  fun tree path : get_mobile_device_access_effect_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_mobile_device_access_effect_response = {
    matched_rules = option_of_yojson (value_for_key (mobile_device_access_matched_rule_list_of_yojson) "MatchedRules") _list path;
    effect = option_of_yojson (value_for_key (mobile_device_access_rule_effect_of_yojson) "Effect") _list path;
    
  }
  in _res

let get_mobile_device_access_effect_request_of_yojson = 
  fun tree path : get_mobile_device_access_effect_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_mobile_device_access_effect_request = {
    device_user_agent = option_of_yojson (value_for_key (device_user_agent_of_yojson) "DeviceUserAgent") _list path;
    device_operating_system = option_of_yojson (value_for_key (device_operating_system_of_yojson) "DeviceOperatingSystem") _list path;
    device_model = option_of_yojson (value_for_key (device_model_of_yojson) "DeviceModel") _list path;
    device_type = option_of_yojson (value_for_key (device_type_of_yojson) "DeviceType") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let dns_record_of_yojson = 
  fun tree path : dns_record ->
  let _list = assoc_of_yojson tree path in
  let _res : dns_record = {
    value = option_of_yojson (value_for_key (string__of_yojson) "Value") _list path;
    hostname = option_of_yojson (value_for_key (string__of_yojson) "Hostname") _list path;
    type_ = option_of_yojson (value_for_key (string__of_yojson) "Type") _list path;
    
  }
  in _res

let dns_records_of_yojson = 
  fun tree path -> list_of_yojson dns_record_of_yojson tree path 

let dns_record_verification_status_of_yojson = 
  fun (tree: t) path : dns_record_verification_status -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "VERIFIED" -> VERIFIED
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DnsRecordVerificationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DnsRecordVerificationStatus")

let get_mail_domain_response_of_yojson = 
  fun tree path : get_mail_domain_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_mail_domain_response = {
    dkim_verification_status = option_of_yojson (value_for_key (dns_record_verification_status_of_yojson) "DkimVerificationStatus") _list path;
    ownership_verification_status = option_of_yojson (value_for_key (dns_record_verification_status_of_yojson) "OwnershipVerificationStatus") _list path;
    is_default = option_of_yojson (value_for_key (boolean__of_yojson) "IsDefault") _list path;
    is_test_domain = option_of_yojson (value_for_key (boolean__of_yojson) "IsTestDomain") _list path;
    records = option_of_yojson (value_for_key (dns_records_of_yojson) "Records") _list path;
    
  }
  in _res

let get_mail_domain_request_of_yojson = 
  fun tree path : get_mail_domain_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_mail_domain_request = {
    domain_name = value_for_key (work_mail_domain_name_of_yojson) "DomainName" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let mailbox_size_of_yojson = double_of_yojson

let get_mailbox_details_response_of_yojson = 
  fun tree path : get_mailbox_details_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_mailbox_details_response = {
    mailbox_size = option_of_yojson (value_for_key (mailbox_size_of_yojson) "MailboxSize") _list path;
    mailbox_quota = option_of_yojson (value_for_key (mailbox_quota_of_yojson) "MailboxQuota") _list path;
    
  }
  in _res

let get_mailbox_details_request_of_yojson = 
  fun tree path : get_mailbox_details_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_mailbox_details_request = {
    user_id = value_for_key (entity_identifier_of_yojson) "UserId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let impersonation_matched_rule_of_yojson = 
  fun tree path : impersonation_matched_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : impersonation_matched_rule = {
    name = option_of_yojson (value_for_key (impersonation_rule_name_of_yojson) "Name") _list path;
    impersonation_rule_id = option_of_yojson (value_for_key (impersonation_rule_id_of_yojson) "ImpersonationRuleId") _list path;
    
  }
  in _res

let impersonation_matched_rule_list_of_yojson = 
  fun tree path -> list_of_yojson impersonation_matched_rule_of_yojson tree path 

let get_impersonation_role_effect_response_of_yojson = 
  fun tree path : get_impersonation_role_effect_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_impersonation_role_effect_response = {
    matched_rules = option_of_yojson (value_for_key (impersonation_matched_rule_list_of_yojson) "MatchedRules") _list path;
    effect = option_of_yojson (value_for_key (access_effect_of_yojson) "Effect") _list path;
    type_ = option_of_yojson (value_for_key (impersonation_role_type_of_yojson) "Type") _list path;
    
  }
  in _res

let get_impersonation_role_effect_request_of_yojson = 
  fun tree path : get_impersonation_role_effect_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_impersonation_role_effect_request = {
    target_user = value_for_key (entity_identifier_of_yojson) "TargetUser" _list path;
    impersonation_role_id = value_for_key (impersonation_role_id_of_yojson) "ImpersonationRoleId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let get_impersonation_role_response_of_yojson = 
  fun tree path : get_impersonation_role_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_impersonation_role_response = {
    date_modified = option_of_yojson (value_for_key (timestamp__of_yojson) "DateModified") _list path;
    date_created = option_of_yojson (value_for_key (timestamp__of_yojson) "DateCreated") _list path;
    rules = option_of_yojson (value_for_key (impersonation_rule_list_of_yojson) "Rules") _list path;
    description = option_of_yojson (value_for_key (impersonation_role_description_of_yojson) "Description") _list path;
    type_ = option_of_yojson (value_for_key (impersonation_role_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (impersonation_role_name_of_yojson) "Name") _list path;
    impersonation_role_id = option_of_yojson (value_for_key (impersonation_role_id_of_yojson) "ImpersonationRoleId") _list path;
    
  }
  in _res

let get_impersonation_role_request_of_yojson = 
  fun tree path : get_impersonation_role_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_impersonation_role_request = {
    impersonation_role_id = value_for_key (impersonation_role_id_of_yojson) "ImpersonationRoleId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let get_default_retention_policy_response_of_yojson = 
  fun tree path : get_default_retention_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_default_retention_policy_response = {
    folder_configurations = option_of_yojson (value_for_key (folder_configurations_of_yojson) "FolderConfigurations") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (short_string_of_yojson) "Name") _list path;
    id = option_of_yojson (value_for_key (short_string_of_yojson) "Id") _list path;
    
  }
  in _res

let get_default_retention_policy_request_of_yojson = 
  fun tree path : get_default_retention_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_default_retention_policy_request = {
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let access_control_rule_name_list_of_yojson = 
  fun tree path -> list_of_yojson access_control_rule_name_of_yojson tree path 

let get_access_control_effect_response_of_yojson = 
  fun tree path : get_access_control_effect_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_access_control_effect_response = {
    matched_rules = option_of_yojson (value_for_key (access_control_rule_name_list_of_yojson) "MatchedRules") _list path;
    effect = option_of_yojson (value_for_key (access_control_rule_effect_of_yojson) "Effect") _list path;
    
  }
  in _res

let ip_address_of_yojson = string_of_yojson

let get_access_control_effect_request_of_yojson = 
  fun tree path : get_access_control_effect_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_access_control_effect_request = {
    impersonation_role_id = option_of_yojson (value_for_key (impersonation_role_id_of_yojson) "ImpersonationRoleId") _list path;
    user_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "UserId") _list path;
    action = value_for_key (access_control_rule_action_of_yojson) "Action" _list path;
    ip_address = value_for_key (ip_address_of_yojson) "IpAddress" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let disassociate_member_from_group_response_of_yojson = 
  fun tree path : disassociate_member_from_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : disassociate_member_from_group_response = ()
  in _res

let disassociate_member_from_group_request_of_yojson = 
  fun tree path : disassociate_member_from_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disassociate_member_from_group_request = {
    member_id = value_for_key (entity_identifier_of_yojson) "MemberId" _list path;
    group_id = value_for_key (entity_identifier_of_yojson) "GroupId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let disassociate_delegate_from_resource_response_of_yojson = 
  fun tree path : disassociate_delegate_from_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : disassociate_delegate_from_resource_response = ()
  in _res

let disassociate_delegate_from_resource_request_of_yojson = 
  fun tree path : disassociate_delegate_from_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disassociate_delegate_from_resource_request = {
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    resource_id = value_for_key (entity_identifier_of_yojson) "ResourceId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let describe_user_response_of_yojson = 
  fun tree path : describe_user_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_user_response = {
    office = option_of_yojson (value_for_key (user_attribute_of_yojson) "Office") _list path;
    country = option_of_yojson (value_for_key (user_attribute_of_yojson) "Country") _list path;
    department = option_of_yojson (value_for_key (user_attribute_of_yojson) "Department") _list path;
    zip_code = option_of_yojson (value_for_key (user_attribute_of_yojson) "ZipCode") _list path;
    company = option_of_yojson (value_for_key (user_attribute_of_yojson) "Company") _list path;
    city = option_of_yojson (value_for_key (user_attribute_of_yojson) "City") _list path;
    job_title = option_of_yojson (value_for_key (user_attribute_of_yojson) "JobTitle") _list path;
    street = option_of_yojson (value_for_key (user_attribute_of_yojson) "Street") _list path;
    telephone = option_of_yojson (value_for_key (user_attribute_of_yojson) "Telephone") _list path;
    initials = option_of_yojson (value_for_key (user_attribute_of_yojson) "Initials") _list path;
    hidden_from_global_address_list = option_of_yojson (value_for_key (boolean__of_yojson) "HiddenFromGlobalAddressList") _list path;
    last_name = option_of_yojson (value_for_key (user_attribute_of_yojson) "LastName") _list path;
    first_name = option_of_yojson (value_for_key (user_attribute_of_yojson) "FirstName") _list path;
    mailbox_deprovisioned_date = option_of_yojson (value_for_key (timestamp__of_yojson) "MailboxDeprovisionedDate") _list path;
    mailbox_provisioned_date = option_of_yojson (value_for_key (timestamp__of_yojson) "MailboxProvisionedDate") _list path;
    disabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "DisabledDate") _list path;
    enabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "EnabledDate") _list path;
    user_role = option_of_yojson (value_for_key (user_role_of_yojson) "UserRole") _list path;
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    display_name = option_of_yojson (value_for_key (user_attribute_of_yojson) "DisplayName") _list path;
    email = option_of_yojson (value_for_key (email_address_of_yojson) "Email") _list path;
    name = option_of_yojson (value_for_key (user_name_of_yojson) "Name") _list path;
    user_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "UserId") _list path;
    
  }
  in _res

let describe_user_request_of_yojson = 
  fun tree path : describe_user_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_user_request = {
    user_id = value_for_key (entity_identifier_of_yojson) "UserId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let resource_id_of_yojson = string_of_yojson

let describe_resource_response_of_yojson = 
  fun tree path : describe_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_resource_response = {
    hidden_from_global_address_list = option_of_yojson (value_for_key (boolean__of_yojson) "HiddenFromGlobalAddressList") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    disabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "DisabledDate") _list path;
    enabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "EnabledDate") _list path;
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    booking_options = option_of_yojson (value_for_key (booking_options_of_yojson) "BookingOptions") _list path;
    type_ = option_of_yojson (value_for_key (resource_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "Name") _list path;
    email = option_of_yojson (value_for_key (email_address_of_yojson) "Email") _list path;
    resource_id = option_of_yojson (value_for_key (resource_id_of_yojson) "ResourceId") _list path;
    
  }
  in _res

let describe_resource_request_of_yojson = 
  fun tree path : describe_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_resource_request = {
    resource_id = value_for_key (entity_identifier_of_yojson) "ResourceId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let describe_organization_response_of_yojson = 
  fun tree path : describe_organization_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_response = {
    interoperability_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "InteroperabilityEnabled") _list path;
    migration_admin = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "MigrationAdmin") _list path;
    ar_n = option_of_yojson (value_for_key (amazon_resource_name_of_yojson) "ARN") _list path;
    error_message = option_of_yojson (value_for_key (string__of_yojson) "ErrorMessage") _list path;
    completed_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CompletedDate") _list path;
    default_mail_domain = option_of_yojson (value_for_key (string__of_yojson) "DefaultMailDomain") _list path;
    directory_type = option_of_yojson (value_for_key (string__of_yojson) "DirectoryType") _list path;
    directory_id = option_of_yojson (value_for_key (string__of_yojson) "DirectoryId") _list path;
    state = option_of_yojson (value_for_key (string__of_yojson) "State") _list path;
    alias = option_of_yojson (value_for_key (organization_name_of_yojson) "Alias") _list path;
    organization_id = option_of_yojson (value_for_key (organization_id_of_yojson) "OrganizationId") _list path;
    
  }
  in _res

let describe_organization_request_of_yojson = 
  fun tree path : describe_organization_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_request = {
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let mailbox_export_error_info_of_yojson = string_of_yojson

let describe_mailbox_export_job_response_of_yojson = 
  fun tree path : describe_mailbox_export_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_mailbox_export_job_response = {
    end_time = option_of_yojson (value_for_key (timestamp__of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (timestamp__of_yojson) "StartTime") _list path;
    error_info = option_of_yojson (value_for_key (mailbox_export_error_info_of_yojson) "ErrorInfo") _list path;
    state = option_of_yojson (value_for_key (mailbox_export_job_state_of_yojson) "State") _list path;
    estimated_progress = option_of_yojson (value_for_key (percentage_of_yojson) "EstimatedProgress") _list path;
    s3_path = option_of_yojson (value_for_key (s3_object_key_of_yojson) "S3Path") _list path;
    s3_prefix = option_of_yojson (value_for_key (s3_object_key_of_yojson) "S3Prefix") _list path;
    s3_bucket_name = option_of_yojson (value_for_key (s3_bucket_name_of_yojson) "S3BucketName") _list path;
    kms_key_arn = option_of_yojson (value_for_key (kms_key_arn_of_yojson) "KmsKeyArn") _list path;
    role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "RoleArn") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    entity_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "EntityId") _list path;
    
  }
  in _res

let describe_mailbox_export_job_request_of_yojson = 
  fun tree path : describe_mailbox_export_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_mailbox_export_job_request = {
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    job_id = value_for_key (mailbox_export_job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let describe_inbound_dmarc_settings_response_of_yojson = 
  fun tree path : describe_inbound_dmarc_settings_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_inbound_dmarc_settings_response = {
    enforced = option_of_yojson (value_for_key (boolean__of_yojson) "Enforced") _list path;
    
  }
  in _res

let describe_inbound_dmarc_settings_request_of_yojson = 
  fun tree path : describe_inbound_dmarc_settings_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_inbound_dmarc_settings_request = {
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let describe_group_response_of_yojson = 
  fun tree path : describe_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_group_response = {
    hidden_from_global_address_list = option_of_yojson (value_for_key (boolean__of_yojson) "HiddenFromGlobalAddressList") _list path;
    disabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "DisabledDate") _list path;
    enabled_date = option_of_yojson (value_for_key (timestamp__of_yojson) "EnabledDate") _list path;
    state = option_of_yojson (value_for_key (entity_state_of_yojson) "State") _list path;
    email = option_of_yojson (value_for_key (email_address_of_yojson) "Email") _list path;
    name = option_of_yojson (value_for_key (group_name_of_yojson) "Name") _list path;
    group_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "GroupId") _list path;
    
  }
  in _res

let describe_group_request_of_yojson = 
  fun tree path : describe_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_group_request = {
    group_id = value_for_key (entity_identifier_of_yojson) "GroupId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let entity_type_of_yojson = 
  fun (tree: t) path : entity_type -> match tree with 
    | `String "RESOURCE" -> RESOURCE
    | `String "USER" -> USER
    | `String "GROUP" -> GROUP
    | `String value -> raise (deserialize_unknown_enum_value_error path "EntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityType")

let describe_entity_response_of_yojson = 
  fun tree path : describe_entity_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_entity_response = {
    type_ = option_of_yojson (value_for_key (entity_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    entity_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "EntityId") _list path;
    
  }
  in _res

let describe_entity_request_of_yojson = 
  fun tree path : describe_entity_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_entity_request = {
    email = value_for_key (email_address_of_yojson) "Email" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let describe_email_monitoring_configuration_response_of_yojson = 
  fun tree path : describe_email_monitoring_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_email_monitoring_configuration_response = {
    log_group_arn = option_of_yojson (value_for_key (log_group_arn_of_yojson) "LogGroupArn") _list path;
    role_arn = option_of_yojson (value_for_key (role_arn_of_yojson) "RoleArn") _list path;
    
  }
  in _res

let describe_email_monitoring_configuration_request_of_yojson = 
  fun tree path : describe_email_monitoring_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_email_monitoring_configuration_request = {
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let invalid_custom_ses_configuration_exception_of_yojson = 
  fun tree path : invalid_custom_ses_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_custom_ses_configuration_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let deregister_mail_domain_response_of_yojson = 
  fun tree path : deregister_mail_domain_response ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_mail_domain_response = ()
  in _res

let deregister_mail_domain_request_of_yojson = 
  fun tree path : deregister_mail_domain_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_mail_domain_request = {
    domain_name = value_for_key (work_mail_domain_name_of_yojson) "DomainName" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let deregister_from_work_mail_response_of_yojson = 
  fun tree path : deregister_from_work_mail_response ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_from_work_mail_response = ()
  in _res

let deregister_from_work_mail_request_of_yojson = 
  fun tree path : deregister_from_work_mail_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_from_work_mail_request = {
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_user_response_of_yojson = 
  fun tree path : delete_user_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_user_response = ()
  in _res

let delete_user_request_of_yojson = 
  fun tree path : delete_user_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_user_request = {
    user_id = value_for_key (entity_identifier_of_yojson) "UserId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_retention_policy_response_of_yojson = 
  fun tree path : delete_retention_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_retention_policy_response = ()
  in _res

let delete_retention_policy_request_of_yojson = 
  fun tree path : delete_retention_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_retention_policy_request = {
    id = value_for_key (short_string_of_yojson) "Id" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_resource_response_of_yojson = 
  fun tree path : delete_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_response = ()
  in _res

let delete_resource_request_of_yojson = 
  fun tree path : delete_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_request = {
    resource_id = value_for_key (entity_identifier_of_yojson) "ResourceId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_organization_response_of_yojson = 
  fun tree path : delete_organization_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_organization_response = {
    state = option_of_yojson (value_for_key (string__of_yojson) "State") _list path;
    organization_id = option_of_yojson (value_for_key (organization_id_of_yojson) "OrganizationId") _list path;
    
  }
  in _res

let delete_organization_request_of_yojson = 
  fun tree path : delete_organization_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_organization_request = {
    force_delete = option_of_yojson (value_for_key (boolean__of_yojson) "ForceDelete") _list path;
    delete_directory = value_for_key (boolean__of_yojson) "DeleteDirectory" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    client_token = option_of_yojson (value_for_key (idempotency_client_token_of_yojson) "ClientToken") _list path;
    
  }
  in _res

let delete_mobile_device_access_rule_response_of_yojson = 
  fun tree path : delete_mobile_device_access_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_mobile_device_access_rule_response = ()
  in _res

let delete_mobile_device_access_rule_request_of_yojson = 
  fun tree path : delete_mobile_device_access_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_mobile_device_access_rule_request = {
    mobile_device_access_rule_id = value_for_key (mobile_device_access_rule_id_of_yojson) "MobileDeviceAccessRuleId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_mobile_device_access_override_response_of_yojson = 
  fun tree path : delete_mobile_device_access_override_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_mobile_device_access_override_response = ()
  in _res

let delete_mobile_device_access_override_request_of_yojson = 
  fun tree path : delete_mobile_device_access_override_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_mobile_device_access_override_request = {
    device_id = value_for_key (device_id_of_yojson) "DeviceId" _list path;
    user_id = value_for_key (entity_identifier_of_yojson) "UserId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_mailbox_permissions_response_of_yojson = 
  fun tree path : delete_mailbox_permissions_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_mailbox_permissions_response = ()
  in _res

let delete_mailbox_permissions_request_of_yojson = 
  fun tree path : delete_mailbox_permissions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_mailbox_permissions_request = {
    grantee_id = value_for_key (entity_identifier_of_yojson) "GranteeId" _list path;
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_impersonation_role_response_of_yojson = 
  fun tree path : delete_impersonation_role_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_impersonation_role_response = ()
  in _res

let delete_impersonation_role_request_of_yojson = 
  fun tree path : delete_impersonation_role_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_impersonation_role_request = {
    impersonation_role_id = value_for_key (impersonation_role_id_of_yojson) "ImpersonationRoleId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_group_response_of_yojson = 
  fun tree path : delete_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_group_response = ()
  in _res

let delete_group_request_of_yojson = 
  fun tree path : delete_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_group_request = {
    group_id = value_for_key (entity_identifier_of_yojson) "GroupId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_email_monitoring_configuration_response_of_yojson = 
  fun tree path : delete_email_monitoring_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_email_monitoring_configuration_response = ()
  in _res

let delete_email_monitoring_configuration_request_of_yojson = 
  fun tree path : delete_email_monitoring_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_email_monitoring_configuration_request = {
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_availability_configuration_response_of_yojson = 
  fun tree path : delete_availability_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_availability_configuration_response = ()
  in _res

let delete_availability_configuration_request_of_yojson = 
  fun tree path : delete_availability_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_availability_configuration_request = {
    domain_name = value_for_key (domain_name_of_yojson) "DomainName" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_alias_response_of_yojson = 
  fun tree path : delete_alias_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_alias_response = ()
  in _res

let delete_alias_request_of_yojson = 
  fun tree path : delete_alias_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_alias_request = {
    alias = value_for_key (email_address_of_yojson) "Alias" _list path;
    entity_id = value_for_key (work_mail_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let delete_access_control_rule_response_of_yojson = 
  fun tree path : delete_access_control_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_access_control_rule_response = ()
  in _res

let delete_access_control_rule_request_of_yojson = 
  fun tree path : delete_access_control_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_access_control_rule_request = {
    name = value_for_key (access_control_rule_name_of_yojson) "Name" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let reserved_name_exception_of_yojson = 
  fun tree path : reserved_name_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : reserved_name_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let create_user_response_of_yojson = 
  fun tree path : create_user_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_user_response = {
    user_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "UserId") _list path;
    
  }
  in _res

let create_user_request_of_yojson = 
  fun tree path : create_user_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_user_request = {
    hidden_from_global_address_list = option_of_yojson (value_for_key (boolean__of_yojson) "HiddenFromGlobalAddressList") _list path;
    last_name = option_of_yojson (value_for_key (user_attribute_of_yojson) "LastName") _list path;
    first_name = option_of_yojson (value_for_key (user_attribute_of_yojson) "FirstName") _list path;
    role = option_of_yojson (value_for_key (user_role_of_yojson) "Role") _list path;
    password = option_of_yojson (value_for_key (password_of_yojson) "Password") _list path;
    display_name = value_for_key (user_attribute_of_yojson) "DisplayName" _list path;
    name = value_for_key (user_name_of_yojson) "Name" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let create_resource_response_of_yojson = 
  fun tree path : create_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_resource_response = {
    resource_id = option_of_yojson (value_for_key (resource_id_of_yojson) "ResourceId") _list path;
    
  }
  in _res

let create_resource_request_of_yojson = 
  fun tree path : create_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_resource_request = {
    hidden_from_global_address_list = option_of_yojson (value_for_key (boolean__of_yojson) "HiddenFromGlobalAddressList") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    type_ = value_for_key (resource_type_of_yojson) "Type" _list path;
    name = value_for_key (resource_name_of_yojson) "Name" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let directory_in_use_exception_of_yojson = 
  fun tree path : directory_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_in_use_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let create_organization_response_of_yojson = 
  fun tree path : create_organization_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_organization_response = {
    organization_id = option_of_yojson (value_for_key (organization_id_of_yojson) "OrganizationId") _list path;
    
  }
  in _res

let directory_id_of_yojson = string_of_yojson

let hosted_zone_id_of_yojson = string_of_yojson

let domain_of_yojson = 
  fun tree path : domain ->
  let _list = assoc_of_yojson tree path in
  let _res : domain = {
    hosted_zone_id = option_of_yojson (value_for_key (hosted_zone_id_of_yojson) "HostedZoneId") _list path;
    domain_name = value_for_key (domain_name_of_yojson) "DomainName" _list path;
    
  }
  in _res

let domains_of_yojson = 
  fun tree path -> list_of_yojson domain_of_yojson tree path 

let create_organization_request_of_yojson = 
  fun tree path : create_organization_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_organization_request = {
    enable_interoperability = option_of_yojson (value_for_key (boolean__of_yojson) "EnableInteroperability") _list path;
    kms_key_arn = option_of_yojson (value_for_key (kms_key_arn_of_yojson) "KmsKeyArn") _list path;
    domains = option_of_yojson (value_for_key (domains_of_yojson) "Domains") _list path;
    client_token = option_of_yojson (value_for_key (idempotency_client_token_of_yojson) "ClientToken") _list path;
    alias = value_for_key (organization_name_of_yojson) "Alias" _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let create_mobile_device_access_rule_response_of_yojson = 
  fun tree path : create_mobile_device_access_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_mobile_device_access_rule_response = {
    mobile_device_access_rule_id = option_of_yojson (value_for_key (mobile_device_access_rule_id_of_yojson) "MobileDeviceAccessRuleId") _list path;
    
  }
  in _res

let create_mobile_device_access_rule_request_of_yojson = 
  fun tree path : create_mobile_device_access_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_mobile_device_access_rule_request = {
    not_device_user_agents = option_of_yojson (value_for_key (device_user_agent_list_of_yojson) "NotDeviceUserAgents") _list path;
    device_user_agents = option_of_yojson (value_for_key (device_user_agent_list_of_yojson) "DeviceUserAgents") _list path;
    not_device_operating_systems = option_of_yojson (value_for_key (device_operating_system_list_of_yojson) "NotDeviceOperatingSystems") _list path;
    device_operating_systems = option_of_yojson (value_for_key (device_operating_system_list_of_yojson) "DeviceOperatingSystems") _list path;
    not_device_models = option_of_yojson (value_for_key (device_model_list_of_yojson) "NotDeviceModels") _list path;
    device_models = option_of_yojson (value_for_key (device_model_list_of_yojson) "DeviceModels") _list path;
    not_device_types = option_of_yojson (value_for_key (device_type_list_of_yojson) "NotDeviceTypes") _list path;
    device_types = option_of_yojson (value_for_key (device_type_list_of_yojson) "DeviceTypes") _list path;
    effect = value_for_key (mobile_device_access_rule_effect_of_yojson) "Effect" _list path;
    description = option_of_yojson (value_for_key (mobile_device_access_rule_description_of_yojson) "Description") _list path;
    name = value_for_key (mobile_device_access_rule_name_of_yojson) "Name" _list path;
    client_token = option_of_yojson (value_for_key (idempotency_client_token_of_yojson) "ClientToken") _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let create_impersonation_role_response_of_yojson = 
  fun tree path : create_impersonation_role_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_impersonation_role_response = {
    impersonation_role_id = option_of_yojson (value_for_key (impersonation_role_id_of_yojson) "ImpersonationRoleId") _list path;
    
  }
  in _res

let create_impersonation_role_request_of_yojson = 
  fun tree path : create_impersonation_role_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_impersonation_role_request = {
    rules = value_for_key (impersonation_rule_list_of_yojson) "Rules" _list path;
    description = option_of_yojson (value_for_key (impersonation_role_description_of_yojson) "Description") _list path;
    type_ = value_for_key (impersonation_role_type_of_yojson) "Type" _list path;
    name = value_for_key (impersonation_role_name_of_yojson) "Name" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    client_token = option_of_yojson (value_for_key (idempotency_client_token_of_yojson) "ClientToken") _list path;
    
  }
  in _res

let create_group_response_of_yojson = 
  fun tree path : create_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_group_response = {
    group_id = option_of_yojson (value_for_key (work_mail_identifier_of_yojson) "GroupId") _list path;
    
  }
  in _res

let create_group_request_of_yojson = 
  fun tree path : create_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_group_request = {
    hidden_from_global_address_list = option_of_yojson (value_for_key (boolean__of_yojson) "HiddenFromGlobalAddressList") _list path;
    name = value_for_key (group_name_of_yojson) "Name" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let create_availability_configuration_response_of_yojson = 
  fun tree path : create_availability_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_availability_configuration_response = ()
  in _res

let create_availability_configuration_request_of_yojson = 
  fun tree path : create_availability_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_availability_configuration_request = {
    lambda_provider = option_of_yojson (value_for_key (lambda_availability_provider_of_yojson) "LambdaProvider") _list path;
    ews_provider = option_of_yojson (value_for_key (ews_availability_provider_of_yojson) "EwsProvider") _list path;
    domain_name = value_for_key (domain_name_of_yojson) "DomainName" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    client_token = option_of_yojson (value_for_key (idempotency_client_token_of_yojson) "ClientToken") _list path;
    
  }
  in _res

let create_alias_response_of_yojson = 
  fun tree path : create_alias_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_alias_response = ()
  in _res

let create_alias_request_of_yojson = 
  fun tree path : create_alias_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_alias_request = {
    alias = value_for_key (email_address_of_yojson) "Alias" _list path;
    entity_id = value_for_key (work_mail_identifier_of_yojson) "EntityId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let cancel_mailbox_export_job_response_of_yojson = 
  fun tree path : cancel_mailbox_export_job_response ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_mailbox_export_job_response = ()
  in _res

let cancel_mailbox_export_job_request_of_yojson = 
  fun tree path : cancel_mailbox_export_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_mailbox_export_job_request = {
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    job_id = value_for_key (mailbox_export_job_id_of_yojson) "JobId" _list path;
    client_token = value_for_key (idempotency_client_token_of_yojson) "ClientToken" _list path;
    
  }
  in _res

let impersonation_token_of_yojson = string_of_yojson

let expires_in_of_yojson = long_of_yojson

let assume_impersonation_role_response_of_yojson = 
  fun tree path : assume_impersonation_role_response ->
  let _list = assoc_of_yojson tree path in
  let _res : assume_impersonation_role_response = {
    expires_in = option_of_yojson (value_for_key (expires_in_of_yojson) "ExpiresIn") _list path;
    token = option_of_yojson (value_for_key (impersonation_token_of_yojson) "Token") _list path;
    
  }
  in _res

let assume_impersonation_role_request_of_yojson = 
  fun tree path : assume_impersonation_role_request ->
  let _list = assoc_of_yojson tree path in
  let _res : assume_impersonation_role_request = {
    impersonation_role_id = value_for_key (impersonation_role_id_of_yojson) "ImpersonationRoleId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let associate_member_to_group_response_of_yojson = 
  fun tree path : associate_member_to_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : associate_member_to_group_response = ()
  in _res

let associate_member_to_group_request_of_yojson = 
  fun tree path : associate_member_to_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : associate_member_to_group_request = {
    member_id = value_for_key (entity_identifier_of_yojson) "MemberId" _list path;
    group_id = value_for_key (entity_identifier_of_yojson) "GroupId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let associate_delegate_to_resource_response_of_yojson = 
  fun tree path : associate_delegate_to_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : associate_delegate_to_resource_response = ()
  in _res

let associate_delegate_to_resource_request_of_yojson = 
  fun tree path : associate_delegate_to_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : associate_delegate_to_resource_request = {
    entity_id = value_for_key (entity_identifier_of_yojson) "EntityId" _list path;
    resource_id = value_for_key (entity_identifier_of_yojson) "ResourceId" _list path;
    organization_id = value_for_key (organization_id_of_yojson) "OrganizationId" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

