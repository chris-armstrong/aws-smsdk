open Smaws_Lib.Json.SerializeHelpers

open Types

let update_application_response_to_yojson = 
  fun (x: update_application_response) -> assoc_to_yojson(
    [
  ])

let application_name_to_yojson = string_to_yojson

let application_version_id_to_yojson = long_to_yojson

let id_to_yojson = string_to_yojson

let in_app_stream_name_to_yojson = string_to_yojson

let resource_ar_n_to_yojson = string_to_yojson

let role_ar_n_to_yojson = string_to_yojson

let input_lambda_processor_update_to_yojson = 
  fun (x: input_lambda_processor_update) -> assoc_to_yojson(
    [(
         "RoleARNUpdate",
         (option_to_yojson role_ar_n_to_yojson x.role_arn_update));
       (
         "ResourceARNUpdate",
         (option_to_yojson resource_ar_n_to_yojson x.resource_arn_update));
       
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
         "RoleARNUpdate",
         (option_to_yojson role_ar_n_to_yojson x.role_arn_update));
       (
         "ResourceARNUpdate",
         (option_to_yojson resource_ar_n_to_yojson x.resource_arn_update));
       
  ])

let kinesis_firehose_input_update_to_yojson = 
  fun (x: kinesis_firehose_input_update) -> assoc_to_yojson(
    [(
         "RoleARNUpdate",
         (option_to_yojson role_ar_n_to_yojson x.role_arn_update));
       (
         "ResourceARNUpdate",
         (option_to_yojson resource_ar_n_to_yojson x.resource_arn_update));
       
  ])

let base_unit_to_yojson = unit_to_yojson

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

let input_parallelism_count_to_yojson = int_to_yojson

let input_parallelism_update_to_yojson = 
  fun (x: input_parallelism_update) -> assoc_to_yojson(
    [(
         "CountUpdate",
         (option_to_yojson input_parallelism_count_to_yojson x.count_update));
       
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

let application_code_to_yojson = string_to_yojson

let kinesis_streams_output_update_to_yojson = 
  fun (x: kinesis_streams_output_update) -> assoc_to_yojson(
    [(
         "RoleARNUpdate",
         (option_to_yojson role_ar_n_to_yojson x.role_arn_update));
       (
         "ResourceARNUpdate",
         (option_to_yojson resource_ar_n_to_yojson x.resource_arn_update));
       
  ])

let kinesis_firehose_output_update_to_yojson = 
  fun (x: kinesis_firehose_output_update) -> assoc_to_yojson(
    [(
         "RoleARNUpdate",
         (option_to_yojson role_ar_n_to_yojson x.role_arn_update));
       (
         "ResourceARNUpdate",
         (option_to_yojson resource_ar_n_to_yojson x.resource_arn_update));
       
  ])

let lambda_output_update_to_yojson = 
  fun (x: lambda_output_update) -> assoc_to_yojson(
    [(
         "RoleARNUpdate",
         (option_to_yojson role_ar_n_to_yojson x.role_arn_update));
       (
         "ResourceARNUpdate",
         (option_to_yojson resource_ar_n_to_yojson x.resource_arn_update));
       
  ])

let destination_schema_to_yojson = 
  fun (x: destination_schema) -> assoc_to_yojson(
    [(
         "RecordFormatType",
         (Some (record_format_type_to_yojson x.record_format_type)));
       
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

let in_app_table_name_to_yojson = string_to_yojson

let bucket_ar_n_to_yojson = string_to_yojson

let file_key_to_yojson = string_to_yojson

let s3_reference_data_source_update_to_yojson = 
  fun (x: s3_reference_data_source_update) -> assoc_to_yojson(
    [(
         "ReferenceRoleARNUpdate",
         (option_to_yojson role_ar_n_to_yojson x.reference_role_arn_update));
       (
         "FileKeyUpdate",
         (option_to_yojson file_key_to_yojson x.file_key_update));
       (
         "BucketARNUpdate",
         (option_to_yojson bucket_ar_n_to_yojson x.bucket_arn_update));
       
  ])

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

let log_stream_ar_n_to_yojson = string_to_yojson

let cloud_watch_logging_option_update_to_yojson = 
  fun (x: cloud_watch_logging_option_update) -> assoc_to_yojson(
    [(
         "RoleARNUpdate",
         (option_to_yojson role_ar_n_to_yojson x.role_arn_update));
       (
         "LogStreamARNUpdate",
         (option_to_yojson log_stream_ar_n_to_yojson x.log_stream_arn_update));
       (
         "CloudWatchLoggingOptionId",
         (Some (id_to_yojson x.cloud_watch_logging_option_id)));
       
  ])

let cloud_watch_logging_option_updates_to_yojson = 
  fun tree -> list_to_yojson cloud_watch_logging_option_update_to_yojson tree

let application_update_to_yojson = 
  fun (x: application_update) -> assoc_to_yojson(
    [(
         "CloudWatchLoggingOptionUpdates",
         (option_to_yojson cloud_watch_logging_option_updates_to_yojson x.cloud_watch_logging_option_updates));
       (
         "ReferenceDataSourceUpdates",
         (option_to_yojson reference_data_source_updates_to_yojson x.reference_data_source_updates));
       (
         "OutputUpdates",
         (option_to_yojson output_updates_to_yojson x.output_updates));
       (
         "ApplicationCodeUpdate",
         (option_to_yojson application_code_to_yojson x.application_code_update));
       (
         "InputUpdates",
         (option_to_yojson input_updates_to_yojson x.input_updates));
       
  ])

let update_application_request_to_yojson = 
  fun (x: update_application_request) -> assoc_to_yojson(
    [(
         "ApplicationUpdate",
         (Some (application_update_to_yojson x.application_update)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let error_message_to_yojson = string_to_yojson

let unsupported_operation_exception_to_yojson = 
  fun (x: unsupported_operation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_in_use_exception_to_yojson = 
  fun (x: resource_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_argument_exception_to_yojson = 
  fun (x: invalid_argument_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let concurrent_modification_exception_to_yojson = 
  fun (x: concurrent_modification_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let code_validation_exception_to_yojson = 
  fun (x: code_validation_exception) -> assoc_to_yojson(
    [(
         "message",
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
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let timestamp__to_yojson = timestamp_to_yojson

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
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let start_application_response_to_yojson = 
  fun (x: start_application_response) -> assoc_to_yojson(
    [
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

let input_configuration_to_yojson = 
  fun (x: input_configuration) -> assoc_to_yojson(
    [(
         "InputStartingPositionConfiguration",
         (Some (input_starting_position_configuration_to_yojson x.input_starting_position_configuration)));
       (
         "Id",
         (Some (id_to_yojson x.id)));
       
  ])

let input_configurations_to_yojson = 
  fun tree -> list_to_yojson input_configuration_to_yojson tree

let start_application_request_to_yojson = 
  fun (x: start_application_request) -> assoc_to_yojson(
    [(
         "InputConfigurations",
         (Some (input_configurations_to_yojson x.input_configurations)));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let invalid_application_configuration_exception_to_yojson = 
  fun (x: invalid_application_configuration_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let service_unavailable_exception_to_yojson = 
  fun (x: service_unavailable_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let s3_reference_data_source_description_to_yojson = 
  fun (x: s3_reference_data_source_description) -> assoc_to_yojson(
    [(
         "ReferenceRoleARN",
         (Some (role_ar_n_to_yojson x.reference_role_ar_n)));
       (
         "FileKey",
         (Some (file_key_to_yojson x.file_key)));
       (
         "BucketARN",
         (Some (bucket_ar_n_to_yojson x.bucket_ar_n)));
       
  ])

let s3_reference_data_source_to_yojson = 
  fun (x: s3_reference_data_source) -> assoc_to_yojson(
    [(
         "ReferenceRoleARN",
         (Some (role_ar_n_to_yojson x.reference_role_ar_n)));
       (
         "FileKey",
         (Some (file_key_to_yojson x.file_key)));
       (
         "BucketARN",
         (Some (bucket_ar_n_to_yojson x.bucket_ar_n)));
       
  ])

let s3_configuration_to_yojson = 
  fun (x: s3_configuration) -> assoc_to_yojson(
    [(
         "FileKey",
         (Some (file_key_to_yojson x.file_key)));
       (
         "BucketARN",
         (Some (bucket_ar_n_to_yojson x.bucket_ar_n)));
       (
         "RoleARN",
         (Some (role_ar_n_to_yojson x.role_ar_n)));
       
  ])

let resource_provisioned_throughput_exceeded_exception_to_yojson = 
  fun (x: resource_provisioned_throughput_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
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

let parsed_input_record_field_to_yojson = string_to_yojson

let parsed_input_record_to_yojson = 
  fun tree -> list_to_yojson parsed_input_record_field_to_yojson tree

let parsed_input_records_to_yojson = 
  fun tree -> list_to_yojson parsed_input_record_to_yojson tree

let kinesis_streams_output_to_yojson = 
  fun (x: kinesis_streams_output) -> assoc_to_yojson(
    [(
         "RoleARN",
         (Some (role_ar_n_to_yojson x.role_ar_n)));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let kinesis_firehose_output_to_yojson = 
  fun (x: kinesis_firehose_output) -> assoc_to_yojson(
    [(
         "RoleARN",
         (Some (role_ar_n_to_yojson x.role_ar_n)));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let lambda_output_to_yojson = 
  fun (x: lambda_output) -> assoc_to_yojson(
    [(
         "RoleARN",
         (Some (role_ar_n_to_yojson x.role_ar_n)));
       (
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

let kinesis_streams_output_description_to_yojson = 
  fun (x: kinesis_streams_output_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (option_to_yojson resource_ar_n_to_yojson x.resource_ar_n));
       
  ])

let kinesis_firehose_output_description_to_yojson = 
  fun (x: kinesis_firehose_output_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (option_to_yojson resource_ar_n_to_yojson x.resource_ar_n));
       
  ])

let lambda_output_description_to_yojson = 
  fun (x: lambda_output_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (option_to_yojson resource_ar_n_to_yojson x.resource_ar_n));
       
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

let application_status_to_yojson = 
  fun (x: application_status) -> match x with 
 
| UPDATING -> `String "UPDATING"
  | RUNNING -> `String "RUNNING"
  | READY -> `String "READY"
  | STOPPING -> `String "STOPPING"
  | STARTING -> `String "STARTING"
  | DELETING -> `String "DELETING"
   

let application_summary_to_yojson = 
  fun (x: application_summary) -> assoc_to_yojson(
    [(
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

let boolean_object_to_yojson = bool_to_yojson

let list_applications_response_to_yojson = 
  fun (x: list_applications_response) -> assoc_to_yojson(
    [(
         "HasMoreApplications",
         (Some (boolean_object_to_yojson x.has_more_applications)));
       (
         "ApplicationSummaries",
         (Some (application_summaries_to_yojson x.application_summaries)));
       
  ])

let list_applications_input_limit_to_yojson = int_to_yojson

let list_applications_request_to_yojson = 
  fun (x: list_applications_request) -> assoc_to_yojson(
    [(
         "ExclusiveStartApplicationName",
         (option_to_yojson application_name_to_yojson x.exclusive_start_application_name));
       (
         "Limit",
         (option_to_yojson list_applications_input_limit_to_yojson x.limit));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let kinesis_streams_input_description_to_yojson = 
  fun (x: kinesis_streams_input_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (option_to_yojson resource_ar_n_to_yojson x.resource_ar_n));
       
  ])

let kinesis_streams_input_to_yojson = 
  fun (x: kinesis_streams_input) -> assoc_to_yojson(
    [(
         "RoleARN",
         (Some (role_ar_n_to_yojson x.role_ar_n)));
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
         (option_to_yojson resource_ar_n_to_yojson x.resource_ar_n));
       
  ])

let kinesis_firehose_input_to_yojson = 
  fun (x: kinesis_firehose_input) -> assoc_to_yojson(
    [(
         "RoleARN",
         (Some (role_ar_n_to_yojson x.role_ar_n)));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
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

let input_lambda_processor_to_yojson = 
  fun (x: input_lambda_processor) -> assoc_to_yojson(
    [(
         "RoleARN",
         (Some (role_ar_n_to_yojson x.role_ar_n)));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let input_processing_configuration_to_yojson = 
  fun (x: input_processing_configuration) -> assoc_to_yojson(
    [(
         "InputLambdaProcessor",
         (Some (input_lambda_processor_to_yojson x.input_lambda_processor)));
       
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
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (option_to_yojson resource_ar_n_to_yojson x.resource_ar_n));
       
  ])

let application_description_to_yojson = string_to_yojson

let in_app_stream_names_to_yojson = 
  fun tree -> list_to_yojson in_app_stream_name_to_yojson tree

let input_lambda_processor_description_to_yojson = 
  fun (x: input_lambda_processor_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ResourceARN",
         (option_to_yojson resource_ar_n_to_yojson x.resource_ar_n));
       
  ])

let input_processing_configuration_description_to_yojson = 
  fun (x: input_processing_configuration_description) -> assoc_to_yojson(
    [(
         "InputLambdaProcessorDescription",
         (option_to_yojson input_lambda_processor_description_to_yojson x.input_lambda_processor_description));
       
  ])

let input_parallelism_to_yojson = 
  fun (x: input_parallelism) -> assoc_to_yojson(
    [(
         "Count",
         (option_to_yojson input_parallelism_count_to_yojson x.count));
       
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

let cloud_watch_logging_option_description_to_yojson = 
  fun (x: cloud_watch_logging_option_description) -> assoc_to_yojson(
    [(
         "RoleARN",
         (Some (role_ar_n_to_yojson x.role_ar_n)));
       (
         "LogStreamARN",
         (Some (log_stream_ar_n_to_yojson x.log_stream_ar_n)));
       (
         "CloudWatchLoggingOptionId",
         (option_to_yojson id_to_yojson x.cloud_watch_logging_option_id));
       
  ])

let cloud_watch_logging_option_descriptions_to_yojson = 
  fun tree -> list_to_yojson cloud_watch_logging_option_description_to_yojson tree

let application_detail_to_yojson = 
  fun (x: application_detail) -> assoc_to_yojson(
    [(
         "ApplicationVersionId",
         (Some (application_version_id_to_yojson x.application_version_id)));
       (
         "ApplicationCode",
         (option_to_yojson application_code_to_yojson x.application_code));
       (
         "CloudWatchLoggingOptionDescriptions",
         (option_to_yojson cloud_watch_logging_option_descriptions_to_yojson x.cloud_watch_logging_option_descriptions));
       (
         "ReferenceDataSourceDescriptions",
         (option_to_yojson reference_data_source_descriptions_to_yojson x.reference_data_source_descriptions));
       (
         "OutputDescriptions",
         (option_to_yojson output_descriptions_to_yojson x.output_descriptions));
       (
         "InputDescriptions",
         (option_to_yojson input_descriptions_to_yojson x.input_descriptions));
       (
         "LastUpdateTimestamp",
         (option_to_yojson timestamp__to_yojson x.last_update_timestamp));
       (
         "CreateTimestamp",
         (option_to_yojson timestamp__to_yojson x.create_timestamp));
       (
         "ApplicationStatus",
         (Some (application_status_to_yojson x.application_status)));
       (
         "ApplicationARN",
         (Some (resource_ar_n_to_yojson x.application_ar_n)));
       (
         "ApplicationDescription",
         (option_to_yojson application_description_to_yojson x.application_description));
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
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let delete_application_reference_data_source_response_to_yojson = 
  fun (x: delete_application_reference_data_source_response) -> assoc_to_yojson(
    [
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
    [
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
    [
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
    [
  ])

let delete_application_cloud_watch_logging_option_request_to_yojson = 
  fun (x: delete_application_cloud_watch_logging_option_request) -> assoc_to_yojson(
    [(
         "CloudWatchLoggingOptionId",
         (Some (id_to_yojson x.cloud_watch_logging_option_id)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
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

let create_application_response_to_yojson = 
  fun (x: create_application_response) -> assoc_to_yojson(
    [(
         "ApplicationSummary",
         (Some (application_summary_to_yojson x.application_summary)));
       
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

let cloud_watch_logging_option_to_yojson = 
  fun (x: cloud_watch_logging_option) -> assoc_to_yojson(
    [(
         "RoleARN",
         (Some (role_ar_n_to_yojson x.role_ar_n)));
       (
         "LogStreamARN",
         (Some (log_stream_ar_n_to_yojson x.log_stream_ar_n)));
       
  ])

let cloud_watch_logging_options_to_yojson = 
  fun tree -> list_to_yojson cloud_watch_logging_option_to_yojson tree

let create_application_request_to_yojson = 
  fun (x: create_application_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "ApplicationCode",
         (option_to_yojson application_code_to_yojson x.application_code));
       (
         "CloudWatchLoggingOptions",
         (option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options));
       (
         "Outputs",
         (option_to_yojson outputs_to_yojson x.outputs));
       (
         "Inputs",
         (option_to_yojson inputs_to_yojson x.inputs));
       (
         "ApplicationDescription",
         (option_to_yojson application_description_to_yojson x.application_description));
       (
         "ApplicationName",
         (Some (application_name_to_yojson x.application_name)));
       
  ])

let add_application_reference_data_source_response_to_yojson = 
  fun (x: add_application_reference_data_source_response) -> assoc_to_yojson(
    [
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
    [
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
    [
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
    [
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
    [
  ])

let add_application_cloud_watch_logging_option_request_to_yojson = 
  fun (x: add_application_cloud_watch_logging_option_request) -> assoc_to_yojson(
    [(
         "CloudWatchLoggingOption",
         (Some (cloud_watch_logging_option_to_yojson x.cloud_watch_logging_option)));
       (
         "CurrentApplicationVersionId",
         (Some (application_version_id_to_yojson x.current_application_version_id)));
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

