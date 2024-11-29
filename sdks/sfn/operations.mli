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
  (** 
    Creates an activity. An activity is a task that you write in any programming language and host on any machine that has access to Step Functions. Activities must poll Step Functions using the [GetActivityTask] API action and respond using [SendTask*] API actions. This function lets Step Functions know the existence of your activity and returns an identifier for use in a state machine and when polling from the activity.
    
     This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
     
      [CreateActivity] is an idempotent API. Subsequent requests won’t create a duplicate resource if it was already created. [CreateActivity]'s idempotency check is based on the activity [name]. If a following request has different [tags] values, Step Functions will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
      
       *)

  
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
  (** 
    Creates a state machine. A state machine consists of a collection of states that can do work ([Task] states), determine to which states to transition next ([Choice] states), stop an execution with an error ([Fail] states), and so on. State machines are specified using a JSON-based, structured language. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} in the Step Functions User Guide.
    
     If you set the [publish] parameter of this API action to [true], it publishes version [1] as the first revision of the state machine.
     
      This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
      
       [CreateStateMachine] is an idempotent API. Subsequent requests won’t create a duplicate resource if it was already created. [CreateStateMachine]'s idempotency check is based on the state machine [name], [definition], [type], [LoggingConfiguration], and [TracingConfiguration]. The check is also based on the [publish] and [versionDescription] parameters. If a following request has a different [roleArn] or [tags], Step Functions will ignore these differences and treat it as an idempotent request of the previous. In this case, [roleArn] and [tags] will not be updated, even if they are different.
       
        *)

  
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
  (** 
    Creates an {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} for a state machine that points to one or two {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} of the same state machine. You can set your application to call [StartExecution] with an alias and update the version the alias uses without changing the client's code.
    
     You can also map an alias to split [StartExecution] requests between two versions of a state machine. To do this, add a second [RoutingConfig] object in the [routingConfiguration] parameter. You must also specify the percentage of execution run requests each version should receive in both [RoutingConfig] objects. Step Functions randomly chooses which version runs a given execution based on the percentage you specify.
     
      To create an alias that points to a single version, specify a single [RoutingConfig] object with a [weight] set to 100.
      
       You can create up to 100 aliases for each state machine. You must delete unused aliases using the [DeleteStateMachineAlias] API action.
       
        [CreateStateMachineAlias] is an idempotent API. Step Functions bases the idempotency check on the [stateMachineArn], [description], [name], and [routingConfiguration] parameters. Requests that contain the same values for these parameters return a successful idempotent response without creating a duplicate resource.
        
         {b Related operations:}
         
          {ul
               {- [DescribeStateMachineAlias]
                  
                  }
                {- [ListStateMachineAliases]
                   
                   }
                {- [UpdateStateMachineAlias]
                   
                   }
                {- [DeleteStateMachineAlias]
                   
                   }
               
      }
       *)

  
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
  (** 
    Deletes an activity.
     *)

  
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
  (** 
    Deletes a state machine. This is an asynchronous operation. It sets the state machine's status to [DELETING] and begins the deletion process. A state machine is deleted only when all its executions are completed. On the next state transition, the state machine's executions are terminated.
    
     A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.
     
      The following are some examples of qualified and unqualified state machine ARNs:
      
       {ul
            {- The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].
               
                [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel]
                
                 If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].
                 
                 }
             {- The following unqualified state machine ARN refers to a state machine named [myStateMachine].
                
                 [arn:partition:states:region:account-id:stateMachine:myStateMachine]
                 
                 }
            
      }
       This API action also deletes all {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} and {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}aliases} associated with a state machine.
       
        For [EXPRESS] state machines, the deletion happens eventually (usually in less than a minute). Running executions may emit logs after [DeleteStateMachine] API is called.
        
         *)

  
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
  (** 
    Deletes a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias}.
    
     After you delete a state machine alias, you can't use it to start executions. When you delete a state machine alias, Step Functions doesn't delete the state machine versions that alias references.
     
      {b Related operations:}
      
       {ul
            {- [CreateStateMachineAlias]
               
               }
             {- [DescribeStateMachineAlias]
                
                }
             {- [ListStateMachineAliases]
                
                }
             {- [UpdateStateMachineAlias]
                
                }
            
      }
       *)

  
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
  (** 
    Deletes a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}. After you delete a version, you can't call [StartExecution] using that version's ARN or use the version with a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias}.
    
     Deleting a state machine version won't terminate its in-progress executions.
     
      You can't delete a state machine version currently referenced by one or more aliases. Before you delete a version, you must either delete the aliases or update them to point to another state machine version.
      
       {b Related operations:}
       
        {ul
             {- [PublishStateMachineVersion]
                
                }
              {- [ListStateMachineVersions]
                 
                 }
             
      }
       *)

  
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
  (** 
    Describes an activity.
    
     This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
     
      *)

  
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
  (** 
    Provides information about a state machine execution, such as the state machine associated with the execution, the execution input and output, and relevant execution metadata. If you've {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-executions.html}redriven} an execution, you can use this API action to return information about the redrives of that execution. In addition, you can use this API action to return the Map Run Amazon Resource Name (ARN) if the execution was dispatched by a Map Run.
    
     If you specify a version or alias ARN when you call the [StartExecution] API action, [DescribeExecution] returns that ARN.
     
      This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
      
       Executions of an [EXPRESS] state machine aren't supported by [DescribeExecution] unless a Map Run dispatched them.
        *)

  
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
  (** 
    Provides information about a Map Run's configuration, progress, and results. If you've {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-map-run.html}redriven} a Map Run, this API action also returns information about the redrives of that Map Run. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-examine-map-run.html}Examining Map Run} in the {i Step Functions Developer Guide}.
     *)

  
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
  (** 
    Provides information about a state machine's definition, its IAM role Amazon Resource Name (ARN), and configuration.
    
     A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.
     
      The following are some examples of qualified and unqualified state machine ARNs:
      
       {ul
            {- The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].
               
                [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel]
                
                 If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].
                 
                 }
             {- The following qualified state machine ARN refers to an alias named [PROD].
                
                 
                 {[
                 arn::states:::stateMachine:
                 ]}
                 
                 
                  If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the request starts execution for that version or alias.
                  
                  }
             {- The following unqualified state machine ARN refers to a state machine named [myStateMachine].
                
                 
                 {[
                 arn::states:::stateMachine:
                 ]}
                 
                 
                 }
            
      }
       This API action returns the details for a state machine version if the [stateMachineArn] you specify is a state machine version ARN.
       
        This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
        
         *)

  
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
  (** 
    Returns details about a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias}.
    
     {b Related operations:}
     
      {ul
           {- [CreateStateMachineAlias]
              
              }
            {- [ListStateMachineAliases]
               
               }
            {- [UpdateStateMachineAlias]
               
               }
            {- [DeleteStateMachineAlias]
               
               }
           
      }
       *)

  
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
  (** 
    Provides information about a state machine's definition, its execution role ARN, and configuration. If a Map Run dispatched the execution, this action returns the Map Run Amazon Resource Name (ARN) in the response. The state machine returned is the state machine associated with the Map Run.
    
     This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
     
      This API action is not supported by [EXPRESS] state machines.
       *)

  
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
  (** 
    Used by workers to retrieve a task (with the specified activity ARN) which has been scheduled for execution by a running state machine. This initiates a long poll, where the service holds the HTTP connection open and responds as soon as a task becomes available (i.e. an execution of a task of this type is needed.) The maximum time the service holds on to the request before responding is 60 seconds. If no task is available within 60 seconds, the poll returns a [taskToken] with a null string.
    
     This API action isn't logged in CloudTrail.
     
      Workers should set their client side socket timeout to at least 65 seconds (5 seconds higher than the maximum time the service may hold the poll request).
      
       Polling with [GetActivityTask] can cause latency in some implementations. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/bp-activity-pollers.html}Avoid Latency When Polling for Activity Tasks} in the Step Functions Developer Guide.
       
        *)

  
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
  (** 
    Returns the history of the specified execution as a list of events. By default, the results are returned in ascending order of the [timeStamp] of the events. Use the [reverseOrder] parameter to get the latest events first.
    
     If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     
      This API action is not supported by [EXPRESS] state machines.
       *)

  
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
  (** 
    Lists the existing activities.
    
     If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     
      This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
      
       *)

  
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
  (** 
    Lists all executions of a state machine or a Map Run. You can list all executions related to a state machine by specifying a state machine Amazon Resource Name (ARN), or those related to a Map Run by specifying a Map Run ARN. Using this API action, you can also list all {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-executions.html}redriven} executions.
    
     You can also provide a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} ARN or {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version} ARN to list the executions associated with a specific alias or version.
     
      Results are sorted by time, with the most recent execution first.
      
       If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
       
        This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
        
         This API action is not supported by [EXPRESS] state machines.
          *)

  
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
  (** 
    Lists all Map Runs that were started by a given state machine execution. Use this API action to obtain Map Run ARNs, and then call [DescribeMapRun] to obtain more information, if needed.
     *)

  
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
  (** 
    Lists {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}aliases} for a specified state machine ARN. Results are sorted by time, with the most recently created aliases listed first.
    
     To list aliases that reference a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}, you can specify the version ARN in the [stateMachineArn] parameter.
     
      If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
      
       {b Related operations:}
       
        {ul
             {- [CreateStateMachineAlias]
                
                }
              {- [DescribeStateMachineAlias]
                 
                 }
              {- [UpdateStateMachineAlias]
                 
                 }
              {- [DeleteStateMachineAlias]
                 
                 }
             
      }
       *)

  
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
  (** 
    Lists {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} for the specified state machine Amazon Resource Name (ARN).
    
     The results are sorted in descending order of the version creation time.
     
      If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
      
       {b Related operations:}
       
        {ul
             {- [PublishStateMachineVersion]
                
                }
              {- [DeleteStateMachineVersion]
                 
                 }
             
      }
       *)

  
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
  (** 
    Lists the existing state machines.
    
     If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     
      This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
      
       *)

  
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
  (** 
    List tags for a given resource.
    
     Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].
      *)

  
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
  (** 
    Creates a {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version} from the current revision of a state machine. Use versions to create immutable snapshots of your state machine. You can start executions from versions either directly or with an alias. To create an alias, use [CreateStateMachineAlias].
    
     You can publish up to 1000 versions for each state machine. You must manually delete unused versions using the [DeleteStateMachineVersion] API action.
     
      [PublishStateMachineVersion] is an idempotent API. It doesn't create a duplicate state machine version if it already exists for the current revision. Step Functions bases [PublishStateMachineVersion]'s idempotency check on the [stateMachineArn], [name], and [revisionId] parameters. Requests with the same parameters return a successful idempotent response. If you don't specify a [revisionId], Step Functions checks for a previously published version of the state machine's current revision.
      
       {b Related operations:}
       
        {ul
             {- [DeleteStateMachineVersion]
                
                }
              {- [ListStateMachineVersions]
                 
                 }
             
      }
       *)

  
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
  (** 
    Restarts unsuccessful executions of Standard workflows that didn't complete successfully in the last 14 days. These include failed, aborted, or timed out executions. When you {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-executions.html}redrive} an execution, it continues the failed execution from the unsuccessful step and uses the same input. Step Functions preserves the results and execution history of the successful steps, and doesn't rerun these steps when you redrive an execution. Redriven executions use the same state machine definition and execution ARN as the original execution attempt.
    
     For workflows that include an {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-map-state.html}Inline Map} or {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-parallel-state.html}Parallel} state, [RedriveExecution] API action reschedules and redrives only the iterations and branches that failed or aborted.
     
      To redrive a workflow that includes a Distributed Map state whose Map Run failed, you must redrive the {{:https://docs.aws.amazon.com/step-functions/latest/dg/use-dist-map-orchestrate-large-scale-parallel-workloads.html#dist-map-orchestrate-parallel-workloads-key-terms}parent workflow}. The parent workflow redrives all the unsuccessful states, including a failed Map Run. If a Map Run was not started in the original execution attempt, the redriven parent workflow starts the Map Run.
      
       This API action is not supported by [EXPRESS] state machines.
       
        However, you can restart the unsuccessful executions of Express child workflows in a Distributed Map by redriving its Map Run. When you redrive a Map Run, the Express child workflows are rerun using the [StartExecution] API action. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-map-run.html}Redriving Map Runs}.
        
         You can redrive executions if your original execution meets the following conditions:
         
          {ul
               {- The execution status isn't [SUCCEEDED].
                  
                  }
                {- Your workflow execution has not exceeded the redrivable period of 14 days. Redrivable period refers to the time during which you can redrive a given execution. This period starts from the day a state machine completes its execution.
                   
                   }
                {- The workflow execution has not exceeded the maximum open time of one year. For more information about state machine quotas, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits-overview.html#service-limits-state-machine-executions}Quotas related to state machine executions}.
                   
                   }
                {- The execution event history count is less than 24,999. Redriven executions append their event history to the existing event history. Make sure your workflow execution contains less than 24,999 events to accommodate the [ExecutionRedriven] history event and at least one other history event.
                   
                   }
               
      }
       *)

  
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
  (** 
    Used by activity workers, Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern, and optionally Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} pattern to report that the task identified by the [taskToken] failed.
     *)

  
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
  (** 
    Used by activity workers and Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern, and optionally Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} pattern to report to Step Functions that the task represented by the specified [taskToken] is still making progress. This action resets the [Heartbeat] clock. The [Heartbeat] threshold is specified in the state machine's Amazon States Language definition ([HeartbeatSeconds]). This action does not in itself create an event in the execution history. However, if the task times out, the execution history contains an [ActivityTimedOut] entry for activities, or a [TaskTimedOut] entry for tasks using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} or {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern.
    
     The [Timeout] of a task, defined in the state machine's Amazon States Language definition, is its maximum allowed duration, regardless of the number of [SendTaskHeartbeat] requests received. Use [HeartbeatSeconds] to configure the timeout interval for heartbeats.
     
      *)

  
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
  (** 
    Used by activity workers, Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern, and optionally Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} pattern to report that the task identified by the [taskToken] completed successfully.
     *)

  
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
  (** 
    Starts a state machine execution.
    
     A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.
     
      The following are some examples of qualified and unqualified state machine ARNs:
      
       {ul
            {- The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].
               
                [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel]
                
                 If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].
                 
                 }
             {- The following qualified state machine ARN refers to an alias named [PROD].
                
                 
                 {[
                 arn::states:::stateMachine:
                 ]}
                 
                 
                  If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the request starts execution for that version or alias.
                  
                  }
             {- The following unqualified state machine ARN refers to a state machine named [myStateMachine].
                
                 
                 {[
                 arn::states:::stateMachine:
                 ]}
                 
                 
                 }
            
      }
       If you start an execution with an unqualified state machine ARN, Step Functions uses the latest revision of the state machine for the execution.
       
        To start executions of a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}, call [StartExecution] and provide the version ARN or the ARN of an {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} that points to the version.
        
         [StartExecution] is idempotent for [STANDARD] workflows. For a [STANDARD] workflow, if you call [StartExecution] with the same name and input as a running execution, the call succeeds and return the same response as the original request. If the execution is closed or if the input is different, it returns a [400 ExecutionAlreadyExists] error. You can reuse names after 90 days.
         
          [StartExecution] isn't idempotent for [EXPRESS] workflows.
          
           *)

  
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
  (** 
    Starts a Synchronous Express state machine execution. [StartSyncExecution] is not available for [STANDARD] workflows.
    
     [StartSyncExecution] will return a [200 OK] response, even if your execution fails, because the status code in the API response doesn't reflect function errors. Error codes are reserved for errors that prevent your execution from running, such as permissions errors, limit errors, or issues with your state machine code and configuration.
     
      This API action isn't logged in CloudTrail.
      
       *)

  
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
  (** 
    Stops an execution.
    
     This API action is not supported by [EXPRESS] state machines.
      *)

  
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
  (** 
    Add a tag to a Step Functions resource.
    
     An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.
     
      Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].
       *)

  
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
  (** 
    Accepts the definition of a single state and executes it. You can test a state without creating a state machine or updating an existing state machine. Using this API, you can test the following:
    
     {ul
          {- A state's {{:https://docs.aws.amazon.com/step-functions/latest/dg/test-state-isolation.html#test-state-input-output-dataflow}input and output processing} data flow
             
             }
           {- An {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-services.html}Amazon Web Services service integration} request and response
              
              }
           {- An {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-third-party-apis.html}HTTP Task} request and response
              
              }
          
      }
       You can call this API on only one state at a time. The states that you can test include the following:
       
        {ul
             {- {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-task-state.html#task-types}All Task types} except {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-activities.html}Activity}
                
                }
              {- {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-pass-state.html}Pass}
                 
                 }
              {- {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-wait-state.html}Wait}
                 
                 }
              {- {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-choice-state.html}Choice}
                 
                 }
              {- {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-succeed-state.html}Succeed}
                 
                 }
              {- {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-fail-state.html}Fail}
                 
                 }
             
      }
       The [TestState] API assumes an IAM role which must contain the required IAM permissions for the resources your state is accessing. For information about the permissions a state might need, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/test-state-isolation.html#test-state-permissions}IAM permissions to test a state}.
       
        The [TestState] API can run for up to five minutes. If the execution of a state exceeds this duration, it fails with the [States.Timeout] error.
        
         [TestState] doesn't support {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-activities.html}Activity tasks}, [.sync] or [.waitForTaskToken] {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html}service integration patterns}, {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-parallel-state.html}Parallel}, or {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-map-state.html}Map} states.
          *)

  
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
  (** 
    Remove a tag from a Step Functions resource
     *)

  
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
  (** 
    Updates an in-progress Map Run's configuration to include changes to the settings that control maximum concurrency and Map Run failure.
     *)

  
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
  (** 
    Updates an existing state machine by modifying its [definition], [roleArn], or [loggingConfiguration]. Running executions will continue to use the previous [definition] and [roleArn]. You must include at least one of [definition] or [roleArn] or you will receive a [MissingRequiredParameter] error.
    
     A qualified state machine ARN refers to a {i Distributed Map state} defined within a state machine. For example, the qualified state machine ARN [arn:partition:states:region:account-id:stateMachine:stateMachineName/mapStateLabel] refers to a {i Distributed Map state} with a label [mapStateLabel] in the state machine named [stateMachineName].
     
      A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.
      
       The following are some examples of qualified and unqualified state machine ARNs:
       
        {ul
             {- The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].
                
                 [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel]
                 
                  If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].
                  
                  }
              {- The following qualified state machine ARN refers to an alias named [PROD].
                 
                  
                  {[
                  arn::states:::stateMachine:
                  ]}
                  
                  
                   If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the request starts execution for that version or alias.
                   
                   }
              {- The following unqualified state machine ARN refers to a state machine named [myStateMachine].
                 
                  
                  {[
                  arn::states:::stateMachine:
                  ]}
                  
                  
                  }
             
      }
       After you update your state machine, you can set the [publish] parameter to [true] in the same action to publish a new {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}. This way, you can opt-in to strict versioning of your state machine.
       
        Step Functions assigns monotonically increasing integers for state machine versions, starting at version number 1.
        
         All [StartExecution] calls within a few seconds use the updated [definition] and [roleArn]. Executions started immediately after you call [UpdateStateMachine] may use the previous state machine [definition] and [roleArn].
         
          *)

  
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
  (** 
    Updates the configuration of an existing state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} by modifying its [description] or [routingConfiguration].
    
     You must specify at least one of the [description] or [routingConfiguration] parameters to update a state machine alias.
     
      [UpdateStateMachineAlias] is an idempotent API. Step Functions bases the idempotency check on the [stateMachineAliasArn], [description], and [routingConfiguration] parameters. Requests with the same parameters return an idempotent response.
      
       This operation is eventually consistent. All [StartExecution] requests made within a few seconds use the latest alias configuration. Executions started immediately after calling [UpdateStateMachineAlias] may use the previous routing configuration.
       
        {b Related operations:}
        
         {ul
              {- [CreateStateMachineAlias]
                 
                 }
               {- [DescribeStateMachineAlias]
                  
                  }
               {- [ListStateMachineAliases]
                  
                  }
               {- [DeleteStateMachineAlias]
                  
                  }
              
      }
       *)

  
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
  (** 
    Validates the syntax of a state machine definition.
    
     You can validate that a state machine definition is correct without creating a state machine resource. Step Functions will implicitly perform the same syntax check when you invoke [CreateStateMachine] and [UpdateStateMachine]. State machine definitions are specified using a JSON-based, structured language. For more information on Amazon States Language see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} (ASL).
     
      Suggested uses for [ValidateStateMachineDefinition]:
      
       {ul
            {- Integrate automated checks into your code review or Continuous Integration (CI) process to validate state machine definitions before starting deployments.
               
               }
             {- Run the validation from a Git pre-commit hook to check your state machine definitions before committing them to your source repository.
                
                }
            
      }
       Errors found in the state machine definition will be returned in the response as a list of {b diagnostic elements}, rather than raise an exception.
       
        *)

  
end

