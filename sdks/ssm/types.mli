open Smaws_Lib
val service : Service.descriptor

type update_service_setting_result = unit

type update_service_setting_request = {
  setting_value: string;
  setting_id: string
}

type too_many_updates = {
  message: string option
}

type service_setting_not_found = {
  message: string option
}

type internal_server_error = {
  message: string option
}

type update_resource_data_sync_result = unit

type resource_data_sync_organizational_unit = {
  organizational_unit_id: string option
}

type resource_data_sync_aws_organizations_source = {
  organizational_units: resource_data_sync_organizational_unit list option;
  organization_source_type: string
}

type resource_data_sync_source = {
  enable_all_ops_data_sources: bool option;
  include_future_regions: bool option;
  source_regions: string list;
  aws_organizations_source: resource_data_sync_aws_organizations_source option;
  source_type: string
}

type update_resource_data_sync_request = {
  sync_source: resource_data_sync_source;
  sync_type: string;
  sync_name: string
}

type resource_data_sync_not_found_exception = {
  message: string option;
  sync_type: string option;
  sync_name: string option
}

type resource_data_sync_invalid_configuration_exception = {
  message: string option
}

type resource_data_sync_conflict_exception = {
  message: string option
}

type operating_system = | AmazonLinux2023
  | AlmaLinux
  | Rocky_Linux
  | Raspbian
  | MacOS
  | Debian
  | OracleLinux
  | CentOS
  | Suse
  | RedhatEnterpriseLinux
  | Ubuntu
  | AmazonLinux2022
  | AmazonLinux2
  | AmazonLinux
  | Windows

type patch_filter_key = | Version
  | Security
  | Severity
  | Release
  | Repository
  | Priority
  | Section
  | PatchId
  | Name
  | MsrcSeverity
  | Epoch
  | CVEId
  | Classification
  | ProductFamily
  | Product
  | PatchSet
  | BugzillaId
  | AdvisoryId
  | Arch

type patch_filter = {
  values: string list;
  key: patch_filter_key
}

type patch_filter_group = {
  patch_filters: patch_filter list
}

type patch_compliance_level = | Unspecified
  | Informational
  | Low
  | Medium
  | High
  | Critical

type patch_rule = {
  enable_non_security: bool option;
  approve_until_date: string option;
  approve_after_days: int option;
  compliance_level: patch_compliance_level option;
  patch_filter_group: patch_filter_group
}

type patch_rule_group = {
  patch_rules: patch_rule list
}

type patch_action = | Block
  | AllowAsDependency

type patch_source = {
  configuration: string;
  products: string list;
  name: string
}

type update_patch_baseline_result = {
  sources: patch_source list option;
  description: string option;
  modified_date: float option;
  created_date: float option;
  rejected_patches_action: patch_action option;
  rejected_patches: string list option;
  approved_patches_enable_non_security: bool option;
  approved_patches_compliance_level: patch_compliance_level option;
  approved_patches: string list option;
  approval_rules: patch_rule_group option;
  global_filters: patch_filter_group option;
  operating_system: operating_system option;
  name: string option;
  baseline_id: string option
}

type update_patch_baseline_request = {
  replace: bool option;
  sources: patch_source list option;
  description: string option;
  rejected_patches_action: patch_action option;
  rejected_patches: string list option;
  approved_patches_enable_non_security: bool option;
  approved_patches_compliance_level: patch_compliance_level option;
  approved_patches: string list option;
  approval_rules: patch_rule_group option;
  global_filters: patch_filter_group option;
  name: string option;
  baseline_id: string
}

type does_not_exist_exception = {
  message: string option
}

type update_ops_metadata_result = {
  ops_metadata_arn: string option
}

type metadata_value = {
  value: string option
}

type update_ops_metadata_request = {
  keys_to_delete: string list option;
  metadata_to_update: (string * metadata_value) list option;
  ops_metadata_arn: string
}

type ops_metadata_too_many_updates_exception = {
  message: string option
}

type ops_metadata_not_found_exception = {
  message: string option
}

type ops_metadata_key_limit_exceeded_exception = {
  message: string option
}

type ops_metadata_invalid_argument_exception = {
  message: string option
}

type update_ops_item_response = unit

type ops_item_data_type = | STRING
  | SEARCHABLE_STRING

type ops_item_data_value = {
  type_: ops_item_data_type option;
  value: string option
}

type ops_item_notification = {
  arn: string option
}

type related_ops_item = {
  ops_item_id: string
}

type ops_item_status = | CLOSED
  | REJECTED
  | APPROVED
  | PENDING_APPROVAL
  | CHANGE_CALENDAR_OVERRIDE_REJECTED
  | CHANGE_CALENDAR_OVERRIDE_APPROVED
  | PENDING_CHANGE_CALENDAR_OVERRIDE
  | RUNBOOK_IN_PROGRESS
  | SCHEDULED
  | COMPLETED_WITH_FAILURE
  | COMPLETED_WITH_SUCCESS
  | FAILED
  | CANCELLED
  | CANCELLING
  | TIMED_OUT
  | PENDING
  | RESOLVED
  | IN_PROGRESS
  | OPEN

type update_ops_item_request = {
  ops_item_arn: string option;
  planned_end_time: float option;
  planned_start_time: float option;
  actual_end_time: float option;
  actual_start_time: float option;
  severity: string option;
  category: string option;
  title: string option;
  ops_item_id: string;
  status: ops_item_status option;
  related_ops_items: related_ops_item list option;
  priority: int option;
  notifications: ops_item_notification list option;
  operational_data_to_delete: string list option;
  operational_data: (string * ops_item_data_value) list option;
  description: string option
}

type ops_item_not_found_exception = {
  message: string option
}

type ops_item_limit_exceeded_exception = {
  message: string option;
  limit_type: string option;
  limit: int option;
  resource_types: string list option
}

type ops_item_invalid_parameter_exception = {
  message: string option;
  parameter_names: string list option
}

type ops_item_conflict_exception = {
  message: string option
}

type ops_item_already_exists_exception = {
  ops_item_id: string option;
  message: string option
}

type ops_item_access_denied_exception = {
  message: string option
}

type update_managed_instance_role_result = unit

type update_managed_instance_role_request = {
  iam_role: string;
  instance_id: string
}

type invalid_instance_id = {
  message: string option
}

type target = {
  values: string list option;
  key: string option
}

type maintenance_window_task_parameter_value_expression = {
  values: string list option
}

type cloud_watch_output_config = {
  cloud_watch_output_enabled: bool option;
  cloud_watch_log_group_name: string option
}

type document_hash_type = | SHA1
  | SHA256

type notification_event = | FAILED
  | CANCELLED
  | TIMED_OUT
  | SUCCESS
  | IN_PROGRESS
  | ALL

type notification_type = | Invocation
  | Command

type notification_config = {
  notification_type: notification_type option;
  notification_events: notification_event list option;
  notification_arn: string option
}

type maintenance_window_run_command_parameters = {
  timeout_seconds: int option;
  service_role_arn: string option;
  parameters: (string * string list) list option;
  output_s3_key_prefix: string option;
  output_s3_bucket_name: string option;
  notification_config: notification_config option;
  document_version: string option;
  document_hash_type: document_hash_type option;
  document_hash: string option;
  cloud_watch_output_config: cloud_watch_output_config option;
  comment: string option
}

type maintenance_window_automation_parameters = {
  parameters: (string * string list) list option;
  document_version: string option
}

type maintenance_window_step_functions_parameters = {
  name: string option;
  input: string option
}

type maintenance_window_lambda_parameters = {
  payload: bytes option;
  qualifier: string option;
  client_context: string option
}

type maintenance_window_task_invocation_parameters = {
  lambda: maintenance_window_lambda_parameters option;
  step_functions: maintenance_window_step_functions_parameters option;
  automation: maintenance_window_automation_parameters option;
  run_command: maintenance_window_run_command_parameters option
}

type logging_info = {
  s3_region: string;
  s3_key_prefix: string option;
  s3_bucket_name: string
}

type maintenance_window_task_cutoff_behavior = | CancelTask
  | ContinueTask

type alarm = {
  name: string
}

type alarm_configuration = {
  alarms: alarm list;
  ignore_poll_alarm_failure: bool option
}

type update_maintenance_window_task_result = {
  alarm_configuration: alarm_configuration option;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  description: string option;
  name: string option;
  logging_info: logging_info option;
  max_errors: string option;
  max_concurrency: string option;
  priority: int option;
  task_invocation_parameters: maintenance_window_task_invocation_parameters option;
  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  service_role_arn: string option;
  task_arn: string option;
  targets: target list option;
  window_task_id: string option;
  window_id: string option
}

type update_maintenance_window_task_request = {
  alarm_configuration: alarm_configuration option;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  replace: bool option;
  description: string option;
  name: string option;
  logging_info: logging_info option;
  max_errors: string option;
  max_concurrency: string option;
  priority: int option;
  task_invocation_parameters: maintenance_window_task_invocation_parameters option;
  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  service_role_arn: string option;
  task_arn: string option;
  targets: target list option;
  window_task_id: string;
  window_id: string
}

type update_maintenance_window_target_result = {
  description: string option;
  name: string option;
  owner_information: string option;
  targets: target list option;
  window_target_id: string option;
  window_id: string option
}

type update_maintenance_window_target_request = {
  replace: bool option;
  description: string option;
  name: string option;
  owner_information: string option;
  targets: target list option;
  window_target_id: string;
  window_id: string
}

type update_maintenance_window_result = {
  enabled: bool option;
  allow_unassociated_targets: bool option;
  cutoff: int option;
  duration: int option;
  schedule_offset: int option;
  schedule_timezone: string option;
  schedule: string option;
  end_date: string option;
  start_date: string option;
  description: string option;
  name: string option;
  window_id: string option
}

type update_maintenance_window_request = {
  replace: bool option;
  enabled: bool option;
  allow_unassociated_targets: bool option;
  cutoff: int option;
  duration: int option;
  schedule_offset: int option;
  schedule_timezone: string option;
  schedule: string option;
  end_date: string option;
  start_date: string option;
  description: string option;
  name: string option;
  window_id: string
}

type document_status = | Failed
  | Deleting
  | Updating
  | Active
  | Creating

type document_parameter_type = | StringList
  | String

type document_parameter = {
  default_value: string option;
  description: string option;
  type_: document_parameter_type option;
  name: string option
}

type platform_type = | MACOS
  | LINUX
  | WINDOWS

type document_type = | QuickSetup
  | ConformancePackTemplate
  | CloudFormation
  | ProblemAnalysisTemplate
  | ProblemAnalysis
  | ChangeTemplate
  | ChangeCalendar
  | DeploymentStrategy
  | ApplicationConfigurationSchema
  | ApplicationConfiguration
  | Package
  | Session
  | Automation
  | Policy
  | Command

type document_format = | TEXT
  | JSON
  | YAML

type tag = {
  value: string;
  key: string
}

type attachment_information = {
  name: string option
}

type document_requires = {
  version_name: string option;
  require_type: string option;
  version: string option;
  name: string
}

type review_status = | REJECTED
  | PENDING
  | NOT_REVIEWED
  | APPROVED

type review_information = {
  reviewer: string option;
  status: review_status option;
  reviewed_time: float option
}

type document_description = {
  category_enum: string list option;
  category: string list option;
  review_status: review_status option;
  pending_review_version: string option;
  approved_version: string option;
  review_information: review_information list option;
  author: string option;
  requires: document_requires list option;
  attachments_information: attachment_information list option;
  tags: tag list option;
  target_type: string option;
  document_format: document_format option;
  default_version: string option;
  latest_version: string option;
  schema_version: string option;
  document_type: document_type option;
  platform_types: platform_type list option;
  parameters: document_parameter list option;
  description: string option;
  document_version: string option;
  status_information: string option;
  status: document_status option;
  created_date: float option;
  owner: string option;
  version_name: string option;
  display_name: string option;
  name: string option;
  hash_type: document_hash_type option;
  hash: string option;
  sha1: string option
}

type update_document_result = {
  document_description: document_description option
}

type attachments_source_key = | AttachmentReference
  | S3FileUrl
  | SourceUrl

type attachments_source = {
  name: string option;
  values: string list option;
  key: attachments_source_key option
}

type update_document_request = {
  target_type: string option;
  document_format: document_format option;
  document_version: string option;
  version_name: string option;
  display_name: string option;
  name: string;
  attachments: attachments_source list option;
  content: string
}

type update_document_metadata_response = unit

type document_review_action = | Reject
  | Approve
  | UpdateReview
  | SendForReview

type document_review_comment_type = | Comment

type document_review_comment_source = {
  content: string option;
  type_: document_review_comment_type option
}

type document_reviews = {
  comment: document_review_comment_source list option;
  action: document_review_action
}

type update_document_metadata_request = {
  document_reviews: document_reviews;
  document_version: string option;
  name: string
}

type invalid_document_version = {
  message: string option
}

type invalid_document_operation = {
  message: string option
}

type invalid_document = {
  message: string option
}

type document_default_version_description = {
  default_version_name: string option;
  default_version: string option;
  name: string option
}

type update_document_default_version_result = {
  description: document_default_version_description option
}

type update_document_default_version_request = {
  document_version: string;
  name: string
}

type invalid_document_schema_version = {
  message: string option
}

type max_document_size_exceeded = {
  message: string option
}

type invalid_document_content = {
  message: string option
}

type duplicate_document_version_name = {
  message: string option
}

type duplicate_document_content = {
  message: string option
}

type document_version_limit_exceeded = {
  message: string option
}

type association_status_name = | Failed
  | Success
  | Pending

type association_status = {
  additional_info: string option;
  message: string;
  name: association_status_name;
  date: float
}

type association_overview = {
  association_status_aggregated_count: (string * int) list option;
  detailed_status: string option;
  status: string option
}

type s3_output_location = {
  output_s3_key_prefix: string option;
  output_s3_bucket_name: string option;
  output_s3_region: string option
}

type instance_association_output_location = {
  s3_location: s3_output_location option
}

type association_compliance_severity = | Unspecified
  | Low
  | Medium
  | High
  | Critical

type association_sync_compliance = | Manual
  | Auto

type target_location = {
  target_location_alarm_configuration: alarm_configuration option;
  execution_role_name: string option;
  target_location_max_errors: string option;
  target_location_max_concurrency: string option;
  regions: string list option;
  accounts: string list option
}

type external_alarm_state = | ALARM
  | UNKNOWN

type alarm_state_information = {
  state: external_alarm_state;
  name: string
}

type association_description = {
  triggered_alarms: alarm_state_information list option;
  alarm_configuration: alarm_configuration option;
  target_maps: (string * string list) list list option;
  duration: int option;
  schedule_offset: int option;
  target_locations: target_location list option;
  calendar_names: string list option;
  apply_only_at_cron_interval: bool option;
  sync_compliance: association_sync_compliance option;
  compliance_severity: association_compliance_severity option;
  max_concurrency: string option;
  max_errors: string option;
  association_name: string option;
  last_successful_execution_date: float option;
  last_execution_date: float option;
  output_location: instance_association_output_location option;
  schedule_expression: string option;
  targets: target list option;
  association_id: string option;
  parameters: (string * string list) list option;
  automation_target_parameter_name: string option;
  document_version: string option;
  overview: association_overview option;
  status: association_status option;
  last_update_association_date: float option;
  date: float option;
  association_version: string option;
  instance_id: string option;
  name: string option
}

type update_association_status_result = {
  association_description: association_description option
}

type update_association_status_request = {
  association_status: association_status;
  instance_id: string;
  name: string
}

type status_unchanged = unit

type association_does_not_exist = {
  message: string option
}

type update_association_result = {
  association_description: association_description option
}

type update_association_request = {
  alarm_configuration: alarm_configuration option;
  target_maps: (string * string list) list list option;
  duration: int option;
  schedule_offset: int option;
  target_locations: target_location list option;
  calendar_names: string list option;
  apply_only_at_cron_interval: bool option;
  sync_compliance: association_sync_compliance option;
  compliance_severity: association_compliance_severity option;
  max_concurrency: string option;
  max_errors: string option;
  automation_target_parameter_name: string option;
  association_version: string option;
  association_name: string option;
  targets: target list option;
  name: string option;
  output_location: instance_association_output_location option;
  schedule_expression: string option;
  document_version: string option;
  parameters: (string * string list) list option;
  association_id: string
}

type invalid_update = {
  message: string option
}

type invalid_target_maps = {
  message: string option
}

type invalid_target = {
  message: string option
}

type invalid_schedule = {
  message: string option
}

type invalid_parameters = {
  message: string option
}

type invalid_output_location = unit

type invalid_association_version = {
  message: string option
}

type association_version_limit_exceeded = {
  message: string option
}

type unsupported_platform_type = {
  message: string option
}

type unsupported_parameter_type = {
  message: string option
}

type unsupported_operating_system = {
  message: string option
}

type unsupported_inventory_schema_version_exception = {
  message: string option
}

type unsupported_inventory_item_context_exception = {
  message: string option;
  type_name: string option
}

type unsupported_feature_required_exception = {
  message: string option
}

type unsupported_calendar_exception = {
  message: string option
}

type unlabel_parameter_version_result = {
  invalid_labels: string list option;
  removed_labels: string list option
}

type unlabel_parameter_version_request = {
  labels: string list;
  parameter_version: int;
  name: string
}

type parameter_version_not_found = {
  message: string option
}

type parameter_not_found = {
  message: string option
}

type total_size_limit_exceeded_exception = {
  message: string option
}

type too_many_tags_error = unit

type terminate_session_response = {
  session_id: string option
}

type terminate_session_request = {
  session_id: string
}

type target_not_connected = {
  message: string option
}

type target_in_use_exception = {
  message: string option
}

type sub_type_count_limit_exceeded_exception = {
  message: string option
}

type stop_type = | CANCEL
  | COMPLETE

type stop_automation_execution_result = unit

type stop_automation_execution_request = {
  type_: stop_type option;
  automation_execution_id: string
}

type invalid_automation_status_update_exception = {
  message: string option
}

type automation_execution_not_found_exception = {
  message: string option
}

type automation_execution_status = | EXITED
  | COMPLETED_WITH_FAILURE
  | COMPLETED_WITH_SUCCESS
  | CHANGE_CALENDAR_OVERRIDE_REJECTED
  | CHANGE_CALENDAR_OVERRIDE_APPROVED
  | PENDING_CHANGE_CALENDAR_OVERRIDE
  | RUNBOOK_INPROGRESS
  | SCHEDULED
  | REJECTED
  | APPROVED
  | PENDING_APPROVAL
  | FAILED
  | CANCELLED
  | CANCELLING
  | TIMEDOUT
  | SUCCESS
  | WAITING
  | INPROGRESS
  | PENDING

type failure_details = {
  details: (string * string list) list option;
  failure_type: string option;
  failure_stage: string option
}

type parent_step_details = {
  iterator_value: string option;
  iteration: int option;
  action: string option;
  step_name: string option;
  step_execution_id: string option
}

type step_execution = {
  parent_step_details: parent_step_details option;
  triggered_alarms: alarm_state_information list option;
  target_location: target_location option;
  targets: target list option;
  valid_next_steps: string list option;
  is_critical: bool option;
  next_step: string option;
  is_end: bool option;
  overridden_parameters: (string * string list) list option;
  step_execution_id: string option;
  failure_details: failure_details option;
  failure_message: string option;
  response: string option;
  outputs: (string * string list) list option;
  inputs: (string * string) list option;
  response_code: string option;
  step_status: automation_execution_status option;
  execution_end_time: float option;
  execution_start_time: float option;
  max_attempts: int option;
  on_failure: string option;
  timeout_seconds: int option;
  action: string option;
  step_name: string option
}

type step_execution_filter_key = | PARENT_STEP_ITERATOR_VALUE
  | PARENT_STEP_ITERATION
  | PARENT_STEP_EXECUTION_ID
  | ACTION
  | STEP_NAME
  | STEP_EXECUTION_ID
  | STEP_EXECUTION_STATUS
  | START_TIME_AFTER
  | START_TIME_BEFORE

type step_execution_filter = {
  values: string list;
  key: step_execution_filter_key
}

type start_session_response = {
  stream_url: string option;
  token_value: string option;
  session_id: string option
}

type start_session_request = {
  parameters: (string * string list) list option;
  reason: string option;
  document_name: string option;
  target: string
}

type start_change_request_execution_result = {
  automation_execution_id: string option
}

type runbook = {
  target_locations: target_location list option;
  max_errors: string option;
  max_concurrency: string option;
  target_maps: (string * string list) list list option;
  targets: target list option;
  target_parameter_name: string option;
  parameters: (string * string list) list option;
  document_version: string option;
  document_name: string
}

type start_change_request_execution_request = {
  change_details: string option;
  scheduled_end_time: float option;
  tags: tag list option;
  runbooks: runbook list;
  auto_approve: bool option;
  client_token: string option;
  change_request_name: string option;
  parameters: (string * string list) list option;
  document_version: string option;
  document_name: string;
  scheduled_time: float option
}

type invalid_automation_execution_parameters_exception = {
  message: string option
}

type idempotent_parameter_mismatch = {
  message: string option
}

type automation_execution_limit_exceeded_exception = {
  message: string option
}

type automation_definition_version_not_found_exception = {
  message: string option
}

type automation_definition_not_found_exception = {
  message: string option
}

type automation_definition_not_approved_exception = {
  message: string option
}

type start_automation_execution_result = {
  automation_execution_id: string option
}

type execution_mode = | Interactive
  | Auto

type start_automation_execution_request = {
  alarm_configuration: alarm_configuration option;
  tags: tag list option;
  target_locations: target_location list option;
  max_errors: string option;
  max_concurrency: string option;
  target_maps: (string * string list) list list option;
  targets: target list option;
  target_parameter_name: string option;
  mode: execution_mode option;
  client_token: string option;
  parameters: (string * string list) list option;
  document_version: string option;
  document_name: string
}

type start_associations_once_result = unit

type start_associations_once_request = {
  association_ids: string list
}

type invalid_association = {
  message: string option
}

type source_type = | AWS_SSM_MANAGEDINSTANCE
  | AWS_IOT_THING
  | AWS_EC2_INSTANCE

type signal_type = | RESUME
  | STOP_STEP
  | START_STEP
  | REJECT
  | APPROVE

type severity_summary = {
  unspecified_count: int option;
  informational_count: int option;
  low_count: int option;
  medium_count: int option;
  high_count: int option;
  critical_count: int option
}

type session_status = | FAILED
  | TERMINATING
  | TERMINATED
  | DISCONNECTED
  | CONNECTING
  | CONNECTED

type session_state = | HISTORY
  | ACTIVE

type session_manager_output_url = {
  cloud_watch_output_url: string option;
  s3_output_url: string option
}

type session = {
  max_session_duration: string option;
  output_url: session_manager_output_url option;
  details: string option;
  reason: string option;
  owner: string option;
  document_name: string option;
  end_date: float option;
  start_date: float option;
  status: session_status option;
  target: string option;
  session_id: string option
}

type session_filter_key = | SESSION_ID
  | STATUS
  | OWNER
  | TARGET_ID
  | INVOKED_BEFORE
  | INVOKED_AFTER

type session_filter = {
  value: string;
  key: session_filter_key
}

type service_setting = {
  status: string option;
  ar_n: string option;
  last_modified_user: string option;
  last_modified_date: float option;
  setting_value: string option;
  setting_id: string option
}

type command_status = | CANCELLING
  | TIMED_OUT
  | FAILED
  | CANCELLED
  | SUCCESS
  | IN_PROGRESS
  | PENDING

type command = {
  triggered_alarms: alarm_state_information list option;
  alarm_configuration: alarm_configuration option;
  timeout_seconds: int option;
  cloud_watch_output_config: cloud_watch_output_config option;
  notification_config: notification_config option;
  service_role: string option;
  delivery_timed_out_count: int option;
  error_count: int option;
  completed_count: int option;
  target_count: int option;
  max_errors: string option;
  max_concurrency: string option;
  output_s3_key_prefix: string option;
  output_s3_bucket_name: string option;
  output_s3_region: string option;
  status_details: string option;
  status: command_status option;
  requested_date_time: float option;
  targets: target list option;
  instance_ids: string list option;
  parameters: (string * string list) list option;
  expires_after: float option;
  comment: string option;
  document_version: string option;
  document_name: string option;
  command_id: string option
}

type send_command_result = {
  command: command option
}

type send_command_request = {
  alarm_configuration: alarm_configuration option;
  cloud_watch_output_config: cloud_watch_output_config option;
  notification_config: notification_config option;
  service_role_arn: string option;
  max_errors: string option;
  max_concurrency: string option;
  output_s3_key_prefix: string option;
  output_s3_bucket_name: string option;
  output_s3_region: string option;
  parameters: (string * string list) list option;
  comment: string option;
  timeout_seconds: int option;
  document_hash_type: document_hash_type option;
  document_hash: string option;
  document_version: string option;
  document_name: string;
  targets: target list option;
  instance_ids: string list option
}

type invalid_role = {
  message: string option
}

type invalid_output_folder = unit

type invalid_notification_config = {
  message: string option
}

type duplicate_instance_id = unit

type send_automation_signal_result = unit

type send_automation_signal_request = {
  payload: (string * string list) list option;
  signal_type: signal_type;
  automation_execution_id: string
}

type invalid_automation_signal_exception = {
  message: string option
}

type automation_step_not_found_exception = {
  message: string option
}

type scheduled_window_execution = {
  execution_time: string option;
  name: string option;
  window_id: string option
}

type s3_output_url = {
  output_url: string option
}

type resume_session_response = {
  stream_url: string option;
  token_value: string option;
  session_id: string option
}

type resume_session_request = {
  session_id: string
}

type result_attribute = {
  type_name: string
}

type resource_type_for_tagging = | ASSOCIATION
  | AUTOMATION
  | OPSMETADATA
  | OPS_ITEM
  | PATCH_BASELINE
  | PARAMETER
  | MAINTENANCE_WINDOW
  | MANAGED_INSTANCE
  | DOCUMENT

type resource_type = | EC2_INSTANCE
  | MANAGED_INSTANCE

type resource_policy_not_found_exception = {
  message: string option
}

type resource_policy_limit_exceeded_exception = {
  message: string option;
  limit_type: string option;
  limit: int option
}

type resource_policy_invalid_parameter_exception = {
  message: string option;
  parameter_names: string list option
}

type resource_policy_conflict_exception = {
  message: string option
}

type resource_not_found_exception = {
  message: string option
}

type resource_limit_exceeded_exception = {
  message: string option
}

type resource_in_use_exception = {
  message: string option
}

type resource_data_sync_source_with_state = {
  enable_all_ops_data_sources: bool option;
  state: string option;
  include_future_regions: bool option;
  source_regions: string list option;
  aws_organizations_source: resource_data_sync_aws_organizations_source option;
  source_type: string option
}

type resource_data_sync_s3_format = | JSON_SERDE

type resource_data_sync_destination_data_sharing = {
  destination_data_sharing_type: string option
}

type resource_data_sync_s3_destination = {
  destination_data_sharing: resource_data_sync_destination_data_sharing option;
  awskms_key_ar_n: string option;
  region: string;
  sync_format: resource_data_sync_s3_format;
  prefix: string option;
  bucket_name: string
}

type last_resource_data_sync_status = | INPROGRESS
  | FAILED
  | SUCCESSFUL

type resource_data_sync_item = {
  last_sync_status_message: string option;
  sync_created_time: float option;
  last_status: last_resource_data_sync_status option;
  sync_last_modified_time: float option;
  last_successful_sync_time: float option;
  last_sync_time: float option;
  s3_destination: resource_data_sync_s3_destination option;
  sync_source: resource_data_sync_source_with_state option;
  sync_type: string option;
  sync_name: string option
}

type resource_data_sync_count_exceeded_exception = {
  message: string option
}

type resource_data_sync_already_exists_exception = {
  sync_name: string option
}

type compliance_status = | NonCompliant
  | Compliant

type compliance_severity = | Unspecified
  | Informational
  | Low
  | Medium
  | High
  | Critical

type compliance_execution_summary = {
  execution_type: string option;
  execution_id: string option;
  execution_time: float
}

type compliant_summary = {
  severity_summary: severity_summary option;
  compliant_count: int option
}

type non_compliant_summary = {
  severity_summary: severity_summary option;
  non_compliant_count: int option
}

type resource_compliance_summary_item = {
  non_compliant_summary: non_compliant_summary option;
  compliant_summary: compliant_summary option;
  execution_summary: compliance_execution_summary option;
  overall_severity: compliance_severity option;
  status: compliance_status option;
  resource_id: string option;
  resource_type: string option;
  compliance_type: string option
}

type resolved_targets = {
  truncated: bool option;
  parameter_values: string list option
}

type reset_service_setting_result = {
  service_setting: service_setting option
}

type reset_service_setting_request = {
  setting_id: string
}

type remove_tags_from_resource_result = unit

type remove_tags_from_resource_request = {
  tag_keys: string list;
  resource_id: string;
  resource_type: resource_type_for_tagging
}

type invalid_resource_type = unit

type invalid_resource_id = unit

type registration_metadata_item = {
  value: string;
  key: string
}

type register_task_with_maintenance_window_result = {
  window_task_id: string option
}

type maintenance_window_task_type = | Lambda
  | StepFunctions
  | Automation
  | RunCommand

type register_task_with_maintenance_window_request = {
  alarm_configuration: alarm_configuration option;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  client_token: string option;
  description: string option;
  name: string option;
  logging_info: logging_info option;
  max_errors: string option;
  max_concurrency: string option;
  priority: int option;
  task_invocation_parameters: maintenance_window_task_invocation_parameters option;
  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  task_type: maintenance_window_task_type;
  service_role_arn: string option;
  task_arn: string;
  targets: target list option;
  window_id: string
}

type feature_not_available_exception = {
  message: string option
}

type register_target_with_maintenance_window_result = {
  window_target_id: string option
}

type maintenance_window_resource_type = | ResourceGroup
  | Instance

type register_target_with_maintenance_window_request = {
  client_token: string option;
  description: string option;
  name: string option;
  owner_information: string option;
  targets: target list;
  resource_type: maintenance_window_resource_type;
  window_id: string
}

type register_patch_baseline_for_patch_group_result = {
  patch_group: string option;
  baseline_id: string option
}

type register_patch_baseline_for_patch_group_request = {
  patch_group: string;
  baseline_id: string
}

type already_exists_exception = {
  message: string option
}

type register_default_patch_baseline_result = {
  baseline_id: string option
}

type register_default_patch_baseline_request = {
  baseline_id: string
}

type reboot_option = | NO_REBOOT
  | REBOOT_IF_NEEDED

type put_resource_policy_response = {
  policy_hash: string option;
  policy_id: string option
}

type put_resource_policy_request = {
  policy_hash: string option;
  policy_id: string option;
  policy: string;
  resource_arn: string
}

type malformed_resource_policy_document_exception = {
  message: string option
}

type parameter_tier = | INTELLIGENT_TIERING
  | ADVANCED
  | STANDARD

type put_parameter_result = {
  tier: parameter_tier option;
  version: int option
}

type parameter_type = | SECURE_STRING
  | STRING_LIST
  | STRING

type put_parameter_request = {
  data_type: string option;
  policies: string option;
  tier: parameter_tier option;
  tags: tag list option;
  allowed_pattern: string option;
  overwrite: bool option;
  key_id: string option;
  type_: parameter_type option;
  value: string;
  description: string option;
  name: string
}

type policies_limit_exceeded_exception = {
  message: string option
}

type parameter_pattern_mismatch_exception = {
  message: string option
}

type parameter_max_version_limit_exceeded = {
  message: string option
}

type parameter_limit_exceeded = {
  message: string option
}

type parameter_already_exists = {
  message: string option
}

type invalid_policy_type_exception = {
  message: string option
}

type invalid_policy_attribute_exception = {
  message: string option
}

type invalid_key_id = {
  message: string option
}

type invalid_allowed_pattern_exception = {
  message: string option
}

type incompatible_policy_exception = {
  message: string option
}

type hierarchy_type_mismatch_exception = {
  message: string option
}

type hierarchy_level_limit_exceeded_exception = {
  message: string option
}

type put_inventory_result = {
  message: string option
}

type inventory_item = {
  context: (string * string) list option;
  content: (string * string) list list option;
  content_hash: string option;
  capture_time: string;
  schema_version: string;
  type_name: string
}

type put_inventory_request = {
  items: inventory_item list;
  instance_id: string
}

type item_size_limit_exceeded_exception = {
  message: string option;
  type_name: string option
}

type item_content_mismatch_exception = {
  message: string option;
  type_name: string option
}

type invalid_type_name_exception = {
  message: string option
}

type invalid_item_content_exception = {
  message: string option;
  type_name: string option
}

type invalid_inventory_item_context_exception = {
  message: string option
}

type custom_schema_count_limit_exceeded_exception = {
  message: string option
}

type put_compliance_items_result = unit

type compliance_item_entry = {
  details: (string * string) list option;
  status: compliance_status;
  severity: compliance_severity;
  title: string option;
  id: string option
}

type compliance_upload_type = | Partial
  | Complete

type put_compliance_items_request = {
  upload_type: compliance_upload_type option;
  item_content_hash: string option;
  items: compliance_item_entry list;
  execution_summary: compliance_execution_summary;
  compliance_type: string;
  resource_type: string;
  resource_id: string
}

type compliance_type_count_limit_exceeded_exception = {
  message: string option
}

type progress_counters = {
  timed_out_steps: int option;
  cancelled_steps: int option;
  failed_steps: int option;
  success_steps: int option;
  total_steps: int option
}

type ping_status = | INACTIVE
  | CONNECTION_LOST
  | ONLINE

type patch_deployment_status = | ExplicitRejected
  | ExplicitApproved
  | PendingApproval
  | Approved

type patch_status = {
  approval_date: float option;
  compliance_level: patch_compliance_level option;
  deployment_status: patch_deployment_status option
}

type patch_set = | Application
  | Os

type patch_property = | PatchSeverity
  | PatchPriority
  | PatchMsrcSeverity
  | PatchClassification
  | PatchProductFamily
  | Product

type patch_orchestrator_filter = {
  values: string list option;
  key: string option
}

type patch_operation_type = | INSTALL
  | SCAN

type patch = {
  repository: string option;
  severity: string option;
  arch: string option;
  release: string option;
  version: string option;
  epoch: int option;
  name: string option;
  cve_ids: string list option;
  bugzilla_ids: string list option;
  advisory_ids: string list option;
  language: string option;
  msrc_number: string option;
  kb_number: string option;
  msrc_severity: string option;
  classification: string option;
  product: string option;
  product_family: string option;
  vendor: string option;
  content_url: string option;
  description: string option;
  title: string option;
  release_date: float option;
  id: string option
}

type patch_baseline_identity = {
  default_baseline: bool option;
  baseline_description: string option;
  operating_system: operating_system option;
  baseline_name: string option;
  baseline_id: string option
}

type patch_group_patch_baseline_mapping = {
  baseline_identity: patch_baseline_identity option;
  patch_group: string option
}

type patch_compliance_data_state = | Failed
  | NotApplicable
  | Missing
  | InstalledRejected
  | InstalledPendingReboot
  | InstalledOther
  | Installed

type patch_compliance_data = {
  cve_ids: string option;
  installed_time: float;
  state: patch_compliance_data_state;
  severity: string;
  classification: string;
  kb_id: string;
  title: string
}

type parameters_filter_key = | KEY_ID
  | TYPE
  | NAME

type parameters_filter = {
  values: string list;
  key: parameters_filter_key
}

type parameter_version_label_limit_exceeded = {
  message: string option
}

type parameter_string_filter = {
  values: string list option;
  option_: string option;
  key: string
}

type parameter_inline_policy = {
  policy_status: string option;
  policy_type: string option;
  policy_text: string option
}

type parameter_metadata = {
  data_type: string option;
  policies: parameter_inline_policy list option;
  tier: parameter_tier option;
  version: int option;
  allowed_pattern: string option;
  description: string option;
  last_modified_user: string option;
  last_modified_date: float option;
  key_id: string option;
  type_: parameter_type option;
  ar_n: string option;
  name: string option
}

type parameter = {
  data_type: string option;
  ar_n: string option;
  last_modified_date: float option;
  source_result: string option;
  selector: string option;
  version: int option;
  value: string option;
  type_: parameter_type option;
  name: string option
}

type parameter_history = {
  data_type: string option;
  policies: parameter_inline_policy list option;
  tier: parameter_tier option;
  labels: string list option;
  version: int option;
  allowed_pattern: string option;
  value: string option;
  description: string option;
  last_modified_user: string option;
  last_modified_date: float option;
  key_id: string option;
  type_: parameter_type option;
  name: string option
}

type output_source = {
  output_source_type: string option;
  output_source_id: string option
}

type ops_result_attribute = {
  type_name: string
}

type ops_metadata = {
  creation_date: float option;
  last_modified_user: string option;
  last_modified_date: float option;
  ops_metadata_arn: string option;
  resource_id: string option
}

type ops_metadata_limit_exceeded_exception = {
  message: string option
}

type ops_metadata_filter = {
  values: string list;
  key: string
}

type ops_metadata_already_exists_exception = {
  message: string option
}

type ops_item_summary = {
  planned_end_time: float option;
  planned_start_time: float option;
  actual_end_time: float option;
  actual_start_time: float option;
  ops_item_type: string option;
  severity: string option;
  category: string option;
  operational_data: (string * ops_item_data_value) list option;
  title: string option;
  ops_item_id: string option;
  status: ops_item_status option;
  source: string option;
  priority: int option;
  last_modified_time: float option;
  last_modified_by: string option;
  created_time: float option;
  created_by: string option
}

type ops_item_related_items_filter_key = | RESOURCE_URI
  | ASSOCIATION_ID
  | RESOURCE_TYPE

type ops_item_related_items_filter_operator = | EQUAL

type ops_item_related_items_filter = {
  operator: ops_item_related_items_filter_operator;
  values: string list;
  key: ops_item_related_items_filter_key
}

type ops_item_identity = {
  arn: string option
}

type ops_item_related_item_summary = {
  last_modified_time: float option;
  last_modified_by: ops_item_identity option;
  created_time: float option;
  created_by: ops_item_identity option;
  resource_uri: string option;
  association_type: string option;
  resource_type: string option;
  association_id: string option;
  ops_item_id: string option
}

type ops_item_related_item_association_not_found_exception = {
  message: string option
}

type ops_item_related_item_already_exists_exception = {
  ops_item_id: string option;
  resource_uri: string option;
  message: string option
}

type ops_item_filter_key = | ACCOUNT_ID
  | INSIGHT_TYPE
  | CHANGE_REQUEST_TARGETS_RESOURCE_GROUP
  | CHANGE_REQUEST_TEMPLATE
  | CHANGE_REQUEST_APPROVER_NAME
  | CHANGE_REQUEST_APPROVER_ARN
  | CHANGE_REQUEST_REQUESTER_NAME
  | CHANGE_REQUEST_REQUESTER_ARN
  | OPSITEM_TYPE
  | SEVERITY
  | CATEGORY
  | AUTOMATION_ID
  | RESOURCE_ID
  | OPERATIONAL_DATA_VALUE
  | OPERATIONAL_DATA_KEY
  | OPERATIONAL_DATA
  | PLANNED_END_TIME
  | PLANNED_START_TIME
  | ACTUAL_END_TIME
  | ACTUAL_START_TIME
  | LAST_MODIFIED_TIME
  | CREATED_TIME
  | OPSITEM_ID
  | TITLE
  | PRIORITY
  | SOURCE
  | CREATED_BY
  | STATUS

type ops_item_filter_operator = | LESS_THAN
  | GREATER_THAN
  | CONTAINS
  | EQUAL

type ops_item_filter = {
  operator: ops_item_filter_operator;
  values: string list;
  key: ops_item_filter_key
}

type ops_item_event_summary = {
  created_time: float option;
  created_by: ops_item_identity option;
  detail: string option;
  detail_type: string option;
  source: string option;
  event_id: string option;
  ops_item_id: string option
}

type ops_item_event_filter_key = | OPSITEM_ID

type ops_item_event_filter_operator = | EQUAL

type ops_item_event_filter = {
  operator: ops_item_event_filter_operator;
  values: string list;
  key: ops_item_event_filter_key
}

type ops_item = {
  ops_item_arn: string option;
  planned_end_time: float option;
  planned_start_time: float option;
  actual_end_time: float option;
  actual_start_time: float option;
  severity: string option;
  category: string option;
  operational_data: (string * ops_item_data_value) list option;
  source: string option;
  title: string option;
  version: string option;
  ops_item_id: string option;
  status: ops_item_status option;
  related_ops_items: related_ops_item list option;
  priority: int option;
  notifications: ops_item_notification list option;
  last_modified_time: float option;
  last_modified_by: string option;
  description: string option;
  created_time: float option;
  ops_item_type: string option;
  created_by: string option
}

type ops_filter_operator_type = | EXISTS
  | GREATER_THAN
  | LESS_THAN
  | BEGIN_WITH
  | NOT_EQUAL
  | EQUAL

type ops_filter = {
  type_: ops_filter_operator_type option;
  values: string list;
  key: string
}

type ops_entity_item = {
  content: (string * string) list list option;
  capture_time: string option
}

type ops_entity = {
  data: (string * ops_entity_item) list option;
  id: string option
}

type ops_aggregator = {
  aggregators: ops_aggregator list option;
  filters: ops_filter list option;
  values: (string * string) list option;
  attribute_name: string option;
  type_name: string option;
  aggregator_type: string option
}

type modify_document_permission_response = unit

type document_permission_type = | SHARE

type modify_document_permission_request = {
  shared_document_version: string option;
  account_ids_to_remove: string list option;
  account_ids_to_add: string list option;
  permission_type: document_permission_type;
  name: string
}

type invalid_permission_type = {
  message: string option
}

type document_permission_limit = {
  message: string option
}

type document_limit_exceeded = {
  message: string option
}

type maintenance_window_identity_for_target = {
  name: string option;
  window_id: string option
}

type maintenance_window_task = {
  alarm_configuration: alarm_configuration option;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  description: string option;
  name: string option;
  max_errors: string option;
  max_concurrency: string option;
  service_role_arn: string option;
  logging_info: logging_info option;
  priority: int option;
  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  targets: target list option;
  type_: maintenance_window_task_type option;
  task_arn: string option;
  window_task_id: string option;
  window_id: string option
}

type maintenance_window_target = {
  description: string option;
  name: string option;
  owner_information: string option;
  targets: target list option;
  resource_type: maintenance_window_resource_type option;
  window_target_id: string option;
  window_id: string option
}

type maintenance_window_identity = {
  next_execution_time: string option;
  start_date: string option;
  end_date: string option;
  schedule_offset: int option;
  schedule_timezone: string option;
  schedule: string option;
  cutoff: int option;
  duration: int option;
  enabled: bool option;
  description: string option;
  name: string option;
  window_id: string option
}

type maintenance_window_filter = {
  values: string list option;
  key: string option
}

type maintenance_window_execution_status = | SkippedOverlapping
  | Cancelled
  | Cancelling
  | TimedOut
  | Failed
  | Success
  | InProgress
  | Pending

type maintenance_window_execution_task_invocation_identity = {
  window_target_id: string option;
  owner_information: string option;
  end_time: float option;
  start_time: float option;
  status_details: string option;
  status: maintenance_window_execution_status option;
  parameters: string option;
  task_type: maintenance_window_task_type option;
  execution_id: string option;
  invocation_id: string option;
  task_execution_id: string option;
  window_execution_id: string option
}

type maintenance_window_execution_task_identity = {
  triggered_alarms: alarm_state_information list option;
  alarm_configuration: alarm_configuration option;
  task_type: maintenance_window_task_type option;
  task_arn: string option;
  end_time: float option;
  start_time: float option;
  status_details: string option;
  status: maintenance_window_execution_status option;
  task_execution_id: string option;
  window_execution_id: string option
}

type maintenance_window_execution = {
  end_time: float option;
  start_time: float option;
  status_details: string option;
  status: maintenance_window_execution_status option;
  window_execution_id: string option;
  window_id: string option
}

type list_tags_for_resource_result = {
  tag_list: tag list option
}

type list_tags_for_resource_request = {
  resource_id: string;
  resource_type: resource_type_for_tagging
}

type list_resource_data_sync_result = {
  next_token: string option;
  resource_data_sync_items: resource_data_sync_item list option
}

type list_resource_data_sync_request = {
  max_results: int option;
  next_token: string option;
  sync_type: string option
}

type invalid_next_token = {
  message: string option
}

type list_resource_compliance_summaries_result = {
  next_token: string option;
  resource_compliance_summary_items: resource_compliance_summary_item list option
}

type compliance_query_operator_type = | GreaterThan
  | LessThan
  | BeginWith
  | NotEqual
  | Equal

type compliance_string_filter = {
  type_: compliance_query_operator_type option;
  values: string list option;
  key: string option
}

type list_resource_compliance_summaries_request = {
  max_results: int option;
  next_token: string option;
  filters: compliance_string_filter list option
}

type invalid_filter = {
  message: string option
}

type list_ops_metadata_result = {
  next_token: string option;
  ops_metadata_list: ops_metadata list option
}

type list_ops_metadata_request = {
  next_token: string option;
  max_results: int option;
  filters: ops_metadata_filter list option
}

type list_ops_item_related_items_response = {
  summaries: ops_item_related_item_summary list option;
  next_token: string option
}

type list_ops_item_related_items_request = {
  next_token: string option;
  max_results: int option;
  filters: ops_item_related_items_filter list option;
  ops_item_id: string option
}

type list_ops_item_events_response = {
  summaries: ops_item_event_summary list option;
  next_token: string option
}

type list_ops_item_events_request = {
  next_token: string option;
  max_results: int option;
  filters: ops_item_event_filter list option
}

type list_inventory_entries_result = {
  next_token: string option;
  entries: (string * string) list list option;
  capture_time: string option;
  schema_version: string option;
  instance_id: string option;
  type_name: string option
}

type inventory_query_operator_type = | EXISTS
  | GREATER_THAN
  | LESS_THAN
  | BEGIN_WITH
  | NOT_EQUAL
  | EQUAL

type inventory_filter = {
  type_: inventory_query_operator_type option;
  values: string list;
  key: string
}

type list_inventory_entries_request = {
  max_results: int option;
  next_token: string option;
  filters: inventory_filter list option;
  type_name: string;
  instance_id: string
}

type document_identifier = {
  author: string option;
  review_status: review_status option;
  requires: document_requires list option;
  tags: tag list option;
  target_type: string option;
  document_format: document_format option;
  schema_version: string option;
  document_type: document_type option;
  document_version: string option;
  platform_types: platform_type list option;
  version_name: string option;
  owner: string option;
  display_name: string option;
  created_date: float option;
  name: string option
}

type list_documents_result = {
  next_token: string option;
  document_identifiers: document_identifier list option
}

type document_filter_key = | DocumentType
  | PlatformTypes
  | Owner
  | Name

type document_filter = {
  value: string;
  key: document_filter_key
}

type document_key_values_filter = {
  values: string list option;
  key: string option
}

type list_documents_request = {
  next_token: string option;
  max_results: int option;
  filters: document_key_values_filter list option;
  document_filter_list: document_filter list option
}

type invalid_filter_key = unit

type document_version_info = {
  review_status: review_status option;
  status_information: string option;
  status: document_status option;
  document_format: document_format option;
  is_default_version: bool option;
  created_date: float option;
  version_name: string option;
  document_version: string option;
  display_name: string option;
  name: string option
}

type list_document_versions_result = {
  next_token: string option;
  document_versions: document_version_info list option
}

type list_document_versions_request = {
  next_token: string option;
  max_results: int option;
  name: string
}

type document_reviewer_response_source = {
  reviewer: string option;
  comment: document_review_comment_source list option;
  review_status: review_status option;
  updated_time: float option;
  create_time: float option
}

type document_metadata_response_info = {
  reviewer_response: document_reviewer_response_source list option
}

type list_document_metadata_history_response = {
  next_token: string option;
  metadata: document_metadata_response_info option;
  author: string option;
  document_version: string option;
  name: string option
}

type document_metadata_enum = | DocumentReviews

type list_document_metadata_history_request = {
  max_results: int option;
  next_token: string option;
  metadata: document_metadata_enum;
  document_version: string option;
  name: string
}

type compliance_summary_item = {
  non_compliant_summary: non_compliant_summary option;
  compliant_summary: compliant_summary option;
  compliance_type: string option
}

type list_compliance_summaries_result = {
  next_token: string option;
  compliance_summary_items: compliance_summary_item list option
}

type list_compliance_summaries_request = {
  max_results: int option;
  next_token: string option;
  filters: compliance_string_filter list option
}

type compliance_item = {
  details: (string * string) list option;
  execution_summary: compliance_execution_summary option;
  severity: compliance_severity option;
  status: compliance_status option;
  title: string option;
  id: string option;
  resource_id: string option;
  resource_type: string option;
  compliance_type: string option
}

type list_compliance_items_result = {
  next_token: string option;
  compliance_items: compliance_item list option
}

type list_compliance_items_request = {
  max_results: int option;
  next_token: string option;
  resource_types: string list option;
  resource_ids: string list option;
  filters: compliance_string_filter list option
}

type list_commands_result = {
  next_token: string option;
  commands: command list option
}

type command_filter_key = | DOCUMENT_NAME
  | EXECUTION_STAGE
  | STATUS
  | INVOKED_BEFORE
  | INVOKED_AFTER

type command_filter = {
  value: string;
  key: command_filter_key
}

type list_commands_request = {
  filters: command_filter list option;
  next_token: string option;
  max_results: int option;
  instance_id: string option;
  command_id: string option
}

type invalid_command_id = unit

type command_invocation_status = | CANCELLING
  | FAILED
  | TIMED_OUT
  | CANCELLED
  | SUCCESS
  | DELAYED
  | IN_PROGRESS
  | PENDING

type command_plugin_status = | FAILED
  | CANCELLED
  | TIMED_OUT
  | SUCCESS
  | IN_PROGRESS
  | PENDING

type command_plugin = {
  output_s3_key_prefix: string option;
  output_s3_bucket_name: string option;
  output_s3_region: string option;
  standard_error_url: string option;
  standard_output_url: string option;
  output: string option;
  response_finish_date_time: float option;
  response_start_date_time: float option;
  response_code: int option;
  status_details: string option;
  status: command_plugin_status option;
  name: string option
}

type command_invocation = {
  cloud_watch_output_config: cloud_watch_output_config option;
  notification_config: notification_config option;
  service_role: string option;
  command_plugins: command_plugin list option;
  standard_error_url: string option;
  standard_output_url: string option;
  trace_output: string option;
  status_details: string option;
  status: command_invocation_status option;
  requested_date_time: float option;
  document_version: string option;
  document_name: string option;
  comment: string option;
  instance_name: string option;
  instance_id: string option;
  command_id: string option
}

type list_command_invocations_result = {
  next_token: string option;
  command_invocations: command_invocation list option
}

type list_command_invocations_request = {
  details: bool option;
  filters: command_filter list option;
  next_token: string option;
  max_results: int option;
  instance_id: string option;
  command_id: string option
}

type association = {
  target_maps: (string * string list) list list option;
  duration: int option;
  schedule_offset: int option;
  association_name: string option;
  schedule_expression: string option;
  overview: association_overview option;
  last_execution_date: float option;
  targets: target list option;
  document_version: string option;
  association_version: string option;
  association_id: string option;
  instance_id: string option;
  name: string option
}

type list_associations_result = {
  next_token: string option;
  associations: association list option
}

type association_filter_key = | ResourceGroupName
  | AssociationName
  | LastExecutedAfter
  | LastExecutedBefore
  | Status
  | AssociationId
  | Name
  | InstanceId

type association_filter = {
  value: string;
  key: association_filter_key
}

type list_associations_request = {
  next_token: string option;
  max_results: int option;
  association_filter_list: association_filter list option
}

type association_version_info = {
  target_maps: (string * string list) list list option;
  duration: int option;
  schedule_offset: int option;
  target_locations: target_location list option;
  calendar_names: string list option;
  apply_only_at_cron_interval: bool option;
  sync_compliance: association_sync_compliance option;
  compliance_severity: association_compliance_severity option;
  max_concurrency: string option;
  max_errors: string option;
  association_name: string option;
  output_location: instance_association_output_location option;
  schedule_expression: string option;
  targets: target list option;
  parameters: (string * string list) list option;
  document_version: string option;
  name: string option;
  created_date: float option;
  association_version: string option;
  association_id: string option
}

type list_association_versions_result = {
  next_token: string option;
  association_versions: association_version_info list option
}

type list_association_versions_request = {
  next_token: string option;
  max_results: int option;
  association_id: string
}

type label_parameter_version_result = {
  parameter_version: int option;
  invalid_labels: string list option
}

type label_parameter_version_request = {
  labels: string list;
  parameter_version: int option;
  name: string
}

type invocation_does_not_exist = unit

type inventory_schema_delete_option = | DELETE_SCHEMA
  | DISABLE_SCHEMA

type inventory_result_item = {
  content: (string * string) list list;
  content_hash: string option;
  capture_time: string option;
  schema_version: string;
  type_name: string
}

type inventory_result_entity = {
  data: (string * inventory_result_item) list option;
  id: string option
}

type inventory_attribute_data_type = | NUMBER
  | STRING

type inventory_item_attribute = {
  data_type: inventory_attribute_data_type;
  name: string
}

type inventory_item_schema = {
  display_name: string option;
  attributes: inventory_item_attribute list;
  version: string option;
  type_name: string
}

type inventory_group = {
  filters: inventory_filter list;
  name: string
}

type inventory_deletion_status = | COMPLETE
  | IN_PROGRESS

type inventory_deletion_summary_item = {
  remaining_count: int option;
  count: int option;
  version: string option
}

type inventory_deletion_summary = {
  summary_items: inventory_deletion_summary_item list option;
  remaining_count: int option;
  total_count: int option
}

type inventory_deletion_status_item = {
  last_status_update_time: float option;
  deletion_summary: inventory_deletion_summary option;
  last_status_message: string option;
  last_status: inventory_deletion_status option;
  deletion_start_time: float option;
  type_name: string option;
  deletion_id: string option
}

type inventory_aggregator = {
  groups: inventory_group list option;
  aggregators: inventory_aggregator list option;
  expression: string option
}

type invalid_tag = {
  message: string option
}

type invalid_result_attribute_exception = {
  message: string option
}

type invalid_plugin_name = unit

type invalid_option_exception = {
  message: string option
}

type invalid_inventory_request_exception = {
  message: string option
}

type invalid_inventory_group_exception = {
  message: string option
}

type invalid_instance_property_filter_value = {
  message: string option
}

type invalid_instance_information_filter_value = {
  message: string option
}

type invalid_filter_value = {
  message: string option
}

type invalid_filter_option = {
  message: string option
}

type invalid_document_type = {
  message: string option
}

type invalid_deletion_id_exception = {
  message: string option
}

type invalid_delete_inventory_parameters_exception = {
  message: string option
}

type invalid_aggregator_exception = {
  message: string option
}

type invalid_activation_id = {
  message: string option
}

type invalid_activation = {
  message: string option
}

type instance_property_filter_operator = | GREATER_THAN
  | LESS_THAN
  | BEGIN_WITH
  | NOT_EQUAL
  | EQUAL

type instance_property_string_filter = {
  operator: instance_property_filter_operator option;
  values: string list;
  key: string
}

type instance_property_filter_key = | ASSOCIATION_STATUS
  | RESOURCE_TYPE
  | IAM_ROLE
  | ACTIVATION_IDS
  | DOCUMENT_NAME
  | PLATFORM_TYPES
  | PING_STATUS
  | AGENT_VERSION
  | INSTANCE_IDS

type instance_property_filter = {
  value_set: string list;
  key: instance_property_filter_key
}

type instance_aggregated_association_overview = {
  instance_association_status_aggregated_count: (string * int) list option;
  detailed_status: string option
}

type instance_property = {
  source_type: source_type option;
  source_id: string option;
  association_overview: instance_aggregated_association_overview option;
  last_successful_association_execution_date: float option;
  last_association_execution_date: float option;
  association_status: string option;
  computer_name: string option;
  resource_type: string option;
  registration_date: float option;
  iam_role: string option;
  activation_id: string option;
  platform_version: string option;
  platform_name: string option;
  platform_type: platform_type option;
  agent_version: string option;
  last_ping_date_time: float option;
  ping_status: ping_status option;
  launch_time: float option;
  ip_address: string option;
  architecture: string option;
  instance_state: string option;
  key_name: string option;
  instance_role: string option;
  instance_type: string option;
  instance_id: string option;
  name: string option
}

type instance_patch_state = {
  other_non_compliant_count: int option;
  security_non_compliant_count: int option;
  critical_non_compliant_count: int option;
  reboot_option: reboot_option option;
  last_no_reboot_install_operation_time: float option;
  operation: patch_operation_type;
  operation_end_time: float;
  operation_start_time: float;
  not_applicable_count: int option;
  unreported_not_applicable_count: int option;
  failed_count: int option;
  missing_count: int option;
  installed_rejected_count: int option;
  installed_pending_reboot_count: int option;
  installed_other_count: int option;
  installed_count: int option;
  owner_information: string option;
  install_override_list: string option;
  snapshot_id: string option;
  baseline_id: string;
  patch_group: string;
  instance_id: string
}

type instance_patch_state_operator_type = | GREATER_THAN
  | LESS_THAN
  | NOT_EQUAL
  | EQUAL

type instance_patch_state_filter = {
  type_: instance_patch_state_operator_type;
  values: string list;
  key: string
}

type instance_information_string_filter = {
  values: string list;
  key: string
}

type instance_information = {
  source_type: source_type option;
  source_id: string option;
  association_overview: instance_aggregated_association_overview option;
  last_successful_association_execution_date: float option;
  last_association_execution_date: float option;
  association_status: string option;
  computer_name: string option;
  ip_address: string option;
  name: string option;
  resource_type: resource_type option;
  registration_date: float option;
  iam_role: string option;
  activation_id: string option;
  platform_version: string option;
  platform_name: string option;
  platform_type: platform_type option;
  is_latest_version: bool option;
  agent_version: string option;
  last_ping_date_time: float option;
  ping_status: ping_status option;
  instance_id: string option
}

type instance_information_filter_key = | ASSOCIATION_STATUS
  | RESOURCE_TYPE
  | IAM_ROLE
  | ACTIVATION_IDS
  | PLATFORM_TYPES
  | PING_STATUS
  | AGENT_VERSION
  | INSTANCE_IDS

type instance_information_filter = {
  value_set: string list;
  key: instance_information_filter_key
}

type instance_association_output_url = {
  s3_output_url: s3_output_url option
}

type instance_association_status_info = {
  association_name: string option;
  output_url: instance_association_output_url option;
  error_code: string option;
  execution_summary: string option;
  detailed_status: string option;
  status: string option;
  execution_date: float option;
  instance_id: string option;
  association_version: string option;
  document_version: string option;
  name: string option;
  association_id: string option
}

type instance_association = {
  association_version: string option;
  content: string option;
  instance_id: string option;
  association_id: string option
}

type get_service_setting_result = {
  service_setting: service_setting option
}

type get_service_setting_request = {
  setting_id: string
}

type get_resource_policies_response_entry = {
  policy: string option;
  policy_hash: string option;
  policy_id: string option
}

type get_resource_policies_response = {
  policies: get_resource_policies_response_entry list option;
  next_token: string option
}

type get_resource_policies_request = {
  max_results: int option;
  next_token: string option;
  resource_arn: string
}

type get_patch_baseline_result = {
  sources: patch_source list option;
  description: string option;
  modified_date: float option;
  created_date: float option;
  patch_groups: string list option;
  rejected_patches_action: patch_action option;
  rejected_patches: string list option;
  approved_patches_enable_non_security: bool option;
  approved_patches_compliance_level: patch_compliance_level option;
  approved_patches: string list option;
  approval_rules: patch_rule_group option;
  global_filters: patch_filter_group option;
  operating_system: operating_system option;
  name: string option;
  baseline_id: string option
}

type get_patch_baseline_request = {
  baseline_id: string
}

type get_patch_baseline_for_patch_group_result = {
  operating_system: operating_system option;
  patch_group: string option;
  baseline_id: string option
}

type get_patch_baseline_for_patch_group_request = {
  operating_system: operating_system option;
  patch_group: string
}

type get_parameters_result = {
  invalid_parameters: string list option;
  parameters: parameter list option
}

type get_parameters_request = {
  with_decryption: bool option;
  names: string list
}

type get_parameters_by_path_result = {
  next_token: string option;
  parameters: parameter list option
}

type get_parameters_by_path_request = {
  next_token: string option;
  max_results: int option;
  with_decryption: bool option;
  parameter_filters: parameter_string_filter list option;
  recursive: bool option;
  path: string
}

type get_parameter_result = {
  parameter: parameter option
}

type get_parameter_request = {
  with_decryption: bool option;
  name: string
}

type get_parameter_history_result = {
  next_token: string option;
  parameters: parameter_history list option
}

type get_parameter_history_request = {
  next_token: string option;
  max_results: int option;
  with_decryption: bool option;
  name: string
}

type get_ops_summary_result = {
  next_token: string option;
  entities: ops_entity list option
}

type get_ops_summary_request = {
  max_results: int option;
  next_token: string option;
  result_attributes: ops_result_attribute list option;
  aggregators: ops_aggregator list option;
  filters: ops_filter list option;
  sync_name: string option
}

type get_ops_metadata_result = {
  next_token: string option;
  metadata: (string * metadata_value) list option;
  resource_id: string option
}

type get_ops_metadata_request = {
  next_token: string option;
  max_results: int option;
  ops_metadata_arn: string
}

type get_ops_item_response = {
  ops_item: ops_item option
}

type get_ops_item_request = {
  ops_item_arn: string option;
  ops_item_id: string
}

type get_maintenance_window_task_result = {
  alarm_configuration: alarm_configuration option;
  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  description: string option;
  name: string option;
  logging_info: logging_info option;
  max_errors: string option;
  max_concurrency: string option;
  priority: int option;
  task_invocation_parameters: maintenance_window_task_invocation_parameters option;
  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  task_type: maintenance_window_task_type option;
  service_role_arn: string option;
  task_arn: string option;
  targets: target list option;
  window_task_id: string option;
  window_id: string option
}

type get_maintenance_window_task_request = {
  window_task_id: string;
  window_id: string
}

type get_maintenance_window_result = {
  modified_date: float option;
  created_date: float option;
  enabled: bool option;
  allow_unassociated_targets: bool option;
  cutoff: int option;
  duration: int option;
  next_execution_time: string option;
  schedule_offset: int option;
  schedule_timezone: string option;
  schedule: string option;
  end_date: string option;
  start_date: string option;
  description: string option;
  name: string option;
  window_id: string option
}

type get_maintenance_window_request = {
  window_id: string
}

type get_maintenance_window_execution_task_result = {
  triggered_alarms: alarm_state_information list option;
  alarm_configuration: alarm_configuration option;
  end_time: float option;
  start_time: float option;
  status_details: string option;
  status: maintenance_window_execution_status option;
  max_errors: string option;
  max_concurrency: string option;
  priority: int option;
  task_parameters: (string * maintenance_window_task_parameter_value_expression) list list option;
  type_: maintenance_window_task_type option;
  service_role: string option;
  task_arn: string option;
  task_execution_id: string option;
  window_execution_id: string option
}

type get_maintenance_window_execution_task_request = {
  task_id: string;
  window_execution_id: string
}

type get_maintenance_window_execution_task_invocation_result = {
  window_target_id: string option;
  owner_information: string option;
  end_time: float option;
  start_time: float option;
  status_details: string option;
  status: maintenance_window_execution_status option;
  parameters: string option;
  task_type: maintenance_window_task_type option;
  execution_id: string option;
  invocation_id: string option;
  task_execution_id: string option;
  window_execution_id: string option
}

type get_maintenance_window_execution_task_invocation_request = {
  invocation_id: string;
  task_id: string;
  window_execution_id: string
}

type get_maintenance_window_execution_result = {
  end_time: float option;
  start_time: float option;
  status_details: string option;
  status: maintenance_window_execution_status option;
  task_ids: string list option;
  window_execution_id: string option
}

type get_maintenance_window_execution_request = {
  window_execution_id: string
}

type get_inventory_schema_result = {
  next_token: string option;
  schemas: inventory_item_schema list option
}

type get_inventory_schema_request = {
  sub_type: bool option;
  aggregator: bool option;
  max_results: int option;
  next_token: string option;
  type_name: string option
}

type get_inventory_result = {
  next_token: string option;
  entities: inventory_result_entity list option
}

type get_inventory_request = {
  max_results: int option;
  next_token: string option;
  result_attributes: result_attribute list option;
  aggregators: inventory_aggregator list option;
  filters: inventory_filter list option
}

type attachment_hash_type = | SHA256

type attachment_content = {
  url: string option;
  hash_type: attachment_hash_type option;
  hash: string option;
  size: int option;
  name: string option
}

type get_document_result = {
  review_status: review_status option;
  attachments_content: attachment_content list option;
  requires: document_requires list option;
  document_format: document_format option;
  document_type: document_type option;
  content: string option;
  status_information: string option;
  status: document_status option;
  document_version: string option;
  version_name: string option;
  display_name: string option;
  created_date: float option;
  name: string option
}

type get_document_request = {
  document_format: document_format option;
  document_version: string option;
  version_name: string option;
  name: string
}

type get_deployable_patch_snapshot_for_instance_result = {
  product: string option;
  snapshot_download_url: string option;
  snapshot_id: string option;
  instance_id: string option
}

type baseline_override = {
  sources: patch_source list option;
  approved_patches_enable_non_security: bool option;
  rejected_patches_action: patch_action option;
  rejected_patches: string list option;
  approved_patches_compliance_level: patch_compliance_level option;
  approved_patches: string list option;
  approval_rules: patch_rule_group option;
  global_filters: patch_filter_group option;
  operating_system: operating_system option
}

type get_deployable_patch_snapshot_for_instance_request = {
  baseline_override: baseline_override option;
  snapshot_id: string;
  instance_id: string
}

type get_default_patch_baseline_result = {
  operating_system: operating_system option;
  baseline_id: string option
}

type get_default_patch_baseline_request = {
  operating_system: operating_system option
}

type connection_status = | NOT_CONNECTED
  | CONNECTED

type get_connection_status_response = {
  status: connection_status option;
  target: string option
}

type get_connection_status_request = {
  target: string
}

type get_command_invocation_result = {
  cloud_watch_output_config: cloud_watch_output_config option;
  standard_error_url: string option;
  standard_error_content: string option;
  standard_output_url: string option;
  standard_output_content: string option;
  status_details: string option;
  status: command_invocation_status option;
  execution_end_date_time: string option;
  execution_elapsed_time: string option;
  execution_start_date_time: string option;
  response_code: int option;
  plugin_name: string option;
  document_version: string option;
  document_name: string option;
  comment: string option;
  instance_id: string option;
  command_id: string option
}

type get_command_invocation_request = {
  plugin_name: string option;
  instance_id: string;
  command_id: string
}

type calendar_state = | CLOSED
  | OPEN

type get_calendar_state_response = {
  next_transition_time: string option;
  at_time: string option;
  state: calendar_state option
}

type get_calendar_state_request = {
  at_time: string option;
  calendar_names: string list
}

type automation_subtype = | ChangeRequest

type automation_execution = {
  variables: (string * string list) list option;
  change_request_name: string option;
  association_id: string option;
  ops_item_id: string option;
  runbooks: runbook list option;
  scheduled_time: float option;
  automation_subtype: automation_subtype option;
  triggered_alarms: alarm_state_information list option;
  alarm_configuration: alarm_configuration option;
  progress_counters: progress_counters option;
  target_locations: target_location list option;
  target: string option;
  max_errors: string option;
  max_concurrency: string option;
  resolved_targets: resolved_targets option;
  target_maps: (string * string list) list list option;
  targets: target list option;
  target_parameter_name: string option;
  current_action: string option;
  current_step_name: string option;
  executed_by: string option;
  parent_automation_execution_id: string option;
  mode: execution_mode option;
  failure_message: string option;
  outputs: (string * string list) list option;
  parameters: (string * string list) list option;
  step_executions_truncated: bool option;
  step_executions: step_execution list option;
  automation_execution_status: automation_execution_status option;
  execution_end_time: float option;
  execution_start_time: float option;
  document_version: string option;
  document_name: string option;
  automation_execution_id: string option
}

type get_automation_execution_result = {
  automation_execution: automation_execution option
}

type get_automation_execution_request = {
  automation_execution_id: string
}

type fault = | Unknown
  | Server
  | Client

type create_association_batch_request_entry = {
  alarm_configuration: alarm_configuration option;
  target_maps: (string * string list) list list option;
  duration: int option;
  schedule_offset: int option;
  target_locations: target_location list option;
  calendar_names: string list option;
  apply_only_at_cron_interval: bool option;
  sync_compliance: association_sync_compliance option;
  compliance_severity: association_compliance_severity option;
  max_concurrency: string option;
  max_errors: string option;
  association_name: string option;
  output_location: instance_association_output_location option;
  schedule_expression: string option;
  targets: target list option;
  document_version: string option;
  automation_target_parameter_name: string option;
  parameters: (string * string list) list option;
  instance_id: string option;
  name: string
}

type failed_create_association = {
  fault: fault option;
  message: string option;
  entry: create_association_batch_request_entry option
}

type effective_patch = {
  patch_status: patch_status option;
  patch: patch option
}

type document_already_exists = {
  message: string option
}

type disassociate_ops_item_related_item_response = unit

type disassociate_ops_item_related_item_request = {
  association_id: string;
  ops_item_id: string
}

type describe_sessions_response = {
  next_token: string option;
  sessions: session list option
}

type describe_sessions_request = {
  filters: session_filter list option;
  next_token: string option;
  max_results: int option;
  state: session_state
}

type describe_patch_properties_result = {
  next_token: string option;
  properties: (string * string) list list option
}

type describe_patch_properties_request = {
  next_token: string option;
  max_results: int option;
  patch_set: patch_set option;
  property: patch_property;
  operating_system: operating_system
}

type describe_patch_groups_result = {
  next_token: string option;
  mappings: patch_group_patch_baseline_mapping list option
}

type describe_patch_groups_request = {
  next_token: string option;
  filters: patch_orchestrator_filter list option;
  max_results: int option
}

type describe_patch_group_state_result = {
  instances_with_other_non_compliant_patches: int option;
  instances_with_security_non_compliant_patches: int option;
  instances_with_critical_non_compliant_patches: int option;
  instances_with_unreported_not_applicable_patches: int option;
  instances_with_not_applicable_patches: int option;
  instances_with_failed_patches: int option;
  instances_with_missing_patches: int option;
  instances_with_installed_rejected_patches: int option;
  instances_with_installed_pending_reboot_patches: int option;
  instances_with_installed_other_patches: int option;
  instances_with_installed_patches: int option;
  instances: int option
}

type describe_patch_group_state_request = {
  patch_group: string
}

type describe_patch_baselines_result = {
  next_token: string option;
  baseline_identities: patch_baseline_identity list option
}

type describe_patch_baselines_request = {
  next_token: string option;
  max_results: int option;
  filters: patch_orchestrator_filter list option
}

type describe_parameters_result = {
  next_token: string option;
  parameters: parameter_metadata list option
}

type describe_parameters_request = {
  shared: bool option;
  next_token: string option;
  max_results: int option;
  parameter_filters: parameter_string_filter list option;
  filters: parameters_filter list option
}

type describe_ops_items_response = {
  ops_item_summaries: ops_item_summary list option;
  next_token: string option
}

type describe_ops_items_request = {
  next_token: string option;
  max_results: int option;
  ops_item_filters: ops_item_filter list option
}

type describe_maintenance_windows_result = {
  next_token: string option;
  window_identities: maintenance_window_identity list option
}

type describe_maintenance_windows_request = {
  next_token: string option;
  max_results: int option;
  filters: maintenance_window_filter list option
}

type describe_maintenance_windows_for_target_result = {
  next_token: string option;
  window_identities: maintenance_window_identity_for_target list option
}

type describe_maintenance_windows_for_target_request = {
  next_token: string option;
  max_results: int option;
  resource_type: maintenance_window_resource_type;
  targets: target list
}

type describe_maintenance_window_tasks_result = {
  next_token: string option;
  tasks: maintenance_window_task list option
}

type describe_maintenance_window_tasks_request = {
  next_token: string option;
  max_results: int option;
  filters: maintenance_window_filter list option;
  window_id: string
}

type describe_maintenance_window_targets_result = {
  next_token: string option;
  targets: maintenance_window_target list option
}

type describe_maintenance_window_targets_request = {
  next_token: string option;
  max_results: int option;
  filters: maintenance_window_filter list option;
  window_id: string
}

type describe_maintenance_window_schedule_result = {
  next_token: string option;
  scheduled_window_executions: scheduled_window_execution list option
}

type describe_maintenance_window_schedule_request = {
  next_token: string option;
  max_results: int option;
  filters: patch_orchestrator_filter list option;
  resource_type: maintenance_window_resource_type option;
  targets: target list option;
  window_id: string option
}

type describe_maintenance_window_executions_result = {
  next_token: string option;
  window_executions: maintenance_window_execution list option
}

type describe_maintenance_window_executions_request = {
  next_token: string option;
  max_results: int option;
  filters: maintenance_window_filter list option;
  window_id: string
}

type describe_maintenance_window_execution_tasks_result = {
  next_token: string option;
  window_execution_task_identities: maintenance_window_execution_task_identity list option
}

type describe_maintenance_window_execution_tasks_request = {
  next_token: string option;
  max_results: int option;
  filters: maintenance_window_filter list option;
  window_execution_id: string
}

type describe_maintenance_window_execution_task_invocations_result = {
  next_token: string option;
  window_execution_task_invocation_identities: maintenance_window_execution_task_invocation_identity list option
}

type describe_maintenance_window_execution_task_invocations_request = {
  next_token: string option;
  max_results: int option;
  filters: maintenance_window_filter list option;
  task_id: string;
  window_execution_id: string
}

type describe_inventory_deletions_result = {
  next_token: string option;
  inventory_deletions: inventory_deletion_status_item list option
}

type describe_inventory_deletions_request = {
  max_results: int option;
  next_token: string option;
  deletion_id: string option
}

type describe_instance_properties_result = {
  next_token: string option;
  instance_properties: instance_property list option
}

type describe_instance_properties_request = {
  next_token: string option;
  max_results: int option;
  filters_with_operator: instance_property_string_filter list option;
  instance_property_filter_list: instance_property_filter list option
}

type describe_instance_patches_result = {
  next_token: string option;
  patches: patch_compliance_data list option
}

type describe_instance_patches_request = {
  max_results: int option;
  next_token: string option;
  filters: patch_orchestrator_filter list option;
  instance_id: string
}

type describe_instance_patch_states_result = {
  next_token: string option;
  instance_patch_states: instance_patch_state list option
}

type describe_instance_patch_states_request = {
  max_results: int option;
  next_token: string option;
  instance_ids: string list
}

type describe_instance_patch_states_for_patch_group_result = {
  next_token: string option;
  instance_patch_states: instance_patch_state list option
}

type describe_instance_patch_states_for_patch_group_request = {
  max_results: int option;
  next_token: string option;
  filters: instance_patch_state_filter list option;
  patch_group: string
}

type describe_instance_information_result = {
  next_token: string option;
  instance_information_list: instance_information list option
}

type describe_instance_information_request = {
  next_token: string option;
  max_results: int option;
  filters: instance_information_string_filter list option;
  instance_information_filter_list: instance_information_filter list option
}

type describe_instance_associations_status_result = {
  next_token: string option;
  instance_association_status_infos: instance_association_status_info list option
}

type describe_instance_associations_status_request = {
  next_token: string option;
  max_results: int option;
  instance_id: string
}

type describe_effective_patches_for_patch_baseline_result = {
  next_token: string option;
  effective_patches: effective_patch list option
}

type describe_effective_patches_for_patch_baseline_request = {
  next_token: string option;
  max_results: int option;
  baseline_id: string
}

type describe_effective_instance_associations_result = {
  next_token: string option;
  associations: instance_association list option
}

type describe_effective_instance_associations_request = {
  next_token: string option;
  max_results: int option;
  instance_id: string
}

type describe_document_result = {
  document: document_description option
}

type describe_document_request = {
  version_name: string option;
  document_version: string option;
  name: string
}

type account_sharing_info = {
  shared_document_version: string option;
  account_id: string option
}

type describe_document_permission_response = {
  next_token: string option;
  account_sharing_info_list: account_sharing_info list option;
  account_ids: string list option
}

type describe_document_permission_request = {
  next_token: string option;
  max_results: int option;
  permission_type: document_permission_type;
  name: string
}

type describe_available_patches_result = {
  next_token: string option;
  patches: patch list option
}

type describe_available_patches_request = {
  next_token: string option;
  max_results: int option;
  filters: patch_orchestrator_filter list option
}

type describe_automation_step_executions_result = {
  next_token: string option;
  step_executions: step_execution list option
}

type describe_automation_step_executions_request = {
  reverse_order: bool option;
  max_results: int option;
  next_token: string option;
  filters: step_execution_filter list option;
  automation_execution_id: string
}

type automation_type = | Local
  | CrossAccount

type automation_execution_metadata = {
  change_request_name: string option;
  association_id: string option;
  ops_item_id: string option;
  runbooks: runbook list option;
  scheduled_time: float option;
  automation_subtype: automation_subtype option;
  triggered_alarms: alarm_state_information list option;
  alarm_configuration: alarm_configuration option;
  automation_type: automation_type option;
  target: string option;
  max_errors: string option;
  max_concurrency: string option;
  resolved_targets: resolved_targets option;
  target_maps: (string * string list) list list option;
  targets: target list option;
  target_parameter_name: string option;
  failure_message: string option;
  current_action: string option;
  current_step_name: string option;
  parent_automation_execution_id: string option;
  mode: execution_mode option;
  outputs: (string * string list) list option;
  log_file: string option;
  executed_by: string option;
  execution_end_time: float option;
  execution_start_time: float option;
  automation_execution_status: automation_execution_status option;
  document_version: string option;
  document_name: string option;
  automation_execution_id: string option
}

type describe_automation_executions_result = {
  next_token: string option;
  automation_execution_metadata_list: automation_execution_metadata list option
}

type automation_execution_filter_key = | OPS_ITEM_ID
  | AUTOMATION_SUBTYPE
  | TARGET_RESOURCE_GROUP
  | TAG_KEY
  | AUTOMATION_TYPE
  | START_TIME_AFTER
  | START_TIME_BEFORE
  | CURRENT_ACTION
  | PARENT_EXECUTION_ID
  | EXECUTION_ID
  | EXECUTION_STATUS
  | DOCUMENT_NAME_PREFIX

type automation_execution_filter = {
  values: string list;
  key: automation_execution_filter_key
}

type describe_automation_executions_request = {
  next_token: string option;
  max_results: int option;
  filters: automation_execution_filter list option
}

type describe_association_result = {
  association_description: association_description option
}

type describe_association_request = {
  association_version: string option;
  association_id: string option;
  instance_id: string option;
  name: string option
}

type association_execution = {
  triggered_alarms: alarm_state_information list option;
  alarm_configuration: alarm_configuration option;
  resource_count_by_status: string option;
  last_execution_date: float option;
  created_time: float option;
  detailed_status: string option;
  status: string option;
  execution_id: string option;
  association_version: string option;
  association_id: string option
}

type describe_association_executions_result = {
  next_token: string option;
  association_executions: association_execution list option
}

type association_execution_filter_key = | CreatedTime
  | Status
  | ExecutionId

type association_filter_operator_type = | GreaterThan
  | LessThan
  | Equal

type association_execution_filter = {
  type_: association_filter_operator_type;
  value: string;
  key: association_execution_filter_key
}

type describe_association_executions_request = {
  next_token: string option;
  max_results: int option;
  filters: association_execution_filter list option;
  association_id: string
}

type association_execution_target = {
  output_source: output_source option;
  last_execution_date: float option;
  detailed_status: string option;
  status: string option;
  resource_type: string option;
  resource_id: string option;
  execution_id: string option;
  association_version: string option;
  association_id: string option
}

type describe_association_execution_targets_result = {
  next_token: string option;
  association_execution_targets: association_execution_target list option
}

type association_execution_targets_filter_key = | ResourceType
  | ResourceId
  | Status

type association_execution_targets_filter = {
  value: string;
  key: association_execution_targets_filter_key
}

type describe_association_execution_targets_request = {
  next_token: string option;
  max_results: int option;
  filters: association_execution_targets_filter list option;
  execution_id: string;
  association_id: string
}

type association_execution_does_not_exist = {
  message: string option
}

type activation = {
  tags: tag list option;
  created_date: float option;
  expired: bool option;
  expiration_date: float option;
  registrations_count: int option;
  registration_limit: int option;
  iam_role: string option;
  default_instance_name: string option;
  description: string option;
  activation_id: string option
}

type describe_activations_result = {
  next_token: string option;
  activation_list: activation list option
}

type describe_activations_filter_keys = | IAM_ROLE
  | DEFAULT_INSTANCE_NAME
  | ACTIVATION_IDS

type describe_activations_filter = {
  filter_values: string list option;
  filter_key: describe_activations_filter_keys option
}

type describe_activations_request = {
  next_token: string option;
  max_results: int option;
  filters: describe_activations_filter list option
}

type deregister_task_from_maintenance_window_result = {
  window_task_id: string option;
  window_id: string option
}

type deregister_task_from_maintenance_window_request = {
  window_task_id: string;
  window_id: string
}

type deregister_target_from_maintenance_window_result = {
  window_target_id: string option;
  window_id: string option
}

type deregister_target_from_maintenance_window_request = {
  safe: bool option;
  window_target_id: string;
  window_id: string
}

type deregister_patch_baseline_for_patch_group_result = {
  patch_group: string option;
  baseline_id: string option
}

type deregister_patch_baseline_for_patch_group_request = {
  patch_group: string;
  baseline_id: string
}

type deregister_managed_instance_result = unit

type deregister_managed_instance_request = {
  instance_id: string
}

type delete_resource_policy_response = unit

type delete_resource_policy_request = {
  policy_hash: string;
  policy_id: string;
  resource_arn: string
}

type delete_resource_data_sync_result = unit

type delete_resource_data_sync_request = {
  sync_type: string option;
  sync_name: string
}

type delete_patch_baseline_result = {
  baseline_id: string option
}

type delete_patch_baseline_request = {
  baseline_id: string
}

type delete_parameters_result = {
  invalid_parameters: string list option;
  deleted_parameters: string list option
}

type delete_parameters_request = {
  names: string list
}

type delete_parameter_result = unit

type delete_parameter_request = {
  name: string
}

type delete_ops_metadata_result = unit

type delete_ops_metadata_request = {
  ops_metadata_arn: string
}

type delete_ops_item_response = unit

type delete_ops_item_request = {
  ops_item_id: string
}

type delete_maintenance_window_result = {
  window_id: string option
}

type delete_maintenance_window_request = {
  window_id: string
}

type delete_inventory_result = {
  deletion_summary: inventory_deletion_summary option;
  type_name: string option;
  deletion_id: string option
}

type delete_inventory_request = {
  client_token: string option;
  dry_run: bool option;
  schema_delete_option: inventory_schema_delete_option option;
  type_name: string
}

type delete_document_result = unit

type delete_document_request = {
  force: bool option;
  version_name: string option;
  document_version: string option;
  name: string
}

type associated_instances = unit

type delete_association_result = unit

type delete_association_request = {
  association_id: string option;
  instance_id: string option;
  name: string option
}

type delete_activation_result = unit

type delete_activation_request = {
  activation_id: string
}

type create_resource_data_sync_result = unit

type create_resource_data_sync_request = {
  sync_source: resource_data_sync_source option;
  sync_type: string option;
  s3_destination: resource_data_sync_s3_destination option;
  sync_name: string
}

type create_patch_baseline_result = {
  baseline_id: string option
}

type create_patch_baseline_request = {
  tags: tag list option;
  client_token: string option;
  sources: patch_source list option;
  description: string option;
  rejected_patches_action: patch_action option;
  rejected_patches: string list option;
  approved_patches_enable_non_security: bool option;
  approved_patches_compliance_level: patch_compliance_level option;
  approved_patches: string list option;
  approval_rules: patch_rule_group option;
  global_filters: patch_filter_group option;
  name: string;
  operating_system: operating_system option
}

type create_ops_metadata_result = {
  ops_metadata_arn: string option
}

type create_ops_metadata_request = {
  tags: tag list option;
  metadata: (string * metadata_value) list option;
  resource_id: string
}

type create_ops_item_response = {
  ops_item_arn: string option;
  ops_item_id: string option
}

type create_ops_item_request = {
  account_id: string option;
  planned_end_time: float option;
  planned_start_time: float option;
  actual_end_time: float option;
  actual_start_time: float option;
  severity: string option;
  category: string option;
  tags: tag list option;
  title: string;
  source: string;
  related_ops_items: related_ops_item list option;
  priority: int option;
  notifications: ops_item_notification list option;
  operational_data: (string * ops_item_data_value) list option;
  ops_item_type: string option;
  description: string
}

type create_maintenance_window_result = {
  window_id: string option
}

type create_maintenance_window_request = {
  tags: tag list option;
  client_token: string option;
  allow_unassociated_targets: bool;
  cutoff: int;
  duration: int;
  schedule_offset: int option;
  schedule_timezone: string option;
  schedule: string;
  end_date: string option;
  start_date: string option;
  description: string option;
  name: string
}

type create_document_result = {
  document_description: document_description option
}

type create_document_request = {
  tags: tag list option;
  target_type: string option;
  document_format: document_format option;
  document_type: document_type option;
  version_name: string option;
  display_name: string option;
  name: string;
  attachments: attachments_source list option;
  requires: document_requires list option;
  content: string
}

type create_association_result = {
  association_description: association_description option
}

type create_association_request = {
  alarm_configuration: alarm_configuration option;
  tags: tag list option;
  target_maps: (string * string list) list list option;
  duration: int option;
  schedule_offset: int option;
  target_locations: target_location list option;
  calendar_names: string list option;
  apply_only_at_cron_interval: bool option;
  sync_compliance: association_sync_compliance option;
  compliance_severity: association_compliance_severity option;
  max_concurrency: string option;
  max_errors: string option;
  automation_target_parameter_name: string option;
  association_name: string option;
  output_location: instance_association_output_location option;
  schedule_expression: string option;
  targets: target list option;
  parameters: (string * string list) list option;
  instance_id: string option;
  document_version: string option;
  name: string
}

type create_association_batch_result = {
  failed: failed_create_association list option;
  successful: association_description list option
}

type create_association_batch_request = {
  entries: create_association_batch_request_entry list
}

type association_limit_exceeded = unit

type association_already_exists = unit

type create_activation_result = {
  activation_code: string option;
  activation_id: string option
}

type create_activation_request = {
  registration_metadata: registration_metadata_item list option;
  tags: tag list option;
  expiration_date: float option;
  registration_limit: int option;
  iam_role: string;
  default_instance_name: string option;
  description: string option
}

type cancel_maintenance_window_execution_result = {
  window_execution_id: string option
}

type cancel_maintenance_window_execution_request = {
  window_execution_id: string
}

type cancel_command_result = unit

type cancel_command_request = {
  instance_ids: string list option;
  command_id: string
}

type associate_ops_item_related_item_response = {
  association_id: string option
}

type associate_ops_item_related_item_request = {
  resource_uri: string;
  resource_type: string;
  association_type: string;
  ops_item_id: string
}

type add_tags_to_resource_result = unit

type add_tags_to_resource_request = {
  tags: tag list;
  resource_id: string;
  resource_type: resource_type_for_tagging
}



type base_document = Json.t

