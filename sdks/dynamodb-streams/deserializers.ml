open Smaws_Lib.Json.DeserializeHelpers

open Types

let error_message_of_yojson = string_of_yojson

let trimmed_data_access_exception_of_yojson = 
  fun tree path : trimmed_data_access_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : trimmed_data_access_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let table_name_of_yojson = string_of_yojson

let string_attribute_value_of_yojson = string_of_yojson

let string_set_attribute_value_of_yojson = 
  fun tree path -> list_of_yojson string_attribute_value_of_yojson tree path 

let string__of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let stream_view_type_of_yojson = 
  fun (tree: t) path : stream_view_type -> match tree with 
    | `String "KEYS_ONLY" -> KEYS_ONLY
    | `String "NEW_AND_OLD_IMAGES" -> NEW_AND_OLD_IMAGES
    | `String "OLD_IMAGE" -> OLD_IMAGE
    | `String "NEW_IMAGE" -> NEW_IMAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamViewType" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamViewType")

let stream_status_of_yojson = 
  fun (tree: t) path : stream_status -> match tree with 
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamStatus")

let date_of_yojson = timestamp_of_yojson

let number_attribute_value_of_yojson = string_of_yojson

let binary_attribute_value_of_yojson = blob_of_yojson

let number_set_attribute_value_of_yojson = 
  fun tree path -> list_of_yojson number_attribute_value_of_yojson tree path 

let binary_set_attribute_value_of_yojson = 
  fun tree path -> list_of_yojson binary_attribute_value_of_yojson tree path 

let attribute_name_of_yojson = string_of_yojson

let null_attribute_value_of_yojson = bool_of_yojson

let boolean_attribute_value_of_yojson = bool_of_yojson

let rec attribute_value_of_yojson = 
  fun (tree: t) path : attribute_value ->
  let _list = assoc_of_yojson tree path in
  let key, value_ = match _list with
    | (key, value_) :: _ -> key, value_ 
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  match key with
    | "BOOL" -> BOOL (boolean_attribute_value_of_yojson value_ (path))
    | "NULL" -> NULL (null_attribute_value_of_yojson value_ (path))
    | "L" -> L (list_attribute_value_of_yojson value_ (path))
    | "M" -> M (map_attribute_value_of_yojson value_ (path))
    | "BS" -> BS (binary_set_attribute_value_of_yojson value_ (path))
    | "NS" -> NS (number_set_attribute_value_of_yojson value_ (path))
    | "SS" -> SS (string_set_attribute_value_of_yojson value_ (path))
    | "B" -> B (binary_attribute_value_of_yojson value_ (path))
    | "N" -> N (number_attribute_value_of_yojson value_ (path))
    | "S" -> S (string_attribute_value_of_yojson value_ (path))
    | _ as unknown -> raise(deserialize_unknown_enum_value_error path
                           "AttributeValue" unknown)
  

and list_attribute_value_of_yojson = 
  fun tree path -> list_of_yojson attribute_value_of_yojson tree path 

and map_attribute_value_of_yojson = 
  fun tree path -> map_of_yojson attribute_value_of_yojson tree path

let attribute_map_of_yojson = 
  fun tree path -> map_of_yojson attribute_value_of_yojson tree path

let sequence_number_of_yojson = string_of_yojson

let positive_long_object_of_yojson = long_of_yojson

let stream_record_of_yojson = 
  fun tree path : stream_record ->
  let _list = assoc_of_yojson tree path in
  let _res : stream_record = {
    stream_view_type = option_of_yojson (value_for_key (stream_view_type_of_yojson) "StreamViewType") _list path;
    size_bytes = option_of_yojson (value_for_key (positive_long_object_of_yojson) "SizeBytes") _list path;
    sequence_number = option_of_yojson (value_for_key (sequence_number_of_yojson) "SequenceNumber") _list path;
    old_image = option_of_yojson (value_for_key (attribute_map_of_yojson) "OldImage") _list path;
    new_image = option_of_yojson (value_for_key (attribute_map_of_yojson) "NewImage") _list path;
    keys = option_of_yojson (value_for_key (attribute_map_of_yojson) "Keys") _list path;
    approximate_creation_date_time = option_of_yojson (value_for_key (date_of_yojson) "ApproximateCreationDateTime") _list path;
    
  }
  in _res

let stream_arn_of_yojson = string_of_yojson

let stream_of_yojson = 
  fun tree path : stream ->
  let _list = assoc_of_yojson tree path in
  let _res : stream = {
    stream_label = option_of_yojson (value_for_key (string__of_yojson) "StreamLabel") _list path;
    table_name = option_of_yojson (value_for_key (table_name_of_yojson) "TableName") _list path;
    stream_arn = option_of_yojson (value_for_key (stream_arn_of_yojson) "StreamArn") _list path;
    
  }
  in _res

let stream_list_of_yojson = 
  fun tree path -> list_of_yojson stream_of_yojson tree path 

let key_schema_attribute_name_of_yojson = string_of_yojson

let key_type_of_yojson = 
  fun (tree: t) path : key_type -> match tree with 
    | `String "RANGE" -> RANGE
    | `String "HASH" -> HASH
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyType")

let key_schema_element_of_yojson = 
  fun tree path : key_schema_element ->
  let _list = assoc_of_yojson tree path in
  let _res : key_schema_element = {
    key_type = value_for_key (key_type_of_yojson) "KeyType" _list path;
    attribute_name = value_for_key (key_schema_attribute_name_of_yojson) "AttributeName" _list path;
    
  }
  in _res

let key_schema_of_yojson = 
  fun tree path -> list_of_yojson key_schema_element_of_yojson tree path 

let shard_id_of_yojson = string_of_yojson

let sequence_number_range_of_yojson = 
  fun tree path : sequence_number_range ->
  let _list = assoc_of_yojson tree path in
  let _res : sequence_number_range = {
    ending_sequence_number = option_of_yojson (value_for_key (sequence_number_of_yojson) "EndingSequenceNumber") _list path;
    starting_sequence_number = option_of_yojson (value_for_key (sequence_number_of_yojson) "StartingSequenceNumber") _list path;
    
  }
  in _res

let shard_of_yojson = 
  fun tree path : shard ->
  let _list = assoc_of_yojson tree path in
  let _res : shard = {
    parent_shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "ParentShardId") _list path;
    sequence_number_range = option_of_yojson (value_for_key (sequence_number_range_of_yojson) "SequenceNumberRange") _list path;
    shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "ShardId") _list path;
    
  }
  in _res

let shard_description_list_of_yojson = 
  fun tree path -> list_of_yojson shard_of_yojson tree path 

let stream_description_of_yojson = 
  fun tree path : stream_description ->
  let _list = assoc_of_yojson tree path in
  let _res : stream_description = {
    last_evaluated_shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "LastEvaluatedShardId") _list path;
    shards = option_of_yojson (value_for_key (shard_description_list_of_yojson) "Shards") _list path;
    key_schema = option_of_yojson (value_for_key (key_schema_of_yojson) "KeySchema") _list path;
    table_name = option_of_yojson (value_for_key (table_name_of_yojson) "TableName") _list path;
    creation_request_date_time = option_of_yojson (value_for_key (date_of_yojson) "CreationRequestDateTime") _list path;
    stream_view_type = option_of_yojson (value_for_key (stream_view_type_of_yojson) "StreamViewType") _list path;
    stream_status = option_of_yojson (value_for_key (stream_status_of_yojson) "StreamStatus") _list path;
    stream_label = option_of_yojson (value_for_key (string__of_yojson) "StreamLabel") _list path;
    stream_arn = option_of_yojson (value_for_key (stream_arn_of_yojson) "StreamArn") _list path;
    
  }
  in _res

let shard_iterator_type_of_yojson = 
  fun (tree: t) path : shard_iterator_type -> match tree with 
    | `String "AFTER_SEQUENCE_NUMBER" -> AFTER_SEQUENCE_NUMBER
    | `String "AT_SEQUENCE_NUMBER" -> AT_SEQUENCE_NUMBER
    | `String "LATEST" -> LATEST
    | `String "TRIM_HORIZON" -> TRIM_HORIZON
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShardIteratorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ShardIteratorType")

let shard_iterator_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let operation_type_of_yojson = 
  fun (tree: t) path : operation_type -> match tree with 
    | `String "REMOVE" -> REMOVE
    | `String "MODIFY" -> MODIFY
    | `String "INSERT" -> INSERT
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationType")

let identity_of_yojson = 
  fun tree path : identity ->
  let _list = assoc_of_yojson tree path in
  let _res : identity = {
    type_ = option_of_yojson (value_for_key (string__of_yojson) "Type") _list path;
    principal_id = option_of_yojson (value_for_key (string__of_yojson) "PrincipalId") _list path;
    
  }
  in _res

let record_of_yojson = 
  fun tree path : record ->
  let _list = assoc_of_yojson tree path in
  let _res : record = {
    user_identity = option_of_yojson (value_for_key (identity_of_yojson) "userIdentity") _list path;
    dynamodb = option_of_yojson (value_for_key (stream_record_of_yojson) "dynamodb") _list path;
    aws_region = option_of_yojson (value_for_key (string__of_yojson) "awsRegion") _list path;
    event_source = option_of_yojson (value_for_key (string__of_yojson) "eventSource") _list path;
    event_version = option_of_yojson (value_for_key (string__of_yojson) "eventVersion") _list path;
    event_name = option_of_yojson (value_for_key (operation_type_of_yojson) "eventName") _list path;
    event_i_d = option_of_yojson (value_for_key (string__of_yojson) "eventID") _list path;
    
  }
  in _res

let record_list_of_yojson = 
  fun tree path -> list_of_yojson record_of_yojson tree path 

let positive_integer_object_of_yojson = int_of_yojson

let list_streams_output_of_yojson = 
  fun tree path : list_streams_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_streams_output = {
    last_evaluated_stream_arn = option_of_yojson (value_for_key (stream_arn_of_yojson) "LastEvaluatedStreamArn") _list path;
    streams = option_of_yojson (value_for_key (stream_list_of_yojson) "Streams") _list path;
    
  }
  in _res

let list_streams_input_of_yojson = 
  fun tree path : list_streams_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_streams_input = {
    exclusive_start_stream_arn = option_of_yojson (value_for_key (stream_arn_of_yojson) "ExclusiveStartStreamArn") _list path;
    limit = option_of_yojson (value_for_key (positive_integer_object_of_yojson) "Limit") _list path;
    table_name = option_of_yojson (value_for_key (table_name_of_yojson) "TableName") _list path;
    
  }
  in _res

let internal_server_error_of_yojson = 
  fun tree path : internal_server_error ->
  let _list = assoc_of_yojson tree path in
  let _res : internal_server_error = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let limit_exceeded_exception_of_yojson = 
  fun tree path : limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let get_shard_iterator_output_of_yojson = 
  fun tree path : get_shard_iterator_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_shard_iterator_output = {
    shard_iterator = option_of_yojson (value_for_key (shard_iterator_of_yojson) "ShardIterator") _list path;
    
  }
  in _res

let get_shard_iterator_input_of_yojson = 
  fun tree path : get_shard_iterator_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_shard_iterator_input = {
    sequence_number = option_of_yojson (value_for_key (sequence_number_of_yojson) "SequenceNumber") _list path;
    shard_iterator_type = value_for_key (shard_iterator_type_of_yojson) "ShardIteratorType" _list path;
    shard_id = value_for_key (shard_id_of_yojson) "ShardId" _list path;
    stream_arn = value_for_key (stream_arn_of_yojson) "StreamArn" _list path;
    
  }
  in _res

let get_records_output_of_yojson = 
  fun tree path : get_records_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_records_output = {
    next_shard_iterator = option_of_yojson (value_for_key (shard_iterator_of_yojson) "NextShardIterator") _list path;
    records = option_of_yojson (value_for_key (record_list_of_yojson) "Records") _list path;
    
  }
  in _res

let get_records_input_of_yojson = 
  fun tree path : get_records_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_records_input = {
    limit = option_of_yojson (value_for_key (positive_integer_object_of_yojson) "Limit") _list path;
    shard_iterator = value_for_key (shard_iterator_of_yojson) "ShardIterator" _list path;
    
  }
  in _res

let expired_iterator_exception_of_yojson = 
  fun tree path : expired_iterator_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : expired_iterator_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let describe_stream_output_of_yojson = 
  fun tree path : describe_stream_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_stream_output = {
    stream_description = option_of_yojson (value_for_key (stream_description_of_yojson) "StreamDescription") _list path;
    
  }
  in _res

let describe_stream_input_of_yojson = 
  fun tree path : describe_stream_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_stream_input = {
    exclusive_start_shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "ExclusiveStartShardId") _list path;
    limit = option_of_yojson (value_for_key (positive_integer_object_of_yojson) "Limit") _list path;
    stream_arn = value_for_key (stream_arn_of_yojson) "StreamArn" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

