open Types
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

