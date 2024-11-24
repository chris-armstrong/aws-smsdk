open Types 
let (let+) res map = Result.map map res
module CreateCluster = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterAlreadyExistsFault" ->
         (`ClusterAlreadyExistsFault (cluster_already_exists_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ClusterQuotaForCustomerExceededFault" ->
         (`ClusterQuotaForCustomerExceededFault (cluster_quota_for_customer_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InsufficientClusterCapacityFault" ->
         (`InsufficientClusterCapacityFault (insufficient_cluster_capacity_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidClusterStateFault" ->
         (`InvalidClusterStateFault (invalid_cluster_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterGroupStateFault" ->
         (`InvalidParameterGroupStateFault (invalid_parameter_group_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidVPCNetworkStateFault" ->
         (`InvalidVPCNetworkStateFault (invalid_vpc_network_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "NodeQuotaForClusterExceededFault" ->
         (`NodeQuotaForClusterExceededFault (node_quota_for_cluster_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.dax", "NodeQuotaForCustomerExceededFault" ->
         (`NodeQuotaForCustomerExceededFault (node_quota_for_customer_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ParameterGroupNotFoundFault" ->
         (`ParameterGroupNotFoundFault (parameter_group_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetGroupNotFoundFault" ->
         (`SubnetGroupNotFoundFault (subnet_group_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "TagQuotaPerResourceExceeded" ->
         (`TagQuotaPerResourceExceeded (tag_quota_per_resource_exceeded_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_cluster_request) ->
    let input = Serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.CreateCluster" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_cluster_response_of_yojson
      ~error_deserializer
      
end

module CreateParameterGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterGroupStateFault" ->
         (`InvalidParameterGroupStateFault (invalid_parameter_group_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ParameterGroupAlreadyExistsFault" ->
         (`ParameterGroupAlreadyExistsFault (parameter_group_already_exists_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ParameterGroupQuotaExceededFault" ->
         (`ParameterGroupQuotaExceededFault (parameter_group_quota_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_parameter_group_request) ->
    let input = Serializers.create_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.CreateParameterGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_parameter_group_response_of_yojson
      ~error_deserializer
      
end

module CreateSubnetGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "InvalidSubnet" ->
         (`InvalidSubnet (invalid_subnet_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetGroupAlreadyExistsFault" ->
         (`SubnetGroupAlreadyExistsFault (subnet_group_already_exists_fault_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetGroupQuotaExceededFault" ->
         (`SubnetGroupQuotaExceededFault (subnet_group_quota_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetQuotaExceededFault" ->
         (`SubnetQuotaExceededFault (subnet_quota_exceeded_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_subnet_group_request) ->
    let input = Serializers.create_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.CreateSubnetGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_subnet_group_response_of_yojson
      ~error_deserializer
      
end

module DecreaseReplicationFactor = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterNotFoundFault" ->
         (`ClusterNotFoundFault (cluster_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidClusterStateFault" ->
         (`InvalidClusterStateFault (invalid_cluster_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "NodeNotFoundFault" ->
         (`NodeNotFoundFault (node_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: decrease_replication_factor_request) ->
    let input = Serializers.decrease_replication_factor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DecreaseReplicationFactor" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.decrease_replication_factor_response_of_yojson
      ~error_deserializer
      
end

module DeleteCluster = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterNotFoundFault" ->
         (`ClusterNotFoundFault (cluster_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidClusterStateFault" ->
         (`InvalidClusterStateFault (invalid_cluster_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_cluster_request) ->
    let input = Serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DeleteCluster" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_cluster_response_of_yojson
      ~error_deserializer
      
end

module DeleteParameterGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterGroupStateFault" ->
         (`InvalidParameterGroupStateFault (invalid_parameter_group_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ParameterGroupNotFoundFault" ->
         (`ParameterGroupNotFoundFault (parameter_group_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_parameter_group_request) ->
    let input = Serializers.delete_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DeleteParameterGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_parameter_group_response_of_yojson
      ~error_deserializer
      
end

module DeleteSubnetGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetGroupInUseFault" ->
         (`SubnetGroupInUseFault (subnet_group_in_use_fault_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetGroupNotFoundFault" ->
         (`SubnetGroupNotFoundFault (subnet_group_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_subnet_group_request) ->
    let input = Serializers.delete_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DeleteSubnetGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_subnet_group_response_of_yojson
      ~error_deserializer
      
end

module DescribeClusters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterNotFoundFault" ->
         (`ClusterNotFoundFault (cluster_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_clusters_request) ->
    let input = Serializers.describe_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DescribeClusters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_clusters_response_of_yojson
      ~error_deserializer
      
end

module DescribeDefaultParameters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_default_parameters_request) ->
    let input = Serializers.describe_default_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DescribeDefaultParameters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_default_parameters_response_of_yojson
      ~error_deserializer
      
end

module DescribeEvents = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_events_request) ->
    let input = Serializers.describe_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DescribeEvents" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_events_response_of_yojson
      ~error_deserializer
      
end

module DescribeParameterGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ParameterGroupNotFoundFault" ->
         (`ParameterGroupNotFoundFault (parameter_group_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_parameter_groups_request) ->
    let input = Serializers.describe_parameter_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DescribeParameterGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_parameter_groups_response_of_yojson
      ~error_deserializer
      
end

module DescribeParameters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ParameterGroupNotFoundFault" ->
         (`ParameterGroupNotFoundFault (parameter_group_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_parameters_request) ->
    let input = Serializers.describe_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DescribeParameters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_parameters_response_of_yojson
      ~error_deserializer
      
end

module DescribeSubnetGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetGroupNotFoundFault" ->
         (`SubnetGroupNotFoundFault (subnet_group_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_subnet_groups_request) ->
    let input = Serializers.describe_subnet_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.DescribeSubnetGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_subnet_groups_response_of_yojson
      ~error_deserializer
      
end

module IncreaseReplicationFactor = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterNotFoundFault" ->
         (`ClusterNotFoundFault (cluster_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InsufficientClusterCapacityFault" ->
         (`InsufficientClusterCapacityFault (insufficient_cluster_capacity_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidClusterStateFault" ->
         (`InvalidClusterStateFault (invalid_cluster_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidVPCNetworkStateFault" ->
         (`InvalidVPCNetworkStateFault (invalid_vpc_network_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "NodeQuotaForClusterExceededFault" ->
         (`NodeQuotaForClusterExceededFault (node_quota_for_cluster_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.dax", "NodeQuotaForCustomerExceededFault" ->
         (`NodeQuotaForCustomerExceededFault (node_quota_for_customer_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: increase_replication_factor_request) ->
    let input = Serializers.increase_replication_factor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.IncreaseReplicationFactor" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.increase_replication_factor_response_of_yojson
      ~error_deserializer
      
end

module ListTags = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterNotFoundFault" ->
         (`ClusterNotFoundFault (cluster_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidARNFault" ->
         (`InvalidARNFault (invalid_arn_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidClusterStateFault" ->
         (`InvalidClusterStateFault (invalid_cluster_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_request) ->
    let input = Serializers.list_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.ListTags" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_response_of_yojson
      ~error_deserializer
      
end

module RebootNode = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterNotFoundFault" ->
         (`ClusterNotFoundFault (cluster_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidClusterStateFault" ->
         (`InvalidClusterStateFault (invalid_cluster_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "NodeNotFoundFault" ->
         (`NodeNotFoundFault (node_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: reboot_node_request) ->
    let input = Serializers.reboot_node_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.RebootNode" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.reboot_node_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterNotFoundFault" ->
         (`ClusterNotFoundFault (cluster_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidARNFault" ->
         (`InvalidARNFault (invalid_arn_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidClusterStateFault" ->
         (`InvalidClusterStateFault (invalid_cluster_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "TagQuotaPerResourceExceeded" ->
         (`TagQuotaPerResourceExceeded (tag_quota_per_resource_exceeded_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterNotFoundFault" ->
         (`ClusterNotFoundFault (cluster_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidARNFault" ->
         (`InvalidARNFault (invalid_arn_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidClusterStateFault" ->
         (`InvalidClusterStateFault (invalid_cluster_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "TagNotFoundFault" ->
         (`TagNotFoundFault (tag_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module UpdateCluster = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "ClusterNotFoundFault" ->
         (`ClusterNotFoundFault (cluster_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidClusterStateFault" ->
         (`InvalidClusterStateFault (invalid_cluster_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterGroupStateFault" ->
         (`InvalidParameterGroupStateFault (invalid_parameter_group_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ParameterGroupNotFoundFault" ->
         (`ParameterGroupNotFoundFault (parameter_group_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_cluster_request) ->
    let input = Serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.UpdateCluster" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_cluster_response_of_yojson
      ~error_deserializer
      
end

module UpdateParameterGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "InvalidParameterCombinationException" ->
         (`InvalidParameterCombinationException (invalid_parameter_combination_exception_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterGroupStateFault" ->
         (`InvalidParameterGroupStateFault (invalid_parameter_group_state_fault_of_yojson tree path))
      | "com.amazonaws.dax", "InvalidParameterValueException" ->
         (`InvalidParameterValueException (invalid_parameter_value_exception_of_yojson tree path))
      | "com.amazonaws.dax", "ParameterGroupNotFoundFault" ->
         (`ParameterGroupNotFoundFault (parameter_group_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_parameter_group_request) ->
    let input = Serializers.update_parameter_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.UpdateParameterGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_parameter_group_response_of_yojson
      ~error_deserializer
      
end

module UpdateSubnetGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dax", "InvalidSubnet" ->
         (`InvalidSubnet (invalid_subnet_of_yojson tree path))
      | "com.amazonaws.dax", "ServiceLinkedRoleNotFoundFault" ->
         (`ServiceLinkedRoleNotFoundFault (service_linked_role_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetGroupNotFoundFault" ->
         (`SubnetGroupNotFoundFault (subnet_group_not_found_fault_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetInUse" ->
         (`SubnetInUse (subnet_in_use_of_yojson tree path))
      | "com.amazonaws.dax", "SubnetQuotaExceededFault" ->
         (`SubnetQuotaExceededFault (subnet_quota_exceeded_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_subnet_group_request) ->
    let input = Serializers.update_subnet_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonDAXV3.UpdateSubnetGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_subnet_group_response_of_yojson
      ~error_deserializer
      
end

