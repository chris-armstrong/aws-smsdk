open Smaws_Lib.Json.SerializeHelpers

open Types

let vpc_id_to_yojson = string_to_yojson

let subnet_id_to_yojson = string_to_yojson

let subnet_ids_to_yojson = 
  fun tree -> list_to_yojson subnet_id_to_yojson tree

let security_group_id_to_yojson = string_to_yojson

let security_group_ids_to_yojson = 
  fun tree -> list_to_yojson security_group_id_to_yojson tree

let tls_certificate_to_yojson = string_to_yojson

let vpc_configuration_to_yojson = 
  fun (x: vpc_configuration) -> assoc_to_yojson(
    [(
         "TlsCertificate",
         (option_to_yojson tls_certificate_to_yojson x.tls_certificate));
       (
         "SecurityGroupIds",
         (Some (security_group_ids_to_yojson x.security_group_ids)));
       (
         "SubnetIds",
         (Some (subnet_ids_to_yojson x.subnet_ids)));
       (
         "VpcId",
         (Some (vpc_id_to_yojson x.vpc_id)));
       
  ])

let url_to_yojson = string_to_yojson

let branch_name_to_yojson = string_to_yojson

let deployment_file_path_to_yojson = string_to_yojson

let owner_id_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let provider_type_to_yojson = 
  fun (x: provider_type) -> match x with 
 
| GITLAB_SELF_MANAGED -> `String "GitLabSelfManaged"
  | GITLAB -> `String "GitLab"
  | GITHUB_ENTERPRISE_SERVER -> `String "GitHubEnterpriseServer"
  | GITHUB -> `String "GitHub"
  | BITBUCKET -> `String "Bitbucket"
   

let repository_link_id_to_yojson = string_to_yojson

let repository_name_to_yojson = string_to_yojson

let resource_name_to_yojson = string_to_yojson

let iam_role_arn_to_yojson = string_to_yojson

let sync_configuration_type_to_yojson = 
  fun (x: sync_configuration_type) -> match x with 
  | CFN_STACK_SYNC -> `String "CFN_STACK_SYNC"
     

let publish_deployment_status_to_yojson = 
  fun (x: publish_deployment_status) -> match x with 
  | DISABLED -> `String "DISABLED"
    | ENABLED -> `String "ENABLED"
     

let trigger_resource_update_on_to_yojson = 
  fun (x: trigger_resource_update_on) -> match x with 
 
| FILE_CHANGE -> `String "FILE_CHANGE"
  | ANY_CHANGE -> `String "ANY_CHANGE"
   

let sync_configuration_to_yojson = 
  fun (x: sync_configuration) -> assoc_to_yojson(
    [(
         "TriggerResourceUpdateOn",
         (option_to_yojson trigger_resource_update_on_to_yojson x.trigger_resource_update_on));
       (
         "PublishDeploymentStatus",
         (option_to_yojson publish_deployment_status_to_yojson x.publish_deployment_status));
       (
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       (
         "RoleArn",
         (Some (iam_role_arn_to_yojson x.role_arn)));
       (
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       (
         "RepositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "RepositoryLinkId",
         (Some (repository_link_id_to_yojson x.repository_link_id)));
       (
         "ProviderType",
         (Some (provider_type_to_yojson x.provider_type)));
       (
         "OwnerId",
         (Some (owner_id_to_yojson x.owner_id)));
       (
         "ConfigFile",
         (option_to_yojson deployment_file_path_to_yojson x.config_file));
       (
         "Branch",
         (Some (branch_name_to_yojson x.branch)));
       
  ])

let update_sync_configuration_output_to_yojson = 
  fun (x: update_sync_configuration_output) -> assoc_to_yojson(
    [(
         "SyncConfiguration",
         (Some (sync_configuration_to_yojson x.sync_configuration)));
       
  ])

let update_sync_configuration_input_to_yojson = 
  fun (x: update_sync_configuration_input) -> assoc_to_yojson(
    [(
         "TriggerResourceUpdateOn",
         (option_to_yojson trigger_resource_update_on_to_yojson x.trigger_resource_update_on));
       (
         "PublishDeploymentStatus",
         (option_to_yojson publish_deployment_status_to_yojson x.publish_deployment_status));
       (
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       (
         "RoleArn",
         (option_to_yojson iam_role_arn_to_yojson x.role_arn));
       (
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       (
         "RepositoryLinkId",
         (option_to_yojson repository_link_id_to_yojson x.repository_link_id));
       (
         "ConfigFile",
         (option_to_yojson deployment_file_path_to_yojson x.config_file));
       (
         "Branch",
         (option_to_yojson branch_name_to_yojson x.branch));
       
  ])

let error_message_to_yojson = string_to_yojson

let update_out_of_sync_exception_to_yojson = 
  fun (x: update_out_of_sync_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let throttling_exception_to_yojson = 
  fun (x: throttling_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_input_exception_to_yojson = 
  fun (x: invalid_input_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let internal_server_exception_to_yojson = 
  fun (x: internal_server_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let concurrent_modification_exception_to_yojson = 
  fun (x: concurrent_modification_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let id_to_yojson = string_to_yojson

let blocker_type_to_yojson = 
  fun (x: blocker_type) -> match x with 
  | AUTOMATED -> `String "AUTOMATED"
     

let blocker_status_to_yojson = 
  fun (x: blocker_status) -> match x with 
  | RESOLVED -> `String "RESOLVED"
    | ACTIVE -> `String "ACTIVE"
     

let created_reason_to_yojson = string_to_yojson

let timestamp__to_yojson = timestamp_to_yojson

let sync_blocker_context_key_to_yojson = string_to_yojson

let sync_blocker_context_value_to_yojson = string_to_yojson

let sync_blocker_context_to_yojson = 
  fun (x: sync_blocker_context) -> assoc_to_yojson(
    [(
         "Value",
         (Some (sync_blocker_context_value_to_yojson x.value)));
       (
         "Key",
         (Some (sync_blocker_context_key_to_yojson x.key)));
       
  ])

let sync_blocker_context_list_to_yojson = 
  fun tree -> list_to_yojson sync_blocker_context_to_yojson tree

let resolved_reason_to_yojson = string_to_yojson

let sync_blocker_to_yojson = 
  fun (x: sync_blocker) -> assoc_to_yojson(
    [(
         "ResolvedAt",
         (option_to_yojson timestamp__to_yojson x.resolved_at));
       (
         "ResolvedReason",
         (option_to_yojson resolved_reason_to_yojson x.resolved_reason));
       (
         "Contexts",
         (option_to_yojson sync_blocker_context_list_to_yojson x.contexts));
       (
         "CreatedAt",
         (Some (timestamp__to_yojson x.created_at)));
       (
         "CreatedReason",
         (Some (created_reason_to_yojson x.created_reason)));
       (
         "Status",
         (Some (blocker_status_to_yojson x.status)));
       (
         "Type",
         (Some (blocker_type_to_yojson x.type_)));
       (
         "Id",
         (Some (id_to_yojson x.id)));
       
  ])

let update_sync_blocker_output_to_yojson = 
  fun (x: update_sync_blocker_output) -> assoc_to_yojson(
    [(
         "SyncBlocker",
         (Some (sync_blocker_to_yojson x.sync_blocker)));
       (
         "ParentResourceName",
         (option_to_yojson resource_name_to_yojson x.parent_resource_name));
       (
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let update_sync_blocker_input_to_yojson = 
  fun (x: update_sync_blocker_input) -> assoc_to_yojson(
    [(
         "ResolvedReason",
         (Some (resolved_reason_to_yojson x.resolved_reason)));
       (
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       (
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       (
         "Id",
         (Some (id_to_yojson x.id)));
       
  ])

let sync_blocker_does_not_exist_exception_to_yojson = 
  fun (x: sync_blocker_does_not_exist_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let retry_latest_commit_failed_exception_to_yojson = 
  fun (x: retry_latest_commit_failed_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let connection_arn_to_yojson = string_to_yojson

let kms_key_arn_to_yojson = string_to_yojson

let repository_link_arn_to_yojson = string_to_yojson

let repository_link_info_to_yojson = 
  fun (x: repository_link_info) -> assoc_to_yojson(
    [(
         "RepositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "RepositoryLinkId",
         (Some (repository_link_id_to_yojson x.repository_link_id)));
       (
         "RepositoryLinkArn",
         (Some (repository_link_arn_to_yojson x.repository_link_arn)));
       (
         "ProviderType",
         (Some (provider_type_to_yojson x.provider_type)));
       (
         "OwnerId",
         (Some (owner_id_to_yojson x.owner_id)));
       (
         "EncryptionKeyArn",
         (option_to_yojson kms_key_arn_to_yojson x.encryption_key_arn));
       (
         "ConnectionArn",
         (Some (connection_arn_to_yojson x.connection_arn)));
       
  ])

let update_repository_link_output_to_yojson = 
  fun (x: update_repository_link_output) -> assoc_to_yojson(
    [(
         "RepositoryLinkInfo",
         (Some (repository_link_info_to_yojson x.repository_link_info)));
       
  ])

let update_repository_link_input_to_yojson = 
  fun (x: update_repository_link_input) -> assoc_to_yojson(
    [(
         "RepositoryLinkId",
         (Some (repository_link_id_to_yojson x.repository_link_id)));
       (
         "EncryptionKeyArn",
         (option_to_yojson kms_key_arn_to_yojson x.encryption_key_arn));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       
  ])

let conditional_check_failed_exception_to_yojson = 
  fun (x: conditional_check_failed_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let update_host_output_to_yojson = 
  fun (x: update_host_output) -> assoc_to_yojson(
    [
  ])

let host_arn_to_yojson = string_to_yojson

let update_host_input_to_yojson = 
  fun (x: update_host_input) -> assoc_to_yojson(
    [(
         "VpcConfiguration",
         (option_to_yojson vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ProviderEndpoint",
         (option_to_yojson url_to_yojson x.provider_endpoint));
       (
         "HostArn",
         (Some (host_arn_to_yojson x.host_arn)));
       
  ])

let unsupported_operation_exception_to_yojson = 
  fun (x: unsupported_operation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_unavailable_exception_to_yojson = 
  fun (x: resource_unavailable_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let untag_resource_output_to_yojson = 
  fun (x: untag_resource_output) -> assoc_to_yojson(
    [
  ])

let amazon_resource_name_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson = 
  fun (x: untag_resource_input) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceArn",
         (Some (amazon_resource_name_to_yojson x.resource_arn)));
       
  ])

let unsupported_provider_type_exception_to_yojson = 
  fun (x: unsupported_provider_type_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let type__to_yojson = string_to_yojson

let target_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_resource_output_to_yojson = 
  fun (x: tag_resource_output) -> assoc_to_yojson(
    [
  ])

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

let tag_resource_input_to_yojson = 
  fun (x: tag_resource_input) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceArn",
         (Some (amazon_resource_name_to_yojson x.resource_arn)));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let sync_configuration_still_exists_exception_to_yojson = 
  fun (x: sync_configuration_still_exists_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let sync_configuration_list_to_yojson = 
  fun tree -> list_to_yojson sync_configuration_to_yojson tree

let latest_sync_blocker_list_to_yojson = 
  fun tree -> list_to_yojson sync_blocker_to_yojson tree

let sync_blocker_summary_to_yojson = 
  fun (x: sync_blocker_summary) -> assoc_to_yojson(
    [(
         "LatestBlockers",
         (option_to_yojson latest_sync_blocker_list_to_yojson x.latest_blockers));
       (
         "ParentResourceName",
         (option_to_yojson resource_name_to_yojson x.parent_resource_name));
       (
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let sharp_next_token_to_yojson = string_to_yojson

let sh_a_to_yojson = string_to_yojson

let directory_to_yojson = string_to_yojson

let revision_to_yojson = 
  fun (x: revision) -> assoc_to_yojson(
    [(
         "Sha",
         (Some (sh_a_to_yojson x.sha)));
       (
         "ProviderType",
         (Some (provider_type_to_yojson x.provider_type)));
       (
         "RepositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "OwnerId",
         (Some (owner_id_to_yojson x.owner_id)));
       (
         "Directory",
         (Some (directory_to_yojson x.directory)));
       (
         "Branch",
         (Some (branch_name_to_yojson x.branch)));
       
  ])

let resource_sync_status_to_yojson = 
  fun (x: resource_sync_status) -> match x with 
 
| SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | INITIATED -> `String "INITIATED"
  | FAILED -> `String "FAILED"
   

let event_to_yojson = string_to_yojson

let external_id_to_yojson = string_to_yojson

let resource_sync_event_to_yojson = 
  fun (x: resource_sync_event) -> assoc_to_yojson(
    [(
         "Type",
         (Some (type__to_yojson x.type_)));
       (
         "Time",
         (Some (timestamp__to_yojson x.time)));
       (
         "ExternalId",
         (option_to_yojson external_id_to_yojson x.external_id));
       (
         "Event",
         (Some (event_to_yojson x.event)));
       
  ])

let resource_sync_event_list_to_yojson = 
  fun tree -> list_to_yojson resource_sync_event_to_yojson tree

let resource_sync_attempt_to_yojson = 
  fun (x: resource_sync_attempt) -> assoc_to_yojson(
    [(
         "Target",
         (Some (target_to_yojson x.target)));
       (
         "TargetRevision",
         (Some (revision_to_yojson x.target_revision)));
       (
         "Status",
         (Some (resource_sync_status_to_yojson x.status)));
       (
         "StartedAt",
         (Some (timestamp__to_yojson x.started_at)));
       (
         "InitialRevision",
         (Some (revision_to_yojson x.initial_revision)));
       (
         "Events",
         (Some (resource_sync_event_list_to_yojson x.events)));
       
  ])

let resource_already_exists_exception_to_yojson = 
  fun (x: resource_already_exists_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let repository_sync_status_to_yojson = 
  fun (x: repository_sync_status) -> match x with 
 
| QUEUED -> `String "QUEUED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | INITIATED -> `String "INITIATED"
  | FAILED -> `String "FAILED"
   

let repository_sync_event_to_yojson = 
  fun (x: repository_sync_event) -> assoc_to_yojson(
    [(
         "Type",
         (Some (type__to_yojson x.type_)));
       (
         "Time",
         (Some (timestamp__to_yojson x.time)));
       (
         "ExternalId",
         (option_to_yojson external_id_to_yojson x.external_id));
       (
         "Event",
         (Some (event_to_yojson x.event)));
       
  ])

let repository_sync_event_list_to_yojson = 
  fun tree -> list_to_yojson repository_sync_event_to_yojson tree

let parent_to_yojson = string_to_yojson

let repository_sync_definition_to_yojson = 
  fun (x: repository_sync_definition) -> assoc_to_yojson(
    [(
         "Target",
         (Some (target_to_yojson x.target)));
       (
         "Parent",
         (Some (parent_to_yojson x.parent)));
       (
         "Directory",
         (Some (directory_to_yojson x.directory)));
       (
         "Branch",
         (Some (branch_name_to_yojson x.branch)));
       
  ])

let repository_sync_definition_list_to_yojson = 
  fun tree -> list_to_yojson repository_sync_definition_to_yojson tree

let repository_sync_attempt_to_yojson = 
  fun (x: repository_sync_attempt) -> assoc_to_yojson(
    [(
         "Events",
         (Some (repository_sync_event_list_to_yojson x.events)));
       (
         "Status",
         (Some (repository_sync_status_to_yojson x.status)));
       (
         "StartedAt",
         (Some (timestamp__to_yojson x.started_at)));
       
  ])

let repository_link_list_to_yojson = 
  fun tree -> list_to_yojson repository_link_info_to_yojson tree

let next_token_to_yojson = string_to_yojson

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_output_to_yojson = 
  fun (x: list_tags_for_resource_output) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_input_to_yojson = 
  fun (x: list_tags_for_resource_input) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (amazon_resource_name_to_yojson x.resource_arn)));
       
  ])

let list_sync_configurations_output_to_yojson = 
  fun (x: list_sync_configurations_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson sharp_next_token_to_yojson x.next_token));
       (
         "SyncConfigurations",
         (Some (sync_configuration_list_to_yojson x.sync_configurations)));
       
  ])

let list_sync_configurations_input_to_yojson = 
  fun (x: list_sync_configurations_input) -> assoc_to_yojson(
    [(
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       (
         "RepositoryLinkId",
         (Some (repository_link_id_to_yojson x.repository_link_id)));
       (
         "NextToken",
         (option_to_yojson sharp_next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       
  ])

let list_repository_sync_definitions_output_to_yojson = 
  fun (x: list_repository_sync_definitions_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson sharp_next_token_to_yojson x.next_token));
       (
         "RepositorySyncDefinitions",
         (Some (repository_sync_definition_list_to_yojson x.repository_sync_definitions)));
       
  ])

let list_repository_sync_definitions_input_to_yojson = 
  fun (x: list_repository_sync_definitions_input) -> assoc_to_yojson(
    [(
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       (
         "RepositoryLinkId",
         (Some (repository_link_id_to_yojson x.repository_link_id)));
       
  ])

let list_repository_links_output_to_yojson = 
  fun (x: list_repository_links_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson sharp_next_token_to_yojson x.next_token));
       (
         "RepositoryLinks",
         (Some (repository_link_list_to_yojson x.repository_links)));
       
  ])

let list_repository_links_input_to_yojson = 
  fun (x: list_repository_links_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson sharp_next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       
  ])

let host_name_to_yojson = string_to_yojson

let host_status_to_yojson = string_to_yojson

let host_status_message_to_yojson = string_to_yojson

let host_to_yojson = 
  fun (x: host) -> assoc_to_yojson(
    [(
         "StatusMessage",
         (option_to_yojson host_status_message_to_yojson x.status_message));
       (
         "Status",
         (option_to_yojson host_status_to_yojson x.status));
       (
         "VpcConfiguration",
         (option_to_yojson vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ProviderEndpoint",
         (option_to_yojson url_to_yojson x.provider_endpoint));
       (
         "ProviderType",
         (option_to_yojson provider_type_to_yojson x.provider_type));
       (
         "HostArn",
         (option_to_yojson host_arn_to_yojson x.host_arn));
       (
         "Name",
         (option_to_yojson host_name_to_yojson x.name));
       
  ])

let host_list_to_yojson = fun tree -> list_to_yojson host_to_yojson tree

let list_hosts_output_to_yojson = 
  fun (x: list_hosts_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Hosts",
         (option_to_yojson host_list_to_yojson x.hosts));
       
  ])

let list_hosts_input_to_yojson = 
  fun (x: list_hosts_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       
  ])

let connection_name_to_yojson = string_to_yojson

let account_id_to_yojson = string_to_yojson

let connection_status_to_yojson = 
  fun (x: connection_status) -> match x with 
 
| ERROR -> `String "ERROR"
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING -> `String "PENDING"
   

let connection_to_yojson = 
  fun (x: connection) -> assoc_to_yojson(
    [(
         "HostArn",
         (option_to_yojson host_arn_to_yojson x.host_arn));
       (
         "ConnectionStatus",
         (option_to_yojson connection_status_to_yojson x.connection_status));
       (
         "OwnerAccountId",
         (option_to_yojson account_id_to_yojson x.owner_account_id));
       (
         "ProviderType",
         (option_to_yojson provider_type_to_yojson x.provider_type));
       (
         "ConnectionArn",
         (option_to_yojson connection_arn_to_yojson x.connection_arn));
       (
         "ConnectionName",
         (option_to_yojson connection_name_to_yojson x.connection_name));
       
  ])

let connection_list_to_yojson = 
  fun tree -> list_to_yojson connection_to_yojson tree

let list_connections_output_to_yojson = 
  fun (x: list_connections_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Connections",
         (option_to_yojson connection_list_to_yojson x.connections));
       
  ])

let list_connections_input_to_yojson = 
  fun (x: list_connections_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "HostArnFilter",
         (option_to_yojson host_arn_to_yojson x.host_arn_filter));
       (
         "ProviderTypeFilter",
         (option_to_yojson provider_type_to_yojson x.provider_type_filter));
       
  ])

let get_sync_configuration_output_to_yojson = 
  fun (x: get_sync_configuration_output) -> assoc_to_yojson(
    [(
         "SyncConfiguration",
         (Some (sync_configuration_to_yojson x.sync_configuration)));
       
  ])

let get_sync_configuration_input_to_yojson = 
  fun (x: get_sync_configuration_input) -> assoc_to_yojson(
    [(
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       (
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       
  ])

let get_sync_blocker_summary_output_to_yojson = 
  fun (x: get_sync_blocker_summary_output) -> assoc_to_yojson(
    [(
         "SyncBlockerSummary",
         (Some (sync_blocker_summary_to_yojson x.sync_blocker_summary)));
       
  ])

let get_sync_blocker_summary_input_to_yojson = 
  fun (x: get_sync_blocker_summary_input) -> assoc_to_yojson(
    [(
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       (
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       
  ])

let get_resource_sync_status_output_to_yojson = 
  fun (x: get_resource_sync_status_output) -> assoc_to_yojson(
    [(
         "LatestSync",
         (Some (resource_sync_attempt_to_yojson x.latest_sync)));
       (
         "LatestSuccessfulSync",
         (option_to_yojson resource_sync_attempt_to_yojson x.latest_successful_sync));
       (
         "DesiredState",
         (option_to_yojson revision_to_yojson x.desired_state));
       
  ])

let get_resource_sync_status_input_to_yojson = 
  fun (x: get_resource_sync_status_input) -> assoc_to_yojson(
    [(
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       (
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let get_repository_sync_status_output_to_yojson = 
  fun (x: get_repository_sync_status_output) -> assoc_to_yojson(
    [(
         "LatestSync",
         (Some (repository_sync_attempt_to_yojson x.latest_sync)));
       
  ])

let get_repository_sync_status_input_to_yojson = 
  fun (x: get_repository_sync_status_input) -> assoc_to_yojson(
    [(
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       (
         "RepositoryLinkId",
         (Some (repository_link_id_to_yojson x.repository_link_id)));
       (
         "Branch",
         (Some (branch_name_to_yojson x.branch)));
       
  ])

let get_repository_link_output_to_yojson = 
  fun (x: get_repository_link_output) -> assoc_to_yojson(
    [(
         "RepositoryLinkInfo",
         (Some (repository_link_info_to_yojson x.repository_link_info)));
       
  ])

let get_repository_link_input_to_yojson = 
  fun (x: get_repository_link_input) -> assoc_to_yojson(
    [(
         "RepositoryLinkId",
         (Some (repository_link_id_to_yojson x.repository_link_id)));
       
  ])

let get_host_output_to_yojson = 
  fun (x: get_host_output) -> assoc_to_yojson(
    [(
         "VpcConfiguration",
         (option_to_yojson vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ProviderEndpoint",
         (option_to_yojson url_to_yojson x.provider_endpoint));
       (
         "ProviderType",
         (option_to_yojson provider_type_to_yojson x.provider_type));
       (
         "Status",
         (option_to_yojson host_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson host_name_to_yojson x.name));
       
  ])

let get_host_input_to_yojson = 
  fun (x: get_host_input) -> assoc_to_yojson(
    [(
         "HostArn",
         (Some (host_arn_to_yojson x.host_arn)));
       
  ])

let get_connection_output_to_yojson = 
  fun (x: get_connection_output) -> assoc_to_yojson(
    [(
         "Connection",
         (option_to_yojson connection_to_yojson x.connection));
       
  ])

let get_connection_input_to_yojson = 
  fun (x: get_connection_input) -> assoc_to_yojson(
    [(
         "ConnectionArn",
         (Some (connection_arn_to_yojson x.connection_arn)));
       
  ])

let delete_sync_configuration_output_to_yojson = 
  fun (x: delete_sync_configuration_output) -> assoc_to_yojson(
    [
  ])

let delete_sync_configuration_input_to_yojson = 
  fun (x: delete_sync_configuration_input) -> assoc_to_yojson(
    [(
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       (
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       
  ])

let delete_repository_link_output_to_yojson = 
  fun (x: delete_repository_link_output) -> assoc_to_yojson(
    [
  ])

let delete_repository_link_input_to_yojson = 
  fun (x: delete_repository_link_input) -> assoc_to_yojson(
    [(
         "RepositoryLinkId",
         (Some (repository_link_id_to_yojson x.repository_link_id)));
       
  ])

let delete_host_output_to_yojson = 
  fun (x: delete_host_output) -> assoc_to_yojson(
    [
  ])

let delete_host_input_to_yojson = 
  fun (x: delete_host_input) -> assoc_to_yojson(
    [(
         "HostArn",
         (Some (host_arn_to_yojson x.host_arn)));
       
  ])

let delete_connection_output_to_yojson = 
  fun (x: delete_connection_output) -> assoc_to_yojson(
    [
  ])

let delete_connection_input_to_yojson = 
  fun (x: delete_connection_input) -> assoc_to_yojson(
    [(
         "ConnectionArn",
         (Some (connection_arn_to_yojson x.connection_arn)));
       
  ])

let create_sync_configuration_output_to_yojson = 
  fun (x: create_sync_configuration_output) -> assoc_to_yojson(
    [(
         "SyncConfiguration",
         (Some (sync_configuration_to_yojson x.sync_configuration)));
       
  ])

let create_sync_configuration_input_to_yojson = 
  fun (x: create_sync_configuration_input) -> assoc_to_yojson(
    [(
         "TriggerResourceUpdateOn",
         (option_to_yojson trigger_resource_update_on_to_yojson x.trigger_resource_update_on));
       (
         "PublishDeploymentStatus",
         (option_to_yojson publish_deployment_status_to_yojson x.publish_deployment_status));
       (
         "SyncType",
         (Some (sync_configuration_type_to_yojson x.sync_type)));
       (
         "RoleArn",
         (Some (iam_role_arn_to_yojson x.role_arn)));
       (
         "ResourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       (
         "RepositoryLinkId",
         (Some (repository_link_id_to_yojson x.repository_link_id)));
       (
         "ConfigFile",
         (Some (deployment_file_path_to_yojson x.config_file)));
       (
         "Branch",
         (Some (branch_name_to_yojson x.branch)));
       
  ])

let create_repository_link_output_to_yojson = 
  fun (x: create_repository_link_output) -> assoc_to_yojson(
    [(
         "RepositoryLinkInfo",
         (Some (repository_link_info_to_yojson x.repository_link_info)));
       
  ])

let create_repository_link_input_to_yojson = 
  fun (x: create_repository_link_input) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "EncryptionKeyArn",
         (option_to_yojson kms_key_arn_to_yojson x.encryption_key_arn));
       (
         "RepositoryName",
         (Some (repository_name_to_yojson x.repository_name)));
       (
         "OwnerId",
         (Some (owner_id_to_yojson x.owner_id)));
       (
         "ConnectionArn",
         (Some (connection_arn_to_yojson x.connection_arn)));
       
  ])

let create_host_output_to_yojson = 
  fun (x: create_host_output) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "HostArn",
         (option_to_yojson host_arn_to_yojson x.host_arn));
       
  ])

let create_host_input_to_yojson = 
  fun (x: create_host_input) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "VpcConfiguration",
         (option_to_yojson vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ProviderEndpoint",
         (Some (url_to_yojson x.provider_endpoint)));
       (
         "ProviderType",
         (Some (provider_type_to_yojson x.provider_type)));
       (
         "Name",
         (Some (host_name_to_yojson x.name)));
       
  ])

let create_connection_output_to_yojson = 
  fun (x: create_connection_output) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ConnectionArn",
         (Some (connection_arn_to_yojson x.connection_arn)));
       
  ])

let create_connection_input_to_yojson = 
  fun (x: create_connection_input) -> assoc_to_yojson(
    [(
         "HostArn",
         (option_to_yojson host_arn_to_yojson x.host_arn));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ConnectionName",
         (Some (connection_name_to_yojson x.connection_name)));
       (
         "ProviderType",
         (option_to_yojson provider_type_to_yojson x.provider_type));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

