[@@@warning "-39"]
open Types
let make_task 
  ?(progress_percent : int option)
  ?(status_detail : string option)
  ~(status : status)
  () : task = { progress_percent; status_detail; status; 
}

let make_resource_attribute 
  ~(value : string) ~(type_ : resource_attribute_type) ()
: resource_attribute = { value; type_; 
}

let make_put_resource_attributes_request 
  ?(dry_run : bool option)
  ~(resource_attribute_list : resource_attribute list)
  ~(migration_task_name : string)
  ~(progress_update_stream : string)
  () : put_resource_attributes_request = {
  dry_run;
  resource_attribute_list;
  migration_task_name;
  progress_update_stream;
   }

let make_progress_update_stream_summary 
  ?(progress_update_stream_name : string option) ()
: progress_update_stream_summary = { progress_update_stream_name; 
}

let make_notify_migration_task_state_request 
  ?(dry_run : bool option)
  ~(next_update_seconds : int)
  ~(update_date_time : float)
  ~(task : task)
  ~(migration_task_name : string)
  ~(progress_update_stream : string)
  () : notify_migration_task_state_request = {
  dry_run;
  next_update_seconds;
  update_date_time;
  task;
  migration_task_name;
  progress_update_stream;
   }

let make_notify_application_state_request 
  ?(dry_run : bool option)
  ?(update_date_time : float option)
  ~(status : application_status)
  ~(application_id : string)
  () : notify_application_state_request = {
  dry_run; update_date_time; status; application_id; 
}

let make_migration_task_summary 
  ?(update_date_time : float option)
  ?(status_detail : string option)
  ?(progress_percent : int option)
  ?(status : status option)
  ?(migration_task_name : string option)
  ?(progress_update_stream : string option)
  () : migration_task_summary = {
  update_date_time;
  status_detail;
  progress_percent;
  status;
  migration_task_name;
  progress_update_stream;
   }

let make_migration_task 
  ?(resource_attribute_list : resource_attribute list option)
  ?(update_date_time : float option)
  ?(task : task option)
  ?(migration_task_name : string option)
  ?(progress_update_stream : string option)
  () : migration_task = {
  resource_attribute_list;
  update_date_time;
  task;
  migration_task_name;
  progress_update_stream;
   }

let make_list_progress_update_streams_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_progress_update_streams_request = { max_results; next_token; 
}

let make_list_migration_tasks_request 
  ?(resource_name : string option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_migration_tasks_request = {
  resource_name; max_results; next_token;  }

let make_discovered_resource 
  ?(description : string option) ~(configuration_id : string) ()
: discovered_resource = { description; configuration_id; 
}

let make_list_discovered_resources_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(migration_task_name : string)
  ~(progress_update_stream : string)
  () : list_discovered_resources_request = {
  max_results; next_token; migration_task_name; progress_update_stream; 
}

let make_created_artifact  ?(description : string option) ~(name : string) ()
: created_artifact = { description; name; 
}

let make_list_created_artifacts_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(migration_task_name : string)
  ~(progress_update_stream : string)
  () : list_created_artifacts_request = {
  max_results; next_token; migration_task_name; progress_update_stream; 
}

let make_application_state 
  ?(last_updated_time : float option)
  ?(application_status : application_status option)
  ?(application_id : string option)
  () : application_state = {
  last_updated_time; application_status; application_id; 
}

let make_list_application_states_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(application_ids : string list option)
  () : list_application_states_request = {
  max_results; next_token; application_ids; 
}

let make_import_migration_task_request 
  ?(dry_run : bool option)
  ~(migration_task_name : string)
  ~(progress_update_stream : string)
  () : import_migration_task_request = {
  dry_run; migration_task_name; progress_update_stream; 
}

let make_disassociate_discovered_resource_request 
  ?(dry_run : bool option)
  ~(configuration_id : string)
  ~(migration_task_name : string)
  ~(progress_update_stream : string)
  () : disassociate_discovered_resource_request = {
  dry_run; configuration_id; migration_task_name; progress_update_stream; 
}

let make_disassociate_created_artifact_request 
  ?(dry_run : bool option)
  ~(created_artifact_name : string)
  ~(migration_task_name : string)
  ~(progress_update_stream : string)
  () : disassociate_created_artifact_request = {
  dry_run;
  created_artifact_name;
  migration_task_name;
  progress_update_stream;
   }

let make_describe_migration_task_request 
  ~(migration_task_name : string) ~(progress_update_stream : string) ()
: describe_migration_task_request = {
  migration_task_name; progress_update_stream; 
}

let make_describe_application_state_request  ~(application_id : string) ()
: describe_application_state_request = { application_id; 
}

let make_delete_progress_update_stream_request 
  ?(dry_run : bool option) ~(progress_update_stream_name : string) ()
: delete_progress_update_stream_request = {
  dry_run; progress_update_stream_name; 
}

let make_create_progress_update_stream_request 
  ?(dry_run : bool option) ~(progress_update_stream_name : string) ()
: create_progress_update_stream_request = {
  dry_run; progress_update_stream_name; 
}

let make_associate_discovered_resource_request 
  ?(dry_run : bool option)
  ~(discovered_resource : discovered_resource)
  ~(migration_task_name : string)
  ~(progress_update_stream : string)
  () : associate_discovered_resource_request = {
  dry_run; discovered_resource; migration_task_name; progress_update_stream; 
}

let make_associate_created_artifact_request 
  ?(dry_run : bool option)
  ~(created_artifact : created_artifact)
  ~(migration_task_name : string)
  ~(progress_update_stream : string)
  () : associate_created_artifact_request = {
  dry_run; created_artifact; migration_task_name; progress_update_stream; 
}

