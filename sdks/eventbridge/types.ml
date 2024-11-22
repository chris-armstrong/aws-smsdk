open Smaws_Lib
let service =
  Service.{
    namespace = "events";
    endpointPrefix = "events";
    version = "2015-10-07";
    protocol = AwsJson_1_1
  };
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

