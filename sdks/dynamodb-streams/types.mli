open Smaws_Lib
val service : Service.descriptor

type trimmed_data_access_exception = {
  message: string option
}

type stream_view_type = | KEYS_ONLY
  | NEW_AND_OLD_IMAGES
  | OLD_IMAGE
  | NEW_IMAGE

type stream_status = | DISABLED
  | DISABLING
  | ENABLED
  | ENABLING

type attribute_value = BOOL of bool | NULL of bool | L of attribute_value list | M of (string * attribute_value) list | BS of bytes list | NS of string list | SS of string list | B of bytes | N of string | S of string

type stream_record = {
  stream_view_type: stream_view_type option;
  size_bytes: int option;
  sequence_number: string option;
  old_image: (string * attribute_value) list option;
  new_image: (string * attribute_value) list option;
  keys: (string * attribute_value) list option;
  approximate_creation_date_time: float option
}

type stream = {
  stream_label: string option;
  table_name: string option;
  stream_arn: string option
}

type key_type = | RANGE
  | HASH

type key_schema_element = {
  key_type: key_type;
  attribute_name: string
}

type sequence_number_range = {
  ending_sequence_number: string option;
  starting_sequence_number: string option
}

type shard = {
  parent_shard_id: string option;
  sequence_number_range: sequence_number_range option;
  shard_id: string option
}

type stream_description = {
  last_evaluated_shard_id: string option;
  shards: shard list option;
  key_schema: key_schema_element list option;
  table_name: string option;
  creation_request_date_time: float option;
  stream_view_type: stream_view_type option;
  stream_status: stream_status option;
  stream_label: string option;
  stream_arn: string option
}

type shard_iterator_type = | AFTER_SEQUENCE_NUMBER
  | AT_SEQUENCE_NUMBER
  | LATEST
  | TRIM_HORIZON

type resource_not_found_exception = {
  message: string option
}

type operation_type = | REMOVE
  | MODIFY
  | INSERT

type identity = {
  type_: string option;
  principal_id: string option
}

type record = {
  user_identity: identity option;
  dynamodb: stream_record option;
  aws_region: string option;
  event_source: string option;
  event_version: string option;
  event_name: operation_type option;
  event_i_d: string option
}

type list_streams_output = {
  last_evaluated_stream_arn: string option;
  streams: stream list option
}

type list_streams_input = {
  exclusive_start_stream_arn: string option;
  limit: int option;
  table_name: string option
}

type internal_server_error = {
  message: string option
}

type limit_exceeded_exception = {
  message: string option
}

type get_shard_iterator_output = {
  shard_iterator: string option
}

type get_shard_iterator_input = {
  sequence_number: string option;
  shard_iterator_type: shard_iterator_type;
  shard_id: string;
  stream_arn: string
}

type get_records_output = {
  next_shard_iterator: string option;
  records: record list option
}

type get_records_input = {
  limit: int option;
  shard_iterator: string
}

type expired_iterator_exception = {
  message: string option
}

type describe_stream_output = {
  stream_description: stream_description option
}

type describe_stream_input = {
  exclusive_start_shard_id: string option;
  limit: int option;
  stream_arn: string
}



type base_document = Json.t

