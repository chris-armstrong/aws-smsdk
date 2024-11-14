open Smaws_Lib
val service : Service.descriptor

type unauthorized_operation = {
  message: string option
}

type throttling_exception = {
  retry_after_seconds: int option;
  message: string
}

type status = | COMPLETED
  | FAILED
  | IN_PROGRESS
  | NOT_STARTED

type task = {
  progress_percent: int option;
  status_detail: string option;
  status: status
}

type service_unavailable_exception = {
  message: string option
}

type resource_not_found_exception = {
  message: string option
}

type resource_attribute_type = | MOTHERBOARD_SERIAL_NUMBER
  | BIOS_ID
  | VM_PATH
  | VM_NAME
  | VM_MANAGED_OBJECT_REFERENCE
  | VM_MANAGER_ID
  | FQDN
  | MAC_ADDRESS
  | IPV6_ADDRESS
  | IPV4_ADDRESS

type resource_attribute = {
  value: string;
  type_: resource_attribute_type
}

type put_resource_attributes_result = unit

type put_resource_attributes_request = {
  dry_run: bool option;
  resource_attribute_list: resource_attribute list;
  migration_task_name: string;
  progress_update_stream: string
}

type invalid_input_exception = {
  message: string option
}

type internal_server_error = {
  message: string option
}

type home_region_not_set_exception = {
  message: string option
}

type dry_run_operation = {
  message: string option
}

type access_denied_exception = {
  message: string option
}

type progress_update_stream_summary = {
  progress_update_stream_name: string option
}

type policy_error_exception = {
  message: string option
}

type notify_migration_task_state_result = unit

type notify_migration_task_state_request = {
  dry_run: bool option;
  next_update_seconds: int;
  update_date_time: float;
  task: task;
  migration_task_name: string;
  progress_update_stream: string
}

type notify_application_state_result = unit

type application_status = | COMPLETED
  | IN_PROGRESS
  | NOT_STARTED

type notify_application_state_request = {
  dry_run: bool option;
  update_date_time: float option;
  status: application_status;
  application_id: string
}

type migration_task_summary = {
  update_date_time: float option;
  status_detail: string option;
  progress_percent: int option;
  status: status option;
  migration_task_name: string option;
  progress_update_stream: string option
}

type migration_task = {
  resource_attribute_list: resource_attribute list option;
  update_date_time: float option;
  task: task option;
  migration_task_name: string option;
  progress_update_stream: string option
}

type list_progress_update_streams_result = {
  next_token: string option;
  progress_update_stream_summary_list: progress_update_stream_summary list option
}

type list_progress_update_streams_request = {
  max_results: int option;
  next_token: string option
}

type list_migration_tasks_result = {
  migration_task_summary_list: migration_task_summary list option;
  next_token: string option
}

type list_migration_tasks_request = {
  resource_name: string option;
  max_results: int option;
  next_token: string option
}

type discovered_resource = {
  description: string option;
  configuration_id: string
}

type list_discovered_resources_result = {
  discovered_resource_list: discovered_resource list option;
  next_token: string option
}

type list_discovered_resources_request = {
  max_results: int option;
  next_token: string option;
  migration_task_name: string;
  progress_update_stream: string
}

type created_artifact = {
  description: string option;
  name: string
}

type list_created_artifacts_result = {
  created_artifact_list: created_artifact list option;
  next_token: string option
}

type list_created_artifacts_request = {
  max_results: int option;
  next_token: string option;
  migration_task_name: string;
  progress_update_stream: string
}

type application_state = {
  last_updated_time: float option;
  application_status: application_status option;
  application_id: string option
}

type list_application_states_result = {
  next_token: string option;
  application_state_list: application_state list option
}

type list_application_states_request = {
  max_results: int option;
  next_token: string option;
  application_ids: string list option
}

type import_migration_task_result = unit

type import_migration_task_request = {
  dry_run: bool option;
  migration_task_name: string;
  progress_update_stream: string
}

type disassociate_discovered_resource_result = unit

type disassociate_discovered_resource_request = {
  dry_run: bool option;
  configuration_id: string;
  migration_task_name: string;
  progress_update_stream: string
}

type disassociate_created_artifact_result = unit

type disassociate_created_artifact_request = {
  dry_run: bool option;
  created_artifact_name: string;
  migration_task_name: string;
  progress_update_stream: string
}

type describe_migration_task_result = {
  migration_task: migration_task option
}

type describe_migration_task_request = {
  migration_task_name: string;
  progress_update_stream: string
}

type describe_application_state_result = {
  last_updated_time: float option;
  application_status: application_status option
}

type describe_application_state_request = {
  application_id: string
}

type delete_progress_update_stream_result = unit

type delete_progress_update_stream_request = {
  dry_run: bool option;
  progress_update_stream_name: string
}

type create_progress_update_stream_result = unit

type create_progress_update_stream_request = {
  dry_run: bool option;
  progress_update_stream_name: string
}

type associate_discovered_resource_result = unit

type associate_discovered_resource_request = {
  dry_run: bool option;
  discovered_resource: discovered_resource;
  migration_task_name: string;
  progress_update_stream: string
}

type associate_created_artifact_result = unit

type associate_created_artifact_request = {
  dry_run: bool option;
  created_artifact: created_artifact;
  migration_task_name: string;
  progress_update_stream: string
}



type base_document = Json.t

val make_task :
  ?progress_percent:int -> ?status_detail:string -> status:status -> unit
-> task

val make_resource_attribute :
  value:string -> type_:resource_attribute_type -> unit
-> resource_attribute

val make_put_resource_attributes_result : unit
-> put_resource_attributes_result

val make_put_resource_attributes_request :
  ?dry_run:bool ->
  resource_attribute_list:resource_attribute list ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> put_resource_attributes_request

val make_progress_update_stream_summary :
  ?progress_update_stream_name:string -> unit
-> progress_update_stream_summary

val make_notify_migration_task_state_result : unit
-> notify_migration_task_state_result

val make_notify_migration_task_state_request :
  ?dry_run:bool ->
  next_update_seconds:int ->
  update_date_time:float ->
  task:task ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> notify_migration_task_state_request

val make_notify_application_state_result : unit
-> notify_application_state_result

val make_notify_application_state_request :
  ?dry_run:bool ->
  ?update_date_time:float ->
  status:application_status ->
  application_id:string ->
  unit -> notify_application_state_request

val make_migration_task_summary :
  ?update_date_time:float ->
  ?status_detail:string ->
  ?progress_percent:int ->
  ?status:status ->
  ?migration_task_name:string ->
  ?progress_update_stream:string ->
  unit -> migration_task_summary

val make_migration_task :
  ?resource_attribute_list:resource_attribute list ->
  ?update_date_time:float ->
  ?task:task ->
  ?migration_task_name:string ->
  ?progress_update_stream:string ->
  unit -> migration_task

val make_list_progress_update_streams_result :
  ?next_token:string ->
  ?progress_update_stream_summary_list:progress_update_stream_summary list ->
  unit
-> list_progress_update_streams_result

val make_list_progress_update_streams_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_progress_update_streams_request

val make_list_migration_tasks_result :
  ?migration_task_summary_list:migration_task_summary list ->
  ?next_token:string ->
  unit -> list_migration_tasks_result

val make_list_migration_tasks_request :
  ?resource_name:string -> ?max_results:int -> ?next_token:string -> unit
-> list_migration_tasks_request

val make_discovered_resource :
  ?description:string -> configuration_id:string -> unit
-> discovered_resource

val make_list_discovered_resources_result :
  ?discovered_resource_list:discovered_resource list ->
  ?next_token:string ->
  unit
-> list_discovered_resources_result

val make_list_discovered_resources_request :
  ?max_results:int ->
  ?next_token:string ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit -> list_discovered_resources_request

val make_created_artifact : ?description:string -> name:string -> unit
-> created_artifact

val make_list_created_artifacts_result :
  ?created_artifact_list:created_artifact list -> ?next_token:string -> unit
-> list_created_artifacts_result

val make_list_created_artifacts_request :
  ?max_results:int ->
  ?next_token:string ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit -> list_created_artifacts_request

val make_application_state :
  ?last_updated_time:float ->
  ?application_status:application_status ->
  ?application_id:string ->
  unit -> application_state

val make_list_application_states_result :
  ?next_token:string ->
  ?application_state_list:application_state list ->
  unit
-> list_application_states_result

val make_list_application_states_request :
  ?max_results:int ->
  ?next_token:string ->
  ?application_ids:string list ->
  unit
-> list_application_states_request

val make_import_migration_task_result : unit
-> import_migration_task_result

val make_import_migration_task_request :
  ?dry_run:bool ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> import_migration_task_request

val make_disassociate_discovered_resource_result : unit
-> disassociate_discovered_resource_result

val make_disassociate_discovered_resource_request :
  ?dry_run:bool ->
  configuration_id:string ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> disassociate_discovered_resource_request

val make_disassociate_created_artifact_result : unit
-> disassociate_created_artifact_result

val make_disassociate_created_artifact_request :
  ?dry_run:bool ->
  created_artifact_name:string ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> disassociate_created_artifact_request

val make_describe_migration_task_result :
  ?migration_task:migration_task -> unit
-> describe_migration_task_result

val make_describe_migration_task_request :
  migration_task_name:string -> progress_update_stream:string -> unit
-> describe_migration_task_request

val make_describe_application_state_result :
  ?last_updated_time:float -> ?application_status:application_status -> unit
-> describe_application_state_result

val make_describe_application_state_request : application_id:string -> unit
-> describe_application_state_request

val make_delete_progress_update_stream_result : unit
-> delete_progress_update_stream_result

val make_delete_progress_update_stream_request :
  ?dry_run:bool -> progress_update_stream_name:string -> unit
-> delete_progress_update_stream_request

val make_create_progress_update_stream_result : unit
-> create_progress_update_stream_result

val make_create_progress_update_stream_request :
  ?dry_run:bool -> progress_update_stream_name:string -> unit
-> create_progress_update_stream_request

val make_associate_discovered_resource_result : unit
-> associate_discovered_resource_result

val make_associate_discovered_resource_request :
  ?dry_run:bool ->
  discovered_resource:discovered_resource ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> associate_discovered_resource_request

val make_associate_created_artifact_result : unit
-> associate_created_artifact_result

val make_associate_created_artifact_request :
  ?dry_run:bool ->
  created_artifact:created_artifact ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> associate_created_artifact_request

module PutResourceAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_attributes_request ->
        (put_resource_attributes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

module NotifyMigrationTaskState : sig
  val request :
    Smaws_Lib.Context.t ->
      notify_migration_task_state_request ->
        (notify_migration_task_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

module NotifyApplicationState : sig
  val request :
    Smaws_Lib.Context.t ->
      notify_application_state_request ->
        (notify_application_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `PolicyErrorException of policy_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

module ListProgressUpdateStreams : sig
  val request :
    Smaws_Lib.Context.t ->
      list_progress_update_streams_request ->
        (list_progress_update_streams_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListMigrationTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_migration_tasks_request ->
        (list_migration_tasks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `PolicyErrorException of policy_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListCreatedArtifacts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_created_artifacts_request ->
        (list_created_artifacts_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListApplicationStates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_application_states_request ->
        (list_application_states_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ImportMigrationTask : sig
  val request :
    Smaws_Lib.Context.t ->
      import_migration_task_request ->
        (import_migration_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

module DisassociateDiscoveredResource : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_discovered_resource_request ->
        (disassociate_discovered_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

module DisassociateCreatedArtifact : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_created_artifact_request ->
        (disassociate_created_artifact_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

module DescribeMigrationTask : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_migration_task_request ->
        (describe_migration_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module DescribeApplicationState : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_application_state_request ->
        (describe_application_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `PolicyErrorException of policy_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module DeleteProgressUpdateStream : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_progress_update_stream_request ->
        (delete_progress_update_stream_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

module CreateProgressUpdateStream : sig
  val request :
    Smaws_Lib.Context.t ->
      create_progress_update_stream_request ->
        (create_progress_update_stream_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

module AssociateDiscoveredResource : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_discovered_resource_request ->
        (associate_discovered_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `PolicyErrorException of policy_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

module AssociateCreatedArtifact : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_created_artifact_request ->
        (associate_created_artifact_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `DryRunOperation of dry_run_operation
            | `HomeRegionNotSetException of home_region_not_set_exception
            | `InternalServerError of internal_server_error
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `UnauthorizedOperation of unauthorized_operation
            
        ]
      ) result
end

