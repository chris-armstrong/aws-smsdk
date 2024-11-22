open Smaws_Lib.Json.DeserializeHelpers

open Types

let zip_file_content_of_yojson = blob_of_yojson

let base_unit_of_yojson = unit_of_yojson

let log_level_of_yojson = 
  fun (tree: t) path : log_level -> match tree with 
    | `String "DEBUG" -> DEBUG
    | `String "ERROR" -> ERROR
    | `String "WARN" -> WARN
    | `String "INFO" -> INFO
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "LogLevel")

let zeppelin_monitoring_configuration_update_of_yojson = 
  fun tree path : zeppelin_monitoring_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : zeppelin_monitoring_configuration_update = {
    log_level_update = value_for_key (log_level_of_yojson) "LogLevelUpdate" _list path;
    
  }
  in _res

let zeppelin_monitoring_configuration_description_of_yojson = 
  fun tree path : zeppelin_monitoring_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : zeppelin_monitoring_configuration_description = {
    log_level = option_of_yojson (value_for_key (log_level_of_yojson) "LogLevel") _list path;
    
  }
  in _res

let zeppelin_monitoring_configuration_of_yojson = 
  fun tree path : zeppelin_monitoring_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : zeppelin_monitoring_configuration = {
    log_level = value_for_key (log_level_of_yojson) "LogLevel" _list path;
    
  }
  in _res

let database_ar_n_of_yojson = string_of_yojson

let glue_data_catalog_configuration_update_of_yojson = 
  fun tree path : glue_data_catalog_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : glue_data_catalog_configuration_update = {
    database_arn_update = value_for_key (database_ar_n_of_yojson) "DatabaseARNUpdate" _list path;
    
  }
  in _res

let catalog_configuration_update_of_yojson = 
  fun tree path : catalog_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : catalog_configuration_update = {
    glue_data_catalog_configuration_update = value_for_key (glue_data_catalog_configuration_update_of_yojson) "GlueDataCatalogConfigurationUpdate" _list path;
    
  }
  in _res

let bucket_ar_n_of_yojson = string_of_yojson

let base_path_of_yojson = string_of_yojson

let s3_content_base_location_update_of_yojson = 
  fun tree path : s3_content_base_location_update ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_content_base_location_update = {
    base_path_update = option_of_yojson (value_for_key (base_path_of_yojson) "BasePathUpdate") _list path;
    bucket_arn_update = option_of_yojson (value_for_key (bucket_ar_n_of_yojson) "BucketARNUpdate") _list path;
    
  }
  in _res

let deploy_as_application_configuration_update_of_yojson = 
  fun tree path : deploy_as_application_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : deploy_as_application_configuration_update = {
    s3_content_location_update = option_of_yojson (value_for_key (s3_content_base_location_update_of_yojson) "S3ContentLocationUpdate") _list path;
    
  }
  in _res

let artifact_type_of_yojson = 
  fun (tree: t) path : artifact_type -> match tree with 
    | `String "DEPENDENCY_JAR" -> DEPENDENCY_JAR
    | `String "UDF" -> UDF
    | `String value -> raise (deserialize_unknown_enum_value_error path "ArtifactType" value)
    | _ -> raise (deserialize_wrong_type_error path "ArtifactType")

let file_key_of_yojson = string_of_yojson

let object_version_of_yojson = string_of_yojson

let s3_content_location_of_yojson = 
  fun tree path : s3_content_location ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_content_location = {
    object_version = option_of_yojson (value_for_key (object_version_of_yojson) "ObjectVersion") _list path;
    file_key = value_for_key (file_key_of_yojson) "FileKey" _list path;
    bucket_ar_n = value_for_key (bucket_ar_n_of_yojson) "BucketARN" _list path;
    
  }
  in _res

let maven_group_id_of_yojson = string_of_yojson

let maven_artifact_id_of_yojson = string_of_yojson

let maven_version_of_yojson = string_of_yojson

let maven_reference_of_yojson = 
  fun tree path : maven_reference ->
  let _list = assoc_of_yojson tree path in
  let _res : maven_reference = {
    version = value_for_key (maven_version_of_yojson) "Version" _list path;
    artifact_id = value_for_key (maven_artifact_id_of_yojson) "ArtifactId" _list path;
    group_id = value_for_key (maven_group_id_of_yojson) "GroupId" _list path;
    
  }
  in _res

let custom_artifact_configuration_of_yojson = 
  fun tree path : custom_artifact_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_artifact_configuration = {
    maven_reference = option_of_yojson (value_for_key (maven_reference_of_yojson) "MavenReference") _list path;
    s3_content_location = option_of_yojson (value_for_key (s3_content_location_of_yojson) "S3ContentLocation") _list path;
    artifact_type = value_for_key (artifact_type_of_yojson) "ArtifactType" _list path;
    
  }
  in _res

let custom_artifacts_configuration_list_of_yojson = 
  fun tree path -> list_of_yojson custom_artifact_configuration_of_yojson tree path 

let zeppelin_application_configuration_update_of_yojson = 
  fun tree path : zeppelin_application_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : zeppelin_application_configuration_update = {
    custom_artifacts_configuration_update = option_of_yojson (value_for_key (custom_artifacts_configuration_list_of_yojson) "CustomArtifactsConfigurationUpdate") _list path;
    deploy_as_application_configuration_update = option_of_yojson (value_for_key (deploy_as_application_configuration_update_of_yojson) "DeployAsApplicationConfigurationUpdate") _list path;
    catalog_configuration_update = option_of_yojson (value_for_key (catalog_configuration_update_of_yojson) "CatalogConfigurationUpdate") _list path;
    monitoring_configuration_update = option_of_yojson (value_for_key (zeppelin_monitoring_configuration_update_of_yojson) "MonitoringConfigurationUpdate") _list path;
    
  }
  in _res

let glue_data_catalog_configuration_description_of_yojson = 
  fun tree path : glue_data_catalog_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : glue_data_catalog_configuration_description = {
    database_ar_n = value_for_key (database_ar_n_of_yojson) "DatabaseARN" _list path;
    
  }
  in _res

let catalog_configuration_description_of_yojson = 
  fun tree path : catalog_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : catalog_configuration_description = {
    glue_data_catalog_configuration_description = value_for_key (glue_data_catalog_configuration_description_of_yojson) "GlueDataCatalogConfigurationDescription" _list path;
    
  }
  in _res

let s3_content_base_location_description_of_yojson = 
  fun tree path : s3_content_base_location_description ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_content_base_location_description = {
    base_path = option_of_yojson (value_for_key (base_path_of_yojson) "BasePath") _list path;
    bucket_ar_n = value_for_key (bucket_ar_n_of_yojson) "BucketARN" _list path;
    
  }
  in _res

let deploy_as_application_configuration_description_of_yojson = 
  fun tree path : deploy_as_application_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : deploy_as_application_configuration_description = {
    s3_content_location_description = value_for_key (s3_content_base_location_description_of_yojson) "S3ContentLocationDescription" _list path;
    
  }
  in _res

let custom_artifact_configuration_description_of_yojson = 
  fun tree path : custom_artifact_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_artifact_configuration_description = {
    maven_reference_description = option_of_yojson (value_for_key (maven_reference_of_yojson) "MavenReferenceDescription") _list path;
    s3_content_location_description = option_of_yojson (value_for_key (s3_content_location_of_yojson) "S3ContentLocationDescription") _list path;
    artifact_type = option_of_yojson (value_for_key (artifact_type_of_yojson) "ArtifactType") _list path;
    
  }
  in _res

let custom_artifacts_configuration_description_list_of_yojson = 
  fun tree path -> list_of_yojson custom_artifact_configuration_description_of_yojson tree path 

let zeppelin_application_configuration_description_of_yojson = 
  fun tree path : zeppelin_application_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : zeppelin_application_configuration_description = {
    custom_artifacts_configuration_description = option_of_yojson (value_for_key (custom_artifacts_configuration_description_list_of_yojson) "CustomArtifactsConfigurationDescription") _list path;
    deploy_as_application_configuration_description = option_of_yojson (value_for_key (deploy_as_application_configuration_description_of_yojson) "DeployAsApplicationConfigurationDescription") _list path;
    catalog_configuration_description = option_of_yojson (value_for_key (catalog_configuration_description_of_yojson) "CatalogConfigurationDescription") _list path;
    monitoring_configuration_description = value_for_key (zeppelin_monitoring_configuration_description_of_yojson) "MonitoringConfigurationDescription" _list path;
    
  }
  in _res

let glue_data_catalog_configuration_of_yojson = 
  fun tree path : glue_data_catalog_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : glue_data_catalog_configuration = {
    database_ar_n = value_for_key (database_ar_n_of_yojson) "DatabaseARN" _list path;
    
  }
  in _res

let catalog_configuration_of_yojson = 
  fun tree path : catalog_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : catalog_configuration = {
    glue_data_catalog_configuration = value_for_key (glue_data_catalog_configuration_of_yojson) "GlueDataCatalogConfiguration" _list path;
    
  }
  in _res

let s3_content_base_location_of_yojson = 
  fun tree path : s3_content_base_location ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_content_base_location = {
    base_path = option_of_yojson (value_for_key (base_path_of_yojson) "BasePath") _list path;
    bucket_ar_n = value_for_key (bucket_ar_n_of_yojson) "BucketARN" _list path;
    
  }
  in _res

let deploy_as_application_configuration_of_yojson = 
  fun tree path : deploy_as_application_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : deploy_as_application_configuration = {
    s3_content_location = value_for_key (s3_content_base_location_of_yojson) "S3ContentLocation" _list path;
    
  }
  in _res

let zeppelin_application_configuration_of_yojson = 
  fun tree path : zeppelin_application_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : zeppelin_application_configuration = {
    custom_artifacts_configuration = option_of_yojson (value_for_key (custom_artifacts_configuration_list_of_yojson) "CustomArtifactsConfiguration") _list path;
    deploy_as_application_configuration = option_of_yojson (value_for_key (deploy_as_application_configuration_of_yojson) "DeployAsApplicationConfiguration") _list path;
    catalog_configuration = option_of_yojson (value_for_key (catalog_configuration_of_yojson) "CatalogConfiguration") _list path;
    monitoring_configuration = option_of_yojson (value_for_key (zeppelin_monitoring_configuration_of_yojson) "MonitoringConfiguration") _list path;
    
  }
  in _res

let vpc_id_of_yojson = string_of_yojson

let subnet_id_of_yojson = string_of_yojson

let subnet_ids_of_yojson = 
  fun tree path -> list_of_yojson subnet_id_of_yojson tree path 

let security_group_id_of_yojson = string_of_yojson

let security_group_ids_of_yojson = 
  fun tree path -> list_of_yojson security_group_id_of_yojson tree path 

let vpc_configuration_of_yojson = 
  fun tree path : vpc_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : vpc_configuration = {
    security_group_ids = value_for_key (security_group_ids_of_yojson) "SecurityGroupIds" _list path;
    subnet_ids = value_for_key (subnet_ids_of_yojson) "SubnetIds" _list path;
    
  }
  in _res

let vpc_configurations_of_yojson = 
  fun tree path -> list_of_yojson vpc_configuration_of_yojson tree path 

let id_of_yojson = string_of_yojson

let vpc_configuration_update_of_yojson = 
  fun tree path : vpc_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : vpc_configuration_update = {
    security_group_id_updates = option_of_yojson (value_for_key (security_group_ids_of_yojson) "SecurityGroupIdUpdates") _list path;
    subnet_id_updates = option_of_yojson (value_for_key (subnet_ids_of_yojson) "SubnetIdUpdates") _list path;
    vpc_configuration_id = value_for_key (id_of_yojson) "VpcConfigurationId" _list path;
    
  }
  in _res

let vpc_configuration_updates_of_yojson = 
  fun tree path -> list_of_yojson vpc_configuration_update_of_yojson tree path 

let vpc_configuration_description_of_yojson = 
  fun tree path : vpc_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : vpc_configuration_description = {
    security_group_ids = value_for_key (security_group_ids_of_yojson) "SecurityGroupIds" _list path;
    subnet_ids = value_for_key (subnet_ids_of_yojson) "SubnetIds" _list path;
    vpc_id = value_for_key (vpc_id_of_yojson) "VpcId" _list path;
    vpc_configuration_id = value_for_key (id_of_yojson) "VpcConfigurationId" _list path;
    
  }
  in _res

let vpc_configuration_descriptions_of_yojson = 
  fun tree path -> list_of_yojson vpc_configuration_description_of_yojson tree path 

let url_type_of_yojson = 
  fun (tree: t) path : url_type -> match tree with 
    | `String "ZEPPELIN_UI_URL" -> ZEPPELIN_UI_URL
    | `String "FLINK_DASHBOARD_URL" -> FLINK_DASHBOARD_URL
    | `String value -> raise (deserialize_unknown_enum_value_error path "UrlType" value)
    | _ -> raise (deserialize_wrong_type_error path "UrlType")

let resource_ar_n_of_yojson = string_of_yojson

let application_description_of_yojson = string_of_yojson

let application_name_of_yojson = string_of_yojson

let runtime_environment_of_yojson = 
  fun (tree: t) path : runtime_environment -> match tree with 
    | `String "FLINK-1_18" -> FLINK_1_18
    | `String "ZEPPELIN-FLINK-3_0" -> ZEPPELIN_FLINK_3_0
    | `String "FLINK-1_15" -> FLINK_1_15
    | `String "ZEPPELIN-FLINK-2_0" -> ZEPPELIN_FLINK_2_0
    | `String "FLINK-1_13" -> FLINK_1_13
    | `String "FLINK-1_11" -> FLINK_1_11
    | `String "ZEPPELIN-FLINK-1_0" -> ZEPPELIN_FLINK_1_0
    | `String "FLINK-1_8" -> FLINK_1_8
    | `String "FLINK-1_6" -> FLINK_1_6
    | `String "SQL-1_0" -> SQL_1_0
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuntimeEnvironment" value)
    | _ -> raise (deserialize_wrong_type_error path "RuntimeEnvironment")

let role_ar_n_of_yojson = string_of_yojson

let application_status_of_yojson = 
  fun (tree: t) path : application_status -> match tree with 
    | `String "ROLLED_BACK" -> ROLLED_BACK
    | `String "MAINTENANCE" -> MAINTENANCE
    | `String "ROLLING_BACK" -> ROLLING_BACK
    | `String "FORCE_STOPPING" -> FORCE_STOPPING
    | `String "AUTOSCALING" -> AUTOSCALING
    | `String "UPDATING" -> UPDATING
    | `String "RUNNING" -> RUNNING
    | `String "READY" -> READY
    | `String "STOPPING" -> STOPPING
    | `String "STARTING" -> STARTING
    | `String "DELETING" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApplicationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationStatus")

let application_version_id_of_yojson = long_of_yojson

let timestamp__of_yojson = timestamp_of_yojson

let in_app_stream_name_of_yojson = string_of_yojson

let in_app_stream_names_of_yojson = 
  fun tree path -> list_of_yojson in_app_stream_name_of_yojson tree path 

let input_lambda_processor_description_of_yojson = 
  fun tree path : input_lambda_processor_description ->
  let _list = assoc_of_yojson tree path in
  let _res : input_lambda_processor_description = {
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let input_processing_configuration_description_of_yojson = 
  fun tree path : input_processing_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : input_processing_configuration_description = {
    input_lambda_processor_description = option_of_yojson (value_for_key (input_lambda_processor_description_of_yojson) "InputLambdaProcessorDescription") _list path;
    
  }
  in _res

let kinesis_streams_input_description_of_yojson = 
  fun tree path : kinesis_streams_input_description ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_streams_input_description = {
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let kinesis_firehose_input_description_of_yojson = 
  fun tree path : kinesis_firehose_input_description ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_firehose_input_description = {
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let record_format_type_of_yojson = 
  fun (tree: t) path : record_format_type -> match tree with 
    | `String "CSV" -> CSV
    | `String "JSON" -> JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordFormatType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordFormatType")

let record_row_path_of_yojson = string_of_yojson

let json_mapping_parameters_of_yojson = 
  fun tree path : json_mapping_parameters ->
  let _list = assoc_of_yojson tree path in
  let _res : json_mapping_parameters = {
    record_row_path = value_for_key (record_row_path_of_yojson) "RecordRowPath" _list path;
    
  }
  in _res

let record_row_delimiter_of_yojson = string_of_yojson

let record_column_delimiter_of_yojson = string_of_yojson

let csv_mapping_parameters_of_yojson = 
  fun tree path : csv_mapping_parameters ->
  let _list = assoc_of_yojson tree path in
  let _res : csv_mapping_parameters = {
    record_column_delimiter = value_for_key (record_column_delimiter_of_yojson) "RecordColumnDelimiter" _list path;
    record_row_delimiter = value_for_key (record_row_delimiter_of_yojson) "RecordRowDelimiter" _list path;
    
  }
  in _res

let mapping_parameters_of_yojson = 
  fun tree path : mapping_parameters ->
  let _list = assoc_of_yojson tree path in
  let _res : mapping_parameters = {
    csv_mapping_parameters = option_of_yojson (value_for_key (csv_mapping_parameters_of_yojson) "CSVMappingParameters") _list path;
    json_mapping_parameters = option_of_yojson (value_for_key (json_mapping_parameters_of_yojson) "JSONMappingParameters") _list path;
    
  }
  in _res

let record_format_of_yojson = 
  fun tree path : record_format ->
  let _list = assoc_of_yojson tree path in
  let _res : record_format = {
    mapping_parameters = option_of_yojson (value_for_key (mapping_parameters_of_yojson) "MappingParameters") _list path;
    record_format_type = value_for_key (record_format_type_of_yojson) "RecordFormatType" _list path;
    
  }
  in _res

let record_encoding_of_yojson = string_of_yojson

let record_column_name_of_yojson = string_of_yojson

let record_column_mapping_of_yojson = string_of_yojson

let record_column_sql_type_of_yojson = string_of_yojson

let record_column_of_yojson = 
  fun tree path : record_column ->
  let _list = assoc_of_yojson tree path in
  let _res : record_column = {
    sql_type = value_for_key (record_column_sql_type_of_yojson) "SqlType" _list path;
    mapping = option_of_yojson (value_for_key (record_column_mapping_of_yojson) "Mapping") _list path;
    name = value_for_key (record_column_name_of_yojson) "Name" _list path;
    
  }
  in _res

let record_columns_of_yojson = 
  fun tree path -> list_of_yojson record_column_of_yojson tree path 

let source_schema_of_yojson = 
  fun tree path : source_schema ->
  let _list = assoc_of_yojson tree path in
  let _res : source_schema = {
    record_columns = value_for_key (record_columns_of_yojson) "RecordColumns" _list path;
    record_encoding = option_of_yojson (value_for_key (record_encoding_of_yojson) "RecordEncoding") _list path;
    record_format = value_for_key (record_format_of_yojson) "RecordFormat" _list path;
    
  }
  in _res

let input_parallelism_count_of_yojson = int_of_yojson

let input_parallelism_of_yojson = 
  fun tree path : input_parallelism ->
  let _list = assoc_of_yojson tree path in
  let _res : input_parallelism = {
    count = option_of_yojson (value_for_key (input_parallelism_count_of_yojson) "Count") _list path;
    
  }
  in _res

let input_starting_position_of_yojson = 
  fun (tree: t) path : input_starting_position -> match tree with 
    | `String "LAST_STOPPED_POINT" -> LAST_STOPPED_POINT
    | `String "TRIM_HORIZON" -> TRIM_HORIZON
    | `String "NOW" -> NOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "InputStartingPosition" value)
    | _ -> raise (deserialize_wrong_type_error path "InputStartingPosition")

let input_starting_position_configuration_of_yojson = 
  fun tree path : input_starting_position_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : input_starting_position_configuration = {
    input_starting_position = option_of_yojson (value_for_key (input_starting_position_of_yojson) "InputStartingPosition") _list path;
    
  }
  in _res

let input_description_of_yojson = 
  fun tree path : input_description ->
  let _list = assoc_of_yojson tree path in
  let _res : input_description = {
    input_starting_position_configuration = option_of_yojson (value_for_key (input_starting_position_configuration_of_yojson) "InputStartingPositionConfiguration") _list path;
    input_parallelism = option_of_yojson (value_for_key (input_parallelism_of_yojson) "InputParallelism") _list path;
    input_schema = option_of_yojson (value_for_key (source_schema_of_yojson) "InputSchema") _list path;
    kinesis_firehose_input_description = option_of_yojson (value_for_key (kinesis_firehose_input_description_of_yojson) "KinesisFirehoseInputDescription") _list path;
    kinesis_streams_input_description = option_of_yojson (value_for_key (kinesis_streams_input_description_of_yojson) "KinesisStreamsInputDescription") _list path;
    input_processing_configuration_description = option_of_yojson (value_for_key (input_processing_configuration_description_of_yojson) "InputProcessingConfigurationDescription") _list path;
    in_app_stream_names = option_of_yojson (value_for_key (in_app_stream_names_of_yojson) "InAppStreamNames") _list path;
    name_prefix = option_of_yojson (value_for_key (in_app_stream_name_of_yojson) "NamePrefix") _list path;
    input_id = option_of_yojson (value_for_key (id_of_yojson) "InputId") _list path;
    
  }
  in _res

let input_descriptions_of_yojson = 
  fun tree path -> list_of_yojson input_description_of_yojson tree path 

let kinesis_streams_output_description_of_yojson = 
  fun tree path : kinesis_streams_output_description ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_streams_output_description = {
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let kinesis_firehose_output_description_of_yojson = 
  fun tree path : kinesis_firehose_output_description ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_firehose_output_description = {
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let lambda_output_description_of_yojson = 
  fun tree path : lambda_output_description ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_output_description = {
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let destination_schema_of_yojson = 
  fun tree path : destination_schema ->
  let _list = assoc_of_yojson tree path in
  let _res : destination_schema = {
    record_format_type = value_for_key (record_format_type_of_yojson) "RecordFormatType" _list path;
    
  }
  in _res

let output_description_of_yojson = 
  fun tree path : output_description ->
  let _list = assoc_of_yojson tree path in
  let _res : output_description = {
    destination_schema = option_of_yojson (value_for_key (destination_schema_of_yojson) "DestinationSchema") _list path;
    lambda_output_description = option_of_yojson (value_for_key (lambda_output_description_of_yojson) "LambdaOutputDescription") _list path;
    kinesis_firehose_output_description = option_of_yojson (value_for_key (kinesis_firehose_output_description_of_yojson) "KinesisFirehoseOutputDescription") _list path;
    kinesis_streams_output_description = option_of_yojson (value_for_key (kinesis_streams_output_description_of_yojson) "KinesisStreamsOutputDescription") _list path;
    name = option_of_yojson (value_for_key (in_app_stream_name_of_yojson) "Name") _list path;
    output_id = option_of_yojson (value_for_key (id_of_yojson) "OutputId") _list path;
    
  }
  in _res

let output_descriptions_of_yojson = 
  fun tree path -> list_of_yojson output_description_of_yojson tree path 

let in_app_table_name_of_yojson = string_of_yojson

let s3_reference_data_source_description_of_yojson = 
  fun tree path : s3_reference_data_source_description ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_reference_data_source_description = {
    reference_role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "ReferenceRoleARN") _list path;
    file_key = value_for_key (file_key_of_yojson) "FileKey" _list path;
    bucket_ar_n = value_for_key (bucket_ar_n_of_yojson) "BucketARN" _list path;
    
  }
  in _res

let reference_data_source_description_of_yojson = 
  fun tree path : reference_data_source_description ->
  let _list = assoc_of_yojson tree path in
  let _res : reference_data_source_description = {
    reference_schema = option_of_yojson (value_for_key (source_schema_of_yojson) "ReferenceSchema") _list path;
    s3_reference_data_source_description = value_for_key (s3_reference_data_source_description_of_yojson) "S3ReferenceDataSourceDescription" _list path;
    table_name = value_for_key (in_app_table_name_of_yojson) "TableName" _list path;
    reference_id = value_for_key (id_of_yojson) "ReferenceId" _list path;
    
  }
  in _res

let reference_data_source_descriptions_of_yojson = 
  fun tree path -> list_of_yojson reference_data_source_description_of_yojson tree path 

let sql_application_configuration_description_of_yojson = 
  fun tree path : sql_application_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : sql_application_configuration_description = {
    reference_data_source_descriptions = option_of_yojson (value_for_key (reference_data_source_descriptions_of_yojson) "ReferenceDataSourceDescriptions") _list path;
    output_descriptions = option_of_yojson (value_for_key (output_descriptions_of_yojson) "OutputDescriptions") _list path;
    input_descriptions = option_of_yojson (value_for_key (input_descriptions_of_yojson) "InputDescriptions") _list path;
    
  }
  in _res

let code_content_type_of_yojson = 
  fun (tree: t) path : code_content_type -> match tree with 
    | `String "ZIPFILE" -> ZIPFILE
    | `String "PLAINTEXT" -> PLAINTEXT
    | `String value -> raise (deserialize_unknown_enum_value_error path "CodeContentType" value)
    | _ -> raise (deserialize_wrong_type_error path "CodeContentType")

let text_content_of_yojson = string_of_yojson

let code_m_d5_of_yojson = string_of_yojson

let code_size_of_yojson = long_of_yojson

let s3_application_code_location_description_of_yojson = 
  fun tree path : s3_application_code_location_description ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_application_code_location_description = {
    object_version = option_of_yojson (value_for_key (object_version_of_yojson) "ObjectVersion") _list path;
    file_key = value_for_key (file_key_of_yojson) "FileKey" _list path;
    bucket_ar_n = value_for_key (bucket_ar_n_of_yojson) "BucketARN" _list path;
    
  }
  in _res

let code_content_description_of_yojson = 
  fun tree path : code_content_description ->
  let _list = assoc_of_yojson tree path in
  let _res : code_content_description = {
    s3_application_code_location_description = option_of_yojson (value_for_key (s3_application_code_location_description_of_yojson) "S3ApplicationCodeLocationDescription") _list path;
    code_size = option_of_yojson (value_for_key (code_size_of_yojson) "CodeSize") _list path;
    code_m_d5 = option_of_yojson (value_for_key (code_m_d5_of_yojson) "CodeMD5") _list path;
    text_content = option_of_yojson (value_for_key (text_content_of_yojson) "TextContent") _list path;
    
  }
  in _res

let application_code_configuration_description_of_yojson = 
  fun tree path : application_code_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : application_code_configuration_description = {
    code_content_description = option_of_yojson (value_for_key (code_content_description_of_yojson) "CodeContentDescription") _list path;
    code_content_type = value_for_key (code_content_type_of_yojson) "CodeContentType" _list path;
    
  }
  in _res

let application_restore_type_of_yojson = 
  fun (tree: t) path : application_restore_type -> match tree with 
    | `String "RESTORE_FROM_CUSTOM_SNAPSHOT" -> RESTORE_FROM_CUSTOM_SNAPSHOT
    | `String "RESTORE_FROM_LATEST_SNAPSHOT" -> RESTORE_FROM_LATEST_SNAPSHOT
    | `String "SKIP_RESTORE_FROM_SNAPSHOT" -> SKIP_RESTORE_FROM_SNAPSHOT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApplicationRestoreType" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationRestoreType")

let snapshot_name_of_yojson = string_of_yojson

let application_restore_configuration_of_yojson = 
  fun tree path : application_restore_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : application_restore_configuration = {
    snapshot_name = option_of_yojson (value_for_key (snapshot_name_of_yojson) "SnapshotName") _list path;
    application_restore_type = value_for_key (application_restore_type_of_yojson) "ApplicationRestoreType" _list path;
    
  }
  in _res

let boolean_object_of_yojson = bool_of_yojson

let flink_run_configuration_of_yojson = 
  fun tree path : flink_run_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : flink_run_configuration = {
    allow_non_restored_state = option_of_yojson (value_for_key (boolean_object_of_yojson) "AllowNonRestoredState") _list path;
    
  }
  in _res

let run_configuration_description_of_yojson = 
  fun tree path : run_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : run_configuration_description = {
    flink_run_configuration_description = option_of_yojson (value_for_key (flink_run_configuration_of_yojson) "FlinkRunConfigurationDescription") _list path;
    application_restore_configuration_description = option_of_yojson (value_for_key (application_restore_configuration_of_yojson) "ApplicationRestoreConfigurationDescription") _list path;
    
  }
  in _res

let configuration_type_of_yojson = 
  fun (tree: t) path : configuration_type -> match tree with 
    | `String "CUSTOM" -> CUSTOM
    | `String "DEFAULT" -> DEFAULT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConfigurationType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationType")

let checkpoint_interval_of_yojson = long_of_yojson

let min_pause_between_checkpoints_of_yojson = long_of_yojson

let checkpoint_configuration_description_of_yojson = 
  fun tree path : checkpoint_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : checkpoint_configuration_description = {
    min_pause_between_checkpoints = option_of_yojson (value_for_key (min_pause_between_checkpoints_of_yojson) "MinPauseBetweenCheckpoints") _list path;
    checkpoint_interval = option_of_yojson (value_for_key (checkpoint_interval_of_yojson) "CheckpointInterval") _list path;
    checkpointing_enabled = option_of_yojson (value_for_key (boolean_object_of_yojson) "CheckpointingEnabled") _list path;
    configuration_type = option_of_yojson (value_for_key (configuration_type_of_yojson) "ConfigurationType") _list path;
    
  }
  in _res

let metrics_level_of_yojson = 
  fun (tree: t) path : metrics_level -> match tree with 
    | `String "PARALLELISM" -> PARALLELISM
    | `String "OPERATOR" -> OPERATOR
    | `String "TASK" -> TASK
    | `String "APPLICATION" -> APPLICATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricsLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricsLevel")

let monitoring_configuration_description_of_yojson = 
  fun tree path : monitoring_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : monitoring_configuration_description = {
    log_level = option_of_yojson (value_for_key (log_level_of_yojson) "LogLevel") _list path;
    metrics_level = option_of_yojson (value_for_key (metrics_level_of_yojson) "MetricsLevel") _list path;
    configuration_type = option_of_yojson (value_for_key (configuration_type_of_yojson) "ConfigurationType") _list path;
    
  }
  in _res

let parallelism_of_yojson = int_of_yojson

let parallelism_per_kp_u_of_yojson = int_of_yojson

let parallelism_configuration_description_of_yojson = 
  fun tree path : parallelism_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : parallelism_configuration_description = {
    auto_scaling_enabled = option_of_yojson (value_for_key (boolean_object_of_yojson) "AutoScalingEnabled") _list path;
    current_parallelism = option_of_yojson (value_for_key (parallelism_of_yojson) "CurrentParallelism") _list path;
    parallelism_per_kp_u = option_of_yojson (value_for_key (parallelism_per_kp_u_of_yojson) "ParallelismPerKPU") _list path;
    parallelism = option_of_yojson (value_for_key (parallelism_of_yojson) "Parallelism") _list path;
    configuration_type = option_of_yojson (value_for_key (configuration_type_of_yojson) "ConfigurationType") _list path;
    
  }
  in _res

let job_plan_description_of_yojson = string_of_yojson

let flink_application_configuration_description_of_yojson = 
  fun tree path : flink_application_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : flink_application_configuration_description = {
    job_plan_description = option_of_yojson (value_for_key (job_plan_description_of_yojson) "JobPlanDescription") _list path;
    parallelism_configuration_description = option_of_yojson (value_for_key (parallelism_configuration_description_of_yojson) "ParallelismConfigurationDescription") _list path;
    monitoring_configuration_description = option_of_yojson (value_for_key (monitoring_configuration_description_of_yojson) "MonitoringConfigurationDescription") _list path;
    checkpoint_configuration_description = option_of_yojson (value_for_key (checkpoint_configuration_description_of_yojson) "CheckpointConfigurationDescription") _list path;
    
  }
  in _res

let property_value_of_yojson = string_of_yojson

let property_key_of_yojson = string_of_yojson

let property_map_of_yojson = 
  fun tree path -> map_of_yojson property_value_of_yojson tree path

let property_group_of_yojson = 
  fun tree path : property_group ->
  let _list = assoc_of_yojson tree path in
  let _res : property_group = {
    property_map = value_for_key (property_map_of_yojson) "PropertyMap" _list path;
    property_group_id = value_for_key (id_of_yojson) "PropertyGroupId" _list path;
    
  }
  in _res

let property_groups_of_yojson = 
  fun tree path -> list_of_yojson property_group_of_yojson tree path 

let environment_property_descriptions_of_yojson = 
  fun tree path : environment_property_descriptions ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_property_descriptions = {
    property_group_descriptions = option_of_yojson (value_for_key (property_groups_of_yojson) "PropertyGroupDescriptions") _list path;
    
  }
  in _res

let application_snapshot_configuration_description_of_yojson = 
  fun tree path : application_snapshot_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : application_snapshot_configuration_description = {
    snapshots_enabled = value_for_key (boolean_object_of_yojson) "SnapshotsEnabled" _list path;
    
  }
  in _res

let application_configuration_description_of_yojson = 
  fun tree path : application_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : application_configuration_description = {
    zeppelin_application_configuration_description = option_of_yojson (value_for_key (zeppelin_application_configuration_description_of_yojson) "ZeppelinApplicationConfigurationDescription") _list path;
    vpc_configuration_descriptions = option_of_yojson (value_for_key (vpc_configuration_descriptions_of_yojson) "VpcConfigurationDescriptions") _list path;
    application_snapshot_configuration_description = option_of_yojson (value_for_key (application_snapshot_configuration_description_of_yojson) "ApplicationSnapshotConfigurationDescription") _list path;
    environment_property_descriptions = option_of_yojson (value_for_key (environment_property_descriptions_of_yojson) "EnvironmentPropertyDescriptions") _list path;
    flink_application_configuration_description = option_of_yojson (value_for_key (flink_application_configuration_description_of_yojson) "FlinkApplicationConfigurationDescription") _list path;
    run_configuration_description = option_of_yojson (value_for_key (run_configuration_description_of_yojson) "RunConfigurationDescription") _list path;
    application_code_configuration_description = option_of_yojson (value_for_key (application_code_configuration_description_of_yojson) "ApplicationCodeConfigurationDescription") _list path;
    sql_application_configuration_description = option_of_yojson (value_for_key (sql_application_configuration_description_of_yojson) "SqlApplicationConfigurationDescription") _list path;
    
  }
  in _res

let log_stream_ar_n_of_yojson = string_of_yojson

let cloud_watch_logging_option_description_of_yojson = 
  fun tree path : cloud_watch_logging_option_description ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_watch_logging_option_description = {
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    log_stream_ar_n = value_for_key (log_stream_ar_n_of_yojson) "LogStreamARN" _list path;
    cloud_watch_logging_option_id = option_of_yojson (value_for_key (id_of_yojson) "CloudWatchLoggingOptionId") _list path;
    
  }
  in _res

let cloud_watch_logging_option_descriptions_of_yojson = 
  fun tree path -> list_of_yojson cloud_watch_logging_option_description_of_yojson tree path 

let application_maintenance_window_start_time_of_yojson = string_of_yojson

let application_maintenance_window_end_time_of_yojson = string_of_yojson

let application_maintenance_configuration_description_of_yojson = 
  fun tree path : application_maintenance_configuration_description ->
  let _list = assoc_of_yojson tree path in
  let _res : application_maintenance_configuration_description = {
    application_maintenance_window_end_time = value_for_key (application_maintenance_window_end_time_of_yojson) "ApplicationMaintenanceWindowEndTime" _list path;
    application_maintenance_window_start_time = value_for_key (application_maintenance_window_start_time_of_yojson) "ApplicationMaintenanceWindowStartTime" _list path;
    
  }
  in _res

let conditional_token_of_yojson = string_of_yojson

let application_mode_of_yojson = 
  fun (tree: t) path : application_mode -> match tree with 
    | `String "INTERACTIVE" -> INTERACTIVE
    | `String "STREAMING" -> STREAMING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApplicationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationMode")

let application_detail_of_yojson = 
  fun tree path : application_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : application_detail = {
    application_mode = option_of_yojson (value_for_key (application_mode_of_yojson) "ApplicationMode") _list path;
    application_version_rolled_back_to = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionRolledBackTo") _list path;
    conditional_token = option_of_yojson (value_for_key (conditional_token_of_yojson) "ConditionalToken") _list path;
    application_version_rolled_back_from = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionRolledBackFrom") _list path;
    application_version_updated_from = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionUpdatedFrom") _list path;
    application_maintenance_configuration_description = option_of_yojson (value_for_key (application_maintenance_configuration_description_of_yojson) "ApplicationMaintenanceConfigurationDescription") _list path;
    cloud_watch_logging_option_descriptions = option_of_yojson (value_for_key (cloud_watch_logging_option_descriptions_of_yojson) "CloudWatchLoggingOptionDescriptions") _list path;
    application_configuration_description = option_of_yojson (value_for_key (application_configuration_description_of_yojson) "ApplicationConfigurationDescription") _list path;
    last_update_timestamp = option_of_yojson (value_for_key (timestamp__of_yojson) "LastUpdateTimestamp") _list path;
    create_timestamp = option_of_yojson (value_for_key (timestamp__of_yojson) "CreateTimestamp") _list path;
    application_version_id = value_for_key (application_version_id_of_yojson) "ApplicationVersionId" _list path;
    application_status = value_for_key (application_status_of_yojson) "ApplicationStatus" _list path;
    service_execution_role = option_of_yojson (value_for_key (role_ar_n_of_yojson) "ServiceExecutionRole") _list path;
    runtime_environment = value_for_key (runtime_environment_of_yojson) "RuntimeEnvironment" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    application_description = option_of_yojson (value_for_key (application_description_of_yojson) "ApplicationDescription") _list path;
    application_ar_n = value_for_key (resource_ar_n_of_yojson) "ApplicationARN" _list path;
    
  }
  in _res

let update_application_response_of_yojson = 
  fun tree path : update_application_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_application_response = {
    application_detail = value_for_key (application_detail_of_yojson) "ApplicationDetail" _list path;
    
  }
  in _res

let input_lambda_processor_update_of_yojson = 
  fun tree path : input_lambda_processor_update ->
  let _list = assoc_of_yojson tree path in
  let _res : input_lambda_processor_update = {
    resource_arn_update = value_for_key (resource_ar_n_of_yojson) "ResourceARNUpdate" _list path;
    
  }
  in _res

let input_processing_configuration_update_of_yojson = 
  fun tree path : input_processing_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : input_processing_configuration_update = {
    input_lambda_processor_update = value_for_key (input_lambda_processor_update_of_yojson) "InputLambdaProcessorUpdate" _list path;
    
  }
  in _res

let kinesis_streams_input_update_of_yojson = 
  fun tree path : kinesis_streams_input_update ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_streams_input_update = {
    resource_arn_update = value_for_key (resource_ar_n_of_yojson) "ResourceARNUpdate" _list path;
    
  }
  in _res

let kinesis_firehose_input_update_of_yojson = 
  fun tree path : kinesis_firehose_input_update ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_firehose_input_update = {
    resource_arn_update = value_for_key (resource_ar_n_of_yojson) "ResourceARNUpdate" _list path;
    
  }
  in _res

let input_schema_update_of_yojson = 
  fun tree path : input_schema_update ->
  let _list = assoc_of_yojson tree path in
  let _res : input_schema_update = {
    record_column_updates = option_of_yojson (value_for_key (record_columns_of_yojson) "RecordColumnUpdates") _list path;
    record_encoding_update = option_of_yojson (value_for_key (record_encoding_of_yojson) "RecordEncodingUpdate") _list path;
    record_format_update = option_of_yojson (value_for_key (record_format_of_yojson) "RecordFormatUpdate") _list path;
    
  }
  in _res

let input_parallelism_update_of_yojson = 
  fun tree path : input_parallelism_update ->
  let _list = assoc_of_yojson tree path in
  let _res : input_parallelism_update = {
    count_update = value_for_key (input_parallelism_count_of_yojson) "CountUpdate" _list path;
    
  }
  in _res

let input_update_of_yojson = 
  fun tree path : input_update ->
  let _list = assoc_of_yojson tree path in
  let _res : input_update = {
    input_parallelism_update = option_of_yojson (value_for_key (input_parallelism_update_of_yojson) "InputParallelismUpdate") _list path;
    input_schema_update = option_of_yojson (value_for_key (input_schema_update_of_yojson) "InputSchemaUpdate") _list path;
    kinesis_firehose_input_update = option_of_yojson (value_for_key (kinesis_firehose_input_update_of_yojson) "KinesisFirehoseInputUpdate") _list path;
    kinesis_streams_input_update = option_of_yojson (value_for_key (kinesis_streams_input_update_of_yojson) "KinesisStreamsInputUpdate") _list path;
    input_processing_configuration_update = option_of_yojson (value_for_key (input_processing_configuration_update_of_yojson) "InputProcessingConfigurationUpdate") _list path;
    name_prefix_update = option_of_yojson (value_for_key (in_app_stream_name_of_yojson) "NamePrefixUpdate") _list path;
    input_id = value_for_key (id_of_yojson) "InputId" _list path;
    
  }
  in _res

let input_updates_of_yojson = 
  fun tree path -> list_of_yojson input_update_of_yojson tree path 

let kinesis_streams_output_update_of_yojson = 
  fun tree path : kinesis_streams_output_update ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_streams_output_update = {
    resource_arn_update = value_for_key (resource_ar_n_of_yojson) "ResourceARNUpdate" _list path;
    
  }
  in _res

let kinesis_firehose_output_update_of_yojson = 
  fun tree path : kinesis_firehose_output_update ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_firehose_output_update = {
    resource_arn_update = value_for_key (resource_ar_n_of_yojson) "ResourceARNUpdate" _list path;
    
  }
  in _res

let lambda_output_update_of_yojson = 
  fun tree path : lambda_output_update ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_output_update = {
    resource_arn_update = value_for_key (resource_ar_n_of_yojson) "ResourceARNUpdate" _list path;
    
  }
  in _res

let output_update_of_yojson = 
  fun tree path : output_update ->
  let _list = assoc_of_yojson tree path in
  let _res : output_update = {
    destination_schema_update = option_of_yojson (value_for_key (destination_schema_of_yojson) "DestinationSchemaUpdate") _list path;
    lambda_output_update = option_of_yojson (value_for_key (lambda_output_update_of_yojson) "LambdaOutputUpdate") _list path;
    kinesis_firehose_output_update = option_of_yojson (value_for_key (kinesis_firehose_output_update_of_yojson) "KinesisFirehoseOutputUpdate") _list path;
    kinesis_streams_output_update = option_of_yojson (value_for_key (kinesis_streams_output_update_of_yojson) "KinesisStreamsOutputUpdate") _list path;
    name_update = option_of_yojson (value_for_key (in_app_stream_name_of_yojson) "NameUpdate") _list path;
    output_id = value_for_key (id_of_yojson) "OutputId" _list path;
    
  }
  in _res

let output_updates_of_yojson = 
  fun tree path -> list_of_yojson output_update_of_yojson tree path 

let s3_reference_data_source_update_of_yojson = 
  fun tree path : s3_reference_data_source_update ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_reference_data_source_update = {
    file_key_update = option_of_yojson (value_for_key (file_key_of_yojson) "FileKeyUpdate") _list path;
    bucket_arn_update = option_of_yojson (value_for_key (bucket_ar_n_of_yojson) "BucketARNUpdate") _list path;
    
  }
  in _res

let reference_data_source_update_of_yojson = 
  fun tree path : reference_data_source_update ->
  let _list = assoc_of_yojson tree path in
  let _res : reference_data_source_update = {
    reference_schema_update = option_of_yojson (value_for_key (source_schema_of_yojson) "ReferenceSchemaUpdate") _list path;
    s3_reference_data_source_update = option_of_yojson (value_for_key (s3_reference_data_source_update_of_yojson) "S3ReferenceDataSourceUpdate") _list path;
    table_name_update = option_of_yojson (value_for_key (in_app_table_name_of_yojson) "TableNameUpdate") _list path;
    reference_id = value_for_key (id_of_yojson) "ReferenceId" _list path;
    
  }
  in _res

let reference_data_source_updates_of_yojson = 
  fun tree path -> list_of_yojson reference_data_source_update_of_yojson tree path 

let sql_application_configuration_update_of_yojson = 
  fun tree path : sql_application_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : sql_application_configuration_update = {
    reference_data_source_updates = option_of_yojson (value_for_key (reference_data_source_updates_of_yojson) "ReferenceDataSourceUpdates") _list path;
    output_updates = option_of_yojson (value_for_key (output_updates_of_yojson) "OutputUpdates") _list path;
    input_updates = option_of_yojson (value_for_key (input_updates_of_yojson) "InputUpdates") _list path;
    
  }
  in _res

let s3_content_location_update_of_yojson = 
  fun tree path : s3_content_location_update ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_content_location_update = {
    object_version_update = option_of_yojson (value_for_key (object_version_of_yojson) "ObjectVersionUpdate") _list path;
    file_key_update = option_of_yojson (value_for_key (file_key_of_yojson) "FileKeyUpdate") _list path;
    bucket_arn_update = option_of_yojson (value_for_key (bucket_ar_n_of_yojson) "BucketARNUpdate") _list path;
    
  }
  in _res

let code_content_update_of_yojson = 
  fun tree path : code_content_update ->
  let _list = assoc_of_yojson tree path in
  let _res : code_content_update = {
    s3_content_location_update = option_of_yojson (value_for_key (s3_content_location_update_of_yojson) "S3ContentLocationUpdate") _list path;
    zip_file_content_update = option_of_yojson (value_for_key (zip_file_content_of_yojson) "ZipFileContentUpdate") _list path;
    text_content_update = option_of_yojson (value_for_key (text_content_of_yojson) "TextContentUpdate") _list path;
    
  }
  in _res

let application_code_configuration_update_of_yojson = 
  fun tree path : application_code_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : application_code_configuration_update = {
    code_content_update = option_of_yojson (value_for_key (code_content_update_of_yojson) "CodeContentUpdate") _list path;
    code_content_type_update = option_of_yojson (value_for_key (code_content_type_of_yojson) "CodeContentTypeUpdate") _list path;
    
  }
  in _res

let checkpoint_configuration_update_of_yojson = 
  fun tree path : checkpoint_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : checkpoint_configuration_update = {
    min_pause_between_checkpoints_update = option_of_yojson (value_for_key (min_pause_between_checkpoints_of_yojson) "MinPauseBetweenCheckpointsUpdate") _list path;
    checkpoint_interval_update = option_of_yojson (value_for_key (checkpoint_interval_of_yojson) "CheckpointIntervalUpdate") _list path;
    checkpointing_enabled_update = option_of_yojson (value_for_key (boolean_object_of_yojson) "CheckpointingEnabledUpdate") _list path;
    configuration_type_update = option_of_yojson (value_for_key (configuration_type_of_yojson) "ConfigurationTypeUpdate") _list path;
    
  }
  in _res

let monitoring_configuration_update_of_yojson = 
  fun tree path : monitoring_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : monitoring_configuration_update = {
    log_level_update = option_of_yojson (value_for_key (log_level_of_yojson) "LogLevelUpdate") _list path;
    metrics_level_update = option_of_yojson (value_for_key (metrics_level_of_yojson) "MetricsLevelUpdate") _list path;
    configuration_type_update = option_of_yojson (value_for_key (configuration_type_of_yojson) "ConfigurationTypeUpdate") _list path;
    
  }
  in _res

let parallelism_configuration_update_of_yojson = 
  fun tree path : parallelism_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : parallelism_configuration_update = {
    auto_scaling_enabled_update = option_of_yojson (value_for_key (boolean_object_of_yojson) "AutoScalingEnabledUpdate") _list path;
    parallelism_per_kpu_update = option_of_yojson (value_for_key (parallelism_per_kp_u_of_yojson) "ParallelismPerKPUUpdate") _list path;
    parallelism_update = option_of_yojson (value_for_key (parallelism_of_yojson) "ParallelismUpdate") _list path;
    configuration_type_update = option_of_yojson (value_for_key (configuration_type_of_yojson) "ConfigurationTypeUpdate") _list path;
    
  }
  in _res

let flink_application_configuration_update_of_yojson = 
  fun tree path : flink_application_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : flink_application_configuration_update = {
    parallelism_configuration_update = option_of_yojson (value_for_key (parallelism_configuration_update_of_yojson) "ParallelismConfigurationUpdate") _list path;
    monitoring_configuration_update = option_of_yojson (value_for_key (monitoring_configuration_update_of_yojson) "MonitoringConfigurationUpdate") _list path;
    checkpoint_configuration_update = option_of_yojson (value_for_key (checkpoint_configuration_update_of_yojson) "CheckpointConfigurationUpdate") _list path;
    
  }
  in _res

let environment_property_updates_of_yojson = 
  fun tree path : environment_property_updates ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_property_updates = {
    property_groups = value_for_key (property_groups_of_yojson) "PropertyGroups" _list path;
    
  }
  in _res

let application_snapshot_configuration_update_of_yojson = 
  fun tree path : application_snapshot_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : application_snapshot_configuration_update = {
    snapshots_enabled_update = value_for_key (boolean_object_of_yojson) "SnapshotsEnabledUpdate" _list path;
    
  }
  in _res

let application_configuration_update_of_yojson = 
  fun tree path : application_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : application_configuration_update = {
    zeppelin_application_configuration_update = option_of_yojson (value_for_key (zeppelin_application_configuration_update_of_yojson) "ZeppelinApplicationConfigurationUpdate") _list path;
    vpc_configuration_updates = option_of_yojson (value_for_key (vpc_configuration_updates_of_yojson) "VpcConfigurationUpdates") _list path;
    application_snapshot_configuration_update = option_of_yojson (value_for_key (application_snapshot_configuration_update_of_yojson) "ApplicationSnapshotConfigurationUpdate") _list path;
    environment_property_updates = option_of_yojson (value_for_key (environment_property_updates_of_yojson) "EnvironmentPropertyUpdates") _list path;
    flink_application_configuration_update = option_of_yojson (value_for_key (flink_application_configuration_update_of_yojson) "FlinkApplicationConfigurationUpdate") _list path;
    application_code_configuration_update = option_of_yojson (value_for_key (application_code_configuration_update_of_yojson) "ApplicationCodeConfigurationUpdate") _list path;
    sql_application_configuration_update = option_of_yojson (value_for_key (sql_application_configuration_update_of_yojson) "SqlApplicationConfigurationUpdate") _list path;
    
  }
  in _res

let run_configuration_update_of_yojson = 
  fun tree path : run_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : run_configuration_update = {
    application_restore_configuration = option_of_yojson (value_for_key (application_restore_configuration_of_yojson) "ApplicationRestoreConfiguration") _list path;
    flink_run_configuration = option_of_yojson (value_for_key (flink_run_configuration_of_yojson) "FlinkRunConfiguration") _list path;
    
  }
  in _res

let cloud_watch_logging_option_update_of_yojson = 
  fun tree path : cloud_watch_logging_option_update ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_watch_logging_option_update = {
    log_stream_arn_update = option_of_yojson (value_for_key (log_stream_ar_n_of_yojson) "LogStreamARNUpdate") _list path;
    cloud_watch_logging_option_id = value_for_key (id_of_yojson) "CloudWatchLoggingOptionId" _list path;
    
  }
  in _res

let cloud_watch_logging_option_updates_of_yojson = 
  fun tree path -> list_of_yojson cloud_watch_logging_option_update_of_yojson tree path 

let update_application_request_of_yojson = 
  fun tree path : update_application_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_application_request = {
    runtime_environment_update = option_of_yojson (value_for_key (runtime_environment_of_yojson) "RuntimeEnvironmentUpdate") _list path;
    conditional_token = option_of_yojson (value_for_key (conditional_token_of_yojson) "ConditionalToken") _list path;
    cloud_watch_logging_option_updates = option_of_yojson (value_for_key (cloud_watch_logging_option_updates_of_yojson) "CloudWatchLoggingOptionUpdates") _list path;
    run_configuration_update = option_of_yojson (value_for_key (run_configuration_update_of_yojson) "RunConfigurationUpdate") _list path;
    service_execution_role_update = option_of_yojson (value_for_key (role_ar_n_of_yojson) "ServiceExecutionRoleUpdate") _list path;
    application_configuration_update = option_of_yojson (value_for_key (application_configuration_update_of_yojson) "ApplicationConfigurationUpdate") _list path;
    current_application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let update_application_maintenance_configuration_response_of_yojson = 
  fun tree path : update_application_maintenance_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_application_maintenance_configuration_response = {
    application_maintenance_configuration_description = option_of_yojson (value_for_key (application_maintenance_configuration_description_of_yojson) "ApplicationMaintenanceConfigurationDescription") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let application_maintenance_configuration_update_of_yojson = 
  fun tree path : application_maintenance_configuration_update ->
  let _list = assoc_of_yojson tree path in
  let _res : application_maintenance_configuration_update = {
    application_maintenance_window_start_time_update = value_for_key (application_maintenance_window_start_time_of_yojson) "ApplicationMaintenanceWindowStartTimeUpdate" _list path;
    
  }
  in _res

let update_application_maintenance_configuration_request_of_yojson = 
  fun tree path : update_application_maintenance_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_application_maintenance_configuration_request = {
    application_maintenance_configuration_update = value_for_key (application_maintenance_configuration_update_of_yojson) "ApplicationMaintenanceConfigurationUpdate" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let error_message_of_yojson = string_of_yojson

let unsupported_operation_exception_of_yojson = 
  fun tree path : unsupported_operation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_operation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let resource_in_use_exception_of_yojson = 
  fun tree path : resource_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_in_use_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_argument_exception_of_yojson = 
  fun tree path : invalid_argument_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_argument_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let concurrent_modification_exception_of_yojson = 
  fun tree path : concurrent_modification_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : concurrent_modification_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let limit_exceeded_exception_of_yojson = 
  fun tree path : limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_request_exception_of_yojson = 
  fun tree path : invalid_request_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_request_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_application_configuration_exception_of_yojson = 
  fun tree path : invalid_application_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_application_configuration_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let code_validation_exception_of_yojson = 
  fun tree path : code_validation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : code_validation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let untag_resource_response_of_yojson = 
  fun tree path : untag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_response = ()
  in _res

let kinesis_analytics_ar_n_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_keys_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_keys_of_yojson) "TagKeys" _list path;
    resource_ar_n = value_for_key (kinesis_analytics_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let too_many_tags_exception_of_yojson = 
  fun tree path : too_many_tags_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : too_many_tags_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let raw_input_record_of_yojson = string_of_yojson

let raw_input_records_of_yojson = 
  fun tree path -> list_of_yojson raw_input_record_of_yojson tree path 

let processed_input_record_of_yojson = string_of_yojson

let processed_input_records_of_yojson = 
  fun tree path -> list_of_yojson processed_input_record_of_yojson tree path 

let unable_to_detect_schema_exception_of_yojson = 
  fun tree path : unable_to_detect_schema_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unable_to_detect_schema_exception = {
    processed_input_records = option_of_yojson (value_for_key (processed_input_records_of_yojson) "ProcessedInputRecords") _list path;
    raw_input_records = option_of_yojson (value_for_key (raw_input_records_of_yojson) "RawInputRecords") _list path;
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = option_of_yojson (value_for_key (tag_value_of_yojson) "Value") _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tags_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_resource_response_of_yojson = 
  fun tree path : tag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_response = ()
  in _res

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tags_of_yojson) "Tags" _list path;
    resource_ar_n = value_for_key (kinesis_analytics_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let stop_application_response_of_yojson = 
  fun tree path : stop_application_response ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_application_response = ()
  in _res

let stop_application_request_of_yojson = 
  fun tree path : stop_application_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_application_request = {
    force = option_of_yojson (value_for_key (boolean_object_of_yojson) "Force") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let start_application_response_of_yojson = 
  fun tree path : start_application_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_application_response = ()
  in _res

let sql_run_configuration_of_yojson = 
  fun tree path : sql_run_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : sql_run_configuration = {
    input_starting_position_configuration = value_for_key (input_starting_position_configuration_of_yojson) "InputStartingPositionConfiguration" _list path;
    input_id = value_for_key (id_of_yojson) "InputId" _list path;
    
  }
  in _res

let sql_run_configurations_of_yojson = 
  fun tree path -> list_of_yojson sql_run_configuration_of_yojson tree path 

let run_configuration_of_yojson = 
  fun tree path : run_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : run_configuration = {
    application_restore_configuration = option_of_yojson (value_for_key (application_restore_configuration_of_yojson) "ApplicationRestoreConfiguration") _list path;
    sql_run_configurations = option_of_yojson (value_for_key (sql_run_configurations_of_yojson) "SqlRunConfigurations") _list path;
    flink_run_configuration = option_of_yojson (value_for_key (flink_run_configuration_of_yojson) "FlinkRunConfiguration") _list path;
    
  }
  in _res

let start_application_request_of_yojson = 
  fun tree path : start_application_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_application_request = {
    run_configuration = option_of_yojson (value_for_key (run_configuration_of_yojson) "RunConfiguration") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let input_lambda_processor_of_yojson = 
  fun tree path : input_lambda_processor ->
  let _list = assoc_of_yojson tree path in
  let _res : input_lambda_processor = {
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let input_processing_configuration_of_yojson = 
  fun tree path : input_processing_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : input_processing_configuration = {
    input_lambda_processor = value_for_key (input_lambda_processor_of_yojson) "InputLambdaProcessor" _list path;
    
  }
  in _res

let kinesis_streams_input_of_yojson = 
  fun tree path : kinesis_streams_input ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_streams_input = {
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let kinesis_firehose_input_of_yojson = 
  fun tree path : kinesis_firehose_input ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_firehose_input = {
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let input_of_yojson = 
  fun tree path : input ->
  let _list = assoc_of_yojson tree path in
  let _res : input = {
    input_schema = value_for_key (source_schema_of_yojson) "InputSchema" _list path;
    input_parallelism = option_of_yojson (value_for_key (input_parallelism_of_yojson) "InputParallelism") _list path;
    kinesis_firehose_input = option_of_yojson (value_for_key (kinesis_firehose_input_of_yojson) "KinesisFirehoseInput") _list path;
    kinesis_streams_input = option_of_yojson (value_for_key (kinesis_streams_input_of_yojson) "KinesisStreamsInput") _list path;
    input_processing_configuration = option_of_yojson (value_for_key (input_processing_configuration_of_yojson) "InputProcessingConfiguration") _list path;
    name_prefix = value_for_key (in_app_stream_name_of_yojson) "NamePrefix" _list path;
    
  }
  in _res

let inputs_of_yojson = 
  fun tree path -> list_of_yojson input_of_yojson tree path 

let kinesis_streams_output_of_yojson = 
  fun tree path : kinesis_streams_output ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_streams_output = {
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let kinesis_firehose_output_of_yojson = 
  fun tree path : kinesis_firehose_output ->
  let _list = assoc_of_yojson tree path in
  let _res : kinesis_firehose_output = {
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let lambda_output_of_yojson = 
  fun tree path : lambda_output ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_output = {
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let output_of_yojson = 
  fun tree path : output ->
  let _list = assoc_of_yojson tree path in
  let _res : output = {
    destination_schema = value_for_key (destination_schema_of_yojson) "DestinationSchema" _list path;
    lambda_output = option_of_yojson (value_for_key (lambda_output_of_yojson) "LambdaOutput") _list path;
    kinesis_firehose_output = option_of_yojson (value_for_key (kinesis_firehose_output_of_yojson) "KinesisFirehoseOutput") _list path;
    kinesis_streams_output = option_of_yojson (value_for_key (kinesis_streams_output_of_yojson) "KinesisStreamsOutput") _list path;
    name = value_for_key (in_app_stream_name_of_yojson) "Name" _list path;
    
  }
  in _res

let outputs_of_yojson = 
  fun tree path -> list_of_yojson output_of_yojson tree path 

let s3_reference_data_source_of_yojson = 
  fun tree path : s3_reference_data_source ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_reference_data_source = {
    file_key = option_of_yojson (value_for_key (file_key_of_yojson) "FileKey") _list path;
    bucket_ar_n = option_of_yojson (value_for_key (bucket_ar_n_of_yojson) "BucketARN") _list path;
    
  }
  in _res

let reference_data_source_of_yojson = 
  fun tree path : reference_data_source ->
  let _list = assoc_of_yojson tree path in
  let _res : reference_data_source = {
    reference_schema = value_for_key (source_schema_of_yojson) "ReferenceSchema" _list path;
    s3_reference_data_source = option_of_yojson (value_for_key (s3_reference_data_source_of_yojson) "S3ReferenceDataSource") _list path;
    table_name = value_for_key (in_app_table_name_of_yojson) "TableName" _list path;
    
  }
  in _res

let reference_data_sources_of_yojson = 
  fun tree path -> list_of_yojson reference_data_source_of_yojson tree path 

let sql_application_configuration_of_yojson = 
  fun tree path : sql_application_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : sql_application_configuration = {
    reference_data_sources = option_of_yojson (value_for_key (reference_data_sources_of_yojson) "ReferenceDataSources") _list path;
    outputs = option_of_yojson (value_for_key (outputs_of_yojson) "Outputs") _list path;
    inputs = option_of_yojson (value_for_key (inputs_of_yojson) "Inputs") _list path;
    
  }
  in _res

let snapshot_status_of_yojson = 
  fun (tree: t) path : snapshot_status -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "DELETING" -> DELETING
    | `String "READY" -> READY
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotStatus")

let snapshot_details_of_yojson = 
  fun tree path : snapshot_details ->
  let _list = assoc_of_yojson tree path in
  let _res : snapshot_details = {
    runtime_environment = option_of_yojson (value_for_key (runtime_environment_of_yojson) "RuntimeEnvironment") _list path;
    snapshot_creation_timestamp = option_of_yojson (value_for_key (timestamp__of_yojson) "SnapshotCreationTimestamp") _list path;
    application_version_id = value_for_key (application_version_id_of_yojson) "ApplicationVersionId" _list path;
    snapshot_status = value_for_key (snapshot_status_of_yojson) "SnapshotStatus" _list path;
    snapshot_name = value_for_key (snapshot_name_of_yojson) "SnapshotName" _list path;
    
  }
  in _res

let snapshot_summaries_of_yojson = 
  fun tree path -> list_of_yojson snapshot_details_of_yojson tree path 

let session_expiration_duration_in_seconds_of_yojson = long_of_yojson

let service_unavailable_exception_of_yojson = 
  fun tree path : service_unavailable_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : service_unavailable_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let s3_configuration_of_yojson = 
  fun tree path : s3_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_configuration = {
    file_key = value_for_key (file_key_of_yojson) "FileKey" _list path;
    bucket_ar_n = value_for_key (bucket_ar_n_of_yojson) "BucketARN" _list path;
    
  }
  in _res

let rollback_application_response_of_yojson = 
  fun tree path : rollback_application_response ->
  let _list = assoc_of_yojson tree path in
  let _res : rollback_application_response = {
    application_detail = value_for_key (application_detail_of_yojson) "ApplicationDetail" _list path;
    
  }
  in _res

let rollback_application_request_of_yojson = 
  fun tree path : rollback_application_request ->
  let _list = assoc_of_yojson tree path in
  let _res : rollback_application_request = {
    current_application_version_id = value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let resource_provisioned_throughput_exceeded_exception_of_yojson = 
  fun tree path : resource_provisioned_throughput_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_provisioned_throughput_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let parsed_input_record_field_of_yojson = string_of_yojson

let parsed_input_record_of_yojson = 
  fun tree path -> list_of_yojson parsed_input_record_field_of_yojson tree path 

let parsed_input_records_of_yojson = 
  fun tree path -> list_of_yojson parsed_input_record_of_yojson tree path 

let parallelism_configuration_of_yojson = 
  fun tree path : parallelism_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : parallelism_configuration = {
    auto_scaling_enabled = option_of_yojson (value_for_key (boolean_object_of_yojson) "AutoScalingEnabled") _list path;
    parallelism_per_kp_u = option_of_yojson (value_for_key (parallelism_per_kp_u_of_yojson) "ParallelismPerKPU") _list path;
    parallelism = option_of_yojson (value_for_key (parallelism_of_yojson) "Parallelism") _list path;
    configuration_type = value_for_key (configuration_type_of_yojson) "ConfigurationType" _list path;
    
  }
  in _res

let next_token_of_yojson = string_of_yojson

let monitoring_configuration_of_yojson = 
  fun tree path : monitoring_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : monitoring_configuration = {
    log_level = option_of_yojson (value_for_key (log_level_of_yojson) "LogLevel") _list path;
    metrics_level = option_of_yojson (value_for_key (metrics_level_of_yojson) "MetricsLevel") _list path;
    configuration_type = value_for_key (configuration_type_of_yojson) "ConfigurationType" _list path;
    
  }
  in _res

let list_tags_for_resource_response_of_yojson = 
  fun tree path : list_tags_for_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_response = {
    tags = option_of_yojson (value_for_key (tags_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    resource_ar_n = value_for_key (kinesis_analytics_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let list_snapshots_input_limit_of_yojson = int_of_yojson

let application_summary_of_yojson = 
  fun tree path : application_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : application_summary = {
    application_mode = option_of_yojson (value_for_key (application_mode_of_yojson) "ApplicationMode") _list path;
    runtime_environment = value_for_key (runtime_environment_of_yojson) "RuntimeEnvironment" _list path;
    application_version_id = value_for_key (application_version_id_of_yojson) "ApplicationVersionId" _list path;
    application_status = value_for_key (application_status_of_yojson) "ApplicationStatus" _list path;
    application_ar_n = value_for_key (resource_ar_n_of_yojson) "ApplicationARN" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let application_summaries_of_yojson = 
  fun tree path -> list_of_yojson application_summary_of_yojson tree path 

let list_applications_response_of_yojson = 
  fun tree path : list_applications_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_applications_response = {
    next_token = option_of_yojson (value_for_key (application_name_of_yojson) "NextToken") _list path;
    application_summaries = value_for_key (application_summaries_of_yojson) "ApplicationSummaries" _list path;
    
  }
  in _res

let list_applications_input_limit_of_yojson = int_of_yojson

let list_applications_request_of_yojson = 
  fun tree path : list_applications_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_applications_request = {
    next_token = option_of_yojson (value_for_key (application_name_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (list_applications_input_limit_of_yojson) "Limit") _list path;
    
  }
  in _res

let application_version_summary_of_yojson = 
  fun tree path : application_version_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : application_version_summary = {
    application_status = value_for_key (application_status_of_yojson) "ApplicationStatus" _list path;
    application_version_id = value_for_key (application_version_id_of_yojson) "ApplicationVersionId" _list path;
    
  }
  in _res

let application_version_summaries_of_yojson = 
  fun tree path -> list_of_yojson application_version_summary_of_yojson tree path 

let list_application_versions_response_of_yojson = 
  fun tree path : list_application_versions_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_application_versions_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    application_version_summaries = option_of_yojson (value_for_key (application_version_summaries_of_yojson) "ApplicationVersionSummaries") _list path;
    
  }
  in _res

let list_application_versions_input_limit_of_yojson = int_of_yojson

let list_application_versions_request_of_yojson = 
  fun tree path : list_application_versions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_application_versions_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (list_application_versions_input_limit_of_yojson) "Limit") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let list_application_snapshots_response_of_yojson = 
  fun tree path : list_application_snapshots_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_application_snapshots_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    snapshot_summaries = option_of_yojson (value_for_key (snapshot_summaries_of_yojson) "SnapshotSummaries") _list path;
    
  }
  in _res

let list_application_snapshots_request_of_yojson = 
  fun tree path : list_application_snapshots_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_application_snapshots_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (list_snapshots_input_limit_of_yojson) "Limit") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let discover_input_schema_response_of_yojson = 
  fun tree path : discover_input_schema_response ->
  let _list = assoc_of_yojson tree path in
  let _res : discover_input_schema_response = {
    raw_input_records = option_of_yojson (value_for_key (raw_input_records_of_yojson) "RawInputRecords") _list path;
    processed_input_records = option_of_yojson (value_for_key (processed_input_records_of_yojson) "ProcessedInputRecords") _list path;
    parsed_input_records = option_of_yojson (value_for_key (parsed_input_records_of_yojson) "ParsedInputRecords") _list path;
    input_schema = option_of_yojson (value_for_key (source_schema_of_yojson) "InputSchema") _list path;
    
  }
  in _res

let discover_input_schema_request_of_yojson = 
  fun tree path : discover_input_schema_request ->
  let _list = assoc_of_yojson tree path in
  let _res : discover_input_schema_request = {
    input_processing_configuration = option_of_yojson (value_for_key (input_processing_configuration_of_yojson) "InputProcessingConfiguration") _list path;
    s3_configuration = option_of_yojson (value_for_key (s3_configuration_of_yojson) "S3Configuration") _list path;
    input_starting_position_configuration = option_of_yojson (value_for_key (input_starting_position_configuration_of_yojson) "InputStartingPositionConfiguration") _list path;
    service_execution_role = value_for_key (role_ar_n_of_yojson) "ServiceExecutionRole" _list path;
    resource_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ResourceARN") _list path;
    
  }
  in _res

let describe_application_version_response_of_yojson = 
  fun tree path : describe_application_version_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_application_version_response = {
    application_version_detail = option_of_yojson (value_for_key (application_detail_of_yojson) "ApplicationVersionDetail") _list path;
    
  }
  in _res

let describe_application_version_request_of_yojson = 
  fun tree path : describe_application_version_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_application_version_request = {
    application_version_id = value_for_key (application_version_id_of_yojson) "ApplicationVersionId" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let describe_application_snapshot_response_of_yojson = 
  fun tree path : describe_application_snapshot_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_application_snapshot_response = {
    snapshot_details = value_for_key (snapshot_details_of_yojson) "SnapshotDetails" _list path;
    
  }
  in _res

let describe_application_snapshot_request_of_yojson = 
  fun tree path : describe_application_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_application_snapshot_request = {
    snapshot_name = value_for_key (snapshot_name_of_yojson) "SnapshotName" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let describe_application_response_of_yojson = 
  fun tree path : describe_application_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_application_response = {
    application_detail = value_for_key (application_detail_of_yojson) "ApplicationDetail" _list path;
    
  }
  in _res

let describe_application_request_of_yojson = 
  fun tree path : describe_application_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_application_request = {
    include_additional_details = option_of_yojson (value_for_key (boolean_object_of_yojson) "IncludeAdditionalDetails") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let delete_application_vpc_configuration_response_of_yojson = 
  fun tree path : delete_application_vpc_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_vpc_configuration_response = {
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let delete_application_vpc_configuration_request_of_yojson = 
  fun tree path : delete_application_vpc_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_vpc_configuration_request = {
    conditional_token = option_of_yojson (value_for_key (conditional_token_of_yojson) "ConditionalToken") _list path;
    vpc_configuration_id = value_for_key (id_of_yojson) "VpcConfigurationId" _list path;
    current_application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let delete_application_snapshot_response_of_yojson = 
  fun tree path : delete_application_snapshot_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_snapshot_response = ()
  in _res

let delete_application_snapshot_request_of_yojson = 
  fun tree path : delete_application_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_snapshot_request = {
    snapshot_creation_timestamp = value_for_key (timestamp__of_yojson) "SnapshotCreationTimestamp" _list path;
    snapshot_name = value_for_key (snapshot_name_of_yojson) "SnapshotName" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let delete_application_reference_data_source_response_of_yojson = 
  fun tree path : delete_application_reference_data_source_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_reference_data_source_response = {
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let delete_application_reference_data_source_request_of_yojson = 
  fun tree path : delete_application_reference_data_source_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_reference_data_source_request = {
    reference_id = value_for_key (id_of_yojson) "ReferenceId" _list path;
    current_application_version_id = value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let delete_application_output_response_of_yojson = 
  fun tree path : delete_application_output_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_output_response = {
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let delete_application_output_request_of_yojson = 
  fun tree path : delete_application_output_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_output_request = {
    output_id = value_for_key (id_of_yojson) "OutputId" _list path;
    current_application_version_id = value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let delete_application_input_processing_configuration_response_of_yojson = 
  fun tree path : delete_application_input_processing_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_input_processing_configuration_response = {
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let delete_application_input_processing_configuration_request_of_yojson = 
  fun tree path : delete_application_input_processing_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_input_processing_configuration_request = {
    input_id = value_for_key (id_of_yojson) "InputId" _list path;
    current_application_version_id = value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let delete_application_cloud_watch_logging_option_response_of_yojson = 
  fun tree path : delete_application_cloud_watch_logging_option_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_cloud_watch_logging_option_response = {
    cloud_watch_logging_option_descriptions = option_of_yojson (value_for_key (cloud_watch_logging_option_descriptions_of_yojson) "CloudWatchLoggingOptionDescriptions") _list path;
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let delete_application_cloud_watch_logging_option_request_of_yojson = 
  fun tree path : delete_application_cloud_watch_logging_option_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_cloud_watch_logging_option_request = {
    conditional_token = option_of_yojson (value_for_key (conditional_token_of_yojson) "ConditionalToken") _list path;
    cloud_watch_logging_option_id = value_for_key (id_of_yojson) "CloudWatchLoggingOptionId" _list path;
    current_application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let delete_application_response_of_yojson = 
  fun tree path : delete_application_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_response = ()
  in _res

let delete_application_request_of_yojson = 
  fun tree path : delete_application_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_application_request = {
    create_timestamp = value_for_key (timestamp__of_yojson) "CreateTimestamp" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let create_application_snapshot_response_of_yojson = 
  fun tree path : create_application_snapshot_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_application_snapshot_response = ()
  in _res

let create_application_snapshot_request_of_yojson = 
  fun tree path : create_application_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_application_snapshot_request = {
    snapshot_name = value_for_key (snapshot_name_of_yojson) "SnapshotName" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let authorized_url_of_yojson = string_of_yojson

let create_application_presigned_url_response_of_yojson = 
  fun tree path : create_application_presigned_url_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_application_presigned_url_response = {
    authorized_url = option_of_yojson (value_for_key (authorized_url_of_yojson) "AuthorizedUrl") _list path;
    
  }
  in _res

let create_application_presigned_url_request_of_yojson = 
  fun tree path : create_application_presigned_url_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_application_presigned_url_request = {
    session_expiration_duration_in_seconds = option_of_yojson (value_for_key (session_expiration_duration_in_seconds_of_yojson) "SessionExpirationDurationInSeconds") _list path;
    url_type = value_for_key (url_type_of_yojson) "UrlType" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let create_application_response_of_yojson = 
  fun tree path : create_application_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_application_response = {
    application_detail = value_for_key (application_detail_of_yojson) "ApplicationDetail" _list path;
    
  }
  in _res

let checkpoint_configuration_of_yojson = 
  fun tree path : checkpoint_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : checkpoint_configuration = {
    min_pause_between_checkpoints = option_of_yojson (value_for_key (min_pause_between_checkpoints_of_yojson) "MinPauseBetweenCheckpoints") _list path;
    checkpoint_interval = option_of_yojson (value_for_key (checkpoint_interval_of_yojson) "CheckpointInterval") _list path;
    checkpointing_enabled = option_of_yojson (value_for_key (boolean_object_of_yojson) "CheckpointingEnabled") _list path;
    configuration_type = value_for_key (configuration_type_of_yojson) "ConfigurationType" _list path;
    
  }
  in _res

let flink_application_configuration_of_yojson = 
  fun tree path : flink_application_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : flink_application_configuration = {
    parallelism_configuration = option_of_yojson (value_for_key (parallelism_configuration_of_yojson) "ParallelismConfiguration") _list path;
    monitoring_configuration = option_of_yojson (value_for_key (monitoring_configuration_of_yojson) "MonitoringConfiguration") _list path;
    checkpoint_configuration = option_of_yojson (value_for_key (checkpoint_configuration_of_yojson) "CheckpointConfiguration") _list path;
    
  }
  in _res

let environment_properties_of_yojson = 
  fun tree path : environment_properties ->
  let _list = assoc_of_yojson tree path in
  let _res : environment_properties = {
    property_groups = value_for_key (property_groups_of_yojson) "PropertyGroups" _list path;
    
  }
  in _res

let code_content_of_yojson = 
  fun tree path : code_content ->
  let _list = assoc_of_yojson tree path in
  let _res : code_content = {
    s3_content_location = option_of_yojson (value_for_key (s3_content_location_of_yojson) "S3ContentLocation") _list path;
    zip_file_content = option_of_yojson (value_for_key (zip_file_content_of_yojson) "ZipFileContent") _list path;
    text_content = option_of_yojson (value_for_key (text_content_of_yojson) "TextContent") _list path;
    
  }
  in _res

let application_code_configuration_of_yojson = 
  fun tree path : application_code_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : application_code_configuration = {
    code_content_type = value_for_key (code_content_type_of_yojson) "CodeContentType" _list path;
    code_content = option_of_yojson (value_for_key (code_content_of_yojson) "CodeContent") _list path;
    
  }
  in _res

let application_snapshot_configuration_of_yojson = 
  fun tree path : application_snapshot_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : application_snapshot_configuration = {
    snapshots_enabled = value_for_key (boolean_object_of_yojson) "SnapshotsEnabled" _list path;
    
  }
  in _res

let application_configuration_of_yojson = 
  fun tree path : application_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : application_configuration = {
    zeppelin_application_configuration = option_of_yojson (value_for_key (zeppelin_application_configuration_of_yojson) "ZeppelinApplicationConfiguration") _list path;
    vpc_configurations = option_of_yojson (value_for_key (vpc_configurations_of_yojson) "VpcConfigurations") _list path;
    application_snapshot_configuration = option_of_yojson (value_for_key (application_snapshot_configuration_of_yojson) "ApplicationSnapshotConfiguration") _list path;
    application_code_configuration = option_of_yojson (value_for_key (application_code_configuration_of_yojson) "ApplicationCodeConfiguration") _list path;
    environment_properties = option_of_yojson (value_for_key (environment_properties_of_yojson) "EnvironmentProperties") _list path;
    flink_application_configuration = option_of_yojson (value_for_key (flink_application_configuration_of_yojson) "FlinkApplicationConfiguration") _list path;
    sql_application_configuration = option_of_yojson (value_for_key (sql_application_configuration_of_yojson) "SqlApplicationConfiguration") _list path;
    
  }
  in _res

let cloud_watch_logging_option_of_yojson = 
  fun tree path : cloud_watch_logging_option ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_watch_logging_option = {
    log_stream_ar_n = value_for_key (log_stream_ar_n_of_yojson) "LogStreamARN" _list path;
    
  }
  in _res

let cloud_watch_logging_options_of_yojson = 
  fun tree path -> list_of_yojson cloud_watch_logging_option_of_yojson tree path 

let create_application_request_of_yojson = 
  fun tree path : create_application_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_application_request = {
    application_mode = option_of_yojson (value_for_key (application_mode_of_yojson) "ApplicationMode") _list path;
    tags = option_of_yojson (value_for_key (tags_of_yojson) "Tags") _list path;
    cloud_watch_logging_options = option_of_yojson (value_for_key (cloud_watch_logging_options_of_yojson) "CloudWatchLoggingOptions") _list path;
    application_configuration = option_of_yojson (value_for_key (application_configuration_of_yojson) "ApplicationConfiguration") _list path;
    service_execution_role = value_for_key (role_ar_n_of_yojson) "ServiceExecutionRole" _list path;
    runtime_environment = value_for_key (runtime_environment_of_yojson) "RuntimeEnvironment" _list path;
    application_description = option_of_yojson (value_for_key (application_description_of_yojson) "ApplicationDescription") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let add_application_vpc_configuration_response_of_yojson = 
  fun tree path : add_application_vpc_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_vpc_configuration_response = {
    vpc_configuration_description = option_of_yojson (value_for_key (vpc_configuration_description_of_yojson) "VpcConfigurationDescription") _list path;
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let add_application_vpc_configuration_request_of_yojson = 
  fun tree path : add_application_vpc_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_vpc_configuration_request = {
    conditional_token = option_of_yojson (value_for_key (conditional_token_of_yojson) "ConditionalToken") _list path;
    vpc_configuration = value_for_key (vpc_configuration_of_yojson) "VpcConfiguration" _list path;
    current_application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let add_application_reference_data_source_response_of_yojson = 
  fun tree path : add_application_reference_data_source_response ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_reference_data_source_response = {
    reference_data_source_descriptions = option_of_yojson (value_for_key (reference_data_source_descriptions_of_yojson) "ReferenceDataSourceDescriptions") _list path;
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let add_application_reference_data_source_request_of_yojson = 
  fun tree path : add_application_reference_data_source_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_reference_data_source_request = {
    reference_data_source = value_for_key (reference_data_source_of_yojson) "ReferenceDataSource" _list path;
    current_application_version_id = value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let add_application_output_response_of_yojson = 
  fun tree path : add_application_output_response ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_output_response = {
    output_descriptions = option_of_yojson (value_for_key (output_descriptions_of_yojson) "OutputDescriptions") _list path;
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let add_application_output_request_of_yojson = 
  fun tree path : add_application_output_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_output_request = {
    output = value_for_key (output_of_yojson) "Output" _list path;
    current_application_version_id = value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let add_application_input_processing_configuration_response_of_yojson = 
  fun tree path : add_application_input_processing_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_input_processing_configuration_response = {
    input_processing_configuration_description = option_of_yojson (value_for_key (input_processing_configuration_description_of_yojson) "InputProcessingConfigurationDescription") _list path;
    input_id = option_of_yojson (value_for_key (id_of_yojson) "InputId") _list path;
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let add_application_input_processing_configuration_request_of_yojson = 
  fun tree path : add_application_input_processing_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_input_processing_configuration_request = {
    input_processing_configuration = value_for_key (input_processing_configuration_of_yojson) "InputProcessingConfiguration" _list path;
    input_id = value_for_key (id_of_yojson) "InputId" _list path;
    current_application_version_id = value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let add_application_input_response_of_yojson = 
  fun tree path : add_application_input_response ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_input_response = {
    input_descriptions = option_of_yojson (value_for_key (input_descriptions_of_yojson) "InputDescriptions") _list path;
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let add_application_input_request_of_yojson = 
  fun tree path : add_application_input_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_input_request = {
    input = value_for_key (input_of_yojson) "Input" _list path;
    current_application_version_id = value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId" _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let add_application_cloud_watch_logging_option_response_of_yojson = 
  fun tree path : add_application_cloud_watch_logging_option_response ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_cloud_watch_logging_option_response = {
    cloud_watch_logging_option_descriptions = option_of_yojson (value_for_key (cloud_watch_logging_option_descriptions_of_yojson) "CloudWatchLoggingOptionDescriptions") _list path;
    application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "ApplicationVersionId") _list path;
    application_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "ApplicationARN") _list path;
    
  }
  in _res

let add_application_cloud_watch_logging_option_request_of_yojson = 
  fun tree path : add_application_cloud_watch_logging_option_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_application_cloud_watch_logging_option_request = {
    conditional_token = option_of_yojson (value_for_key (conditional_token_of_yojson) "ConditionalToken") _list path;
    cloud_watch_logging_option = value_for_key (cloud_watch_logging_option_of_yojson) "CloudWatchLoggingOption" _list path;
    current_application_version_id = option_of_yojson (value_for_key (application_version_id_of_yojson) "CurrentApplicationVersionId") _list path;
    application_name = value_for_key (application_name_of_yojson) "ApplicationName" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

