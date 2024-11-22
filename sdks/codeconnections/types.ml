open Smaws_Lib
let service =
  Service.{
    namespace = "codeconnections";
    endpointPrefix = "codeconnections";
    version = "2023-12-01";
    protocol = AwsJson_1_0
  };
type vpc_configuration = {
  tls_certificate: string option;
  security_group_ids: string list;
  subnet_ids: string list;
  vpc_id: string
}

type provider_type = | GITLAB_SELF_MANAGED
  | GITLAB
  | GITHUB_ENTERPRISE_SERVER
  | GITHUB
  | BITBUCKET

type sync_configuration_type = | CFN_STACK_SYNC

type publish_deployment_status = | DISABLED
  | ENABLED

type trigger_resource_update_on = | FILE_CHANGE
  | ANY_CHANGE

type sync_configuration = {
  trigger_resource_update_on: trigger_resource_update_on option;
  publish_deployment_status: publish_deployment_status option;
  sync_type: sync_configuration_type;
  role_arn: string;
  resource_name: string;
  repository_name: string;
  repository_link_id: string;
  provider_type: provider_type;
  owner_id: string;
  config_file: string option;
  branch: string
}

type update_sync_configuration_output = {
  sync_configuration: sync_configuration
}

type update_sync_configuration_input = {
  trigger_resource_update_on: trigger_resource_update_on option;
  publish_deployment_status: publish_deployment_status option;
  sync_type: sync_configuration_type;
  role_arn: string option;
  resource_name: string;
  repository_link_id: string option;
  config_file: string option;
  branch: string option
}

type update_out_of_sync_exception = {
  message: string option
}

type throttling_exception = {
  message: string option
}

type resource_not_found_exception = {
  message: string option
}

type invalid_input_exception = {
  message: string option
}

type internal_server_exception = {
  message: string option
}

type concurrent_modification_exception = {
  message: string option
}

type access_denied_exception = {
  message: string option
}

type blocker_type = | AUTOMATED

type blocker_status = | RESOLVED
  | ACTIVE

type sync_blocker_context = {
  value: string;
  key: string
}

type sync_blocker = {
  resolved_at: float option;
  resolved_reason: string option;
  contexts: sync_blocker_context list option;
  created_at: float;
  created_reason: string;
  status: blocker_status;
  type_: blocker_type;
  id: string
}

type update_sync_blocker_output = {
  sync_blocker: sync_blocker;
  parent_resource_name: string option;
  resource_name: string
}

type update_sync_blocker_input = {
  resolved_reason: string;
  resource_name: string;
  sync_type: sync_configuration_type;
  id: string
}

type sync_blocker_does_not_exist_exception = {
  message: string option
}

type retry_latest_commit_failed_exception = {
  message: string option
}

type repository_link_info = {
  repository_name: string;
  repository_link_id: string;
  repository_link_arn: string;
  provider_type: provider_type;
  owner_id: string;
  encryption_key_arn: string option;
  connection_arn: string
}

type update_repository_link_output = {
  repository_link_info: repository_link_info
}

type update_repository_link_input = {
  repository_link_id: string;
  encryption_key_arn: string option;
  connection_arn: string option
}

type conditional_check_failed_exception = {
  message: string option
}

type update_host_output = unit

type update_host_input = {
  vpc_configuration: vpc_configuration option;
  provider_endpoint: string option;
  host_arn: string
}

type unsupported_operation_exception = {
  message: string option
}

type resource_unavailable_exception = {
  message: string option
}

type conflict_exception = {
  message: string option
}

type untag_resource_output = unit

type untag_resource_input = {
  tag_keys: string list;
  resource_arn: string
}

type unsupported_provider_type_exception = {
  message: string option
}

type tag_resource_output = unit

type tag = {
  value: string;
  key: string
}

type tag_resource_input = {
  tags: tag list;
  resource_arn: string
}

type limit_exceeded_exception = {
  message: string option
}

type sync_configuration_still_exists_exception = {
  message: string option
}

type sync_blocker_summary = {
  latest_blockers: sync_blocker list option;
  parent_resource_name: string option;
  resource_name: string
}

type revision = {
  sha: string;
  provider_type: provider_type;
  repository_name: string;
  owner_id: string;
  directory: string;
  branch: string
}

type resource_sync_status = | SUCCEEDED
  | IN_PROGRESS
  | INITIATED
  | FAILED

type resource_sync_event = {
  type_: string;
  time: float;
  external_id: string option;
  event: string
}

type resource_sync_attempt = {
  target: string;
  target_revision: revision;
  status: resource_sync_status;
  started_at: float;
  initial_revision: revision;
  events: resource_sync_event list
}

type resource_already_exists_exception = {
  message: string option
}

type repository_sync_status = | QUEUED
  | SUCCEEDED
  | IN_PROGRESS
  | INITIATED
  | FAILED

type repository_sync_event = {
  type_: string;
  time: float;
  external_id: string option;
  event: string
}

type repository_sync_definition = {
  target: string;
  parent: string;
  directory: string;
  branch: string
}

type repository_sync_attempt = {
  events: repository_sync_event list;
  status: repository_sync_status;
  started_at: float
}

type list_tags_for_resource_output = {
  tags: tag list option
}

type list_tags_for_resource_input = {
  resource_arn: string
}

type list_sync_configurations_output = {
  next_token: string option;
  sync_configurations: sync_configuration list
}

type list_sync_configurations_input = {
  sync_type: sync_configuration_type;
  repository_link_id: string;
  next_token: string option;
  max_results: int option
}

type list_repository_sync_definitions_output = {
  next_token: string option;
  repository_sync_definitions: repository_sync_definition list
}

type list_repository_sync_definitions_input = {
  sync_type: sync_configuration_type;
  repository_link_id: string
}

type list_repository_links_output = {
  next_token: string option;
  repository_links: repository_link_info list
}

type list_repository_links_input = {
  next_token: string option;
  max_results: int option
}

type host = {
  status_message: string option;
  status: string option;
  vpc_configuration: vpc_configuration option;
  provider_endpoint: string option;
  provider_type: provider_type option;
  host_arn: string option;
  name: string option
}

type list_hosts_output = {
  next_token: string option;
  hosts: host list option
}

type list_hosts_input = {
  next_token: string option;
  max_results: int option
}

type connection_status = | ERROR
  | AVAILABLE
  | PENDING

type connection = {
  host_arn: string option;
  connection_status: connection_status option;
  owner_account_id: string option;
  provider_type: provider_type option;
  connection_arn: string option;
  connection_name: string option
}

type list_connections_output = {
  next_token: string option;
  connections: connection list option
}

type list_connections_input = {
  next_token: string option;
  max_results: int option;
  host_arn_filter: string option;
  provider_type_filter: provider_type option
}

type get_sync_configuration_output = {
  sync_configuration: sync_configuration
}

type get_sync_configuration_input = {
  resource_name: string;
  sync_type: sync_configuration_type
}

type get_sync_blocker_summary_output = {
  sync_blocker_summary: sync_blocker_summary
}

type get_sync_blocker_summary_input = {
  resource_name: string;
  sync_type: sync_configuration_type
}

type get_resource_sync_status_output = {
  latest_sync: resource_sync_attempt;
  latest_successful_sync: resource_sync_attempt option;
  desired_state: revision option
}

type get_resource_sync_status_input = {
  sync_type: sync_configuration_type;
  resource_name: string
}

type get_repository_sync_status_output = {
  latest_sync: repository_sync_attempt
}

type get_repository_sync_status_input = {
  sync_type: sync_configuration_type;
  repository_link_id: string;
  branch: string
}

type get_repository_link_output = {
  repository_link_info: repository_link_info
}

type get_repository_link_input = {
  repository_link_id: string
}

type get_host_output = {
  vpc_configuration: vpc_configuration option;
  provider_endpoint: string option;
  provider_type: provider_type option;
  status: string option;
  name: string option
}

type get_host_input = {
  host_arn: string
}

type get_connection_output = {
  connection: connection option
}

type get_connection_input = {
  connection_arn: string
}

type delete_sync_configuration_output = unit

type delete_sync_configuration_input = {
  resource_name: string;
  sync_type: sync_configuration_type
}

type delete_repository_link_output = unit

type delete_repository_link_input = {
  repository_link_id: string
}

type delete_host_output = unit

type delete_host_input = {
  host_arn: string
}

type delete_connection_output = unit

type delete_connection_input = {
  connection_arn: string
}

type create_sync_configuration_output = {
  sync_configuration: sync_configuration
}

type create_sync_configuration_input = {
  trigger_resource_update_on: trigger_resource_update_on option;
  publish_deployment_status: publish_deployment_status option;
  sync_type: sync_configuration_type;
  role_arn: string;
  resource_name: string;
  repository_link_id: string;
  config_file: string;
  branch: string
}

type create_repository_link_output = {
  repository_link_info: repository_link_info
}

type create_repository_link_input = {
  tags: tag list option;
  encryption_key_arn: string option;
  repository_name: string;
  owner_id: string;
  connection_arn: string
}

type create_host_output = {
  tags: tag list option;
  host_arn: string option
}

type create_host_input = {
  tags: tag list option;
  vpc_configuration: vpc_configuration option;
  provider_endpoint: string;
  provider_type: provider_type;
  name: string
}

type create_connection_output = {
  tags: tag list option;
  connection_arn: string
}

type create_connection_input = {
  host_arn: string option;
  tags: tag list option;
  connection_name: string;
  provider_type: provider_type option
}



type base_document = Json.t

