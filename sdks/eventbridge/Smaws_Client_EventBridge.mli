(** 
    EventBridge client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    Configuration details of the Amazon SQS queue for EventBridge to use as a dead-letter queue (DLQ).
    
     For more information, see {{:eventbridge/latest/userguide/eb-rule-dlq.html}Event retry policy and using dead-letter queues} in the {i EventBridge User Guide}.
      *)
type dead_letter_config = {
  arn: string option;
  (** 
    The ARN of the SQS queue specified as the target for the dead-letter queue.
     *)

}

type update_event_bus_response = {
  dead_letter_config: dead_letter_config option;
  
  description: string option;
  (** 
    The event bus description.
     *)

  kms_key_identifier: string option;
  (** 
    The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this event bus, if one has been specified.
    
     For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.
      *)

  name: string option;
  (** 
    The event bus name.
     *)

  arn: string option;
  (** 
    The event bus Amazon Resource Name (ARN).
     *)

}

type update_event_bus_request = {
  dead_letter_config: dead_letter_config option;
  
  description: string option;
  (** 
    The event bus description.
     *)

  kms_key_identifier: string option;
  (** 
    The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a customer managed key to encrypt events on this event bus. The identifier can be the key Amazon Resource Name (ARN), KeyId, key alias, or key alias ARN.
    
     If you do not specify a customer managed key identifier, EventBridge uses an Amazon Web Services owned key to encrypt events on the event bus.
     
      For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/getting-started.html}Managing keys} in the {i Key Management Service Developer Guide}.
      
       Archives and schema discovery are not supported for event buses encrypted using a customer managed key. EventBridge returns an error if:
       
        {ul
             {- You call 
                {[
                {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateArchive.html}CreateArchive}
                ]}
                 on an event bus set to use a customer managed key for encryption.
                
                }
              {- You call 
                 {[
                 {{:https://docs.aws.amazon.com/eventbridge/latest/schema-reference/v1-discoverers.html#CreateDiscoverer}CreateDiscoverer}
                 ]}
                  on an event bus set to use a customer managed key for encryption.
                 
                 }
              {- You call 
                 {[
                 {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UpdatedEventBus.html}UpdatedEventBus}
                 ]}
                  to set a customer managed key on an event bus with an archives or schema discovery enabled.
                 
                 }
             
      }
       To enable archives or schema discovery on an event bus, choose to use an Amazon Web Services owned key. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.
       
        *)

  name: string option;
  (** 
    The name of the event bus.
     *)

}

(** 
    An entity that you specified does not exist.
     *)
type resource_not_found_exception = {
  message: string option;
  
}

(** 
    The operation you are attempting is not available in this region.
     *)
type operation_disabled_exception = {
  message: string option;
  
}

(** 
    This exception occurs due to unexpected causes.
     *)
type internal_exception = {
  message: string option;
  
}

(** 
    There is concurrent modification on a rule, target, archive, or replay.
     *)
type concurrent_modification_exception = {
  message: string option;
  
}

(** 
    The primary Region of the endpoint.
     *)
type primary = {
  health_check: string;
  (** 
    The ARN of the health check used by the endpoint to determine whether failover is triggered.
     *)

}

(** 
    The secondary Region that processes events when failover is triggered or replication is enabled.
     *)
type secondary = {
  route: string;
  (** 
    Defines the secondary Region.
     *)

}

(** 
    The failover configuration for an endpoint. This includes what triggers failover and what happens when it's triggered.
     *)
type failover_config = {
  secondary: secondary;
  (** 
    The Region that events are routed to when failover is triggered or event replication is enabled.
     *)

  primary: primary;
  (** 
    The main Region of the endpoint.
     *)

}

(** 
    The routing configuration of the endpoint.
     *)
type routing_config = {
  failover_config: failover_config;
  (** 
    The failover configuration for an endpoint. This includes what triggers failover and what happens when it's triggered.
     *)

}

type replication_state = | DISABLED
  | ENABLED

(** 
    Endpoints can replicate all events to the secondary Region.
     *)
type replication_config = {
  state: replication_state option;
  (** 
    The state of event replication.
     *)

}

(** 
    The event buses the endpoint is associated with.
     *)
type endpoint_event_bus = {
  event_bus_arn: string;
  (** 
    The ARN of the event bus the endpoint is associated with.
     *)

}

type endpoint_state = | DELETE_FAILED
  | UPDATE_FAILED
  | CREATE_FAILED
  | DELETING
  | UPDATING
  | CREATING
  | ACTIVE

type update_endpoint_response = {
  state: endpoint_state option;
  (** 
    The state of the endpoint you updated in this request.
     *)

  endpoint_url: string option;
  (** 
    The URL of the endpoint you updated in this request.
     *)

  endpoint_id: string option;
  (** 
    The ID of the endpoint you updated in this request.
     *)

  role_arn: string option;
  (** 
    The ARN of the role used by event replication for the endpoint you updated in this request.
     *)

  event_buses: endpoint_event_bus list option;
  (** 
    The event buses used for replication for the endpoint you updated in this request.
     *)

  replication_config: replication_config option;
  (** 
    Whether event replication was enabled or disabled for the endpoint you updated in this request.
     *)

  routing_config: routing_config option;
  (** 
    The routing configuration you updated in this request.
     *)

  arn: string option;
  (** 
    The ARN of the endpoint you updated in this request.
     *)

  name: string option;
  (** 
    The name of the endpoint you updated in this request.
     *)

}

type update_endpoint_request = {
  role_arn: string option;
  (** 
    The ARN of the role used by event replication for this request.
     *)

  event_buses: endpoint_event_bus list option;
  (** 
    Define event buses used for replication.
     *)

  replication_config: replication_config option;
  (** 
    Whether event replication was enabled or disabled by this request.
     *)

  routing_config: routing_config option;
  (** 
    Configure the routing policy, including the health check and secondary Region.
     *)

  description: string option;
  (** 
    A description for the endpoint.
     *)

  name: string;
  (** 
    The name of the endpoint you want to update.
     *)

}

type connection_state = | DEAUTHORIZING
  | AUTHORIZING
  | DEAUTHORIZED
  | AUTHORIZED
  | DELETING
  | UPDATING
  | CREATING

type update_connection_response = {
  last_authorized_time: float option;
  (** 
    A time stamp for the time that the connection was last authorized.
     *)

  last_modified_time: float option;
  (** 
    A time stamp for the time that the connection was last modified.
     *)

  creation_time: float option;
  (** 
    A time stamp for the time that the connection was created.
     *)

  connection_state: connection_state option;
  (** 
    The state of the connection that was updated.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection that was updated.
     *)

}

type connection_authorization_type = | API_KEY
  | OAUTH_CLIENT_CREDENTIALS
  | BASIC

(** 
    Contains the Basic authorization parameters for the connection.
     *)
type update_connection_basic_auth_request_parameters = {
  password: string option;
  (** 
    The password associated with the user name to use for Basic authorization.
     *)

  username: string option;
  (** 
    The user name to use for Basic authorization.
     *)

}

(** 
    Contains the OAuth authorization parameters to use for the connection.
     *)
type update_connection_o_auth_client_request_parameters = {
  client_secret: string option;
  (** 
    The client secret assciated with the client ID to use for OAuth authorization.
     *)

  client_i_d: string option;
  (** 
    The client ID to use for OAuth authorization.
     *)

}

type connection_o_auth_http_method = | PUT
  | POST
  | GET

(** 
    Additional parameter included in the header. You can include up to 100 additional header parameters per request. An event payload cannot exceed 64 KB.
     *)
type connection_header_parameter = {
  is_value_secret: bool option;
  (** 
    Specified whether the value is a secret.
     *)

  value: string option;
  (** 
    The value associated with the key.
     *)

  key: string option;
  (** 
    The key for the parameter.
     *)

}

(** 
    Additional query string parameter for the connection. You can include up to 100 additional query string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB.
     *)
type connection_query_string_parameter = {
  is_value_secret: bool option;
  (** 
    Specifies whether the value is secret.
     *)

  value: string option;
  (** 
    The value associated with the key for the query string parameter.
     *)

  key: string option;
  (** 
    The key for a query string parameter.
     *)

}

(** 
    Additional parameter included in the body. You can include up to 100 additional body parameters per request. An event payload cannot exceed 64 KB.
     *)
type connection_body_parameter = {
  is_value_secret: bool option;
  (** 
    Specified whether the value is secret.
     *)

  value: string option;
  (** 
    The value associated with the key.
     *)

  key: string option;
  (** 
    The key for the parameter.
     *)

}

(** 
    Contains additional parameters for the connection.
     *)
type connection_http_parameters = {
  body_parameters: connection_body_parameter list option;
  (** 
    Contains additional body string parameters for the connection.
     *)

  query_string_parameters: connection_query_string_parameter list option;
  (** 
    Contains additional query string parameters for the connection.
     *)

  header_parameters: connection_header_parameter list option;
  (** 
    Contains additional header parameters for the connection.
     *)

}

(** 
    Contains the OAuth request parameters to use for the connection.
     *)
type update_connection_o_auth_request_parameters = {
  o_auth_http_parameters: connection_http_parameters option;
  (** 
    The additional HTTP parameters used for the OAuth authorization request.
     *)

  http_method: connection_o_auth_http_method option;
  (** 
    The method used to connect to the HTTP endpoint.
     *)

  authorization_endpoint: string option;
  (** 
    The URL to the authorization endpoint when OAuth is specified as the authorization type.
     *)

  client_parameters: update_connection_o_auth_client_request_parameters option;
  (** 
    A [UpdateConnectionOAuthClientRequestParameters] object that contains the client parameters to use for the connection when OAuth is specified as the authorization type.
     *)

}

(** 
    Contains the API key authorization parameters to use to update the connection.
     *)
type update_connection_api_key_auth_request_parameters = {
  api_key_value: string option;
  (** 
    The value associated with teh API key to use for authorization.
     *)

  api_key_name: string option;
  (** 
    The name of the API key to use for authorization.
     *)

}

(** 
    Contains the additional parameters to use for the connection.
     *)
type update_connection_auth_request_parameters = {
  invocation_http_parameters: connection_http_parameters option;
  (** 
    A [ConnectionHttpParameters] object that contains the additional parameters to use for the connection.
     *)

  api_key_auth_parameters: update_connection_api_key_auth_request_parameters option;
  (** 
    A [UpdateConnectionApiKeyAuthRequestParameters] object that contains the authorization parameters for API key authorization.
     *)

  o_auth_parameters: update_connection_o_auth_request_parameters option;
  (** 
    A [UpdateConnectionOAuthRequestParameters] object that contains the authorization parameters for OAuth authorization.
     *)

  basic_auth_parameters: update_connection_basic_auth_request_parameters option;
  (** 
    A [UpdateConnectionBasicAuthRequestParameters] object that contains the authorization parameters for Basic authorization.
     *)

}

type update_connection_request = {
  auth_parameters: update_connection_auth_request_parameters option;
  (** 
    The authorization parameters to use for the connection.
     *)

  authorization_type: connection_authorization_type option;
  (** 
    The type of authorization to use for the connection.
     *)

  description: string option;
  (** 
    A description for the connection.
     *)

  name: string;
  (** 
    The name of the connection to update.
     *)

}

(** 
    The request failed because it attempted to create resource beyond the allowed service quota.
     *)
type limit_exceeded_exception = {
  message: string option;
  
}

type archive_state = | UPDATE_FAILED
  | CREATE_FAILED
  | UPDATING
  | CREATING
  | DISABLED
  | ENABLED

type update_archive_response = {
  creation_time: float option;
  (** 
    The time at which the archive was updated.
     *)

  state_reason: string option;
  (** 
    The reason that the archive is in the current state.
     *)

  state: archive_state option;
  (** 
    The state of the archive.
     *)

  archive_arn: string option;
  (** 
    The ARN of the archive.
     *)

}

type update_archive_request = {
  retention_days: int option;
  (** 
    The number of days to retain events in the archive.
     *)

  event_pattern: string option;
  (** 
    The event pattern to use to filter events sent to the archive.
     *)

  description: string option;
  (** 
    The description for the archive.
     *)

  archive_name: string;
  (** 
    The name of the archive to update.
     *)

}

(** 
    The event pattern is not valid.
     *)
type invalid_event_pattern_exception = {
  message: string option;
  
}

type api_destination_state = | INACTIVE
  | ACTIVE

type update_api_destination_response = {
  last_modified_time: float option;
  (** 
    A time stamp for the time that the API destination was last modified.
     *)

  creation_time: float option;
  (** 
    A time stamp for the time that the API destination was created.
     *)

  api_destination_state: api_destination_state option;
  (** 
    The state of the API destination that was updated.
     *)

  api_destination_arn: string option;
  (** 
    The ARN of the API destination that was updated.
     *)

}

type api_destination_http_method = | DELETE
  | PATCH
  | PUT
  | OPTIONS
  | HEAD
  | GET
  | POST

type update_api_destination_request = {
  invocation_rate_limit_per_second: int option;
  (** 
    The maximum number of invocations per second to send to the API destination.
     *)

  http_method: api_destination_http_method option;
  (** 
    The method to use for the API destination.
     *)

  invocation_endpoint: string option;
  (** 
    The URL to the endpoint to use for the API destination.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection to use for the API destination.
     *)

  description: string option;
  (** 
    The name of the API destination to update.
     *)

  name: string;
  (** 
    The name of the API destination to update.
     *)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  (** 
    The list of tag keys to remove from the resource.
     *)

  resource_ar_n: string;
  (** 
    The ARN of the EventBridge resource from which you are removing tags.
     *)

}

(** 
    This rule was created by an Amazon Web Services service on behalf of your account. It is managed by that service. If you see this error in response to [DeleteRule] or [RemoveTargets], you can use the [Force] parameter in those calls to delete the rule or remove targets from the rule. You cannot modify these managed rules by using [DisableRule], [EnableRule], [PutTargets], [PutRule], [TagResource], or [UntagResource].
     *)
type managed_rule_exception = {
  message: string option;
  
}

type test_event_pattern_response = {
  result: bool option;
  (** 
    Indicates whether the event matches the event pattern.
     *)

}

type test_event_pattern_request = {
  event: string;
  (** 
    The event, in JSON format, to test against the event pattern. The JSON must follow the format specified in {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/aws-events.html}Amazon Web Services Events}, and the following fields are mandatory:
    
     {ul
          {- [id]
             
             }
           {- [account]
              
              }
           {- [source]
              
              }
           {- [time]
              
              }
           {- [region]
              
              }
           {- [resources]
              
              }
           {- [detail-type]
              
              }
          
      }
       *)

  event_pattern: string;
  (** 
    The event pattern. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events and Event Patterns} in the {i {i Amazon EventBridge User Guide}}.
     *)

}

(** 
    Contains the parameters needed for you to provide custom input to a target based on one or more pieces of data extracted from the event.
     *)
type input_transformer = {
  input_template: string;
  [@ocaml.doc {| 
    Input template where you specify placeholders that will be filled with the values of the keys from [InputPathsMap] to customize the data sent to the target. Enclose each [InputPathsMaps] value in brackets: <{i value}>
    
     If [InputTemplate] is a JSON object (surrounded by curly braces), the following restrictions apply:
     
      {ul
           {- The placeholder cannot be used as an object key.
              
              }
           
      }
       The following example shows the syntax for using [InputPathsMap] and [InputTemplate].
       
        [ "InputTransformer":]
        
         [{]
         
          ["InputPathsMap": {"instance": "$.detail.instance","status":
        "$.detail.status"},]
          
           
           {[
           "InputTemplate": "is in state "
           ]}
           
           
            [}]
            
             To have the [InputTemplate] include quote marks within a JSON string, escape each quote marks with a slash, as in the following example:
             
              [ "InputTransformer":]
              
               [{]
               
                ["InputPathsMap": {"instance": "$.detail.instance","status":
        "$.detail.status"},]
                
                 
                 {[
                 "InputTemplate": "is in state \"\""
                 ]}
                 
                 
                  [}]
                  
                   The [InputTemplate] can also be valid JSON with varibles in quotes or out, as in the following example:
                   
                    [ "InputTransformer":]
                    
                     [{]
                     
                      ["InputPathsMap": {"instance": "$.detail.instance","status":
        "$.detail.status"},]
                      
                       
                       {[
                       "InputTemplate": '\{"myInstance": ,"myStatus": "is in state \"\""\}'
                       ]}
                       
                       
                        [}]
                         |}]

  input_paths_map: (string * string) list option;
  [@ocaml.doc {| 
    Map of JSON paths to be extracted from the event. You can then insert these in the template in [InputTemplate] to produce the output you want to be sent to the target.
    
     [InputPathsMap] is an array key-value pairs, where each value is a valid JSON path. You can have as many as 100 key-value pairs. You must use JSON dot notation, not bracket notation.
     
      The keys cannot start with "Amazon Web Services."
       |}]

}

(** 
    This object enables you to specify a JSON path to extract from the event and use as the partition key for the Amazon Kinesis data stream, so that you can control the shard to which the event goes. If you do not include this parameter, the default is to use the [eventId] as the partition key.
     *)
type kinesis_parameters = {
  partition_key_path: string;
  (** 
    The JSON path to be extracted from the event and used as the partition key. For more information, see {{:https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#partition-key}Amazon Kinesis Streams Key Concepts} in the {i Amazon Kinesis Streams Developer Guide}.
     *)

}

(** 
    Information about the EC2 instances that are to be sent the command, specified as key-value pairs. Each [RunCommandTarget] block can include only one key, but this key may specify multiple values.
     *)
type run_command_target = {
  values: string list;
  (** 
    If [Key] is [tag:] {i tag-key}, [Values] is a list of tag values. If [Key] is [InstanceIds], [Values] is a list of Amazon EC2 instance IDs.
     *)

  key: string;
  (** 
    Can be either [tag:] {i tag-key} or [InstanceIds].
     *)

}

(** 
    This parameter contains the criteria (either InstanceIds or a tag) used to specify which EC2 instances are to be sent the command.
     *)
type run_command_parameters = {
  run_command_targets: run_command_target list;
  (** 
    Currently, we support including only one RunCommandTarget block, which specifies either an array of InstanceIds or a tag.
     *)

}

type launch_type = | EXTERNAL
  | FARGATE
  | EC2

type assign_public_ip = | DISABLED
  | ENABLED

(** 
    This structure specifies the VPC subnets and security groups for the task, and whether a public IP address is to be used. This structure is relevant only for ECS tasks that use the [awsvpc] network mode.
     *)
type aws_vpc_configuration = {
  assign_public_ip: assign_public_ip option;
  (** 
    Specifies whether the task's elastic network interface receives a public IP address. You can specify [ENABLED] only when [LaunchType] in [EcsParameters] is set to [FARGATE].
     *)

  security_groups: string list option;
  (** 
    Specifies the security groups associated with the task. These security groups must all be in the same VPC. You can specify as many as five security groups. If you do not specify a security group, the default security group for the VPC is used.
     *)

  subnets: string list;
  (** 
    Specifies the subnets associated with the task. These subnets must all be in the same VPC. You can specify as many as 16 subnets.
     *)

}

(** 
    This structure specifies the network configuration for an ECS task.
     *)
type network_configuration = {
  awsvpc_configuration: aws_vpc_configuration option;
  (** 
    Use this structure to specify the VPC subnets and security groups for the task, and whether a public IP address is to be used. This structure is relevant only for ECS tasks that use the [awsvpc] network mode.
     *)

}

(** 
    The details of a capacity provider strategy. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CapacityProviderStrategyItem.html}CapacityProviderStrategyItem} in the Amazon ECS API Reference.
     *)
type capacity_provider_strategy_item = {
  base: int option;
  (** 
    The base value designates how many tasks, at a minimum, to run on the specified capacity provider. Only one capacity provider in a capacity provider strategy can have a base defined. If no value is specified, the default value of 0 is used.
     *)

  weight: int option;
  (** 
    The weight value designates the relative percentage of the total number of tasks launched that should use the specified capacity provider. The weight value is taken into consideration after the base value, if defined, is satisfied.
     *)

  capacity_provider: string;
  (** 
    The short name of the capacity provider.
     *)

}

type placement_constraint_type = | MEMBER_OF
  | DISTINCT_INSTANCE

(** 
    An object representing a constraint on task placement. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html}Task Placement Constraints} in the Amazon Elastic Container Service Developer Guide.
     *)
type placement_constraint = {
  expression: string option;
  (** 
    A cluster query language expression to apply to the constraint. You cannot specify an expression if the constraint type is [distinctInstance]. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html}Cluster Query Language} in the Amazon Elastic Container Service Developer Guide.
     *)

  type_: placement_constraint_type option;
  (** 
    The type of constraint. Use distinctInstance to ensure that each task in a particular group is running on a different container instance. Use memberOf to restrict the selection to a group of valid candidates.
     *)

}

type placement_strategy_type = | BINPACK
  | SPREAD
  | RANDOM

(** 
    The task placement strategy for a task or service. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-strategies.html}Task Placement Strategies} in the Amazon Elastic Container Service Service Developer Guide.
     *)
type placement_strategy = {
  field: string option;
  (** 
    The field to apply the placement strategy against. For the spread placement strategy, valid values are instanceId (or host, which has the same effect), or any platform or custom attribute that is applied to a container instance, such as attribute:ecs.availability-zone. For the binpack placement strategy, valid values are cpu and memory. For the random placement strategy, this field is not used.
     *)

  type_: placement_strategy_type option;
  (** 
    The type of placement strategy. The random placement strategy randomly places tasks on available candidates. The spread placement strategy spreads placement across available candidates evenly based on the field parameter. The binpack strategy places tasks on available candidates that have the least available amount of the resource that is specified with the field parameter. For example, if you binpack on memory, a task is placed on the instance with the least amount of remaining memory (but still enough to run the task).
     *)

}

type propagate_tags = | TASK_DEFINITION

(** 
    A key-value pair associated with an Amazon Web Services resource. In EventBridge, rules and event buses support tagging.
     *)
type tag = {
  value: string;
  (** 
    The value for the specified tag key.
     *)

  key: string;
  (** 
    A string you can use to assign a value. The combination of tag keys and values can help you organize and categorize your resources.
     *)

}

(** 
    The custom parameters to be used when the target is an Amazon ECS task.
     *)
type ecs_parameters = {
  tags: tag list option;
  (** 
    The metadata that you apply to the task to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html#ECS-RunTask-request-tags}RunTask} in the Amazon ECS API Reference.
     *)

  reference_id: string option;
  (** 
    The reference ID to use for the task.
     *)

  propagate_tags: propagate_tags option;
  (** 
    Specifies whether to propagate the tags from the task definition to the task. If no value is specified, the tags are not propagated. Tags can only be propagated to the task during task creation. To add tags to a task after task creation, use the TagResource API action.
     *)

  placement_strategy: placement_strategy list option;
  (** 
    The placement strategy objects to use for the task. You can specify a maximum of five strategy rules per task.
     *)

  placement_constraints: placement_constraint list option;
  (** 
    An array of placement constraint objects to use for the task. You can specify up to 10 constraints per task (including constraints in the task definition and those specified at runtime).
     *)

  enable_execute_command: bool option;
  (** 
    Whether or not to enable the execute command functionality for the containers in this task. If true, this enables execute command functionality on all containers in the task.
     *)

  enable_ecs_managed_tags: bool option;
  (** 
    Specifies whether to enable Amazon ECS managed tags for the task. For more information, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging Your Amazon ECS Resources} in the Amazon Elastic Container Service Developer Guide.
     *)

  capacity_provider_strategy: capacity_provider_strategy_item list option;
  (** 
    The capacity provider strategy to use for the task.
    
     If a [capacityProviderStrategy] is specified, the [launchType] parameter must be omitted. If no [capacityProviderStrategy] or launchType is specified, the [defaultCapacityProviderStrategy] for the cluster is used.
      *)

  group: string option;
  (** 
    Specifies an ECS task group for the task. The maximum length is 255 characters.
     *)

  platform_version: string option;
  (** 
    Specifies the platform version for the task. Specify only the numeric portion of the platform version, such as [1.1.0].
    
     This structure is used only if [LaunchType] is [FARGATE]. For more information about valid platform versions, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate Platform Versions} in the {i Amazon Elastic Container Service Developer Guide}.
      *)

  network_configuration: network_configuration option;
  (** 
    Use this structure if the Amazon ECS task uses the [awsvpc] network mode. This structure specifies the VPC subnets and security groups associated with the task, and whether a public IP address is to be used. This structure is required if [LaunchType] is [FARGATE] because the [awsvpc] mode is required for Fargate tasks.
    
     If you specify [NetworkConfiguration] when the target ECS task does not use the [awsvpc] network mode, the task fails.
      *)

  launch_type: launch_type option;
  (** 
    Specifies the launch type on which your task is running. The launch type that you specify here must match one of the launch type (compatibilities) of the target task. The [FARGATE] value is supported only in the Regions where Fargate with Amazon ECS is supported. For more information, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS-Fargate.html}Fargate on Amazon ECS} in the {i Amazon Elastic Container Service Developer Guide}.
     *)

  task_count: int option;
  (** 
    The number of tasks to create based on [TaskDefinition]. The default is 1.
     *)

  task_definition_arn: string;
  (** 
    The ARN of the task definition to use if the event target is an Amazon ECS task.
     *)

}

(** 
    The array properties for the submitted job, such as the size of the array. The array size can be between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This parameter is used only if the target is an Batch job.
     *)
type batch_array_properties = {
  size: int option;
  (** 
    The size of the array, if this is an array batch job. Valid values are integers between 2 and 10,000.
     *)

}

(** 
    The retry strategy to use for failed jobs, if the target is an Batch job. If you specify a retry strategy here, it overrides the retry strategy defined in the job definition.
     *)
type batch_retry_strategy = {
  attempts: int option;
  (** 
    The number of times to attempt to retry, if the job fails. Valid values are 1–10.
     *)

}

(** 
    The custom parameters to be used when the target is an Batch job.
     *)
type batch_parameters = {
  retry_strategy: batch_retry_strategy option;
  (** 
    The retry strategy to use for failed jobs, if the target is an Batch job. The retry strategy is the number of times to retry the failed job execution. Valid values are 1–10. When you specify a retry strategy here, it overrides the retry strategy defined in the job definition.
     *)

  array_properties: batch_array_properties option;
  (** 
    The array properties for the submitted job, such as the size of the array. The array size can be between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This parameter is used only if the target is an Batch job.
     *)

  job_name: string;
  (** 
    The name to use for this execution of the job, if the target is an Batch job.
     *)

  job_definition: string;
  (** 
    The ARN or name of the job definition to use if the event target is an Batch job. This job definition must already exist.
     *)

}

(** 
    This structure includes the custom parameter to be used when the target is an SQS FIFO queue.
     *)
type sqs_parameters = {
  message_group_id: string option;
  (** 
    The FIFO message group ID to use as the target.
     *)

}

(** 
    These are custom parameter to be used when the target is an API Gateway APIs or EventBridge ApiDestinations. In the latter case, these are merged with any InvocationParameters specified on the Connection, with any values from the Connection taking precedence.
     *)
type http_parameters = {
  query_string_parameters: (string * string) list option;
  (** 
    The query string keys/values that need to be sent as part of request invoking the API Gateway API or EventBridge ApiDestination.
     *)

  header_parameters: (string * string) list option;
  (** 
    The headers that need to be sent as part of request invoking the API Gateway API or EventBridge ApiDestination.
     *)

  path_parameter_values: string list option;
  [@ocaml.doc {| 
    The path parameter values to be used to populate API Gateway API or EventBridge ApiDestination path wildcards ("*").
     |}]

}

(** 
    These are custom parameters to be used when the target is a Amazon Redshift cluster to invoke the Amazon Redshift Data API ExecuteStatement based on EventBridge events.
     *)
type redshift_data_parameters = {
  sqls: string list option;
  (** 
    One or more SQL statements to run. The SQL statements are run as a single transaction. They run serially in the order of the array. Subsequent SQL statements don't start until the previous statement in the array completes. If any SQL statement fails, then because they are run as one transaction, all work is rolled back.
     *)

  with_event: bool option;
  (** 
    Indicates whether to send an event back to EventBridge after the SQL statement runs.
     *)

  statement_name: string option;
  (** 
    The name of the SQL statement. You can name the SQL statement when you create it to identify the query.
     *)

  sql: string option;
  (** 
    The SQL statement text to run.
     *)

  db_user: string option;
  (** 
    The database user name. Required when authenticating using temporary credentials.
     *)

  database: string;
  (** 
    The name of the database. Required when authenticating using temporary credentials.
     *)

  secret_manager_arn: string option;
  (** 
    The name or ARN of the secret that enables access to the database. Required when authenticating using Amazon Web Services Secrets Manager.
     *)

}

(** 
    Name/Value pair of a parameter to start execution of a SageMaker Model Building Pipeline.
     *)
type sage_maker_pipeline_parameter = {
  value: string;
  (** 
    Value of parameter to start execution of a SageMaker Model Building Pipeline.
     *)

  name: string;
  (** 
    Name of parameter to start execution of a SageMaker Model Building Pipeline.
     *)

}

(** 
    These are custom parameters to use when the target is a SageMaker Model Building Pipeline that starts based on EventBridge events.
     *)
type sage_maker_pipeline_parameters = {
  pipeline_parameter_list: sage_maker_pipeline_parameter list option;
  (** 
    List of Parameter names and values for SageMaker Model Building Pipeline execution.
     *)

}

(** 
    A [RetryPolicy] object that includes information about the retry policy settings.
     *)
type retry_policy = {
  maximum_event_age_in_seconds: int option;
  (** 
    The maximum amount of time, in seconds, to continue to make retry attempts.
     *)

  maximum_retry_attempts: int option;
  (** 
    The maximum number of retry attempts to make before the request fails. Retry attempts continue until either the maximum number of attempts is made or until the duration of the [MaximumEventAgeInSeconds] is met.
     *)

}

(** 
    Contains the GraphQL operation to be parsed and executed, if the event target is an AppSync API.
     *)
type app_sync_parameters = {
  graph_ql_operation: string option;
  (** 
    The GraphQL operation; that is, the query, mutation, or subscription to be parsed and executed by the GraphQL service.
    
     For more information, see {{:https://docs.aws.amazon.com/appsync/latest/devguide/graphql-architecture.html#graphql-operations}Operations} in the {i AppSync User Guide}.
      *)

}

(** 
    Targets are the resources to be invoked when a rule is triggered. For a complete list of services and resources that can be set as a target, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutTargets.html}PutTargets}.
    
     If you are setting the event bus of another account as the target, and that account granted permission to your account through an organization instead of directly by the account ID, then you must specify a [RoleArn] with proper permissions in the [Target] structure. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User Guide}.
      *)
type target = {
  app_sync_parameters: app_sync_parameters option;
  (** 
    Contains the GraphQL operation to be parsed and executed, if the event target is an AppSync API.
     *)

  retry_policy: retry_policy option;
  (** 
    The [RetryPolicy] object that contains the retry policy configuration to use for the dead-letter queue.
     *)

  dead_letter_config: dead_letter_config option;
  (** 
    The [DeadLetterConfig] that defines the target queue to send dead-letter queue events to.
     *)

  sage_maker_pipeline_parameters: sage_maker_pipeline_parameters option;
  (** 
    Contains the SageMaker Model Building Pipeline parameters to start execution of a SageMaker Model Building Pipeline.
    
     If you specify a SageMaker Model Building Pipeline as a target, you can use this to specify parameters to start a pipeline execution based on EventBridge events.
      *)

  redshift_data_parameters: redshift_data_parameters option;
  (** 
    Contains the Amazon Redshift Data API parameters to use when the target is a Amazon Redshift cluster.
    
     If you specify a Amazon Redshift Cluster as a Target, you can use this to specify parameters to invoke the Amazon Redshift Data API ExecuteStatement based on EventBridge events.
      *)

  http_parameters: http_parameters option;
  (** 
    Contains the HTTP parameters to use when the target is a API Gateway endpoint or EventBridge ApiDestination.
    
     If you specify an API Gateway API or EventBridge ApiDestination as a target, you can use this parameter to specify headers, path parameters, and query string keys/values as part of your target invoking request. If you're using ApiDestinations, the corresponding Connection can also have these values configured. In case of any conflicting keys, values from the Connection take precedence.
      *)

  sqs_parameters: sqs_parameters option;
  (** 
    Contains the message group ID to use when the target is a FIFO queue.
    
     If you specify an SQS FIFO queue as a target, the queue must have content-based deduplication enabled.
      *)

  batch_parameters: batch_parameters option;
  (** 
    If the event target is an Batch job, this contains the job definition, job name, and other parameters. For more information, see {{:https://docs.aws.amazon.com/batch/latest/userguide/jobs.html}Jobs} in the {i Batch User Guide}.
     *)

  ecs_parameters: ecs_parameters option;
  (** 
    Contains the Amazon ECS task definition and task count to be used, if the event target is an Amazon ECS task. For more information about Amazon ECS tasks, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html}Task Definitions} in the {i Amazon EC2 Container Service Developer Guide}.
     *)

  run_command_parameters: run_command_parameters option;
  (** 
    Parameters used when you are using the rule to invoke Amazon EC2 Run Command.
     *)

  kinesis_parameters: kinesis_parameters option;
  (** 
    The custom parameter you can use to control the shard assignment, when the target is a Kinesis data stream. If you do not include this parameter, the default is to use the [eventId] as the partition key.
     *)

  input_transformer: input_transformer option;
  (** 
    Settings to enable you to provide custom input to a target based on certain event data. You can extract one or more key-value pairs from the event and then use that data to send customized input to the target.
     *)

  input_path: string option;
  (** 
    The value of the JSONPath that is used for extracting part of the matched event when passing it to the target. You may use JSON dot notation or bracket notation. For more information about JSON paths, see {{:http://goessner.net/articles/JsonPath/}JSONPath}.
     *)

  input: string option;
  (** 
    Valid JSON text passed to the target. In this case, nothing from the event itself is passed to the target. For more information, see {{:http://www.rfc-editor.org/rfc/rfc7159.txt}The JavaScript Object Notation (JSON) Data Interchange Format}.
     *)

  role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered. If one rule triggers multiple targets, you can use a different IAM role for each target.
     *)

  arn: string;
  (** 
    The Amazon Resource Name (ARN) of the target.
     *)

  id: string;
  (** 
    The ID of the target within the specified rule. Use this ID to reference the target when updating the rule. We recommend using a memorable and unique string.
     *)

}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
  (** 
    The list of key-value pairs to associate with the resource.
     *)

  resource_ar_n: string;
  (** 
    The ARN of the EventBridge resource that you're adding tags to.
     *)

}

type replay_state = | FAILED
  | CANCELLED
  | COMPLETED
  | CANCELLING
  | RUNNING
  | STARTING

type start_replay_response = {
  replay_start_time: float option;
  (** 
    The time at which the replay started.
     *)

  state_reason: string option;
  (** 
    The reason that the replay is in the state.
     *)

  state: replay_state option;
  (** 
    The state of the replay.
     *)

  replay_arn: string option;
  (** 
    The ARN of the replay.
     *)

}

(** 
    A [ReplayDestination] object that contains details about a replay.
     *)
type replay_destination = {
  filter_arns: string list option;
  (** 
    A list of ARNs for rules to replay events to.
     *)

  arn: string;
  (** 
    The ARN of the event bus to replay event to. You can replay events only to the event bus specified to create the archive.
     *)

}

type start_replay_request = {
  destination: replay_destination;
  (** 
    A [ReplayDestination] object that includes details about the destination for the replay.
     *)

  event_end_time: float;
  (** 
    A time stamp for the time to stop replaying events. Only events that occurred between the [EventStartTime] and [EventEndTime] are replayed.
     *)

  event_start_time: float;
  (** 
    A time stamp for the time to start replaying events. Only events that occurred between the [EventStartTime] and [EventEndTime] are replayed.
     *)

  event_source_arn: string;
  (** 
    The ARN of the archive to replay events from.
     *)

  description: string option;
  (** 
    A description for the replay to start.
     *)

  replay_name: string;
  (** 
    The name of the replay to start.
     *)

}

(** 
    The resource you are trying to create already exists.
     *)
type resource_already_exists_exception = {
  message: string option;
  
}

type rule_state = | ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS
  | DISABLED
  | ENABLED

(** 
    Contains information about a rule in Amazon EventBridge.
     *)
type rule = {
  event_bus_name: string option;
  (** 
    The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.
     *)

  managed_by: string option;
  (** 
    If the rule was created on behalf of your account by an Amazon Web Services service, this field displays the principal name of the service that created the rule.
     *)

  role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the role that is used for target invocation.
    
     If you're setting an event bus in another account as the target and that account granted permission to your account through an organization instead of directly by the account ID, you must specify a [RoleArn] with proper permissions in the [Target] structure, instead of here in this parameter.
      *)

  schedule_expression: string option;
  [@ocaml.doc {| 
    The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5 minutes)". For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-rule-schedule.html}Creating an Amazon EventBridge rule that runs on a schedule}.
     |}]

  description: string option;
  (** 
    The description of the rule.
     *)

  state: rule_state option;
  (** 
    The state of the rule.
    
     Valid values include:
     
      {ul
           {- [DISABLED]: The rule is disabled. EventBridge does not match any events against the rule.
              
              }
            {- [ENABLED]: The rule is enabled. EventBridge matches events against the rule, {i except} for Amazon Web Services management events delivered through CloudTrail.
               
               }
            {- [ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS]: The rule is enabled for all events, including Amazon Web Services management events delivered through CloudTrail.
               
                Management events provide visibility into management operations that are performed on resources in your Amazon Web Services account. These are also known as control plane operations. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html#logging-management-events}Logging management events} in the {i CloudTrail User Guide}, and {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-cloudtrail}Filtering management events from Amazon Web Services services} in the {i {i Amazon EventBridge User Guide}}.
                
                 This value is only valid for rules on the {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is-how-it-works-concepts.html#eb-bus-concepts-buses}default} event bus or {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-event-bus.html}custom event buses}. It does not apply to {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-saas.html}partner event buses}.
                 
                 }
           
      }
       *)

  event_pattern: string option;
  (** 
    The event pattern of the rule. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events and Event Patterns} in the {i {i Amazon EventBridge User Guide}}.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the rule.
     *)

  name: string option;
  (** 
    The name of the rule.
     *)

}

(** 
    A [Replay] object that contains details about a replay.
     *)
type replay = {
  replay_end_time: float option;
  (** 
    A time stamp for the time that the replay completed.
     *)

  replay_start_time: float option;
  (** 
    A time stamp for the time that the replay started.
     *)

  event_last_replayed_time: float option;
  (** 
    A time stamp for the time that the last event was replayed.
     *)

  event_end_time: float option;
  (** 
    A time stamp for the time to start replaying events. Any event with a creation time prior to the [EventEndTime] specified is replayed.
     *)

  event_start_time: float option;
  (** 
    A time stamp for the time to start replaying events. This is determined by the time in the event as described in {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEventsRequestEntry.html#eventbridge-Type-PutEventsRequestEntry-Time}Time}.
     *)

  state_reason: string option;
  (** 
    A description of why the replay is in the current state.
     *)

  state: replay_state option;
  (** 
    The current state of the replay.
     *)

  event_source_arn: string option;
  (** 
    The ARN of the archive to replay event from.
     *)

  replay_name: string option;
  (** 
    The name of the replay.
     *)

}

(** 
    Represents a target that failed to be removed from a rule.
     *)
type remove_targets_result_entry = {
  error_message: string option;
  (** 
    The error message that explains why the target removal failed.
     *)

  error_code: string option;
  (** 
    The error code that indicates why the target removal failed. If the value is [ConcurrentModificationException], too many requests were made at the same time.
     *)

  target_id: string option;
  (** 
    The ID of the target.
     *)

}

type remove_targets_response = {
  failed_entries: remove_targets_result_entry list option;
  (** 
    The failed target entries.
     *)

  failed_entry_count: int option;
  (** 
    The number of failed entries.
     *)

}

type remove_targets_request = {
  force: bool option;
  (** 
    If this is a managed rule, created by an Amazon Web Services service on your behalf, you must specify [Force] as [True] to remove targets. This parameter is ignored for rules that are not managed rules. You can check whether a rule is a managed rule by using [DescribeRule] or [ListRules] and checking the [ManagedBy] field of the response.
     *)

  ids: string list;
  (** 
    The IDs of the targets to remove from the rule.
     *)

  event_bus_name: string option;
  (** 
    The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.
     *)

  rule: string;
  (** 
    The name of the rule.
     *)

}

type remove_permission_request = {
  event_bus_name: string option;
  (** 
    The name of the event bus to revoke permissions for. If you omit this, the default event bus is used.
     *)

  remove_all_permissions: bool option;
  (** 
    Specifies whether to remove all permissions.
     *)

  statement_id: string option;
  (** 
    The statement ID corresponding to the account that is no longer allowed to put events to the default event bus.
     *)

}

(** 
    Represents a target that failed to be added to a rule.
     *)
type put_targets_result_entry = {
  error_message: string option;
  (** 
    The error message that explains why the target addition failed.
     *)

  error_code: string option;
  (** 
    The error code that indicates why the target addition failed. If the value is [ConcurrentModificationException], too many requests were made at the same time.
     *)

  target_id: string option;
  (** 
    The ID of the target.
     *)

}

type put_targets_response = {
  failed_entries: put_targets_result_entry list option;
  (** 
    The failed target entries.
     *)

  failed_entry_count: int option;
  (** 
    The number of failed entries.
     *)

}

type put_targets_request = {
  targets: target list;
  (** 
    The targets to update or add to the rule.
     *)

  event_bus_name: string option;
  (** 
    The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.
     *)

  rule: string;
  (** 
    The name of the rule.
     *)

}

type put_rule_response = {
  rule_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the rule.
     *)

}

type put_rule_request = {
  event_bus_name: string option;
  (** 
    The name or ARN of the event bus to associate with this rule. If you omit this, the default event bus is used.
     *)

  tags: tag list option;
  (** 
    The list of key-value pairs to associate with the rule.
     *)

  role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM role associated with the rule.
    
     If you're setting an event bus in another account as the target and that account granted permission to your account through an organization instead of directly by the account ID, you must specify a [RoleArn] with proper permissions in the [Target] structure, instead of here in this parameter.
      *)

  description: string option;
  (** 
    A description of the rule.
     *)

  state: rule_state option;
  (** 
    The state of the rule.
    
     Valid values include:
     
      {ul
           {- [DISABLED]: The rule is disabled. EventBridge does not match any events against the rule.
              
              }
            {- [ENABLED]: The rule is enabled. EventBridge matches events against the rule, {i except} for Amazon Web Services management events delivered through CloudTrail.
               
               }
            {- [ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS]: The rule is enabled for all events, including Amazon Web Services management events delivered through CloudTrail.
               
                Management events provide visibility into management operations that are performed on resources in your Amazon Web Services account. These are also known as control plane operations. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html#logging-management-events}Logging management events} in the {i CloudTrail User Guide}, and {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-cloudtrail}Filtering management events from Amazon Web Services services} in the {i {i Amazon EventBridge User Guide}}.
                
                 This value is only valid for rules on the {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is-how-it-works-concepts.html#eb-bus-concepts-buses}default} event bus or {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-event-bus.html}custom event buses}. It does not apply to {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-saas.html}partner event buses}.
                 
                 }
           
      }
       *)

  event_pattern: string option;
  (** 
    The event pattern. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html}Amazon EventBridge event patterns} in the {i {i Amazon EventBridge User Guide}}.
     *)

  schedule_expression: string option;
  [@ocaml.doc {| 
    The scheduling expression. For example, "cron(0 20 * * ? *)" or "rate(5 minutes)".
     |}]

  name: string;
  (** 
    The name of the rule that you are creating or updating.
     *)

}

[@@ocaml.doc {| 
    A JSON string which you can use to limit the event bus permissions you are granting to only accounts that fulfill the condition. Currently, the only supported condition is membership in a certain Amazon Web Services organization. The string must contain [Type], [Key], and [Value] fields. The [Value] field specifies the ID of the Amazon Web Services organization. Following is an example value for [Condition]:
    
     ['{"Type" : "StringEquals", "Key": "aws:PrincipalOrgID", "Value":
        "o-1234567890"}']
      |}]
type condition = {
  value: string;
  (** 
    Specifies the value for the key. Currently, this must be the ID of the organization.
     *)

  key: string;
  (** 
    Specifies the key for the condition. Currently the only supported key is [aws:PrincipalOrgID].
     *)

  type_: string;
  (** 
    Specifies the type of condition. Currently the only supported value is [StringEquals].
     *)

}

type put_permission_request = {
  policy: string option;
  (** 
    A JSON string that describes the permission policy statement. You can include a [Policy] parameter in the request instead of using the [StatementId], [Action], [Principal], or [Condition] parameters.
     *)

  condition: condition option;
  [@ocaml.doc {| 
    This parameter enables you to limit the permission to accounts that fulfill a certain condition, such as being a member of a certain Amazon Web Services organization. For more information about Amazon Web Services Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html}What Is Amazon Web Services Organizations} in the {i Amazon Web Services Organizations User Guide}.
    
     If you specify [Condition] with an Amazon Web Services organization ID, and specify "*" as the value for [Principal], you grant permission to all the accounts in the named organization.
     
      The [Condition] is a JSON string which must contain [Type], [Key], and [Value] fields.
       |}]

  statement_id: string option;
  (** 
    An identifier string for the external account that you are granting permissions to. If you later want to revoke the permission for this external account, specify this [StatementId] when you run {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemovePermission.html}RemovePermission}.
    
     Each [StatementId] must be unique.
     
      *)

  principal: string option;
  [@ocaml.doc {| 
    The 12-digit Amazon Web Services account ID that you are permitting to put events to your default event bus. Specify "*" to permit any account to put events to your default event bus.
    
     If you specify "*" without specifying [Condition], avoid creating rules that may match undesirable events. To create more secure rules, make sure that the event pattern for each rule contains an [account] field with a specific account ID from which to receive events. Rules with an account field do not match any events sent from other accounts.
      |}]

  action: string option;
  (** 
    The action that you are enabling the other account to perform.
     *)

  event_bus_name: string option;
  (** 
    The name of the event bus associated with the rule. If you omit this, the default event bus is used.
     *)

}

(** 
    The event bus policy is too long. For more information, see the limits.
     *)
type policy_length_exceeded_exception = {
  message: string option;
  
}

(** 
    The result of an event entry the partner submitted in this request. If the event was successfully submitted, the entry has the event ID in it. Otherwise, you can use the error code and error message to identify the problem with the entry.
     *)
type put_partner_events_result_entry = {
  error_message: string option;
  (** 
    The error message that explains why the event submission failed.
     *)

  error_code: string option;
  (** 
    The error code that indicates why the event submission failed.
     *)

  event_id: string option;
  (** 
    The ID of the event.
     *)

}

type put_partner_events_response = {
  entries: put_partner_events_result_entry list option;
  (** 
    The results for each event entry the partner submitted in this request. If the event was successfully submitted, the entry has the event ID in it. Otherwise, you can use the error code and error message to identify the problem with the entry.
    
     For each record, the index of the response element is the same as the index in the request array.
      *)

  failed_entry_count: int option;
  (** 
    The number of events from this operation that could not be written to the partner event bus.
     *)

}

(** 
    The details about an event generated by an SaaS partner.
     *)
type put_partner_events_request_entry = {
  detail: string option;
  (** 
    A valid JSON string. There is no other schema imposed. The JSON string may contain fields and nested sub-objects.
    
     [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request.
     
      *)

  detail_type: string option;
  (** 
    A free-form string, with a maximum of 128 characters, used to decide what fields to expect in the event detail.
    
     [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request.
     
      *)

  resources: string list option;
  (** 
    Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event primarily concerns. Any number, including zero, may be present.
     *)

  source: string option;
  (** 
    The event source that is generating the entry.
    
     [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request.
     
      *)

  time: float option;
  (** 
    The date and time of the event.
     *)

}

type put_partner_events_request = {
  entries: put_partner_events_request_entry list;
  (** 
    The list of events to write to the event bus.
     *)

}

(** 
    Represents the results of an event submitted to an event bus.
    
     If the submission was successful, the entry has the event ID in it. Otherwise, you can use the error code and error message to identify the problem with the entry.
     
      For information about the errors that are common to all actions, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html}Common Errors}.
       *)
type put_events_result_entry = {
  error_message: string option;
  (** 
    The error message that explains why the event submission failed.
     *)

  error_code: string option;
  (** 
    The error code that indicates why the event submission failed.
    
     Retryable errors include:
     
      {ul
           {- 
              {[
              {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html}InternalFailure}
              ]}
              
              
               The request processing has failed because of an unknown error, exception or failure.
               
               }
            {- 
               {[
               {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html}ThrottlingException}
               ]}
               
               
                The request was denied due to request throttling.
                
                }
           
      }
       Non-retryable errors include:
       
        {ul
             {- 
                {[
                {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html}AccessDeniedException}
                ]}
                
                
                 You do not have sufficient access to perform this action.
                 
                 }
              {- [InvalidAccountIdException]
                 
                  The account ID provided is not valid.
                  
                  }
              {- [InvalidArgument]
                 
                  A specified parameter is not valid.
                  
                  }
              {- [MalformedDetail]
                 
                  The JSON provided is not valid.
                  
                  }
              {- [RedactionFailure]
                 
                  Redacting the CloudTrail event failed.
                  
                  }
              {- [NotAuthorizedForSourceException]
                 
                  You do not have permissions to publish events with this source onto this event bus.
                  
                  }
              {- [NotAuthorizedForDetailTypeException]
                 
                  You do not have permissions to publish events with this detail type onto this event bus.
                  
                  }
             
      }
       *)

  event_id: string option;
  (** 
    The ID of the event.
     *)

}

type put_events_response = {
  entries: put_events_result_entry list option;
  (** 
    The successfully and unsuccessfully ingested events results. If the ingestion was successful, the entry has the event ID in it. Otherwise, you can use the error code and error message to identify the problem with the entry.
    
     For each record, the index of the response element is the same as the index in the request array.
      *)

  failed_entry_count: int option;
  (** 
    The number of failed entries.
     *)

}

(** 
    Represents an event to be submitted.
     *)
type put_events_request_entry = {
  trace_header: string option;
  (** 
    An X-Ray trace header, which is an http header (X-Amzn-Trace-Id) that contains the trace-id associated with the event.
    
     To learn more about X-Ray trace headers, see {{:https://docs.aws.amazon.com/xray/latest/devguide/xray-concepts.html#xray-concepts-tracingheader}Tracing header} in the X-Ray Developer Guide.
      *)

  event_bus_name: string option;
  (** 
    The name or ARN of the event bus to receive the event. Only the rules that are associated with this event bus are used to match the event. If you omit this, the default event bus is used.
    
     If you're using a global endpoint with a custom bus, you can enter either the name or Amazon Resource Name (ARN) of the event bus in either the primary or secondary Region here. EventBridge then determines the corresponding event bus in the other Region based on the endpoint referenced by the [EndpointId]. Specifying the event bus ARN is preferred.
     
      *)

  detail: string option;
  (** 
    A valid JSON object. There is no other schema imposed. The JSON object may contain fields and nested sub-objects.
    
     [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request.
     
      *)

  detail_type: string option;
  (** 
    Free-form string, with a maximum of 128 characters, used to decide what fields to expect in the event detail.
    
     [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request.
     
      *)

  resources: string list option;
  (** 
    Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event primarily concerns. Any number, including zero, may be present.
     *)

  source: string option;
  (** 
    The source of the event.
    
     [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request.
     
      *)

  time: float option;
  (** 
    The time stamp of the event, per {{:https://www.rfc-editor.org/rfc/rfc3339.txt}RFC3339}. If no time stamp is provided, the time stamp of the {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEvents.html}PutEvents} call is used.
     *)

}

type put_events_request = {
  endpoint_id: string option;
  (** 
    The URL subdomain of the endpoint. For example, if the URL for Endpoint is https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is [abcde.veo].
    
     When using Java, you must include [auth-crt] on the class path.
     
      *)

  entries: put_events_request_entry list;
  (** 
    The entry that defines an event in your system. You can specify several parameters for the entry such as the source and type of the event, resources associated with the event, and so on.
     *)

}

(** 
    A partner event source is created by an SaaS partner. If a customer creates a partner event bus that matches this event source, that Amazon Web Services account can receive events from the partner's applications or services.
     *)
type partner_event_source = {
  name: string option;
  (** 
    The name of the partner event source.
     *)

  arn: string option;
  (** 
    The ARN of the partner event source.
     *)

}

type event_source_state = | DELETED
  | ACTIVE
  | PENDING

(** 
    The Amazon Web Services account that a partner event source has been offered to.
     *)
type partner_event_source_account = {
  state: event_source_state option;
  (** 
    The state of the event source. If it is ACTIVE, you have already created a matching event bus for this event source, and that event bus is active. If it is PENDING, either you haven't yet created a matching event bus, or that event bus is deactivated. If it is DELETED, you have created a matching event bus, but the event source has since been deleted.
     *)

  expiration_time: float option;
  (** 
    The date and time that the event source will expire, if the Amazon Web Services account doesn't create a matching event bus for it.
     *)

  creation_time: float option;
  (** 
    The date and time the event source was created.
     *)

  account: string option;
  (** 
    The Amazon Web Services account ID that the partner event source was offered to.
     *)

}

type list_targets_by_rule_response = {
  next_token: string option;
  (** 
    Indicates whether there are additional results to retrieve. If there are no more results, the value is null.
     *)

  targets: target list option;
  (** 
    The targets assigned to the rule.
     *)

}

type list_targets_by_rule_request = {
  limit: int option;
  (** 
    The maximum number of results to return.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  event_bus_name: string option;
  (** 
    The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.
     *)

  rule: string;
  (** 
    The name of the rule.
     *)

}

type list_tags_for_resource_response = {
  tags: tag list option;
  (** 
    The list of tag keys and values associated with the resource you specified
     *)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  (** 
    The ARN of the EventBridge resource for which you want to view tags.
     *)

}

type list_rules_response = {
  next_token: string option;
  (** 
    Indicates whether there are additional results to retrieve. If there are no more results, the value is null.
     *)

  rules: rule list option;
  (** 
    The rules that match the specified criteria.
     *)

}

type list_rules_request = {
  limit: int option;
  (** 
    The maximum number of results to return.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  event_bus_name: string option;
  (** 
    The name or ARN of the event bus to list the rules for. If you omit this, the default event bus is used.
     *)

  name_prefix: string option;
  (** 
    The prefix matching the rule name.
     *)

}

type list_rule_names_by_target_response = {
  next_token: string option;
  (** 
    Indicates whether there are additional results to retrieve. If there are no more results, the value is null.
     *)

  rule_names: string list option;
  (** 
    The names of the rules that can invoke the given target.
     *)

}

type list_rule_names_by_target_request = {
  limit: int option;
  (** 
    The maximum number of results to return.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  event_bus_name: string option;
  (** 
    The name or ARN of the event bus to list rules for. If you omit this, the default event bus is used.
     *)

  target_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the target resource.
     *)

}

type list_replays_response = {
  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  replays: replay list option;
  (** 
    An array of [Replay] objects that contain information about the replay.
     *)

}

type list_replays_request = {
  limit: int option;
  (** 
    The maximum number of replays to retrieve.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  event_source_arn: string option;
  (** 
    The ARN of the archive from which the events are replayed.
     *)

  state: replay_state option;
  (** 
    The state of the replay.
     *)

  name_prefix: string option;
  (** 
    A name prefix to filter the replays returned. Only replays with name that match the prefix are returned.
     *)

}

type list_partner_event_sources_response = {
  next_token: string option;
  (** 
    A token you can use in a subsequent operation to retrieve the next set of results.
     *)

  partner_event_sources: partner_event_source list option;
  (** 
    The list of partner event sources returned by the operation.
     *)

}

type list_partner_event_sources_request = {
  limit: int option;
  (** 
    pecifying this limits the number of results returned by this operation. The operation also returns a NextToken which you can use in a subsequent operation to retrieve the next set of results.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to this operation. Specifying this retrieves the next set of results.
     *)

  name_prefix: string;
  (** 
    If you specify this, the results are limited to only those partner event sources that start with the string you specify.
     *)

}

type list_partner_event_source_accounts_response = {
  next_token: string option;
  (** 
    A token you can use in a subsequent operation to retrieve the next set of results.
     *)

  partner_event_source_accounts: partner_event_source_account list option;
  (** 
    The list of partner event sources returned by the operation.
     *)

}

type list_partner_event_source_accounts_request = {
  limit: int option;
  (** 
    Specifying this limits the number of results returned by this operation. The operation also returns a NextToken which you can use in a subsequent operation to retrieve the next set of results.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to this operation. Specifying this retrieves the next set of results.
     *)

  event_source_name: string;
  (** 
    The name of the partner event source to display account information about.
     *)

}

(** 
    A partner event source is created by an SaaS partner. If a customer creates a partner event bus that matches this event source, that Amazon Web Services account can receive events from the partner's applications or services.
     *)
type event_source = {
  state: event_source_state option;
  (** 
    The state of the event source. If it is ACTIVE, you have already created a matching event bus for this event source, and that event bus is active. If it is PENDING, either you haven't yet created a matching event bus, or that event bus is deactivated. If it is DELETED, you have created a matching event bus, but the event source has since been deleted.
     *)

  name: string option;
  (** 
    The name of the event source.
     *)

  expiration_time: float option;
  (** 
    The date and time that the event source will expire, if the Amazon Web Services account doesn't create a matching event bus for it.
     *)

  creation_time: float option;
  (** 
    The date and time the event source was created.
     *)

  created_by: string option;
  (** 
    The name of the partner that created the event source.
     *)

  arn: string option;
  (** 
    The ARN of the event source.
     *)

}

type list_event_sources_response = {
  next_token: string option;
  (** 
    A token you can use in a subsequent operation to retrieve the next set of results.
     *)

  event_sources: event_source list option;
  (** 
    The list of event sources.
     *)

}

type list_event_sources_request = {
  limit: int option;
  (** 
    Specifying this limits the number of results returned by this operation. The operation also returns a NextToken which you can use in a subsequent operation to retrieve the next set of results.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  name_prefix: string option;
  (** 
    Specifying this limits the results to only those partner event sources with names that start with the specified prefix.
     *)

}

(** 
    An event bus receives events from a source, uses rules to evaluate them, applies any configured input transformation, and routes them to the appropriate target(s). Your account's default event bus receives events from Amazon Web Services services. A custom event bus can receive events from your custom applications and services. A partner event bus receives events from an event source created by an SaaS partner. These events come from the partners services or applications.
     *)
type event_bus = {
  last_modified_time: float option;
  (** 
    The time the event bus was last modified.
     *)

  creation_time: float option;
  (** 
    The time the event bus was created.
     *)

  policy: string option;
  (** 
    The permissions policy of the event bus, describing which other Amazon Web Services accounts can write events to this event bus.
     *)

  description: string option;
  (** 
    The event bus description.
     *)

  arn: string option;
  (** 
    The ARN of the event bus.
     *)

  name: string option;
  (** 
    The name of the event bus.
     *)

}

type list_event_buses_response = {
  next_token: string option;
  (** 
    A token you can use in a subsequent operation to retrieve the next set of results.
     *)

  event_buses: event_bus list option;
  (** 
    This list of event buses.
     *)

}

type list_event_buses_request = {
  limit: int option;
  (** 
    Specifying this limits the number of results returned by this operation. The operation also returns a NextToken which you can use in a subsequent operation to retrieve the next set of results.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  name_prefix: string option;
  (** 
    Specifying this limits the results to only those event buses with names that start with the specified prefix.
     *)

}

(** 
    A global endpoint used to improve your application's availability by making it regional-fault tolerant. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i {i Amazon EventBridge User Guide}}.
     *)
type endpoint = {
  last_modified_time: float option;
  (** 
    The last time the endpoint was modified.
     *)

  creation_time: float option;
  (** 
    The time the endpoint was created.
     *)

  state_reason: string option;
  (** 
    The reason the endpoint is in its current state.
     *)

  state: endpoint_state option;
  (** 
    The current state of the endpoint.
     *)

  endpoint_url: string option;
  (** 
    The URL of the endpoint.
     *)

  endpoint_id: string option;
  (** 
    The URL subdomain of the endpoint. For example, if the URL for Endpoint is https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is [abcde.veo].
     *)

  role_arn: string option;
  (** 
    The ARN of the role used by event replication for the endpoint.
     *)

  event_buses: endpoint_event_bus list option;
  (** 
    The event buses being used by the endpoint.
     *)

  replication_config: replication_config option;
  (** 
    Whether event replication was enabled or disabled for this endpoint. The default state is [ENABLED] which means you must supply a [RoleArn]. If you don't have a [RoleArn] or you don't want event replication enabled, set the state to [DISABLED].
     *)

  routing_config: routing_config option;
  (** 
    The routing configuration of the endpoint.
     *)

  arn: string option;
  (** 
    The ARN of the endpoint.
     *)

  description: string option;
  (** 
    A description for the endpoint.
     *)

  name: string option;
  (** 
    The name of the endpoint.
     *)

}

type list_endpoints_response = {
  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error.
     *)

  endpoints: endpoint list option;
  (** 
    The endpoints returned by the call.
     *)

}

type list_endpoints_request = {
  max_results: int option;
  (** 
    The maximum number of results returned by the call.
     *)

  next_token: string option;
  (** 
    If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error.
     *)

  home_region: string option;
  [@ocaml.doc {| 
    The primary Region of the endpoints associated with this account. For example ["HomeRegion": "us-east-1"].
     |}]

  name_prefix: string option;
  [@ocaml.doc {| 
    A value that will return a subset of the endpoints associated with this account. For example, ["NamePrefix": "ABC"] will return all endpoints with "ABC" in the name.
     |}]

}

(** 
    Contains information about a connection.
     *)
type connection = {
  last_authorized_time: float option;
  (** 
    A time stamp for the time that the connection was last authorized.
     *)

  last_modified_time: float option;
  (** 
    A time stamp for the time that the connection was last modified.
     *)

  creation_time: float option;
  (** 
    A time stamp for the time that the connection was created.
     *)

  authorization_type: connection_authorization_type option;
  (** 
    The authorization type specified for the connection.
    
     OAUTH tokens are refreshed when a 401 or 407 response is returned.
     
      *)

  state_reason: string option;
  (** 
    The reason that the connection is in the connection state.
     *)

  connection_state: connection_state option;
  (** 
    The state of the connection.
     *)

  name: string option;
  (** 
    The name of the connection.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection.
     *)

}

type list_connections_response = {
  next_token: string option;
  (** 
    A token you can use in a subsequent request to retrieve the next set of results.
     *)

  connections: connection list option;
  (** 
    An array of connections objects that include details about the connections.
     *)

}

type list_connections_request = {
  limit: int option;
  (** 
    The maximum number of connections to return.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  connection_state: connection_state option;
  (** 
    The state of the connection.
     *)

  name_prefix: string option;
  (** 
    A name prefix to filter results returned. Only connections with a name that starts with the prefix are returned.
     *)

}

(** 
    An [Archive] object that contains details about an archive.
     *)
type archive = {
  creation_time: float option;
  (** 
    The time stamp for the time that the archive was created.
     *)

  event_count: int option;
  (** 
    The number of events in the archive.
     *)

  size_bytes: int option;
  (** 
    The size of the archive, in bytes.
     *)

  retention_days: int option;
  (** 
    The number of days to retain events in the archive before they are deleted.
     *)

  state_reason: string option;
  (** 
    A description for the reason that the archive is in the current state.
     *)

  state: archive_state option;
  (** 
    The current state of the archive.
     *)

  event_source_arn: string option;
  (** 
    The ARN of the event bus associated with the archive. Only events from this event bus are sent to the archive.
     *)

  archive_name: string option;
  (** 
    The name of the archive.
     *)

}

type list_archives_response = {
  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  archives: archive list option;
  (** 
    An array of [Archive] objects that include details about an archive.
     *)

}

type list_archives_request = {
  limit: int option;
  (** 
    The maximum number of results to return.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  state: archive_state option;
  (** 
    The state of the archive.
     *)

  event_source_arn: string option;
  (** 
    The ARN of the event source associated with the archive.
     *)

  name_prefix: string option;
  (** 
    A name prefix to filter the archives returned. Only archives with name that match the prefix are returned.
     *)

}

(** 
    Contains details about an API destination.
     *)
type api_destination = {
  last_modified_time: float option;
  (** 
    A time stamp for the time that the API destination was last modified.
     *)

  creation_time: float option;
  (** 
    A time stamp for the time that the API destination was created.
     *)

  invocation_rate_limit_per_second: int option;
  (** 
    The maximum number of invocations per second to send to the HTTP endpoint.
     *)

  http_method: api_destination_http_method option;
  (** 
    The method to use to connect to the HTTP endpoint.
     *)

  invocation_endpoint: string option;
  (** 
    The URL to the endpoint for the API destination.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection specified for the API destination.
     *)

  api_destination_state: api_destination_state option;
  (** 
    The state of the API destination.
     *)

  name: string option;
  (** 
    The name of the API destination.
     *)

  api_destination_arn: string option;
  (** 
    The ARN of the API destination.
     *)

}

type list_api_destinations_response = {
  next_token: string option;
  (** 
    A token you can use in a subsequent request to retrieve the next set of results.
     *)

  api_destinations: api_destination list option;
  (** 
    An array of [ApiDestination] objects that include information about an API destination.
     *)

}

type list_api_destinations_request = {
  limit: int option;
  (** 
    The maximum number of API destinations to include in the response.
     *)

  next_token: string option;
  (** 
    The token returned by a previous call to retrieve the next set of results.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection specified for the API destination.
     *)

  name_prefix: string option;
  (** 
    A name prefix to filter results returned. Only API destinations with a name that starts with the prefix are returned.
     *)

}

(** 
    The specified state is not a valid state for an event source.
     *)
type invalid_state_exception = {
  message: string option;
  
}

(** 
    An error occurred because a replay can be canceled only when the state is Running or Starting.
     *)
type illegal_status_exception = {
  message: string option;
  
}

type enable_rule_request = {
  event_bus_name: string option;
  (** 
    The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.
     *)

  name: string;
  (** 
    The name of the rule.
     *)

}

type disable_rule_request = {
  event_bus_name: string option;
  (** 
    The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.
     *)

  name: string;
  (** 
    The name of the rule.
     *)

}

type describe_rule_response = {
  created_by: string option;
  (** 
    The account ID of the user that created the rule. If you use [PutRule] to put a rule on an event bus in another account, the other account is the owner of the rule, and the rule ARN includes the account ID for that account. However, the value for [CreatedBy] is the account ID as the account that created the rule in the other account.
     *)

  event_bus_name: string option;
  (** 
    The name of the event bus associated with the rule.
     *)

  managed_by: string option;
  (** 
    If this is a managed rule, created by an Amazon Web Services service on your behalf, this field displays the principal name of the Amazon Web Services service that created the rule.
     *)

  role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM role associated with the rule.
     *)

  description: string option;
  (** 
    The description of the rule.
     *)

  state: rule_state option;
  (** 
    Specifies whether the rule is enabled or disabled.
     *)

  schedule_expression: string option;
  [@ocaml.doc {| 
    The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5 minutes)".
     |}]

  event_pattern: string option;
  (** 
    The event pattern. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events and Event Patterns} in the {i {i Amazon EventBridge User Guide}}.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the rule.
     *)

  name: string option;
  (** 
    The name of the rule.
     *)

}

type describe_rule_request = {
  event_bus_name: string option;
  (** 
    The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.
     *)

  name: string;
  (** 
    The name of the rule.
     *)

}

type describe_replay_response = {
  replay_end_time: float option;
  (** 
    A time stamp for the time that the replay stopped.
     *)

  replay_start_time: float option;
  (** 
    A time stamp for the time that the replay started.
     *)

  event_last_replayed_time: float option;
  (** 
    The time that the event was last replayed.
     *)

  event_end_time: float option;
  (** 
    The time stamp for the last event that was replayed from the archive.
     *)

  event_start_time: float option;
  (** 
    The time stamp of the first event that was last replayed from the archive.
     *)

  destination: replay_destination option;
  (** 
    A [ReplayDestination] object that contains details about the replay.
     *)

  event_source_arn: string option;
  (** 
    The ARN of the archive events were replayed from.
     *)

  state_reason: string option;
  (** 
    The reason that the replay is in the current state.
     *)

  state: replay_state option;
  (** 
    The current state of the replay.
     *)

  description: string option;
  (** 
    The description of the replay.
     *)

  replay_arn: string option;
  (** 
    The ARN of the replay.
     *)

  replay_name: string option;
  (** 
    The name of the replay.
     *)

}

type describe_replay_request = {
  replay_name: string;
  (** 
    The name of the replay to retrieve.
     *)

}

type describe_partner_event_source_response = {
  name: string option;
  (** 
    The name of the event source.
     *)

  arn: string option;
  (** 
    The ARN of the event source.
     *)

}

type describe_partner_event_source_request = {
  name: string;
  (** 
    The name of the event source to display.
     *)

}

type describe_event_source_response = {
  state: event_source_state option;
  (** 
    The state of the event source. If it is ACTIVE, you have already created a matching event bus for this event source, and that event bus is active. If it is PENDING, either you haven't yet created a matching event bus, or that event bus is deactivated. If it is DELETED, you have created a matching event bus, but the event source has since been deleted.
     *)

  name: string option;
  (** 
    The name of the partner event source.
     *)

  expiration_time: float option;
  (** 
    The date and time that the event source will expire if you do not create a matching event bus.
     *)

  creation_time: float option;
  (** 
    The date and time that the event source was created.
     *)

  created_by: string option;
  (** 
    The name of the SaaS partner that created the event source.
     *)

  arn: string option;
  (** 
    The ARN of the partner event source.
     *)

}

type describe_event_source_request = {
  name: string;
  (** 
    The name of the partner event source to display the details of.
     *)

}

type describe_event_bus_response = {
  last_modified_time: float option;
  (** 
    The time the event bus was last modified.
     *)

  creation_time: float option;
  (** 
    The time the event bus was created.
     *)

  policy: string option;
  (** 
    The policy that enables the external account to send events to your account.
     *)

  dead_letter_config: dead_letter_config option;
  
  kms_key_identifier: string option;
  (** 
    The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this event bus, if one has been specified.
    
     For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.
      *)

  description: string option;
  (** 
    The event bus description.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the account permitted to write events to the current account.
     *)

  name: string option;
  (** 
    The name of the event bus. Currently, this is always [default].
     *)

}

type describe_event_bus_request = {
  name: string option;
  (** 
    The name or ARN of the event bus to show details for. If you omit this, the default event bus is displayed.
     *)

}

type describe_endpoint_response = {
  last_modified_time: float option;
  (** 
    The last time the endpoint you asked for information about was modified.
     *)

  creation_time: float option;
  (** 
    The time the endpoint you asked for information about was created.
     *)

  state_reason: string option;
  (** 
    The reason the endpoint you asked for information about is in its current state.
     *)

  state: endpoint_state option;
  (** 
    The current state of the endpoint you asked for information about.
     *)

  endpoint_url: string option;
  (** 
    The URL of the endpoint you asked for information about.
     *)

  endpoint_id: string option;
  (** 
    The ID of the endpoint you asked for information about.
     *)

  role_arn: string option;
  (** 
    The ARN of the role used by the endpoint you asked for information about.
     *)

  event_buses: endpoint_event_bus list option;
  (** 
    The event buses being used by the endpoint you asked for information about.
     *)

  replication_config: replication_config option;
  (** 
    Whether replication is enabled or disabled for the endpoint you asked for information about.
     *)

  routing_config: routing_config option;
  (** 
    The routing configuration of the endpoint you asked for information about.
     *)

  arn: string option;
  (** 
    The ARN of the endpoint you asked for information about.
     *)

  description: string option;
  (** 
    The description of the endpoint you asked for information about.
     *)

  name: string option;
  (** 
    The name of the endpoint you asked for information about.
     *)

}

type describe_endpoint_request = {
  home_region: string option;
  [@ocaml.doc {| 
    The primary Region of the endpoint you want to get information about. For example ["HomeRegion": "us-east-1"].
     |}]

  name: string;
  [@ocaml.doc {| 
    The name of the endpoint you want to get information about. For example, ["Name":"us-east-2-custom_bus_A-endpoint"].
     |}]

}

(** 
    Contains the authorization parameters for the connection if Basic is specified as the authorization type.
     *)
type connection_basic_auth_response_parameters = {
  username: string option;
  (** 
    The user name to use for Basic authorization.
     *)

}

(** 
    Contains the client response parameters for the connection when OAuth is specified as the authorization type.
     *)
type connection_o_auth_client_response_parameters = {
  client_i_d: string option;
  (** 
    The client ID associated with the response to the connection request.
     *)

}

(** 
    Contains the response parameters when OAuth is specified as the authorization type.
     *)
type connection_o_auth_response_parameters = {
  o_auth_http_parameters: connection_http_parameters option;
  (** 
    The additional HTTP parameters used for the OAuth authorization request.
     *)

  http_method: connection_o_auth_http_method option;
  (** 
    The method used to connect to the HTTP endpoint.
     *)

  authorization_endpoint: string option;
  (** 
    The URL to the HTTP endpoint that authorized the request.
     *)

  client_parameters: connection_o_auth_client_response_parameters option;
  (** 
    A [ConnectionOAuthClientResponseParameters] object that contains details about the client parameters returned when OAuth is specified as the authorization type.
     *)

}

(** 
    Contains the authorization parameters for the connection if API Key is specified as the authorization type.
     *)
type connection_api_key_auth_response_parameters = {
  api_key_name: string option;
  (** 
    The name of the header to use for the [APIKeyValue] used for authorization.
     *)

}

(** 
    Contains the authorization parameters to use for the connection.
     *)
type connection_auth_response_parameters = {
  invocation_http_parameters: connection_http_parameters option;
  (** 
    Additional parameters for the connection that are passed through with every invocation to the HTTP endpoint.
     *)

  api_key_auth_parameters: connection_api_key_auth_response_parameters option;
  (** 
    The API Key parameters to use for authorization.
     *)

  o_auth_parameters: connection_o_auth_response_parameters option;
  (** 
    The OAuth parameters to use for authorization.
     *)

  basic_auth_parameters: connection_basic_auth_response_parameters option;
  (** 
    The authorization parameters for Basic authorization.
     *)

}

type describe_connection_response = {
  last_authorized_time: float option;
  (** 
    A time stamp for the time that the connection was last authorized.
     *)

  last_modified_time: float option;
  (** 
    A time stamp for the time that the connection was last modified.
     *)

  creation_time: float option;
  (** 
    A time stamp for the time that the connection was created.
     *)

  auth_parameters: connection_auth_response_parameters option;
  (** 
    The parameters to use for authorization for the connection.
     *)

  secret_arn: string option;
  (** 
    The ARN of the secret created from the authorization parameters specified for the connection.
     *)

  authorization_type: connection_authorization_type option;
  (** 
    The type of authorization specified for the connection.
     *)

  state_reason: string option;
  (** 
    The reason that the connection is in the current connection state.
     *)

  connection_state: connection_state option;
  (** 
    The state of the connection retrieved.
     *)

  description: string option;
  (** 
    The description for the connection retrieved.
     *)

  name: string option;
  (** 
    The name of the connection retrieved.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection retrieved.
     *)

}

type describe_connection_request = {
  name: string;
  (** 
    The name of the connection to retrieve.
     *)

}

type describe_archive_response = {
  creation_time: float option;
  (** 
    The time at which the archive was created.
     *)

  event_count: int option;
  (** 
    The number of events in the archive.
     *)

  size_bytes: int option;
  (** 
    The size of the archive in bytes.
     *)

  retention_days: int option;
  (** 
    The number of days to retain events for in the archive.
     *)

  state_reason: string option;
  (** 
    The reason that the archive is in the state.
     *)

  state: archive_state option;
  (** 
    The state of the archive.
     *)

  event_pattern: string option;
  (** 
    The event pattern used to filter events sent to the archive.
     *)

  description: string option;
  (** 
    The description of the archive.
     *)

  event_source_arn: string option;
  (** 
    The ARN of the event source associated with the archive.
     *)

  archive_name: string option;
  (** 
    The name of the archive.
     *)

  archive_arn: string option;
  (** 
    The ARN of the archive.
     *)

}

type describe_archive_request = {
  archive_name: string;
  (** 
    The name of the archive to retrieve.
     *)

}

type describe_api_destination_response = {
  last_modified_time: float option;
  (** 
    A time stamp for the time that the API destination was last modified.
     *)

  creation_time: float option;
  (** 
    A time stamp for the time that the API destination was created.
     *)

  invocation_rate_limit_per_second: int option;
  (** 
    The maximum number of invocations per second to specified for the API destination. Note that if you set the invocation rate maximum to a value lower the rate necessary to send all events received on to the destination HTTP endpoint, some events may not be delivered within the 24-hour retry window. If you plan to set the rate lower than the rate necessary to deliver all events, consider using a dead-letter queue to catch events that are not delivered within 24 hours.
     *)

  http_method: api_destination_http_method option;
  (** 
    The method to use to connect to the HTTP endpoint.
     *)

  invocation_endpoint: string option;
  (** 
    The URL to use to connect to the HTTP endpoint.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection specified for the API destination retrieved.
     *)

  api_destination_state: api_destination_state option;
  (** 
    The state of the API destination retrieved.
     *)

  description: string option;
  (** 
    The description for the API destination retrieved.
     *)

  name: string option;
  (** 
    The name of the API destination retrieved.
     *)

  api_destination_arn: string option;
  (** 
    The ARN of the API destination retrieved.
     *)

}

type describe_api_destination_request = {
  name: string;
  (** 
    The name of the API destination to retrieve.
     *)

}

type delete_rule_request = {
  force: bool option;
  (** 
    If this is a managed rule, created by an Amazon Web Services service on your behalf, you must specify [Force] as [True] to delete the rule. This parameter is ignored for rules that are not managed rules. You can check whether a rule is a managed rule by using [DescribeRule] or [ListRules] and checking the [ManagedBy] field of the response.
     *)

  event_bus_name: string option;
  (** 
    The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.
     *)

  name: string;
  (** 
    The name of the rule.
     *)

}

type delete_partner_event_source_request = {
  account: string;
  (** 
    The Amazon Web Services account ID of the Amazon Web Services customer that the event source was created for.
     *)

  name: string;
  (** 
    The name of the event source to delete.
     *)

}

type delete_event_bus_request = {
  name: string;
  (** 
    The name of the event bus to delete.
     *)

}

type delete_endpoint_response = unit

type delete_endpoint_request = {
  name: string;
  [@ocaml.doc {| 
    The name of the endpoint you want to delete. For example, ["Name":"us-east-2-custom_bus_A-endpoint"]..
     |}]

}

type delete_connection_response = {
  last_authorized_time: float option;
  (** 
    A time stamp for the time that the connection was last authorized before it wa deleted.
     *)

  last_modified_time: float option;
  (** 
    A time stamp for the time that the connection was last modified before it was deleted.
     *)

  creation_time: float option;
  (** 
    A time stamp for the time that the connection was created.
     *)

  connection_state: connection_state option;
  (** 
    The state of the connection before it was deleted.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection that was deleted.
     *)

}

type delete_connection_request = {
  name: string;
  (** 
    The name of the connection to delete.
     *)

}

type delete_archive_response = unit

type delete_archive_request = {
  archive_name: string;
  (** 
    The name of the archive to delete.
     *)

}

type delete_api_destination_response = unit

type delete_api_destination_request = {
  name: string;
  (** 
    The name of the destination to delete.
     *)

}

type deauthorize_connection_response = {
  last_authorized_time: float option;
  (** 
    A time stamp for the time that the connection was last authorized.
     *)

  last_modified_time: float option;
  (** 
    A time stamp for the time that the connection was last updated.
     *)

  creation_time: float option;
  (** 
    A time stamp for the time that the connection was created.
     *)

  connection_state: connection_state option;
  (** 
    The state of the connection.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection that authorization was removed from.
     *)

}

type deauthorize_connection_request = {
  name: string;
  (** 
    The name of the connection to remove authorization from.
     *)

}

type deactivate_event_source_request = {
  name: string;
  (** 
    The name of the partner event source to deactivate.
     *)

}

type create_partner_event_source_response = {
  event_source_arn: string option;
  (** 
    The ARN of the partner event source.
     *)

}

type create_partner_event_source_request = {
  account: string;
  (** 
    The Amazon Web Services account ID that is permitted to create a matching partner event bus for this partner event source.
     *)

  name: string;
  (** 
    The name of the partner event source. This name must be unique and must be in the format 
    {[
    {i partner_name}/{i event_namespace}/{i event_name}
    ]}
    . The Amazon Web Services account that wants to use this partner event source must create a partner event bus with a name that matches the name of the partner event source.
     *)

}

type create_event_bus_response = {
  dead_letter_config: dead_letter_config option;
  
  kms_key_identifier: string option;
  (** 
    The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this event bus, if one has been specified.
    
     For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.
      *)

  description: string option;
  (** 
    The event bus description.
     *)

  event_bus_arn: string option;
  (** 
    The ARN of the new event bus.
     *)

}

type create_event_bus_request = {
  tags: tag list option;
  (** 
    Tags to associate with the event bus.
     *)

  dead_letter_config: dead_letter_config option;
  
  kms_key_identifier: string option;
  (** 
    The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a customer managed key to encrypt events on this event bus. The identifier can be the key Amazon Resource Name (ARN), KeyId, key alias, or key alias ARN.
    
     If you do not specify a customer managed key identifier, EventBridge uses an Amazon Web Services owned key to encrypt events on the event bus.
     
      For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/getting-started.html}Managing keys} in the {i Key Management Service Developer Guide}.
      
       Archives and schema discovery are not supported for event buses encrypted using a customer managed key. EventBridge returns an error if:
       
        {ul
             {- You call 
                {[
                {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateArchive.html}CreateArchive}
                ]}
                 on an event bus set to use a customer managed key for encryption.
                
                }
              {- You call 
                 {[
                 {{:https://docs.aws.amazon.com/eventbridge/latest/schema-reference/v1-discoverers.html#CreateDiscoverer}CreateDiscoverer}
                 ]}
                  on an event bus set to use a customer managed key for encryption.
                 
                 }
              {- You call 
                 {[
                 {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UpdatedEventBus.html}UpdatedEventBus}
                 ]}
                  to set a customer managed key on an event bus with an archives or schema discovery enabled.
                 
                 }
             
      }
       To enable archives or schema discovery on an event bus, choose to use an Amazon Web Services owned key. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.
       
        *)

  description: string option;
  (** 
    The event bus description.
     *)

  event_source_name: string option;
  (** 
    If you are creating a partner event bus, this specifies the partner event source that the new event bus will be matched with.
     *)

  name: string;
  (** 
    The name of the new event bus.
    
     Custom event bus names can't contain the [/] character, but you can use the [/] character in partner event bus names. In addition, for partner event buses, the name must exactly match the name of the partner event source that this event bus is matched to.
     
      You can't use the name [default] for a custom event bus, as this name is already used for your account's default event bus.
       *)

}

type create_endpoint_response = {
  state: endpoint_state option;
  (** 
    The state of the endpoint that was created by this request.
     *)

  role_arn: string option;
  (** 
    The ARN of the role used by event replication for this request.
     *)

  event_buses: endpoint_event_bus list option;
  (** 
    The event buses used by this request.
     *)

  replication_config: replication_config option;
  (** 
    Whether event replication was enabled or disabled by this request.
     *)

  routing_config: routing_config option;
  (** 
    The routing configuration defined by this request.
     *)

  arn: string option;
  (** 
    The ARN of the endpoint that was created by this request.
     *)

  name: string option;
  (** 
    The name of the endpoint that was created by this request.
     *)

}

type create_endpoint_request = {
  role_arn: string option;
  (** 
    The ARN of the role used for replication.
     *)

  event_buses: endpoint_event_bus list;
  (** 
    Define the event buses used.
    
     The names of the event buses must be identical in each Region.
     
      *)

  replication_config: replication_config option;
  (** 
    Enable or disable event replication. The default state is [ENABLED] which means you must supply a [RoleArn]. If you don't have a [RoleArn] or you don't want event replication enabled, set the state to [DISABLED].
     *)

  routing_config: routing_config;
  (** 
    Configure the routing policy, including the health check and secondary Region..
     *)

  description: string option;
  (** 
    A description of the global endpoint.
     *)

  name: string;
  [@ocaml.doc {| 
    The name of the global endpoint. For example, ["Name":"us-east-2-custom_bus_A-endpoint"].
     |}]

}

type create_connection_response = {
  last_modified_time: float option;
  (** 
    A time stamp for the time that the connection was last updated.
     *)

  creation_time: float option;
  (** 
    A time stamp for the time that the connection was created.
     *)

  connection_state: connection_state option;
  (** 
    The state of the connection that was created by the request.
     *)

  connection_arn: string option;
  (** 
    The ARN of the connection that was created by the request.
     *)

}

(** 
    Contains the Basic authorization parameters to use for the connection.
     *)
type create_connection_basic_auth_request_parameters = {
  password: string;
  (** 
    The password associated with the user name to use for Basic authorization.
     *)

  username: string;
  (** 
    The user name to use for Basic authorization.
     *)

}

(** 
    Contains the Basic authorization parameters to use for the connection.
     *)
type create_connection_o_auth_client_request_parameters = {
  client_secret: string;
  (** 
    The client secret associated with the client ID to use for OAuth authorization for the connection.
     *)

  client_i_d: string;
  (** 
    The client ID to use for OAuth authorization for the connection.
     *)

}

(** 
    Contains the OAuth authorization parameters to use for the connection.
     *)
type create_connection_o_auth_request_parameters = {
  o_auth_http_parameters: connection_http_parameters option;
  (** 
    A [ConnectionHttpParameters] object that contains details about the additional parameters to use for the connection.
     *)

  http_method: connection_o_auth_http_method;
  (** 
    The method to use for the authorization request.
     *)

  authorization_endpoint: string;
  (** 
    The URL to the authorization endpoint when OAuth is specified as the authorization type.
     *)

  client_parameters: create_connection_o_auth_client_request_parameters;
  (** 
    A [CreateConnectionOAuthClientRequestParameters] object that contains the client parameters for OAuth authorization.
     *)

}

(** 
    Contains the API key authorization parameters for the connection.
     *)
type create_connection_api_key_auth_request_parameters = {
  api_key_value: string;
  (** 
    The value for the API key to use for authorization.
     *)

  api_key_name: string;
  (** 
    The name of the API key to use for authorization.
     *)

}

(** 
    Contains the authorization parameters for the connection.
     *)
type create_connection_auth_request_parameters = {
  invocation_http_parameters: connection_http_parameters option;
  (** 
    A [ConnectionHttpParameters] object that contains the API key authorization parameters to use for the connection. Note that if you include additional parameters for the target of a rule via [HttpParameters], including query strings, the parameters added for the connection take precedence.
     *)

  api_key_auth_parameters: create_connection_api_key_auth_request_parameters option;
  (** 
    A [CreateConnectionApiKeyAuthRequestParameters] object that contains the API key authorization parameters to use for the connection.
     *)

  o_auth_parameters: create_connection_o_auth_request_parameters option;
  (** 
    A [CreateConnectionOAuthRequestParameters] object that contains the OAuth authorization parameters to use for the connection.
     *)

  basic_auth_parameters: create_connection_basic_auth_request_parameters option;
  (** 
    A [CreateConnectionBasicAuthRequestParameters] object that contains the Basic authorization parameters to use for the connection.
     *)

}

type create_connection_request = {
  auth_parameters: create_connection_auth_request_parameters;
  (** 
    A [CreateConnectionAuthRequestParameters] object that contains the authorization parameters to use to authorize with the endpoint.
     *)

  authorization_type: connection_authorization_type;
  (** 
    The type of authorization to use for the connection.
    
     OAUTH tokens are refreshed when a 401 or 407 response is returned.
     
      *)

  description: string option;
  (** 
    A description for the connection to create.
     *)

  name: string;
  (** 
    The name for the connection to create.
     *)

}

type create_archive_response = {
  creation_time: float option;
  (** 
    The time at which the archive was created.
     *)

  state_reason: string option;
  (** 
    The reason that the archive is in the state.
     *)

  state: archive_state option;
  (** 
    The state of the archive that was created.
     *)

  archive_arn: string option;
  (** 
    The ARN of the archive that was created.
     *)

}

type create_archive_request = {
  retention_days: int option;
  (** 
    The number of days to retain events for. Default value is 0. If set to 0, events are retained indefinitely
     *)

  event_pattern: string option;
  (** 
    An event pattern to use to filter events sent to the archive.
     *)

  description: string option;
  (** 
    A description for the archive.
     *)

  event_source_arn: string;
  (** 
    The ARN of the event bus that sends events to the archive.
     *)

  archive_name: string;
  (** 
    The name for the archive to create.
     *)

}

type create_api_destination_response = {
  last_modified_time: float option;
  (** 
    A time stamp indicating the time that the API destination was last modified.
     *)

  creation_time: float option;
  (** 
    A time stamp indicating the time that the API destination was created.
     *)

  api_destination_state: api_destination_state option;
  (** 
    The state of the API destination that was created by the request.
     *)

  api_destination_arn: string option;
  (** 
    The ARN of the API destination that was created by the request.
     *)

}

type create_api_destination_request = {
  invocation_rate_limit_per_second: int option;
  (** 
    The maximum number of requests per second to send to the HTTP invocation endpoint.
     *)

  http_method: api_destination_http_method;
  (** 
    The method to use for the request to the HTTP invocation endpoint.
     *)

  invocation_endpoint: string;
  (** 
    The URL to the HTTP invocation endpoint for the API destination.
     *)

  connection_arn: string;
  (** 
    The ARN of the connection to use for the API destination. The destination endpoint must support the authorization type specified for the connection.
     *)

  description: string option;
  (** 
    A description for the API destination to create.
     *)

  name: string;
  (** 
    The name for the API destination to create.
     *)

}

type cancel_replay_response = {
  state_reason: string option;
  (** 
    The reason that the replay is in the current state.
     *)

  state: replay_state option;
  (** 
    The current state of the replay.
     *)

  replay_arn: string option;
  (** 
    The ARN of the replay to cancel.
     *)

}

type cancel_replay_request = {
  replay_name: string;
  (** 
    The name of the replay to cancel.
     *)

}

type activate_event_source_request = {
  name: string;
  (** 
    The name of the partner event source to activate.
     *)

}

(** 
    Amazon EventBridge helps you to respond to state changes in your Amazon Web Services resources. When your resources change state, they automatically send events to an event stream. You can create rules that match selected events in the stream and route them to targets to take action. You can also use rules to take action on a predetermined schedule. For example, you can configure rules to:
    
     {ul
          {- Automatically invoke an Lambda function to update DNS entries when an event notifies you that Amazon EC2 instance enters the running state.
             
             }
           {- Direct specific API records from CloudTrail to an Amazon Kinesis data stream for detailed analysis of potential security or availability risks.
              
              }
           {- Periodically invoke a built-in target to create a snapshot of an Amazon EBS volume.
              
              }
          
      }
       For more information about the features of Amazon EventBridge, see the {{:https://docs.aws.amazon.com/eventbridge/latest/userguide}Amazon EventBridge User Guide}.
        *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_dead_letter_config : ?arn:string -> unit
-> dead_letter_config
(** Create a {!type-dead_letter_config} type *)

val make_update_event_bus_response :
  ?dead_letter_config:dead_letter_config ->
  ?description:string ->
  ?kms_key_identifier:string ->
  ?name:string ->
  ?arn:string ->
  unit
-> update_event_bus_response
(** Create a {!type-update_event_bus_response} type *)

val make_update_event_bus_request :
  ?dead_letter_config:dead_letter_config ->
  ?description:string ->
  ?kms_key_identifier:string ->
  ?name:string ->
  unit
-> update_event_bus_request
(** Create a {!type-update_event_bus_request} type *)

val make_primary : health_check:string -> unit
-> primary
(** Create a {!type-primary} type *)

val make_secondary : route:string -> unit
-> secondary
(** Create a {!type-secondary} type *)

val make_failover_config : secondary:secondary -> primary:primary -> unit
-> failover_config
(** Create a {!type-failover_config} type *)

val make_routing_config : failover_config:failover_config -> unit
-> routing_config
(** Create a {!type-routing_config} type *)

val make_replication_config : ?state:replication_state -> unit
-> replication_config
(** Create a {!type-replication_config} type *)

val make_endpoint_event_bus : event_bus_arn:string -> unit
-> endpoint_event_bus
(** Create a {!type-endpoint_event_bus} type *)

val make_update_endpoint_response :
  ?state:endpoint_state ->
  ?endpoint_url:string ->
  ?endpoint_id:string ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?name:string ->
  unit
-> update_endpoint_response
(** Create a {!type-update_endpoint_response} type *)

val make_update_endpoint_request :
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?description:string ->
  name:string ->
  unit
-> update_endpoint_request
(** Create a {!type-update_endpoint_request} type *)

val make_update_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> update_connection_response
(** Create a {!type-update_connection_response} type *)

val make_update_connection_basic_auth_request_parameters :
  ?password:string -> ?username:string -> unit
-> update_connection_basic_auth_request_parameters
(** Create a {!type-update_connection_basic_auth_request_parameters} type *)

val make_update_connection_o_auth_client_request_parameters :
  ?client_secret:string -> ?client_i_d:string -> unit
-> update_connection_o_auth_client_request_parameters
(** Create a {!type-update_connection_o_auth_client_request_parameters} type *)

val make_connection_header_parameter :
  ?is_value_secret:bool -> ?value:string -> ?key:string -> unit
-> connection_header_parameter
(** Create a {!type-connection_header_parameter} type *)

val make_connection_query_string_parameter :
  ?is_value_secret:bool -> ?value:string -> ?key:string -> unit
-> connection_query_string_parameter
(** Create a {!type-connection_query_string_parameter} type *)

val make_connection_body_parameter :
  ?is_value_secret:bool -> ?value:string -> ?key:string -> unit
-> connection_body_parameter
(** Create a {!type-connection_body_parameter} type *)

val make_connection_http_parameters :
  ?body_parameters:connection_body_parameter list ->
  ?query_string_parameters:connection_query_string_parameter list ->
  ?header_parameters:connection_header_parameter list ->
  unit
-> connection_http_parameters
(** Create a {!type-connection_http_parameters} type *)

val make_update_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  ?http_method:connection_o_auth_http_method ->
  ?authorization_endpoint:string ->
  ?client_parameters:update_connection_o_auth_client_request_parameters ->
  unit
-> update_connection_o_auth_request_parameters
(** Create a {!type-update_connection_o_auth_request_parameters} type *)

val make_update_connection_api_key_auth_request_parameters :
  ?api_key_value:string -> ?api_key_name:string -> unit
-> update_connection_api_key_auth_request_parameters
(** Create a {!type-update_connection_api_key_auth_request_parameters} type *)

val make_update_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:update_connection_api_key_auth_request_parameters ->
  ?o_auth_parameters:update_connection_o_auth_request_parameters ->
  ?basic_auth_parameters:update_connection_basic_auth_request_parameters ->
  unit
-> update_connection_auth_request_parameters
(** Create a {!type-update_connection_auth_request_parameters} type *)

val make_update_connection_request :
  ?auth_parameters:update_connection_auth_request_parameters ->
  ?authorization_type:connection_authorization_type ->
  ?description:string ->
  name:string ->
  unit
-> update_connection_request
(** Create a {!type-update_connection_request} type *)

val make_update_archive_response :
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?archive_arn:string ->
  unit
-> update_archive_response
(** Create a {!type-update_archive_response} type *)

val make_update_archive_request :
  ?retention_days:int ->
  ?event_pattern:string ->
  ?description:string ->
  archive_name:string ->
  unit
-> update_archive_request
(** Create a {!type-update_archive_request} type *)

val make_update_api_destination_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?api_destination_state:api_destination_state ->
  ?api_destination_arn:string ->
  unit
-> update_api_destination_response
(** Create a {!type-update_api_destination_response} type *)

val make_update_api_destination_request :
  ?invocation_rate_limit_per_second:int ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:string ->
  ?connection_arn:string ->
  ?description:string ->
  name:string ->
  unit
-> update_api_destination_request
(** Create a {!type-update_api_destination_request} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_test_event_pattern_response : ?result:bool -> unit
-> test_event_pattern_response
(** Create a {!type-test_event_pattern_response} type *)

val make_test_event_pattern_request :
  event:string -> event_pattern:string -> unit
-> test_event_pattern_request
(** Create a {!type-test_event_pattern_request} type *)

val make_input_transformer :
  ?input_paths_map:(string * string) list -> input_template:string -> unit
-> input_transformer
(** Create a {!type-input_transformer} type *)

val make_kinesis_parameters : partition_key_path:string -> unit
-> kinesis_parameters
(** Create a {!type-kinesis_parameters} type *)

val make_run_command_target : values:string list -> key:string -> unit
-> run_command_target
(** Create a {!type-run_command_target} type *)

val make_run_command_parameters :
  run_command_targets:run_command_target list -> unit
-> run_command_parameters
(** Create a {!type-run_command_parameters} type *)

val make_aws_vpc_configuration :
  ?assign_public_ip:assign_public_ip ->
  ?security_groups:string list ->
  subnets:string list ->
  unit
-> aws_vpc_configuration
(** Create a {!type-aws_vpc_configuration} type *)

val make_network_configuration :
  ?awsvpc_configuration:aws_vpc_configuration -> unit
-> network_configuration
(** Create a {!type-network_configuration} type *)

val make_capacity_provider_strategy_item :
  ?base:int -> ?weight:int -> capacity_provider:string -> unit
-> capacity_provider_strategy_item
(** Create a {!type-capacity_provider_strategy_item} type *)

val make_placement_constraint :
  ?expression:string -> ?type_:placement_constraint_type -> unit
-> placement_constraint
(** Create a {!type-placement_constraint} type *)

val make_placement_strategy :
  ?field:string -> ?type_:placement_strategy_type -> unit
-> placement_strategy
(** Create a {!type-placement_strategy} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_ecs_parameters :
  ?tags:tag list ->
  ?reference_id:string ->
  ?propagate_tags:propagate_tags ->
  ?placement_strategy:placement_strategy list ->
  ?placement_constraints:placement_constraint list ->
  ?enable_execute_command:bool ->
  ?enable_ecs_managed_tags:bool ->
  ?capacity_provider_strategy:capacity_provider_strategy_item list ->
  ?group:string ->
  ?platform_version:string ->
  ?network_configuration:network_configuration ->
  ?launch_type:launch_type ->
  ?task_count:int ->
  task_definition_arn:string ->
  unit
-> ecs_parameters
(** Create a {!type-ecs_parameters} type *)

val make_batch_array_properties : ?size:int -> unit
-> batch_array_properties
(** Create a {!type-batch_array_properties} type *)

val make_batch_retry_strategy : ?attempts:int -> unit
-> batch_retry_strategy
(** Create a {!type-batch_retry_strategy} type *)

val make_batch_parameters :
  ?retry_strategy:batch_retry_strategy ->
  ?array_properties:batch_array_properties ->
  job_name:string ->
  job_definition:string ->
  unit
-> batch_parameters
(** Create a {!type-batch_parameters} type *)

val make_sqs_parameters : ?message_group_id:string -> unit
-> sqs_parameters
(** Create a {!type-sqs_parameters} type *)

val make_http_parameters :
  ?query_string_parameters:(string * string) list ->
  ?header_parameters:(string * string) list ->
  ?path_parameter_values:string list ->
  unit
-> http_parameters
(** Create a {!type-http_parameters} type *)

val make_redshift_data_parameters :
  ?sqls:string list ->
  ?with_event:bool ->
  ?statement_name:string ->
  ?sql:string ->
  ?db_user:string ->
  ?secret_manager_arn:string ->
  database:string ->
  unit
-> redshift_data_parameters
(** Create a {!type-redshift_data_parameters} type *)

val make_sage_maker_pipeline_parameter : value:string -> name:string -> unit
-> sage_maker_pipeline_parameter
(** Create a {!type-sage_maker_pipeline_parameter} type *)

val make_sage_maker_pipeline_parameters :
  ?pipeline_parameter_list:sage_maker_pipeline_parameter list -> unit
-> sage_maker_pipeline_parameters
(** Create a {!type-sage_maker_pipeline_parameters} type *)

val make_retry_policy :
  ?maximum_event_age_in_seconds:int -> ?maximum_retry_attempts:int -> unit
-> retry_policy
(** Create a {!type-retry_policy} type *)

val make_app_sync_parameters : ?graph_ql_operation:string -> unit
-> app_sync_parameters
(** Create a {!type-app_sync_parameters} type *)

val make_target :
  ?app_sync_parameters:app_sync_parameters ->
  ?retry_policy:retry_policy ->
  ?dead_letter_config:dead_letter_config ->
  ?sage_maker_pipeline_parameters:sage_maker_pipeline_parameters ->
  ?redshift_data_parameters:redshift_data_parameters ->
  ?http_parameters:http_parameters ->
  ?sqs_parameters:sqs_parameters ->
  ?batch_parameters:batch_parameters ->
  ?ecs_parameters:ecs_parameters ->
  ?run_command_parameters:run_command_parameters ->
  ?kinesis_parameters:kinesis_parameters ->
  ?input_transformer:input_transformer ->
  ?input_path:string ->
  ?input:string ->
  ?role_arn:string ->
  arn:string ->
  id:string ->
  unit
-> target
(** Create a {!type-target} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_start_replay_response :
  ?replay_start_time:float ->
  ?state_reason:string ->
  ?state:replay_state ->
  ?replay_arn:string ->
  unit
-> start_replay_response
(** Create a {!type-start_replay_response} type *)

val make_replay_destination : ?filter_arns:string list -> arn:string -> unit
-> replay_destination
(** Create a {!type-replay_destination} type *)

val make_start_replay_request :
  ?description:string ->
  destination:replay_destination ->
  event_end_time:float ->
  event_start_time:float ->
  event_source_arn:string ->
  replay_name:string ->
  unit
-> start_replay_request
(** Create a {!type-start_replay_request} type *)

val make_rule :
  ?event_bus_name:string ->
  ?managed_by:string ->
  ?role_arn:string ->
  ?schedule_expression:string ->
  ?description:string ->
  ?state:rule_state ->
  ?event_pattern:string ->
  ?arn:string ->
  ?name:string ->
  unit -> rule
(** Create a {!type-rule} type *)

val make_replay :
  ?replay_end_time:float ->
  ?replay_start_time:float ->
  ?event_last_replayed_time:float ->
  ?event_end_time:float ->
  ?event_start_time:float ->
  ?state_reason:string ->
  ?state:replay_state ->
  ?event_source_arn:string ->
  ?replay_name:string ->
  unit
-> replay
(** Create a {!type-replay} type *)

val make_remove_targets_result_entry :
  ?error_message:string -> ?error_code:string -> ?target_id:string -> unit
-> remove_targets_result_entry
(** Create a {!type-remove_targets_result_entry} type *)

val make_remove_targets_response :
  ?failed_entries:remove_targets_result_entry list ->
  ?failed_entry_count:int ->
  unit
-> remove_targets_response
(** Create a {!type-remove_targets_response} type *)

val make_remove_targets_request :
  ?force:bool ->
  ?event_bus_name:string ->
  ids:string list ->
  rule:string ->
  unit
-> remove_targets_request
(** Create a {!type-remove_targets_request} type *)

val make_remove_permission_request :
  ?event_bus_name:string ->
  ?remove_all_permissions:bool ->
  ?statement_id:string ->
  unit
-> remove_permission_request
(** Create a {!type-remove_permission_request} type *)

val make_put_targets_result_entry :
  ?error_message:string -> ?error_code:string -> ?target_id:string -> unit
-> put_targets_result_entry
(** Create a {!type-put_targets_result_entry} type *)

val make_put_targets_response :
  ?failed_entries:put_targets_result_entry list ->
  ?failed_entry_count:int ->
  unit
-> put_targets_response
(** Create a {!type-put_targets_response} type *)

val make_put_targets_request :
  ?event_bus_name:string -> targets:target list -> rule:string -> unit
-> put_targets_request
(** Create a {!type-put_targets_request} type *)

val make_put_rule_response : ?rule_arn:string -> unit
-> put_rule_response
(** Create a {!type-put_rule_response} type *)

val make_put_rule_request :
  ?event_bus_name:string ->
  ?tags:tag list ->
  ?role_arn:string ->
  ?description:string ->
  ?state:rule_state ->
  ?event_pattern:string ->
  ?schedule_expression:string ->
  name:string ->
  unit
-> put_rule_request
(** Create a {!type-put_rule_request} type *)

val make_condition : value:string -> key:string -> type_:string -> unit
-> condition
(** Create a {!type-condition} type *)

val make_put_permission_request :
  ?policy:string ->
  ?condition:condition ->
  ?statement_id:string ->
  ?principal:string ->
  ?action:string ->
  ?event_bus_name:string ->
  unit
-> put_permission_request
(** Create a {!type-put_permission_request} type *)

val make_put_partner_events_result_entry :
  ?error_message:string -> ?error_code:string -> ?event_id:string -> unit
-> put_partner_events_result_entry
(** Create a {!type-put_partner_events_result_entry} type *)

val make_put_partner_events_response :
  ?entries:put_partner_events_result_entry list ->
  ?failed_entry_count:int ->
  unit
-> put_partner_events_response
(** Create a {!type-put_partner_events_response} type *)

val make_put_partner_events_request_entry :
  ?detail:string ->
  ?detail_type:string ->
  ?resources:string list ->
  ?source:string ->
  ?time:float ->
  unit
-> put_partner_events_request_entry
(** Create a {!type-put_partner_events_request_entry} type *)

val make_put_partner_events_request :
  entries:put_partner_events_request_entry list -> unit
-> put_partner_events_request
(** Create a {!type-put_partner_events_request} type *)

val make_put_events_result_entry :
  ?error_message:string -> ?error_code:string -> ?event_id:string -> unit
-> put_events_result_entry
(** Create a {!type-put_events_result_entry} type *)

val make_put_events_response :
  ?entries:put_events_result_entry list -> ?failed_entry_count:int -> unit
-> put_events_response
(** Create a {!type-put_events_response} type *)

val make_put_events_request_entry :
  ?trace_header:string ->
  ?event_bus_name:string ->
  ?detail:string ->
  ?detail_type:string ->
  ?resources:string list ->
  ?source:string ->
  ?time:float ->
  unit
-> put_events_request_entry
(** Create a {!type-put_events_request_entry} type *)

val make_put_events_request :
  ?endpoint_id:string -> entries:put_events_request_entry list -> unit
-> put_events_request
(** Create a {!type-put_events_request} type *)

val make_partner_event_source : ?name:string -> ?arn:string -> unit
-> partner_event_source
(** Create a {!type-partner_event_source} type *)

val make_partner_event_source_account :
  ?state:event_source_state ->
  ?expiration_time:float ->
  ?creation_time:float ->
  ?account:string ->
  unit
-> partner_event_source_account
(** Create a {!type-partner_event_source_account} type *)

val make_list_targets_by_rule_response :
  ?next_token:string -> ?targets:target list -> unit
-> list_targets_by_rule_response
(** Create a {!type-list_targets_by_rule_response} type *)

val make_list_targets_by_rule_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_bus_name:string ->
  rule:string ->
  unit
-> list_targets_by_rule_request
(** Create a {!type-list_targets_by_rule_request} type *)

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_list_rules_response : ?next_token:string -> ?rules:rule list -> unit
-> list_rules_response
(** Create a {!type-list_rules_response} type *)

val make_list_rules_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_bus_name:string ->
  ?name_prefix:string ->
  unit
-> list_rules_request
(** Create a {!type-list_rules_request} type *)

val make_list_rule_names_by_target_response :
  ?next_token:string -> ?rule_names:string list -> unit
-> list_rule_names_by_target_response
(** Create a {!type-list_rule_names_by_target_response} type *)

val make_list_rule_names_by_target_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_bus_name:string ->
  target_arn:string ->
  unit
-> list_rule_names_by_target_request
(** Create a {!type-list_rule_names_by_target_request} type *)

val make_list_replays_response :
  ?next_token:string -> ?replays:replay list -> unit
-> list_replays_response
(** Create a {!type-list_replays_response} type *)

val make_list_replays_request :
  ?limit:int ->
  ?next_token:string ->
  ?event_source_arn:string ->
  ?state:replay_state ->
  ?name_prefix:string ->
  unit
-> list_replays_request
(** Create a {!type-list_replays_request} type *)

val make_list_partner_event_sources_response :
  ?next_token:string ->
  ?partner_event_sources:partner_event_source list ->
  unit
-> list_partner_event_sources_response
(** Create a {!type-list_partner_event_sources_response} type *)

val make_list_partner_event_sources_request :
  ?limit:int -> ?next_token:string -> name_prefix:string -> unit
-> list_partner_event_sources_request
(** Create a {!type-list_partner_event_sources_request} type *)

val make_list_partner_event_source_accounts_response :
  ?next_token:string ->
  ?partner_event_source_accounts:partner_event_source_account list ->
  unit
-> list_partner_event_source_accounts_response
(** Create a {!type-list_partner_event_source_accounts_response} type *)

val make_list_partner_event_source_accounts_request :
  ?limit:int -> ?next_token:string -> event_source_name:string -> unit
-> list_partner_event_source_accounts_request
(** Create a {!type-list_partner_event_source_accounts_request} type *)

val make_event_source :
  ?state:event_source_state ->
  ?name:string ->
  ?expiration_time:float ->
  ?creation_time:float ->
  ?created_by:string ->
  ?arn:string ->
  unit
-> event_source
(** Create a {!type-event_source} type *)

val make_list_event_sources_response :
  ?next_token:string -> ?event_sources:event_source list -> unit
-> list_event_sources_response
(** Create a {!type-list_event_sources_response} type *)

val make_list_event_sources_request :
  ?limit:int -> ?next_token:string -> ?name_prefix:string -> unit
-> list_event_sources_request
(** Create a {!type-list_event_sources_request} type *)

val make_event_bus :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?policy:string ->
  ?description:string ->
  ?arn:string ->
  ?name:string ->
  unit
-> event_bus
(** Create a {!type-event_bus} type *)

val make_list_event_buses_response :
  ?next_token:string -> ?event_buses:event_bus list -> unit
-> list_event_buses_response
(** Create a {!type-list_event_buses_response} type *)

val make_list_event_buses_request :
  ?limit:int -> ?next_token:string -> ?name_prefix:string -> unit
-> list_event_buses_request
(** Create a {!type-list_event_buses_request} type *)

val make_endpoint :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:endpoint_state ->
  ?endpoint_url:string ->
  ?endpoint_id:string ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?description:string ->
  ?name:string ->
  unit
-> endpoint
(** Create a {!type-endpoint} type *)

val make_list_endpoints_response :
  ?next_token:string -> ?endpoints:endpoint list -> unit
-> list_endpoints_response
(** Create a {!type-list_endpoints_response} type *)

val make_list_endpoints_request :
  ?max_results:int ->
  ?next_token:string ->
  ?home_region:string ->
  ?name_prefix:string ->
  unit
-> list_endpoints_request
(** Create a {!type-list_endpoints_request} type *)

val make_connection :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?authorization_type:connection_authorization_type ->
  ?state_reason:string ->
  ?connection_state:connection_state ->
  ?name:string ->
  ?connection_arn:string ->
  unit
-> connection
(** Create a {!type-connection} type *)

val make_list_connections_response :
  ?next_token:string -> ?connections:connection list -> unit
-> list_connections_response
(** Create a {!type-list_connections_response} type *)

val make_list_connections_request :
  ?limit:int ->
  ?next_token:string ->
  ?connection_state:connection_state ->
  ?name_prefix:string ->
  unit
-> list_connections_request
(** Create a {!type-list_connections_request} type *)

val make_archive :
  ?creation_time:float ->
  ?event_count:int ->
  ?size_bytes:int ->
  ?retention_days:int ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?event_source_arn:string ->
  ?archive_name:string ->
  unit
-> archive
(** Create a {!type-archive} type *)

val make_list_archives_response :
  ?next_token:string -> ?archives:archive list -> unit
-> list_archives_response
(** Create a {!type-list_archives_response} type *)

val make_list_archives_request :
  ?limit:int ->
  ?next_token:string ->
  ?state:archive_state ->
  ?event_source_arn:string ->
  ?name_prefix:string ->
  unit
-> list_archives_request
(** Create a {!type-list_archives_request} type *)

val make_api_destination :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?invocation_rate_limit_per_second:int ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:string ->
  ?connection_arn:string ->
  ?api_destination_state:api_destination_state ->
  ?name:string ->
  ?api_destination_arn:string ->
  unit
-> api_destination
(** Create a {!type-api_destination} type *)

val make_list_api_destinations_response :
  ?next_token:string -> ?api_destinations:api_destination list -> unit
-> list_api_destinations_response
(** Create a {!type-list_api_destinations_response} type *)

val make_list_api_destinations_request :
  ?limit:int ->
  ?next_token:string ->
  ?connection_arn:string ->
  ?name_prefix:string ->
  unit
-> list_api_destinations_request
(** Create a {!type-list_api_destinations_request} type *)

val make_enable_rule_request : ?event_bus_name:string -> name:string -> unit
-> enable_rule_request
(** Create a {!type-enable_rule_request} type *)

val make_disable_rule_request : ?event_bus_name:string -> name:string -> unit
-> disable_rule_request
(** Create a {!type-disable_rule_request} type *)

val make_describe_rule_response :
  ?created_by:string ->
  ?event_bus_name:string ->
  ?managed_by:string ->
  ?role_arn:string ->
  ?description:string ->
  ?state:rule_state ->
  ?schedule_expression:string ->
  ?event_pattern:string ->
  ?arn:string ->
  ?name:string ->
  unit
-> describe_rule_response
(** Create a {!type-describe_rule_response} type *)

val make_describe_rule_request :
  ?event_bus_name:string -> name:string -> unit
-> describe_rule_request
(** Create a {!type-describe_rule_request} type *)

val make_describe_replay_response :
  ?replay_end_time:float ->
  ?replay_start_time:float ->
  ?event_last_replayed_time:float ->
  ?event_end_time:float ->
  ?event_start_time:float ->
  ?destination:replay_destination ->
  ?event_source_arn:string ->
  ?state_reason:string ->
  ?state:replay_state ->
  ?description:string ->
  ?replay_arn:string ->
  ?replay_name:string ->
  unit
-> describe_replay_response
(** Create a {!type-describe_replay_response} type *)

val make_describe_replay_request : replay_name:string -> unit
-> describe_replay_request
(** Create a {!type-describe_replay_request} type *)

val make_describe_partner_event_source_response :
  ?name:string -> ?arn:string -> unit
-> describe_partner_event_source_response
(** Create a {!type-describe_partner_event_source_response} type *)

val make_describe_partner_event_source_request : name:string -> unit
-> describe_partner_event_source_request
(** Create a {!type-describe_partner_event_source_request} type *)

val make_describe_event_source_response :
  ?state:event_source_state ->
  ?name:string ->
  ?expiration_time:float ->
  ?creation_time:float ->
  ?created_by:string ->
  ?arn:string ->
  unit
-> describe_event_source_response
(** Create a {!type-describe_event_source_response} type *)

val make_describe_event_source_request : name:string -> unit
-> describe_event_source_request
(** Create a {!type-describe_event_source_request} type *)

val make_describe_event_bus_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?policy:string ->
  ?dead_letter_config:dead_letter_config ->
  ?kms_key_identifier:string ->
  ?description:string ->
  ?arn:string ->
  ?name:string ->
  unit
-> describe_event_bus_response
(** Create a {!type-describe_event_bus_response} type *)

val make_describe_event_bus_request : ?name:string -> unit
-> describe_event_bus_request
(** Create a {!type-describe_event_bus_request} type *)

val make_describe_endpoint_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:endpoint_state ->
  ?endpoint_url:string ->
  ?endpoint_id:string ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?description:string ->
  ?name:string ->
  unit
-> describe_endpoint_response
(** Create a {!type-describe_endpoint_response} type *)

val make_describe_endpoint_request :
  ?home_region:string -> name:string -> unit
-> describe_endpoint_request
(** Create a {!type-describe_endpoint_request} type *)

val make_connection_basic_auth_response_parameters : ?username:string -> unit
-> connection_basic_auth_response_parameters
(** Create a {!type-connection_basic_auth_response_parameters} type *)

val make_connection_o_auth_client_response_parameters :
  ?client_i_d:string -> unit
-> connection_o_auth_client_response_parameters
(** Create a {!type-connection_o_auth_client_response_parameters} type *)

val make_connection_o_auth_response_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  ?http_method:connection_o_auth_http_method ->
  ?authorization_endpoint:string ->
  ?client_parameters:connection_o_auth_client_response_parameters ->
  unit
-> connection_o_auth_response_parameters
(** Create a {!type-connection_o_auth_response_parameters} type *)

val make_connection_api_key_auth_response_parameters :
  ?api_key_name:string -> unit
-> connection_api_key_auth_response_parameters
(** Create a {!type-connection_api_key_auth_response_parameters} type *)

val make_connection_auth_response_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:connection_api_key_auth_response_parameters ->
  ?o_auth_parameters:connection_o_auth_response_parameters ->
  ?basic_auth_parameters:connection_basic_auth_response_parameters ->
  unit
-> connection_auth_response_parameters
(** Create a {!type-connection_auth_response_parameters} type *)

val make_describe_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?auth_parameters:connection_auth_response_parameters ->
  ?secret_arn:string ->
  ?authorization_type:connection_authorization_type ->
  ?state_reason:string ->
  ?connection_state:connection_state ->
  ?description:string ->
  ?name:string ->
  ?connection_arn:string ->
  unit
-> describe_connection_response
(** Create a {!type-describe_connection_response} type *)

val make_describe_connection_request : name:string -> unit
-> describe_connection_request
(** Create a {!type-describe_connection_request} type *)

val make_describe_archive_response :
  ?creation_time:float ->
  ?event_count:int ->
  ?size_bytes:int ->
  ?retention_days:int ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?event_pattern:string ->
  ?description:string ->
  ?event_source_arn:string ->
  ?archive_name:string ->
  ?archive_arn:string ->
  unit
-> describe_archive_response
(** Create a {!type-describe_archive_response} type *)

val make_describe_archive_request : archive_name:string -> unit
-> describe_archive_request
(** Create a {!type-describe_archive_request} type *)

val make_describe_api_destination_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?invocation_rate_limit_per_second:int ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:string ->
  ?connection_arn:string ->
  ?api_destination_state:api_destination_state ->
  ?description:string ->
  ?name:string ->
  ?api_destination_arn:string ->
  unit
-> describe_api_destination_response
(** Create a {!type-describe_api_destination_response} type *)

val make_describe_api_destination_request : name:string -> unit
-> describe_api_destination_request
(** Create a {!type-describe_api_destination_request} type *)

val make_delete_rule_request :
  ?force:bool -> ?event_bus_name:string -> name:string -> unit
-> delete_rule_request
(** Create a {!type-delete_rule_request} type *)

val make_delete_partner_event_source_request :
  account:string -> name:string -> unit
-> delete_partner_event_source_request
(** Create a {!type-delete_partner_event_source_request} type *)

val make_delete_event_bus_request : name:string -> unit
-> delete_event_bus_request
(** Create a {!type-delete_event_bus_request} type *)

val make_delete_endpoint_response : unit
-> delete_endpoint_response
(** Create a {!type-delete_endpoint_response} type *)

val make_delete_endpoint_request : name:string -> unit
-> delete_endpoint_request
(** Create a {!type-delete_endpoint_request} type *)

val make_delete_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> delete_connection_response
(** Create a {!type-delete_connection_response} type *)

val make_delete_connection_request : name:string -> unit
-> delete_connection_request
(** Create a {!type-delete_connection_request} type *)

val make_delete_archive_response : unit
-> delete_archive_response
(** Create a {!type-delete_archive_response} type *)

val make_delete_archive_request : archive_name:string -> unit
-> delete_archive_request
(** Create a {!type-delete_archive_request} type *)

val make_delete_api_destination_response : unit
-> delete_api_destination_response
(** Create a {!type-delete_api_destination_response} type *)

val make_delete_api_destination_request : name:string -> unit
-> delete_api_destination_request
(** Create a {!type-delete_api_destination_request} type *)

val make_deauthorize_connection_response :
  ?last_authorized_time:float ->
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> deauthorize_connection_response
(** Create a {!type-deauthorize_connection_response} type *)

val make_deauthorize_connection_request : name:string -> unit
-> deauthorize_connection_request
(** Create a {!type-deauthorize_connection_request} type *)

val make_deactivate_event_source_request : name:string -> unit
-> deactivate_event_source_request
(** Create a {!type-deactivate_event_source_request} type *)

val make_create_partner_event_source_response :
  ?event_source_arn:string -> unit
-> create_partner_event_source_response
(** Create a {!type-create_partner_event_source_response} type *)

val make_create_partner_event_source_request :
  account:string -> name:string -> unit
-> create_partner_event_source_request
(** Create a {!type-create_partner_event_source_request} type *)

val make_create_event_bus_response :
  ?dead_letter_config:dead_letter_config ->
  ?kms_key_identifier:string ->
  ?description:string ->
  ?event_bus_arn:string ->
  unit
-> create_event_bus_response
(** Create a {!type-create_event_bus_response} type *)

val make_create_event_bus_request :
  ?tags:tag list ->
  ?dead_letter_config:dead_letter_config ->
  ?kms_key_identifier:string ->
  ?description:string ->
  ?event_source_name:string ->
  name:string ->
  unit
-> create_event_bus_request
(** Create a {!type-create_event_bus_request} type *)

val make_create_endpoint_response :
  ?state:endpoint_state ->
  ?role_arn:string ->
  ?event_buses:endpoint_event_bus list ->
  ?replication_config:replication_config ->
  ?routing_config:routing_config ->
  ?arn:string ->
  ?name:string ->
  unit
-> create_endpoint_response
(** Create a {!type-create_endpoint_response} type *)

val make_create_endpoint_request :
  ?role_arn:string ->
  ?replication_config:replication_config ->
  ?description:string ->
  event_buses:endpoint_event_bus list ->
  routing_config:routing_config ->
  name:string ->
  unit
-> create_endpoint_request
(** Create a {!type-create_endpoint_request} type *)

val make_create_connection_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?connection_state:connection_state ->
  ?connection_arn:string ->
  unit
-> create_connection_response
(** Create a {!type-create_connection_response} type *)

val make_create_connection_basic_auth_request_parameters :
  password:string -> username:string -> unit
-> create_connection_basic_auth_request_parameters
(** Create a {!type-create_connection_basic_auth_request_parameters} type *)

val make_create_connection_o_auth_client_request_parameters :
  client_secret:string -> client_i_d:string -> unit
-> create_connection_o_auth_client_request_parameters
(** Create a {!type-create_connection_o_auth_client_request_parameters} type *)

val make_create_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  http_method:connection_o_auth_http_method ->
  authorization_endpoint:string ->
  client_parameters:create_connection_o_auth_client_request_parameters ->
  unit
-> create_connection_o_auth_request_parameters
(** Create a {!type-create_connection_o_auth_request_parameters} type *)

val make_create_connection_api_key_auth_request_parameters :
  api_key_value:string -> api_key_name:string -> unit
-> create_connection_api_key_auth_request_parameters
(** Create a {!type-create_connection_api_key_auth_request_parameters} type *)

val make_create_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:create_connection_api_key_auth_request_parameters ->
  ?o_auth_parameters:create_connection_o_auth_request_parameters ->
  ?basic_auth_parameters:create_connection_basic_auth_request_parameters ->
  unit
-> create_connection_auth_request_parameters
(** Create a {!type-create_connection_auth_request_parameters} type *)

val make_create_connection_request :
  ?description:string ->
  auth_parameters:create_connection_auth_request_parameters ->
  authorization_type:connection_authorization_type ->
  name:string ->
  unit
-> create_connection_request
(** Create a {!type-create_connection_request} type *)

val make_create_archive_response :
  ?creation_time:float ->
  ?state_reason:string ->
  ?state:archive_state ->
  ?archive_arn:string ->
  unit
-> create_archive_response
(** Create a {!type-create_archive_response} type *)

val make_create_archive_request :
  ?retention_days:int ->
  ?event_pattern:string ->
  ?description:string ->
  event_source_arn:string ->
  archive_name:string ->
  unit
-> create_archive_request
(** Create a {!type-create_archive_request} type *)

val make_create_api_destination_response :
  ?last_modified_time:float ->
  ?creation_time:float ->
  ?api_destination_state:api_destination_state ->
  ?api_destination_arn:string ->
  unit
-> create_api_destination_response
(** Create a {!type-create_api_destination_response} type *)

val make_create_api_destination_request :
  ?invocation_rate_limit_per_second:int ->
  ?description:string ->
  http_method:api_destination_http_method ->
  invocation_endpoint:string ->
  connection_arn:string ->
  name:string ->
  unit
-> create_api_destination_request
(** Create a {!type-create_api_destination_request} type *)

val make_cancel_replay_response :
  ?state_reason:string -> ?state:replay_state -> ?replay_arn:string -> unit
-> cancel_replay_response
(** Create a {!type-cancel_replay_response} type *)

val make_cancel_replay_request : replay_name:string -> unit
-> cancel_replay_request
(** Create a {!type-cancel_replay_request} type *)

val make_activate_event_source_request : name:string -> unit
-> activate_event_source_request
(** Create a {!type-activate_event_source_request} type *)

(** {1:operations Operations} *)

module ActivateEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      activate_event_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidStateException of invalid_state_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Activates a partner event source that has been deactivated. Once activated, your matching event bus will start receiving events from the event source.
     *)

  
end

module CancelReplay : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_replay_request ->
        (cancel_replay_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `IllegalStatusException of illegal_status_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Cancels the specified replay.
     *)

  
end

module CreateApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      create_api_destination_request ->
        (create_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Creates an API destination, which is an HTTP invocation endpoint configured as a target for events.
    
     API destinations do not support private destinations, such as interface VPC endpoints.
     
      For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-api-destinations.html}API destinations} in the {i EventBridge User Guide}.
       *)

  
end

module CreateArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      create_archive_request ->
        (create_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Creates an archive of events with the specified settings. When you create an archive, incoming events might not immediately start being sent to the archive. Allow a short period of time for changes to take effect. If you do not specify a pattern to filter events sent to the archive, all events are sent to the archive except replayed events. Replayed events are not sent to an archive.
    
     Archives and schema discovery are not supported for event buses encrypted using a customer managed key. EventBridge returns an error if:
     
      {ul
           {- You call 
              {[
              {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateArchive.html}CreateArchive}
              ]}
               on an event bus set to use a customer managed key for encryption.
              
              }
            {- You call 
               {[
               {{:https://docs.aws.amazon.com/eventbridge/latest/schema-reference/v1-discoverers.html#CreateDiscoverer}CreateDiscoverer}
               ]}
                on an event bus set to use a customer managed key for encryption.
               
               }
            {- You call 
               {[
               {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UpdatedEventBus.html}UpdatedEventBus}
               ]}
                to set a customer managed key on an event bus with an archives or schema discovery enabled.
               
               }
           
      }
       To enable archives or schema discovery on an event bus, choose to use an Amazon Web Services owned key. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.
       
        *)

  
end

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_request ->
        (create_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
  (** 
    Creates a connection. A connection defines the authorization type and credentials to use for authorization with an API destination HTTP endpoint.
     *)

  
end

module CreateEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      create_endpoint_request ->
        (create_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
  [@@ocaml.doc {| 
    Creates a global endpoint. Global endpoints improve your application's availability by making it regional-fault tolerant. To do this, you define a primary and secondary Region with event buses in each Region. You also create a Amazon Route 53 health check that will tell EventBridge to route events to the secondary Region when an "unhealthy" state is encountered and events will be routed back to the primary Region when the health check reports a "healthy" state.
     |}]

  
end

module CreateEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      create_event_bus_request ->
        (create_event_bus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidStateException of invalid_state_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Creates a new event bus within your account. This can be a custom event bus which you can use to receive events from your custom applications and services, or it can be a partner event bus which can be matched to a partner event source.
     *)

  
end

module CreatePartnerEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      create_partner_event_source_request ->
        (create_partner_event_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
  (** 
    Called by an SaaS partner to create a partner event source. This operation is not used by Amazon Web Services customers.
    
     Each partner event source can be used by one Amazon Web Services account to create a matching partner event bus in that Amazon Web Services account. A SaaS partner must create one partner event source for each Amazon Web Services account that wants to receive those event types.
     
      A partner event source creates events based on resources within the SaaS partner's service or application.
      
       An Amazon Web Services account that creates a partner event bus that matches the partner event source can use that event bus to receive events from the partner, and then process them using Amazon Web Services Events rules and targets.
       
        Partner event source names follow this format:
        
         
         {[
         {i partner_name}/{i event_namespace}/{i event_name}
         ]}
         
         
          {ul
               {- {i partner_name} is determined during partner registration, and identifies the partner to Amazon Web Services customers.
                  
                  }
                {- {i event_namespace} is determined by the partner, and is a way for the partner to categorize their events.
                   
                   }
                {- {i event_name} is determined by the partner, and should uniquely identify an event-generating resource within the partner system.
                   
                    The {i event_name} must be unique across all Amazon Web Services customers. This is because the event source is a shared resource between the partner and customer accounts, and each partner event source unique in the partner account.
                    
                    }
               
      }
       The combination of {i event_namespace} and {i event_name} should help Amazon Web Services customers decide whether to create an event bus to receive these events.
        *)

  
end

module DeactivateEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      deactivate_event_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidStateException of invalid_state_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    You can use this operation to temporarily stop receiving events from the specified partner event source. The matching event bus is not deleted.
    
     When you deactivate a partner event source, the source goes into PENDING state. If it remains in PENDING state for more than two weeks, it is deleted.
     
      To activate a deactivated partner event source, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ActivateEventSource.html}ActivateEventSource}.
       *)

  
end

module DeauthorizeConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      deauthorize_connection_request ->
        (deauthorize_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Removes all authorization parameters from the connection. This lets you remove the secret from the connection so you can reuse it without having to create a new connection.
     *)

  
end

module DeleteApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_api_destination_request ->
        (delete_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the specified API destination.
     *)

  
end

module DeleteArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_archive_request ->
        (delete_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the specified archive.
     *)

  
end

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_request ->
        (delete_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes a connection.
     *)

  
end

module DeleteEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_endpoint_request ->
        (delete_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Delete an existing global endpoint. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i {i Amazon EventBridge User Guide}}.
     *)

  
end

module DeleteEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_event_bus_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            
        ]
      ) result
  (** 
    Deletes the specified custom event bus or partner event bus. All rules associated with this event bus need to be deleted. You can't delete your account's default event bus.
     *)

  
end

module DeletePartnerEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_partner_event_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
  (** 
    This operation is used by SaaS partners to delete a partner event source. This operation is not used by Amazon Web Services customers.
    
     When you delete an event source, the status of the corresponding partner event bus in the Amazon Web Services customer account becomes DELETED.
     
      
       *)

  
end

module DeleteRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the specified rule.
    
     Before you can delete the rule, you must remove all targets, using {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemoveTargets.html}RemoveTargets}.
     
      When you delete a rule, incoming events might continue to match to the deleted rule. Allow a short period of time for changes to take effect.
      
       If you call delete rule multiple times for the same rule, all calls will succeed. When you call delete rule for a non-existent custom eventbus, [ResourceNotFoundException] is returned.
       
        Managed rules are rules created and managed by another Amazon Web Services service on your behalf. These rules are created by those other Amazon Web Services services to support functionality in those services. You can delete these rules using the [Force] option, but you should do so only if you are sure the other service is not still using that rule.
         *)

  
end

module DescribeApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_api_destination_request ->
        (describe_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves details about an API destination.
     *)

  
end

module DescribeArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_archive_request ->
        (describe_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves details about an archive.
     *)

  
end

module DescribeConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_connection_request ->
        (describe_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves details about a connection.
     *)

  
end

module DescribeEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_endpoint_request ->
        (describe_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Get the information about an existing global endpoint. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i {i Amazon EventBridge User Guide}}.
     *)

  
end

module DescribeEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_bus_request ->
        (describe_event_bus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Displays details about an event bus in your account. This can include the external Amazon Web Services accounts that are permitted to write events to your default event bus, and the associated policy. For custom event buses and partner event buses, it displays the name, ARN, policy, state, and creation time.
    
     To enable your account to receive events from other accounts on its default event bus, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html}PutPermission}.
     
      For more information about partner event buses, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.
       *)

  
end

module DescribeEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_source_request ->
        (describe_event_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    This operation lists details about a partner event source that is shared with your account.
     *)

  
end

module DescribePartnerEventSource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_partner_event_source_request ->
        (describe_partner_event_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    An SaaS partner can use this operation to list details about a partner event source that they have created. Amazon Web Services customers do not use this operation. Instead, Amazon Web Services customers can use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventSource.html}DescribeEventSource} to see details about a partner event source that is shared with them.
     *)

  
end

module DescribeReplay : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_replay_request ->
        (describe_replay_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves details about a replay. Use [DescribeReplay] to determine the progress of a running replay. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you use [StartReplay] and specify an [EventStartTime] and an [EventEndTime] that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use [DescribeReplay] to determine the progress of a replay. The value returned for [EventLastReplayedTime] indicates the time within the specified time range associated with the last event replayed.
     *)

  
end

module DescribeRule : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_rule_request ->
        (describe_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Describes the specified rule.
    
     DescribeRule does not list the targets of a rule. To see the targets associated with a rule, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html}ListTargetsByRule}.
      *)

  
end

module DisableRule : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it has a schedule expression.
    
     When you disable a rule, incoming events might continue to match to the disabled rule. Allow a short period of time for changes to take effect.
      *)

  
end

module EnableRule : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Enables the specified rule. If the rule does not exist, the operation fails.
    
     When you enable a rule, incoming events might not immediately start matching to a newly enabled rule. Allow a short period of time for changes to take effect.
      *)

  
end

module ListApiDestinations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_api_destinations_request ->
        (list_api_destinations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
  (** 
    Retrieves a list of API destination in the account in the current Region.
     *)

  
end

module ListArchives : sig
  val request :
    Smaws_Lib.Context.t ->
      list_archives_request ->
        (list_archives_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Lists your archives. You can either list all the archives or you can provide a prefix to match to the archive names. Filter parameters are exclusive.
     *)

  
end

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_request ->
        (list_connections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
  (** 
    Retrieves a list of connections from the account.
     *)

  
end

module ListEndpoints : sig
  val request :
    Smaws_Lib.Context.t ->
      list_endpoints_request ->
        (list_endpoints_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
  (** 
    List the global endpoints associated with this account. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i {i Amazon EventBridge User Guide}}.
     *)

  
end

module ListEventBuses : sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_buses_request ->
        (list_event_buses_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
  (** 
    Lists all the event buses in your account, including the default event bus, custom event buses, and partner event buses.
     *)

  
end

module ListEventSources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_sources_request ->
        (list_event_sources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
  (** 
    You can use this to see all the partner event sources that have been shared with your Amazon Web Services account. For more information about partner event sources, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.
     *)

  
end

module ListPartnerEventSourceAccounts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_source_accounts_request ->
        (list_partner_event_source_accounts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    An SaaS partner can use this operation to display the Amazon Web Services account ID that a particular partner event source name is associated with. This operation is not used by Amazon Web Services customers.
     *)

  
end

module ListPartnerEventSources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_sources_request ->
        (list_partner_event_sources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
  (** 
    An SaaS partner can use this operation to list all the partner event source names that they have created. This operation is not used by Amazon Web Services customers.
     *)

  
end

module ListReplays : sig
  val request :
    Smaws_Lib.Context.t ->
      list_replays_request ->
        (list_replays_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
  (** 
    Lists your replays. You can either list all the replays or you can provide a prefix to match to the replay names. Filter parameters are exclusive.
     *)

  
end

module ListRuleNamesByTarget : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_names_by_target_request ->
        (list_rule_names_by_target_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Lists the rules for the specified target. You can see which of the rules in Amazon EventBridge can invoke a specific target in your account.
    
     The maximum number of results per page for requests is 100.
      *)

  
end

module ListRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rules_request ->
        (list_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Lists your Amazon EventBridge rules. You can either list all the rules or you can provide a prefix to match to the rule names.
    
     The maximum number of results per page for requests is 100.
     
      ListRules does not list the targets of a rule. To see the targets associated with a rule, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html}ListTargetsByRule}.
       *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Displays the tags associated with an EventBridge resource. In EventBridge, rules and event buses can be tagged.
     *)

  
end

module ListTargetsByRule : sig
  val request :
    Smaws_Lib.Context.t ->
      list_targets_by_rule_request ->
        (list_targets_by_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Lists the targets assigned to the specified rule.
    
     The maximum number of results per page for requests is 100.
      *)

  
end

module PutEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      put_events_request ->
        (put_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            
        ]
      ) result
  (** 
    Sends custom events to Amazon EventBridge so that they can be matched to rules.
    
     The maximum size for a PutEvents event entry is 256 KB. Entry size is calculated including the event and any necessary characters and keys of the JSON representation of the event. To learn more, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevent-size.html}Calculating PutEvents event entry size} in the {i {i Amazon EventBridge User Guide}}
     
      PutEvents accepts the data in JSON format. For the JSON number (integer) data type, the constraints are: a minimum value of -9,223,372,036,854,775,808 and a maximum value of 9,223,372,036,854,775,807.
      
       PutEvents will only process nested JSON up to 1100 levels deep.
       
        *)

  
end

module PutPartnerEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      put_partner_events_request ->
        (put_partner_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            
        ]
      ) result
  (** 
    This is used by SaaS partners to write events to a customer's partner event bus. Amazon Web Services customers do not use this operation.
    
     For information on calculating event batch size, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevent-size.html}Calculating EventBridge PutEvents event entry size} in the {i EventBridge User Guide}.
      *)

  
end

module PutPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `PolicyLengthExceededException of policy_length_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  [@@ocaml.doc {| 
    Running [PutPermission] permits the specified Amazon Web Services account or Amazon Web Services organization to put events to the specified {i event bus}. Amazon EventBridge (CloudWatch Events) rules in your account are triggered by these events arriving to an event bus in your account.
    
     For another account to send events to your account, that external account must have an EventBridge rule with your account's event bus as a target.
     
      To enable multiple Amazon Web Services accounts to put events to your event bus, run [PutPermission] once for each of these accounts. Or, if all the accounts are members of the same Amazon Web Services organization, you can run [PutPermission] once specifying [Principal] as "*" and specifying the Amazon Web Services organization ID in [Condition], to grant permissions to all accounts in that organization.
      
       If you grant permissions using an organization, then accounts in that organization must specify a [RoleArn] with proper permissions when they use [PutTarget] to add your account's event bus as a target. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User Guide}.
       
        The permission policy on the event bus cannot exceed 10 KB in size.
         |}]

  
end

module PutRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_rule_request ->
        (put_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Creates or updates the specified rule. Rules are enabled by default, or based on value of the state. You can disable a rule using {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DisableRule.html}DisableRule}.
    
     A single rule watches for events from a single event bus. Events generated by Amazon Web Services services go to your account's default event bus. Events generated by SaaS partner services or applications go to the matching partner event bus. If you have custom applications or services, you can specify whether their events go to your default event bus or a custom event bus that you have created. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.
     
      If you are updating an existing rule, the rule is replaced with what you specify in this [PutRule] command. If you omit arguments in [PutRule], the old values for those arguments are not kept. Instead, they are replaced with null values.
      
       When you create or update a rule, incoming events might not immediately start matching to new or updated rules. Allow a short period of time for changes to take effect.
       
        A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule.
        
         When you initially create a rule, you can optionally assign one or more tags to the rule. Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only rules with certain tag values. To use the [PutRule] operation and assign tags, you must have both the [events:PutRule] and [events:TagResource] permissions.
         
          If you are updating an existing rule, any tags you specify in the [PutRule] operation are ignored. To update the tags of an existing rule, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_TagResource.html}TagResource} and {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UntagResource.html}UntagResource}.
          
           Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.
           
            In EventBridge, it is possible to create rules that lead to infinite loops, where a rule is fired repeatedly. For example, a rule might detect that ACLs have changed on an S3 bucket, and trigger software to change them to the desired state. If the rule is not written carefully, the subsequent change to the ACLs fires the rule again, creating an infinite loop.
            
             To prevent this, write the rules so that the triggered actions do not re-fire the same rule. For example, your rule could fire only if ACLs are found to be in a bad state, instead of after any change.
             
              An infinite loop can quickly cause higher than expected charges. We recommend that you use budgeting, which alerts you when charges exceed your specified limit. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html}Managing Your Costs with Budgets}.
               *)

  
end

module PutTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      put_targets_request ->
        (put_targets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds the specified targets to the specified rule, or updates the targets if they are already associated with the rule.
    
     Targets are the resources that are invoked when a rule is triggered.
     
      The maximum number of entries per request is 10.
      
       Each rule can have up to five (5) targets associated with it at one time.
       
        For a list of services you can configure as targets for events, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-targets.html}EventBridge targets} in the {i {i Amazon EventBridge User Guide}}.
        
         Creating rules with built-in targets is supported only in the Amazon Web Services Management Console. The built-in targets are:
         
          {ul
               {- [Amazon EBS CreateSnapshot API call]
                  
                  }
                {- [Amazon EC2 RebootInstances API call]
                   
                   }
                {- [Amazon EC2 StopInstances API call]
                   
                   }
                {- [Amazon EC2 TerminateInstances API call]
                   
                   }
               
      }
       For some target types, [PutTargets] provides target-specific parameters. If the target is a Kinesis data stream, you can optionally specify which shard the event goes to by using the [KinesisParameters] argument. To invoke a command on multiple EC2 instances with one rule, you can use the [RunCommandParameters] field.
       
        To be able to make API calls against the resources that you own, Amazon EventBridge needs the appropriate permissions:
        
         {ul
              {- For Lambda and Amazon SNS resources, EventBridge relies on resource-based policies.
                 
                 }
               {- For EC2 instances, Kinesis Data Streams, Step Functions state machines and API Gateway APIs, EventBridge relies on IAM roles that you specify in the [RoleARN] argument in [PutTargets].
                  
                  }
              
      }
       For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html}Authentication and Access Control} in the {i {i Amazon EventBridge User Guide}}.
       
        If another Amazon Web Services account is in the same region and has granted you permission (using [PutPermission]), you can send events to that account. Set that account's event bus as a target of the rules in your account. To send the matched events to the other account, specify that account's event bus as the [Arn] value when you run [PutTargets]. If your account sends events to another account, your account is charged for each sent event. Each event sent to another account is charged as a custom event. The account receiving the event is not charged. For more information, see {{:http://aws.amazon.com/eventbridge/pricing/}Amazon EventBridge Pricing}.
        
         [Input], [InputPath], and [InputTransformer] are not available with [PutTarget] if the target is an event bus of a different Amazon Web Services account.
         
          If you are setting the event bus of another account as the target, and that account granted permission to your account through an organization instead of directly by the account ID, then you must specify a [RoleArn] with proper permissions in the [Target] structure. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User Guide}.
          
           If you have an IAM role on a cross-account event bus target, a [PutTargets] call without a role on the same target (same [Id] and [Arn]) will not remove the role.
           
            For more information about enabling cross-account events, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html}PutPermission}.
            
             {b Input}, {b InputPath}, and {b InputTransformer} are mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched event:
             
              {ul
                   {- If none of the following arguments are specified for a target, then the entire event is passed to the target in JSON format (unless the target is Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the event is passed to the target).
                      
                      }
                    {- If {b Input} is specified in the form of valid JSON, then the matched event is overridden with this constant.
                       
                       }
                    {- If {b InputPath} is specified in the form of JSONPath (for example, [$.detail]), then only the part of the event specified in the path is passed to the target (for example, only the detail part of the event is passed).
                       
                       }
                    {- If {b InputTransformer} is specified, then one or more specified JSONPaths are extracted from the event and used as values in a template that you specify as the input to the target.
                       
                       }
                   
      }
       When you specify [InputPath] or [InputTransformer], you must use JSON dot notation, not bracket notation.
       
        When you add targets to a rule and the associated rule triggers soon after, new or updated targets might not be immediately invoked. Allow a short period of time for changes to take effect.
        
         This action can partially fail if too many requests are made at the same time. If that happens, [FailedEntryCount] is non-zero in the response and each entry in [FailedEntries] provides the ID of the failed target and the error code.
          *)

  
end

module RemovePermission : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Revokes the permission of another Amazon Web Services account to be able to put events to the specified event bus. Specify the account to revoke by the [StatementId] value that you associated with the account when you granted it permission with [PutPermission]. You can find the [StatementId] by using {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventBus.html}DescribeEventBus}.
     *)

  
end

module RemoveTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_targets_request ->
        (remove_targets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Removes the specified targets from the specified rule. When the rule is triggered, those targets are no longer be invoked.
    
     A successful execution of [RemoveTargets] doesn't guarantee all targets are removed from the rule, it means that the target(s) listed in the request are removed.
     
      When you remove a target, when the associated rule triggers, removed targets might continue to be invoked. Allow a short period of time for changes to take effect.
      
       This action can partially fail if too many requests are made at the same time. If that happens, [FailedEntryCount] is non-zero in the response and each entry in [FailedEntries] provides the ID of the failed target and the error code.
       
        The maximum number of entries per request is 10.
         *)

  
end

module StartReplay : sig
  val request :
    Smaws_Lib.Context.t ->
      start_replay_request ->
        (start_replay_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Starts the specified replay. Events are not necessarily replayed in the exact same order that they were added to the archive. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you specify an [EventStartTime] and an [EventEndTime] that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use [DescribeReplay] to determine the progress of a replay. The value returned for [EventLastReplayedTime] indicates the time within the specified time range associated with the last event replayed.
     *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Assigns one or more tags (key-value pairs) to the specified EventBridge resource. Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values. In EventBridge, rules and event buses can be tagged.
    
     Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.
     
      You can use the [TagResource] action with a resource that already has tags. If you specify a new tag key, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag.
      
       You can associate as many as 50 tags with a resource.
        *)

  
end

module TestEventPattern : sig
  val request :
    Smaws_Lib.Context.t ->
      test_event_pattern_request ->
        (test_event_pattern_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            
        ]
      ) result
  (** 
    Tests whether the specified event pattern matches the provided event.
    
     Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.
      *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ManagedRuleException of managed_rule_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Removes one or more tags from the specified EventBridge resource. In Amazon EventBridge (CloudWatch Events), rules and event buses can be tagged.
     *)

  
end

module UpdateApiDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      update_api_destination_request ->
        (update_api_destination_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates an API destination.
     *)

  
end

module UpdateArchive : sig
  val request :
    Smaws_Lib.Context.t ->
      update_archive_request ->
        (update_archive_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `InvalidEventPatternException of invalid_event_pattern_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates the specified archive.
     *)

  
end

module UpdateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_connection_request ->
        (update_connection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates settings for a connection.
     *)

  
end

module UpdateEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      update_endpoint_request ->
        (update_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Update an existing endpoint. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i {i Amazon EventBridge User Guide}}.
     *)

  
end

module UpdateEventBus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_event_bus_request ->
        (update_event_bus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalException of internal_exception
            | `OperationDisabledException of operation_disabled_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates the specified event bus.
     *)

  
end

