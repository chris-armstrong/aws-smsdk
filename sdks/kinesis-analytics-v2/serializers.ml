open Smaws_Lib.Json.SerializeHelpers

open Types

let zip_file_content_to_yojson = blob_to_yojson

let base_unit_to_yojson = unit_to_yojson

let log_level_to_yojson = 
  fun (x: log_level) -> match x with 
 
| DEBUG -> `String "DEBUG"
  | ERROR -> `String "ERROR"
  | WARN -> `String "WARN"
  | INFO -> `String "INFO"
   

let zeppelin_monitoring_configuration_update_to_yojson = 
  fun (x: zeppelin_monitoring_configuration_update) -> assoc_to_yojson(
    [(
         "LogLevelUpdate",
         (Some (log_level_to_yojson x.log_level_update)));
       
  ])

let zeppelin_monitoring_configuration_description_to_yojson = 
  fun (x: zeppelin_monitoring_configuration_description) -> assoc_to_yojson(
    [(
         "LogLevel",
         (option_to_yojson log_level_to_yojson x.log_level));
       
  ])

let zeppelin_monitoring_configuration_to_yojson = 
  fun (x: zeppelin_monitoring_configuration) -> assoc_to_yojson(
    [(
         "LogLevel",
         (Some (log_level_to_yojson x.log_level)));
       
  ])

let database_ar_n_to_yojson = string_to_yojson

let glue_data_catalog_configuration_update_to_yojson = 
  fun (x: glue_data_catalog_configuration_update) -> assoc_to_yojson(
    [(
         "DatabaseARNUpdate",
         (Some (database_ar_n_to_yojson x.database_arn_update)));
       
  ])

let catalog_configuration_update_to_yojson = 
  fun (x: catalog_configuration_update) -> assoc_to_yojson(
    [(
         "GlueDataCatalogConfigurationUpdate",
         (Some (glue_data_catalog_configuration_update_to_yojson x.glue_data_catalog_configuration_update)));
       
  ])

let bucket_ar_n_to_yojson = string_to_yojson

let base_path_to_yojson = string_to_yojson

let s3_content_base_location_update_to_yojson = 
  fun (x: s3_content_base_location_update) -> assoc_to_yojson(
    [(
         "BasePathUpdate",
         (option_to_yojson base_path_to_yojson x.base_path_update));
       (
         "BucketARNUpdate",
         (option_to_yojson bucket_ar_n_to_yojson x.bucket_arn_update));
       
  ])

let deploy_as_application_configuration_update_to_yojson = 
  fun (x: deploy_as_application_configuration_update) -> assoc_to_yojson(
    [(
         "S3ContentLocationUpdate",
         (option_to_yojson s3_content_base_location_update_to_yojson x.s3_content_location_update));
       
  ])

let artifact_type_to_yojson = 
  fun (x: artifact_type) -> match x with 
  | DEPENDENCY_JAR -> `String "DEPENDENCY_JAR"
    | UDF -> `String "UDF"
     

let file_key_to_yojson = string_to_yojson

let object_version_to_yojson = string_to_yojson

let s3_content_location_to_yojson = 
  fun (x: s3_content_location) -> assoc_to_yojson(
    [(
         "ObjectVersion",
         (option_to_yojson object_version_to_yojson x.object_version));
       (
         "FileKey",
         (Some (file_key_to_yojson x.file_key)));
       (
         "BucketARN",
         (Some (bucket_ar_n_to_yojson x.bucket_ar_n)));
       
  ])

let maven_group_id_to_yojson = string_to_yojson

let maven_artifact_id_to_yojson = string_to_yojson

let maven_version_to_yojson = string_to_yojson

let maven_reference_to_yojson = 
  fun (x: maven_reference) -> assoc_to_yojson(
    [(
         "Version",
         (Some (maven_version_to_yojson x.version)));
       (
         "ArtifactId",
         (Some (maven_artifact_id_to_yojson x.artifact_id)));
       (
         "GroupId",
         (Some (maven_group_id_to_yojson x.group_id)));
       
  ])

let custom_artifact_configuration_to_yojson = 
  fun (x: custom_artifact_configuration) -> assoc_to_yojson(
    [(
         "MavenReference",
         (option_to_yojson maven_reference_to_yojson x.maven_reference));
       (
         "S3ContentLocation",
         (option_to_yojson s3_content_location_to_yojson x.s3_content_location));
       (
         "ArtifactType",
         (Some (artifact_type_to_yojson x.artifact_type)));
       
  ])

let custom_artifacts_configuration_list_to_yojson = 
  fun tree -> list_to_yojson custom_artifact_configuration_to_yojson tree

let zeppelin_application_configuration_update_to_yojson = 
  fun (x: zeppelin_application_configuration_update) -> assoc_to_yojson(
    [(
         "CustomArtifactsConfigurationUpdate",
         (option_to_yojson custom_artifacts_configuration_list_to_yojson x.custom_artifacts_configuration_update));
       (
         "DeployAsApplicationConfigurationUpdate",
         (option_to_yojson deploy_as_application_configuration_update_to_yojson x.deploy_as_application_configuration_update));
       (
         "CatalogConfigurationUpdate",
         (option_to_yojson catalog_configuration_update_to_yojson x.catalog_configuration_update));
       (
         "MonitoringConfigurationUpdate",
         (option_to_yojson zeppelin_monitoring_configuration_update_to_yojson x.monitoring_configuration_update));
       
  ])

let glue_data_catalog_configuration_description_to_yojson = 
  fun (x: glue_data_catalog_configuration_description) -> assoc_to_yojson(
    [(
         "DatabaseARN",
         (Some (database_ar_n_to_yojson x.database_ar_n)));
       
  ])

let catalog_configuration_description_to_yojson = 
  fun (x: catalog_configuration_description) -> assoc_to_yojson(
    [(
         "GlueDataCatalogConfigurationDescription",
         (Some (glue_data_catalog_configuration_description_to_yojson x.glue_data_catalog_configuration_description)));
       
  ])

let s3_content_base_location_description_to_yojson = 
  fun (x: s3_content_base_location_description) -> assoc_to_yojson(
    [(
         "BasePath",
         (option_to_yojson base_path_to_yojson x.base_path));
       (
         "BucketARN",
         (Some (bucket_ar_n_to_yojson x.bucket_ar_n)));
       
  ])

let deploy_as_application_configuration_description_to_yojson = 
  fun (x: deploy_as_application_configuration_description) -> assoc_to_yojson(
    [(
         "S3ContentLocationDescription",
         (Some (s3_content_base_location_description_to_yojson x.s3_content_location_description)));
       
  ])

let custom_artifact_configuration_description_to_yojson = 
  fun (x: custom_artifact_configuration_description) -> assoc_to_yojson(
    [(
         "MavenReferenceDescription",
         (option_to_yojson maven_reference_to_yojson x.maven_reference_description));
       (
         "S3ContentLocationDescription",
         (option_to_yojson s3_content_location_to_yojson x.s3_content_location_description));
       (
         "ArtifactType",
         (option_to_yojson artifact_type_to_yojson x.artifact_type));
       
  ])

let custom_artifacts_configuration_description_list_to_yojson = 
  fun tree -> list_to_yojson custom_artifact_configuration_description_to_yojson tree

let zeppelin_application_configuration_description_to_yojson = 
  fun (x: zeppelin_application_configuration_description) -> assoc_to_yojson(
    [(
         "CustomArtifactsConfigurationDescription",
         (option_to_yojson custom_artifacts_configuration_description_list_to_yojson x.custom_artifacts_configuration_description));
       (
         "DeployAsApplicationConfigurationDescription",
         (option_to_yojson deploy_as_application_configuration_description_to_yojson x.deploy_as_application_configuration_description));
       (
         "CatalogConfigurationDescription",
         (option_to_yojson catalog_configuration_description_to_yojson x.catalog_configuration_description));
       (
         "MonitoringConfigurationDescription",
         (Some (zeppelin_monitoring_configuration_description_to_yojson x.monitoring_configuration_description)));
       
  ])

let glue_data_catalog_configuration_to_yojson = 
  fun (x: glue_data_catalog_configuration) -> assoc_to_yojson(
    [(
         "DatabaseARN",
         (Some (database_ar_n_to_yojson x.database_ar_n)));
       
  ])

let catalog_configuration_to_yojson = 
  fun (x: catalog_configuration) -> assoc_to_yojson(
    [(
         "GlueDataCatalogConfiguration",
         (Some (glue_data_catalog_configuration_to_yojson x.glue_data_catalog_configuration)));
       
  ])

let s3_content_base_location_to_yojson = 
  fun (x: s3_content_base_location) -> assoc_to_yojson(
    [(
         "BasePath",
         (option_to_yojson base_path_to_yojson x.base_path));
       (
         "BucketARN",
         (Some (bucket_ar_n_to_yojson x.bucket_ar_n)));
       
  ])

let deploy_as_application_configuration_to_yojson = 
  fun (x: deploy_as_application_configuration) -> assoc_to_yojson(
    [(
         "S3ContentLocation",
         (Some (s3_content_base_location_to_yojson x.s3_content_location)));
       
  ])

let zeppelin_application_configuration_to_yojson = 
  fun (x: zeppelin_application_configuration) -> assoc_to_yojson(
    [(
         "CustomArtifactsConfiguration",
         (option_to_yojson custom_artifacts_configuration_list_to_yojson x.custom_artifacts_configuration));
       (
         "DeployAsApplicationConfiguration",
         (option_to_yojson deploy_as_application_configuration_to_yojson x.deploy_as_application_configuration));
       (
         "CatalogConfiguration",
         (option_to_yojson catalog_configuration_to_yojson x.catalog_configuration));
       (
         "MonitoringConfiguration",
         (option_to_yojson zeppelin_monitoring_configuration_to_yojson x.monitoring_configuration));
       
  ])

let vpc_id_to_yojson = string_to_yojson

let subnet_id_to_yojson = string_to_yojson

let subnet_ids_to_yojson = 
  fun tree -> list_to_yojson subnet_id_to_yojson tree

let security_group_id_to_yojson = string_to_yojson

let security_group_ids_to_yojson = 
  fun tree -> list_to_yojson security_group_id_to_yojson tree

let vpc_configuration_to_yojson = 
  fun (x: vpc_configuration) -> assoc_to_yojson(
    [(
         "SecurityGroupIds",
         (Some (security_group_ids_to_yojson x.security_group_ids)));
       (
         "SubnetIds",
         (Some (subnet_ids_to_yojson x.subnet_ids)));
       
  ])

let vpc_configurations_to_yojson = 
  fun tree -> list_to_yojson vpc_configuration_to_yojson tree

let id_to_yojson = string_to_yojson

let vpc_configuration_update_to_yojson = 
  fun (x: vpc_configuration_update) -> assoc_to_yojson(
    [(
         "SecurityGroupIdUpdates",
         (option_to_yojson security_group_ids_to_yojson x.security_group_id_updates));
       (
         "SubnetIdUpdates",
         (option_to_yojson subnet_ids_to_yojson x.subnet_id_updates));
       (
         "VpcConfigurationId",
         (Some (id_to_yojson x.vpc_configuration_id)));
       
  ])

let vpc_configuration_updates_to_yojson = 
  fun tree -> list_to_yojson vpc_configuration_update_to_yojson tree

let vpc_configuration_description_to_yojson = 
  fun (x: vpc_configuration_description) -> assoc_to_yojson(
    [(
         "SecurityGroupIds",
         (Some (security_group_ids_to_yojson x.security_group_ids)));
       (
         "SubnetIds",
         (Some (subnet_ids_to_yojson x.subnet_ids)));
       (
         "VpcId",
         (Some (vpc_id_to_yojson x.vpc_id)));
       (
         "VpcConfigurationId",
         (Some (id_to_yojson x.vpc_configuration_id)));
       
  ])

let vpc_configuration_descriptions_to_yojson = 
  fun tree -> list_to_yojson vpc_configuration_description_to_yojson tree

let url_type_to_yojson = 
  fun (x: url_type) -> match x with 
 
| ZEPPELIN_UI_URL -> `String "ZEPPELIN_UI_URL"
  | FLINK_DASHBOARD_URL -> `String "FLINK_DASHBOARD_URL"
   

let resource_ar_n_to_yojson = string_to_yojson

let application_description_to_yojson = string_to_yojson

let application_name_to_yojson = string_to_yojson

let runtime_environment_to_yojson = 
  fun (x: runtime_environment) -> match x with 
 
| FLINK_1_18 -> `String "FLINK-1_18"
  | ZEPPELIN_FLINK_3_0 -> `String "ZEPPELIN-FLINK-3_0"
  | FLINK_1_15 -> `String "FLINK-1_15"
  | ZEPPELIN_FLINK_2_0 -> `String "ZEPPELIN-FLINK-2_0"
  | FLINK_1_13 -> `String "FLINK-1_13"
  | FLINK_1_11 -> `String "FLINK-1_11"
  | ZEPPELIN_FLINK_1_0 -> `String "ZEPPELIN-FLINK-1_0"
  | FLINK_1_8 -> `String "FLINK-1_8"
  | FLINK_1_6 -> `String "FLINK-1_6"
  | SQL_1_0 -> `String "SQL-1_0"
   

let role_ar_n_to_yojson = string_to_yojson

let application_status_to_yojson = 
  fun (x: application_status) -> match x with 
 
| ROLLED_BACK -> `String "ROLLED_BACK"
  | MAINTENANCE -> `String "MAINTENANCE"
  | ROLLING_BACK -> `String "ROLLING_BACK"
  | FORCE_STOPPING -> `String "FORCE_STOPPING"
  | AUTOSCALING -> `String "AUTOSCALING"
  | UPDATING -> `String "UPDATING"
  | RUNNING -> `String "RUNNING"
  | READY -> `String "READY"
  | STOPPING -> `String "STOPPING"
  | STARTING -> `String "STARTING"
  | DELETING -> `String "DELETING"
   

let application_version_id_to_yojson = long_to_yojson

let timestamp__to_yojson = timestamp_to_yojson

let in_app_stream_name_to_yojson = string_to_yojson

let in_app_stream_names_to_yojson = 
  fun tree -> list_to_yojson in_app_stream_name_to_yojson tree

let input_lambda_processor_description_to_yojson = 
  fun (x: input_lambda_processor_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let input_processing_configuration_description_to_yojson = 
  fun (x: input_processing_configuration_description) -> assoc_to_yojson(
    [(
         "InputLambdaProcessorDescription",
         (option_to_yojson input_lambda_processor_description_to_yojson x.input_lambda_processor_description));
       
  ])

let kinesis_streams_input_description_to_yojson = 
  fun (x: kinesis_streams_input_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let kinesis_firehose_input_description_to_yojson = 
  fun (x: kinesis_firehose_input_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let record_format_type_to_yojson = 
  fun (x: record_format_type) -> match x with 
  | CSV -> `String "CSV"
    | JSON -> `String "JSON"
     

let record_row_path_to_yojson = string_to_yojson

let json_mapping_parameters_to_yojson = 
  fun (x: json_mapping_parameters) -> assoc_to_yojson(
    [(
         "RecordRowPath",
         (Some (record_row_path_to_yojson x.record_row_path)));
       
  ])

let record_row_delimiter_to_yojson = string_to_yojson

let record_column_delimiter_to_yojson = string_to_yojson

let csv_mapping_parameters_to_yojson = 
  fun (x: csv_mapping_parameters) -> assoc_to_yojson(
    [(
         "RecordColumnDelimiter",
         (Some (record_column_delimiter_to_yojson x.record_column_delimiter)));
       (
         "RecordRowDelimiter",
         (Some (record_row_delimiter_to_yojson x.record_row_delimiter)));
       
  ])

let mapping_parameters_to_yojson = 
  fun (x: mapping_parameters) -> assoc_to_yojson(
    [(
         "CSVMappingParameters",
         (option_to_yojson csv_mapping_parameters_to_yojson x.csv_mapping_parameters));
       (
         "JSONMappingParameters",
         (option_to_yojson json_mapping_parameters_to_yojson x.json_mapping_parameters));
       
  ])

let record_format_to_yojson = 
  fun (x: record_format) -> assoc_to_yojson(
    [(
         "MappingParameters",
         (option_to_yojson mapping_parameters_to_yojson x.mapping_parameters));
       (
         "RecordFormatType",
         (Some (record_format_type_to_yojson x.record_format_type)));
       
  ])

let record_encoding_to_yojson = string_to_yojson

let record_column_name_to_yojson = string_to_yojson

let record_column_mapping_to_yojson = string_to_yojson

let record_column_sql_type_to_yojson = string_to_yojson

let record_column_to_yojson = 
  fun (x: record_column) -> assoc_to_yojson(
    [(
         "SqlType",
         (Some (record_column_sql_type_to_yojson x.sql_type)));
       (
         "Mapping",
         (option_to_yojson record_column_mapping_to_yojson x.mapping));
       (
         "Name",
         (Some (record_column_name_to_yojson x.name)));
       
  ])

let record_columns_to_yojson = 
  fun tree -> list_to_yojson record_column_to_yojson tree

let source_schema_to_yojson = 
  fun (x: source_schema) -> assoc_to_yojson(
    [(
         "RecordColumns",
         (Some (record_columns_to_yojson x.record_columns)));
       (
         "RecordEncoding",
         (option_to_yojson record_encoding_to_yojson x.record_encoding));
       (
         "RecordFormat",
         (Some (record_format_to_yojson x.record_format)));
       
  ])

let input_parallelism_count_to_yojson = int_to_yojson

let input_parallelism_to_yojson = 
  fun (x: input_parallelism) -> assoc_to_yojson(
    [(
         "Count",
         (option_to_yojson input_parallelism_count_to_yojson x.count));
       
  ])

let input_starting_position_to_yojson = 
  fun (x: input_starting_position) -> match x with 
 
| LAST_STOPPED_POINT -> `String "LAST_STOPPED_POINT"
  | TRIM_HORIZON -> `String "TRIM_HORIZON"
  | NOW -> `String "NOW"
   

let input_starting_position_configuration_to_yojson = 
  fun (x: input_starting_position_configuration) -> assoc_to_yojson(
    [(
         "InputStartingPosition",
         (option_to_yojson input_starting_position_to_yojson x.input_starting_position));
       
  ])

let input_description_to_yojson = 
  fun (x: input_description) -> assoc_to_yojson(
    [(
         "InputStartingPositionConfiguration",
         (option_to_yojson input_starting_position_configuration_to_yojson x.input_starting_position_configuration));
       (
         "InputParallelism",
         (option_to_yojson input_parallelism_to_yojson x.input_parallelism));
       (
         "InputSchema",
         (option_to_yojson source_schema_to_yojson x.input_schema));
       (
         "KinesisFirehoseInputDescription",
         (option_to_yojson kinesis_firehose_input_description_to_yojson x.kinesis_firehose_input_description));
       (
         "KinesisStreamsInputDescription",
         (option_to_yojson kinesis_streams_input_description_to_yojson x.kinesis_streams_input_description));
       (
         "InputProcessingConfigurationDescription",
         (option_to_yojson input_processing_configuration_description_to_yojson x.input_processing_configuration_description));
       (
         "InAppStreamNames",
         (option_to_yojson in_app_stream_names_to_yojson x.in_app_stream_names));
       (
         "NamePrefix",
         (option_to_yojson in_app_stream_name_to_yojson x.name_prefix));
       (
         "InputId",
         (option_to_yojson id_to_yojson x.input_id));
       
  ])

let input_descriptions_to_yojson = 
  fun tree -> list_to_yojson input_description_to_yojson tree

let kinesis_streams_output_description_to_yojson = 
  fun (x: kinesis_streams_output_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let kinesis_firehose_output_description_to_yojson = 
  fun (x: kinesis_firehose_output_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let lambda_output_description_to_yojson = 
  fun (x: lambda_output_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let destination_schema_to_yojson = 
  fun (x: destination_schema) -> assoc_to_yojson(
    [(
         "RecordFormatType",
         (Some (record_format_type_to_yojson x.record_format_type)));
       
  ])

let output_description_to_yojson = 
  fun (x: output_description) -> assoc_to_yojson(
    [(
         "DestinationSchema",
         (option_to_yojson destination_schema_to_yojson x.destination_schema));
       (
         "LambdaOutputDescription",
         (option_to_yojson lambda_output_description_to_yojson x.lambda_output_description));
       (
         "KinesisFirehoseOutputDescription",
         (option_to_yojson kinesis_firehose_output_description_to_yojson x.kinesis_firehose_output_description));
       (
         "KinesisStreamsOutputDescription",
         (option_to_yojson kinesis_streams_output_description_to_yojson x.kinesis_streams_output_description));
       (
         "Name",
         (option_to_yojson in_app_stream_name_to_yojson x.name));
       (
         "OutputId",
         (option_to_yojson id_to_yojson x.output_id));
       
  ])

let output_descriptions_to_yojson = 
  fun tree -> list_to_yojson output_description_to_yojson tree

let in_app_table_name_to_yojson = string_to_yojson

let s3_reference_data_source_description_to_yojson = 
  fun (x: s3_reference_data_source_description) -> assoc_to_yojson(
    [(
         "ReferenceRoleARN",
         (option_to_yojson role_ar_n_to_yojson x.reference_role_ar_n));
       (
         "FileKey",
         (Some (file_key_to_yojson x.file_key)));
       (
         "BucketARN",
         (Some (bucket_ar_n_to_yojson x.bucket_ar_n)));
       
  ])

let reference_data_source_description_to_yojson = 
  fun (x: reference_data_source_description) -> assoc_to_yojson(
    [(
         "ReferenceSchema",
         (option_to_yojson source_schema_to_yojson x.reference_schema));
       (
         "S3ReferenceDataSourceDescription",
         (Some (s3_reference_data_source_description_to_yojson x.s3_reference_data_source_description)));
       (
         "TableName",
         (Some (in_app_table_name_to_yojson x.table_name)));
       (
         "ReferenceId",
         (Some (id_to_yojson x.reference_id)));
       
  ])

let reference_data_source_descriptions_to_yojson = 
  fun tree -> list_to_yojson reference_data_source_description_to_yojson tree

let sql_application_configuration_description_to_yojson = 
  fun (x: sql_application_configuration_description) -> assoc_to_yojson(
    [(
         "ReferenceDataSourceDescriptions",
         (option_to_yojson reference_data_source_descriptions_to_yojson x.reference_data_source_descriptions));
       (
         "OutputDescriptions",
         (option_to_yojson output_descriptions_to_yojson x.output_descriptions));
       (
         "InputDescriptions",
         (option_to_yojson input_descriptions_to_yojson x.input_descriptions));
       
  ])

let code_content_type_to_yojson = 
  fun (x: code_content_type) -> match x with 
  | ZIPFILE -> `String "ZIPFILE"
    | PLAINTEXT -> `String "PLAINTEXT"
     

let text_content_to_yojson = string_to_yojson

let code_m_d5_to_yojson = string_to_yojson

let code_size_to_yojson = long_to_yojson

let s3_application_code_location_description_to_yojson = 
  fun (x: s3_application_code_location_description) -> assoc_to_yojson(
    [(
         "ObjectVersion",
         (option_to_yojson object_version_to_yojson x.object_version));
       (
         "FileKey",
         (Some (file_key_to_yojson x.file_key)));
       (
         "BucketARN",
         (Some (bucket_ar_n_to_yojson x.bucket_ar_n)));
       
  ])

let code_content_description_to_yojson = 
  fun (x: code_content_description) -> assoc_to_yojson(
    [(
         "S3ApplicationCodeLocationDescription",
         (option_to_yojson s3_application_code_location_description_to_yojson x.s3_application_code_location_description));
       (
         "CodeSize",
         (option_to_yojson code_size_to_yojson x.code_size));
       (
         "CodeMD5",
         (option_to_yojson code_m_d5_to_yojson x.code_m_d5));
       (
         "TextContent",
         (option_to_yojson text_content_to_yojson x.text_content));
       
  ])

let application_code_configuration_description_to_yojson = 
  fun (x: application_code_configuration_description) -> assoc_to_yojson(
    [(
         "CodeContentDescription",
         (option_to_yojson code_content_description_to_yojson x.code_content_description));
       (
         "CodeContentType",
         (Some (code_content_type_to_yojson x.code_content_type)));
       
  ])

let application_restore_type_to_yojson = 
  fun (x: application_restore_type) -> match x with 
 
| RESTORE_FROM_CUSTOM_SNAPSHOT -> `String "RESTORE_FROM_CUSTOM_SNAPSHOT"
  | RESTORE_FROM_LATEST_SNAPSHOT -> `String "RESTORE_FROM_LATEST_SNAPSHOT"
  | SKIP_RESTORE_FROM_SNAPSHOT -> `String "SKIP_RESTORE_FROM_SNAPSHOT"
   

let snapshot_name_to_yojson = string_to_yojson

let application_restore_configuration_to_yojson = 
  fun (x: application_restore_configuration) -> assoc_to_yojson(
    [(
         "SnapshotName",
         (option_to_yojson snapshot_name_to_yojson x.snapshot_name));
       (
         "ApplicationRestoreType",
         (Some (application_restore_type_to_yojson x.application_restore_type)));
       
  ])

let boolean_object_to_yojson = bool_to_yojson

let flink_run_configuration_to_yojson = 
  fun (x: flink_run_configuration) -> assoc_to_yojson(
    [(
         "AllowNonRestoredState",
         (option_to_yojson boolean_object_to_yojson x.allow_non_restored_state));
       
  ])

let run_configuration_description_to_yojson = 
  fun (x: run_configuration_description) -> assoc_to_yojson(
    [(
         "FlinkRunConfigurationDescription",
         (option_to_yojson flink_run_configuration_to_yojson x.flink_run_configuration_description));
       (
         "ApplicationRestoreConfigurationDescription",
         (option_to_yojson application_restore_configuration_to_yojson x.application_restore_configuration_description));
       
  ])

let configuration_type_to_yojson = 
  fun (x: configuration_type) -> match x with 
  | CUSTOM -> `String "CUSTOM"
    | DEFAULT -> `String "DEFAULT"
     

let checkpoint_interval_to_yojson = long_to_yojson

let min_pause_between_checkpoints_to_yojson = long_to_yojson

let checkpoint_configuration_description_to_yojson = 
  fun (x: checkpoint_configuration_description) -> assoc_to_yojson(
    [(
         "MinPauseBetweenCheckpoints",
         (option_to_yojson min_pause_between_checkpoints_to_yojson x.min_pause_between_checkpoints));
       (
         "CheckpointInterval",
         (option_to_yojson checkpoint_interval_to_yojson x.checkpoint_interval));
       (
         "CheckpointingEnabled",
         (option_to_yojson boolean_object_to_yojson x.checkpointing_enabled));
       (
         "ConfigurationType",
         (option_to_yojson configuration_type_to_yojson x.configuration_type));
       
  ])

let metrics_level_to_yojson = 
  fun (x: metrics_level) -> match x with 
 
| PARALLELISM -> `String "PARALLELISM"
  | OPERATOR -> `String "OPERATOR"
  | TASK -> `String "TASK"
  | APPLICATION -> `String "APPLICATION"
   

let monitoring_configuration_description_to_yojson = 
  fun (x: monitoring_configuration_description) -> assoc_to_yojson(
    [(
         "LogLevel",
         (option_to_yojson log_level_to_yojson x.log_level));
       (
         "MetricsLevel",
         (option_to_yojson metrics_level_to_yojson x.metrics_level));
       (
         "ConfigurationType",
         (option_to_yojson configuration_type_to_yojson x.configuration_type));
       
  ])

let parallelism_to_yojson = int_to_yojson

let parallelism_per_kp_u_to_yojson = int_to_yojson

let parallelism_configuration_description_to_yojson = 
  fun (x: parallelism_configuration_description) -> assoc_to_yojson(
    [(
         "AutoScalingEnabled",
         (option_to_yojson boolean_object_to_yojson x.auto_scaling_enabled));
       (
         "CurrentParallelism",
         (option_to_yojson parallelism_to_yojson x.current_parallelism));
       (
         "ParallelismPerKPU",
         (option_to_yojson parallelism_per_kp_u_to_yojson x.parallelism_per_kp_u));
       (
         "Parallelism",
         (option_to_yojson parallelism_to_yojson x.parallelism));
       (
         "ConfigurationType",
         (option_to_yojson configuration_type_to_yojson x.configuration_type));
       
  ])

let job_plan_description_to_yojson = string_to_yojson

let flink_application_configuration_description_to_yojson = 
  fun (x: flink_application_configuration_description) -> assoc_to_yojson(
    [(
         "JobPlanDescription",
         (option_to_yojson job_plan_description_to_yojson x.job_plan_description));
       (
         "ParallelismConfigurationDescription",
         (option_to_yojson parallelism_configuration_description_to_yojson x.parallelism_configuration_description));
       (
         "MonitoringConfigurationDescription",
         (option_to_yojson monitoring_configuration_description_to_yojson x.monitoring_configuration_description));
       (
         "CheckpointConfigurationDescription",
         (option_to_yojson checkpoint_configuration_description_to_yojson x.checkpoint_configuration_description));
       
  ])

let property_value_to_yojson = string_to_yojson

let property_key_to_yojson = string_to_yojson

let property_map_to_yojson = 
  fun tree -> map_to_yojson property_value_to_yojson tree

let property_group_to_yojson = 
  fun (x: property_group) -> assoc_to_yojson(
    [(
         "PropertyMap",
         (Some (property_map_to_yojson x.property_map)));
       (
         "PropertyGroupId",
         (Some (id_to_yojson x.property_group_id)));
       
  ])

let property_groups_to_yojson = 
  fun tree -> list_to_yojson property_group_to_yojson tree

let environment_property_descriptions_to_yojson = 
  fun (x: environment_property_descriptions) -> assoc_to_yojson(
    [(
         "PropertyGroupDescriptions",
         (option_to_yojson property_groups_to_yojson x.property_group_descriptions));
       
  ])

let application_snapshot_configuration_description_to_yojson = 
  fun (x: application_snapshot_configuration_description) -> assoc_to_yojson(
    [(
         "SnapshotsEnabled",
         (Some (boolean_object_to_yojson x.snapshots_enabled)));
       
  ])

let application_configuration_description_to_yojson = 
  fun (x: application_configuration_description) -> assoc_to_yojson(
    [(
         "ZeppelinApplicationConfigurationDescription",
         (option_to_yojson zeppelin_application_configuration_description_to_yojson x.zeppelin_application_configuration_description));
       (
         "VpcConfigurationDescriptions",
         (option_to_yojson vpc_configuration_descriptions_to_yojson x.vpc_configuration_descriptions));
       (
         "ApplicationSnapshotConfigurationDescription",
         (option_to_yojson application_snapshot_configuration_description_to_yojson x.application_snapshot_configuration_description));
       (
         "EnvironmentPropertyDescriptions",
         (option_to_yojson environment_property_descriptions_to_yojson x.environment_property_descriptions));
       (
         "FlinkApplicationConfigurationDescription",
         (option_to_yojson flink_application_configuration_description_to_yojson x.flink_application_configuration_description));
       (
         "RunConfigurationDescription",
         (option_to_yojson run_configuration_description_to_yojson x.run_configuration_description));
       (
         "ApplicationCodeConfigurationDescription",
         (option_to_yojson application_code_configuration_description_to_yojson x.application_code_configuration_description));
       (
         "SqlApplicationConfigurationDescription",
         (option_to_yojson sql_application_configuration_description_to_yojson x.sql_application_configuration_description));
       
  ])

let log_stream_ar_n_to_yojson = string_to_yojson

let cloud_watch_logging_option_description_to_yojson = 
  fun (x: cloud_watch_logging_option_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "LogStreamARN",
         (Some (log_stream_ar_n_to_yojson x.log_stream_ar_n)));
       (
         "CloudWatchLoggingOptionId",
         (option_to_yojson id_to_yojson x.cloud_watch_logging_option_id));
       
  ])

let cloud_watch_logging_option_descriptions_to_yojson = 
  fun tree -> list_to_yojson cloud_watch_logging_option_description_to_yojson tree

let application_maintenance_window_start_time_to_yojson = string_to_yojson

let application_maintenance_window_end_time_to_yojson = string_to_yojson

let application_maintenance_configuration_description_to_yojson = 
  fun (x: application_maintenance_configuration_description) -> assoc_to_yojson(
    [(
         "ApplicationMaintenanceWindowEndTime",
         (Some (application_maintenance_window_end_time_to_yojson x.application_maintenance_window_end_time)));
       (
         "ApplicationMaintenanceWindowStartTime",
         (Some (application_maintenance_window_start_time_to_yojson x.application_maintenance_window_start_time)));
       
  ])

let conditional_token_to_yojson = string_to_yojson

let application_mode_to_yojson = 
  fun (x: application_mode) -> match x with 
  | INTERACTIVE -> `String "INTERACTIVE"
    | STREAMING -> `String "STREAMING"
     

let application_detail_to_yojson = 
  fun (x: application_detail) -> assoc_to_yojson(
    [(
         "ApplicationMode",
         (option_to_yojson application_mode_to_yojson x.application_mode));
       (
         "ApplicationVersionRolledBackTo",
         (option_to_yojson application_version_id_to_yojson x.application_version_rolled_back_to));
       (
         "ConditionalToken",
         (option_to_yojson conditional_token_to_yojson x.conditional_token));
       (
         "ApplicationVersionRolledBackFrom",
         (option_to_yojson application_version_id_to_yojson x.application_version_rolled_back_from));
       (
         "ApplicationVersionUpdatedFrom",
         (option_to_yojson application_version_id_to_yojson x.application_version_updated_from));
       (
         "ApplicationMaintenanceConfigurationDescription",
         (option_to_yojson application_maintenance_configuration_description_to_yojson x.application_maintenance_configuration_description));
       (
         "CloudWatchLoggingOptionDescriptions",
         (option_to_yojson cloud_watch_logging_option_descriptions_to_yojson x.cloud_watch_logging_option_descriptions));
       (
         "ApplicationConfigurationDescription",
         (option_to_yojson application_configuration_description_to_yojson x.application_configuration_description));
       (
         "LastUpdateTimestamp",
         (option_to_yojson timestamp__to_yojson x.last_update_timestamp));
       (
         "CreateTimestamp",
         (option_to_yojson timestamp__to_yojson x.create_timestamp));
       (
         "ApplicationVersionId",
         (Some (application_version_id_to_yojson x.application_version_id)));
       (
         "ApplicationStatus",
         (Some (application_status_to_yojson x.application_status)));
       (
         "ServiceExecutionRole",
         (option_to_yojson role_ar_n_to_yojson x.service_execution_role));
       (
         "RuntimeEnvironment",
         (Some (runtime_environment_to_yojson x.runtime_environment)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       (
         "ApplicationDescription",
         (option_to_yojson application_description_to_yojson x.application_description));
       (
         "ApplicationARN",
         (Some (resource_ar_n_to_yojson x.application_ar_n)));
       
  ])

let update_application_response_to_yojson = 
  fun (x: update_application_response) -> assoc_to_yojson(
    [(
         "ApplicationDetail",
         (Some (application_detail_to_yojson x.application_detail)));
       
  ])

let input_lambda_processor_update_to_yojson = 
  fun (x: input_lambda_processor_update) -> assoc_to_yojson(
    [(
         "ResourceARNUpdate",
         (Some (resource_ar_n_to_yojson x.resource_arn_update)));
       
  ])

let input_processing_configuration_update_to_yojson = 
  fun (x: input_processing_configuration_update) -> assoc_to_yojson(
    [(
         "InputLambdaProcessorUpdate",
         (Some (input_lambda_processor_update_to_yojson x.input_lambda_processor_update)));
       
  ])

let kinesis_streams_input_update_to_yojson = 
  fun (x: kinesis_streams_input_update) -> assoc_to_yojson(
    [(
         "ResourceARNUpdate",
         (Some (resource_ar_n_to_yojson x.resource_arn_update)));
       
  ])

let kinesis_firehose_input_update_to_yojson = 
  fun (x: kinesis_firehose_input_update) -> assoc_to_yojson(
    [(
         "ResourceARNUpdate",
         (Some (resource_ar_n_to_yojson x.resource_arn_update)));
       
  ])

let input_schema_update_to_yojson = 
  fun (x: input_schema_update) -> assoc_to_yojson(
    [(
         "RecordColumnUpdates",
         (option_to_yojson record_columns_to_yojson x.record_column_updates));
       (
         "RecordEncodingUpdate",
         (option_to_yojson record_encoding_to_yojson x.record_encoding_update));
       (
         "RecordFormatUpdate",
         (option_to_yojson record_format_to_yojson x.record_format_update));
       
  ])

let input_parallelism_update_to_yojson = 
  fun (x: input_parallelism_update) -> assoc_to_yojson(
    [(
         "CountUpdate",
         (Some (input_parallelism_count_to_yojson x.count_update)));
       
  ])

let input_update_to_yojson = 
  fun (x: input_update) -> assoc_to_yojson(
    [(
         "InputParallelismUpdate",
         (option_to_yojson input_parallelism_update_to_yojson x.input_parallelism_update));
       (
         "InputSchemaUpdate",
         (option_to_yojson input_schema_update_to_yojson x.input_schema_update));
       (
         "KinesisFirehoseInputUpdate",
         (option_to_yojson kinesis_firehose_input_update_to_yojson x.kinesis_firehose_input_update));
       (
         "KinesisStreamsInputUpdate",
         (option_to_yojson kinesis_streams_input_update_to_yojson x.kinesis_streams_input_update));
       (
         "InputProcessingConfigurationUpdate",
         (option_to_yojson input_processing_configuration_update_to_yojson x.input_processing_configuration_update));
       (
         "NamePrefixUpdate",
         (option_to_yojson in_app_stream_name_to_yojson x.name_prefix_update));
       (
         "InputId",
         (Some (id_to_yojson x.input_id)));
       
  ])

let input_updates_to_yojson = 
  fun tree -> list_to_yojson input_update_to_yojson tree

let kinesis_streams_output_update_to_yojson = 
  fun (x: kinesis_streams_output_update) -> assoc_to_yojson(
    [(
         "ResourceARNUpdate",
         (Some (resource_ar_n_to_yojson x.resource_arn_update)));
       
  ])

let kinesis_firehose_output_update_to_yojson = 
  fun (x: kinesis_firehose_output_update) -> assoc_to_yojson(
    [(
         "ResourceARNUpdate",
         (Some (resource_ar_n_to_yojson x.resource_arn_update)));
       
  ])

let lambda_output_update_to_yojson = 
  fun (x: lambda_output_update) -> assoc_to_yojson(
    [(
         "ResourceARNUpdate",
         (Some (resource_ar_n_to_yojson x.resource_arn_update)));
       
  ])

let output_update_to_yojson = 
  fun (x: output_update) -> assoc_to_yojson(
    [(
         "DestinationSchemaUpdate",
         (option_to_yojson destination_schema_to_yojson x.destination_schema_update));
       (
         "LambdaOutputUpdate",
         (option_to_yojson lambda_output_update_to_yojson x.lambda_output_update));
       (
         "KinesisFirehoseOutputUpdate",
         (option_to_yojson kinesis_firehose_output_update_to_yojson x.kinesis_firehose_output_update));
       (
         "KinesisStreamsOutputUpdate",
         (option_to_yojson kinesis_streams_output_update_to_yojson x.kinesis_streams_output_update));
       (
         "NameUpdate",
         (option_to_yojson in_app_stream_name_to_yojson x.name_update));
       (
         "OutputId",
         (Some (id_to_yojson x.output_id)));
       
  ])

let output_updates_to_yojson = 
  fun tree -> list_to_yojson output_update_to_yojson tree

let s3_reference_data_source_update_to_yojson = 
  fun (x: s3_reference_data_source_update) -> assoc_to_yojson(
    [(
         "FileKeyUpdate",
         (option_to_yojson file_key_to_yojson x.file_key_update));
       (
         "BucketARNUpdate",
         (option_to_yojson bucket_ar_n_to_yojson x.bucket_arn_update));
       
  ])

let reference_data_source_update_to_yojson = 
  fun (x: reference_data_source_update) -> assoc_to_yojson(
    [(
         "ReferenceSchemaUpdate",
         (option_to_yojson source_schema_to_yojson x.reference_schema_update));
       (
         "S3ReferenceDataSourceUpdate",
         (option_to_yojson s3_reference_data_source_update_to_yojson x.s3_reference_data_source_update));
       (
         "TableNameUpdate",
         (option_to_yojson in_app_table_name_to_yojson x.table_name_update));
       (
         "ReferenceId",
         (Some (id_to_yojson x.reference_id)));
       
  ])

let reference_data_source_updates_to_yojson = 
  fun tree -> list_to_yojson reference_data_source_update_to_yojson tree

let sql_application_configuration_update_to_yojson = 
  fun (x: sql_application_configuration_update) -> assoc_to_yojson(
    [(
         "ReferenceDataSourceUpdates",
         (option_to_yojson reference_data_source_updates_to_yojson x.reference_data_source_updates));
       (
         "OutputUpdates",
         (option_to_yojson output_updates_to_yojson x.output_updates));
       (
         "InputUpdates",
         (option_to_yojson input_updates_to_yojson x.input_updates));
       
  ])

let s3_content_location_update_to_yojson = 
  fun (x: s3_content_location_update) -> assoc_to_yojson(
    [(
         "ObjectVersionUpdate",
         (option_to_yojson object_version_to_yojson x.object_version_update));
       (
         "FileKeyUpdate",
         (option_to_yojson file_key_to_yojson x.file_key_update));
       (
         "BucketARNUpdate",
         (option_to_yojson bucket_ar_n_to_yojson x.bucket_arn_update));
       
  ])

let code_content_update_to_yojson = 
  fun (x: code_content_update) -> assoc_to_yojson(
    [(
         "S3ContentLocationUpdate",
         (option_to_yojson s3_content_location_update_to_yojson x.s3_content_location_update));
       (
         "ZipFileContentUpdate",
         (option_to_yojson zip_file_content_to_yojson x.zip_file_content_update));
       (
         "TextContentUpdate",
         (option_to_yojson text_content_to_yojson x.text_content_update));
       
  ])

let application_code_configuration_update_to_yojson = 
  fun (x: application_code_configuration_update) -> assoc_to_yojson(
    [(
         "CodeContentUpdate",
         (option_to_yojson code_content_update_to_yojson x.code_content_update));
       (
         "CodeContentTypeUpdate",
         (option_to_yojson code_content_type_to_yojson x.code_content_type_update));
       
  ])

let checkpoint_configuration_update_to_yojson = 
  fun (x: checkpoint_configuration_update) -> assoc_to_yojson(
    [(
         "MinPauseBetweenCheckpointsUpdate",
         (option_to_yojson min_pause_between_checkpoints_to_yojson x.min_pause_between_checkpoints_update));
       (
         "CheckpointIntervalUpdate",
         (option_to_yojson checkpoint_interval_to_yojson x.checkpoint_interval_update));
       (
         "CheckpointingEnabledUpdate",
         (option_to_yojson boolean_object_to_yojson x.checkpointing_enabled_update));
       (
         "ConfigurationTypeUpdate",
         (option_to_yojson configuration_type_to_yojson x.configuration_type_update));
       
  ])

let monitoring_configuration_update_to_yojson = 
  fun (x: monitoring_configuration_update) -> assoc_to_yojson(
    [(
         "LogLevelUpdate",
         (option_to_yojson log_level_to_yojson x.log_level_update));
       (
         "MetricsLevelUpdate",
         (option_to_yojson metrics_level_to_yojson x.metrics_level_update));
       (
         "ConfigurationTypeUpdate",
         (option_to_yojson configuration_type_to_yojson x.configuration_type_update));
       
  ])

let parallelism_configuration_update_to_yojson = 
  fun (x: parallelism_configuration_update) -> assoc_to_yojson(
    [(
         "AutoScalingEnabledUpdate",
         (option_to_yojson boolean_object_to_yojson x.auto_scaling_enabled_update));
       (
         "ParallelismPerKPUUpdate",
         (option_to_yojson parallelism_per_kp_u_to_yojson x.parallelism_per_kpu_update));
       (
         "ParallelismUpdate",
         (option_to_yojson parallelism_to_yojson x.parallelism_update));
       (
         "ConfigurationTypeUpdate",
         (option_to_yojson configuration_type_to_yojson x.configuration_type_update));
       
  ])

let flink_application_configuration_update_to_yojson = 
  fun (x: flink_application_configuration_update) -> assoc_to_yojson(
    [(
         "ParallelismConfigurationUpdate",
         (option_to_yojson parallelism_configuration_update_to_yojson x.parallelism_configuration_update));
       (
         "MonitoringConfigurationUpdate",
         (option_to_yojson monitoring_configuration_update_to_yojson x.monitoring_configuration_update));
       (
         "CheckpointConfigurationUpdate",
         (option_to_yojson checkpoint_configuration_update_to_yojson x.checkpoint_configuration_update));
       
  ])

let environment_property_updates_to_yojson = 
  fun (x: environment_property_updates) -> assoc_to_yojson(
    [(
         "PropertyGroups",
         (Some (property_groups_to_yojson x.property_groups)));
       
  ])

let application_snapshot_configuration_update_to_yojson = 
  fun (x: application_snapshot_configuration_update) -> assoc_to_yojson(
    [(
         "SnapshotsEnabledUpdate",
         (Some (boolean_object_to_yojson x.snapshots_enabled_update)));
       
  ])

let application_configuration_update_to_yojson = 
  fun (x: application_configuration_update) -> assoc_to_yojson(
    [(
         "ZeppelinApplicationConfigurationUpdate",
         (option_to_yojson zeppelin_application_configuration_update_to_yojson x.zeppelin_application_configuration_update));
       (
         "VpcConfigurationUpdates",
         (option_to_yojson vpc_configuration_updates_to_yojson x.vpc_configuration_updates));
       (
         "ApplicationSnapshotConfigurationUpdate",
         (option_to_yojson application_snapshot_configuration_update_to_yojson x.application_snapshot_configuration_update));
       (
         "EnvironmentPropertyUpdates",
         (option_to_yojson environment_property_updates_to_yojson x.environment_property_updates));
       (
         "FlinkApplicationConfigurationUpdate",
         (option_to_yojson flink_application_configuration_update_to_yojson x.flink_application_configuration_update));
       (
         "ApplicationCodeConfigurationUpdate",
         (option_to_yojson application_code_configuration_update_to_yojson x.application_code_configuration_update));
       (
         "SqlApplicationConfigurationUpdate",
         (option_to_yojson sql_application_configuration_update_to_yojson x.sql_application_configuration_update));
       
  ])

let run_configuration_update_to_yojson = 
  fun (x: run_configuration_update) -> assoc_to_yojson(
    [(
         "ApplicationRestoreConfiguration",
         (option_to_yojson application_restore_configuration_to_yojson x.application_restore_configuration));
       (
         "FlinkRunConfiguration",
         (option_to_yojson flink_run_configuration_to_yojson x.flink_run_configuration));
       
  ])

let cloud_watch_logging_option_update_to_yojson = 
  fun (x: cloud_watch_logging_option_update) -> assoc_to_yojson(
    [(
         "LogStreamARNUpdate",
         (option_to_yojson log_stream_ar_n_to_yojson x.log_stream_arn_update));
       (
         "CloudWatchLoggingOptionId",
         (Some (id_to_yojson x.cloud_watch_logging_option_id)));
       
  ])

let cloud_watch_logging_option_updates_to_yojson = 
  fun tree -> list_to_yojson cloud_watch_logging_option_update_to_yojson tree

let update_application_request_to_yojson = 
  fun (x: update_application_request) -> assoc_to_yojson(
    [(
         "RuntimeEnvironmentUpdate",
         (option_to_yojson runtime_environment_to_yojson x.runtime_environment_update));
       (
         "ConditionalToken",
         (option_to_yojson conditional_token_to_yojson x.conditional_token));
       (
         "CloudWatchLoggingOptionUpdates",
         (option_to_yojson cloud_watch_logging_option_updates_to_yojson x.cloud_watch_logging_option_updates));
       (
         "RunConfigurationUpdate",
         (option_to_yojson run_configuration_update_to_yojson x.run_configuration_update));
       (
         "ServiceExecutionRoleUpdate",
         (option_to_yojson role_ar_n_to_yojson x.service_execution_role_update));
       (
         "ApplicationConfigurationUpdate",
         (option_to_yojson application_configuration_update_to_yojson x.application_configuration_update));
       (
         "CurrentApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.current_application_version_id));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let update_application_maintenance_configuration_response_to_yojson = 
  fun (x: update_application_maintenance_configuration_response) -> assoc_to_yojson(
    [(
         "ApplicationMaintenanceConfigurationDescription",
         (option_to_yojson application_maintenance_configuration_description_to_yojson x.application_maintenance_configuration_description));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let application_maintenance_configuration_update_to_yojson = 
  fun (x: application_maintenance_configuration_update) -> assoc_to_yojson(
    [(
         "ApplicationMaintenanceWindowStartTimeUpdate",
         (Some (application_maintenance_window_start_time_to_yojson x.application_maintenance_window_start_time_update)));
       
  ])

let update_application_maintenance_configuration_request_to_yojson = 
  fun (x: update_application_maintenance_configuration_request) -> assoc_to_yojson(
    [(
         "ApplicationMaintenanceConfigurationUpdate",
         (Some (application_maintenance_configuration_update_to_yojson x.application_maintenance_configuration_update)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let error_message_to_yojson = string_to_yojson

let unsupported_operation_exception_to_yojson = 
  fun (x: unsupported_operation_exception) -> assoc_to_yojson(
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

let resource_in_use_exception_to_yojson = 
  fun (x: resource_in_use_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_argument_exception_to_yojson = 
  fun (x: invalid_argument_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let concurrent_modification_exception_to_yojson = 
  fun (x: concurrent_modification_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_request_exception_to_yojson = 
  fun (x: invalid_request_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_application_configuration_exception_to_yojson = 
  fun (x: invalid_application_configuration_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let code_validation_exception_to_yojson = 
  fun (x: code_validation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let kinesis_analytics_ar_n_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_keys_to_yojson = fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_keys_to_yojson x.tag_keys)));
       (
         "ResourceARN",
         (Some (kinesis_analytics_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let too_many_tags_exception_to_yojson = 
  fun (x: too_many_tags_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let raw_input_record_to_yojson = string_to_yojson

let raw_input_records_to_yojson = 
  fun tree -> list_to_yojson raw_input_record_to_yojson tree

let processed_input_record_to_yojson = string_to_yojson

let processed_input_records_to_yojson = 
  fun tree -> list_to_yojson processed_input_record_to_yojson tree

let unable_to_detect_schema_exception_to_yojson = 
  fun (x: unable_to_detect_schema_exception) -> assoc_to_yojson(
    [(
         "ProcessedInputRecords",
         (option_to_yojson processed_input_records_to_yojson x.processed_input_records));
       (
         "RawInputRecords",
         (option_to_yojson raw_input_records_to_yojson x.raw_input_records));
       (
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson tag_value_to_yojson x.value));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tags_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tags_to_yojson x.tags)));
       (
         "ResourceARN",
         (Some (kinesis_analytics_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let stop_application_response_to_yojson = 
  fun (x: stop_application_response) -> assoc_to_yojson(
    [
  ])

let stop_application_request_to_yojson = 
  fun (x: stop_application_request) -> assoc_to_yojson(
    [(
         "Force",
         (option_to_yojson boolean_object_to_yojson x.force));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let start_application_response_to_yojson = 
  fun (x: start_application_response) -> assoc_to_yojson(
    [
  ])

let sql_run_configuration_to_yojson = 
  fun (x: sql_run_configuration) -> assoc_to_yojson(
    [(
         "InputStartingPositionConfiguration",
         (Some (input_starting_position_configuration_to_yojson x.input_starting_position_configuration)));
       (
         "InputId",
         (Some (id_to_yojson x.input_id)));
       
  ])

let sql_run_configurations_to_yojson = 
  fun tree -> list_to_yojson sql_run_configuration_to_yojson tree

let run_configuration_to_yojson = 
  fun (x: run_configuration) -> assoc_to_yojson(
    [(
         "ApplicationRestoreConfiguration",
         (option_to_yojson application_restore_configuration_to_yojson x.application_restore_configuration));
       (
         "SqlRunConfigurations",
         (option_to_yojson sql_run_configurations_to_yojson x.sql_run_configurations));
       (
         "FlinkRunConfiguration",
         (option_to_yojson flink_run_configuration_to_yojson x.flink_run_configuration));
       
  ])

let start_application_request_to_yojson = 
  fun (x: start_application_request) -> assoc_to_yojson(
    [(
         "RunConfiguration",
         (option_to_yojson run_configuration_to_yojson x.run_configuration));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let input_lambda_processor_to_yojson = 
  fun (x: input_lambda_processor) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let input_processing_configuration_to_yojson = 
  fun (x: input_processing_configuration) -> assoc_to_yojson(
    [(
         "InputLambdaProcessor",
         (Some (input_lambda_processor_to_yojson x.input_lambda_processor)));
       
  ])

let kinesis_streams_input_to_yojson = 
  fun (x: kinesis_streams_input) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let kinesis_firehose_input_to_yojson = 
  fun (x: kinesis_firehose_input) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let input_to_yojson = 
  fun (x: input) -> assoc_to_yojson(
    [(
         "InputSchema",
         (Some (source_schema_to_yojson x.input_schema)));
       (
         "InputParallelism",
         (option_to_yojson input_parallelism_to_yojson x.input_parallelism));
       (
         "KinesisFirehoseInput",
         (option_to_yojson kinesis_firehose_input_to_yojson x.kinesis_firehose_input));
       (
         "KinesisStreamsInput",
         (option_to_yojson kinesis_streams_input_to_yojson x.kinesis_streams_input));
       (
         "InputProcessingConfiguration",
         (option_to_yojson input_processing_configuration_to_yojson x.input_processing_configuration));
       (
         "NamePrefix",
         (Some (in_app_stream_name_to_yojson x.name_prefix)));
       
  ])

let inputs_to_yojson = fun tree -> list_to_yojson input_to_yojson tree

let kinesis_streams_output_to_yojson = 
  fun (x: kinesis_streams_output) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let kinesis_firehose_output_to_yojson = 
  fun (x: kinesis_firehose_output) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let lambda_output_to_yojson = 
  fun (x: lambda_output) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let output_to_yojson = 
  fun (x: output) -> assoc_to_yojson(
    [(
         "DestinationSchema",
         (Some (destination_schema_to_yojson x.destination_schema)));
       (
         "LambdaOutput",
         (option_to_yojson lambda_output_to_yojson x.lambda_output));
       (
         "KinesisFirehoseOutput",
         (option_to_yojson kinesis_firehose_output_to_yojson x.kinesis_firehose_output));
       (
         "KinesisStreamsOutput",
         (option_to_yojson kinesis_streams_output_to_yojson x.kinesis_streams_output));
       (
         "Name",
         (Some (in_app_stream_name_to_yojson x.name)));
       
  ])

let outputs_to_yojson = fun tree -> list_to_yojson output_to_yojson tree

let s3_reference_data_source_to_yojson = 
  fun (x: s3_reference_data_source) -> assoc_to_yojson(
    [(
         "FileKey",
         (option_to_yojson file_key_to_yojson x.file_key));
       (
         "BucketARN",
         (option_to_yojson bucket_ar_n_to_yojson x.bucket_ar_n));
       
  ])

let reference_data_source_to_yojson = 
  fun (x: reference_data_source) -> assoc_to_yojson(
    [(
         "ReferenceSchema",
         (Some (source_schema_to_yojson x.reference_schema)));
       (
         "S3ReferenceDataSource",
         (option_to_yojson s3_reference_data_source_to_yojson x.s3_reference_data_source));
       (
         "TableName",
         (Some (in_app_table_name_to_yojson x.table_name)));
       
  ])

let reference_data_sources_to_yojson = 
  fun tree -> list_to_yojson reference_data_source_to_yojson tree

let sql_application_configuration_to_yojson = 
  fun (x: sql_application_configuration) -> assoc_to_yojson(
    [(
         "ReferenceDataSources",
         (option_to_yojson reference_data_sources_to_yojson x.reference_data_sources));
       (
         "Outputs",
         (option_to_yojson outputs_to_yojson x.outputs));
       (
         "Inputs",
         (option_to_yojson inputs_to_yojson x.inputs));
       
  ])

let snapshot_status_to_yojson = 
  fun (x: snapshot_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | READY -> `String "READY"
  | CREATING -> `String "CREATING"
   

let snapshot_details_to_yojson = 
  fun (x: snapshot_details) -> assoc_to_yojson(
    [(
         "RuntimeEnvironment",
         (option_to_yojson runtime_environment_to_yojson x.runtime_environment));
       (
         "SnapshotCreationTimestamp",
         (option_to_yojson timestamp__to_yojson x.snapshot_creation_timestamp));
       (
         "ApplicationVersionId",
         (Some (application_version_id_to_yojson x.application_version_id)));
       (
         "SnapshotStatus",
         (Some (snapshot_status_to_yojson x.snapshot_status)));
       (
         "SnapshotName",
         (Some (snapshot_name_to_yojson x.snapshot_name)));
       
  ])

let snapshot_summaries_to_yojson = 
  fun tree -> list_to_yojson snapshot_details_to_yojson tree

let session_expiration_duration_in_seconds_to_yojson = long_to_yojson

let service_unavailable_exception_to_yojson = 
  fun (x: service_unavailable_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let s3_configuration_to_yojson = 
  fun (x: s3_configuration) -> assoc_to_yojson(
    [(
         "FileKey",
         (Some (file_key_to_yojson x.file_key)));
       (
         "BucketARN",
         (Some (bucket_ar_n_to_yojson x.bucket_ar_n)));
       
  ])

let rollback_application_response_to_yojson = 
  fun (x: rollback_application_response) -> assoc_to_yojson(
    [(
         "ApplicationDetail",
         (Some (application_detail_to_yojson x.application_detail)));
       
  ])

let rollback_application_request_to_yojson = 
  fun (x: rollback_application_request) -> assoc_to_yojson(
    [(
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let resource_provisioned_throughput_exceeded_exception_to_yojson = 
  fun (x: resource_provisioned_throughput_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let parsed_input_record_field_to_yojson = string_to_yojson

let parsed_input_record_to_yojson = 
  fun tree -> list_to_yojson parsed_input_record_field_to_yojson tree

let parsed_input_records_to_yojson = 
  fun tree -> list_to_yojson parsed_input_record_to_yojson tree

let parallelism_configuration_to_yojson = 
  fun (x: parallelism_configuration) -> assoc_to_yojson(
    [(
         "AutoScalingEnabled",
         (option_to_yojson boolean_object_to_yojson x.auto_scaling_enabled));
       (
         "ParallelismPerKPU",
         (option_to_yojson parallelism_per_kp_u_to_yojson x.parallelism_per_kp_u));
       (
         "Parallelism",
         (option_to_yojson parallelism_to_yojson x.parallelism));
       (
         "ConfigurationType",
         (Some (configuration_type_to_yojson x.configuration_type)));
       
  ])

let next_token_to_yojson = string_to_yojson

let monitoring_configuration_to_yojson = 
  fun (x: monitoring_configuration) -> assoc_to_yojson(
    [(
         "LogLevel",
         (option_to_yojson log_level_to_yojson x.log_level));
       (
         "MetricsLevel",
         (option_to_yojson metrics_level_to_yojson x.metrics_level));
       (
         "ConfigurationType",
         (Some (configuration_type_to_yojson x.configuration_type)));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (kinesis_analytics_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let list_snapshots_input_limit_to_yojson = int_to_yojson

let application_summary_to_yojson = 
  fun (x: application_summary) -> assoc_to_yojson(
    [(
         "ApplicationMode",
         (option_to_yojson application_mode_to_yojson x.application_mode));
       (
         "RuntimeEnvironment",
         (Some (runtime_environment_to_yojson x.runtime_environment)));
       (
         "ApplicationVersionId",
         (Some (application_version_id_to_yojson x.application_version_id)));
       (
         "ApplicationStatus",
         (Some (application_status_to_yojson x.application_status)));
       (
         "ApplicationARN",
         (Some (resource_ar_n_to_yojson x.application_ar_n)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let application_summaries_to_yojson = 
  fun tree -> list_to_yojson application_summary_to_yojson tree

let list_applications_response_to_yojson = 
  fun (x: list_applications_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson application_name_to_yojson x.next_token));
       (
         "ApplicationSummaries",
         (Some (application_summaries_to_yojson x.application_summaries)));
       
  ])

let list_applications_input_limit_to_yojson = int_to_yojson

let list_applications_request_to_yojson = 
  fun (x: list_applications_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson application_name_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson list_applications_input_limit_to_yojson x.limit));
       
  ])

let application_version_summary_to_yojson = 
  fun (x: application_version_summary) -> assoc_to_yojson(
    [(
         "ApplicationStatus",
         (Some (application_status_to_yojson x.application_status)));
       (
         "ApplicationVersionId",
         (Some (application_version_id_to_yojson x.application_version_id)));
       
  ])

let application_version_summaries_to_yojson = 
  fun tree -> list_to_yojson application_version_summary_to_yojson tree

let list_application_versions_response_to_yojson = 
  fun (x: list_application_versions_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ApplicationVersionSummaries",
         (option_to_yojson application_version_summaries_to_yojson x.application_version_summaries));
       
  ])

let list_application_versions_input_limit_to_yojson = int_to_yojson

let list_application_versions_request_to_yojson = 
  fun (x: list_application_versions_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson list_application_versions_input_limit_to_yojson x.limit));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let list_application_snapshots_response_to_yojson = 
  fun (x: list_application_snapshots_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SnapshotSummaries",
         (option_to_yojson snapshot_summaries_to_yojson x.snapshot_summaries));
       
  ])

let list_application_snapshots_request_to_yojson = 
  fun (x: list_application_snapshots_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson list_snapshots_input_limit_to_yojson x.limit));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let discover_input_schema_response_to_yojson = 
  fun (x: discover_input_schema_response) -> assoc_to_yojson(
    [(
         "RawInputRecords",
         (option_to_yojson raw_input_records_to_yojson x.raw_input_records));
       (
         "ProcessedInputRecords",
         (option_to_yojson processed_input_records_to_yojson x.processed_input_records));
       (
         "ParsedInputRecords",
         (option_to_yojson parsed_input_records_to_yojson x.parsed_input_records));
       (
         "InputSchema",
         (option_to_yojson source_schema_to_yojson x.input_schema));
       
  ])

let discover_input_schema_request_to_yojson = 
  fun (x: discover_input_schema_request) -> assoc_to_yojson(
    [(
         "InputProcessingConfiguration",
         (option_to_yojson input_processing_configuration_to_yojson x.input_processing_configuration));
       (
         "S3Configuration",
         (option_to_yojson s3_configuration_to_yojson x.s3_configuration));
       (
         "InputStartingPositionConfiguration",
         (option_to_yojson input_starting_position_configuration_to_yojson x.input_starting_position_configuration));
       (
         "ServiceExecutionRole",
         (Some (role_ar_n_to_yojson x.service_execution_role)));
       (
         "ResourceARN",
         (option_to_yojson resource_ar_n_to_yojson x.resource_ar_n));
       
  ])

let describe_application_version_response_to_yojson = 
  fun (x: describe_application_version_response) -> assoc_to_yojson(
    [(
         "ApplicationVersionDetail",
         (option_to_yojson application_detail_to_yojson x.application_version_detail));
       
  ])

let describe_application_version_request_to_yojson = 
  fun (x: describe_application_version_request) -> assoc_to_yojson(
    [(
         "ApplicationVersionId",
         (Some (application_version_id_to_yojson x.application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let describe_application_snapshot_response_to_yojson = 
  fun (x: describe_application_snapshot_response) -> assoc_to_yojson(
    [(
         "SnapshotDetails",
         (Some (snapshot_details_to_yojson x.snapshot_details)));
       
  ])

let describe_application_snapshot_request_to_yojson = 
  fun (x: describe_application_snapshot_request) -> assoc_to_yojson(
    [(
         "SnapshotName",
         (Some (snapshot_name_to_yojson x.snapshot_name)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let describe_application_response_to_yojson = 
  fun (x: describe_application_response) -> assoc_to_yojson(
    [(
         "ApplicationDetail",
         (Some (application_detail_to_yojson x.application_detail)));
       
  ])

let describe_application_request_to_yojson = 
  fun (x: describe_application_request) -> assoc_to_yojson(
    [(
         "IncludeAdditionalDetails",
         (option_to_yojson boolean_object_to_yojson x.include_additional_details));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let delete_application_vpc_configuration_response_to_yojson = 
  fun (x: delete_application_vpc_configuration_response) -> assoc_to_yojson(
    [(
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let delete_application_vpc_configuration_request_to_yojson = 
  fun (x: delete_application_vpc_configuration_request) -> assoc_to_yojson(
    [(
         "ConditionalToken",
         (option_to_yojson conditional_token_to_yojson x.conditional_token));
       (
         "VpcConfigurationId",
         (Some (id_to_yojson x.vpc_configuration_id)));
       (
         "CurrentApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.current_application_version_id));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let delete_application_snapshot_response_to_yojson = 
  fun (x: delete_application_snapshot_response) -> assoc_to_yojson(
    [
  ])

let delete_application_snapshot_request_to_yojson = 
  fun (x: delete_application_snapshot_request) -> assoc_to_yojson(
    [(
         "SnapshotCreationTimestamp",
         (Some (timestamp__to_yojson x.snapshot_creation_timestamp)));
       (
         "SnapshotName",
         (Some (snapshot_name_to_yojson x.snapshot_name)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let delete_application_reference_data_source_response_to_yojson = 
  fun (x: delete_application_reference_data_source_response) -> assoc_to_yojson(
    [(
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let delete_application_reference_data_source_request_to_yojson = 
  fun (x: delete_application_reference_data_source_request) -> assoc_to_yojson(
    [(
         "ReferenceId",
         (Some (id_to_yojson x.reference_id)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let delete_application_output_response_to_yojson = 
  fun (x: delete_application_output_response) -> assoc_to_yojson(
    [(
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let delete_application_output_request_to_yojson = 
  fun (x: delete_application_output_request) -> assoc_to_yojson(
    [(
         "OutputId",
         (Some (id_to_yojson x.output_id)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let delete_application_input_processing_configuration_response_to_yojson = 
  fun (x: delete_application_input_processing_configuration_response) -> assoc_to_yojson(
    [(
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let delete_application_input_processing_configuration_request_to_yojson = 
  fun (x: delete_application_input_processing_configuration_request) -> assoc_to_yojson(
    [(
         "InputId",
         (Some (id_to_yojson x.input_id)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let delete_application_cloud_watch_logging_option_response_to_yojson = 
  fun (x: delete_application_cloud_watch_logging_option_response) -> assoc_to_yojson(
    [(
         "CloudWatchLoggingOptionDescriptions",
         (option_to_yojson cloud_watch_logging_option_descriptions_to_yojson x.cloud_watch_logging_option_descriptions));
       (
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let delete_application_cloud_watch_logging_option_request_to_yojson = 
  fun (x: delete_application_cloud_watch_logging_option_request) -> assoc_to_yojson(
    [(
         "ConditionalToken",
         (option_to_yojson conditional_token_to_yojson x.conditional_token));
       (
         "CloudWatchLoggingOptionId",
         (Some (id_to_yojson x.cloud_watch_logging_option_id)));
       (
         "CurrentApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.current_application_version_id));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let delete_application_response_to_yojson = 
  fun (x: delete_application_response) -> assoc_to_yojson(
    [
  ])

let delete_application_request_to_yojson = 
  fun (x: delete_application_request) -> assoc_to_yojson(
    [(
         "CreateTimestamp",
         (Some (timestamp__to_yojson x.create_timestamp)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let create_application_snapshot_response_to_yojson = 
  fun (x: create_application_snapshot_response) -> assoc_to_yojson(
    [
  ])

let create_application_snapshot_request_to_yojson = 
  fun (x: create_application_snapshot_request) -> assoc_to_yojson(
    [(
         "SnapshotName",
         (Some (snapshot_name_to_yojson x.snapshot_name)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let authorized_url_to_yojson = string_to_yojson

let create_application_presigned_url_response_to_yojson = 
  fun (x: create_application_presigned_url_response) -> assoc_to_yojson(
    [(
         "AuthorizedUrl",
         (option_to_yojson authorized_url_to_yojson x.authorized_url));
       
  ])

let create_application_presigned_url_request_to_yojson = 
  fun (x: create_application_presigned_url_request) -> assoc_to_yojson(
    [(
         "SessionExpirationDurationInSeconds",
         (option_to_yojson session_expiration_duration_in_seconds_to_yojson x.session_expiration_duration_in_seconds));
       (
         "UrlType",
         (Some (url_type_to_yojson x.url_type)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let create_application_response_to_yojson = 
  fun (x: create_application_response) -> assoc_to_yojson(
    [(
         "ApplicationDetail",
         (Some (application_detail_to_yojson x.application_detail)));
       
  ])

let checkpoint_configuration_to_yojson = 
  fun (x: checkpoint_configuration) -> assoc_to_yojson(
    [(
         "MinPauseBetweenCheckpoints",
         (option_to_yojson min_pause_between_checkpoints_to_yojson x.min_pause_between_checkpoints));
       (
         "CheckpointInterval",
         (option_to_yojson checkpoint_interval_to_yojson x.checkpoint_interval));
       (
         "CheckpointingEnabled",
         (option_to_yojson boolean_object_to_yojson x.checkpointing_enabled));
       (
         "ConfigurationType",
         (Some (configuration_type_to_yojson x.configuration_type)));
       
  ])

let flink_application_configuration_to_yojson = 
  fun (x: flink_application_configuration) -> assoc_to_yojson(
    [(
         "ParallelismConfiguration",
         (option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration));
       (
         "MonitoringConfiguration",
         (option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration));
       (
         "CheckpointConfiguration",
         (option_to_yojson checkpoint_configuration_to_yojson x.checkpoint_configuration));
       
  ])

let environment_properties_to_yojson = 
  fun (x: environment_properties) -> assoc_to_yojson(
    [(
         "PropertyGroups",
         (Some (property_groups_to_yojson x.property_groups)));
       
  ])

let code_content_to_yojson = 
  fun (x: code_content) -> assoc_to_yojson(
    [(
         "S3ContentLocation",
         (option_to_yojson s3_content_location_to_yojson x.s3_content_location));
       (
         "ZipFileContent",
         (option_to_yojson zip_file_content_to_yojson x.zip_file_content));
       (
         "TextContent",
         (option_to_yojson text_content_to_yojson x.text_content));
       
  ])

let application_code_configuration_to_yojson = 
  fun (x: application_code_configuration) -> assoc_to_yojson(
    [(
         "CodeContentType",
         (Some (code_content_type_to_yojson x.code_content_type)));
       (
         "CodeContent",
         (option_to_yojson code_content_to_yojson x.code_content));
       
  ])

let application_snapshot_configuration_to_yojson = 
  fun (x: application_snapshot_configuration) -> assoc_to_yojson(
    [(
         "SnapshotsEnabled",
         (Some (boolean_object_to_yojson x.snapshots_enabled)));
       
  ])

let application_configuration_to_yojson = 
  fun (x: application_configuration) -> assoc_to_yojson(
    [(
         "ZeppelinApplicationConfiguration",
         (option_to_yojson zeppelin_application_configuration_to_yojson x.zeppelin_application_configuration));
       (
         "VpcConfigurations",
         (option_to_yojson vpc_configurations_to_yojson x.vpc_configurations));
       (
         "ApplicationSnapshotConfiguration",
         (option_to_yojson application_snapshot_configuration_to_yojson x.application_snapshot_configuration));
       (
         "ApplicationCodeConfiguration",
         (option_to_yojson application_code_configuration_to_yojson x.application_code_configuration));
       (
         "EnvironmentProperties",
         (option_to_yojson environment_properties_to_yojson x.environment_properties));
       (
         "FlinkApplicationConfiguration",
         (option_to_yojson flink_application_configuration_to_yojson x.flink_application_configuration));
       (
         "SqlApplicationConfiguration",
         (option_to_yojson sql_application_configuration_to_yojson x.sql_application_configuration));
       
  ])

let cloud_watch_logging_option_to_yojson = 
  fun (x: cloud_watch_logging_option) -> assoc_to_yojson(
    [(
         "LogStreamARN",
         (Some (log_stream_ar_n_to_yojson x.log_stream_ar_n)));
       
  ])

let cloud_watch_logging_options_to_yojson = 
  fun tree -> list_to_yojson cloud_watch_logging_option_to_yojson tree

let create_application_request_to_yojson = 
  fun (x: create_application_request) -> assoc_to_yojson(
    [(
         "ApplicationMode",
         (option_to_yojson application_mode_to_yojson x.application_mode));
       (
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "CloudWatchLoggingOptions",
         (option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options));
       (
         "ApplicationConfiguration",
         (option_to_yojson application_configuration_to_yojson x.application_configuration));
       (
         "ServiceExecutionRole",
         (Some (role_ar_n_to_yojson x.service_execution_role)));
       (
         "RuntimeEnvironment",
         (Some (runtime_environment_to_yojson x.runtime_environment)));
       (
         "ApplicationDescription",
         (option_to_yojson application_description_to_yojson x.application_description));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let add_application_vpc_configuration_response_to_yojson = 
  fun (x: add_application_vpc_configuration_response) -> assoc_to_yojson(
    [(
         "VpcConfigurationDescription",
         (option_to_yojson vpc_configuration_description_to_yojson x.vpc_configuration_description));
       (
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let add_application_vpc_configuration_request_to_yojson = 
  fun (x: add_application_vpc_configuration_request) -> assoc_to_yojson(
    [(
         "ConditionalToken",
         (option_to_yojson conditional_token_to_yojson x.conditional_token));
       (
         "VpcConfiguration",
         (Some (vpc_configuration_to_yojson x.vpc_configuration)));
       (
         "CurrentApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.current_application_version_id));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let add_application_reference_data_source_response_to_yojson = 
  fun (x: add_application_reference_data_source_response) -> assoc_to_yojson(
    [(
         "ReferenceDataSourceDescriptions",
         (option_to_yojson reference_data_source_descriptions_to_yojson x.reference_data_source_descriptions));
       (
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let add_application_reference_data_source_request_to_yojson = 
  fun (x: add_application_reference_data_source_request) -> assoc_to_yojson(
    [(
         "ReferenceDataSource",
         (Some (reference_data_source_to_yojson x.reference_data_source)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let add_application_output_response_to_yojson = 
  fun (x: add_application_output_response) -> assoc_to_yojson(
    [(
         "OutputDescriptions",
         (option_to_yojson output_descriptions_to_yojson x.output_descriptions));
       (
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let add_application_output_request_to_yojson = 
  fun (x: add_application_output_request) -> assoc_to_yojson(
    [(
         "Output",
         (Some (output_to_yojson x.output)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let add_application_input_processing_configuration_response_to_yojson = 
  fun (x: add_application_input_processing_configuration_response) -> assoc_to_yojson(
    [(
         "InputProcessingConfigurationDescription",
         (option_to_yojson input_processing_configuration_description_to_yojson x.input_processing_configuration_description));
       (
         "InputId",
         (option_to_yojson id_to_yojson x.input_id));
       (
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let add_application_input_processing_configuration_request_to_yojson = 
  fun (x: add_application_input_processing_configuration_request) -> assoc_to_yojson(
    [(
         "InputProcessingConfiguration",
         (Some (input_processing_configuration_to_yojson x.input_processing_configuration)));
       (
         "InputId",
         (Some (id_to_yojson x.input_id)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let add_application_input_response_to_yojson = 
  fun (x: add_application_input_response) -> assoc_to_yojson(
    [(
         "InputDescriptions",
         (option_to_yojson input_descriptions_to_yojson x.input_descriptions));
       (
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let add_application_input_request_to_yojson = 
  fun (x: add_application_input_request) -> assoc_to_yojson(
    [(
         "Input",
         (Some (input_to_yojson x.input)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let add_application_cloud_watch_logging_option_response_to_yojson = 
  fun (x: add_application_cloud_watch_logging_option_response) -> assoc_to_yojson(
    [(
         "CloudWatchLoggingOptionDescriptions",
         (option_to_yojson cloud_watch_logging_option_descriptions_to_yojson x.cloud_watch_logging_option_descriptions));
       (
         "ApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.application_version_id));
       (
         "ApplicationARN",
         (option_to_yojson resource_ar_n_to_yojson x.application_ar_n));
       
  ])

let add_application_cloud_watch_logging_option_request_to_yojson = 
  fun (x: add_application_cloud_watch_logging_option_request) -> assoc_to_yojson(
    [(
         "ConditionalToken",
         (option_to_yojson conditional_token_to_yojson x.conditional_token));
       (
         "CloudWatchLoggingOption",
         (Some (cloud_watch_logging_option_to_yojson x.cloud_watch_logging_option)));
       (
         "CurrentApplicationVersionId",
         (option_to_yojson application_version_id_to_yojson x.current_application_version_id));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

