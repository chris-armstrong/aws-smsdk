(** 
    SFN client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

type validation_exception_reason = | INVALID_ROUTING_CONFIGURATION
  | CANNOT_UPDATE_COMPLETED_MAP_RUN
  | MISSING_REQUIRED_PARAMETER
  | API_DOES_NOT_SUPPORT_LABELED_ARNS

(** 
    The input does not satisfy the constraints specified by an Amazon Web Services service.
     *)
type validation_exception = {
  reason: validation_exception_reason option;
  (** 
    The input does not satisfy the constraints specified by an Amazon Web Services service.
     *)

  message: string option;
  
}

type validate_state_machine_definition_severity = | ERROR

type validate_state_machine_definition_result_code = | FAIL
  | OK

(** 
    Describes an error found during validation. Validation errors found in the definition return in the response as {b diagnostic elements}, rather than raise an exception.
     *)
type validate_state_machine_definition_diagnostic = {
  location: string option;
  (** 
    Location of the issue in the state machine, if available.
    
     For errors specific to a field, the location could be in the format: [/States//], for example: [/States/FailState/ErrorPath].
      *)

  message: string;
  (** 
    Message describing the diagnostic condition.
     *)

  code: string;
  (** 
    Identifying code for the diagnostic.
     *)

  severity: validate_state_machine_definition_severity;
  (** 
    A value of [ERROR] means that you cannot create or update a state machine with this definition.
     *)

}

type validate_state_machine_definition_output = {
  diagnostics: validate_state_machine_definition_diagnostic list;
  (** 
    If the result is [OK], this field will be empty. When there are errors, this field will contain an array of {b Diagnostic} objects to help you troubleshoot.
     *)

  result: validate_state_machine_definition_result_code;
  (** 
    The result value will be [OK] when no syntax errors are found, or [FAIL] if the workflow definition does not pass verification.
     *)

}

type state_machine_type = | EXPRESS
  | STANDARD

type validate_state_machine_definition_input = {
  type_: state_machine_type option;
  (** 
    The target type of state machine for this definition. The default is [STANDARD].
     *)

  definition: string;
  (** 
    The Amazon States Language definition of the state machine. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} (ASL).
     *)

}

type update_state_machine_output = {
  state_machine_version_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the published state machine version.
    
     If the [publish] parameter isn't set to [true], this field returns null.
      *)

  revision_id: string option;
  (** 
    The revision identifier for the updated state machine.
     *)

  update_date: float;
  (** 
    The date and time the state machine was updated.
     *)

}

type log_level = | OFF
  | FATAL
  | ERROR
  | ALL

(** 
    
     *)
type cloud_watch_logs_log_group = {
  log_group_arn: string option;
  (** 
    The ARN of the the CloudWatch log group to which you want your logs emitted to. The ARN must end with [:*]
     *)

}

(** 
    
     *)
type log_destination = {
  cloud_watch_logs_log_group: cloud_watch_logs_log_group option;
  (** 
    An object describing a CloudWatch log group. For more information, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-logs-loggroup.html}AWS::Logs::LogGroup} in the CloudFormation User Guide.
     *)

}

(** 
    The [LoggingConfiguration] data type is used to set CloudWatch Logs options.
     *)
type logging_configuration = {
  destinations: log_destination list option;
  (** 
    An array of objects that describes where your execution history events will be logged. Limited to size 1. Required, if your log level is not set to [OFF].
     *)

  include_execution_data: bool option;
  (** 
    Determines whether execution data is included in your log. When set to [false], data is excluded.
     *)

  level: log_level option;
  (** 
    Defines which category of execution history events are logged.
     *)

}

(** 
    Selects whether or not the state machine's X-Ray tracing is enabled. Default is [false]
     *)
type tracing_configuration = {
  enabled: bool option;
  (** 
    When set to [true], X-Ray tracing is enabled.
     *)

}

type update_state_machine_input = {
  version_description: string option;
  (** 
    An optional description of the state machine version to publish.
    
     You can only specify the [versionDescription] parameter if you've set [publish] to [true].
      *)

  publish: bool option;
  (** 
    Specifies whether the state machine version is published. The default is [false]. To publish a version after updating the state machine, set [publish] to [true].
     *)

  tracing_configuration: tracing_configuration option;
  (** 
    Selects whether X-Ray tracing is enabled.
     *)

  logging_configuration: logging_configuration option;
  (** 
    Use the [LoggingConfiguration] data type to set CloudWatch Logs options.
     *)

  role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM role of the state machine.
     *)

  definition: string option;
  (** 
    The Amazon States Language definition of the state machine. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language}.
     *)

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine.
     *)

}

type update_state_machine_alias_output = {
  update_date: float;
  (** 
    The date and time the state machine alias was updated.
     *)

}

(** 
    Contains details about the routing configuration of a state machine alias. In a routing configuration, you define an array of objects that specify up to two state machine versions. You also specify the percentage of traffic to be routed to each version.
     *)
type routing_configuration_list_item = {
  weight: int;
  (** 
    The percentage of traffic you want to route to a state machine version. The sum of the weights in the routing configuration must be equal to 100.
     *)

  state_machine_version_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies one or two state machine versions defined in the routing configuration.
    
     If you specify the ARN of a second version, it must belong to the same state machine as the first version.
      *)

}

type update_state_machine_alias_input = {
  routing_configuration: routing_configuration_list_item list option;
  (** 
    The routing configuration of the state machine alias.
    
     An array of [RoutingConfig] objects that specifies up to two state machine versions that the alias starts executions for.
      *)

  description: string option;
  (** 
    A description of the state machine alias.
     *)

  state_machine_alias_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine alias.
     *)

}

(** 
    The specified state machine is being deleted.
     *)
type state_machine_deleting = {
  message: string option;
  
}

(** 
    Could not find the referenced resource.
     *)
type resource_not_found = {
  resource_name: string option;
  
  message: string option;
  
}

(** 
    The provided Amazon Resource Name (ARN) is not valid.
     *)
type invalid_arn = {
  message: string option;
  
}

(** 
    Updating or deleting a resource can cause an inconsistent state. This error occurs when there're concurrent requests for [DeleteStateMachineVersion], [PublishStateMachineVersion], or [UpdateStateMachine] with the [publish] parameter set to [true].
    
     HTTP Status Code: 409
      *)
type conflict_exception = {
  message: string option;
  
}

(** 
    The specified state machine does not exist.
     *)
type state_machine_does_not_exist = {
  message: string option;
  
}

(** 
    The request would cause a service quota to be exceeded.
    
     HTTP Status Code: 402
      *)
type service_quota_exceeded_exception = {
  message: string option;
  
}

(** 
    Request is missing a required parameter. This error occurs if both [definition] and [roleArn] are not specified.
     *)
type missing_required_parameter = {
  message: string option;
  
}

(** 
    Your [tracingConfiguration] key does not match, or [enabled] has not been set to [true] or [false].
     *)
type invalid_tracing_configuration = {
  message: string option;
  
}

(** 
    
     *)
type invalid_logging_configuration = {
  message: string option;
  
}

(** 
    The provided Amazon States Language definition is not valid.
     *)
type invalid_definition = {
  message: string option;
  
}

type update_map_run_output = unit

type update_map_run_input = {
  tolerated_failure_count: int option;
  (** 
    The maximum number of failed items before the Map Run fails.
     *)

  tolerated_failure_percentage: float option;
  (** 
    The maximum percentage of failed items before the Map Run fails.
     *)

  max_concurrency: int option;
  (** 
    The maximum number of child workflow executions that can be specified to run in parallel for the Map Run at the same time.
     *)

  map_run_arn: string;
  (** 
    The Amazon Resource Name (ARN) of a Map Run.
     *)

}

type untag_resource_output = unit

type untag_resource_input = {
  tag_keys: string list;
  (** 
    The list of tags to remove from the resource.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the Step Functions state machine or activity.
     *)

}

(** 
    You've exceeded the number of tags allowed for a resource. See the {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits.html}Limits Topic} in the Step Functions Developer Guide.
     *)
type too_many_tags = {
  resource_name: string option;
  
  message: string option;
  
}

(** 
    Contains additional details about the state's execution, including its input and output data processing flow, and HTTP request information.
     *)
type inspection_data_request = {
  body: string option;
  (** 
    The request body for the HTTP request.
     *)

  headers: string option;
  (** 
    The request headers associated with the HTTP request.
     *)

  url: string option;
  (** 
    The API endpoint used for the HTTP request.
     *)

  method_: string option;
  (** 
    The HTTP method used for the HTTP request.
     *)

  protocol: string option;
  (** 
    The protocol used to make the HTTP request.
     *)

}

(** 
    Contains additional details about the state's execution, including its input and output data processing flow, and HTTP response information. The [inspectionLevel] request parameter specifies which details are returned.
     *)
type inspection_data_response = {
  body: string option;
  (** 
    The HTTP response returned.
     *)

  headers: string option;
  (** 
    The response headers associated with the HTTP response.
     *)

  status_message: string option;
  (** 
    The message associated with the HTTP status code.
     *)

  status_code: string option;
  (** 
    The HTTP response status code for the HTTP response.
     *)

  protocol: string option;
  (** 
    The protocol used to return the HTTP response.
     *)

}

(** 
    Contains additional details about the state's execution, including its input and output data processing flow, and HTTP request and response information.
     *)
type inspection_data = {
  response: inspection_data_response option;
  (** 
    The raw HTTP response that is returned when you test an HTTP Task.
     *)

  request: inspection_data_request option;
  (** 
    The raw HTTP request that is sent when you test an HTTP Task.
     *)

  after_result_path: string option;
  (** 
    The effective result combined with the raw state input after Step Functions applies the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultpath.html}ResultPath} filter.
     *)

  after_result_selector: string option;
  (** 
    The effective result after Step Functions applies the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-inputpath-params.html#input-output-resultselector}ResultSelector} filter.
     *)

  result: string option;
  (** 
    The state's raw result.
     *)

  after_parameters: string option;
  (** 
    The effective input after Step Functions applies the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-inputpath-params.html#input-output-parameters}Parameters} filter.
     *)

  after_input_path: string option;
  (** 
    The input after Step Functions applies the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-inputpath-params.html#input-output-inputpath}InputPath} filter.
     *)

  input: string option;
  (** 
    The raw state input.
     *)

}

type test_execution_status = | CAUGHT_ERROR
  | RETRIABLE
  | FAILED
  | SUCCEEDED

type test_state_output = {
  status: test_execution_status option;
  (** 
    The execution status of the state.
     *)

  next_state: string option;
  (** 
    The name of the next state to transition to. If you haven't defined a next state in your definition or if the execution of the state fails, this ﬁeld doesn't contain a value.
     *)

  inspection_data: inspection_data option;
  (** 
    Returns additional details about the state's execution, including its input and output data processing flow, and HTTP request and response information. The [inspectionLevel] request parameter specifies which details are returned.
     *)

  cause: string option;
  (** 
    A detailed explanation of the cause for the error when the execution of a state fails.
     *)

  error: string option;
  (** 
    The error returned when the execution of a state fails.
     *)

  output: string option;
  (** 
    The JSON output data of the state. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

}

type inspection_level = | TRACE
  | DEBUG
  | INFO

type test_state_input = {
  reveal_secrets: bool option;
  (** 
    Specifies whether or not to include secret information in the test result. For HTTP Tasks, a secret includes the data that an EventBridge connection adds to modify the HTTP request headers, query parameters, and body. Step Functions doesn't omit any information included in the state definition or the HTTP response.
    
     If you set [revealSecrets] to [true], you must make sure that the IAM user that calls the [TestState] API has permission for the [states:RevealSecrets] action. For an example of IAM policy that sets the [states:RevealSecrets] permission, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/test-state-isolation.html#test-state-permissions}IAM permissions to test a state}. Without this permission, Step Functions throws an access denied error.
     
      By default, [revealSecrets] is set to [false].
       *)

  inspection_level: inspection_level option;
  (** 
    Determines the values to return when a state is tested. You can specify one of the following types:
    
     {ul
          {- [INFO]: Shows the final state output. By default, Step Functions sets [inspectionLevel] to [INFO] if you don't specify a level.
             
             }
           {- [DEBUG]: Shows the final state output along with the input and output data processing result.
              
              }
           {- [TRACE]: Shows the HTTP request and response for an HTTP Task. This level also shows the final state output along with the input and output data processing result.
              
              }
          
      }
       Each of these levels also provide information about the status of the state execution and the next state to transition to.
        *)

  input: string option;
  (** 
    A string that contains the JSON input data for the state.
     *)

  role_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the execution role with the required IAM permissions for the state.
     *)

  definition: string;
  (** 
    The {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} (ASL) definition of the state.
     *)

}

(** 
    The provided JSON input data is not valid.
     *)
type invalid_execution_input = {
  message: string option;
  
}

(** 
    Contains details about a resource timeout that occurred during an execution.
     *)
type task_timed_out_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

  resource: string;
  (** 
    The action of the resource called by a task state.
     *)

  resource_type: string;
  (** 
    The service name of the resource in a task state.
     *)

}

(** 
    The task token has either expired or the task associated with the token has already been closed.
     *)
type task_timed_out = {
  message: string option;
  
}

(** 
    Provides details about input or output in an execution history event.
     *)
type history_event_execution_data_details = {
  truncated: bool option;
  (** 
    Indicates whether input or output was truncated in the response. Always [false] for API calls.
     *)

}

(** 
    Contains details about the successful completion of a task state.
     *)
type task_succeeded_event_details = {
  output_details: history_event_execution_data_details option;
  (** 
    Contains details about the output of an execution history event.
     *)

  output: string option;
  (** 
    The full JSON response from a resource when a task has succeeded. This response becomes the output of the related task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  resource: string;
  (** 
    The action of the resource called by a task state.
     *)

  resource_type: string;
  (** 
    The service name of the resource in a task state.
     *)

}

(** 
    Contains details about a task submitted to a resource .
     *)
type task_submitted_event_details = {
  output_details: history_event_execution_data_details option;
  (** 
    Contains details about the output of an execution history event.
     *)

  output: string option;
  (** 
    The response from a resource when a task has started. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  resource: string;
  (** 
    The action of the resource called by a task state.
     *)

  resource_type: string;
  (** 
    The service name of the resource in a task state.
     *)

}

(** 
    Contains details about a task that failed to submit during an execution.
     *)
type task_submit_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

  resource: string;
  (** 
    The action of the resource called by a task state.
     *)

  resource_type: string;
  (** 
    The service name of the resource in a task state.
     *)

}

(** 
    Contains details about the start of a task during an execution.
     *)
type task_started_event_details = {
  resource: string;
  (** 
    The action of the resource called by a task state.
     *)

  resource_type: string;
  (** 
    The service name of the resource in a task state.
     *)

}

(** 
    Contains details about a task that failed to start during an execution.
     *)
type task_start_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

  resource: string;
  (** 
    The action of the resource called by a task state.
     *)

  resource_type: string;
  (** 
    The service name of the resource in a task state.
     *)

}

(** 
    Contains details about the credentials that Step Functions uses for a task.
     *)
type task_credentials = {
  role_arn: string option;
  (** 
    The ARN of an IAM role that Step Functions assumes for the task. The role can allow cross-account access to resources.
     *)

}

(** 
    Contains details about a task scheduled during an execution.
     *)
type task_scheduled_event_details = {
  task_credentials: task_credentials option;
  (** 
    The credentials that Step Functions uses for the task.
     *)

  heartbeat_in_seconds: int option;
  (** 
    The maximum allowed duration between two heartbeats for the task.
     *)

  timeout_in_seconds: int option;
  (** 
    The maximum allowed duration of the task.
     *)

  parameters: string;
  (** 
    The JSON data passed to the resource referenced in a task state. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  region: string;
  (** 
    The region of the scheduled task
     *)

  resource: string;
  (** 
    The action of the resource called by a task state.
     *)

  resource_type: string;
  (** 
    The service name of the resource in a task state.
     *)

}

(** 
    Contains details about a task failure event.
     *)
type task_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

  resource: string;
  (** 
    The action of the resource called by a task state.
     *)

  resource_type: string;
  (** 
    The service name of the resource in a task state.
     *)

}

(** 
    The activity does not exist.
     *)
type task_does_not_exist = {
  message: string option;
  
}

type tag_resource_output = unit

(** 
    Tags are key-value pairs that can be associated with Step Functions state machines and activities.
    
     An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.
     
      Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].
       *)
type tag = {
  value: string option;
  (** 
    The value of a tag.
     *)

  key: string option;
  (** 
    The key of a tag.
     *)

}

type tag_resource_input = {
  tags: tag list;
  (** 
    The list of tags to add to a resource.
    
     Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].
      *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the Step Functions state machine or activity.
     *)

}

type sync_execution_status = | TIMED_OUT
  | FAILED
  | SUCCEEDED

type stop_execution_output = {
  stop_date: float;
  (** 
    The date the execution is stopped.
     *)

}

type stop_execution_input = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the execution to stop.
     *)

}

(** 
    The specified execution does not exist.
     *)
type execution_does_not_exist = {
  message: string option;
  
}

(** 
    Contains details about a specific state machine version.
     *)
type state_machine_version_list_item = {
  creation_date: float;
  (** 
    The creation date of a state machine version.
     *)

  state_machine_version_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies a state machine version. The version ARN is a combination of state machine ARN and the version number separated by a colon (:). For example, [stateMachineARN:1].
     *)

}

(** 
    
     *)
type state_machine_type_not_supported = {
  message: string option;
  
}

type state_machine_status = | DELETING
  | ACTIVE

(** 
    Contains details about the state machine.
     *)
type state_machine_list_item = {
  creation_date: float;
  (** 
    The date the state machine is created.
     *)

  type_: state_machine_type;
  (** 
    
     *)

  name: string;
  [@ocaml.doc {| 
    The name of the state machine.
    
     A name must {i not} contain:
     
      {ul
           {- white space
              
              }
            {- brackets [< > { } [ ]]
               
               }
            {- wildcard characters [? *]
               
               }
            {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
               
               }
            {- control characters ([U+0000-001F], [U+007F-009F])
               
               }
           
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the state machine.
     *)

}

(** 
    The maximum number of state machines has been reached. Existing state machines must be deleted before a new state machine can be created.
     *)
type state_machine_limit_exceeded = {
  message: string option;
  
}

(** 
    A state machine with the same name but a different definition or role ARN already exists.
     *)
type state_machine_already_exists = {
  message: string option;
  
}

(** 
    Contains details about a specific state machine alias.
     *)
type state_machine_alias_list_item = {
  creation_date: float;
  (** 
    The creation date of a state machine alias.
     *)

  state_machine_alias_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies a state machine alias. The alias ARN is a combination of state machine ARN and the alias name separated by a colon (:). For example, [stateMachineARN:PROD].
     *)

}

(** 
    Contains details about an exit from a state during an execution.
     *)
type state_exited_event_details = {
  output_details: history_event_execution_data_details option;
  (** 
    Contains details about the output of an execution history event.
     *)

  output: string option;
  (** 
    The JSON output data of the state. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  name: string;
  [@ocaml.doc {| 
    The name of the state.
    
     A name must {i not} contain:
     
      {ul
           {- white space
              
              }
            {- brackets [< > { } [ ]]
               
               }
            {- wildcard characters [? *]
               
               }
            {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
               
               }
            {- control characters ([U+0000-001F], [U+007F-009F])
               
               }
           
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

}

(** 
    Contains details about a state entered during an execution.
     *)
type state_entered_event_details = {
  input_details: history_event_execution_data_details option;
  (** 
    Contains details about the input for an execution history event.
     *)

  input: string option;
  (** 
    The string that contains the JSON input data for the state. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  name: string;
  (** 
    The name of the state.
     *)

}

(** 
    Provides details about execution input or output.
     *)
type cloud_watch_events_execution_data_details = {
  included: bool option;
  (** 
    Indicates whether input or output was included in the response. Always [true] for API calls.
     *)

}

(** 
    An object that describes workflow billing details.
     *)
type billing_details = {
  billed_duration_in_milliseconds: int option;
  (** 
    Billed duration of your workflow, in milliseconds.
     *)

  billed_memory_used_in_m_b: int option;
  (** 
    Billed memory consumption of your workflow, in MB.
     *)

}

type start_sync_execution_output = {
  billing_details: billing_details option;
  (** 
    An object that describes workflow billing details, including billed duration and memory use.
     *)

  trace_header: string option;
  (** 
    The X-Ray trace header that was passed to the execution.
     *)

  output_details: cloud_watch_events_execution_data_details option;
  
  output: string option;
  (** 
    The JSON output data of the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
    
     This field is set only if the execution succeeds. If the execution fails, this field is null.
     
      *)

  input_details: cloud_watch_events_execution_data_details option;
  
  input: string option;
  (** 
    The string that contains the JSON input data of the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

  status: sync_execution_status;
  (** 
    The current status of the execution.
     *)

  stop_date: float;
  (** 
    If the execution has already ended, the date the execution stopped.
     *)

  start_date: float;
  (** 
    The date the execution is started.
     *)

  name: string option;
  (** 
    The name of the execution.
     *)

  state_machine_arn: string option;
  (** 
    The Amazon Resource Name (ARN) that identifies the state machine.
     *)

  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the execution.
     *)

}

type start_sync_execution_input = {
  trace_header: string option;
  (** 
    Passes the X-Ray trace header. The trace header can also be passed in the request payload.
     *)

  input: string option;
  [@ocaml.doc {| 
    The string that contains the JSON input data for the execution, for example:
    
     ["input": "{\"first_name\" : \"test\"}"]
     
      If you don't include any JSON input data, you still must include the two braces, for example: ["input": "{}"]
      
       Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
        |}]

  name: string option;
  (** 
    The name of the execution.
     *)

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine to execute.
     *)

}

(** 
    The provided name is not valid.
     *)
type invalid_name = {
  message: string option;
  
}

type start_execution_output = {
  start_date: float;
  (** 
    The date the execution is started.
     *)

  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the execution.
     *)

}

type start_execution_input = {
  trace_header: string option;
  (** 
    Passes the X-Ray trace header. The trace header can also be passed in the request payload.
     *)

  input: string option;
  [@ocaml.doc {| 
    The string that contains the JSON input data for the execution, for example:
    
     ["input": "{\"first_name\" : \"test\"}"]
     
      If you don't include any JSON input data, you still must include the two braces, for example: ["input": "{}"]
      
       Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
        |}]

  name: string option;
  [@ocaml.doc {| 
    Optional name of the execution. This name must be unique for your Amazon Web Services account, Region, and state machine for 90 days. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits.html#service-limits-state-machine-executions}Limits Related to State Machine Executions} in the {i Step Functions Developer Guide}.
    
     If you don't provide a name for the execution, Step Functions automatically generates a universally unique identifier (UUID) as the execution name.
     
      A name must {i not} contain:
      
       {ul
            {- white space
               
               }
             {- brackets [< > { } [ ]]
                
                }
             {- wildcard characters [? *]
                
                }
             {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
                
                }
             {- control characters ([U+0000-001F], [U+007F-009F])
                
                }
            
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine to execute.
    
     The [stateMachineArn] parameter accepts one of the following inputs:
     
      {ul
           {- {b An unqualified state machine ARN} – Refers to a state machine ARN that isn't qualified with a version or alias ARN. The following is an example of an unqualified state machine ARN.
              
               [arn::states:::stateMachine:]
               
                Step Functions doesn't associate state machine executions that you start with an unqualified ARN with a version. This is true even if that version uses the same revision that the execution used.
                
                }
            {- {b A state machine version ARN} – Refers to a version ARN, which is a combination of state machine ARN and the version number separated by a colon (:). The following is an example of the ARN for version 10.
               
                [arn::states:::stateMachine::10]
                
                 Step Functions doesn't associate executions that you start with a version ARN with any aliases that point to that version.
                 
                 }
            {- {b A state machine alias ARN} – Refers to an alias ARN, which is a combination of state machine ARN and the alias name separated by a colon (:). The following is an example of the ARN for an alias named [PROD].
               
                [arn::states:::stateMachine:]
                
                 Step Functions associates executions that you start with an alias ARN with that alias and the state machine version used for that execution.
                 
                 }
           
      }
       *)

}

(** 
    The maximum number of running executions has been reached. Running executions must end or be stopped before a new execution can be started.
     *)
type execution_limit_exceeded = {
  message: string option;
  
}

(** 
    The execution has the same [name] as another execution (but a different [input]).
    
     Executions with the same [name] and [input] are considered idempotent.
     
      *)
type execution_already_exists = {
  message: string option;
  
}

type send_task_success_output = unit

type send_task_success_input = {
  output: string;
  (** 
    The JSON output of the task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  task_token: string;
  (** 
    The token that represents this task. Task tokens are generated by Step Functions when tasks are assigned to a worker, or in the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html}context object} when a workflow enters a task state. See [GetActivityTaskOutput$taskToken].
     *)

}

(** 
    The provided token is not valid.
     *)
type invalid_token = {
  message: string option;
  
}

(** 
    The provided JSON output data is not valid.
     *)
type invalid_output = {
  message: string option;
  
}

type send_task_heartbeat_output = unit

type send_task_heartbeat_input = {
  task_token: string;
  (** 
    The token that represents this task. Task tokens are generated by Step Functions when tasks are assigned to a worker, or in the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html}context object} when a workflow enters a task state. See [GetActivityTaskOutput$taskToken].
     *)

}

type send_task_failure_output = unit

type send_task_failure_input = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

  task_token: string;
  (** 
    The token that represents this task. Task tokens are generated by Step Functions when tasks are assigned to a worker, or in the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html}context object} when a workflow enters a task state. See [GetActivityTaskOutput$taskToken].
     *)

}

type redrive_execution_output = {
  redrive_date: float;
  (** 
    The date the execution was last redriven.
     *)

}

type redrive_execution_input = {
  client_token: string option;
  (** 
    A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you don’t specify a client token, the Amazon Web Services SDK automatically generates a client token and uses it for the request to ensure idempotency. The API will return idempotent responses for the last 10 client tokens used to successfully redrive the execution. These client tokens are valid for up to 15 minutes after they are first used.
     *)

  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the execution to be redriven.
     *)

}

(** 
    The execution Amazon Resource Name (ARN) that you specified for [executionArn] cannot be redriven.
     *)
type execution_not_redrivable = {
  message: string option;
  
}

type publish_state_machine_version_output = {
  state_machine_version_arn: string;
  (** 
    The Amazon Resource Name (ARN) (ARN) that identifies the state machine version.
     *)

  creation_date: float;
  (** 
    The date the version was created.
     *)

}

type publish_state_machine_version_input = {
  description: string option;
  (** 
    An optional description of the state machine version.
     *)

  revision_id: string option;
  (** 
    Only publish the state machine version if the current state machine's revision ID matches the specified ID.
    
     Use this option to avoid publishing a version if the state machine changed since you last updated it. If the specified revision ID doesn't match the state machine's current revision ID, the API returns [ConflictException].
     
      To specify an initial revision ID for a state machine with no revision ID assigned, specify the string [INITIAL] for the [revisionId] parameter. For example, you can specify a [revisionID] of [INITIAL] when you create a state machine using the [CreateStateMachine] API action.
      
       *)

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine.
     *)

}

(** 
    Details about a Map state that was started.
     *)
type map_state_started_event_details = {
  length: int option;
  (** 
    The size of the array for Map state iterations.
     *)

}

type map_run_status = | ABORTED
  | FAILED
  | SUCCEEDED
  | RUNNING

(** 
    Contains details about a Map Run that was started during a state machine execution.
     *)
type map_run_started_event_details = {
  map_run_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of a Map Run that was started.
     *)

}

(** 
    Contains details about a Map Run that was redriven.
     *)
type map_run_redriven_event_details = {
  redrive_count: int option;
  (** 
    The number of times the Map Run has been redriven at this point in the execution's history including this event. The redrive count for a redriven Map Run is always greater than 0.
     *)

  map_run_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of a Map Run that was redriven.
     *)

}

(** 
    Contains details about a specific Map Run.
     *)
type map_run_list_item = {
  stop_date: float option;
  (** 
    The date on which the Map Run stopped.
     *)

  start_date: float;
  (** 
    The date on which the Map Run started.
     *)

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the executed state machine.
     *)

  map_run_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the Map Run.
     *)

  execution_arn: string;
  (** 
    The [executionArn] of the execution from which the Map Run was started.
     *)

}

(** 
    Contains details about items that were processed in all of the child workflow executions that were started by a Map Run.
     *)
type map_run_item_counts = {
  pending_redrive: int option;
  (** 
    The number of unsuccessful items in child workflow executions currently waiting to be redriven.
     *)

  failures_not_redrivable: int option;
  (** 
    The number of [FAILED], [ABORTED], or [TIMED_OUT] items in child workflow executions that cannot be redriven because the execution status of those child workflows is terminal. For example, child workflows with an execution status of [FAILED], [ABORTED], or [TIMED_OUT] and a [redriveStatus] of [NOT_REDRIVABLE].
     *)

  results_written: int;
  (** 
    Returns the count of items whose results were written by [ResultWriter]. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultwriter.html}ResultWriter} in the {i Step Functions Developer Guide}.
     *)

  total: int;
  (** 
    The total number of items processed in all the child workflow executions started by a Map Run.
     *)

  aborted: int;
  (** 
    The total number of items processed in child workflow executions that were either stopped by the user or by Step Functions, because the Map Run failed.
     *)

  timed_out: int;
  (** 
    The total number of items processed in child workflow executions that have timed out.
     *)

  failed: int;
  (** 
    The total number of items processed in child workflow executions that have failed.
     *)

  succeeded: int;
  (** 
    The total number of items processed in child workflow executions that have completed successfully.
     *)

  running: int;
  (** 
    The total number of items being processed in child workflow executions that are currently in-progress.
     *)

  pending: int;
  (** 
    The total number of items to process in child workflow executions that haven't started running yet.
     *)

}

(** 
    Contains details about a Map Run failure event that occurred during a state machine execution.
     *)
type map_run_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the Map Run failure.
     *)

}

(** 
    Contains details about all of the child workflow executions started by a Map Run.
     *)
type map_run_execution_counts = {
  pending_redrive: int option;
  (** 
    The number of unsuccessful child workflow executions currently waiting to be redriven. The status of these child workflow executions could be [FAILED], [ABORTED], or [TIMED_OUT] in the original execution attempt or a previous redrive attempt.
     *)

  failures_not_redrivable: int option;
  (** 
    The number of [FAILED], [ABORTED], or [TIMED_OUT] child workflow executions that cannot be redriven because their execution status is terminal. For example, child workflows with an execution status of [FAILED], [ABORTED], or [TIMED_OUT] and a [redriveStatus] of [NOT_REDRIVABLE].
     *)

  results_written: int;
  (** 
    Returns the count of child workflow executions whose results were written by [ResultWriter]. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultwriter.html}ResultWriter} in the {i Step Functions Developer Guide}.
     *)

  total: int;
  (** 
    The total number of child workflow executions that were started by a Map Run.
     *)

  aborted: int;
  (** 
    The total number of child workflow executions that were started by a Map Run and were running, but were either stopped by the user or by Step Functions because the Map Run failed.
     *)

  timed_out: int;
  (** 
    The total number of child workflow executions that were started by a Map Run and have timed out.
     *)

  failed: int;
  (** 
    The total number of child workflow executions that were started by a Map Run, but have failed.
     *)

  succeeded: int;
  (** 
    The total number of child workflow executions that were started by a Map Run and have completed successfully.
     *)

  running: int;
  (** 
    The total number of child workflow executions that were started by a Map Run and are currently in-progress.
     *)

  pending: int;
  (** 
    The total number of child workflow executions that were started by a Map Run, but haven't started executing yet.
     *)

}

(** 
    Contains details about an iteration of a Map state.
     *)
type map_iteration_event_details = {
  index: int option;
  (** 
    The index of the array belonging to the Map state iteration.
     *)

  name: string option;
  (** 
    The name of the iteration’s parent Map state.
     *)

}

type list_tags_for_resource_output = {
  tags: tag list option;
  (** 
    An array of tags associated with the resource.
     *)

}

type list_tags_for_resource_input = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the Step Functions state machine or activity.
     *)

}

type list_state_machines_output = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  state_machines: state_machine_list_item list;
  
}

type list_state_machines_input = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  max_results: int option;
  (** 
    The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.
    
     This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.
      *)

}

type list_state_machine_versions_output = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  state_machine_versions: state_machine_version_list_item list;
  (** 
    Versions for the state machine.
     *)

}

type list_state_machine_versions_input = {
  max_results: int option;
  (** 
    The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.
    
     This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.
      *)

  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine.
     *)

}

type list_state_machine_aliases_output = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  state_machine_aliases: state_machine_alias_list_item list;
  (** 
    Aliases for the state machine.
     *)

}

type list_state_machine_aliases_input = {
  max_results: int option;
  (** 
    The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.
    
     This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.
      *)

  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine for which you want to list aliases.
    
     If you specify a state machine version ARN, this API returns a list of aliases for that version.
      *)

}

type list_map_runs_output = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  map_runs: map_run_list_item list;
  (** 
    An array that lists information related to a Map Run, such as the Amazon Resource Name (ARN) of the Map Run and the ARN of the state machine that started the Map Run.
     *)

}

type list_map_runs_input = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  max_results: int option;
  (** 
    The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.
    
     This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.
      *)

  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the execution for which the Map Runs must be listed.
     *)

}

type execution_status = | PENDING_REDRIVE
  | ABORTED
  | TIMED_OUT
  | FAILED
  | SUCCEEDED
  | RUNNING

(** 
    Contains details about an execution.
     *)
type execution_list_item = {
  redrive_date: float option;
  (** 
    The date the execution was last redriven.
     *)

  redrive_count: int option;
  (** 
    The number of times you've redriven an execution. If you have not yet redriven an execution, the [redriveCount] is 0. This count is only updated when you successfully redrive an execution.
     *)

  state_machine_alias_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the state machine alias used to start an execution.
    
     If the state machine execution was started with an unqualified ARN or a version ARN, it returns null.
      *)

  state_machine_version_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the state machine version associated with the execution.
    
     If the state machine execution was started with an unqualified ARN, it returns null.
     
      If the execution was started using a [stateMachineAliasArn], both the [stateMachineAliasArn] and [stateMachineVersionArn] parameters contain the respective values.
       *)

  item_count: int option;
  (** 
    The total number of items processed in a child workflow execution. This field is returned only if [mapRunArn] was specified in the [ListExecutions] API action. If [stateMachineArn] was specified in [ListExecutions], the [itemCount] field isn't returned.
     *)

  map_run_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of a Map Run. This field is returned only if [mapRunArn] was specified in the [ListExecutions] API action. If [stateMachineArn] was specified in [ListExecutions], the [mapRunArn] isn't returned.
     *)

  stop_date: float option;
  (** 
    If the execution already ended, the date the execution stopped.
     *)

  start_date: float;
  (** 
    The date the execution started.
     *)

  status: execution_status;
  (** 
    The current status of the execution.
     *)

  name: string;
  [@ocaml.doc {| 
    The name of the execution.
    
     A name must {i not} contain:
     
      {ul
           {- white space
              
              }
            {- brackets [< > { } [ ]]
               
               }
            {- wildcard characters [? *]
               
               }
            {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
               
               }
            {- control characters ([U+0000-001F], [U+007F-009F])
               
               }
           
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine that ran the execution.
     *)

  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the execution.
     *)

}

type list_executions_output = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  executions: execution_list_item list;
  (** 
    The list of matching executions.
     *)

}

type execution_redrive_filter = | NOT_REDRIVEN
  | REDRIVEN

type list_executions_input = {
  redrive_filter: execution_redrive_filter option;
  (** 
    Sets a filter to list executions based on whether or not they have been redriven.
    
     For a Distributed Map, [redriveFilter] sets a filter to list child workflow executions based on whether or not they have been redriven.
     
      If you do not provide a [redriveFilter], Step Functions returns a list of both redriven and non-redriven executions.
      
       If you provide a state machine ARN in [redriveFilter], the API returns a validation exception.
        *)

  map_run_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Map Run that started the child workflow executions. If the [mapRunArn] field is specified, a list of all of the child workflow executions started by a Map Run is returned. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-examine-map-run.html}Examining Map Run} in the {i Step Functions Developer Guide}.
    
     You can specify either a [mapRunArn] or a [stateMachineArn], but not both.
      *)

  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  max_results: int option;
  (** 
    The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.
    
     This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.
      *)

  status_filter: execution_status option;
  (** 
    If specified, only list the executions whose current execution status matches the given filter.
     *)

  state_machine_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the state machine whose executions is listed.
    
     You can specify either a [mapRunArn] or a [stateMachineArn], but not both.
     
      You can also return a list of executions associated with a specific {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} or {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}, by specifying an alias ARN or a version ARN in the [stateMachineArn] parameter.
       *)

}

(** 
    Contains details about an activity.
     *)
type activity_list_item = {
  creation_date: float;
  (** 
    The date the activity is created.
     *)

  name: string;
  [@ocaml.doc {| 
    The name of the activity.
    
     A name must {i not} contain:
     
      {ul
           {- white space
              
              }
            {- brackets [< > { } [ ]]
               
               }
            {- wildcard characters [? *]
               
               }
            {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
               
               }
            {- control characters ([U+0000-001F], [U+007F-009F])
               
               }
           
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

  activity_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the activity.
     *)

}

type list_activities_output = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  activities: activity_list_item list;
  (** 
    The list of activities.
     *)

}

type list_activities_input = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  max_results: int option;
  (** 
    The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.
    
     This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.
      *)

}

(** 
    Contains details about a Lambda function timeout that occurred during an execution.
     *)
type lambda_function_timed_out_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the timeout.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

(** 
    Contains details about a Lambda function that successfully terminated during an execution.
     *)
type lambda_function_succeeded_event_details = {
  output_details: history_event_execution_data_details option;
  (** 
    Contains details about the output of an execution history event.
     *)

  output: string option;
  (** 
    The JSON data output by the Lambda function. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

}

(** 
    Contains details about a lambda function that failed to start during an execution.
     *)
type lambda_function_start_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

(** 
    Contains details about a Lambda function scheduled during an execution.
     *)
type lambda_function_scheduled_event_details = {
  task_credentials: task_credentials option;
  (** 
    The credentials that Step Functions uses for the task.
     *)

  timeout_in_seconds: int option;
  (** 
    The maximum allowed duration of the Lambda function.
     *)

  input_details: history_event_execution_data_details option;
  (** 
    Contains details about input for an execution history event.
     *)

  input: string option;
  (** 
    The JSON data input to the Lambda function. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  resource: string;
  (** 
    The Amazon Resource Name (ARN) of the scheduled Lambda function.
     *)

}

(** 
    Contains details about a failed Lambda function schedule event that occurred during an execution.
     *)
type lambda_function_schedule_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

(** 
    Contains details about a Lambda function that failed during an execution.
     *)
type lambda_function_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

type history_event_type = | MapRunRedriven
  | ExecutionRedriven
  | MapRunSucceeded
  | MapRunStarted
  | MapRunFailed
  | MapRunAborted
  | WaitStateExited
  | WaitStateEntered
  | WaitStateAborted
  | TaskTimedOut
  | TaskSucceeded
  | TaskSubmitted
  | TaskSubmitFailed
  | TaskStateExited
  | TaskStateEntered
  | TaskStateAborted
  | TaskStartFailed
  | TaskStarted
  | TaskScheduled
  | TaskFailed
  | SucceedStateExited
  | SucceedStateEntered
  | PassStateExited
  | PassStateEntered
  | ParallelStateSucceeded
  | ParallelStateStarted
  | ParallelStateFailed
  | ParallelStateExited
  | ParallelStateEntered
  | ParallelStateAborted
  | MapStateSucceeded
  | MapStateStarted
  | MapStateFailed
  | MapStateExited
  | MapStateEntered
  | MapStateAborted
  | MapIterationSucceeded
  | MapIterationStarted
  | MapIterationFailed
  | MapIterationAborted
  | LambdaFunctionTimedOut
  | LambdaFunctionSucceeded
  | LambdaFunctionStartFailed
  | LambdaFunctionStarted
  | LambdaFunctionScheduleFailed
  | LambdaFunctionScheduled
  | LambdaFunctionFailed
  | FailStateEntered
  | ExecutionTimedOut
  | ExecutionSucceeded
  | ExecutionStarted
  | ExecutionFailed
  | ExecutionAborted
  | ChoiceStateExited
  | ChoiceStateEntered
  | ActivityTimedOut
  | ActivitySucceeded
  | ActivityStarted
  | ActivityScheduleFailed
  | ActivityScheduled
  | ActivityFailed

(** 
    Contains details about an activity that failed during an execution.
     *)
type activity_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

(** 
    Contains details about an activity schedule failure that occurred during an execution.
     *)
type activity_schedule_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

(** 
    Contains details about an activity scheduled during an execution.
     *)
type activity_scheduled_event_details = {
  heartbeat_in_seconds: int option;
  (** 
    The maximum allowed duration between two heartbeats for the activity task.
     *)

  timeout_in_seconds: int option;
  (** 
    The maximum allowed duration of the activity task.
     *)

  input_details: history_event_execution_data_details option;
  (** 
    Contains details about the input for an execution history event.
     *)

  input: string option;
  (** 
    The JSON data input to the activity task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  resource: string;
  (** 
    The Amazon Resource Name (ARN) of the scheduled activity.
     *)

}

(** 
    Contains details about the start of an activity during an execution.
     *)
type activity_started_event_details = {
  worker_name: string option;
  (** 
    The name of the worker that the task is assigned to. These names are provided by the workers when calling [GetActivityTask].
     *)

}

(** 
    Contains details about an activity that successfully terminated during an execution.
     *)
type activity_succeeded_event_details = {
  output_details: history_event_execution_data_details option;
  (** 
    Contains details about the output of an execution history event.
     *)

  output: string option;
  (** 
    The JSON data output by the activity task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

}

(** 
    Contains details about an activity timeout that occurred during an execution.
     *)
type activity_timed_out_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the timeout.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

(** 
    Contains details about an execution failure event.
     *)
type execution_failed_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

(** 
    Contains details about the start of the execution.
     *)
type execution_started_event_details = {
  state_machine_version_arn: string option;
  (** 
    The Amazon Resource Name (ARN) that identifies a state machine version used for starting the state machine execution.
     *)

  state_machine_alias_arn: string option;
  (** 
    The Amazon Resource Name (ARN) that identifies a state machine alias used for starting the state machine execution.
     *)

  role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM role used for executing Lambda tasks.
     *)

  input_details: history_event_execution_data_details option;
  (** 
    Contains details about the input for an execution history event.
     *)

  input: string option;
  (** 
    The JSON data input to the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

}

(** 
    Contains details about the successful termination of the execution.
     *)
type execution_succeeded_event_details = {
  output_details: history_event_execution_data_details option;
  (** 
    Contains details about the output of an execution history event.
     *)

  output: string option;
  (** 
    The JSON data output by the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

}

(** 
    Contains details about an abort of an execution.
     *)
type execution_aborted_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the failure.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

(** 
    Contains details about the execution timeout that occurred during the execution.
     *)
type execution_timed_out_event_details = {
  cause: string option;
  (** 
    A more detailed explanation of the cause of the timeout.
     *)

  error: string option;
  (** 
    The error code of the failure.
     *)

}

(** 
    Contains details about a redriven execution.
     *)
type execution_redriven_event_details = {
  redrive_count: int option;
  (** 
    The number of times you've redriven an execution. If you have not yet redriven an execution, the [redriveCount] is 0. This count is not updated for redrives that failed to start or are pending to be redriven.
     *)

}

(** 
    Contains details about the events of an execution.
     *)
type history_event = {
  map_run_redriven_event_details: map_run_redriven_event_details option;
  (** 
    Contains details about the redrive attempt of a Map Run.
     *)

  map_run_failed_event_details: map_run_failed_event_details option;
  (** 
    Contains error and cause details about a Map Run that failed.
     *)

  map_run_started_event_details: map_run_started_event_details option;
  (** 
    Contains details, such as [mapRunArn], and the start date and time of a Map Run. [mapRunArn] is the Amazon Resource Name (ARN) of the Map Run that was started.
     *)

  state_exited_event_details: state_exited_event_details option;
  
  state_entered_event_details: state_entered_event_details option;
  
  lambda_function_timed_out_event_details: lambda_function_timed_out_event_details option;
  
  lambda_function_succeeded_event_details: lambda_function_succeeded_event_details option;
  (** 
    Contains details about a Lambda function that terminated successfully during an execution.
     *)

  lambda_function_start_failed_event_details: lambda_function_start_failed_event_details option;
  (** 
    Contains details about a lambda function that failed to start during an execution.
     *)

  lambda_function_scheduled_event_details: lambda_function_scheduled_event_details option;
  
  lambda_function_schedule_failed_event_details: lambda_function_schedule_failed_event_details option;
  
  lambda_function_failed_event_details: lambda_function_failed_event_details option;
  
  map_iteration_aborted_event_details: map_iteration_event_details option;
  (** 
    Contains details about an iteration of a Map state that was aborted.
     *)

  map_iteration_failed_event_details: map_iteration_event_details option;
  (** 
    Contains details about an iteration of a Map state that failed.
     *)

  map_iteration_succeeded_event_details: map_iteration_event_details option;
  (** 
    Contains details about an iteration of a Map state that succeeded.
     *)

  map_iteration_started_event_details: map_iteration_event_details option;
  (** 
    Contains details about an iteration of a Map state that was started.
     *)

  map_state_started_event_details: map_state_started_event_details option;
  (** 
    Contains details about Map state that was started.
     *)

  execution_redriven_event_details: execution_redriven_event_details option;
  (** 
    Contains details about the redrive attempt of an execution.
     *)

  execution_timed_out_event_details: execution_timed_out_event_details option;
  
  execution_aborted_event_details: execution_aborted_event_details option;
  
  execution_succeeded_event_details: execution_succeeded_event_details option;
  
  execution_started_event_details: execution_started_event_details option;
  
  execution_failed_event_details: execution_failed_event_details option;
  
  task_timed_out_event_details: task_timed_out_event_details option;
  (** 
    Contains details about a task that timed out.
     *)

  task_succeeded_event_details: task_succeeded_event_details option;
  (** 
    Contains details about a task that succeeded.
     *)

  task_submitted_event_details: task_submitted_event_details option;
  (** 
    Contains details about a submitted task.
     *)

  task_submit_failed_event_details: task_submit_failed_event_details option;
  (** 
    Contains details about a task that where the submit failed.
     *)

  task_started_event_details: task_started_event_details option;
  (** 
    Contains details about a task that was started.
     *)

  task_start_failed_event_details: task_start_failed_event_details option;
  (** 
    Contains details about a task that failed to start.
     *)

  task_scheduled_event_details: task_scheduled_event_details option;
  (** 
    Contains details about a task that was scheduled.
     *)

  task_failed_event_details: task_failed_event_details option;
  (** 
    Contains details about the failure of a task.
     *)

  activity_timed_out_event_details: activity_timed_out_event_details option;
  
  activity_succeeded_event_details: activity_succeeded_event_details option;
  
  activity_started_event_details: activity_started_event_details option;
  
  activity_scheduled_event_details: activity_scheduled_event_details option;
  
  activity_schedule_failed_event_details: activity_schedule_failed_event_details option;
  (** 
    Contains details about an activity schedule event that failed during an execution.
     *)

  activity_failed_event_details: activity_failed_event_details option;
  
  previous_event_id: int option;
  (** 
    The id of the previous event.
     *)

  id: int;
  (** 
    The id of the event. Events are numbered sequentially, starting at one.
     *)

  type_: history_event_type;
  (** 
    The type of the event.
     *)

  timestamp_: float;
  (** 
    The date and time the event occurred.
     *)

}

type get_execution_history_output = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  events: history_event list;
  (** 
    The list of events that occurred in the execution.
     *)

}

type get_execution_history_input = {
  include_execution_data: bool option;
  (** 
    You can select whether execution data (input or output of a history event) is returned. The default is [true].
     *)

  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
     *)

  reverse_order: bool option;
  (** 
    Lists events in descending order of their [timeStamp].
     *)

  max_results: int option;
  (** 
    The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.
    
     This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.
      *)

  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the execution.
     *)

}

type get_activity_task_output = {
  input: string option;
  (** 
    The string that contains the JSON input data for the task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  task_token: string option;
  (** 
    A token that identifies the scheduled task. This token must be copied and included in subsequent calls to [SendTaskHeartbeat], [SendTaskSuccess] or [SendTaskFailure] in order to report the progress or completion of the task.
     *)

}

type get_activity_task_input = {
  worker_name: string option;
  (** 
    You can provide an arbitrary name in order to identify the worker that the task is assigned to. This name is used when it is logged in the execution history.
     *)

  activity_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the activity to retrieve tasks from (assigned when you create the task using [CreateActivity].)
     *)

}

(** 
    The maximum number of workers concurrently polling for activity tasks has been reached.
     *)
type activity_worker_limit_exceeded = {
  message: string option;
  
}

(** 
    The specified activity does not exist.
     *)
type activity_does_not_exist = {
  message: string option;
  
}

type execution_redrive_status = | REDRIVABLE_BY_MAP_RUN
  | NOT_REDRIVABLE
  | REDRIVABLE

type describe_state_machine_output = {
  description: string option;
  (** 
    The description of the state machine version.
     *)

  revision_id: string option;
  (** 
    The revision identifier for the state machine.
    
     Use the [revisionId] parameter to compare between versions of a state machine configuration used for executions without performing a diff of the properties, such as [definition] and [roleArn].
      *)

  label: string option;
  (** 
    A user-defined or an auto-generated string that identifies a [Map] state. This parameter is present only if the [stateMachineArn] specified in input is a qualified state machine ARN.
     *)

  tracing_configuration: tracing_configuration option;
  (** 
    Selects whether X-Ray tracing is enabled.
     *)

  logging_configuration: logging_configuration option;
  
  creation_date: float;
  (** 
    The date the state machine is created.
    
     For a state machine version, [creationDate] is the date the version was created.
      *)

  type_: state_machine_type;
  (** 
    The [type] of the state machine ([STANDARD] or [EXPRESS]).
     *)

  role_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the IAM role used when creating this state machine. (The IAM role maintains security by granting Step Functions access to Amazon Web Services resources.)
     *)

  definition: string;
  (** 
    The Amazon States Language definition of the state machine. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language}.
     *)

  status: state_machine_status option;
  (** 
    The current status of the state machine.
     *)

  name: string;
  [@ocaml.doc {| 
    The name of the state machine.
    
     A name must {i not} contain:
     
      {ul
           {- white space
              
              }
            {- brackets [< > { } [ ]]
               
               }
            {- wildcard characters [? *]
               
               }
            {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
               
               }
            {- control characters ([U+0000-001F], [U+007F-009F])
               
               }
           
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the state machine.
    
     If you specified a state machine version ARN in your request, the API returns the version ARN. The version ARN is a combination of state machine ARN and the version number separated by a colon (:). For example, [stateMachineARN:1].
      *)

}

type describe_state_machine_input = {
  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine for which you want the information.
    
     If you specify a state machine version ARN, this API returns details about that version. The version ARN is a combination of state machine ARN and the version number separated by a colon (:). For example, [stateMachineARN:1].
      *)

}

type describe_state_machine_for_execution_output = {
  revision_id: string option;
  (** 
    The revision identifier for the state machine. The first revision ID when you create the state machine is null.
    
     Use the state machine [revisionId] parameter to compare the revision of a state machine with the configuration of the state machine used for executions without performing a diff of the properties, such as [definition] and [roleArn].
      *)

  label: string option;
  (** 
    A user-defined or an auto-generated string that identifies a [Map] state. This ﬁeld is returned only if the [executionArn] is a child workflow execution that was started by a Distributed Map state.
     *)

  map_run_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Map Run that started the child workflow execution. This field is returned only if the [executionArn] is a child workflow execution that was started by a Distributed Map state.
     *)

  tracing_configuration: tracing_configuration option;
  (** 
    Selects whether X-Ray tracing is enabled.
     *)

  logging_configuration: logging_configuration option;
  
  update_date: float;
  (** 
    The date and time the state machine associated with an execution was updated. For a newly created state machine, this is the creation date.
     *)

  role_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the IAM role of the State Machine for the execution.
     *)

  definition: string;
  (** 
    The Amazon States Language definition of the state machine. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language}.
     *)

  name: string;
  (** 
    The name of the state machine associated with the execution.
     *)

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine associated with the execution.
     *)

}

type describe_state_machine_for_execution_input = {
  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the execution you want state machine information for.
     *)

}

type describe_state_machine_alias_output = {
  update_date: float option;
  (** 
    The date the state machine alias was last updated.
    
     For a newly created state machine, this is the same as the creation date.
      *)

  creation_date: float option;
  (** 
    The date the state machine alias was created.
     *)

  routing_configuration: routing_configuration_list_item list option;
  (** 
    The routing configuration of the alias.
     *)

  description: string option;
  (** 
    A description of the alias.
     *)

  name: string option;
  (** 
    The name of the state machine alias.
     *)

  state_machine_alias_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the state machine alias.
     *)

}

type describe_state_machine_alias_input = {
  state_machine_alias_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine alias.
     *)

}

type describe_map_run_output = {
  redrive_date: float option;
  (** 
    The date a Map Run was last redriven. If you have not yet redriven a Map Run, the [redriveDate] is null.
     *)

  redrive_count: int option;
  (** 
    The number of times you've redriven a Map Run. If you have not yet redriven a Map Run, the [redriveCount] is 0. This count is only updated if you successfully redrive a Map Run.
     *)

  execution_counts: map_run_execution_counts;
  (** 
    A JSON object that contains information about the total number of child workflow executions for the Map Run, and the count of child workflow executions for each status, such as [failed] and [succeeded].
     *)

  item_counts: map_run_item_counts;
  (** 
    A JSON object that contains information about the total number of items, and the item count for each processing status, such as [pending] and [failed].
     *)

  tolerated_failure_count: int;
  (** 
    The maximum number of failed child workflow executions before the Map Run fails.
     *)

  tolerated_failure_percentage: float;
  (** 
    The maximum percentage of failed child workflow executions before the Map Run fails.
     *)

  max_concurrency: int;
  (** 
    The maximum number of child workflow executions configured to run in parallel for the Map Run at the same time.
     *)

  stop_date: float option;
  (** 
    The date when the Map Run was stopped.
     *)

  start_date: float;
  (** 
    The date when the Map Run was started.
     *)

  status: map_run_status;
  (** 
    The current status of the Map Run.
     *)

  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the execution in which the Map Run was started.
     *)

  map_run_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies a Map Run.
     *)

}

type describe_map_run_input = {
  map_run_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies a Map Run.
     *)

}

type describe_execution_output = {
  redrive_status_reason: string option;
  (** 
    When [redriveStatus] is [NOT_REDRIVABLE], [redriveStatusReason] specifies the reason why an execution cannot be redriven.
    
     {ul
          {- For executions of type [STANDARD], or for a Distributed Map that includes child workflows of type [STANDARD], [redriveStatusReason] can include one of the following reasons:
             
              {ul
                   {- [State machine is in DELETING status].
                      
                      }
                    {- [Execution is RUNNING and cannot be redriven].
                       
                       }
                    {- [Execution is SUCCEEDED and cannot be redriven].
                       
                       }
                    {- [Execution was started before the launch of RedriveExecution].
                       
                       }
                    {- [Execution history event limit exceeded].
                       
                       }
                    {- [Execution has exceeded the max execution time].
                       
                       }
                    {- [Execution redrivable period exceeded].
                       
                       }
                   
            }
            }
           {- For a Distributed Map that includes child workflows of type [EXPRESS], [redriveStatusReason] is only returned if the child workflows are not redrivable. This happens when the child workflow executions have completed successfully.
              
              }
          
      }
       *)

  redrive_status: execution_redrive_status option;
  (** 
    Indicates whether or not an execution can be redriven at a given point in time.
    
     {ul
          {- For executions of type [STANDARD], [redriveStatus] is [NOT_REDRIVABLE] if calling the [RedriveExecution] API action would return the [ExecutionNotRedrivable] error.
             
             }
           {- For a Distributed Map that includes child workflows of type [STANDARD], [redriveStatus] indicates whether or not the Map Run can redrive child workflow executions.
              
              }
           {- For a Distributed Map that includes child workflows of type [EXPRESS], [redriveStatus] indicates whether or not the Map Run can redrive child workflow executions.
              
               You can redrive failed or timed out [EXPRESS] workflows {i only if} they're a part of a Map Run. When you {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-map-run.html}redrive} the Map Run, these workflows are restarted using the [StartExecution] API action.
               
               }
          
      }
       *)

  redrive_date: float option;
  (** 
    The date the execution was last redriven. If you have not yet redriven an execution, the [redriveDate] is null.
    
     The [redriveDate] is unavailable if you redrive a Map Run that starts child workflow executions of type [EXPRESS].
      *)

  redrive_count: int option;
  (** 
    The number of times you've redriven an execution. If you have not yet redriven an execution, the [redriveCount] is 0. This count is only updated if you successfully redrive an execution.
     *)

  state_machine_alias_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the state machine alias associated with the execution. The alias ARN is a combination of state machine ARN and the alias name separated by a colon (:). For example, [stateMachineARN:PROD].
    
     If you start an execution from a [StartExecution] request with a state machine version ARN, this field will be null.
      *)

  state_machine_version_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the state machine version associated with the execution. The version ARN is a combination of state machine ARN and the version number separated by a colon (:). For example, [stateMachineARN:1].
    
     If you start an execution from a [StartExecution] request without specifying a state machine version or alias ARN, Step Functions returns a null value.
      *)

  cause: string option;
  (** 
    The cause string if the state machine execution failed.
     *)

  error: string option;
  (** 
    The error string if the state machine execution failed.
     *)

  map_run_arn: string option;
  (** 
    The Amazon Resource Name (ARN) that identifies a Map Run, which dispatched this execution.
     *)

  trace_header: string option;
  (** 
    The X-Ray trace header that was passed to the execution.
     *)

  output_details: cloud_watch_events_execution_data_details option;
  
  output: string option;
  (** 
    The JSON output data of the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
    
     This field is set only if the execution succeeds. If the execution fails, this field is null.
     
      *)

  input_details: cloud_watch_events_execution_data_details option;
  
  input: string option;
  (** 
    The string that contains the JSON input data of the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.
     *)

  stop_date: float option;
  (** 
    If the execution ended, the date the execution stopped.
     *)

  start_date: float;
  (** 
    The date the execution is started.
     *)

  status: execution_status;
  (** 
    The current status of the execution.
     *)

  name: string option;
  [@ocaml.doc {| 
    The name of the execution.
    
     A name must {i not} contain:
     
      {ul
           {- white space
              
              }
            {- brackets [< > { } [ ]]
               
               }
            {- wildcard characters [? *]
               
               }
            {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
               
               }
            {- control characters ([U+0000-001F], [U+007F-009F])
               
               }
           
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the executed stated machine.
     *)

  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the execution.
     *)

}

type describe_execution_input = {
  execution_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the execution to describe.
     *)

}

type describe_activity_output = {
  creation_date: float;
  (** 
    The date the activity is created.
     *)

  name: string;
  [@ocaml.doc {| 
    The name of the activity.
    
     A name must {i not} contain:
     
      {ul
           {- white space
              
              }
            {- brackets [< > { } [ ]]
               
               }
            {- wildcard characters [? *]
               
               }
            {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
               
               }
            {- control characters ([U+0000-001F], [U+007F-009F])
               
               }
           
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

  activity_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the activity.
     *)

}

type describe_activity_input = {
  activity_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the activity to describe.
     *)

}

type delete_state_machine_version_output = unit

type delete_state_machine_version_input = {
  state_machine_version_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine version to delete.
     *)

}

type delete_state_machine_output = unit

type delete_state_machine_input = {
  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine to delete.
     *)

}

type delete_state_machine_alias_output = unit

type delete_state_machine_alias_input = {
  state_machine_alias_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the state machine alias to delete.
     *)

}

type delete_activity_output = unit

type delete_activity_input = {
  activity_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the activity to delete.
     *)

}

type create_state_machine_output = {
  state_machine_version_arn: string option;
  (** 
    The Amazon Resource Name (ARN) that identifies the created state machine version. If you do not set the [publish] parameter to [true], this field returns null value.
     *)

  creation_date: float;
  (** 
    The date the state machine is created.
     *)

  state_machine_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the created state machine.
     *)

}

type create_state_machine_input = {
  version_description: string option;
  (** 
    Sets description about the state machine version. You can only set the description if the [publish] parameter is set to [true]. Otherwise, if you set [versionDescription], but [publish] to [false], this API action throws [ValidationException].
     *)

  publish: bool option;
  (** 
    Set to [true] to publish the first version of the state machine during creation. The default is [false].
     *)

  tracing_configuration: tracing_configuration option;
  (** 
    Selects whether X-Ray tracing is enabled.
     *)

  tags: tag list option;
  (** 
    Tags to be added when creating a state machine.
    
     An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.
     
      Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].
       *)

  logging_configuration: logging_configuration option;
  (** 
    Defines what execution history events are logged and where they are logged.
    
     By default, the [level] is set to [OFF]. For more information see {{:https://docs.aws.amazon.com/step-functions/latest/dg/cloudwatch-log-level.html}Log Levels} in the Step Functions User Guide.
     
      *)

  type_: state_machine_type option;
  (** 
    Determines whether a Standard or Express state machine is created. The default is [STANDARD]. You cannot update the [type] of a state machine once it has been created.
     *)

  role_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the IAM role to use for this state machine.
     *)

  definition: string;
  (** 
    The Amazon States Language definition of the state machine. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language}.
     *)

  name: string;
  [@ocaml.doc {| 
    The name of the state machine.
    
     A name must {i not} contain:
     
      {ul
           {- white space
              
              }
            {- brackets [< > { } [ ]]
               
               }
            {- wildcard characters [? *]
               
               }
            {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
               
               }
            {- control characters ([U+0000-001F], [U+007F-009F])
               
               }
           
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

}

type create_state_machine_alias_output = {
  creation_date: float;
  (** 
    The date the state machine alias was created.
     *)

  state_machine_alias_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the created state machine alias.
     *)

}

type create_state_machine_alias_input = {
  routing_configuration: routing_configuration_list_item list;
  (** 
    The routing configuration of a state machine alias. The routing configuration shifts execution traffic between two state machine versions. [routingConfiguration] contains an array of [RoutingConfig] objects that specify up to two state machine versions. Step Functions then randomly choses which version to run an execution with based on the weight assigned to each [RoutingConfig].
     *)

  name: string;
  (** 
    The name of the state machine alias.
    
     To avoid conflict with version ARNs, don't use an integer in the name of the alias.
      *)

  description: string option;
  (** 
    A description for the state machine alias.
     *)

}

type create_activity_output = {
  creation_date: float;
  (** 
    The date the activity is created.
     *)

  activity_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the created activity.
     *)

}

type create_activity_input = {
  tags: tag list option;
  (** 
    The list of tags to add to a resource.
    
     An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.
     
      Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].
       *)

  name: string;
  [@ocaml.doc {| 
    The name of the activity to create. This name must be unique for your Amazon Web Services account and region for 90 days. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits.html#service-limits-state-machine-executions}Limits Related to State Machine Executions} in the {i Step Functions Developer Guide}.
    
     A name must {i not} contain:
     
      {ul
           {- white space
              
              }
            {- brackets [< > { } [ ]]
               
               }
            {- wildcard characters [? *]
               
               }
            {- special characters [" # % \ ^ | ~ ` $ & , ; : /]
               
               }
            {- control characters ([U+0000-001F], [U+007F-009F])
               
               }
           
      }
       To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.
        |}]

}

(** 
    The maximum number of activities has been reached. Existing activities must be deleted before a new activity can be created.
     *)
type activity_limit_exceeded = {
  message: string option;
  
}

(** 
    Step Functions Step Functions is a service that lets you coordinate the components of distributed applications and microservices using visual workflows.
                   
                    You can use Step Functions to build applications from individual components, each of which performs a discrete function, or {i task}, allowing you to scale and change applications quickly. Step Functions provides a console that helps visualize the components of your application as a series of steps. Step Functions automatically triggers and tracks each step, and retries steps when there are errors, so your application executes predictably and in the right order every time. Step Functions logs the state of each step, so you can quickly diagnose and debug any issues.
                    
                     Step Functions manages operations and underlying infrastructure to ensure your application is available at any scale. You can run tasks on Amazon Web Services, your own servers, or any system that has access to Amazon Web Services. You can access and use Step Functions using the console, the Amazon Web Services SDKs, or an HTTP API. For more information about Step Functions, see the {i {{:https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html}Step Functions Developer Guide}}.
                     
                      If you use the Step Functions API actions using Amazon Web Services SDK integrations, make sure the API actions are in camel case and parameter names are in Pascal case. For example, you could use Step Functions API action [startSyncExecution] and specify its parameter as [StateMachineArn].
                      
                       *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_validate_state_machine_definition_diagnostic :
  ?location:string ->
  message:string ->
  code:string ->
  severity:validate_state_machine_definition_severity ->
  unit
-> validate_state_machine_definition_diagnostic

val make_validate_state_machine_definition_output :
  diagnostics:validate_state_machine_definition_diagnostic list ->
  result:validate_state_machine_definition_result_code ->
  unit
-> validate_state_machine_definition_output

val make_validate_state_machine_definition_input :
  ?type_:state_machine_type -> definition:string -> unit
-> validate_state_machine_definition_input

val make_update_state_machine_output :
  ?state_machine_version_arn:string ->
  ?revision_id:string ->
  update_date:float ->
  unit -> update_state_machine_output

val make_cloud_watch_logs_log_group : ?log_group_arn:string -> unit
-> cloud_watch_logs_log_group

val make_log_destination :
  ?cloud_watch_logs_log_group:cloud_watch_logs_log_group -> unit
-> log_destination

val make_logging_configuration :
  ?destinations:log_destination list ->
  ?include_execution_data:bool ->
  ?level:log_level ->
  unit -> logging_configuration

val make_tracing_configuration : ?enabled:bool -> unit
-> tracing_configuration

val make_update_state_machine_input :
  ?version_description:string ->
  ?publish:bool ->
  ?tracing_configuration:tracing_configuration ->
  ?logging_configuration:logging_configuration ->
  ?role_arn:string ->
  ?definition:string ->
  state_machine_arn:string ->
  unit
-> update_state_machine_input

val make_update_state_machine_alias_output : update_date:float -> unit
-> update_state_machine_alias_output

val make_routing_configuration_list_item :
  weight:int -> state_machine_version_arn:string -> unit
-> routing_configuration_list_item

val make_update_state_machine_alias_input :
  ?routing_configuration:routing_configuration_list_item list ->
  ?description:string ->
  state_machine_alias_arn:string ->
  unit -> update_state_machine_alias_input

val make_update_map_run_output : unit
-> update_map_run_output

val make_update_map_run_input :
  ?tolerated_failure_count:int ->
  ?tolerated_failure_percentage:float ->
  ?max_concurrency:int ->
  map_run_arn:string ->
  unit -> update_map_run_input

val make_untag_resource_output : unit
-> untag_resource_output

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_inspection_data_request :
  ?body:string ->
  ?headers:string ->
  ?url:string ->
  ?method_:string ->
  ?protocol:string ->
  unit -> inspection_data_request

val make_inspection_data_response :
  ?body:string ->
  ?headers:string ->
  ?status_message:string ->
  ?status_code:string ->
  ?protocol:string ->
  unit -> inspection_data_response

val make_inspection_data :
  ?response:inspection_data_response ->
  ?request:inspection_data_request ->
  ?after_result_path:string ->
  ?after_result_selector:string ->
  ?result:string ->
  ?after_parameters:string ->
  ?after_input_path:string ->
  ?input:string ->
  unit -> inspection_data

val make_test_state_output :
  ?status:test_execution_status ->
  ?next_state:string ->
  ?inspection_data:inspection_data ->
  ?cause:string ->
  ?error:string ->
  ?output:string ->
  unit -> test_state_output

val make_test_state_input :
  ?reveal_secrets:bool ->
  ?inspection_level:inspection_level ->
  ?input:string ->
  role_arn:string ->
  definition:string ->
  unit -> test_state_input

val make_task_timed_out_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_timed_out_event_details

val make_history_event_execution_data_details : ?truncated:bool -> unit
-> history_event_execution_data_details

val make_task_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  resource:string ->
  resource_type:string ->
  unit -> task_succeeded_event_details

val make_task_submitted_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_submitted_event_details

val make_task_submit_failed_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit
-> task_submit_failed_event_details

val make_task_started_event_details :
  resource:string -> resource_type:string -> unit
-> task_started_event_details

val make_task_start_failed_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit -> task_start_failed_event_details

val make_task_credentials : ?role_arn:string -> unit
-> task_credentials

val make_task_scheduled_event_details :
  ?task_credentials:task_credentials ->
  ?heartbeat_in_seconds:int ->
  ?timeout_in_seconds:int ->
  parameters:string ->
  region:string ->
  resource:string ->
  resource_type:string ->
  unit -> task_scheduled_event_details

val make_task_failed_event_details :
  ?cause:string ->
  ?error:string ->
  resource:string ->
  resource_type:string ->
  unit -> task_failed_event_details

val make_tag_resource_output : unit -> tag_resource_output

val make_tag : ?value:string -> ?key:string -> unit
-> tag

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input

val make_stop_execution_output : stop_date:float -> unit
-> stop_execution_output

val make_stop_execution_input :
  ?cause:string -> ?error:string -> execution_arn:string -> unit
-> stop_execution_input

val make_state_machine_version_list_item :
  creation_date:float -> state_machine_version_arn:string -> unit
-> state_machine_version_list_item

val make_state_machine_list_item :
  creation_date:float ->
  type_:state_machine_type ->
  name:string ->
  state_machine_arn:string ->
  unit -> state_machine_list_item

val make_state_machine_alias_list_item :
  creation_date:float -> state_machine_alias_arn:string -> unit
-> state_machine_alias_list_item

val make_state_exited_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  name:string ->
  unit -> state_exited_event_details

val make_state_entered_event_details :
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  name:string ->
  unit
-> state_entered_event_details

val make_cloud_watch_events_execution_data_details : ?included:bool -> unit
-> cloud_watch_events_execution_data_details

val make_billing_details :
  ?billed_duration_in_milliseconds:int ->
  ?billed_memory_used_in_m_b:int ->
  unit -> billing_details

val make_start_sync_execution_output :
  ?billing_details:billing_details ->
  ?trace_header:string ->
  ?output_details:cloud_watch_events_execution_data_details ->
  ?output:string ->
  ?input_details:cloud_watch_events_execution_data_details ->
  ?input:string ->
  ?cause:string ->
  ?error:string ->
  ?name:string ->
  ?state_machine_arn:string ->
  status:sync_execution_status ->
  stop_date:float ->
  start_date:float ->
  execution_arn:string ->
  unit -> start_sync_execution_output

val make_start_sync_execution_input :
  ?trace_header:string ->
  ?input:string ->
  ?name:string ->
  state_machine_arn:string ->
  unit -> start_sync_execution_input

val make_start_execution_output :
  start_date:float -> execution_arn:string -> unit
-> start_execution_output

val make_start_execution_input :
  ?trace_header:string ->
  ?input:string ->
  ?name:string ->
  state_machine_arn:string ->
  unit -> start_execution_input

val make_send_task_success_output : unit
-> send_task_success_output

val make_send_task_success_input : output:string -> task_token:string -> unit
-> send_task_success_input

val make_send_task_heartbeat_output : unit
-> send_task_heartbeat_output

val make_send_task_heartbeat_input : task_token:string -> unit
-> send_task_heartbeat_input

val make_send_task_failure_output : unit
-> send_task_failure_output

val make_send_task_failure_input :
  ?cause:string -> ?error:string -> task_token:string -> unit
-> send_task_failure_input

val make_redrive_execution_output : redrive_date:float -> unit
-> redrive_execution_output

val make_redrive_execution_input :
  ?client_token:string -> execution_arn:string -> unit
-> redrive_execution_input

val make_publish_state_machine_version_output :
  state_machine_version_arn:string -> creation_date:float -> unit
-> publish_state_machine_version_output

val make_publish_state_machine_version_input :
  ?description:string ->
  ?revision_id:string ->
  state_machine_arn:string ->
  unit
-> publish_state_machine_version_input

val make_map_state_started_event_details : ?length:int -> unit
-> map_state_started_event_details

val make_map_run_started_event_details : ?map_run_arn:string -> unit
-> map_run_started_event_details

val make_map_run_redriven_event_details :
  ?redrive_count:int -> ?map_run_arn:string -> unit
-> map_run_redriven_event_details

val make_map_run_list_item :
  ?stop_date:float ->
  start_date:float ->
  state_machine_arn:string ->
  map_run_arn:string ->
  execution_arn:string ->
  unit -> map_run_list_item

val make_map_run_item_counts :
  ?pending_redrive:int ->
  ?failures_not_redrivable:int ->
  results_written:int ->
  total:int ->
  aborted:int ->
  timed_out:int ->
  failed:int ->
  succeeded:int ->
  running:int ->
  pending:int ->
  unit -> map_run_item_counts

val make_map_run_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> map_run_failed_event_details

val make_map_run_execution_counts :
  ?pending_redrive:int ->
  ?failures_not_redrivable:int ->
  results_written:int ->
  total:int ->
  aborted:int ->
  timed_out:int ->
  failed:int ->
  succeeded:int ->
  running:int ->
  pending:int ->
  unit -> map_run_execution_counts

val make_map_iteration_event_details : ?index:int -> ?name:string -> unit
-> map_iteration_event_details

val make_list_tags_for_resource_output : ?tags:tag list -> unit
-> list_tags_for_resource_output

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input

val make_list_state_machines_output :
  ?next_token:string -> state_machines:state_machine_list_item list -> unit
-> list_state_machines_output

val make_list_state_machines_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_state_machines_input

val make_list_state_machine_versions_output :
  ?next_token:string ->
  state_machine_versions:state_machine_version_list_item list ->
  unit
-> list_state_machine_versions_output

val make_list_state_machine_versions_input :
  ?max_results:int -> ?next_token:string -> state_machine_arn:string -> unit
-> list_state_machine_versions_input

val make_list_state_machine_aliases_output :
  ?next_token:string ->
  state_machine_aliases:state_machine_alias_list_item list ->
  unit
-> list_state_machine_aliases_output

val make_list_state_machine_aliases_input :
  ?max_results:int -> ?next_token:string -> state_machine_arn:string -> unit
-> list_state_machine_aliases_input

val make_list_map_runs_output :
  ?next_token:string -> map_runs:map_run_list_item list -> unit
-> list_map_runs_output

val make_list_map_runs_input :
  ?next_token:string -> ?max_results:int -> execution_arn:string -> unit
-> list_map_runs_input

val make_execution_list_item :
  ?redrive_date:float ->
  ?redrive_count:int ->
  ?state_machine_alias_arn:string ->
  ?state_machine_version_arn:string ->
  ?item_count:int ->
  ?map_run_arn:string ->
  ?stop_date:float ->
  start_date:float ->
  status:execution_status ->
  name:string ->
  state_machine_arn:string ->
  execution_arn:string ->
  unit -> execution_list_item

val make_list_executions_output :
  ?next_token:string -> executions:execution_list_item list -> unit
-> list_executions_output

val make_list_executions_input :
  ?redrive_filter:execution_redrive_filter ->
  ?map_run_arn:string ->
  ?next_token:string ->
  ?max_results:int ->
  ?status_filter:execution_status ->
  ?state_machine_arn:string ->
  unit -> list_executions_input

val make_activity_list_item :
  creation_date:float -> name:string -> activity_arn:string -> unit
-> activity_list_item

val make_list_activities_output :
  ?next_token:string -> activities:activity_list_item list -> unit
-> list_activities_output

val make_list_activities_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_activities_input

val make_lambda_function_timed_out_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_timed_out_event_details

val make_lambda_function_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  unit
-> lambda_function_succeeded_event_details

val make_lambda_function_start_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_start_failed_event_details

val make_lambda_function_scheduled_event_details :
  ?task_credentials:task_credentials ->
  ?timeout_in_seconds:int ->
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  resource:string ->
  unit
-> lambda_function_scheduled_event_details

val make_lambda_function_schedule_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_schedule_failed_event_details

val make_lambda_function_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> lambda_function_failed_event_details

val make_activity_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> activity_failed_event_details

val make_activity_schedule_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> activity_schedule_failed_event_details

val make_activity_scheduled_event_details :
  ?heartbeat_in_seconds:int ->
  ?timeout_in_seconds:int ->
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  resource:string ->
  unit
-> activity_scheduled_event_details

val make_activity_started_event_details : ?worker_name:string -> unit
-> activity_started_event_details

val make_activity_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  unit
-> activity_succeeded_event_details

val make_activity_timed_out_event_details :
  ?cause:string -> ?error:string -> unit
-> activity_timed_out_event_details

val make_execution_failed_event_details :
  ?cause:string -> ?error:string -> unit
-> execution_failed_event_details

val make_execution_started_event_details :
  ?state_machine_version_arn:string ->
  ?state_machine_alias_arn:string ->
  ?role_arn:string ->
  ?input_details:history_event_execution_data_details ->
  ?input:string ->
  unit
-> execution_started_event_details

val make_execution_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
  ?output:string ->
  unit
-> execution_succeeded_event_details

val make_execution_aborted_event_details :
  ?cause:string -> ?error:string -> unit
-> execution_aborted_event_details

val make_execution_timed_out_event_details :
  ?cause:string -> ?error:string -> unit
-> execution_timed_out_event_details

val make_execution_redriven_event_details : ?redrive_count:int -> unit
-> execution_redriven_event_details

val make_history_event :
  ?map_run_redriven_event_details:map_run_redriven_event_details ->
  ?map_run_failed_event_details:map_run_failed_event_details ->
  ?map_run_started_event_details:map_run_started_event_details ->
  ?state_exited_event_details:state_exited_event_details ->
  ?state_entered_event_details:state_entered_event_details ->
  ?lambda_function_timed_out_event_details:lambda_function_timed_out_event_details ->
  ?lambda_function_succeeded_event_details:lambda_function_succeeded_event_details ->
  ?lambda_function_start_failed_event_details:lambda_function_start_failed_event_details ->
  ?lambda_function_scheduled_event_details:lambda_function_scheduled_event_details ->
  ?lambda_function_schedule_failed_event_details:lambda_function_schedule_failed_event_details ->
  ?lambda_function_failed_event_details:lambda_function_failed_event_details ->
  ?map_iteration_aborted_event_details:map_iteration_event_details ->
  ?map_iteration_failed_event_details:map_iteration_event_details ->
  ?map_iteration_succeeded_event_details:map_iteration_event_details ->
  ?map_iteration_started_event_details:map_iteration_event_details ->
  ?map_state_started_event_details:map_state_started_event_details ->
  ?execution_redriven_event_details:execution_redriven_event_details ->
  ?execution_timed_out_event_details:execution_timed_out_event_details ->
  ?execution_aborted_event_details:execution_aborted_event_details ->
  ?execution_succeeded_event_details:execution_succeeded_event_details ->
  ?execution_started_event_details:execution_started_event_details ->
  ?execution_failed_event_details:execution_failed_event_details ->
  ?task_timed_out_event_details:task_timed_out_event_details ->
  ?task_succeeded_event_details:task_succeeded_event_details ->
  ?task_submitted_event_details:task_submitted_event_details ->
  ?task_submit_failed_event_details:task_submit_failed_event_details ->
  ?task_started_event_details:task_started_event_details ->
  ?task_start_failed_event_details:task_start_failed_event_details ->
  ?task_scheduled_event_details:task_scheduled_event_details ->
  ?task_failed_event_details:task_failed_event_details ->
  ?activity_timed_out_event_details:activity_timed_out_event_details ->
  ?activity_succeeded_event_details:activity_succeeded_event_details ->
  ?activity_started_event_details:activity_started_event_details ->
  ?activity_scheduled_event_details:activity_scheduled_event_details ->
  ?activity_schedule_failed_event_details:activity_schedule_failed_event_details ->
  ?activity_failed_event_details:activity_failed_event_details ->
  ?previous_event_id:int ->
  id:int ->
  type_:history_event_type ->
  timestamp_:float ->
  unit -> history_event

val make_get_execution_history_output :
  ?next_token:string -> events:history_event list -> unit
-> get_execution_history_output

val make_get_execution_history_input :
  ?include_execution_data:bool ->
  ?next_token:string ->
  ?reverse_order:bool ->
  ?max_results:int ->
  execution_arn:string ->
  unit -> get_execution_history_input

val make_get_activity_task_output :
  ?input:string -> ?task_token:string -> unit
-> get_activity_task_output

val make_get_activity_task_input :
  ?worker_name:string -> activity_arn:string -> unit
-> get_activity_task_input

val make_describe_state_machine_output :
  ?description:string ->
  ?revision_id:string ->
  ?label:string ->
  ?tracing_configuration:tracing_configuration ->
  ?logging_configuration:logging_configuration ->
  ?status:state_machine_status ->
  creation_date:float ->
  type_:state_machine_type ->
  role_arn:string ->
  definition:string ->
  name:string ->
  state_machine_arn:string ->
  unit
-> describe_state_machine_output

val make_describe_state_machine_input : state_machine_arn:string -> unit
-> describe_state_machine_input

val make_describe_state_machine_for_execution_output :
  ?revision_id:string ->
  ?label:string ->
  ?map_run_arn:string ->
  ?tracing_configuration:tracing_configuration ->
  ?logging_configuration:logging_configuration ->
  update_date:float ->
  role_arn:string ->
  definition:string ->
  name:string ->
  state_machine_arn:string ->
  unit
-> describe_state_machine_for_execution_output

val make_describe_state_machine_for_execution_input :
  execution_arn:string -> unit
-> describe_state_machine_for_execution_input

val make_describe_state_machine_alias_output :
  ?update_date:float ->
  ?creation_date:float ->
  ?routing_configuration:routing_configuration_list_item list ->
  ?description:string ->
  ?name:string ->
  ?state_machine_alias_arn:string ->
  unit
-> describe_state_machine_alias_output

val make_describe_state_machine_alias_input :
  state_machine_alias_arn:string -> unit
-> describe_state_machine_alias_input

val make_describe_map_run_output :
  ?redrive_date:float ->
  ?redrive_count:int ->
  ?stop_date:float ->
  execution_counts:map_run_execution_counts ->
  item_counts:map_run_item_counts ->
  tolerated_failure_count:int ->
  tolerated_failure_percentage:float ->
  max_concurrency:int ->
  start_date:float ->
  status:map_run_status ->
  execution_arn:string ->
  map_run_arn:string ->
  unit -> describe_map_run_output

val make_describe_map_run_input : map_run_arn:string -> unit
-> describe_map_run_input

val make_describe_execution_output :
  ?redrive_status_reason:string ->
  ?redrive_status:execution_redrive_status ->
  ?redrive_date:float ->
  ?redrive_count:int ->
  ?state_machine_alias_arn:string ->
  ?state_machine_version_arn:string ->
  ?cause:string ->
  ?error:string ->
  ?map_run_arn:string ->
  ?trace_header:string ->
  ?output_details:cloud_watch_events_execution_data_details ->
  ?output:string ->
  ?input_details:cloud_watch_events_execution_data_details ->
  ?input:string ->
  ?stop_date:float ->
  ?name:string ->
  start_date:float ->
  status:execution_status ->
  state_machine_arn:string ->
  execution_arn:string ->
  unit -> describe_execution_output

val make_describe_execution_input : execution_arn:string -> unit
-> describe_execution_input

val make_describe_activity_output :
  creation_date:float -> name:string -> activity_arn:string -> unit
-> describe_activity_output

val make_describe_activity_input : activity_arn:string -> unit
-> describe_activity_input

val make_delete_state_machine_version_output : unit
-> delete_state_machine_version_output

val make_delete_state_machine_version_input :
  state_machine_version_arn:string -> unit
-> delete_state_machine_version_input

val make_delete_state_machine_output : unit
-> delete_state_machine_output

val make_delete_state_machine_input : state_machine_arn:string -> unit
-> delete_state_machine_input

val make_delete_state_machine_alias_output : unit
-> delete_state_machine_alias_output

val make_delete_state_machine_alias_input :
  state_machine_alias_arn:string -> unit
-> delete_state_machine_alias_input

val make_delete_activity_output : unit
-> delete_activity_output

val make_delete_activity_input : activity_arn:string -> unit
-> delete_activity_input

val make_create_state_machine_output :
  ?state_machine_version_arn:string ->
  creation_date:float ->
  state_machine_arn:string ->
  unit -> create_state_machine_output

val make_create_state_machine_input :
  ?version_description:string ->
  ?publish:bool ->
  ?tracing_configuration:tracing_configuration ->
  ?tags:tag list ->
  ?logging_configuration:logging_configuration ->
  ?type_:state_machine_type ->
  role_arn:string ->
  definition:string ->
  name:string ->
  unit
-> create_state_machine_input

val make_create_state_machine_alias_output :
  creation_date:float -> state_machine_alias_arn:string -> unit
-> create_state_machine_alias_output

val make_create_state_machine_alias_input :
  ?description:string ->
  routing_configuration:routing_configuration_list_item list ->
  name:string ->
  unit -> create_state_machine_alias_input

val make_create_activity_output :
  creation_date:float -> activity_arn:string -> unit
-> create_activity_output

val make_create_activity_input : ?tags:tag list -> name:string -> unit
-> create_activity_input

(** {1:operations Operations} *)

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

