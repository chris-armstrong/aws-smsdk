open Smaws_Lib.Json.DeserializeHelpers

open Types

let vpc_id_of_yojson = string_of_yojson

let trust_id_of_yojson = string_of_yojson

let verify_trust_result_of_yojson = 
  fun tree path : verify_trust_result ->
  let _list = assoc_of_yojson tree path in
  let _res : verify_trust_result = {
    trust_id = option_of_yojson (value_for_key (trust_id_of_yojson) "TrustId") _list path;
    
  }
  in _res

let verify_trust_request_of_yojson = 
  fun tree path : verify_trust_request ->
  let _list = assoc_of_yojson tree path in
  let _res : verify_trust_request = {
    trust_id = value_for_key (trust_id_of_yojson) "TrustId" _list path;
    
  }
  in _res

let exception_message_of_yojson = string_of_yojson

let request_id_of_yojson = string_of_yojson

let unsupported_operation_exception_of_yojson = 
  fun tree path : unsupported_operation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_operation_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let service_exception_of_yojson = 
  fun tree path : service_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : service_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_parameter_exception_of_yojson = 
  fun tree path : invalid_parameter_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let entity_does_not_exist_exception_of_yojson = 
  fun tree path : entity_does_not_exist_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : entity_does_not_exist_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let client_exception_of_yojson = 
  fun tree path : client_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : client_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let user_password_of_yojson = string_of_yojson

let user_name_of_yojson = string_of_yojson

let user_does_not_exist_exception_of_yojson = 
  fun tree path : user_does_not_exist_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : user_does_not_exist_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let use_same_username_of_yojson = bool_of_yojson

let base_unit_of_yojson = unit_of_yojson

let os_version_of_yojson = 
  fun (tree: t) path : os_version -> match tree with 
    | `String "SERVER_2019" -> VERSION_2019
    | `String "SERVER_2012" -> VERSION_2012
    | `String value -> raise (deserialize_unknown_enum_value_error path "OSVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "OSVersion")

let os_update_settings_of_yojson = 
  fun tree path : os_update_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : os_update_settings = {
    os_version = option_of_yojson (value_for_key (os_version_of_yojson) "OSVersion") _list path;
    
  }
  in _res

let update_value_of_yojson = 
  fun tree path : update_value ->
  let _list = assoc_of_yojson tree path in
  let _res : update_value = {
    os_update_settings = option_of_yojson (value_for_key (os_update_settings_of_yojson) "OSUpdateSettings") _list path;
    
  }
  in _res

let update_type_of_yojson = 
  fun (tree: t) path : update_type -> match tree with 
    | `String "OS" -> OS
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpdateType" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateType")

let update_trust_result_of_yojson = 
  fun tree path : update_trust_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_trust_result = {
    trust_id = option_of_yojson (value_for_key (trust_id_of_yojson) "TrustId") _list path;
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    
  }
  in _res

let selective_auth_of_yojson = 
  fun (tree: t) path : selective_auth -> match tree with 
    | `String "Disabled" -> DISABLED
    | `String "Enabled" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SelectiveAuth" value)
    | _ -> raise (deserialize_wrong_type_error path "SelectiveAuth")

let update_trust_request_of_yojson = 
  fun tree path : update_trust_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_trust_request = {
    selective_auth = option_of_yojson (value_for_key (selective_auth_of_yojson) "SelectiveAuth") _list path;
    trust_id = value_for_key (trust_id_of_yojson) "TrustId" _list path;
    
  }
  in _res

let update_status_reason_of_yojson = string_of_yojson

let update_status_of_yojson = 
  fun (tree: t) path : update_status -> match tree with 
    | `String "UpdateFailed" -> UPDATE_FAILED
    | `String "Updating" -> UPDATING
    | `String "Updated" -> UPDATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateStatus")

let directory_id_of_yojson = string_of_yojson

let update_settings_result_of_yojson = 
  fun tree path : update_settings_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_settings_result = {
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let directory_configuration_setting_name_of_yojson = string_of_yojson

let directory_configuration_setting_value_of_yojson = string_of_yojson

let setting_of_yojson = 
  fun tree path : setting ->
  let _list = assoc_of_yojson tree path in
  let _res : setting = {
    value = value_for_key (directory_configuration_setting_value_of_yojson) "Value" _list path;
    name = value_for_key (directory_configuration_setting_name_of_yojson) "Name" _list path;
    
  }
  in _res

let settings_of_yojson = 
  fun tree path -> list_of_yojson setting_of_yojson tree path 

let update_settings_request_of_yojson = 
  fun tree path : update_settings_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_settings_request = {
    settings = value_for_key (settings_of_yojson) "Settings" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let unsupported_settings_exception_of_yojson = 
  fun tree path : unsupported_settings_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_settings_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let incompatible_settings_exception_of_yojson = 
  fun tree path : incompatible_settings_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : incompatible_settings_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let directory_unavailable_exception_of_yojson = 
  fun tree path : directory_unavailable_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_unavailable_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let directory_does_not_exist_exception_of_yojson = 
  fun tree path : directory_does_not_exist_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_does_not_exist_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let update_security_group_for_directory_controllers_of_yojson = 
  bool_of_yojson

let update_radius_result_of_yojson = 
  fun tree path : update_radius_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_radius_result = ()
  in _res

let server_of_yojson = string_of_yojson

let servers_of_yojson = 
  fun tree path -> list_of_yojson server_of_yojson tree path 

let port_number_of_yojson = int_of_yojson

let radius_timeout_of_yojson = int_of_yojson

let radius_retries_of_yojson = int_of_yojson

let radius_shared_secret_of_yojson = string_of_yojson

let radius_authentication_protocol_of_yojson = 
  fun (tree: t) path : radius_authentication_protocol -> match tree with 
    | `String "MS-CHAPv2" -> MSCHAPV2
    | `String "MS-CHAPv1" -> MSCHAPV1
    | `String "CHAP" -> CHAP
    | `String "PAP" -> PAP
    | `String value -> raise (deserialize_unknown_enum_value_error path "RadiusAuthenticationProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "RadiusAuthenticationProtocol")

let radius_display_label_of_yojson = string_of_yojson

let radius_settings_of_yojson = 
  fun tree path : radius_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : radius_settings = {
    use_same_username = option_of_yojson (value_for_key (use_same_username_of_yojson) "UseSameUsername") _list path;
    display_label = option_of_yojson (value_for_key (radius_display_label_of_yojson) "DisplayLabel") _list path;
    authentication_protocol = option_of_yojson (value_for_key (radius_authentication_protocol_of_yojson) "AuthenticationProtocol") _list path;
    shared_secret = option_of_yojson (value_for_key (radius_shared_secret_of_yojson) "SharedSecret") _list path;
    radius_retries = option_of_yojson (value_for_key (radius_retries_of_yojson) "RadiusRetries") _list path;
    radius_timeout = option_of_yojson (value_for_key (radius_timeout_of_yojson) "RadiusTimeout") _list path;
    radius_port = option_of_yojson (value_for_key (port_number_of_yojson) "RadiusPort") _list path;
    radius_servers = option_of_yojson (value_for_key (servers_of_yojson) "RadiusServers") _list path;
    
  }
  in _res

let update_radius_request_of_yojson = 
  fun tree path : update_radius_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_radius_request = {
    radius_settings = value_for_key (radius_settings_of_yojson) "RadiusSettings" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let update_number_of_domain_controllers_result_of_yojson = 
  fun tree path : update_number_of_domain_controllers_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_number_of_domain_controllers_result = ()
  in _res

let desired_number_of_domain_controllers_of_yojson = int_of_yojson

let update_number_of_domain_controllers_request_of_yojson = 
  fun tree path : update_number_of_domain_controllers_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_number_of_domain_controllers_request = {
    desired_number = value_for_key (desired_number_of_domain_controllers_of_yojson) "DesiredNumber" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let domain_controller_limit_exceeded_exception_of_yojson = 
  fun tree path : domain_controller_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_controller_limit_exceeded_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let region_name_of_yojson = string_of_yojson

let initiated_by_of_yojson = string_of_yojson

let start_date_time_of_yojson = timestamp_of_yojson

let last_updated_date_time_of_yojson = timestamp_of_yojson

let update_info_entry_of_yojson = 
  fun tree path : update_info_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : update_info_entry = {
    last_updated_date_time = option_of_yojson (value_for_key (last_updated_date_time_of_yojson) "LastUpdatedDateTime") _list path;
    start_time = option_of_yojson (value_for_key (start_date_time_of_yojson) "StartTime") _list path;
    previous_value = option_of_yojson (value_for_key (update_value_of_yojson) "PreviousValue") _list path;
    new_value = option_of_yojson (value_for_key (update_value_of_yojson) "NewValue") _list path;
    initiated_by = option_of_yojson (value_for_key (initiated_by_of_yojson) "InitiatedBy") _list path;
    status_reason = option_of_yojson (value_for_key (update_status_reason_of_yojson) "StatusReason") _list path;
    status = option_of_yojson (value_for_key (update_status_of_yojson) "Status") _list path;
    region = option_of_yojson (value_for_key (region_name_of_yojson) "Region") _list path;
    
  }
  in _res

let update_directory_setup_result_of_yojson = 
  fun tree path : update_directory_setup_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_directory_setup_result = ()
  in _res

let create_snapshot_before_update_of_yojson = bool_of_yojson

let update_directory_setup_request_of_yojson = 
  fun tree path : update_directory_setup_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_directory_setup_request = {
    create_snapshot_before_update = option_of_yojson (value_for_key (create_snapshot_before_update_of_yojson) "CreateSnapshotBeforeUpdate") _list path;
    os_update_settings = option_of_yojson (value_for_key (os_update_settings_of_yojson) "OSUpdateSettings") _list path;
    update_type = value_for_key (update_type_of_yojson) "UpdateType" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let snapshot_limit_exceeded_exception_of_yojson = 
  fun tree path : snapshot_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : snapshot_limit_exceeded_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let directory_in_desired_state_exception_of_yojson = 
  fun tree path : directory_in_desired_state_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_in_desired_state_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let access_denied_exception_of_yojson = 
  fun tree path : access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : access_denied_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let update_conditional_forwarder_result_of_yojson = 
  fun tree path : update_conditional_forwarder_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_conditional_forwarder_result = ()
  in _res

let remote_domain_name_of_yojson = string_of_yojson

let ip_addr_of_yojson = string_of_yojson

let dns_ip_addrs_of_yojson = 
  fun tree path -> list_of_yojson ip_addr_of_yojson tree path 

let update_conditional_forwarder_request_of_yojson = 
  fun tree path : update_conditional_forwarder_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_conditional_forwarder_request = {
    dns_ip_addrs = value_for_key (dns_ip_addrs_of_yojson) "DnsIpAddrs" _list path;
    remote_domain_name = value_for_key (remote_domain_name_of_yojson) "RemoteDomainName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let update_activities_of_yojson = 
  fun tree path -> list_of_yojson update_info_entry_of_yojson tree path 

let target_id_of_yojson = string_of_yojson

let target_type_of_yojson = 
  fun (tree: t) path : target_type -> match tree with 
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetType")

let unshare_target_of_yojson = 
  fun tree path : unshare_target ->
  let _list = assoc_of_yojson tree path in
  let _res : unshare_target = {
    type_ = value_for_key (target_type_of_yojson) "Type" _list path;
    id = value_for_key (target_id_of_yojson) "Id" _list path;
    
  }
  in _res

let unshare_directory_result_of_yojson = 
  fun tree path : unshare_directory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : unshare_directory_result = {
    shared_directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "SharedDirectoryId") _list path;
    
  }
  in _res

let unshare_directory_request_of_yojson = 
  fun tree path : unshare_directory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : unshare_directory_request = {
    unshare_target = value_for_key (unshare_target_of_yojson) "UnshareTarget" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let invalid_target_exception_of_yojson = 
  fun tree path : invalid_target_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_target_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let directory_not_shared_exception_of_yojson = 
  fun tree path : directory_not_shared_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_not_shared_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let trust_type_of_yojson = 
  fun (tree: t) path : trust_type -> match tree with 
    | `String "External" -> EXTERNAL
    | `String "Forest" -> FOREST
    | `String value -> raise (deserialize_unknown_enum_value_error path "TrustType" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustType")

let trust_direction_of_yojson = 
  fun (tree: t) path : trust_direction -> match tree with 
    | `String "Two-Way" -> TWO_WAY
    | `String "One-Way: Incoming" -> ONE_WAY_INCOMING
    | `String "One-Way: Outgoing" -> ONE_WAY_OUTGOING
    | `String value -> raise (deserialize_unknown_enum_value_error path "TrustDirection" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustDirection")

let trust_state_of_yojson = 
  fun (tree: t) path : trust_state -> match tree with 
    | `String "Failed" -> FAILED
    | `String "Deleted" -> DELETED
    | `String "Deleting" -> DELETING
    | `String "Updated" -> UPDATED
    | `String "UpdateFailed" -> UPDATE_FAILED
    | `String "Updating" -> UPDATING
    | `String "Verified" -> VERIFIED
    | `String "VerifyFailed" -> VERIFY_FAILED
    | `String "Verifying" -> VERIFYING
    | `String "Created" -> CREATED
    | `String "Creating" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "TrustState" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustState")

let created_date_time_of_yojson = timestamp_of_yojson

let state_last_updated_date_time_of_yojson = timestamp_of_yojson

let trust_state_reason_of_yojson = string_of_yojson

let trust_of_yojson = 
  fun tree path : trust ->
  let _list = assoc_of_yojson tree path in
  let _res : trust = {
    selective_auth = option_of_yojson (value_for_key (selective_auth_of_yojson) "SelectiveAuth") _list path;
    trust_state_reason = option_of_yojson (value_for_key (trust_state_reason_of_yojson) "TrustStateReason") _list path;
    state_last_updated_date_time = option_of_yojson (value_for_key (state_last_updated_date_time_of_yojson) "StateLastUpdatedDateTime") _list path;
    last_updated_date_time = option_of_yojson (value_for_key (last_updated_date_time_of_yojson) "LastUpdatedDateTime") _list path;
    created_date_time = option_of_yojson (value_for_key (created_date_time_of_yojson) "CreatedDateTime") _list path;
    trust_state = option_of_yojson (value_for_key (trust_state_of_yojson) "TrustState") _list path;
    trust_direction = option_of_yojson (value_for_key (trust_direction_of_yojson) "TrustDirection") _list path;
    trust_type = option_of_yojson (value_for_key (trust_type_of_yojson) "TrustType") _list path;
    remote_domain_name = option_of_yojson (value_for_key (remote_domain_name_of_yojson) "RemoteDomainName") _list path;
    trust_id = option_of_yojson (value_for_key (trust_id_of_yojson) "TrustId") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let trusts_of_yojson = 
  fun tree path -> list_of_yojson trust_of_yojson tree path 

let trust_password_of_yojson = string_of_yojson

let trust_ids_of_yojson = 
  fun tree path -> list_of_yojson trust_id_of_yojson tree path 

let topic_status_of_yojson = 
  fun (tree: t) path : topic_status -> match tree with 
    | `String "Deleted" -> DELETED
    | `String "Failed" -> FAILED
    | `String "Topic not found" -> TOPIC_NOT_FOUND
    | `String "Registered" -> REGISTERED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TopicStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TopicStatus")

let topic_name_of_yojson = string_of_yojson

let topic_names_of_yojson = 
  fun tree path -> list_of_yojson topic_name_of_yojson tree path 

let topic_arn_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = value_for_key (tag_value_of_yojson) "Value" _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tags_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_limit_exceeded_exception_of_yojson = 
  fun tree path : tag_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_limit_exceeded_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let tag_keys_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let subscription_created_date_time_of_yojson = timestamp_of_yojson

let subnet_id_of_yojson = string_of_yojson

let subnet_ids_of_yojson = 
  fun tree path -> list_of_yojson subnet_id_of_yojson tree path 

let start_time_of_yojson = timestamp_of_yojson

let schema_extension_id_of_yojson = string_of_yojson

let start_schema_extension_result_of_yojson = 
  fun tree path : start_schema_extension_result ->
  let _list = assoc_of_yojson tree path in
  let _res : start_schema_extension_result = {
    schema_extension_id = option_of_yojson (value_for_key (schema_extension_id_of_yojson) "SchemaExtensionId") _list path;
    
  }
  in _res

let create_snapshot_before_schema_extension_of_yojson = bool_of_yojson

let ldif_content_of_yojson = string_of_yojson

let description_of_yojson = string_of_yojson

let start_schema_extension_request_of_yojson = 
  fun tree path : start_schema_extension_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_schema_extension_request = {
    description = value_for_key (description_of_yojson) "Description" _list path;
    ldif_content = value_for_key (ldif_content_of_yojson) "LdifContent" _list path;
    create_snapshot_before_schema_extension = value_for_key (create_snapshot_before_schema_extension_of_yojson) "CreateSnapshotBeforeSchemaExtension" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let stage_reason_of_yojson = string_of_yojson

let sso_enabled_of_yojson = bool_of_yojson

let snapshot_id_of_yojson = string_of_yojson

let snapshot_type_of_yojson = 
  fun (tree: t) path : snapshot_type -> match tree with 
    | `String "Manual" -> MANUAL
    | `String "Auto" -> AUTO
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotType" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotType")

let snapshot_name_of_yojson = string_of_yojson

let snapshot_status_of_yojson = 
  fun (tree: t) path : snapshot_status -> match tree with 
    | `String "Failed" -> FAILED
    | `String "Completed" -> COMPLETED
    | `String "Creating" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotStatus")

let snapshot_of_yojson = 
  fun tree path : snapshot ->
  let _list = assoc_of_yojson tree path in
  let _res : snapshot = {
    start_time = option_of_yojson (value_for_key (start_time_of_yojson) "StartTime") _list path;
    status = option_of_yojson (value_for_key (snapshot_status_of_yojson) "Status") _list path;
    name = option_of_yojson (value_for_key (snapshot_name_of_yojson) "Name") _list path;
    type_ = option_of_yojson (value_for_key (snapshot_type_of_yojson) "Type") _list path;
    snapshot_id = option_of_yojson (value_for_key (snapshot_id_of_yojson) "SnapshotId") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let snapshots_of_yojson = 
  fun tree path -> list_of_yojson snapshot_of_yojson tree path 

let limit_of_yojson = int_of_yojson

let manual_snapshots_limit_reached_of_yojson = bool_of_yojson

let snapshot_limits_of_yojson = 
  fun tree path : snapshot_limits ->
  let _list = assoc_of_yojson tree path in
  let _res : snapshot_limits = {
    manual_snapshots_limit_reached = option_of_yojson (value_for_key (manual_snapshots_limit_reached_of_yojson) "ManualSnapshotsLimitReached") _list path;
    manual_snapshots_current_count = option_of_yojson (value_for_key (limit_of_yojson) "ManualSnapshotsCurrentCount") _list path;
    manual_snapshots_limit = option_of_yojson (value_for_key (limit_of_yojson) "ManualSnapshotsLimit") _list path;
    
  }
  in _res

let snapshot_ids_of_yojson = 
  fun tree path -> list_of_yojson snapshot_id_of_yojson tree path 

let customer_id_of_yojson = string_of_yojson

let share_method_of_yojson = 
  fun (tree: t) path : share_method -> match tree with 
    | `String "HANDSHAKE" -> HANDSHAKE
    | `String "ORGANIZATIONS" -> ORGANIZATIONS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShareMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ShareMethod")

let share_status_of_yojson = 
  fun (tree: t) path : share_status -> match tree with 
    | `String "Deleting" -> DELETING
    | `String "Deleted" -> DELETED
    | `String "ShareFailed" -> SHARE_FAILED
    | `String "Sharing" -> SHARING
    | `String "RejectFailed" -> REJECT_FAILED
    | `String "Rejecting" -> REJECTING
    | `String "Rejected" -> REJECTED
    | `String "PendingAcceptance" -> PENDING_ACCEPTANCE
    | `String "Shared" -> SHARED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShareStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ShareStatus")

let notes_of_yojson = string_of_yojson

let shared_directory_of_yojson = 
  fun tree path : shared_directory ->
  let _list = assoc_of_yojson tree path in
  let _res : shared_directory = {
    last_updated_date_time = option_of_yojson (value_for_key (last_updated_date_time_of_yojson) "LastUpdatedDateTime") _list path;
    created_date_time = option_of_yojson (value_for_key (created_date_time_of_yojson) "CreatedDateTime") _list path;
    share_notes = option_of_yojson (value_for_key (notes_of_yojson) "ShareNotes") _list path;
    share_status = option_of_yojson (value_for_key (share_status_of_yojson) "ShareStatus") _list path;
    shared_directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "SharedDirectoryId") _list path;
    shared_account_id = option_of_yojson (value_for_key (customer_id_of_yojson) "SharedAccountId") _list path;
    share_method = option_of_yojson (value_for_key (share_method_of_yojson) "ShareMethod") _list path;
    owner_directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "OwnerDirectoryId") _list path;
    owner_account_id = option_of_yojson (value_for_key (customer_id_of_yojson) "OwnerAccountId") _list path;
    
  }
  in _res

let shared_directories_of_yojson = 
  fun tree path -> list_of_yojson shared_directory_of_yojson tree path 

let share_target_of_yojson = 
  fun tree path : share_target ->
  let _list = assoc_of_yojson tree path in
  let _res : share_target = {
    type_ = value_for_key (target_type_of_yojson) "Type" _list path;
    id = value_for_key (target_id_of_yojson) "Id" _list path;
    
  }
  in _res

let share_limit_exceeded_exception_of_yojson = 
  fun tree path : share_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : share_limit_exceeded_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let share_directory_result_of_yojson = 
  fun tree path : share_directory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : share_directory_result = {
    shared_directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "SharedDirectoryId") _list path;
    
  }
  in _res

let share_directory_request_of_yojson = 
  fun tree path : share_directory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : share_directory_request = {
    share_method = value_for_key (share_method_of_yojson) "ShareMethod" _list path;
    share_target = value_for_key (share_target_of_yojson) "ShareTarget" _list path;
    share_notes = option_of_yojson (value_for_key (notes_of_yojson) "ShareNotes") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let organizations_exception_of_yojson = 
  fun tree path : organizations_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : organizations_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let directory_already_shared_exception_of_yojson = 
  fun tree path : directory_already_shared_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_already_shared_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let directory_configuration_setting_type_of_yojson = string_of_yojson

let directory_configuration_setting_allowed_values_of_yojson = 
  string_of_yojson

let directory_configuration_status_of_yojson = 
  fun (tree: t) path : directory_configuration_status -> match tree with 
    | `String "Default" -> DEFAULT
    | `String "Failed" -> FAILED
    | `String "Updated" -> UPDATED
    | `String "Updating" -> UPDATING
    | `String "Requested" -> REQUESTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DirectoryConfigurationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryConfigurationStatus")

let directory_configuration_setting_request_detailed_status_of_yojson = 
  fun tree path -> map_of_yojson directory_configuration_status_of_yojson tree path

let directory_configuration_setting_request_status_message_of_yojson = 
  string_of_yojson

let directory_configuration_setting_last_updated_date_time_of_yojson = 
  timestamp_of_yojson

let directory_configuration_setting_last_requested_date_time_of_yojson = 
  timestamp_of_yojson

let directory_configuration_setting_data_type_of_yojson = string_of_yojson

let setting_entry_of_yojson = 
  fun tree path : setting_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : setting_entry = {
    data_type = option_of_yojson (value_for_key (directory_configuration_setting_data_type_of_yojson) "DataType") _list path;
    last_requested_date_time = option_of_yojson (value_for_key (directory_configuration_setting_last_requested_date_time_of_yojson) "LastRequestedDateTime") _list path;
    last_updated_date_time = option_of_yojson (value_for_key (directory_configuration_setting_last_updated_date_time_of_yojson) "LastUpdatedDateTime") _list path;
    request_status_message = option_of_yojson (value_for_key (directory_configuration_setting_request_status_message_of_yojson) "RequestStatusMessage") _list path;
    request_detailed_status = option_of_yojson (value_for_key (directory_configuration_setting_request_detailed_status_of_yojson) "RequestDetailedStatus") _list path;
    request_status = option_of_yojson (value_for_key (directory_configuration_status_of_yojson) "RequestStatus") _list path;
    requested_value = option_of_yojson (value_for_key (directory_configuration_setting_value_of_yojson) "RequestedValue") _list path;
    applied_value = option_of_yojson (value_for_key (directory_configuration_setting_value_of_yojson) "AppliedValue") _list path;
    allowed_values = option_of_yojson (value_for_key (directory_configuration_setting_allowed_values_of_yojson) "AllowedValues") _list path;
    name = option_of_yojson (value_for_key (directory_configuration_setting_name_of_yojson) "Name") _list path;
    type_ = option_of_yojson (value_for_key (directory_configuration_setting_type_of_yojson) "Type") _list path;
    
  }
  in _res

let setting_entries_of_yojson = 
  fun tree path -> list_of_yojson setting_entry_of_yojson tree path 

let security_group_id_of_yojson = string_of_yojson

let schema_extension_status_of_yojson = 
  fun (tree: t) path : schema_extension_status -> match tree with 
    | `String "Completed" -> COMPLETED
    | `String "Failed" -> FAILED
    | `String "Cancelled" -> CANCELLED
    | `String "RollbackInProgress" -> ROLLBACK_IN_PROGRESS
    | `String "CancelInProgress" -> CANCEL_IN_PROGRESS
    | `String "Replicating" -> REPLICATING
    | `String "UpdatingSchema" -> UPDATING_SCHEMA
    | `String "CreatingSnapshot" -> CREATING_SNAPSHOT
    | `String "Initializing" -> INITIALIZING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SchemaExtensionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SchemaExtensionStatus")

let schema_extension_status_reason_of_yojson = string_of_yojson

let end_date_time_of_yojson = timestamp_of_yojson

let schema_extension_info_of_yojson = 
  fun tree path : schema_extension_info ->
  let _list = assoc_of_yojson tree path in
  let _res : schema_extension_info = {
    end_date_time = option_of_yojson (value_for_key (end_date_time_of_yojson) "EndDateTime") _list path;
    start_date_time = option_of_yojson (value_for_key (start_date_time_of_yojson) "StartDateTime") _list path;
    schema_extension_status_reason = option_of_yojson (value_for_key (schema_extension_status_reason_of_yojson) "SchemaExtensionStatusReason") _list path;
    schema_extension_status = option_of_yojson (value_for_key (schema_extension_status_of_yojson) "SchemaExtensionStatus") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    schema_extension_id = option_of_yojson (value_for_key (schema_extension_id_of_yojson) "SchemaExtensionId") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let schema_extensions_info_of_yojson = 
  fun tree path -> list_of_yojson schema_extension_info_of_yojson tree path 

let si_d_of_yojson = string_of_yojson

let restore_from_snapshot_result_of_yojson = 
  fun tree path : restore_from_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : restore_from_snapshot_result = ()
  in _res

let restore_from_snapshot_request_of_yojson = 
  fun tree path : restore_from_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : restore_from_snapshot_request = {
    snapshot_id = value_for_key (snapshot_id_of_yojson) "SnapshotId" _list path;
    
  }
  in _res

let resource_id_of_yojson = string_of_yojson

let reset_user_password_result_of_yojson = 
  fun tree path : reset_user_password_result ->
  let _list = assoc_of_yojson tree path in
  let _res : reset_user_password_result = ()
  in _res

let customer_user_name_of_yojson = string_of_yojson

let reset_user_password_request_of_yojson = 
  fun tree path : reset_user_password_request ->
  let _list = assoc_of_yojson tree path in
  let _res : reset_user_password_request = {
    new_password = value_for_key (user_password_of_yojson) "NewPassword" _list path;
    user_name = value_for_key (customer_user_name_of_yojson) "UserName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let invalid_password_exception_of_yojson = 
  fun tree path : invalid_password_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_password_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let replication_scope_of_yojson = 
  fun (tree: t) path : replication_scope -> match tree with 
    | `String "Domain" -> Domain
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplicationScope" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicationScope")

let remove_tags_from_resource_result_of_yojson = 
  fun tree path : remove_tags_from_resource_result ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_tags_from_resource_result = ()
  in _res

let remove_tags_from_resource_request_of_yojson = 
  fun tree path : remove_tags_from_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_tags_from_resource_request = {
    tag_keys = value_for_key (tag_keys_of_yojson) "TagKeys" _list path;
    resource_id = value_for_key (resource_id_of_yojson) "ResourceId" _list path;
    
  }
  in _res

let remove_region_result_of_yojson = 
  fun tree path : remove_region_result ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_region_result = ()
  in _res

let remove_region_request_of_yojson = 
  fun tree path : remove_region_request ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_region_request = {
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let remove_ip_routes_result_of_yojson = 
  fun tree path : remove_ip_routes_result ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_ip_routes_result = ()
  in _res

let cidr_ip_of_yojson = string_of_yojson

let cidr_ips_of_yojson = 
  fun tree path -> list_of_yojson cidr_ip_of_yojson tree path 

let remove_ip_routes_request_of_yojson = 
  fun tree path : remove_ip_routes_request ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_ip_routes_request = {
    cidr_ips = value_for_key (cidr_ips_of_yojson) "CidrIps" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let remote_domain_names_of_yojson = 
  fun tree path -> list_of_yojson remote_domain_name_of_yojson tree path 

let reject_shared_directory_result_of_yojson = 
  fun tree path : reject_shared_directory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : reject_shared_directory_result = {
    shared_directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "SharedDirectoryId") _list path;
    
  }
  in _res

let reject_shared_directory_request_of_yojson = 
  fun tree path : reject_shared_directory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : reject_shared_directory_request = {
    shared_directory_id = value_for_key (directory_id_of_yojson) "SharedDirectoryId" _list path;
    
  }
  in _res

let register_event_topic_result_of_yojson = 
  fun tree path : register_event_topic_result ->
  let _list = assoc_of_yojson tree path in
  let _res : register_event_topic_result = ()
  in _res

let register_event_topic_request_of_yojson = 
  fun tree path : register_event_topic_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_event_topic_request = {
    topic_name = value_for_key (topic_name_of_yojson) "TopicName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let certificate_id_of_yojson = string_of_yojson

let register_certificate_result_of_yojson = 
  fun tree path : register_certificate_result ->
  let _list = assoc_of_yojson tree path in
  let _res : register_certificate_result = {
    certificate_id = option_of_yojson (value_for_key (certificate_id_of_yojson) "CertificateId") _list path;
    
  }
  in _res

let certificate_data_of_yojson = string_of_yojson

let certificate_type_of_yojson = 
  fun (tree: t) path : certificate_type -> match tree with 
    | `String "ClientLDAPS" -> CLIENT_LDAPS
    | `String "ClientCertAuth" -> CLIENT_CERT_AUTH
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateType" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateType")

let ocsp_url_of_yojson = string_of_yojson

let client_cert_auth_settings_of_yojson = 
  fun tree path : client_cert_auth_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : client_cert_auth_settings = {
    ocsp_url = option_of_yojson (value_for_key (ocsp_url_of_yojson) "OCSPUrl") _list path;
    
  }
  in _res

let register_certificate_request_of_yojson = 
  fun tree path : register_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_certificate_request = {
    client_cert_auth_settings = option_of_yojson (value_for_key (client_cert_auth_settings_of_yojson) "ClientCertAuthSettings") _list path;
    type_ = option_of_yojson (value_for_key (certificate_type_of_yojson) "Type") _list path;
    certificate_data = value_for_key (certificate_data_of_yojson) "CertificateData" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let invalid_certificate_exception_of_yojson = 
  fun tree path : invalid_certificate_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_certificate_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let certificate_limit_exceeded_exception_of_yojson = 
  fun tree path : certificate_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate_limit_exceeded_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let certificate_already_exists_exception_of_yojson = 
  fun tree path : certificate_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate_already_exists_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let additional_regions_of_yojson = 
  fun tree path -> list_of_yojson region_name_of_yojson tree path 

let regions_info_of_yojson = 
  fun tree path : regions_info ->
  let _list = assoc_of_yojson tree path in
  let _res : regions_info = {
    additional_regions = option_of_yojson (value_for_key (additional_regions_of_yojson) "AdditionalRegions") _list path;
    primary_region = option_of_yojson (value_for_key (region_name_of_yojson) "PrimaryRegion") _list path;
    
  }
  in _res

let region_type_of_yojson = 
  fun (tree: t) path : region_type -> match tree with 
    | `String "Additional" -> ADDITIONAL
    | `String "Primary" -> PRIMARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegionType" value)
    | _ -> raise (deserialize_wrong_type_error path "RegionType")

let directory_stage_of_yojson = 
  fun (tree: t) path : directory_stage -> match tree with 
    | `String "Failed" -> FAILED
    | `String "Deleted" -> DELETED
    | `String "Deleting" -> DELETING
    | `String "RestoreFailed" -> RESTOREFAILED
    | `String "Restoring" -> RESTORING
    | `String "Impaired" -> IMPAIRED
    | `String "Inoperable" -> INOPERABLE
    | `String "Active" -> ACTIVE
    | `String "Created" -> CREATED
    | `String "Creating" -> CREATING
    | `String "Requested" -> REQUESTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DirectoryStage" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryStage")

let directory_vpc_settings_of_yojson = 
  fun tree path : directory_vpc_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_vpc_settings = {
    subnet_ids = value_for_key (subnet_ids_of_yojson) "SubnetIds" _list path;
    vpc_id = value_for_key (vpc_id_of_yojson) "VpcId" _list path;
    
  }
  in _res

let launch_time_of_yojson = timestamp_of_yojson

let region_description_of_yojson = 
  fun tree path : region_description ->
  let _list = assoc_of_yojson tree path in
  let _res : region_description = {
    last_updated_date_time = option_of_yojson (value_for_key (last_updated_date_time_of_yojson) "LastUpdatedDateTime") _list path;
    status_last_updated_date_time = option_of_yojson (value_for_key (state_last_updated_date_time_of_yojson) "StatusLastUpdatedDateTime") _list path;
    launch_time = option_of_yojson (value_for_key (launch_time_of_yojson) "LaunchTime") _list path;
    desired_number_of_domain_controllers = option_of_yojson (value_for_key (desired_number_of_domain_controllers_of_yojson) "DesiredNumberOfDomainControllers") _list path;
    vpc_settings = option_of_yojson (value_for_key (directory_vpc_settings_of_yojson) "VpcSettings") _list path;
    status = option_of_yojson (value_for_key (directory_stage_of_yojson) "Status") _list path;
    region_type = option_of_yojson (value_for_key (region_type_of_yojson) "RegionType") _list path;
    region_name = option_of_yojson (value_for_key (region_name_of_yojson) "RegionName") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let regions_description_of_yojson = 
  fun tree path -> list_of_yojson region_description_of_yojson tree path 

let region_limit_exceeded_exception_of_yojson = 
  fun tree path : region_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : region_limit_exceeded_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let radius_status_of_yojson = 
  fun (tree: t) path : radius_status -> match tree with 
    | `String "Failed" -> FAILED
    | `String "Completed" -> COMPLETED
    | `String "Creating" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "RadiusStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RadiusStatus")

let password_of_yojson = string_of_yojson

let page_limit_of_yojson = int_of_yojson

let availability_zone_of_yojson = string_of_yojson

let availability_zones_of_yojson = 
  fun tree path -> list_of_yojson availability_zone_of_yojson tree path 

let directory_vpc_settings_description_of_yojson = 
  fun tree path : directory_vpc_settings_description ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_vpc_settings_description = {
    availability_zones = option_of_yojson (value_for_key (availability_zones_of_yojson) "AvailabilityZones") _list path;
    security_group_id = option_of_yojson (value_for_key (security_group_id_of_yojson) "SecurityGroupId") _list path;
    subnet_ids = option_of_yojson (value_for_key (subnet_ids_of_yojson) "SubnetIds") _list path;
    vpc_id = option_of_yojson (value_for_key (vpc_id_of_yojson) "VpcId") _list path;
    
  }
  in _res

let owner_directory_description_of_yojson = 
  fun tree path : owner_directory_description ->
  let _list = assoc_of_yojson tree path in
  let _res : owner_directory_description = {
    radius_status = option_of_yojson (value_for_key (radius_status_of_yojson) "RadiusStatus") _list path;
    radius_settings = option_of_yojson (value_for_key (radius_settings_of_yojson) "RadiusSettings") _list path;
    vpc_settings = option_of_yojson (value_for_key (directory_vpc_settings_description_of_yojson) "VpcSettings") _list path;
    dns_ip_addrs = option_of_yojson (value_for_key (dns_ip_addrs_of_yojson) "DnsIpAddrs") _list path;
    account_id = option_of_yojson (value_for_key (customer_id_of_yojson) "AccountId") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let organizational_unit_d_n_of_yojson = string_of_yojson

let no_available_certificate_exception_of_yojson = 
  fun tree path : no_available_certificate_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_available_certificate_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let next_token_of_yojson = string_of_yojson

let log_group_name_of_yojson = string_of_yojson

let log_subscription_of_yojson = 
  fun tree path : log_subscription ->
  let _list = assoc_of_yojson tree path in
  let _res : log_subscription = {
    subscription_created_date_time = option_of_yojson (value_for_key (subscription_created_date_time_of_yojson) "SubscriptionCreatedDateTime") _list path;
    log_group_name = option_of_yojson (value_for_key (log_group_name_of_yojson) "LogGroupName") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let log_subscriptions_of_yojson = 
  fun tree path -> list_of_yojson log_subscription_of_yojson tree path 

let list_tags_for_resource_result_of_yojson = 
  fun tree path : list_tags_for_resource_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    tags = option_of_yojson (value_for_key (tags_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    resource_id = value_for_key (resource_id_of_yojson) "ResourceId" _list path;
    
  }
  in _res

let invalid_next_token_exception_of_yojson = 
  fun tree path : invalid_next_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_next_token_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let list_schema_extensions_result_of_yojson = 
  fun tree path : list_schema_extensions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_schema_extensions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    schema_extensions_info = option_of_yojson (value_for_key (schema_extensions_info_of_yojson) "SchemaExtensionsInfo") _list path;
    
  }
  in _res

let list_schema_extensions_request_of_yojson = 
  fun tree path : list_schema_extensions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_schema_extensions_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let list_log_subscriptions_result_of_yojson = 
  fun tree path : list_log_subscriptions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_log_subscriptions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    log_subscriptions = option_of_yojson (value_for_key (log_subscriptions_of_yojson) "LogSubscriptions") _list path;
    
  }
  in _res

let list_log_subscriptions_request_of_yojson = 
  fun tree path : list_log_subscriptions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_log_subscriptions_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let ip_route_status_msg_of_yojson = 
  fun (tree: t) path : ip_route_status_msg -> match tree with 
    | `String "RemoveFailed" -> REMOVE_FAILED
    | `String "AddFailed" -> ADD_FAILED
    | `String "Removed" -> REMOVED
    | `String "Removing" -> REMOVING
    | `String "Added" -> ADDED
    | `String "Adding" -> ADDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpRouteStatusMsg" value)
    | _ -> raise (deserialize_wrong_type_error path "IpRouteStatusMsg")

let added_date_time_of_yojson = timestamp_of_yojson

let ip_route_status_reason_of_yojson = string_of_yojson

let ip_route_info_of_yojson = 
  fun tree path : ip_route_info ->
  let _list = assoc_of_yojson tree path in
  let _res : ip_route_info = {
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    ip_route_status_reason = option_of_yojson (value_for_key (ip_route_status_reason_of_yojson) "IpRouteStatusReason") _list path;
    added_date_time = option_of_yojson (value_for_key (added_date_time_of_yojson) "AddedDateTime") _list path;
    ip_route_status_msg = option_of_yojson (value_for_key (ip_route_status_msg_of_yojson) "IpRouteStatusMsg") _list path;
    cidr_ip = option_of_yojson (value_for_key (cidr_ip_of_yojson) "CidrIp") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let ip_routes_info_of_yojson = 
  fun tree path -> list_of_yojson ip_route_info_of_yojson tree path 

let list_ip_routes_result_of_yojson = 
  fun tree path : list_ip_routes_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ip_routes_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    ip_routes_info = option_of_yojson (value_for_key (ip_routes_info_of_yojson) "IpRoutesInfo") _list path;
    
  }
  in _res

let list_ip_routes_request_of_yojson = 
  fun tree path : list_ip_routes_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ip_routes_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let certificate_c_n_of_yojson = string_of_yojson

let certificate_state_of_yojson = 
  fun (tree: t) path : certificate_state -> match tree with 
    | `String "DeregisterFailed" -> DEREGISTER_FAILED
    | `String "Deregistered" -> DEREGISTERED
    | `String "Deregistering" -> DEREGISTERING
    | `String "RegisterFailed" -> REGISTER_FAILED
    | `String "Registered" -> REGISTERED
    | `String "Registering" -> REGISTERING
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateState" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateState")

let certificate_expiry_date_time_of_yojson = timestamp_of_yojson

let certificate_info_of_yojson = 
  fun tree path : certificate_info ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate_info = {
    type_ = option_of_yojson (value_for_key (certificate_type_of_yojson) "Type") _list path;
    expiry_date_time = option_of_yojson (value_for_key (certificate_expiry_date_time_of_yojson) "ExpiryDateTime") _list path;
    state = option_of_yojson (value_for_key (certificate_state_of_yojson) "State") _list path;
    common_name = option_of_yojson (value_for_key (certificate_c_n_of_yojson) "CommonName") _list path;
    certificate_id = option_of_yojson (value_for_key (certificate_id_of_yojson) "CertificateId") _list path;
    
  }
  in _res

let certificates_info_of_yojson = 
  fun tree path -> list_of_yojson certificate_info_of_yojson tree path 

let list_certificates_result_of_yojson = 
  fun tree path : list_certificates_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_certificates_result = {
    certificates_info = option_of_yojson (value_for_key (certificates_info_of_yojson) "CertificatesInfo") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let list_certificates_request_of_yojson = 
  fun tree path : list_certificates_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_certificates_request = {
    limit = option_of_yojson (value_for_key (page_limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let ldaps_type_of_yojson = 
  fun (tree: t) path : ldaps_type -> match tree with 
    | `String "Client" -> CLIENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "LDAPSType" value)
    | _ -> raise (deserialize_wrong_type_error path "LDAPSType")

let ldaps_status_reason_of_yojson = string_of_yojson

let ldaps_status_of_yojson = 
  fun (tree: t) path : ldaps_status -> match tree with 
    | `String "Disabled" -> DISABLED
    | `String "EnableFailed" -> ENABLE_FAILED
    | `String "Enabled" -> ENABLED
    | `String "Enabling" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "LDAPSStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LDAPSStatus")

let ldaps_setting_info_of_yojson = 
  fun tree path : ldaps_setting_info ->
  let _list = assoc_of_yojson tree path in
  let _res : ldaps_setting_info = {
    last_updated_date_time = option_of_yojson (value_for_key (last_updated_date_time_of_yojson) "LastUpdatedDateTime") _list path;
    ldaps_status_reason = option_of_yojson (value_for_key (ldaps_status_reason_of_yojson) "LDAPSStatusReason") _list path;
    ldaps_status = option_of_yojson (value_for_key (ldaps_status_of_yojson) "LDAPSStatus") _list path;
    
  }
  in _res

let ldaps_settings_info_of_yojson = 
  fun tree path -> list_of_yojson ldaps_setting_info_of_yojson tree path 

let ip_route_of_yojson = 
  fun tree path : ip_route ->
  let _list = assoc_of_yojson tree path in
  let _res : ip_route = {
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    cidr_ip = option_of_yojson (value_for_key (cidr_ip_of_yojson) "CidrIp") _list path;
    
  }
  in _res

let ip_routes_of_yojson = 
  fun tree path -> list_of_yojson ip_route_of_yojson tree path 

let ip_route_limit_exceeded_exception_of_yojson = 
  fun tree path : ip_route_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ip_route_limit_exceeded_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let ip_addrs_of_yojson = 
  fun tree path -> list_of_yojson ip_addr_of_yojson tree path 

let invalid_ldaps_status_exception_of_yojson = 
  fun tree path : invalid_ldaps_status_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_ldaps_status_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_client_auth_status_exception_of_yojson = 
  fun tree path : invalid_client_auth_status_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_client_auth_status_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let insufficient_permissions_exception_of_yojson = 
  fun tree path : insufficient_permissions_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : insufficient_permissions_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let get_snapshot_limits_result_of_yojson = 
  fun tree path : get_snapshot_limits_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_snapshot_limits_result = {
    snapshot_limits = option_of_yojson (value_for_key (snapshot_limits_of_yojson) "SnapshotLimits") _list path;
    
  }
  in _res

let get_snapshot_limits_request_of_yojson = 
  fun tree path : get_snapshot_limits_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_snapshot_limits_request = {
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let cloud_only_directories_limit_reached_of_yojson = bool_of_yojson

let connected_directories_limit_reached_of_yojson = bool_of_yojson

let directory_limits_of_yojson = 
  fun tree path : directory_limits ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_limits = {
    connected_directories_limit_reached = option_of_yojson (value_for_key (connected_directories_limit_reached_of_yojson) "ConnectedDirectoriesLimitReached") _list path;
    connected_directories_current_count = option_of_yojson (value_for_key (limit_of_yojson) "ConnectedDirectoriesCurrentCount") _list path;
    connected_directories_limit = option_of_yojson (value_for_key (limit_of_yojson) "ConnectedDirectoriesLimit") _list path;
    cloud_only_microsoft_ad_limit_reached = option_of_yojson (value_for_key (cloud_only_directories_limit_reached_of_yojson) "CloudOnlyMicrosoftADLimitReached") _list path;
    cloud_only_microsoft_ad_current_count = option_of_yojson (value_for_key (limit_of_yojson) "CloudOnlyMicrosoftADCurrentCount") _list path;
    cloud_only_microsoft_ad_limit = option_of_yojson (value_for_key (limit_of_yojson) "CloudOnlyMicrosoftADLimit") _list path;
    cloud_only_directories_limit_reached = option_of_yojson (value_for_key (cloud_only_directories_limit_reached_of_yojson) "CloudOnlyDirectoriesLimitReached") _list path;
    cloud_only_directories_current_count = option_of_yojson (value_for_key (limit_of_yojson) "CloudOnlyDirectoriesCurrentCount") _list path;
    cloud_only_directories_limit = option_of_yojson (value_for_key (limit_of_yojson) "CloudOnlyDirectoriesLimit") _list path;
    
  }
  in _res

let get_directory_limits_result_of_yojson = 
  fun tree path : get_directory_limits_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_directory_limits_result = {
    directory_limits = option_of_yojson (value_for_key (directory_limits_of_yojson) "DirectoryLimits") _list path;
    
  }
  in _res

let get_directory_limits_request_of_yojson = 
  fun tree path : get_directory_limits_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_directory_limits_request = ()
  in _res

let event_topic_of_yojson = 
  fun tree path : event_topic ->
  let _list = assoc_of_yojson tree path in
  let _res : event_topic = {
    status = option_of_yojson (value_for_key (topic_status_of_yojson) "Status") _list path;
    created_date_time = option_of_yojson (value_for_key (created_date_time_of_yojson) "CreatedDateTime") _list path;
    topic_arn = option_of_yojson (value_for_key (topic_arn_of_yojson) "TopicArn") _list path;
    topic_name = option_of_yojson (value_for_key (topic_name_of_yojson) "TopicName") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let event_topics_of_yojson = 
  fun tree path -> list_of_yojson event_topic_of_yojson tree path 

let entity_already_exists_exception_of_yojson = 
  fun tree path : entity_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : entity_already_exists_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let enable_sso_result_of_yojson = 
  fun tree path : enable_sso_result ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_sso_result = ()
  in _res

let connect_password_of_yojson = string_of_yojson

let enable_sso_request_of_yojson = 
  fun tree path : enable_sso_request ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_sso_request = {
    password = option_of_yojson (value_for_key (connect_password_of_yojson) "Password") _list path;
    user_name = option_of_yojson (value_for_key (user_name_of_yojson) "UserName") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let authentication_failed_exception_of_yojson = 
  fun tree path : authentication_failed_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : authentication_failed_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let enable_radius_result_of_yojson = 
  fun tree path : enable_radius_result ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_radius_result = ()
  in _res

let enable_radius_request_of_yojson = 
  fun tree path : enable_radius_request ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_radius_request = {
    radius_settings = value_for_key (radius_settings_of_yojson) "RadiusSettings" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let enable_ldaps_result_of_yojson = 
  fun tree path : enable_ldaps_result ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_ldaps_result = ()
  in _res

let enable_ldaps_request_of_yojson = 
  fun tree path : enable_ldaps_request ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_ldaps_request = {
    type_ = value_for_key (ldaps_type_of_yojson) "Type" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let enable_client_authentication_result_of_yojson = 
  fun tree path : enable_client_authentication_result ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_client_authentication_result = ()
  in _res

let client_authentication_type_of_yojson = 
  fun (tree: t) path : client_authentication_type -> match tree with 
    | `String "SmartCardOrPassword" -> SMART_CARD_OR_PASSWORD
    | `String "SmartCard" -> SMART_CARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClientAuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "ClientAuthenticationType")

let enable_client_authentication_request_of_yojson = 
  fun tree path : enable_client_authentication_request ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_client_authentication_request = {
    type_ = value_for_key (client_authentication_type_of_yojson) "Type" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let domain_controller_id_of_yojson = string_of_yojson

let domain_controller_status_of_yojson = 
  fun (tree: t) path : domain_controller_status -> match tree with 
    | `String "Failed" -> FAILED
    | `String "Deleted" -> DELETED
    | `String "Deleting" -> DELETING
    | `String "Restoring" -> RESTORING
    | `String "Impaired" -> IMPAIRED
    | `String "Active" -> ACTIVE
    | `String "Creating" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DomainControllerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainControllerStatus")

let domain_controller_status_reason_of_yojson = string_of_yojson

let domain_controller_of_yojson = 
  fun tree path : domain_controller ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_controller = {
    status_last_updated_date_time = option_of_yojson (value_for_key (last_updated_date_time_of_yojson) "StatusLastUpdatedDateTime") _list path;
    launch_time = option_of_yojson (value_for_key (launch_time_of_yojson) "LaunchTime") _list path;
    status_reason = option_of_yojson (value_for_key (domain_controller_status_reason_of_yojson) "StatusReason") _list path;
    status = option_of_yojson (value_for_key (domain_controller_status_of_yojson) "Status") _list path;
    availability_zone = option_of_yojson (value_for_key (availability_zone_of_yojson) "AvailabilityZone") _list path;
    subnet_id = option_of_yojson (value_for_key (subnet_id_of_yojson) "SubnetId") _list path;
    vpc_id = option_of_yojson (value_for_key (vpc_id_of_yojson) "VpcId") _list path;
    dns_ip_addr = option_of_yojson (value_for_key (ip_addr_of_yojson) "DnsIpAddr") _list path;
    domain_controller_id = option_of_yojson (value_for_key (domain_controller_id_of_yojson) "DomainControllerId") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let domain_controllers_of_yojson = 
  fun tree path -> list_of_yojson domain_controller_of_yojson tree path 

let domain_controller_ids_of_yojson = 
  fun tree path -> list_of_yojson domain_controller_id_of_yojson tree path 

let disable_sso_result_of_yojson = 
  fun tree path : disable_sso_result ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_sso_result = ()
  in _res

let disable_sso_request_of_yojson = 
  fun tree path : disable_sso_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_sso_request = {
    password = option_of_yojson (value_for_key (connect_password_of_yojson) "Password") _list path;
    user_name = option_of_yojson (value_for_key (user_name_of_yojson) "UserName") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let disable_radius_result_of_yojson = 
  fun tree path : disable_radius_result ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_radius_result = ()
  in _res

let disable_radius_request_of_yojson = 
  fun tree path : disable_radius_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_radius_request = {
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let disable_ldaps_result_of_yojson = 
  fun tree path : disable_ldaps_result ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_ldaps_result = ()
  in _res

let disable_ldaps_request_of_yojson = 
  fun tree path : disable_ldaps_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_ldaps_request = {
    type_ = value_for_key (ldaps_type_of_yojson) "Type" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let disable_client_authentication_result_of_yojson = 
  fun tree path : disable_client_authentication_result ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_client_authentication_result = ()
  in _res

let disable_client_authentication_request_of_yojson = 
  fun tree path : disable_client_authentication_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_client_authentication_request = {
    type_ = value_for_key (client_authentication_type_of_yojson) "Type" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let directory_type_of_yojson = 
  fun (tree: t) path : directory_type -> match tree with 
    | `String "SharedMicrosoftAD" -> SHARED_MICROSOFT_AD
    | `String "MicrosoftAD" -> MICROSOFT_AD
    | `String "ADConnector" -> AD_CONNECTOR
    | `String "SimpleAD" -> SIMPLE_AD
    | `String value -> raise (deserialize_unknown_enum_value_error path "DirectoryType" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryType")

let directory_size_of_yojson = 
  fun (tree: t) path : directory_size -> match tree with 
    | `String "Large" -> LARGE
    | `String "Small" -> SMALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "DirectorySize" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectorySize")

let directory_short_name_of_yojson = string_of_yojson

let describe_update_directory_result_of_yojson = 
  fun tree path : describe_update_directory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_update_directory_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    update_activities = option_of_yojson (value_for_key (update_activities_of_yojson) "UpdateActivities") _list path;
    
  }
  in _res

let describe_update_directory_request_of_yojson = 
  fun tree path : describe_update_directory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_update_directory_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    region_name = option_of_yojson (value_for_key (region_name_of_yojson) "RegionName") _list path;
    update_type = value_for_key (update_type_of_yojson) "UpdateType" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let describe_trusts_result_of_yojson = 
  fun tree path : describe_trusts_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_trusts_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    trusts = option_of_yojson (value_for_key (trusts_of_yojson) "Trusts") _list path;
    
  }
  in _res

let describe_trusts_request_of_yojson = 
  fun tree path : describe_trusts_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_trusts_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    trust_ids = option_of_yojson (value_for_key (trust_ids_of_yojson) "TrustIds") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let describe_snapshots_result_of_yojson = 
  fun tree path : describe_snapshots_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_snapshots_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    snapshots = option_of_yojson (value_for_key (snapshots_of_yojson) "Snapshots") _list path;
    
  }
  in _res

let describe_snapshots_request_of_yojson = 
  fun tree path : describe_snapshots_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_snapshots_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    snapshot_ids = option_of_yojson (value_for_key (snapshot_ids_of_yojson) "SnapshotIds") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let describe_shared_directories_result_of_yojson = 
  fun tree path : describe_shared_directories_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_shared_directories_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    shared_directories = option_of_yojson (value_for_key (shared_directories_of_yojson) "SharedDirectories") _list path;
    
  }
  in _res

let directory_ids_of_yojson = 
  fun tree path -> list_of_yojson directory_id_of_yojson tree path 

let describe_shared_directories_request_of_yojson = 
  fun tree path : describe_shared_directories_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_shared_directories_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    shared_directory_ids = option_of_yojson (value_for_key (directory_ids_of_yojson) "SharedDirectoryIds") _list path;
    owner_directory_id = value_for_key (directory_id_of_yojson) "OwnerDirectoryId" _list path;
    
  }
  in _res

let describe_settings_result_of_yojson = 
  fun tree path : describe_settings_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_settings_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    setting_entries = option_of_yojson (value_for_key (setting_entries_of_yojson) "SettingEntries") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let describe_settings_request_of_yojson = 
  fun tree path : describe_settings_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_settings_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    status = option_of_yojson (value_for_key (directory_configuration_status_of_yojson) "Status") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let describe_regions_result_of_yojson = 
  fun tree path : describe_regions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_regions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    regions_description = option_of_yojson (value_for_key (regions_description_of_yojson) "RegionsDescription") _list path;
    
  }
  in _res

let describe_regions_request_of_yojson = 
  fun tree path : describe_regions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_regions_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    region_name = option_of_yojson (value_for_key (region_name_of_yojson) "RegionName") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let describe_ldaps_settings_result_of_yojson = 
  fun tree path : describe_ldaps_settings_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_ldaps_settings_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    ldaps_settings_info = option_of_yojson (value_for_key (ldaps_settings_info_of_yojson) "LDAPSSettingsInfo") _list path;
    
  }
  in _res

let describe_ldaps_settings_request_of_yojson = 
  fun tree path : describe_ldaps_settings_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_ldaps_settings_request = {
    limit = option_of_yojson (value_for_key (page_limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    type_ = option_of_yojson (value_for_key (ldaps_type_of_yojson) "Type") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let describe_event_topics_result_of_yojson = 
  fun tree path : describe_event_topics_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_event_topics_result = {
    event_topics = option_of_yojson (value_for_key (event_topics_of_yojson) "EventTopics") _list path;
    
  }
  in _res

let describe_event_topics_request_of_yojson = 
  fun tree path : describe_event_topics_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_event_topics_request = {
    topic_names = option_of_yojson (value_for_key (topic_names_of_yojson) "TopicNames") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let describe_domain_controllers_result_of_yojson = 
  fun tree path : describe_domain_controllers_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_domain_controllers_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    domain_controllers = option_of_yojson (value_for_key (domain_controllers_of_yojson) "DomainControllers") _list path;
    
  }
  in _res

let describe_domain_controllers_request_of_yojson = 
  fun tree path : describe_domain_controllers_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_domain_controllers_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    domain_controller_ids = option_of_yojson (value_for_key (domain_controller_ids_of_yojson) "DomainControllerIds") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let directory_name_of_yojson = string_of_yojson

let directory_edition_of_yojson = 
  fun (tree: t) path : directory_edition -> match tree with 
    | `String "Standard" -> STANDARD
    | `String "Enterprise" -> ENTERPRISE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DirectoryEdition" value)
    | _ -> raise (deserialize_wrong_type_error path "DirectoryEdition")

let alias_name_of_yojson = string_of_yojson

let access_url_of_yojson = string_of_yojson

let directory_connect_settings_description_of_yojson = 
  fun tree path : directory_connect_settings_description ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_connect_settings_description = {
    connect_ips = option_of_yojson (value_for_key (ip_addrs_of_yojson) "ConnectIps") _list path;
    availability_zones = option_of_yojson (value_for_key (availability_zones_of_yojson) "AvailabilityZones") _list path;
    security_group_id = option_of_yojson (value_for_key (security_group_id_of_yojson) "SecurityGroupId") _list path;
    customer_user_name = option_of_yojson (value_for_key (user_name_of_yojson) "CustomerUserName") _list path;
    subnet_ids = option_of_yojson (value_for_key (subnet_ids_of_yojson) "SubnetIds") _list path;
    vpc_id = option_of_yojson (value_for_key (vpc_id_of_yojson) "VpcId") _list path;
    
  }
  in _res

let directory_description_of_yojson = 
  fun tree path : directory_description ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_description = {
    os_version = option_of_yojson (value_for_key (os_version_of_yojson) "OsVersion") _list path;
    regions_info = option_of_yojson (value_for_key (regions_info_of_yojson) "RegionsInfo") _list path;
    owner_directory_description = option_of_yojson (value_for_key (owner_directory_description_of_yojson) "OwnerDirectoryDescription") _list path;
    desired_number_of_domain_controllers = option_of_yojson (value_for_key (desired_number_of_domain_controllers_of_yojson) "DesiredNumberOfDomainControllers") _list path;
    sso_enabled = option_of_yojson (value_for_key (sso_enabled_of_yojson) "SsoEnabled") _list path;
    stage_reason = option_of_yojson (value_for_key (stage_reason_of_yojson) "StageReason") _list path;
    radius_status = option_of_yojson (value_for_key (radius_status_of_yojson) "RadiusStatus") _list path;
    radius_settings = option_of_yojson (value_for_key (radius_settings_of_yojson) "RadiusSettings") _list path;
    connect_settings = option_of_yojson (value_for_key (directory_connect_settings_description_of_yojson) "ConnectSettings") _list path;
    vpc_settings = option_of_yojson (value_for_key (directory_vpc_settings_description_of_yojson) "VpcSettings") _list path;
    type_ = option_of_yojson (value_for_key (directory_type_of_yojson) "Type") _list path;
    stage_last_updated_date_time = option_of_yojson (value_for_key (last_updated_date_time_of_yojson) "StageLastUpdatedDateTime") _list path;
    launch_time = option_of_yojson (value_for_key (launch_time_of_yojson) "LaunchTime") _list path;
    share_notes = option_of_yojson (value_for_key (notes_of_yojson) "ShareNotes") _list path;
    share_method = option_of_yojson (value_for_key (share_method_of_yojson) "ShareMethod") _list path;
    share_status = option_of_yojson (value_for_key (share_status_of_yojson) "ShareStatus") _list path;
    stage = option_of_yojson (value_for_key (directory_stage_of_yojson) "Stage") _list path;
    dns_ip_addrs = option_of_yojson (value_for_key (dns_ip_addrs_of_yojson) "DnsIpAddrs") _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    access_url = option_of_yojson (value_for_key (access_url_of_yojson) "AccessUrl") _list path;
    alias = option_of_yojson (value_for_key (alias_name_of_yojson) "Alias") _list path;
    edition = option_of_yojson (value_for_key (directory_edition_of_yojson) "Edition") _list path;
    size = option_of_yojson (value_for_key (directory_size_of_yojson) "Size") _list path;
    short_name = option_of_yojson (value_for_key (directory_short_name_of_yojson) "ShortName") _list path;
    name = option_of_yojson (value_for_key (directory_name_of_yojson) "Name") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let directory_descriptions_of_yojson = 
  fun tree path -> list_of_yojson directory_description_of_yojson tree path 

let describe_directories_result_of_yojson = 
  fun tree path : describe_directories_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_directories_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    directory_descriptions = option_of_yojson (value_for_key (directory_descriptions_of_yojson) "DirectoryDescriptions") _list path;
    
  }
  in _res

let describe_directories_request_of_yojson = 
  fun tree path : describe_directories_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_directories_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    directory_ids = option_of_yojson (value_for_key (directory_ids_of_yojson) "DirectoryIds") _list path;
    
  }
  in _res

let conditional_forwarder_of_yojson = 
  fun tree path : conditional_forwarder ->
  let _list = assoc_of_yojson tree path in
  let _res : conditional_forwarder = {
    replication_scope = option_of_yojson (value_for_key (replication_scope_of_yojson) "ReplicationScope") _list path;
    dns_ip_addrs = option_of_yojson (value_for_key (dns_ip_addrs_of_yojson) "DnsIpAddrs") _list path;
    remote_domain_name = option_of_yojson (value_for_key (remote_domain_name_of_yojson) "RemoteDomainName") _list path;
    
  }
  in _res

let conditional_forwarders_of_yojson = 
  fun tree path -> list_of_yojson conditional_forwarder_of_yojson tree path 

let describe_conditional_forwarders_result_of_yojson = 
  fun tree path : describe_conditional_forwarders_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_conditional_forwarders_result = {
    conditional_forwarders = option_of_yojson (value_for_key (conditional_forwarders_of_yojson) "ConditionalForwarders") _list path;
    
  }
  in _res

let describe_conditional_forwarders_request_of_yojson = 
  fun tree path : describe_conditional_forwarders_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_conditional_forwarders_request = {
    remote_domain_names = option_of_yojson (value_for_key (remote_domain_names_of_yojson) "RemoteDomainNames") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let client_authentication_status_of_yojson = 
  fun (tree: t) path : client_authentication_status -> match tree with 
    | `String "Disabled" -> DISABLED
    | `String "Enabled" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClientAuthenticationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ClientAuthenticationStatus")

let client_authentication_setting_info_of_yojson = 
  fun tree path : client_authentication_setting_info ->
  let _list = assoc_of_yojson tree path in
  let _res : client_authentication_setting_info = {
    last_updated_date_time = option_of_yojson (value_for_key (last_updated_date_time_of_yojson) "LastUpdatedDateTime") _list path;
    status = option_of_yojson (value_for_key (client_authentication_status_of_yojson) "Status") _list path;
    type_ = option_of_yojson (value_for_key (client_authentication_type_of_yojson) "Type") _list path;
    
  }
  in _res

let client_authentication_settings_info_of_yojson = 
  fun tree path -> list_of_yojson client_authentication_setting_info_of_yojson tree path 

let describe_client_authentication_settings_result_of_yojson = 
  fun tree path : describe_client_authentication_settings_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_client_authentication_settings_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    client_authentication_settings_info = option_of_yojson (value_for_key (client_authentication_settings_info_of_yojson) "ClientAuthenticationSettingsInfo") _list path;
    
  }
  in _res

let describe_client_authentication_settings_request_of_yojson = 
  fun tree path : describe_client_authentication_settings_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_client_authentication_settings_request = {
    limit = option_of_yojson (value_for_key (page_limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    type_ = option_of_yojson (value_for_key (client_authentication_type_of_yojson) "Type") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let certificate_does_not_exist_exception_of_yojson = 
  fun tree path : certificate_does_not_exist_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate_does_not_exist_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let certificate_state_reason_of_yojson = string_of_yojson

let certificate_registered_date_time_of_yojson = timestamp_of_yojson

let certificate_of_yojson = 
  fun tree path : certificate ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate = {
    client_cert_auth_settings = option_of_yojson (value_for_key (client_cert_auth_settings_of_yojson) "ClientCertAuthSettings") _list path;
    type_ = option_of_yojson (value_for_key (certificate_type_of_yojson) "Type") _list path;
    expiry_date_time = option_of_yojson (value_for_key (certificate_expiry_date_time_of_yojson) "ExpiryDateTime") _list path;
    registered_date_time = option_of_yojson (value_for_key (certificate_registered_date_time_of_yojson) "RegisteredDateTime") _list path;
    common_name = option_of_yojson (value_for_key (certificate_c_n_of_yojson) "CommonName") _list path;
    state_reason = option_of_yojson (value_for_key (certificate_state_reason_of_yojson) "StateReason") _list path;
    state = option_of_yojson (value_for_key (certificate_state_of_yojson) "State") _list path;
    certificate_id = option_of_yojson (value_for_key (certificate_id_of_yojson) "CertificateId") _list path;
    
  }
  in _res

let describe_certificate_result_of_yojson = 
  fun tree path : describe_certificate_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_certificate_result = {
    certificate = option_of_yojson (value_for_key (certificate_of_yojson) "Certificate") _list path;
    
  }
  in _res

let describe_certificate_request_of_yojson = 
  fun tree path : describe_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_certificate_request = {
    certificate_id = value_for_key (certificate_id_of_yojson) "CertificateId" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let deregister_event_topic_result_of_yojson = 
  fun tree path : deregister_event_topic_result ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_event_topic_result = ()
  in _res

let deregister_event_topic_request_of_yojson = 
  fun tree path : deregister_event_topic_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_event_topic_request = {
    topic_name = value_for_key (topic_name_of_yojson) "TopicName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let certificate_in_use_exception_of_yojson = 
  fun tree path : certificate_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate_in_use_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let deregister_certificate_result_of_yojson = 
  fun tree path : deregister_certificate_result ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_certificate_result = ()
  in _res

let deregister_certificate_request_of_yojson = 
  fun tree path : deregister_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_certificate_request = {
    certificate_id = value_for_key (certificate_id_of_yojson) "CertificateId" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let delete_trust_result_of_yojson = 
  fun tree path : delete_trust_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_trust_result = {
    trust_id = option_of_yojson (value_for_key (trust_id_of_yojson) "TrustId") _list path;
    
  }
  in _res

let delete_associated_conditional_forwarder_of_yojson = bool_of_yojson

let delete_trust_request_of_yojson = 
  fun tree path : delete_trust_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_trust_request = {
    delete_associated_conditional_forwarder = option_of_yojson (value_for_key (delete_associated_conditional_forwarder_of_yojson) "DeleteAssociatedConditionalForwarder") _list path;
    trust_id = value_for_key (trust_id_of_yojson) "TrustId" _list path;
    
  }
  in _res

let delete_snapshot_result_of_yojson = 
  fun tree path : delete_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_snapshot_result = {
    snapshot_id = option_of_yojson (value_for_key (snapshot_id_of_yojson) "SnapshotId") _list path;
    
  }
  in _res

let delete_snapshot_request_of_yojson = 
  fun tree path : delete_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_snapshot_request = {
    snapshot_id = value_for_key (snapshot_id_of_yojson) "SnapshotId" _list path;
    
  }
  in _res

let delete_log_subscription_result_of_yojson = 
  fun tree path : delete_log_subscription_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_log_subscription_result = ()
  in _res

let delete_log_subscription_request_of_yojson = 
  fun tree path : delete_log_subscription_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_log_subscription_request = {
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let delete_directory_result_of_yojson = 
  fun tree path : delete_directory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_directory_result = {
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let delete_directory_request_of_yojson = 
  fun tree path : delete_directory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_directory_request = {
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let delete_conditional_forwarder_result_of_yojson = 
  fun tree path : delete_conditional_forwarder_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_conditional_forwarder_result = ()
  in _res

let delete_conditional_forwarder_request_of_yojson = 
  fun tree path : delete_conditional_forwarder_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_conditional_forwarder_request = {
    remote_domain_name = value_for_key (remote_domain_name_of_yojson) "RemoteDomainName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let create_trust_result_of_yojson = 
  fun tree path : create_trust_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_trust_result = {
    trust_id = option_of_yojson (value_for_key (trust_id_of_yojson) "TrustId") _list path;
    
  }
  in _res

let create_trust_request_of_yojson = 
  fun tree path : create_trust_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_trust_request = {
    selective_auth = option_of_yojson (value_for_key (selective_auth_of_yojson) "SelectiveAuth") _list path;
    conditional_forwarder_ip_addrs = option_of_yojson (value_for_key (dns_ip_addrs_of_yojson) "ConditionalForwarderIpAddrs") _list path;
    trust_type = option_of_yojson (value_for_key (trust_type_of_yojson) "TrustType") _list path;
    trust_direction = value_for_key (trust_direction_of_yojson) "TrustDirection" _list path;
    trust_password = value_for_key (trust_password_of_yojson) "TrustPassword" _list path;
    remote_domain_name = value_for_key (remote_domain_name_of_yojson) "RemoteDomainName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let create_snapshot_result_of_yojson = 
  fun tree path : create_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_snapshot_result = {
    snapshot_id = option_of_yojson (value_for_key (snapshot_id_of_yojson) "SnapshotId") _list path;
    
  }
  in _res

let create_snapshot_request_of_yojson = 
  fun tree path : create_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_snapshot_request = {
    name = option_of_yojson (value_for_key (snapshot_name_of_yojson) "Name") _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let directory_limit_exceeded_exception_of_yojson = 
  fun tree path : directory_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_limit_exceeded_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let create_microsoft_ad_result_of_yojson = 
  fun tree path : create_microsoft_ad_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_microsoft_ad_result = {
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let create_microsoft_ad_request_of_yojson = 
  fun tree path : create_microsoft_ad_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_microsoft_ad_request = {
    tags = option_of_yojson (value_for_key (tags_of_yojson) "Tags") _list path;
    edition = option_of_yojson (value_for_key (directory_edition_of_yojson) "Edition") _list path;
    vpc_settings = value_for_key (directory_vpc_settings_of_yojson) "VpcSettings" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    password = value_for_key (password_of_yojson) "Password" _list path;
    short_name = option_of_yojson (value_for_key (directory_short_name_of_yojson) "ShortName") _list path;
    name = value_for_key (directory_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_log_subscription_result_of_yojson = 
  fun tree path : create_log_subscription_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_log_subscription_result = ()
  in _res

let create_log_subscription_request_of_yojson = 
  fun tree path : create_log_subscription_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_log_subscription_request = {
    log_group_name = value_for_key (log_group_name_of_yojson) "LogGroupName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let create_directory_result_of_yojson = 
  fun tree path : create_directory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_directory_result = {
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let create_directory_request_of_yojson = 
  fun tree path : create_directory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_directory_request = {
    tags = option_of_yojson (value_for_key (tags_of_yojson) "Tags") _list path;
    vpc_settings = option_of_yojson (value_for_key (directory_vpc_settings_of_yojson) "VpcSettings") _list path;
    size = value_for_key (directory_size_of_yojson) "Size" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    password = value_for_key (password_of_yojson) "Password" _list path;
    short_name = option_of_yojson (value_for_key (directory_short_name_of_yojson) "ShortName") _list path;
    name = value_for_key (directory_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_conditional_forwarder_result_of_yojson = 
  fun tree path : create_conditional_forwarder_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_conditional_forwarder_result = ()
  in _res

let create_conditional_forwarder_request_of_yojson = 
  fun tree path : create_conditional_forwarder_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_conditional_forwarder_request = {
    dns_ip_addrs = value_for_key (dns_ip_addrs_of_yojson) "DnsIpAddrs" _list path;
    remote_domain_name = value_for_key (remote_domain_name_of_yojson) "RemoteDomainName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let computer_name_of_yojson = string_of_yojson

let attribute_name_of_yojson = string_of_yojson

let attribute_value_of_yojson = string_of_yojson

let attribute_of_yojson = 
  fun tree path : attribute ->
  let _list = assoc_of_yojson tree path in
  let _res : attribute = {
    value = option_of_yojson (value_for_key (attribute_value_of_yojson) "Value") _list path;
    name = option_of_yojson (value_for_key (attribute_name_of_yojson) "Name") _list path;
    
  }
  in _res

let attributes_of_yojson = 
  fun tree path -> list_of_yojson attribute_of_yojson tree path 

let computer_of_yojson = 
  fun tree path : computer ->
  let _list = assoc_of_yojson tree path in
  let _res : computer = {
    computer_attributes = option_of_yojson (value_for_key (attributes_of_yojson) "ComputerAttributes") _list path;
    computer_name = option_of_yojson (value_for_key (computer_name_of_yojson) "ComputerName") _list path;
    computer_id = option_of_yojson (value_for_key (si_d_of_yojson) "ComputerId") _list path;
    
  }
  in _res

let create_computer_result_of_yojson = 
  fun tree path : create_computer_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_computer_result = {
    computer = option_of_yojson (value_for_key (computer_of_yojson) "Computer") _list path;
    
  }
  in _res

let computer_password_of_yojson = string_of_yojson

let create_computer_request_of_yojson = 
  fun tree path : create_computer_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_computer_request = {
    computer_attributes = option_of_yojson (value_for_key (attributes_of_yojson) "ComputerAttributes") _list path;
    organizational_unit_distinguished_name = option_of_yojson (value_for_key (organizational_unit_d_n_of_yojson) "OrganizationalUnitDistinguishedName") _list path;
    password = value_for_key (computer_password_of_yojson) "Password" _list path;
    computer_name = value_for_key (computer_name_of_yojson) "ComputerName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let create_alias_result_of_yojson = 
  fun tree path : create_alias_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_alias_result = {
    alias = option_of_yojson (value_for_key (alias_name_of_yojson) "Alias") _list path;
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let create_alias_request_of_yojson = 
  fun tree path : create_alias_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_alias_request = {
    alias = value_for_key (alias_name_of_yojson) "Alias" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let connect_directory_result_of_yojson = 
  fun tree path : connect_directory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : connect_directory_result = {
    directory_id = option_of_yojson (value_for_key (directory_id_of_yojson) "DirectoryId") _list path;
    
  }
  in _res

let directory_connect_settings_of_yojson = 
  fun tree path : directory_connect_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_connect_settings = {
    customer_user_name = value_for_key (user_name_of_yojson) "CustomerUserName" _list path;
    customer_dns_ips = value_for_key (dns_ip_addrs_of_yojson) "CustomerDnsIps" _list path;
    subnet_ids = value_for_key (subnet_ids_of_yojson) "SubnetIds" _list path;
    vpc_id = value_for_key (vpc_id_of_yojson) "VpcId" _list path;
    
  }
  in _res

let connect_directory_request_of_yojson = 
  fun tree path : connect_directory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : connect_directory_request = {
    tags = option_of_yojson (value_for_key (tags_of_yojson) "Tags") _list path;
    connect_settings = value_for_key (directory_connect_settings_of_yojson) "ConnectSettings" _list path;
    size = value_for_key (directory_size_of_yojson) "Size" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "Description") _list path;
    password = value_for_key (connect_password_of_yojson) "Password" _list path;
    short_name = option_of_yojson (value_for_key (directory_short_name_of_yojson) "ShortName") _list path;
    name = value_for_key (directory_name_of_yojson) "Name" _list path;
    
  }
  in _res

let cancel_schema_extension_result_of_yojson = 
  fun tree path : cancel_schema_extension_result ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_schema_extension_result = ()
  in _res

let cancel_schema_extension_request_of_yojson = 
  fun tree path : cancel_schema_extension_request ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_schema_extension_request = {
    schema_extension_id = value_for_key (schema_extension_id_of_yojson) "SchemaExtensionId" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let add_tags_to_resource_result_of_yojson = 
  fun tree path : add_tags_to_resource_result ->
  let _list = assoc_of_yojson tree path in
  let _res : add_tags_to_resource_result = ()
  in _res

let add_tags_to_resource_request_of_yojson = 
  fun tree path : add_tags_to_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_tags_to_resource_request = {
    tags = value_for_key (tags_of_yojson) "Tags" _list path;
    resource_id = value_for_key (resource_id_of_yojson) "ResourceId" _list path;
    
  }
  in _res

let directory_already_in_region_exception_of_yojson = 
  fun tree path : directory_already_in_region_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : directory_already_in_region_exception = {
    request_id = option_of_yojson (value_for_key (request_id_of_yojson) "RequestId") _list path;
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "Message") _list path;
    
  }
  in _res

let add_region_result_of_yojson = 
  fun tree path : add_region_result ->
  let _list = assoc_of_yojson tree path in
  let _res : add_region_result = ()
  in _res

let add_region_request_of_yojson = 
  fun tree path : add_region_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_region_request = {
    vpc_settings = value_for_key (directory_vpc_settings_of_yojson) "VPCSettings" _list path;
    region_name = value_for_key (region_name_of_yojson) "RegionName" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let add_ip_routes_result_of_yojson = 
  fun tree path : add_ip_routes_result ->
  let _list = assoc_of_yojson tree path in
  let _res : add_ip_routes_result = ()
  in _res

let add_ip_routes_request_of_yojson = 
  fun tree path : add_ip_routes_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_ip_routes_request = {
    update_security_group_for_directory_controllers = option_of_yojson (value_for_key (update_security_group_for_directory_controllers_of_yojson) "UpdateSecurityGroupForDirectoryControllers") _list path;
    ip_routes = value_for_key (ip_routes_of_yojson) "IpRoutes" _list path;
    directory_id = value_for_key (directory_id_of_yojson) "DirectoryId" _list path;
    
  }
  in _res

let accept_shared_directory_result_of_yojson = 
  fun tree path : accept_shared_directory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : accept_shared_directory_result = {
    shared_directory = option_of_yojson (value_for_key (shared_directory_of_yojson) "SharedDirectory") _list path;
    
  }
  in _res

let accept_shared_directory_request_of_yojson = 
  fun tree path : accept_shared_directory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : accept_shared_directory_request = {
    shared_directory_id = value_for_key (directory_id_of_yojson) "SharedDirectoryId" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

