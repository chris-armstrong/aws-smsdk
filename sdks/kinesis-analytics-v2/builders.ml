[@@@warning "-39"]
open Types
let make_zeppelin_monitoring_configuration_update 
  ~(log_level_update : log_level) ()
: zeppelin_monitoring_configuration_update = { log_level_update; 
}

let make_zeppelin_monitoring_configuration_description 
  ?(log_level : log_level option) ()
: zeppelin_monitoring_configuration_description = { log_level; 
}

let make_zeppelin_monitoring_configuration  ~(log_level : log_level) ()
: zeppelin_monitoring_configuration = { log_level; 
}

let make_glue_data_catalog_configuration_update 
  ~(database_arn_update : string) () : glue_data_catalog_configuration_update
= { database_arn_update;  }

let make_catalog_configuration_update 
  ~(glue_data_catalog_configuration_update : glue_data_catalog_configuration_update)
  () : catalog_configuration_update = {
  glue_data_catalog_configuration_update; 
}

let make_s3_content_base_location_update 
  ?(base_path_update : string option) ?(bucket_arn_update : string option) ()
: s3_content_base_location_update = { base_path_update; bucket_arn_update; 
}

let make_deploy_as_application_configuration_update 
  ?(s3_content_location_update : s3_content_base_location_update option) ()
: deploy_as_application_configuration_update = { s3_content_location_update; 
}

let make_s3_content_location 
  ?(object_version : string option)
  ~(file_key : string)
  ~(bucket_ar_n : string)
  () : s3_content_location = { object_version; file_key; bucket_ar_n; 
}

let make_maven_reference 
  ~(version : string) ~(artifact_id : string) ~(group_id : string) ()
: maven_reference = { version; artifact_id; group_id; 
}

let make_custom_artifact_configuration 
  ?(maven_reference : maven_reference option)
  ?(s3_content_location : s3_content_location option)
  ~(artifact_type : artifact_type)
  () : custom_artifact_configuration = {
  maven_reference; s3_content_location; artifact_type; 
}

let make_zeppelin_application_configuration_update 
  ?(custom_artifacts_configuration_update : custom_artifact_configuration list option)
  ?(deploy_as_application_configuration_update : deploy_as_application_configuration_update option)
  ?(catalog_configuration_update : catalog_configuration_update option)
  ?(monitoring_configuration_update : zeppelin_monitoring_configuration_update option)
  () : zeppelin_application_configuration_update = {
  custom_artifacts_configuration_update;
  deploy_as_application_configuration_update;
  catalog_configuration_update;
  monitoring_configuration_update;
   }

let make_glue_data_catalog_configuration_description 
  ~(database_ar_n : string) () : glue_data_catalog_configuration_description
= { database_ar_n;  }

let make_catalog_configuration_description 
  ~(glue_data_catalog_configuration_description : glue_data_catalog_configuration_description)
  () : catalog_configuration_description = {
  glue_data_catalog_configuration_description; 
}

let make_s3_content_base_location_description 
  ?(base_path : string option) ~(bucket_ar_n : string) ()
: s3_content_base_location_description = { base_path; bucket_ar_n; 
}

let make_deploy_as_application_configuration_description 
  ~(s3_content_location_description : s3_content_base_location_description)
  () : deploy_as_application_configuration_description = {
  s3_content_location_description; 
}

let make_custom_artifact_configuration_description 
  ?(maven_reference_description : maven_reference option)
  ?(s3_content_location_description : s3_content_location option)
  ?(artifact_type : artifact_type option)
  () : custom_artifact_configuration_description = {
  maven_reference_description;
  s3_content_location_description;
  artifact_type;
   }

let make_zeppelin_application_configuration_description 
  ?(custom_artifacts_configuration_description : custom_artifact_configuration_description list option)
  ?(deploy_as_application_configuration_description : deploy_as_application_configuration_description option)
  ?(catalog_configuration_description : catalog_configuration_description option)
  ~(monitoring_configuration_description : zeppelin_monitoring_configuration_description)
  () : zeppelin_application_configuration_description = {
  custom_artifacts_configuration_description;
  deploy_as_application_configuration_description;
  catalog_configuration_description;
  monitoring_configuration_description;
   }

let make_glue_data_catalog_configuration  ~(database_ar_n : string) ()
: glue_data_catalog_configuration = { database_ar_n; 
}

let make_catalog_configuration 
  ~(glue_data_catalog_configuration : glue_data_catalog_configuration) ()
: catalog_configuration = { glue_data_catalog_configuration; 
}

let make_s3_content_base_location 
  ?(base_path : string option) ~(bucket_ar_n : string) ()
: s3_content_base_location = { base_path; bucket_ar_n; 
}

let make_deploy_as_application_configuration 
  ~(s3_content_location : s3_content_base_location) ()
: deploy_as_application_configuration = { s3_content_location; 
}

let make_zeppelin_application_configuration 
  ?(custom_artifacts_configuration : custom_artifact_configuration list option)
  ?(deploy_as_application_configuration : deploy_as_application_configuration option)
  ?(catalog_configuration : catalog_configuration option)
  ?(monitoring_configuration : zeppelin_monitoring_configuration option)
  () : zeppelin_application_configuration = {
  custom_artifacts_configuration;
  deploy_as_application_configuration;
  catalog_configuration;
  monitoring_configuration;
   }

let make_vpc_configuration 
  ~(security_group_ids : string list) ~(subnet_ids : string list) ()
: vpc_configuration = { security_group_ids; subnet_ids; 
}

let make_vpc_configuration_update 
  ?(security_group_id_updates : string list option)
  ?(subnet_id_updates : string list option)
  ~(vpc_configuration_id : string)
  () : vpc_configuration_update = {
  security_group_id_updates; subnet_id_updates; vpc_configuration_id; 
}

let make_vpc_configuration_description 
  ~(security_group_ids : string list)
  ~(subnet_ids : string list)
  ~(vpc_id : string)
  ~(vpc_configuration_id : string)
  () : vpc_configuration_description = {
  security_group_ids; subnet_ids; vpc_id; vpc_configuration_id; 
}

let make_input_lambda_processor_description 
  ?(role_ar_n : string option) ~(resource_ar_n : string) ()
: input_lambda_processor_description = { role_ar_n; resource_ar_n; 
}

let make_input_processing_configuration_description 
  ?(input_lambda_processor_description : input_lambda_processor_description option)
  () : input_processing_configuration_description = {
  input_lambda_processor_description; 
}

let make_kinesis_streams_input_description 
  ?(role_ar_n : string option) ~(resource_ar_n : string) ()
: kinesis_streams_input_description = { role_ar_n; resource_ar_n; 
}

let make_kinesis_firehose_input_description 
  ?(role_ar_n : string option) ~(resource_ar_n : string) ()
: kinesis_firehose_input_description = { role_ar_n; resource_ar_n; 
}

let make_json_mapping_parameters  ~(record_row_path : string) ()
: json_mapping_parameters = { record_row_path; 
}

let make_csv_mapping_parameters 
  ~(record_column_delimiter : string) ~(record_row_delimiter : string) ()
: csv_mapping_parameters = { record_column_delimiter; record_row_delimiter; 
}

let make_mapping_parameters 
  ?(csv_mapping_parameters : csv_mapping_parameters option)
  ?(json_mapping_parameters : json_mapping_parameters option)
  () : mapping_parameters = {
  csv_mapping_parameters; json_mapping_parameters;  }

let make_record_format 
  ?(mapping_parameters : mapping_parameters option)
  ~(record_format_type : record_format_type)
  () : record_format = { mapping_parameters; record_format_type; 
}

let make_record_column 
  ?(mapping : string option) ~(sql_type : string) ~(name : string) ()
: record_column = { sql_type; mapping; name;  }

let make_source_schema 
  ?(record_encoding : string option)
  ~(record_columns : record_column list)
  ~(record_format : record_format)
  () : source_schema = { record_columns; record_encoding; record_format; 
}

let make_input_parallelism  ?(count : int option) () : input_parallelism = {
  count;  }

let make_input_starting_position_configuration 
  ?(input_starting_position : input_starting_position option) ()
: input_starting_position_configuration = { input_starting_position; 
}

let make_input_description 
  ?(input_starting_position_configuration : input_starting_position_configuration option)
  ?(input_parallelism : input_parallelism option)
  ?(input_schema : source_schema option)
  ?(kinesis_firehose_input_description : kinesis_firehose_input_description option)
  ?(kinesis_streams_input_description : kinesis_streams_input_description option)
  ?(input_processing_configuration_description : input_processing_configuration_description option)
  ?(in_app_stream_names : string list option)
  ?(name_prefix : string option)
  ?(input_id : string option)
  () : input_description = {
  input_starting_position_configuration;
  input_parallelism;
  input_schema;
  kinesis_firehose_input_description;
  kinesis_streams_input_description;
  input_processing_configuration_description;
  in_app_stream_names;
  name_prefix;
  input_id;
   }

let make_kinesis_streams_output_description 
  ?(role_ar_n : string option) ~(resource_ar_n : string) ()
: kinesis_streams_output_description = { role_ar_n; resource_ar_n; 
}

let make_kinesis_firehose_output_description 
  ?(role_ar_n : string option) ~(resource_ar_n : string) ()
: kinesis_firehose_output_description = { role_ar_n; resource_ar_n; 
}

let make_lambda_output_description 
  ?(role_ar_n : string option) ~(resource_ar_n : string) ()
: lambda_output_description = { role_ar_n; resource_ar_n; 
}

let make_destination_schema  ~(record_format_type : record_format_type) ()
: destination_schema = { record_format_type;  }

let make_output_description 
  ?(destination_schema : destination_schema option)
  ?(lambda_output_description : lambda_output_description option)
  ?(kinesis_firehose_output_description : kinesis_firehose_output_description option)
  ?(kinesis_streams_output_description : kinesis_streams_output_description option)
  ?(name : string option)
  ?(output_id : string option)
  () : output_description = {
  destination_schema;
  lambda_output_description;
  kinesis_firehose_output_description;
  kinesis_streams_output_description;
  name;
  output_id;
   }

let make_s3_reference_data_source_description 
  ?(reference_role_ar_n : string option)
  ~(file_key : string)
  ~(bucket_ar_n : string)
  () : s3_reference_data_source_description = {
  reference_role_ar_n; file_key; bucket_ar_n; 
}

let make_reference_data_source_description 
  ?(reference_schema : source_schema option)
  ~(s3_reference_data_source_description : s3_reference_data_source_description)
  ~(table_name : string)
  ~(reference_id : string)
  () : reference_data_source_description = {
  reference_schema;
  s3_reference_data_source_description;
  table_name;
  reference_id;
   }

let make_sql_application_configuration_description 
  ?(reference_data_source_descriptions : reference_data_source_description list option)
  ?(output_descriptions : output_description list option)
  ?(input_descriptions : input_description list option)
  () : sql_application_configuration_description = {
  reference_data_source_descriptions;
  output_descriptions;
  input_descriptions;
   }

let make_s3_application_code_location_description 
  ?(object_version : string option)
  ~(file_key : string)
  ~(bucket_ar_n : string)
  () : s3_application_code_location_description = {
  object_version; file_key; bucket_ar_n;  }

let make_code_content_description 
  ?(s3_application_code_location_description : s3_application_code_location_description option)
  ?(code_size : int option)
  ?(code_m_d5 : string option)
  ?(text_content : string option)
  () : code_content_description = {
  s3_application_code_location_description;
  code_size;
  code_m_d5;
  text_content;
   }

let make_application_code_configuration_description 
  ?(code_content_description : code_content_description option)
  ~(code_content_type : code_content_type)
  () : application_code_configuration_description = {
  code_content_description; code_content_type; 
}

let make_application_restore_configuration 
  ?(snapshot_name : string option)
  ~(application_restore_type : application_restore_type)
  () : application_restore_configuration = {
  snapshot_name; application_restore_type; 
}

let make_flink_run_configuration 
  ?(allow_non_restored_state : bool option) () : flink_run_configuration = {
  allow_non_restored_state;  }

let make_run_configuration_description 
  ?(flink_run_configuration_description : flink_run_configuration option)
  ?(application_restore_configuration_description : application_restore_configuration option)
  () : run_configuration_description = {
  flink_run_configuration_description;
  application_restore_configuration_description;
   }

let make_checkpoint_configuration_description 
  ?(min_pause_between_checkpoints : int option)
  ?(checkpoint_interval : int option)
  ?(checkpointing_enabled : bool option)
  ?(configuration_type : configuration_type option)
  () : checkpoint_configuration_description = {
  min_pause_between_checkpoints;
  checkpoint_interval;
  checkpointing_enabled;
  configuration_type;
   }

let make_monitoring_configuration_description 
  ?(log_level : log_level option)
  ?(metrics_level : metrics_level option)
  ?(configuration_type : configuration_type option)
  () : monitoring_configuration_description = {
  log_level; metrics_level; configuration_type; 
}

let make_parallelism_configuration_description 
  ?(auto_scaling_enabled : bool option)
  ?(current_parallelism : int option)
  ?(parallelism_per_kp_u : int option)
  ?(parallelism : int option)
  ?(configuration_type : configuration_type option)
  () : parallelism_configuration_description = {
  auto_scaling_enabled;
  current_parallelism;
  parallelism_per_kp_u;
  parallelism;
  configuration_type;
   }

let make_flink_application_configuration_description 
  ?(job_plan_description : string option)
  ?(parallelism_configuration_description : parallelism_configuration_description option)
  ?(monitoring_configuration_description : monitoring_configuration_description option)
  ?(checkpoint_configuration_description : checkpoint_configuration_description option)
  () : flink_application_configuration_description = {
  job_plan_description;
  parallelism_configuration_description;
  monitoring_configuration_description;
  checkpoint_configuration_description;
   }

let make_property_group 
  ~(property_map : (string * string) list) ~(property_group_id : string) ()
: property_group = { property_map; property_group_id; 
}

let make_environment_property_descriptions 
  ?(property_group_descriptions : property_group list option) ()
: environment_property_descriptions = { property_group_descriptions; 
}

let make_application_snapshot_configuration_description 
  ~(snapshots_enabled : bool) ()
: application_snapshot_configuration_description = { snapshots_enabled; 
}

let make_application_configuration_description 
  ?(zeppelin_application_configuration_description : zeppelin_application_configuration_description option)
  ?(vpc_configuration_descriptions : vpc_configuration_description list option)
  ?(application_snapshot_configuration_description : application_snapshot_configuration_description option)
  ?(environment_property_descriptions : environment_property_descriptions option)
  ?(flink_application_configuration_description : flink_application_configuration_description option)
  ?(run_configuration_description : run_configuration_description option)
  ?(application_code_configuration_description : application_code_configuration_description option)
  ?(sql_application_configuration_description : sql_application_configuration_description option)
  () : application_configuration_description = {
  zeppelin_application_configuration_description;
  vpc_configuration_descriptions;
  application_snapshot_configuration_description;
  environment_property_descriptions;
  flink_application_configuration_description;
  run_configuration_description;
  application_code_configuration_description;
  sql_application_configuration_description;
   }

let make_cloud_watch_logging_option_description 
  ?(role_ar_n : string option)
  ?(cloud_watch_logging_option_id : string option)
  ~(log_stream_ar_n : string)
  () : cloud_watch_logging_option_description = {
  role_ar_n; log_stream_ar_n; cloud_watch_logging_option_id; 
}

let make_application_maintenance_configuration_description 
  ~(application_maintenance_window_end_time : string)
  ~(application_maintenance_window_start_time : string)
  () : application_maintenance_configuration_description = {
  application_maintenance_window_end_time;
  application_maintenance_window_start_time;
   }

let make_application_detail 
  ?(application_mode : application_mode option)
  ?(application_version_rolled_back_to : int option)
  ?(conditional_token : string option)
  ?(application_version_rolled_back_from : int option)
  ?(application_version_updated_from : int option)
  ?(application_maintenance_configuration_description : application_maintenance_configuration_description option)
  ?(cloud_watch_logging_option_descriptions : cloud_watch_logging_option_description list option)
  ?(application_configuration_description : application_configuration_description option)
  ?(last_update_timestamp : float option)
  ?(create_timestamp : float option)
  ?(service_execution_role : string option)
  ?(application_description : string option)
  ~(application_version_id : int)
  ~(application_status : application_status)
  ~(runtime_environment : runtime_environment)
  ~(application_name : string)
  ~(application_ar_n : string)
  () : application_detail = {
  application_mode;
  application_version_rolled_back_to;
  conditional_token;
  application_version_rolled_back_from;
  application_version_updated_from;
  application_maintenance_configuration_description;
  cloud_watch_logging_option_descriptions;
  application_configuration_description;
  last_update_timestamp;
  create_timestamp;
  application_version_id;
  application_status;
  service_execution_role;
  runtime_environment;
  application_name;
  application_description;
  application_ar_n;
   }

let make_update_application_response 
  ~(application_detail : application_detail) () : update_application_response
= { application_detail;  }

let make_input_lambda_processor_update  ~(resource_arn_update : string) ()
: input_lambda_processor_update = { resource_arn_update; 
}

let make_input_processing_configuration_update 
  ~(input_lambda_processor_update : input_lambda_processor_update) ()
: input_processing_configuration_update = { input_lambda_processor_update; 
}

let make_kinesis_streams_input_update  ~(resource_arn_update : string) ()
: kinesis_streams_input_update = { resource_arn_update; 
}

let make_kinesis_firehose_input_update  ~(resource_arn_update : string) ()
: kinesis_firehose_input_update = { resource_arn_update; 
}

let make_input_schema_update 
  ?(record_column_updates : record_column list option)
  ?(record_encoding_update : string option)
  ?(record_format_update : record_format option)
  () : input_schema_update = {
  record_column_updates; record_encoding_update; record_format_update; 
}

let make_input_parallelism_update  ~(count_update : int) ()
: input_parallelism_update = { count_update;  }

let make_input_update 
  ?(input_parallelism_update : input_parallelism_update option)
  ?(input_schema_update : input_schema_update option)
  ?(kinesis_firehose_input_update : kinesis_firehose_input_update option)
  ?(kinesis_streams_input_update : kinesis_streams_input_update option)
  ?(input_processing_configuration_update : input_processing_configuration_update option)
  ?(name_prefix_update : string option)
  ~(input_id : string)
  () : input_update = {
  input_parallelism_update;
  input_schema_update;
  kinesis_firehose_input_update;
  kinesis_streams_input_update;
  input_processing_configuration_update;
  name_prefix_update;
  input_id;
   }

let make_kinesis_streams_output_update  ~(resource_arn_update : string) ()
: kinesis_streams_output_update = { resource_arn_update; 
}

let make_kinesis_firehose_output_update  ~(resource_arn_update : string) ()
: kinesis_firehose_output_update = { resource_arn_update; 
}

let make_lambda_output_update  ~(resource_arn_update : string) ()
: lambda_output_update = { resource_arn_update;  }

let make_output_update 
  ?(destination_schema_update : destination_schema option)
  ?(lambda_output_update : lambda_output_update option)
  ?(kinesis_firehose_output_update : kinesis_firehose_output_update option)
  ?(kinesis_streams_output_update : kinesis_streams_output_update option)
  ?(name_update : string option)
  ~(output_id : string)
  () : output_update = {
  destination_schema_update;
  lambda_output_update;
  kinesis_firehose_output_update;
  kinesis_streams_output_update;
  name_update;
  output_id;
   }

let make_s3_reference_data_source_update 
  ?(file_key_update : string option) ?(bucket_arn_update : string option) ()
: s3_reference_data_source_update = { file_key_update; bucket_arn_update; 
}

let make_reference_data_source_update 
  ?(reference_schema_update : source_schema option)
  ?(s3_reference_data_source_update : s3_reference_data_source_update option)
  ?(table_name_update : string option)
  ~(reference_id : string)
  () : reference_data_source_update = {
  reference_schema_update;
  s3_reference_data_source_update;
  table_name_update;
  reference_id;
   }

let make_sql_application_configuration_update 
  ?(reference_data_source_updates : reference_data_source_update list option)
  ?(output_updates : output_update list option)
  ?(input_updates : input_update list option)
  () : sql_application_configuration_update = {
  reference_data_source_updates; output_updates; input_updates; 
}

let make_s3_content_location_update 
  ?(object_version_update : string option)
  ?(file_key_update : string option)
  ?(bucket_arn_update : string option)
  () : s3_content_location_update = {
  object_version_update; file_key_update; bucket_arn_update; 
}

let make_code_content_update 
  ?(s3_content_location_update : s3_content_location_update option)
  ?(zip_file_content_update : bytes option)
  ?(text_content_update : string option)
  () : code_content_update = {
  s3_content_location_update; zip_file_content_update; text_content_update; 
}

let make_application_code_configuration_update 
  ?(code_content_update : code_content_update option)
  ?(code_content_type_update : code_content_type option)
  () : application_code_configuration_update = {
  code_content_update; code_content_type_update; 
}

let make_checkpoint_configuration_update 
  ?(min_pause_between_checkpoints_update : int option)
  ?(checkpoint_interval_update : int option)
  ?(checkpointing_enabled_update : bool option)
  ?(configuration_type_update : configuration_type option)
  () : checkpoint_configuration_update = {
  min_pause_between_checkpoints_update;
  checkpoint_interval_update;
  checkpointing_enabled_update;
  configuration_type_update;
   }

let make_monitoring_configuration_update 
  ?(log_level_update : log_level option)
  ?(metrics_level_update : metrics_level option)
  ?(configuration_type_update : configuration_type option)
  () : monitoring_configuration_update = {
  log_level_update; metrics_level_update; configuration_type_update; 
}

let make_parallelism_configuration_update 
  ?(auto_scaling_enabled_update : bool option)
  ?(parallelism_per_kpu_update : int option)
  ?(parallelism_update : int option)
  ?(configuration_type_update : configuration_type option)
  () : parallelism_configuration_update = {
  auto_scaling_enabled_update;
  parallelism_per_kpu_update;
  parallelism_update;
  configuration_type_update;
   }

let make_flink_application_configuration_update 
  ?(parallelism_configuration_update : parallelism_configuration_update option)
  ?(monitoring_configuration_update : monitoring_configuration_update option)
  ?(checkpoint_configuration_update : checkpoint_configuration_update option)
  () : flink_application_configuration_update = {
  parallelism_configuration_update;
  monitoring_configuration_update;
  checkpoint_configuration_update;
   }

let make_environment_property_updates 
  ~(property_groups : property_group list) () : environment_property_updates
= { property_groups;  }

let make_application_snapshot_configuration_update 
  ~(snapshots_enabled_update : bool) ()
: application_snapshot_configuration_update = { snapshots_enabled_update; 
}

let make_application_configuration_update 
  ?(zeppelin_application_configuration_update : zeppelin_application_configuration_update option)
  ?(vpc_configuration_updates : vpc_configuration_update list option)
  ?(application_snapshot_configuration_update : application_snapshot_configuration_update option)
  ?(environment_property_updates : environment_property_updates option)
  ?(flink_application_configuration_update : flink_application_configuration_update option)
  ?(application_code_configuration_update : application_code_configuration_update option)
  ?(sql_application_configuration_update : sql_application_configuration_update option)
  () : application_configuration_update = {
  zeppelin_application_configuration_update;
  vpc_configuration_updates;
  application_snapshot_configuration_update;
  environment_property_updates;
  flink_application_configuration_update;
  application_code_configuration_update;
  sql_application_configuration_update;
   }

let make_run_configuration_update 
  ?(application_restore_configuration : application_restore_configuration option)
  ?(flink_run_configuration : flink_run_configuration option)
  () : run_configuration_update = {
  application_restore_configuration; flink_run_configuration; 
}

let make_cloud_watch_logging_option_update 
  ?(log_stream_arn_update : string option)
  ~(cloud_watch_logging_option_id : string)
  () : cloud_watch_logging_option_update = {
  log_stream_arn_update; cloud_watch_logging_option_id; 
}

let make_update_application_request 
  ?(runtime_environment_update : runtime_environment option)
  ?(conditional_token : string option)
  ?(cloud_watch_logging_option_updates : cloud_watch_logging_option_update list option)
  ?(run_configuration_update : run_configuration_update option)
  ?(service_execution_role_update : string option)
  ?(application_configuration_update : application_configuration_update option)
  ?(current_application_version_id : int option)
  ~(application_name : string)
  () : update_application_request = {
  runtime_environment_update;
  conditional_token;
  cloud_watch_logging_option_updates;
  run_configuration_update;
  service_execution_role_update;
  application_configuration_update;
  current_application_version_id;
  application_name;
   }

let make_update_application_maintenance_configuration_response 
  ?(application_maintenance_configuration_description : application_maintenance_configuration_description option)
  ?(application_ar_n : string option)
  () : update_application_maintenance_configuration_response = {
  application_maintenance_configuration_description; application_ar_n; 
}

let make_application_maintenance_configuration_update 
  ~(application_maintenance_window_start_time_update : string) ()
: application_maintenance_configuration_update = {
  application_maintenance_window_start_time_update; 
}

let make_update_application_maintenance_configuration_request 
  ~(application_maintenance_configuration_update : application_maintenance_configuration_update)
  ~(application_name : string)
  () : update_application_maintenance_configuration_request = {
  application_maintenance_configuration_update; application_name; 
}

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_ar_n : string) ()
: untag_resource_request = { tag_keys; resource_ar_n;  }

let make_tag  ?(value : string option) ~(key : string) () : tag = {
  value; key;  }

let make_tag_resource_response  () : tag_resource_response =
()

let make_tag_resource_request 
  ~(tags : tag list) ~(resource_ar_n : string) () : tag_resource_request = {
  tags; resource_ar_n;  }

let make_stop_application_response  () : stop_application_response =
()

let make_stop_application_request 
  ?(force : bool option) ~(application_name : string) ()
: stop_application_request = { force; application_name; 
}

let make_start_application_response  () : start_application_response =
()

let make_sql_run_configuration 
  ~(input_starting_position_configuration : input_starting_position_configuration)
  ~(input_id : string)
  () : sql_run_configuration = {
  input_starting_position_configuration; input_id; 
}

let make_run_configuration 
  ?(application_restore_configuration : application_restore_configuration option)
  ?(sql_run_configurations : sql_run_configuration list option)
  ?(flink_run_configuration : flink_run_configuration option)
  () : run_configuration = {
  application_restore_configuration;
  sql_run_configurations;
  flink_run_configuration;
   }

let make_start_application_request 
  ?(run_configuration : run_configuration option)
  ~(application_name : string)
  () : start_application_request = { run_configuration; application_name; 
}

let make_input_lambda_processor  ~(resource_ar_n : string) ()
: input_lambda_processor = { resource_ar_n; 
}

let make_input_processing_configuration 
  ~(input_lambda_processor : input_lambda_processor) ()
: input_processing_configuration = { input_lambda_processor; 
}

let make_kinesis_streams_input  ~(resource_ar_n : string) ()
: kinesis_streams_input = { resource_ar_n;  }

let make_kinesis_firehose_input  ~(resource_ar_n : string) ()
: kinesis_firehose_input = { resource_ar_n;  }

let make_input 
  ?(input_parallelism : input_parallelism option)
  ?(kinesis_firehose_input : kinesis_firehose_input option)
  ?(kinesis_streams_input : kinesis_streams_input option)
  ?(input_processing_configuration : input_processing_configuration option)
  ~(input_schema : source_schema)
  ~(name_prefix : string)
  () : input = {
  input_schema;
  input_parallelism;
  kinesis_firehose_input;
  kinesis_streams_input;
  input_processing_configuration;
  name_prefix;
   }

let make_kinesis_streams_output  ~(resource_ar_n : string) ()
: kinesis_streams_output = { resource_ar_n; 
}

let make_kinesis_firehose_output  ~(resource_ar_n : string) ()
: kinesis_firehose_output = { resource_ar_n;  }

let make_lambda_output  ~(resource_ar_n : string) () : lambda_output = {
  resource_ar_n;  }

let make_output 
  ?(lambda_output : lambda_output option)
  ?(kinesis_firehose_output : kinesis_firehose_output option)
  ?(kinesis_streams_output : kinesis_streams_output option)
  ~(destination_schema : destination_schema)
  ~(name : string)
  () : output = {
  destination_schema;
  lambda_output;
  kinesis_firehose_output;
  kinesis_streams_output;
  name;
   }

let make_s3_reference_data_source 
  ?(file_key : string option) ?(bucket_ar_n : string option) ()
: s3_reference_data_source = { file_key; bucket_ar_n; 
}

let make_reference_data_source 
  ?(s3_reference_data_source : s3_reference_data_source option)
  ~(reference_schema : source_schema)
  ~(table_name : string)
  () : reference_data_source = {
  reference_schema; s3_reference_data_source; table_name; 
}

let make_sql_application_configuration 
  ?(reference_data_sources : reference_data_source list option)
  ?(outputs : output list option)
  ?(inputs : input list option)
  () : sql_application_configuration = {
  reference_data_sources; outputs; inputs;  }

let make_snapshot_details 
  ?(runtime_environment : runtime_environment option)
  ?(snapshot_creation_timestamp : float option)
  ~(application_version_id : int)
  ~(snapshot_status : snapshot_status)
  ~(snapshot_name : string)
  () : snapshot_details = {
  runtime_environment;
  snapshot_creation_timestamp;
  application_version_id;
  snapshot_status;
  snapshot_name;
   }

let make_s3_configuration  ~(file_key : string) ~(bucket_ar_n : string) ()
: s3_configuration = { file_key; bucket_ar_n; 
}

let make_rollback_application_response 
  ~(application_detail : application_detail) ()
: rollback_application_response = { application_detail; 
}

let make_rollback_application_request 
  ~(current_application_version_id : int) ~(application_name : string) ()
: rollback_application_request = {
  current_application_version_id; application_name; 
}

let make_parallelism_configuration 
  ?(auto_scaling_enabled : bool option)
  ?(parallelism_per_kp_u : int option)
  ?(parallelism : int option)
  ~(configuration_type : configuration_type)
  () : parallelism_configuration = {
  auto_scaling_enabled;
  parallelism_per_kp_u;
  parallelism;
  configuration_type;
   }

let make_monitoring_configuration 
  ?(log_level : log_level option)
  ?(metrics_level : metrics_level option)
  ~(configuration_type : configuration_type)
  () : monitoring_configuration = {
  log_level; metrics_level; configuration_type; 
}

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request  ~(resource_ar_n : string) ()
: list_tags_for_resource_request = { resource_ar_n; 
}

let make_application_summary 
  ?(application_mode : application_mode option)
  ~(runtime_environment : runtime_environment)
  ~(application_version_id : int)
  ~(application_status : application_status)
  ~(application_ar_n : string)
  ~(application_name : string)
  () : application_summary = {
  application_mode;
  runtime_environment;
  application_version_id;
  application_status;
  application_ar_n;
  application_name;
   }

let make_list_applications_response 
  ?(next_token : string option)
  ~(application_summaries : application_summary list)
  () : list_applications_response = { next_token; application_summaries; 
}

let make_list_applications_request 
  ?(next_token : string option) ?(limit : int option) ()
: list_applications_request = { next_token; limit; 
}

let make_application_version_summary 
  ~(application_status : application_status)
  ~(application_version_id : int)
  () : application_version_summary = {
  application_status; application_version_id; 
}

let make_list_application_versions_response 
  ?(next_token : string option)
  ?(application_version_summaries : application_version_summary list option)
  () : list_application_versions_response = {
  next_token; application_version_summaries; 
}

let make_list_application_versions_request 
  ?(next_token : string option)
  ?(limit : int option)
  ~(application_name : string)
  () : list_application_versions_request = {
  next_token; limit; application_name; 
}

let make_list_application_snapshots_response 
  ?(next_token : string option)
  ?(snapshot_summaries : snapshot_details list option)
  () : list_application_snapshots_response = {
  next_token; snapshot_summaries; 
}

let make_list_application_snapshots_request 
  ?(next_token : string option)
  ?(limit : int option)
  ~(application_name : string)
  () : list_application_snapshots_request = {
  next_token; limit; application_name; 
}

let make_discover_input_schema_response 
  ?(raw_input_records : string list option)
  ?(processed_input_records : string list option)
  ?(parsed_input_records : string list list option)
  ?(input_schema : source_schema option)
  () : discover_input_schema_response = {
  raw_input_records;
  processed_input_records;
  parsed_input_records;
  input_schema;
   }

let make_discover_input_schema_request 
  ?(input_processing_configuration : input_processing_configuration option)
  ?(s3_configuration : s3_configuration option)
  ?(input_starting_position_configuration : input_starting_position_configuration option)
  ?(resource_ar_n : string option)
  ~(service_execution_role : string)
  () : discover_input_schema_request = {
  input_processing_configuration;
  s3_configuration;
  input_starting_position_configuration;
  service_execution_role;
  resource_ar_n;
   }

let make_describe_application_version_response 
  ?(application_version_detail : application_detail option) ()
: describe_application_version_response = { application_version_detail; 
}

let make_describe_application_version_request 
  ~(application_version_id : int) ~(application_name : string) ()
: describe_application_version_request = {
  application_version_id; application_name; 
}

let make_describe_application_snapshot_response 
  ~(snapshot_details : snapshot_details) ()
: describe_application_snapshot_response = { snapshot_details; 
}

let make_describe_application_snapshot_request 
  ~(snapshot_name : string) ~(application_name : string) ()
: describe_application_snapshot_request = { snapshot_name; application_name; 
}

let make_describe_application_response 
  ~(application_detail : application_detail) ()
: describe_application_response = { application_detail; 
}

let make_describe_application_request 
  ?(include_additional_details : bool option) ~(application_name : string) ()
: describe_application_request = {
  include_additional_details; application_name; 
}

let make_delete_application_vpc_configuration_response 
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : delete_application_vpc_configuration_response = {
  application_version_id; application_ar_n; 
}

let make_delete_application_vpc_configuration_request 
  ?(conditional_token : string option)
  ?(current_application_version_id : int option)
  ~(vpc_configuration_id : string)
  ~(application_name : string)
  () : delete_application_vpc_configuration_request = {
  conditional_token;
  vpc_configuration_id;
  current_application_version_id;
  application_name;
   }

let make_delete_application_snapshot_response  ()
: delete_application_snapshot_response =
()

let make_delete_application_snapshot_request 
  ~(snapshot_creation_timestamp : float)
  ~(snapshot_name : string)
  ~(application_name : string)
  () : delete_application_snapshot_request = {
  snapshot_creation_timestamp; snapshot_name; application_name; 
}

let make_delete_application_reference_data_source_response 
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : delete_application_reference_data_source_response = {
  application_version_id; application_ar_n; 
}

let make_delete_application_reference_data_source_request 
  ~(reference_id : string)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : delete_application_reference_data_source_request = {
  reference_id; current_application_version_id; application_name; 
}

let make_delete_application_output_response 
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : delete_application_output_response = {
  application_version_id; application_ar_n; 
}

let make_delete_application_output_request 
  ~(output_id : string)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : delete_application_output_request = {
  output_id; current_application_version_id; application_name; 
}

let make_delete_application_input_processing_configuration_response 
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : delete_application_input_processing_configuration_response = {
  application_version_id; application_ar_n; 
}

let make_delete_application_input_processing_configuration_request 
  ~(input_id : string)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : delete_application_input_processing_configuration_request = {
  input_id; current_application_version_id; application_name; 
}

let make_delete_application_cloud_watch_logging_option_response 
  ?(cloud_watch_logging_option_descriptions : cloud_watch_logging_option_description list option)
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : delete_application_cloud_watch_logging_option_response = {
  cloud_watch_logging_option_descriptions;
  application_version_id;
  application_ar_n;
   }

let make_delete_application_cloud_watch_logging_option_request 
  ?(conditional_token : string option)
  ?(current_application_version_id : int option)
  ~(cloud_watch_logging_option_id : string)
  ~(application_name : string)
  () : delete_application_cloud_watch_logging_option_request = {
  conditional_token;
  cloud_watch_logging_option_id;
  current_application_version_id;
  application_name;
   }

let make_delete_application_response  () : delete_application_response =
()

let make_delete_application_request 
  ~(create_timestamp : float) ~(application_name : string) ()
: delete_application_request = { create_timestamp; application_name; 
}

let make_create_application_snapshot_response  ()
: create_application_snapshot_response =
()

let make_create_application_snapshot_request 
  ~(snapshot_name : string) ~(application_name : string) ()
: create_application_snapshot_request = { snapshot_name; application_name; 
}

let make_create_application_presigned_url_response 
  ?(authorized_url : string option) ()
: create_application_presigned_url_response = { authorized_url; 
}

let make_create_application_presigned_url_request 
  ?(session_expiration_duration_in_seconds : int option)
  ~(url_type : url_type)
  ~(application_name : string)
  () : create_application_presigned_url_request = {
  session_expiration_duration_in_seconds; url_type; application_name; 
}

let make_create_application_response 
  ~(application_detail : application_detail) () : create_application_response
= { application_detail;  }

let make_checkpoint_configuration 
  ?(min_pause_between_checkpoints : int option)
  ?(checkpoint_interval : int option)
  ?(checkpointing_enabled : bool option)
  ~(configuration_type : configuration_type)
  () : checkpoint_configuration = {
  min_pause_between_checkpoints;
  checkpoint_interval;
  checkpointing_enabled;
  configuration_type;
   }

let make_flink_application_configuration 
  ?(parallelism_configuration : parallelism_configuration option)
  ?(monitoring_configuration : monitoring_configuration option)
  ?(checkpoint_configuration : checkpoint_configuration option)
  () : flink_application_configuration = {
  parallelism_configuration;
  monitoring_configuration;
  checkpoint_configuration;
   }

let make_environment_properties  ~(property_groups : property_group list) ()
: environment_properties = { property_groups;  }

let make_code_content 
  ?(s3_content_location : s3_content_location option)
  ?(zip_file_content : bytes option)
  ?(text_content : string option)
  () : code_content = { s3_content_location; zip_file_content; text_content; 
}

let make_application_code_configuration 
  ?(code_content : code_content option)
  ~(code_content_type : code_content_type)
  () : application_code_configuration = { code_content_type; code_content; 
}

let make_application_snapshot_configuration  ~(snapshots_enabled : bool) ()
: application_snapshot_configuration = { snapshots_enabled; 
}

let make_application_configuration 
  ?(zeppelin_application_configuration : zeppelin_application_configuration option)
  ?(vpc_configurations : vpc_configuration list option)
  ?(application_snapshot_configuration : application_snapshot_configuration option)
  ?(application_code_configuration : application_code_configuration option)
  ?(environment_properties : environment_properties option)
  ?(flink_application_configuration : flink_application_configuration option)
  ?(sql_application_configuration : sql_application_configuration option)
  () : application_configuration = {
  zeppelin_application_configuration;
  vpc_configurations;
  application_snapshot_configuration;
  application_code_configuration;
  environment_properties;
  flink_application_configuration;
  sql_application_configuration;
   }

let make_cloud_watch_logging_option  ~(log_stream_ar_n : string) ()
: cloud_watch_logging_option = { log_stream_ar_n; 
}

let make_create_application_request 
  ?(application_mode : application_mode option)
  ?(tags : tag list option)
  ?(cloud_watch_logging_options : cloud_watch_logging_option list option)
  ?(application_configuration : application_configuration option)
  ?(application_description : string option)
  ~(service_execution_role : string)
  ~(runtime_environment : runtime_environment)
  ~(application_name : string)
  () : create_application_request = {
  application_mode;
  tags;
  cloud_watch_logging_options;
  application_configuration;
  service_execution_role;
  runtime_environment;
  application_description;
  application_name;
   }

let make_add_application_vpc_configuration_response 
  ?(vpc_configuration_description : vpc_configuration_description option)
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : add_application_vpc_configuration_response = {
  vpc_configuration_description; application_version_id; application_ar_n; 
}

let make_add_application_vpc_configuration_request 
  ?(conditional_token : string option)
  ?(current_application_version_id : int option)
  ~(vpc_configuration : vpc_configuration)
  ~(application_name : string)
  () : add_application_vpc_configuration_request = {
  conditional_token;
  vpc_configuration;
  current_application_version_id;
  application_name;
   }

let make_add_application_reference_data_source_response 
  ?(reference_data_source_descriptions : reference_data_source_description list option)
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : add_application_reference_data_source_response = {
  reference_data_source_descriptions;
  application_version_id;
  application_ar_n;
   }

let make_add_application_reference_data_source_request 
  ~(reference_data_source : reference_data_source)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : add_application_reference_data_source_request = {
  reference_data_source; current_application_version_id; application_name; 
}

let make_add_application_output_response 
  ?(output_descriptions : output_description list option)
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : add_application_output_response = {
  output_descriptions; application_version_id; application_ar_n; 
}

let make_add_application_output_request 
  ~(output : output)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : add_application_output_request = {
  output; current_application_version_id; application_name; 
}

let make_add_application_input_processing_configuration_response 
  ?(input_processing_configuration_description : input_processing_configuration_description option)
  ?(input_id : string option)
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : add_application_input_processing_configuration_response = {
  input_processing_configuration_description;
  input_id;
  application_version_id;
  application_ar_n;
   }

let make_add_application_input_processing_configuration_request 
  ~(input_processing_configuration : input_processing_configuration)
  ~(input_id : string)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : add_application_input_processing_configuration_request = {
  input_processing_configuration;
  input_id;
  current_application_version_id;
  application_name;
   }

let make_add_application_input_response 
  ?(input_descriptions : input_description list option)
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : add_application_input_response = {
  input_descriptions; application_version_id; application_ar_n; 
}

let make_add_application_input_request 
  ~(input : input)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : add_application_input_request = {
  input; current_application_version_id; application_name; 
}

let make_add_application_cloud_watch_logging_option_response 
  ?(cloud_watch_logging_option_descriptions : cloud_watch_logging_option_description list option)
  ?(application_version_id : int option)
  ?(application_ar_n : string option)
  () : add_application_cloud_watch_logging_option_response = {
  cloud_watch_logging_option_descriptions;
  application_version_id;
  application_ar_n;
   }

let make_add_application_cloud_watch_logging_option_request 
  ?(conditional_token : string option)
  ?(current_application_version_id : int option)
  ~(cloud_watch_logging_option : cloud_watch_logging_option)
  ~(application_name : string)
  () : add_application_cloud_watch_logging_option_request = {
  conditional_token;
  cloud_watch_logging_option;
  current_application_version_id;
  application_name;
  
}

