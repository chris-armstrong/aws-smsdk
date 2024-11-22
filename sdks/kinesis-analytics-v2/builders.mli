open Types
val make_zeppelin_monitoring_configuration_update :
  log_level_update:log_level -> unit
-> zeppelin_monitoring_configuration_update

val make_zeppelin_monitoring_configuration_description :
  ?log_level:log_level -> unit
-> zeppelin_monitoring_configuration_description

val make_zeppelin_monitoring_configuration : log_level:log_level -> unit
-> zeppelin_monitoring_configuration

val make_glue_data_catalog_configuration_update :
  database_arn_update:string -> unit
-> glue_data_catalog_configuration_update

val make_catalog_configuration_update :
  glue_data_catalog_configuration_update:glue_data_catalog_configuration_update ->
  unit
-> catalog_configuration_update

val make_s3_content_base_location_update :
  ?base_path_update:string -> ?bucket_arn_update:string -> unit
-> s3_content_base_location_update

val make_deploy_as_application_configuration_update :
  ?s3_content_location_update:s3_content_base_location_update -> unit
-> deploy_as_application_configuration_update

val make_s3_content_location :
  ?object_version:string -> file_key:string -> bucket_ar_n:string -> unit
-> s3_content_location

val make_maven_reference :
  version:string -> artifact_id:string -> group_id:string -> unit
-> maven_reference

val make_custom_artifact_configuration :
  ?maven_reference:maven_reference ->
  ?s3_content_location:s3_content_location ->
  artifact_type:artifact_type ->
  unit
-> custom_artifact_configuration

val make_zeppelin_application_configuration_update :
  ?custom_artifacts_configuration_update:custom_artifact_configuration list ->
  ?deploy_as_application_configuration_update:deploy_as_application_configuration_update ->
  ?catalog_configuration_update:catalog_configuration_update ->
  ?monitoring_configuration_update:zeppelin_monitoring_configuration_update ->
  unit
-> zeppelin_application_configuration_update

val make_glue_data_catalog_configuration_description :
  database_ar_n:string -> unit
-> glue_data_catalog_configuration_description

val make_catalog_configuration_description :
  glue_data_catalog_configuration_description:glue_data_catalog_configuration_description ->
  unit
-> catalog_configuration_description

val make_s3_content_base_location_description :
  ?base_path:string -> bucket_ar_n:string -> unit
-> s3_content_base_location_description

val make_deploy_as_application_configuration_description :
  s3_content_location_description:s3_content_base_location_description ->
  unit
-> deploy_as_application_configuration_description

val make_custom_artifact_configuration_description :
  ?maven_reference_description:maven_reference ->
  ?s3_content_location_description:s3_content_location ->
  ?artifact_type:artifact_type ->
  unit
-> custom_artifact_configuration_description

val make_zeppelin_application_configuration_description :
  ?custom_artifacts_configuration_description:custom_artifact_configuration_description list ->
  ?deploy_as_application_configuration_description:deploy_as_application_configuration_description ->
  ?catalog_configuration_description:catalog_configuration_description ->
  monitoring_configuration_description:zeppelin_monitoring_configuration_description ->
  unit
-> zeppelin_application_configuration_description

val make_glue_data_catalog_configuration : database_ar_n:string -> unit
-> glue_data_catalog_configuration

val make_catalog_configuration :
  glue_data_catalog_configuration:glue_data_catalog_configuration -> unit
-> catalog_configuration

val make_s3_content_base_location :
  ?base_path:string -> bucket_ar_n:string -> unit
-> s3_content_base_location

val make_deploy_as_application_configuration :
  s3_content_location:s3_content_base_location -> unit
-> deploy_as_application_configuration

val make_zeppelin_application_configuration :
  ?custom_artifacts_configuration:custom_artifact_configuration list ->
  ?deploy_as_application_configuration:deploy_as_application_configuration ->
  ?catalog_configuration:catalog_configuration ->
  ?monitoring_configuration:zeppelin_monitoring_configuration ->
  unit -> zeppelin_application_configuration

val make_vpc_configuration :
  security_group_ids:string list -> subnet_ids:string list -> unit
-> vpc_configuration

val make_vpc_configuration_update :
  ?security_group_id_updates:string list ->
  ?subnet_id_updates:string list ->
  vpc_configuration_id:string ->
  unit -> vpc_configuration_update

val make_vpc_configuration_description :
  security_group_ids:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  vpc_configuration_id:string ->
  unit
-> vpc_configuration_description

val make_input_lambda_processor_description :
  ?role_ar_n:string -> resource_ar_n:string -> unit
-> input_lambda_processor_description

val make_input_processing_configuration_description :
  ?input_lambda_processor_description:input_lambda_processor_description ->
  unit
-> input_processing_configuration_description

val make_kinesis_streams_input_description :
  ?role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_streams_input_description

val make_kinesis_firehose_input_description :
  ?role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_firehose_input_description

val make_json_mapping_parameters : record_row_path:string -> unit
-> json_mapping_parameters

val make_csv_mapping_parameters :
  record_column_delimiter:string -> record_row_delimiter:string -> unit
-> csv_mapping_parameters

val make_mapping_parameters :
  ?csv_mapping_parameters:csv_mapping_parameters ->
  ?json_mapping_parameters:json_mapping_parameters ->
  unit -> mapping_parameters

val make_record_format :
  ?mapping_parameters:mapping_parameters ->
  record_format_type:record_format_type ->
  unit -> record_format

val make_record_column :
  ?mapping:string -> sql_type:string -> name:string -> unit
-> record_column

val make_source_schema :
  ?record_encoding:string ->
  record_columns:record_column list ->
  record_format:record_format ->
  unit -> source_schema

val make_input_parallelism : ?count:int -> unit
-> input_parallelism

val make_input_starting_position_configuration :
  ?input_starting_position:input_starting_position -> unit
-> input_starting_position_configuration

val make_input_description :
  ?input_starting_position_configuration:input_starting_position_configuration ->
  ?input_parallelism:input_parallelism ->
  ?input_schema:source_schema ->
  ?kinesis_firehose_input_description:kinesis_firehose_input_description ->
  ?kinesis_streams_input_description:kinesis_streams_input_description ->
  ?input_processing_configuration_description:input_processing_configuration_description ->
  ?in_app_stream_names:string list ->
  ?name_prefix:string ->
  ?input_id:string ->
  unit -> input_description

val make_kinesis_streams_output_description :
  ?role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_streams_output_description

val make_kinesis_firehose_output_description :
  ?role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_firehose_output_description

val make_lambda_output_description :
  ?role_ar_n:string -> resource_ar_n:string -> unit
-> lambda_output_description

val make_destination_schema : record_format_type:record_format_type -> unit
-> destination_schema

val make_output_description :
  ?destination_schema:destination_schema ->
  ?lambda_output_description:lambda_output_description ->
  ?kinesis_firehose_output_description:kinesis_firehose_output_description ->
  ?kinesis_streams_output_description:kinesis_streams_output_description ->
  ?name:string ->
  ?output_id:string ->
  unit -> output_description

val make_s3_reference_data_source_description :
  ?reference_role_ar_n:string ->
  file_key:string ->
  bucket_ar_n:string ->
  unit
-> s3_reference_data_source_description

val make_reference_data_source_description :
  ?reference_schema:source_schema ->
  s3_reference_data_source_description:s3_reference_data_source_description ->
  table_name:string ->
  reference_id:string ->
  unit
-> reference_data_source_description

val make_sql_application_configuration_description :
  ?reference_data_source_descriptions:reference_data_source_description list ->
  ?output_descriptions:output_description list ->
  ?input_descriptions:input_description list ->
  unit
-> sql_application_configuration_description

val make_s3_application_code_location_description :
  ?object_version:string -> file_key:string -> bucket_ar_n:string -> unit
-> s3_application_code_location_description

val make_code_content_description :
  ?s3_application_code_location_description:s3_application_code_location_description ->
  ?code_size:int ->
  ?code_m_d5:string ->
  ?text_content:string ->
  unit
-> code_content_description

val make_application_code_configuration_description :
  ?code_content_description:code_content_description ->
  code_content_type:code_content_type ->
  unit
-> application_code_configuration_description

val make_application_restore_configuration :
  ?snapshot_name:string ->
  application_restore_type:application_restore_type ->
  unit -> application_restore_configuration

val make_flink_run_configuration : ?allow_non_restored_state:bool -> unit
-> flink_run_configuration

val make_run_configuration_description :
  ?flink_run_configuration_description:flink_run_configuration ->
  ?application_restore_configuration_description:application_restore_configuration ->
  unit
-> run_configuration_description

val make_checkpoint_configuration_description :
  ?min_pause_between_checkpoints:int ->
  ?checkpoint_interval:int ->
  ?checkpointing_enabled:bool ->
  ?configuration_type:configuration_type ->
  unit
-> checkpoint_configuration_description

val make_monitoring_configuration_description :
  ?log_level:log_level ->
  ?metrics_level:metrics_level ->
  ?configuration_type:configuration_type ->
  unit
-> monitoring_configuration_description

val make_parallelism_configuration_description :
  ?auto_scaling_enabled:bool ->
  ?current_parallelism:int ->
  ?parallelism_per_kp_u:int ->
  ?parallelism:int ->
  ?configuration_type:configuration_type ->
  unit
-> parallelism_configuration_description

val make_flink_application_configuration_description :
  ?job_plan_description:string ->
  ?parallelism_configuration_description:parallelism_configuration_description ->
  ?monitoring_configuration_description:monitoring_configuration_description ->
  ?checkpoint_configuration_description:checkpoint_configuration_description ->
  unit
-> flink_application_configuration_description

val make_property_group :
  property_map:(string * string) list -> property_group_id:string -> unit
-> property_group

val make_environment_property_descriptions :
  ?property_group_descriptions:property_group list -> unit
-> environment_property_descriptions

val make_application_snapshot_configuration_description :
  snapshots_enabled:bool -> unit
-> application_snapshot_configuration_description

val make_application_configuration_description :
  ?zeppelin_application_configuration_description:zeppelin_application_configuration_description ->
  ?vpc_configuration_descriptions:vpc_configuration_description list ->
  ?application_snapshot_configuration_description:application_snapshot_configuration_description ->
  ?environment_property_descriptions:environment_property_descriptions ->
  ?flink_application_configuration_description:flink_application_configuration_description ->
  ?run_configuration_description:run_configuration_description ->
  ?application_code_configuration_description:application_code_configuration_description ->
  ?sql_application_configuration_description:sql_application_configuration_description ->
  unit
-> application_configuration_description

val make_cloud_watch_logging_option_description :
  ?role_ar_n:string ->
  ?cloud_watch_logging_option_id:string ->
  log_stream_ar_n:string ->
  unit
-> cloud_watch_logging_option_description

val make_application_maintenance_configuration_description :
  application_maintenance_window_end_time:string ->
  application_maintenance_window_start_time:string ->
  unit
-> application_maintenance_configuration_description

val make_application_detail :
  ?application_mode:application_mode ->
  ?application_version_rolled_back_to:int ->
  ?conditional_token:string ->
  ?application_version_rolled_back_from:int ->
  ?application_version_updated_from:int ->
  ?application_maintenance_configuration_description:application_maintenance_configuration_description ->
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_description list ->
  ?application_configuration_description:application_configuration_description ->
  ?last_update_timestamp:float ->
  ?create_timestamp:float ->
  ?service_execution_role:string ->
  ?application_description:string ->
  application_version_id:int ->
  application_status:application_status ->
  runtime_environment:runtime_environment ->
  application_name:string ->
  application_ar_n:string ->
  unit -> application_detail

val make_update_application_response :
  application_detail:application_detail -> unit
-> update_application_response

val make_input_lambda_processor_update : resource_arn_update:string -> unit
-> input_lambda_processor_update

val make_input_processing_configuration_update :
  input_lambda_processor_update:input_lambda_processor_update -> unit
-> input_processing_configuration_update

val make_kinesis_streams_input_update : resource_arn_update:string -> unit
-> kinesis_streams_input_update

val make_kinesis_firehose_input_update : resource_arn_update:string -> unit
-> kinesis_firehose_input_update

val make_input_schema_update :
  ?record_column_updates:record_column list ->
  ?record_encoding_update:string ->
  ?record_format_update:record_format ->
  unit -> input_schema_update

val make_input_parallelism_update : count_update:int -> unit
-> input_parallelism_update

val make_input_update :
  ?input_parallelism_update:input_parallelism_update ->
  ?input_schema_update:input_schema_update ->
  ?kinesis_firehose_input_update:kinesis_firehose_input_update ->
  ?kinesis_streams_input_update:kinesis_streams_input_update ->
  ?input_processing_configuration_update:input_processing_configuration_update ->
  ?name_prefix_update:string ->
  input_id:string ->
  unit -> input_update

val make_kinesis_streams_output_update : resource_arn_update:string -> unit
-> kinesis_streams_output_update

val make_kinesis_firehose_output_update : resource_arn_update:string -> unit
-> kinesis_firehose_output_update

val make_lambda_output_update : resource_arn_update:string -> unit
-> lambda_output_update

val make_output_update :
  ?destination_schema_update:destination_schema ->
  ?lambda_output_update:lambda_output_update ->
  ?kinesis_firehose_output_update:kinesis_firehose_output_update ->
  ?kinesis_streams_output_update:kinesis_streams_output_update ->
  ?name_update:string ->
  output_id:string ->
  unit -> output_update

val make_s3_reference_data_source_update :
  ?file_key_update:string -> ?bucket_arn_update:string -> unit
-> s3_reference_data_source_update

val make_reference_data_source_update :
  ?reference_schema_update:source_schema ->
  ?s3_reference_data_source_update:s3_reference_data_source_update ->
  ?table_name_update:string ->
  reference_id:string ->
  unit
-> reference_data_source_update

val make_sql_application_configuration_update :
  ?reference_data_source_updates:reference_data_source_update list ->
  ?output_updates:output_update list ->
  ?input_updates:input_update list ->
  unit
-> sql_application_configuration_update

val make_s3_content_location_update :
  ?object_version_update:string ->
  ?file_key_update:string ->
  ?bucket_arn_update:string ->
  unit -> s3_content_location_update

val make_code_content_update :
  ?s3_content_location_update:s3_content_location_update ->
  ?zip_file_content_update:bytes ->
  ?text_content_update:string ->
  unit -> code_content_update

val make_application_code_configuration_update :
  ?code_content_update:code_content_update ->
  ?code_content_type_update:code_content_type ->
  unit
-> application_code_configuration_update

val make_checkpoint_configuration_update :
  ?min_pause_between_checkpoints_update:int ->
  ?checkpoint_interval_update:int ->
  ?checkpointing_enabled_update:bool ->
  ?configuration_type_update:configuration_type ->
  unit
-> checkpoint_configuration_update

val make_monitoring_configuration_update :
  ?log_level_update:log_level ->
  ?metrics_level_update:metrics_level ->
  ?configuration_type_update:configuration_type ->
  unit
-> monitoring_configuration_update

val make_parallelism_configuration_update :
  ?auto_scaling_enabled_update:bool ->
  ?parallelism_per_kpu_update:int ->
  ?parallelism_update:int ->
  ?configuration_type_update:configuration_type ->
  unit
-> parallelism_configuration_update

val make_flink_application_configuration_update :
  ?parallelism_configuration_update:parallelism_configuration_update ->
  ?monitoring_configuration_update:monitoring_configuration_update ->
  ?checkpoint_configuration_update:checkpoint_configuration_update ->
  unit
-> flink_application_configuration_update

val make_environment_property_updates :
  property_groups:property_group list -> unit
-> environment_property_updates

val make_application_snapshot_configuration_update :
  snapshots_enabled_update:bool -> unit
-> application_snapshot_configuration_update

val make_application_configuration_update :
  ?zeppelin_application_configuration_update:zeppelin_application_configuration_update ->
  ?vpc_configuration_updates:vpc_configuration_update list ->
  ?application_snapshot_configuration_update:application_snapshot_configuration_update ->
  ?environment_property_updates:environment_property_updates ->
  ?flink_application_configuration_update:flink_application_configuration_update ->
  ?application_code_configuration_update:application_code_configuration_update ->
  ?sql_application_configuration_update:sql_application_configuration_update ->
  unit -> application_configuration_update

val make_run_configuration_update :
  ?application_restore_configuration:application_restore_configuration ->
  ?flink_run_configuration:flink_run_configuration ->
  unit
-> run_configuration_update

val make_cloud_watch_logging_option_update :
  ?log_stream_arn_update:string ->
  cloud_watch_logging_option_id:string ->
  unit
-> cloud_watch_logging_option_update

val make_update_application_request :
  ?runtime_environment_update:runtime_environment ->
  ?conditional_token:string ->
  ?cloud_watch_logging_option_updates:cloud_watch_logging_option_update list ->
  ?run_configuration_update:run_configuration_update ->
  ?service_execution_role_update:string ->
  ?application_configuration_update:application_configuration_update ->
  ?current_application_version_id:int ->
  application_name:string ->
  unit
-> update_application_request

val make_update_application_maintenance_configuration_response :
  ?application_maintenance_configuration_description:application_maintenance_configuration_description ->
  ?application_ar_n:string ->
  unit
-> update_application_maintenance_configuration_response

val make_application_maintenance_configuration_update :
  application_maintenance_window_start_time_update:string -> unit
-> application_maintenance_configuration_update

val make_update_application_maintenance_configuration_request :
  application_maintenance_configuration_update:application_maintenance_configuration_update ->
  application_name:string ->
  unit
-> update_application_maintenance_configuration_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request

val make_tag : ?value:string -> key:string -> unit
-> tag

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request

val make_stop_application_response : unit
-> stop_application_response

val make_stop_application_request :
  ?force:bool -> application_name:string -> unit
-> stop_application_request

val make_start_application_response : unit
-> start_application_response

val make_sql_run_configuration :
  input_starting_position_configuration:input_starting_position_configuration ->
  input_id:string ->
  unit -> sql_run_configuration

val make_run_configuration :
  ?application_restore_configuration:application_restore_configuration ->
  ?sql_run_configurations:sql_run_configuration list ->
  ?flink_run_configuration:flink_run_configuration ->
  unit -> run_configuration

val make_start_application_request :
  ?run_configuration:run_configuration -> application_name:string -> unit
-> start_application_request

val make_input_lambda_processor : resource_ar_n:string -> unit
-> input_lambda_processor

val make_input_processing_configuration :
  input_lambda_processor:input_lambda_processor -> unit
-> input_processing_configuration

val make_kinesis_streams_input : resource_ar_n:string -> unit
-> kinesis_streams_input

val make_kinesis_firehose_input : resource_ar_n:string -> unit
-> kinesis_firehose_input

val make_input :
  ?input_parallelism:input_parallelism ->
  ?kinesis_firehose_input:kinesis_firehose_input ->
  ?kinesis_streams_input:kinesis_streams_input ->
  ?input_processing_configuration:input_processing_configuration ->
  input_schema:source_schema ->
  name_prefix:string ->
  unit -> input

val make_kinesis_streams_output : resource_ar_n:string -> unit
-> kinesis_streams_output

val make_kinesis_firehose_output : resource_ar_n:string -> unit
-> kinesis_firehose_output

val make_lambda_output : resource_ar_n:string -> unit
-> lambda_output

val make_output :
  ?lambda_output:lambda_output ->
  ?kinesis_firehose_output:kinesis_firehose_output ->
  ?kinesis_streams_output:kinesis_streams_output ->
  destination_schema:destination_schema ->
  name:string ->
  unit -> output

val make_s3_reference_data_source :
  ?file_key:string -> ?bucket_ar_n:string -> unit
-> s3_reference_data_source

val make_reference_data_source :
  ?s3_reference_data_source:s3_reference_data_source ->
  reference_schema:source_schema ->
  table_name:string ->
  unit -> reference_data_source

val make_sql_application_configuration :
  ?reference_data_sources:reference_data_source list ->
  ?outputs:output list ->
  ?inputs:input list ->
  unit -> sql_application_configuration

val make_snapshot_details :
  ?runtime_environment:runtime_environment ->
  ?snapshot_creation_timestamp:float ->
  application_version_id:int ->
  snapshot_status:snapshot_status ->
  snapshot_name:string ->
  unit -> snapshot_details

val make_s3_configuration : file_key:string -> bucket_ar_n:string -> unit
-> s3_configuration

val make_rollback_application_response :
  application_detail:application_detail -> unit
-> rollback_application_response

val make_rollback_application_request :
  current_application_version_id:int -> application_name:string -> unit
-> rollback_application_request

val make_parallelism_configuration :
  ?auto_scaling_enabled:bool ->
  ?parallelism_per_kp_u:int ->
  ?parallelism:int ->
  configuration_type:configuration_type ->
  unit -> parallelism_configuration

val make_monitoring_configuration :
  ?log_level:log_level ->
  ?metrics_level:metrics_level ->
  configuration_type:configuration_type ->
  unit -> monitoring_configuration

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_application_summary :
  ?application_mode:application_mode ->
  runtime_environment:runtime_environment ->
  application_version_id:int ->
  application_status:application_status ->
  application_ar_n:string ->
  application_name:string ->
  unit -> application_summary

val make_list_applications_response :
  ?next_token:string ->
  application_summaries:application_summary list ->
  unit -> list_applications_response

val make_list_applications_request : ?next_token:string -> ?limit:int -> unit
-> list_applications_request

val make_application_version_summary :
  application_status:application_status -> application_version_id:int -> unit
-> application_version_summary

val make_list_application_versions_response :
  ?next_token:string ->
  ?application_version_summaries:application_version_summary list ->
  unit
-> list_application_versions_response

val make_list_application_versions_request :
  ?next_token:string -> ?limit:int -> application_name:string -> unit
-> list_application_versions_request

val make_list_application_snapshots_response :
  ?next_token:string -> ?snapshot_summaries:snapshot_details list -> unit
-> list_application_snapshots_response

val make_list_application_snapshots_request :
  ?next_token:string -> ?limit:int -> application_name:string -> unit
-> list_application_snapshots_request

val make_discover_input_schema_response :
  ?raw_input_records:string list ->
  ?processed_input_records:string list ->
  ?parsed_input_records:string list list ->
  ?input_schema:source_schema ->
  unit
-> discover_input_schema_response

val make_discover_input_schema_request :
  ?input_processing_configuration:input_processing_configuration ->
  ?s3_configuration:s3_configuration ->
  ?input_starting_position_configuration:input_starting_position_configuration ->
  ?resource_ar_n:string ->
  service_execution_role:string ->
  unit
-> discover_input_schema_request

val make_describe_application_version_response :
  ?application_version_detail:application_detail -> unit
-> describe_application_version_response

val make_describe_application_version_request :
  application_version_id:int -> application_name:string -> unit
-> describe_application_version_request

val make_describe_application_snapshot_response :
  snapshot_details:snapshot_details -> unit
-> describe_application_snapshot_response

val make_describe_application_snapshot_request :
  snapshot_name:string -> application_name:string -> unit
-> describe_application_snapshot_request

val make_describe_application_response :
  application_detail:application_detail -> unit
-> describe_application_response

val make_describe_application_request :
  ?include_additional_details:bool -> application_name:string -> unit
-> describe_application_request

val make_delete_application_vpc_configuration_response :
  ?application_version_id:int -> ?application_ar_n:string -> unit
-> delete_application_vpc_configuration_response

val make_delete_application_vpc_configuration_request :
  ?conditional_token:string ->
  ?current_application_version_id:int ->
  vpc_configuration_id:string ->
  application_name:string ->
  unit
-> delete_application_vpc_configuration_request

val make_delete_application_snapshot_response : unit
-> delete_application_snapshot_response

val make_delete_application_snapshot_request :
  snapshot_creation_timestamp:float ->
  snapshot_name:string ->
  application_name:string ->
  unit
-> delete_application_snapshot_request

val make_delete_application_reference_data_source_response :
  ?application_version_id:int -> ?application_ar_n:string -> unit
-> delete_application_reference_data_source_response

val make_delete_application_reference_data_source_request :
  reference_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_reference_data_source_request

val make_delete_application_output_response :
  ?application_version_id:int -> ?application_ar_n:string -> unit
-> delete_application_output_response

val make_delete_application_output_request :
  output_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_output_request

val make_delete_application_input_processing_configuration_response :
  ?application_version_id:int -> ?application_ar_n:string -> unit
-> delete_application_input_processing_configuration_response

val make_delete_application_input_processing_configuration_request :
  input_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_input_processing_configuration_request

val make_delete_application_cloud_watch_logging_option_response :
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_description list ->
  ?application_version_id:int ->
  ?application_ar_n:string ->
  unit
-> delete_application_cloud_watch_logging_option_response

val make_delete_application_cloud_watch_logging_option_request :
  ?conditional_token:string ->
  ?current_application_version_id:int ->
  cloud_watch_logging_option_id:string ->
  application_name:string ->
  unit
-> delete_application_cloud_watch_logging_option_request

val make_delete_application_response : unit
-> delete_application_response

val make_delete_application_request :
  create_timestamp:float -> application_name:string -> unit
-> delete_application_request

val make_create_application_snapshot_response : unit
-> create_application_snapshot_response

val make_create_application_snapshot_request :
  snapshot_name:string -> application_name:string -> unit
-> create_application_snapshot_request

val make_create_application_presigned_url_response :
  ?authorized_url:string -> unit
-> create_application_presigned_url_response

val make_create_application_presigned_url_request :
  ?session_expiration_duration_in_seconds:int ->
  url_type:url_type ->
  application_name:string ->
  unit
-> create_application_presigned_url_request

val make_create_application_response :
  application_detail:application_detail -> unit
-> create_application_response

val make_checkpoint_configuration :
  ?min_pause_between_checkpoints:int ->
  ?checkpoint_interval:int ->
  ?checkpointing_enabled:bool ->
  configuration_type:configuration_type ->
  unit -> checkpoint_configuration

val make_flink_application_configuration :
  ?parallelism_configuration:parallelism_configuration ->
  ?monitoring_configuration:monitoring_configuration ->
  ?checkpoint_configuration:checkpoint_configuration ->
  unit -> flink_application_configuration

val make_environment_properties : property_groups:property_group list -> unit
-> environment_properties

val make_code_content :
  ?s3_content_location:s3_content_location ->
  ?zip_file_content:bytes ->
  ?text_content:string ->
  unit -> code_content

val make_application_code_configuration :
  ?code_content:code_content -> code_content_type:code_content_type -> unit
-> application_code_configuration

val make_application_snapshot_configuration : snapshots_enabled:bool -> unit
-> application_snapshot_configuration

val make_application_configuration :
  ?zeppelin_application_configuration:zeppelin_application_configuration ->
  ?vpc_configurations:vpc_configuration list ->
  ?application_snapshot_configuration:application_snapshot_configuration ->
  ?application_code_configuration:application_code_configuration ->
  ?environment_properties:environment_properties ->
  ?flink_application_configuration:flink_application_configuration ->
  ?sql_application_configuration:sql_application_configuration ->
  unit -> application_configuration

val make_cloud_watch_logging_option : log_stream_ar_n:string -> unit
-> cloud_watch_logging_option

val make_create_application_request :
  ?application_mode:application_mode ->
  ?tags:tag list ->
  ?cloud_watch_logging_options:cloud_watch_logging_option list ->
  ?application_configuration:application_configuration ->
  ?application_description:string ->
  service_execution_role:string ->
  runtime_environment:runtime_environment ->
  application_name:string ->
  unit
-> create_application_request

val make_add_application_vpc_configuration_response :
  ?vpc_configuration_description:vpc_configuration_description ->
  ?application_version_id:int ->
  ?application_ar_n:string ->
  unit
-> add_application_vpc_configuration_response

val make_add_application_vpc_configuration_request :
  ?conditional_token:string ->
  ?current_application_version_id:int ->
  vpc_configuration:vpc_configuration ->
  application_name:string ->
  unit
-> add_application_vpc_configuration_request

val make_add_application_reference_data_source_response :
  ?reference_data_source_descriptions:reference_data_source_description list ->
  ?application_version_id:int ->
  ?application_ar_n:string ->
  unit
-> add_application_reference_data_source_response

val make_add_application_reference_data_source_request :
  reference_data_source:reference_data_source ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_reference_data_source_request

val make_add_application_output_response :
  ?output_descriptions:output_description list ->
  ?application_version_id:int ->
  ?application_ar_n:string ->
  unit
-> add_application_output_response

val make_add_application_output_request :
  output:output ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_output_request

val make_add_application_input_processing_configuration_response :
  ?input_processing_configuration_description:input_processing_configuration_description ->
  ?input_id:string ->
  ?application_version_id:int ->
  ?application_ar_n:string ->
  unit
-> add_application_input_processing_configuration_response

val make_add_application_input_processing_configuration_request :
  input_processing_configuration:input_processing_configuration ->
  input_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_input_processing_configuration_request

val make_add_application_input_response :
  ?input_descriptions:input_description list ->
  ?application_version_id:int ->
  ?application_ar_n:string ->
  unit
-> add_application_input_response

val make_add_application_input_request :
  input:input ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_input_request

val make_add_application_cloud_watch_logging_option_response :
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_description list ->
  ?application_version_id:int ->
  ?application_ar_n:string ->
  unit
-> add_application_cloud_watch_logging_option_response

val make_add_application_cloud_watch_logging_option_request :
  ?conditional_token:string ->
  ?current_application_version_id:int ->
  cloud_watch_logging_option:cloud_watch_logging_option ->
  application_name:string ->
  unit
-> add_application_cloud_watch_logging_option_request

