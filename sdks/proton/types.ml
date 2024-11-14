open Smaws_Lib
let service =
  Service.{
    namespace = "<blank>";
    endpointPrefix = "proton";
    version = "2020-07-20";
    protocol = AwsJson_1_0
  };
type validation_exception = {
  message: string
}

type template_type = | ENVIRONMENT
  | SERVICE

type repository_provider = | GITHUB
  | GITHUB_ENTERPRISE
  | BITBUCKET

type template_sync_config = {
  subdirectory: string option;
  branch: string;
  repository_name: string;
  repository_provider: repository_provider;
  template_type: template_type;
  template_name: string
}

type update_template_sync_config_output = {
  template_sync_config: template_sync_config option
}

type update_template_sync_config_input = {
  subdirectory: string option;
  branch: string;
  repository_name: string;
  repository_provider: repository_provider;
  template_type: template_type;
  template_name: string
}

type throttling_exception = {
  message: string
}

type resource_not_found_exception = {
  message: string
}

type internal_server_exception = {
  message: string
}

type conflict_exception = {
  message: string
}

type access_denied_exception = {
  message: string
}

type template_version_status = | REGISTRATION_IN_PROGRESS
  | REGISTRATION_FAILED
  | DRAFT
  | PUBLISHED

type compatible_environment_template = {
  major_version: string;
  template_name: string
}

type service_template_supported_component_source_type = | DIRECTLY_DEFINED

type service_template_version = {
  supported_component_sources: service_template_supported_component_source_type list option;
  schema: string option;
  compatible_environment_templates: compatible_environment_template list;
  last_modified_at: float;
  created_at: float;
  arn: string;
  description: string option;
  status_message: string option;
  status: template_version_status;
  recommended_minor_version: string option;
  minor_version: string;
  major_version: string;
  template_name: string
}

type update_service_template_version_output = {
  service_template_version: service_template_version
}

type compatible_environment_template_input = {
  major_version: string;
  template_name: string
}

type update_service_template_version_input = {
  supported_component_sources: service_template_supported_component_source_type list option;
  compatible_environment_templates: compatible_environment_template_input list option;
  status: template_version_status option;
  description: string option;
  minor_version: string;
  major_version: string;
  template_name: string
}

type provisioning = | CUSTOMER_MANAGED

type service_template = {
  pipeline_provisioning: provisioning option;
  encryption_key: string option;
  recommended_version: string option;
  description: string option;
  display_name: string option;
  last_modified_at: float;
  created_at: float;
  arn: string;
  name: string
}

type update_service_template_output = {
  service_template: service_template
}

type update_service_template_input = {
  description: string option;
  display_name: string option;
  name: string
}

type service_sync_config = {
  file_path: string;
  branch: string;
  repository_name: string;
  repository_provider: repository_provider;
  service_name: string
}

type update_service_sync_config_output = {
  service_sync_config: service_sync_config option
}

type update_service_sync_config_input = {
  file_path: string;
  branch: string;
  repository_name: string;
  repository_provider: repository_provider;
  service_name: string
}

type blocker_type = | AUTOMATED

type blocker_status = | ACTIVE
  | RESOLVED

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

type update_service_sync_blocker_output = {
  service_sync_blocker: sync_blocker;
  service_instance_name: string option;
  service_name: string
}

type update_service_sync_blocker_input = {
  resolved_reason: string;
  id: string
}

type deployment_status = | IN_PROGRESS
  | FAILED
  | SUCCEEDED
  | DELETE_IN_PROGRESS
  | DELETE_FAILED
  | DELETE_COMPLETE
  | CANCELLING
  | CANCELLED

type service_pipeline = {
  last_succeeded_deployment_id: string option;
  last_attempted_deployment_id: string option;
  spec: string option;
  deployment_status_message: string option;
  deployment_status: deployment_status;
  template_minor_version: string;
  template_major_version: string;
  template_name: string;
  last_deployment_succeeded_at: float;
  last_deployment_attempted_at: float;
  created_at: float;
  arn: string
}

type update_service_pipeline_output = {
  pipeline: service_pipeline
}

type deployment_update_type = | NONE
  | CURRENT_VERSION
  | MINOR_VERSION
  | MAJOR_VERSION

type update_service_pipeline_input = {
  template_minor_version: string option;
  template_major_version: string option;
  deployment_type: deployment_update_type;
  spec: string;
  service_name: string
}

type service_status = | CREATE_IN_PROGRESS
  | CREATE_FAILED_CLEANUP_IN_PROGRESS
  | CREATE_FAILED_CLEANUP_COMPLETE
  | CREATE_FAILED_CLEANUP_FAILED
  | CREATE_FAILED
  | ACTIVE
  | DELETE_IN_PROGRESS
  | DELETE_FAILED
  | UPDATE_IN_PROGRESS
  | UPDATE_FAILED_CLEANUP_IN_PROGRESS
  | UPDATE_FAILED_CLEANUP_COMPLETE
  | UPDATE_FAILED_CLEANUP_FAILED
  | UPDATE_FAILED
  | UPDATE_COMPLETE_CLEANUP_FAILED

type service = {
  branch_name: string option;
  repository_id: string option;
  repository_connection_arn: string option;
  pipeline: service_pipeline option;
  spec: string;
  status_message: string option;
  status: service_status;
  last_modified_at: float;
  created_at: float;
  template_name: string;
  arn: string;
  description: string option;
  name: string
}

type update_service_output = {
  service: service
}

type service_instance = {
  last_succeeded_deployment_id: string option;
  last_attempted_deployment_id: string option;
  last_client_request_token: string option;
  spec: string option;
  deployment_status_message: string option;
  deployment_status: deployment_status;
  template_minor_version: string;
  template_major_version: string;
  template_name: string;
  environment_name: string;
  service_name: string;
  last_deployment_succeeded_at: float;
  last_deployment_attempted_at: float;
  created_at: float;
  arn: string;
  name: string
}

type update_service_instance_output = {
  service_instance: service_instance
}

type update_service_instance_input = {
  client_token: string option;
  template_minor_version: string option;
  template_major_version: string option;
  spec: string option;
  deployment_type: deployment_update_type;
  service_name: string;
  name: string
}

type update_service_input = {
  spec: string option;
  description: string option;
  name: string
}

type service_quota_exceeded_exception = {
  message: string
}

type environment_template_version = {
  schema: string option;
  last_modified_at: float;
  created_at: float;
  arn: string;
  description: string option;
  status_message: string option;
  status: template_version_status;
  recommended_minor_version: string option;
  minor_version: string;
  major_version: string;
  template_name: string
}

type update_environment_template_version_output = {
  environment_template_version: environment_template_version
}

type update_environment_template_version_input = {
  status: template_version_status option;
  description: string option;
  minor_version: string;
  major_version: string;
  template_name: string
}

type environment_template = {
  provisioning: provisioning option;
  encryption_key: string option;
  recommended_version: string option;
  description: string option;
  display_name: string option;
  last_modified_at: float;
  created_at: float;
  arn: string;
  name: string
}

type update_environment_template_output = {
  environment_template: environment_template
}

type update_environment_template_input = {
  description: string option;
  display_name: string option;
  name: string
}

type repository_branch = {
  branch: string;
  name: string;
  provider: repository_provider;
  arn: string
}

type environment = {
  last_succeeded_deployment_id: string option;
  last_attempted_deployment_id: string option;
  codebuild_role_arn: string option;
  component_role_arn: string option;
  provisioning_repository: repository_branch option;
  provisioning: provisioning option;
  spec: string option;
  environment_account_id: string option;
  environment_account_connection_id: string option;
  proton_service_role_arn: string option;
  deployment_status_message: string option;
  deployment_status: deployment_status;
  template_minor_version: string;
  template_major_version: string;
  template_name: string;
  arn: string;
  last_deployment_succeeded_at: float;
  last_deployment_attempted_at: float;
  created_at: float;
  description: string option;
  name: string
}

type update_environment_output = {
  environment: environment
}

type repository_branch_input = {
  branch: string;
  name: string;
  provider: repository_provider
}

type update_environment_input = {
  codebuild_role_arn: string option;
  component_role_arn: string option;
  provisioning_repository: repository_branch_input option;
  environment_account_connection_id: string option;
  deployment_type: deployment_update_type;
  proton_service_role_arn: string option;
  template_minor_version: string option;
  template_major_version: string option;
  spec: string option;
  description: string option;
  name: string
}

type environment_account_connection_status = | PENDING
  | CONNECTED
  | REJECTED

type environment_account_connection = {
  codebuild_role_arn: string option;
  component_role_arn: string option;
  status: environment_account_connection_status;
  last_modified_at: float;
  requested_at: float;
  environment_name: string;
  role_arn: string;
  environment_account_id: string;
  management_account_id: string;
  arn: string;
  id: string
}

type update_environment_account_connection_output = {
  environment_account_connection: environment_account_connection
}

type update_environment_account_connection_input = {
  codebuild_role_arn: string option;
  component_role_arn: string option;
  role_arn: string option;
  id: string
}

type component = {
  last_succeeded_deployment_id: string option;
  last_attempted_deployment_id: string option;
  last_client_request_token: string option;
  service_spec: string option;
  deployment_status_message: string option;
  deployment_status: deployment_status;
  last_deployment_succeeded_at: float option;
  last_deployment_attempted_at: float option;
  last_modified_at: float;
  created_at: float;
  service_instance_name: string option;
  service_name: string option;
  environment_name: string;
  arn: string;
  description: string option;
  name: string
}

type update_component_output = {
  component: component
}

type component_deployment_update_type = | NONE
  | CURRENT_VERSION

type update_component_input = {
  client_token: string option;
  template_file: string option;
  service_spec: string option;
  service_instance_name: string option;
  service_name: string option;
  description: string option;
  deployment_type: component_deployment_update_type;
  name: string
}

type account_settings = {
  pipeline_codebuild_role_arn: string option;
  pipeline_provisioning_repository: repository_branch option;
  pipeline_service_role_arn: string option
}

type update_account_settings_output = {
  account_settings: account_settings
}

type update_account_settings_input = {
  pipeline_codebuild_role_arn: string option;
  delete_pipeline_provisioning_repository: bool option;
  pipeline_provisioning_repository: repository_branch_input option;
  pipeline_service_role_arn: string option
}

type untag_resource_output = unit

type untag_resource_input = {
  tag_keys: string list;
  resource_arn: string
}

type s3_object_source = {
  key: string;
  bucket: string
}

type template_version_source_input = S3 of s3_object_source

type tag_resource_output = unit

type tag = {
  value: string;
  key: string
}

type tag_resource_input = {
  tags: tag list;
  resource_arn: string
}

type sync_type = | TEMPLATE_SYNC
  | SERVICE_SYNC

type sort_order = | ASCENDING
  | DESCENDING

type service_template_version_summary = {
  last_modified_at: float;
  created_at: float;
  arn: string;
  description: string option;
  status_message: string option;
  status: template_version_status;
  recommended_minor_version: string option;
  minor_version: string;
  major_version: string;
  template_name: string
}

type service_template_summary = {
  pipeline_provisioning: provisioning option;
  recommended_version: string option;
  description: string option;
  display_name: string option;
  last_modified_at: float;
  created_at: float;
  arn: string;
  name: string
}

type service_sync_blocker_summary = {
  latest_blockers: sync_blocker list option;
  service_instance_name: string option;
  service_name: string
}

type service_summary = {
  status_message: string option;
  status: service_status;
  last_modified_at: float;
  created_at: float;
  template_name: string;
  arn: string;
  description: string option;
  name: string
}

type service_pipeline_state = {
  template_minor_version: string;
  template_major_version: string;
  template_name: string;
  spec: string option
}

type service_instance_summary = {
  last_succeeded_deployment_id: string option;
  last_attempted_deployment_id: string option;
  deployment_status_message: string option;
  deployment_status: deployment_status;
  template_minor_version: string;
  template_major_version: string;
  template_name: string;
  environment_name: string;
  service_name: string;
  last_deployment_succeeded_at: float;
  last_deployment_attempted_at: float;
  created_at: float;
  arn: string;
  name: string
}

type service_instance_state = {
  last_successful_service_pipeline_deployment_id: string option;
  last_successful_environment_deployment_id: string option;
  last_successful_component_deployment_ids: string list option;
  template_minor_version: string;
  template_major_version: string;
  template_name: string;
  spec: string
}

type revision = {
  branch: string;
  directory: string;
  sha: string;
  repository_provider: repository_provider;
  repository_name: string
}

type resource_sync_status = | INITIATED
  | IN_PROGRESS
  | SUCCEEDED
  | FAILED

type resource_sync_event = {
  event: string;
  time: float;
  external_id: string option;
  type_: string
}

type resource_sync_attempt = {
  events: resource_sync_event list;
  status: resource_sync_status;
  started_at: float;
  target: string;
  target_revision: revision;
  initial_revision: revision
}

type resource_deployment_status = | IN_PROGRESS
  | FAILED
  | SUCCEEDED

type resource_counts_summary = {
  behind_minor: int option;
  behind_major: int option;
  up_to_date: int option;
  failed: int option;
  total: int
}

type repository_sync_status = | INITIATED
  | IN_PROGRESS
  | SUCCEEDED
  | FAILED
  | QUEUED

type repository_sync_event = {
  event: string;
  time: float;
  external_id: string option;
  type_: string
}

type repository_sync_definition = {
  directory: string;
  branch: string;
  parent: string;
  target: string
}

type repository_sync_attempt = {
  events: repository_sync_event list;
  status: repository_sync_status;
  started_at: float
}

type repository_summary = {
  connection_arn: string;
  name: string;
  provider: repository_provider;
  arn: string
}

type repository = {
  encryption_key: string option;
  connection_arn: string;
  name: string;
  provider: repository_provider;
  arn: string
}

type reject_environment_account_connection_output = {
  environment_account_connection: environment_account_connection
}

type reject_environment_account_connection_input = {
  id: string
}

type provisioned_resource_engine = | CLOUDFORMATION
  | TERRAFORM

type provisioned_resource = {
  provisioning_engine: provisioned_resource_engine option;
  identifier: string option;
  name: string option
}

type output = {
  value_string: string option;
  key: string option
}

type notify_resource_deployment_status_change_output = unit

type notify_resource_deployment_status_change_input = {
  status_message: string option;
  deployment_id: string option;
  outputs: output list option;
  status: resource_deployment_status option;
  resource_arn: string
}

type list_tags_for_resource_output = {
  next_token: string option;
  tags: tag list
}

type list_tags_for_resource_input = {
  max_results: int option;
  next_token: string option;
  resource_arn: string
}

type list_services_output = {
  services: service_summary list;
  next_token: string option
}

type list_services_input = {
  max_results: int option;
  next_token: string option
}

type list_service_templates_output = {
  templates: service_template_summary list;
  next_token: string option
}

type list_service_templates_input = {
  max_results: int option;
  next_token: string option
}

type list_service_template_versions_output = {
  template_versions: service_template_version_summary list;
  next_token: string option
}

type list_service_template_versions_input = {
  major_version: string option;
  template_name: string;
  max_results: int option;
  next_token: string option
}

type list_service_pipeline_provisioned_resources_output = {
  provisioned_resources: provisioned_resource list;
  next_token: string option
}

type list_service_pipeline_provisioned_resources_input = {
  next_token: string option;
  service_name: string
}

type list_service_pipeline_outputs_output = {
  outputs: output list;
  next_token: string option
}

type list_service_pipeline_outputs_input = {
  deployment_id: string option;
  next_token: string option;
  service_name: string
}

type list_service_instances_sort_by = | NAME
  | DEPLOYMENT_STATUS
  | TEMPLATE_NAME
  | SERVICE_NAME
  | ENVIRONMENT_NAME
  | LAST_DEPLOYMENT_ATTEMPTED_AT
  | CREATED_AT

type list_service_instances_output = {
  service_instances: service_instance_summary list;
  next_token: string option
}

type list_service_instances_filter_by = | NAME
  | DEPLOYMENT_STATUS
  | TEMPLATE_NAME
  | SERVICE_NAME
  | DEPLOYED_TEMPLATE_VERSION_STATUS
  | ENVIRONMENT_NAME
  | LAST_DEPLOYMENT_ATTEMPTED_AT_BEFORE
  | LAST_DEPLOYMENT_ATTEMPTED_AT_AFTER
  | CREATED_AT_BEFORE
  | CREATED_AT_AFTER

type list_service_instances_filter = {
  value: string option;
  key: list_service_instances_filter_by option
}

type list_service_instances_input = {
  sort_order: sort_order option;
  sort_by: list_service_instances_sort_by option;
  filters: list_service_instances_filter list option;
  max_results: int option;
  next_token: string option;
  service_name: string option
}

type list_service_instance_provisioned_resources_output = {
  provisioned_resources: provisioned_resource list;
  next_token: string option
}

type list_service_instance_provisioned_resources_input = {
  next_token: string option;
  service_instance_name: string;
  service_name: string
}

type list_service_instance_outputs_output = {
  outputs: output list;
  next_token: string option
}

type list_service_instance_outputs_input = {
  deployment_id: string option;
  next_token: string option;
  service_name: string;
  service_instance_name: string
}

type list_repository_sync_definitions_output = {
  sync_definitions: repository_sync_definition list;
  next_token: string option
}

type list_repository_sync_definitions_input = {
  next_token: string option;
  sync_type: sync_type;
  repository_provider: repository_provider;
  repository_name: string
}

type list_repositories_output = {
  repositories: repository_summary list;
  next_token: string option
}

type list_repositories_input = {
  max_results: int option;
  next_token: string option
}

type environment_summary = {
  last_succeeded_deployment_id: string option;
  last_attempted_deployment_id: string option;
  component_role_arn: string option;
  provisioning: provisioning option;
  environment_account_id: string option;
  environment_account_connection_id: string option;
  proton_service_role_arn: string option;
  deployment_status_message: string option;
  deployment_status: deployment_status;
  template_minor_version: string;
  template_major_version: string;
  template_name: string;
  arn: string;
  last_deployment_succeeded_at: float;
  last_deployment_attempted_at: float;
  created_at: float;
  description: string option;
  name: string
}

type list_environments_output = {
  environments: environment_summary list;
  next_token: string option
}

type environment_template_filter = {
  major_version: string;
  template_name: string
}

type list_environments_input = {
  environment_templates: environment_template_filter list option;
  max_results: int option;
  next_token: string option
}

type environment_template_summary = {
  provisioning: provisioning option;
  recommended_version: string option;
  description: string option;
  display_name: string option;
  last_modified_at: float;
  created_at: float;
  arn: string;
  name: string
}

type list_environment_templates_output = {
  templates: environment_template_summary list;
  next_token: string option
}

type list_environment_templates_input = {
  max_results: int option;
  next_token: string option
}

type environment_template_version_summary = {
  last_modified_at: float;
  created_at: float;
  arn: string;
  description: string option;
  status_message: string option;
  status: template_version_status;
  recommended_minor_version: string option;
  minor_version: string;
  major_version: string;
  template_name: string
}

type list_environment_template_versions_output = {
  template_versions: environment_template_version_summary list;
  next_token: string option
}

type list_environment_template_versions_input = {
  major_version: string option;
  template_name: string;
  max_results: int option;
  next_token: string option
}

type list_environment_provisioned_resources_output = {
  provisioned_resources: provisioned_resource list;
  next_token: string option
}

type list_environment_provisioned_resources_input = {
  next_token: string option;
  environment_name: string
}

type list_environment_outputs_output = {
  outputs: output list;
  next_token: string option
}

type list_environment_outputs_input = {
  deployment_id: string option;
  next_token: string option;
  environment_name: string
}

type environment_account_connection_summary = {
  component_role_arn: string option;
  status: environment_account_connection_status;
  last_modified_at: float;
  requested_at: float;
  environment_name: string;
  role_arn: string;
  environment_account_id: string;
  management_account_id: string;
  arn: string;
  id: string
}

type list_environment_account_connections_output = {
  next_token: string option;
  environment_account_connections: environment_account_connection_summary list
}

type environment_account_connection_requester_account_type = | MANAGEMENT_ACCOUNT
  | ENVIRONMENT_ACCOUNT

type list_environment_account_connections_input = {
  max_results: int option;
  next_token: string option;
  statuses: environment_account_connection_status list option;
  environment_name: string option;
  requested_by: environment_account_connection_requester_account_type
}

type deployment_target_resource_type = | ENVIRONMENT
  | SERVICE_PIPELINE
  | SERVICE_INSTANCE
  | COMPONENT

type deployment_summary = {
  deployment_status: deployment_status;
  last_succeeded_deployment_id: string option;
  last_attempted_deployment_id: string option;
  component_name: string option;
  service_instance_name: string option;
  service_name: string option;
  environment_name: string;
  completed_at: float option;
  last_modified_at: float;
  created_at: float;
  target_resource_type: deployment_target_resource_type;
  target_resource_created_at: float;
  target_arn: string;
  arn: string;
  id: string
}

type list_deployments_output = {
  deployments: deployment_summary list;
  next_token: string option
}

type list_deployments_input = {
  max_results: int option;
  component_name: string option;
  service_instance_name: string option;
  service_name: string option;
  environment_name: string option;
  next_token: string option
}

type component_summary = {
  last_succeeded_deployment_id: string option;
  last_attempted_deployment_id: string option;
  deployment_status_message: string option;
  deployment_status: deployment_status;
  last_deployment_succeeded_at: float option;
  last_deployment_attempted_at: float option;
  last_modified_at: float;
  created_at: float;
  service_instance_name: string option;
  service_name: string option;
  environment_name: string;
  arn: string;
  name: string
}

type list_components_output = {
  components: component_summary list;
  next_token: string option
}

type list_components_input = {
  max_results: int option;
  service_instance_name: string option;
  service_name: string option;
  environment_name: string option;
  next_token: string option
}

type list_component_provisioned_resources_output = {
  provisioned_resources: provisioned_resource list;
  next_token: string option
}

type list_component_provisioned_resources_input = {
  next_token: string option;
  component_name: string
}

type list_component_outputs_output = {
  outputs: output list;
  next_token: string option
}

type list_component_outputs_input = {
  deployment_id: string option;
  next_token: string option;
  component_name: string
}

type get_template_sync_status_output = {
  desired_state: revision option;
  latest_successful_sync: resource_sync_attempt option;
  latest_sync: resource_sync_attempt option
}

type get_template_sync_status_input = {
  template_version: string;
  template_type: template_type;
  template_name: string
}

type get_template_sync_config_output = {
  template_sync_config: template_sync_config option
}

type get_template_sync_config_input = {
  template_type: template_type;
  template_name: string
}

type get_service_template_version_output = {
  service_template_version: service_template_version
}

type get_service_template_version_input = {
  minor_version: string;
  major_version: string;
  template_name: string
}

type get_service_template_output = {
  service_template: service_template
}

type get_service_template_input = {
  name: string
}

type get_service_sync_config_output = {
  service_sync_config: service_sync_config option
}

type get_service_sync_config_input = {
  service_name: string
}

type get_service_sync_blocker_summary_output = {
  service_sync_blocker_summary: service_sync_blocker_summary option
}

type get_service_sync_blocker_summary_input = {
  service_instance_name: string option;
  service_name: string
}

type get_service_output = {
  service: service option
}

type get_service_instance_sync_status_output = {
  desired_state: revision option;
  latest_successful_sync: resource_sync_attempt option;
  latest_sync: resource_sync_attempt option
}

type get_service_instance_sync_status_input = {
  service_instance_name: string;
  service_name: string
}

type get_service_instance_output = {
  service_instance: service_instance
}

type get_service_instance_input = {
  service_name: string;
  name: string
}

type get_service_input = {
  name: string
}

type counts_summary = {
  pipelines: resource_counts_summary option;
  service_templates: resource_counts_summary option;
  services: resource_counts_summary option;
  service_instances: resource_counts_summary option;
  environment_templates: resource_counts_summary option;
  environments: resource_counts_summary option;
  components: resource_counts_summary option
}

type get_resources_summary_output = {
  counts: counts_summary
}

type get_resources_summary_input = unit

type get_repository_sync_status_output = {
  latest_sync: repository_sync_attempt option
}

type get_repository_sync_status_input = {
  sync_type: sync_type;
  branch: string;
  repository_provider: repository_provider;
  repository_name: string
}

type get_repository_output = {
  repository: repository
}

type get_repository_input = {
  name: string;
  provider: repository_provider
}

type get_environment_template_version_output = {
  environment_template_version: environment_template_version
}

type get_environment_template_version_input = {
  minor_version: string;
  major_version: string;
  template_name: string
}

type get_environment_template_output = {
  environment_template: environment_template
}

type get_environment_template_input = {
  name: string
}

type get_environment_output = {
  environment: environment
}

type get_environment_input = {
  name: string
}

type get_environment_account_connection_output = {
  environment_account_connection: environment_account_connection
}

type get_environment_account_connection_input = {
  id: string
}

type environment_state = {
  template_minor_version: string;
  template_major_version: string;
  template_name: string;
  spec: string option
}

type component_state = {
  template_file: string option;
  service_spec: string option;
  service_instance_name: string option;
  service_name: string option
}

type deployment_state = Component of component_state | ServicePipeline of service_pipeline_state | Environment of environment_state | ServiceInstance of service_instance_state

type deployment = {
  target_state: deployment_state option;
  initial_state: deployment_state option;
  last_succeeded_deployment_id: string option;
  last_attempted_deployment_id: string option;
  completed_at: float option;
  last_modified_at: float;
  created_at: float;
  deployment_status_message: string option;
  deployment_status: deployment_status;
  component_name: string option;
  service_instance_name: string option;
  service_name: string option;
  environment_name: string;
  target_resource_type: deployment_target_resource_type;
  target_resource_created_at: float;
  target_arn: string;
  arn: string;
  id: string
}

type get_deployment_output = {
  deployment: deployment option
}

type get_deployment_input = {
  component_name: string option;
  service_instance_name: string option;
  service_name: string option;
  environment_name: string option;
  id: string
}

type get_component_output = {
  component: component option
}

type get_component_input = {
  name: string
}

type get_account_settings_output = {
  account_settings: account_settings option
}

type get_account_settings_input = unit

type delete_template_sync_config_output = {
  template_sync_config: template_sync_config option
}

type delete_template_sync_config_input = {
  template_type: template_type;
  template_name: string
}

type delete_service_template_version_output = {
  service_template_version: service_template_version option
}

type delete_service_template_version_input = {
  minor_version: string;
  major_version: string;
  template_name: string
}

type delete_service_template_output = {
  service_template: service_template option
}

type delete_service_template_input = {
  name: string
}

type delete_service_sync_config_output = {
  service_sync_config: service_sync_config option
}

type delete_service_sync_config_input = {
  service_name: string
}

type delete_service_output = {
  service: service option
}

type delete_service_input = {
  name: string
}

type delete_repository_output = {
  repository: repository option
}

type delete_repository_input = {
  name: string;
  provider: repository_provider
}

type delete_environment_template_version_output = {
  environment_template_version: environment_template_version option
}

type delete_environment_template_version_input = {
  minor_version: string;
  major_version: string;
  template_name: string
}

type delete_environment_template_output = {
  environment_template: environment_template option
}

type delete_environment_template_input = {
  name: string
}

type delete_environment_output = {
  environment: environment option
}

type delete_environment_input = {
  name: string
}

type delete_environment_account_connection_output = {
  environment_account_connection: environment_account_connection option
}

type delete_environment_account_connection_input = {
  id: string
}

type delete_deployment_output = {
  deployment: deployment option
}

type delete_deployment_input = {
  id: string
}

type delete_component_output = {
  component: component option
}

type delete_component_input = {
  name: string
}

type create_template_sync_config_output = {
  template_sync_config: template_sync_config option
}

type create_template_sync_config_input = {
  subdirectory: string option;
  branch: string;
  repository_name: string;
  repository_provider: repository_provider;
  template_type: template_type;
  template_name: string
}

type create_service_template_version_output = {
  service_template_version: service_template_version
}

type create_service_template_version_input = {
  supported_component_sources: service_template_supported_component_source_type list option;
  tags: tag list option;
  compatible_environment_templates: compatible_environment_template_input list;
  source: template_version_source_input;
  major_version: string option;
  description: string option;
  template_name: string;
  client_token: string option
}

type create_service_template_output = {
  service_template: service_template
}

type create_service_template_input = {
  tags: tag list option;
  pipeline_provisioning: provisioning option;
  encryption_key: string option;
  description: string option;
  display_name: string option;
  name: string
}

type create_service_sync_config_output = {
  service_sync_config: service_sync_config option
}

type create_service_sync_config_input = {
  file_path: string;
  branch: string;
  repository_name: string;
  repository_provider: repository_provider;
  service_name: string
}

type create_service_output = {
  service: service
}

type create_service_instance_output = {
  service_instance: service_instance
}

type create_service_instance_input = {
  client_token: string option;
  tags: tag list option;
  template_minor_version: string option;
  template_major_version: string option;
  spec: string;
  service_name: string;
  name: string
}

type create_service_input = {
  tags: tag list option;
  branch_name: string option;
  repository_id: string option;
  repository_connection_arn: string option;
  spec: string;
  template_minor_version: string option;
  template_major_version: string;
  template_name: string;
  description: string option;
  name: string
}

type create_repository_output = {
  repository: repository
}

type create_repository_input = {
  tags: tag list option;
  encryption_key: string option;
  connection_arn: string;
  name: string;
  provider: repository_provider
}

type create_environment_template_version_output = {
  environment_template_version: environment_template_version
}

type create_environment_template_version_input = {
  tags: tag list option;
  source: template_version_source_input;
  major_version: string option;
  description: string option;
  template_name: string;
  client_token: string option
}

type create_environment_template_output = {
  environment_template: environment_template
}

type create_environment_template_input = {
  tags: tag list option;
  provisioning: provisioning option;
  encryption_key: string option;
  description: string option;
  display_name: string option;
  name: string
}

type create_environment_output = {
  environment: environment
}

type create_environment_input = {
  codebuild_role_arn: string option;
  component_role_arn: string option;
  provisioning_repository: repository_branch_input option;
  tags: tag list option;
  environment_account_connection_id: string option;
  proton_service_role_arn: string option;
  spec: string;
  description: string option;
  template_minor_version: string option;
  template_major_version: string;
  template_name: string;
  name: string
}

type create_environment_account_connection_output = {
  environment_account_connection: environment_account_connection
}

type create_environment_account_connection_input = {
  codebuild_role_arn: string option;
  component_role_arn: string option;
  tags: tag list option;
  environment_name: string;
  role_arn: string option;
  management_account_id: string;
  client_token: string option
}

type create_component_output = {
  component: component
}

type create_component_input = {
  client_token: string option;
  tags: tag list option;
  service_spec: string option;
  manifest: string;
  template_file: string;
  environment_name: string option;
  service_instance_name: string option;
  service_name: string option;
  description: string option;
  name: string
}

type cancel_service_pipeline_deployment_output = {
  pipeline: service_pipeline
}

type cancel_service_pipeline_deployment_input = {
  service_name: string
}

type cancel_service_instance_deployment_output = {
  service_instance: service_instance
}

type cancel_service_instance_deployment_input = {
  service_name: string;
  service_instance_name: string
}

type cancel_environment_deployment_output = {
  environment: environment
}

type cancel_environment_deployment_input = {
  environment_name: string
}

type cancel_component_deployment_output = {
  component: component
}

type cancel_component_deployment_input = {
  component_name: string
}



type accept_environment_account_connection_output = {
  environment_account_connection: environment_account_connection
}

type accept_environment_account_connection_input = {
  id: string
}

type base_document = Json.t

