open Smaws_Lib.Json.DeserializeHelpers

open Types

let vpc_id_of_yojson = string_of_yojson

let subnet_id_of_yojson = string_of_yojson

let subnet_ids_of_yojson = 
  fun tree path -> list_of_yojson subnet_id_of_yojson tree path 

let security_group_id_of_yojson = string_of_yojson

let security_group_ids_of_yojson = 
  fun tree path -> list_of_yojson security_group_id_of_yojson tree path 

let tls_certificate_of_yojson = string_of_yojson

let vpc_configuration_of_yojson = 
  fun tree path : vpc_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : vpc_configuration = {
    tls_certificate = option_of_yojson (value_for_key (tls_certificate_of_yojson) "TlsCertificate") _list path;
    security_group_ids = value_for_key (security_group_ids_of_yojson) "SecurityGroupIds" _list path;
    subnet_ids = value_for_key (subnet_ids_of_yojson) "SubnetIds" _list path;
    vpc_id = value_for_key (vpc_id_of_yojson) "VpcId" _list path;
    
  }
  in _res

let url_of_yojson = string_of_yojson

let branch_name_of_yojson = string_of_yojson

let deployment_file_path_of_yojson = string_of_yojson

let owner_id_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let provider_type_of_yojson = 
  fun (tree: t) path : provider_type -> match tree with 
    | `String "GitLabSelfManaged" -> GITLAB_SELF_MANAGED
    | `String "GitLab" -> GITLAB
    | `String "GitHubEnterpriseServer" -> GITHUB_ENTERPRISE_SERVER
    | `String "GitHub" -> GITHUB
    | `String "Bitbucket" -> BITBUCKET
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProviderType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProviderType")

let repository_link_id_of_yojson = string_of_yojson

let repository_name_of_yojson = string_of_yojson

let resource_name_of_yojson = string_of_yojson

let iam_role_arn_of_yojson = string_of_yojson

let sync_configuration_type_of_yojson = 
  fun (tree: t) path : sync_configuration_type -> match tree with 
    | `String "CFN_STACK_SYNC" -> CFN_STACK_SYNC
    | `String value -> raise (deserialize_unknown_enum_value_error path "SyncConfigurationType" value)
    | _ -> raise (deserialize_wrong_type_error path "SyncConfigurationType")

let publish_deployment_status_of_yojson = 
  fun (tree: t) path : publish_deployment_status -> match tree with 
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "PublishDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PublishDeploymentStatus")

let trigger_resource_update_on_of_yojson = 
  fun (tree: t) path : trigger_resource_update_on -> match tree with 
    | `String "FILE_CHANGE" -> FILE_CHANGE
    | `String "ANY_CHANGE" -> ANY_CHANGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TriggerResourceUpdateOn" value)
    | _ -> raise (deserialize_wrong_type_error path "TriggerResourceUpdateOn")

let sync_configuration_of_yojson = 
  fun tree path : sync_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : sync_configuration = {
    trigger_resource_update_on = option_of_yojson (value_for_key (trigger_resource_update_on_of_yojson) "TriggerResourceUpdateOn") _list path;
    publish_deployment_status = option_of_yojson (value_for_key (publish_deployment_status_of_yojson) "PublishDeploymentStatus") _list path;
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    role_arn = value_for_key (iam_role_arn_of_yojson) "RoleArn" _list path;
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "RepositoryName" _list path;
    repository_link_id = value_for_key (repository_link_id_of_yojson) "RepositoryLinkId" _list path;
    provider_type = value_for_key (provider_type_of_yojson) "ProviderType" _list path;
    owner_id = value_for_key (owner_id_of_yojson) "OwnerId" _list path;
    config_file = option_of_yojson (value_for_key (deployment_file_path_of_yojson) "ConfigFile") _list path;
    branch = value_for_key (branch_name_of_yojson) "Branch" _list path;
    
  }
  in _res

let update_sync_configuration_output_of_yojson = 
  fun tree path : update_sync_configuration_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_sync_configuration_output = {
    sync_configuration = value_for_key (sync_configuration_of_yojson) "SyncConfiguration" _list path;
    
  }
  in _res

let update_sync_configuration_input_of_yojson = 
  fun tree path : update_sync_configuration_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_sync_configuration_input = {
    trigger_resource_update_on = option_of_yojson (value_for_key (trigger_resource_update_on_of_yojson) "TriggerResourceUpdateOn") _list path;
    publish_deployment_status = option_of_yojson (value_for_key (publish_deployment_status_of_yojson) "PublishDeploymentStatus") _list path;
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    role_arn = option_of_yojson (value_for_key (iam_role_arn_of_yojson) "RoleArn") _list path;
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    repository_link_id = option_of_yojson (value_for_key (repository_link_id_of_yojson) "RepositoryLinkId") _list path;
    config_file = option_of_yojson (value_for_key (deployment_file_path_of_yojson) "ConfigFile") _list path;
    branch = option_of_yojson (value_for_key (branch_name_of_yojson) "Branch") _list path;
    
  }
  in _res

let error_message_of_yojson = string_of_yojson

let update_out_of_sync_exception_of_yojson = 
  fun tree path : update_out_of_sync_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : update_out_of_sync_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let throttling_exception_of_yojson = 
  fun tree path : throttling_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : throttling_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_input_exception_of_yojson = 
  fun tree path : invalid_input_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_input_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let internal_server_exception_of_yojson = 
  fun tree path : internal_server_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : internal_server_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let concurrent_modification_exception_of_yojson = 
  fun tree path : concurrent_modification_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : concurrent_modification_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let access_denied_exception_of_yojson = 
  fun tree path : access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : access_denied_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let id_of_yojson = string_of_yojson

let blocker_type_of_yojson = 
  fun (tree: t) path : blocker_type -> match tree with 
    | `String "AUTOMATED" -> AUTOMATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockerType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockerType")

let blocker_status_of_yojson = 
  fun (tree: t) path : blocker_status -> match tree with 
    | `String "RESOLVED" -> RESOLVED
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlockerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BlockerStatus")

let created_reason_of_yojson = string_of_yojson

let timestamp__of_yojson = timestamp_of_yojson

let sync_blocker_context_key_of_yojson = string_of_yojson

let sync_blocker_context_value_of_yojson = string_of_yojson

let sync_blocker_context_of_yojson = 
  fun tree path : sync_blocker_context ->
  let _list = assoc_of_yojson tree path in
  let _res : sync_blocker_context = {
    value = value_for_key (sync_blocker_context_value_of_yojson) "Value" _list path;
    key = value_for_key (sync_blocker_context_key_of_yojson) "Key" _list path;
    
  }
  in _res

let sync_blocker_context_list_of_yojson = 
  fun tree path -> list_of_yojson sync_blocker_context_of_yojson tree path 

let resolved_reason_of_yojson = string_of_yojson

let sync_blocker_of_yojson = 
  fun tree path : sync_blocker ->
  let _list = assoc_of_yojson tree path in
  let _res : sync_blocker = {
    resolved_at = option_of_yojson (value_for_key (timestamp__of_yojson) "ResolvedAt") _list path;
    resolved_reason = option_of_yojson (value_for_key (resolved_reason_of_yojson) "ResolvedReason") _list path;
    contexts = option_of_yojson (value_for_key (sync_blocker_context_list_of_yojson) "Contexts") _list path;
    created_at = value_for_key (timestamp__of_yojson) "CreatedAt" _list path;
    created_reason = value_for_key (created_reason_of_yojson) "CreatedReason" _list path;
    status = value_for_key (blocker_status_of_yojson) "Status" _list path;
    type_ = value_for_key (blocker_type_of_yojson) "Type" _list path;
    id = value_for_key (id_of_yojson) "Id" _list path;
    
  }
  in _res

let update_sync_blocker_output_of_yojson = 
  fun tree path : update_sync_blocker_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_sync_blocker_output = {
    sync_blocker = value_for_key (sync_blocker_of_yojson) "SyncBlocker" _list path;
    parent_resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "ParentResourceName") _list path;
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    
  }
  in _res

let update_sync_blocker_input_of_yojson = 
  fun tree path : update_sync_blocker_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_sync_blocker_input = {
    resolved_reason = value_for_key (resolved_reason_of_yojson) "ResolvedReason" _list path;
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    id = value_for_key (id_of_yojson) "Id" _list path;
    
  }
  in _res

let sync_blocker_does_not_exist_exception_of_yojson = 
  fun tree path : sync_blocker_does_not_exist_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : sync_blocker_does_not_exist_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let retry_latest_commit_failed_exception_of_yojson = 
  fun tree path : retry_latest_commit_failed_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : retry_latest_commit_failed_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let connection_arn_of_yojson = string_of_yojson

let kms_key_arn_of_yojson = string_of_yojson

let repository_link_arn_of_yojson = string_of_yojson

let repository_link_info_of_yojson = 
  fun tree path : repository_link_info ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_link_info = {
    repository_name = value_for_key (repository_name_of_yojson) "RepositoryName" _list path;
    repository_link_id = value_for_key (repository_link_id_of_yojson) "RepositoryLinkId" _list path;
    repository_link_arn = value_for_key (repository_link_arn_of_yojson) "RepositoryLinkArn" _list path;
    provider_type = value_for_key (provider_type_of_yojson) "ProviderType" _list path;
    owner_id = value_for_key (owner_id_of_yojson) "OwnerId" _list path;
    encryption_key_arn = option_of_yojson (value_for_key (kms_key_arn_of_yojson) "EncryptionKeyArn") _list path;
    connection_arn = value_for_key (connection_arn_of_yojson) "ConnectionArn" _list path;
    
  }
  in _res

let update_repository_link_output_of_yojson = 
  fun tree path : update_repository_link_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_repository_link_output = {
    repository_link_info = value_for_key (repository_link_info_of_yojson) "RepositoryLinkInfo" _list path;
    
  }
  in _res

let update_repository_link_input_of_yojson = 
  fun tree path : update_repository_link_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_repository_link_input = {
    repository_link_id = value_for_key (repository_link_id_of_yojson) "RepositoryLinkId" _list path;
    encryption_key_arn = option_of_yojson (value_for_key (kms_key_arn_of_yojson) "EncryptionKeyArn") _list path;
    connection_arn = option_of_yojson (value_for_key (connection_arn_of_yojson) "ConnectionArn") _list path;
    
  }
  in _res

let conditional_check_failed_exception_of_yojson = 
  fun tree path : conditional_check_failed_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conditional_check_failed_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let update_host_output_of_yojson = 
  fun tree path : update_host_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_host_output = ()
  in _res

let host_arn_of_yojson = string_of_yojson

let update_host_input_of_yojson = 
  fun tree path : update_host_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_host_input = {
    vpc_configuration = option_of_yojson (value_for_key (vpc_configuration_of_yojson) "VpcConfiguration") _list path;
    provider_endpoint = option_of_yojson (value_for_key (url_of_yojson) "ProviderEndpoint") _list path;
    host_arn = value_for_key (host_arn_of_yojson) "HostArn" _list path;
    
  }
  in _res

let unsupported_operation_exception_of_yojson = 
  fun tree path : unsupported_operation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_operation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let resource_unavailable_exception_of_yojson = 
  fun tree path : resource_unavailable_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_unavailable_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let conflict_exception_of_yojson = 
  fun tree path : conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let untag_resource_output_of_yojson = 
  fun tree path : untag_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_output = ()
  in _res

let amazon_resource_name_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_input_of_yojson = 
  fun tree path : untag_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_input = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "TagKeys" _list path;
    resource_arn = value_for_key (amazon_resource_name_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let unsupported_provider_type_exception_of_yojson = 
  fun tree path : unsupported_provider_type_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_provider_type_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let type__of_yojson = string_of_yojson

let target_of_yojson = string_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_resource_output_of_yojson = 
  fun tree path : tag_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_output = ()
  in _res

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

let tag_resource_input_of_yojson = 
  fun tree path : tag_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_input = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    resource_arn = value_for_key (amazon_resource_name_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let limit_exceeded_exception_of_yojson = 
  fun tree path : limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let sync_configuration_still_exists_exception_of_yojson = 
  fun tree path : sync_configuration_still_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : sync_configuration_still_exists_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let sync_configuration_list_of_yojson = 
  fun tree path -> list_of_yojson sync_configuration_of_yojson tree path 

let latest_sync_blocker_list_of_yojson = 
  fun tree path -> list_of_yojson sync_blocker_of_yojson tree path 

let sync_blocker_summary_of_yojson = 
  fun tree path : sync_blocker_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : sync_blocker_summary = {
    latest_blockers = option_of_yojson (value_for_key (latest_sync_blocker_list_of_yojson) "LatestBlockers") _list path;
    parent_resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "ParentResourceName") _list path;
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    
  }
  in _res

let sharp_next_token_of_yojson = string_of_yojson

let sh_a_of_yojson = string_of_yojson

let directory_of_yojson = string_of_yojson

let revision_of_yojson = 
  fun tree path : revision ->
  let _list = assoc_of_yojson tree path in
  let _res : revision = {
    sha = value_for_key (sh_a_of_yojson) "Sha" _list path;
    provider_type = value_for_key (provider_type_of_yojson) "ProviderType" _list path;
    repository_name = value_for_key (repository_name_of_yojson) "RepositoryName" _list path;
    owner_id = value_for_key (owner_id_of_yojson) "OwnerId" _list path;
    directory = value_for_key (directory_of_yojson) "Directory" _list path;
    branch = value_for_key (branch_name_of_yojson) "Branch" _list path;
    
  }
  in _res

let resource_sync_status_of_yojson = 
  fun (tree: t) path : resource_sync_status -> match tree with 
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "INITIATED" -> INITIATED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceSyncStatus")

let event_of_yojson = string_of_yojson

let external_id_of_yojson = string_of_yojson

let resource_sync_event_of_yojson = 
  fun tree path : resource_sync_event ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_sync_event = {
    type_ = value_for_key (type__of_yojson) "Type" _list path;
    time = value_for_key (timestamp__of_yojson) "Time" _list path;
    external_id = option_of_yojson (value_for_key (external_id_of_yojson) "ExternalId") _list path;
    event = value_for_key (event_of_yojson) "Event" _list path;
    
  }
  in _res

let resource_sync_event_list_of_yojson = 
  fun tree path -> list_of_yojson resource_sync_event_of_yojson tree path 

let resource_sync_attempt_of_yojson = 
  fun tree path : resource_sync_attempt ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_sync_attempt = {
    target = value_for_key (target_of_yojson) "Target" _list path;
    target_revision = value_for_key (revision_of_yojson) "TargetRevision" _list path;
    status = value_for_key (resource_sync_status_of_yojson) "Status" _list path;
    started_at = value_for_key (timestamp__of_yojson) "StartedAt" _list path;
    initial_revision = value_for_key (revision_of_yojson) "InitialRevision" _list path;
    events = value_for_key (resource_sync_event_list_of_yojson) "Events" _list path;
    
  }
  in _res

let resource_already_exists_exception_of_yojson = 
  fun tree path : resource_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_already_exists_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let repository_sync_status_of_yojson = 
  fun (tree: t) path : repository_sync_status -> match tree with 
    | `String "QUEUED" -> QUEUED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "INITIATED" -> INITIATED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RepositorySyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RepositorySyncStatus")

let repository_sync_event_of_yojson = 
  fun tree path : repository_sync_event ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_sync_event = {
    type_ = value_for_key (type__of_yojson) "Type" _list path;
    time = value_for_key (timestamp__of_yojson) "Time" _list path;
    external_id = option_of_yojson (value_for_key (external_id_of_yojson) "ExternalId") _list path;
    event = value_for_key (event_of_yojson) "Event" _list path;
    
  }
  in _res

let repository_sync_event_list_of_yojson = 
  fun tree path -> list_of_yojson repository_sync_event_of_yojson tree path 

let parent_of_yojson = string_of_yojson

let repository_sync_definition_of_yojson = 
  fun tree path : repository_sync_definition ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_sync_definition = {
    target = value_for_key (target_of_yojson) "Target" _list path;
    parent = value_for_key (parent_of_yojson) "Parent" _list path;
    directory = value_for_key (directory_of_yojson) "Directory" _list path;
    branch = value_for_key (branch_name_of_yojson) "Branch" _list path;
    
  }
  in _res

let repository_sync_definition_list_of_yojson = 
  fun tree path -> list_of_yojson repository_sync_definition_of_yojson tree path 

let repository_sync_attempt_of_yojson = 
  fun tree path : repository_sync_attempt ->
  let _list = assoc_of_yojson tree path in
  let _res : repository_sync_attempt = {
    events = value_for_key (repository_sync_event_list_of_yojson) "Events" _list path;
    status = value_for_key (repository_sync_status_of_yojson) "Status" _list path;
    started_at = value_for_key (timestamp__of_yojson) "StartedAt" _list path;
    
  }
  in _res

let repository_link_list_of_yojson = 
  fun tree path -> list_of_yojson repository_link_info_of_yojson tree path 

let next_token_of_yojson = string_of_yojson

let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_output_of_yojson = 
  fun tree path : list_tags_for_resource_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_output = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_tags_for_resource_input_of_yojson = 
  fun tree path : list_tags_for_resource_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_input = {
    resource_arn = value_for_key (amazon_resource_name_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let list_sync_configurations_output_of_yojson = 
  fun tree path : list_sync_configurations_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_sync_configurations_output = {
    next_token = option_of_yojson (value_for_key (sharp_next_token_of_yojson) "NextToken") _list path;
    sync_configurations = value_for_key (sync_configuration_list_of_yojson) "SyncConfigurations" _list path;
    
  }
  in _res

let list_sync_configurations_input_of_yojson = 
  fun tree path : list_sync_configurations_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_sync_configurations_input = {
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    repository_link_id = value_for_key (repository_link_id_of_yojson) "RepositoryLinkId" _list path;
    next_token = option_of_yojson (value_for_key (sharp_next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let list_repository_sync_definitions_output_of_yojson = 
  fun tree path : list_repository_sync_definitions_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_repository_sync_definitions_output = {
    next_token = option_of_yojson (value_for_key (sharp_next_token_of_yojson) "NextToken") _list path;
    repository_sync_definitions = value_for_key (repository_sync_definition_list_of_yojson) "RepositorySyncDefinitions" _list path;
    
  }
  in _res

let list_repository_sync_definitions_input_of_yojson = 
  fun tree path : list_repository_sync_definitions_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_repository_sync_definitions_input = {
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    repository_link_id = value_for_key (repository_link_id_of_yojson) "RepositoryLinkId" _list path;
    
  }
  in _res

let list_repository_links_output_of_yojson = 
  fun tree path : list_repository_links_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_repository_links_output = {
    next_token = option_of_yojson (value_for_key (sharp_next_token_of_yojson) "NextToken") _list path;
    repository_links = value_for_key (repository_link_list_of_yojson) "RepositoryLinks" _list path;
    
  }
  in _res

let list_repository_links_input_of_yojson = 
  fun tree path : list_repository_links_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_repository_links_input = {
    next_token = option_of_yojson (value_for_key (sharp_next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let host_name_of_yojson = string_of_yojson

let host_status_of_yojson = string_of_yojson

let host_status_message_of_yojson = string_of_yojson

let host_of_yojson = 
  fun tree path : host ->
  let _list = assoc_of_yojson tree path in
  let _res : host = {
    status_message = option_of_yojson (value_for_key (host_status_message_of_yojson) "StatusMessage") _list path;
    status = option_of_yojson (value_for_key (host_status_of_yojson) "Status") _list path;
    vpc_configuration = option_of_yojson (value_for_key (vpc_configuration_of_yojson) "VpcConfiguration") _list path;
    provider_endpoint = option_of_yojson (value_for_key (url_of_yojson) "ProviderEndpoint") _list path;
    provider_type = option_of_yojson (value_for_key (provider_type_of_yojson) "ProviderType") _list path;
    host_arn = option_of_yojson (value_for_key (host_arn_of_yojson) "HostArn") _list path;
    name = option_of_yojson (value_for_key (host_name_of_yojson) "Name") _list path;
    
  }
  in _res

let host_list_of_yojson = 
  fun tree path -> list_of_yojson host_of_yojson tree path 

let list_hosts_output_of_yojson = 
  fun tree path : list_hosts_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_hosts_output = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    hosts = option_of_yojson (value_for_key (host_list_of_yojson) "Hosts") _list path;
    
  }
  in _res

let list_hosts_input_of_yojson = 
  fun tree path : list_hosts_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_hosts_input = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let connection_name_of_yojson = string_of_yojson

let account_id_of_yojson = string_of_yojson

let connection_status_of_yojson = 
  fun (tree: t) path : connection_status -> match tree with 
    | `String "ERROR" -> ERROR
    | `String "AVAILABLE" -> AVAILABLE
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionStatus")

let connection_of_yojson = 
  fun tree path : connection ->
  let _list = assoc_of_yojson tree path in
  let _res : connection = {
    host_arn = option_of_yojson (value_for_key (host_arn_of_yojson) "HostArn") _list path;
    connection_status = option_of_yojson (value_for_key (connection_status_of_yojson) "ConnectionStatus") _list path;
    owner_account_id = option_of_yojson (value_for_key (account_id_of_yojson) "OwnerAccountId") _list path;
    provider_type = option_of_yojson (value_for_key (provider_type_of_yojson) "ProviderType") _list path;
    connection_arn = option_of_yojson (value_for_key (connection_arn_of_yojson) "ConnectionArn") _list path;
    connection_name = option_of_yojson (value_for_key (connection_name_of_yojson) "ConnectionName") _list path;
    
  }
  in _res

let connection_list_of_yojson = 
  fun tree path -> list_of_yojson connection_of_yojson tree path 

let list_connections_output_of_yojson = 
  fun tree path : list_connections_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_connections_output = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    connections = option_of_yojson (value_for_key (connection_list_of_yojson) "Connections") _list path;
    
  }
  in _res

let list_connections_input_of_yojson = 
  fun tree path : list_connections_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_connections_input = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    host_arn_filter = option_of_yojson (value_for_key (host_arn_of_yojson) "HostArnFilter") _list path;
    provider_type_filter = option_of_yojson (value_for_key (provider_type_of_yojson) "ProviderTypeFilter") _list path;
    
  }
  in _res

let get_sync_configuration_output_of_yojson = 
  fun tree path : get_sync_configuration_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_sync_configuration_output = {
    sync_configuration = value_for_key (sync_configuration_of_yojson) "SyncConfiguration" _list path;
    
  }
  in _res

let get_sync_configuration_input_of_yojson = 
  fun tree path : get_sync_configuration_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_sync_configuration_input = {
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    
  }
  in _res

let get_sync_blocker_summary_output_of_yojson = 
  fun tree path : get_sync_blocker_summary_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_sync_blocker_summary_output = {
    sync_blocker_summary = value_for_key (sync_blocker_summary_of_yojson) "SyncBlockerSummary" _list path;
    
  }
  in _res

let get_sync_blocker_summary_input_of_yojson = 
  fun tree path : get_sync_blocker_summary_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_sync_blocker_summary_input = {
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    
  }
  in _res

let get_resource_sync_status_output_of_yojson = 
  fun tree path : get_resource_sync_status_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_sync_status_output = {
    latest_sync = value_for_key (resource_sync_attempt_of_yojson) "LatestSync" _list path;
    latest_successful_sync = option_of_yojson (value_for_key (resource_sync_attempt_of_yojson) "LatestSuccessfulSync") _list path;
    desired_state = option_of_yojson (value_for_key (revision_of_yojson) "DesiredState") _list path;
    
  }
  in _res

let get_resource_sync_status_input_of_yojson = 
  fun tree path : get_resource_sync_status_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_sync_status_input = {
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    
  }
  in _res

let get_repository_sync_status_output_of_yojson = 
  fun tree path : get_repository_sync_status_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_repository_sync_status_output = {
    latest_sync = value_for_key (repository_sync_attempt_of_yojson) "LatestSync" _list path;
    
  }
  in _res

let get_repository_sync_status_input_of_yojson = 
  fun tree path : get_repository_sync_status_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_repository_sync_status_input = {
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    repository_link_id = value_for_key (repository_link_id_of_yojson) "RepositoryLinkId" _list path;
    branch = value_for_key (branch_name_of_yojson) "Branch" _list path;
    
  }
  in _res

let get_repository_link_output_of_yojson = 
  fun tree path : get_repository_link_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_repository_link_output = {
    repository_link_info = value_for_key (repository_link_info_of_yojson) "RepositoryLinkInfo" _list path;
    
  }
  in _res

let get_repository_link_input_of_yojson = 
  fun tree path : get_repository_link_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_repository_link_input = {
    repository_link_id = value_for_key (repository_link_id_of_yojson) "RepositoryLinkId" _list path;
    
  }
  in _res

let get_host_output_of_yojson = 
  fun tree path : get_host_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_host_output = {
    vpc_configuration = option_of_yojson (value_for_key (vpc_configuration_of_yojson) "VpcConfiguration") _list path;
    provider_endpoint = option_of_yojson (value_for_key (url_of_yojson) "ProviderEndpoint") _list path;
    provider_type = option_of_yojson (value_for_key (provider_type_of_yojson) "ProviderType") _list path;
    status = option_of_yojson (value_for_key (host_status_of_yojson) "Status") _list path;
    name = option_of_yojson (value_for_key (host_name_of_yojson) "Name") _list path;
    
  }
  in _res

let get_host_input_of_yojson = 
  fun tree path : get_host_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_host_input = {
    host_arn = value_for_key (host_arn_of_yojson) "HostArn" _list path;
    
  }
  in _res

let get_connection_output_of_yojson = 
  fun tree path : get_connection_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_connection_output = {
    connection = option_of_yojson (value_for_key (connection_of_yojson) "Connection") _list path;
    
  }
  in _res

let get_connection_input_of_yojson = 
  fun tree path : get_connection_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_connection_input = {
    connection_arn = value_for_key (connection_arn_of_yojson) "ConnectionArn" _list path;
    
  }
  in _res

let delete_sync_configuration_output_of_yojson = 
  fun tree path : delete_sync_configuration_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_sync_configuration_output = ()
  in _res

let delete_sync_configuration_input_of_yojson = 
  fun tree path : delete_sync_configuration_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_sync_configuration_input = {
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    
  }
  in _res

let delete_repository_link_output_of_yojson = 
  fun tree path : delete_repository_link_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_repository_link_output = ()
  in _res

let delete_repository_link_input_of_yojson = 
  fun tree path : delete_repository_link_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_repository_link_input = {
    repository_link_id = value_for_key (repository_link_id_of_yojson) "RepositoryLinkId" _list path;
    
  }
  in _res

let delete_host_output_of_yojson = 
  fun tree path : delete_host_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_host_output = ()
  in _res

let delete_host_input_of_yojson = 
  fun tree path : delete_host_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_host_input = {
    host_arn = value_for_key (host_arn_of_yojson) "HostArn" _list path;
    
  }
  in _res

let delete_connection_output_of_yojson = 
  fun tree path : delete_connection_output ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_connection_output = ()
  in _res

let delete_connection_input_of_yojson = 
  fun tree path : delete_connection_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_connection_input = {
    connection_arn = value_for_key (connection_arn_of_yojson) "ConnectionArn" _list path;
    
  }
  in _res

let create_sync_configuration_output_of_yojson = 
  fun tree path : create_sync_configuration_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_sync_configuration_output = {
    sync_configuration = value_for_key (sync_configuration_of_yojson) "SyncConfiguration" _list path;
    
  }
  in _res

let create_sync_configuration_input_of_yojson = 
  fun tree path : create_sync_configuration_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_sync_configuration_input = {
    trigger_resource_update_on = option_of_yojson (value_for_key (trigger_resource_update_on_of_yojson) "TriggerResourceUpdateOn") _list path;
    publish_deployment_status = option_of_yojson (value_for_key (publish_deployment_status_of_yojson) "PublishDeploymentStatus") _list path;
    sync_type = value_for_key (sync_configuration_type_of_yojson) "SyncType" _list path;
    role_arn = value_for_key (iam_role_arn_of_yojson) "RoleArn" _list path;
    resource_name = value_for_key (resource_name_of_yojson) "ResourceName" _list path;
    repository_link_id = value_for_key (repository_link_id_of_yojson) "RepositoryLinkId" _list path;
    config_file = value_for_key (deployment_file_path_of_yojson) "ConfigFile" _list path;
    branch = value_for_key (branch_name_of_yojson) "Branch" _list path;
    
  }
  in _res

let create_repository_link_output_of_yojson = 
  fun tree path : create_repository_link_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_repository_link_output = {
    repository_link_info = value_for_key (repository_link_info_of_yojson) "RepositoryLinkInfo" _list path;
    
  }
  in _res

let create_repository_link_input_of_yojson = 
  fun tree path : create_repository_link_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_repository_link_input = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    encryption_key_arn = option_of_yojson (value_for_key (kms_key_arn_of_yojson) "EncryptionKeyArn") _list path;
    repository_name = value_for_key (repository_name_of_yojson) "RepositoryName" _list path;
    owner_id = value_for_key (owner_id_of_yojson) "OwnerId" _list path;
    connection_arn = value_for_key (connection_arn_of_yojson) "ConnectionArn" _list path;
    
  }
  in _res

let create_host_output_of_yojson = 
  fun tree path : create_host_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_host_output = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    host_arn = option_of_yojson (value_for_key (host_arn_of_yojson) "HostArn") _list path;
    
  }
  in _res

let create_host_input_of_yojson = 
  fun tree path : create_host_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_host_input = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    vpc_configuration = option_of_yojson (value_for_key (vpc_configuration_of_yojson) "VpcConfiguration") _list path;
    provider_endpoint = value_for_key (url_of_yojson) "ProviderEndpoint" _list path;
    provider_type = value_for_key (provider_type_of_yojson) "ProviderType" _list path;
    name = value_for_key (host_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_connection_output_of_yojson = 
  fun tree path : create_connection_output ->
  let _list = assoc_of_yojson tree path in
  let _res : create_connection_output = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    connection_arn = value_for_key (connection_arn_of_yojson) "ConnectionArn" _list path;
    
  }
  in _res

let create_connection_input_of_yojson = 
  fun tree path : create_connection_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_connection_input = {
    host_arn = option_of_yojson (value_for_key (host_arn_of_yojson) "HostArn") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    connection_name = value_for_key (connection_name_of_yojson) "ConnectionName" _list path;
    provider_type = option_of_yojson (value_for_key (provider_type_of_yojson) "ProviderType") _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

