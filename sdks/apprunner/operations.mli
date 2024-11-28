open Types 
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
  (** 
    Associate your own domain name with the App Runner subdomain URL of your App Runner service.
    
     After you call [AssociateCustomDomain] and receive a successful response, use the information in the [CustomDomain] record that's returned to add CNAME records to your Domain Name System (DNS). For each mapped domain name, add a mapping to the target App Runner subdomain and one or more certificate validation records. App Runner then performs DNS validation to verify that you own or control the domain name that you associated. App Runner tracks domain validity in a certificate stored in {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate Manager (ACM)}.
      *)

  
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
  (** 
    Create an App Runner automatic scaling configuration resource. App Runner requires this resource when you create or update App Runner services and you require non-default auto scaling settings. You can share an auto scaling configuration across multiple services.
    
     Create multiple revisions of a configuration by calling this action multiple times using the same [AutoScalingConfigurationName]. The call returns incremental [AutoScalingConfigurationRevision] values. When you create a service and configure an auto scaling configuration resource, the service uses the latest active revision of the auto scaling configuration by default. You can optionally configure the service to use a specific revision.
     
      Configure a higher [MinSize] to increase the spread of your App Runner service over more Availability Zones in the Amazon Web Services Region. The tradeoff is a higher minimal cost.
      
       Configure a lower [MaxSize] to control your cost. The tradeoff is lower responsiveness during peak demand.
        *)

  
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
  (** 
    Create an App Runner connection resource. App Runner requires a connection resource when you create App Runner services that access private repositories from certain third-party providers. You can share a connection across multiple services.
    
     A connection resource is needed to access GitHub and Bitbucket repositories. Both require a user interface approval process through the App Runner console before you can use the connection.
      *)

  
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
  (** 
    Create an App Runner observability configuration resource. App Runner requires this resource when you create or update App Runner services and you want to enable non-default observability features. You can share an observability configuration across multiple services.
    
     Create multiple revisions of a configuration by calling this action multiple times using the same [ObservabilityConfigurationName]. The call returns incremental [ObservabilityConfigurationRevision] values. When you create a service and configure an observability configuration resource, the service uses the latest active revision of the observability configuration by default. You can optionally configure the service to use a specific revision.
     
      The observability configuration resource is designed to configure multiple features (currently one feature, tracing). This action takes optional parameters that describe the configuration of these features (currently one parameter, [TraceConfiguration]). If you don't specify a feature parameter, App Runner doesn't enable the feature.
       *)

  
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
  (** 
    Create an App Runner service. After the service is created, the action also automatically starts a deployment.
    
     This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html}ListOperations} call to track the operation's progress.
      *)

  
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
  (** 
    Create an App Runner VPC connector resource. App Runner requires this resource when you want to associate your App Runner service to a custom Amazon Virtual Private Cloud (Amazon VPC).
     *)

  
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
  (** 
    Create an App Runner VPC Ingress Connection resource. App Runner requires this resource when you want to associate your App Runner service with an Amazon VPC endpoint.
     *)

  
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
  (** 
    Delete an App Runner automatic scaling configuration resource. You can delete a top level auto scaling configuration, a specific revision of one, or all revisions associated with the top level configuration. You can't delete the default auto scaling configuration or a configuration that's used by one or more App Runner services.
     *)

  
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
  (** 
    Delete an App Runner connection. You must first ensure that there are no running App Runner services that use this connection. If there are any, the [DeleteConnection] action fails.
     *)

  
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
  (** 
    Delete an App Runner observability configuration resource. You can delete a specific revision or the latest active revision. You can't delete a configuration that's used by one or more App Runner services.
     *)

  
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
  (** 
    Delete an App Runner service.
    
     This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
     
      Make sure that you don't have any active VPCIngressConnections associated with the service you want to delete.
      
       *)

  
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
  (** 
    Delete an App Runner VPC connector resource. You can't delete a connector that's used by one or more App Runner services.
     *)

  
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
  (** 
    Delete an App Runner VPC Ingress Connection resource that's associated with an App Runner service. The VPC Ingress Connection must be in one of the following states to be deleted:
    
     {ul
          {- [AVAILABLE]
             
             }
           {- [FAILED_CREATION]
              
              }
           {- [FAILED_UPDATE]
              
              }
           {- [FAILED_DELETION]
              
              }
          
      }
       *)

  
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
  (** 
    Return a full description of an App Runner automatic scaling configuration resource.
     *)

  
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
  (** 
    Return a description of custom domain names that are associated with an App Runner service.
     *)

  
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
  (** 
    Return a full description of an App Runner observability configuration resource.
     *)

  
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
  (** 
    Return a full description of an App Runner service.
     *)

  
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
  (** 
    Return a description of an App Runner VPC connector resource.
     *)

  
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
  (** 
    Return a full description of an App Runner VPC Ingress Connection resource.
     *)

  
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
  (** 
    Disassociate a custom domain name from an App Runner service.
    
     Certificates tracking domain validity are associated with a custom domain and are stored in {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate Manager (ACM)}. These certificates aren't deleted as part of this action. App Runner delays certificate deletion for 30 days after a domain is disassociated from your service.
      *)

  
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
  (** 
    Returns a list of active App Runner automatic scaling configurations in your Amazon Web Services account. You can query the revisions for a specific configuration name or the revisions for all active configurations in your account. You can optionally query only the latest revision of each requested name.
    
     To retrieve a full description of a particular configuration revision, call and provide one of the ARNs returned by [ListAutoScalingConfigurations].
      *)

  
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
  (** 
    Returns a list of App Runner connections that are associated with your Amazon Web Services account.
     *)

  
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
  (** 
    Returns a list of active App Runner observability configurations in your Amazon Web Services account. You can query the revisions for a specific configuration name or the revisions for all active configurations in your account. You can optionally query only the latest revision of each requested name.
    
     To retrieve a full description of a particular configuration revision, call and provide one of the ARNs returned by [ListObservabilityConfigurations].
      *)

  
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
  (** 
    Return a list of operations that occurred on an App Runner service.
    
     The resulting list of [OperationSummary] objects is sorted in reverse chronological order. The first object on the list represents the last started operation.
      *)

  
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
  (** 
    Returns a list of running App Runner services in your Amazon Web Services account.
     *)

  
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
  (** 
    Returns a list of the associated App Runner services using an auto scaling configuration.
     *)

  
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
  (** 
    List tags that are associated with for an App Runner resource. The response contains a list of tag key-value pairs.
     *)

  
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
  (** 
    Returns a list of App Runner VPC connectors in your Amazon Web Services account.
     *)

  
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
  (** 
    Return a list of App Runner VPC Ingress Connections in your Amazon Web Services account.
     *)

  
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
  (** 
    Pause an active App Runner service. App Runner reduces compute capacity for the service to zero and loses state (for example, ephemeral storage is removed).
    
     This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
      *)

  
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
  (** 
    Resume an active App Runner service. App Runner provisions compute capacity for the service.
    
     This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
      *)

  
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
  (** 
    Initiate a manual deployment of the latest commit in a source code repository or the latest image in a source image repository to an App Runner service.
    
     For a source code repository, App Runner retrieves the commit and builds a Docker image. For a source image repository, App Runner retrieves the latest Docker image. In both cases, App Runner then deploys the new image to your service and starts a new container instance.
     
      This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
       *)

  
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
  (** 
    Add tags to, or update the tag values of, an App Runner resource. A tag is a key-value pair.
     *)

  
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
  (** 
    Remove tags from an App Runner resource.
     *)

  
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
  (** 
    Update an auto scaling configuration to be the default. The existing default auto scaling configuration will be set to non-default automatically.
     *)

  
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
  (** 
    Update an App Runner service. You can update the source configuration and instance configuration of the service. You can also update the ARN of the auto scaling configuration resource that's associated with the service. However, you can't change the name or the encryption configuration of the service. These can be set only when you create the service.
    
     To update the tags applied to your service, use the separate actions [TagResource] and [UntagResource].
     
      This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.
       *)

  
end

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
  (** 
    Update an existing App Runner VPC Ingress Connection resource. The VPC Ingress Connection must be in one of the following states to be updated:
    
     {ul
          {- AVAILABLE
             
             }
           {- FAILED_CREATION
              
              }
           {- FAILED_UPDATE
              
              }
          
      }
       *)

  
end

