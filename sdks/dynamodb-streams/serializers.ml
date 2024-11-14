open Smaws_Lib.Json.SerializeHelpers

open Types

let error_message_to_yojson = string_to_yojson

let trimmed_data_access_exception_to_yojson = 
  fun (x: trimmed_data_access_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let table_name_to_yojson = string_to_yojson

let string_attribute_value_to_yojson = string_to_yojson

let string_set_attribute_value_to_yojson = 
  fun tree -> list_to_yojson string_attribute_value_to_yojson tree

let string__to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let stream_view_type_to_yojson = 
  fun (x: stream_view_type) -> match x with 
 
| KEYS_ONLY -> `String "KEYS_ONLY"
  | NEW_AND_OLD_IMAGES -> `String "NEW_AND_OLD_IMAGES"
  | OLD_IMAGE -> `String "OLD_IMAGE"
  | NEW_IMAGE -> `String "NEW_IMAGE"
   

let stream_status_to_yojson = 
  fun (x: stream_status) -> match x with 
 
| DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"
   

let date_to_yojson = timestamp_to_yojson

let number_attribute_value_to_yojson = string_to_yojson

let binary_attribute_value_to_yojson = blob_to_yojson

let number_set_attribute_value_to_yojson = 
  fun tree -> list_to_yojson number_attribute_value_to_yojson tree

let binary_set_attribute_value_to_yojson = 
  fun tree -> list_to_yojson binary_attribute_value_to_yojson tree

let attribute_name_to_yojson = string_to_yojson

let null_attribute_value_to_yojson = bool_to_yojson

let boolean_attribute_value_to_yojson = bool_to_yojson

let rec attribute_value_to_yojson = 
  fun (x: attribute_value) -> 
  match x with 
    | BOOL(arg) -> assoc_to_yojson ["BOOL", Some (boolean_attribute_value_to_yojson arg)]
      | NULL(arg) -> assoc_to_yojson ["NULL", Some (null_attribute_value_to_yojson arg)]
      | L(arg) -> assoc_to_yojson ["L", Some (list_attribute_value_to_yojson arg)]
      | M(arg) -> assoc_to_yojson ["M", Some (map_attribute_value_to_yojson arg)]
      | BS(arg) -> assoc_to_yojson ["BS", Some (binary_set_attribute_value_to_yojson arg)]
      | NS(arg) -> assoc_to_yojson ["NS", Some (number_set_attribute_value_to_yojson arg)]
      | SS(arg) -> assoc_to_yojson ["SS", Some (string_set_attribute_value_to_yojson arg)]
      | B(arg) -> assoc_to_yojson ["B", Some (binary_attribute_value_to_yojson arg)]
      | N(arg) -> assoc_to_yojson ["N", Some (number_attribute_value_to_yojson arg)]
      | S(arg) -> assoc_to_yojson ["S", Some (string_attribute_value_to_yojson arg)]
      
      
    

and list_attribute_value_to_yojson = 
  fun tree -> list_to_yojson attribute_value_to_yojson tree

and map_attribute_value_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let attribute_map_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let sequence_number_to_yojson = string_to_yojson

let positive_long_object_to_yojson = long_to_yojson

let stream_record_to_yojson = 
  fun (x: stream_record) -> assoc_to_yojson(
    [(
         "StreamViewType",
         (option_to_yojson stream_view_type_to_yojson x.stream_view_type));
       (
         "SizeBytes",
         (option_to_yojson positive_long_object_to_yojson x.size_bytes));
       (
         "SequenceNumber",
         (option_to_yojson sequence_number_to_yojson x.sequence_number));
       (
         "OldImage",
         (option_to_yojson attribute_map_to_yojson x.old_image));
       (
         "NewImage",
         (option_to_yojson attribute_map_to_yojson x.new_image));
       (
         "Keys",
         (option_to_yojson attribute_map_to_yojson x.keys));
       (
         "ApproximateCreationDateTime",
         (option_to_yojson date_to_yojson x.approximate_creation_date_time));
       
  ])

let stream_arn_to_yojson = string_to_yojson

let stream_to_yojson = 
  fun (x: stream) -> assoc_to_yojson(
    [(
         "StreamLabel",
         (option_to_yojson string__to_yojson x.stream_label));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       (
         "StreamArn",
         (option_to_yojson stream_arn_to_yojson x.stream_arn));
       
  ])

let stream_list_to_yojson = 
  fun tree -> list_to_yojson stream_to_yojson tree

let key_schema_attribute_name_to_yojson = string_to_yojson

let key_type_to_yojson = 
  fun (x: key_type) -> match x with 
  | RANGE -> `String "RANGE"
    | HASH -> `String "HASH"
     

let key_schema_element_to_yojson = 
  fun (x: key_schema_element) -> assoc_to_yojson(
    [(
         "KeyType",
         (Some (key_type_to_yojson x.key_type)));
       (
         "AttributeName",
         (Some (key_schema_attribute_name_to_yojson x.attribute_name)));
       
  ])

let key_schema_to_yojson = 
  fun tree -> list_to_yojson key_schema_element_to_yojson tree

let shard_id_to_yojson = string_to_yojson

let sequence_number_range_to_yojson = 
  fun (x: sequence_number_range) -> assoc_to_yojson(
    [(
         "EndingSequenceNumber",
         (option_to_yojson sequence_number_to_yojson x.ending_sequence_number));
       (
         "StartingSequenceNumber",
         (option_to_yojson sequence_number_to_yojson x.starting_sequence_number));
       
  ])

let shard_to_yojson = 
  fun (x: shard) -> assoc_to_yojson(
    [(
         "ParentShardId",
         (option_to_yojson shard_id_to_yojson x.parent_shard_id));
       (
         "SequenceNumberRange",
         (option_to_yojson sequence_number_range_to_yojson x.sequence_number_range));
       (
         "ShardId",
         (option_to_yojson shard_id_to_yojson x.shard_id));
       
  ])

let shard_description_list_to_yojson = 
  fun tree -> list_to_yojson shard_to_yojson tree

let stream_description_to_yojson = 
  fun (x: stream_description) -> assoc_to_yojson(
    [(
         "LastEvaluatedShardId",
         (option_to_yojson shard_id_to_yojson x.last_evaluated_shard_id));
       (
         "Shards",
         (option_to_yojson shard_description_list_to_yojson x.shards));
       (
         "KeySchema",
         (option_to_yojson key_schema_to_yojson x.key_schema));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       (
         "CreationRequestDateTime",
         (option_to_yojson date_to_yojson x.creation_request_date_time));
       (
         "StreamViewType",
         (option_to_yojson stream_view_type_to_yojson x.stream_view_type));
       (
         "StreamStatus",
         (option_to_yojson stream_status_to_yojson x.stream_status));
       (
         "StreamLabel",
         (option_to_yojson string__to_yojson x.stream_label));
       (
         "StreamArn",
         (option_to_yojson stream_arn_to_yojson x.stream_arn));
       
  ])

let shard_iterator_type_to_yojson = 
  fun (x: shard_iterator_type) -> match x with 
 
| AFTER_SEQUENCE_NUMBER -> `String "AFTER_SEQUENCE_NUMBER"
  | AT_SEQUENCE_NUMBER -> `String "AT_SEQUENCE_NUMBER"
  | LATEST -> `String "LATEST"
  | TRIM_HORIZON -> `String "TRIM_HORIZON"
   

let shard_iterator_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let operation_type_to_yojson = 
  fun (x: operation_type) -> match x with 
 
| REMOVE -> `String "REMOVE"
  | MODIFY -> `String "MODIFY"
  | INSERT -> `String "INSERT"
   

let identity_to_yojson = 
  fun (x: identity) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson string__to_yojson x.type_));
       (
         "PrincipalId",
         (option_to_yojson string__to_yojson x.principal_id));
       
  ])

let record_to_yojson = 
  fun (x: record) -> assoc_to_yojson(
    [(
         "userIdentity",
         (option_to_yojson identity_to_yojson x.user_identity));
       (
         "dynamodb",
         (option_to_yojson stream_record_to_yojson x.dynamodb));
       (
         "awsRegion",
         (option_to_yojson string__to_yojson x.aws_region));
       (
         "eventSource",
         (option_to_yojson string__to_yojson x.event_source));
       (
         "eventVersion",
         (option_to_yojson string__to_yojson x.event_version));
       (
         "eventName",
         (option_to_yojson operation_type_to_yojson x.event_name));
       (
         "eventID",
         (option_to_yojson string__to_yojson x.event_i_d));
       
  ])

let record_list_to_yojson = 
  fun tree -> list_to_yojson record_to_yojson tree

let positive_integer_object_to_yojson = int_to_yojson

let list_streams_output_to_yojson = 
  fun (x: list_streams_output) -> assoc_to_yojson(
    [(
         "LastEvaluatedStreamArn",
         (option_to_yojson stream_arn_to_yojson x.last_evaluated_stream_arn));
       (
         "Streams",
         (option_to_yojson stream_list_to_yojson x.streams));
       
  ])

let list_streams_input_to_yojson = 
  fun (x: list_streams_input) -> assoc_to_yojson(
    [(
         "ExclusiveStartStreamArn",
         (option_to_yojson stream_arn_to_yojson x.exclusive_start_stream_arn));
       (
         "Limit",
         (option_to_yojson positive_integer_object_to_yojson x.limit));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       
  ])

let internal_server_error_to_yojson = 
  fun (x: internal_server_error) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let get_shard_iterator_output_to_yojson = 
  fun (x: get_shard_iterator_output) -> assoc_to_yojson(
    [(
         "ShardIterator",
         (option_to_yojson shard_iterator_to_yojson x.shard_iterator));
       
  ])

let get_shard_iterator_input_to_yojson = 
  fun (x: get_shard_iterator_input) -> assoc_to_yojson(
    [(
         "SequenceNumber",
         (option_to_yojson sequence_number_to_yojson x.sequence_number));
       (
         "ShardIteratorType",
         (Some (shard_iterator_type_to_yojson x.shard_iterator_type)));
       (
         "ShardId",
         (Some (shard_id_to_yojson x.shard_id)));
       (
         "StreamArn",
         (Some (stream_arn_to_yojson x.stream_arn)));
       
  ])

let get_records_output_to_yojson = 
  fun (x: get_records_output) -> assoc_to_yojson(
    [(
         "NextShardIterator",
         (option_to_yojson shard_iterator_to_yojson x.next_shard_iterator));
       (
         "Records",
         (option_to_yojson record_list_to_yojson x.records));
       
  ])

let get_records_input_to_yojson = 
  fun (x: get_records_input) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson positive_integer_object_to_yojson x.limit));
       (
         "ShardIterator",
         (Some (shard_iterator_to_yojson x.shard_iterator)));
       
  ])

let expired_iterator_exception_to_yojson = 
  fun (x: expired_iterator_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let describe_stream_output_to_yojson = 
  fun (x: describe_stream_output) -> assoc_to_yojson(
    [(
         "StreamDescription",
         (option_to_yojson stream_description_to_yojson x.stream_description));
       
  ])

let describe_stream_input_to_yojson = 
  fun (x: describe_stream_input) -> assoc_to_yojson(
    [(
         "ExclusiveStartShardId",
         (option_to_yojson shard_id_to_yojson x.exclusive_start_shard_id));
       (
         "Limit",
         (option_to_yojson positive_integer_object_to_yojson x.limit));
       (
         "StreamArn",
         (Some (stream_arn_to_yojson x.stream_arn)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

