open Types 
module UpdateVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_vpc_ingress_connection_request ->
        (update_vpc_ingress_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_request ->
        (update_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateDefaultAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_default_auto_scaling_configuration_request ->
        (update_default_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module StartDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      start_deployment_request ->
        (start_deployment_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ResumeService : sig
  val request :
    Smaws_Lib.Context.t ->
      resume_service_request ->
        (resume_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PauseService : sig
  val request :
    Smaws_Lib.Context.t ->
      pause_service_request ->
        (pause_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListVpcIngressConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_ingress_connections_request ->
        (list_vpc_ingress_connections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
end

module ListVpcConnectors : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_connectors_request ->
        (list_vpc_connectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListServicesForAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_for_auto_scaling_configuration_request ->
        (list_services_for_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_request ->
        (list_services_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
end

module ListOperations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_operations_request ->
        (list_operations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListObservabilityConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_observability_configurations_request ->
        (list_observability_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
end

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_request ->
        (list_connections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
end

module ListAutoScalingConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_auto_scaling_configurations_request ->
        (list_auto_scaling_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
end

module DisassociateCustomDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_custom_domain_request ->
        (disassociate_custom_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_vpc_ingress_connection_request ->
        (describe_vpc_ingress_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeVpcConnector : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_vpc_connector_request ->
        (describe_vpc_connector_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeService : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_service_request ->
        (describe_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeObservabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_observability_configuration_request ->
        (describe_observability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeCustomDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_custom_domains_request ->
        (describe_custom_domains_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_auto_scaling_configuration_request ->
        (describe_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_ingress_connection_request ->
        (delete_vpc_ingress_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteVpcConnector : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_connector_request ->
        (delete_vpc_connector_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_request ->
        (delete_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteObservabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_observability_configuration_request ->
        (delete_observability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_request ->
        (delete_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_auto_scaling_configuration_request ->
        (delete_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateVpcIngressConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_ingress_connection_request ->
        (create_vpc_ingress_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
end

module CreateVpcConnector : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_connector_request ->
        (create_vpc_connector_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
end

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_request ->
        (create_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
end

module CreateObservabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_observability_configuration_request ->
        (create_observability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
end

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_request ->
        (create_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
end

module CreateAutoScalingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_auto_scaling_configuration_request ->
        (create_auto_scaling_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            
        ]
      ) result
end

module AssociateCustomDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_custom_domain_request ->
        (associate_custom_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceErrorException of internal_service_error_exception
            | `InvalidRequestException of invalid_request_exception
            | `InvalidStateException of invalid_state_exception
            
        ]
      ) result
end

