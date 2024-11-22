open Smaws_Lib
let service =
  Service.{
    namespace = "mgh";
    endpointPrefix = "mgh";
    version = "2017-05-31";
    protocol = AwsJson_1_1
  };
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

