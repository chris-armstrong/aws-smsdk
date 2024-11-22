open Types 
let (let+) res map = Result.map map res
module ValidateStateMachineDefinition = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: validate_state_machine_definition_input) ->
    let input = Serializers.validate_state_machine_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.ValidateStateMachineDefinition" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.validate_state_machine_definition_output_of_yojson
      ~error_deserializer
      
end

module UpdateStateMachineAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDeleting" ->
         (`StateMachineDeleting (state_machine_deleting_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_state_machine_alias_input) ->
    let input = Serializers.update_state_machine_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.UpdateStateMachineAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_state_machine_alias_output_of_yojson
      ~error_deserializer
      
end

module UpdateStateMachine = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidDefinition" ->
         (`InvalidDefinition (invalid_definition_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidLoggingConfiguration" ->
         (`InvalidLoggingConfiguration (invalid_logging_configuration_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidTracingConfiguration" ->
         (`InvalidTracingConfiguration (invalid_tracing_configuration_of_yojson tree path))
      | "com.amazonaws.sfn", "MissingRequiredParameter" ->
         (`MissingRequiredParameter (missing_required_parameter_of_yojson tree path))
      | "com.amazonaws.sfn", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDeleting" ->
         (`StateMachineDeleting (state_machine_deleting_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDoesNotExist" ->
         (`StateMachineDoesNotExist (state_machine_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_state_machine_input) ->
    let input = Serializers.update_state_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.UpdateStateMachine" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_state_machine_output_of_yojson
      ~error_deserializer
      
end

module UpdateMapRun = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_map_run_input) ->
    let input = Serializers.update_map_run_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.UpdateMapRun" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_map_run_output_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_input) ->
    let input = Serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_output_of_yojson
      ~error_deserializer
      
end

module TestState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidDefinition" ->
         (`InvalidDefinition (invalid_definition_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidExecutionInput" ->
         (`InvalidExecutionInput (invalid_execution_input_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: test_state_input) ->
    let input = Serializers.test_state_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.TestState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.test_state_output_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | "com.amazonaws.sfn", "TooManyTags" ->
         (`TooManyTags (too_many_tags_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_input) ->
    let input = Serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_output_of_yojson
      ~error_deserializer
      
end

module StopExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ExecutionDoesNotExist" ->
         (`ExecutionDoesNotExist (execution_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_execution_input) ->
    let input = Serializers.stop_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.StopExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.stop_execution_output_of_yojson
      ~error_deserializer
      
end

module StartSyncExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidExecutionInput" ->
         (`InvalidExecutionInput (invalid_execution_input_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidName" ->
         (`InvalidName (invalid_name_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDeleting" ->
         (`StateMachineDeleting (state_machine_deleting_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDoesNotExist" ->
         (`StateMachineDoesNotExist (state_machine_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineTypeNotSupported" ->
         (`StateMachineTypeNotSupported (state_machine_type_not_supported_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_sync_execution_input) ->
    let input = Serializers.start_sync_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.StartSyncExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_sync_execution_output_of_yojson
      ~error_deserializer
      
end

module StartExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ExecutionAlreadyExists" ->
         (`ExecutionAlreadyExists (execution_already_exists_of_yojson tree path))
      | "com.amazonaws.sfn", "ExecutionLimitExceeded" ->
         (`ExecutionLimitExceeded (execution_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidExecutionInput" ->
         (`InvalidExecutionInput (invalid_execution_input_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidName" ->
         (`InvalidName (invalid_name_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDeleting" ->
         (`StateMachineDeleting (state_machine_deleting_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDoesNotExist" ->
         (`StateMachineDoesNotExist (state_machine_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_execution_input) ->
    let input = Serializers.start_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.StartExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_execution_output_of_yojson
      ~error_deserializer
      
end

module SendTaskSuccess = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidOutput" ->
         (`InvalidOutput (invalid_output_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | "com.amazonaws.sfn", "TaskDoesNotExist" ->
         (`TaskDoesNotExist (task_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "TaskTimedOut" ->
         (`TaskTimedOut (task_timed_out_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: send_task_success_input) ->
    let input = Serializers.send_task_success_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.SendTaskSuccess" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.send_task_success_output_of_yojson
      ~error_deserializer
      
end

module SendTaskHeartbeat = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | "com.amazonaws.sfn", "TaskDoesNotExist" ->
         (`TaskDoesNotExist (task_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "TaskTimedOut" ->
         (`TaskTimedOut (task_timed_out_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: send_task_heartbeat_input) ->
    let input = Serializers.send_task_heartbeat_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.SendTaskHeartbeat" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.send_task_heartbeat_output_of_yojson
      ~error_deserializer
      
end

module SendTaskFailure = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | "com.amazonaws.sfn", "TaskDoesNotExist" ->
         (`TaskDoesNotExist (task_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "TaskTimedOut" ->
         (`TaskTimedOut (task_timed_out_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: send_task_failure_input) ->
    let input = Serializers.send_task_failure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.SendTaskFailure" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.send_task_failure_output_of_yojson
      ~error_deserializer
      
end

module RedriveExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ExecutionDoesNotExist" ->
         (`ExecutionDoesNotExist (execution_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "ExecutionLimitExceeded" ->
         (`ExecutionLimitExceeded (execution_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.sfn", "ExecutionNotRedrivable" ->
         (`ExecutionNotRedrivable (execution_not_redrivable_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: redrive_execution_input) ->
    let input = Serializers.redrive_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.RedriveExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.redrive_execution_output_of_yojson
      ~error_deserializer
      
end

module PublishStateMachineVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDeleting" ->
         (`StateMachineDeleting (state_machine_deleting_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDoesNotExist" ->
         (`StateMachineDoesNotExist (state_machine_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: publish_state_machine_version_input) ->
    let input = Serializers.publish_state_machine_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.PublishStateMachineVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.publish_state_machine_version_output_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_input) ->
    let input = Serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
      
end

module ListStateMachines = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_state_machines_input) ->
    let input = Serializers.list_state_machines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.ListStateMachines" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_state_machines_output_of_yojson
      ~error_deserializer
      
end

module ListStateMachineVersions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_state_machine_versions_input) ->
    let input = Serializers.list_state_machine_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.ListStateMachineVersions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_state_machine_versions_output_of_yojson
      ~error_deserializer
      
end

module ListStateMachineAliases = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDeleting" ->
         (`StateMachineDeleting (state_machine_deleting_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDoesNotExist" ->
         (`StateMachineDoesNotExist (state_machine_does_not_exist_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_state_machine_aliases_input) ->
    let input = Serializers.list_state_machine_aliases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.ListStateMachineAliases" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_state_machine_aliases_output_of_yojson
      ~error_deserializer
      
end

module ListMapRuns = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ExecutionDoesNotExist" ->
         (`ExecutionDoesNotExist (execution_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_map_runs_input) ->
    let input = Serializers.list_map_runs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.ListMapRuns" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_map_runs_output_of_yojson
      ~error_deserializer
      
end

module ListExecutions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDoesNotExist" ->
         (`StateMachineDoesNotExist (state_machine_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineTypeNotSupported" ->
         (`StateMachineTypeNotSupported (state_machine_type_not_supported_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_executions_input) ->
    let input = Serializers.list_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.ListExecutions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_executions_output_of_yojson
      ~error_deserializer
      
end

module ListActivities = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_activities_input) ->
    let input = Serializers.list_activities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.ListActivities" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_activities_output_of_yojson
      ~error_deserializer
      
end

module GetExecutionHistory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ExecutionDoesNotExist" ->
         (`ExecutionDoesNotExist (execution_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidToken" ->
         (`InvalidToken (invalid_token_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_execution_history_input) ->
    let input = Serializers.get_execution_history_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.GetExecutionHistory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_execution_history_output_of_yojson
      ~error_deserializer
      
end

module GetActivityTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ActivityDoesNotExist" ->
         (`ActivityDoesNotExist (activity_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "ActivityWorkerLimitExceeded" ->
         (`ActivityWorkerLimitExceeded (activity_worker_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_activity_task_input) ->
    let input = Serializers.get_activity_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.GetActivityTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_activity_task_output_of_yojson
      ~error_deserializer
      
end

module DescribeStateMachineForExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ExecutionDoesNotExist" ->
         (`ExecutionDoesNotExist (execution_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_state_machine_for_execution_input) ->
    let input = Serializers.describe_state_machine_for_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DescribeStateMachineForExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_state_machine_for_execution_output_of_yojson
      ~error_deserializer
      
end

module DescribeStateMachineAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_state_machine_alias_input) ->
    let input = Serializers.describe_state_machine_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DescribeStateMachineAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_state_machine_alias_output_of_yojson
      ~error_deserializer
      
end

module DescribeStateMachine = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDoesNotExist" ->
         (`StateMachineDoesNotExist (state_machine_does_not_exist_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_state_machine_input) ->
    let input = Serializers.describe_state_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DescribeStateMachine" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_state_machine_output_of_yojson
      ~error_deserializer
      
end

module DescribeMapRun = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_map_run_input) ->
    let input = Serializers.describe_map_run_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DescribeMapRun" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_map_run_output_of_yojson
      ~error_deserializer
      
end

module DescribeExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ExecutionDoesNotExist" ->
         (`ExecutionDoesNotExist (execution_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_execution_input) ->
    let input = Serializers.describe_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DescribeExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_execution_output_of_yojson
      ~error_deserializer
      
end

module DescribeActivity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ActivityDoesNotExist" ->
         (`ActivityDoesNotExist (activity_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_activity_input) ->
    let input = Serializers.describe_activity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DescribeActivity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_activity_output_of_yojson
      ~error_deserializer
      
end

module DeleteStateMachineVersion = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_state_machine_version_input) ->
    let input = Serializers.delete_state_machine_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DeleteStateMachineVersion" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_state_machine_version_output_of_yojson
      ~error_deserializer
      
end

module DeleteStateMachineAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_state_machine_alias_input) ->
    let input = Serializers.delete_state_machine_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DeleteStateMachineAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_state_machine_alias_output_of_yojson
      ~error_deserializer
      
end

module DeleteStateMachine = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_state_machine_input) ->
    let input = Serializers.delete_state_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DeleteStateMachine" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_state_machine_output_of_yojson
      ~error_deserializer
      
end

module DeleteActivity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_activity_input) ->
    let input = Serializers.delete_activity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.DeleteActivity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_activity_output_of_yojson
      ~error_deserializer
      
end

module CreateStateMachineAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidName" ->
         (`InvalidName (invalid_name_of_yojson tree path))
      | "com.amazonaws.sfn", "ResourceNotFound" ->
         (`ResourceNotFound (resource_not_found_of_yojson tree path))
      | "com.amazonaws.sfn", "ServiceQuotaExceededException" ->
         (`ServiceQuotaExceededException (service_quota_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDeleting" ->
         (`StateMachineDeleting (state_machine_deleting_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_state_machine_alias_input) ->
    let input = Serializers.create_state_machine_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.CreateStateMachineAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_state_machine_alias_output_of_yojson
      ~error_deserializer
      
end

module CreateStateMachine = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidArn" ->
         (`InvalidArn (invalid_arn_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidDefinition" ->
         (`InvalidDefinition (invalid_definition_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidLoggingConfiguration" ->
         (`InvalidLoggingConfiguration (invalid_logging_configuration_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidName" ->
         (`InvalidName (invalid_name_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidTracingConfiguration" ->
         (`InvalidTracingConfiguration (invalid_tracing_configuration_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineAlreadyExists" ->
         (`StateMachineAlreadyExists (state_machine_already_exists_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineDeleting" ->
         (`StateMachineDeleting (state_machine_deleting_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineLimitExceeded" ->
         (`StateMachineLimitExceeded (state_machine_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.sfn", "StateMachineTypeNotSupported" ->
         (`StateMachineTypeNotSupported (state_machine_type_not_supported_of_yojson tree path))
      | "com.amazonaws.sfn", "TooManyTags" ->
         (`TooManyTags (too_many_tags_of_yojson tree path))
      | "com.amazonaws.sfn", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_state_machine_input) ->
    let input = Serializers.create_state_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.CreateStateMachine" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_state_machine_output_of_yojson
      ~error_deserializer
      
end

module CreateActivity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sfn", "ActivityLimitExceeded" ->
         (`ActivityLimitExceeded (activity_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.sfn", "InvalidName" ->
         (`InvalidName (invalid_name_of_yojson tree path))
      | "com.amazonaws.sfn", "TooManyTags" ->
         (`TooManyTags (too_many_tags_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_activity_input) ->
    let input = Serializers.create_activity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSStepFunctions.CreateActivity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_activity_output_of_yojson
      ~error_deserializer
      
end

