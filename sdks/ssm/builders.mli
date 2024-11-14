open Types
val make_update_service_setting_result : unit
-> update_service_setting_result

val make_update_service_setting_request :
  setting_value:string -> setting_id:string -> unit
-> update_service_setting_request

val make_update_resource_data_sync_result : unit
-> update_resource_data_sync_result

val make_resource_data_sync_organizational_unit :
  ?organizational_unit_id:string -> unit
-> resource_data_sync_organizational_unit

val make_resource_data_sync_aws_organizations_source :
  ?organizational_units:resource_data_sync_organizational_unit list ->
  organization_source_type:string ->
  unit
-> resource_data_sync_aws_organizations_source

val make_resource_data_sync_source :
  ?enable_all_ops_data_sources:bool ->
  ?include_future_regions:bool ->
  ?aws_organizations_source:resource_data_sync_aws_organizations_source ->
  source_regions:string list ->
  source_type:string ->
  unit
-> resource_data_sync_source

val make_update_resource_data_sync_request :
  sync_source:resource_data_sync_source ->
  sync_type:string ->
  sync_name:string ->
  unit -> update_resource_data_sync_request

val make_patch_filter : values:string list -> key:patch_filter_key -> unit
-> patch_filter

val make_patch_filter_group : patch_filters:patch_filter list -> unit
-> patch_filter_group

val make_patch_rule :
  ?enable_non_security:bool ->
  ?approve_until_date:string ->
  ?approve_after_days:int ->
  ?compliance_level:patch_compliance_level ->
  patch_filter_group:patch_filter_group ->
  unit -> patch_rule

val make_patch_rule_group : patch_rules:patch_rule list -> unit
-> patch_rule_group

val make_patch_source :
  configuration:string -> products:string list -> name:string -> unit
-> patch_source

val make_update_patch_baseline_result :
  ?sources:patch_source list ->
  ?description:string ->
  ?modified_date:float ->
  ?created_date:float ->
  ?rejected_patches_action:patch_action ->
  ?rejected_patches:string list ->
  ?approved_patches_enable_non_security:bool ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches:string list ->
  ?approval_rules:patch_rule_group ->
  ?global_filters:patch_filter_group ->
  ?operating_system:operating_system ->
  ?name:string ->
  ?baseline_id:string ->
  unit
-> update_patch_baseline_result

val make_update_patch_baseline_request :
  ?replace:bool ->
  ?sources:patch_source list ->
  ?description:string ->
  ?rejected_patches_action:patch_action ->
  ?rejected_patches:string list ->
  ?approved_patches_enable_non_security:bool ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches:string list ->
  ?approval_rules:patch_rule_group ->
  ?global_filters:patch_filter_group ->
  ?name:string ->
  baseline_id:string ->
  unit -> update_patch_baseline_request

val make_update_ops_metadata_result : ?ops_metadata_arn:string -> unit
-> update_ops_metadata_result

val make_metadata_value : ?value:string -> unit
-> metadata_value

val make_update_ops_metadata_request :
  ?keys_to_delete:string list ->
  ?metadata_to_update:(string * metadata_value) list ->
  ops_metadata_arn:string ->
  unit -> update_ops_metadata_request

val make_update_ops_item_response : unit
-> update_ops_item_response

val make_ops_item_data_value :
  ?type_:ops_item_data_type -> ?value:string -> unit
-> ops_item_data_value

val make_ops_item_notification : ?arn:string -> unit
-> ops_item_notification

val make_related_ops_item : ops_item_id:string -> unit
-> related_ops_item

val make_update_ops_item_request :
  ?ops_item_arn:string ->
  ?planned_end_time:float ->
  ?planned_start_time:float ->
  ?actual_end_time:float ->
  ?actual_start_time:float ->
  ?severity:string ->
  ?category:string ->
  ?title:string ->
  ?status:ops_item_status ->
  ?related_ops_items:related_ops_item list ->
  ?priority:int ->
  ?notifications:ops_item_notification list ->
  ?operational_data_to_delete:string list ->
  ?operational_data:(string * ops_item_data_value) list ->
  ?description:string ->
  ops_item_id:string ->
  unit
-> update_ops_item_request

val make_update_managed_instance_role_result : unit
-> update_managed_instance_role_result

val make_update_managed_instance_role_request :
  iam_role:string -> instance_id:string -> unit
-> update_managed_instance_role_request

val make_target : ?values:string list -> ?key:string -> unit
-> target

val make_maintenance_window_task_parameter_value_expression :
  ?values:string list -> unit
-> maintenance_window_task_parameter_value_expression

val make_cloud_watch_output_config :
  ?cloud_watch_output_enabled:bool ->
  ?cloud_watch_log_group_name:string ->
  unit -> cloud_watch_output_config

val make_notification_config :
  ?notification_type:notification_type ->
  ?notification_events:notification_event list ->
  ?notification_arn:string ->
  unit
-> notification_config

val make_maintenance_window_run_command_parameters :
  ?timeout_seconds:int ->
  ?service_role_arn:string ->
  ?parameters:(string * string list) list ->
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?notification_config:notification_config ->
  ?document_version:string ->
  ?document_hash_type:document_hash_type ->
  ?document_hash:string ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?comment:string ->
  unit
-> maintenance_window_run_command_parameters

val make_maintenance_window_automation_parameters :
  ?parameters:(string * string list) list -> ?document_version:string -> unit
-> maintenance_window_automation_parameters

val make_maintenance_window_step_functions_parameters :
  ?name:string -> ?input:string -> unit
-> maintenance_window_step_functions_parameters

val make_maintenance_window_lambda_parameters :
  ?payload:bytes -> ?qualifier:string -> ?client_context:string -> unit
-> maintenance_window_lambda_parameters

val make_maintenance_window_task_invocation_parameters :
  ?lambda:maintenance_window_lambda_parameters ->
  ?step_functions:maintenance_window_step_functions_parameters ->
  ?automation:maintenance_window_automation_parameters ->
  ?run_command:maintenance_window_run_command_parameters ->
  unit
-> maintenance_window_task_invocation_parameters

val make_logging_info :
  ?s3_key_prefix:string -> s3_region:string -> s3_bucket_name:string -> unit
-> logging_info

val make_alarm : name:string -> unit -> alarm

val make_alarm_configuration :
  ?ignore_poll_alarm_failure:bool -> alarms:alarm list -> unit
-> alarm_configuration

val make_update_maintenance_window_task_result :
  ?alarm_configuration:alarm_configuration ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?description:string ->
  ?name:string ->
  ?logging_info:logging_info ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?priority:int ->
  ?task_invocation_parameters:maintenance_window_task_invocation_parameters ->
  ?task_parameters:(string * maintenance_window_task_parameter_value_expression) list ->
  ?service_role_arn:string ->
  ?task_arn:string ->
  ?targets:target list ->
  ?window_task_id:string ->
  ?window_id:string ->
  unit
-> update_maintenance_window_task_result

val make_update_maintenance_window_task_request :
  ?alarm_configuration:alarm_configuration ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?replace:bool ->
  ?description:string ->
  ?name:string ->
  ?logging_info:logging_info ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?priority:int ->
  ?task_invocation_parameters:maintenance_window_task_invocation_parameters ->
  ?task_parameters:(string * maintenance_window_task_parameter_value_expression) list ->
  ?service_role_arn:string ->
  ?task_arn:string ->
  ?targets:target list ->
  window_task_id:string ->
  window_id:string ->
  unit
-> update_maintenance_window_task_request

val make_update_maintenance_window_target_result :
  ?description:string ->
  ?name:string ->
  ?owner_information:string ->
  ?targets:target list ->
  ?window_target_id:string ->
  ?window_id:string ->
  unit
-> update_maintenance_window_target_result

val make_update_maintenance_window_target_request :
  ?replace:bool ->
  ?description:string ->
  ?name:string ->
  ?owner_information:string ->
  ?targets:target list ->
  window_target_id:string ->
  window_id:string ->
  unit
-> update_maintenance_window_target_request

val make_update_maintenance_window_result :
  ?enabled:bool ->
  ?allow_unassociated_targets:bool ->
  ?cutoff:int ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?schedule_timezone:string ->
  ?schedule:string ->
  ?end_date:string ->
  ?start_date:string ->
  ?description:string ->
  ?name:string ->
  ?window_id:string ->
  unit
-> update_maintenance_window_result

val make_update_maintenance_window_request :
  ?replace:bool ->
  ?enabled:bool ->
  ?allow_unassociated_targets:bool ->
  ?cutoff:int ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?schedule_timezone:string ->
  ?schedule:string ->
  ?end_date:string ->
  ?start_date:string ->
  ?description:string ->
  ?name:string ->
  window_id:string ->
  unit -> update_maintenance_window_request

val make_document_parameter :
  ?default_value:string ->
  ?description:string ->
  ?type_:document_parameter_type ->
  ?name:string ->
  unit -> document_parameter

val make_tag : value:string -> key:string -> unit
-> tag

val make_attachment_information : ?name:string -> unit
-> attachment_information

val make_document_requires :
  ?version_name:string ->
  ?require_type:string ->
  ?version:string ->
  name:string ->
  unit -> document_requires

val make_review_information :
  ?reviewer:string -> ?status:review_status -> ?reviewed_time:float -> unit
-> review_information

val make_document_description :
  ?category_enum:string list ->
  ?category:string list ->
  ?review_status:review_status ->
  ?pending_review_version:string ->
  ?approved_version:string ->
  ?review_information:review_information list ->
  ?author:string ->
  ?requires:document_requires list ->
  ?attachments_information:attachment_information list ->
  ?tags:tag list ->
  ?target_type:string ->
  ?document_format:document_format ->
  ?default_version:string ->
  ?latest_version:string ->
  ?schema_version:string ->
  ?document_type:document_type ->
  ?platform_types:platform_type list ->
  ?parameters:document_parameter list ->
  ?description:string ->
  ?document_version:string ->
  ?status_information:string ->
  ?status:document_status ->
  ?created_date:float ->
  ?owner:string ->
  ?version_name:string ->
  ?display_name:string ->
  ?name:string ->
  ?hash_type:document_hash_type ->
  ?hash:string ->
  ?sha1:string ->
  unit -> document_description

val make_update_document_result :
  ?document_description:document_description -> unit
-> update_document_result

val make_attachments_source :
  ?name:string -> ?values:string list -> ?key:attachments_source_key -> unit
-> attachments_source

val make_update_document_request :
  ?target_type:string ->
  ?document_format:document_format ->
  ?document_version:string ->
  ?version_name:string ->
  ?display_name:string ->
  ?attachments:attachments_source list ->
  name:string ->
  content:string ->
  unit -> update_document_request

val make_update_document_metadata_response : unit
-> update_document_metadata_response

val make_document_review_comment_source :
  ?content:string -> ?type_:document_review_comment_type -> unit
-> document_review_comment_source

val make_document_reviews :
  ?comment:document_review_comment_source list ->
  action:document_review_action ->
  unit -> document_reviews

val make_update_document_metadata_request :
  ?document_version:string ->
  document_reviews:document_reviews ->
  name:string ->
  unit
-> update_document_metadata_request

val make_document_default_version_description :
  ?default_version_name:string ->
  ?default_version:string ->
  ?name:string ->
  unit
-> document_default_version_description

val make_update_document_default_version_result :
  ?description:document_default_version_description -> unit
-> update_document_default_version_result

val make_update_document_default_version_request :
  document_version:string -> name:string -> unit
-> update_document_default_version_request

val make_association_status :
  ?additional_info:string ->
  message:string ->
  name:association_status_name ->
  date:float ->
  unit -> association_status

val make_association_overview :
  ?association_status_aggregated_count:(string * int) list ->
  ?detailed_status:string ->
  ?status:string ->
  unit -> association_overview

val make_s3_output_location :
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?output_s3_region:string ->
  unit -> s3_output_location

val make_instance_association_output_location :
  ?s3_location:s3_output_location -> unit
-> instance_association_output_location

val make_target_location :
  ?target_location_alarm_configuration:alarm_configuration ->
  ?execution_role_name:string ->
  ?target_location_max_errors:string ->
  ?target_location_max_concurrency:string ->
  ?regions:string list ->
  ?accounts:string list ->
  unit -> target_location

val make_alarm_state_information :
  state:external_alarm_state -> name:string -> unit
-> alarm_state_information

val make_association_description :
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?association_name:string ->
  ?last_successful_execution_date:float ->
  ?last_execution_date:float ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?targets:target list ->
  ?association_id:string ->
  ?parameters:(string * string list) list ->
  ?automation_target_parameter_name:string ->
  ?document_version:string ->
  ?overview:association_overview ->
  ?status:association_status ->
  ?last_update_association_date:float ->
  ?date:float ->
  ?association_version:string ->
  ?instance_id:string ->
  ?name:string ->
  unit -> association_description

val make_update_association_status_result :
  ?association_description:association_description -> unit
-> update_association_status_result

val make_update_association_status_request :
  association_status:association_status ->
  instance_id:string ->
  name:string ->
  unit
-> update_association_status_request

val make_update_association_result :
  ?association_description:association_description -> unit
-> update_association_result

val make_update_association_request :
  ?alarm_configuration:alarm_configuration ->
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?automation_target_parameter_name:string ->
  ?association_version:string ->
  ?association_name:string ->
  ?targets:target list ->
  ?name:string ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?document_version:string ->
  ?parameters:(string * string list) list ->
  association_id:string ->
  unit
-> update_association_request

val make_unlabel_parameter_version_result :
  ?invalid_labels:string list -> ?removed_labels:string list -> unit
-> unlabel_parameter_version_result

val make_unlabel_parameter_version_request :
  labels:string list -> parameter_version:int -> name:string -> unit
-> unlabel_parameter_version_request

val make_terminate_session_response : ?session_id:string -> unit
-> terminate_session_response

val make_terminate_session_request : session_id:string -> unit
-> terminate_session_request

val make_stop_automation_execution_result : unit
-> stop_automation_execution_result

val make_stop_automation_execution_request :
  ?type_:stop_type -> automation_execution_id:string -> unit
-> stop_automation_execution_request

val make_failure_details :
  ?details:(string * string list) list ->
  ?failure_type:string ->
  ?failure_stage:string ->
  unit -> failure_details

val make_parent_step_details :
  ?iterator_value:string ->
  ?iteration:int ->
  ?action:string ->
  ?step_name:string ->
  ?step_execution_id:string ->
  unit -> parent_step_details

val make_step_execution :
  ?parent_step_details:parent_step_details ->
  ?triggered_alarms:alarm_state_information list ->
  ?target_location:target_location ->
  ?targets:target list ->
  ?valid_next_steps:string list ->
  ?is_critical:bool ->
  ?next_step:string ->
  ?is_end:bool ->
  ?overridden_parameters:(string * string list) list ->
  ?step_execution_id:string ->
  ?failure_details:failure_details ->
  ?failure_message:string ->
  ?response:string ->
  ?outputs:(string * string list) list ->
  ?inputs:(string * string) list ->
  ?response_code:string ->
  ?step_status:automation_execution_status ->
  ?execution_end_time:float ->
  ?execution_start_time:float ->
  ?max_attempts:int ->
  ?on_failure:string ->
  ?timeout_seconds:int ->
  ?action:string ->
  ?step_name:string ->
  unit -> step_execution

val make_step_execution_filter :
  values:string list -> key:step_execution_filter_key -> unit
-> step_execution_filter

val make_start_session_response :
  ?stream_url:string -> ?token_value:string -> ?session_id:string -> unit
-> start_session_response

val make_start_session_request :
  ?parameters:(string * string list) list ->
  ?reason:string ->
  ?document_name:string ->
  target:string ->
  unit
-> start_session_request

val make_start_change_request_execution_result :
  ?automation_execution_id:string -> unit
-> start_change_request_execution_result

val make_runbook :
  ?target_locations:target_location list ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?target_maps:(string * string list) list list ->
  ?targets:target list ->
  ?target_parameter_name:string ->
  ?parameters:(string * string list) list ->
  ?document_version:string ->
  document_name:string ->
  unit -> runbook

val make_start_change_request_execution_request :
  ?change_details:string ->
  ?scheduled_end_time:float ->
  ?tags:tag list ->
  ?auto_approve:bool ->
  ?client_token:string ->
  ?change_request_name:string ->
  ?parameters:(string * string list) list ->
  ?document_version:string ->
  ?scheduled_time:float ->
  runbooks:runbook list ->
  document_name:string ->
  unit
-> start_change_request_execution_request

val make_start_automation_execution_result :
  ?automation_execution_id:string -> unit
-> start_automation_execution_result

val make_start_automation_execution_request :
  ?alarm_configuration:alarm_configuration ->
  ?tags:tag list ->
  ?target_locations:target_location list ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?target_maps:(string * string list) list list ->
  ?targets:target list ->
  ?target_parameter_name:string ->
  ?mode:execution_mode ->
  ?client_token:string ->
  ?parameters:(string * string list) list ->
  ?document_version:string ->
  document_name:string ->
  unit
-> start_automation_execution_request

val make_start_associations_once_result : unit
-> start_associations_once_result

val make_start_associations_once_request :
  association_ids:string list -> unit
-> start_associations_once_request

val make_severity_summary :
  ?unspecified_count:int ->
  ?informational_count:int ->
  ?low_count:int ->
  ?medium_count:int ->
  ?high_count:int ->
  ?critical_count:int ->
  unit -> severity_summary

val make_session_manager_output_url :
  ?cloud_watch_output_url:string -> ?s3_output_url:string -> unit
-> session_manager_output_url

val make_session :
  ?max_session_duration:string ->
  ?output_url:session_manager_output_url ->
  ?details:string ->
  ?reason:string ->
  ?owner:string ->
  ?document_name:string ->
  ?end_date:float ->
  ?start_date:float ->
  ?status:session_status ->
  ?target:string ->
  ?session_id:string ->
  unit -> session

val make_session_filter : value:string -> key:session_filter_key -> unit
-> session_filter

val make_service_setting :
  ?status:string ->
  ?ar_n:string ->
  ?last_modified_user:string ->
  ?last_modified_date:float ->
  ?setting_value:string ->
  ?setting_id:string ->
  unit -> service_setting

val make_command :
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?timeout_seconds:int ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?notification_config:notification_config ->
  ?service_role:string ->
  ?delivery_timed_out_count:int ->
  ?error_count:int ->
  ?completed_count:int ->
  ?target_count:int ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?output_s3_region:string ->
  ?status_details:string ->
  ?status:command_status ->
  ?requested_date_time:float ->
  ?targets:target list ->
  ?instance_ids:string list ->
  ?parameters:(string * string list) list ->
  ?expires_after:float ->
  ?comment:string ->
  ?document_version:string ->
  ?document_name:string ->
  ?command_id:string ->
  unit -> command

val make_send_command_result : ?command:command -> unit
-> send_command_result

val make_send_command_request :
  ?alarm_configuration:alarm_configuration ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?notification_config:notification_config ->
  ?service_role_arn:string ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?output_s3_region:string ->
  ?parameters:(string * string list) list ->
  ?comment:string ->
  ?timeout_seconds:int ->
  ?document_hash_type:document_hash_type ->
  ?document_hash:string ->
  ?document_version:string ->
  ?targets:target list ->
  ?instance_ids:string list ->
  document_name:string ->
  unit -> send_command_request

val make_send_automation_signal_result : unit
-> send_automation_signal_result

val make_send_automation_signal_request :
  ?payload:(string * string list) list ->
  signal_type:signal_type ->
  automation_execution_id:string ->
  unit -> send_automation_signal_request

val make_scheduled_window_execution :
  ?execution_time:string -> ?name:string -> ?window_id:string -> unit
-> scheduled_window_execution

val make_s3_output_url : ?output_url:string -> unit
-> s3_output_url

val make_resume_session_response :
  ?stream_url:string -> ?token_value:string -> ?session_id:string -> unit
-> resume_session_response

val make_resume_session_request : session_id:string -> unit
-> resume_session_request

val make_result_attribute : type_name:string -> unit
-> result_attribute

val make_resource_data_sync_source_with_state :
  ?enable_all_ops_data_sources:bool ->
  ?state:string ->
  ?include_future_regions:bool ->
  ?source_regions:string list ->
  ?aws_organizations_source:resource_data_sync_aws_organizations_source ->
  ?source_type:string ->
  unit
-> resource_data_sync_source_with_state

val make_resource_data_sync_destination_data_sharing :
  ?destination_data_sharing_type:string -> unit
-> resource_data_sync_destination_data_sharing

val make_resource_data_sync_s3_destination :
  ?destination_data_sharing:resource_data_sync_destination_data_sharing ->
  ?awskms_key_ar_n:string ->
  ?prefix:string ->
  region:string ->
  sync_format:resource_data_sync_s3_format ->
  bucket_name:string ->
  unit -> resource_data_sync_s3_destination

val make_resource_data_sync_item :
  ?last_sync_status_message:string ->
  ?sync_created_time:float ->
  ?last_status:last_resource_data_sync_status ->
  ?sync_last_modified_time:float ->
  ?last_successful_sync_time:float ->
  ?last_sync_time:float ->
  ?s3_destination:resource_data_sync_s3_destination ->
  ?sync_source:resource_data_sync_source_with_state ->
  ?sync_type:string ->
  ?sync_name:string ->
  unit -> resource_data_sync_item

val make_compliance_execution_summary :
  ?execution_type:string ->
  ?execution_id:string ->
  execution_time:float ->
  unit -> compliance_execution_summary

val make_compliant_summary :
  ?severity_summary:severity_summary -> ?compliant_count:int -> unit
-> compliant_summary

val make_non_compliant_summary :
  ?severity_summary:severity_summary -> ?non_compliant_count:int -> unit
-> non_compliant_summary

val make_resource_compliance_summary_item :
  ?non_compliant_summary:non_compliant_summary ->
  ?compliant_summary:compliant_summary ->
  ?execution_summary:compliance_execution_summary ->
  ?overall_severity:compliance_severity ->
  ?status:compliance_status ->
  ?resource_id:string ->
  ?resource_type:string ->
  ?compliance_type:string ->
  unit -> resource_compliance_summary_item

val make_resolved_targets :
  ?truncated:bool -> ?parameter_values:string list -> unit
-> resolved_targets

val make_reset_service_setting_result :
  ?service_setting:service_setting -> unit
-> reset_service_setting_result

val make_reset_service_setting_request : setting_id:string -> unit
-> reset_service_setting_request

val make_remove_tags_from_resource_result : unit
-> remove_tags_from_resource_result

val make_remove_tags_from_resource_request :
  tag_keys:string list ->
  resource_id:string ->
  resource_type:resource_type_for_tagging ->
  unit
-> remove_tags_from_resource_request

val make_registration_metadata_item : value:string -> key:string -> unit
-> registration_metadata_item

val make_register_task_with_maintenance_window_result :
  ?window_task_id:string -> unit
-> register_task_with_maintenance_window_result

val make_register_task_with_maintenance_window_request :
  ?alarm_configuration:alarm_configuration ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?client_token:string ->
  ?description:string ->
  ?name:string ->
  ?logging_info:logging_info ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?priority:int ->
  ?task_invocation_parameters:maintenance_window_task_invocation_parameters ->
  ?task_parameters:(string * maintenance_window_task_parameter_value_expression) list ->
  ?service_role_arn:string ->
  ?targets:target list ->
  task_type:maintenance_window_task_type ->
  task_arn:string ->
  window_id:string ->
  unit
-> register_task_with_maintenance_window_request

val make_register_target_with_maintenance_window_result :
  ?window_target_id:string -> unit
-> register_target_with_maintenance_window_result

val make_register_target_with_maintenance_window_request :
  ?client_token:string ->
  ?description:string ->
  ?name:string ->
  ?owner_information:string ->
  targets:target list ->
  resource_type:maintenance_window_resource_type ->
  window_id:string ->
  unit
-> register_target_with_maintenance_window_request

val make_register_patch_baseline_for_patch_group_result :
  ?patch_group:string -> ?baseline_id:string -> unit
-> register_patch_baseline_for_patch_group_result

val make_register_patch_baseline_for_patch_group_request :
  patch_group:string -> baseline_id:string -> unit
-> register_patch_baseline_for_patch_group_request

val make_register_default_patch_baseline_result : ?baseline_id:string -> unit
-> register_default_patch_baseline_result

val make_register_default_patch_baseline_request : baseline_id:string -> unit
-> register_default_patch_baseline_request

val make_put_resource_policy_response :
  ?policy_hash:string -> ?policy_id:string -> unit
-> put_resource_policy_response

val make_put_resource_policy_request :
  ?policy_hash:string ->
  ?policy_id:string ->
  policy:string ->
  resource_arn:string ->
  unit -> put_resource_policy_request

val make_put_parameter_result : ?tier:parameter_tier -> ?version:int -> unit
-> put_parameter_result

val make_put_parameter_request :
  ?data_type:string ->
  ?policies:string ->
  ?tier:parameter_tier ->
  ?tags:tag list ->
  ?allowed_pattern:string ->
  ?overwrite:bool ->
  ?key_id:string ->
  ?type_:parameter_type ->
  ?description:string ->
  value:string ->
  name:string ->
  unit -> put_parameter_request

val make_put_inventory_result : ?message:string -> unit
-> put_inventory_result

val make_inventory_item :
  ?context:(string * string) list ->
  ?content:(string * string) list list ->
  ?content_hash:string ->
  capture_time:string ->
  schema_version:string ->
  type_name:string ->
  unit -> inventory_item

val make_put_inventory_request :
  items:inventory_item list -> instance_id:string -> unit
-> put_inventory_request

val make_put_compliance_items_result : unit
-> put_compliance_items_result

val make_compliance_item_entry :
  ?details:(string * string) list ->
  ?title:string ->
  ?id:string ->
  status:compliance_status ->
  severity:compliance_severity ->
  unit -> compliance_item_entry

val make_put_compliance_items_request :
  ?upload_type:compliance_upload_type ->
  ?item_content_hash:string ->
  items:compliance_item_entry list ->
  execution_summary:compliance_execution_summary ->
  compliance_type:string ->
  resource_type:string ->
  resource_id:string ->
  unit -> put_compliance_items_request

val make_progress_counters :
  ?timed_out_steps:int ->
  ?cancelled_steps:int ->
  ?failed_steps:int ->
  ?success_steps:int ->
  ?total_steps:int ->
  unit -> progress_counters

val make_patch_status :
  ?approval_date:float ->
  ?compliance_level:patch_compliance_level ->
  ?deployment_status:patch_deployment_status ->
  unit -> patch_status

val make_patch_orchestrator_filter :
  ?values:string list -> ?key:string -> unit
-> patch_orchestrator_filter

val make_patch :
  ?repository:string ->
  ?severity:string ->
  ?arch:string ->
  ?release:string ->
  ?version:string ->
  ?epoch:int ->
  ?name:string ->
  ?cve_ids:string list ->
  ?bugzilla_ids:string list ->
  ?advisory_ids:string list ->
  ?language:string ->
  ?msrc_number:string ->
  ?kb_number:string ->
  ?msrc_severity:string ->
  ?classification:string ->
  ?product:string ->
  ?product_family:string ->
  ?vendor:string ->
  ?content_url:string ->
  ?description:string ->
  ?title:string ->
  ?release_date:float ->
  ?id:string ->
  unit -> patch

val make_patch_baseline_identity :
  ?default_baseline:bool ->
  ?baseline_description:string ->
  ?operating_system:operating_system ->
  ?baseline_name:string ->
  ?baseline_id:string ->
  unit
-> patch_baseline_identity

val make_patch_group_patch_baseline_mapping :
  ?baseline_identity:patch_baseline_identity -> ?patch_group:string -> unit
-> patch_group_patch_baseline_mapping

val make_patch_compliance_data :
  ?cve_ids:string ->
  installed_time:float ->
  state:patch_compliance_data_state ->
  severity:string ->
  classification:string ->
  kb_id:string ->
  title:string ->
  unit -> patch_compliance_data

val make_parameters_filter :
  values:string list -> key:parameters_filter_key -> unit
-> parameters_filter

val make_parameter_string_filter :
  ?values:string list -> ?option_:string -> key:string -> unit
-> parameter_string_filter

val make_parameter_inline_policy :
  ?policy_status:string -> ?policy_type:string -> ?policy_text:string -> unit
-> parameter_inline_policy

val make_parameter_metadata :
  ?data_type:string ->
  ?policies:parameter_inline_policy list ->
  ?tier:parameter_tier ->
  ?version:int ->
  ?allowed_pattern:string ->
  ?description:string ->
  ?last_modified_user:string ->
  ?last_modified_date:float ->
  ?key_id:string ->
  ?type_:parameter_type ->
  ?ar_n:string ->
  ?name:string ->
  unit -> parameter_metadata

val make_parameter :
  ?data_type:string ->
  ?ar_n:string ->
  ?last_modified_date:float ->
  ?source_result:string ->
  ?selector:string ->
  ?version:int ->
  ?value:string ->
  ?type_:parameter_type ->
  ?name:string ->
  unit -> parameter

val make_parameter_history :
  ?data_type:string ->
  ?policies:parameter_inline_policy list ->
  ?tier:parameter_tier ->
  ?labels:string list ->
  ?version:int ->
  ?allowed_pattern:string ->
  ?value:string ->
  ?description:string ->
  ?last_modified_user:string ->
  ?last_modified_date:float ->
  ?key_id:string ->
  ?type_:parameter_type ->
  ?name:string ->
  unit -> parameter_history

val make_output_source :
  ?output_source_type:string -> ?output_source_id:string -> unit
-> output_source

val make_ops_result_attribute : type_name:string -> unit
-> ops_result_attribute

val make_ops_metadata :
  ?creation_date:float ->
  ?last_modified_user:string ->
  ?last_modified_date:float ->
  ?ops_metadata_arn:string ->
  ?resource_id:string ->
  unit -> ops_metadata

val make_ops_metadata_filter : values:string list -> key:string -> unit
-> ops_metadata_filter

val make_ops_item_summary :
  ?planned_end_time:float ->
  ?planned_start_time:float ->
  ?actual_end_time:float ->
  ?actual_start_time:float ->
  ?ops_item_type:string ->
  ?severity:string ->
  ?category:string ->
  ?operational_data:(string * ops_item_data_value) list ->
  ?title:string ->
  ?ops_item_id:string ->
  ?status:ops_item_status ->
  ?source:string ->
  ?priority:int ->
  ?last_modified_time:float ->
  ?last_modified_by:string ->
  ?created_time:float ->
  ?created_by:string ->
  unit -> ops_item_summary

val make_ops_item_related_items_filter :
  operator:ops_item_related_items_filter_operator ->
  values:string list ->
  key:ops_item_related_items_filter_key ->
  unit -> ops_item_related_items_filter

val make_ops_item_identity : ?arn:string -> unit
-> ops_item_identity

val make_ops_item_related_item_summary :
  ?last_modified_time:float ->
  ?last_modified_by:ops_item_identity ->
  ?created_time:float ->
  ?created_by:ops_item_identity ->
  ?resource_uri:string ->
  ?association_type:string ->
  ?resource_type:string ->
  ?association_id:string ->
  ?ops_item_id:string ->
  unit -> ops_item_related_item_summary

val make_ops_item_filter :
  operator:ops_item_filter_operator ->
  values:string list ->
  key:ops_item_filter_key ->
  unit -> ops_item_filter

val make_ops_item_event_summary :
  ?created_time:float ->
  ?created_by:ops_item_identity ->
  ?detail:string ->
  ?detail_type:string ->
  ?source:string ->
  ?event_id:string ->
  ?ops_item_id:string ->
  unit -> ops_item_event_summary

val make_ops_item_event_filter :
  operator:ops_item_event_filter_operator ->
  values:string list ->
  key:ops_item_event_filter_key ->
  unit -> ops_item_event_filter

val make_ops_item :
  ?ops_item_arn:string ->
  ?planned_end_time:float ->
  ?planned_start_time:float ->
  ?actual_end_time:float ->
  ?actual_start_time:float ->
  ?severity:string ->
  ?category:string ->
  ?operational_data:(string * ops_item_data_value) list ->
  ?source:string ->
  ?title:string ->
  ?version:string ->
  ?ops_item_id:string ->
  ?status:ops_item_status ->
  ?related_ops_items:related_ops_item list ->
  ?priority:int ->
  ?notifications:ops_item_notification list ->
  ?last_modified_time:float ->
  ?last_modified_by:string ->
  ?description:string ->
  ?created_time:float ->
  ?ops_item_type:string ->
  ?created_by:string ->
  unit -> ops_item

val make_ops_filter :
  ?type_:ops_filter_operator_type -> values:string list -> key:string -> unit
-> ops_filter

val make_ops_entity_item :
  ?content:(string * string) list list -> ?capture_time:string -> unit
-> ops_entity_item

val make_ops_entity :
  ?data:(string * ops_entity_item) list -> ?id:string -> unit
-> ops_entity

val make_ops_aggregator :
  ?aggregators:ops_aggregator list ->
  ?filters:ops_filter list ->
  ?values:(string * string) list ->
  ?attribute_name:string ->
  ?type_name:string ->
  ?aggregator_type:string ->
  unit -> ops_aggregator

val make_modify_document_permission_response : unit
-> modify_document_permission_response

val make_modify_document_permission_request :
  ?shared_document_version:string ->
  ?account_ids_to_remove:string list ->
  ?account_ids_to_add:string list ->
  permission_type:document_permission_type ->
  name:string ->
  unit
-> modify_document_permission_request

val make_maintenance_window_identity_for_target :
  ?name:string -> ?window_id:string -> unit
-> maintenance_window_identity_for_target

val make_maintenance_window_task :
  ?alarm_configuration:alarm_configuration ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?description:string ->
  ?name:string ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?service_role_arn:string ->
  ?logging_info:logging_info ->
  ?priority:int ->
  ?task_parameters:(string * maintenance_window_task_parameter_value_expression) list ->
  ?targets:target list ->
  ?type_:maintenance_window_task_type ->
  ?task_arn:string ->
  ?window_task_id:string ->
  ?window_id:string ->
  unit -> maintenance_window_task

val make_maintenance_window_target :
  ?description:string ->
  ?name:string ->
  ?owner_information:string ->
  ?targets:target list ->
  ?resource_type:maintenance_window_resource_type ->
  ?window_target_id:string ->
  ?window_id:string ->
  unit -> maintenance_window_target

val make_maintenance_window_identity :
  ?next_execution_time:string ->
  ?start_date:string ->
  ?end_date:string ->
  ?schedule_offset:int ->
  ?schedule_timezone:string ->
  ?schedule:string ->
  ?cutoff:int ->
  ?duration:int ->
  ?enabled:bool ->
  ?description:string ->
  ?name:string ->
  ?window_id:string ->
  unit -> maintenance_window_identity

val make_maintenance_window_filter :
  ?values:string list -> ?key:string -> unit
-> maintenance_window_filter

val make_maintenance_window_execution_task_invocation_identity :
  ?window_target_id:string ->
  ?owner_information:string ->
  ?end_time:float ->
  ?start_time:float ->
  ?status_details:string ->
  ?status:maintenance_window_execution_status ->
  ?parameters:string ->
  ?task_type:maintenance_window_task_type ->
  ?execution_id:string ->
  ?invocation_id:string ->
  ?task_execution_id:string ->
  ?window_execution_id:string ->
  unit
-> maintenance_window_execution_task_invocation_identity

val make_maintenance_window_execution_task_identity :
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?task_type:maintenance_window_task_type ->
  ?task_arn:string ->
  ?end_time:float ->
  ?start_time:float ->
  ?status_details:string ->
  ?status:maintenance_window_execution_status ->
  ?task_execution_id:string ->
  ?window_execution_id:string ->
  unit
-> maintenance_window_execution_task_identity

val make_maintenance_window_execution :
  ?end_time:float ->
  ?start_time:float ->
  ?status_details:string ->
  ?status:maintenance_window_execution_status ->
  ?window_execution_id:string ->
  ?window_id:string ->
  unit
-> maintenance_window_execution

val make_list_tags_for_resource_result : ?tag_list:tag list -> unit
-> list_tags_for_resource_result

val make_list_tags_for_resource_request :
  resource_id:string -> resource_type:resource_type_for_tagging -> unit
-> list_tags_for_resource_request

val make_list_resource_data_sync_result :
  ?next_token:string ->
  ?resource_data_sync_items:resource_data_sync_item list ->
  unit
-> list_resource_data_sync_result

val make_list_resource_data_sync_request :
  ?max_results:int -> ?next_token:string -> ?sync_type:string -> unit
-> list_resource_data_sync_request

val make_list_resource_compliance_summaries_result :
  ?next_token:string ->
  ?resource_compliance_summary_items:resource_compliance_summary_item list ->
  unit
-> list_resource_compliance_summaries_result

val make_compliance_string_filter :
  ?type_:compliance_query_operator_type ->
  ?values:string list ->
  ?key:string ->
  unit
-> compliance_string_filter

val make_list_resource_compliance_summaries_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:compliance_string_filter list ->
  unit
-> list_resource_compliance_summaries_request

val make_list_ops_metadata_result :
  ?next_token:string -> ?ops_metadata_list:ops_metadata list -> unit
-> list_ops_metadata_result

val make_list_ops_metadata_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:ops_metadata_filter list ->
  unit
-> list_ops_metadata_request

val make_list_ops_item_related_items_response :
  ?summaries:ops_item_related_item_summary list -> ?next_token:string -> unit
-> list_ops_item_related_items_response

val make_list_ops_item_related_items_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:ops_item_related_items_filter list ->
  ?ops_item_id:string ->
  unit
-> list_ops_item_related_items_request

val make_list_ops_item_events_response :
  ?summaries:ops_item_event_summary list -> ?next_token:string -> unit
-> list_ops_item_events_response

val make_list_ops_item_events_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:ops_item_event_filter list ->
  unit
-> list_ops_item_events_request

val make_list_inventory_entries_result :
  ?next_token:string ->
  ?entries:(string * string) list list ->
  ?capture_time:string ->
  ?schema_version:string ->
  ?instance_id:string ->
  ?type_name:string ->
  unit -> list_inventory_entries_result

val make_inventory_filter :
  ?type_:inventory_query_operator_type ->
  values:string list ->
  key:string ->
  unit -> inventory_filter

val make_list_inventory_entries_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:inventory_filter list ->
  type_name:string ->
  instance_id:string ->
  unit -> list_inventory_entries_request

val make_document_identifier :
  ?author:string ->
  ?review_status:review_status ->
  ?requires:document_requires list ->
  ?tags:tag list ->
  ?target_type:string ->
  ?document_format:document_format ->
  ?schema_version:string ->
  ?document_type:document_type ->
  ?document_version:string ->
  ?platform_types:platform_type list ->
  ?version_name:string ->
  ?owner:string ->
  ?display_name:string ->
  ?created_date:float ->
  ?name:string ->
  unit -> document_identifier

val make_list_documents_result :
  ?next_token:string ->
  ?document_identifiers:document_identifier list ->
  unit -> list_documents_result

val make_document_filter : value:string -> key:document_filter_key -> unit
-> document_filter

val make_document_key_values_filter :
  ?values:string list -> ?key:string -> unit
-> document_key_values_filter

val make_list_documents_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:document_key_values_filter list ->
  ?document_filter_list:document_filter list ->
  unit -> list_documents_request

val make_document_version_info :
  ?review_status:review_status ->
  ?status_information:string ->
  ?status:document_status ->
  ?document_format:document_format ->
  ?is_default_version:bool ->
  ?created_date:float ->
  ?version_name:string ->
  ?document_version:string ->
  ?display_name:string ->
  ?name:string ->
  unit -> document_version_info

val make_list_document_versions_result :
  ?next_token:string -> ?document_versions:document_version_info list -> unit
-> list_document_versions_result

val make_list_document_versions_request :
  ?next_token:string -> ?max_results:int -> name:string -> unit
-> list_document_versions_request

val make_document_reviewer_response_source :
  ?reviewer:string ->
  ?comment:document_review_comment_source list ->
  ?review_status:review_status ->
  ?updated_time:float ->
  ?create_time:float ->
  unit
-> document_reviewer_response_source

val make_document_metadata_response_info :
  ?reviewer_response:document_reviewer_response_source list -> unit
-> document_metadata_response_info

val make_list_document_metadata_history_response :
  ?next_token:string ->
  ?metadata:document_metadata_response_info ->
  ?author:string ->
  ?document_version:string ->
  ?name:string ->
  unit
-> list_document_metadata_history_response

val make_list_document_metadata_history_request :
  ?max_results:int ->
  ?next_token:string ->
  ?document_version:string ->
  metadata:document_metadata_enum ->
  name:string ->
  unit
-> list_document_metadata_history_request

val make_compliance_summary_item :
  ?non_compliant_summary:non_compliant_summary ->
  ?compliant_summary:compliant_summary ->
  ?compliance_type:string ->
  unit -> compliance_summary_item

val make_list_compliance_summaries_result :
  ?next_token:string ->
  ?compliance_summary_items:compliance_summary_item list ->
  unit
-> list_compliance_summaries_result

val make_list_compliance_summaries_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:compliance_string_filter list ->
  unit -> list_compliance_summaries_request

val make_compliance_item :
  ?details:(string * string) list ->
  ?execution_summary:compliance_execution_summary ->
  ?severity:compliance_severity ->
  ?status:compliance_status ->
  ?title:string ->
  ?id:string ->
  ?resource_id:string ->
  ?resource_type:string ->
  ?compliance_type:string ->
  unit -> compliance_item

val make_list_compliance_items_result :
  ?next_token:string -> ?compliance_items:compliance_item list -> unit
-> list_compliance_items_result

val make_list_compliance_items_request :
  ?max_results:int ->
  ?next_token:string ->
  ?resource_types:string list ->
  ?resource_ids:string list ->
  ?filters:compliance_string_filter list ->
  unit -> list_compliance_items_request

val make_list_commands_result :
  ?next_token:string -> ?commands:command list -> unit
-> list_commands_result

val make_command_filter : value:string -> key:command_filter_key -> unit
-> command_filter

val make_list_commands_request :
  ?filters:command_filter list ->
  ?next_token:string ->
  ?max_results:int ->
  ?instance_id:string ->
  ?command_id:string ->
  unit -> list_commands_request

val make_command_plugin :
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?output_s3_region:string ->
  ?standard_error_url:string ->
  ?standard_output_url:string ->
  ?output:string ->
  ?response_finish_date_time:float ->
  ?response_start_date_time:float ->
  ?response_code:int ->
  ?status_details:string ->
  ?status:command_plugin_status ->
  ?name:string ->
  unit -> command_plugin

val make_command_invocation :
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?notification_config:notification_config ->
  ?service_role:string ->
  ?command_plugins:command_plugin list ->
  ?standard_error_url:string ->
  ?standard_output_url:string ->
  ?trace_output:string ->
  ?status_details:string ->
  ?status:command_invocation_status ->
  ?requested_date_time:float ->
  ?document_version:string ->
  ?document_name:string ->
  ?comment:string ->
  ?instance_name:string ->
  ?instance_id:string ->
  ?command_id:string ->
  unit -> command_invocation

val make_list_command_invocations_result :
  ?next_token:string -> ?command_invocations:command_invocation list -> unit
-> list_command_invocations_result

val make_list_command_invocations_request :
  ?details:bool ->
  ?filters:command_filter list ->
  ?next_token:string ->
  ?max_results:int ->
  ?instance_id:string ->
  ?command_id:string ->
  unit -> list_command_invocations_request

val make_association :
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?association_name:string ->
  ?schedule_expression:string ->
  ?overview:association_overview ->
  ?last_execution_date:float ->
  ?targets:target list ->
  ?document_version:string ->
  ?association_version:string ->
  ?association_id:string ->
  ?instance_id:string ->
  ?name:string ->
  unit -> association

val make_list_associations_result :
  ?next_token:string -> ?associations:association list -> unit
-> list_associations_result

val make_association_filter :
  value:string -> key:association_filter_key -> unit
-> association_filter

val make_list_associations_request :
  ?next_token:string ->
  ?max_results:int ->
  ?association_filter_list:association_filter list ->
  unit -> list_associations_request

val make_association_version_info :
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?association_name:string ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?targets:target list ->
  ?parameters:(string * string list) list ->
  ?document_version:string ->
  ?name:string ->
  ?created_date:float ->
  ?association_version:string ->
  ?association_id:string ->
  unit -> association_version_info

val make_list_association_versions_result :
  ?next_token:string ->
  ?association_versions:association_version_info list ->
  unit
-> list_association_versions_result

val make_list_association_versions_request :
  ?next_token:string -> ?max_results:int -> association_id:string -> unit
-> list_association_versions_request

val make_label_parameter_version_result :
  ?parameter_version:int -> ?invalid_labels:string list -> unit
-> label_parameter_version_result

val make_label_parameter_version_request :
  ?parameter_version:int -> labels:string list -> name:string -> unit
-> label_parameter_version_request

val make_inventory_result_item :
  ?content_hash:string ->
  ?capture_time:string ->
  content:(string * string) list list ->
  schema_version:string ->
  type_name:string ->
  unit -> inventory_result_item

val make_inventory_result_entity :
  ?data:(string * inventory_result_item) list -> ?id:string -> unit
-> inventory_result_entity

val make_inventory_item_attribute :
  data_type:inventory_attribute_data_type -> name:string -> unit
-> inventory_item_attribute

val make_inventory_item_schema :
  ?display_name:string ->
  ?version:string ->
  attributes:inventory_item_attribute list ->
  type_name:string ->
  unit -> inventory_item_schema

val make_inventory_group :
  filters:inventory_filter list -> name:string -> unit
-> inventory_group

val make_inventory_deletion_summary_item :
  ?remaining_count:int -> ?count:int -> ?version:string -> unit
-> inventory_deletion_summary_item

val make_inventory_deletion_summary :
  ?summary_items:inventory_deletion_summary_item list ->
  ?remaining_count:int ->
  ?total_count:int ->
  unit -> inventory_deletion_summary

val make_inventory_deletion_status_item :
  ?last_status_update_time:float ->
  ?deletion_summary:inventory_deletion_summary ->
  ?last_status_message:string ->
  ?last_status:inventory_deletion_status ->
  ?deletion_start_time:float ->
  ?type_name:string ->
  ?deletion_id:string ->
  unit -> inventory_deletion_status_item

val make_inventory_aggregator :
  ?groups:inventory_group list ->
  ?aggregators:inventory_aggregator list ->
  ?expression:string ->
  unit -> inventory_aggregator

val make_instance_property_string_filter :
  ?operator:instance_property_filter_operator ->
  values:string list ->
  key:string ->
  unit -> instance_property_string_filter

val make_instance_property_filter :
  value_set:string list -> key:instance_property_filter_key -> unit
-> instance_property_filter

val make_instance_aggregated_association_overview :
  ?instance_association_status_aggregated_count:(string * int) list ->
  ?detailed_status:string ->
  unit
-> instance_aggregated_association_overview

val make_instance_property :
  ?source_type:source_type ->
  ?source_id:string ->
  ?association_overview:instance_aggregated_association_overview ->
  ?last_successful_association_execution_date:float ->
  ?last_association_execution_date:float ->
  ?association_status:string ->
  ?computer_name:string ->
  ?resource_type:string ->
  ?registration_date:float ->
  ?iam_role:string ->
  ?activation_id:string ->
  ?platform_version:string ->
  ?platform_name:string ->
  ?platform_type:platform_type ->
  ?agent_version:string ->
  ?last_ping_date_time:float ->
  ?ping_status:ping_status ->
  ?launch_time:float ->
  ?ip_address:string ->
  ?architecture:string ->
  ?instance_state:string ->
  ?key_name:string ->
  ?instance_role:string ->
  ?instance_type:string ->
  ?instance_id:string ->
  ?name:string ->
  unit -> instance_property

val make_instance_patch_state :
  ?other_non_compliant_count:int ->
  ?security_non_compliant_count:int ->
  ?critical_non_compliant_count:int ->
  ?reboot_option:reboot_option ->
  ?last_no_reboot_install_operation_time:float ->
  ?not_applicable_count:int ->
  ?unreported_not_applicable_count:int ->
  ?failed_count:int ->
  ?missing_count:int ->
  ?installed_rejected_count:int ->
  ?installed_pending_reboot_count:int ->
  ?installed_other_count:int ->
  ?installed_count:int ->
  ?owner_information:string ->
  ?install_override_list:string ->
  ?snapshot_id:string ->
  operation:patch_operation_type ->
  operation_end_time:float ->
  operation_start_time:float ->
  baseline_id:string ->
  patch_group:string ->
  instance_id:string ->
  unit -> instance_patch_state

val make_instance_patch_state_filter :
  type_:instance_patch_state_operator_type ->
  values:string list ->
  key:string ->
  unit
-> instance_patch_state_filter

val make_instance_information_string_filter :
  values:string list -> key:string -> unit
-> instance_information_string_filter

val make_instance_information :
  ?source_type:source_type ->
  ?source_id:string ->
  ?association_overview:instance_aggregated_association_overview ->
  ?last_successful_association_execution_date:float ->
  ?last_association_execution_date:float ->
  ?association_status:string ->
  ?computer_name:string ->
  ?ip_address:string ->
  ?name:string ->
  ?resource_type:resource_type ->
  ?registration_date:float ->
  ?iam_role:string ->
  ?activation_id:string ->
  ?platform_version:string ->
  ?platform_name:string ->
  ?platform_type:platform_type ->
  ?is_latest_version:bool ->
  ?agent_version:string ->
  ?last_ping_date_time:float ->
  ?ping_status:ping_status ->
  ?instance_id:string ->
  unit -> instance_information

val make_instance_information_filter :
  value_set:string list -> key:instance_information_filter_key -> unit
-> instance_information_filter

val make_instance_association_output_url :
  ?s3_output_url:s3_output_url -> unit
-> instance_association_output_url

val make_instance_association_status_info :
  ?association_name:string ->
  ?output_url:instance_association_output_url ->
  ?error_code:string ->
  ?execution_summary:string ->
  ?detailed_status:string ->
  ?status:string ->
  ?execution_date:float ->
  ?instance_id:string ->
  ?association_version:string ->
  ?document_version:string ->
  ?name:string ->
  ?association_id:string ->
  unit -> instance_association_status_info

val make_instance_association :
  ?association_version:string ->
  ?content:string ->
  ?instance_id:string ->
  ?association_id:string ->
  unit -> instance_association

val make_get_service_setting_result :
  ?service_setting:service_setting -> unit
-> get_service_setting_result

val make_get_service_setting_request : setting_id:string -> unit
-> get_service_setting_request

val make_get_resource_policies_response_entry :
  ?policy:string -> ?policy_hash:string -> ?policy_id:string -> unit
-> get_resource_policies_response_entry

val make_get_resource_policies_response :
  ?policies:get_resource_policies_response_entry list ->
  ?next_token:string ->
  unit
-> get_resource_policies_response

val make_get_resource_policies_request :
  ?max_results:int -> ?next_token:string -> resource_arn:string -> unit
-> get_resource_policies_request

val make_get_patch_baseline_result :
  ?sources:patch_source list ->
  ?description:string ->
  ?modified_date:float ->
  ?created_date:float ->
  ?patch_groups:string list ->
  ?rejected_patches_action:patch_action ->
  ?rejected_patches:string list ->
  ?approved_patches_enable_non_security:bool ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches:string list ->
  ?approval_rules:patch_rule_group ->
  ?global_filters:patch_filter_group ->
  ?operating_system:operating_system ->
  ?name:string ->
  ?baseline_id:string ->
  unit -> get_patch_baseline_result

val make_get_patch_baseline_request : baseline_id:string -> unit
-> get_patch_baseline_request

val make_get_patch_baseline_for_patch_group_result :
  ?operating_system:operating_system ->
  ?patch_group:string ->
  ?baseline_id:string ->
  unit
-> get_patch_baseline_for_patch_group_result

val make_get_patch_baseline_for_patch_group_request :
  ?operating_system:operating_system -> patch_group:string -> unit
-> get_patch_baseline_for_patch_group_request

val make_get_parameters_result :
  ?invalid_parameters:string list -> ?parameters:parameter list -> unit
-> get_parameters_result

val make_get_parameters_request :
  ?with_decryption:bool -> names:string list -> unit
-> get_parameters_request

val make_get_parameters_by_path_result :
  ?next_token:string -> ?parameters:parameter list -> unit
-> get_parameters_by_path_result

val make_get_parameters_by_path_request :
  ?next_token:string ->
  ?max_results:int ->
  ?with_decryption:bool ->
  ?parameter_filters:parameter_string_filter list ->
  ?recursive:bool ->
  path:string ->
  unit -> get_parameters_by_path_request

val make_get_parameter_result : ?parameter:parameter -> unit
-> get_parameter_result

val make_get_parameter_request : ?with_decryption:bool -> name:string -> unit
-> get_parameter_request

val make_get_parameter_history_result :
  ?next_token:string -> ?parameters:parameter_history list -> unit
-> get_parameter_history_result

val make_get_parameter_history_request :
  ?next_token:string ->
  ?max_results:int ->
  ?with_decryption:bool ->
  name:string ->
  unit -> get_parameter_history_request

val make_get_ops_summary_result :
  ?next_token:string -> ?entities:ops_entity list -> unit
-> get_ops_summary_result

val make_get_ops_summary_request :
  ?max_results:int ->
  ?next_token:string ->
  ?result_attributes:ops_result_attribute list ->
  ?aggregators:ops_aggregator list ->
  ?filters:ops_filter list ->
  ?sync_name:string ->
  unit -> get_ops_summary_request

val make_get_ops_metadata_result :
  ?next_token:string ->
  ?metadata:(string * metadata_value) list ->
  ?resource_id:string ->
  unit -> get_ops_metadata_result

val make_get_ops_metadata_request :
  ?next_token:string -> ?max_results:int -> ops_metadata_arn:string -> unit
-> get_ops_metadata_request

val make_get_ops_item_response : ?ops_item:ops_item -> unit
-> get_ops_item_response

val make_get_ops_item_request :
  ?ops_item_arn:string -> ops_item_id:string -> unit
-> get_ops_item_request

val make_get_maintenance_window_task_result :
  ?alarm_configuration:alarm_configuration ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?description:string ->
  ?name:string ->
  ?logging_info:logging_info ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?priority:int ->
  ?task_invocation_parameters:maintenance_window_task_invocation_parameters ->
  ?task_parameters:(string * maintenance_window_task_parameter_value_expression) list ->
  ?task_type:maintenance_window_task_type ->
  ?service_role_arn:string ->
  ?task_arn:string ->
  ?targets:target list ->
  ?window_task_id:string ->
  ?window_id:string ->
  unit
-> get_maintenance_window_task_result

val make_get_maintenance_window_task_request :
  window_task_id:string -> window_id:string -> unit
-> get_maintenance_window_task_request

val make_get_maintenance_window_result :
  ?modified_date:float ->
  ?created_date:float ->
  ?enabled:bool ->
  ?allow_unassociated_targets:bool ->
  ?cutoff:int ->
  ?duration:int ->
  ?next_execution_time:string ->
  ?schedule_offset:int ->
  ?schedule_timezone:string ->
  ?schedule:string ->
  ?end_date:string ->
  ?start_date:string ->
  ?description:string ->
  ?name:string ->
  ?window_id:string ->
  unit
-> get_maintenance_window_result

val make_get_maintenance_window_request : window_id:string -> unit
-> get_maintenance_window_request

val make_get_maintenance_window_execution_task_result :
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?end_time:float ->
  ?start_time:float ->
  ?status_details:string ->
  ?status:maintenance_window_execution_status ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?priority:int ->
  ?task_parameters:(string * maintenance_window_task_parameter_value_expression) list list ->
  ?type_:maintenance_window_task_type ->
  ?service_role:string ->
  ?task_arn:string ->
  ?task_execution_id:string ->
  ?window_execution_id:string ->
  unit
-> get_maintenance_window_execution_task_result

val make_get_maintenance_window_execution_task_request :
  task_id:string -> window_execution_id:string -> unit
-> get_maintenance_window_execution_task_request

val make_get_maintenance_window_execution_task_invocation_result :
  ?window_target_id:string ->
  ?owner_information:string ->
  ?end_time:float ->
  ?start_time:float ->
  ?status_details:string ->
  ?status:maintenance_window_execution_status ->
  ?parameters:string ->
  ?task_type:maintenance_window_task_type ->
  ?execution_id:string ->
  ?invocation_id:string ->
  ?task_execution_id:string ->
  ?window_execution_id:string ->
  unit
-> get_maintenance_window_execution_task_invocation_result

val make_get_maintenance_window_execution_task_invocation_request :
  invocation_id:string ->
  task_id:string ->
  window_execution_id:string ->
  unit
-> get_maintenance_window_execution_task_invocation_request

val make_get_maintenance_window_execution_result :
  ?end_time:float ->
  ?start_time:float ->
  ?status_details:string ->
  ?status:maintenance_window_execution_status ->
  ?task_ids:string list ->
  ?window_execution_id:string ->
  unit
-> get_maintenance_window_execution_result

val make_get_maintenance_window_execution_request :
  window_execution_id:string -> unit
-> get_maintenance_window_execution_request

val make_get_inventory_schema_result :
  ?next_token:string -> ?schemas:inventory_item_schema list -> unit
-> get_inventory_schema_result

val make_get_inventory_schema_request :
  ?sub_type:bool ->
  ?aggregator:bool ->
  ?max_results:int ->
  ?next_token:string ->
  ?type_name:string ->
  unit -> get_inventory_schema_request

val make_get_inventory_result :
  ?next_token:string -> ?entities:inventory_result_entity list -> unit
-> get_inventory_result

val make_get_inventory_request :
  ?max_results:int ->
  ?next_token:string ->
  ?result_attributes:result_attribute list ->
  ?aggregators:inventory_aggregator list ->
  ?filters:inventory_filter list ->
  unit -> get_inventory_request

val make_attachment_content :
  ?url:string ->
  ?hash_type:attachment_hash_type ->
  ?hash:string ->
  ?size:int ->
  ?name:string ->
  unit -> attachment_content

val make_get_document_result :
  ?review_status:review_status ->
  ?attachments_content:attachment_content list ->
  ?requires:document_requires list ->
  ?document_format:document_format ->
  ?document_type:document_type ->
  ?content:string ->
  ?status_information:string ->
  ?status:document_status ->
  ?document_version:string ->
  ?version_name:string ->
  ?display_name:string ->
  ?created_date:float ->
  ?name:string ->
  unit -> get_document_result

val make_get_document_request :
  ?document_format:document_format ->
  ?document_version:string ->
  ?version_name:string ->
  name:string ->
  unit
-> get_document_request

val make_get_deployable_patch_snapshot_for_instance_result :
  ?product:string ->
  ?snapshot_download_url:string ->
  ?snapshot_id:string ->
  ?instance_id:string ->
  unit
-> get_deployable_patch_snapshot_for_instance_result

val make_baseline_override :
  ?sources:patch_source list ->
  ?approved_patches_enable_non_security:bool ->
  ?rejected_patches_action:patch_action ->
  ?rejected_patches:string list ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches:string list ->
  ?approval_rules:patch_rule_group ->
  ?global_filters:patch_filter_group ->
  ?operating_system:operating_system ->
  unit
-> baseline_override

val make_get_deployable_patch_snapshot_for_instance_request :
  ?baseline_override:baseline_override ->
  snapshot_id:string ->
  instance_id:string ->
  unit
-> get_deployable_patch_snapshot_for_instance_request

val make_get_default_patch_baseline_result :
  ?operating_system:operating_system -> ?baseline_id:string -> unit
-> get_default_patch_baseline_result

val make_get_default_patch_baseline_request :
  ?operating_system:operating_system -> unit
-> get_default_patch_baseline_request

val make_get_connection_status_response :
  ?status:connection_status -> ?target:string -> unit
-> get_connection_status_response

val make_get_connection_status_request : target:string -> unit
-> get_connection_status_request

val make_get_command_invocation_result :
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?standard_error_url:string ->
  ?standard_error_content:string ->
  ?standard_output_url:string ->
  ?standard_output_content:string ->
  ?status_details:string ->
  ?status:command_invocation_status ->
  ?execution_end_date_time:string ->
  ?execution_elapsed_time:string ->
  ?execution_start_date_time:string ->
  ?response_code:int ->
  ?plugin_name:string ->
  ?document_version:string ->
  ?document_name:string ->
  ?comment:string ->
  ?instance_id:string ->
  ?command_id:string ->
  unit
-> get_command_invocation_result

val make_get_command_invocation_request :
  ?plugin_name:string -> instance_id:string -> command_id:string -> unit
-> get_command_invocation_request

val make_get_calendar_state_response :
  ?next_transition_time:string ->
  ?at_time:string ->
  ?state:calendar_state ->
  unit -> get_calendar_state_response

val make_get_calendar_state_request :
  ?at_time:string -> calendar_names:string list -> unit
-> get_calendar_state_request

val make_automation_execution :
  ?variables:(string * string list) list ->
  ?change_request_name:string ->
  ?association_id:string ->
  ?ops_item_id:string ->
  ?runbooks:runbook list ->
  ?scheduled_time:float ->
  ?automation_subtype:automation_subtype ->
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?progress_counters:progress_counters ->
  ?target_locations:target_location list ->
  ?target:string ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?resolved_targets:resolved_targets ->
  ?target_maps:(string * string list) list list ->
  ?targets:target list ->
  ?target_parameter_name:string ->
  ?current_action:string ->
  ?current_step_name:string ->
  ?executed_by:string ->
  ?parent_automation_execution_id:string ->
  ?mode:execution_mode ->
  ?failure_message:string ->
  ?outputs:(string * string list) list ->
  ?parameters:(string * string list) list ->
  ?step_executions_truncated:bool ->
  ?step_executions:step_execution list ->
  ?automation_execution_status:automation_execution_status ->
  ?execution_end_time:float ->
  ?execution_start_time:float ->
  ?document_version:string ->
  ?document_name:string ->
  ?automation_execution_id:string ->
  unit -> automation_execution

val make_get_automation_execution_result :
  ?automation_execution:automation_execution -> unit
-> get_automation_execution_result

val make_get_automation_execution_request :
  automation_execution_id:string -> unit
-> get_automation_execution_request

val make_create_association_batch_request_entry :
  ?alarm_configuration:alarm_configuration ->
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?association_name:string ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?targets:target list ->
  ?document_version:string ->
  ?automation_target_parameter_name:string ->
  ?parameters:(string * string list) list ->
  ?instance_id:string ->
  name:string ->
  unit
-> create_association_batch_request_entry

val make_failed_create_association :
  ?fault:fault ->
  ?message:string ->
  ?entry:create_association_batch_request_entry ->
  unit -> failed_create_association

val make_effective_patch : ?patch_status:patch_status -> ?patch:patch -> unit
-> effective_patch

val make_disassociate_ops_item_related_item_response : unit
-> disassociate_ops_item_related_item_response

val make_disassociate_ops_item_related_item_request :
  association_id:string -> ops_item_id:string -> unit
-> disassociate_ops_item_related_item_request

val make_describe_sessions_response :
  ?next_token:string -> ?sessions:session list -> unit
-> describe_sessions_response

val make_describe_sessions_request :
  ?filters:session_filter list ->
  ?next_token:string ->
  ?max_results:int ->
  state:session_state ->
  unit
-> describe_sessions_request

val make_describe_patch_properties_result :
  ?next_token:string -> ?properties:(string * string) list list -> unit
-> describe_patch_properties_result

val make_describe_patch_properties_request :
  ?next_token:string ->
  ?max_results:int ->
  ?patch_set:patch_set ->
  property:patch_property ->
  operating_system:operating_system ->
  unit
-> describe_patch_properties_request

val make_describe_patch_groups_result :
  ?next_token:string ->
  ?mappings:patch_group_patch_baseline_mapping list ->
  unit
-> describe_patch_groups_result

val make_describe_patch_groups_request :
  ?next_token:string ->
  ?filters:patch_orchestrator_filter list ->
  ?max_results:int ->
  unit
-> describe_patch_groups_request

val make_describe_patch_group_state_result :
  ?instances_with_other_non_compliant_patches:int ->
  ?instances_with_security_non_compliant_patches:int ->
  ?instances_with_critical_non_compliant_patches:int ->
  ?instances_with_unreported_not_applicable_patches:int ->
  ?instances_with_not_applicable_patches:int ->
  ?instances_with_failed_patches:int ->
  ?instances_with_missing_patches:int ->
  ?instances_with_installed_rejected_patches:int ->
  ?instances_with_installed_pending_reboot_patches:int ->
  ?instances_with_installed_other_patches:int ->
  ?instances_with_installed_patches:int ->
  ?instances:int ->
  unit
-> describe_patch_group_state_result

val make_describe_patch_group_state_request : patch_group:string -> unit
-> describe_patch_group_state_request

val make_describe_patch_baselines_result :
  ?next_token:string ->
  ?baseline_identities:patch_baseline_identity list ->
  unit
-> describe_patch_baselines_result

val make_describe_patch_baselines_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:patch_orchestrator_filter list ->
  unit
-> describe_patch_baselines_request

val make_describe_parameters_result :
  ?next_token:string -> ?parameters:parameter_metadata list -> unit
-> describe_parameters_result

val make_describe_parameters_request :
  ?shared:bool ->
  ?next_token:string ->
  ?max_results:int ->
  ?parameter_filters:parameter_string_filter list ->
  ?filters:parameters_filter list ->
  unit -> describe_parameters_request

val make_describe_ops_items_response :
  ?ops_item_summaries:ops_item_summary list -> ?next_token:string -> unit
-> describe_ops_items_response

val make_describe_ops_items_request :
  ?next_token:string ->
  ?max_results:int ->
  ?ops_item_filters:ops_item_filter list ->
  unit
-> describe_ops_items_request

val make_describe_maintenance_windows_result :
  ?next_token:string ->
  ?window_identities:maintenance_window_identity list ->
  unit
-> describe_maintenance_windows_result

val make_describe_maintenance_windows_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  unit
-> describe_maintenance_windows_request

val make_describe_maintenance_windows_for_target_result :
  ?next_token:string ->
  ?window_identities:maintenance_window_identity_for_target list ->
  unit
-> describe_maintenance_windows_for_target_result

val make_describe_maintenance_windows_for_target_request :
  ?next_token:string ->
  ?max_results:int ->
  resource_type:maintenance_window_resource_type ->
  targets:target list ->
  unit
-> describe_maintenance_windows_for_target_request

val make_describe_maintenance_window_tasks_result :
  ?next_token:string -> ?tasks:maintenance_window_task list -> unit
-> describe_maintenance_window_tasks_result

val make_describe_maintenance_window_tasks_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  window_id:string ->
  unit
-> describe_maintenance_window_tasks_request

val make_describe_maintenance_window_targets_result :
  ?next_token:string -> ?targets:maintenance_window_target list -> unit
-> describe_maintenance_window_targets_result

val make_describe_maintenance_window_targets_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  window_id:string ->
  unit
-> describe_maintenance_window_targets_request

val make_describe_maintenance_window_schedule_result :
  ?next_token:string ->
  ?scheduled_window_executions:scheduled_window_execution list ->
  unit
-> describe_maintenance_window_schedule_result

val make_describe_maintenance_window_schedule_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:patch_orchestrator_filter list ->
  ?resource_type:maintenance_window_resource_type ->
  ?targets:target list ->
  ?window_id:string ->
  unit
-> describe_maintenance_window_schedule_request

val make_describe_maintenance_window_executions_result :
  ?next_token:string ->
  ?window_executions:maintenance_window_execution list ->
  unit
-> describe_maintenance_window_executions_result

val make_describe_maintenance_window_executions_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  window_id:string ->
  unit
-> describe_maintenance_window_executions_request

val make_describe_maintenance_window_execution_tasks_result :
  ?next_token:string ->
  ?window_execution_task_identities:maintenance_window_execution_task_identity list ->
  unit
-> describe_maintenance_window_execution_tasks_result

val make_describe_maintenance_window_execution_tasks_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  window_execution_id:string ->
  unit
-> describe_maintenance_window_execution_tasks_request

val make_describe_maintenance_window_execution_task_invocations_result :
  ?next_token:string ->
  ?window_execution_task_invocation_identities:maintenance_window_execution_task_invocation_identity list ->
  unit
-> describe_maintenance_window_execution_task_invocations_result

val make_describe_maintenance_window_execution_task_invocations_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  task_id:string ->
  window_execution_id:string ->
  unit
-> describe_maintenance_window_execution_task_invocations_request

val make_describe_inventory_deletions_result :
  ?next_token:string ->
  ?inventory_deletions:inventory_deletion_status_item list ->
  unit
-> describe_inventory_deletions_result

val make_describe_inventory_deletions_request :
  ?max_results:int -> ?next_token:string -> ?deletion_id:string -> unit
-> describe_inventory_deletions_request

val make_describe_instance_properties_result :
  ?next_token:string -> ?instance_properties:instance_property list -> unit
-> describe_instance_properties_result

val make_describe_instance_properties_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters_with_operator:instance_property_string_filter list ->
  ?instance_property_filter_list:instance_property_filter list ->
  unit
-> describe_instance_properties_request

val make_describe_instance_patches_result :
  ?next_token:string -> ?patches:patch_compliance_data list -> unit
-> describe_instance_patches_result

val make_describe_instance_patches_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:patch_orchestrator_filter list ->
  instance_id:string ->
  unit
-> describe_instance_patches_request

val make_describe_instance_patch_states_result :
  ?next_token:string ->
  ?instance_patch_states:instance_patch_state list ->
  unit
-> describe_instance_patch_states_result

val make_describe_instance_patch_states_request :
  ?max_results:int -> ?next_token:string -> instance_ids:string list -> unit
-> describe_instance_patch_states_request

val make_describe_instance_patch_states_for_patch_group_result :
  ?next_token:string ->
  ?instance_patch_states:instance_patch_state list ->
  unit
-> describe_instance_patch_states_for_patch_group_result

val make_describe_instance_patch_states_for_patch_group_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:instance_patch_state_filter list ->
  patch_group:string ->
  unit
-> describe_instance_patch_states_for_patch_group_request

val make_describe_instance_information_result :
  ?next_token:string ->
  ?instance_information_list:instance_information list ->
  unit
-> describe_instance_information_result

val make_describe_instance_information_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:instance_information_string_filter list ->
  ?instance_information_filter_list:instance_information_filter list ->
  unit
-> describe_instance_information_request

val make_describe_instance_associations_status_result :
  ?next_token:string ->
  ?instance_association_status_infos:instance_association_status_info list ->
  unit
-> describe_instance_associations_status_result

val make_describe_instance_associations_status_request :
  ?next_token:string -> ?max_results:int -> instance_id:string -> unit
-> describe_instance_associations_status_request

val make_describe_effective_patches_for_patch_baseline_result :
  ?next_token:string -> ?effective_patches:effective_patch list -> unit
-> describe_effective_patches_for_patch_baseline_result

val make_describe_effective_patches_for_patch_baseline_request :
  ?next_token:string -> ?max_results:int -> baseline_id:string -> unit
-> describe_effective_patches_for_patch_baseline_request

val make_describe_effective_instance_associations_result :
  ?next_token:string -> ?associations:instance_association list -> unit
-> describe_effective_instance_associations_result

val make_describe_effective_instance_associations_request :
  ?next_token:string -> ?max_results:int -> instance_id:string -> unit
-> describe_effective_instance_associations_request

val make_describe_document_result : ?document:document_description -> unit
-> describe_document_result

val make_describe_document_request :
  ?version_name:string -> ?document_version:string -> name:string -> unit
-> describe_document_request

val make_account_sharing_info :
  ?shared_document_version:string -> ?account_id:string -> unit
-> account_sharing_info

val make_describe_document_permission_response :
  ?next_token:string ->
  ?account_sharing_info_list:account_sharing_info list ->
  ?account_ids:string list ->
  unit
-> describe_document_permission_response

val make_describe_document_permission_request :
  ?next_token:string ->
  ?max_results:int ->
  permission_type:document_permission_type ->
  name:string ->
  unit
-> describe_document_permission_request

val make_describe_available_patches_result :
  ?next_token:string -> ?patches:patch list -> unit
-> describe_available_patches_result

val make_describe_available_patches_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:patch_orchestrator_filter list ->
  unit
-> describe_available_patches_request

val make_describe_automation_step_executions_result :
  ?next_token:string -> ?step_executions:step_execution list -> unit
-> describe_automation_step_executions_result

val make_describe_automation_step_executions_request :
  ?reverse_order:bool ->
  ?max_results:int ->
  ?next_token:string ->
  ?filters:step_execution_filter list ->
  automation_execution_id:string ->
  unit
-> describe_automation_step_executions_request

val make_automation_execution_metadata :
  ?change_request_name:string ->
  ?association_id:string ->
  ?ops_item_id:string ->
  ?runbooks:runbook list ->
  ?scheduled_time:float ->
  ?automation_subtype:automation_subtype ->
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?automation_type:automation_type ->
  ?target:string ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?resolved_targets:resolved_targets ->
  ?target_maps:(string * string list) list list ->
  ?targets:target list ->
  ?target_parameter_name:string ->
  ?failure_message:string ->
  ?current_action:string ->
  ?current_step_name:string ->
  ?parent_automation_execution_id:string ->
  ?mode:execution_mode ->
  ?outputs:(string * string list) list ->
  ?log_file:string ->
  ?executed_by:string ->
  ?execution_end_time:float ->
  ?execution_start_time:float ->
  ?automation_execution_status:automation_execution_status ->
  ?document_version:string ->
  ?document_name:string ->
  ?automation_execution_id:string ->
  unit
-> automation_execution_metadata

val make_describe_automation_executions_result :
  ?next_token:string ->
  ?automation_execution_metadata_list:automation_execution_metadata list ->
  unit
-> describe_automation_executions_result

val make_automation_execution_filter :
  values:string list -> key:automation_execution_filter_key -> unit
-> automation_execution_filter

val make_describe_automation_executions_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:automation_execution_filter list ->
  unit
-> describe_automation_executions_request

val make_describe_association_result :
  ?association_description:association_description -> unit
-> describe_association_result

val make_describe_association_request :
  ?association_version:string ->
  ?association_id:string ->
  ?instance_id:string ->
  ?name:string ->
  unit -> describe_association_request

val make_association_execution :
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?resource_count_by_status:string ->
  ?last_execution_date:float ->
  ?created_time:float ->
  ?detailed_status:string ->
  ?status:string ->
  ?execution_id:string ->
  ?association_version:string ->
  ?association_id:string ->
  unit
-> association_execution

val make_describe_association_executions_result :
  ?next_token:string ->
  ?association_executions:association_execution list ->
  unit
-> describe_association_executions_result

val make_association_execution_filter :
  type_:association_filter_operator_type ->
  value:string ->
  key:association_execution_filter_key ->
  unit
-> association_execution_filter

val make_describe_association_executions_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:association_execution_filter list ->
  association_id:string ->
  unit
-> describe_association_executions_request

val make_association_execution_target :
  ?output_source:output_source ->
  ?last_execution_date:float ->
  ?detailed_status:string ->
  ?status:string ->
  ?resource_type:string ->
  ?resource_id:string ->
  ?execution_id:string ->
  ?association_version:string ->
  ?association_id:string ->
  unit
-> association_execution_target

val make_describe_association_execution_targets_result :
  ?next_token:string ->
  ?association_execution_targets:association_execution_target list ->
  unit
-> describe_association_execution_targets_result

val make_association_execution_targets_filter :
  value:string -> key:association_execution_targets_filter_key -> unit
-> association_execution_targets_filter

val make_describe_association_execution_targets_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:association_execution_targets_filter list ->
  execution_id:string ->
  association_id:string ->
  unit -> describe_association_execution_targets_request

val make_activation :
  ?tags:tag list ->
  ?created_date:float ->
  ?expired:bool ->
  ?expiration_date:float ->
  ?registrations_count:int ->
  ?registration_limit:int ->
  ?iam_role:string ->
  ?default_instance_name:string ->
  ?description:string ->
  ?activation_id:string ->
  unit -> activation

val make_describe_activations_result :
  ?next_token:string -> ?activation_list:activation list -> unit
-> describe_activations_result

val make_describe_activations_filter :
  ?filter_values:string list ->
  ?filter_key:describe_activations_filter_keys ->
  unit -> describe_activations_filter

val make_describe_activations_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:describe_activations_filter list ->
  unit
-> describe_activations_request

val make_deregister_task_from_maintenance_window_result :
  ?window_task_id:string -> ?window_id:string -> unit
-> deregister_task_from_maintenance_window_result

val make_deregister_task_from_maintenance_window_request :
  window_task_id:string -> window_id:string -> unit
-> deregister_task_from_maintenance_window_request

val make_deregister_target_from_maintenance_window_result :
  ?window_target_id:string -> ?window_id:string -> unit
-> deregister_target_from_maintenance_window_result

val make_deregister_target_from_maintenance_window_request :
  ?safe:bool -> window_target_id:string -> window_id:string -> unit
-> deregister_target_from_maintenance_window_request

val make_deregister_patch_baseline_for_patch_group_result :
  ?patch_group:string -> ?baseline_id:string -> unit
-> deregister_patch_baseline_for_patch_group_result

val make_deregister_patch_baseline_for_patch_group_request :
  patch_group:string -> baseline_id:string -> unit
-> deregister_patch_baseline_for_patch_group_request

val make_deregister_managed_instance_result : unit
-> deregister_managed_instance_result

val make_deregister_managed_instance_request : instance_id:string -> unit
-> deregister_managed_instance_request

val make_delete_resource_policy_response : unit
-> delete_resource_policy_response

val make_delete_resource_policy_request :
  policy_hash:string -> policy_id:string -> resource_arn:string -> unit
-> delete_resource_policy_request

val make_delete_resource_data_sync_result : unit
-> delete_resource_data_sync_result

val make_delete_resource_data_sync_request :
  ?sync_type:string -> sync_name:string -> unit
-> delete_resource_data_sync_request

val make_delete_patch_baseline_result : ?baseline_id:string -> unit
-> delete_patch_baseline_result

val make_delete_patch_baseline_request : baseline_id:string -> unit
-> delete_patch_baseline_request

val make_delete_parameters_result :
  ?invalid_parameters:string list -> ?deleted_parameters:string list -> unit
-> delete_parameters_result

val make_delete_parameters_request : names:string list -> unit
-> delete_parameters_request

val make_delete_parameter_result : unit
-> delete_parameter_result

val make_delete_parameter_request : name:string -> unit
-> delete_parameter_request

val make_delete_ops_metadata_result : unit
-> delete_ops_metadata_result

val make_delete_ops_metadata_request : ops_metadata_arn:string -> unit
-> delete_ops_metadata_request

val make_delete_ops_item_response : unit
-> delete_ops_item_response

val make_delete_ops_item_request : ops_item_id:string -> unit
-> delete_ops_item_request

val make_delete_maintenance_window_result : ?window_id:string -> unit
-> delete_maintenance_window_result

val make_delete_maintenance_window_request : window_id:string -> unit
-> delete_maintenance_window_request

val make_delete_inventory_result :
  ?deletion_summary:inventory_deletion_summary ->
  ?type_name:string ->
  ?deletion_id:string ->
  unit -> delete_inventory_result

val make_delete_inventory_request :
  ?client_token:string ->
  ?dry_run:bool ->
  ?schema_delete_option:inventory_schema_delete_option ->
  type_name:string ->
  unit -> delete_inventory_request

val make_delete_document_result : unit
-> delete_document_result

val make_delete_document_request :
  ?force:bool ->
  ?version_name:string ->
  ?document_version:string ->
  name:string ->
  unit -> delete_document_request

val make_delete_association_result : unit
-> delete_association_result

val make_delete_association_request :
  ?association_id:string -> ?instance_id:string -> ?name:string -> unit
-> delete_association_request

val make_delete_activation_result : unit
-> delete_activation_result

val make_delete_activation_request : activation_id:string -> unit
-> delete_activation_request

val make_create_resource_data_sync_result : unit
-> create_resource_data_sync_result

val make_create_resource_data_sync_request :
  ?sync_source:resource_data_sync_source ->
  ?sync_type:string ->
  ?s3_destination:resource_data_sync_s3_destination ->
  sync_name:string ->
  unit
-> create_resource_data_sync_request

val make_create_patch_baseline_result : ?baseline_id:string -> unit
-> create_patch_baseline_result

val make_create_patch_baseline_request :
  ?tags:tag list ->
  ?client_token:string ->
  ?sources:patch_source list ->
  ?description:string ->
  ?rejected_patches_action:patch_action ->
  ?rejected_patches:string list ->
  ?approved_patches_enable_non_security:bool ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches:string list ->
  ?approval_rules:patch_rule_group ->
  ?global_filters:patch_filter_group ->
  ?operating_system:operating_system ->
  name:string ->
  unit -> create_patch_baseline_request

val make_create_ops_metadata_result : ?ops_metadata_arn:string -> unit
-> create_ops_metadata_result

val make_create_ops_metadata_request :
  ?tags:tag list ->
  ?metadata:(string * metadata_value) list ->
  resource_id:string ->
  unit -> create_ops_metadata_request

val make_create_ops_item_response :
  ?ops_item_arn:string -> ?ops_item_id:string -> unit
-> create_ops_item_response

val make_create_ops_item_request :
  ?account_id:string ->
  ?planned_end_time:float ->
  ?planned_start_time:float ->
  ?actual_end_time:float ->
  ?actual_start_time:float ->
  ?severity:string ->
  ?category:string ->
  ?tags:tag list ->
  ?related_ops_items:related_ops_item list ->
  ?priority:int ->
  ?notifications:ops_item_notification list ->
  ?operational_data:(string * ops_item_data_value) list ->
  ?ops_item_type:string ->
  title:string ->
  source:string ->
  description:string ->
  unit -> create_ops_item_request

val make_create_maintenance_window_result : ?window_id:string -> unit
-> create_maintenance_window_result

val make_create_maintenance_window_request :
  ?tags:tag list ->
  ?client_token:string ->
  ?schedule_offset:int ->
  ?schedule_timezone:string ->
  ?end_date:string ->
  ?start_date:string ->
  ?description:string ->
  allow_unassociated_targets:bool ->
  cutoff:int ->
  duration:int ->
  schedule:string ->
  name:string ->
  unit -> create_maintenance_window_request

val make_create_document_result :
  ?document_description:document_description -> unit
-> create_document_result

val make_create_document_request :
  ?tags:tag list ->
  ?target_type:string ->
  ?document_format:document_format ->
  ?document_type:document_type ->
  ?version_name:string ->
  ?display_name:string ->
  ?attachments:attachments_source list ->
  ?requires:document_requires list ->
  name:string ->
  content:string ->
  unit -> create_document_request

val make_create_association_result :
  ?association_description:association_description -> unit
-> create_association_result

val make_create_association_request :
  ?alarm_configuration:alarm_configuration ->
  ?tags:tag list ->
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?automation_target_parameter_name:string ->
  ?association_name:string ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?targets:target list ->
  ?parameters:(string * string list) list ->
  ?instance_id:string ->
  ?document_version:string ->
  name:string ->
  unit
-> create_association_request

val make_create_association_batch_result :
  ?failed:failed_create_association list ->
  ?successful:association_description list ->
  unit
-> create_association_batch_result

val make_create_association_batch_request :
  entries:create_association_batch_request_entry list -> unit
-> create_association_batch_request

val make_create_activation_result :
  ?activation_code:string -> ?activation_id:string -> unit
-> create_activation_result

val make_create_activation_request :
  ?registration_metadata:registration_metadata_item list ->
  ?tags:tag list ->
  ?expiration_date:float ->
  ?registration_limit:int ->
  ?default_instance_name:string ->
  ?description:string ->
  iam_role:string ->
  unit
-> create_activation_request

val make_cancel_maintenance_window_execution_result :
  ?window_execution_id:string -> unit
-> cancel_maintenance_window_execution_result

val make_cancel_maintenance_window_execution_request :
  window_execution_id:string -> unit
-> cancel_maintenance_window_execution_request

val make_cancel_command_result : unit
-> cancel_command_result

val make_cancel_command_request :
  ?instance_ids:string list -> command_id:string -> unit
-> cancel_command_request

val make_associate_ops_item_related_item_response :
  ?association_id:string -> unit
-> associate_ops_item_related_item_response

val make_associate_ops_item_related_item_request :
  resource_uri:string ->
  resource_type:string ->
  association_type:string ->
  ops_item_id:string ->
  unit
-> associate_ops_item_related_item_request

val make_add_tags_to_resource_result : unit
-> add_tags_to_resource_result

val make_add_tags_to_resource_request :
  tags:tag list ->
  resource_id:string ->
  resource_type:resource_type_for_tagging ->
  unit
-> add_tags_to_resource_request

