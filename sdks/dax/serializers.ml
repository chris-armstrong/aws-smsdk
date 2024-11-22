open Smaws_Lib.Json.SerializeHelpers

open Types

let string__to_yojson = string_to_yojson

let subnet_to_yojson = 
  fun (x: subnet) -> assoc_to_yojson(
    [(
         "SubnetAvailabilityZone",
         (option_to_yojson string__to_yojson x.subnet_availability_zone));
       (
         "SubnetIdentifier",
         (option_to_yojson string__to_yojson x.subnet_identifier));
       
  ])

let subnet_list_to_yojson = 
  fun tree -> list_to_yojson subnet_to_yojson tree

let subnet_group_to_yojson = 
  fun (x: subnet_group) -> assoc_to_yojson(
    [(
         "Subnets",
         (option_to_yojson subnet_list_to_yojson x.subnets));
       (
         "VpcId",
         (option_to_yojson string__to_yojson x.vpc_id));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "SubnetGroupName",
         (option_to_yojson string__to_yojson x.subnet_group_name));
       
  ])

let update_subnet_group_response_to_yojson = 
  fun (x: update_subnet_group_response) -> assoc_to_yojson(
    [(
         "SubnetGroup",
         (option_to_yojson subnet_group_to_yojson x.subnet_group));
       
  ])

let subnet_identifier_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let update_subnet_group_request_to_yojson = 
  fun (x: update_subnet_group_request) -> assoc_to_yojson(
    [(
         "SubnetIds",
         (option_to_yojson subnet_identifier_list_to_yojson x.subnet_ids));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "SubnetGroupName",
         (Some (string__to_yojson x.subnet_group_name)));
       
  ])

let exception_message_to_yojson = string_to_yojson

let subnet_quota_exceeded_fault_to_yojson = 
  fun (x: subnet_quota_exceeded_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let subnet_in_use_to_yojson = 
  fun (x: subnet_in_use) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let subnet_group_not_found_fault_to_yojson = 
  fun (x: subnet_group_not_found_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let service_linked_role_not_found_fault_to_yojson = 
  fun (x: service_linked_role_not_found_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_subnet_to_yojson = 
  fun (x: invalid_subnet) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let parameter_group_to_yojson = 
  fun (x: parameter_group) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "ParameterGroupName",
         (option_to_yojson string__to_yojson x.parameter_group_name));
       
  ])

let update_parameter_group_response_to_yojson = 
  fun (x: update_parameter_group_response) -> assoc_to_yojson(
    [(
         "ParameterGroup",
         (option_to_yojson parameter_group_to_yojson x.parameter_group));
       
  ])

let parameter_name_value_to_yojson = 
  fun (x: parameter_name_value) -> assoc_to_yojson(
    [(
         "ParameterValue",
         (option_to_yojson string__to_yojson x.parameter_value));
       (
         "ParameterName",
         (option_to_yojson string__to_yojson x.parameter_name));
       
  ])

let parameter_name_value_list_to_yojson = 
  fun tree -> list_to_yojson parameter_name_value_to_yojson tree

let update_parameter_group_request_to_yojson = 
  fun (x: update_parameter_group_request) -> assoc_to_yojson(
    [(
         "ParameterNameValues",
         (Some (parameter_name_value_list_to_yojson x.parameter_name_values)));
       (
         "ParameterGroupName",
         (Some (string__to_yojson x.parameter_group_name)));
       
  ])

let parameter_group_not_found_fault_to_yojson = 
  fun (x: parameter_group_not_found_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let aws_query_error_message_to_yojson = string_to_yojson

let invalid_parameter_value_exception_to_yojson = 
  fun (x: invalid_parameter_value_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson aws_query_error_message_to_yojson x.message));
       
  ])

let invalid_parameter_group_state_fault_to_yojson = 
  fun (x: invalid_parameter_group_state_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_parameter_combination_exception_to_yojson = 
  fun (x: invalid_parameter_combination_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson aws_query_error_message_to_yojson x.message));
       
  ])

let integer_optional_to_yojson = int_to_yojson

let integer__to_yojson = int_to_yojson

let endpoint_to_yojson = 
  fun (x: endpoint) -> assoc_to_yojson(
    [(
         "URL",
         (option_to_yojson string__to_yojson x.ur_l));
       (
         "Port",
         (option_to_yojson integer__to_yojson x.port));
       (
         "Address",
         (option_to_yojson string__to_yojson x.address));
       
  ])

let node_identifier_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let t_stamp_to_yojson = timestamp_to_yojson

let node_to_yojson = 
  fun (x: node) -> assoc_to_yojson(
    [(
         "ParameterGroupStatus",
         (option_to_yojson string__to_yojson x.parameter_group_status));
       (
         "NodeStatus",
         (option_to_yojson string__to_yojson x.node_status));
       (
         "AvailabilityZone",
         (option_to_yojson string__to_yojson x.availability_zone));
       (
         "NodeCreateTime",
         (option_to_yojson t_stamp_to_yojson x.node_create_time));
       (
         "Endpoint",
         (option_to_yojson endpoint_to_yojson x.endpoint));
       (
         "NodeId",
         (option_to_yojson string__to_yojson x.node_id));
       
  ])

let node_list_to_yojson = fun tree -> list_to_yojson node_to_yojson tree

let notification_configuration_to_yojson = 
  fun (x: notification_configuration) -> assoc_to_yojson(
    [(
         "TopicStatus",
         (option_to_yojson string__to_yojson x.topic_status));
       (
         "TopicArn",
         (option_to_yojson string__to_yojson x.topic_arn));
       
  ])

let security_group_membership_to_yojson = 
  fun (x: security_group_membership) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson string__to_yojson x.status));
       (
         "SecurityGroupIdentifier",
         (option_to_yojson string__to_yojson x.security_group_identifier));
       
  ])

let security_group_membership_list_to_yojson = 
  fun tree -> list_to_yojson security_group_membership_to_yojson tree

let parameter_group_status_to_yojson = 
  fun (x: parameter_group_status) -> assoc_to_yojson(
    [(
         "NodeIdsToReboot",
         (option_to_yojson node_identifier_list_to_yojson x.node_ids_to_reboot));
       (
         "ParameterApplyStatus",
         (option_to_yojson string__to_yojson x.parameter_apply_status));
       (
         "ParameterGroupName",
         (option_to_yojson string__to_yojson x.parameter_group_name));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let sse_status_to_yojson = 
  fun (x: sse_status) -> match x with 
 
| DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"
   

let sse_description_to_yojson = 
  fun (x: sse_description) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson sse_status_to_yojson x.status));
       
  ])

let cluster_endpoint_encryption_type_to_yojson = 
  fun (x: cluster_endpoint_encryption_type) -> match x with 
  | TLS -> `String "TLS"
    | NONE -> `String "NONE"
     

let cluster_to_yojson = 
  fun (x: cluster) -> assoc_to_yojson(
    [(
         "ClusterEndpointEncryptionType",
         (option_to_yojson cluster_endpoint_encryption_type_to_yojson x.cluster_endpoint_encryption_type));
       (
         "SSEDescription",
         (option_to_yojson sse_description_to_yojson x.sse_description));
       (
         "ParameterGroup",
         (option_to_yojson parameter_group_status_to_yojson x.parameter_group));
       (
         "IamRoleArn",
         (option_to_yojson string__to_yojson x.iam_role_arn));
       (
         "SecurityGroups",
         (option_to_yojson security_group_membership_list_to_yojson x.security_groups));
       (
         "SubnetGroup",
         (option_to_yojson string__to_yojson x.subnet_group));
       (
         "NotificationConfiguration",
         (option_to_yojson notification_configuration_to_yojson x.notification_configuration));
       (
         "PreferredMaintenanceWindow",
         (option_to_yojson string__to_yojson x.preferred_maintenance_window));
       (
         "Nodes",
         (option_to_yojson node_list_to_yojson x.nodes));
       (
         "NodeIdsToRemove",
         (option_to_yojson node_identifier_list_to_yojson x.node_ids_to_remove));
       (
         "ClusterDiscoveryEndpoint",
         (option_to_yojson endpoint_to_yojson x.cluster_discovery_endpoint));
       (
         "Status",
         (option_to_yojson string__to_yojson x.status));
       (
         "NodeType",
         (option_to_yojson string__to_yojson x.node_type));
       (
         "ActiveNodes",
         (option_to_yojson integer_optional_to_yojson x.active_nodes));
       (
         "TotalNodes",
         (option_to_yojson integer_optional_to_yojson x.total_nodes));
       (
         "ClusterArn",
         (option_to_yojson string__to_yojson x.cluster_arn));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "ClusterName",
         (option_to_yojson string__to_yojson x.cluster_name));
       
  ])

let update_cluster_response_to_yojson = 
  fun (x: update_cluster_response) -> assoc_to_yojson(
    [(
         "Cluster",
         (option_to_yojson cluster_to_yojson x.cluster));
       
  ])

let security_group_identifier_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let update_cluster_request_to_yojson = 
  fun (x: update_cluster_request) -> assoc_to_yojson(
    [(
         "SecurityGroupIds",
         (option_to_yojson security_group_identifier_list_to_yojson x.security_group_ids));
       (
         "ParameterGroupName",
         (option_to_yojson string__to_yojson x.parameter_group_name));
       (
         "NotificationTopicStatus",
         (option_to_yojson string__to_yojson x.notification_topic_status));
       (
         "NotificationTopicArn",
         (option_to_yojson string__to_yojson x.notification_topic_arn));
       (
         "PreferredMaintenanceWindow",
         (option_to_yojson string__to_yojson x.preferred_maintenance_window));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "ClusterName",
         (Some (string__to_yojson x.cluster_name)));
       
  ])

let invalid_cluster_state_fault_to_yojson = 
  fun (x: invalid_cluster_state_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let cluster_not_found_fault_to_yojson = 
  fun (x: cluster_not_found_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson string__to_yojson x.value));
       (
         "Key",
         (option_to_yojson string__to_yojson x.key));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let key_list_to_yojson = fun tree -> list_to_yojson string__to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (key_list_to_yojson x.tag_keys)));
       (
         "ResourceName",
         (Some (string__to_yojson x.resource_name)));
       
  ])

let tag_not_found_fault_to_yojson = 
  fun (x: tag_not_found_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_arn_fault_to_yojson = 
  fun (x: invalid_arn_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceName",
         (Some (string__to_yojson x.resource_name)));
       
  ])

let tag_quota_per_resource_exceeded_to_yojson = 
  fun (x: tag_quota_per_resource_exceeded) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let subnet_group_quota_exceeded_fault_to_yojson = 
  fun (x: subnet_group_quota_exceeded_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let subnet_group_name_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let subnet_group_list_to_yojson = 
  fun tree -> list_to_yojson subnet_group_to_yojson tree

let subnet_group_in_use_fault_to_yojson = 
  fun (x: subnet_group_in_use_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let subnet_group_already_exists_fault_to_yojson = 
  fun (x: subnet_group_already_exists_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let source_type_to_yojson = 
  fun (x: source_type) -> match x with 
 
| SUBNET_GROUP -> `String "SUBNET_GROUP"
  | PARAMETER_GROUP -> `String "PARAMETER_GROUP"
  | CLUSTER -> `String "CLUSTER"
   

let service_quota_exceeded_exception_to_yojson = 
  fun (x: service_quota_exceeded_exception) -> assoc_to_yojson(
    [
  ])

let sse_enabled_to_yojson = bool_to_yojson

let sse_specification_to_yojson = 
  fun (x: sse_specification) -> assoc_to_yojson(
    [(
         "Enabled",
         (Some (sse_enabled_to_yojson x.enabled)));
       
  ])

let reboot_node_response_to_yojson = 
  fun (x: reboot_node_response) -> assoc_to_yojson(
    [(
         "Cluster",
         (option_to_yojson cluster_to_yojson x.cluster));
       
  ])

let reboot_node_request_to_yojson = 
  fun (x: reboot_node_request) -> assoc_to_yojson(
    [(
         "NodeId",
         (Some (string__to_yojson x.node_id)));
       (
         "ClusterName",
         (Some (string__to_yojson x.cluster_name)));
       
  ])

let node_not_found_fault_to_yojson = 
  fun (x: node_not_found_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let parameter_type_to_yojson = 
  fun (x: parameter_type) -> match x with 
 
| NODE_TYPE_SPECIFIC -> `String "NODE_TYPE_SPECIFIC"
  | DEFAULT -> `String "DEFAULT"
   

let node_type_specific_value_to_yojson = 
  fun (x: node_type_specific_value) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson string__to_yojson x.value));
       (
         "NodeType",
         (option_to_yojson string__to_yojson x.node_type));
       
  ])

let node_type_specific_value_list_to_yojson = 
  fun tree -> list_to_yojson node_type_specific_value_to_yojson tree

let is_modifiable_to_yojson = 
  fun (x: is_modifiable) -> match x with 
 
| CONDITIONAL -> `String "CONDITIONAL"
  | FALSE -> `String "FALSE"
  | TRUE -> `String "TRUE"
   

let change_type_to_yojson = 
  fun (x: change_type) -> match x with 
 
| REQUIRES_REBOOT -> `String "REQUIRES_REBOOT"
  | IMMEDIATE -> `String "IMMEDIATE"
   

let parameter_to_yojson = 
  fun (x: parameter) -> assoc_to_yojson(
    [(
         "ChangeType",
         (option_to_yojson change_type_to_yojson x.change_type));
       (
         "IsModifiable",
         (option_to_yojson is_modifiable_to_yojson x.is_modifiable));
       (
         "AllowedValues",
         (option_to_yojson string__to_yojson x.allowed_values));
       (
         "DataType",
         (option_to_yojson string__to_yojson x.data_type));
       (
         "Source",
         (option_to_yojson string__to_yojson x.source));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "NodeTypeSpecificValues",
         (option_to_yojson node_type_specific_value_list_to_yojson x.node_type_specific_values));
       (
         "ParameterValue",
         (option_to_yojson string__to_yojson x.parameter_value));
       (
         "ParameterType",
         (option_to_yojson parameter_type_to_yojson x.parameter_type));
       (
         "ParameterName",
         (option_to_yojson string__to_yojson x.parameter_name));
       
  ])

let parameter_list_to_yojson = 
  fun tree -> list_to_yojson parameter_to_yojson tree

let parameter_group_quota_exceeded_fault_to_yojson = 
  fun (x: parameter_group_quota_exceeded_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let parameter_group_name_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let parameter_group_list_to_yojson = 
  fun tree -> list_to_yojson parameter_group_to_yojson tree

let parameter_group_already_exists_fault_to_yojson = 
  fun (x: parameter_group_already_exists_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let node_quota_for_customer_exceeded_fault_to_yojson = 
  fun (x: node_quota_for_customer_exceeded_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let node_quota_for_cluster_exceeded_fault_to_yojson = 
  fun (x: node_quota_for_cluster_exceeded_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let list_tags_response_to_yojson = 
  fun (x: list_tags_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_request_to_yojson = 
  fun (x: list_tags_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ResourceName",
         (Some (string__to_yojson x.resource_name)));
       
  ])

let invalid_vpc_network_state_fault_to_yojson = 
  fun (x: invalid_vpc_network_state_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let insufficient_cluster_capacity_fault_to_yojson = 
  fun (x: insufficient_cluster_capacity_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let increase_replication_factor_response_to_yojson = 
  fun (x: increase_replication_factor_response) -> assoc_to_yojson(
    [(
         "Cluster",
         (option_to_yojson cluster_to_yojson x.cluster));
       
  ])

let availability_zone_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let increase_replication_factor_request_to_yojson = 
  fun (x: increase_replication_factor_request) -> assoc_to_yojson(
    [(
         "AvailabilityZones",
         (option_to_yojson availability_zone_list_to_yojson x.availability_zones));
       (
         "NewReplicationFactor",
         (Some (integer__to_yojson x.new_replication_factor)));
       (
         "ClusterName",
         (Some (string__to_yojson x.cluster_name)));
       
  ])

let event_to_yojson = 
  fun (x: event) -> assoc_to_yojson(
    [(
         "Date",
         (option_to_yojson t_stamp_to_yojson x.date));
       (
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "SourceType",
         (option_to_yojson source_type_to_yojson x.source_type));
       (
         "SourceName",
         (option_to_yojson string__to_yojson x.source_name));
       
  ])

let event_list_to_yojson = fun tree -> list_to_yojson event_to_yojson tree

let describe_subnet_groups_response_to_yojson = 
  fun (x: describe_subnet_groups_response) -> assoc_to_yojson(
    [(
         "SubnetGroups",
         (option_to_yojson subnet_group_list_to_yojson x.subnet_groups));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let describe_subnet_groups_request_to_yojson = 
  fun (x: describe_subnet_groups_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson integer_optional_to_yojson x.max_results));
       (
         "SubnetGroupNames",
         (option_to_yojson subnet_group_name_list_to_yojson x.subnet_group_names));
       
  ])

let describe_parameters_response_to_yojson = 
  fun (x: describe_parameters_response) -> assoc_to_yojson(
    [(
         "Parameters",
         (option_to_yojson parameter_list_to_yojson x.parameters));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let describe_parameters_request_to_yojson = 
  fun (x: describe_parameters_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson integer_optional_to_yojson x.max_results));
       (
         "Source",
         (option_to_yojson string__to_yojson x.source));
       (
         "ParameterGroupName",
         (Some (string__to_yojson x.parameter_group_name)));
       
  ])

let describe_parameter_groups_response_to_yojson = 
  fun (x: describe_parameter_groups_response) -> assoc_to_yojson(
    [(
         "ParameterGroups",
         (option_to_yojson parameter_group_list_to_yojson x.parameter_groups));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let describe_parameter_groups_request_to_yojson = 
  fun (x: describe_parameter_groups_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson integer_optional_to_yojson x.max_results));
       (
         "ParameterGroupNames",
         (option_to_yojson parameter_group_name_list_to_yojson x.parameter_group_names));
       
  ])

let describe_events_response_to_yojson = 
  fun (x: describe_events_response) -> assoc_to_yojson(
    [(
         "Events",
         (option_to_yojson event_list_to_yojson x.events));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let describe_events_request_to_yojson = 
  fun (x: describe_events_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson integer_optional_to_yojson x.max_results));
       (
         "Duration",
         (option_to_yojson integer_optional_to_yojson x.duration));
       (
         "EndTime",
         (option_to_yojson t_stamp_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson t_stamp_to_yojson x.start_time));
       (
         "SourceType",
         (option_to_yojson source_type_to_yojson x.source_type));
       (
         "SourceName",
         (option_to_yojson string__to_yojson x.source_name));
       
  ])

let describe_default_parameters_response_to_yojson = 
  fun (x: describe_default_parameters_response) -> assoc_to_yojson(
    [(
         "Parameters",
         (option_to_yojson parameter_list_to_yojson x.parameters));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let describe_default_parameters_request_to_yojson = 
  fun (x: describe_default_parameters_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson integer_optional_to_yojson x.max_results));
       
  ])

let cluster_list_to_yojson = 
  fun tree -> list_to_yojson cluster_to_yojson tree

let describe_clusters_response_to_yojson = 
  fun (x: describe_clusters_response) -> assoc_to_yojson(
    [(
         "Clusters",
         (option_to_yojson cluster_list_to_yojson x.clusters));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let cluster_name_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let describe_clusters_request_to_yojson = 
  fun (x: describe_clusters_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson integer_optional_to_yojson x.max_results));
       (
         "ClusterNames",
         (option_to_yojson cluster_name_list_to_yojson x.cluster_names));
       
  ])

let delete_subnet_group_response_to_yojson = 
  fun (x: delete_subnet_group_response) -> assoc_to_yojson(
    [(
         "DeletionMessage",
         (option_to_yojson string__to_yojson x.deletion_message));
       
  ])

let delete_subnet_group_request_to_yojson = 
  fun (x: delete_subnet_group_request) -> assoc_to_yojson(
    [(
         "SubnetGroupName",
         (Some (string__to_yojson x.subnet_group_name)));
       
  ])

let delete_parameter_group_response_to_yojson = 
  fun (x: delete_parameter_group_response) -> assoc_to_yojson(
    [(
         "DeletionMessage",
         (option_to_yojson string__to_yojson x.deletion_message));
       
  ])

let delete_parameter_group_request_to_yojson = 
  fun (x: delete_parameter_group_request) -> assoc_to_yojson(
    [(
         "ParameterGroupName",
         (Some (string__to_yojson x.parameter_group_name)));
       
  ])

let delete_cluster_response_to_yojson = 
  fun (x: delete_cluster_response) -> assoc_to_yojson(
    [(
         "Cluster",
         (option_to_yojson cluster_to_yojson x.cluster));
       
  ])

let delete_cluster_request_to_yojson = 
  fun (x: delete_cluster_request) -> assoc_to_yojson(
    [(
         "ClusterName",
         (Some (string__to_yojson x.cluster_name)));
       
  ])

let decrease_replication_factor_response_to_yojson = 
  fun (x: decrease_replication_factor_response) -> assoc_to_yojson(
    [(
         "Cluster",
         (option_to_yojson cluster_to_yojson x.cluster));
       
  ])

let decrease_replication_factor_request_to_yojson = 
  fun (x: decrease_replication_factor_request) -> assoc_to_yojson(
    [(
         "NodeIdsToRemove",
         (option_to_yojson node_identifier_list_to_yojson x.node_ids_to_remove));
       (
         "AvailabilityZones",
         (option_to_yojson availability_zone_list_to_yojson x.availability_zones));
       (
         "NewReplicationFactor",
         (Some (integer__to_yojson x.new_replication_factor)));
       (
         "ClusterName",
         (Some (string__to_yojson x.cluster_name)));
       
  ])

let create_subnet_group_response_to_yojson = 
  fun (x: create_subnet_group_response) -> assoc_to_yojson(
    [(
         "SubnetGroup",
         (option_to_yojson subnet_group_to_yojson x.subnet_group));
       
  ])

let create_subnet_group_request_to_yojson = 
  fun (x: create_subnet_group_request) -> assoc_to_yojson(
    [(
         "SubnetIds",
         (Some (subnet_identifier_list_to_yojson x.subnet_ids)));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "SubnetGroupName",
         (Some (string__to_yojson x.subnet_group_name)));
       
  ])

let create_parameter_group_response_to_yojson = 
  fun (x: create_parameter_group_response) -> assoc_to_yojson(
    [(
         "ParameterGroup",
         (option_to_yojson parameter_group_to_yojson x.parameter_group));
       
  ])

let create_parameter_group_request_to_yojson = 
  fun (x: create_parameter_group_request) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "ParameterGroupName",
         (Some (string__to_yojson x.parameter_group_name)));
       
  ])

let create_cluster_response_to_yojson = 
  fun (x: create_cluster_response) -> assoc_to_yojson(
    [(
         "Cluster",
         (option_to_yojson cluster_to_yojson x.cluster));
       
  ])

let create_cluster_request_to_yojson = 
  fun (x: create_cluster_request) -> assoc_to_yojson(
    [(
         "ClusterEndpointEncryptionType",
         (option_to_yojson cluster_endpoint_encryption_type_to_yojson x.cluster_endpoint_encryption_type));
       (
         "SSESpecification",
         (option_to_yojson sse_specification_to_yojson x.sse_specification));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ParameterGroupName",
         (option_to_yojson string__to_yojson x.parameter_group_name));
       (
         "IamRoleArn",
         (Some (string__to_yojson x.iam_role_arn)));
       (
         "NotificationTopicArn",
         (option_to_yojson string__to_yojson x.notification_topic_arn));
       (
         "PreferredMaintenanceWindow",
         (option_to_yojson string__to_yojson x.preferred_maintenance_window));
       (
         "SecurityGroupIds",
         (option_to_yojson security_group_identifier_list_to_yojson x.security_group_ids));
       (
         "SubnetGroupName",
         (option_to_yojson string__to_yojson x.subnet_group_name));
       (
         "AvailabilityZones",
         (option_to_yojson availability_zone_list_to_yojson x.availability_zones));
       (
         "ReplicationFactor",
         (Some (integer__to_yojson x.replication_factor)));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "NodeType",
         (Some (string__to_yojson x.node_type)));
       (
         "ClusterName",
         (Some (string__to_yojson x.cluster_name)));
       
  ])

let cluster_quota_for_customer_exceeded_fault_to_yojson = 
  fun (x: cluster_quota_for_customer_exceeded_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let cluster_already_exists_fault_to_yojson = 
  fun (x: cluster_already_exists_fault) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

