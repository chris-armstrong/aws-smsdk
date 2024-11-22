open Types 
let (let+) res map = Result.map map res
module VerifyTrust = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: verify_trust_request) ->
    let input = Serializers.verify_trust_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.VerifyTrust" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.verify_trust_result_of_yojson
      ~error_deserializer
      
end

module UpdateTrust = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_trust_request) ->
    let input = Serializers.update_trust_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.UpdateTrust" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_trust_result_of_yojson
      ~error_deserializer
      
end

module UpdateSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "IncompatibleSettingsException" ->
         (`IncompatibleSettingsException (incompatible_settings_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedSettingsException" ->
         (`UnsupportedSettingsException (unsupported_settings_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_settings_request) ->
    let input = Serializers.update_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.UpdateSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_settings_result_of_yojson
      ~error_deserializer
      
end

module UpdateRadius = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_radius_request) ->
    let input = Serializers.update_radius_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.UpdateRadius" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_radius_result_of_yojson
      ~error_deserializer
      
end

module UpdateNumberOfDomainControllers = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DomainControllerLimitExceededException" ->
         (`DomainControllerLimitExceededException (domain_controller_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_number_of_domain_controllers_request) ->
    let input = Serializers.update_number_of_domain_controllers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.UpdateNumberOfDomainControllers" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_number_of_domain_controllers_result_of_yojson
      ~error_deserializer
      
end

module UpdateDirectorySetup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryInDesiredStateException" ->
         (`DirectoryInDesiredStateException (directory_in_desired_state_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "SnapshotLimitExceededException" ->
         (`SnapshotLimitExceededException (snapshot_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_directory_setup_request) ->
    let input = Serializers.update_directory_setup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.UpdateDirectorySetup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_directory_setup_result_of_yojson
      ~error_deserializer
      
end

module UpdateConditionalForwarder = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_conditional_forwarder_request) ->
    let input = Serializers.update_conditional_forwarder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.UpdateConditionalForwarder" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_conditional_forwarder_result_of_yojson
      ~error_deserializer
      
end

module UnshareDirectory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryNotSharedException" ->
         (`DirectoryNotSharedException (directory_not_shared_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidTargetException" ->
         (`InvalidTargetException (invalid_target_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: unshare_directory_request) ->
    let input = Serializers.unshare_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.UnshareDirectory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.unshare_directory_result_of_yojson
      ~error_deserializer
      
end

module StartSchemaExtension = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "SnapshotLimitExceededException" ->
         (`SnapshotLimitExceededException (snapshot_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_schema_extension_request) ->
    let input = Serializers.start_schema_extension_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.StartSchemaExtension" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_schema_extension_result_of_yojson
      ~error_deserializer
      
end

module ShareDirectory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryAlreadySharedException" ->
         (`DirectoryAlreadySharedException (directory_already_shared_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidTargetException" ->
         (`InvalidTargetException (invalid_target_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "OrganizationsException" ->
         (`OrganizationsException (organizations_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ShareLimitExceededException" ->
         (`ShareLimitExceededException (share_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: share_directory_request) ->
    let input = Serializers.share_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.ShareDirectory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.share_directory_result_of_yojson
      ~error_deserializer
      
end

module RestoreFromSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: restore_from_snapshot_request) ->
    let input = Serializers.restore_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.RestoreFromSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.restore_from_snapshot_result_of_yojson
      ~error_deserializer
      
end

module ResetUserPassword = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidPasswordException" ->
         (`InvalidPasswordException (invalid_password_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UserDoesNotExistException" ->
         (`UserDoesNotExistException (user_does_not_exist_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: reset_user_password_request) ->
    let input = Serializers.reset_user_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.ResetUserPassword" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.reset_user_password_result_of_yojson
      ~error_deserializer
      
end

module RemoveTagsFromResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_tags_from_resource_request) ->
    let input = Serializers.remove_tags_from_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.RemoveTagsFromResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.remove_tags_from_resource_result_of_yojson
      ~error_deserializer
      
end

module RemoveRegion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_region_request) ->
    let input = Serializers.remove_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.RemoveRegion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.remove_region_result_of_yojson
      ~error_deserializer
      
end

module RemoveIpRoutes = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_ip_routes_request) ->
    let input = Serializers.remove_ip_routes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.RemoveIpRoutes" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.remove_ip_routes_result_of_yojson
      ~error_deserializer
      
end

module RejectSharedDirectory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryAlreadySharedException" ->
         (`DirectoryAlreadySharedException (directory_already_shared_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: reject_shared_directory_request) ->
    let input = Serializers.reject_shared_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.RejectSharedDirectory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.reject_shared_directory_result_of_yojson
      ~error_deserializer
      
end

module RegisterEventTopic = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_event_topic_request) ->
    let input = Serializers.register_event_topic_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.RegisterEventTopic" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_event_topic_result_of_yojson
      ~error_deserializer
      
end

module RegisterCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "CertificateAlreadyExistsException" ->
         (`CertificateAlreadyExistsException (certificate_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "CertificateLimitExceededException" ->
         (`CertificateLimitExceededException (certificate_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidCertificateException" ->
         (`InvalidCertificateException (invalid_certificate_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_certificate_request) ->
    let input = Serializers.register_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.RegisterCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_certificate_result_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer
      
end

module ListSchemaExtensions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_schema_extensions_request) ->
    let input = Serializers.list_schema_extensions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.ListSchemaExtensions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_schema_extensions_result_of_yojson
      ~error_deserializer
      
end

module ListLogSubscriptions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_log_subscriptions_request) ->
    let input = Serializers.list_log_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.ListLogSubscriptions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_log_subscriptions_result_of_yojson
      ~error_deserializer
      
end

module ListIpRoutes = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_ip_routes_request) ->
    let input = Serializers.list_ip_routes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.ListIpRoutes" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_ip_routes_result_of_yojson
      ~error_deserializer
      
end

module ListCertificates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_certificates_request) ->
    let input = Serializers.list_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.ListCertificates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_certificates_result_of_yojson
      ~error_deserializer
      
end

module GetSnapshotLimits = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_snapshot_limits_request) ->
    let input = Serializers.get_snapshot_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.GetSnapshotLimits" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_snapshot_limits_result_of_yojson
      ~error_deserializer
      
end

module GetDirectoryLimits = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_directory_limits_request) ->
    let input = Serializers.get_directory_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.GetDirectoryLimits" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_directory_limits_result_of_yojson
      ~error_deserializer
      
end

module EnableSso = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AuthenticationFailedException" ->
         (`AuthenticationFailedException (authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_sso_request) ->
    let input = Serializers.enable_sso_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.EnableSso" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enable_sso_result_of_yojson
      ~error_deserializer
      
end

module EnableRadius = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityAlreadyExistsException" ->
         (`EntityAlreadyExistsException (entity_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_radius_request) ->
    let input = Serializers.enable_radius_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.EnableRadius" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enable_radius_result_of_yojson
      ~error_deserializer
      
end

module EnableLDAPS = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidLDAPSStatusException" ->
         (`InvalidLDAPSStatusException (invalid_ldaps_status_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "NoAvailableCertificateException" ->
         (`NoAvailableCertificateException (no_available_certificate_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_ldaps_request) ->
    let input = Serializers.enable_ldaps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.EnableLDAPS" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enable_ldaps_result_of_yojson
      ~error_deserializer
      
end

module EnableClientAuthentication = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidClientAuthStatusException" ->
         (`InvalidClientAuthStatusException (invalid_client_auth_status_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "NoAvailableCertificateException" ->
         (`NoAvailableCertificateException (no_available_certificate_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_client_authentication_request) ->
    let input = Serializers.enable_client_authentication_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.EnableClientAuthentication" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enable_client_authentication_result_of_yojson
      ~error_deserializer
      
end

module DisableSso = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AuthenticationFailedException" ->
         (`AuthenticationFailedException (authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_sso_request) ->
    let input = Serializers.disable_sso_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DisableSso" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disable_sso_result_of_yojson
      ~error_deserializer
      
end

module DisableRadius = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_radius_request) ->
    let input = Serializers.disable_radius_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DisableRadius" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disable_radius_result_of_yojson
      ~error_deserializer
      
end

module DisableLDAPS = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidLDAPSStatusException" ->
         (`InvalidLDAPSStatusException (invalid_ldaps_status_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_ldaps_request) ->
    let input = Serializers.disable_ldaps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DisableLDAPS" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disable_ldaps_result_of_yojson
      ~error_deserializer
      
end

module DisableClientAuthentication = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidClientAuthStatusException" ->
         (`InvalidClientAuthStatusException (invalid_client_auth_status_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_client_authentication_request) ->
    let input = Serializers.disable_client_authentication_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DisableClientAuthentication" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disable_client_authentication_result_of_yojson
      ~error_deserializer
      
end

module DescribeUpdateDirectory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_update_directory_request) ->
    let input = Serializers.describe_update_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeUpdateDirectory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_update_directory_result_of_yojson
      ~error_deserializer
      
end

module DescribeTrusts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_trusts_request) ->
    let input = Serializers.describe_trusts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeTrusts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_trusts_result_of_yojson
      ~error_deserializer
      
end

module DescribeSnapshots = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_snapshots_request) ->
    let input = Serializers.describe_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeSnapshots" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_snapshots_result_of_yojson
      ~error_deserializer
      
end

module DescribeSharedDirectories = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_shared_directories_request) ->
    let input = Serializers.describe_shared_directories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeSharedDirectories" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_shared_directories_result_of_yojson
      ~error_deserializer
      
end

module DescribeSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_settings_request) ->
    let input = Serializers.describe_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_settings_result_of_yojson
      ~error_deserializer
      
end

module DescribeRegions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_regions_request) ->
    let input = Serializers.describe_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeRegions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_regions_result_of_yojson
      ~error_deserializer
      
end

module DescribeLDAPSSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_ldaps_settings_request) ->
    let input = Serializers.describe_ldaps_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeLDAPSSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_ldaps_settings_result_of_yojson
      ~error_deserializer
      
end

module DescribeEventTopics = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_event_topics_request) ->
    let input = Serializers.describe_event_topics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeEventTopics" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_event_topics_result_of_yojson
      ~error_deserializer
      
end

module DescribeDomainControllers = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_domain_controllers_request) ->
    let input = Serializers.describe_domain_controllers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeDomainControllers" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_domain_controllers_result_of_yojson
      ~error_deserializer
      
end

module DescribeDirectories = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidNextTokenException" ->
         (`InvalidNextTokenException (invalid_next_token_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_directories_request) ->
    let input = Serializers.describe_directories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeDirectories" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_directories_result_of_yojson
      ~error_deserializer
      
end

module DescribeConditionalForwarders = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_conditional_forwarders_request) ->
    let input = Serializers.describe_conditional_forwarders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeConditionalForwarders" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_conditional_forwarders_result_of_yojson
      ~error_deserializer
      
end

module DescribeClientAuthenticationSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_client_authentication_settings_request) ->
    let input = Serializers.describe_client_authentication_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeClientAuthenticationSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_client_authentication_settings_result_of_yojson
      ~error_deserializer
      
end

module DescribeCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "CertificateDoesNotExistException" ->
         (`CertificateDoesNotExistException (certificate_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_certificate_request) ->
    let input = Serializers.describe_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DescribeCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_certificate_result_of_yojson
      ~error_deserializer
      
end

module DeregisterEventTopic = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_event_topic_request) ->
    let input = Serializers.deregister_event_topic_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DeregisterEventTopic" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_event_topic_result_of_yojson
      ~error_deserializer
      
end

module DeregisterCertificate = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "CertificateDoesNotExistException" ->
         (`CertificateDoesNotExistException (certificate_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "CertificateInUseException" ->
         (`CertificateInUseException (certificate_in_use_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_certificate_request) ->
    let input = Serializers.deregister_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DeregisterCertificate" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_certificate_result_of_yojson
      ~error_deserializer
      
end

module DeleteTrust = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_trust_request) ->
    let input = Serializers.delete_trust_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DeleteTrust" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_trust_result_of_yojson
      ~error_deserializer
      
end

module DeleteSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_snapshot_request) ->
    let input = Serializers.delete_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DeleteSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_snapshot_result_of_yojson
      ~error_deserializer
      
end

module DeleteLogSubscription = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_log_subscription_request) ->
    let input = Serializers.delete_log_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DeleteLogSubscription" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_log_subscription_result_of_yojson
      ~error_deserializer
      
end

module DeleteDirectory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_directory_request) ->
    let input = Serializers.delete_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DeleteDirectory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_directory_result_of_yojson
      ~error_deserializer
      
end

module DeleteConditionalForwarder = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_conditional_forwarder_request) ->
    let input = Serializers.delete_conditional_forwarder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.DeleteConditionalForwarder" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_conditional_forwarder_result_of_yojson
      ~error_deserializer
      
end

module CreateTrust = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityAlreadyExistsException" ->
         (`EntityAlreadyExistsException (entity_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_trust_request) ->
    let input = Serializers.create_trust_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.CreateTrust" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_trust_result_of_yojson
      ~error_deserializer
      
end

module CreateSnapshot = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "SnapshotLimitExceededException" ->
         (`SnapshotLimitExceededException (snapshot_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_snapshot_request) ->
    let input = Serializers.create_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.CreateSnapshot" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_snapshot_result_of_yojson
      ~error_deserializer
      
end

module CreateMicrosoftAD = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryLimitExceededException" ->
         (`DirectoryLimitExceededException (directory_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_microsoft_ad_request) ->
    let input = Serializers.create_microsoft_ad_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.CreateMicrosoftAD" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_microsoft_ad_result_of_yojson
      ~error_deserializer
      
end

module CreateLogSubscription = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityAlreadyExistsException" ->
         (`EntityAlreadyExistsException (entity_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InsufficientPermissionsException" ->
         (`InsufficientPermissionsException (insufficient_permissions_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_log_subscription_request) ->
    let input = Serializers.create_log_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.CreateLogSubscription" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_log_subscription_result_of_yojson
      ~error_deserializer
      
end

module CreateDirectory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryLimitExceededException" ->
         (`DirectoryLimitExceededException (directory_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_directory_request) ->
    let input = Serializers.create_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.CreateDirectory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_directory_result_of_yojson
      ~error_deserializer
      
end

module CreateConditionalForwarder = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityAlreadyExistsException" ->
         (`EntityAlreadyExistsException (entity_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_conditional_forwarder_request) ->
    let input = Serializers.create_conditional_forwarder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.CreateConditionalForwarder" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_conditional_forwarder_result_of_yojson
      ~error_deserializer
      
end

module CreateComputer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AuthenticationFailedException" ->
         (`AuthenticationFailedException (authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityAlreadyExistsException" ->
         (`EntityAlreadyExistsException (entity_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_computer_request) ->
    let input = Serializers.create_computer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.CreateComputer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_computer_result_of_yojson
      ~error_deserializer
      
end

module CreateAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityAlreadyExistsException" ->
         (`EntityAlreadyExistsException (entity_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_alias_request) ->
    let input = Serializers.create_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.CreateAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_alias_result_of_yojson
      ~error_deserializer
      
end

module ConnectDirectory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryLimitExceededException" ->
         (`DirectoryLimitExceededException (directory_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: connect_directory_request) ->
    let input = Serializers.connect_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.ConnectDirectory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.connect_directory_result_of_yojson
      ~error_deserializer
      
end

module CancelSchemaExtension = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_schema_extension_request) ->
    let input = Serializers.cancel_schema_extension_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.CancelSchemaExtension" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_schema_extension_result_of_yojson
      ~error_deserializer
      
end

module AddTagsToResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "TagLimitExceededException" ->
         (`TagLimitExceededException (tag_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_tags_to_resource_request) ->
    let input = Serializers.add_tags_to_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.AddTagsToResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_tags_to_resource_result_of_yojson
      ~error_deserializer
      
end

module AddRegion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryAlreadyInRegionException" ->
         (`DirectoryAlreadyInRegionException (directory_already_in_region_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryDoesNotExistException" ->
         (`DirectoryDoesNotExistException (directory_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "RegionLimitExceededException" ->
         (`RegionLimitExceededException (region_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_region_request) ->
    let input = Serializers.add_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.AddRegion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_region_result_of_yojson
      ~error_deserializer
      
end

module AddIpRoutes = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityAlreadyExistsException" ->
         (`EntityAlreadyExistsException (entity_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "IpRouteLimitExceededException" ->
         (`IpRouteLimitExceededException (ip_route_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_ip_routes_request) ->
    let input = Serializers.add_ip_routes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.AddIpRoutes" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_ip_routes_result_of_yojson
      ~error_deserializer
      
end

module AcceptSharedDirectory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.directoryservice", "ClientException" ->
         (`ClientException (client_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "DirectoryAlreadySharedException" ->
         (`DirectoryAlreadySharedException (directory_already_shared_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "EntityDoesNotExistException" ->
         (`EntityDoesNotExistException (entity_does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.directoryservice", "ServiceException" ->
         (`ServiceException (service_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: accept_shared_directory_request) ->
    let input = Serializers.accept_shared_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DirectoryService_20150416.AcceptSharedDirectory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.accept_shared_directory_result_of_yojson
      ~error_deserializer
      
end

