open Types 
module CreateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_http_namespace_request ->
        (create_http_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module CreatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_private_dns_namespace_request ->
        (create_private_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module CreatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_public_dns_namespace_request ->
        (create_public_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_request ->
        (create_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `ServiceAlreadyExists of service_already_exists
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module DeleteNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_namespace_request ->
        (delete_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
end

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_request ->
        (delete_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module DeregisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_instance_request ->
        (deregister_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module DiscoverInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_instances_request ->
        (discover_instances_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `RequestLimitExceeded of request_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module DiscoverInstancesRevision : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_instances_revision_request ->
        (discover_instances_revision_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `RequestLimitExceeded of request_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module GetInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_request ->
        (get_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module GetInstancesHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instances_health_status_request ->
        (get_instances_health_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module GetNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      get_namespace_request ->
        (get_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            
        ]
      ) result
end

module GetOperation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operation_request ->
        (get_operation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `OperationNotFound of operation_not_found
            
        ]
      ) result
end

module GetService : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_request ->
        (get_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module ListInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      list_instances_request ->
        (list_instances_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module ListNamespaces : sig
  val request :
    Smaws_Lib.Context.t ->
      list_namespaces_request ->
        (list_namespaces_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
end

module ListOperations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_operations_request ->
        (list_operations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
end

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_request ->
        (list_services_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RegisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      register_instance_request ->
        (register_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_http_namespace_request ->
        (update_http_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
end

module UpdateInstanceCustomHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_instance_custom_health_status_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomHealthNotFound of custom_health_not_found
            | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

module UpdatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_private_dns_namespace_request ->
        (update_private_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
end

module UpdatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_public_dns_namespace_request ->
        (update_public_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
end

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_request ->
        (update_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
end

