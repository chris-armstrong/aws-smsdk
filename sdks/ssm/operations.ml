open Types 
let (let+) res map = Result.map map res
module UpdateServiceSetting = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ServiceSettingNotFound" ->
         (`ServiceSettingNotFound (service_setting_not_found_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_service_setting_request) ->
    let input = Serializers.update_service_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateServiceSetting" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_service_setting_result_of_yojson
      ~error_deserializer
      
end

module UpdateResourceDataSync = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncConflictException" ->
         (`ResourceDataSyncConflictException (resource_data_sync_conflict_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncInvalidConfigurationException" ->
         (`ResourceDataSyncInvalidConfigurationException (resource_data_sync_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncNotFoundException" ->
         (`ResourceDataSyncNotFoundException (resource_data_sync_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_resource_data_sync_request) ->
    let input = Serializers.update_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateResourceDataSync" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_resource_data_sync_result_of_yojson
      ~error_deserializer
      
end

module UpdatePatchBaseline = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_patch_baseline_request) ->
    let input = Serializers.update_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdatePatchBaseline" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_patch_baseline_result_of_yojson
      ~error_deserializer
      
end

module UpdateOpsMetadata = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataInvalidArgumentException" ->
         (`OpsMetadataInvalidArgumentException (ops_metadata_invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataKeyLimitExceededException" ->
         (`OpsMetadataKeyLimitExceededException (ops_metadata_key_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataNotFoundException" ->
         (`OpsMetadataNotFoundException (ops_metadata_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataTooManyUpdatesException" ->
         (`OpsMetadataTooManyUpdatesException (ops_metadata_too_many_updates_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_ops_metadata_request) ->
    let input = Serializers.update_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateOpsMetadata" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_ops_metadata_result_of_yojson
      ~error_deserializer
      
end

module UpdateOpsItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemAccessDeniedException" ->
         (`OpsItemAccessDeniedException (ops_item_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemAlreadyExistsException" ->
         (`OpsItemAlreadyExistsException (ops_item_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemConflictException" ->
         (`OpsItemConflictException (ops_item_conflict_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemInvalidParameterException" ->
         (`OpsItemInvalidParameterException (ops_item_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemLimitExceededException" ->
         (`OpsItemLimitExceededException (ops_item_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemNotFoundException" ->
         (`OpsItemNotFoundException (ops_item_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_ops_item_request) ->
    let input = Serializers.update_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateOpsItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_ops_item_response_of_yojson
      ~error_deserializer
      
end

module UpdateManagedInstanceRole = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_managed_instance_role_request) ->
    let input = Serializers.update_managed_instance_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateManagedInstanceRole" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_managed_instance_role_result_of_yojson
      ~error_deserializer
      
end

module UpdateMaintenanceWindowTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_maintenance_window_task_request) ->
    let input = Serializers.update_maintenance_window_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateMaintenanceWindowTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_maintenance_window_task_result_of_yojson
      ~error_deserializer
      
end

module UpdateMaintenanceWindowTarget = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_maintenance_window_target_request) ->
    let input = Serializers.update_maintenance_window_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateMaintenanceWindowTarget" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_maintenance_window_target_result_of_yojson
      ~error_deserializer
      
end

module UpdateMaintenanceWindow = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_maintenance_window_request) ->
    let input = Serializers.update_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateMaintenanceWindow" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_maintenance_window_result_of_yojson
      ~error_deserializer
      
end

module UpdateDocumentMetadata = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentOperation" ->
         (`InvalidDocumentOperation (invalid_document_operation_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_document_metadata_request) ->
    let input = Serializers.update_document_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateDocumentMetadata" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_document_metadata_response_of_yojson
      ~error_deserializer
      
end

module UpdateDocumentDefaultVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentSchemaVersion" ->
         (`InvalidDocumentSchemaVersion (invalid_document_schema_version_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_document_default_version_request) ->
    let input = Serializers.update_document_default_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateDocumentDefaultVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_document_default_version_result_of_yojson
      ~error_deserializer
      
end

module UpdateDocument = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DocumentVersionLimitExceeded" ->
         (`DocumentVersionLimitExceeded (document_version_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "DuplicateDocumentContent" ->
         (`DuplicateDocumentContent (duplicate_document_content_of_yojson tree path))
      | "com.amazonaws.ssm", "DuplicateDocumentVersionName" ->
         (`DuplicateDocumentVersionName (duplicate_document_version_name_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentContent" ->
         (`InvalidDocumentContent (invalid_document_content_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentOperation" ->
         (`InvalidDocumentOperation (invalid_document_operation_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentSchemaVersion" ->
         (`InvalidDocumentSchemaVersion (invalid_document_schema_version_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | "com.amazonaws.ssm", "MaxDocumentSizeExceeded" ->
         (`MaxDocumentSizeExceeded (max_document_size_exceeded_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_document_request) ->
    let input = Serializers.update_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateDocument" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_document_result_of_yojson
      ~error_deserializer
      
end

module UpdateAssociationStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationDoesNotExist" ->
         (`AssociationDoesNotExist (association_does_not_exist_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "StatusUnchanged" ->
         (`StatusUnchanged (status_unchanged_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_association_status_request) ->
    let input = Serializers.update_association_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateAssociationStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_association_status_result_of_yojson
      ~error_deserializer
      
end

module UpdateAssociation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationDoesNotExist" ->
         (`AssociationDoesNotExist (association_does_not_exist_of_yojson tree path))
      | "com.amazonaws.ssm", "AssociationVersionLimitExceeded" ->
         (`AssociationVersionLimitExceeded (association_version_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAssociationVersion" ->
         (`InvalidAssociationVersion (invalid_association_version_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidOutputLocation" ->
         (`InvalidOutputLocation (invalid_output_location_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidParameters" ->
         (`InvalidParameters (invalid_parameters_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidSchedule" ->
         (`InvalidSchedule (invalid_schedule_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTarget" ->
         (`InvalidTarget (invalid_target_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTargetMaps" ->
         (`InvalidTargetMaps (invalid_target_maps_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidUpdate" ->
         (`InvalidUpdate (invalid_update_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_association_request) ->
    let input = Serializers.update_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UpdateAssociation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_association_result_of_yojson
      ~error_deserializer
      
end

module UnlabelParameterVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterNotFound" ->
         (`ParameterNotFound (parameter_not_found_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterVersionNotFound" ->
         (`ParameterVersionNotFound (parameter_version_not_found_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: unlabel_parameter_version_request) ->
    let input = Serializers.unlabel_parameter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.UnlabelParameterVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.unlabel_parameter_version_result_of_yojson
      ~error_deserializer
      
end

module TerminateSession = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: terminate_session_request) ->
    let input = Serializers.terminate_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.TerminateSession" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.terminate_session_response_of_yojson
      ~error_deserializer
      
end

module StopAutomationExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AutomationExecutionNotFoundException" ->
         (`AutomationExecutionNotFoundException (automation_execution_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAutomationStatusUpdateException" ->
         (`InvalidAutomationStatusUpdateException (invalid_automation_status_update_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_automation_execution_request) ->
    let input = Serializers.stop_automation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.StopAutomationExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.stop_automation_execution_result_of_yojson
      ~error_deserializer
      
end

module StartSession = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "TargetNotConnected" ->
         (`TargetNotConnected (target_not_connected_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_session_request) ->
    let input = Serializers.start_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.StartSession" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_session_response_of_yojson
      ~error_deserializer
      
end

module StartChangeRequestExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AutomationDefinitionNotApprovedException" ->
         (`AutomationDefinitionNotApprovedException (automation_definition_not_approved_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "AutomationDefinitionNotFoundException" ->
         (`AutomationDefinitionNotFoundException (automation_definition_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "AutomationDefinitionVersionNotFoundException" ->
         (`AutomationDefinitionVersionNotFoundException (automation_definition_version_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "AutomationExecutionLimitExceededException" ->
         (`AutomationExecutionLimitExceededException (automation_execution_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "IdempotentParameterMismatch" ->
         (`IdempotentParameterMismatch (idempotent_parameter_mismatch_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAutomationExecutionParametersException" ->
         (`InvalidAutomationExecutionParametersException (invalid_automation_execution_parameters_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_change_request_execution_request) ->
    let input = Serializers.start_change_request_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.StartChangeRequestExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_change_request_execution_result_of_yojson
      ~error_deserializer
      
end

module StartAutomationExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AutomationDefinitionNotFoundException" ->
         (`AutomationDefinitionNotFoundException (automation_definition_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "AutomationDefinitionVersionNotFoundException" ->
         (`AutomationDefinitionVersionNotFoundException (automation_definition_version_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "AutomationExecutionLimitExceededException" ->
         (`AutomationExecutionLimitExceededException (automation_execution_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "IdempotentParameterMismatch" ->
         (`IdempotentParameterMismatch (idempotent_parameter_mismatch_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAutomationExecutionParametersException" ->
         (`InvalidAutomationExecutionParametersException (invalid_automation_execution_parameters_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTarget" ->
         (`InvalidTarget (invalid_target_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_automation_execution_request) ->
    let input = Serializers.start_automation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.StartAutomationExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_automation_execution_result_of_yojson
      ~error_deserializer
      
end

module StartAssociationsOnce = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationDoesNotExist" ->
         (`AssociationDoesNotExist (association_does_not_exist_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAssociation" ->
         (`InvalidAssociation (invalid_association_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_associations_once_request) ->
    let input = Serializers.start_associations_once_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.StartAssociationsOnce" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_associations_once_result_of_yojson
      ~error_deserializer
      
end

module SendCommand = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DuplicateInstanceId" ->
         (`DuplicateInstanceId (duplicate_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNotificationConfig" ->
         (`InvalidNotificationConfig (invalid_notification_config_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidOutputFolder" ->
         (`InvalidOutputFolder (invalid_output_folder_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidParameters" ->
         (`InvalidParameters (invalid_parameters_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidRole" ->
         (`InvalidRole (invalid_role_of_yojson tree path))
      | "com.amazonaws.ssm", "MaxDocumentSizeExceeded" ->
         (`MaxDocumentSizeExceeded (max_document_size_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedPlatformType" ->
         (`UnsupportedPlatformType (unsupported_platform_type_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: send_command_request) ->
    let input = Serializers.send_command_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.SendCommand" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.send_command_result_of_yojson
      ~error_deserializer
      
end

module SendAutomationSignal = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AutomationExecutionNotFoundException" ->
         (`AutomationExecutionNotFoundException (automation_execution_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "AutomationStepNotFoundException" ->
         (`AutomationStepNotFoundException (automation_step_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAutomationSignalException" ->
         (`InvalidAutomationSignalException (invalid_automation_signal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: send_automation_signal_request) ->
    let input = Serializers.send_automation_signal_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.SendAutomationSignal" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.send_automation_signal_result_of_yojson
      ~error_deserializer
      
end

module ResumeSession = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: resume_session_request) ->
    let input = Serializers.resume_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ResumeSession" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.resume_session_response_of_yojson
      ~error_deserializer
      
end

module ResetServiceSetting = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ServiceSettingNotFound" ->
         (`ServiceSettingNotFound (service_setting_not_found_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: reset_service_setting_request) ->
    let input = Serializers.reset_service_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ResetServiceSetting" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.reset_service_setting_result_of_yojson
      ~error_deserializer
      
end

module RemoveTagsFromResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceType" ->
         (`InvalidResourceType (invalid_resource_type_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_tags_from_resource_request) ->
    let input = Serializers.remove_tags_from_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.RemoveTagsFromResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.remove_tags_from_resource_result_of_yojson
      ~error_deserializer
      
end

module RegisterTaskWithMaintenanceWindow = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "FeatureNotAvailableException" ->
         (`FeatureNotAvailableException (feature_not_available_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "IdempotentParameterMismatch" ->
         (`IdempotentParameterMismatch (idempotent_parameter_mismatch_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceLimitExceededException" ->
         (`ResourceLimitExceededException (resource_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_task_with_maintenance_window_request) ->
    let input = Serializers.register_task_with_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.RegisterTaskWithMaintenanceWindow" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_task_with_maintenance_window_result_of_yojson
      ~error_deserializer
      
end

module RegisterTargetWithMaintenanceWindow = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "IdempotentParameterMismatch" ->
         (`IdempotentParameterMismatch (idempotent_parameter_mismatch_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceLimitExceededException" ->
         (`ResourceLimitExceededException (resource_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_target_with_maintenance_window_request) ->
    let input = Serializers.register_target_with_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.RegisterTargetWithMaintenanceWindow" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_target_with_maintenance_window_result_of_yojson
      ~error_deserializer
      
end

module RegisterPatchBaselineForPatchGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AlreadyExistsException" ->
         (`AlreadyExistsException (already_exists_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceLimitExceededException" ->
         (`ResourceLimitExceededException (resource_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_patch_baseline_for_patch_group_request) ->
    let input = Serializers.register_patch_baseline_for_patch_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.RegisterPatchBaselineForPatchGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_patch_baseline_for_patch_group_result_of_yojson
      ~error_deserializer
      
end

module RegisterDefaultPatchBaseline = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_default_patch_baseline_request) ->
    let input = Serializers.register_default_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.RegisterDefaultPatchBaseline" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_default_patch_baseline_result_of_yojson
      ~error_deserializer
      
end

module PutResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "MalformedResourcePolicyDocumentException" ->
         (`MalformedResourcePolicyDocumentException (malformed_resource_policy_document_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourcePolicyConflictException" ->
         (`ResourcePolicyConflictException (resource_policy_conflict_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourcePolicyInvalidParameterException" ->
         (`ResourcePolicyInvalidParameterException (resource_policy_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourcePolicyLimitExceededException" ->
         (`ResourcePolicyLimitExceededException (resource_policy_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourcePolicyNotFoundException" ->
         (`ResourcePolicyNotFoundException (resource_policy_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_resource_policy_request) ->
    let input = Serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.PutResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
      
end

module PutParameter = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "HierarchyLevelLimitExceededException" ->
         (`HierarchyLevelLimitExceededException (hierarchy_level_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "HierarchyTypeMismatchException" ->
         (`HierarchyTypeMismatchException (hierarchy_type_mismatch_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "IncompatiblePolicyException" ->
         (`IncompatiblePolicyException (incompatible_policy_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAllowedPatternException" ->
         (`InvalidAllowedPatternException (invalid_allowed_pattern_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidKeyId" ->
         (`InvalidKeyId (invalid_key_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidPolicyAttributeException" ->
         (`InvalidPolicyAttributeException (invalid_policy_attribute_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidPolicyTypeException" ->
         (`InvalidPolicyTypeException (invalid_policy_type_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterAlreadyExists" ->
         (`ParameterAlreadyExists (parameter_already_exists_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterLimitExceeded" ->
         (`ParameterLimitExceeded (parameter_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterMaxVersionLimitExceeded" ->
         (`ParameterMaxVersionLimitExceeded (parameter_max_version_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterPatternMismatchException" ->
         (`ParameterPatternMismatchException (parameter_pattern_mismatch_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "PoliciesLimitExceededException" ->
         (`PoliciesLimitExceededException (policies_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedParameterType" ->
         (`UnsupportedParameterType (unsupported_parameter_type_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_parameter_request) ->
    let input = Serializers.put_parameter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.PutParameter" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_parameter_result_of_yojson
      ~error_deserializer
      
end

module PutInventory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "CustomSchemaCountLimitExceededException" ->
         (`CustomSchemaCountLimitExceededException (custom_schema_count_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInventoryItemContextException" ->
         (`InvalidInventoryItemContextException (invalid_inventory_item_context_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidItemContentException" ->
         (`InvalidItemContentException (invalid_item_content_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTypeNameException" ->
         (`InvalidTypeNameException (invalid_type_name_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ItemContentMismatchException" ->
         (`ItemContentMismatchException (item_content_mismatch_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ItemSizeLimitExceededException" ->
         (`ItemSizeLimitExceededException (item_size_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "SubTypeCountLimitExceededException" ->
         (`SubTypeCountLimitExceededException (sub_type_count_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "TotalSizeLimitExceededException" ->
         (`TotalSizeLimitExceededException (total_size_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedInventoryItemContextException" ->
         (`UnsupportedInventoryItemContextException (unsupported_inventory_item_context_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedInventorySchemaVersionException" ->
         (`UnsupportedInventorySchemaVersionException (unsupported_inventory_schema_version_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_inventory_request) ->
    let input = Serializers.put_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.PutInventory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_inventory_result_of_yojson
      ~error_deserializer
      
end

module PutComplianceItems = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "ComplianceTypeCountLimitExceededException" ->
         (`ComplianceTypeCountLimitExceededException (compliance_type_count_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidItemContentException" ->
         (`InvalidItemContentException (invalid_item_content_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceType" ->
         (`InvalidResourceType (invalid_resource_type_of_yojson tree path))
      | "com.amazonaws.ssm", "ItemSizeLimitExceededException" ->
         (`ItemSizeLimitExceededException (item_size_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "TotalSizeLimitExceededException" ->
         (`TotalSizeLimitExceededException (total_size_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_compliance_items_request) ->
    let input = Serializers.put_compliance_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.PutComplianceItems" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_compliance_items_result_of_yojson
      ~error_deserializer
      
end

module ModifyDocumentPermission = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DocumentLimitExceeded" ->
         (`DocumentLimitExceeded (document_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "DocumentPermissionLimit" ->
         (`DocumentPermissionLimit (document_permission_limit_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidPermissionType" ->
         (`InvalidPermissionType (invalid_permission_type_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: modify_document_permission_request) ->
    let input = Serializers.modify_document_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ModifyDocumentPermission" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.modify_document_permission_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceType" ->
         (`InvalidResourceType (invalid_resource_type_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer
      
end

module ListResourceDataSync = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncInvalidConfigurationException" ->
         (`ResourceDataSyncInvalidConfigurationException (resource_data_sync_invalid_configuration_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resource_data_sync_request) ->
    let input = Serializers.list_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListResourceDataSync" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resource_data_sync_result_of_yojson
      ~error_deserializer
      
end

module ListResourceComplianceSummaries = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilter" ->
         (`InvalidFilter (invalid_filter_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resource_compliance_summaries_request) ->
    let input = Serializers.list_resource_compliance_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListResourceComplianceSummaries" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resource_compliance_summaries_result_of_yojson
      ~error_deserializer
      
end

module ListOpsMetadata = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataInvalidArgumentException" ->
         (`OpsMetadataInvalidArgumentException (ops_metadata_invalid_argument_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_ops_metadata_request) ->
    let input = Serializers.list_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListOpsMetadata" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_ops_metadata_result_of_yojson
      ~error_deserializer
      
end

module ListOpsItemRelatedItems = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemInvalidParameterException" ->
         (`OpsItemInvalidParameterException (ops_item_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_ops_item_related_items_request) ->
    let input = Serializers.list_ops_item_related_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListOpsItemRelatedItems" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_ops_item_related_items_response_of_yojson
      ~error_deserializer
      
end

module ListOpsItemEvents = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemInvalidParameterException" ->
         (`OpsItemInvalidParameterException (ops_item_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemLimitExceededException" ->
         (`OpsItemLimitExceededException (ops_item_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemNotFoundException" ->
         (`OpsItemNotFoundException (ops_item_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_ops_item_events_request) ->
    let input = Serializers.list_ops_item_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListOpsItemEvents" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_ops_item_events_response_of_yojson
      ~error_deserializer
      
end

module ListInventoryEntries = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilter" ->
         (`InvalidFilter (invalid_filter_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTypeNameException" ->
         (`InvalidTypeNameException (invalid_type_name_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_inventory_entries_request) ->
    let input = Serializers.list_inventory_entries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListInventoryEntries" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_inventory_entries_result_of_yojson
      ~error_deserializer
      
end

module ListDocuments = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_documents_request) ->
    let input = Serializers.list_documents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListDocuments" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_documents_result_of_yojson
      ~error_deserializer
      
end

module ListDocumentVersions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_document_versions_request) ->
    let input = Serializers.list_document_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListDocumentVersions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_document_versions_result_of_yojson
      ~error_deserializer
      
end

module ListDocumentMetadataHistory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_document_metadata_history_request) ->
    let input = Serializers.list_document_metadata_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListDocumentMetadataHistory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_document_metadata_history_response_of_yojson
      ~error_deserializer
      
end

module ListComplianceSummaries = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilter" ->
         (`InvalidFilter (invalid_filter_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_compliance_summaries_request) ->
    let input = Serializers.list_compliance_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListComplianceSummaries" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_compliance_summaries_result_of_yojson
      ~error_deserializer
      
end

module ListComplianceItems = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilter" ->
         (`InvalidFilter (invalid_filter_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceType" ->
         (`InvalidResourceType (invalid_resource_type_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_compliance_items_request) ->
    let input = Serializers.list_compliance_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListComplianceItems" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_compliance_items_result_of_yojson
      ~error_deserializer
      
end

module ListCommands = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidCommandId" ->
         (`InvalidCommandId (invalid_command_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_commands_request) ->
    let input = Serializers.list_commands_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListCommands" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_commands_result_of_yojson
      ~error_deserializer
      
end

module ListCommandInvocations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidCommandId" ->
         (`InvalidCommandId (invalid_command_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_command_invocations_request) ->
    let input = Serializers.list_command_invocations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListCommandInvocations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_command_invocations_result_of_yojson
      ~error_deserializer
      
end

module ListAssociations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_associations_request) ->
    let input = Serializers.list_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListAssociations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_associations_result_of_yojson
      ~error_deserializer
      
end

module ListAssociationVersions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationDoesNotExist" ->
         (`AssociationDoesNotExist (association_does_not_exist_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_association_versions_request) ->
    let input = Serializers.list_association_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.ListAssociationVersions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_association_versions_result_of_yojson
      ~error_deserializer
      
end

module LabelParameterVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterNotFound" ->
         (`ParameterNotFound (parameter_not_found_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterVersionLabelLimitExceeded" ->
         (`ParameterVersionLabelLimitExceeded (parameter_version_label_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterVersionNotFound" ->
         (`ParameterVersionNotFound (parameter_version_not_found_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: label_parameter_version_request) ->
    let input = Serializers.label_parameter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.LabelParameterVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.label_parameter_version_result_of_yojson
      ~error_deserializer
      
end

module GetServiceSetting = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ServiceSettingNotFound" ->
         (`ServiceSettingNotFound (service_setting_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_service_setting_request) ->
    let input = Serializers.get_service_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetServiceSetting" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_service_setting_result_of_yojson
      ~error_deserializer
      
end

module GetResourcePolicies = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourcePolicyInvalidParameterException" ->
         (`ResourcePolicyInvalidParameterException (resource_policy_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_policies_request) ->
    let input = Serializers.get_resource_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetResourcePolicies" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_policies_response_of_yojson
      ~error_deserializer
      
end

module GetPatchBaselineForPatchGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_patch_baseline_for_patch_group_request) ->
    let input = Serializers.get_patch_baseline_for_patch_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetPatchBaselineForPatchGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_patch_baseline_for_patch_group_result_of_yojson
      ~error_deserializer
      
end

module GetPatchBaseline = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_patch_baseline_request) ->
    let input = Serializers.get_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetPatchBaseline" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_patch_baseline_result_of_yojson
      ~error_deserializer
      
end

module GetParametersByPath = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterOption" ->
         (`InvalidFilterOption (invalid_filter_option_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterValue" ->
         (`InvalidFilterValue (invalid_filter_value_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidKeyId" ->
         (`InvalidKeyId (invalid_key_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_parameters_by_path_request) ->
    let input = Serializers.get_parameters_by_path_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetParametersByPath" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_parameters_by_path_result_of_yojson
      ~error_deserializer
      
end

module GetParameters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidKeyId" ->
         (`InvalidKeyId (invalid_key_id_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_parameters_request) ->
    let input = Serializers.get_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetParameters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_parameters_result_of_yojson
      ~error_deserializer
      
end

module GetParameterHistory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidKeyId" ->
         (`InvalidKeyId (invalid_key_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterNotFound" ->
         (`ParameterNotFound (parameter_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_parameter_history_request) ->
    let input = Serializers.get_parameter_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetParameterHistory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_parameter_history_result_of_yojson
      ~error_deserializer
      
end

module GetParameter = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidKeyId" ->
         (`InvalidKeyId (invalid_key_id_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterNotFound" ->
         (`ParameterNotFound (parameter_not_found_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterVersionNotFound" ->
         (`ParameterVersionNotFound (parameter_version_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_parameter_request) ->
    let input = Serializers.get_parameter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetParameter" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_parameter_result_of_yojson
      ~error_deserializer
      
end

module GetOpsSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAggregatorException" ->
         (`InvalidAggregatorException (invalid_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilter" ->
         (`InvalidFilter (invalid_filter_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTypeNameException" ->
         (`InvalidTypeNameException (invalid_type_name_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncNotFoundException" ->
         (`ResourceDataSyncNotFoundException (resource_data_sync_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_ops_summary_request) ->
    let input = Serializers.get_ops_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetOpsSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_ops_summary_result_of_yojson
      ~error_deserializer
      
end

module GetOpsMetadata = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataInvalidArgumentException" ->
         (`OpsMetadataInvalidArgumentException (ops_metadata_invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataNotFoundException" ->
         (`OpsMetadataNotFoundException (ops_metadata_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_ops_metadata_request) ->
    let input = Serializers.get_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetOpsMetadata" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_ops_metadata_result_of_yojson
      ~error_deserializer
      
end

module GetOpsItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemAccessDeniedException" ->
         (`OpsItemAccessDeniedException (ops_item_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemNotFoundException" ->
         (`OpsItemNotFoundException (ops_item_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_ops_item_request) ->
    let input = Serializers.get_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetOpsItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_ops_item_response_of_yojson
      ~error_deserializer
      
end

module GetMaintenanceWindowTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_maintenance_window_task_request) ->
    let input = Serializers.get_maintenance_window_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetMaintenanceWindowTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_maintenance_window_task_result_of_yojson
      ~error_deserializer
      
end

module GetMaintenanceWindowExecutionTaskInvocation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_maintenance_window_execution_task_invocation_request) ->
    let input = Serializers.get_maintenance_window_execution_task_invocation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetMaintenanceWindowExecutionTaskInvocation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_maintenance_window_execution_task_invocation_result_of_yojson
      ~error_deserializer
      
end

module GetMaintenanceWindowExecutionTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_maintenance_window_execution_task_request) ->
    let input = Serializers.get_maintenance_window_execution_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetMaintenanceWindowExecutionTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_maintenance_window_execution_task_result_of_yojson
      ~error_deserializer
      
end

module GetMaintenanceWindowExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_maintenance_window_execution_request) ->
    let input = Serializers.get_maintenance_window_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetMaintenanceWindowExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_maintenance_window_execution_result_of_yojson
      ~error_deserializer
      
end

module GetMaintenanceWindow = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_maintenance_window_request) ->
    let input = Serializers.get_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetMaintenanceWindow" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_maintenance_window_result_of_yojson
      ~error_deserializer
      
end

module GetInventorySchema = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTypeNameException" ->
         (`InvalidTypeNameException (invalid_type_name_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_inventory_schema_request) ->
    let input = Serializers.get_inventory_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetInventorySchema" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_inventory_schema_result_of_yojson
      ~error_deserializer
      
end

module GetInventory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAggregatorException" ->
         (`InvalidAggregatorException (invalid_aggregator_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilter" ->
         (`InvalidFilter (invalid_filter_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInventoryGroupException" ->
         (`InvalidInventoryGroupException (invalid_inventory_group_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResultAttributeException" ->
         (`InvalidResultAttributeException (invalid_result_attribute_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTypeNameException" ->
         (`InvalidTypeNameException (invalid_type_name_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_inventory_request) ->
    let input = Serializers.get_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetInventory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_inventory_result_of_yojson
      ~error_deserializer
      
end

module GetDocument = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_document_request) ->
    let input = Serializers.get_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetDocument" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_document_result_of_yojson
      ~error_deserializer
      
end

module GetDeployablePatchSnapshotForInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedFeatureRequiredException" ->
         (`UnsupportedFeatureRequiredException (unsupported_feature_required_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedOperatingSystem" ->
         (`UnsupportedOperatingSystem (unsupported_operating_system_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_deployable_patch_snapshot_for_instance_request) ->
    let input = Serializers.get_deployable_patch_snapshot_for_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetDeployablePatchSnapshotForInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_deployable_patch_snapshot_for_instance_result_of_yojson
      ~error_deserializer
      
end

module GetDefaultPatchBaseline = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_default_patch_baseline_request) ->
    let input = Serializers.get_default_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetDefaultPatchBaseline" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_default_patch_baseline_result_of_yojson
      ~error_deserializer
      
end

module GetConnectionStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_connection_status_request) ->
    let input = Serializers.get_connection_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetConnectionStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_connection_status_response_of_yojson
      ~error_deserializer
      
end

module GetCommandInvocation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidCommandId" ->
         (`InvalidCommandId (invalid_command_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidPluginName" ->
         (`InvalidPluginName (invalid_plugin_name_of_yojson tree path))
      | "com.amazonaws.ssm", "InvocationDoesNotExist" ->
         (`InvocationDoesNotExist (invocation_does_not_exist_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_command_invocation_request) ->
    let input = Serializers.get_command_invocation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetCommandInvocation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_command_invocation_result_of_yojson
      ~error_deserializer
      
end

module GetCalendarState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentType" ->
         (`InvalidDocumentType (invalid_document_type_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedCalendarException" ->
         (`UnsupportedCalendarException (unsupported_calendar_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_calendar_state_request) ->
    let input = Serializers.get_calendar_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetCalendarState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_calendar_state_response_of_yojson
      ~error_deserializer
      
end

module GetAutomationExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AutomationExecutionNotFoundException" ->
         (`AutomationExecutionNotFoundException (automation_execution_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_automation_execution_request) ->
    let input = Serializers.get_automation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.GetAutomationExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_automation_execution_result_of_yojson
      ~error_deserializer
      
end

module DisassociateOpsItemRelatedItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemConflictException" ->
         (`OpsItemConflictException (ops_item_conflict_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemInvalidParameterException" ->
         (`OpsItemInvalidParameterException (ops_item_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemNotFoundException" ->
         (`OpsItemNotFoundException (ops_item_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemRelatedItemAssociationNotFoundException" ->
         (`OpsItemRelatedItemAssociationNotFoundException (ops_item_related_item_association_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_ops_item_related_item_request) ->
    let input = Serializers.disassociate_ops_item_related_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DisassociateOpsItemRelatedItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_ops_item_related_item_response_of_yojson
      ~error_deserializer
      
end

module DescribeSessions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_sessions_request) ->
    let input = Serializers.describe_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeSessions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_sessions_response_of_yojson
      ~error_deserializer
      
end

module DescribePatchProperties = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_patch_properties_request) ->
    let input = Serializers.describe_patch_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribePatchProperties" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_patch_properties_result_of_yojson
      ~error_deserializer
      
end

module DescribePatchGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_patch_groups_request) ->
    let input = Serializers.describe_patch_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribePatchGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_patch_groups_result_of_yojson
      ~error_deserializer
      
end

module DescribePatchGroupState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_patch_group_state_request) ->
    let input = Serializers.describe_patch_group_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribePatchGroupState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_patch_group_state_result_of_yojson
      ~error_deserializer
      
end

module DescribePatchBaselines = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_patch_baselines_request) ->
    let input = Serializers.describe_patch_baselines_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribePatchBaselines" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_patch_baselines_result_of_yojson
      ~error_deserializer
      
end

module DescribeParameters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterOption" ->
         (`InvalidFilterOption (invalid_filter_option_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterValue" ->
         (`InvalidFilterValue (invalid_filter_value_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_parameters_request) ->
    let input = Serializers.describe_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeParameters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_parameters_result_of_yojson
      ~error_deserializer
      
end

module DescribeOpsItems = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_ops_items_request) ->
    let input = Serializers.describe_ops_items_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeOpsItems" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_ops_items_response_of_yojson
      ~error_deserializer
      
end

module DescribeMaintenanceWindowsForTarget = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_maintenance_windows_for_target_request) ->
    let input = Serializers.describe_maintenance_windows_for_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindowsForTarget" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_maintenance_windows_for_target_result_of_yojson
      ~error_deserializer
      
end

module DescribeMaintenanceWindows = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_maintenance_windows_request) ->
    let input = Serializers.describe_maintenance_windows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindows" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_maintenance_windows_result_of_yojson
      ~error_deserializer
      
end

module DescribeMaintenanceWindowTasks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_maintenance_window_tasks_request) ->
    let input = Serializers.describe_maintenance_window_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindowTasks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_maintenance_window_tasks_result_of_yojson
      ~error_deserializer
      
end

module DescribeMaintenanceWindowTargets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_maintenance_window_targets_request) ->
    let input = Serializers.describe_maintenance_window_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindowTargets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_maintenance_window_targets_result_of_yojson
      ~error_deserializer
      
end

module DescribeMaintenanceWindowSchedule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_maintenance_window_schedule_request) ->
    let input = Serializers.describe_maintenance_window_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindowSchedule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_maintenance_window_schedule_result_of_yojson
      ~error_deserializer
      
end

module DescribeMaintenanceWindowExecutions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_maintenance_window_executions_request) ->
    let input = Serializers.describe_maintenance_window_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindowExecutions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_maintenance_window_executions_result_of_yojson
      ~error_deserializer
      
end

module DescribeMaintenanceWindowExecutionTasks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_maintenance_window_execution_tasks_request) ->
    let input = Serializers.describe_maintenance_window_execution_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindowExecutionTasks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_maintenance_window_execution_tasks_result_of_yojson
      ~error_deserializer
      
end

module DescribeMaintenanceWindowExecutionTaskInvocations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_maintenance_window_execution_task_invocations_request) ->
    let input = Serializers.describe_maintenance_window_execution_task_invocations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeMaintenanceWindowExecutionTaskInvocations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_maintenance_window_execution_task_invocations_result_of_yojson
      ~error_deserializer
      
end

module DescribeInventoryDeletions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDeletionIdException" ->
         (`InvalidDeletionIdException (invalid_deletion_id_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_inventory_deletions_request) ->
    let input = Serializers.describe_inventory_deletions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeInventoryDeletions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_inventory_deletions_result_of_yojson
      ~error_deserializer
      
end

module DescribeInstanceProperties = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidActivationId" ->
         (`InvalidActivationId (invalid_activation_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstancePropertyFilterValue" ->
         (`InvalidInstancePropertyFilterValue (invalid_instance_property_filter_value_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_instance_properties_request) ->
    let input = Serializers.describe_instance_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeInstanceProperties" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_instance_properties_result_of_yojson
      ~error_deserializer
      
end

module DescribeInstancePatches = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilter" ->
         (`InvalidFilter (invalid_filter_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_instance_patches_request) ->
    let input = Serializers.describe_instance_patches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeInstancePatches" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_instance_patches_result_of_yojson
      ~error_deserializer
      
end

module DescribeInstancePatchStatesForPatchGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilter" ->
         (`InvalidFilter (invalid_filter_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_instance_patch_states_for_patch_group_request) ->
    let input = Serializers.describe_instance_patch_states_for_patch_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeInstancePatchStatesForPatchGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_instance_patch_states_for_patch_group_result_of_yojson
      ~error_deserializer
      
end

module DescribeInstancePatchStates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_instance_patch_states_request) ->
    let input = Serializers.describe_instance_patch_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeInstancePatchStates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_instance_patch_states_result_of_yojson
      ~error_deserializer
      
end

module DescribeInstanceInformation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceInformationFilterValue" ->
         (`InvalidInstanceInformationFilterValue (invalid_instance_information_filter_value_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_instance_information_request) ->
    let input = Serializers.describe_instance_information_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeInstanceInformation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_instance_information_result_of_yojson
      ~error_deserializer
      
end

module DescribeInstanceAssociationsStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_instance_associations_status_request) ->
    let input = Serializers.describe_instance_associations_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeInstanceAssociationsStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_instance_associations_status_result_of_yojson
      ~error_deserializer
      
end

module DescribeEffectivePatchesForPatchBaseline = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedOperatingSystem" ->
         (`UnsupportedOperatingSystem (unsupported_operating_system_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_effective_patches_for_patch_baseline_request) ->
    let input = Serializers.describe_effective_patches_for_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeEffectivePatchesForPatchBaseline" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_effective_patches_for_patch_baseline_result_of_yojson
      ~error_deserializer
      
end

module DescribeEffectiveInstanceAssociations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_effective_instance_associations_request) ->
    let input = Serializers.describe_effective_instance_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeEffectiveInstanceAssociations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_effective_instance_associations_result_of_yojson
      ~error_deserializer
      
end

module DescribeDocumentPermission = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentOperation" ->
         (`InvalidDocumentOperation (invalid_document_operation_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidPermissionType" ->
         (`InvalidPermissionType (invalid_permission_type_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_document_permission_request) ->
    let input = Serializers.describe_document_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeDocumentPermission" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_document_permission_response_of_yojson
      ~error_deserializer
      
end

module DescribeDocument = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_document_request) ->
    let input = Serializers.describe_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeDocument" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_document_result_of_yojson
      ~error_deserializer
      
end

module DescribeAvailablePatches = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_available_patches_request) ->
    let input = Serializers.describe_available_patches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeAvailablePatches" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_available_patches_result_of_yojson
      ~error_deserializer
      
end

module DescribeAutomationStepExecutions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AutomationExecutionNotFoundException" ->
         (`AutomationExecutionNotFoundException (automation_execution_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterValue" ->
         (`InvalidFilterValue (invalid_filter_value_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_automation_step_executions_request) ->
    let input = Serializers.describe_automation_step_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeAutomationStepExecutions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_automation_step_executions_result_of_yojson
      ~error_deserializer
      
end

module DescribeAutomationExecutions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterKey" ->
         (`InvalidFilterKey (invalid_filter_key_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilterValue" ->
         (`InvalidFilterValue (invalid_filter_value_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_automation_executions_request) ->
    let input = Serializers.describe_automation_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeAutomationExecutions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_automation_executions_result_of_yojson
      ~error_deserializer
      
end

module DescribeAssociationExecutions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationDoesNotExist" ->
         (`AssociationDoesNotExist (association_does_not_exist_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_association_executions_request) ->
    let input = Serializers.describe_association_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeAssociationExecutions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_association_executions_result_of_yojson
      ~error_deserializer
      
end

module DescribeAssociationExecutionTargets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationDoesNotExist" ->
         (`AssociationDoesNotExist (association_does_not_exist_of_yojson tree path))
      | "com.amazonaws.ssm", "AssociationExecutionDoesNotExist" ->
         (`AssociationExecutionDoesNotExist (association_execution_does_not_exist_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_association_execution_targets_request) ->
    let input = Serializers.describe_association_execution_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeAssociationExecutionTargets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_association_execution_targets_result_of_yojson
      ~error_deserializer
      
end

module DescribeAssociation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationDoesNotExist" ->
         (`AssociationDoesNotExist (association_does_not_exist_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidAssociationVersion" ->
         (`InvalidAssociationVersion (invalid_association_version_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_association_request) ->
    let input = Serializers.describe_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeAssociation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_association_result_of_yojson
      ~error_deserializer
      
end

module DescribeActivations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidFilter" ->
         (`InvalidFilter (invalid_filter_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidNextToken" ->
         (`InvalidNextToken (invalid_next_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_activations_request) ->
    let input = Serializers.describe_activations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DescribeActivations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_activations_result_of_yojson
      ~error_deserializer
      
end

module DeregisterTaskFromMaintenanceWindow = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_task_from_maintenance_window_request) ->
    let input = Serializers.deregister_task_from_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeregisterTaskFromMaintenanceWindow" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_task_from_maintenance_window_result_of_yojson
      ~error_deserializer
      
end

module DeregisterTargetFromMaintenanceWindow = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "TargetInUseException" ->
         (`TargetInUseException (target_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_target_from_maintenance_window_request) ->
    let input = Serializers.deregister_target_from_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeregisterTargetFromMaintenanceWindow" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_target_from_maintenance_window_result_of_yojson
      ~error_deserializer
      
end

module DeregisterPatchBaselineForPatchGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_patch_baseline_for_patch_group_request) ->
    let input = Serializers.deregister_patch_baseline_for_patch_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeregisterPatchBaselineForPatchGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_patch_baseline_for_patch_group_result_of_yojson
      ~error_deserializer
      
end

module DeregisterManagedInstance = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_managed_instance_request) ->
    let input = Serializers.deregister_managed_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeregisterManagedInstance" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_managed_instance_result_of_yojson
      ~error_deserializer
      
end

module DeleteResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "MalformedResourcePolicyDocumentException" ->
         (`MalformedResourcePolicyDocumentException (malformed_resource_policy_document_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourcePolicyConflictException" ->
         (`ResourcePolicyConflictException (resource_policy_conflict_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourcePolicyInvalidParameterException" ->
         (`ResourcePolicyInvalidParameterException (resource_policy_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourcePolicyNotFoundException" ->
         (`ResourcePolicyNotFoundException (resource_policy_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_resource_policy_request) ->
    let input = Serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
      
end

module DeleteResourceDataSync = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncInvalidConfigurationException" ->
         (`ResourceDataSyncInvalidConfigurationException (resource_data_sync_invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncNotFoundException" ->
         (`ResourceDataSyncNotFoundException (resource_data_sync_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_resource_data_sync_request) ->
    let input = Serializers.delete_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteResourceDataSync" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_resource_data_sync_result_of_yojson
      ~error_deserializer
      
end

module DeletePatchBaseline = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_patch_baseline_request) ->
    let input = Serializers.delete_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeletePatchBaseline" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_patch_baseline_result_of_yojson
      ~error_deserializer
      
end

module DeleteParameters = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_parameters_request) ->
    let input = Serializers.delete_parameters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteParameters" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_parameters_result_of_yojson
      ~error_deserializer
      
end

module DeleteParameter = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ParameterNotFound" ->
         (`ParameterNotFound (parameter_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_parameter_request) ->
    let input = Serializers.delete_parameter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteParameter" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_parameter_result_of_yojson
      ~error_deserializer
      
end

module DeleteOpsMetadata = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataInvalidArgumentException" ->
         (`OpsMetadataInvalidArgumentException (ops_metadata_invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataNotFoundException" ->
         (`OpsMetadataNotFoundException (ops_metadata_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_ops_metadata_request) ->
    let input = Serializers.delete_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteOpsMetadata" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_ops_metadata_result_of_yojson
      ~error_deserializer
      
end

module DeleteOpsItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemInvalidParameterException" ->
         (`OpsItemInvalidParameterException (ops_item_invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_ops_item_request) ->
    let input = Serializers.delete_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteOpsItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_ops_item_response_of_yojson
      ~error_deserializer
      
end

module DeleteMaintenanceWindow = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_maintenance_window_request) ->
    let input = Serializers.delete_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteMaintenanceWindow" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_maintenance_window_result_of_yojson
      ~error_deserializer
      
end

module DeleteInventory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDeleteInventoryParametersException" ->
         (`InvalidDeleteInventoryParametersException (invalid_delete_inventory_parameters_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInventoryRequestException" ->
         (`InvalidInventoryRequestException (invalid_inventory_request_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidOptionException" ->
         (`InvalidOptionException (invalid_option_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTypeNameException" ->
         (`InvalidTypeNameException (invalid_type_name_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_inventory_request) ->
    let input = Serializers.delete_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteInventory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_inventory_result_of_yojson
      ~error_deserializer
      
end

module DeleteDocument = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociatedInstances" ->
         (`AssociatedInstances (associated_instances_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentOperation" ->
         (`InvalidDocumentOperation (invalid_document_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_document_request) ->
    let input = Serializers.delete_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteDocument" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_document_result_of_yojson
      ~error_deserializer
      
end

module DeleteAssociation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationDoesNotExist" ->
         (`AssociationDoesNotExist (association_does_not_exist_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_association_request) ->
    let input = Serializers.delete_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteAssociation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_association_result_of_yojson
      ~error_deserializer
      
end

module DeleteActivation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidActivation" ->
         (`InvalidActivation (invalid_activation_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidActivationId" ->
         (`InvalidActivationId (invalid_activation_id_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_activation_request) ->
    let input = Serializers.delete_activation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.DeleteActivation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_activation_result_of_yojson
      ~error_deserializer
      
end

module CreateResourceDataSync = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncAlreadyExistsException" ->
         (`ResourceDataSyncAlreadyExistsException (resource_data_sync_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncCountExceededException" ->
         (`ResourceDataSyncCountExceededException (resource_data_sync_count_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceDataSyncInvalidConfigurationException" ->
         (`ResourceDataSyncInvalidConfigurationException (resource_data_sync_invalid_configuration_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_resource_data_sync_request) ->
    let input = Serializers.create_resource_data_sync_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CreateResourceDataSync" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_resource_data_sync_result_of_yojson
      ~error_deserializer
      
end

module CreatePatchBaseline = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "IdempotentParameterMismatch" ->
         (`IdempotentParameterMismatch (idempotent_parameter_mismatch_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceLimitExceededException" ->
         (`ResourceLimitExceededException (resource_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_patch_baseline_request) ->
    let input = Serializers.create_patch_baseline_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CreatePatchBaseline" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_patch_baseline_result_of_yojson
      ~error_deserializer
      
end

module CreateOpsMetadata = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataAlreadyExistsException" ->
         (`OpsMetadataAlreadyExistsException (ops_metadata_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataInvalidArgumentException" ->
         (`OpsMetadataInvalidArgumentException (ops_metadata_invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataLimitExceededException" ->
         (`OpsMetadataLimitExceededException (ops_metadata_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsMetadataTooManyUpdatesException" ->
         (`OpsMetadataTooManyUpdatesException (ops_metadata_too_many_updates_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_ops_metadata_request) ->
    let input = Serializers.create_ops_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CreateOpsMetadata" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_ops_metadata_result_of_yojson
      ~error_deserializer
      
end

module CreateOpsItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemAccessDeniedException" ->
         (`OpsItemAccessDeniedException (ops_item_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemAlreadyExistsException" ->
         (`OpsItemAlreadyExistsException (ops_item_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemInvalidParameterException" ->
         (`OpsItemInvalidParameterException (ops_item_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemLimitExceededException" ->
         (`OpsItemLimitExceededException (ops_item_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_ops_item_request) ->
    let input = Serializers.create_ops_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CreateOpsItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_ops_item_response_of_yojson
      ~error_deserializer
      
end

module CreateMaintenanceWindow = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "IdempotentParameterMismatch" ->
         (`IdempotentParameterMismatch (idempotent_parameter_mismatch_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "ResourceLimitExceededException" ->
         (`ResourceLimitExceededException (resource_limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_maintenance_window_request) ->
    let input = Serializers.create_maintenance_window_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CreateMaintenanceWindow" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_maintenance_window_result_of_yojson
      ~error_deserializer
      
end

module CreateDocument = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DocumentAlreadyExists" ->
         (`DocumentAlreadyExists (document_already_exists_of_yojson tree path))
      | "com.amazonaws.ssm", "DocumentLimitExceeded" ->
         (`DocumentLimitExceeded (document_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentContent" ->
         (`InvalidDocumentContent (invalid_document_content_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentSchemaVersion" ->
         (`InvalidDocumentSchemaVersion (invalid_document_schema_version_of_yojson tree path))
      | "com.amazonaws.ssm", "MaxDocumentSizeExceeded" ->
         (`MaxDocumentSizeExceeded (max_document_size_exceeded_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_document_request) ->
    let input = Serializers.create_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CreateDocument" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_document_result_of_yojson
      ~error_deserializer
      
end

module CreateAssociationBatch = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationLimitExceeded" ->
         (`AssociationLimitExceeded (association_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "DuplicateInstanceId" ->
         (`DuplicateInstanceId (duplicate_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidOutputLocation" ->
         (`InvalidOutputLocation (invalid_output_location_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidParameters" ->
         (`InvalidParameters (invalid_parameters_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidSchedule" ->
         (`InvalidSchedule (invalid_schedule_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTarget" ->
         (`InvalidTarget (invalid_target_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTargetMaps" ->
         (`InvalidTargetMaps (invalid_target_maps_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedPlatformType" ->
         (`UnsupportedPlatformType (unsupported_platform_type_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_association_batch_request) ->
    let input = Serializers.create_association_batch_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CreateAssociationBatch" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_association_batch_result_of_yojson
      ~error_deserializer
      
end

module CreateAssociation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "AssociationAlreadyExists" ->
         (`AssociationAlreadyExists (association_already_exists_of_yojson tree path))
      | "com.amazonaws.ssm", "AssociationLimitExceeded" ->
         (`AssociationLimitExceeded (association_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocument" ->
         (`InvalidDocument (invalid_document_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidDocumentVersion" ->
         (`InvalidDocumentVersion (invalid_document_version_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidOutputLocation" ->
         (`InvalidOutputLocation (invalid_output_location_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidParameters" ->
         (`InvalidParameters (invalid_parameters_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidSchedule" ->
         (`InvalidSchedule (invalid_schedule_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTag" ->
         (`InvalidTag (invalid_tag_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTarget" ->
         (`InvalidTarget (invalid_target_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidTargetMaps" ->
         (`InvalidTargetMaps (invalid_target_maps_of_yojson tree path))
      | "com.amazonaws.ssm", "UnsupportedPlatformType" ->
         (`UnsupportedPlatformType (unsupported_platform_type_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_association_request) ->
    let input = Serializers.create_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CreateAssociation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_association_result_of_yojson
      ~error_deserializer
      
end

module CreateActivation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidParameters" ->
         (`InvalidParameters (invalid_parameters_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_activation_request) ->
    let input = Serializers.create_activation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CreateActivation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_activation_result_of_yojson
      ~error_deserializer
      
end

module CancelMaintenanceWindowExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DoesNotExistException" ->
         (`DoesNotExistException (does_not_exist_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_maintenance_window_execution_request) ->
    let input = Serializers.cancel_maintenance_window_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CancelMaintenanceWindowExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_maintenance_window_execution_result_of_yojson
      ~error_deserializer
      
end

module CancelCommand = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "DuplicateInstanceId" ->
         (`DuplicateInstanceId (duplicate_instance_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidCommandId" ->
         (`InvalidCommandId (invalid_command_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidInstanceId" ->
         (`InvalidInstanceId (invalid_instance_id_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_command_request) ->
    let input = Serializers.cancel_command_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.CancelCommand" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_command_result_of_yojson
      ~error_deserializer
      
end

module AssociateOpsItemRelatedItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemConflictException" ->
         (`OpsItemConflictException (ops_item_conflict_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemInvalidParameterException" ->
         (`OpsItemInvalidParameterException (ops_item_invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemLimitExceededException" ->
         (`OpsItemLimitExceededException (ops_item_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemNotFoundException" ->
         (`OpsItemNotFoundException (ops_item_not_found_exception_of_yojson tree path))
      | "com.amazonaws.ssm", "OpsItemRelatedItemAlreadyExistsException" ->
         (`OpsItemRelatedItemAlreadyExistsException (ops_item_related_item_already_exists_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_ops_item_related_item_request) ->
    let input = Serializers.associate_ops_item_related_item_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.AssociateOpsItemRelatedItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_ops_item_related_item_response_of_yojson
      ~error_deserializer
      
end

module AddTagsToResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.ssm", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceId" ->
         (`InvalidResourceId (invalid_resource_id_of_yojson tree path))
      | "com.amazonaws.ssm", "InvalidResourceType" ->
         (`InvalidResourceType (invalid_resource_type_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyTagsError" ->
         (`TooManyTagsError (too_many_tags_error_of_yojson tree path))
      | "com.amazonaws.ssm", "TooManyUpdates" ->
         (`TooManyUpdates (too_many_updates_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_tags_to_resource_request) ->
    let input = Serializers.add_tags_to_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSSM.AddTagsToResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.add_tags_to_resource_result_of_yojson
      ~error_deserializer
      
end

