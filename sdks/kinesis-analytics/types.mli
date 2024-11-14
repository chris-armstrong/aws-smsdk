open Smaws_Lib
val service : Service.descriptor

type update_application_response = unit

type input_lambda_processor_update = {
  role_arn_update: string option;
  resource_arn_update: string option
}

type input_processing_configuration_update = {
  input_lambda_processor_update: input_lambda_processor_update
}

type kinesis_streams_input_update = {
  role_arn_update: string option;
  resource_arn_update: string option
}

type kinesis_firehose_input_update = {
  role_arn_update: string option;
  resource_arn_update: string option
}

type record_format_type = | CSV
  | JSON

type json_mapping_parameters = {
  record_row_path: string
}

type csv_mapping_parameters = {
  record_column_delimiter: string;
  record_row_delimiter: string
}

type mapping_parameters = {
  csv_mapping_parameters: csv_mapping_parameters option;
  json_mapping_parameters: json_mapping_parameters option
}

type record_format = {
  mapping_parameters: mapping_parameters option;
  record_format_type: record_format_type
}

type record_column = {
  sql_type: string;
  mapping: string option;
  name: string
}

type input_schema_update = {
  record_column_updates: record_column list option;
  record_encoding_update: string option;
  record_format_update: record_format option
}

type input_parallelism_update = {
  count_update: int option
}

type input_update = {
  input_parallelism_update: input_parallelism_update option;
  input_schema_update: input_schema_update option;
  kinesis_firehose_input_update: kinesis_firehose_input_update option;
  kinesis_streams_input_update: kinesis_streams_input_update option;
  input_processing_configuration_update: input_processing_configuration_update option;
  name_prefix_update: string option;
  input_id: string
}

type kinesis_streams_output_update = {
  role_arn_update: string option;
  resource_arn_update: string option
}

type kinesis_firehose_output_update = {
  role_arn_update: string option;
  resource_arn_update: string option
}

type lambda_output_update = {
  role_arn_update: string option;
  resource_arn_update: string option
}

type destination_schema = {
  record_format_type: record_format_type
}

type output_update = {
  destination_schema_update: destination_schema option;
  lambda_output_update: lambda_output_update option;
  kinesis_firehose_output_update: kinesis_firehose_output_update option;
  kinesis_streams_output_update: kinesis_streams_output_update option;
  name_update: string option;
  output_id: string
}

type s3_reference_data_source_update = {
  reference_role_arn_update: string option;
  file_key_update: string option;
  bucket_arn_update: string option
}

type source_schema = {
  record_columns: record_column list;
  record_encoding: string option;
  record_format: record_format
}

type reference_data_source_update = {
  reference_schema_update: source_schema option;
  s3_reference_data_source_update: s3_reference_data_source_update option;
  table_name_update: string option;
  reference_id: string
}

type cloud_watch_logging_option_update = {
  role_arn_update: string option;
  log_stream_arn_update: string option;
  cloud_watch_logging_option_id: string
}

type application_update = {
  cloud_watch_logging_option_updates: cloud_watch_logging_option_update list option;
  reference_data_source_updates: reference_data_source_update list option;
  output_updates: output_update list option;
  application_code_update: string option;
  input_updates: input_update list option
}

type update_application_request = {
  application_update: application_update;
  current_application_version_id: int;
  application_name: string
}

type unsupported_operation_exception = {
  message: string option
}

type resource_not_found_exception = {
  message: string option
}

type resource_in_use_exception = {
  message: string option
}

type invalid_argument_exception = {
  message: string option
}

type concurrent_modification_exception = {
  message: string option
}

type code_validation_exception = {
  message: string option
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_ar_n: string
}

type too_many_tags_exception = {
  message: string option
}

type unable_to_detect_schema_exception = {
  processed_input_records: string list option;
  raw_input_records: string list option;
  message: string option
}

type tag = {
  value: string option;
  key: string
}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
  resource_ar_n: string
}

type stop_application_response = unit

type stop_application_request = {
  application_name: string
}

type start_application_response = unit

type input_starting_position = | LAST_STOPPED_POINT
  | TRIM_HORIZON
  | NOW

type input_starting_position_configuration = {
  input_starting_position: input_starting_position option
}

type input_configuration = {
  input_starting_position_configuration: input_starting_position_configuration;
  id: string
}

type start_application_request = {
  input_configurations: input_configuration list;
  application_name: string
}

type invalid_application_configuration_exception = {
  message: string option
}

type service_unavailable_exception = {
  message: string option
}

type s3_reference_data_source_description = {
  reference_role_ar_n: string;
  file_key: string;
  bucket_ar_n: string
}

type s3_reference_data_source = {
  reference_role_ar_n: string;
  file_key: string;
  bucket_ar_n: string
}

type s3_configuration = {
  file_key: string;
  bucket_ar_n: string;
  role_ar_n: string
}

type resource_provisioned_throughput_exceeded_exception = {
  message: string option
}

type reference_data_source_description = {
  reference_schema: source_schema option;
  s3_reference_data_source_description: s3_reference_data_source_description;
  table_name: string;
  reference_id: string
}

type reference_data_source = {
  reference_schema: source_schema;
  s3_reference_data_source: s3_reference_data_source option;
  table_name: string
}

type kinesis_streams_output = {
  role_ar_n: string;
  resource_ar_n: string
}

type kinesis_firehose_output = {
  role_ar_n: string;
  resource_ar_n: string
}

type lambda_output = {
  role_ar_n: string;
  resource_ar_n: string
}

type output = {
  destination_schema: destination_schema;
  lambda_output: lambda_output option;
  kinesis_firehose_output: kinesis_firehose_output option;
  kinesis_streams_output: kinesis_streams_output option;
  name: string
}

type kinesis_streams_output_description = {
  role_ar_n: string option;
  resource_ar_n: string option
}

type kinesis_firehose_output_description = {
  role_ar_n: string option;
  resource_ar_n: string option
}

type lambda_output_description = {
  role_ar_n: string option;
  resource_ar_n: string option
}

type output_description = {
  destination_schema: destination_schema option;
  lambda_output_description: lambda_output_description option;
  kinesis_firehose_output_description: kinesis_firehose_output_description option;
  kinesis_streams_output_description: kinesis_streams_output_description option;
  name: string option;
  output_id: string option
}

type list_tags_for_resource_response = {
  tags: tag list option
}

type list_tags_for_resource_request = {
  resource_ar_n: string
}

type application_status = | UPDATING
  | RUNNING
  | READY
  | STOPPING
  | STARTING
  | DELETING

type application_summary = {
  application_status: application_status;
  application_ar_n: string;
  application_name: string
}

type list_applications_response = {
  has_more_applications: bool;
  application_summaries: application_summary list
}

type list_applications_request = {
  exclusive_start_application_name: string option;
  limit: int option
}

type limit_exceeded_exception = {
  message: string option
}

type kinesis_streams_input_description = {
  role_ar_n: string option;
  resource_ar_n: string option
}

type kinesis_streams_input = {
  role_ar_n: string;
  resource_ar_n: string
}

type kinesis_firehose_input_description = {
  role_ar_n: string option;
  resource_ar_n: string option
}

type kinesis_firehose_input = {
  role_ar_n: string;
  resource_ar_n: string
}

type discover_input_schema_response = {
  raw_input_records: string list option;
  processed_input_records: string list option;
  parsed_input_records: string list list option;
  input_schema: source_schema option
}

type input_lambda_processor = {
  role_ar_n: string;
  resource_ar_n: string
}

type input_processing_configuration = {
  input_lambda_processor: input_lambda_processor
}

type discover_input_schema_request = {
  input_processing_configuration: input_processing_configuration option;
  s3_configuration: s3_configuration option;
  input_starting_position_configuration: input_starting_position_configuration option;
  role_ar_n: string option;
  resource_ar_n: string option
}

type input_lambda_processor_description = {
  role_ar_n: string option;
  resource_ar_n: string option
}

type input_processing_configuration_description = {
  input_lambda_processor_description: input_lambda_processor_description option
}

type input_parallelism = {
  count: int option
}

type input_description = {
  input_starting_position_configuration: input_starting_position_configuration option;
  input_parallelism: input_parallelism option;
  input_schema: source_schema option;
  kinesis_firehose_input_description: kinesis_firehose_input_description option;
  kinesis_streams_input_description: kinesis_streams_input_description option;
  input_processing_configuration_description: input_processing_configuration_description option;
  in_app_stream_names: string list option;
  name_prefix: string option;
  input_id: string option
}

type cloud_watch_logging_option_description = {
  role_ar_n: string;
  log_stream_ar_n: string;
  cloud_watch_logging_option_id: string option
}

type application_detail = {
  application_version_id: int;
  application_code: string option;
  cloud_watch_logging_option_descriptions: cloud_watch_logging_option_description list option;
  reference_data_source_descriptions: reference_data_source_description list option;
  output_descriptions: output_description list option;
  input_descriptions: input_description list option;
  last_update_timestamp: float option;
  create_timestamp: float option;
  application_status: application_status;
  application_ar_n: string;
  application_description: string option;
  application_name: string
}

type describe_application_response = {
  application_detail: application_detail
}

type describe_application_request = {
  application_name: string
}

type delete_application_reference_data_source_response = unit

type delete_application_reference_data_source_request = {
  reference_id: string;
  current_application_version_id: int;
  application_name: string
}

type delete_application_output_response = unit

type delete_application_output_request = {
  output_id: string;
  current_application_version_id: int;
  application_name: string
}

type delete_application_input_processing_configuration_response = unit

type delete_application_input_processing_configuration_request = {
  input_id: string;
  current_application_version_id: int;
  application_name: string
}

type delete_application_cloud_watch_logging_option_response = unit

type delete_application_cloud_watch_logging_option_request = {
  cloud_watch_logging_option_id: string;
  current_application_version_id: int;
  application_name: string
}

type delete_application_response = unit

type delete_application_request = {
  create_timestamp: float;
  application_name: string
}

type create_application_response = {
  application_summary: application_summary
}

type input = {
  input_schema: source_schema;
  input_parallelism: input_parallelism option;
  kinesis_firehose_input: kinesis_firehose_input option;
  kinesis_streams_input: kinesis_streams_input option;
  input_processing_configuration: input_processing_configuration option;
  name_prefix: string
}

type cloud_watch_logging_option = {
  role_ar_n: string;
  log_stream_ar_n: string
}

type create_application_request = {
  tags: tag list option;
  application_code: string option;
  cloud_watch_logging_options: cloud_watch_logging_option list option;
  outputs: output list option;
  inputs: input list option;
  application_description: string option;
  application_name: string
}

type add_application_reference_data_source_response = unit

type add_application_reference_data_source_request = {
  reference_data_source: reference_data_source;
  current_application_version_id: int;
  application_name: string
}

type add_application_output_response = unit

type add_application_output_request = {
  output: output;
  current_application_version_id: int;
  application_name: string
}

type add_application_input_processing_configuration_response = unit

type add_application_input_processing_configuration_request = {
  input_processing_configuration: input_processing_configuration;
  input_id: string;
  current_application_version_id: int;
  application_name: string
}

type add_application_input_response = unit

type add_application_input_request = {
  input: input;
  current_application_version_id: int;
  application_name: string
}

type add_application_cloud_watch_logging_option_response = unit

type add_application_cloud_watch_logging_option_request = {
  cloud_watch_logging_option: cloud_watch_logging_option;
  current_application_version_id: int;
  application_name: string
}



type base_document = Json.t

