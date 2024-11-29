open Types 
let (let+) res map = Result.map map res
module AssociateCreatedArtifact = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_created_artifact_request) ->
    let input = Serializers.associate_created_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.AssociateCreatedArtifact" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_created_artifact_result_of_yojson
      ~error_deserializer
      
end

module AssociateDiscoveredResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "PolicyErrorException" ->
         (`PolicyErrorException (policy_error_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_discovered_resource_request) ->
    let input = Serializers.associate_discovered_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.AssociateDiscoveredResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_discovered_resource_result_of_yojson
      ~error_deserializer
      
end

module CreateProgressUpdateStream = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_progress_update_stream_request) ->
    let input = Serializers.create_progress_update_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.CreateProgressUpdateStream" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_progress_update_stream_result_of_yojson
      ~error_deserializer
      
end

module DeleteProgressUpdateStream = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_progress_update_stream_request) ->
    let input = Serializers.delete_progress_update_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.DeleteProgressUpdateStream" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_progress_update_stream_result_of_yojson
      ~error_deserializer
      
end

module DescribeApplicationState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "PolicyErrorException" ->
         (`PolicyErrorException (policy_error_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_application_state_request) ->
    let input = Serializers.describe_application_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.DescribeApplicationState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_application_state_result_of_yojson
      ~error_deserializer
      
end

module DescribeMigrationTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_migration_task_request) ->
    let input = Serializers.describe_migration_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.DescribeMigrationTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_migration_task_result_of_yojson
      ~error_deserializer
      
end

module DisassociateCreatedArtifact = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_created_artifact_request) ->
    let input = Serializers.disassociate_created_artifact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.DisassociateCreatedArtifact" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_created_artifact_result_of_yojson
      ~error_deserializer
      
end

module DisassociateDiscoveredResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_discovered_resource_request) ->
    let input = Serializers.disassociate_discovered_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.DisassociateDiscoveredResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_discovered_resource_result_of_yojson
      ~error_deserializer
      
end

module ImportMigrationTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: import_migration_task_request) ->
    let input = Serializers.import_migration_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.ImportMigrationTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.import_migration_task_result_of_yojson
      ~error_deserializer
      
end

module ListApplicationStates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_application_states_request) ->
    let input = Serializers.list_application_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.ListApplicationStates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_application_states_result_of_yojson
      ~error_deserializer
      
end

module ListCreatedArtifacts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_created_artifacts_request) ->
    let input = Serializers.list_created_artifacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.ListCreatedArtifacts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_created_artifacts_result_of_yojson
      ~error_deserializer
      
end

module ListDiscoveredResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_discovered_resources_request) ->
    let input = Serializers.list_discovered_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.ListDiscoveredResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_discovered_resources_result_of_yojson
      ~error_deserializer
      
end

module ListMigrationTasks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "PolicyErrorException" ->
         (`PolicyErrorException (policy_error_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_migration_tasks_request) ->
    let input = Serializers.list_migration_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.ListMigrationTasks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_migration_tasks_result_of_yojson
      ~error_deserializer
      
end

module ListProgressUpdateStreams = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_progress_update_streams_request) ->
    let input = Serializers.list_progress_update_streams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.ListProgressUpdateStreams" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_progress_update_streams_result_of_yojson
      ~error_deserializer
      
end

module NotifyApplicationState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "PolicyErrorException" ->
         (`PolicyErrorException (policy_error_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: notify_application_state_request) ->
    let input = Serializers.notify_application_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.NotifyApplicationState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.notify_application_state_result_of_yojson
      ~error_deserializer
      
end

module NotifyMigrationTaskState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: notify_migration_task_state_request) ->
    let input = Serializers.notify_migration_task_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.NotifyMigrationTaskState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.notify_migration_task_state_result_of_yojson
      ~error_deserializer
      
end

module PutResourceAttributes = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.migrationhub", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "DryRunOperation" ->
         (`DryRunOperation (dry_run_operation_of_yojson tree path))
      | "com.amazonaws.migrationhub", "HomeRegionNotSetException" ->
         (`HomeRegionNotSetException (home_region_not_set_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.migrationhub", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ServiceUnavailableException" ->
         (`ServiceUnavailableException (service_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.migrationhub", "UnauthorizedOperation" ->
         (`UnauthorizedOperation (unauthorized_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_resource_attributes_request) ->
    let input = Serializers.put_resource_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSMigrationHub.PutResourceAttributes" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_resource_attributes_result_of_yojson
      ~error_deserializer
      
end

