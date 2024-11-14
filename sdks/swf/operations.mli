open Types 
module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module UndeprecateWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_workflow_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeAlreadyExistsFault of type_already_exists_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module UndeprecateDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_domain_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DomainAlreadyExistsFault of domain_already_exists_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module UndeprecateActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_activity_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeAlreadyExistsFault of type_already_exists_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module TerminateWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      terminate_workflow_execution_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TooManyTagsFault of too_many_tags_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module StartWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_workflow_execution_input ->
        (run,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DefaultUndefinedFault of default_undefined_fault
            | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeDeprecatedFault of type_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            | `WorkflowExecutionAlreadyStartedFault of workflow_execution_already_started_fault
            
        ]
      ) result
end

module SignalWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      signal_workflow_execution_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module RespondDecisionTaskCompleted : sig
  val request :
    Smaws_Lib.Context.t ->
      respond_decision_task_completed_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module RespondActivityTaskFailed : sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_failed_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module RespondActivityTaskCompleted : sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_completed_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module RespondActivityTaskCanceled : sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_canceled_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module RequestCancelWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      request_cancel_workflow_execution_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module RegisterWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      register_workflow_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeAlreadyExistsFault of type_already_exists_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module RegisterDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      register_domain_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DomainAlreadyExistsFault of domain_already_exists_fault
            | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TooManyTagsFault of too_many_tags_fault
            
        ]
      ) result
end

module RegisterActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      register_activity_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeAlreadyExistsFault of type_already_exists_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module RecordActivityTaskHeartbeat : sig
  val request :
    Smaws_Lib.Context.t ->
      record_activity_task_heartbeat_input ->
        (activity_task_status,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module PollForDecisionTask : sig
  val request :
    Smaws_Lib.Context.t ->
      poll_for_decision_task_input ->
        (decision_task,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module PollForActivityTask : sig
  val request :
    Smaws_Lib.Context.t ->
      poll_for_activity_task_input ->
        (activity_task,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module ListWorkflowTypes : sig
  val request :
    Smaws_Lib.Context.t ->
      list_workflow_types_input ->
        (workflow_type_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededFault of limit_exceeded_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module ListOpenWorkflowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_open_workflow_executions_input ->
        (workflow_execution_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module ListDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      list_domains_input ->
        (domain_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            
        ]
      ) result
end

module ListClosedWorkflowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_closed_workflow_executions_input ->
        (workflow_execution_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module ListActivityTypes : sig
  val request :
    Smaws_Lib.Context.t ->
      list_activity_types_input ->
        (activity_type_infos,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module GetWorkflowExecutionHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_workflow_execution_history_input ->
        (history,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module DescribeWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_workflow_type_input ->
        (workflow_type_detail,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module DescribeWorkflowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_workflow_execution_input ->
        (workflow_execution_detail,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module DescribeDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_domain_input ->
        (domain_detail,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module DescribeActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activity_type_input ->
        (activity_type_detail,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module DeprecateWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_workflow_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeDeprecatedFault of type_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module DeprecateDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_domain_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DomainDeprecatedFault of domain_deprecated_fault
            | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module DeprecateActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_activity_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeDeprecatedFault of type_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module DeleteWorkflowType : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_workflow_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeNotDeprecatedFault of type_not_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module DeleteActivityType : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activity_type_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `TypeNotDeprecatedFault of type_not_deprecated_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module CountPendingDecisionTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      count_pending_decision_tasks_input ->
        (pending_task_count,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module CountPendingActivityTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      count_pending_activity_tasks_input ->
        (pending_task_count,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module CountOpenWorkflowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      count_open_workflow_executions_input ->
        (workflow_execution_count,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

module CountClosedWorkflowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      count_closed_workflow_executions_input ->
        (workflow_execution_count,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedFault of operation_not_permitted_fault
            | `UnknownResourceFault of unknown_resource_fault
            
        ]
      ) result
end

