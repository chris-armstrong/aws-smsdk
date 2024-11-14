open Smaws_Lib
let service =
  Service.{
    namespace = "dax";
    endpointPrefix = "dax";
    version = "2017-04-19";
    protocol = AwsJson_1_1
  };
type subnet = {
  subnet_availability_zone: string option;
  subnet_identifier: string option
}

type subnet_group = {
  subnets: subnet list option;
  vpc_id: string option;
  description: string option;
  subnet_group_name: string option
}

type update_subnet_group_response = {
  subnet_group: subnet_group option
}

type update_subnet_group_request = {
  subnet_ids: string list option;
  description: string option;
  subnet_group_name: string
}

type subnet_quota_exceeded_fault = {
  message: string option
}

type subnet_in_use = {
  message: string option
}

type subnet_group_not_found_fault = {
  message: string option
}

type service_linked_role_not_found_fault = {
  message: string option
}

type invalid_subnet = {
  message: string option
}

type parameter_group = {
  description: string option;
  parameter_group_name: string option
}

type update_parameter_group_response = {
  parameter_group: parameter_group option
}

type parameter_name_value = {
  parameter_value: string option;
  parameter_name: string option
}

type update_parameter_group_request = {
  parameter_name_values: parameter_name_value list;
  parameter_group_name: string
}

type parameter_group_not_found_fault = {
  message: string option
}

type invalid_parameter_value_exception = {
  message: string option
}

type invalid_parameter_group_state_fault = {
  message: string option
}

type invalid_parameter_combination_exception = {
  message: string option
}

type endpoint = {
  ur_l: string option;
  port: int option;
  address: string option
}

type node = {
  parameter_group_status: string option;
  node_status: string option;
  availability_zone: string option;
  node_create_time: float option;
  endpoint: endpoint option;
  node_id: string option
}

type notification_configuration = {
  topic_status: string option;
  topic_arn: string option
}

type security_group_membership = {
  status: string option;
  security_group_identifier: string option
}

type parameter_group_status = {
  node_ids_to_reboot: string list option;
  parameter_apply_status: string option;
  parameter_group_name: string option
}

type sse_status = | DISABLED
  | DISABLING
  | ENABLED
  | ENABLING

type sse_description = {
  status: sse_status option
}

type cluster_endpoint_encryption_type = | TLS
  | NONE

type cluster = {
  cluster_endpoint_encryption_type: cluster_endpoint_encryption_type option;
  sse_description: sse_description option;
  parameter_group: parameter_group_status option;
  iam_role_arn: string option;
  security_groups: security_group_membership list option;
  subnet_group: string option;
  notification_configuration: notification_configuration option;
  preferred_maintenance_window: string option;
  nodes: node list option;
  node_ids_to_remove: string list option;
  cluster_discovery_endpoint: endpoint option;
  status: string option;
  node_type: string option;
  active_nodes: int option;
  total_nodes: int option;
  cluster_arn: string option;
  description: string option;
  cluster_name: string option
}

type update_cluster_response = {
  cluster: cluster option
}

type update_cluster_request = {
  security_group_ids: string list option;
  parameter_group_name: string option;
  notification_topic_status: string option;
  notification_topic_arn: string option;
  preferred_maintenance_window: string option;
  description: string option;
  cluster_name: string
}

type invalid_cluster_state_fault = {
  message: string option
}

type cluster_not_found_fault = {
  message: string option
}

type tag = {
  value: string option;
  key: string option
}

type untag_resource_response = {
  tags: tag list option
}

type untag_resource_request = {
  tag_keys: string list;
  resource_name: string
}

type tag_not_found_fault = {
  message: string option
}

type invalid_arn_fault = {
  message: string option
}

type tag_resource_response = {
  tags: tag list option
}

type tag_resource_request = {
  tags: tag list;
  resource_name: string
}

type tag_quota_per_resource_exceeded = {
  message: string option
}

type subnet_group_quota_exceeded_fault = {
  message: string option
}

type subnet_group_in_use_fault = {
  message: string option
}

type subnet_group_already_exists_fault = {
  message: string option
}

type source_type = | SUBNET_GROUP
  | PARAMETER_GROUP
  | CLUSTER

type service_quota_exceeded_exception = unit

type sse_specification = {
  enabled: bool
}

type reboot_node_response = {
  cluster: cluster option
}

type reboot_node_request = {
  node_id: string;
  cluster_name: string
}

type node_not_found_fault = {
  message: string option
}

type parameter_type = | NODE_TYPE_SPECIFIC
  | DEFAULT

type node_type_specific_value = {
  value: string option;
  node_type: string option
}

type is_modifiable = | CONDITIONAL
  | FALSE
  | TRUE

type change_type = | REQUIRES_REBOOT
  | IMMEDIATE

type parameter = {
  change_type: change_type option;
  is_modifiable: is_modifiable option;
  allowed_values: string option;
  data_type: string option;
  source: string option;
  description: string option;
  node_type_specific_values: node_type_specific_value list option;
  parameter_value: string option;
  parameter_type: parameter_type option;
  parameter_name: string option
}

type parameter_group_quota_exceeded_fault = {
  message: string option
}

type parameter_group_already_exists_fault = {
  message: string option
}

type node_quota_for_customer_exceeded_fault = {
  message: string option
}

type node_quota_for_cluster_exceeded_fault = {
  message: string option
}

type list_tags_response = {
  next_token: string option;
  tags: tag list option
}

type list_tags_request = {
  next_token: string option;
  resource_name: string
}

type invalid_vpc_network_state_fault = {
  message: string option
}

type insufficient_cluster_capacity_fault = {
  message: string option
}

type increase_replication_factor_response = {
  cluster: cluster option
}

type increase_replication_factor_request = {
  availability_zones: string list option;
  new_replication_factor: int;
  cluster_name: string
}

type event = {
  date: float option;
  message: string option;
  source_type: source_type option;
  source_name: string option
}

type describe_subnet_groups_response = {
  subnet_groups: subnet_group list option;
  next_token: string option
}

type describe_subnet_groups_request = {
  next_token: string option;
  max_results: int option;
  subnet_group_names: string list option
}

type describe_parameters_response = {
  parameters: parameter list option;
  next_token: string option
}

type describe_parameters_request = {
  next_token: string option;
  max_results: int option;
  source: string option;
  parameter_group_name: string
}

type describe_parameter_groups_response = {
  parameter_groups: parameter_group list option;
  next_token: string option
}

type describe_parameter_groups_request = {
  next_token: string option;
  max_results: int option;
  parameter_group_names: string list option
}

type describe_events_response = {
  events: event list option;
  next_token: string option
}

type describe_events_request = {
  next_token: string option;
  max_results: int option;
  duration: int option;
  end_time: float option;
  start_time: float option;
  source_type: source_type option;
  source_name: string option
}

type describe_default_parameters_response = {
  parameters: parameter list option;
  next_token: string option
}

type describe_default_parameters_request = {
  next_token: string option;
  max_results: int option
}

type describe_clusters_response = {
  clusters: cluster list option;
  next_token: string option
}

type describe_clusters_request = {
  next_token: string option;
  max_results: int option;
  cluster_names: string list option
}

type delete_subnet_group_response = {
  deletion_message: string option
}

type delete_subnet_group_request = {
  subnet_group_name: string
}

type delete_parameter_group_response = {
  deletion_message: string option
}

type delete_parameter_group_request = {
  parameter_group_name: string
}

type delete_cluster_response = {
  cluster: cluster option
}

type delete_cluster_request = {
  cluster_name: string
}

type decrease_replication_factor_response = {
  cluster: cluster option
}

type decrease_replication_factor_request = {
  node_ids_to_remove: string list option;
  availability_zones: string list option;
  new_replication_factor: int;
  cluster_name: string
}

type create_subnet_group_response = {
  subnet_group: subnet_group option
}

type create_subnet_group_request = {
  subnet_ids: string list;
  description: string option;
  subnet_group_name: string
}

type create_parameter_group_response = {
  parameter_group: parameter_group option
}

type create_parameter_group_request = {
  description: string option;
  parameter_group_name: string
}

type create_cluster_response = {
  cluster: cluster option
}

type create_cluster_request = {
  cluster_endpoint_encryption_type: cluster_endpoint_encryption_type option;
  sse_specification: sse_specification option;
  tags: tag list option;
  parameter_group_name: string option;
  iam_role_arn: string;
  notification_topic_arn: string option;
  preferred_maintenance_window: string option;
  security_group_ids: string list option;
  subnet_group_name: string option;
  availability_zones: string list option;
  replication_factor: int;
  description: string option;
  node_type: string;
  cluster_name: string
}

type cluster_quota_for_customer_exceeded_fault = {
  message: string option
}

type cluster_already_exists_fault = {
  message: string option
}



type base_document = Json.t

