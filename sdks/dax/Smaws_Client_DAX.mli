open Smaws_Lib
val service : Service.descriptor

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

val make_subnet :
  ?subnet_availability_zone:string -> ?subnet_identifier:string -> unit
-> subnet

val make_subnet_group :
  ?subnets:subnet list ->
  ?vpc_id:string ->
  ?description:string ->
  ?subnet_group_name:string ->
  unit -> subnet_group

val make_update_subnet_group_response : ?subnet_group:subnet_group -> unit
-> update_subnet_group_response

val make_update_subnet_group_request :
  ?subnet_ids:string list ->
  ?description:string ->
  subnet_group_name:string ->
  unit -> update_subnet_group_request

val make_parameter_group :
  ?description:string -> ?parameter_group_name:string -> unit
-> parameter_group

val make_update_parameter_group_response :
  ?parameter_group:parameter_group -> unit
-> update_parameter_group_response

val make_parameter_name_value :
  ?parameter_value:string -> ?parameter_name:string -> unit
-> parameter_name_value

val make_update_parameter_group_request :
  parameter_name_values:parameter_name_value list ->
  parameter_group_name:string ->
  unit -> update_parameter_group_request

val make_endpoint : ?ur_l:string -> ?port:int -> ?address:string -> unit
-> endpoint

val make_node :
  ?parameter_group_status:string ->
  ?node_status:string ->
  ?availability_zone:string ->
  ?node_create_time:float ->
  ?endpoint:endpoint ->
  ?node_id:string ->
  unit -> node

val make_notification_configuration :
  ?topic_status:string -> ?topic_arn:string -> unit
-> notification_configuration

val make_security_group_membership :
  ?status:string -> ?security_group_identifier:string -> unit
-> security_group_membership

val make_parameter_group_status :
  ?node_ids_to_reboot:string list ->
  ?parameter_apply_status:string ->
  ?parameter_group_name:string ->
  unit -> parameter_group_status

val make_sse_description : ?status:sse_status -> unit
-> sse_description

val make_cluster :
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?sse_description:sse_description ->
  ?parameter_group:parameter_group_status ->
  ?iam_role_arn:string ->
  ?security_groups:security_group_membership list ->
  ?subnet_group:string ->
  ?notification_configuration:notification_configuration ->
  ?preferred_maintenance_window:string ->
  ?nodes:node list ->
  ?node_ids_to_remove:string list ->
  ?cluster_discovery_endpoint:endpoint ->
  ?status:string ->
  ?node_type:string ->
  ?active_nodes:int ->
  ?total_nodes:int ->
  ?cluster_arn:string ->
  ?description:string ->
  ?cluster_name:string ->
  unit -> cluster

val make_update_cluster_response : ?cluster:cluster -> unit
-> update_cluster_response

val make_update_cluster_request :
  ?security_group_ids:string list ->
  ?parameter_group_name:string ->
  ?notification_topic_status:string ->
  ?notification_topic_arn:string ->
  ?preferred_maintenance_window:string ->
  ?description:string ->
  cluster_name:string ->
  unit -> update_cluster_request

val make_tag : ?value:string -> ?key:string -> unit
-> tag

val make_untag_resource_response : ?tags:tag list -> unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_name:string -> unit
-> untag_resource_request

val make_tag_resource_response : ?tags:tag list -> unit
-> tag_resource_response

val make_tag_resource_request : tags:tag list -> resource_name:string -> unit
-> tag_resource_request

val make_sse_specification : enabled:bool -> unit
-> sse_specification

val make_reboot_node_response : ?cluster:cluster -> unit
-> reboot_node_response

val make_reboot_node_request : node_id:string -> cluster_name:string -> unit
-> reboot_node_request

val make_node_type_specific_value :
  ?value:string -> ?node_type:string -> unit
-> node_type_specific_value

val make_parameter :
  ?change_type:change_type ->
  ?is_modifiable:is_modifiable ->
  ?allowed_values:string ->
  ?data_type:string ->
  ?source:string ->
  ?description:string ->
  ?node_type_specific_values:node_type_specific_value list ->
  ?parameter_value:string ->
  ?parameter_type:parameter_type ->
  ?parameter_name:string ->
  unit -> parameter

val make_list_tags_response : ?next_token:string -> ?tags:tag list -> unit
-> list_tags_response

val make_list_tags_request :
  ?next_token:string -> resource_name:string -> unit
-> list_tags_request

val make_increase_replication_factor_response : ?cluster:cluster -> unit
-> increase_replication_factor_response

val make_increase_replication_factor_request :
  ?availability_zones:string list ->
  new_replication_factor:int ->
  cluster_name:string ->
  unit -> increase_replication_factor_request

val make_event :
  ?date:float ->
  ?message:string ->
  ?source_type:source_type ->
  ?source_name:string ->
  unit -> event

val make_describe_subnet_groups_response :
  ?subnet_groups:subnet_group list -> ?next_token:string -> unit
-> describe_subnet_groups_response

val make_describe_subnet_groups_request :
  ?next_token:string ->
  ?max_results:int ->
  ?subnet_group_names:string list ->
  unit
-> describe_subnet_groups_request

val make_describe_parameters_response :
  ?parameters:parameter list -> ?next_token:string -> unit
-> describe_parameters_response

val make_describe_parameters_request :
  ?next_token:string ->
  ?max_results:int ->
  ?source:string ->
  parameter_group_name:string ->
  unit
-> describe_parameters_request

val make_describe_parameter_groups_response :
  ?parameter_groups:parameter_group list -> ?next_token:string -> unit
-> describe_parameter_groups_response

val make_describe_parameter_groups_request :
  ?next_token:string ->
  ?max_results:int ->
  ?parameter_group_names:string list ->
  unit
-> describe_parameter_groups_request

val make_describe_events_response :
  ?events:event list -> ?next_token:string -> unit
-> describe_events_response

val make_describe_events_request :
  ?next_token:string ->
  ?max_results:int ->
  ?duration:int ->
  ?end_time:float ->
  ?start_time:float ->
  ?source_type:source_type ->
  ?source_name:string ->
  unit
-> describe_events_request

val make_describe_default_parameters_response :
  ?parameters:parameter list -> ?next_token:string -> unit
-> describe_default_parameters_response

val make_describe_default_parameters_request :
  ?next_token:string -> ?max_results:int -> unit
-> describe_default_parameters_request

val make_describe_clusters_response :
  ?clusters:cluster list -> ?next_token:string -> unit
-> describe_clusters_response

val make_describe_clusters_request :
  ?next_token:string ->
  ?max_results:int ->
  ?cluster_names:string list ->
  unit -> describe_clusters_request

val make_delete_subnet_group_response : ?deletion_message:string -> unit
-> delete_subnet_group_response

val make_delete_subnet_group_request : subnet_group_name:string -> unit
-> delete_subnet_group_request

val make_delete_parameter_group_response : ?deletion_message:string -> unit
-> delete_parameter_group_response

val make_delete_parameter_group_request : parameter_group_name:string -> unit
-> delete_parameter_group_request

val make_delete_cluster_response : ?cluster:cluster -> unit
-> delete_cluster_response

val make_delete_cluster_request : cluster_name:string -> unit
-> delete_cluster_request

val make_decrease_replication_factor_response : ?cluster:cluster -> unit
-> decrease_replication_factor_response

val make_decrease_replication_factor_request :
  ?node_ids_to_remove:string list ->
  ?availability_zones:string list ->
  new_replication_factor:int ->
  cluster_name:string ->
  unit
-> decrease_replication_factor_request

val make_create_subnet_group_response : ?subnet_group:subnet_group -> unit
-> create_subnet_group_response

val make_create_subnet_group_request :
  ?description:string ->
  subnet_ids:string list ->
  subnet_group_name:string ->
  unit
-> create_subnet_group_request

val make_create_parameter_group_response :
  ?parameter_group:parameter_group -> unit
-> create_parameter_group_response

val make_create_parameter_group_request :
  ?description:string -> parameter_group_name:string -> unit
-> create_parameter_group_request

val make_create_cluster_response : ?cluster:cluster -> unit
-> create_cluster_response

val make_create_cluster_request :
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?sse_specification:sse_specification ->
  ?tags:tag list ->
  ?parameter_group_name:string ->
  ?notification_topic_arn:string ->
  ?preferred_maintenance_window:string ->
  ?security_group_ids:string list ->
  ?subnet_group_name:string ->
  ?availability_zones:string list ->
  ?description:string ->
  iam_role_arn:string ->
  replication_factor:int ->
  node_type:string ->
  cluster_name:string ->
  unit -> create_cluster_request

module UpdateSubnetGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_subnet_group_request ->
        (update_subnet_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidSubnet of invalid_subnet
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
            | `SubnetInUse of subnet_in_use
            | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault
            
        ]
      ) result
end

module UpdateParameterGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_parameter_group_request ->
        (update_parameter_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module UpdateCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      update_cluster_request ->
        (update_cluster_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterNotFoundFault of cluster_not_found_fault
            | `InvalidClusterStateFault of invalid_cluster_state_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterNotFoundFault of cluster_not_found_fault
            | `InvalidARNFault of invalid_arn_fault
            | `InvalidClusterStateFault of invalid_cluster_state_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            | `TagNotFoundFault of tag_not_found_fault
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterNotFoundFault of cluster_not_found_fault
            | `InvalidARNFault of invalid_arn_fault
            | `InvalidClusterStateFault of invalid_cluster_state_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
            
        ]
      ) result
end

module RebootNode : sig
  val request :
    Smaws_Lib.Context.t ->
      reboot_node_request ->
        (reboot_node_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterNotFoundFault of cluster_not_found_fault
            | `InvalidClusterStateFault of invalid_cluster_state_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NodeNotFoundFault of node_not_found_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module ListTags : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_request ->
        (list_tags_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterNotFoundFault of cluster_not_found_fault
            | `InvalidARNFault of invalid_arn_fault
            | `InvalidClusterStateFault of invalid_cluster_state_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module IncreaseReplicationFactor : sig
  val request :
    Smaws_Lib.Context.t ->
      increase_replication_factor_request ->
        (increase_replication_factor_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterNotFoundFault of cluster_not_found_fault
            | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
            | `InvalidClusterStateFault of invalid_cluster_state_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
            | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
            | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module DescribeSubnetGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_subnet_groups_request ->
        (describe_subnet_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
            
        ]
      ) result
end

module DescribeParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_parameters_request ->
        (describe_parameters_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module DescribeParameterGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_parameter_groups_request ->
        (describe_parameter_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module DescribeEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_events_request ->
        (describe_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module DescribeDefaultParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_default_parameters_request ->
        (describe_default_parameters_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module DescribeClusters : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_clusters_request ->
        (describe_clusters_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterNotFoundFault of cluster_not_found_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module DeleteSubnetGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_subnet_group_request ->
        (delete_subnet_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            | `SubnetGroupInUseFault of subnet_group_in_use_fault
            | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
            
        ]
      ) result
end

module DeleteParameterGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_parameter_group_request ->
        (delete_parameter_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module DeleteCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_cluster_request ->
        (delete_cluster_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterNotFoundFault of cluster_not_found_fault
            | `InvalidClusterStateFault of invalid_cluster_state_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module DecreaseReplicationFactor : sig
  val request :
    Smaws_Lib.Context.t ->
      decrease_replication_factor_request ->
        (decrease_replication_factor_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterNotFoundFault of cluster_not_found_fault
            | `InvalidClusterStateFault of invalid_cluster_state_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NodeNotFoundFault of node_not_found_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module CreateSubnetGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_subnet_group_request ->
        (create_subnet_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidSubnet of invalid_subnet
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            | `SubnetGroupAlreadyExistsFault of subnet_group_already_exists_fault
            | `SubnetGroupQuotaExceededFault of subnet_group_quota_exceeded_fault
            | `SubnetQuotaExceededFault of subnet_quota_exceeded_fault
            
        ]
      ) result
end

module CreateParameterGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_parameter_group_request ->
        (create_parameter_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `ParameterGroupAlreadyExistsFault of parameter_group_already_exists_fault
            | `ParameterGroupQuotaExceededFault of parameter_group_quota_exceeded_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            
        ]
      ) result
end

module CreateCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      create_cluster_request ->
        (create_cluster_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterAlreadyExistsFault of cluster_already_exists_fault
            | `ClusterQuotaForCustomerExceededFault of cluster_quota_for_customer_exceeded_fault
            | `InsufficientClusterCapacityFault of insufficient_cluster_capacity_fault
            | `InvalidClusterStateFault of invalid_cluster_state_fault
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterGroupStateFault of invalid_parameter_group_state_fault
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `InvalidVPCNetworkStateFault of invalid_vpc_network_state_fault
            | `NodeQuotaForClusterExceededFault of node_quota_for_cluster_exceeded_fault
            | `NodeQuotaForCustomerExceededFault of node_quota_for_customer_exceeded_fault
            | `ParameterGroupNotFoundFault of parameter_group_not_found_fault
            | `ServiceLinkedRoleNotFoundFault of service_linked_role_not_found_fault
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `SubnetGroupNotFoundFault of subnet_group_not_found_fault
            | `TagQuotaPerResourceExceeded of tag_quota_per_resource_exceeded
            
        ]
      ) result
end

