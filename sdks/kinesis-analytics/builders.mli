open Types
val make_update_application_response : unit
-> update_application_response
(** Create a {!type-update_application_response} type *)

val make_input_lambda_processor_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> input_lambda_processor_update
(** Create a {!type-input_lambda_processor_update} type *)

val make_input_processing_configuration_update :
  input_lambda_processor_update:input_lambda_processor_update -> unit
-> input_processing_configuration_update
(** Create a {!type-input_processing_configuration_update} type *)

val make_kinesis_streams_input_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> kinesis_streams_input_update
(** Create a {!type-kinesis_streams_input_update} type *)

val make_kinesis_firehose_input_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> kinesis_firehose_input_update
(** Create a {!type-kinesis_firehose_input_update} type *)

val make_json_mapping_parameters : record_row_path:string -> unit
-> json_mapping_parameters
(** Create a {!type-json_mapping_parameters} type *)

val make_csv_mapping_parameters :
  record_column_delimiter:string -> record_row_delimiter:string -> unit
-> csv_mapping_parameters
(** Create a {!type-csv_mapping_parameters} type *)

val make_mapping_parameters :
  ?csv_mapping_parameters:csv_mapping_parameters ->
  ?json_mapping_parameters:json_mapping_parameters ->
  unit
-> mapping_parameters
(** Create a {!type-mapping_parameters} type *)

val make_record_format :
  ?mapping_parameters:mapping_parameters ->
  record_format_type:record_format_type ->
  unit
-> record_format
(** Create a {!type-record_format} type *)

val make_record_column :
  ?mapping:string -> sql_type:string -> name:string -> unit
-> record_column
(** Create a {!type-record_column} type *)

val make_input_schema_update :
  ?record_column_updates:record_column list ->
  ?record_encoding_update:string ->
  ?record_format_update:record_format ->
  unit
-> input_schema_update
(** Create a {!type-input_schema_update} type *)

val make_input_parallelism_update : ?count_update:int -> unit
-> input_parallelism_update
(** Create a {!type-input_parallelism_update} type *)

val make_input_update :
  ?input_parallelism_update:input_parallelism_update ->
  ?input_schema_update:input_schema_update ->
  ?kinesis_firehose_input_update:kinesis_firehose_input_update ->
  ?kinesis_streams_input_update:kinesis_streams_input_update ->
  ?input_processing_configuration_update:input_processing_configuration_update ->
  ?name_prefix_update:string ->
  input_id:string ->
  unit
-> input_update
(** Create a {!type-input_update} type *)

val make_kinesis_streams_output_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> kinesis_streams_output_update
(** Create a {!type-kinesis_streams_output_update} type *)

val make_kinesis_firehose_output_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> kinesis_firehose_output_update
(** Create a {!type-kinesis_firehose_output_update} type *)

val make_lambda_output_update :
  ?role_arn_update:string -> ?resource_arn_update:string -> unit
-> lambda_output_update
(** Create a {!type-lambda_output_update} type *)

val make_destination_schema : record_format_type:record_format_type -> unit
-> destination_schema
(** Create a {!type-destination_schema} type *)

val make_output_update :
  ?destination_schema_update:destination_schema ->
  ?lambda_output_update:lambda_output_update ->
  ?kinesis_firehose_output_update:kinesis_firehose_output_update ->
  ?kinesis_streams_output_update:kinesis_streams_output_update ->
  ?name_update:string ->
  output_id:string ->
  unit
-> output_update
(** Create a {!type-output_update} type *)

val make_s3_reference_data_source_update :
  ?reference_role_arn_update:string ->
  ?file_key_update:string ->
  ?bucket_arn_update:string ->
  unit
-> s3_reference_data_source_update
(** Create a {!type-s3_reference_data_source_update} type *)

val make_source_schema :
  ?record_encoding:string ->
  record_columns:record_column list ->
  record_format:record_format ->
  unit
-> source_schema
(** Create a {!type-source_schema} type *)

val make_reference_data_source_update :
  ?reference_schema_update:source_schema ->
  ?s3_reference_data_source_update:s3_reference_data_source_update ->
  ?table_name_update:string ->
  reference_id:string ->
  unit
-> reference_data_source_update
(** Create a {!type-reference_data_source_update} type *)

val make_cloud_watch_logging_option_update :
  ?role_arn_update:string ->
  ?log_stream_arn_update:string ->
  cloud_watch_logging_option_id:string ->
  unit
-> cloud_watch_logging_option_update
(** Create a {!type-cloud_watch_logging_option_update} type *)

val make_application_update :
  ?cloud_watch_logging_option_updates:cloud_watch_logging_option_update list ->
  ?reference_data_source_updates:reference_data_source_update list ->
  ?output_updates:output_update list ->
  ?application_code_update:string ->
  ?input_updates:input_update list ->
  unit
-> application_update
(** Create a {!type-application_update} type *)

val make_update_application_request :
  application_update:application_update ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> update_application_request
(** Create a {!type-update_application_request} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_tag : ?value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_stop_application_response : unit
-> stop_application_response
(** Create a {!type-stop_application_response} type *)

val make_stop_application_request : application_name:string -> unit
-> stop_application_request
(** Create a {!type-stop_application_request} type *)

val make_start_application_response : unit
-> start_application_response
(** Create a {!type-start_application_response} type *)

val make_input_starting_position_configuration :
  ?input_starting_position:input_starting_position -> unit
-> input_starting_position_configuration
(** Create a {!type-input_starting_position_configuration} type *)

val make_input_configuration :
  input_starting_position_configuration:input_starting_position_configuration ->
  id:string ->
  unit
-> input_configuration
(** Create a {!type-input_configuration} type *)

val make_start_application_request :
  input_configurations:input_configuration list ->
  application_name:string ->
  unit
-> start_application_request
(** Create a {!type-start_application_request} type *)

val make_s3_reference_data_source_description :
  reference_role_ar_n:string -> file_key:string -> bucket_ar_n:string -> unit
-> s3_reference_data_source_description
(** Create a {!type-s3_reference_data_source_description} type *)

val make_s3_reference_data_source :
  reference_role_ar_n:string -> file_key:string -> bucket_ar_n:string -> unit
-> s3_reference_data_source
(** Create a {!type-s3_reference_data_source} type *)

val make_s3_configuration :
  file_key:string -> bucket_ar_n:string -> role_ar_n:string -> unit
-> s3_configuration
(** Create a {!type-s3_configuration} type *)

val make_reference_data_source_description :
  ?reference_schema:source_schema ->
  s3_reference_data_source_description:s3_reference_data_source_description ->
  table_name:string ->
  reference_id:string ->
  unit
-> reference_data_source_description
(** Create a {!type-reference_data_source_description} type *)

val make_reference_data_source :
  ?s3_reference_data_source:s3_reference_data_source ->
  reference_schema:source_schema ->
  table_name:string ->
  unit
-> reference_data_source
(** Create a {!type-reference_data_source} type *)

val make_kinesis_streams_output :
  role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_streams_output
(** Create a {!type-kinesis_streams_output} type *)

val make_kinesis_firehose_output :
  role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_firehose_output
(** Create a {!type-kinesis_firehose_output} type *)

val make_lambda_output : role_ar_n:string -> resource_ar_n:string -> unit
-> lambda_output
(** Create a {!type-lambda_output} type *)

val make_output :
  ?lambda_output:lambda_output ->
  ?kinesis_firehose_output:kinesis_firehose_output ->
  ?kinesis_streams_output:kinesis_streams_output ->
  destination_schema:destination_schema ->
  name:string ->
  unit
-> output
(** Create a {!type-output} type *)

val make_kinesis_streams_output_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> kinesis_streams_output_description
(** Create a {!type-kinesis_streams_output_description} type *)

val make_kinesis_firehose_output_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> kinesis_firehose_output_description
(** Create a {!type-kinesis_firehose_output_description} type *)

val make_lambda_output_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> lambda_output_description
(** Create a {!type-lambda_output_description} type *)

val make_output_description :
  ?destination_schema:destination_schema ->
  ?lambda_output_description:lambda_output_description ->
  ?kinesis_firehose_output_description:kinesis_firehose_output_description ->
  ?kinesis_streams_output_description:kinesis_streams_output_description ->
  ?name:string ->
  ?output_id:string ->
  unit
-> output_description
(** Create a {!type-output_description} type *)

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_application_summary :
  application_status:application_status ->
  application_ar_n:string ->
  application_name:string ->
  unit
-> application_summary
(** Create a {!type-application_summary} type *)

val make_list_applications_response :
  has_more_applications:bool ->
  application_summaries:application_summary list ->
  unit
-> list_applications_response
(** Create a {!type-list_applications_response} type *)

val make_list_applications_request :
  ?exclusive_start_application_name:string -> ?limit:int -> unit
-> list_applications_request
(** Create a {!type-list_applications_request} type *)

val make_kinesis_streams_input_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> kinesis_streams_input_description
(** Create a {!type-kinesis_streams_input_description} type *)

val make_kinesis_streams_input :
  role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_streams_input
(** Create a {!type-kinesis_streams_input} type *)

val make_kinesis_firehose_input_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> kinesis_firehose_input_description
(** Create a {!type-kinesis_firehose_input_description} type *)

val make_kinesis_firehose_input :
  role_ar_n:string -> resource_ar_n:string -> unit
-> kinesis_firehose_input
(** Create a {!type-kinesis_firehose_input} type *)

val make_discover_input_schema_response :
  ?raw_input_records:string list ->
  ?processed_input_records:string list ->
  ?parsed_input_records:string list list ->
  ?input_schema:source_schema ->
  unit
-> discover_input_schema_response
(** Create a {!type-discover_input_schema_response} type *)

val make_input_lambda_processor :
  role_ar_n:string -> resource_ar_n:string -> unit
-> input_lambda_processor
(** Create a {!type-input_lambda_processor} type *)

val make_input_processing_configuration :
  input_lambda_processor:input_lambda_processor -> unit
-> input_processing_configuration
(** Create a {!type-input_processing_configuration} type *)

val make_discover_input_schema_request :
  ?input_processing_configuration:input_processing_configuration ->
  ?s3_configuration:s3_configuration ->
  ?input_starting_position_configuration:input_starting_position_configuration ->
  ?role_ar_n:string ->
  ?resource_ar_n:string ->
  unit
-> discover_input_schema_request
(** Create a {!type-discover_input_schema_request} type *)

val make_input_lambda_processor_description :
  ?role_ar_n:string -> ?resource_ar_n:string -> unit
-> input_lambda_processor_description
(** Create a {!type-input_lambda_processor_description} type *)

val make_input_processing_configuration_description :
  ?input_lambda_processor_description:input_lambda_processor_description ->
  unit
-> input_processing_configuration_description
(** Create a {!type-input_processing_configuration_description} type *)

val make_input_parallelism : ?count:int -> unit
-> input_parallelism
(** Create a {!type-input_parallelism} type *)

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
  unit
-> input_description
(** Create a {!type-input_description} type *)

val make_cloud_watch_logging_option_description :
  ?cloud_watch_logging_option_id:string ->
  role_ar_n:string ->
  log_stream_ar_n:string ->
  unit
-> cloud_watch_logging_option_description
(** Create a {!type-cloud_watch_logging_option_description} type *)

val make_application_detail :
  ?application_code:string ->
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_description list ->
  ?reference_data_source_descriptions:reference_data_source_description list ->
  ?output_descriptions:output_description list ->
  ?input_descriptions:input_description list ->
  ?last_update_timestamp:float ->
  ?create_timestamp:float ->
  ?application_description:string ->
  application_version_id:int ->
  application_status:application_status ->
  application_ar_n:string ->
  application_name:string ->
  unit
-> application_detail
(** Create a {!type-application_detail} type *)

val make_describe_application_response :
  application_detail:application_detail -> unit
-> describe_application_response
(** Create a {!type-describe_application_response} type *)

val make_describe_application_request : application_name:string -> unit
-> describe_application_request
(** Create a {!type-describe_application_request} type *)

val make_delete_application_reference_data_source_response : unit
-> delete_application_reference_data_source_response
(** Create a {!type-delete_application_reference_data_source_response} type *)

val make_delete_application_reference_data_source_request :
  reference_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_reference_data_source_request
(** Create a {!type-delete_application_reference_data_source_request} type *)

val make_delete_application_output_response : unit
-> delete_application_output_response
(** Create a {!type-delete_application_output_response} type *)

val make_delete_application_output_request :
  output_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_output_request
(** Create a {!type-delete_application_output_request} type *)

val make_delete_application_input_processing_configuration_response : 
unit
-> delete_application_input_processing_configuration_response
(** Create a {!type-delete_application_input_processing_configuration_response} type *)

val make_delete_application_input_processing_configuration_request :
  input_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_input_processing_configuration_request
(** Create a {!type-delete_application_input_processing_configuration_request} type *)

val make_delete_application_cloud_watch_logging_option_response : unit
-> delete_application_cloud_watch_logging_option_response
(** Create a {!type-delete_application_cloud_watch_logging_option_response} type *)

val make_delete_application_cloud_watch_logging_option_request :
  cloud_watch_logging_option_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> delete_application_cloud_watch_logging_option_request
(** Create a {!type-delete_application_cloud_watch_logging_option_request} type *)

val make_delete_application_response : unit
-> delete_application_response
(** Create a {!type-delete_application_response} type *)

val make_delete_application_request :
  create_timestamp:float -> application_name:string -> unit
-> delete_application_request
(** Create a {!type-delete_application_request} type *)

val make_create_application_response :
  application_summary:application_summary -> unit
-> create_application_response
(** Create a {!type-create_application_response} type *)

val make_input :
  ?input_parallelism:input_parallelism ->
  ?kinesis_firehose_input:kinesis_firehose_input ->
  ?kinesis_streams_input:kinesis_streams_input ->
  ?input_processing_configuration:input_processing_configuration ->
  input_schema:source_schema ->
  name_prefix:string ->
  unit
-> input
(** Create a {!type-input} type *)

val make_cloud_watch_logging_option :
  role_ar_n:string -> log_stream_ar_n:string -> unit
-> cloud_watch_logging_option
(** Create a {!type-cloud_watch_logging_option} type *)

val make_create_application_request :
  ?tags:tag list ->
  ?application_code:string ->
  ?cloud_watch_logging_options:cloud_watch_logging_option list ->
  ?outputs:output list ->
  ?inputs:input list ->
  ?application_description:string ->
  application_name:string ->
  unit
-> create_application_request
(** Create a {!type-create_application_request} type *)

val make_add_application_reference_data_source_response : unit
-> add_application_reference_data_source_response
(** Create a {!type-add_application_reference_data_source_response} type *)

val make_add_application_reference_data_source_request :
  reference_data_source:reference_data_source ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_reference_data_source_request
(** Create a {!type-add_application_reference_data_source_request} type *)

val make_add_application_output_response : unit
-> add_application_output_response
(** Create a {!type-add_application_output_response} type *)

val make_add_application_output_request :
  output:output ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_output_request
(** Create a {!type-add_application_output_request} type *)

val make_add_application_input_processing_configuration_response : unit
-> add_application_input_processing_configuration_response
(** Create a {!type-add_application_input_processing_configuration_response} type *)

val make_add_application_input_processing_configuration_request :
  input_processing_configuration:input_processing_configuration ->
  input_id:string ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_input_processing_configuration_request
(** Create a {!type-add_application_input_processing_configuration_request} type *)

val make_add_application_input_response : unit
-> add_application_input_response
(** Create a {!type-add_application_input_response} type *)

val make_add_application_input_request :
  input:input ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_input_request
(** Create a {!type-add_application_input_request} type *)

val make_add_application_cloud_watch_logging_option_response : unit
-> add_application_cloud_watch_logging_option_response
(** Create a {!type-add_application_cloud_watch_logging_option_response} type *)

val make_add_application_cloud_watch_logging_option_request :
  cloud_watch_logging_option:cloud_watch_logging_option ->
  current_application_version_id:int ->
  application_name:string ->
  unit
-> add_application_cloud_watch_logging_option_request
(** Create a {!type-add_application_cloud_watch_logging_option_request} type *)

