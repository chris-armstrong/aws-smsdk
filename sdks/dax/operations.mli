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

