open Smaws_Lib
val service : Service.descriptor

type vpc_configuration = {
  tls_certificate: string option;
  security_group_ids: string list;
  subnet_ids: string list;
  vpc_id: string
}

type provider_type = | GITLAB_SELF_MANAGED
  | GITLAB
  | GITHUB_ENTERPRISE_SERVER
  | GITHUB
  | BITBUCKET

type sync_configuration_type = | CFN_STACK_SYNC

type publish_deployment_status = | DISABLED
  | ENABLED

type trigger_resource_update_on = | FILE_CHANGE
  | ANY_CHANGE

type sync_configuration = {
  trigger_resource_update_on: trigger_resource_update_on option;
  publish_deployment_status: publish_deployment_status option;
  sync_type: sync_configuration_type;
  role_arn: string;
  resource_name: string;
  repository_name: string;
  repository_link_id: string;
  provider_type: provider_type;
  owner_id: string;
  config_file: string option;
  branch: string
}

type update_sync_configuration_output = {
  sync_configuration: sync_configuration
}

type update_sync_configuration_input = {
  trigger_resource_update_on: trigger_resource_update_on option;
  publish_deployment_status: publish_deployment_status option;
  sync_type: sync_configuration_type;
  role_arn: string option;
  resource_name: string;
  repository_link_id: string option;
  config_file: string option;
  branch: string option
}

type update_out_of_sync_exception = {
  message: string option
}

type throttling_exception = {
  message: string option
}

type resource_not_found_exception = {
  message: string option
}

type invalid_input_exception = {
  message: string option
}

type internal_server_exception = {
  message: string option
}

type concurrent_modification_exception = {
  message: string option
}

type access_denied_exception = {
  message: string option
}

type blocker_type = | AUTOMATED

type blocker_status = | RESOLVED
  | ACTIVE

type sync_blocker_context = {
  value: string;
  key: string
}

type sync_blocker = {
  resolved_at: float option;
  resolved_reason: string option;
  contexts: sync_blocker_context list option;
  created_at: float;
  created_reason: string;
  status: blocker_status;
  type_: blocker_type;
  id: string
}

type update_sync_blocker_output = {
  sync_blocker: sync_blocker;
  parent_resource_name: string option;
  resource_name: string
}

type update_sync_blocker_input = {
  resolved_reason: string;
  resource_name: string;
  sync_type: sync_configuration_type;
  id: string
}

type sync_blocker_does_not_exist_exception = {
  message: string option
}

type retry_latest_commit_failed_exception = {
  message: string option
}

type repository_link_info = {
  repository_name: string;
  repository_link_id: string;
  repository_link_arn: string;
  provider_type: provider_type;
  owner_id: string;
  encryption_key_arn: string option;
  connection_arn: string
}

type update_repository_link_output = {
  repository_link_info: repository_link_info
}

type update_repository_link_input = {
  repository_link_id: string;
  encryption_key_arn: string option;
  connection_arn: string option
}

type conditional_check_failed_exception = {
  message: string option
}

type update_host_output = unit

type update_host_input = {
  vpc_configuration: vpc_configuration option;
  provider_endpoint: string option;
  host_arn: string
}

type unsupported_operation_exception = {
  message: string option
}

type resource_unavailable_exception = {
  message: string option
}

type conflict_exception = {
  message: string option
}

type untag_resource_output = unit

type untag_resource_input = {
  tag_keys: string list;
  resource_arn: string
}

type unsupported_provider_type_exception = {
  message: string option
}

type tag_resource_output = unit

type tag = {
  value: string;
  key: string
}

type tag_resource_input = {
  tags: tag list;
  resource_arn: string
}

type limit_exceeded_exception = {
  message: string option
}

type sync_configuration_still_exists_exception = {
  message: string option
}

type sync_blocker_summary = {
  latest_blockers: sync_blocker list option;
  parent_resource_name: string option;
  resource_name: string
}

type revision = {
  sha: string;
  provider_type: provider_type;
  repository_name: string;
  owner_id: string;
  directory: string;
  branch: string
}

type resource_sync_status = | SUCCEEDED
  | IN_PROGRESS
  | INITIATED
  | FAILED

type resource_sync_event = {
  type_: string;
  time: float;
  external_id: string option;
  event: string
}

type resource_sync_attempt = {
  target: string;
  target_revision: revision;
  status: resource_sync_status;
  started_at: float;
  initial_revision: revision;
  events: resource_sync_event list
}

type resource_already_exists_exception = {
  message: string option
}

type repository_sync_status = | QUEUED
  | SUCCEEDED
  | IN_PROGRESS
  | INITIATED
  | FAILED

type repository_sync_event = {
  type_: string;
  time: float;
  external_id: string option;
  event: string
}

type repository_sync_definition = {
  target: string;
  parent: string;
  directory: string;
  branch: string
}

type repository_sync_attempt = {
  events: repository_sync_event list;
  status: repository_sync_status;
  started_at: float
}

type list_tags_for_resource_output = {
  tags: tag list option
}

type list_tags_for_resource_input = {
  resource_arn: string
}

type list_sync_configurations_output = {
  next_token: string option;
  sync_configurations: sync_configuration list
}

type list_sync_configurations_input = {
  sync_type: sync_configuration_type;
  repository_link_id: string;
  next_token: string option;
  max_results: int option
}

type list_repository_sync_definitions_output = {
  next_token: string option;
  repository_sync_definitions: repository_sync_definition list
}

type list_repository_sync_definitions_input = {
  sync_type: sync_configuration_type;
  repository_link_id: string
}

type list_repository_links_output = {
  next_token: string option;
  repository_links: repository_link_info list
}

type list_repository_links_input = {
  next_token: string option;
  max_results: int option
}

type host = {
  status_message: string option;
  status: string option;
  vpc_configuration: vpc_configuration option;
  provider_endpoint: string option;
  provider_type: provider_type option;
  host_arn: string option;
  name: string option
}

type list_hosts_output = {
  next_token: string option;
  hosts: host list option
}

type list_hosts_input = {
  next_token: string option;
  max_results: int option
}

type connection_status = | ERROR
  | AVAILABLE
  | PENDING

type connection = {
  host_arn: string option;
  connection_status: connection_status option;
  owner_account_id: string option;
  provider_type: provider_type option;
  connection_arn: string option;
  connection_name: string option
}

type list_connections_output = {
  next_token: string option;
  connections: connection list option
}

type list_connections_input = {
  next_token: string option;
  max_results: int option;
  host_arn_filter: string option;
  provider_type_filter: provider_type option
}

type get_sync_configuration_output = {
  sync_configuration: sync_configuration
}

type get_sync_configuration_input = {
  resource_name: string;
  sync_type: sync_configuration_type
}

type get_sync_blocker_summary_output = {
  sync_blocker_summary: sync_blocker_summary
}

type get_sync_blocker_summary_input = {
  resource_name: string;
  sync_type: sync_configuration_type
}

type get_resource_sync_status_output = {
  latest_sync: resource_sync_attempt;
  latest_successful_sync: resource_sync_attempt option;
  desired_state: revision option
}

type get_resource_sync_status_input = {
  sync_type: sync_configuration_type;
  resource_name: string
}

type get_repository_sync_status_output = {
  latest_sync: repository_sync_attempt
}

type get_repository_sync_status_input = {
  sync_type: sync_configuration_type;
  repository_link_id: string;
  branch: string
}

type get_repository_link_output = {
  repository_link_info: repository_link_info
}

type get_repository_link_input = {
  repository_link_id: string
}

type get_host_output = {
  vpc_configuration: vpc_configuration option;
  provider_endpoint: string option;
  provider_type: provider_type option;
  status: string option;
  name: string option
}

type get_host_input = {
  host_arn: string
}

type get_connection_output = {
  connection: connection option
}

type get_connection_input = {
  connection_arn: string
}

type delete_sync_configuration_output = unit

type delete_sync_configuration_input = {
  resource_name: string;
  sync_type: sync_configuration_type
}

type delete_repository_link_output = unit

type delete_repository_link_input = {
  repository_link_id: string
}

type delete_host_output = unit

type delete_host_input = {
  host_arn: string
}

type delete_connection_output = unit

type delete_connection_input = {
  connection_arn: string
}

type create_sync_configuration_output = {
  sync_configuration: sync_configuration
}

type create_sync_configuration_input = {
  trigger_resource_update_on: trigger_resource_update_on option;
  publish_deployment_status: publish_deployment_status option;
  sync_type: sync_configuration_type;
  role_arn: string;
  resource_name: string;
  repository_link_id: string;
  config_file: string;
  branch: string
}

type create_repository_link_output = {
  repository_link_info: repository_link_info
}

type create_repository_link_input = {
  tags: tag list option;
  encryption_key_arn: string option;
  repository_name: string;
  owner_id: string;
  connection_arn: string
}

type create_host_output = {
  tags: tag list option;
  host_arn: string option
}

type create_host_input = {
  tags: tag list option;
  vpc_configuration: vpc_configuration option;
  provider_endpoint: string;
  provider_type: provider_type;
  name: string
}

type create_connection_output = {
  tags: tag list option;
  connection_arn: string
}

type create_connection_input = {
  host_arn: string option;
  tags: tag list option;
  connection_name: string;
  provider_type: provider_type option
}



type base_document = Json.t

val make_vpc_configuration :
  ?tls_certificate:string ->
  security_group_ids:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  unit -> vpc_configuration

val make_sync_configuration :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  ?config_file:string ->
  sync_type:sync_configuration_type ->
  role_arn:string ->
  resource_name:string ->
  repository_name:string ->
  repository_link_id:string ->
  provider_type:provider_type ->
  owner_id:string ->
  branch:string ->
  unit -> sync_configuration

val make_update_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> update_sync_configuration_output

val make_update_sync_configuration_input :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  ?role_arn:string ->
  ?repository_link_id:string ->
  ?config_file:string ->
  ?branch:string ->
  sync_type:sync_configuration_type ->
  resource_name:string ->
  unit -> update_sync_configuration_input

val make_sync_blocker_context : value:string -> key:string -> unit
-> sync_blocker_context

val make_sync_blocker :
  ?resolved_at:float ->
  ?resolved_reason:string ->
  ?contexts:sync_blocker_context list ->
  created_at:float ->
  created_reason:string ->
  status:blocker_status ->
  type_:blocker_type ->
  id:string ->
  unit -> sync_blocker

val make_update_sync_blocker_output :
  ?parent_resource_name:string ->
  sync_blocker:sync_blocker ->
  resource_name:string ->
  unit -> update_sync_blocker_output

val make_update_sync_blocker_input :
  resolved_reason:string ->
  resource_name:string ->
  sync_type:sync_configuration_type ->
  id:string ->
  unit -> update_sync_blocker_input

val make_repository_link_info :
  ?encryption_key_arn:string ->
  repository_name:string ->
  repository_link_id:string ->
  repository_link_arn:string ->
  provider_type:provider_type ->
  owner_id:string ->
  connection_arn:string ->
  unit -> repository_link_info

val make_update_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> update_repository_link_output

val make_update_repository_link_input :
  ?encryption_key_arn:string ->
  ?connection_arn:string ->
  repository_link_id:string ->
  unit -> update_repository_link_input

val make_update_host_output : unit
-> update_host_output

val make_update_host_input :
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  host_arn:string ->
  unit -> update_host_input

val make_untag_resource_output : unit
-> untag_resource_output

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_tag_resource_output : unit -> tag_resource_output

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input

val make_sync_blocker_summary :
  ?latest_blockers:sync_blocker list ->
  ?parent_resource_name:string ->
  resource_name:string ->
  unit -> sync_blocker_summary

val make_revision :
  sha:string ->
  provider_type:provider_type ->
  repository_name:string ->
  owner_id:string ->
  directory:string ->
  branch:string ->
  unit -> revision

val make_resource_sync_event :
  ?external_id:string -> type_:string -> time:float -> event:string -> unit
-> resource_sync_event

val make_resource_sync_attempt :
  target:string ->
  target_revision:revision ->
  status:resource_sync_status ->
  started_at:float ->
  initial_revision:revision ->
  events:resource_sync_event list ->
  unit -> resource_sync_attempt

val make_repository_sync_event :
  ?external_id:string -> type_:string -> time:float -> event:string -> unit
-> repository_sync_event

val make_repository_sync_definition :
  target:string -> parent:string -> directory:string -> branch:string -> unit
-> repository_sync_definition

val make_repository_sync_attempt :
  events:repository_sync_event list ->
  status:repository_sync_status ->
  started_at:float ->
  unit -> repository_sync_attempt

val make_list_tags_for_resource_output : ?tags:tag list -> unit
-> list_tags_for_resource_output

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input

val make_list_sync_configurations_output :
  ?next_token:string -> sync_configurations:sync_configuration list -> unit
-> list_sync_configurations_output

val make_list_sync_configurations_input :
  ?next_token:string ->
  ?max_results:int ->
  sync_type:sync_configuration_type ->
  repository_link_id:string ->
  unit
-> list_sync_configurations_input

val make_list_repository_sync_definitions_output :
  ?next_token:string ->
  repository_sync_definitions:repository_sync_definition list ->
  unit
-> list_repository_sync_definitions_output

val make_list_repository_sync_definitions_input :
  sync_type:sync_configuration_type -> repository_link_id:string -> unit
-> list_repository_sync_definitions_input

val make_list_repository_links_output :
  ?next_token:string -> repository_links:repository_link_info list -> unit
-> list_repository_links_output

val make_list_repository_links_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_repository_links_input

val make_host :
  ?status_message:string ->
  ?status:string ->
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  ?provider_type:provider_type ->
  ?host_arn:string ->
  ?name:string ->
  unit -> host

val make_list_hosts_output : ?next_token:string -> ?hosts:host list -> unit
-> list_hosts_output

val make_list_hosts_input : ?next_token:string -> ?max_results:int -> unit
-> list_hosts_input

val make_connection :
  ?host_arn:string ->
  ?connection_status:connection_status ->
  ?owner_account_id:string ->
  ?provider_type:provider_type ->
  ?connection_arn:string ->
  ?connection_name:string ->
  unit -> connection

val make_list_connections_output :
  ?next_token:string -> ?connections:connection list -> unit
-> list_connections_output

val make_list_connections_input :
  ?next_token:string ->
  ?max_results:int ->
  ?host_arn_filter:string ->
  ?provider_type_filter:provider_type ->
  unit -> list_connections_input

val make_get_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> get_sync_configuration_output

val make_get_sync_configuration_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> get_sync_configuration_input

val make_get_sync_blocker_summary_output :
  sync_blocker_summary:sync_blocker_summary -> unit
-> get_sync_blocker_summary_output

val make_get_sync_blocker_summary_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> get_sync_blocker_summary_input

val make_get_resource_sync_status_output :
  ?latest_successful_sync:resource_sync_attempt ->
  ?desired_state:revision ->
  latest_sync:resource_sync_attempt ->
  unit
-> get_resource_sync_status_output

val make_get_resource_sync_status_input :
  sync_type:sync_configuration_type -> resource_name:string -> unit
-> get_resource_sync_status_input

val make_get_repository_sync_status_output :
  latest_sync:repository_sync_attempt -> unit
-> get_repository_sync_status_output

val make_get_repository_sync_status_input :
  sync_type:sync_configuration_type ->
  repository_link_id:string ->
  branch:string ->
  unit
-> get_repository_sync_status_input

val make_get_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> get_repository_link_output

val make_get_repository_link_input : repository_link_id:string -> unit
-> get_repository_link_input

val make_get_host_output :
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  ?provider_type:provider_type ->
  ?status:string ->
  ?name:string ->
  unit -> get_host_output

val make_get_host_input : host_arn:string -> unit
-> get_host_input

val make_get_connection_output : ?connection:connection -> unit
-> get_connection_output

val make_get_connection_input : connection_arn:string -> unit
-> get_connection_input

val make_delete_sync_configuration_output : unit
-> delete_sync_configuration_output

val make_delete_sync_configuration_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> delete_sync_configuration_input

val make_delete_repository_link_output : unit
-> delete_repository_link_output

val make_delete_repository_link_input : repository_link_id:string -> unit
-> delete_repository_link_input

val make_delete_host_output : unit
-> delete_host_output

val make_delete_host_input : host_arn:string -> unit
-> delete_host_input

val make_delete_connection_output : unit
-> delete_connection_output

val make_delete_connection_input : connection_arn:string -> unit
-> delete_connection_input

val make_create_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> create_sync_configuration_output

val make_create_sync_configuration_input :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  sync_type:sync_configuration_type ->
  role_arn:string ->
  resource_name:string ->
  repository_link_id:string ->
  config_file:string ->
  branch:string ->
  unit
-> create_sync_configuration_input

val make_create_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> create_repository_link_output

val make_create_repository_link_input :
  ?tags:tag list ->
  ?encryption_key_arn:string ->
  repository_name:string ->
  owner_id:string ->
  connection_arn:string ->
  unit -> create_repository_link_input

val make_create_host_output : ?tags:tag list -> ?host_arn:string -> unit
-> create_host_output

val make_create_host_input :
  ?tags:tag list ->
  ?vpc_configuration:vpc_configuration ->
  provider_endpoint:string ->
  provider_type:provider_type ->
  name:string ->
  unit -> create_host_input

val make_create_connection_output :
  ?tags:tag list -> connection_arn:string -> unit
-> create_connection_output

val make_create_connection_input :
  ?host_arn:string ->
  ?tags:tag list ->
  ?provider_type:provider_type ->
  connection_name:string ->
  unit -> create_connection_input

module UpdateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sync_configuration_input ->
        (update_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `UpdateOutOfSyncException of update_out_of_sync_exception
            
        ]
      ) result
end

module UpdateSyncBlocker : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sync_blocker_input ->
        (update_sync_blocker_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `RetryLatestCommitFailedException of retry_latest_commit_failed_exception
            | `SyncBlockerDoesNotExistException of sync_blocker_does_not_exist_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module UpdateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      update_repository_link_input ->
        (update_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `UpdateOutOfSyncException of update_out_of_sync_exception
            
        ]
      ) result
end

module UpdateHost : sig
  val request :
    Smaws_Lib.Context.t ->
      update_host_input ->
        (update_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListSyncConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_sync_configurations_input ->
        (list_sync_configurations_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListRepositorySyncDefinitions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_sync_definitions_input ->
        (list_repository_sync_definitions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListRepositoryLinks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_links_input ->
        (list_repository_links_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListHosts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_hosts_input ->
        (list_hosts_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_input ->
        (list_connections_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sync_configuration_input ->
        (get_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetSyncBlockerSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sync_blocker_summary_input ->
        (get_sync_blocker_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetResourceSyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_sync_status_input ->
        (get_resource_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetRepositorySyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_sync_status_input ->
        (get_repository_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_link_input ->
        (get_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetHost : sig
  val request :
    Smaws_Lib.Context.t ->
      get_host_input ->
        (get_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module GetConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      get_connection_input ->
        (get_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module DeleteSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_sync_configuration_input ->
        (delete_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module DeleteRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_repository_link_input ->
        (delete_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `SyncConfigurationStillExistsException of sync_configuration_still_exists_exception
            | `ThrottlingException of throttling_exception
            | `UnsupportedProviderTypeException of unsupported_provider_type_exception
            
        ]
      ) result
end

module DeleteHost : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_host_input ->
        (delete_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_input ->
        (delete_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_sync_configuration_input ->
        (create_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module CreateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      create_repository_link_input ->
        (create_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module CreateHost : sig
  val request :
    Smaws_Lib.Context.t ->
      create_host_input ->
        (create_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_input ->
        (create_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

