open Smaws_Lib.Json.DeserializeHelpers

open Types

let string__of_yojson = string_of_yojson

let subnet_of_yojson = 
  fun tree path : subnet ->
  let _list = assoc_of_yojson tree path in
  let _res : subnet = {
    subnet_availability_zone = option_of_yojson (value_for_key (string__of_yojson) "SubnetAvailabilityZone") _list path;
    subnet_identifier = option_of_yojson (value_for_key (string__of_yojson) "SubnetIdentifier") _list path;
    
  }
  in _res

let subnet_list_of_yojson = 
  fun tree path -> list_of_yojson subnet_of_yojson tree path 

let subnet_group_of_yojson = 
  fun tree path : subnet_group ->
  let _list = assoc_of_yojson tree path in
  let _res : subnet_group = {
    subnets = option_of_yojson (value_for_key (subnet_list_of_yojson) "Subnets") _list path;
    vpc_id = option_of_yojson (value_for_key (string__of_yojson) "VpcId") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    subnet_group_name = option_of_yojson (value_for_key (string__of_yojson) "SubnetGroupName") _list path;
    
  }
  in _res

let update_subnet_group_response_of_yojson = 
  fun tree path : update_subnet_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_subnet_group_response = {
    subnet_group = option_of_yojson (value_for_key (subnet_group_of_yojson) "SubnetGroup") _list path;
    
  }
  in _res

let subnet_identifier_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let update_subnet_group_request_of_yojson = 
  fun tree path : update_subnet_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_subnet_group_request = {
    subnet_ids = option_of_yojson (value_for_key (subnet_identifier_list_of_yojson) "SubnetIds") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    subnet_group_name = value_for_key (string__of_yojson) "SubnetGroupName" _list path;
    
  }
  in _res

let exception_message_of_yojson = string_of_yojson

let subnet_quota_exceeded_fault_of_yojson = 
  fun tree path : subnet_quota_exceeded_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : subnet_quota_exceeded_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let subnet_in_use_of_yojson = 
  fun tree path : subnet_in_use ->
  let _list = assoc_of_yojson tree path in
  let _res : subnet_in_use = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let subnet_group_not_found_fault_of_yojson = 
  fun tree path : subnet_group_not_found_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : subnet_group_not_found_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let service_linked_role_not_found_fault_of_yojson = 
  fun tree path : service_linked_role_not_found_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : service_linked_role_not_found_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_subnet_of_yojson = 
  fun tree path : invalid_subnet ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_subnet = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let parameter_group_of_yojson = 
  fun tree path : parameter_group ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_group = {
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    parameter_group_name = option_of_yojson (value_for_key (string__of_yojson) "ParameterGroupName") _list path;
    
  }
  in _res

let update_parameter_group_response_of_yojson = 
  fun tree path : update_parameter_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_parameter_group_response = {
    parameter_group = option_of_yojson (value_for_key (parameter_group_of_yojson) "ParameterGroup") _list path;
    
  }
  in _res

let parameter_name_value_of_yojson = 
  fun tree path : parameter_name_value ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_name_value = {
    parameter_value = option_of_yojson (value_for_key (string__of_yojson) "ParameterValue") _list path;
    parameter_name = option_of_yojson (value_for_key (string__of_yojson) "ParameterName") _list path;
    
  }
  in _res

let parameter_name_value_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_name_value_of_yojson tree path 

let update_parameter_group_request_of_yojson = 
  fun tree path : update_parameter_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_parameter_group_request = {
    parameter_name_values = value_for_key (parameter_name_value_list_of_yojson) "ParameterNameValues" _list path;
    parameter_group_name = value_for_key (string__of_yojson) "ParameterGroupName" _list path;
    
  }
  in _res

let parameter_group_not_found_fault_of_yojson = 
  fun tree path : parameter_group_not_found_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_group_not_found_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let aws_query_error_message_of_yojson = string_of_yojson

let invalid_parameter_value_exception_of_yojson = 
  fun tree path : invalid_parameter_value_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_value_exception = {
    message = option_of_yojson (value_for_key (aws_query_error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_parameter_group_state_fault_of_yojson = 
  fun tree path : invalid_parameter_group_state_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_group_state_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_parameter_combination_exception_of_yojson = 
  fun tree path : invalid_parameter_combination_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_combination_exception = {
    message = option_of_yojson (value_for_key (aws_query_error_message_of_yojson) "message") _list path;
    
  }
  in _res

let integer_optional_of_yojson = int_of_yojson

let integer__of_yojson = int_of_yojson

let endpoint_of_yojson = 
  fun tree path : endpoint ->
  let _list = assoc_of_yojson tree path in
  let _res : endpoint = {
    ur_l = option_of_yojson (value_for_key (string__of_yojson) "URL") _list path;
    port = option_of_yojson (value_for_key (integer__of_yojson) "Port") _list path;
    address = option_of_yojson (value_for_key (string__of_yojson) "Address") _list path;
    
  }
  in _res

let node_identifier_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let t_stamp_of_yojson = timestamp_of_yojson

let node_of_yojson = 
  fun tree path : node ->
  let _list = assoc_of_yojson tree path in
  let _res : node = {
    parameter_group_status = option_of_yojson (value_for_key (string__of_yojson) "ParameterGroupStatus") _list path;
    node_status = option_of_yojson (value_for_key (string__of_yojson) "NodeStatus") _list path;
    availability_zone = option_of_yojson (value_for_key (string__of_yojson) "AvailabilityZone") _list path;
    node_create_time = option_of_yojson (value_for_key (t_stamp_of_yojson) "NodeCreateTime") _list path;
    endpoint = option_of_yojson (value_for_key (endpoint_of_yojson) "Endpoint") _list path;
    node_id = option_of_yojson (value_for_key (string__of_yojson) "NodeId") _list path;
    
  }
  in _res

let node_list_of_yojson = 
  fun tree path -> list_of_yojson node_of_yojson tree path 

let notification_configuration_of_yojson = 
  fun tree path : notification_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : notification_configuration = {
    topic_status = option_of_yojson (value_for_key (string__of_yojson) "TopicStatus") _list path;
    topic_arn = option_of_yojson (value_for_key (string__of_yojson) "TopicArn") _list path;
    
  }
  in _res

let security_group_membership_of_yojson = 
  fun tree path : security_group_membership ->
  let _list = assoc_of_yojson tree path in
  let _res : security_group_membership = {
    status = option_of_yojson (value_for_key (string__of_yojson) "Status") _list path;
    security_group_identifier = option_of_yojson (value_for_key (string__of_yojson) "SecurityGroupIdentifier") _list path;
    
  }
  in _res

let security_group_membership_list_of_yojson = 
  fun tree path -> list_of_yojson security_group_membership_of_yojson tree path 

let parameter_group_status_of_yojson = 
  fun tree path : parameter_group_status ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_group_status = {
    node_ids_to_reboot = option_of_yojson (value_for_key (node_identifier_list_of_yojson) "NodeIdsToReboot") _list path;
    parameter_apply_status = option_of_yojson (value_for_key (string__of_yojson) "ParameterApplyStatus") _list path;
    parameter_group_name = option_of_yojson (value_for_key (string__of_yojson) "ParameterGroupName") _list path;
    
  }
  in _res

let base_unit_of_yojson = unit_of_yojson

let sse_status_of_yojson = 
  fun (tree: t) path : sse_status -> match tree with 
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SSEStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SSEStatus")

let sse_description_of_yojson = 
  fun tree path : sse_description ->
  let _list = assoc_of_yojson tree path in
  let _res : sse_description = {
    status = option_of_yojson (value_for_key (sse_status_of_yojson) "Status") _list path;
    
  }
  in _res

let cluster_endpoint_encryption_type_of_yojson = 
  fun (tree: t) path : cluster_endpoint_encryption_type -> match tree with 
    | `String "TLS" -> TLS
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterEndpointEncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterEndpointEncryptionType")

let cluster_of_yojson = 
  fun tree path : cluster ->
  let _list = assoc_of_yojson tree path in
  let _res : cluster = {
    cluster_endpoint_encryption_type = option_of_yojson (value_for_key (cluster_endpoint_encryption_type_of_yojson) "ClusterEndpointEncryptionType") _list path;
    sse_description = option_of_yojson (value_for_key (sse_description_of_yojson) "SSEDescription") _list path;
    parameter_group = option_of_yojson (value_for_key (parameter_group_status_of_yojson) "ParameterGroup") _list path;
    iam_role_arn = option_of_yojson (value_for_key (string__of_yojson) "IamRoleArn") _list path;
    security_groups = option_of_yojson (value_for_key (security_group_membership_list_of_yojson) "SecurityGroups") _list path;
    subnet_group = option_of_yojson (value_for_key (string__of_yojson) "SubnetGroup") _list path;
    notification_configuration = option_of_yojson (value_for_key (notification_configuration_of_yojson) "NotificationConfiguration") _list path;
    preferred_maintenance_window = option_of_yojson (value_for_key (string__of_yojson) "PreferredMaintenanceWindow") _list path;
    nodes = option_of_yojson (value_for_key (node_list_of_yojson) "Nodes") _list path;
    node_ids_to_remove = option_of_yojson (value_for_key (node_identifier_list_of_yojson) "NodeIdsToRemove") _list path;
    cluster_discovery_endpoint = option_of_yojson (value_for_key (endpoint_of_yojson) "ClusterDiscoveryEndpoint") _list path;
    status = option_of_yojson (value_for_key (string__of_yojson) "Status") _list path;
    node_type = option_of_yojson (value_for_key (string__of_yojson) "NodeType") _list path;
    active_nodes = option_of_yojson (value_for_key (integer_optional_of_yojson) "ActiveNodes") _list path;
    total_nodes = option_of_yojson (value_for_key (integer_optional_of_yojson) "TotalNodes") _list path;
    cluster_arn = option_of_yojson (value_for_key (string__of_yojson) "ClusterArn") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    cluster_name = option_of_yojson (value_for_key (string__of_yojson) "ClusterName") _list path;
    
  }
  in _res

let update_cluster_response_of_yojson = 
  fun tree path : update_cluster_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_cluster_response = {
    cluster = option_of_yojson (value_for_key (cluster_of_yojson) "Cluster") _list path;
    
  }
  in _res

let security_group_identifier_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let update_cluster_request_of_yojson = 
  fun tree path : update_cluster_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_cluster_request = {
    security_group_ids = option_of_yojson (value_for_key (security_group_identifier_list_of_yojson) "SecurityGroupIds") _list path;
    parameter_group_name = option_of_yojson (value_for_key (string__of_yojson) "ParameterGroupName") _list path;
    notification_topic_status = option_of_yojson (value_for_key (string__of_yojson) "NotificationTopicStatus") _list path;
    notification_topic_arn = option_of_yojson (value_for_key (string__of_yojson) "NotificationTopicArn") _list path;
    preferred_maintenance_window = option_of_yojson (value_for_key (string__of_yojson) "PreferredMaintenanceWindow") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    cluster_name = value_for_key (string__of_yojson) "ClusterName" _list path;
    
  }
  in _res

let invalid_cluster_state_fault_of_yojson = 
  fun tree path : invalid_cluster_state_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_cluster_state_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let cluster_not_found_fault_of_yojson = 
  fun tree path : cluster_not_found_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : cluster_not_found_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = option_of_yojson (value_for_key (string__of_yojson) "Value") _list path;
    key = option_of_yojson (value_for_key (string__of_yojson) "Key") _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let untag_resource_response_of_yojson = 
  fun tree path : untag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_response = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let key_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (key_list_of_yojson) "TagKeys" _list path;
    resource_name = value_for_key (string__of_yojson) "ResourceName" _list path;
    
  }
  in _res

let tag_not_found_fault_of_yojson = 
  fun tree path : tag_not_found_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_not_found_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_arn_fault_of_yojson = 
  fun tree path : invalid_arn_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_arn_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let tag_resource_response_of_yojson = 
  fun tree path : tag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_response = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    resource_name = value_for_key (string__of_yojson) "ResourceName" _list path;
    
  }
  in _res

let tag_quota_per_resource_exceeded_of_yojson = 
  fun tree path : tag_quota_per_resource_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_quota_per_resource_exceeded = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let subnet_group_quota_exceeded_fault_of_yojson = 
  fun tree path : subnet_group_quota_exceeded_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : subnet_group_quota_exceeded_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let subnet_group_name_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let subnet_group_list_of_yojson = 
  fun tree path -> list_of_yojson subnet_group_of_yojson tree path 

let subnet_group_in_use_fault_of_yojson = 
  fun tree path : subnet_group_in_use_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : subnet_group_in_use_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let subnet_group_already_exists_fault_of_yojson = 
  fun tree path : subnet_group_already_exists_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : subnet_group_already_exists_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let source_type_of_yojson = 
  fun (tree: t) path : source_type -> match tree with 
    | `String "SUBNET_GROUP" -> SUBNET_GROUP
    | `String "PARAMETER_GROUP" -> PARAMETER_GROUP
    | `String "CLUSTER" -> CLUSTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceType")

let service_quota_exceeded_exception_of_yojson = 
  fun tree path : service_quota_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : service_quota_exceeded_exception = ()
  in _res

let sse_enabled_of_yojson = bool_of_yojson

let sse_specification_of_yojson = 
  fun tree path : sse_specification ->
  let _list = assoc_of_yojson tree path in
  let _res : sse_specification = {
    enabled = value_for_key (sse_enabled_of_yojson) "Enabled" _list path;
    
  }
  in _res

let reboot_node_response_of_yojson = 
  fun tree path : reboot_node_response ->
  let _list = assoc_of_yojson tree path in
  let _res : reboot_node_response = {
    cluster = option_of_yojson (value_for_key (cluster_of_yojson) "Cluster") _list path;
    
  }
  in _res

let reboot_node_request_of_yojson = 
  fun tree path : reboot_node_request ->
  let _list = assoc_of_yojson tree path in
  let _res : reboot_node_request = {
    node_id = value_for_key (string__of_yojson) "NodeId" _list path;
    cluster_name = value_for_key (string__of_yojson) "ClusterName" _list path;
    
  }
  in _res

let node_not_found_fault_of_yojson = 
  fun tree path : node_not_found_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : node_not_found_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let parameter_type_of_yojson = 
  fun (tree: t) path : parameter_type -> match tree with 
    | `String "NODE_TYPE_SPECIFIC" -> NODE_TYPE_SPECIFIC
    | `String "DEFAULT" -> DEFAULT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParameterType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterType")

let node_type_specific_value_of_yojson = 
  fun tree path : node_type_specific_value ->
  let _list = assoc_of_yojson tree path in
  let _res : node_type_specific_value = {
    value = option_of_yojson (value_for_key (string__of_yojson) "Value") _list path;
    node_type = option_of_yojson (value_for_key (string__of_yojson) "NodeType") _list path;
    
  }
  in _res

let node_type_specific_value_list_of_yojson = 
  fun tree path -> list_of_yojson node_type_specific_value_of_yojson tree path 

let is_modifiable_of_yojson = 
  fun (tree: t) path : is_modifiable -> match tree with 
    | `String "CONDITIONAL" -> CONDITIONAL
    | `String "FALSE" -> FALSE
    | `String "TRUE" -> TRUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "IsModifiable" value)
    | _ -> raise (deserialize_wrong_type_error path "IsModifiable")

let change_type_of_yojson = 
  fun (tree: t) path : change_type -> match tree with 
    | `String "REQUIRES_REBOOT" -> REQUIRES_REBOOT
    | `String "IMMEDIATE" -> IMMEDIATE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChangeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ChangeType")

let parameter_of_yojson = 
  fun tree path : parameter ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter = {
    change_type = option_of_yojson (value_for_key (change_type_of_yojson) "ChangeType") _list path;
    is_modifiable = option_of_yojson (value_for_key (is_modifiable_of_yojson) "IsModifiable") _list path;
    allowed_values = option_of_yojson (value_for_key (string__of_yojson) "AllowedValues") _list path;
    data_type = option_of_yojson (value_for_key (string__of_yojson) "DataType") _list path;
    source = option_of_yojson (value_for_key (string__of_yojson) "Source") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    node_type_specific_values = option_of_yojson (value_for_key (node_type_specific_value_list_of_yojson) "NodeTypeSpecificValues") _list path;
    parameter_value = option_of_yojson (value_for_key (string__of_yojson) "ParameterValue") _list path;
    parameter_type = option_of_yojson (value_for_key (parameter_type_of_yojson) "ParameterType") _list path;
    parameter_name = option_of_yojson (value_for_key (string__of_yojson) "ParameterName") _list path;
    
  }
  in _res

let parameter_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_of_yojson tree path 

let parameter_group_quota_exceeded_fault_of_yojson = 
  fun tree path : parameter_group_quota_exceeded_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_group_quota_exceeded_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let parameter_group_name_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let parameter_group_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_group_of_yojson tree path 

let parameter_group_already_exists_fault_of_yojson = 
  fun tree path : parameter_group_already_exists_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_group_already_exists_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let node_quota_for_customer_exceeded_fault_of_yojson = 
  fun tree path : node_quota_for_customer_exceeded_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : node_quota_for_customer_exceeded_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let node_quota_for_cluster_exceeded_fault_of_yojson = 
  fun tree path : node_quota_for_cluster_exceeded_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : node_quota_for_cluster_exceeded_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let list_tags_response_of_yojson = 
  fun tree path : list_tags_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_tags_request_of_yojson = 
  fun tree path : list_tags_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    resource_name = value_for_key (string__of_yojson) "ResourceName" _list path;
    
  }
  in _res

let invalid_vpc_network_state_fault_of_yojson = 
  fun tree path : invalid_vpc_network_state_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_vpc_network_state_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let insufficient_cluster_capacity_fault_of_yojson = 
  fun tree path : insufficient_cluster_capacity_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : insufficient_cluster_capacity_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let increase_replication_factor_response_of_yojson = 
  fun tree path : increase_replication_factor_response ->
  let _list = assoc_of_yojson tree path in
  let _res : increase_replication_factor_response = {
    cluster = option_of_yojson (value_for_key (cluster_of_yojson) "Cluster") _list path;
    
  }
  in _res

let availability_zone_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let increase_replication_factor_request_of_yojson = 
  fun tree path : increase_replication_factor_request ->
  let _list = assoc_of_yojson tree path in
  let _res : increase_replication_factor_request = {
    availability_zones = option_of_yojson (value_for_key (availability_zone_list_of_yojson) "AvailabilityZones") _list path;
    new_replication_factor = value_for_key (integer__of_yojson) "NewReplicationFactor" _list path;
    cluster_name = value_for_key (string__of_yojson) "ClusterName" _list path;
    
  }
  in _res

let event_of_yojson = 
  fun tree path : event ->
  let _list = assoc_of_yojson tree path in
  let _res : event = {
    date = option_of_yojson (value_for_key (t_stamp_of_yojson) "Date") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    source_type = option_of_yojson (value_for_key (source_type_of_yojson) "SourceType") _list path;
    source_name = option_of_yojson (value_for_key (string__of_yojson) "SourceName") _list path;
    
  }
  in _res

let event_list_of_yojson = 
  fun tree path -> list_of_yojson event_of_yojson tree path 

let describe_subnet_groups_response_of_yojson = 
  fun tree path : describe_subnet_groups_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_subnet_groups_response = {
    subnet_groups = option_of_yojson (value_for_key (subnet_group_list_of_yojson) "SubnetGroups") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let describe_subnet_groups_request_of_yojson = 
  fun tree path : describe_subnet_groups_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_subnet_groups_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (integer_optional_of_yojson) "MaxResults") _list path;
    subnet_group_names = option_of_yojson (value_for_key (subnet_group_name_list_of_yojson) "SubnetGroupNames") _list path;
    
  }
  in _res

let describe_parameters_response_of_yojson = 
  fun tree path : describe_parameters_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_parameters_response = {
    parameters = option_of_yojson (value_for_key (parameter_list_of_yojson) "Parameters") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let describe_parameters_request_of_yojson = 
  fun tree path : describe_parameters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_parameters_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (integer_optional_of_yojson) "MaxResults") _list path;
    source = option_of_yojson (value_for_key (string__of_yojson) "Source") _list path;
    parameter_group_name = value_for_key (string__of_yojson) "ParameterGroupName" _list path;
    
  }
  in _res

let describe_parameter_groups_response_of_yojson = 
  fun tree path : describe_parameter_groups_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_parameter_groups_response = {
    parameter_groups = option_of_yojson (value_for_key (parameter_group_list_of_yojson) "ParameterGroups") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let describe_parameter_groups_request_of_yojson = 
  fun tree path : describe_parameter_groups_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_parameter_groups_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (integer_optional_of_yojson) "MaxResults") _list path;
    parameter_group_names = option_of_yojson (value_for_key (parameter_group_name_list_of_yojson) "ParameterGroupNames") _list path;
    
  }
  in _res

let describe_events_response_of_yojson = 
  fun tree path : describe_events_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_events_response = {
    events = option_of_yojson (value_for_key (event_list_of_yojson) "Events") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let describe_events_request_of_yojson = 
  fun tree path : describe_events_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_events_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (integer_optional_of_yojson) "MaxResults") _list path;
    duration = option_of_yojson (value_for_key (integer_optional_of_yojson) "Duration") _list path;
    end_time = option_of_yojson (value_for_key (t_stamp_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (t_stamp_of_yojson) "StartTime") _list path;
    source_type = option_of_yojson (value_for_key (source_type_of_yojson) "SourceType") _list path;
    source_name = option_of_yojson (value_for_key (string__of_yojson) "SourceName") _list path;
    
  }
  in _res

let describe_default_parameters_response_of_yojson = 
  fun tree path : describe_default_parameters_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_default_parameters_response = {
    parameters = option_of_yojson (value_for_key (parameter_list_of_yojson) "Parameters") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let describe_default_parameters_request_of_yojson = 
  fun tree path : describe_default_parameters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_default_parameters_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (integer_optional_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let cluster_list_of_yojson = 
  fun tree path -> list_of_yojson cluster_of_yojson tree path 

let describe_clusters_response_of_yojson = 
  fun tree path : describe_clusters_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_clusters_response = {
    clusters = option_of_yojson (value_for_key (cluster_list_of_yojson) "Clusters") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let cluster_name_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let describe_clusters_request_of_yojson = 
  fun tree path : describe_clusters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_clusters_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (integer_optional_of_yojson) "MaxResults") _list path;
    cluster_names = option_of_yojson (value_for_key (cluster_name_list_of_yojson) "ClusterNames") _list path;
    
  }
  in _res

let delete_subnet_group_response_of_yojson = 
  fun tree path : delete_subnet_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_subnet_group_response = {
    deletion_message = option_of_yojson (value_for_key (string__of_yojson) "DeletionMessage") _list path;
    
  }
  in _res

let delete_subnet_group_request_of_yojson = 
  fun tree path : delete_subnet_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_subnet_group_request = {
    subnet_group_name = value_for_key (string__of_yojson) "SubnetGroupName" _list path;
    
  }
  in _res

let delete_parameter_group_response_of_yojson = 
  fun tree path : delete_parameter_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_parameter_group_response = {
    deletion_message = option_of_yojson (value_for_key (string__of_yojson) "DeletionMessage") _list path;
    
  }
  in _res

let delete_parameter_group_request_of_yojson = 
  fun tree path : delete_parameter_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_parameter_group_request = {
    parameter_group_name = value_for_key (string__of_yojson) "ParameterGroupName" _list path;
    
  }
  in _res

let delete_cluster_response_of_yojson = 
  fun tree path : delete_cluster_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_cluster_response = {
    cluster = option_of_yojson (value_for_key (cluster_of_yojson) "Cluster") _list path;
    
  }
  in _res

let delete_cluster_request_of_yojson = 
  fun tree path : delete_cluster_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_cluster_request = {
    cluster_name = value_for_key (string__of_yojson) "ClusterName" _list path;
    
  }
  in _res

let decrease_replication_factor_response_of_yojson = 
  fun tree path : decrease_replication_factor_response ->
  let _list = assoc_of_yojson tree path in
  let _res : decrease_replication_factor_response = {
    cluster = option_of_yojson (value_for_key (cluster_of_yojson) "Cluster") _list path;
    
  }
  in _res

let decrease_replication_factor_request_of_yojson = 
  fun tree path : decrease_replication_factor_request ->
  let _list = assoc_of_yojson tree path in
  let _res : decrease_replication_factor_request = {
    node_ids_to_remove = option_of_yojson (value_for_key (node_identifier_list_of_yojson) "NodeIdsToRemove") _list path;
    availability_zones = option_of_yojson (value_for_key (availability_zone_list_of_yojson) "AvailabilityZones") _list path;
    new_replication_factor = value_for_key (integer__of_yojson) "NewReplicationFactor" _list path;
    cluster_name = value_for_key (string__of_yojson) "ClusterName" _list path;
    
  }
  in _res

let create_subnet_group_response_of_yojson = 
  fun tree path : create_subnet_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_subnet_group_response = {
    subnet_group = option_of_yojson (value_for_key (subnet_group_of_yojson) "SubnetGroup") _list path;
    
  }
  in _res

let create_subnet_group_request_of_yojson = 
  fun tree path : create_subnet_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_subnet_group_request = {
    subnet_ids = value_for_key (subnet_identifier_list_of_yojson) "SubnetIds" _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    subnet_group_name = value_for_key (string__of_yojson) "SubnetGroupName" _list path;
    
  }
  in _res

let create_parameter_group_response_of_yojson = 
  fun tree path : create_parameter_group_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_parameter_group_response = {
    parameter_group = option_of_yojson (value_for_key (parameter_group_of_yojson) "ParameterGroup") _list path;
    
  }
  in _res

let create_parameter_group_request_of_yojson = 
  fun tree path : create_parameter_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_parameter_group_request = {
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    parameter_group_name = value_for_key (string__of_yojson) "ParameterGroupName" _list path;
    
  }
  in _res

let create_cluster_response_of_yojson = 
  fun tree path : create_cluster_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_cluster_response = {
    cluster = option_of_yojson (value_for_key (cluster_of_yojson) "Cluster") _list path;
    
  }
  in _res

let create_cluster_request_of_yojson = 
  fun tree path : create_cluster_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_cluster_request = {
    cluster_endpoint_encryption_type = option_of_yojson (value_for_key (cluster_endpoint_encryption_type_of_yojson) "ClusterEndpointEncryptionType") _list path;
    sse_specification = option_of_yojson (value_for_key (sse_specification_of_yojson) "SSESpecification") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    parameter_group_name = option_of_yojson (value_for_key (string__of_yojson) "ParameterGroupName") _list path;
    iam_role_arn = value_for_key (string__of_yojson) "IamRoleArn" _list path;
    notification_topic_arn = option_of_yojson (value_for_key (string__of_yojson) "NotificationTopicArn") _list path;
    preferred_maintenance_window = option_of_yojson (value_for_key (string__of_yojson) "PreferredMaintenanceWindow") _list path;
    security_group_ids = option_of_yojson (value_for_key (security_group_identifier_list_of_yojson) "SecurityGroupIds") _list path;
    subnet_group_name = option_of_yojson (value_for_key (string__of_yojson) "SubnetGroupName") _list path;
    availability_zones = option_of_yojson (value_for_key (availability_zone_list_of_yojson) "AvailabilityZones") _list path;
    replication_factor = value_for_key (integer__of_yojson) "ReplicationFactor" _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    node_type = value_for_key (string__of_yojson) "NodeType" _list path;
    cluster_name = value_for_key (string__of_yojson) "ClusterName" _list path;
    
  }
  in _res

let cluster_quota_for_customer_exceeded_fault_of_yojson = 
  fun tree path : cluster_quota_for_customer_exceeded_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : cluster_quota_for_customer_exceeded_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let cluster_already_exists_fault_of_yojson = 
  fun tree path : cluster_already_exists_fault ->
  let _list = assoc_of_yojson tree path in
  let _res : cluster_already_exists_fault = {
    message = option_of_yojson (value_for_key (exception_message_of_yojson) "message") _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

