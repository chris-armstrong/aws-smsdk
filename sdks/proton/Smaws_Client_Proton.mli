open Smaws_Lib
val service : Service.descriptor

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

val make_template_sync_config :
  ?subdirectory:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  template_type:template_type ->
  template_name:string ->
  unit -> template_sync_config

val make_update_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit
-> update_template_sync_config_output

val make_update_template_sync_config_input :
  ?subdirectory:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  template_type:template_type ->
  template_name:string ->
  unit
-> update_template_sync_config_input

val make_compatible_environment_template :
  major_version:string -> template_name:string -> unit
-> compatible_environment_template

val make_service_template_version :
  ?supported_component_sources:service_template_supported_component_source_type list ->
  ?schema:string ->
  ?description:string ->
  ?status_message:string ->
  ?recommended_minor_version:string ->
  compatible_environment_templates:compatible_environment_template list ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  status:template_version_status ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> service_template_version

val make_update_service_template_version_output :
  service_template_version:service_template_version -> unit
-> update_service_template_version_output

val make_compatible_environment_template_input :
  major_version:string -> template_name:string -> unit
-> compatible_environment_template_input

val make_update_service_template_version_input :
  ?supported_component_sources:service_template_supported_component_source_type list ->
  ?compatible_environment_templates:compatible_environment_template_input list ->
  ?status:template_version_status ->
  ?description:string ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit -> update_service_template_version_input

val make_service_template :
  ?pipeline_provisioning:provisioning ->
  ?encryption_key:string ->
  ?recommended_version:string ->
  ?description:string ->
  ?display_name:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> service_template

val make_update_service_template_output :
  service_template:service_template -> unit
-> update_service_template_output

val make_update_service_template_input :
  ?description:string -> ?display_name:string -> name:string -> unit
-> update_service_template_input

val make_service_sync_config :
  file_path:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  service_name:string ->
  unit -> service_sync_config

val make_update_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit
-> update_service_sync_config_output

val make_update_service_sync_config_input :
  file_path:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  service_name:string ->
  unit -> update_service_sync_config_input

val make_sync_blocker_context : value:string -> key:string -> unit
-> sync_blocker_context

val make_sync_blocker :
  ?resolved_at:float ->
  ?resolved_reason:string ->
  ?contexts:sync_blocker_context list ->
  created_at:float ->
  created_reason:string ->
  status:blocker_status ->
  type_:blocker_type ->
  id:string ->
  unit -> sync_blocker

val make_update_service_sync_blocker_output :
  ?service_instance_name:string ->
  service_sync_blocker:sync_blocker ->
  service_name:string ->
  unit
-> update_service_sync_blocker_output

val make_update_service_sync_blocker_input :
  resolved_reason:string -> id:string -> unit
-> update_service_sync_blocker_input

val make_service_pipeline :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?spec:string ->
  ?deployment_status_message:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  arn:string ->
  unit -> service_pipeline

val make_update_service_pipeline_output : pipeline:service_pipeline -> unit
-> update_service_pipeline_output

val make_update_service_pipeline_input :
  ?template_minor_version:string ->
  ?template_major_version:string ->
  deployment_type:deployment_update_type ->
  spec:string ->
  service_name:string ->
  unit -> update_service_pipeline_input

val make_service :
  ?branch_name:string ->
  ?repository_id:string ->
  ?repository_connection_arn:string ->
  ?pipeline:service_pipeline ->
  ?status_message:string ->
  ?description:string ->
  spec:string ->
  status:service_status ->
  last_modified_at:float ->
  created_at:float ->
  template_name:string ->
  arn:string ->
  name:string ->
  unit -> service

val make_update_service_output : service:service -> unit
-> update_service_output

val make_service_instance :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?last_client_request_token:string ->
  ?spec:string ->
  ?deployment_status_message:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  environment_name:string ->
  service_name:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> service_instance

val make_update_service_instance_output :
  service_instance:service_instance -> unit
-> update_service_instance_output

val make_update_service_instance_input :
  ?client_token:string ->
  ?template_minor_version:string ->
  ?template_major_version:string ->
  ?spec:string ->
  deployment_type:deployment_update_type ->
  service_name:string ->
  name:string ->
  unit -> update_service_instance_input

val make_update_service_input :
  ?spec:string -> ?description:string -> name:string -> unit
-> update_service_input

val make_environment_template_version :
  ?schema:string ->
  ?description:string ->
  ?status_message:string ->
  ?recommended_minor_version:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  status:template_version_status ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> environment_template_version

val make_update_environment_template_version_output :
  environment_template_version:environment_template_version -> unit
-> update_environment_template_version_output

val make_update_environment_template_version_input :
  ?status:template_version_status ->
  ?description:string ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> update_environment_template_version_input

val make_environment_template :
  ?provisioning:provisioning ->
  ?encryption_key:string ->
  ?recommended_version:string ->
  ?description:string ->
  ?display_name:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> environment_template

val make_update_environment_template_output :
  environment_template:environment_template -> unit
-> update_environment_template_output

val make_update_environment_template_input :
  ?description:string -> ?display_name:string -> name:string -> unit
-> update_environment_template_input

val make_repository_branch :
  branch:string ->
  name:string ->
  provider:repository_provider ->
  arn:string ->
  unit -> repository_branch

val make_environment :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?provisioning_repository:repository_branch ->
  ?provisioning:provisioning ->
  ?spec:string ->
  ?environment_account_id:string ->
  ?environment_account_connection_id:string ->
  ?proton_service_role_arn:string ->
  ?deployment_status_message:string ->
  ?description:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  arn:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  name:string ->
  unit -> environment

val make_update_environment_output : environment:environment -> unit
-> update_environment_output

val make_repository_branch_input :
  branch:string -> name:string -> provider:repository_provider -> unit
-> repository_branch_input

val make_update_environment_input :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?provisioning_repository:repository_branch_input ->
  ?environment_account_connection_id:string ->
  ?proton_service_role_arn:string ->
  ?template_minor_version:string ->
  ?template_major_version:string ->
  ?spec:string ->
  ?description:string ->
  deployment_type:deployment_update_type ->
  name:string ->
  unit -> update_environment_input

val make_environment_account_connection :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  status:environment_account_connection_status ->
  last_modified_at:float ->
  requested_at:float ->
  environment_name:string ->
  role_arn:string ->
  environment_account_id:string ->
  management_account_id:string ->
  arn:string ->
  id:string ->
  unit
-> environment_account_connection

val make_update_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> update_environment_account_connection_output

val make_update_environment_account_connection_input :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?role_arn:string ->
  id:string ->
  unit -> update_environment_account_connection_input

val make_component :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?last_client_request_token:string ->
  ?service_spec:string ->
  ?deployment_status_message:string ->
  ?last_deployment_succeeded_at:float ->
  ?last_deployment_attempted_at:float ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?description:string ->
  deployment_status:deployment_status ->
  last_modified_at:float ->
  created_at:float ->
  environment_name:string ->
  arn:string ->
  name:string ->
  unit -> component

val make_update_component_output : component:component -> unit
-> update_component_output

val make_update_component_input :
  ?client_token:string ->
  ?template_file:string ->
  ?service_spec:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?description:string ->
  deployment_type:component_deployment_update_type ->
  name:string ->
  unit -> update_component_input

val make_account_settings :
  ?pipeline_codebuild_role_arn:string ->
  ?pipeline_provisioning_repository:repository_branch ->
  ?pipeline_service_role_arn:string ->
  unit -> account_settings

val make_update_account_settings_output :
  account_settings:account_settings -> unit
-> update_account_settings_output

val make_update_account_settings_input :
  ?pipeline_codebuild_role_arn:string ->
  ?delete_pipeline_provisioning_repository:bool ->
  ?pipeline_provisioning_repository:repository_branch_input ->
  ?pipeline_service_role_arn:string ->
  unit -> update_account_settings_input

val make_untag_resource_output : unit
-> untag_resource_output

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_s3_object_source : key:string -> bucket:string -> unit
-> s3_object_source

val make_tag_resource_output : unit -> tag_resource_output

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input

val make_service_template_version_summary :
  ?description:string ->
  ?status_message:string ->
  ?recommended_minor_version:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  status:template_version_status ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit -> service_template_version_summary

val make_service_template_summary :
  ?pipeline_provisioning:provisioning ->
  ?recommended_version:string ->
  ?description:string ->
  ?display_name:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> service_template_summary

val make_service_sync_blocker_summary :
  ?latest_blockers:sync_blocker list ->
  ?service_instance_name:string ->
  service_name:string ->
  unit -> service_sync_blocker_summary

val make_service_summary :
  ?status_message:string ->
  ?description:string ->
  status:service_status ->
  last_modified_at:float ->
  created_at:float ->
  template_name:string ->
  arn:string ->
  name:string ->
  unit -> service_summary

val make_service_pipeline_state :
  ?spec:string ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  unit -> service_pipeline_state

val make_service_instance_summary :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?deployment_status_message:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  environment_name:string ->
  service_name:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> service_instance_summary

val make_service_instance_state :
  ?last_successful_service_pipeline_deployment_id:string ->
  ?last_successful_environment_deployment_id:string ->
  ?last_successful_component_deployment_ids:string list ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  spec:string ->
  unit -> service_instance_state

val make_revision :
  branch:string ->
  directory:string ->
  sha:string ->
  repository_provider:repository_provider ->
  repository_name:string ->
  unit -> revision

val make_resource_sync_event :
  ?external_id:string -> event:string -> time:float -> type_:string -> unit
-> resource_sync_event

val make_resource_sync_attempt :
  events:resource_sync_event list ->
  status:resource_sync_status ->
  started_at:float ->
  target:string ->
  target_revision:revision ->
  initial_revision:revision ->
  unit -> resource_sync_attempt

val make_resource_counts_summary :
  ?behind_minor:int ->
  ?behind_major:int ->
  ?up_to_date:int ->
  ?failed:int ->
  total:int ->
  unit -> resource_counts_summary

val make_repository_sync_event :
  ?external_id:string -> event:string -> time:float -> type_:string -> unit
-> repository_sync_event

val make_repository_sync_definition :
  directory:string -> branch:string -> parent:string -> target:string -> unit
-> repository_sync_definition

val make_repository_sync_attempt :
  events:repository_sync_event list ->
  status:repository_sync_status ->
  started_at:float ->
  unit -> repository_sync_attempt

val make_repository_summary :
  connection_arn:string ->
  name:string ->
  provider:repository_provider ->
  arn:string ->
  unit -> repository_summary

val make_repository :
  ?encryption_key:string ->
  connection_arn:string ->
  name:string ->
  provider:repository_provider ->
  arn:string ->
  unit -> repository

val make_reject_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> reject_environment_account_connection_output

val make_reject_environment_account_connection_input : id:string -> unit
-> reject_environment_account_connection_input

val make_provisioned_resource :
  ?provisioning_engine:provisioned_resource_engine ->
  ?identifier:string ->
  ?name:string ->
  unit -> provisioned_resource

val make_output : ?value_string:string -> ?key:string -> unit
-> output

val make_notify_resource_deployment_status_change_output : unit
-> notify_resource_deployment_status_change_output

val make_notify_resource_deployment_status_change_input :
  ?status_message:string ->
  ?deployment_id:string ->
  ?outputs:output list ->
  ?status:resource_deployment_status ->
  resource_arn:string ->
  unit
-> notify_resource_deployment_status_change_input

val make_list_tags_for_resource_output :
  ?next_token:string -> tags:tag list -> unit
-> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?max_results:int -> ?next_token:string -> resource_arn:string -> unit
-> list_tags_for_resource_input

val make_list_services_output :
  ?next_token:string -> services:service_summary list -> unit
-> list_services_output

val make_list_services_input : ?max_results:int -> ?next_token:string -> unit
-> list_services_input

val make_list_service_templates_output :
  ?next_token:string -> templates:service_template_summary list -> unit
-> list_service_templates_output

val make_list_service_templates_input :
  ?max_results:int -> ?next_token:string -> unit
-> list_service_templates_input

val make_list_service_template_versions_output :
  ?next_token:string ->
  template_versions:service_template_version_summary list ->
  unit
-> list_service_template_versions_output

val make_list_service_template_versions_input :
  ?major_version:string ->
  ?max_results:int ->
  ?next_token:string ->
  template_name:string ->
  unit
-> list_service_template_versions_input

val make_list_service_pipeline_provisioned_resources_output :
  ?next_token:string ->
  provisioned_resources:provisioned_resource list ->
  unit
-> list_service_pipeline_provisioned_resources_output

val make_list_service_pipeline_provisioned_resources_input :
  ?next_token:string -> service_name:string -> unit
-> list_service_pipeline_provisioned_resources_input

val make_list_service_pipeline_outputs_output :
  ?next_token:string -> outputs:output list -> unit
-> list_service_pipeline_outputs_output

val make_list_service_pipeline_outputs_input :
  ?deployment_id:string -> ?next_token:string -> service_name:string -> unit
-> list_service_pipeline_outputs_input

val make_list_service_instances_output :
  ?next_token:string ->
  service_instances:service_instance_summary list ->
  unit
-> list_service_instances_output

val make_list_service_instances_filter :
  ?value:string -> ?key:list_service_instances_filter_by -> unit
-> list_service_instances_filter

val make_list_service_instances_input :
  ?sort_order:sort_order ->
  ?sort_by:list_service_instances_sort_by ->
  ?filters:list_service_instances_filter list ->
  ?max_results:int ->
  ?next_token:string ->
  ?service_name:string ->
  unit
-> list_service_instances_input

val make_list_service_instance_provisioned_resources_output :
  ?next_token:string ->
  provisioned_resources:provisioned_resource list ->
  unit
-> list_service_instance_provisioned_resources_output

val make_list_service_instance_provisioned_resources_input :
  ?next_token:string ->
  service_instance_name:string ->
  service_name:string ->
  unit
-> list_service_instance_provisioned_resources_input

val make_list_service_instance_outputs_output :
  ?next_token:string -> outputs:output list -> unit
-> list_service_instance_outputs_output

val make_list_service_instance_outputs_input :
  ?deployment_id:string ->
  ?next_token:string ->
  service_name:string ->
  service_instance_name:string ->
  unit
-> list_service_instance_outputs_input

val make_list_repository_sync_definitions_output :
  ?next_token:string ->
  sync_definitions:repository_sync_definition list ->
  unit
-> list_repository_sync_definitions_output

val make_list_repository_sync_definitions_input :
  ?next_token:string ->
  sync_type:sync_type ->
  repository_provider:repository_provider ->
  repository_name:string ->
  unit
-> list_repository_sync_definitions_input

val make_list_repositories_output :
  ?next_token:string -> repositories:repository_summary list -> unit
-> list_repositories_output

val make_list_repositories_input :
  ?max_results:int -> ?next_token:string -> unit
-> list_repositories_input

val make_environment_summary :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?component_role_arn:string ->
  ?provisioning:provisioning ->
  ?environment_account_id:string ->
  ?environment_account_connection_id:string ->
  ?proton_service_role_arn:string ->
  ?deployment_status_message:string ->
  ?description:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  arn:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  name:string ->
  unit -> environment_summary

val make_list_environments_output :
  ?next_token:string -> environments:environment_summary list -> unit
-> list_environments_output

val make_environment_template_filter :
  major_version:string -> template_name:string -> unit
-> environment_template_filter

val make_list_environments_input :
  ?environment_templates:environment_template_filter list ->
  ?max_results:int ->
  ?next_token:string ->
  unit -> list_environments_input

val make_environment_template_summary :
  ?provisioning:provisioning ->
  ?recommended_version:string ->
  ?description:string ->
  ?display_name:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit
-> environment_template_summary

val make_list_environment_templates_output :
  ?next_token:string -> templates:environment_template_summary list -> unit
-> list_environment_templates_output

val make_list_environment_templates_input :
  ?max_results:int -> ?next_token:string -> unit
-> list_environment_templates_input

val make_environment_template_version_summary :
  ?description:string ->
  ?status_message:string ->
  ?recommended_minor_version:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  status:template_version_status ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> environment_template_version_summary

val make_list_environment_template_versions_output :
  ?next_token:string ->
  template_versions:environment_template_version_summary list ->
  unit
-> list_environment_template_versions_output

val make_list_environment_template_versions_input :
  ?major_version:string ->
  ?max_results:int ->
  ?next_token:string ->
  template_name:string ->
  unit
-> list_environment_template_versions_input

val make_list_environment_provisioned_resources_output :
  ?next_token:string ->
  provisioned_resources:provisioned_resource list ->
  unit
-> list_environment_provisioned_resources_output

val make_list_environment_provisioned_resources_input :
  ?next_token:string -> environment_name:string -> unit
-> list_environment_provisioned_resources_input

val make_list_environment_outputs_output :
  ?next_token:string -> outputs:output list -> unit
-> list_environment_outputs_output

val make_list_environment_outputs_input :
  ?deployment_id:string ->
  ?next_token:string ->
  environment_name:string ->
  unit
-> list_environment_outputs_input

val make_environment_account_connection_summary :
  ?component_role_arn:string ->
  status:environment_account_connection_status ->
  last_modified_at:float ->
  requested_at:float ->
  environment_name:string ->
  role_arn:string ->
  environment_account_id:string ->
  management_account_id:string ->
  arn:string ->
  id:string ->
  unit
-> environment_account_connection_summary

val make_list_environment_account_connections_output :
  ?next_token:string ->
  environment_account_connections:environment_account_connection_summary list ->
  unit
-> list_environment_account_connections_output

val make_list_environment_account_connections_input :
  ?max_results:int ->
  ?next_token:string ->
  ?statuses:environment_account_connection_status list ->
  ?environment_name:string ->
  requested_by:environment_account_connection_requester_account_type ->
  unit
-> list_environment_account_connections_input

val make_deployment_summary :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?component_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?completed_at:float ->
  deployment_status:deployment_status ->
  environment_name:string ->
  last_modified_at:float ->
  created_at:float ->
  target_resource_type:deployment_target_resource_type ->
  target_resource_created_at:float ->
  target_arn:string ->
  arn:string ->
  id:string ->
  unit -> deployment_summary

val make_list_deployments_output :
  ?next_token:string -> deployments:deployment_summary list -> unit
-> list_deployments_output

val make_list_deployments_input :
  ?max_results:int ->
  ?component_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?environment_name:string ->
  ?next_token:string ->
  unit -> list_deployments_input

val make_component_summary :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?deployment_status_message:string ->
  ?last_deployment_succeeded_at:float ->
  ?last_deployment_attempted_at:float ->
  ?service_instance_name:string ->
  ?service_name:string ->
  deployment_status:deployment_status ->
  last_modified_at:float ->
  created_at:float ->
  environment_name:string ->
  arn:string ->
  name:string ->
  unit -> component_summary

val make_list_components_output :
  ?next_token:string -> components:component_summary list -> unit
-> list_components_output

val make_list_components_input :
  ?max_results:int ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?environment_name:string ->
  ?next_token:string ->
  unit
-> list_components_input

val make_list_component_provisioned_resources_output :
  ?next_token:string ->
  provisioned_resources:provisioned_resource list ->
  unit
-> list_component_provisioned_resources_output

val make_list_component_provisioned_resources_input :
  ?next_token:string -> component_name:string -> unit
-> list_component_provisioned_resources_input

val make_list_component_outputs_output :
  ?next_token:string -> outputs:output list -> unit
-> list_component_outputs_output

val make_list_component_outputs_input :
  ?deployment_id:string ->
  ?next_token:string ->
  component_name:string ->
  unit
-> list_component_outputs_input

val make_get_template_sync_status_output :
  ?desired_state:revision ->
  ?latest_successful_sync:resource_sync_attempt ->
  ?latest_sync:resource_sync_attempt ->
  unit
-> get_template_sync_status_output

val make_get_template_sync_status_input :
  template_version:string ->
  template_type:template_type ->
  template_name:string ->
  unit
-> get_template_sync_status_input

val make_get_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit
-> get_template_sync_config_output

val make_get_template_sync_config_input :
  template_type:template_type -> template_name:string -> unit
-> get_template_sync_config_input

val make_get_service_template_version_output :
  service_template_version:service_template_version -> unit
-> get_service_template_version_output

val make_get_service_template_version_input :
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> get_service_template_version_input

val make_get_service_template_output :
  service_template:service_template -> unit
-> get_service_template_output

val make_get_service_template_input : name:string -> unit
-> get_service_template_input

val make_get_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit
-> get_service_sync_config_output

val make_get_service_sync_config_input : service_name:string -> unit
-> get_service_sync_config_input

val make_get_service_sync_blocker_summary_output :
  ?service_sync_blocker_summary:service_sync_blocker_summary -> unit
-> get_service_sync_blocker_summary_output

val make_get_service_sync_blocker_summary_input :
  ?service_instance_name:string -> service_name:string -> unit
-> get_service_sync_blocker_summary_input

val make_get_service_output : ?service:service -> unit
-> get_service_output

val make_get_service_instance_sync_status_output :
  ?desired_state:revision ->
  ?latest_successful_sync:resource_sync_attempt ->
  ?latest_sync:resource_sync_attempt ->
  unit
-> get_service_instance_sync_status_output

val make_get_service_instance_sync_status_input :
  service_instance_name:string -> service_name:string -> unit
-> get_service_instance_sync_status_input

val make_get_service_instance_output :
  service_instance:service_instance -> unit
-> get_service_instance_output

val make_get_service_instance_input :
  service_name:string -> name:string -> unit
-> get_service_instance_input

val make_get_service_input : name:string -> unit
-> get_service_input

val make_counts_summary :
  ?pipelines:resource_counts_summary ->
  ?service_templates:resource_counts_summary ->
  ?services:resource_counts_summary ->
  ?service_instances:resource_counts_summary ->
  ?environment_templates:resource_counts_summary ->
  ?environments:resource_counts_summary ->
  ?components:resource_counts_summary ->
  unit -> counts_summary

val make_get_resources_summary_output : counts:counts_summary -> unit
-> get_resources_summary_output

val make_get_resources_summary_input : unit
-> get_resources_summary_input

val make_get_repository_sync_status_output :
  ?latest_sync:repository_sync_attempt -> unit
-> get_repository_sync_status_output

val make_get_repository_sync_status_input :
  sync_type:sync_type ->
  branch:string ->
  repository_provider:repository_provider ->
  repository_name:string ->
  unit -> get_repository_sync_status_input

val make_get_repository_output : repository:repository -> unit
-> get_repository_output

val make_get_repository_input :
  name:string -> provider:repository_provider -> unit
-> get_repository_input

val make_get_environment_template_version_output :
  environment_template_version:environment_template_version -> unit
-> get_environment_template_version_output

val make_get_environment_template_version_input :
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> get_environment_template_version_input

val make_get_environment_template_output :
  environment_template:environment_template -> unit
-> get_environment_template_output

val make_get_environment_template_input : name:string -> unit
-> get_environment_template_input

val make_get_environment_output : environment:environment -> unit
-> get_environment_output

val make_get_environment_input : name:string -> unit
-> get_environment_input

val make_get_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> get_environment_account_connection_output

val make_get_environment_account_connection_input : id:string -> unit
-> get_environment_account_connection_input

val make_environment_state :
  ?spec:string ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  unit -> environment_state

val make_component_state :
  ?template_file:string ->
  ?service_spec:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  unit -> component_state

val make_deployment :
  ?target_state:deployment_state ->
  ?initial_state:deployment_state ->
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?completed_at:float ->
  ?deployment_status_message:string ->
  ?component_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  last_modified_at:float ->
  created_at:float ->
  deployment_status:deployment_status ->
  environment_name:string ->
  target_resource_type:deployment_target_resource_type ->
  target_resource_created_at:float ->
  target_arn:string ->
  arn:string ->
  id:string ->
  unit -> deployment

val make_get_deployment_output : ?deployment:deployment -> unit
-> get_deployment_output

val make_get_deployment_input :
  ?component_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?environment_name:string ->
  id:string ->
  unit -> get_deployment_input

val make_get_component_output : ?component:component -> unit
-> get_component_output

val make_get_component_input : name:string -> unit
-> get_component_input

val make_get_account_settings_output :
  ?account_settings:account_settings -> unit
-> get_account_settings_output

val make_get_account_settings_input : unit
-> get_account_settings_input

val make_delete_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit
-> delete_template_sync_config_output

val make_delete_template_sync_config_input :
  template_type:template_type -> template_name:string -> unit
-> delete_template_sync_config_input

val make_delete_service_template_version_output :
  ?service_template_version:service_template_version -> unit
-> delete_service_template_version_output

val make_delete_service_template_version_input :
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> delete_service_template_version_input

val make_delete_service_template_output :
  ?service_template:service_template -> unit
-> delete_service_template_output

val make_delete_service_template_input : name:string -> unit
-> delete_service_template_input

val make_delete_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit
-> delete_service_sync_config_output

val make_delete_service_sync_config_input : service_name:string -> unit
-> delete_service_sync_config_input

val make_delete_service_output : ?service:service -> unit
-> delete_service_output

val make_delete_service_input : name:string -> unit
-> delete_service_input

val make_delete_repository_output : ?repository:repository -> unit
-> delete_repository_output

val make_delete_repository_input :
  name:string -> provider:repository_provider -> unit
-> delete_repository_input

val make_delete_environment_template_version_output :
  ?environment_template_version:environment_template_version -> unit
-> delete_environment_template_version_output

val make_delete_environment_template_version_input :
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> delete_environment_template_version_input

val make_delete_environment_template_output :
  ?environment_template:environment_template -> unit
-> delete_environment_template_output

val make_delete_environment_template_input : name:string -> unit
-> delete_environment_template_input

val make_delete_environment_output : ?environment:environment -> unit
-> delete_environment_output

val make_delete_environment_input : name:string -> unit
-> delete_environment_input

val make_delete_environment_account_connection_output :
  ?environment_account_connection:environment_account_connection -> unit
-> delete_environment_account_connection_output

val make_delete_environment_account_connection_input : id:string -> unit
-> delete_environment_account_connection_input

val make_delete_deployment_output : ?deployment:deployment -> unit
-> delete_deployment_output

val make_delete_deployment_input : id:string -> unit
-> delete_deployment_input

val make_delete_component_output : ?component:component -> unit
-> delete_component_output

val make_delete_component_input : name:string -> unit
-> delete_component_input

val make_create_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit
-> create_template_sync_config_output

val make_create_template_sync_config_input :
  ?subdirectory:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  template_type:template_type ->
  template_name:string ->
  unit
-> create_template_sync_config_input

val make_create_service_template_version_output :
  service_template_version:service_template_version -> unit
-> create_service_template_version_output

val make_create_service_template_version_input :
  ?supported_component_sources:service_template_supported_component_source_type list ->
  ?tags:tag list ->
  ?major_version:string ->
  ?description:string ->
  ?client_token:string ->
  compatible_environment_templates:compatible_environment_template_input list ->
  source:template_version_source_input ->
  template_name:string ->
  unit
-> create_service_template_version_input

val make_create_service_template_output :
  service_template:service_template -> unit
-> create_service_template_output

val make_create_service_template_input :
  ?tags:tag list ->
  ?pipeline_provisioning:provisioning ->
  ?encryption_key:string ->
  ?description:string ->
  ?display_name:string ->
  name:string ->
  unit
-> create_service_template_input

val make_create_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit
-> create_service_sync_config_output

val make_create_service_sync_config_input :
  file_path:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  service_name:string ->
  unit -> create_service_sync_config_input

val make_create_service_output : service:service -> unit
-> create_service_output

val make_create_service_instance_output :
  service_instance:service_instance -> unit
-> create_service_instance_output

val make_create_service_instance_input :
  ?client_token:string ->
  ?tags:tag list ->
  ?template_minor_version:string ->
  ?template_major_version:string ->
  spec:string ->
  service_name:string ->
  name:string ->
  unit -> create_service_instance_input

val make_create_service_input :
  ?tags:tag list ->
  ?branch_name:string ->
  ?repository_id:string ->
  ?repository_connection_arn:string ->
  ?template_minor_version:string ->
  ?description:string ->
  spec:string ->
  template_major_version:string ->
  template_name:string ->
  name:string ->
  unit -> create_service_input

val make_create_repository_output : repository:repository -> unit
-> create_repository_output

val make_create_repository_input :
  ?tags:tag list ->
  ?encryption_key:string ->
  connection_arn:string ->
  name:string ->
  provider:repository_provider ->
  unit
-> create_repository_input

val make_create_environment_template_version_output :
  environment_template_version:environment_template_version -> unit
-> create_environment_template_version_output

val make_create_environment_template_version_input :
  ?tags:tag list ->
  ?major_version:string ->
  ?description:string ->
  ?client_token:string ->
  source:template_version_source_input ->
  template_name:string ->
  unit
-> create_environment_template_version_input

val make_create_environment_template_output :
  environment_template:environment_template -> unit
-> create_environment_template_output

val make_create_environment_template_input :
  ?tags:tag list ->
  ?provisioning:provisioning ->
  ?encryption_key:string ->
  ?description:string ->
  ?display_name:string ->
  name:string ->
  unit
-> create_environment_template_input

val make_create_environment_output : environment:environment -> unit
-> create_environment_output

val make_create_environment_input :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?provisioning_repository:repository_branch_input ->
  ?tags:tag list ->
  ?environment_account_connection_id:string ->
  ?proton_service_role_arn:string ->
  ?description:string ->
  ?template_minor_version:string ->
  spec:string ->
  template_major_version:string ->
  template_name:string ->
  name:string ->
  unit
-> create_environment_input

val make_create_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> create_environment_account_connection_output

val make_create_environment_account_connection_input :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?tags:tag list ->
  ?role_arn:string ->
  ?client_token:string ->
  environment_name:string ->
  management_account_id:string ->
  unit
-> create_environment_account_connection_input

val make_create_component_output : component:component -> unit
-> create_component_output

val make_create_component_input :
  ?client_token:string ->
  ?tags:tag list ->
  ?service_spec:string ->
  ?environment_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?description:string ->
  manifest:string ->
  template_file:string ->
  name:string ->
  unit
-> create_component_input

val make_cancel_service_pipeline_deployment_output :
  pipeline:service_pipeline -> unit
-> cancel_service_pipeline_deployment_output

val make_cancel_service_pipeline_deployment_input :
  service_name:string -> unit
-> cancel_service_pipeline_deployment_input

val make_cancel_service_instance_deployment_output :
  service_instance:service_instance -> unit
-> cancel_service_instance_deployment_output

val make_cancel_service_instance_deployment_input :
  service_name:string -> service_instance_name:string -> unit
-> cancel_service_instance_deployment_input

val make_cancel_environment_deployment_output :
  environment:environment -> unit
-> cancel_environment_deployment_output

val make_cancel_environment_deployment_input :
  environment_name:string -> unit
-> cancel_environment_deployment_input

val make_cancel_component_deployment_output : component:component -> unit
-> cancel_component_deployment_output

val make_cancel_component_deployment_input : component_name:string -> unit
-> cancel_component_deployment_input

val make_accept_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> accept_environment_account_connection_output

val make_accept_environment_account_connection_input : id:string -> unit
-> accept_environment_account_connection_input

module UpdateTemplateSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      update_template_sync_config_input ->
        (update_template_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateServiceTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_template_version_input ->
        (update_service_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateServiceTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_template_input ->
        (update_service_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateServiceSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_sync_config_input ->
        (update_service_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateServiceSyncBlocker : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_sync_blocker_input ->
        (update_service_sync_blocker_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateServicePipeline : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_pipeline_input ->
        (update_service_pipeline_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateServiceInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_instance_input ->
        (update_service_instance_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_input ->
        (update_service_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateEnvironmentTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      update_environment_template_version_input ->
        (update_environment_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateEnvironmentTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      update_environment_template_input ->
        (update_environment_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_environment_account_connection_input ->
        (update_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateEnvironment : sig
  val request :
    Smaws_Lib.Context.t ->
      update_environment_input ->
        (update_environment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateComponent : sig
  val request :
    Smaws_Lib.Context.t ->
      update_component_input ->
        (update_component_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_account_settings_input ->
        (update_account_settings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module RejectEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      reject_environment_account_connection_input ->
        (reject_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module NotifyResourceDeploymentStatusChange : sig
  val request :
    Smaws_Lib.Context.t ->
      notify_resource_deployment_status_change_input ->
        (notify_resource_deployment_status_change_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_input ->
        (list_services_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListServiceTemplates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_templates_input ->
        (list_service_templates_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListServiceTemplateVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_template_versions_input ->
        (list_service_template_versions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListServicePipelineProvisionedResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_pipeline_provisioned_resources_input ->
        (list_service_pipeline_provisioned_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListServicePipelineOutputs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_pipeline_outputs_input ->
        (list_service_pipeline_outputs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListServiceInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_instances_input ->
        (list_service_instances_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListServiceInstanceProvisionedResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_instance_provisioned_resources_input ->
        (list_service_instance_provisioned_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListServiceInstanceOutputs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_instance_outputs_input ->
        (list_service_instance_outputs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListRepositorySyncDefinitions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_sync_definitions_input ->
        (list_repository_sync_definitions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListRepositories : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repositories_input ->
        (list_repositories_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListEnvironments : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environments_input ->
        (list_environments_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListEnvironmentTemplates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_templates_input ->
        (list_environment_templates_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListEnvironmentTemplateVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_template_versions_input ->
        (list_environment_template_versions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListEnvironmentProvisionedResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_provisioned_resources_input ->
        (list_environment_provisioned_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListEnvironmentOutputs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_outputs_input ->
        (list_environment_outputs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListEnvironmentAccountConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_environment_account_connections_input ->
        (list_environment_account_connections_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListDeployments : sig
  val request :
    Smaws_Lib.Context.t ->
      list_deployments_input ->
        (list_deployments_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListComponents : sig
  val request :
    Smaws_Lib.Context.t ->
      list_components_input ->
        (list_components_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListComponentProvisionedResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_component_provisioned_resources_input ->
        (list_component_provisioned_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListComponentOutputs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_component_outputs_input ->
        (list_component_outputs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetTemplateSyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_template_sync_status_input ->
        (get_template_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetTemplateSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      get_template_sync_config_input ->
        (get_template_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetServiceTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_template_version_input ->
        (get_service_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetServiceTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_template_input ->
        (get_service_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetServiceSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_sync_config_input ->
        (get_service_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetServiceSyncBlockerSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_sync_blocker_summary_input ->
        (get_service_sync_blocker_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetServiceInstanceSyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_instance_sync_status_input ->
        (get_service_instance_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetServiceInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_instance_input ->
        (get_service_instance_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetService : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_input ->
        (get_service_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetResourcesSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resources_summary_input ->
        (get_resources_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetRepositorySyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_sync_status_input ->
        (get_repository_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetRepository : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_input ->
        (get_repository_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetEnvironmentTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      get_environment_template_version_input ->
        (get_environment_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetEnvironmentTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_environment_template_input ->
        (get_environment_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      get_environment_account_connection_input ->
        (get_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetEnvironment : sig
  val request :
    Smaws_Lib.Context.t ->
      get_environment_input ->
        (get_environment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      get_deployment_input ->
        (get_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetComponent : sig
  val request :
    Smaws_Lib.Context.t ->
      get_component_input ->
        (get_component_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      get_account_settings_input ->
        (get_account_settings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteTemplateSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_template_sync_config_input ->
        (delete_template_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteServiceTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_template_version_input ->
        (delete_service_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteServiceTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_template_input ->
        (delete_service_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteServiceSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_sync_config_input ->
        (delete_service_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_input ->
        (delete_service_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteRepository : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_repository_input ->
        (delete_repository_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteEnvironmentTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_environment_template_version_input ->
        (delete_environment_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteEnvironmentTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_environment_template_input ->
        (delete_environment_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_environment_account_connection_input ->
        (delete_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteEnvironment : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_environment_input ->
        (delete_environment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_deployment_input ->
        (delete_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteComponent : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_component_input ->
        (delete_component_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateTemplateSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      create_template_sync_config_input ->
        (create_template_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateServiceTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_template_version_input ->
        (create_service_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateServiceTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_template_input ->
        (create_service_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateServiceSyncConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_sync_config_input ->
        (create_service_sync_config_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateServiceInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_instance_input ->
        (create_service_instance_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_input ->
        (create_service_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateRepository : sig
  val request :
    Smaws_Lib.Context.t ->
      create_repository_input ->
        (create_repository_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateEnvironmentTemplateVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      create_environment_template_version_input ->
        (create_environment_template_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateEnvironmentTemplate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_environment_template_input ->
        (create_environment_template_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_environment_account_connection_input ->
        (create_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateEnvironment : sig
  val request :
    Smaws_Lib.Context.t ->
      create_environment_input ->
        (create_environment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateComponent : sig
  val request :
    Smaws_Lib.Context.t ->
      create_component_input ->
        (create_component_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CancelServicePipelineDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_service_pipeline_deployment_input ->
        (cancel_service_pipeline_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CancelServiceInstanceDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_service_instance_deployment_input ->
        (cancel_service_instance_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CancelEnvironmentDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_environment_deployment_input ->
        (cancel_environment_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CancelComponentDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_component_deployment_input ->
        (cancel_component_deployment_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module AcceptEnvironmentAccountConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      accept_environment_account_connection_input ->
        (accept_environment_account_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

