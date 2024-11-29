open Types 
let (let+) res map = Result.map map res
module AllocateStaticIp = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: allocate_static_ip_request) ->
    let input = Serializers.allocate_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.AllocateStaticIp" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.allocate_static_ip_result_of_yojson
      ~error_deserializer
      
end

module AttachCertificateToDistribution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: attach_certificate_to_distribution_request) ->
    let input = Serializers.attach_certificate_to_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.AttachCertificateToDistribution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.attach_certificate_to_distribution_result_of_yojson
      ~error_deserializer
      
end

module AttachDisk = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: attach_disk_request) ->
    let input = Serializers.attach_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.AttachDisk" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.attach_disk_result_of_yojson
      ~error_deserializer
      
end

module AttachInstancesToLoadBalancer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: attach_instances_to_load_balancer_request) ->
    let input = Serializers.attach_instances_to_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.AttachInstancesToLoadBalancer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.attach_instances_to_load_balancer_result_of_yojson
      ~error_deserializer
      
end

module AttachLoadBalancerTlsCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: attach_load_balancer_tls_certificate_request) ->
    let input = Serializers.attach_load_balancer_tls_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.AttachLoadBalancerTlsCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.attach_load_balancer_tls_certificate_result_of_yojson
      ~error_deserializer
      
end

module AttachStaticIp = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: attach_static_ip_request) ->
    let input = Serializers.attach_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.AttachStaticIp" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.attach_static_ip_result_of_yojson
      ~error_deserializer
      
end

module CloseInstancePublicPorts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: close_instance_public_ports_request) ->
    let input = Serializers.close_instance_public_ports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CloseInstancePublicPorts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.close_instance_public_ports_result_of_yojson
      ~error_deserializer
      
end

module CopySnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: copy_snapshot_request) ->
    let input = Serializers.copy_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CopySnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.copy_snapshot_result_of_yojson
      ~error_deserializer
      
end

module CreateBucket = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_bucket_request) ->
    let input = Serializers.create_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateBucket" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_bucket_result_of_yojson
      ~error_deserializer
      
end

module CreateBucketAccessKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_bucket_access_key_request) ->
    let input = Serializers.create_bucket_access_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateBucketAccessKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_bucket_access_key_result_of_yojson
      ~error_deserializer
      
end

module CreateCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_certificate_request) ->
    let input = Serializers.create_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_certificate_result_of_yojson
      ~error_deserializer
      
end

module CreateCloudFormationStack = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_cloud_formation_stack_request) ->
    let input = Serializers.create_cloud_formation_stack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateCloudFormationStack" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_cloud_formation_stack_result_of_yojson
      ~error_deserializer
      
end

module CreateContactMethod = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_contact_method_request) ->
    let input = Serializers.create_contact_method_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateContactMethod" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_contact_method_result_of_yojson
      ~error_deserializer
      
end

module CreateContainerService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_container_service_request) ->
    let input = Serializers.create_container_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateContainerService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_container_service_result_of_yojson
      ~error_deserializer
      
end

module CreateContainerServiceDeployment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_container_service_deployment_request) ->
    let input = Serializers.create_container_service_deployment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateContainerServiceDeployment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_container_service_deployment_result_of_yojson
      ~error_deserializer
      
end

module CreateContainerServiceRegistryLogin = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_container_service_registry_login_request) ->
    let input = Serializers.create_container_service_registry_login_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateContainerServiceRegistryLogin" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_container_service_registry_login_result_of_yojson
      ~error_deserializer
      
end

module CreateDisk = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_disk_request) ->
    let input = Serializers.create_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateDisk" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_disk_result_of_yojson
      ~error_deserializer
      
end

module CreateDiskFromSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_disk_from_snapshot_request) ->
    let input = Serializers.create_disk_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateDiskFromSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_disk_from_snapshot_result_of_yojson
      ~error_deserializer
      
end

module CreateDiskSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_disk_snapshot_request) ->
    let input = Serializers.create_disk_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateDiskSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_disk_snapshot_result_of_yojson
      ~error_deserializer
      
end

module CreateDistribution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_distribution_request) ->
    let input = Serializers.create_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateDistribution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_distribution_result_of_yojson
      ~error_deserializer
      
end

module CreateDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_domain_request) ->
    let input = Serializers.create_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_domain_result_of_yojson
      ~error_deserializer
      
end

module CreateDomainEntry = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_domain_entry_request) ->
    let input = Serializers.create_domain_entry_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateDomainEntry" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_domain_entry_result_of_yojson
      ~error_deserializer
      
end

module CreateGUISessionAccessDetails = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_gui_session_access_details_request) ->
    let input = Serializers.create_gui_session_access_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateGUISessionAccessDetails" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_gui_session_access_details_result_of_yojson
      ~error_deserializer
      
end

module CreateInstances = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_instances_request) ->
    let input = Serializers.create_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateInstances" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_instances_result_of_yojson
      ~error_deserializer
      
end

module CreateInstancesFromSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_instances_from_snapshot_request) ->
    let input = Serializers.create_instances_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateInstancesFromSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_instances_from_snapshot_result_of_yojson
      ~error_deserializer
      
end

module CreateInstanceSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_instance_snapshot_request) ->
    let input = Serializers.create_instance_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateInstanceSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_instance_snapshot_result_of_yojson
      ~error_deserializer
      
end

module CreateKeyPair = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_key_pair_request) ->
    let input = Serializers.create_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateKeyPair" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_key_pair_result_of_yojson
      ~error_deserializer
      
end

module CreateLoadBalancer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_load_balancer_request) ->
    let input = Serializers.create_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateLoadBalancer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_load_balancer_result_of_yojson
      ~error_deserializer
      
end

module CreateLoadBalancerTlsCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_load_balancer_tls_certificate_request) ->
    let input = Serializers.create_load_balancer_tls_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateLoadBalancerTlsCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_load_balancer_tls_certificate_result_of_yojson
      ~error_deserializer
      
end

module CreateRelationalDatabase = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_relational_database_request) ->
    let input = Serializers.create_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateRelationalDatabase" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_relational_database_result_of_yojson
      ~error_deserializer
      
end

module CreateRelationalDatabaseFromSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_relational_database_from_snapshot_request) ->
    let input = Serializers.create_relational_database_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateRelationalDatabaseFromSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_relational_database_from_snapshot_result_of_yojson
      ~error_deserializer
      
end

module CreateRelationalDatabaseSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_relational_database_snapshot_request) ->
    let input = Serializers.create_relational_database_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.CreateRelationalDatabaseSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_relational_database_snapshot_result_of_yojson
      ~error_deserializer
      
end

module DeleteAlarm = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_alarm_request) ->
    let input = Serializers.delete_alarm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteAlarm" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_alarm_result_of_yojson
      ~error_deserializer
      
end

module DeleteAutoSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_auto_snapshot_request) ->
    let input = Serializers.delete_auto_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteAutoSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_auto_snapshot_result_of_yojson
      ~error_deserializer
      
end

module DeleteBucket = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_bucket_request) ->
    let input = Serializers.delete_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteBucket" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_bucket_result_of_yojson
      ~error_deserializer
      
end

module DeleteBucketAccessKey = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_bucket_access_key_request) ->
    let input = Serializers.delete_bucket_access_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteBucketAccessKey" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_bucket_access_key_result_of_yojson
      ~error_deserializer
      
end

module DeleteCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_certificate_request) ->
    let input = Serializers.delete_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_certificate_result_of_yojson
      ~error_deserializer
      
end

module DeleteContactMethod = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_contact_method_request) ->
    let input = Serializers.delete_contact_method_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteContactMethod" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_contact_method_result_of_yojson
      ~error_deserializer
      
end

module DeleteContainerImage = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_container_image_request) ->
    let input = Serializers.delete_container_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteContainerImage" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_container_image_result_of_yojson
      ~error_deserializer
      
end

module DeleteContainerService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_container_service_request) ->
    let input = Serializers.delete_container_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteContainerService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_container_service_result_of_yojson
      ~error_deserializer
      
end

module DeleteDisk = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_disk_request) ->
    let input = Serializers.delete_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteDisk" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_disk_result_of_yojson
      ~error_deserializer
      
end

module DeleteDiskSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_disk_snapshot_request) ->
    let input = Serializers.delete_disk_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteDiskSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_disk_snapshot_result_of_yojson
      ~error_deserializer
      
end

module DeleteDistribution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_distribution_request) ->
    let input = Serializers.delete_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteDistribution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_distribution_result_of_yojson
      ~error_deserializer
      
end

module DeleteDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_domain_request) ->
    let input = Serializers.delete_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_domain_result_of_yojson
      ~error_deserializer
      
end

module DeleteDomainEntry = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_domain_entry_request) ->
    let input = Serializers.delete_domain_entry_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteDomainEntry" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_domain_entry_result_of_yojson
      ~error_deserializer
      
end

module DeleteInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_instance_request) ->
    let input = Serializers.delete_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_instance_result_of_yojson
      ~error_deserializer
      
end

module DeleteInstanceSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_instance_snapshot_request) ->
    let input = Serializers.delete_instance_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteInstanceSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_instance_snapshot_result_of_yojson
      ~error_deserializer
      
end

module DeleteKeyPair = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_key_pair_request) ->
    let input = Serializers.delete_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteKeyPair" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_key_pair_result_of_yojson
      ~error_deserializer
      
end

module DeleteKnownHostKeys = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_known_host_keys_request) ->
    let input = Serializers.delete_known_host_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteKnownHostKeys" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_known_host_keys_result_of_yojson
      ~error_deserializer
      
end

module DeleteLoadBalancer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_load_balancer_request) ->
    let input = Serializers.delete_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteLoadBalancer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_load_balancer_result_of_yojson
      ~error_deserializer
      
end

module DeleteLoadBalancerTlsCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_load_balancer_tls_certificate_request) ->
    let input = Serializers.delete_load_balancer_tls_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteLoadBalancerTlsCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_load_balancer_tls_certificate_result_of_yojson
      ~error_deserializer
      
end

module DeleteRelationalDatabase = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_relational_database_request) ->
    let input = Serializers.delete_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteRelationalDatabase" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_relational_database_result_of_yojson
      ~error_deserializer
      
end

module DeleteRelationalDatabaseSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_relational_database_snapshot_request) ->
    let input = Serializers.delete_relational_database_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DeleteRelationalDatabaseSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_relational_database_snapshot_result_of_yojson
      ~error_deserializer
      
end

module DetachCertificateFromDistribution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: detach_certificate_from_distribution_request) ->
    let input = Serializers.detach_certificate_from_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DetachCertificateFromDistribution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.detach_certificate_from_distribution_result_of_yojson
      ~error_deserializer
      
end

module DetachDisk = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: detach_disk_request) ->
    let input = Serializers.detach_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DetachDisk" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.detach_disk_result_of_yojson
      ~error_deserializer
      
end

module DetachInstancesFromLoadBalancer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: detach_instances_from_load_balancer_request) ->
    let input = Serializers.detach_instances_from_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DetachInstancesFromLoadBalancer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.detach_instances_from_load_balancer_result_of_yojson
      ~error_deserializer
      
end

module DetachStaticIp = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: detach_static_ip_request) ->
    let input = Serializers.detach_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DetachStaticIp" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.detach_static_ip_result_of_yojson
      ~error_deserializer
      
end

module DisableAddOn = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_add_on_request) ->
    let input = Serializers.disable_add_on_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DisableAddOn" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disable_add_on_result_of_yojson
      ~error_deserializer
      
end

module DownloadDefaultKeyPair = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: download_default_key_pair_request) ->
    let input = Serializers.download_default_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.DownloadDefaultKeyPair" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.download_default_key_pair_result_of_yojson
      ~error_deserializer
      
end

module EnableAddOn = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_add_on_request) ->
    let input = Serializers.enable_add_on_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.EnableAddOn" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enable_add_on_result_of_yojson
      ~error_deserializer
      
end

module ExportSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: export_snapshot_request) ->
    let input = Serializers.export_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.ExportSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.export_snapshot_result_of_yojson
      ~error_deserializer
      
end

module GetActiveNames = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_active_names_request) ->
    let input = Serializers.get_active_names_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetActiveNames" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_active_names_result_of_yojson
      ~error_deserializer
      
end

module GetAlarms = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_alarms_request) ->
    let input = Serializers.get_alarms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetAlarms" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_alarms_result_of_yojson
      ~error_deserializer
      
end

module GetAutoSnapshots = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_auto_snapshots_request) ->
    let input = Serializers.get_auto_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetAutoSnapshots" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_auto_snapshots_result_of_yojson
      ~error_deserializer
      
end

module GetBlueprints = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_blueprints_request) ->
    let input = Serializers.get_blueprints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetBlueprints" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_blueprints_result_of_yojson
      ~error_deserializer
      
end

module GetBucketAccessKeys = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_bucket_access_keys_request) ->
    let input = Serializers.get_bucket_access_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetBucketAccessKeys" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_bucket_access_keys_result_of_yojson
      ~error_deserializer
      
end

module GetBucketBundles = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_bucket_bundles_request) ->
    let input = Serializers.get_bucket_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetBucketBundles" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_bucket_bundles_result_of_yojson
      ~error_deserializer
      
end

module GetBucketMetricData = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_bucket_metric_data_request) ->
    let input = Serializers.get_bucket_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetBucketMetricData" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_bucket_metric_data_result_of_yojson
      ~error_deserializer
      
end

module GetBuckets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_buckets_request) ->
    let input = Serializers.get_buckets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetBuckets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_buckets_result_of_yojson
      ~error_deserializer
      
end

module GetBundles = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_bundles_request) ->
    let input = Serializers.get_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetBundles" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_bundles_result_of_yojson
      ~error_deserializer
      
end

module GetCertificates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_certificates_request) ->
    let input = Serializers.get_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetCertificates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_certificates_result_of_yojson
      ~error_deserializer
      
end

module GetCloudFormationStackRecords = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_cloud_formation_stack_records_request) ->
    let input = Serializers.get_cloud_formation_stack_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetCloudFormationStackRecords" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_cloud_formation_stack_records_result_of_yojson
      ~error_deserializer
      
end

module GetContactMethods = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_contact_methods_request) ->
    let input = Serializers.get_contact_methods_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetContactMethods" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_contact_methods_result_of_yojson
      ~error_deserializer
      
end

module GetContainerAPIMetadata = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_container_api_metadata_request) ->
    let input = Serializers.get_container_api_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetContainerAPIMetadata" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_container_api_metadata_result_of_yojson
      ~error_deserializer
      
end

module GetContainerImages = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_container_images_request) ->
    let input = Serializers.get_container_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetContainerImages" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_container_images_result_of_yojson
      ~error_deserializer
      
end

module GetContainerLog = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_container_log_request) ->
    let input = Serializers.get_container_log_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetContainerLog" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_container_log_result_of_yojson
      ~error_deserializer
      
end

module GetContainerServiceDeployments = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_container_service_deployments_request) ->
    let input = Serializers.get_container_service_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetContainerServiceDeployments" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_container_service_deployments_result_of_yojson
      ~error_deserializer
      
end

module GetContainerServiceMetricData = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_container_service_metric_data_request) ->
    let input = Serializers.get_container_service_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetContainerServiceMetricData" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_container_service_metric_data_result_of_yojson
      ~error_deserializer
      
end

module GetContainerServicePowers = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_container_service_powers_request) ->
    let input = Serializers.get_container_service_powers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetContainerServicePowers" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_container_service_powers_result_of_yojson
      ~error_deserializer
      
end

module GetContainerServices = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_container_services_request) ->
    let input = Serializers.get_container_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetContainerServices" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.container_services_list_result_of_yojson
      ~error_deserializer
      
end

module GetCostEstimate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_cost_estimate_request) ->
    let input = Serializers.get_cost_estimate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetCostEstimate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_cost_estimate_result_of_yojson
      ~error_deserializer
      
end

module GetDisk = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_disk_request) ->
    let input = Serializers.get_disk_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDisk" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_disk_result_of_yojson
      ~error_deserializer
      
end

module GetDisks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_disks_request) ->
    let input = Serializers.get_disks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDisks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_disks_result_of_yojson
      ~error_deserializer
      
end

module GetDiskSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_disk_snapshot_request) ->
    let input = Serializers.get_disk_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDiskSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_disk_snapshot_result_of_yojson
      ~error_deserializer
      
end

module GetDiskSnapshots = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_disk_snapshots_request) ->
    let input = Serializers.get_disk_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDiskSnapshots" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_disk_snapshots_result_of_yojson
      ~error_deserializer
      
end

module GetDistributionBundles = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_distribution_bundles_request) ->
    let input = Serializers.get_distribution_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDistributionBundles" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_distribution_bundles_result_of_yojson
      ~error_deserializer
      
end

module GetDistributionLatestCacheReset = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_distribution_latest_cache_reset_request) ->
    let input = Serializers.get_distribution_latest_cache_reset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDistributionLatestCacheReset" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_distribution_latest_cache_reset_result_of_yojson
      ~error_deserializer
      
end

module GetDistributionMetricData = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_distribution_metric_data_request) ->
    let input = Serializers.get_distribution_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDistributionMetricData" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_distribution_metric_data_result_of_yojson
      ~error_deserializer
      
end

module GetDistributions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_distributions_request) ->
    let input = Serializers.get_distributions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDistributions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_distributions_result_of_yojson
      ~error_deserializer
      
end

module GetDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_domain_request) ->
    let input = Serializers.get_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_domain_result_of_yojson
      ~error_deserializer
      
end

module GetDomains = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_domains_request) ->
    let input = Serializers.get_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetDomains" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_domains_result_of_yojson
      ~error_deserializer
      
end

module GetExportSnapshotRecords = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_export_snapshot_records_request) ->
    let input = Serializers.get_export_snapshot_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetExportSnapshotRecords" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_export_snapshot_records_result_of_yojson
      ~error_deserializer
      
end

module GetInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instance_request) ->
    let input = Serializers.get_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instance_result_of_yojson
      ~error_deserializer
      
end

module GetInstanceAccessDetails = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instance_access_details_request) ->
    let input = Serializers.get_instance_access_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetInstanceAccessDetails" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instance_access_details_result_of_yojson
      ~error_deserializer
      
end

module GetInstanceMetricData = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instance_metric_data_request) ->
    let input = Serializers.get_instance_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetInstanceMetricData" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instance_metric_data_result_of_yojson
      ~error_deserializer
      
end

module GetInstancePortStates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instance_port_states_request) ->
    let input = Serializers.get_instance_port_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetInstancePortStates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instance_port_states_result_of_yojson
      ~error_deserializer
      
end

module GetInstances = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instances_request) ->
    let input = Serializers.get_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetInstances" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instances_result_of_yojson
      ~error_deserializer
      
end

module GetInstanceSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instance_snapshot_request) ->
    let input = Serializers.get_instance_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetInstanceSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instance_snapshot_result_of_yojson
      ~error_deserializer
      
end

module GetInstanceSnapshots = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instance_snapshots_request) ->
    let input = Serializers.get_instance_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetInstanceSnapshots" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instance_snapshots_result_of_yojson
      ~error_deserializer
      
end

module GetInstanceState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_instance_state_request) ->
    let input = Serializers.get_instance_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetInstanceState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_instance_state_result_of_yojson
      ~error_deserializer
      
end

module GetKeyPair = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_key_pair_request) ->
    let input = Serializers.get_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetKeyPair" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_key_pair_result_of_yojson
      ~error_deserializer
      
end

module GetKeyPairs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_key_pairs_request) ->
    let input = Serializers.get_key_pairs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetKeyPairs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_key_pairs_result_of_yojson
      ~error_deserializer
      
end

module GetLoadBalancer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_load_balancer_request) ->
    let input = Serializers.get_load_balancer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetLoadBalancer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_load_balancer_result_of_yojson
      ~error_deserializer
      
end

module GetLoadBalancerMetricData = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_load_balancer_metric_data_request) ->
    let input = Serializers.get_load_balancer_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetLoadBalancerMetricData" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_load_balancer_metric_data_result_of_yojson
      ~error_deserializer
      
end

module GetLoadBalancers = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_load_balancers_request) ->
    let input = Serializers.get_load_balancers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetLoadBalancers" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_load_balancers_result_of_yojson
      ~error_deserializer
      
end

module GetLoadBalancerTlsCertificates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_load_balancer_tls_certificates_request) ->
    let input = Serializers.get_load_balancer_tls_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetLoadBalancerTlsCertificates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_load_balancer_tls_certificates_result_of_yojson
      ~error_deserializer
      
end

module GetLoadBalancerTlsPolicies = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_load_balancer_tls_policies_request) ->
    let input = Serializers.get_load_balancer_tls_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetLoadBalancerTlsPolicies" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_load_balancer_tls_policies_result_of_yojson
      ~error_deserializer
      
end

module GetOperation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_operation_request) ->
    let input = Serializers.get_operation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetOperation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_operation_result_of_yojson
      ~error_deserializer
      
end

module GetOperations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_operations_request) ->
    let input = Serializers.get_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetOperations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_operations_result_of_yojson
      ~error_deserializer
      
end

module GetOperationsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_operations_for_resource_request) ->
    let input = Serializers.get_operations_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetOperationsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_operations_for_resource_result_of_yojson
      ~error_deserializer
      
end

module GetRegions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_regions_request) ->
    let input = Serializers.get_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRegions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_regions_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabase = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_request) ->
    let input = Serializers.get_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabase" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseBlueprints = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_blueprints_request) ->
    let input = Serializers.get_relational_database_blueprints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseBlueprints" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_blueprints_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseBundles = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_bundles_request) ->
    let input = Serializers.get_relational_database_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseBundles" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_bundles_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseEvents = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_events_request) ->
    let input = Serializers.get_relational_database_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseEvents" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_events_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseLogEvents = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_log_events_request) ->
    let input = Serializers.get_relational_database_log_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseLogEvents" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_log_events_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseLogStreams = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_log_streams_request) ->
    let input = Serializers.get_relational_database_log_streams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseLogStreams" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_log_streams_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseMasterUserPassword = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_master_user_password_request) ->
    let input = Serializers.get_relational_database_master_user_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseMasterUserPassword" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_master_user_password_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseMetricData = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_metric_data_request) ->
    let input = Serializers.get_relational_database_metric_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseMetricData" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_metric_data_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseParameters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_parameters_request) ->
    let input = Serializers.get_relational_database_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseParameters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_parameters_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabases = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_databases_request) ->
    let input = Serializers.get_relational_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabases" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_databases_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_snapshot_request) ->
    let input = Serializers.get_relational_database_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_snapshot_result_of_yojson
      ~error_deserializer
      
end

module GetRelationalDatabaseSnapshots = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_relational_database_snapshots_request) ->
    let input = Serializers.get_relational_database_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetRelationalDatabaseSnapshots" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_relational_database_snapshots_result_of_yojson
      ~error_deserializer
      
end

module GetSetupHistory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_setup_history_request) ->
    let input = Serializers.get_setup_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetSetupHistory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_setup_history_result_of_yojson
      ~error_deserializer
      
end

module GetStaticIp = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_static_ip_request) ->
    let input = Serializers.get_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetStaticIp" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_static_ip_result_of_yojson
      ~error_deserializer
      
end

module GetStaticIps = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_static_ips_request) ->
    let input = Serializers.get_static_ips_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.GetStaticIps" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_static_ips_result_of_yojson
      ~error_deserializer
      
end

module ImportKeyPair = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: import_key_pair_request) ->
    let input = Serializers.import_key_pair_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.ImportKeyPair" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.import_key_pair_result_of_yojson
      ~error_deserializer
      
end

module IsVpcPeered = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: is_vpc_peered_request) ->
    let input = Serializers.is_vpc_peered_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.IsVpcPeered" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.is_vpc_peered_result_of_yojson
      ~error_deserializer
      
end

module OpenInstancePublicPorts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: open_instance_public_ports_request) ->
    let input = Serializers.open_instance_public_ports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.OpenInstancePublicPorts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.open_instance_public_ports_result_of_yojson
      ~error_deserializer
      
end

module PeerVpc = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: peer_vpc_request) ->
    let input = Serializers.peer_vpc_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.PeerVpc" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.peer_vpc_result_of_yojson
      ~error_deserializer
      
end

module PutAlarm = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_alarm_request) ->
    let input = Serializers.put_alarm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.PutAlarm" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_alarm_result_of_yojson
      ~error_deserializer
      
end

module PutInstancePublicPorts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_instance_public_ports_request) ->
    let input = Serializers.put_instance_public_ports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.PutInstancePublicPorts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_instance_public_ports_result_of_yojson
      ~error_deserializer
      
end

module RebootInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: reboot_instance_request) ->
    let input = Serializers.reboot_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.RebootInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.reboot_instance_result_of_yojson
      ~error_deserializer
      
end

module RebootRelationalDatabase = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: reboot_relational_database_request) ->
    let input = Serializers.reboot_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.RebootRelationalDatabase" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.reboot_relational_database_result_of_yojson
      ~error_deserializer
      
end

module RegisterContainerImage = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_container_image_request) ->
    let input = Serializers.register_container_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.RegisterContainerImage" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_container_image_result_of_yojson
      ~error_deserializer
      
end

module ReleaseStaticIp = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: release_static_ip_request) ->
    let input = Serializers.release_static_ip_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.ReleaseStaticIp" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.release_static_ip_result_of_yojson
      ~error_deserializer
      
end

module ResetDistributionCache = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: reset_distribution_cache_request) ->
    let input = Serializers.reset_distribution_cache_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.ResetDistributionCache" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.reset_distribution_cache_result_of_yojson
      ~error_deserializer
      
end

module SendContactMethodVerification = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: send_contact_method_verification_request) ->
    let input = Serializers.send_contact_method_verification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.SendContactMethodVerification" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.send_contact_method_verification_result_of_yojson
      ~error_deserializer
      
end

module SetIpAddressType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: set_ip_address_type_request) ->
    let input = Serializers.set_ip_address_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.SetIpAddressType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.set_ip_address_type_result_of_yojson
      ~error_deserializer
      
end

module SetResourceAccessForBucket = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: set_resource_access_for_bucket_request) ->
    let input = Serializers.set_resource_access_for_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.SetResourceAccessForBucket" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.set_resource_access_for_bucket_result_of_yojson
      ~error_deserializer
      
end

module SetupInstanceHttps = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: setup_instance_https_request) ->
    let input = Serializers.setup_instance_https_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.SetupInstanceHttps" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.setup_instance_https_result_of_yojson
      ~error_deserializer
      
end

module StartGUISession = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_gui_session_request) ->
    let input = Serializers.start_gui_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.StartGUISession" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_gui_session_result_of_yojson
      ~error_deserializer
      
end

module StartInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_instance_request) ->
    let input = Serializers.start_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.StartInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_instance_result_of_yojson
      ~error_deserializer
      
end

module StartRelationalDatabase = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_relational_database_request) ->
    let input = Serializers.start_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.StartRelationalDatabase" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_relational_database_result_of_yojson
      ~error_deserializer
      
end

module StopGUISession = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_gui_session_request) ->
    let input = Serializers.stop_gui_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.StopGUISession" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.stop_gui_session_result_of_yojson
      ~error_deserializer
      
end

module StopInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_instance_request) ->
    let input = Serializers.stop_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.StopInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.stop_instance_result_of_yojson
      ~error_deserializer
      
end

module StopRelationalDatabase = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_relational_database_request) ->
    let input = Serializers.stop_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.StopRelationalDatabase" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.stop_relational_database_result_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_result_of_yojson
      ~error_deserializer
      
end

module TestAlarm = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: test_alarm_request) ->
    let input = Serializers.test_alarm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.TestAlarm" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.test_alarm_result_of_yojson
      ~error_deserializer
      
end

module UnpeerVpc = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: unpeer_vpc_request) ->
    let input = Serializers.unpeer_vpc_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UnpeerVpc" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.unpeer_vpc_result_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_result_of_yojson
      ~error_deserializer
      
end

module UpdateBucket = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_bucket_request) ->
    let input = Serializers.update_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateBucket" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_bucket_result_of_yojson
      ~error_deserializer
      
end

module UpdateBucketBundle = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_bucket_bundle_request) ->
    let input = Serializers.update_bucket_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateBucketBundle" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_bucket_bundle_result_of_yojson
      ~error_deserializer
      
end

module UpdateContainerService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_container_service_request) ->
    let input = Serializers.update_container_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateContainerService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_container_service_result_of_yojson
      ~error_deserializer
      
end

module UpdateDistribution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_distribution_request) ->
    let input = Serializers.update_distribution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateDistribution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_distribution_result_of_yojson
      ~error_deserializer
      
end

module UpdateDistributionBundle = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_distribution_bundle_request) ->
    let input = Serializers.update_distribution_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateDistributionBundle" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_distribution_bundle_result_of_yojson
      ~error_deserializer
      
end

module UpdateDomainEntry = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_domain_entry_request) ->
    let input = Serializers.update_domain_entry_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateDomainEntry" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_domain_entry_result_of_yojson
      ~error_deserializer
      
end

module UpdateInstanceMetadataOptions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_instance_metadata_options_request) ->
    let input = Serializers.update_instance_metadata_options_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateInstanceMetadataOptions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_instance_metadata_options_result_of_yojson
      ~error_deserializer
      
end

module UpdateLoadBalancerAttribute = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_load_balancer_attribute_request) ->
    let input = Serializers.update_load_balancer_attribute_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateLoadBalancerAttribute" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_load_balancer_attribute_result_of_yojson
      ~error_deserializer
      
end

module UpdateRelationalDatabase = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_relational_database_request) ->
    let input = Serializers.update_relational_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateRelationalDatabase" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_relational_database_result_of_yojson
      ~error_deserializer
      
end

module UpdateRelationalDatabaseParameters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.lightsail", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "AccountSetupInProgressException" ->
         (`AccountSetupInProgressException (account_setup_in_progress_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "NotFoundException" ->
         (`NotFoundException (not_found_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "OperationFailureException" ->
         (`OperationFailureException (operation_failure_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.lightsail", "UnauthenticatedException" ->
         (`UnauthenticatedException (unauthenticated_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_relational_database_parameters_request) ->
    let input = Serializers.update_relational_database_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Lightsail_20161128.UpdateRelationalDatabaseParameters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_relational_database_parameters_result_of_yojson
      ~error_deserializer
      
end

