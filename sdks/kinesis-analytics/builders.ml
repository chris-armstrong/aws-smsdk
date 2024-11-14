[@@@warning "-39"]
open Types
let make_update_application_response  () : update_application_response =
()

let make_input_lambda_processor_update 
  ?(role_arn_update : string option)
  ?(resource_arn_update : string option)
  () : input_lambda_processor_update = {
  role_arn_update; resource_arn_update; 
}

let make_input_processing_configuration_update 
  ~(input_lambda_processor_update : input_lambda_processor_update) ()
: input_processing_configuration_update = { input_lambda_processor_update; 
}

let make_kinesis_streams_input_update 
  ?(role_arn_update : string option)
  ?(resource_arn_update : string option)
  () : kinesis_streams_input_update = {
  role_arn_update; resource_arn_update; 
}

let make_kinesis_firehose_input_update 
  ?(role_arn_update : string option)
  ?(resource_arn_update : string option)
  () : kinesis_firehose_input_update = {
  role_arn_update; resource_arn_update;  }

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

let make_input_schema_update 
  ?(record_column_updates : record_column list option)
  ?(record_encoding_update : string option)
  ?(record_format_update : record_format option)
  () : input_schema_update = {
  record_column_updates; record_encoding_update; record_format_update; 
}

let make_input_parallelism_update  ?(count_update : int option) ()
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

let make_kinesis_streams_output_update 
  ?(role_arn_update : string option)
  ?(resource_arn_update : string option)
  () : kinesis_streams_output_update = {
  role_arn_update; resource_arn_update; 
}

let make_kinesis_firehose_output_update 
  ?(role_arn_update : string option)
  ?(resource_arn_update : string option)
  () : kinesis_firehose_output_update = {
  role_arn_update; resource_arn_update;  }

let make_lambda_output_update 
  ?(role_arn_update : string option)
  ?(resource_arn_update : string option)
  () : lambda_output_update = { role_arn_update; resource_arn_update; 
}

let make_destination_schema  ~(record_format_type : record_format_type) ()
: destination_schema = { record_format_type;  }

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
  ?(reference_role_arn_update : string option)
  ?(file_key_update : string option)
  ?(bucket_arn_update : string option)
  () : s3_reference_data_source_update = {
  reference_role_arn_update; file_key_update; bucket_arn_update; 
}

let make_source_schema 
  ?(record_encoding : string option)
  ~(record_columns : record_column list)
  ~(record_format : record_format)
  () : source_schema = { record_columns; record_encoding; record_format; 
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

let make_cloud_watch_logging_option_update 
  ?(role_arn_update : string option)
  ?(log_stream_arn_update : string option)
  ~(cloud_watch_logging_option_id : string)
  () : cloud_watch_logging_option_update = {
  role_arn_update; log_stream_arn_update; cloud_watch_logging_option_id; 
}

let make_application_update 
  ?(cloud_watch_logging_option_updates : cloud_watch_logging_option_update list option)
  ?(reference_data_source_updates : reference_data_source_update list option)
  ?(output_updates : output_update list option)
  ?(application_code_update : string option)
  ?(input_updates : input_update list option)
  () : application_update = {
  cloud_watch_logging_option_updates;
  reference_data_source_updates;
  output_updates;
  application_code_update;
  input_updates;
   }

let make_update_application_request 
  ~(application_update : application_update)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : update_application_request = {
  application_update; current_application_version_id; application_name; 
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

let make_stop_application_request  ~(application_name : string) ()
: stop_application_request = { application_name; 
}

let make_start_application_response  () : start_application_response =
()

let make_input_starting_position_configuration 
  ?(input_starting_position : input_starting_position option) ()
: input_starting_position_configuration = { input_starting_position; 
}

let make_input_configuration 
  ~(input_starting_position_configuration : input_starting_position_configuration)
  ~(id : string)
  () : input_configuration = { input_starting_position_configuration; id; 
}

let make_start_application_request 
  ~(input_configurations : input_configuration list)
  ~(application_name : string)
  () : start_application_request = { input_configurations; application_name; 
}

let make_s3_reference_data_source_description 
  ~(reference_role_ar_n : string)
  ~(file_key : string)
  ~(bucket_ar_n : string)
  () : s3_reference_data_source_description = {
  reference_role_ar_n; file_key; bucket_ar_n; 
}

let make_s3_reference_data_source 
  ~(reference_role_ar_n : string)
  ~(file_key : string)
  ~(bucket_ar_n : string)
  () : s3_reference_data_source = {
  reference_role_ar_n; file_key; bucket_ar_n;  }

let make_s3_configuration 
  ~(file_key : string) ~(bucket_ar_n : string) ~(role_ar_n : string) ()
: s3_configuration = { file_key; bucket_ar_n; role_ar_n; 
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

let make_reference_data_source 
  ?(s3_reference_data_source : s3_reference_data_source option)
  ~(reference_schema : source_schema)
  ~(table_name : string)
  () : reference_data_source = {
  reference_schema; s3_reference_data_source; table_name; 
}

let make_kinesis_streams_output 
  ~(role_ar_n : string) ~(resource_ar_n : string) () : kinesis_streams_output
= { role_ar_n; resource_ar_n;  }

let make_kinesis_firehose_output 
  ~(role_ar_n : string) ~(resource_ar_n : string) ()
: kinesis_firehose_output = { role_ar_n; resource_ar_n; 
}

let make_lambda_output  ~(role_ar_n : string) ~(resource_ar_n : string) ()
: lambda_output = { role_ar_n; resource_ar_n;  }

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

let make_kinesis_streams_output_description 
  ?(role_ar_n : string option) ?(resource_ar_n : string option) ()
: kinesis_streams_output_description = { role_ar_n; resource_ar_n; 
}

let make_kinesis_firehose_output_description 
  ?(role_ar_n : string option) ?(resource_ar_n : string option) ()
: kinesis_firehose_output_description = { role_ar_n; resource_ar_n; 
}

let make_lambda_output_description 
  ?(role_ar_n : string option) ?(resource_ar_n : string option) ()
: lambda_output_description = { role_ar_n; resource_ar_n; 
}

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

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request  ~(resource_ar_n : string) ()
: list_tags_for_resource_request = { resource_ar_n; 
}

let make_application_summary 
  ~(application_status : application_status)
  ~(application_ar_n : string)
  ~(application_name : string)
  () : application_summary = {
  application_status; application_ar_n; application_name; 
}

let make_list_applications_response 
  ~(has_more_applications : bool)
  ~(application_summaries : application_summary list)
  () : list_applications_response = {
  has_more_applications; application_summaries; 
}

let make_list_applications_request 
  ?(exclusive_start_application_name : string option)
  ?(limit : int option)
  () : list_applications_request = {
  exclusive_start_application_name; limit; 
}

let make_kinesis_streams_input_description 
  ?(role_ar_n : string option) ?(resource_ar_n : string option) ()
: kinesis_streams_input_description = { role_ar_n; resource_ar_n; 
}

let make_kinesis_streams_input 
  ~(role_ar_n : string) ~(resource_ar_n : string) () : kinesis_streams_input
= { role_ar_n; resource_ar_n;  }

let make_kinesis_firehose_input_description 
  ?(role_ar_n : string option) ?(resource_ar_n : string option) ()
: kinesis_firehose_input_description = { role_ar_n; resource_ar_n; 
}

let make_kinesis_firehose_input 
  ~(role_ar_n : string) ~(resource_ar_n : string) () : kinesis_firehose_input
= { role_ar_n; resource_ar_n;  }

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

let make_input_lambda_processor 
  ~(role_ar_n : string) ~(resource_ar_n : string) () : input_lambda_processor
= { role_ar_n; resource_ar_n;  }

let make_input_processing_configuration 
  ~(input_lambda_processor : input_lambda_processor) ()
: input_processing_configuration = { input_lambda_processor; 
}

let make_discover_input_schema_request 
  ?(input_processing_configuration : input_processing_configuration option)
  ?(s3_configuration : s3_configuration option)
  ?(input_starting_position_configuration : input_starting_position_configuration option)
  ?(role_ar_n : string option)
  ?(resource_ar_n : string option)
  () : discover_input_schema_request = {
  input_processing_configuration;
  s3_configuration;
  input_starting_position_configuration;
  role_ar_n;
  resource_ar_n;
   }

let make_input_lambda_processor_description 
  ?(role_ar_n : string option) ?(resource_ar_n : string option) ()
: input_lambda_processor_description = { role_ar_n; resource_ar_n; 
}

let make_input_processing_configuration_description 
  ?(input_lambda_processor_description : input_lambda_processor_description option)
  () : input_processing_configuration_description = {
  input_lambda_processor_description;  }

let make_input_parallelism  ?(count : int option) () : input_parallelism = {
  count;  }

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

let make_cloud_watch_logging_option_description 
  ?(cloud_watch_logging_option_id : string option)
  ~(role_ar_n : string)
  ~(log_stream_ar_n : string)
  () : cloud_watch_logging_option_description = {
  role_ar_n; log_stream_ar_n; cloud_watch_logging_option_id; 
}

let make_application_detail 
  ?(application_code : string option)
  ?(cloud_watch_logging_option_descriptions : cloud_watch_logging_option_description list option)
  ?(reference_data_source_descriptions : reference_data_source_description list option)
  ?(output_descriptions : output_description list option)
  ?(input_descriptions : input_description list option)
  ?(last_update_timestamp : float option)
  ?(create_timestamp : float option)
  ?(application_description : string option)
  ~(application_version_id : int)
  ~(application_status : application_status)
  ~(application_ar_n : string)
  ~(application_name : string)
  () : application_detail = {
  application_version_id;
  application_code;
  cloud_watch_logging_option_descriptions;
  reference_data_source_descriptions;
  output_descriptions;
  input_descriptions;
  last_update_timestamp;
  create_timestamp;
  application_status;
  application_ar_n;
  application_description;
  application_name;
   }

let make_describe_application_response 
  ~(application_detail : application_detail) ()
: describe_application_response = { application_detail; 
}

let make_describe_application_request  ~(application_name : string) ()
: describe_application_request = { application_name; 
}

let make_delete_application_reference_data_source_response  ()
: delete_application_reference_data_source_response =
()

let make_delete_application_reference_data_source_request 
  ~(reference_id : string)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : delete_application_reference_data_source_request = {
  reference_id; current_application_version_id; application_name; 
}

let make_delete_application_output_response  ()
: delete_application_output_response =
()

let make_delete_application_output_request 
  ~(output_id : string)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : delete_application_output_request = {
  output_id; current_application_version_id; application_name; 
}

let make_delete_application_input_processing_configuration_response  
() : delete_application_input_processing_configuration_response =
()

let make_delete_application_input_processing_configuration_request 
  ~(input_id : string)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : delete_application_input_processing_configuration_request = {
  input_id; current_application_version_id; application_name; 
}

let make_delete_application_cloud_watch_logging_option_response  ()
: delete_application_cloud_watch_logging_option_response =
()

let make_delete_application_cloud_watch_logging_option_request 
  ~(cloud_watch_logging_option_id : string)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : delete_application_cloud_watch_logging_option_request = {
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

let make_create_application_response 
  ~(application_summary : application_summary) ()
: create_application_response = { application_summary;  }

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

let make_cloud_watch_logging_option 
  ~(role_ar_n : string) ~(log_stream_ar_n : string) ()
: cloud_watch_logging_option = { role_ar_n; log_stream_ar_n; 
}

let make_create_application_request 
  ?(tags : tag list option)
  ?(application_code : string option)
  ?(cloud_watch_logging_options : cloud_watch_logging_option list option)
  ?(outputs : output list option)
  ?(inputs : input list option)
  ?(application_description : string option)
  ~(application_name : string)
  () : create_application_request = {
  tags;
  application_code;
  cloud_watch_logging_options;
  outputs;
  inputs;
  application_description;
  application_name;
   }

let make_add_application_reference_data_source_response  ()
: add_application_reference_data_source_response =
()

let make_add_application_reference_data_source_request 
  ~(reference_data_source : reference_data_source)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : add_application_reference_data_source_request = {
  reference_data_source; current_application_version_id; application_name; 
}

let make_add_application_output_response  ()
: add_application_output_response =
()

let make_add_application_output_request 
  ~(output : output)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : add_application_output_request = {
  output; current_application_version_id; application_name; 
}

let make_add_application_input_processing_configuration_response  ()
: add_application_input_processing_configuration_response =
()

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

let make_add_application_input_response  () : add_application_input_response
= ()

let make_add_application_input_request 
  ~(input : input)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : add_application_input_request = {
  input; current_application_version_id; application_name; 
}

let make_add_application_cloud_watch_logging_option_response  ()
: add_application_cloud_watch_logging_option_response =
()

let make_add_application_cloud_watch_logging_option_request 
  ~(cloud_watch_logging_option : cloud_watch_logging_option)
  ~(current_application_version_id : int)
  ~(application_name : string)
  () : add_application_cloud_watch_logging_option_request = {
  cloud_watch_logging_option;
  current_application_version_id;
  application_name;
  
}

