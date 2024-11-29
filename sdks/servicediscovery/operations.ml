open Types 
let (let+) res map = Result.map map res
module CreateHttpNamespace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceAlreadyExists" ->
         (`NamespaceAlreadyExists (namespace_already_exists_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceLimitExceeded" ->
         (`ResourceLimitExceeded (resource_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_http_namespace_request) ->
    let input = Serializers.create_http_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.CreateHttpNamespace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_http_namespace_response_of_yojson
      ~error_deserializer
      
end

module CreatePrivateDnsNamespace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceAlreadyExists" ->
         (`NamespaceAlreadyExists (namespace_already_exists_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceLimitExceeded" ->
         (`ResourceLimitExceeded (resource_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_private_dns_namespace_request) ->
    let input = Serializers.create_private_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.CreatePrivateDnsNamespace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_private_dns_namespace_response_of_yojson
      ~error_deserializer
      
end

module CreatePublicDnsNamespace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceAlreadyExists" ->
         (`NamespaceAlreadyExists (namespace_already_exists_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceLimitExceeded" ->
         (`ResourceLimitExceeded (resource_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_public_dns_namespace_request) ->
    let input = Serializers.create_public_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.CreatePublicDnsNamespace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_public_dns_namespace_response_of_yojson
      ~error_deserializer
      
end

module CreateService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceNotFound" ->
         (`NamespaceNotFound (namespace_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceLimitExceeded" ->
         (`ResourceLimitExceeded (resource_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceAlreadyExists" ->
         (`ServiceAlreadyExists (service_already_exists_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_service_request) ->
    let input = Serializers.create_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.CreateService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_service_response_of_yojson
      ~error_deserializer
      
end

module DeleteNamespace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceNotFound" ->
         (`NamespaceNotFound (namespace_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceInUse" ->
         (`ResourceInUse (resource_in_use_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_namespace_request) ->
    let input = Serializers.delete_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.DeleteNamespace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_namespace_response_of_yojson
      ~error_deserializer
      
end

module DeleteService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceInUse" ->
         (`ResourceInUse (resource_in_use_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_service_request) ->
    let input = Serializers.delete_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.DeleteService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_service_response_of_yojson
      ~error_deserializer
      
end

module DeregisterInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InstanceNotFound" ->
         (`InstanceNotFound (instance_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceInUse" ->
         (`ResourceInUse (resource_in_use_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_instance_request) ->
    let input = Serializers.deregister_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.DeregisterInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_instance_response_of_yojson
      ~error_deserializer
      
end

module DiscoverInstances = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceNotFound" ->
         (`NamespaceNotFound (namespace_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: discover_instances_request) ->
    let input = Serializers.discover_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.DiscoverInstances" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.discover_instances_response_of_yojson
      ~error_deserializer
      
end

module DiscoverInstancesRevision = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceNotFound" ->
         (`NamespaceNotFound (namespace_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: discover_instances_revision_request) ->
    let input = Serializers.discover_instances_revision_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.DiscoverInstancesRevision" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.discover_instances_revision_response_of_yojson
      ~error_deserializer
      
end

module GetInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InstanceNotFound" ->
         (`InstanceNotFound (instance_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instance_request) ->
    let input = Serializers.get_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.GetInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instance_response_of_yojson
      ~error_deserializer
      
end

module GetInstancesHealthStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InstanceNotFound" ->
         (`InstanceNotFound (instance_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instances_health_status_request) ->
    let input = Serializers.get_instances_health_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.GetInstancesHealthStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instances_health_status_response_of_yojson
      ~error_deserializer
      
end

module GetNamespace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceNotFound" ->
         (`NamespaceNotFound (namespace_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_namespace_request) ->
    let input = Serializers.get_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.GetNamespace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_namespace_response_of_yojson
      ~error_deserializer
      
end

module GetOperation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "OperationNotFound" ->
         (`OperationNotFound (operation_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_operation_request) ->
    let input = Serializers.get_operation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.GetOperation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_operation_response_of_yojson
      ~error_deserializer
      
end

module GetService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_service_request) ->
    let input = Serializers.get_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.GetService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_service_response_of_yojson
      ~error_deserializer
      
end

module ListInstances = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_instances_request) ->
    let input = Serializers.list_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.ListInstances" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_instances_response_of_yojson
      ~error_deserializer
      
end

module ListNamespaces = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_namespaces_request) ->
    let input = Serializers.list_namespaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.ListNamespaces" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_namespaces_response_of_yojson
      ~error_deserializer
      
end

module ListOperations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_operations_request) ->
    let input = Serializers.list_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.ListOperations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_operations_response_of_yojson
      ~error_deserializer
      
end

module ListServices = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_services_request) ->
    let input = Serializers.list_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.ListServices" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_services_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module RegisterInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceInUse" ->
         (`ResourceInUse (resource_in_use_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceLimitExceeded" ->
         (`ResourceLimitExceeded (resource_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_instance_request) ->
    let input = Serializers.register_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.RegisterInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_instance_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.TagResource" 
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
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module UpdateHttpNamespace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceNotFound" ->
         (`NamespaceNotFound (namespace_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceInUse" ->
         (`ResourceInUse (resource_in_use_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_http_namespace_request) ->
    let input = Serializers.update_http_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.UpdateHttpNamespace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_http_namespace_response_of_yojson
      ~error_deserializer
      
end

module UpdateInstanceCustomHealthStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "CustomHealthNotFound" ->
         (`CustomHealthNotFound (custom_health_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InstanceNotFound" ->
         (`InstanceNotFound (instance_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_instance_custom_health_status_request) ->
    let input = Serializers.update_instance_custom_health_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.UpdateInstanceCustomHealthStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UpdatePrivateDnsNamespace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceNotFound" ->
         (`NamespaceNotFound (namespace_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceInUse" ->
         (`ResourceInUse (resource_in_use_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_private_dns_namespace_request) ->
    let input = Serializers.update_private_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.UpdatePrivateDnsNamespace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_private_dns_namespace_response_of_yojson
      ~error_deserializer
      
end

module UpdatePublicDnsNamespace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "NamespaceNotFound" ->
         (`NamespaceNotFound (namespace_not_found_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ResourceInUse" ->
         (`ResourceInUse (resource_in_use_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_public_dns_namespace_request) ->
    let input = Serializers.update_public_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.UpdatePublicDnsNamespace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_public_dns_namespace_response_of_yojson
      ~error_deserializer
      
end

module UpdateService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.servicediscovery", "DuplicateRequest" ->
         (`DuplicateRequest (duplicate_request_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "InvalidInput" ->
         (`InvalidInput (invalid_input_of_yojson tree path))
      | "com.amazonaws.servicediscovery", "ServiceNotFound" ->
         (`ServiceNotFound (service_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_request) ->
    let input = Serializers.update_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Route53AutoNaming_v20170314.UpdateService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_response_of_yojson
      ~error_deserializer
      
end

