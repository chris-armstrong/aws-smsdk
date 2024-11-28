open Types 
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

