open Types 
module CreateActivity : sig
  val request :
    Smaws_Lib.Context.t ->
      create_activity_input ->
        (create_activity_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ActivityLimitExceeded of activity_limit_exceeded
            | `InvalidName of invalid_name
            | `TooManyTags of too_many_tags
            
        ]
      ) result
end

module CreateStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      create_state_machine_input ->
        (create_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `InvalidDefinition of invalid_definition
            | `InvalidLoggingConfiguration of invalid_logging_configuration
            | `InvalidName of invalid_name
            | `InvalidTracingConfiguration of invalid_tracing_configuration
            | `StateMachineAlreadyExists of state_machine_already_exists
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineLimitExceeded of state_machine_limit_exceeded
            | `StateMachineTypeNotSupported of state_machine_type_not_supported
            | `TooManyTags of too_many_tags
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_state_machine_alias_input ->
        (create_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `InvalidName of invalid_name
            | `ResourceNotFound of resource_not_found
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `StateMachineDeleting of state_machine_deleting
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteActivity : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activity_input ->
        (delete_activity_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module DeleteStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_input ->
        (delete_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_alias_input ->
        (delete_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteStateMachineVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_version_input ->
        (delete_state_machine_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeActivity : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activity_input ->
        (describe_activity_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ActivityDoesNotExist of activity_does_not_exist
            | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module DescribeExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_execution_input ->
        (describe_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module DescribeMapRun : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_map_run_input ->
        (describe_map_run_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            
        ]
      ) result
end

module DescribeStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_input ->
        (describe_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            
        ]
      ) result
end

module DescribeStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_alias_input ->
        (describe_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeStateMachineForExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_for_execution_input ->
        (describe_state_machine_for_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module GetActivityTask : sig
  val request :
    Smaws_Lib.Context.t ->
      get_activity_task_input ->
        (get_activity_task_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ActivityDoesNotExist of activity_does_not_exist
            | `ActivityWorkerLimitExceeded of activity_worker_limit_exceeded
            | `InvalidArn of invalid_arn
            
        ]
      ) result
end

module GetExecutionHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_execution_history_input ->
        (get_execution_history_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            
        ]
      ) result
end

module ListActivities : sig
  val request :
    Smaws_Lib.Context.t ->
      list_activities_input ->
        (list_activities_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            
        ]
      ) result
end

module ListExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_executions_input ->
        (list_executions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            | `ResourceNotFound of resource_not_found
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `StateMachineTypeNotSupported of state_machine_type_not_supported
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListMapRuns : sig
  val request :
    Smaws_Lib.Context.t ->
      list_map_runs_input ->
        (list_map_runs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            
        ]
      ) result
end

module ListStateMachineAliases : sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machine_aliases_input ->
        (list_state_machine_aliases_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            | `ResourceNotFound of resource_not_found
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            
        ]
      ) result
end

module ListStateMachineVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machine_versions_input ->
        (list_state_machine_versions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListStateMachines : sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machines_input ->
        (list_state_machines_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            
        ]
      ) result
end

module PublishStateMachineVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      publish_state_machine_version_input ->
        (publish_state_machine_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module RedriveExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      redrive_execution_input ->
        (redrive_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `ExecutionLimitExceeded of execution_limit_exceeded
            | `ExecutionNotRedrivable of execution_not_redrivable
            | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module SendTaskFailure : sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_failure_input ->
        (send_task_failure_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            | `TaskDoesNotExist of task_does_not_exist
            | `TaskTimedOut of task_timed_out
            
        ]
      ) result
end

module SendTaskHeartbeat : sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_heartbeat_input ->
        (send_task_heartbeat_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            | `TaskDoesNotExist of task_does_not_exist
            | `TaskTimedOut of task_timed_out
            
        ]
      ) result
end

module SendTaskSuccess : sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_success_input ->
        (send_task_success_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidOutput of invalid_output
            | `InvalidToken of invalid_token
            | `TaskDoesNotExist of task_does_not_exist
            | `TaskTimedOut of task_timed_out
            
        ]
      ) result
end

module StartExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_execution_input ->
        (start_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionAlreadyExists of execution_already_exists
            | `ExecutionLimitExceeded of execution_limit_exceeded
            | `InvalidArn of invalid_arn
            | `InvalidExecutionInput of invalid_execution_input
            | `InvalidName of invalid_name
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module StartSyncExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_sync_execution_input ->
        (start_sync_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidExecutionInput of invalid_execution_input
            | `InvalidName of invalid_name
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `StateMachineTypeNotSupported of state_machine_type_not_supported
            
        ]
      ) result
end

module StopExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_execution_input ->
        (stop_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `TooManyTags of too_many_tags
            
        ]
      ) result
end

module TestState : sig
  val request :
    Smaws_Lib.Context.t ->
      test_state_input ->
        (test_state_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidDefinition of invalid_definition
            | `InvalidExecutionInput of invalid_execution_input
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            
        ]
      ) result
end

module UpdateMapRun : sig
  val request :
    Smaws_Lib.Context.t ->
      update_map_run_input ->
        (update_map_run_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      update_state_machine_input ->
        (update_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `InvalidDefinition of invalid_definition
            | `InvalidLoggingConfiguration of invalid_logging_configuration
            | `InvalidTracingConfiguration of invalid_tracing_configuration
            | `MissingRequiredParameter of missing_required_parameter
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      update_state_machine_alias_input ->
        (update_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `StateMachineDeleting of state_machine_deleting
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ValidateStateMachineDefinition : sig
  val request :
    Smaws_Lib.Context.t ->
      validate_state_machine_definition_input ->
        (validate_state_machine_definition_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception
            
        ]
      ) result
end

