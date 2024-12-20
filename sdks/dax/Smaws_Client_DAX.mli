(** 
    DAX client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    Represents the subnet associated with a DAX cluster. This parameter refers to subnets defined in Amazon Virtual Private Cloud (Amazon VPC) and used with DAX.
     *)
type subnet = {
  subnet_availability_zone: string option;
  (** 
    The Availability Zone (AZ) for the subnet.
     *)

  subnet_identifier: string option;
  (** 
    The system-assigned identifier for the subnet.
     *)

}

(** 
    Represents the output of one of the following actions:
    
     {ul
          {- {i CreateSubnetGroup}
             
             }
           {- {i ModifySubnetGroup}
              
              }
          
      }
       *)
type subnet_group = {
  subnets: subnet list option;
  (** 
    A list of subnets associated with the subnet group.
     *)

  vpc_id: string option;
  (** 
    The Amazon Virtual Private Cloud identifier (VPC ID) of the subnet group.
     *)

  description: string option;
  (** 
    The description of the subnet group.
     *)

  subnet_group_name: string option;
  (** 
    The name of the subnet group.
     *)

}

type update_subnet_group_response = {
  subnet_group: subnet_group option;
  (** 
    The subnet group that has been modified.
     *)

}

type update_subnet_group_request = {
  subnet_ids: string list option;
  (** 
    A list of subnet IDs in the subnet group.
     *)

  description: string option;
  (** 
    A description of the subnet group.
     *)

  subnet_group_name: string;
  (** 
    The name of the subnet group.
     *)

}

(** 
    The request cannot be processed because it would exceed the allowed number of subnets in a subnet group.
     *)
type subnet_quota_exceeded_fault = {
  message: string option;
  
}

(** 
    The requested subnet is being used by another subnet group.
     *)
type subnet_in_use = {
  message: string option;
  
}

(** 
    The requested subnet group name does not refer to an existing subnet group.
     *)
type subnet_group_not_found_fault = {
  message: string option;
  
}

(** 
    The specified service linked role (SLR) was not found.
     *)
type service_linked_role_not_found_fault = {
  message: string option;
  
}

(** 
    An invalid subnet identifier was specified.
     *)
type invalid_subnet = {
  message: string option;
  
}

(** 
    A named set of parameters that are applied to all of the nodes in a DAX cluster.
     *)
type parameter_group = {
  description: string option;
  (** 
    A description of the parameter group.
     *)

  parameter_group_name: string option;
  (** 
    The name of the parameter group.
     *)

}

type update_parameter_group_response = {
  parameter_group: parameter_group option;
  (** 
    The parameter group that has been modified.
     *)

}

(** 
    An individual DAX parameter.
     *)
type parameter_name_value = {
  parameter_value: string option;
  (** 
    The value of the parameter.
     *)

  parameter_name: string option;
  (** 
    The name of the parameter.
     *)

}

type update_parameter_group_request = {
  parameter_name_values: parameter_name_value list;
  (** 
    An array of name-value pairs for the parameters in the group. Each element in the array represents a single parameter.
    
     [record-ttl-millis] and [query-ttl-millis] are the only supported parameter names. For more details, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAX.cluster-management.html#DAX.cluster-management.custom-settings.ttl}Configuring TTL Settings}.
     
      *)

  parameter_group_name: string;
  (** 
    The name of the parameter group.
     *)

}

(** 
    The specified parameter group does not exist.
     *)
type parameter_group_not_found_fault = {
  message: string option;
  
}

(** 
    The value for a parameter is invalid.
     *)
type invalid_parameter_value_exception = {
  message: string option;
  
}

(** 
    One or more parameters in a parameter group are in an invalid state.
     *)
type invalid_parameter_group_state_fault = {
  message: string option;
  
}

(** 
    Two or more incompatible parameters were specified.
     *)
type invalid_parameter_combination_exception = {
  message: string option;
  
}

(** 
    Represents the information required for client programs to connect to the endpoint for a DAX cluster.
     *)
type endpoint = {
  ur_l: string option;
  [@ocaml.doc {| 
    The URL that applications should use to connect to the endpoint. The default ports are 8111 for the "dax" protocol and 9111 for the "daxs" protocol.
     |}]

  port: int option;
  (** 
    The port number that applications should use to connect to the endpoint.
     *)

  address: string option;
  (** 
    The DNS hostname of the endpoint.
     *)

}

(** 
    Represents an individual node within a DAX cluster.
     *)
type node = {
  parameter_group_status: string option;
  (** 
    The status of the parameter group associated with this node. For example, [in-sync].
     *)

  node_status: string option;
  (** 
    The current status of the node. For example: [available].
     *)

  availability_zone: string option;
  (** 
    The Availability Zone (AZ) in which the node has been deployed.
     *)

  node_create_time: float option;
  (** 
    The date and time (in UNIX epoch format) when the node was launched.
     *)

  endpoint: endpoint option;
  (** 
    The endpoint for the node, consisting of a DNS name and a port number. Client applications can connect directly to a node endpoint, if desired (as an alternative to allowing DAX client software to intelligently route requests and responses to nodes in the DAX cluster.
     *)

  node_id: string option;
  (** 
    A system-generated identifier for the node.
     *)

}

(** 
    Describes a notification topic and its status. Notification topics are used for publishing DAX events to subscribers using Amazon Simple Notification Service (SNS).
     *)
type notification_configuration = {
  topic_status: string option;
  (** 
    The current state of the topic. A value of “active” means that notifications will be sent to the topic. A value of “inactive” means that notifications will not be sent to the topic.
     *)

  topic_arn: string option;
  (** 
    The Amazon Resource Name (ARN) that identifies the topic.
     *)

}

(** 
    An individual VPC security group and its status.
     *)
type security_group_membership = {
  status: string option;
  (** 
    The status of this security group.
     *)

  security_group_identifier: string option;
  (** 
    The unique ID for this security group.
     *)

}

(** 
    The status of a parameter group.
     *)
type parameter_group_status = {
  node_ids_to_reboot: string list option;
  (** 
    The node IDs of one or more nodes to be rebooted.
     *)

  parameter_apply_status: string option;
  (** 
    The status of parameter updates.
     *)

  parameter_group_name: string option;
  (** 
    The name of the parameter group.
     *)

}

type sse_status = | DISABLED
  | DISABLING
  | ENABLED
  | ENABLING

(** 
    The description of the server-side encryption status on the specified DAX cluster.
     *)
type sse_description = {
  status: sse_status option;
  (** 
    The current state of server-side encryption:
    
     {ul
          {- [ENABLING] - Server-side encryption is being enabled.
             
             }
           {- [ENABLED] - Server-side encryption is enabled.
              
              }
           {- [DISABLING] - Server-side encryption is being disabled.
              
              }
           {- [DISABLED] - Server-side encryption is disabled.
              
              }
          
      }
       *)

}

type cluster_endpoint_encryption_type = | TLS
  | NONE

(** 
    Contains all of the attributes of a specific DAX cluster.
     *)
type cluster = {
  cluster_endpoint_encryption_type: cluster_endpoint_encryption_type option;
  (** 
    The type of encryption supported by the cluster's endpoint. Values are:
    
     {ul
          {- [NONE] for no encryption
             
              [TLS] for Transport Layer Security
              
              }
          
      }
       *)

  sse_description: sse_description option;
  (** 
    The description of the server-side encryption status on the specified DAX cluster.
     *)

  parameter_group: parameter_group_status option;
  (** 
    The parameter group being used by nodes in the cluster.
     *)

  iam_role_arn: string option;
  (** 
    A valid Amazon Resource Name (ARN) that identifies an IAM role. At runtime, DAX will assume this role and use the role's permissions to access DynamoDB on your behalf.
     *)

  security_groups: security_group_membership list option;
  (** 
    A list of security groups, and the status of each, for the nodes in the cluster.
     *)

  subnet_group: string option;
  (** 
    The subnet group where the DAX cluster is running.
     *)

  notification_configuration: notification_configuration option;
  (** 
    Describes a notification topic and its status. Notification topics are used for publishing DAX events to subscribers using Amazon Simple Notification Service (SNS).
     *)

  preferred_maintenance_window: string option;
  (** 
    A range of time when maintenance of DAX cluster software will be performed. For example: [sun:01:00-sun:09:00]. Cluster maintenance normally takes less than 30 minutes, and is performed automatically within the maintenance window.
     *)

  nodes: node list option;
  (** 
    A list of nodes that are currently in the cluster.
     *)

  node_ids_to_remove: string list option;
  (** 
    A list of nodes to be removed from the cluster.
     *)

  cluster_discovery_endpoint: endpoint option;
  (** 
    The endpoint for this DAX cluster, consisting of a DNS name, a port number, and a URL. Applications should use the URL to configure the DAX client to find their cluster.
     *)

  status: string option;
  (** 
    The current status of the cluster.
     *)

  node_type: string option;
  (** 
    The node type for the nodes in the cluster. (All nodes in a DAX cluster are of the same type.)
     *)

  active_nodes: int option;
  (** 
    The number of nodes in the cluster that are active (i.e., capable of serving requests).
     *)

  total_nodes: int option;
  (** 
    The total number of nodes in the cluster.
     *)

  cluster_arn: string option;
  (** 
    The Amazon Resource Name (ARN) that uniquely identifies the cluster.
     *)

  description: string option;
  (** 
    The description of the cluster.
     *)

  cluster_name: string option;
  (** 
    The name of the DAX cluster.
     *)

}

type update_cluster_response = {
  cluster: cluster option;
  (** 
    A description of the DAX cluster, after it has been modified.
     *)

}

type update_cluster_request = {
  security_group_ids: string list option;
  (** 
    A list of user-specified security group IDs to be assigned to each node in the DAX cluster. If this parameter is not specified, DAX assigns the default VPC security group to each node.
     *)

  parameter_group_name: string option;
  (** 
    The name of a parameter group for this cluster.
     *)

  notification_topic_status: string option;
  (** 
    The current state of the topic. A value of “active” means that notifications will be sent to the topic. A value of “inactive” means that notifications will not be sent to the topic.
     *)

  notification_topic_arn: string option;
  (** 
    The Amazon Resource Name (ARN) that identifies the topic.
     *)

  preferred_maintenance_window: string option;
  (** 
    A range of time when maintenance of DAX cluster software will be performed. For example: [sun:01:00-sun:09:00]. Cluster maintenance normally takes less than 30 minutes, and is performed automatically within the maintenance window.
     *)

  description: string option;
  (** 
    A description of the changes being made to the cluster.
     *)

  cluster_name: string;
  (** 
    The name of the DAX cluster to be modified.
     *)

}

(** 
    The requested DAX cluster is not in the {i available} state.
     *)
type invalid_cluster_state_fault = {
  message: string option;
  
}

(** 
    The requested cluster ID does not refer to an existing DAX cluster.
     *)
type cluster_not_found_fault = {
  message: string option;
  
}

(** 
    A description of a tag. Every tag is a key-value pair. You can add up to 50 tags to a single DAX cluster.
    
     AWS-assigned tag names and values are automatically assigned the [aws:] prefix, which the user cannot assign. AWS-assigned tag names do not count towards the tag limit of 50. User-assigned tag names have the prefix [user:].
     
      You cannot backdate the application of a tag.
       *)
type tag = {
  value: string option;
  (** 
    The value of the tag. Tag values are case-sensitive and can be null.
     *)

  key: string option;
  (** 
    The key for the tag. Tag keys are case sensitive. Every DAX cluster can only have one tag with the same key. If you try to add an existing tag (same key), the existing tag value will be updated to the new value.
     *)

}

type untag_resource_response = {
  tags: tag list option;
  (** 
    The tag keys that have been removed from the cluster.
     *)

}

type untag_resource_request = {
  tag_keys: string list;
  (** 
    A list of tag keys. If the DAX cluster has any tags with these keys, then the tags are removed from the cluster.
     *)

  resource_name: string;
  (** 
    The name of the DAX resource from which the tags should be removed.
     *)

}

(** 
    The tag does not exist.
     *)
type tag_not_found_fault = {
  message: string option;
  
}

(** 
    The Amazon Resource Name (ARN) supplied in the request is not valid.
     *)
type invalid_arn_fault = {
  message: string option;
  
}

type tag_resource_response = {
  tags: tag list option;
  (** 
    The list of tags that are associated with the DAX resource.
     *)

}

type tag_resource_request = {
  tags: tag list;
  (** 
    The tags to be assigned to the DAX resource.
     *)

  resource_name: string;
  (** 
    The name of the DAX resource to which tags should be added.
     *)

}

(** 
    You have exceeded the maximum number of tags for this DAX cluster.
     *)
type tag_quota_per_resource_exceeded = {
  message: string option;
  
}

(** 
    The request cannot be processed because it would exceed the allowed number of subnets in a subnet group.
     *)
type subnet_group_quota_exceeded_fault = {
  message: string option;
  
}

(** 
    The specified subnet group is currently in use.
     *)
type subnet_group_in_use_fault = {
  message: string option;
  
}

(** 
    The specified subnet group already exists.
     *)
type subnet_group_already_exists_fault = {
  message: string option;
  
}

type source_type = | SUBNET_GROUP
  | PARAMETER_GROUP
  | CLUSTER

(** 
    You have reached the maximum number of x509 certificates that can be created for encrypted clusters in a 30 day period. Contact AWS customer support to discuss options for continuing to create encrypted clusters.
     *)
type service_quota_exceeded_exception = unit

(** 
    Represents the settings used to enable server-side encryption.
     *)
type sse_specification = {
  enabled: bool;
  (** 
    Indicates whether server-side encryption is enabled (true) or disabled (false) on the cluster.
     *)

}

type reboot_node_response = {
  cluster: cluster option;
  (** 
    A description of the DAX cluster after a node has been rebooted.
     *)

}

type reboot_node_request = {
  node_id: string;
  (** 
    The system-assigned ID of the node to be rebooted.
     *)

  cluster_name: string;
  (** 
    The name of the DAX cluster containing the node to be rebooted.
     *)

}

(** 
    None of the nodes in the cluster have the given node ID.
     *)
type node_not_found_fault = {
  message: string option;
  
}

type parameter_type = | NODE_TYPE_SPECIFIC
  | DEFAULT

(** 
    Represents a parameter value that is applicable to a particular node type.
     *)
type node_type_specific_value = {
  value: string option;
  (** 
    The parameter value for this node type.
     *)

  node_type: string option;
  (** 
    A node type to which the parameter value applies.
     *)

}

type is_modifiable = | CONDITIONAL
  | FALSE
  | TRUE

type change_type = | REQUIRES_REBOOT
  | IMMEDIATE

(** 
    Describes an individual setting that controls some aspect of DAX behavior.
     *)
type parameter = {
  change_type: change_type option;
  (** 
    The conditions under which changes to this parameter can be applied. For example, [requires-reboot] indicates that a new value for this parameter will only take effect if a node is rebooted.
     *)

  is_modifiable: is_modifiable option;
  (** 
    Whether the customer is allowed to modify the parameter.
     *)

  allowed_values: string option;
  (** 
    A range of values within which the parameter can be set.
     *)

  data_type: string option;
  (** 
    The data type of the parameter. For example, [integer]:
     *)

  source: string option;
  (** 
    How the parameter is defined. For example, [system] denotes a system-defined parameter.
     *)

  description: string option;
  (** 
    A description of the parameter
     *)

  node_type_specific_values: node_type_specific_value list option;
  (** 
    A list of node types, and specific parameter values for each node.
     *)

  parameter_value: string option;
  (** 
    The value for the parameter.
     *)

  parameter_type: parameter_type option;
  (** 
    Determines whether the parameter can be applied to any nodes, or only nodes of a particular type.
     *)

  parameter_name: string option;
  (** 
    The name of the parameter.
     *)

}

(** 
    You have attempted to exceed the maximum number of parameter groups.
     *)
type parameter_group_quota_exceeded_fault = {
  message: string option;
  
}

(** 
    The specified parameter group already exists.
     *)
type parameter_group_already_exists_fault = {
  message: string option;
  
}

(** 
    You have attempted to exceed the maximum number of nodes for your AWS account.
     *)
type node_quota_for_customer_exceeded_fault = {
  message: string option;
  
}

(** 
    You have attempted to exceed the maximum number of nodes for a DAX cluster.
     *)
type node_quota_for_cluster_exceeded_fault = {
  message: string option;
  
}

type list_tags_response = {
  next_token: string option;
  (** 
    If this value is present, there are additional results to be displayed. To retrieve them, call [ListTags] again, with [NextToken] set to this value.
     *)

  tags: tag list option;
  (** 
    A list of tags currently associated with the DAX cluster.
     *)

}

type list_tags_request = {
  next_token: string option;
  (** 
    An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token.
     *)

  resource_name: string;
  (** 
    The name of the DAX resource to which the tags belong.
     *)

}

(** 
    The VPC network is in an invalid state.
     *)
type invalid_vpc_network_state_fault = {
  message: string option;
  
}

(** 
    There are not enough system resources to create the cluster you requested (or to resize an already-existing cluster).
     *)
type insufficient_cluster_capacity_fault = {
  message: string option;
  
}

type increase_replication_factor_response = {
  cluster: cluster option;
  (** 
    A description of the DAX cluster. with its new replication factor.
     *)

}

type increase_replication_factor_request = {
  availability_zones: string list option;
  (** 
    The Availability Zones (AZs) in which the cluster nodes will be created. All nodes belonging to the cluster are placed in these Availability Zones. Use this parameter if you want to distribute the nodes across multiple AZs.
     *)

  new_replication_factor: int;
  (** 
    The new number of nodes for the DAX cluster.
     *)

  cluster_name: string;
  (** 
    The name of the DAX cluster that will receive additional nodes.
     *)

}

(** 
    Represents a single occurrence of something interesting within the system. Some examples of events are creating a DAX cluster, adding or removing a node, or rebooting a node.
     *)
type event = {
  date: float option;
  (** 
    The date and time when the event occurred.
     *)

  message: string option;
  (** 
    A user-defined message associated with the event.
     *)

  source_type: source_type option;
  (** 
    Specifies the origin of this event - a cluster, a parameter group, a node ID, etc.
     *)

  source_name: string option;
  (** 
    The source of the event. For example, if the event occurred at the node level, the source would be the node ID.
     *)

}

type describe_subnet_groups_response = {
  subnet_groups: subnet_group list option;
  (** 
    An array of subnet groups. Each element in the array represents a single subnet group.
     *)

  next_token: string option;
  (** 
    Provides an identifier to allow retrieval of paginated results.
     *)

}

type describe_subnet_groups_request = {
  next_token: string option;
  (** 
    An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].
     *)

  max_results: int option;
  (** 
    The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.
    
     The value for [MaxResults] must be between 20 and 100.
      *)

  subnet_group_names: string list option;
  (** 
    The name of the subnet group.
     *)

}

type describe_parameters_response = {
  parameters: parameter list option;
  (** 
    A list of parameters within a parameter group. Each element in the list represents one parameter.
     *)

  next_token: string option;
  (** 
    Provides an identifier to allow retrieval of paginated results.
     *)

}

type describe_parameters_request = {
  next_token: string option;
  (** 
    An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].
     *)

  max_results: int option;
  (** 
    The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.
    
     The value for [MaxResults] must be between 20 and 100.
      *)

  source: string option;
  (** 
    How the parameter is defined. For example, [system] denotes a system-defined parameter.
     *)

  parameter_group_name: string;
  (** 
    The name of the parameter group.
     *)

}

type describe_parameter_groups_response = {
  parameter_groups: parameter_group list option;
  (** 
    An array of parameter groups. Each element in the array represents one parameter group.
     *)

  next_token: string option;
  (** 
    Provides an identifier to allow retrieval of paginated results.
     *)

}

type describe_parameter_groups_request = {
  next_token: string option;
  (** 
    An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].
     *)

  max_results: int option;
  (** 
    The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.
    
     The value for [MaxResults] must be between 20 and 100.
      *)

  parameter_group_names: string list option;
  (** 
    The names of the parameter groups.
     *)

}

type describe_events_response = {
  events: event list option;
  (** 
    An array of events. Each element in the array represents one event.
     *)

  next_token: string option;
  (** 
    Provides an identifier to allow retrieval of paginated results.
     *)

}

type describe_events_request = {
  next_token: string option;
  (** 
    An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].
     *)

  max_results: int option;
  (** 
    The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.
    
     The value for [MaxResults] must be between 20 and 100.
      *)

  duration: int option;
  (** 
    The number of minutes' worth of events to retrieve.
     *)

  end_time: float option;
  (** 
    The end of the time interval for which to retrieve events, specified in ISO 8601 format.
     *)

  start_time: float option;
  (** 
    The beginning of the time interval to retrieve events for, specified in ISO 8601 format.
     *)

  source_type: source_type option;
  (** 
    The event source to retrieve events for. If no value is specified, all events are returned.
     *)

  source_name: string option;
  (** 
    The identifier of the event source for which events will be returned. If not specified, then all sources are included in the response.
     *)

}

type describe_default_parameters_response = {
  parameters: parameter list option;
  (** 
    A list of parameters. Each element in the list represents one parameter.
     *)

  next_token: string option;
  (** 
    Provides an identifier to allow retrieval of paginated results.
     *)

}

type describe_default_parameters_request = {
  next_token: string option;
  (** 
    An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].
     *)

  max_results: int option;
  (** 
    The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.
    
     The value for [MaxResults] must be between 20 and 100.
      *)

}

type describe_clusters_response = {
  clusters: cluster list option;
  (** 
    The descriptions of your DAX clusters, in response to a {i DescribeClusters} request.
     *)

  next_token: string option;
  (** 
    Provides an identifier to allow retrieval of paginated results.
     *)

}

type describe_clusters_request = {
  next_token: string option;
  (** 
    An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by [MaxResults].
     *)

  max_results: int option;
  (** 
    The maximum number of results to include in the response. If more results exist than the specified [MaxResults] value, a token is included in the response so that the remaining results can be retrieved.
    
     The value for [MaxResults] must be between 20 and 100.
      *)

  cluster_names: string list option;
  (** 
    The names of the DAX clusters being described.
     *)

}

type delete_subnet_group_response = {
  deletion_message: string option;
  (** 
    A user-specified message for this action (i.e., a reason for deleting the subnet group).
     *)

}

type delete_subnet_group_request = {
  subnet_group_name: string;
  (** 
    The name of the subnet group to delete.
     *)

}

type delete_parameter_group_response = {
  deletion_message: string option;
  (** 
    A user-specified message for this action (i.e., a reason for deleting the parameter group).
     *)

}

type delete_parameter_group_request = {
  parameter_group_name: string;
  (** 
    The name of the parameter group to delete.
     *)

}

type delete_cluster_response = {
  cluster: cluster option;
  (** 
    A description of the DAX cluster that is being deleted.
     *)

}

type delete_cluster_request = {
  cluster_name: string;
  (** 
    The name of the cluster to be deleted.
     *)

}

type decrease_replication_factor_response = {
  cluster: cluster option;
  (** 
    A description of the DAX cluster, after you have decreased its replication factor.
     *)

}

type decrease_replication_factor_request = {
  node_ids_to_remove: string list option;
  (** 
    The unique identifiers of the nodes to be removed from the cluster.
     *)

  availability_zones: string list option;
  (** 
    The Availability Zone(s) from which to remove nodes.
     *)

  new_replication_factor: int;
  (** 
    The new number of nodes for the DAX cluster.
     *)

  cluster_name: string;
  (** 
    The name of the DAX cluster from which you want to remove nodes.
     *)

}

type create_subnet_group_response = {
  subnet_group: subnet_group option;
  (** 
    Represents the output of a {i CreateSubnetGroup} operation.
     *)

}

type create_subnet_group_request = {
  subnet_ids: string list;
  (** 
    A list of VPC subnet IDs for the subnet group.
     *)

  description: string option;
  (** 
    A description for the subnet group
     *)

  subnet_group_name: string;
  (** 
    A name for the subnet group. This value is stored as a lowercase string.
     *)

}

type create_parameter_group_response = {
  parameter_group: parameter_group option;
  (** 
    Represents the output of a {i CreateParameterGroup} action.
     *)

}

type create_parameter_group_request = {
  description: string option;
  (** 
    A description of the parameter group.
     *)

  parameter_group_name: string;
  (** 
    The name of the parameter group to apply to all of the clusters in this replication group.
     *)

}

type create_cluster_response = {
  cluster: cluster option;
  (** 
    A description of the DAX cluster that you have created.
     *)

}

type create_cluster_request = {
  cluster_endpoint_encryption_type: cluster_endpoint_encryption_type option;
  (** 
    The type of encryption the cluster's endpoint should support. Values are:
    
     {ul
          {- [NONE] for no encryption
             
             }
           {- [TLS] for Transport Layer Security
              
              }
          
      }
       *)

  sse_specification: sse_specification option;
  (** 
    Represents the settings used to enable server-side encryption on the cluster.
     *)

  tags: tag list option;
  (** 
    A set of tags to associate with the DAX cluster.
     *)

  parameter_group_name: string option;
  (** 
    The parameter group to be associated with the DAX cluster.
     *)

  iam_role_arn: string;
  (** 
    A valid Amazon Resource Name (ARN) that identifies an IAM role. At runtime, DAX will assume this role and use the role's permissions to access DynamoDB on your behalf.
     *)

  notification_topic_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications will be sent.
    
     The Amazon SNS topic owner must be same as the DAX cluster owner.
     
      *)

  preferred_maintenance_window: string option;
  (** 
    Specifies the weekly time range during which maintenance on the DAX cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for [ddd] are:
    
     {ul
          {- [sun]
             
             }
           {- [mon]
              
              }
           {- [tue]
              
              }
           {- [wed]
              
              }
           {- [thu]
              
              }
           {- [fri]
              
              }
           {- [sat]
              
              }
          
      }
       Example: [sun:05:00-sun:09:00]
       
        If you don't specify a preferred maintenance window when you create or modify a cache cluster, DAX assigns a 60-minute maintenance window on a randomly selected day of the week.
        
         *)

  security_group_ids: string list option;
  (** 
    A list of security group IDs to be assigned to each node in the DAX cluster. (Each of the security group ID is system-generated.)
    
     If this parameter is not specified, DAX assigns the default VPC security group to each node.
      *)

  subnet_group_name: string option;
  (** 
    The name of the subnet group to be used for the replication group.
    
     DAX clusters can only run in an Amazon VPC environment. All of the subnets that you specify in a subnet group must exist in the same VPC.
     
      *)

  availability_zones: string list option;
  (** 
    The Availability Zones (AZs) in which the cluster nodes will reside after the cluster has been created or updated. If provided, the length of this list must equal the [ReplicationFactor] parameter. If you omit this parameter, DAX will spread the nodes across Availability Zones for the highest availability.
     *)

  replication_factor: int;
  (** 
    The number of nodes in the DAX cluster. A replication factor of 1 will create a single-node cluster, without any read replicas. For additional fault tolerance, you can create a multiple node cluster with one or more read replicas. To do this, set [ReplicationFactor] to a number between 3 (one primary and two read replicas) and 10 (one primary and nine read replicas). [If the AvailabilityZones] parameter is provided, its length must equal the [ReplicationFactor].
    
     AWS recommends that you have at least two read replicas per cluster.
     
      *)

  description: string option;
  (** 
    A description of the cluster.
     *)

  node_type: string;
  (** 
    The compute and memory capacity of the nodes in the cluster.
     *)

  cluster_name: string;
  (** 
    The cluster identifier. This parameter is stored as a lowercase string.
    
     {b Constraints:}
     
      {ul
           {- A name must contain from 1 to 20 alphanumeric characters or hyphens.
              
              }
            {- The first character must be a letter.
               
               }
            {- A name cannot end with a hyphen or contain two consecutive hyphens.
               
               }
           
      }
       *)

}

(** 
    You have attempted to exceed the maximum number of DAX clusters for your AWS account.
     *)
type cluster_quota_for_customer_exceeded_fault = {
  message: string option;
  
}

(** 
    You already have a DAX cluster with the given identifier.
     *)
type cluster_already_exists_fault = {
  message: string option;
  
}

(** 
    DAX is a managed caching service engineered for Amazon DynamoDB. DAX dramatically speeds up database reads by caching frequently-accessed data from DynamoDB, so applications can access that data with sub-millisecond latency. You can create a DAX cluster easily, using the AWS Management Console. With a few simple modifications to your code, your application can begin taking advantage of the DAX cluster and realize significant improvements in read performance.
     *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_subnet :
  ?subnet_availability_zone:string -> ?subnet_identifier:string -> unit
-> subnet
(** Create a {!type-subnet} type *)

val make_subnet_group :
  ?subnets:subnet list ->
  ?vpc_id:string ->
  ?description:string ->
  ?subnet_group_name:string ->
  unit
-> subnet_group
(** Create a {!type-subnet_group} type *)

val make_update_subnet_group_response : ?subnet_group:subnet_group -> unit
-> update_subnet_group_response
(** Create a {!type-update_subnet_group_response} type *)

val make_update_subnet_group_request :
  ?subnet_ids:string list ->
  ?description:string ->
  subnet_group_name:string ->
  unit
-> update_subnet_group_request
(** Create a {!type-update_subnet_group_request} type *)

val make_parameter_group :
  ?description:string -> ?parameter_group_name:string -> unit
-> parameter_group
(** Create a {!type-parameter_group} type *)

val make_update_parameter_group_response :
  ?parameter_group:parameter_group -> unit
-> update_parameter_group_response
(** Create a {!type-update_parameter_group_response} type *)

val make_parameter_name_value :
  ?parameter_value:string -> ?parameter_name:string -> unit
-> parameter_name_value
(** Create a {!type-parameter_name_value} type *)

val make_update_parameter_group_request :
  parameter_name_values:parameter_name_value list ->
  parameter_group_name:string ->
  unit
-> update_parameter_group_request
(** Create a {!type-update_parameter_group_request} type *)

val make_endpoint : ?ur_l:string -> ?port:int -> ?address:string -> unit
-> endpoint
(** Create a {!type-endpoint} type *)

val make_node :
  ?parameter_group_status:string ->
  ?node_status:string ->
  ?availability_zone:string ->
  ?node_create_time:float ->
  ?endpoint:endpoint ->
  ?node_id:string ->
  unit
-> node
(** Create a {!type-node} type *)

val make_notification_configuration :
  ?topic_status:string -> ?topic_arn:string -> unit
-> notification_configuration
(** Create a {!type-notification_configuration} type *)

val make_security_group_membership :
  ?status:string -> ?security_group_identifier:string -> unit
-> security_group_membership
(** Create a {!type-security_group_membership} type *)

val make_parameter_group_status :
  ?node_ids_to_reboot:string list ->
  ?parameter_apply_status:string ->
  ?parameter_group_name:string ->
  unit
-> parameter_group_status
(** Create a {!type-parameter_group_status} type *)

val make_sse_description : ?status:sse_status -> unit
-> sse_description
(** Create a {!type-sse_description} type *)

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
  unit
-> cluster
(** Create a {!type-cluster} type *)

val make_update_cluster_response : ?cluster:cluster -> unit
-> update_cluster_response
(** Create a {!type-update_cluster_response} type *)

val make_update_cluster_request :
  ?security_group_ids:string list ->
  ?parameter_group_name:string ->
  ?notification_topic_status:string ->
  ?notification_topic_arn:string ->
  ?preferred_maintenance_window:string ->
  ?description:string ->
  cluster_name:string ->
  unit
-> update_cluster_request
(** Create a {!type-update_cluster_request} type *)

val make_tag : ?value:string -> ?key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_untag_resource_response : ?tags:tag list -> unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_name:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_tag_resource_response : ?tags:tag list -> unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag_resource_request : tags:tag list -> resource_name:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_sse_specification : enabled:bool -> unit
-> sse_specification
(** Create a {!type-sse_specification} type *)

val make_reboot_node_response : ?cluster:cluster -> unit
-> reboot_node_response
(** Create a {!type-reboot_node_response} type *)

val make_reboot_node_request : node_id:string -> cluster_name:string -> unit
-> reboot_node_request
(** Create a {!type-reboot_node_request} type *)

val make_node_type_specific_value :
  ?value:string -> ?node_type:string -> unit
-> node_type_specific_value
(** Create a {!type-node_type_specific_value} type *)

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
  unit
-> parameter
(** Create a {!type-parameter} type *)

val make_list_tags_response : ?next_token:string -> ?tags:tag list -> unit
-> list_tags_response
(** Create a {!type-list_tags_response} type *)

val make_list_tags_request :
  ?next_token:string -> resource_name:string -> unit
-> list_tags_request
(** Create a {!type-list_tags_request} type *)

val make_increase_replication_factor_response : ?cluster:cluster -> unit
-> increase_replication_factor_response
(** Create a {!type-increase_replication_factor_response} type *)

val make_increase_replication_factor_request :
  ?availability_zones:string list ->
  new_replication_factor:int ->
  cluster_name:string ->
  unit
-> increase_replication_factor_request
(** Create a {!type-increase_replication_factor_request} type *)

val make_event :
  ?date:float ->
  ?message:string ->
  ?source_type:source_type ->
  ?source_name:string ->
  unit
-> event
(** Create a {!type-event} type *)

val make_describe_subnet_groups_response :
  ?subnet_groups:subnet_group list -> ?next_token:string -> unit
-> describe_subnet_groups_response
(** Create a {!type-describe_subnet_groups_response} type *)

val make_describe_subnet_groups_request :
  ?next_token:string ->
  ?max_results:int ->
  ?subnet_group_names:string list ->
  unit
-> describe_subnet_groups_request
(** Create a {!type-describe_subnet_groups_request} type *)

val make_describe_parameters_response :
  ?parameters:parameter list -> ?next_token:string -> unit
-> describe_parameters_response
(** Create a {!type-describe_parameters_response} type *)

val make_describe_parameters_request :
  ?next_token:string ->
  ?max_results:int ->
  ?source:string ->
  parameter_group_name:string ->
  unit
-> describe_parameters_request
(** Create a {!type-describe_parameters_request} type *)

val make_describe_parameter_groups_response :
  ?parameter_groups:parameter_group list -> ?next_token:string -> unit
-> describe_parameter_groups_response
(** Create a {!type-describe_parameter_groups_response} type *)

val make_describe_parameter_groups_request :
  ?next_token:string ->
  ?max_results:int ->
  ?parameter_group_names:string list ->
  unit
-> describe_parameter_groups_request
(** Create a {!type-describe_parameter_groups_request} type *)

val make_describe_events_response :
  ?events:event list -> ?next_token:string -> unit
-> describe_events_response
(** Create a {!type-describe_events_response} type *)

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
(** Create a {!type-describe_events_request} type *)

val make_describe_default_parameters_response :
  ?parameters:parameter list -> ?next_token:string -> unit
-> describe_default_parameters_response
(** Create a {!type-describe_default_parameters_response} type *)

val make_describe_default_parameters_request :
  ?next_token:string -> ?max_results:int -> unit
-> describe_default_parameters_request
(** Create a {!type-describe_default_parameters_request} type *)

val make_describe_clusters_response :
  ?clusters:cluster list -> ?next_token:string -> unit
-> describe_clusters_response
(** Create a {!type-describe_clusters_response} type *)

val make_describe_clusters_request :
  ?next_token:string ->
  ?max_results:int ->
  ?cluster_names:string list ->
  unit
-> describe_clusters_request
(** Create a {!type-describe_clusters_request} type *)

val make_delete_subnet_group_response : ?deletion_message:string -> unit
-> delete_subnet_group_response
(** Create a {!type-delete_subnet_group_response} type *)

val make_delete_subnet_group_request : subnet_group_name:string -> unit
-> delete_subnet_group_request
(** Create a {!type-delete_subnet_group_request} type *)

val make_delete_parameter_group_response : ?deletion_message:string -> unit
-> delete_parameter_group_response
(** Create a {!type-delete_parameter_group_response} type *)

val make_delete_parameter_group_request : parameter_group_name:string -> unit
-> delete_parameter_group_request
(** Create a {!type-delete_parameter_group_request} type *)

val make_delete_cluster_response : ?cluster:cluster -> unit
-> delete_cluster_response
(** Create a {!type-delete_cluster_response} type *)

val make_delete_cluster_request : cluster_name:string -> unit
-> delete_cluster_request
(** Create a {!type-delete_cluster_request} type *)

val make_decrease_replication_factor_response : ?cluster:cluster -> unit
-> decrease_replication_factor_response
(** Create a {!type-decrease_replication_factor_response} type *)

val make_decrease_replication_factor_request :
  ?node_ids_to_remove:string list ->
  ?availability_zones:string list ->
  new_replication_factor:int ->
  cluster_name:string ->
  unit
-> decrease_replication_factor_request
(** Create a {!type-decrease_replication_factor_request} type *)

val make_create_subnet_group_response : ?subnet_group:subnet_group -> unit
-> create_subnet_group_response
(** Create a {!type-create_subnet_group_response} type *)

val make_create_subnet_group_request :
  ?description:string ->
  subnet_ids:string list ->
  subnet_group_name:string ->
  unit
-> create_subnet_group_request
(** Create a {!type-create_subnet_group_request} type *)

val make_create_parameter_group_response :
  ?parameter_group:parameter_group -> unit
-> create_parameter_group_response
(** Create a {!type-create_parameter_group_response} type *)

val make_create_parameter_group_request :
  ?description:string -> parameter_group_name:string -> unit
-> create_parameter_group_request
(** Create a {!type-create_parameter_group_request} type *)

val make_create_cluster_response : ?cluster:cluster -> unit
-> create_cluster_response
(** Create a {!type-create_cluster_response} type *)

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
  unit
-> create_cluster_request
(** Create a {!type-create_cluster_request} type *)

(** {1:operations Operations} *)

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
  (** 
    Creates a DAX cluster. All nodes in the cluster run the same DAX caching software.
     *)

  
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
  (** 
    Creates a new parameter group. A parameter group is a collection of parameters that you apply to all of the nodes in a DAX cluster.
     *)

  
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
  (** 
    Creates a new subnet group.
     *)

  
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
  (** 
    Removes one or more nodes from a DAX cluster.
    
     You cannot use [DecreaseReplicationFactor] to remove the last node in a DAX cluster. If you need to do this, use [DeleteCluster] instead.
     
      *)

  
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
  (** 
    Deletes a previously provisioned DAX cluster. {i DeleteCluster} deletes all associated nodes, node endpoints and the DAX cluster itself. When you receive a successful response from this action, DAX immediately begins deleting the cluster; you cannot cancel or revert this action.
     *)

  
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
  (** 
    Deletes the specified parameter group. You cannot delete a parameter group if it is associated with any DAX clusters.
     *)

  
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
  (** 
    Deletes a subnet group.
    
     You cannot delete a subnet group if it is associated with any DAX clusters.
     
      *)

  
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
  (** 
    Returns information about all provisioned DAX clusters if no cluster identifier is specified, or about a specific DAX cluster if a cluster identifier is supplied.
    
     If the cluster is in the CREATING state, only cluster level information will be displayed until all of the nodes are successfully provisioned.
     
      If the cluster is in the DELETING state, only cluster level information will be displayed.
      
       If nodes are currently being added to the DAX cluster, node endpoint information and creation time for the additional nodes will not be displayed until they are completely provisioned. When the DAX cluster state is {i available}, the cluster is ready for use.
       
        If nodes are currently being removed from the DAX cluster, no endpoint information for the removed nodes is displayed.
         *)

  
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
  (** 
    Returns the default system parameter information for the DAX caching software.
     *)

  
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
  (** 
    Returns events related to DAX clusters and parameter groups. You can obtain events specific to a particular DAX cluster or parameter group by providing the name as a parameter.
    
     By default, only the events occurring within the last 24 hours are returned; however, you can retrieve up to 14 days' worth of events if necessary.
      *)

  
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
  (** 
    Returns a list of parameter group descriptions. If a parameter group name is specified, the list will contain only the descriptions for that group.
     *)

  
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
  (** 
    Returns the detailed parameter list for a particular parameter group.
     *)

  
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
  (** 
    Returns a list of subnet group descriptions. If a subnet group name is specified, the list will contain only the description of that group.
     *)

  
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
  (** 
    Adds one or more nodes to a DAX cluster.
     *)

  
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
  (** 
    List all of the tags for a DAX cluster. You can call [ListTags] up to 10 times per second, per account.
     *)

  
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
  (** 
    Reboots a single node of a DAX cluster. The reboot action takes place as soon as possible. During the reboot, the node status is set to REBOOTING.
    
     [RebootNode] restarts the DAX engine process and does not remove the contents of the cache.
     
      *)

  
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
  (** 
    Associates a set of tags with a DAX resource. You can call [TagResource] up to 5 times per second, per account.
     *)

  
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
  (** 
    Removes the association of tags from a DAX resource. You can call [UntagResource] up to 5 times per second, per account.
     *)

  
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
  (** 
    Modifies the settings for a DAX cluster. You can use this action to change one or more cluster configuration parameters by specifying the parameters and the new values.
     *)

  
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
  (** 
    Modifies the parameters of a parameter group. You can modify up to 20 parameters in a single request by submitting a list parameter name and value pairs.
     *)

  
end

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
  (** 
    Modifies an existing subnet group.
     *)

  
end

