open Types 
let (let+) res map = Result.map map res
module UpdateSyncConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "UpdateOutOfSyncException" ->
         (`UpdateOutOfSyncException (update_out_of_sync_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_sync_configuration_input) ->
    let input = Serializers.update_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.UpdateSyncConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_sync_configuration_output_of_yojson
      ~error_deserializer
      
end

module UpdateSyncBlocker = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "RetryLatestCommitFailedException" ->
         (`RetryLatestCommitFailedException (retry_latest_commit_failed_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "SyncBlockerDoesNotExistException" ->
         (`SyncBlockerDoesNotExistException (sync_blocker_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_sync_blocker_input) ->
    let input = Serializers.update_sync_blocker_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.UpdateSyncBlocker" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_sync_blocker_output_of_yojson
      ~error_deserializer
      
end

module UpdateRepositoryLink = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ConditionalCheckFailedException" ->
         (`ConditionalCheckFailedException (conditional_check_failed_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "UpdateOutOfSyncException" ->
         (`UpdateOutOfSyncException (update_out_of_sync_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_repository_link_input) ->
    let input = Serializers.update_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.UpdateRepositoryLink" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_repository_link_output_of_yojson
      ~error_deserializer
      
end

module UpdateHost = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceUnavailableException" ->
         (`ResourceUnavailableException (resource_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_host_input) ->
    let input = Serializers.update_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.UpdateHost" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_host_output_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_input) ->
    let input = Serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_output_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_input) ->
    let input = Serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_output_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_input) ->
    let input = Serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
      
end

module ListSyncConfigurations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_sync_configurations_input) ->
    let input = Serializers.list_sync_configurations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.ListSyncConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_sync_configurations_output_of_yojson
      ~error_deserializer
      
end

module ListRepositorySyncDefinitions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_repository_sync_definitions_input) ->
    let input = Serializers.list_repository_sync_definitions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.ListRepositorySyncDefinitions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_repository_sync_definitions_output_of_yojson
      ~error_deserializer
      
end

module ListRepositoryLinks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_repository_links_input) ->
    let input = Serializers.list_repository_links_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.ListRepositoryLinks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_repository_links_output_of_yojson
      ~error_deserializer
      
end

module ListHosts = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_hosts_input) ->
    let input = Serializers.list_hosts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.ListHosts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_hosts_output_of_yojson
      ~error_deserializer
      
end

module ListConnections = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_connections_input) ->
    let input = Serializers.list_connections_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.ListConnections" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_connections_output_of_yojson
      ~error_deserializer
      
end

module GetSyncConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_sync_configuration_input) ->
    let input = Serializers.get_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.GetSyncConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_sync_configuration_output_of_yojson
      ~error_deserializer
      
end

module GetSyncBlockerSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_sync_blocker_summary_input) ->
    let input = Serializers.get_sync_blocker_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.GetSyncBlockerSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_sync_blocker_summary_output_of_yojson
      ~error_deserializer
      
end

module GetResourceSyncStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_sync_status_input) ->
    let input = Serializers.get_resource_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.GetResourceSyncStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_sync_status_output_of_yojson
      ~error_deserializer
      
end

module GetRepositorySyncStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_repository_sync_status_input) ->
    let input = Serializers.get_repository_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.GetRepositorySyncStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_repository_sync_status_output_of_yojson
      ~error_deserializer
      
end

module GetRepositoryLink = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_repository_link_input) ->
    let input = Serializers.get_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.GetRepositoryLink" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_repository_link_output_of_yojson
      ~error_deserializer
      
end

module GetHost = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceUnavailableException" ->
         (`ResourceUnavailableException (resource_unavailable_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_host_input) ->
    let input = Serializers.get_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.GetHost" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_host_output_of_yojson
      ~error_deserializer
      
end

module GetConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceUnavailableException" ->
         (`ResourceUnavailableException (resource_unavailable_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_connection_input) ->
    let input = Serializers.get_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.GetConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_connection_output_of_yojson
      ~error_deserializer
      
end

module DeleteSyncConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_sync_configuration_input) ->
    let input = Serializers.delete_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.DeleteSyncConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_sync_configuration_output_of_yojson
      ~error_deserializer
      
end

module DeleteRepositoryLink = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "SyncConfigurationStillExistsException" ->
         (`SyncConfigurationStillExistsException (sync_configuration_still_exists_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "UnsupportedProviderTypeException" ->
         (`UnsupportedProviderTypeException (unsupported_provider_type_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_repository_link_input) ->
    let input = Serializers.delete_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.DeleteRepositoryLink" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_repository_link_output_of_yojson
      ~error_deserializer
      
end

module DeleteHost = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceUnavailableException" ->
         (`ResourceUnavailableException (resource_unavailable_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_host_input) ->
    let input = Serializers.delete_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.DeleteHost" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_host_output_of_yojson
      ~error_deserializer
      
end

module DeleteConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_connection_input) ->
    let input = Serializers.delete_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.DeleteConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_connection_output_of_yojson
      ~error_deserializer
      
end

module CreateSyncConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_sync_configuration_input) ->
    let input = Serializers.create_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.CreateSyncConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_sync_configuration_output_of_yojson
      ~error_deserializer
      
end

module CreateRepositoryLink = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_repository_link_input) ->
    let input = Serializers.create_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.CreateRepositoryLink" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_repository_link_output_of_yojson
      ~error_deserializer
      
end

module CreateHost = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_host_input) ->
    let input = Serializers.create_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.CreateHost" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_host_output_of_yojson
      ~error_deserializer
      
end

module CreateConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.codeconnections", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.codeconnections", "ResourceUnavailableException" ->
         (`ResourceUnavailableException (resource_unavailable_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_connection_input) ->
    let input = Serializers.create_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"CodeConnections_20231201.CreateConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_connection_output_of_yojson
      ~error_deserializer
      
end

