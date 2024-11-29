open Types
val make_task :
  ?progress_percent:int -> ?status_detail:string -> status:status -> unit
-> task
(** Create a {!type-task} type *)

val make_resource_attribute :
  value:string -> type_:resource_attribute_type -> unit
-> resource_attribute
(** Create a {!type-resource_attribute} type *)

val make_put_resource_attributes_request :
  ?dry_run:bool ->
  resource_attribute_list:resource_attribute list ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> put_resource_attributes_request
(** Create a {!type-put_resource_attributes_request} type *)

val make_progress_update_stream_summary :
  ?progress_update_stream_name:string -> unit
-> progress_update_stream_summary
(** Create a {!type-progress_update_stream_summary} type *)

val make_notify_migration_task_state_request :
  ?dry_run:bool ->
  next_update_seconds:int ->
  update_date_time:float ->
  task:task ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> notify_migration_task_state_request
(** Create a {!type-notify_migration_task_state_request} type *)

val make_notify_application_state_request :
  ?dry_run:bool ->
  ?update_date_time:float ->
  status:application_status ->
  application_id:string ->
  unit
-> notify_application_state_request
(** Create a {!type-notify_application_state_request} type *)

val make_migration_task_summary :
  ?update_date_time:float ->
  ?status_detail:string ->
  ?progress_percent:int ->
  ?status:status ->
  ?migration_task_name:string ->
  ?progress_update_stream:string ->
  unit
-> migration_task_summary
(** Create a {!type-migration_task_summary} type *)

val make_migration_task :
  ?resource_attribute_list:resource_attribute list ->
  ?update_date_time:float ->
  ?task:task ->
  ?migration_task_name:string ->
  ?progress_update_stream:string ->
  unit
-> migration_task
(** Create a {!type-migration_task} type *)

val make_list_progress_update_streams_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_progress_update_streams_request
(** Create a {!type-list_progress_update_streams_request} type *)

val make_list_migration_tasks_request :
  ?resource_name:string -> ?max_results:int -> ?next_token:string -> unit
-> list_migration_tasks_request
(** Create a {!type-list_migration_tasks_request} type *)

val make_discovered_resource :
  ?description:string -> configuration_id:string -> unit
-> discovered_resource
(** Create a {!type-discovered_resource} type *)

val make_list_discovered_resources_request :
  ?max_results:int ->
  ?next_token:string ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> list_discovered_resources_request
(** Create a {!type-list_discovered_resources_request} type *)

val make_created_artifact : ?description:string -> name:string -> unit
-> created_artifact
(** Create a {!type-created_artifact} type *)

val make_list_created_artifacts_request :
  ?max_results:int ->
  ?next_token:string ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> list_created_artifacts_request
(** Create a {!type-list_created_artifacts_request} type *)

val make_application_state :
  ?last_updated_time:float ->
  ?application_status:application_status ->
  ?application_id:string ->
  unit
-> application_state
(** Create a {!type-application_state} type *)

val make_list_application_states_request :
  ?max_results:int ->
  ?next_token:string ->
  ?application_ids:string list ->
  unit
-> list_application_states_request
(** Create a {!type-list_application_states_request} type *)

val make_import_migration_task_request :
  ?dry_run:bool ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> import_migration_task_request
(** Create a {!type-import_migration_task_request} type *)

val make_disassociate_discovered_resource_request :
  ?dry_run:bool ->
  configuration_id:string ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> disassociate_discovered_resource_request
(** Create a {!type-disassociate_discovered_resource_request} type *)

val make_disassociate_created_artifact_request :
  ?dry_run:bool ->
  created_artifact_name:string ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> disassociate_created_artifact_request
(** Create a {!type-disassociate_created_artifact_request} type *)

val make_describe_migration_task_request :
  migration_task_name:string -> progress_update_stream:string -> unit
-> describe_migration_task_request
(** Create a {!type-describe_migration_task_request} type *)

val make_describe_application_state_request : application_id:string -> unit
-> describe_application_state_request
(** Create a {!type-describe_application_state_request} type *)

val make_delete_progress_update_stream_request :
  ?dry_run:bool -> progress_update_stream_name:string -> unit
-> delete_progress_update_stream_request
(** Create a {!type-delete_progress_update_stream_request} type *)

val make_create_progress_update_stream_request :
  ?dry_run:bool -> progress_update_stream_name:string -> unit
-> create_progress_update_stream_request
(** Create a {!type-create_progress_update_stream_request} type *)

val make_associate_discovered_resource_request :
  ?dry_run:bool ->
  discovered_resource:discovered_resource ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> associate_discovered_resource_request
(** Create a {!type-associate_discovered_resource_request} type *)

val make_associate_created_artifact_request :
  ?dry_run:bool ->
  created_artifact:created_artifact ->
  migration_task_name:string ->
  progress_update_stream:string ->
  unit
-> associate_created_artifact_request
(** Create a {!type-associate_created_artifact_request} type *)

