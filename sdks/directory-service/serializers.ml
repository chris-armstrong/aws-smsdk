open Smaws_Lib.Json.SerializeHelpers

open Types

let vpc_id_to_yojson = string_to_yojson

let trust_id_to_yojson = string_to_yojson

let verify_trust_result_to_yojson = 
  fun (x: verify_trust_result) -> assoc_to_yojson(
    [(
         "TrustId",
         (option_to_yojson trust_id_to_yojson x.trust_id));
       
  ])

let verify_trust_request_to_yojson = 
  fun (x: verify_trust_request) -> assoc_to_yojson(
    [(
         "TrustId",
         (Some (trust_id_to_yojson x.trust_id)));
       
  ])

let exception_message_to_yojson = string_to_yojson

let request_id_to_yojson = string_to_yojson

let unsupported_operation_exception_to_yojson = 
  fun (x: unsupported_operation_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let service_exception_to_yojson = 
  fun (x: service_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_parameter_exception_to_yojson = 
  fun (x: invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let entity_does_not_exist_exception_to_yojson = 
  fun (x: entity_does_not_exist_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let client_exception_to_yojson = 
  fun (x: client_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let user_password_to_yojson = string_to_yojson

let user_name_to_yojson = string_to_yojson

let user_does_not_exist_exception_to_yojson = 
  fun (x: user_does_not_exist_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let use_same_username_to_yojson = bool_to_yojson

let base_unit_to_yojson = unit_to_yojson

let os_version_to_yojson = 
  fun (x: os_version) -> match x with 
 
| VERSION_2019 -> `String "SERVER_2019"
  | VERSION_2012 -> `String "SERVER_2012"
   

let os_update_settings_to_yojson = 
  fun (x: os_update_settings) -> assoc_to_yojson(
    [(
         "OSVersion",
         (option_to_yojson os_version_to_yojson x.os_version));
       
  ])

let update_value_to_yojson = 
  fun (x: update_value) -> assoc_to_yojson(
    [(
         "OSUpdateSettings",
         (option_to_yojson os_update_settings_to_yojson x.os_update_settings));
       
  ])

let update_type_to_yojson = 
  fun (x: update_type) -> match x with 
  | OS -> `String "OS"
     

let update_trust_result_to_yojson = 
  fun (x: update_trust_result) -> assoc_to_yojson(
    [(
         "TrustId",
         (option_to_yojson trust_id_to_yojson x.trust_id));
       (
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       
  ])

let selective_auth_to_yojson = 
  fun (x: selective_auth) -> match x with 
  | DISABLED -> `String "Disabled"
    | ENABLED -> `String "Enabled"
     

let update_trust_request_to_yojson = 
  fun (x: update_trust_request) -> assoc_to_yojson(
    [(
         "SelectiveAuth",
         (option_to_yojson selective_auth_to_yojson x.selective_auth));
       (
         "TrustId",
         (Some (trust_id_to_yojson x.trust_id)));
       
  ])

let update_status_reason_to_yojson = string_to_yojson

let update_status_to_yojson = 
  fun (x: update_status) -> match x with 
 
| UPDATE_FAILED -> `String "UpdateFailed"
  | UPDATING -> `String "Updating"
  | UPDATED -> `String "Updated"
   

let directory_id_to_yojson = string_to_yojson

let update_settings_result_to_yojson = 
  fun (x: update_settings_result) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let directory_configuration_setting_name_to_yojson = string_to_yojson

let directory_configuration_setting_value_to_yojson = string_to_yojson

let setting_to_yojson = 
  fun (x: setting) -> assoc_to_yojson(
    [(
         "Value",
         (Some (directory_configuration_setting_value_to_yojson x.value)));
       (
         "Name",
         (Some (directory_configuration_setting_name_to_yojson x.name)));
       
  ])

let settings_to_yojson = fun tree -> list_to_yojson setting_to_yojson tree

let update_settings_request_to_yojson = 
  fun (x: update_settings_request) -> assoc_to_yojson(
    [(
         "Settings",
         (Some (settings_to_yojson x.settings)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let unsupported_settings_exception_to_yojson = 
  fun (x: unsupported_settings_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let incompatible_settings_exception_to_yojson = 
  fun (x: incompatible_settings_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let directory_unavailable_exception_to_yojson = 
  fun (x: directory_unavailable_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let directory_does_not_exist_exception_to_yojson = 
  fun (x: directory_does_not_exist_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let update_security_group_for_directory_controllers_to_yojson = 
  bool_to_yojson

let update_radius_result_to_yojson = 
  fun (x: update_radius_result) -> assoc_to_yojson(
    [
  ])

let server_to_yojson = string_to_yojson

let servers_to_yojson = fun tree -> list_to_yojson server_to_yojson tree

let port_number_to_yojson = int_to_yojson

let radius_timeout_to_yojson = int_to_yojson

let radius_retries_to_yojson = int_to_yojson

let radius_shared_secret_to_yojson = string_to_yojson

let radius_authentication_protocol_to_yojson = 
  fun (x: radius_authentication_protocol) -> match x with 
 
| MSCHAPV2 -> `String "MS-CHAPv2"
  | MSCHAPV1 -> `String "MS-CHAPv1"
  | CHAP -> `String "CHAP"
  | PAP -> `String "PAP"
   

let radius_display_label_to_yojson = string_to_yojson

let radius_settings_to_yojson = 
  fun (x: radius_settings) -> assoc_to_yojson(
    [(
         "UseSameUsername",
         (option_to_yojson use_same_username_to_yojson x.use_same_username));
       (
         "DisplayLabel",
         (option_to_yojson radius_display_label_to_yojson x.display_label));
       (
         "AuthenticationProtocol",
         (option_to_yojson radius_authentication_protocol_to_yojson x.authentication_protocol));
       (
         "SharedSecret",
         (option_to_yojson radius_shared_secret_to_yojson x.shared_secret));
       (
         "RadiusRetries",
         (option_to_yojson radius_retries_to_yojson x.radius_retries));
       (
         "RadiusTimeout",
         (option_to_yojson radius_timeout_to_yojson x.radius_timeout));
       (
         "RadiusPort",
         (option_to_yojson port_number_to_yojson x.radius_port));
       (
         "RadiusServers",
         (option_to_yojson servers_to_yojson x.radius_servers));
       
  ])

let update_radius_request_to_yojson = 
  fun (x: update_radius_request) -> assoc_to_yojson(
    [(
         "RadiusSettings",
         (Some (radius_settings_to_yojson x.radius_settings)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let update_number_of_domain_controllers_result_to_yojson = 
  fun (x: update_number_of_domain_controllers_result) -> assoc_to_yojson(
    [
  ])

let desired_number_of_domain_controllers_to_yojson = int_to_yojson

let update_number_of_domain_controllers_request_to_yojson = 
  fun (x: update_number_of_domain_controllers_request) -> assoc_to_yojson(
    [(
         "DesiredNumber",
         (Some (desired_number_of_domain_controllers_to_yojson x.desired_number)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let domain_controller_limit_exceeded_exception_to_yojson = 
  fun (x: domain_controller_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let region_name_to_yojson = string_to_yojson

let initiated_by_to_yojson = string_to_yojson

let start_date_time_to_yojson = timestamp_to_yojson

let last_updated_date_time_to_yojson = timestamp_to_yojson

let update_info_entry_to_yojson = 
  fun (x: update_info_entry) -> assoc_to_yojson(
    [(
         "LastUpdatedDateTime",
         (option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time));
       (
         "StartTime",
         (option_to_yojson start_date_time_to_yojson x.start_time));
       (
         "PreviousValue",
         (option_to_yojson update_value_to_yojson x.previous_value));
       (
         "NewValue",
         (option_to_yojson update_value_to_yojson x.new_value));
       (
         "InitiatedBy",
         (option_to_yojson initiated_by_to_yojson x.initiated_by));
       (
         "StatusReason",
         (option_to_yojson update_status_reason_to_yojson x.status_reason));
       (
         "Status",
         (option_to_yojson update_status_to_yojson x.status));
       (
         "Region",
         (option_to_yojson region_name_to_yojson x.region));
       
  ])

let update_directory_setup_result_to_yojson = 
  fun (x: update_directory_setup_result) -> assoc_to_yojson(
    [
  ])

let create_snapshot_before_update_to_yojson = bool_to_yojson

let update_directory_setup_request_to_yojson = 
  fun (x: update_directory_setup_request) -> assoc_to_yojson(
    [(
         "CreateSnapshotBeforeUpdate",
         (option_to_yojson create_snapshot_before_update_to_yojson x.create_snapshot_before_update));
       (
         "OSUpdateSettings",
         (option_to_yojson os_update_settings_to_yojson x.os_update_settings));
       (
         "UpdateType",
         (Some (update_type_to_yojson x.update_type)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let snapshot_limit_exceeded_exception_to_yojson = 
  fun (x: snapshot_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let directory_in_desired_state_exception_to_yojson = 
  fun (x: directory_in_desired_state_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let update_conditional_forwarder_result_to_yojson = 
  fun (x: update_conditional_forwarder_result) -> assoc_to_yojson(
    [
  ])

let remote_domain_name_to_yojson = string_to_yojson

let ip_addr_to_yojson = string_to_yojson

let dns_ip_addrs_to_yojson = 
  fun tree -> list_to_yojson ip_addr_to_yojson tree

let update_conditional_forwarder_request_to_yojson = 
  fun (x: update_conditional_forwarder_request) -> assoc_to_yojson(
    [(
         "DnsIpAddrs",
         (Some (dns_ip_addrs_to_yojson x.dns_ip_addrs)));
       (
         "RemoteDomainName",
         (Some (remote_domain_name_to_yojson x.remote_domain_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let update_activities_to_yojson = 
  fun tree -> list_to_yojson update_info_entry_to_yojson tree

let target_id_to_yojson = string_to_yojson

let target_type_to_yojson = 
  fun (x: target_type) -> match x with 
  | ACCOUNT -> `String "ACCOUNT"
     

let unshare_target_to_yojson = 
  fun (x: unshare_target) -> assoc_to_yojson(
    [(
         "Type",
         (Some (target_type_to_yojson x.type_)));
       (
         "Id",
         (Some (target_id_to_yojson x.id)));
       
  ])

let unshare_directory_result_to_yojson = 
  fun (x: unshare_directory_result) -> assoc_to_yojson(
    [(
         "SharedDirectoryId",
         (option_to_yojson directory_id_to_yojson x.shared_directory_id));
       
  ])

let unshare_directory_request_to_yojson = 
  fun (x: unshare_directory_request) -> assoc_to_yojson(
    [(
         "UnshareTarget",
         (Some (unshare_target_to_yojson x.unshare_target)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let invalid_target_exception_to_yojson = 
  fun (x: invalid_target_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let directory_not_shared_exception_to_yojson = 
  fun (x: directory_not_shared_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let trust_type_to_yojson = 
  fun (x: trust_type) -> match x with 
  | EXTERNAL -> `String "External"
    | FOREST -> `String "Forest"
     

let trust_direction_to_yojson = 
  fun (x: trust_direction) -> match x with 
 
| TWO_WAY -> `String "Two-Way"
  | ONE_WAY_INCOMING -> `String "One-Way: Incoming"
  | ONE_WAY_OUTGOING -> `String "One-Way: Outgoing"
   

let trust_state_to_yojson = 
  fun (x: trust_state) -> match x with 
 
| FAILED -> `String "Failed"
  | DELETED -> `String "Deleted"
  | DELETING -> `String "Deleting"
  | UPDATED -> `String "Updated"
  | UPDATE_FAILED -> `String "UpdateFailed"
  | UPDATING -> `String "Updating"
  | VERIFIED -> `String "Verified"
  | VERIFY_FAILED -> `String "VerifyFailed"
  | VERIFYING -> `String "Verifying"
  | CREATED -> `String "Created"
  | CREATING -> `String "Creating"
   

let created_date_time_to_yojson = timestamp_to_yojson

let state_last_updated_date_time_to_yojson = timestamp_to_yojson

let trust_state_reason_to_yojson = string_to_yojson

let trust_to_yojson = 
  fun (x: trust) -> assoc_to_yojson(
    [(
         "SelectiveAuth",
         (option_to_yojson selective_auth_to_yojson x.selective_auth));
       (
         "TrustStateReason",
         (option_to_yojson trust_state_reason_to_yojson x.trust_state_reason));
       (
         "StateLastUpdatedDateTime",
         (option_to_yojson state_last_updated_date_time_to_yojson x.state_last_updated_date_time));
       (
         "LastUpdatedDateTime",
         (option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time));
       (
         "CreatedDateTime",
         (option_to_yojson created_date_time_to_yojson x.created_date_time));
       (
         "TrustState",
         (option_to_yojson trust_state_to_yojson x.trust_state));
       (
         "TrustDirection",
         (option_to_yojson trust_direction_to_yojson x.trust_direction));
       (
         "TrustType",
         (option_to_yojson trust_type_to_yojson x.trust_type));
       (
         "RemoteDomainName",
         (option_to_yojson remote_domain_name_to_yojson x.remote_domain_name));
       (
         "TrustId",
         (option_to_yojson trust_id_to_yojson x.trust_id));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let trusts_to_yojson = fun tree -> list_to_yojson trust_to_yojson tree

let trust_password_to_yojson = string_to_yojson

let trust_ids_to_yojson = 
  fun tree -> list_to_yojson trust_id_to_yojson tree

let topic_status_to_yojson = 
  fun (x: topic_status) -> match x with 
 
| DELETED -> `String "Deleted"
  | FAILED -> `String "Failed"
  | TOPIC_NOT_FOUND -> `String "Topic not found"
  | REGISTERED -> `String "Registered"
   

let topic_name_to_yojson = string_to_yojson

let topic_names_to_yojson = 
  fun tree -> list_to_yojson topic_name_to_yojson tree

let topic_arn_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

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

let tags_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_limit_exceeded_exception_to_yojson = 
  fun (x: tag_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let tag_keys_to_yojson = fun tree -> list_to_yojson tag_key_to_yojson tree

let subscription_created_date_time_to_yojson = timestamp_to_yojson

let subnet_id_to_yojson = string_to_yojson

let subnet_ids_to_yojson = 
  fun tree -> list_to_yojson subnet_id_to_yojson tree

let start_time_to_yojson = timestamp_to_yojson

let schema_extension_id_to_yojson = string_to_yojson

let start_schema_extension_result_to_yojson = 
  fun (x: start_schema_extension_result) -> assoc_to_yojson(
    [(
         "SchemaExtensionId",
         (option_to_yojson schema_extension_id_to_yojson x.schema_extension_id));
       
  ])

let create_snapshot_before_schema_extension_to_yojson = bool_to_yojson

let ldif_content_to_yojson = string_to_yojson

let description_to_yojson = string_to_yojson

let start_schema_extension_request_to_yojson = 
  fun (x: start_schema_extension_request) -> assoc_to_yojson(
    [(
         "Description",
         (Some (description_to_yojson x.description)));
       (
         "LdifContent",
         (Some (ldif_content_to_yojson x.ldif_content)));
       (
         "CreateSnapshotBeforeSchemaExtension",
         (Some (create_snapshot_before_schema_extension_to_yojson x.create_snapshot_before_schema_extension)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let stage_reason_to_yojson = string_to_yojson

let sso_enabled_to_yojson = bool_to_yojson

let snapshot_id_to_yojson = string_to_yojson

let snapshot_type_to_yojson = 
  fun (x: snapshot_type) -> match x with 
  | MANUAL -> `String "Manual"
    | AUTO -> `String "Auto"
     

let snapshot_name_to_yojson = string_to_yojson

let snapshot_status_to_yojson = 
  fun (x: snapshot_status) -> match x with 
 
| FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | CREATING -> `String "Creating"
   

let snapshot_to_yojson = 
  fun (x: snapshot) -> assoc_to_yojson(
    [(
         "StartTime",
         (option_to_yojson start_time_to_yojson x.start_time));
       (
         "Status",
         (option_to_yojson snapshot_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson snapshot_name_to_yojson x.name));
       (
         "Type",
         (option_to_yojson snapshot_type_to_yojson x.type_));
       (
         "SnapshotId",
         (option_to_yojson snapshot_id_to_yojson x.snapshot_id));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let snapshots_to_yojson = 
  fun tree -> list_to_yojson snapshot_to_yojson tree

let limit_to_yojson = int_to_yojson

let manual_snapshots_limit_reached_to_yojson = bool_to_yojson

let snapshot_limits_to_yojson = 
  fun (x: snapshot_limits) -> assoc_to_yojson(
    [(
         "ManualSnapshotsLimitReached",
         (option_to_yojson manual_snapshots_limit_reached_to_yojson x.manual_snapshots_limit_reached));
       (
         "ManualSnapshotsCurrentCount",
         (option_to_yojson limit_to_yojson x.manual_snapshots_current_count));
       (
         "ManualSnapshotsLimit",
         (option_to_yojson limit_to_yojson x.manual_snapshots_limit));
       
  ])

let snapshot_ids_to_yojson = 
  fun tree -> list_to_yojson snapshot_id_to_yojson tree

let customer_id_to_yojson = string_to_yojson

let share_method_to_yojson = 
  fun (x: share_method) -> match x with 
 
| HANDSHAKE -> `String "HANDSHAKE"
  | ORGANIZATIONS -> `String "ORGANIZATIONS"
   

let share_status_to_yojson = 
  fun (x: share_status) -> match x with 
 
| DELETING -> `String "Deleting"
  | DELETED -> `String "Deleted"
  | SHARE_FAILED -> `String "ShareFailed"
  | SHARING -> `String "Sharing"
  | REJECT_FAILED -> `String "RejectFailed"
  | REJECTING -> `String "Rejecting"
  | REJECTED -> `String "Rejected"
  | PENDING_ACCEPTANCE -> `String "PendingAcceptance"
  | SHARED -> `String "Shared"
   

let notes_to_yojson = string_to_yojson

let shared_directory_to_yojson = 
  fun (x: shared_directory) -> assoc_to_yojson(
    [(
         "LastUpdatedDateTime",
         (option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time));
       (
         "CreatedDateTime",
         (option_to_yojson created_date_time_to_yojson x.created_date_time));
       (
         "ShareNotes",
         (option_to_yojson notes_to_yojson x.share_notes));
       (
         "ShareStatus",
         (option_to_yojson share_status_to_yojson x.share_status));
       (
         "SharedDirectoryId",
         (option_to_yojson directory_id_to_yojson x.shared_directory_id));
       (
         "SharedAccountId",
         (option_to_yojson customer_id_to_yojson x.shared_account_id));
       (
         "ShareMethod",
         (option_to_yojson share_method_to_yojson x.share_method));
       (
         "OwnerDirectoryId",
         (option_to_yojson directory_id_to_yojson x.owner_directory_id));
       (
         "OwnerAccountId",
         (option_to_yojson customer_id_to_yojson x.owner_account_id));
       
  ])

let shared_directories_to_yojson = 
  fun tree -> list_to_yojson shared_directory_to_yojson tree

let share_target_to_yojson = 
  fun (x: share_target) -> assoc_to_yojson(
    [(
         "Type",
         (Some (target_type_to_yojson x.type_)));
       (
         "Id",
         (Some (target_id_to_yojson x.id)));
       
  ])

let share_limit_exceeded_exception_to_yojson = 
  fun (x: share_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let share_directory_result_to_yojson = 
  fun (x: share_directory_result) -> assoc_to_yojson(
    [(
         "SharedDirectoryId",
         (option_to_yojson directory_id_to_yojson x.shared_directory_id));
       
  ])

let share_directory_request_to_yojson = 
  fun (x: share_directory_request) -> assoc_to_yojson(
    [(
         "ShareMethod",
         (Some (share_method_to_yojson x.share_method)));
       (
         "ShareTarget",
         (Some (share_target_to_yojson x.share_target)));
       (
         "ShareNotes",
         (option_to_yojson notes_to_yojson x.share_notes));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let organizations_exception_to_yojson = 
  fun (x: organizations_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let directory_already_shared_exception_to_yojson = 
  fun (x: directory_already_shared_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let directory_configuration_setting_type_to_yojson = string_to_yojson

let directory_configuration_setting_allowed_values_to_yojson = 
  string_to_yojson

let directory_configuration_status_to_yojson = 
  fun (x: directory_configuration_status) -> match x with 
 
| DEFAULT -> `String "Default"
  | FAILED -> `String "Failed"
  | UPDATED -> `String "Updated"
  | UPDATING -> `String "Updating"
  | REQUESTED -> `String "Requested"
   

let directory_configuration_setting_request_detailed_status_to_yojson = 
  fun tree -> map_to_yojson directory_configuration_status_to_yojson tree

let directory_configuration_setting_request_status_message_to_yojson = 
  string_to_yojson

let directory_configuration_setting_last_updated_date_time_to_yojson = 
  timestamp_to_yojson

let directory_configuration_setting_last_requested_date_time_to_yojson = 
  timestamp_to_yojson

let directory_configuration_setting_data_type_to_yojson = string_to_yojson

let setting_entry_to_yojson = 
  fun (x: setting_entry) -> assoc_to_yojson(
    [(
         "DataType",
         (option_to_yojson directory_configuration_setting_data_type_to_yojson x.data_type));
       (
         "LastRequestedDateTime",
         (option_to_yojson directory_configuration_setting_last_requested_date_time_to_yojson x.last_requested_date_time));
       (
         "LastUpdatedDateTime",
         (option_to_yojson directory_configuration_setting_last_updated_date_time_to_yojson x.last_updated_date_time));
       (
         "RequestStatusMessage",
         (option_to_yojson directory_configuration_setting_request_status_message_to_yojson x.request_status_message));
       (
         "RequestDetailedStatus",
         (option_to_yojson directory_configuration_setting_request_detailed_status_to_yojson x.request_detailed_status));
       (
         "RequestStatus",
         (option_to_yojson directory_configuration_status_to_yojson x.request_status));
       (
         "RequestedValue",
         (option_to_yojson directory_configuration_setting_value_to_yojson x.requested_value));
       (
         "AppliedValue",
         (option_to_yojson directory_configuration_setting_value_to_yojson x.applied_value));
       (
         "AllowedValues",
         (option_to_yojson directory_configuration_setting_allowed_values_to_yojson x.allowed_values));
       (
         "Name",
         (option_to_yojson directory_configuration_setting_name_to_yojson x.name));
       (
         "Type",
         (option_to_yojson directory_configuration_setting_type_to_yojson x.type_));
       
  ])

let setting_entries_to_yojson = 
  fun tree -> list_to_yojson setting_entry_to_yojson tree

let security_group_id_to_yojson = string_to_yojson

let schema_extension_status_to_yojson = 
  fun (x: schema_extension_status) -> match x with 
 
| COMPLETED -> `String "Completed"
  | FAILED -> `String "Failed"
  | CANCELLED -> `String "Cancelled"
  | ROLLBACK_IN_PROGRESS -> `String "RollbackInProgress"
  | CANCEL_IN_PROGRESS -> `String "CancelInProgress"
  | REPLICATING -> `String "Replicating"
  | UPDATING_SCHEMA -> `String "UpdatingSchema"
  | CREATING_SNAPSHOT -> `String "CreatingSnapshot"
  | INITIALIZING -> `String "Initializing"
   

let schema_extension_status_reason_to_yojson = string_to_yojson

let end_date_time_to_yojson = timestamp_to_yojson

let schema_extension_info_to_yojson = 
  fun (x: schema_extension_info) -> assoc_to_yojson(
    [(
         "EndDateTime",
         (option_to_yojson end_date_time_to_yojson x.end_date_time));
       (
         "StartDateTime",
         (option_to_yojson start_date_time_to_yojson x.start_date_time));
       (
         "SchemaExtensionStatusReason",
         (option_to_yojson schema_extension_status_reason_to_yojson x.schema_extension_status_reason));
       (
         "SchemaExtensionStatus",
         (option_to_yojson schema_extension_status_to_yojson x.schema_extension_status));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "SchemaExtensionId",
         (option_to_yojson schema_extension_id_to_yojson x.schema_extension_id));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let schema_extensions_info_to_yojson = 
  fun tree -> list_to_yojson schema_extension_info_to_yojson tree

let si_d_to_yojson = string_to_yojson

let restore_from_snapshot_result_to_yojson = 
  fun (x: restore_from_snapshot_result) -> assoc_to_yojson(
    [
  ])

let restore_from_snapshot_request_to_yojson = 
  fun (x: restore_from_snapshot_request) -> assoc_to_yojson(
    [(
         "SnapshotId",
         (Some (snapshot_id_to_yojson x.snapshot_id)));
       
  ])

let resource_id_to_yojson = string_to_yojson

let reset_user_password_result_to_yojson = 
  fun (x: reset_user_password_result) -> assoc_to_yojson(
    [
  ])

let customer_user_name_to_yojson = string_to_yojson

let reset_user_password_request_to_yojson = 
  fun (x: reset_user_password_request) -> assoc_to_yojson(
    [(
         "NewPassword",
         (Some (user_password_to_yojson x.new_password)));
       (
         "UserName",
         (Some (customer_user_name_to_yojson x.user_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let invalid_password_exception_to_yojson = 
  fun (x: invalid_password_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let replication_scope_to_yojson = 
  fun (x: replication_scope) -> match x with 
  | Domain -> `String "Domain"
     

let remove_tags_from_resource_result_to_yojson = 
  fun (x: remove_tags_from_resource_result) -> assoc_to_yojson(
    [
  ])

let remove_tags_from_resource_request_to_yojson = 
  fun (x: remove_tags_from_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_keys_to_yojson x.tag_keys)));
       (
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       
  ])

let remove_region_result_to_yojson = 
  fun (x: remove_region_result) -> assoc_to_yojson(
    [
  ])

let remove_region_request_to_yojson = 
  fun (x: remove_region_request) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let remove_ip_routes_result_to_yojson = 
  fun (x: remove_ip_routes_result) -> assoc_to_yojson(
    [
  ])

let cidr_ip_to_yojson = string_to_yojson

let cidr_ips_to_yojson = fun tree -> list_to_yojson cidr_ip_to_yojson tree

let remove_ip_routes_request_to_yojson = 
  fun (x: remove_ip_routes_request) -> assoc_to_yojson(
    [(
         "CidrIps",
         (Some (cidr_ips_to_yojson x.cidr_ips)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let remote_domain_names_to_yojson = 
  fun tree -> list_to_yojson remote_domain_name_to_yojson tree

let reject_shared_directory_result_to_yojson = 
  fun (x: reject_shared_directory_result) -> assoc_to_yojson(
    [(
         "SharedDirectoryId",
         (option_to_yojson directory_id_to_yojson x.shared_directory_id));
       
  ])

let reject_shared_directory_request_to_yojson = 
  fun (x: reject_shared_directory_request) -> assoc_to_yojson(
    [(
         "SharedDirectoryId",
         (Some (directory_id_to_yojson x.shared_directory_id)));
       
  ])

let register_event_topic_result_to_yojson = 
  fun (x: register_event_topic_result) -> assoc_to_yojson(
    [
  ])

let register_event_topic_request_to_yojson = 
  fun (x: register_event_topic_request) -> assoc_to_yojson(
    [(
         "TopicName",
         (Some (topic_name_to_yojson x.topic_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let certificate_id_to_yojson = string_to_yojson

let register_certificate_result_to_yojson = 
  fun (x: register_certificate_result) -> assoc_to_yojson(
    [(
         "CertificateId",
         (option_to_yojson certificate_id_to_yojson x.certificate_id));
       
  ])

let certificate_data_to_yojson = string_to_yojson

let certificate_type_to_yojson = 
  fun (x: certificate_type) -> match x with 
 
| CLIENT_LDAPS -> `String "ClientLDAPS"
  | CLIENT_CERT_AUTH -> `String "ClientCertAuth"
   

let ocsp_url_to_yojson = string_to_yojson

let client_cert_auth_settings_to_yojson = 
  fun (x: client_cert_auth_settings) -> assoc_to_yojson(
    [(
         "OCSPUrl",
         (option_to_yojson ocsp_url_to_yojson x.ocsp_url));
       
  ])

let register_certificate_request_to_yojson = 
  fun (x: register_certificate_request) -> assoc_to_yojson(
    [(
         "ClientCertAuthSettings",
         (option_to_yojson client_cert_auth_settings_to_yojson x.client_cert_auth_settings));
       (
         "Type",
         (option_to_yojson certificate_type_to_yojson x.type_));
       (
         "CertificateData",
         (Some (certificate_data_to_yojson x.certificate_data)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let invalid_certificate_exception_to_yojson = 
  fun (x: invalid_certificate_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let certificate_limit_exceeded_exception_to_yojson = 
  fun (x: certificate_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let certificate_already_exists_exception_to_yojson = 
  fun (x: certificate_already_exists_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let additional_regions_to_yojson = 
  fun tree -> list_to_yojson region_name_to_yojson tree

let regions_info_to_yojson = 
  fun (x: regions_info) -> assoc_to_yojson(
    [(
         "AdditionalRegions",
         (option_to_yojson additional_regions_to_yojson x.additional_regions));
       (
         "PrimaryRegion",
         (option_to_yojson region_name_to_yojson x.primary_region));
       
  ])

let region_type_to_yojson = 
  fun (x: region_type) -> match x with 
  | ADDITIONAL -> `String "Additional"
    | PRIMARY -> `String "Primary"
     

let directory_stage_to_yojson = 
  fun (x: directory_stage) -> match x with 
 
| FAILED -> `String "Failed"
  | DELETED -> `String "Deleted"
  | DELETING -> `String "Deleting"
  | RESTOREFAILED -> `String "RestoreFailed"
  | RESTORING -> `String "Restoring"
  | IMPAIRED -> `String "Impaired"
  | INOPERABLE -> `String "Inoperable"
  | ACTIVE -> `String "Active"
  | CREATED -> `String "Created"
  | CREATING -> `String "Creating"
  | REQUESTED -> `String "Requested"
   

let directory_vpc_settings_to_yojson = 
  fun (x: directory_vpc_settings) -> assoc_to_yojson(
    [(
         "SubnetIds",
         (Some (subnet_ids_to_yojson x.subnet_ids)));
       (
         "VpcId",
         (Some (vpc_id_to_yojson x.vpc_id)));
       
  ])

let launch_time_to_yojson = timestamp_to_yojson

let region_description_to_yojson = 
  fun (x: region_description) -> assoc_to_yojson(
    [(
         "LastUpdatedDateTime",
         (option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time));
       (
         "StatusLastUpdatedDateTime",
         (option_to_yojson state_last_updated_date_time_to_yojson x.status_last_updated_date_time));
       (
         "LaunchTime",
         (option_to_yojson launch_time_to_yojson x.launch_time));
       (
         "DesiredNumberOfDomainControllers",
         (option_to_yojson desired_number_of_domain_controllers_to_yojson x.desired_number_of_domain_controllers));
       (
         "VpcSettings",
         (option_to_yojson directory_vpc_settings_to_yojson x.vpc_settings));
       (
         "Status",
         (option_to_yojson directory_stage_to_yojson x.status));
       (
         "RegionType",
         (option_to_yojson region_type_to_yojson x.region_type));
       (
         "RegionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let regions_description_to_yojson = 
  fun tree -> list_to_yojson region_description_to_yojson tree

let region_limit_exceeded_exception_to_yojson = 
  fun (x: region_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let radius_status_to_yojson = 
  fun (x: radius_status) -> match x with 
 
| FAILED -> `String "Failed"
  | COMPLETED -> `String "Completed"
  | CREATING -> `String "Creating"
   

let password_to_yojson = string_to_yojson

let page_limit_to_yojson = int_to_yojson

let availability_zone_to_yojson = string_to_yojson

let availability_zones_to_yojson = 
  fun tree -> list_to_yojson availability_zone_to_yojson tree

let directory_vpc_settings_description_to_yojson = 
  fun (x: directory_vpc_settings_description) -> assoc_to_yojson(
    [(
         "AvailabilityZones",
         (option_to_yojson availability_zones_to_yojson x.availability_zones));
       (
         "SecurityGroupId",
         (option_to_yojson security_group_id_to_yojson x.security_group_id));
       (
         "SubnetIds",
         (option_to_yojson subnet_ids_to_yojson x.subnet_ids));
       (
         "VpcId",
         (option_to_yojson vpc_id_to_yojson x.vpc_id));
       
  ])

let owner_directory_description_to_yojson = 
  fun (x: owner_directory_description) -> assoc_to_yojson(
    [(
         "RadiusStatus",
         (option_to_yojson radius_status_to_yojson x.radius_status));
       (
         "RadiusSettings",
         (option_to_yojson radius_settings_to_yojson x.radius_settings));
       (
         "VpcSettings",
         (option_to_yojson directory_vpc_settings_description_to_yojson x.vpc_settings));
       (
         "DnsIpAddrs",
         (option_to_yojson dns_ip_addrs_to_yojson x.dns_ip_addrs));
       (
         "AccountId",
         (option_to_yojson customer_id_to_yojson x.account_id));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let organizational_unit_d_n_to_yojson = string_to_yojson

let no_available_certificate_exception_to_yojson = 
  fun (x: no_available_certificate_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let next_token_to_yojson = string_to_yojson

let log_group_name_to_yojson = string_to_yojson

let log_subscription_to_yojson = 
  fun (x: log_subscription) -> assoc_to_yojson(
    [(
         "SubscriptionCreatedDateTime",
         (option_to_yojson subscription_created_date_time_to_yojson x.subscription_created_date_time));
       (
         "LogGroupName",
         (option_to_yojson log_group_name_to_yojson x.log_group_name));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let log_subscriptions_to_yojson = 
  fun tree -> list_to_yojson log_subscription_to_yojson tree

let list_tags_for_resource_result_to_yojson = 
  fun (x: list_tags_for_resource_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       
  ])

let invalid_next_token_exception_to_yojson = 
  fun (x: invalid_next_token_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let list_schema_extensions_result_to_yojson = 
  fun (x: list_schema_extensions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SchemaExtensionsInfo",
         (option_to_yojson schema_extensions_info_to_yojson x.schema_extensions_info));
       
  ])

let list_schema_extensions_request_to_yojson = 
  fun (x: list_schema_extensions_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let list_log_subscriptions_result_to_yojson = 
  fun (x: list_log_subscriptions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "LogSubscriptions",
         (option_to_yojson log_subscriptions_to_yojson x.log_subscriptions));
       
  ])

let list_log_subscriptions_request_to_yojson = 
  fun (x: list_log_subscriptions_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let ip_route_status_msg_to_yojson = 
  fun (x: ip_route_status_msg) -> match x with 
 
| REMOVE_FAILED -> `String "RemoveFailed"
  | ADD_FAILED -> `String "AddFailed"
  | REMOVED -> `String "Removed"
  | REMOVING -> `String "Removing"
  | ADDED -> `String "Added"
  | ADDING -> `String "Adding"
   

let added_date_time_to_yojson = timestamp_to_yojson

let ip_route_status_reason_to_yojson = string_to_yojson

let ip_route_info_to_yojson = 
  fun (x: ip_route_info) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "IpRouteStatusReason",
         (option_to_yojson ip_route_status_reason_to_yojson x.ip_route_status_reason));
       (
         "AddedDateTime",
         (option_to_yojson added_date_time_to_yojson x.added_date_time));
       (
         "IpRouteStatusMsg",
         (option_to_yojson ip_route_status_msg_to_yojson x.ip_route_status_msg));
       (
         "CidrIp",
         (option_to_yojson cidr_ip_to_yojson x.cidr_ip));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let ip_routes_info_to_yojson = 
  fun tree -> list_to_yojson ip_route_info_to_yojson tree

let list_ip_routes_result_to_yojson = 
  fun (x: list_ip_routes_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IpRoutesInfo",
         (option_to_yojson ip_routes_info_to_yojson x.ip_routes_info));
       
  ])

let list_ip_routes_request_to_yojson = 
  fun (x: list_ip_routes_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let certificate_c_n_to_yojson = string_to_yojson

let certificate_state_to_yojson = 
  fun (x: certificate_state) -> match x with 
 
| DEREGISTER_FAILED -> `String "DeregisterFailed"
  | DEREGISTERED -> `String "Deregistered"
  | DEREGISTERING -> `String "Deregistering"
  | REGISTER_FAILED -> `String "RegisterFailed"
  | REGISTERED -> `String "Registered"
  | REGISTERING -> `String "Registering"
   

let certificate_expiry_date_time_to_yojson = timestamp_to_yojson

let certificate_info_to_yojson = 
  fun (x: certificate_info) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson certificate_type_to_yojson x.type_));
       (
         "ExpiryDateTime",
         (option_to_yojson certificate_expiry_date_time_to_yojson x.expiry_date_time));
       (
         "State",
         (option_to_yojson certificate_state_to_yojson x.state));
       (
         "CommonName",
         (option_to_yojson certificate_c_n_to_yojson x.common_name));
       (
         "CertificateId",
         (option_to_yojson certificate_id_to_yojson x.certificate_id));
       
  ])

let certificates_info_to_yojson = 
  fun tree -> list_to_yojson certificate_info_to_yojson tree

let list_certificates_result_to_yojson = 
  fun (x: list_certificates_result) -> assoc_to_yojson(
    [(
         "CertificatesInfo",
         (option_to_yojson certificates_info_to_yojson x.certificates_info));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_certificates_request_to_yojson = 
  fun (x: list_certificates_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson page_limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let ldaps_type_to_yojson = 
  fun (x: ldaps_type) -> match x with 
  | CLIENT -> `String "Client"
     

let ldaps_status_reason_to_yojson = string_to_yojson

let ldaps_status_to_yojson = 
  fun (x: ldaps_status) -> match x with 
 
| DISABLED -> `String "Disabled"
  | ENABLE_FAILED -> `String "EnableFailed"
  | ENABLED -> `String "Enabled"
  | ENABLING -> `String "Enabling"
   

let ldaps_setting_info_to_yojson = 
  fun (x: ldaps_setting_info) -> assoc_to_yojson(
    [(
         "LastUpdatedDateTime",
         (option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time));
       (
         "LDAPSStatusReason",
         (option_to_yojson ldaps_status_reason_to_yojson x.ldaps_status_reason));
       (
         "LDAPSStatus",
         (option_to_yojson ldaps_status_to_yojson x.ldaps_status));
       
  ])

let ldaps_settings_info_to_yojson = 
  fun tree -> list_to_yojson ldaps_setting_info_to_yojson tree

let ip_route_to_yojson = 
  fun (x: ip_route) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "CidrIp",
         (option_to_yojson cidr_ip_to_yojson x.cidr_ip));
       
  ])

let ip_routes_to_yojson = 
  fun tree -> list_to_yojson ip_route_to_yojson tree

let ip_route_limit_exceeded_exception_to_yojson = 
  fun (x: ip_route_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let ip_addrs_to_yojson = fun tree -> list_to_yojson ip_addr_to_yojson tree

let invalid_ldaps_status_exception_to_yojson = 
  fun (x: invalid_ldaps_status_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_client_auth_status_exception_to_yojson = 
  fun (x: invalid_client_auth_status_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let insufficient_permissions_exception_to_yojson = 
  fun (x: insufficient_permissions_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let get_snapshot_limits_result_to_yojson = 
  fun (x: get_snapshot_limits_result) -> assoc_to_yojson(
    [(
         "SnapshotLimits",
         (option_to_yojson snapshot_limits_to_yojson x.snapshot_limits));
       
  ])

let get_snapshot_limits_request_to_yojson = 
  fun (x: get_snapshot_limits_request) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let cloud_only_directories_limit_reached_to_yojson = bool_to_yojson

let connected_directories_limit_reached_to_yojson = bool_to_yojson

let directory_limits_to_yojson = 
  fun (x: directory_limits) -> assoc_to_yojson(
    [(
         "ConnectedDirectoriesLimitReached",
         (option_to_yojson connected_directories_limit_reached_to_yojson x.connected_directories_limit_reached));
       (
         "ConnectedDirectoriesCurrentCount",
         (option_to_yojson limit_to_yojson x.connected_directories_current_count));
       (
         "ConnectedDirectoriesLimit",
         (option_to_yojson limit_to_yojson x.connected_directories_limit));
       (
         "CloudOnlyMicrosoftADLimitReached",
         (option_to_yojson cloud_only_directories_limit_reached_to_yojson x.cloud_only_microsoft_ad_limit_reached));
       (
         "CloudOnlyMicrosoftADCurrentCount",
         (option_to_yojson limit_to_yojson x.cloud_only_microsoft_ad_current_count));
       (
         "CloudOnlyMicrosoftADLimit",
         (option_to_yojson limit_to_yojson x.cloud_only_microsoft_ad_limit));
       (
         "CloudOnlyDirectoriesLimitReached",
         (option_to_yojson cloud_only_directories_limit_reached_to_yojson x.cloud_only_directories_limit_reached));
       (
         "CloudOnlyDirectoriesCurrentCount",
         (option_to_yojson limit_to_yojson x.cloud_only_directories_current_count));
       (
         "CloudOnlyDirectoriesLimit",
         (option_to_yojson limit_to_yojson x.cloud_only_directories_limit));
       
  ])

let get_directory_limits_result_to_yojson = 
  fun (x: get_directory_limits_result) -> assoc_to_yojson(
    [(
         "DirectoryLimits",
         (option_to_yojson directory_limits_to_yojson x.directory_limits));
       
  ])

let get_directory_limits_request_to_yojson = 
  fun (x: get_directory_limits_request) -> assoc_to_yojson(
    [
  ])

let event_topic_to_yojson = 
  fun (x: event_topic) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson topic_status_to_yojson x.status));
       (
         "CreatedDateTime",
         (option_to_yojson created_date_time_to_yojson x.created_date_time));
       (
         "TopicArn",
         (option_to_yojson topic_arn_to_yojson x.topic_arn));
       (
         "TopicName",
         (option_to_yojson topic_name_to_yojson x.topic_name));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let event_topics_to_yojson = 
  fun tree -> list_to_yojson event_topic_to_yojson tree

let entity_already_exists_exception_to_yojson = 
  fun (x: entity_already_exists_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let enable_sso_result_to_yojson = 
  fun (x: enable_sso_result) -> assoc_to_yojson(
    [
  ])

let connect_password_to_yojson = string_to_yojson

let enable_sso_request_to_yojson = 
  fun (x: enable_sso_request) -> assoc_to_yojson(
    [(
         "Password",
         (option_to_yojson connect_password_to_yojson x.password));
       (
         "UserName",
         (option_to_yojson user_name_to_yojson x.user_name));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let authentication_failed_exception_to_yojson = 
  fun (x: authentication_failed_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let enable_radius_result_to_yojson = 
  fun (x: enable_radius_result) -> assoc_to_yojson(
    [
  ])

let enable_radius_request_to_yojson = 
  fun (x: enable_radius_request) -> assoc_to_yojson(
    [(
         "RadiusSettings",
         (Some (radius_settings_to_yojson x.radius_settings)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let enable_ldaps_result_to_yojson = 
  fun (x: enable_ldaps_result) -> assoc_to_yojson(
    [
  ])

let enable_ldaps_request_to_yojson = 
  fun (x: enable_ldaps_request) -> assoc_to_yojson(
    [(
         "Type",
         (Some (ldaps_type_to_yojson x.type_)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let enable_client_authentication_result_to_yojson = 
  fun (x: enable_client_authentication_result) -> assoc_to_yojson(
    [
  ])

let client_authentication_type_to_yojson = 
  fun (x: client_authentication_type) -> match x with 
 
| SMART_CARD_OR_PASSWORD -> `String "SmartCardOrPassword"
  | SMART_CARD -> `String "SmartCard"
   

let enable_client_authentication_request_to_yojson = 
  fun (x: enable_client_authentication_request) -> assoc_to_yojson(
    [(
         "Type",
         (Some (client_authentication_type_to_yojson x.type_)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let domain_controller_id_to_yojson = string_to_yojson

let domain_controller_status_to_yojson = 
  fun (x: domain_controller_status) -> match x with 
 
| FAILED -> `String "Failed"
  | DELETED -> `String "Deleted"
  | DELETING -> `String "Deleting"
  | RESTORING -> `String "Restoring"
  | IMPAIRED -> `String "Impaired"
  | ACTIVE -> `String "Active"
  | CREATING -> `String "Creating"
   

let domain_controller_status_reason_to_yojson = string_to_yojson

let domain_controller_to_yojson = 
  fun (x: domain_controller) -> assoc_to_yojson(
    [(
         "StatusLastUpdatedDateTime",
         (option_to_yojson last_updated_date_time_to_yojson x.status_last_updated_date_time));
       (
         "LaunchTime",
         (option_to_yojson launch_time_to_yojson x.launch_time));
       (
         "StatusReason",
         (option_to_yojson domain_controller_status_reason_to_yojson x.status_reason));
       (
         "Status",
         (option_to_yojson domain_controller_status_to_yojson x.status));
       (
         "AvailabilityZone",
         (option_to_yojson availability_zone_to_yojson x.availability_zone));
       (
         "SubnetId",
         (option_to_yojson subnet_id_to_yojson x.subnet_id));
       (
         "VpcId",
         (option_to_yojson vpc_id_to_yojson x.vpc_id));
       (
         "DnsIpAddr",
         (option_to_yojson ip_addr_to_yojson x.dns_ip_addr));
       (
         "DomainControllerId",
         (option_to_yojson domain_controller_id_to_yojson x.domain_controller_id));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let domain_controllers_to_yojson = 
  fun tree -> list_to_yojson domain_controller_to_yojson tree

let domain_controller_ids_to_yojson = 
  fun tree -> list_to_yojson domain_controller_id_to_yojson tree

let disable_sso_result_to_yojson = 
  fun (x: disable_sso_result) -> assoc_to_yojson(
    [
  ])

let disable_sso_request_to_yojson = 
  fun (x: disable_sso_request) -> assoc_to_yojson(
    [(
         "Password",
         (option_to_yojson connect_password_to_yojson x.password));
       (
         "UserName",
         (option_to_yojson user_name_to_yojson x.user_name));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let disable_radius_result_to_yojson = 
  fun (x: disable_radius_result) -> assoc_to_yojson(
    [
  ])

let disable_radius_request_to_yojson = 
  fun (x: disable_radius_request) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let disable_ldaps_result_to_yojson = 
  fun (x: disable_ldaps_result) -> assoc_to_yojson(
    [
  ])

let disable_ldaps_request_to_yojson = 
  fun (x: disable_ldaps_request) -> assoc_to_yojson(
    [(
         "Type",
         (Some (ldaps_type_to_yojson x.type_)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let disable_client_authentication_result_to_yojson = 
  fun (x: disable_client_authentication_result) -> assoc_to_yojson(
    [
  ])

let disable_client_authentication_request_to_yojson = 
  fun (x: disable_client_authentication_request) -> assoc_to_yojson(
    [(
         "Type",
         (Some (client_authentication_type_to_yojson x.type_)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let directory_type_to_yojson = 
  fun (x: directory_type) -> match x with 
 
| SHARED_MICROSOFT_AD -> `String "SharedMicrosoftAD"
  | MICROSOFT_AD -> `String "MicrosoftAD"
  | AD_CONNECTOR -> `String "ADConnector"
  | SIMPLE_AD -> `String "SimpleAD"
   

let directory_size_to_yojson = 
  fun (x: directory_size) -> match x with 
  | LARGE -> `String "Large"
    | SMALL -> `String "Small"
     

let directory_short_name_to_yojson = string_to_yojson

let describe_update_directory_result_to_yojson = 
  fun (x: describe_update_directory_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "UpdateActivities",
         (option_to_yojson update_activities_to_yojson x.update_activities));
       
  ])

let describe_update_directory_request_to_yojson = 
  fun (x: describe_update_directory_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "RegionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       (
         "UpdateType",
         (Some (update_type_to_yojson x.update_type)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let describe_trusts_result_to_yojson = 
  fun (x: describe_trusts_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Trusts",
         (option_to_yojson trusts_to_yojson x.trusts));
       
  ])

let describe_trusts_request_to_yojson = 
  fun (x: describe_trusts_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "TrustIds",
         (option_to_yojson trust_ids_to_yojson x.trust_ids));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let describe_snapshots_result_to_yojson = 
  fun (x: describe_snapshots_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Snapshots",
         (option_to_yojson snapshots_to_yojson x.snapshots));
       
  ])

let describe_snapshots_request_to_yojson = 
  fun (x: describe_snapshots_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SnapshotIds",
         (option_to_yojson snapshot_ids_to_yojson x.snapshot_ids));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let describe_shared_directories_result_to_yojson = 
  fun (x: describe_shared_directories_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SharedDirectories",
         (option_to_yojson shared_directories_to_yojson x.shared_directories));
       
  ])

let directory_ids_to_yojson = 
  fun tree -> list_to_yojson directory_id_to_yojson tree

let describe_shared_directories_request_to_yojson = 
  fun (x: describe_shared_directories_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SharedDirectoryIds",
         (option_to_yojson directory_ids_to_yojson x.shared_directory_ids));
       (
         "OwnerDirectoryId",
         (Some (directory_id_to_yojson x.owner_directory_id)));
       
  ])

let describe_settings_result_to_yojson = 
  fun (x: describe_settings_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SettingEntries",
         (option_to_yojson setting_entries_to_yojson x.setting_entries));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let describe_settings_request_to_yojson = 
  fun (x: describe_settings_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Status",
         (option_to_yojson directory_configuration_status_to_yojson x.status));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let describe_regions_result_to_yojson = 
  fun (x: describe_regions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "RegionsDescription",
         (option_to_yojson regions_description_to_yojson x.regions_description));
       
  ])

let describe_regions_request_to_yojson = 
  fun (x: describe_regions_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "RegionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let describe_ldaps_settings_result_to_yojson = 
  fun (x: describe_ldaps_settings_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "LDAPSSettingsInfo",
         (option_to_yojson ldaps_settings_info_to_yojson x.ldaps_settings_info));
       
  ])

let describe_ldaps_settings_request_to_yojson = 
  fun (x: describe_ldaps_settings_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson page_limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Type",
         (option_to_yojson ldaps_type_to_yojson x.type_));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let describe_event_topics_result_to_yojson = 
  fun (x: describe_event_topics_result) -> assoc_to_yojson(
    [(
         "EventTopics",
         (option_to_yojson event_topics_to_yojson x.event_topics));
       
  ])

let describe_event_topics_request_to_yojson = 
  fun (x: describe_event_topics_request) -> assoc_to_yojson(
    [(
         "TopicNames",
         (option_to_yojson topic_names_to_yojson x.topic_names));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let describe_domain_controllers_result_to_yojson = 
  fun (x: describe_domain_controllers_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DomainControllers",
         (option_to_yojson domain_controllers_to_yojson x.domain_controllers));
       
  ])

let describe_domain_controllers_request_to_yojson = 
  fun (x: describe_domain_controllers_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DomainControllerIds",
         (option_to_yojson domain_controller_ids_to_yojson x.domain_controller_ids));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let directory_name_to_yojson = string_to_yojson

let directory_edition_to_yojson = 
  fun (x: directory_edition) -> match x with 
  | STANDARD -> `String "Standard"
    | ENTERPRISE -> `String "Enterprise"
     

let alias_name_to_yojson = string_to_yojson

let access_url_to_yojson = string_to_yojson

let directory_connect_settings_description_to_yojson = 
  fun (x: directory_connect_settings_description) -> assoc_to_yojson(
    [(
         "ConnectIps",
         (option_to_yojson ip_addrs_to_yojson x.connect_ips));
       (
         "AvailabilityZones",
         (option_to_yojson availability_zones_to_yojson x.availability_zones));
       (
         "SecurityGroupId",
         (option_to_yojson security_group_id_to_yojson x.security_group_id));
       (
         "CustomerUserName",
         (option_to_yojson user_name_to_yojson x.customer_user_name));
       (
         "SubnetIds",
         (option_to_yojson subnet_ids_to_yojson x.subnet_ids));
       (
         "VpcId",
         (option_to_yojson vpc_id_to_yojson x.vpc_id));
       
  ])

let directory_description_to_yojson = 
  fun (x: directory_description) -> assoc_to_yojson(
    [(
         "OsVersion",
         (option_to_yojson os_version_to_yojson x.os_version));
       (
         "RegionsInfo",
         (option_to_yojson regions_info_to_yojson x.regions_info));
       (
         "OwnerDirectoryDescription",
         (option_to_yojson owner_directory_description_to_yojson x.owner_directory_description));
       (
         "DesiredNumberOfDomainControllers",
         (option_to_yojson desired_number_of_domain_controllers_to_yojson x.desired_number_of_domain_controllers));
       (
         "SsoEnabled",
         (option_to_yojson sso_enabled_to_yojson x.sso_enabled));
       (
         "StageReason",
         (option_to_yojson stage_reason_to_yojson x.stage_reason));
       (
         "RadiusStatus",
         (option_to_yojson radius_status_to_yojson x.radius_status));
       (
         "RadiusSettings",
         (option_to_yojson radius_settings_to_yojson x.radius_settings));
       (
         "ConnectSettings",
         (option_to_yojson directory_connect_settings_description_to_yojson x.connect_settings));
       (
         "VpcSettings",
         (option_to_yojson directory_vpc_settings_description_to_yojson x.vpc_settings));
       (
         "Type",
         (option_to_yojson directory_type_to_yojson x.type_));
       (
         "StageLastUpdatedDateTime",
         (option_to_yojson last_updated_date_time_to_yojson x.stage_last_updated_date_time));
       (
         "LaunchTime",
         (option_to_yojson launch_time_to_yojson x.launch_time));
       (
         "ShareNotes",
         (option_to_yojson notes_to_yojson x.share_notes));
       (
         "ShareMethod",
         (option_to_yojson share_method_to_yojson x.share_method));
       (
         "ShareStatus",
         (option_to_yojson share_status_to_yojson x.share_status));
       (
         "Stage",
         (option_to_yojson directory_stage_to_yojson x.stage));
       (
         "DnsIpAddrs",
         (option_to_yojson dns_ip_addrs_to_yojson x.dns_ip_addrs));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "AccessUrl",
         (option_to_yojson access_url_to_yojson x.access_url));
       (
         "Alias",
         (option_to_yojson alias_name_to_yojson x.alias));
       (
         "Edition",
         (option_to_yojson directory_edition_to_yojson x.edition));
       (
         "Size",
         (option_to_yojson directory_size_to_yojson x.size));
       (
         "ShortName",
         (option_to_yojson directory_short_name_to_yojson x.short_name));
       (
         "Name",
         (option_to_yojson directory_name_to_yojson x.name));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let directory_descriptions_to_yojson = 
  fun tree -> list_to_yojson directory_description_to_yojson tree

let describe_directories_result_to_yojson = 
  fun (x: describe_directories_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DirectoryDescriptions",
         (option_to_yojson directory_descriptions_to_yojson x.directory_descriptions));
       
  ])

let describe_directories_request_to_yojson = 
  fun (x: describe_directories_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DirectoryIds",
         (option_to_yojson directory_ids_to_yojson x.directory_ids));
       
  ])

let conditional_forwarder_to_yojson = 
  fun (x: conditional_forwarder) -> assoc_to_yojson(
    [(
         "ReplicationScope",
         (option_to_yojson replication_scope_to_yojson x.replication_scope));
       (
         "DnsIpAddrs",
         (option_to_yojson dns_ip_addrs_to_yojson x.dns_ip_addrs));
       (
         "RemoteDomainName",
         (option_to_yojson remote_domain_name_to_yojson x.remote_domain_name));
       
  ])

let conditional_forwarders_to_yojson = 
  fun tree -> list_to_yojson conditional_forwarder_to_yojson tree

let describe_conditional_forwarders_result_to_yojson = 
  fun (x: describe_conditional_forwarders_result) -> assoc_to_yojson(
    [(
         "ConditionalForwarders",
         (option_to_yojson conditional_forwarders_to_yojson x.conditional_forwarders));
       
  ])

let describe_conditional_forwarders_request_to_yojson = 
  fun (x: describe_conditional_forwarders_request) -> assoc_to_yojson(
    [(
         "RemoteDomainNames",
         (option_to_yojson remote_domain_names_to_yojson x.remote_domain_names));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let client_authentication_status_to_yojson = 
  fun (x: client_authentication_status) -> match x with 
  | DISABLED -> `String "Disabled"
    | ENABLED -> `String "Enabled"
     

let client_authentication_setting_info_to_yojson = 
  fun (x: client_authentication_setting_info) -> assoc_to_yojson(
    [(
         "LastUpdatedDateTime",
         (option_to_yojson last_updated_date_time_to_yojson x.last_updated_date_time));
       (
         "Status",
         (option_to_yojson client_authentication_status_to_yojson x.status));
       (
         "Type",
         (option_to_yojson client_authentication_type_to_yojson x.type_));
       
  ])

let client_authentication_settings_info_to_yojson = 
  fun tree -> list_to_yojson client_authentication_setting_info_to_yojson tree

let describe_client_authentication_settings_result_to_yojson = 
  fun (x: describe_client_authentication_settings_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ClientAuthenticationSettingsInfo",
         (option_to_yojson client_authentication_settings_info_to_yojson x.client_authentication_settings_info));
       
  ])

let describe_client_authentication_settings_request_to_yojson = 
  fun (x: describe_client_authentication_settings_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson page_limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Type",
         (option_to_yojson client_authentication_type_to_yojson x.type_));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let certificate_does_not_exist_exception_to_yojson = 
  fun (x: certificate_does_not_exist_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let certificate_state_reason_to_yojson = string_to_yojson

let certificate_registered_date_time_to_yojson = timestamp_to_yojson

let certificate_to_yojson = 
  fun (x: certificate) -> assoc_to_yojson(
    [(
         "ClientCertAuthSettings",
         (option_to_yojson client_cert_auth_settings_to_yojson x.client_cert_auth_settings));
       (
         "Type",
         (option_to_yojson certificate_type_to_yojson x.type_));
       (
         "ExpiryDateTime",
         (option_to_yojson certificate_expiry_date_time_to_yojson x.expiry_date_time));
       (
         "RegisteredDateTime",
         (option_to_yojson certificate_registered_date_time_to_yojson x.registered_date_time));
       (
         "CommonName",
         (option_to_yojson certificate_c_n_to_yojson x.common_name));
       (
         "StateReason",
         (option_to_yojson certificate_state_reason_to_yojson x.state_reason));
       (
         "State",
         (option_to_yojson certificate_state_to_yojson x.state));
       (
         "CertificateId",
         (option_to_yojson certificate_id_to_yojson x.certificate_id));
       
  ])

let describe_certificate_result_to_yojson = 
  fun (x: describe_certificate_result) -> assoc_to_yojson(
    [(
         "Certificate",
         (option_to_yojson certificate_to_yojson x.certificate));
       
  ])

let describe_certificate_request_to_yojson = 
  fun (x: describe_certificate_request) -> assoc_to_yojson(
    [(
         "CertificateId",
         (Some (certificate_id_to_yojson x.certificate_id)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let deregister_event_topic_result_to_yojson = 
  fun (x: deregister_event_topic_result) -> assoc_to_yojson(
    [
  ])

let deregister_event_topic_request_to_yojson = 
  fun (x: deregister_event_topic_request) -> assoc_to_yojson(
    [(
         "TopicName",
         (Some (topic_name_to_yojson x.topic_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let certificate_in_use_exception_to_yojson = 
  fun (x: certificate_in_use_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let deregister_certificate_result_to_yojson = 
  fun (x: deregister_certificate_result) -> assoc_to_yojson(
    [
  ])

let deregister_certificate_request_to_yojson = 
  fun (x: deregister_certificate_request) -> assoc_to_yojson(
    [(
         "CertificateId",
         (Some (certificate_id_to_yojson x.certificate_id)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let delete_trust_result_to_yojson = 
  fun (x: delete_trust_result) -> assoc_to_yojson(
    [(
         "TrustId",
         (option_to_yojson trust_id_to_yojson x.trust_id));
       
  ])

let delete_associated_conditional_forwarder_to_yojson = bool_to_yojson

let delete_trust_request_to_yojson = 
  fun (x: delete_trust_request) -> assoc_to_yojson(
    [(
         "DeleteAssociatedConditionalForwarder",
         (option_to_yojson delete_associated_conditional_forwarder_to_yojson x.delete_associated_conditional_forwarder));
       (
         "TrustId",
         (Some (trust_id_to_yojson x.trust_id)));
       
  ])

let delete_snapshot_result_to_yojson = 
  fun (x: delete_snapshot_result) -> assoc_to_yojson(
    [(
         "SnapshotId",
         (option_to_yojson snapshot_id_to_yojson x.snapshot_id));
       
  ])

let delete_snapshot_request_to_yojson = 
  fun (x: delete_snapshot_request) -> assoc_to_yojson(
    [(
         "SnapshotId",
         (Some (snapshot_id_to_yojson x.snapshot_id)));
       
  ])

let delete_log_subscription_result_to_yojson = 
  fun (x: delete_log_subscription_result) -> assoc_to_yojson(
    [
  ])

let delete_log_subscription_request_to_yojson = 
  fun (x: delete_log_subscription_request) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let delete_directory_result_to_yojson = 
  fun (x: delete_directory_result) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let delete_directory_request_to_yojson = 
  fun (x: delete_directory_request) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let delete_conditional_forwarder_result_to_yojson = 
  fun (x: delete_conditional_forwarder_result) -> assoc_to_yojson(
    [
  ])

let delete_conditional_forwarder_request_to_yojson = 
  fun (x: delete_conditional_forwarder_request) -> assoc_to_yojson(
    [(
         "RemoteDomainName",
         (Some (remote_domain_name_to_yojson x.remote_domain_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let create_trust_result_to_yojson = 
  fun (x: create_trust_result) -> assoc_to_yojson(
    [(
         "TrustId",
         (option_to_yojson trust_id_to_yojson x.trust_id));
       
  ])

let create_trust_request_to_yojson = 
  fun (x: create_trust_request) -> assoc_to_yojson(
    [(
         "SelectiveAuth",
         (option_to_yojson selective_auth_to_yojson x.selective_auth));
       (
         "ConditionalForwarderIpAddrs",
         (option_to_yojson dns_ip_addrs_to_yojson x.conditional_forwarder_ip_addrs));
       (
         "TrustType",
         (option_to_yojson trust_type_to_yojson x.trust_type));
       (
         "TrustDirection",
         (Some (trust_direction_to_yojson x.trust_direction)));
       (
         "TrustPassword",
         (Some (trust_password_to_yojson x.trust_password)));
       (
         "RemoteDomainName",
         (Some (remote_domain_name_to_yojson x.remote_domain_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let create_snapshot_result_to_yojson = 
  fun (x: create_snapshot_result) -> assoc_to_yojson(
    [(
         "SnapshotId",
         (option_to_yojson snapshot_id_to_yojson x.snapshot_id));
       
  ])

let create_snapshot_request_to_yojson = 
  fun (x: create_snapshot_request) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson snapshot_name_to_yojson x.name));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let directory_limit_exceeded_exception_to_yojson = 
  fun (x: directory_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let create_microsoft_ad_result_to_yojson = 
  fun (x: create_microsoft_ad_result) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let create_microsoft_ad_request_to_yojson = 
  fun (x: create_microsoft_ad_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "Edition",
         (option_to_yojson directory_edition_to_yojson x.edition));
       (
         "VpcSettings",
         (Some (directory_vpc_settings_to_yojson x.vpc_settings)));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Password",
         (Some (password_to_yojson x.password)));
       (
         "ShortName",
         (option_to_yojson directory_short_name_to_yojson x.short_name));
       (
         "Name",
         (Some (directory_name_to_yojson x.name)));
       
  ])

let create_log_subscription_result_to_yojson = 
  fun (x: create_log_subscription_result) -> assoc_to_yojson(
    [
  ])

let create_log_subscription_request_to_yojson = 
  fun (x: create_log_subscription_request) -> assoc_to_yojson(
    [(
         "LogGroupName",
         (Some (log_group_name_to_yojson x.log_group_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let create_directory_result_to_yojson = 
  fun (x: create_directory_result) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let create_directory_request_to_yojson = 
  fun (x: create_directory_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "VpcSettings",
         (option_to_yojson directory_vpc_settings_to_yojson x.vpc_settings));
       (
         "Size",
         (Some (directory_size_to_yojson x.size)));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Password",
         (Some (password_to_yojson x.password)));
       (
         "ShortName",
         (option_to_yojson directory_short_name_to_yojson x.short_name));
       (
         "Name",
         (Some (directory_name_to_yojson x.name)));
       
  ])

let create_conditional_forwarder_result_to_yojson = 
  fun (x: create_conditional_forwarder_result) -> assoc_to_yojson(
    [
  ])

let create_conditional_forwarder_request_to_yojson = 
  fun (x: create_conditional_forwarder_request) -> assoc_to_yojson(
    [(
         "DnsIpAddrs",
         (Some (dns_ip_addrs_to_yojson x.dns_ip_addrs)));
       (
         "RemoteDomainName",
         (Some (remote_domain_name_to_yojson x.remote_domain_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let computer_name_to_yojson = string_to_yojson

let attribute_name_to_yojson = string_to_yojson

let attribute_value_to_yojson = string_to_yojson

let attribute_to_yojson = 
  fun (x: attribute) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson attribute_value_to_yojson x.value));
       (
         "Name",
         (option_to_yojson attribute_name_to_yojson x.name));
       
  ])

let attributes_to_yojson = 
  fun tree -> list_to_yojson attribute_to_yojson tree

let computer_to_yojson = 
  fun (x: computer) -> assoc_to_yojson(
    [(
         "ComputerAttributes",
         (option_to_yojson attributes_to_yojson x.computer_attributes));
       (
         "ComputerName",
         (option_to_yojson computer_name_to_yojson x.computer_name));
       (
         "ComputerId",
         (option_to_yojson si_d_to_yojson x.computer_id));
       
  ])

let create_computer_result_to_yojson = 
  fun (x: create_computer_result) -> assoc_to_yojson(
    [(
         "Computer",
         (option_to_yojson computer_to_yojson x.computer));
       
  ])

let computer_password_to_yojson = string_to_yojson

let create_computer_request_to_yojson = 
  fun (x: create_computer_request) -> assoc_to_yojson(
    [(
         "ComputerAttributes",
         (option_to_yojson attributes_to_yojson x.computer_attributes));
       (
         "OrganizationalUnitDistinguishedName",
         (option_to_yojson organizational_unit_d_n_to_yojson x.organizational_unit_distinguished_name));
       (
         "Password",
         (Some (computer_password_to_yojson x.password)));
       (
         "ComputerName",
         (Some (computer_name_to_yojson x.computer_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let create_alias_result_to_yojson = 
  fun (x: create_alias_result) -> assoc_to_yojson(
    [(
         "Alias",
         (option_to_yojson alias_name_to_yojson x.alias));
       (
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let create_alias_request_to_yojson = 
  fun (x: create_alias_request) -> assoc_to_yojson(
    [(
         "Alias",
         (Some (alias_name_to_yojson x.alias)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let connect_directory_result_to_yojson = 
  fun (x: connect_directory_result) -> assoc_to_yojson(
    [(
         "DirectoryId",
         (option_to_yojson directory_id_to_yojson x.directory_id));
       
  ])

let directory_connect_settings_to_yojson = 
  fun (x: directory_connect_settings) -> assoc_to_yojson(
    [(
         "CustomerUserName",
         (Some (user_name_to_yojson x.customer_user_name)));
       (
         "CustomerDnsIps",
         (Some (dns_ip_addrs_to_yojson x.customer_dns_ips)));
       (
         "SubnetIds",
         (Some (subnet_ids_to_yojson x.subnet_ids)));
       (
         "VpcId",
         (Some (vpc_id_to_yojson x.vpc_id)));
       
  ])

let connect_directory_request_to_yojson = 
  fun (x: connect_directory_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "ConnectSettings",
         (Some (directory_connect_settings_to_yojson x.connect_settings)));
       (
         "Size",
         (Some (directory_size_to_yojson x.size)));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Password",
         (Some (connect_password_to_yojson x.password)));
       (
         "ShortName",
         (option_to_yojson directory_short_name_to_yojson x.short_name));
       (
         "Name",
         (Some (directory_name_to_yojson x.name)));
       
  ])

let cancel_schema_extension_result_to_yojson = 
  fun (x: cancel_schema_extension_result) -> assoc_to_yojson(
    [
  ])

let cancel_schema_extension_request_to_yojson = 
  fun (x: cancel_schema_extension_request) -> assoc_to_yojson(
    [(
         "SchemaExtensionId",
         (Some (schema_extension_id_to_yojson x.schema_extension_id)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let add_tags_to_resource_result_to_yojson = 
  fun (x: add_tags_to_resource_result) -> assoc_to_yojson(
    [
  ])

let add_tags_to_resource_request_to_yojson = 
  fun (x: add_tags_to_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tags_to_yojson x.tags)));
       (
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       
  ])

let directory_already_in_region_exception_to_yojson = 
  fun (x: directory_already_in_region_exception) -> assoc_to_yojson(
    [(
         "RequestId",
         (option_to_yojson request_id_to_yojson x.request_id));
       (
         "Message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let add_region_result_to_yojson = 
  fun (x: add_region_result) -> assoc_to_yojson(
    [
  ])

let add_region_request_to_yojson = 
  fun (x: add_region_request) -> assoc_to_yojson(
    [(
         "VPCSettings",
         (Some (directory_vpc_settings_to_yojson x.vpc_settings)));
       (
         "RegionName",
         (Some (region_name_to_yojson x.region_name)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let add_ip_routes_result_to_yojson = 
  fun (x: add_ip_routes_result) -> assoc_to_yojson(
    [
  ])

let add_ip_routes_request_to_yojson = 
  fun (x: add_ip_routes_request) -> assoc_to_yojson(
    [(
         "UpdateSecurityGroupForDirectoryControllers",
         (option_to_yojson update_security_group_for_directory_controllers_to_yojson x.update_security_group_for_directory_controllers));
       (
         "IpRoutes",
         (Some (ip_routes_to_yojson x.ip_routes)));
       (
         "DirectoryId",
         (Some (directory_id_to_yojson x.directory_id)));
       
  ])

let accept_shared_directory_result_to_yojson = 
  fun (x: accept_shared_directory_result) -> assoc_to_yojson(
    [(
         "SharedDirectory",
         (option_to_yojson shared_directory_to_yojson x.shared_directory));
       
  ])

let accept_shared_directory_request_to_yojson = 
  fun (x: accept_shared_directory_request) -> assoc_to_yojson(
    [(
         "SharedDirectoryId",
         (Some (directory_id_to_yojson x.shared_directory_id)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

