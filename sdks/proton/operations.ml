open Types 
let (let+) res map = Result.map map res
module UpdateTemplateSyncConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_template_sync_config_input) ->
    let input = Serializers.update_template_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateTemplateSyncConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_template_sync_config_output_of_yojson
      ~error_deserializer
      
end

module UpdateServiceTemplateVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_template_version_input) ->
    let input = Serializers.update_service_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateServiceTemplateVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_template_version_output_of_yojson
      ~error_deserializer
      
end

module UpdateServiceTemplate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_template_input) ->
    let input = Serializers.update_service_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateServiceTemplate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_template_output_of_yojson
      ~error_deserializer
      
end

module UpdateServiceSyncConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_sync_config_input) ->
    let input = Serializers.update_service_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateServiceSyncConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_sync_config_output_of_yojson
      ~error_deserializer
      
end

module UpdateServiceSyncBlocker = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_sync_blocker_input) ->
    let input = Serializers.update_service_sync_blocker_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateServiceSyncBlocker" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_sync_blocker_output_of_yojson
      ~error_deserializer
      
end

module UpdateServicePipeline = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_pipeline_input) ->
    let input = Serializers.update_service_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateServicePipeline" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_pipeline_output_of_yojson
      ~error_deserializer
      
end

module UpdateServiceInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_instance_input) ->
    let input = Serializers.update_service_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateServiceInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_instance_output_of_yojson
      ~error_deserializer
      
end

module UpdateService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_input) ->
    let input = Serializers.update_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_output_of_yojson
      ~error_deserializer
      
end

module UpdateEnvironmentTemplateVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_environment_template_version_input) ->
    let input = Serializers.update_environment_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateEnvironmentTemplateVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_environment_template_version_output_of_yojson
      ~error_deserializer
      
end

module UpdateEnvironmentTemplate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_environment_template_input) ->
    let input = Serializers.update_environment_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateEnvironmentTemplate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_environment_template_output_of_yojson
      ~error_deserializer
      
end

module UpdateEnvironmentAccountConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_environment_account_connection_input) ->
    let input = Serializers.update_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateEnvironmentAccountConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_environment_account_connection_output_of_yojson
      ~error_deserializer
      
end

module UpdateEnvironment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_environment_input) ->
    let input = Serializers.update_environment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateEnvironment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_environment_output_of_yojson
      ~error_deserializer
      
end

module UpdateComponent = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_component_input) ->
    let input = Serializers.update_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateComponent" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_component_output_of_yojson
      ~error_deserializer
      
end

module UpdateAccountSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_account_settings_input) ->
    let input = Serializers.update_account_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UpdateAccountSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_account_settings_output_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_input) ->
    let input = Serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.UntagResource" 
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
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_input) ->
    let input = Serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_output_of_yojson
      ~error_deserializer
      
end

module RejectEnvironmentAccountConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: reject_environment_account_connection_input) ->
    let input = Serializers.reject_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.RejectEnvironmentAccountConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.reject_environment_account_connection_output_of_yojson
      ~error_deserializer
      
end

module NotifyResourceDeploymentStatusChange = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: notify_resource_deployment_status_change_input) ->
    let input = Serializers.notify_resource_deployment_status_change_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.NotifyResourceDeploymentStatusChange" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.notify_resource_deployment_status_change_output_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_input) ->
    let input = Serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
      
end

module ListServices = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_services_input) ->
    let input = Serializers.list_services_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListServices" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_services_output_of_yojson
      ~error_deserializer
      
end

module ListServiceTemplates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_service_templates_input) ->
    let input = Serializers.list_service_templates_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListServiceTemplates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_service_templates_output_of_yojson
      ~error_deserializer
      
end

module ListServiceTemplateVersions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_service_template_versions_input) ->
    let input = Serializers.list_service_template_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListServiceTemplateVersions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_service_template_versions_output_of_yojson
      ~error_deserializer
      
end

module ListServicePipelineProvisionedResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_service_pipeline_provisioned_resources_input) ->
    let input = Serializers.list_service_pipeline_provisioned_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListServicePipelineProvisionedResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_service_pipeline_provisioned_resources_output_of_yojson
      ~error_deserializer
      
end

module ListServicePipelineOutputs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_service_pipeline_outputs_input) ->
    let input = Serializers.list_service_pipeline_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListServicePipelineOutputs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_service_pipeline_outputs_output_of_yojson
      ~error_deserializer
      
end

module ListServiceInstances = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_service_instances_input) ->
    let input = Serializers.list_service_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListServiceInstances" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_service_instances_output_of_yojson
      ~error_deserializer
      
end

module ListServiceInstanceProvisionedResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_service_instance_provisioned_resources_input) ->
    let input = Serializers.list_service_instance_provisioned_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListServiceInstanceProvisionedResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_service_instance_provisioned_resources_output_of_yojson
      ~error_deserializer
      
end

module ListServiceInstanceOutputs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_service_instance_outputs_input) ->
    let input = Serializers.list_service_instance_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListServiceInstanceOutputs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_service_instance_outputs_output_of_yojson
      ~error_deserializer
      
end

module ListRepositorySyncDefinitions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_repository_sync_definitions_input) ->
    let input = Serializers.list_repository_sync_definitions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListRepositorySyncDefinitions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_repository_sync_definitions_output_of_yojson
      ~error_deserializer
      
end

module ListRepositories = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_repositories_input) ->
    let input = Serializers.list_repositories_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListRepositories" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_repositories_output_of_yojson
      ~error_deserializer
      
end

module ListEnvironments = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_environments_input) ->
    let input = Serializers.list_environments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListEnvironments" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_environments_output_of_yojson
      ~error_deserializer
      
end

module ListEnvironmentTemplates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_environment_templates_input) ->
    let input = Serializers.list_environment_templates_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListEnvironmentTemplates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_environment_templates_output_of_yojson
      ~error_deserializer
      
end

module ListEnvironmentTemplateVersions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_environment_template_versions_input) ->
    let input = Serializers.list_environment_template_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListEnvironmentTemplateVersions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_environment_template_versions_output_of_yojson
      ~error_deserializer
      
end

module ListEnvironmentProvisionedResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_environment_provisioned_resources_input) ->
    let input = Serializers.list_environment_provisioned_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListEnvironmentProvisionedResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_environment_provisioned_resources_output_of_yojson
      ~error_deserializer
      
end

module ListEnvironmentOutputs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_environment_outputs_input) ->
    let input = Serializers.list_environment_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListEnvironmentOutputs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_environment_outputs_output_of_yojson
      ~error_deserializer
      
end

module ListEnvironmentAccountConnections = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_environment_account_connections_input) ->
    let input = Serializers.list_environment_account_connections_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListEnvironmentAccountConnections" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_environment_account_connections_output_of_yojson
      ~error_deserializer
      
end

module ListDeployments = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_deployments_input) ->
    let input = Serializers.list_deployments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListDeployments" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_deployments_output_of_yojson
      ~error_deserializer
      
end

module ListComponents = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_components_input) ->
    let input = Serializers.list_components_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListComponents" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_components_output_of_yojson
      ~error_deserializer
      
end

module ListComponentProvisionedResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_component_provisioned_resources_input) ->
    let input = Serializers.list_component_provisioned_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListComponentProvisionedResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_component_provisioned_resources_output_of_yojson
      ~error_deserializer
      
end

module ListComponentOutputs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_component_outputs_input) ->
    let input = Serializers.list_component_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.ListComponentOutputs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_component_outputs_output_of_yojson
      ~error_deserializer
      
end

module GetTemplateSyncStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_template_sync_status_input) ->
    let input = Serializers.get_template_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetTemplateSyncStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_template_sync_status_output_of_yojson
      ~error_deserializer
      
end

module GetTemplateSyncConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_template_sync_config_input) ->
    let input = Serializers.get_template_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetTemplateSyncConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_template_sync_config_output_of_yojson
      ~error_deserializer
      
end

module GetServiceTemplateVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_service_template_version_input) ->
    let input = Serializers.get_service_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetServiceTemplateVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_service_template_version_output_of_yojson
      ~error_deserializer
      
end

module GetServiceTemplate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_service_template_input) ->
    let input = Serializers.get_service_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetServiceTemplate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_service_template_output_of_yojson
      ~error_deserializer
      
end

module GetServiceSyncConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_service_sync_config_input) ->
    let input = Serializers.get_service_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetServiceSyncConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_service_sync_config_output_of_yojson
      ~error_deserializer
      
end

module GetServiceSyncBlockerSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_service_sync_blocker_summary_input) ->
    let input = Serializers.get_service_sync_blocker_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetServiceSyncBlockerSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_service_sync_blocker_summary_output_of_yojson
      ~error_deserializer
      
end

module GetServiceInstanceSyncStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_service_instance_sync_status_input) ->
    let input = Serializers.get_service_instance_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetServiceInstanceSyncStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_service_instance_sync_status_output_of_yojson
      ~error_deserializer
      
end

module GetServiceInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_service_instance_input) ->
    let input = Serializers.get_service_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetServiceInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_service_instance_output_of_yojson
      ~error_deserializer
      
end

module GetService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_service_input) ->
    let input = Serializers.get_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_service_output_of_yojson
      ~error_deserializer
      
end

module GetResourcesSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resources_summary_input) ->
    let input = Serializers.get_resources_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetResourcesSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resources_summary_output_of_yojson
      ~error_deserializer
      
end

module GetRepositorySyncStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_repository_sync_status_input) ->
    let input = Serializers.get_repository_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetRepositorySyncStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_repository_sync_status_output_of_yojson
      ~error_deserializer
      
end

module GetRepository = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_repository_input) ->
    let input = Serializers.get_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetRepository" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_repository_output_of_yojson
      ~error_deserializer
      
end

module GetEnvironmentTemplateVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_environment_template_version_input) ->
    let input = Serializers.get_environment_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetEnvironmentTemplateVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_environment_template_version_output_of_yojson
      ~error_deserializer
      
end

module GetEnvironmentTemplate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_environment_template_input) ->
    let input = Serializers.get_environment_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetEnvironmentTemplate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_environment_template_output_of_yojson
      ~error_deserializer
      
end

module GetEnvironmentAccountConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_environment_account_connection_input) ->
    let input = Serializers.get_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetEnvironmentAccountConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_environment_account_connection_output_of_yojson
      ~error_deserializer
      
end

module GetEnvironment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_environment_input) ->
    let input = Serializers.get_environment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetEnvironment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_environment_output_of_yojson
      ~error_deserializer
      
end

module GetDeployment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_deployment_input) ->
    let input = Serializers.get_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetDeployment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_deployment_output_of_yojson
      ~error_deserializer
      
end

module GetComponent = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_component_input) ->
    let input = Serializers.get_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetComponent" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_component_output_of_yojson
      ~error_deserializer
      
end

module GetAccountSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_account_settings_input) ->
    let input = Serializers.get_account_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.GetAccountSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_account_settings_output_of_yojson
      ~error_deserializer
      
end

module DeleteTemplateSyncConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_template_sync_config_input) ->
    let input = Serializers.delete_template_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteTemplateSyncConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_template_sync_config_output_of_yojson
      ~error_deserializer
      
end

module DeleteServiceTemplateVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_service_template_version_input) ->
    let input = Serializers.delete_service_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteServiceTemplateVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_service_template_version_output_of_yojson
      ~error_deserializer
      
end

module DeleteServiceTemplate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_service_template_input) ->
    let input = Serializers.delete_service_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteServiceTemplate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_service_template_output_of_yojson
      ~error_deserializer
      
end

module DeleteServiceSyncConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_service_sync_config_input) ->
    let input = Serializers.delete_service_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteServiceSyncConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_service_sync_config_output_of_yojson
      ~error_deserializer
      
end

module DeleteService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_service_input) ->
    let input = Serializers.delete_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_service_output_of_yojson
      ~error_deserializer
      
end

module DeleteRepository = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_repository_input) ->
    let input = Serializers.delete_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteRepository" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_repository_output_of_yojson
      ~error_deserializer
      
end

module DeleteEnvironmentTemplateVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_environment_template_version_input) ->
    let input = Serializers.delete_environment_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteEnvironmentTemplateVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_environment_template_version_output_of_yojson
      ~error_deserializer
      
end

module DeleteEnvironmentTemplate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_environment_template_input) ->
    let input = Serializers.delete_environment_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteEnvironmentTemplate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_environment_template_output_of_yojson
      ~error_deserializer
      
end

module DeleteEnvironmentAccountConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_environment_account_connection_input) ->
    let input = Serializers.delete_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteEnvironmentAccountConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_environment_account_connection_output_of_yojson
      ~error_deserializer
      
end

module DeleteEnvironment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_environment_input) ->
    let input = Serializers.delete_environment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteEnvironment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_environment_output_of_yojson
      ~error_deserializer
      
end

module DeleteDeployment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_deployment_input) ->
    let input = Serializers.delete_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteDeployment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_deployment_output_of_yojson
      ~error_deserializer
      
end

module DeleteComponent = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_component_input) ->
    let input = Serializers.delete_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.DeleteComponent" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_component_output_of_yojson
      ~error_deserializer
      
end

module CreateTemplateSyncConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_template_sync_config_input) ->
    let input = Serializers.create_template_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateTemplateSyncConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_template_sync_config_output_of_yojson
      ~error_deserializer
      
end

module CreateServiceTemplateVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_service_template_version_input) ->
    let input = Serializers.create_service_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateServiceTemplateVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_service_template_version_output_of_yojson
      ~error_deserializer
      
end

module CreateServiceTemplate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_service_template_input) ->
    let input = Serializers.create_service_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateServiceTemplate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_service_template_output_of_yojson
      ~error_deserializer
      
end

module CreateServiceSyncConfig = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_service_sync_config_input) ->
    let input = Serializers.create_service_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateServiceSyncConfig" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_service_sync_config_output_of_yojson
      ~error_deserializer
      
end

module CreateServiceInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_service_instance_input) ->
    let input = Serializers.create_service_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateServiceInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_service_instance_output_of_yojson
      ~error_deserializer
      
end

module CreateService = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_service_input) ->
    let input = Serializers.create_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateService" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_service_output_of_yojson
      ~error_deserializer
      
end

module CreateRepository = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_repository_input) ->
    let input = Serializers.create_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateRepository" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_repository_output_of_yojson
      ~error_deserializer
      
end

module CreateEnvironmentTemplateVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_environment_template_version_input) ->
    let input = Serializers.create_environment_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateEnvironmentTemplateVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_environment_template_version_output_of_yojson
      ~error_deserializer
      
end

module CreateEnvironmentTemplate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_environment_template_input) ->
    let input = Serializers.create_environment_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateEnvironmentTemplate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_environment_template_output_of_yojson
      ~error_deserializer
      
end

module CreateEnvironmentAccountConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_environment_account_connection_input) ->
    let input = Serializers.create_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateEnvironmentAccountConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_environment_account_connection_output_of_yojson
      ~error_deserializer
      
end

module CreateEnvironment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_environment_input) ->
    let input = Serializers.create_environment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateEnvironment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_environment_output_of_yojson
      ~error_deserializer
      
end

module CreateComponent = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_component_input) ->
    let input = Serializers.create_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CreateComponent" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_component_output_of_yojson
      ~error_deserializer
      
end

module CancelServicePipelineDeployment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_service_pipeline_deployment_input) ->
    let input = Serializers.cancel_service_pipeline_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CancelServicePipelineDeployment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_service_pipeline_deployment_output_of_yojson
      ~error_deserializer
      
end

module CancelServiceInstanceDeployment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_service_instance_deployment_input) ->
    let input = Serializers.cancel_service_instance_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CancelServiceInstanceDeployment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_service_instance_deployment_output_of_yojson
      ~error_deserializer
      
end

module CancelEnvironmentDeployment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_environment_deployment_input) ->
    let input = Serializers.cancel_environment_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CancelEnvironmentDeployment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_environment_deployment_output_of_yojson
      ~error_deserializer
      
end

module CancelComponentDeployment = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_component_deployment_input) ->
    let input = Serializers.cancel_component_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.CancelComponentDeployment" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_component_deployment_output_of_yojson
      ~error_deserializer
      
end

module AcceptEnvironmentAccountConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.proton", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.proton", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.proton", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: accept_environment_account_connection_input) ->
    let input = Serializers.accept_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AwsProton20200720.AcceptEnvironmentAccountConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.accept_environment_account_connection_output_of_yojson
      ~error_deserializer
      
end

