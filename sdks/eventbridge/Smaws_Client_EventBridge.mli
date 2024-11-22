open Smaws_Lib
val service : Service.descriptor

type dead_letter_config = {
  arn: string option
}

type update_event_bus_response = {
  dead_letter_config: dead_letter_config option;
  description: string option;
  kms_key_identifier: string option;
  name: string option;
  arn: string option
}

type update_event_bus_request = {
  dead_letter_config: dead_letter_config option;
  description: string option;
  kms_key_identifier: string option;
  name: string option
}

type resource_not_found_exception = {
  message: string option
}

type operation_disabled_exception = {
  message: string option
}

type internal_exception = {
  message: string option
}

type concurrent_modification_exception = {
  message: string option
}

type primary = {
  health_check: string
}

type secondary = {
  route: string
}

type failover_config = {
  secondary: secondary;
  primary: primary
}

type routing_config = {
  failover_config: failover_config
}

type replication_state = | DISABLED
  | ENABLED

type replication_config = {
  state: replication_state option
}

type endpoint_event_bus = {
  event_bus_arn: string
}

type endpoint_state = | DELETE_FAILED
  | UPDATE_FAILED
  | CREATE_FAILED
  | DELETING
  | UPDATING
  | CREATING
  | ACTIVE

type update_endpoint_response = {
  state: endpoint_state option;
  endpoint_url: string option;
  endpoint_id: string option;
  role_arn: string option;
  event_buses: endpoint_event_bus list option;
  replication_config: replication_config option;
  routing_config: routing_config option;
  arn: string option;
  name: string option
}

type update_endpoint_request = {
  role_arn: string option;
  event_buses: endpoint_event_bus list option;
  replication_config: replication_config option;
  routing_config: routing_config option;
  description: string option;
  name: string
}

type connection_state = | DEAUTHORIZING
  | AUTHORIZING
  | DEAUTHORIZED
  | AUTHORIZED
  | DELETING
  | UPDATING
  | CREATING

type update_connection_response = {
  last_authorized_time: float option;
  last_modified_time: float option;
  creation_time: float option;
  connection_state: connection_state option;
  connection_arn: string option
}

type connection_authorization_type = | API_KEY
  | OAUTH_CLIENT_CREDENTIALS
  | BASIC

type update_connection_basic_auth_request_parameters = {
  password: string option;
  username: string option
}

type update_connection_o_auth_client_request_parameters = {
  client_secret: string option;
  client_i_d: string option
}

type connection_o_auth_http_method = | PUT
  | POST
  | GET

type connection_header_parameter = {
  is_value_secret: bool option;
  value: string option;
  key: string option
}

type connection_query_string_parameter = {
  is_value_secret: bool option;
  value: string option;
  key: string option
}

type connection_body_parameter = {
  is_value_secret: bool option;
  value: string option;
  key: string option
}

type connection_http_parameters = {
  body_parameters: connection_body_parameter list option;
  query_string_parameters: connection_query_string_parameter list option;
  header_parameters: connection_header_parameter list option
}

type update_connection_o_auth_request_parameters = {
  o_auth_http_parameters: connection_http_parameters option;
  http_method: connection_o_auth_http_method option;
  authorization_endpoint: string option;
  client_parameters: update_connection_o_auth_client_request_parameters option
}

type update_connection_api_key_auth_request_parameters = {
  api_key_value: string option;
  api_key_name: string option
}

type update_connection_auth_request_parameters = {
  invocation_http_parameters: connection_http_parameters option;
  api_key_auth_parameters: update_connection_api_key_auth_request_parameters option;
  o_auth_parameters: update_connection_o_auth_request_parameters option;
  basic_auth_parameters: update_connection_basic_auth_request_parameters option
}

type update_connection_request = {
  auth_parameters: update_connection_auth_request_parameters option;
  authorization_type: connection_authorization_type option;
  description: string option;
  name: string
}

type limit_exceeded_exception = {
  message: string option
}

type archive_state = | UPDATE_FAILED
  | CREATE_FAILED
  | UPDATING
  | CREATING
  | DISABLED
  | ENABLED

type update_archive_response = {
  creation_time: float option;
  state_reason: string option;
  state: archive_state option;
  archive_arn: string option
}

type update_archive_request = {
  retention_days: int option;
  event_pattern: string option;
  description: string option;
  archive_name: string
}

type invalid_event_pattern_exception = {
  message: string option
}

type api_destination_state = | INACTIVE
  | ACTIVE

type update_api_destination_response = {
  last_modified_time: float option;
  creation_time: float option;
  api_destination_state: api_destination_state option;
  api_destination_arn: string option
}

type api_destination_http_method = | DELETE
  | PATCH
  | PUT
  | OPTIONS
  | HEAD
  | GET
  | POST

type update_api_destination_request = {
  invocation_rate_limit_per_second: int option;
  http_method: api_destination_http_method option;
  invocation_endpoint: string option;
  connection_arn: string option;
  description: string option;
  name: string
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_ar_n: string
}

type managed_rule_exception = {
  message: string option
}

type test_event_pattern_response = {
  result: bool option
}

type test_event_pattern_request = {
  event: string;
  event_pattern: string
}

type input_transformer = {
  input_template: string;
  input_paths_map: (string * string) list option
}

type kinesis_parameters = {
  partition_key_path: string
}

type run_command_target = {
  values: string list;
  key: string
}

type run_command_parameters = {
  run_command_targets: run_command_target list
}

type launch_type = | EXTERNAL
  | FARGATE
  | EC2

type assign_public_ip = | DISABLED
  | ENABLED

type aws_vpc_configuration = {
  assign_public_ip: assign_public_ip option;
  security_groups: string list option;
  subnets: string list
}

type network_configuration = {
  awsvpc_configuration: aws_vpc_configuration option
}

type capacity_provider_strategy_item = {
  base: int option;
  weight: int option;
  capacity_provider: string
}

type placement_constraint_type = | MEMBER_OF
  | DISTINCT_INSTANCE

type placement_constraint = {
  expression: string option;
  type_: placement_constraint_type option
}

type placement_strategy_type = | BINPACK
  | SPREAD
  | RANDOM

type placement_strategy = {
  field: string option;
  type_: placement_strategy_type option
}

type propagate_tags = | TASK_DEFINITION

type tag = {
  value: string;
  key: string
}

type ecs_parameters = {
  tags: tag list option;
  reference_id: string option;
  propagate_tags: propagate_tags option;
  placement_strategy: placement_strategy list option;
  placement_constraints: placement_constraint list option;
  enable_execute_command: bool option;
  enable_ecs_managed_tags: bool option;
  capacity_provider_strategy: capacity_provider_strategy_item list option;
  group: string option;
  platform_version: string option;
  network_configuration: network_configuration option;
  launch_type: launch_type option;
  task_count: int option;
  task_definition_arn: string
}

type batch_array_properties = {
  size: int option
}

type batch_retry_strategy = {
  attempts: int option
}

type batch_parameters = {
  retry_strategy: batch_retry_strategy option;
  array_properties: batch_array_properties option;
  job_name: string;
  job_definition: string
}

type sqs_parameters = {
  message_group_id: string option
}

type http_parameters = {
  query_string_parameters: (string * string) list option;
  header_parameters: (string * string) list option;
  path_parameter_values: string list option
}

type redshift_data_parameters = {
  sqls: string list option;
  with_event: bool option;
  statement_name: string option;
  sql: string option;
  db_user: string option;
  database: string;
  secret_manager_arn: string option
}

type sage_maker_pipeline_parameter = {
  value: string;
  name: string
}

type sage_maker_pipeline_parameters = {
  pipeline_parameter_list: sage_maker_pipeline_parameter list option
}

type retry_policy = {
  maximum_event_age_in_seconds: int option;
  maximum_retry_attempts: int option
}

type app_sync_parameters = {
  graph_ql_operation: string option
}

type target = {
  app_sync_parameters: app_sync_parameters option;
  retry_policy: retry_policy option;
  dead_letter_config: dead_letter_config option;
  sage_maker_pipeline_parameters: sage_maker_pipeline_parameters option;
  redshift_data_parameters: redshift_data_parameters option;
  http_parameters: http_parameters option;
  sqs_parameters: sqs_parameters option;
  batch_parameters: batch_parameters option;
  ecs_parameters: ecs_parameters option;
  run_command_parameters: run_command_parameters option;
  kinesis_parameters: kinesis_parameters option;
  input_transformer: input_transformer option;
  input_path: string option;
  input: string option;
  role_arn: string option;
  arn: string;
  id: string
}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
  resource_ar_n: string
}

type replay_state = | FAILED
  | CANCELLED
  | COMPLETED
  | CANCELLING
  | RUNNING
  | STARTING

type start_replay_response = {
  replay_start_time: float option;
  state_reason: string option;
  state: replay_state option;
  replay_arn: string option
}

type replay_destination = {
  filter_arns: string list option;
  arn: string
}

type start_replay_request = {
  destination: replay_destination;
  event_end_time: float;
  event_start_time: float;
  event_source_arn: string;
  description: string option;
  replay_name: string
}

type resource_already_exists_exception = {
  message: string option
}

type rule_state = | ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS
  | DISABLED
  | ENABLED

type rule = {
  event_bus_name: string option;
  managed_by: string option;
  role_arn: string option;
  schedule_expression: string option;
  description: string option;
  state: rule_state option;
  event_pattern: string option;
  arn: string option;
  name: string option
}

type replay = {
  replay_end_time: float option;
  replay_start_time: float option;
  event_last_replayed_time: float option;
  event_end_time: float option;
  event_start_time: float option;
  state_reason: string option;
  state: replay_state option;
  event_source_arn: string option;
  replay_name: string option
}

type remove_targets_result_entry = {
  error_message: string option;
  error_code: string option;
  target_id: string option
}

type remove_targets_response = {
  failed_entries: remove_targets_result_entry list option;
  failed_entry_count: int option
}

type remove_targets_request = {
  force: bool option;
  ids: string list;
  event_bus_name: string option;
  rule: string
}

type remove_permission_request = {
  event_bus_name: string option;
  remove_all_permissions: bool option;
  statement_id: string option
}

type put_targets_result_entry = {
  error_message: string option;
  error_code: string option;
  target_id: string option
}

type put_targets_response = {
  failed_entries: put_targets_result_entry list option;
  failed_entry_count: int option
}

type put_targets_request = {
  targets: target list;
  event_bus_name: string option;
  rule: string
}

type put_rule_response = {
  rule_arn: string option
}

type put_rule_request = {
  event_bus_name: string option;
  tags: tag list option;
  role_arn: string option;
  description: string option;
  state: rule_state option;
  event_pattern: string option;
  schedule_expression: string option;
  name: string
}

type condition = {
  value: string;
  key: string;
  type_: string
}

type put_permission_request = {
  policy: string option;
  condition: condition option;
  statement_id: string option;
  principal: string option;
  action: string option;
  event_bus_name: string option
}

type policy_length_exceeded_exception = {
  message: string option
}

type put_partner_events_result_entry = {
  error_message: string option;
  error_code: string option;
  event_id: string option
}

type put_partner_events_response = {
  entries: put_partner_events_result_entry list option;
  failed_entry_count: int option
}

type put_partner_events_request_entry = {
  detail: string option;
  detail_type: string option;
  resources: string list option;
  source: string option;
  time: float option
}

type put_partner_events_request = {
  entries: put_partner_events_request_entry list
}

type put_events_result_entry = {
  error_message: string option;
  error_code: string option;
  event_id: string option
}

type put_events_response = {
  entries: put_events_result_entry list option;
  failed_entry_count: int option
}

type put_events_request_entry = {
  trace_header: string option;
  event_bus_name: string option;
  detail: string option;
  detail_type: string option;
  resources: string list option;
  source: string option;
  time: float option
}

type put_events_request = {
  endpoint_id: string option;
  entries: put_events_request_entry list
}

type partner_event_source = {
  name: string option;
  arn: string option
}

type event_source_state = | DELETED
  | ACTIVE
  | PENDING

type partner_event_source_account = {
  state: event_source_state option;
  expiration_time: float option;
  creation_time: float option;
  account: string option
}

type list_targets_by_rule_response = {
  next_token: string option;
  targets: target list option
}

type list_targets_by_rule_request = {
  limit: int option;
  next_token: string option;
  event_bus_name: string option;
  rule: string
}

type list_tags_for_resource_response = {
  tags: tag list option
}

type list_tags_for_resource_request = {
  resource_ar_n: string
}

type list_rules_response = {
  next_token: string option;
  rules: rule list option
}

type list_rules_request = {
  limit: int option;
  next_token: string option;
  event_bus_name: string option;
  name_prefix: string option
}

type list_rule_names_by_target_response = {
  next_token: string option;
  rule_names: string list option
}

type list_rule_names_by_target_request = {
  limit: int option;
  next_token: string option;
  event_bus_name: string option;
  target_arn: string
}

type list_replays_response = {
  next_token: string option;
  replays: replay list option
}

type list_replays_request = {
  limit: int option;
  next_token: string option;
  event_source_arn: string option;
  state: replay_state option;
  name_prefix: string option
}

type list_partner_event_sources_response = {
  next_token: string option;
  partner_event_sources: partner_event_source list option
}

type list_partner_event_sources_request = {
  limit: int option;
  next_token: string option;
  name_prefix: string
}

type list_partner_event_source_accounts_response = {
  next_token: string option;
  partner_event_source_accounts: partner_event_source_account list option
}

type list_partner_event_source_accounts_request = {
  limit: int option;
  next_token: string option;
  event_source_name: string
}

type event_source = {
  state: event_source_state option;
  name: string option;
  expiration_time: float option;
  creation_time: float option;
  created_by: string option;
  arn: string option
}

type list_event_sources_response = {
  next_token: string option;
  event_sources: event_source list option
}

type list_event_sources_request = {
  limit: int option;
  next_token: string option;
  name_prefix: string option
}

type event_bus = {
  last_modified_time: float option;
  creation_time: float option;
  policy: string option;
  description: string option;
  arn: string option;
  name: string option
}

type list_event_buses_response = {
  next_token: string option;
  event_buses: event_bus list option
}

type list_event_buses_request = {
  limit: int option;
  next_token: string option;
  name_prefix: string option
}

type endpoint = {
  last_modified_time: float option;
  creation_time: float option;
  state_reason: string option;
  state: endpoint_state option;
  endpoint_url: string option;
  endpoint_id: string option;
  role_arn: string option;
  event_buses: endpoint_event_bus list option;
  replication_config: replication_config option;
  routing_config: routing_config option;
  arn: string option;
  description: string option;
  name: string option
}

type list_endpoints_response = {
  next_token: string option;
  endpoints: endpoint list option
}

type list_endpoints_request = {
  max_results: int option;
  next_token: string option;
  home_region: string option;
  name_prefix: string option
}

type connection = {
  last_authorized_time: float option;
  last_modified_time: float option;
  creation_time: float option;
  authorization_type: connection_authorization_type option;
  state_reason: string option;
  connection_state: connection_state option;
  name: string option;
  connection_arn: string option
}

type list_connections_response = {
  next_token: string option;
  connections: connection list option
}

type list_connections_request = {
  limit: int option;
  next_token: string option;
  connection_state: connection_state option;
  name_prefix: string option
}

type archive = {
  creation_time: float option;
  event_count: int option;
  size_bytes: int option;
  retention_days: int option;
  state_reason: string option;
  state: archive_state option;
  event_source_arn: string option;
  archive_name: string option
}

type list_archives_response = {
  next_token: string option;
  archives: archive list option
}

type list_archives_request = {
  limit: int option;
  next_token: string option;
  state: archive_state option;
  event_source_arn: string option;
  name_prefix: string option
}

type api_destination = {
  last_modified_time: float option;
  creation_time: float option;
  invocation_rate_limit_per_second: int option;
  http_method: api_destination_http_method option;
  invocation_endpoint: string option;
  connection_arn: string option;
  api_destination_state: api_destination_state option;
  name: string option;
  api_destination_arn: string option
}

type list_api_destinations_response = {
  next_token: string option;
  api_destinations: api_destination list option
}

type list_api_destinations_request = {
  limit: int option;
  next_token: string option;
  connection_arn: string option;
  name_prefix: string option
}

type invalid_state_exception = {
  message: string option
}

type illegal_status_exception = {
  message: string option
}

type enable_rule_request = {
  event_bus_name: string option;
  name: string
}

type disable_rule_request = {
  event_bus_name: string option;
  name: string
}

type describe_rule_response = {
  created_by: string option;
  event_bus_name: string option;
  managed_by: string option;
  role_arn: string option;
  description: string option;
  state: rule_state option;
  schedule_expression: string option;
  event_pattern: string option;
  arn: string option;
  name: string option
}

type describe_rule_request = {
  event_bus_name: string option;
  name: string
}

type describe_replay_response = {
  replay_end_time: float option;
  replay_start_time: float option;
  event_last_replayed_time: float option;
  event_end_time: float option;
  event_start_time: float option;
  destination: replay_destination option;
  event_source_arn: string option;
  state_reason: string option;
  state: replay_state option;
  description: string option;
  replay_arn: string option;
  replay_name: string option
}

type describe_replay_request = {
  replay_name: string
}

type describe_partner_event_source_response = {
  name: string option;
  arn: string option
}

type describe_partner_event_source_request = {
  name: string
}

type describe_event_source_response = {
  state: event_source_state option;
  name: string option;
  expiration_time: float option;
  creation_time: float option;
  created_by: string option;
  arn: string option
}

type describe_event_source_request = {
  name: string
}

type describe_event_bus_response = {
  last_modified_time: float option;
  creation_time: float option;
  policy: string option;
  dead_letter_config: dead_letter_config option;
  kms_key_identifier: string option;
  description: string option;
  arn: string option;
  name: string option
}

type describe_event_bus_request = {
  name: string option
}

type describe_endpoint_response = {
  last_modified_time: float option;
  creation_time: float option;
  state_reason: string option;
  state: endpoint_state option;
  endpoint_url: string option;
  endpoint_id: string option;
  role_arn: string option;
  event_buses: endpoint_event_bus list option;
  replication_config: replication_config option;
  routing_config: routing_config option;
  arn: string option;
  description: string option;
  name: string option
}

type describe_endpoint_request = {
  home_region: string option;
  name: string
}

type connection_basic_auth_response_parameters = {
  username: string option
}

type connection_o_auth_client_response_parameters = {
  client_i_d: string option
}

type connection_o_auth_response_parameters = {
  o_auth_http_parameters: connection_http_parameters option;
  http_method: connection_o_auth_http_method option;
  authorization_endpoint: string option;
  client_parameters: connection_o_auth_client_response_parameters option
}

type connection_api_key_auth_response_parameters = {
  api_key_name: string option
}

type connection_auth_response_parameters = {
  invocation_http_parameters: connection_http_parameters option;
  api_key_auth_parameters: connection_api_key_auth_response_parameters option;
  o_auth_parameters: connection_o_auth_response_parameters option;
  basic_auth_parameters: connection_basic_auth_response_parameters option
}

type describe_connection_response = {
  last_authorized_time: float option;
  last_modified_time: float option;
  creation_time: float option;
  auth_parameters: connection_auth_response_parameters option;
  secret_arn: string option;
  authorization_type: connection_authorization_type option;
  state_reason: string option;
  connection_state: connection_state option;
  description: string option;
  name: string option;
  connection_arn: string option
}

type describe_connection_request = {
  name: string
}

type describe_archive_response = {
  creation_time: float option;
  event_count: int option;
  size_bytes: int option;
  retention_days: int option;
  state_reason: string option;
  state: archive_state option;
  event_pattern: string option;
  description: string option;
  event_source_arn: string option;
  archive_name: string option;
  archive_arn: string option
}

type describe_archive_request = {
  archive_name: string
}

type describe_api_destination_response = {
  last_modified_time: float option;
  creation_time: float option;
  invocation_rate_limit_per_second: int option;
  http_method: api_destination_http_method option;
  invocation_endpoint: string option;
  connection_arn: string option;
  api_destination_state: api_destination_state option;
  description: string option;
  name: string option;
  api_destination_arn: string option
}

type describe_api_destination_request = {
  name: string
}

type delete_rule_request = {
  force: bool option;
  event_bus_name: string option;
  name: string
}

type delete_partner_event_source_request = {
  account: string;
  name: string
}

type delete_event_bus_request = {
  name: string
}

type delete_endpoint_response = unit

type delete_endpoint_request = {
  name: string
}

type delete_connection_response = {
  last_authorized_time: float option;
  last_modified_time: float option;
  creation_time: float option;
  connection_state: connection_state option;
  connection_arn: string option
}

type delete_connection_request = {
  name: string
}

type delete_archive_response = unit

type delete_archive_request = {
  archive_name: string
}

type delete_api_destination_response = unit

type delete_api_destination_request = {
  name: string
}

type deauthorize_connection_response = {
  last_authorized_time: float option;
  last_modified_time: float option;
  creation_time: float option;
  connection_state: connection_state option;
  connection_arn: string option
}

type deauthorize_connection_request = {
  name: string
}

type deactivate_event_source_request = {
  name: string
}

type create_partner_event_source_response = {
  event_source_arn: string option
}

type create_partner_event_source_request = {
  account: string;
  name: string
}

type create_event_bus_response = {
  dead_letter_config: dead_letter_config option;
  kms_key_identifier: string option;
  description: string option;
  event_bus_arn: string option
}

type create_event_bus_request = {
  tags: tag list option;
  dead_letter_config: dead_letter_config option;
  kms_key_identifier: string option;
  description: string option;
  event_source_name: string option;
  name: string
}

type create_endpoint_response = {
  state: endpoint_state option;
  role_arn: string option;
  event_buses: endpoint_event_bus list option;
  replication_config: replication_config option;
  routing_config: routing_config option;
  arn: string option;
  name: string option
}

type create_endpoint_request = {
  role_arn: string option;
  event_buses: endpoint_event_bus list;
  replication_config: replication_config option;
  routing_config: routing_config;
  description: string option;
  name: string
}

type create_connection_response = {
  last_modified_time: float option;
  creation_time: float option;
  connection_state: connection_state option;
  connection_arn: string option
}

type create_connection_basic_auth_request_parameters = {
  password: string;
  username: string
}

type create_connection_o_auth_client_request_parameters = {
  client_secret: string;
  client_i_d: string
}

type create_connection_o_auth_request_parameters = {
  o_auth_http_parameters: connection_http_parameters option;
  http_method: connection_o_auth_http_method;
  authorization_endpoint: string;
  client_parameters: create_connection_o_auth_client_request_parameters
}

type create_connection_api_key_auth_request_parameters = {
  api_key_value: string;
  api_key_name: string
}

type create_connection_auth_request_parameters = {
  invocation_http_parameters: connection_http_parameters option;
  api_key_auth_parameters: create_connection_api_key_auth_request_parameters option;
  o_auth_parameters: create_connection_o_auth_request_parameters option;
  basic_auth_parameters: create_connection_basic_auth_request_parameters option
}

type create_connection_request = {
  auth_parameters: create_connection_auth_request_parameters;
  authorization_type: connection_authorization_type;
  description: string option;
  name: string
}

type create_archive_response = {
  creation_time: float option;
  state_reason: string option;
  state: archive_state option;
  archive_arn: string option
}

type create_archive_request = {
  retention_days: int option;
  event_pattern: string option;
  description: string option;
  event_source_arn: string;
  archive_name: string
}

type create_api_destination_response = {
  last_modified_time: float option;
  creation_time: float option;
  api_destination_state: api_destination_state option;
  api_destination_arn: string option
}

type create_api_destination_request = {
  invocation_rate_limit_per_second: int option;
  http_method: api_destination_http_method;
  invocation_endpoint: string;
  connection_arn: string;
  description: string option;
  name: string
}

type cancel_replay_response = {
  state_reason: string option;
  state: replay_state option;
  replay_arn: string option
}

type cancel_replay_request = {
  replay_name: string
}

type activate_event_source_request = {
  name: string
}



type base_document = Json.t

val make_dead_letter_config :
  ?arn:string -> unit
-> dead_letter_config

val make_update_event_bus_response :
  ?dead_letter_config:dead_letter_config ->
  ?description:string ->
  ?kms_key_identifier:string ->
  ?name:string ->
  ?arn:string ->
  unit -> update_event_bus_response

val make_update_event_bus_request :
  ?dead_letter_config:dead_letter_config ->
  ?description:string ->
  ?kms_key_identifier:string ->
  ?name:string ->
  unit -> update_event_bus_request

val make_primary : health_check:string -> unit -> primary

val make_secondary : route:string -> unit
-> secondary

val make_failover_config : secondary:secondary -> primary:primary -> unit
-> failover_config

val make_routing_config : failover_config:failover_config -> unit
-> routing_config

val make_replication_config : ?state:replication_state -> unit
-> replication_config

val make_endpoint_event_bus : event_bus_arn:string -> unit
-> endpoint_event_bus

val make_update_endpoint_response :
  ?state:endpoint_state ->
  ?endpoint_url:string ->
  ?endpoint_id:string ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?name:string ->
  unit -> update_endpoint_response

val make_update_endpoint_request :
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?description:string ->
  name:string ->
  unit -> update_endpoint_request

val make_update_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> update_connection_response

val make_update_connection_basic_auth_request_parameters :
  ?password:string -> ?username:string -> unit
-> update_connection_basic_auth_request_parameters

val make_update_connection_o_auth_client_request_parameters :
  ?client_secret:string -> ?client_i_d:string -> unit
-> update_connection_o_auth_client_request_parameters

val make_connection_header_parameter :
  ?is_value_secret:bool -> ?value:string -> ?key:string -> unit
-> connection_header_parameter

val make_connection_query_string_parameter :
  ?is_value_secret:bool -> ?value:string -> ?key:string -> unit
-> connection_query_string_parameter

val make_connection_body_parameter :
  ?is_value_secret:bool -> ?value:string -> ?key:string -> unit
-> connection_body_parameter

val make_connection_http_parameters :
  ?body_parameters:connection_body_parameter list ->
  ?query_string_parameters:connection_query_string_parameter list ->
  ?header_parameters:connection_header_parameter list ->
  unit
-> connection_http_parameters

val make_update_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  ?http_method:connection_o_auth_http_method ->
  ?authorization_endpoint:string ->
  ?client_parameters:update_connection_o_auth_client_request_parameters ->
  unit
-> update_connection_o_auth_request_parameters

val make_update_connection_api_key_auth_request_parameters :
  ?api_key_value:string -> ?api_key_name:string -> unit
-> update_connection_api_key_auth_request_parameters

val make_update_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:update_connection_api_key_auth_request_parameters ->
  ?o_auth_parameters:update_connection_o_auth_request_parameters ->
  ?basic_auth_parameters:update_connection_basic_auth_request_parameters ->
  unit
-> update_connection_auth_request_parameters

val make_update_connection_request :
  ?auth_parameters:update_connection_auth_request_parameters ->
  ?authorization_type:connection_authorization_type ->
  ?description:string ->
  name:string ->
  unit -> update_connection_request

val make_update_archive_response :
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?archive_arn:string ->
  unit -> update_archive_response

val make_update_archive_request :
  ?retention_days:int ->
  ?event_pattern:string ->
  ?description:string ->
  archive_name:string ->
  unit -> update_archive_request

val make_update_api_destination_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?api_destination_state:api_destination_state ->
  ?api_destination_arn:string ->
  unit
-> update_api_destination_response

val make_update_api_destination_request :
  ?invocation_rate_limit_per_second:int ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:string ->
  ?connection_arn:string ->
  ?description:string ->
  name:string ->
  unit -> update_api_destination_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request

val make_test_event_pattern_response : ?result:bool -> unit
-> test_event_pattern_response

val make_test_event_pattern_request :
  event:string -> event_pattern:string -> unit
-> test_event_pattern_request

val make_input_transformer :
  ?input_paths_map:(string * string) list -> input_template:string -> unit
-> input_transformer

val make_kinesis_parameters : partition_key_path:string -> unit
-> kinesis_parameters

val make_run_command_target : values:string list -> key:string -> unit
-> run_command_target

val make_run_command_parameters :
  run_command_targets:run_command_target list -> unit
-> run_command_parameters

val make_aws_vpc_configuration :
  ?assign_public_ip:assign_public_ip ->
  ?security_groups:string list ->
  subnets:string list ->
  unit -> aws_vpc_configuration

val make_network_configuration :
  ?awsvpc_configuration:aws_vpc_configuration -> unit
-> network_configuration

val make_capacity_provider_strategy_item :
  ?base:int -> ?weight:int -> capacity_provider:string -> unit
-> capacity_provider_strategy_item

val make_placement_constraint :
  ?expression:string -> ?type_:placement_constraint_type -> unit
-> placement_constraint

val make_placement_strategy :
  ?field:string -> ?type_:placement_strategy_type -> unit
-> placement_strategy

val make_tag : value:string -> key:string -> unit
-> tag

val make_ecs_parameters :
  ?tags:tag list ->
  ?reference_id:string ->
  ?propagate_tags:propagate_tags ->
  ?placement_strategy:placement_strategy list ->
  ?placement_constraints:placement_constraint list ->
  ?enable_execute_command:bool ->
  ?enable_ecs_managed_tags:bool ->
  ?capacity_provider_strategy:capacity_provider_strategy_item list ->
  ?group:string ->
  ?platform_version:string ->
  ?network_configuration:network_configuration ->
  ?launch_type:launch_type ->
  ?task_count:int ->
  task_definition_arn:string ->
  unit -> ecs_parameters

val make_batch_array_properties : ?size:int -> unit
-> batch_array_properties

val make_batch_retry_strategy : ?attempts:int -> unit
-> batch_retry_strategy

val make_batch_parameters :
  ?retry_strategy:batch_retry_strategy ->
  ?array_properties:batch_array_properties ->
  job_name:string ->
  job_definition:string ->
  unit -> batch_parameters

val make_sqs_parameters : ?message_group_id:string -> unit
-> sqs_parameters

val make_http_parameters :
  ?query_string_parameters:(string * string) list ->
  ?header_parameters:(string * string) list ->
  ?path_parameter_values:string list ->
  unit -> http_parameters

val make_redshift_data_parameters :
  ?sqls:string list ->
  ?with_event:bool ->
  ?statement_name:string ->
  ?sql:string ->
  ?db_user:string ->
  ?secret_manager_arn:string ->
  database:string ->
  unit -> redshift_data_parameters

val make_sage_maker_pipeline_parameter : value:string -> name:string -> unit
-> sage_maker_pipeline_parameter

val make_sage_maker_pipeline_parameters :
  ?pipeline_parameter_list:sage_maker_pipeline_parameter list -> unit
-> sage_maker_pipeline_parameters

val make_retry_policy :
  ?maximum_event_age_in_seconds:int -> ?maximum_retry_attempts:int -> unit
-> retry_policy

val make_app_sync_parameters : ?graph_ql_operation:string -> unit
-> app_sync_parameters

val make_target :
  ?app_sync_parameters:app_sync_parameters ->
  ?retry_policy:retry_policy ->
  ?dead_letter_config:dead_letter_config ->
  ?sage_maker_pipeline_parameters:sage_maker_pipeline_parameters ->
  ?redshift_data_parameters:redshift_data_parameters ->
  ?http_parameters:http_parameters ->
  ?sqs_parameters:sqs_parameters ->
  ?batch_parameters:batch_parameters ->
  ?ecs_parameters:ecs_parameters ->
  ?run_command_parameters:run_command_parameters ->
  ?kinesis_parameters:kinesis_parameters ->
  ?input_transformer:input_transformer ->
  ?input_path:string ->
  ?input:string ->
  ?role_arn:string ->
  arn:string ->
  id:string ->
  unit -> target

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request

val make_start_replay_response :
  ?replay_start_time:float ->
  ?state_reason:string ->
  ?state:replay_state ->
  ?replay_arn:string ->
  unit -> start_replay_response

val make_replay_destination : ?filter_arns:string list -> arn:string -> unit
-> replay_destination

val make_start_replay_request :
  ?description:string ->
  destination:replay_destination ->
  event_end_time:float ->
  event_start_time:float ->
  event_source_arn:string ->
  replay_name:string ->
  unit -> start_replay_request

val make_rule :
  ?event_bus_name:string ->
  ?managed_by:string ->
  ?role_arn:string ->
  ?schedule_expression:string ->
  ?description:string ->
  ?state:rule_state ->
  ?event_pattern:string ->
  ?arn:string ->
  ?name:string ->
  unit -> rule

val make_replay :
  ?replay_end_time:float ->
  ?replay_start_time:float ->
  ?event_last_replayed_time:float ->
  ?event_end_time:float ->
  ?event_start_time:float ->
  ?state_reason:string ->
  ?state:replay_state ->
  ?event_source_arn:string ->
  ?replay_name:string ->
  unit -> replay

val make_remove_targets_result_entry :
  ?error_message:string -> ?error_code:string -> ?target_id:string -> unit
-> remove_targets_result_entry

val make_remove_targets_response :
  ?failed_entries:remove_targets_result_entry list ->
  ?failed_entry_count:int ->
  unit -> remove_targets_response

val make_remove_targets_request :
  ?force:bool ->
  ?event_bus_name:string ->
  ids:string list ->
  rule:string ->
  unit -> remove_targets_request

val make_remove_permission_request :
  ?event_bus_name:string ->
  ?remove_all_permissions:bool ->
  ?statement_id:string ->
  unit -> remove_permission_request

val make_put_targets_result_entry :
  ?error_message:string -> ?error_code:string -> ?target_id:string -> unit
-> put_targets_result_entry

val make_put_targets_response :
  ?failed_entries:put_targets_result_entry list ->
  ?failed_entry_count:int ->
  unit -> put_targets_response

val make_put_targets_request :
  ?event_bus_name:string -> targets:target list -> rule:string -> unit
-> put_targets_request

val make_put_rule_response : ?rule_arn:string -> unit
-> put_rule_response

val make_put_rule_request :
  ?event_bus_name:string ->
  ?tags:tag list ->
  ?role_arn:string ->
  ?description:string ->
  ?state:rule_state ->
  ?event_pattern:string ->
  ?schedule_expression:string ->
  name:string ->
  unit -> put_rule_request

val make_condition : value:string -> key:string -> type_:string -> unit
-> condition

val make_put_permission_request :
  ?policy:string ->
  ?condition:condition ->
  ?statement_id:string ->
  ?principal:string ->
  ?action:string ->
  ?event_bus_name:string ->
  unit -> put_permission_request

val make_put_partner_events_result_entry :
  ?error_message:string -> ?error_code:string -> ?event_id:string -> unit
-> put_partner_events_result_entry

val make_put_partner_events_response :
  ?entries:put_partner_events_result_entry list ->
  ?failed_entry_count:int ->
  unit
-> put_partner_events_response

val make_put_partner_events_request_entry :
  ?detail:string ->
  ?detail_type:string ->
  ?resources:string list ->
  ?source:string ->
  ?time:float ->
  unit
-> put_partner_events_request_entry

val make_put_partner_events_request :
  entries:put_partner_events_request_entry list -> unit
-> put_partner_events_request

val make_put_events_result_entry :
  ?error_message:string -> ?error_code:string -> ?event_id:string -> unit
-> put_events_result_entry

val make_put_events_response :
  ?entries:put_events_result_entry list -> ?failed_entry_count:int -> unit
-> put_events_response

val make_put_events_request_entry :
  ?trace_header:string ->
  ?event_bus_name:string ->
  ?detail:string ->
  ?detail_type:string ->
  ?resources:string list ->
  ?source:string ->
  ?time:float ->
  unit -> put_events_request_entry

val make_put_events_request :
  ?endpoint_id:string -> entries:put_events_request_entry list -> unit
-> put_events_request

val make_partner_event_source : ?name:string -> ?arn:string -> unit
-> partner_event_source

val make_partner_event_source_account :
  ?state:event_source_state ->
  ?expiration_time:float ->
  ?creation_time:float ->
  ?account:string ->
  unit
-> partner_event_source_account

val make_list_targets_by_rule_response :
  ?next_token:string -> ?targets:target list -> unit
-> list_targets_by_rule_response

val make_list_targets_by_rule_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_bus_name:string ->
  rule:string ->
  unit
-> list_targets_by_rule_request

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_list_rules_response : ?next_token:string -> ?rules:rule list -> unit
-> list_rules_response

val make_list_rules_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_bus_name:string ->
  ?name_prefix:string ->
  unit -> list_rules_request

val make_list_rule_names_by_target_response :
  ?next_token:string -> ?rule_names:string list -> unit
-> list_rule_names_by_target_response

val make_list_rule_names_by_target_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_bus_name:string ->
  target_arn:string ->
  unit -> list_rule_names_by_target_request

val make_list_replays_response :
  ?next_token:string -> ?replays:replay list -> unit
-> list_replays_response

val make_list_replays_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_source_arn:string ->
  ?state:replay_state ->
  ?name_prefix:string ->
  unit -> list_replays_request

val make_list_partner_event_sources_response :
  ?next_token:string ->
  ?partner_event_sources:partner_event_source list ->
  unit
-> list_partner_event_sources_response

val make_list_partner_event_sources_request :
  ?limit:int -> ?next_token:string -> name_prefix:string -> unit
-> list_partner_event_sources_request

val make_list_partner_event_source_accounts_response :
  ?next_token:string ->
  ?partner_event_source_accounts:partner_event_source_account list ->
  unit
-> list_partner_event_source_accounts_response

val make_list_partner_event_source_accounts_request :
  ?limit:int -> ?next_token:string -> event_source_name:string -> unit
-> list_partner_event_source_accounts_request

val make_event_source :
  ?state:event_source_state ->
  ?name:string ->
  ?expiration_time:float ->
  ?creation_time:float ->
  ?created_by:string ->
  ?arn:string ->
  unit -> event_source

val make_list_event_sources_response :
  ?next_token:string -> ?event_sources:event_source list -> unit
-> list_event_sources_response

val make_list_event_sources_request :
  ?limit:int -> ?next_token:string -> ?name_prefix:string -> unit
-> list_event_sources_request

val make_event_bus :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?policy:string ->
  ?description:string ->
  ?arn:string ->
  ?name:string ->
  unit -> event_bus

val make_list_event_buses_response :
  ?next_token:string -> ?event_buses:event_bus list -> unit
-> list_event_buses_response

val make_list_event_buses_request :
  ?limit:int -> ?next_token:string -> ?name_prefix:string -> unit
-> list_event_buses_request

val make_endpoint :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:endpoint_state ->
  ?endpoint_url:string ->
  ?endpoint_id:string ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?description:string ->
  ?name:string ->
  unit -> endpoint

val make_list_endpoints_response :
  ?next_token:string -> ?endpoints:endpoint list -> unit
-> list_endpoints_response

val make_list_endpoints_request :
  ?max_results:int ->
  ?next_token:string ->
  ?home_region:string ->
  ?name_prefix:string ->
  unit -> list_endpoints_request

val make_connection :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?authorization_type:connection_authorization_type ->
  ?state_reason:string ->
  ?connection_state:connection_state ->
  ?name:string ->
  ?connection_arn:string ->
  unit -> connection

val make_list_connections_response :
  ?next_token:string -> ?connections:connection list -> unit
-> list_connections_response

val make_list_connections_request :
  ?limit:int ->
  ?next_token:string ->
  ?connection_state:connection_state ->
  ?name_prefix:string ->
  unit -> list_connections_request

val make_archive :
  ?creation_time:float ->
  ?event_count:int ->
  ?size_bytes:int ->
  ?retention_days:int ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?event_source_arn:string ->
  ?archive_name:string ->
  unit -> archive

val make_list_archives_response :
  ?next_token:string -> ?archives:archive list -> unit
-> list_archives_response

val make_list_archives_request :
  ?limit:int ->
  ?next_token:string ->
  ?state:archive_state ->
  ?event_source_arn:string ->
  ?name_prefix:string ->
  unit -> list_archives_request

val make_api_destination :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?invocation_rate_limit_per_second:int ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:string ->
  ?connection_arn:string ->
  ?api_destination_state:api_destination_state ->
  ?name:string ->
  ?api_destination_arn:string ->
  unit -> api_destination

val make_list_api_destinations_response :
  ?next_token:string -> ?api_destinations:api_destination list -> unit
-> list_api_destinations_response

val make_list_api_destinations_request :
  ?limit:int ->
  ?next_token:string ->
  ?connection_arn:string ->
  ?name_prefix:string ->
  unit -> list_api_destinations_request

val make_enable_rule_request : ?event_bus_name:string -> name:string -> unit
-> enable_rule_request

val make_disable_rule_request : ?event_bus_name:string -> name:string -> unit
-> disable_rule_request

val make_describe_rule_response :
  ?created_by:string ->
  ?event_bus_name:string ->
  ?managed_by:string ->
  ?role_arn:string ->
  ?description:string ->
  ?state:rule_state ->
  ?schedule_expression:string ->
  ?event_pattern:string ->
  ?arn:string ->
  ?name:string ->
  unit -> describe_rule_response

val make_describe_rule_request :
  ?event_bus_name:string -> name:string -> unit
-> describe_rule_request

val make_describe_replay_response :
  ?replay_end_time:float ->
  ?replay_start_time:float ->
  ?event_last_replayed_time:float ->
  ?event_end_time:float ->
  ?event_start_time:float ->
  ?destination:replay_destination ->
  ?event_source_arn:string ->
  ?state_reason:string ->
  ?state:replay_state ->
  ?description:string ->
  ?replay_arn:string ->
  ?replay_name:string ->
  unit -> describe_replay_response

val make_describe_replay_request : replay_name:string -> unit
-> describe_replay_request

val make_describe_partner_event_source_response :
  ?name:string -> ?arn:string -> unit
-> describe_partner_event_source_response

val make_describe_partner_event_source_request : name:string -> unit
-> describe_partner_event_source_request

val make_describe_event_source_response :
  ?state:event_source_state ->
  ?name:string ->
  ?expiration_time:float ->
  ?creation_time:float ->
  ?created_by:string ->
  ?arn:string ->
  unit
-> describe_event_source_response

val make_describe_event_source_request : name:string -> unit
-> describe_event_source_request

val make_describe_event_bus_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?policy:string ->
  ?dead_letter_config:dead_letter_config ->
  ?kms_key_identifier:string ->
  ?description:string ->
  ?arn:string ->
  ?name:string ->
  unit -> describe_event_bus_response

val make_describe_event_bus_request : ?name:string -> unit
-> describe_event_bus_request

val make_describe_endpoint_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:endpoint_state ->
  ?endpoint_url:string ->
  ?endpoint_id:string ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?description:string ->
  ?name:string ->
  unit -> describe_endpoint_response

val make_describe_endpoint_request :
  ?home_region:string -> name:string -> unit
-> describe_endpoint_request

val make_connection_basic_auth_response_parameters : ?username:string -> unit
-> connection_basic_auth_response_parameters

val make_connection_o_auth_client_response_parameters :
  ?client_i_d:string -> unit
-> connection_o_auth_client_response_parameters

val make_connection_o_auth_response_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  ?http_method:connection_o_auth_http_method ->
  ?authorization_endpoint:string ->
  ?client_parameters:connection_o_auth_client_response_parameters ->
  unit
-> connection_o_auth_response_parameters

val make_connection_api_key_auth_response_parameters :
  ?api_key_name:string -> unit
-> connection_api_key_auth_response_parameters

val make_connection_auth_response_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:connection_api_key_auth_response_parameters ->
  ?o_auth_parameters:connection_o_auth_response_parameters ->
  ?basic_auth_parameters:connection_basic_auth_response_parameters ->
  unit
-> connection_auth_response_parameters

val make_describe_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?auth_parameters:connection_auth_response_parameters ->
  ?secret_arn:string ->
  ?authorization_type:connection_authorization_type ->
  ?state_reason:string ->
  ?connection_state:connection_state ->
  ?description:string ->
  ?name:string ->
  ?connection_arn:string ->
  unit -> describe_connection_response

val make_describe_connection_request : name:string -> unit
-> describe_connection_request

val make_describe_archive_response :
  ?creation_time:float ->
  ?event_count:int ->
  ?size_bytes:int ->
  ?retention_days:int ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?event_pattern:string ->
  ?description:string ->
  ?event_source_arn:string ->
  ?archive_name:string ->
  ?archive_arn:string ->
  unit -> describe_archive_response

val make_describe_archive_request : archive_name:string -> unit
-> describe_archive_request

val make_describe_api_destination_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?invocation_rate_limit_per_second:int ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:string ->
  ?connection_arn:string ->
  ?api_destination_state:api_destination_state ->
  ?description:string ->
  ?name:string ->
  ?api_destination_arn:string ->
  unit
-> describe_api_destination_response

val make_describe_api_destination_request : name:string -> unit
-> describe_api_destination_request

val make_delete_rule_request :
  ?force:bool -> ?event_bus_name:string -> name:string -> unit
-> delete_rule_request

val make_delete_partner_event_source_request :
  account:string -> name:string -> unit
-> delete_partner_event_source_request

val make_delete_event_bus_request : name:string -> unit
-> delete_event_bus_request

val make_delete_endpoint_response : unit
-> delete_endpoint_response

val make_delete_endpoint_request : name:string -> unit
-> delete_endpoint_request

val make_delete_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit -> delete_connection_response

val make_delete_connection_request : name:string -> unit
-> delete_connection_request

val make_delete_archive_response : unit
-> delete_archive_response

val make_delete_archive_request : archive_name:string -> unit
-> delete_archive_request

val make_delete_api_destination_response : unit
-> delete_api_destination_response

val make_delete_api_destination_request : name:string -> unit
-> delete_api_destination_request

val make_deauthorize_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> deauthorize_connection_response

val make_deauthorize_connection_request : name:string -> unit
-> deauthorize_connection_request

val make_deactivate_event_source_request : name:string -> unit
-> deactivate_event_source_request

val make_create_partner_event_source_response :
  ?event_source_arn:string -> unit
-> create_partner_event_source_response

val make_create_partner_event_source_request :
  account:string -> name:string -> unit
-> create_partner_event_source_request

val make_create_event_bus_response :
  ?dead_letter_config:dead_letter_config ->
  ?kms_key_identifier:string ->
  ?description:string ->
  ?event_bus_arn:string ->
  unit -> create_event_bus_response

val make_create_event_bus_request :
  ?tags:tag list ->
  ?dead_letter_config:dead_letter_config ->
  ?kms_key_identifier:string ->
  ?description:string ->
  ?event_source_name:string ->
  name:string ->
  unit -> create_event_bus_request

val make_create_endpoint_response :
  ?state:endpoint_state ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?name:string ->
  unit -> create_endpoint_response

val make_create_endpoint_request :
  ?role_arn:string ->
  ?replication_config:replication_config ->
  ?description:string ->
  event_buses:endpoint_event_bus list ->
  routing_config:routing_config ->
  name:string ->
  unit -> create_endpoint_request

val make_create_connection_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> create_connection_response

val make_create_connection_basic_auth_request_parameters :
  password:string -> username:string -> unit
-> create_connection_basic_auth_request_parameters

val make_create_connection_o_auth_client_request_parameters :
  client_secret:string -> client_i_d:string -> unit
-> create_connection_o_auth_client_request_parameters

val make_create_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  http_method:connection_o_auth_http_method ->
  authorization_endpoint:string ->
  client_parameters:create_connection_o_auth_client_request_parameters ->
  unit
-> create_connection_o_auth_request_parameters

val make_create_connection_api_key_auth_request_parameters :
  api_key_value:string -> api_key_name:string -> unit
-> create_connection_api_key_auth_request_parameters

val make_create_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:create_connection_api_key_auth_request_parameters ->
  ?o_auth_parameters:create_connection_o_auth_request_parameters ->
  ?basic_auth_parameters:create_connection_basic_auth_request_parameters ->
  unit
-> create_connection_auth_request_parameters

val make_create_connection_request :
  ?description:string ->
  auth_parameters:create_connection_auth_request_parameters ->
  authorization_type:connection_authorization_type ->
  name:string ->
  unit -> create_connection_request

val make_create_archive_response :
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?archive_arn:string ->
  unit -> create_archive_response

val make_create_archive_request :
  ?retention_days:int ->
  ?event_pattern:string ->
  ?description:string ->
  event_source_arn:string ->
  archive_name:string ->
  unit -> create_archive_request

val make_create_api_destination_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?api_destination_state:api_destination_state ->
  ?api_destination_arn:string ->
  unit
-> create_api_destination_response

val make_create_api_destination_request :
  ?invocation_rate_limit_per_second:int ->
  ?description:string ->
  http_method:api_destination_http_method ->
  invocation_endpoint:string ->
  connection_arn:string ->
  name:string ->
  unit -> create_api_destination_request

val make_cancel_replay_response :
  ?state_reason:string -> ?state:replay_state -> ?replay_arn:string -> unit
-> cancel_replay_response

val make_cancel_replay_request : replay_name:string -> unit
-> cancel_replay_request

val make_activate_event_source_request : name:string -> unit
-> activate_event_source_request

module UpdateEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_event_bus_request ->
        (update_event_bus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      update_endpoint_request ->
        (update_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_connection_request ->
        (update_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      update_archive_request ->
        (update_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      update_api_destination_request ->
        (update_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TestEventPattern : sig
  val request :
    Smaws_Lib.Context.t ->
      test_event_pattern_request ->
        (test_event_pattern_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module StartReplay : sig
  val request :
    Smaws_Lib.Context.t ->
      start_replay_request ->
        (start_replay_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RemoveTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_targets_request ->
        (remove_targets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RemovePermission : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      put_targets_request ->
        (put_targets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_rule_request ->
        (put_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `PolicyLengthExceededException of policy_length_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutPartnerEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      put_partner_events_request ->
        (put_partner_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
end

module PutEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      put_events_request ->
        (put_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListTargetsByRule : sig
  val request :
    Smaws_Lib.Context.t ->
      list_targets_by_rule_request ->
        (list_targets_by_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rules_request ->
        (list_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListRuleNamesByTarget : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_names_by_target_request ->
        (list_rule_names_by_target_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListReplays : sig
  val request :
    Smaws_Lib.Context.t ->
      list_replays_request ->
        (list_replays_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListPartnerEventSources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_sources_request ->
        (list_partner_event_sources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
end

module ListPartnerEventSourceAccounts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_source_accounts_request ->
        (list_partner_event_source_accounts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListEventSources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_sources_request ->
        (list_event_sources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
end

module ListEventBuses : sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_buses_request ->
        (list_event_buses_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListEndpoints : sig
  val request :
    Smaws_Lib.Context.t ->
      list_endpoints_request ->
        (list_endpoints_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_request ->
        (list_connections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module ListArchives : sig
  val request :
    Smaws_Lib.Context.t ->
      list_archives_request ->
        (list_archives_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListApiDestinations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_api_destinations_request ->
        (list_api_destinations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
end

module EnableRule : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisableRule : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeRule : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_rule_request ->
        (describe_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeReplay : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_replay_request ->
        (describe_replay_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribePartnerEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_partner_event_source_request ->
        (describe_partner_event_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_source_request ->
        (describe_event_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_bus_request ->
        (describe_event_bus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_endpoint_request ->
        (describe_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_connection_request ->
        (describe_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_archive_request ->
        (describe_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_api_destination_request ->
        (describe_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeletePartnerEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_partner_event_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
end

module DeleteEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_event_bus_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            
        ]
      ) result
end

module DeleteEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_endpoint_request ->
        (delete_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_request ->
        (delete_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_archive_request ->
        (delete_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_api_destination_request ->
        (delete_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeauthorizeConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      deauthorize_connection_request ->
        (deauthorize_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeactivateEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      deactivate_event_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidStateException of invalid_state_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreatePartnerEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      create_partner_event_source_request ->
        (create_partner_event_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
end

module CreateEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      create_event_bus_request ->
        (create_event_bus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidStateException of invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      create_endpoint_request ->
        (create_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
end

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_request ->
        (create_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
end

module CreateArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      create_archive_request ->
        (create_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      create_api_destination_request ->
        (create_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CancelReplay : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_replay_request ->
        (cancel_replay_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `IllegalStatusException of illegal_status_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ActivateEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      activate_event_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidStateException of invalid_state_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

