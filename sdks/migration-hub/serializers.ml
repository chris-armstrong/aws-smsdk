open Smaws_Lib.Json.SerializeHelpers

open Types

let update_date_time_to_yojson = timestamp_to_yojson

let error_message_to_yojson = string_to_yojson

let unauthorized_operation_to_yojson = 
  fun (x: unauthorized_operation) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let token_to_yojson = string_to_yojson

let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson = 
  fun (x: throttling_exception) -> assoc_to_yojson(
    [(
         "RetryAfterSeconds",
         (option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds));
       (
         "Message",
         (Some (error_message_to_yojson x.message)));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let status_to_yojson = 
  fun (x: status) -> match x with 
 
| COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | NOT_STARTED -> `String "NOT_STARTED"
   

let status_detail_to_yojson = string_to_yojson

let progress_percent_to_yojson = int_to_yojson

let task_to_yojson = 
  fun (x: task) -> assoc_to_yojson(
    [(
         "ProgressPercent",
         (option_to_yojson progress_percent_to_yojson x.progress_percent));
       (
         "StatusDetail",
         (option_to_yojson status_detail_to_yojson x.status_detail));
       (
         "Status",
         (Some (status_to_yojson x.status)));
       
  ])

let service_unavailable_exception_to_yojson = 
  fun (x: service_unavailable_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_name_to_yojson = string_to_yojson

let resource_attribute_value_to_yojson = string_to_yojson

let resource_attribute_type_to_yojson = 
  fun (x: resource_attribute_type) -> match x with 
 
| MOTHERBOARD_SERIAL_NUMBER -> `String "MOTHERBOARD_SERIAL_NUMBER"
  | BIOS_ID -> `String "BIOS_ID"
  | VM_PATH -> `String "VM_PATH"
  | VM_NAME -> `String "VM_NAME"
  | VM_MANAGED_OBJECT_REFERENCE -> `String "VM_MANAGED_OBJECT_REFERENCE"
  | VM_MANAGER_ID -> `String "VM_MANAGER_ID"
  | FQDN -> `String "FQDN"
  | MAC_ADDRESS -> `String "MAC_ADDRESS"
  | IPV6_ADDRESS -> `String "IPV6_ADDRESS"
  | IPV4_ADDRESS -> `String "IPV4_ADDRESS"
   

let resource_attribute_to_yojson = 
  fun (x: resource_attribute) -> assoc_to_yojson(
    [(
         "Value",
         (Some (resource_attribute_value_to_yojson x.value)));
       (
         "Type",
         (Some (resource_attribute_type_to_yojson x.type_)));
       
  ])

let resource_attribute_list_to_yojson = 
  fun tree -> list_to_yojson resource_attribute_to_yojson tree

let put_resource_attributes_result_to_yojson = 
  fun (x: put_resource_attributes_result) -> assoc_to_yojson(
    [
  ])

let progress_update_stream_to_yojson = string_to_yojson

let migration_task_name_to_yojson = string_to_yojson

let dry_run_to_yojson = bool_to_yojson

let put_resource_attributes_request_to_yojson = 
  fun (x: put_resource_attributes_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "ResourceAttributeList",
         (Some (resource_attribute_list_to_yojson x.resource_attribute_list)));
       (
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let invalid_input_exception_to_yojson = 
  fun (x: invalid_input_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let internal_server_error_to_yojson = 
  fun (x: internal_server_error) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let home_region_not_set_exception_to_yojson = 
  fun (x: home_region_not_set_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let dry_run_operation_to_yojson = 
  fun (x: dry_run_operation) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let progress_update_stream_summary_to_yojson = 
  fun (x: progress_update_stream_summary) -> assoc_to_yojson(
    [(
         "ProgressUpdateStreamName",
         (option_to_yojson progress_update_stream_to_yojson x.progress_update_stream_name));
       
  ])

let progress_update_stream_summary_list_to_yojson = 
  fun tree -> list_to_yojson progress_update_stream_summary_to_yojson tree

let policy_error_exception_to_yojson = 
  fun (x: policy_error_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let notify_migration_task_state_result_to_yojson = 
  fun (x: notify_migration_task_state_result) -> assoc_to_yojson(
    [
  ])

let next_update_seconds_to_yojson = int_to_yojson

let notify_migration_task_state_request_to_yojson = 
  fun (x: notify_migration_task_state_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "NextUpdateSeconds",
         (Some (next_update_seconds_to_yojson x.next_update_seconds)));
       (
         "UpdateDateTime",
         (Some (update_date_time_to_yojson x.update_date_time)));
       (
         "Task",
         (Some (task_to_yojson x.task)));
       (
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let notify_application_state_result_to_yojson = 
  fun (x: notify_application_state_result) -> assoc_to_yojson(
    [
  ])

let application_id_to_yojson = string_to_yojson

let application_status_to_yojson = 
  fun (x: application_status) -> match x with 
 
| COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | NOT_STARTED -> `String "NOT_STARTED"
   

let notify_application_state_request_to_yojson = 
  fun (x: notify_application_state_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "UpdateDateTime",
         (option_to_yojson update_date_time_to_yojson x.update_date_time));
       (
         "Status",
         (Some (application_status_to_yojson x.status)));
       (
         "ApplicationId",
         (Some (application_id_to_yojson x.application_id)));
       
  ])

let migration_task_summary_to_yojson = 
  fun (x: migration_task_summary) -> assoc_to_yojson(
    [(
         "UpdateDateTime",
         (option_to_yojson update_date_time_to_yojson x.update_date_time));
       (
         "StatusDetail",
         (option_to_yojson status_detail_to_yojson x.status_detail));
       (
         "ProgressPercent",
         (option_to_yojson progress_percent_to_yojson x.progress_percent));
       (
         "Status",
         (option_to_yojson status_to_yojson x.status));
       (
         "MigrationTaskName",
         (option_to_yojson migration_task_name_to_yojson x.migration_task_name));
       (
         "ProgressUpdateStream",
         (option_to_yojson progress_update_stream_to_yojson x.progress_update_stream));
       
  ])

let migration_task_summary_list_to_yojson = 
  fun tree -> list_to_yojson migration_task_summary_to_yojson tree

let latest_resource_attribute_list_to_yojson = 
  fun tree -> list_to_yojson resource_attribute_to_yojson tree

let migration_task_to_yojson = 
  fun (x: migration_task) -> assoc_to_yojson(
    [(
         "ResourceAttributeList",
         (option_to_yojson latest_resource_attribute_list_to_yojson x.resource_attribute_list));
       (
         "UpdateDateTime",
         (option_to_yojson update_date_time_to_yojson x.update_date_time));
       (
         "Task",
         (option_to_yojson task_to_yojson x.task));
       (
         "MigrationTaskName",
         (option_to_yojson migration_task_name_to_yojson x.migration_task_name));
       (
         "ProgressUpdateStream",
         (option_to_yojson progress_update_stream_to_yojson x.progress_update_stream));
       
  ])

let max_results_resources_to_yojson = int_to_yojson

let max_results_created_artifacts_to_yojson = int_to_yojson

let max_results_to_yojson = int_to_yojson

let list_progress_update_streams_result_to_yojson = 
  fun (x: list_progress_update_streams_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "ProgressUpdateStreamSummaryList",
         (option_to_yojson progress_update_stream_summary_list_to_yojson x.progress_update_stream_summary_list));
       
  ])

let list_progress_update_streams_request_to_yojson = 
  fun (x: list_progress_update_streams_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       
  ])

let list_migration_tasks_result_to_yojson = 
  fun (x: list_migration_tasks_result) -> assoc_to_yojson(
    [(
         "MigrationTaskSummaryList",
         (option_to_yojson migration_task_summary_list_to_yojson x.migration_task_summary_list));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       
  ])

let list_migration_tasks_request_to_yojson = 
  fun (x: list_migration_tasks_request) -> assoc_to_yojson(
    [(
         "ResourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       
  ])

let configuration_id_to_yojson = string_to_yojson

let discovered_resource_description_to_yojson = string_to_yojson

let discovered_resource_to_yojson = 
  fun (x: discovered_resource) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson discovered_resource_description_to_yojson x.description));
       (
         "ConfigurationId",
         (Some (configuration_id_to_yojson x.configuration_id)));
       
  ])

let discovered_resource_list_to_yojson = 
  fun tree -> list_to_yojson discovered_resource_to_yojson tree

let list_discovered_resources_result_to_yojson = 
  fun (x: list_discovered_resources_result) -> assoc_to_yojson(
    [(
         "DiscoveredResourceList",
         (option_to_yojson discovered_resource_list_to_yojson x.discovered_resource_list));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       
  ])

let list_discovered_resources_request_to_yojson = 
  fun (x: list_discovered_resources_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_resources_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let created_artifact_name_to_yojson = string_to_yojson

let created_artifact_description_to_yojson = string_to_yojson

let created_artifact_to_yojson = 
  fun (x: created_artifact) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson created_artifact_description_to_yojson x.description));
       (
         "Name",
         (Some (created_artifact_name_to_yojson x.name)));
       
  ])

let created_artifact_list_to_yojson = 
  fun tree -> list_to_yojson created_artifact_to_yojson tree

let list_created_artifacts_result_to_yojson = 
  fun (x: list_created_artifacts_result) -> assoc_to_yojson(
    [(
         "CreatedArtifactList",
         (option_to_yojson created_artifact_list_to_yojson x.created_artifact_list));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       
  ])

let list_created_artifacts_request_to_yojson = 
  fun (x: list_created_artifacts_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_created_artifacts_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let application_state_to_yojson = 
  fun (x: application_state) -> assoc_to_yojson(
    [(
         "LastUpdatedTime",
         (option_to_yojson update_date_time_to_yojson x.last_updated_time));
       (
         "ApplicationStatus",
         (option_to_yojson application_status_to_yojson x.application_status));
       (
         "ApplicationId",
         (option_to_yojson application_id_to_yojson x.application_id));
       
  ])

let application_state_list_to_yojson = 
  fun tree -> list_to_yojson application_state_to_yojson tree

let list_application_states_result_to_yojson = 
  fun (x: list_application_states_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "ApplicationStateList",
         (option_to_yojson application_state_list_to_yojson x.application_state_list));
       
  ])

let application_ids_to_yojson = 
  fun tree -> list_to_yojson application_id_to_yojson tree

let list_application_states_request_to_yojson = 
  fun (x: list_application_states_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "ApplicationIds",
         (option_to_yojson application_ids_to_yojson x.application_ids));
       
  ])

let import_migration_task_result_to_yojson = 
  fun (x: import_migration_task_result) -> assoc_to_yojson(
    [
  ])

let import_migration_task_request_to_yojson = 
  fun (x: import_migration_task_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let disassociate_discovered_resource_result_to_yojson = 
  fun (x: disassociate_discovered_resource_result) -> assoc_to_yojson(
    [
  ])

let disassociate_discovered_resource_request_to_yojson = 
  fun (x: disassociate_discovered_resource_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "ConfigurationId",
         (Some (configuration_id_to_yojson x.configuration_id)));
       (
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let disassociate_created_artifact_result_to_yojson = 
  fun (x: disassociate_created_artifact_result) -> assoc_to_yojson(
    [
  ])

let disassociate_created_artifact_request_to_yojson = 
  fun (x: disassociate_created_artifact_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "CreatedArtifactName",
         (Some (created_artifact_name_to_yojson x.created_artifact_name)));
       (
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let describe_migration_task_result_to_yojson = 
  fun (x: describe_migration_task_result) -> assoc_to_yojson(
    [(
         "MigrationTask",
         (option_to_yojson migration_task_to_yojson x.migration_task));
       
  ])

let describe_migration_task_request_to_yojson = 
  fun (x: describe_migration_task_request) -> assoc_to_yojson(
    [(
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let describe_application_state_result_to_yojson = 
  fun (x: describe_application_state_result) -> assoc_to_yojson(
    [(
         "LastUpdatedTime",
         (option_to_yojson update_date_time_to_yojson x.last_updated_time));
       (
         "ApplicationStatus",
         (option_to_yojson application_status_to_yojson x.application_status));
       
  ])

let describe_application_state_request_to_yojson = 
  fun (x: describe_application_state_request) -> assoc_to_yojson(
    [(
         "ApplicationId",
         (Some (application_id_to_yojson x.application_id)));
       
  ])

let delete_progress_update_stream_result_to_yojson = 
  fun (x: delete_progress_update_stream_result) -> assoc_to_yojson(
    [
  ])

let delete_progress_update_stream_request_to_yojson = 
  fun (x: delete_progress_update_stream_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "ProgressUpdateStreamName",
         (Some (progress_update_stream_to_yojson x.progress_update_stream_name)));
       
  ])

let create_progress_update_stream_result_to_yojson = 
  fun (x: create_progress_update_stream_result) -> assoc_to_yojson(
    [
  ])

let create_progress_update_stream_request_to_yojson = 
  fun (x: create_progress_update_stream_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "ProgressUpdateStreamName",
         (Some (progress_update_stream_to_yojson x.progress_update_stream_name)));
       
  ])

let associate_discovered_resource_result_to_yojson = 
  fun (x: associate_discovered_resource_result) -> assoc_to_yojson(
    [
  ])

let associate_discovered_resource_request_to_yojson = 
  fun (x: associate_discovered_resource_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "DiscoveredResource",
         (Some (discovered_resource_to_yojson x.discovered_resource)));
       (
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let associate_created_artifact_result_to_yojson = 
  fun (x: associate_created_artifact_result) -> assoc_to_yojson(
    [
  ])

let associate_created_artifact_request_to_yojson = 
  fun (x: associate_created_artifact_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "CreatedArtifact",
         (Some (created_artifact_to_yojson x.created_artifact)));
       (
         "MigrationTaskName",
         (Some (migration_task_name_to_yojson x.migration_task_name)));
       (
         "ProgressUpdateStream",
         (Some (progress_update_stream_to_yojson x.progress_update_stream)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

