open Smaws_Lib
let service =
  Service.{
    namespace = "cassandra";
    endpointPrefix = "cassandra";
    version = "2022-02-10";
    protocol = AwsJson_1_0
  };
type rs = | SINGLE_REGION
  | MULTI_REGION

type validation_exception = {
  message: string option
}

type update_table_response = {
  resource_arn: string
}

type column_definition = {
  type_: string;
  name: string
}

type throughput_mode = | PAY_PER_REQUEST
  | PROVISIONED

type capacity_specification = {
  write_capacity_units: int option;
  read_capacity_units: int option;
  throughput_mode: throughput_mode
}

type encryption_type = | CUSTOMER_MANAGED_KMS_KEY
  | AWS_OWNED_KMS_KEY

type encryption_specification = {
  kms_key_identifier: string option;
  type_: encryption_type
}

type point_in_time_recovery_status = | ENABLED
  | DISABLED

type point_in_time_recovery = {
  status: point_in_time_recovery_status
}

type time_to_live_status = | ENABLED

type time_to_live = {
  status: time_to_live_status
}

type client_side_timestamps_status = | ENABLED

type client_side_timestamps = {
  status: client_side_timestamps_status
}

type target_tracking_scaling_policy_configuration = {
  target_value: float;
  scale_out_cooldown: int option;
  scale_in_cooldown: int option;
  disable_scale_in: bool option
}

type auto_scaling_policy = {
  target_tracking_scaling_policy_configuration: target_tracking_scaling_policy_configuration option
}

type auto_scaling_settings = {
  scaling_policy: auto_scaling_policy option;
  maximum_units: int option;
  minimum_units: int option;
  auto_scaling_disabled: bool option
}

type auto_scaling_specification = {
  read_capacity_auto_scaling: auto_scaling_settings option;
  write_capacity_auto_scaling: auto_scaling_settings option
}

type replica_specification = {
  read_capacity_auto_scaling: auto_scaling_settings option;
  read_capacity_units: int option;
  region: string
}

type update_table_request = {
  replica_specifications: replica_specification list option;
  auto_scaling_specification: auto_scaling_specification option;
  client_side_timestamps: client_side_timestamps option;
  default_time_to_live: int option;
  ttl: time_to_live option;
  point_in_time_recovery: point_in_time_recovery option;
  encryption_specification: encryption_specification option;
  capacity_specification: capacity_specification option;
  add_columns: column_definition list option;
  table_name: string;
  keyspace_name: string
}

type service_quota_exceeded_exception = {
  message: string option
}

type resource_not_found_exception = {
  resource_arn: string option;
  message: string option
}

type internal_server_exception = {
  message: string option
}

type conflict_exception = {
  message: string option
}

type access_denied_exception = {
  message: string option
}

type untag_resource_response = unit

type tag = {
  value: string;
  key: string
}

type untag_resource_request = {
  tags: tag list;
  resource_arn: string
}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
  resource_arn: string
}

type table_summary = {
  resource_arn: string;
  table_name: string;
  keyspace_name: string
}

type table_status = | ACTIVE
  | CREATING
  | UPDATING
  | DELETING
  | DELETED
  | RESTORING
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS

type static_column = {
  name: string
}

type sort_order = | ASC
  | DESC

type partition_key = {
  name: string
}

type clustering_key = {
  order_by: sort_order;
  name: string
}

type schema_definition = {
  static_columns: static_column list option;
  clustering_keys: clustering_key list option;
  partition_keys: partition_key list;
  all_columns: column_definition list
}

type restore_table_response = {
  restored_table_ar_n: string
}

type restore_table_request = {
  replica_specifications: replica_specification list option;
  auto_scaling_specification: auto_scaling_specification option;
  tags_override: tag list option;
  point_in_time_recovery_override: point_in_time_recovery option;
  encryption_specification_override: encryption_specification option;
  capacity_specification_override: capacity_specification option;
  restore_timestamp: float option;
  target_table_name: string;
  target_keyspace_name: string;
  source_table_name: string;
  source_keyspace_name: string
}

type replication_specification = {
  region_list: string list option;
  replication_strategy: rs
}

type capacity_specification_summary = {
  last_update_to_pay_per_request_timestamp: float option;
  write_capacity_units: int option;
  read_capacity_units: int option;
  throughput_mode: throughput_mode
}

type replica_specification_summary = {
  capacity_specification: capacity_specification_summary option;
  status: table_status option;
  region: string option
}

type replica_auto_scaling_specification = {
  auto_scaling_specification: auto_scaling_specification option;
  region: string option
}

type point_in_time_recovery_summary = {
  earliest_restorable_timestamp: float option;
  status: point_in_time_recovery_status
}

type list_tags_for_resource_response = {
  tags: tag list option;
  next_token: string option
}

type list_tags_for_resource_request = {
  max_results: int option;
  next_token: string option;
  resource_arn: string
}

type list_tables_response = {
  tables: table_summary list option;
  next_token: string option
}

type list_tables_request = {
  keyspace_name: string;
  max_results: int option;
  next_token: string option
}

type keyspace_summary = {
  replication_regions: string list option;
  replication_strategy: rs;
  resource_arn: string;
  keyspace_name: string
}

type list_keyspaces_response = {
  keyspaces: keyspace_summary list;
  next_token: string option
}

type list_keyspaces_request = {
  max_results: int option;
  next_token: string option
}

type get_table_auto_scaling_settings_response = {
  replica_specifications: replica_auto_scaling_specification list option;
  auto_scaling_specification: auto_scaling_specification option;
  resource_arn: string;
  table_name: string;
  keyspace_name: string
}

type get_table_auto_scaling_settings_request = {
  table_name: string;
  keyspace_name: string
}

type comment = {
  message: string
}

type get_table_response = {
  replica_specifications: replica_specification_summary list option;
  client_side_timestamps: client_side_timestamps option;
  comment: comment option;
  default_time_to_live: int option;
  ttl: time_to_live option;
  point_in_time_recovery: point_in_time_recovery_summary option;
  encryption_specification: encryption_specification option;
  capacity_specification: capacity_specification_summary option;
  schema_definition: schema_definition option;
  status: table_status option;
  creation_timestamp: float option;
  resource_arn: string;
  table_name: string;
  keyspace_name: string
}

type get_table_request = {
  table_name: string;
  keyspace_name: string
}

type get_keyspace_response = {
  replication_regions: string list option;
  replication_strategy: rs;
  resource_arn: string;
  keyspace_name: string
}

type get_keyspace_request = {
  keyspace_name: string
}

type delete_table_response = unit

type delete_table_request = {
  table_name: string;
  keyspace_name: string
}

type delete_keyspace_response = unit

type delete_keyspace_request = {
  keyspace_name: string
}

type create_table_response = {
  resource_arn: string
}

type create_table_request = {
  replica_specifications: replica_specification list option;
  auto_scaling_specification: auto_scaling_specification option;
  client_side_timestamps: client_side_timestamps option;
  tags: tag list option;
  default_time_to_live: int option;
  ttl: time_to_live option;
  point_in_time_recovery: point_in_time_recovery option;
  encryption_specification: encryption_specification option;
  capacity_specification: capacity_specification option;
  comment: comment option;
  schema_definition: schema_definition;
  table_name: string;
  keyspace_name: string
}

type create_keyspace_response = {
  resource_arn: string
}

type create_keyspace_request = {
  replication_specification: replication_specification option;
  tags: tag list option;
  keyspace_name: string
}



type base_document = Json.t

