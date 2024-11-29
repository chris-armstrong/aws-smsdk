open Types 
let (let+) res map = Result.map map res
module CreateKeyspace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_keyspace_request) ->
    let input = Serializers.create_keyspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.CreateKeyspace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_keyspace_response_of_yojson
      ~error_deserializer
      
end

module CreateTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_table_request) ->
    let input = Serializers.create_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.CreateTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_table_response_of_yojson
      ~error_deserializer
      
end

module DeleteKeyspace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_keyspace_request) ->
    let input = Serializers.delete_keyspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.DeleteKeyspace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_keyspace_response_of_yojson
      ~error_deserializer
      
end

module DeleteTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_table_request) ->
    let input = Serializers.delete_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.DeleteTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_table_response_of_yojson
      ~error_deserializer
      
end

module GetKeyspace = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_keyspace_request) ->
    let input = Serializers.get_keyspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.GetKeyspace" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_keyspace_response_of_yojson
      ~error_deserializer
      
end

module GetTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_table_request) ->
    let input = Serializers.get_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.GetTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_table_response_of_yojson
      ~error_deserializer
      
end

module GetTableAutoScalingSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_table_auto_scaling_settings_request) ->
    let input = Serializers.get_table_auto_scaling_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.GetTableAutoScalingSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_table_auto_scaling_settings_response_of_yojson
      ~error_deserializer
      
end

module ListKeyspaces = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_keyspaces_request) ->
    let input = Serializers.list_keyspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.ListKeyspaces" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_keyspaces_response_of_yojson
      ~error_deserializer
      
end

module ListTables = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tables_request) ->
    let input = Serializers.list_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.ListTables" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tables_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module RestoreTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: restore_table_request) ->
    let input = Serializers.restore_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.RestoreTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.restore_table_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.TagResource" 
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
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module UpdateTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.keyspaces", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.keyspaces", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_table_request) ->
    let input = Serializers.update_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"KeyspacesService.UpdateTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_table_response_of_yojson
      ~error_deserializer
      
end

