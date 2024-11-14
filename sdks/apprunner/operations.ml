open Types 
let (let+) res map = Result.map map res
module UpdateVpcIngressConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_vpc_ingress_connection_request) ->
    let input = Serializers.update_vpc_ingress_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.UpdateVpcIngressConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_vpc_ingress_connection_response_of_yojson
      ~error_deserializer
      
end

module UpdateService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_request) ->
    let input = Serializers.update_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.UpdateService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_response_of_yojson
      ~error_deserializer
      
end

module UpdateDefaultAutoScalingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_default_auto_scaling_configuration_request) ->
    let input = Serializers.update_default_auto_scaling_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.UpdateDefaultAutoScalingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_default_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module StartDeployment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_deployment_request) ->
    let input = Serializers.start_deployment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.StartDeployment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_deployment_response_of_yojson
      ~error_deserializer
      
end

module ResumeService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: resume_service_request) ->
    let input = Serializers.resume_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ResumeService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.resume_service_response_of_yojson
      ~error_deserializer
      
end

module PauseService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: pause_service_request) ->
    let input = Serializers.pause_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.PauseService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.pause_service_response_of_yojson
      ~error_deserializer
      
end

module ListVpcIngressConnections = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_vpc_ingress_connections_request) ->
    let input = Serializers.list_vpc_ingress_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ListVpcIngressConnections" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_vpc_ingress_connections_response_of_yojson
      ~error_deserializer
      
end

module ListVpcConnectors = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_vpc_connectors_request) ->
    let input = Serializers.list_vpc_connectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ListVpcConnectors" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_vpc_connectors_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListServicesForAutoScalingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_services_for_auto_scaling_configuration_request) ->
    let input = Serializers.list_services_for_auto_scaling_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ListServicesForAutoScalingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_services_for_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
      
end

module ListServices = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_services_request) ->
    let input = Serializers.list_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ListServices" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_services_response_of_yojson
      ~error_deserializer
      
end

module ListOperations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_operations_request) ->
    let input = Serializers.list_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ListOperations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_operations_response_of_yojson
      ~error_deserializer
      
end

module ListObservabilityConfigurations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_observability_configurations_request) ->
    let input = Serializers.list_observability_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ListObservabilityConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_observability_configurations_response_of_yojson
      ~error_deserializer
      
end

module ListConnections = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_connections_request) ->
    let input = Serializers.list_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ListConnections" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_connections_response_of_yojson
      ~error_deserializer
      
end

module ListAutoScalingConfigurations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_auto_scaling_configurations_request) ->
    let input = Serializers.list_auto_scaling_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.ListAutoScalingConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_auto_scaling_configurations_response_of_yojson
      ~error_deserializer
      
end

module DisassociateCustomDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_custom_domain_request) ->
    let input = Serializers.disassociate_custom_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DisassociateCustomDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_custom_domain_response_of_yojson
      ~error_deserializer
      
end

module DescribeVpcIngressConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_vpc_ingress_connection_request) ->
    let input = Serializers.describe_vpc_ingress_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DescribeVpcIngressConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_vpc_ingress_connection_response_of_yojson
      ~error_deserializer
      
end

module DescribeVpcConnector = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_vpc_connector_request) ->
    let input = Serializers.describe_vpc_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DescribeVpcConnector" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_vpc_connector_response_of_yojson
      ~error_deserializer
      
end

module DescribeService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_service_request) ->
    let input = Serializers.describe_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DescribeService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_service_response_of_yojson
      ~error_deserializer
      
end

module DescribeObservabilityConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_observability_configuration_request) ->
    let input = Serializers.describe_observability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DescribeObservabilityConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_observability_configuration_response_of_yojson
      ~error_deserializer
      
end

module DescribeCustomDomains = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_custom_domains_request) ->
    let input = Serializers.describe_custom_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DescribeCustomDomains" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_custom_domains_response_of_yojson
      ~error_deserializer
      
end

module DescribeAutoScalingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_auto_scaling_configuration_request) ->
    let input = Serializers.describe_auto_scaling_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DescribeAutoScalingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
      
end

module DeleteVpcIngressConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_vpc_ingress_connection_request) ->
    let input = Serializers.delete_vpc_ingress_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DeleteVpcIngressConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_vpc_ingress_connection_response_of_yojson
      ~error_deserializer
      
end

module DeleteVpcConnector = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_vpc_connector_request) ->
    let input = Serializers.delete_vpc_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DeleteVpcConnector" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_vpc_connector_response_of_yojson
      ~error_deserializer
      
end

module DeleteService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_service_request) ->
    let input = Serializers.delete_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DeleteService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_service_response_of_yojson
      ~error_deserializer
      
end

module DeleteObservabilityConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_observability_configuration_request) ->
    let input = Serializers.delete_observability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DeleteObservabilityConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_observability_configuration_response_of_yojson
      ~error_deserializer
      
end

module DeleteConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_connection_request) ->
    let input = Serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DeleteConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_connection_response_of_yojson
      ~error_deserializer
      
end

module DeleteAutoScalingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_auto_scaling_configuration_request) ->
    let input = Serializers.delete_auto_scaling_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.DeleteAutoScalingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
      
end

module CreateVpcIngressConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_vpc_ingress_connection_request) ->
    let input = Serializers.create_vpc_ingress_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.CreateVpcIngressConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_vpc_ingress_connection_response_of_yojson
      ~error_deserializer
      
end

module CreateVpcConnector = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_vpc_connector_request) ->
    let input = Serializers.create_vpc_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.CreateVpcConnector" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_vpc_connector_response_of_yojson
      ~error_deserializer
      
end

module CreateService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_service_request) ->
    let input = Serializers.create_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.CreateService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_service_response_of_yojson
      ~error_deserializer
      
end

module CreateObservabilityConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_observability_configuration_request) ->
    let input = Serializers.create_observability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.CreateObservabilityConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_observability_configuration_response_of_yojson
      ~error_deserializer
      
end

module CreateConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_connection_request) ->
    let input = Serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.CreateConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_connection_response_of_yojson
      ~error_deserializer
      
end

module CreateAutoScalingConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_auto_scaling_configuration_request) ->
    let input = Serializers.create_auto_scaling_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.CreateAutoScalingConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
      
end

module AssociateCustomDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.apprunner", "InternalServiceErrorException" ->
         (`InternalServiceErrorException (internal_service_error_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidRequestException" ->
         (`InvalidRequestException (invalid_request_exception_of_yojson tree path))
      | "com.amazonaws.apprunner", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_custom_domain_request) ->
    let input = Serializers.associate_custom_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AppRunner.AssociateCustomDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_custom_domain_response_of_yojson
      ~error_deserializer
      
end

