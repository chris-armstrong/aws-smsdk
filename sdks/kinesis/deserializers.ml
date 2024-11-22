open Smaws_Lib.Json.DeserializeHelpers

open Types

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson = 
  fun tree path : validation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : validation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let stream_ar_n_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let stream_mode_of_yojson = 
  fun (tree: t) path : stream_mode -> match tree with 
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String "PROVISIONED" -> PROVISIONED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamMode" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamMode")

let stream_mode_details_of_yojson = 
  fun tree path : stream_mode_details ->
  let _list = assoc_of_yojson tree path in
  let _res : stream_mode_details = {
    stream_mode = value_for_key (stream_mode_of_yojson) "StreamMode" _list path;
    
  }
  in _res

let update_stream_mode_input_of_yojson = 
  fun tree path : update_stream_mode_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_stream_mode_input = {
    stream_mode_details = value_for_key (stream_mode_details_of_yojson) "StreamModeDetails" _list path;
    stream_ar_n = value_for_key (stream_ar_n_of_yojson) "StreamARN" _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let resource_in_use_exception_of_yojson = 
  fun tree path : resource_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_in_use_exception = {
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

let invalid_argument_exception_of_yojson = 
  fun tree path : invalid_argument_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_argument_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let stream_name_of_yojson = string_of_yojson

let positive_integer_object_of_yojson = int_of_yojson

let update_shard_count_output_of_yojson = 
  fun tree path : update_shard_count_output ->
  let _list = assoc_of_yojson tree path in
  let _res : update_shard_count_output = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    target_shard_count = option_of_yojson (value_for_key (positive_integer_object_of_yojson) "TargetShardCount") _list path;
    current_shard_count = option_of_yojson (value_for_key (positive_integer_object_of_yojson) "CurrentShardCount") _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let scaling_type_of_yojson = 
  fun (tree: t) path : scaling_type -> match tree with 
    | `String "UNIFORM_SCALING" -> UNIFORM_SCALING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalingType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingType")

let update_shard_count_input_of_yojson = 
  fun tree path : update_shard_count_input ->
  let _list = assoc_of_yojson tree path in
  let _res : update_shard_count_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    scaling_type = value_for_key (scaling_type_of_yojson) "ScalingType" _list path;
    target_shard_count = value_for_key (positive_integer_object_of_yojson) "TargetShardCount" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let access_denied_exception_of_yojson = 
  fun tree path : access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : access_denied_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let timestamp__of_yojson = timestamp_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_map_of_yojson = 
  fun tree path -> map_of_yojson tag_value_of_yojson tree path

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = option_of_yojson (value_for_key (tag_value_of_yojson) "Value") _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let sequence_number_of_yojson = string_of_yojson

let data_of_yojson = blob_of_yojson

let partition_key_of_yojson = string_of_yojson

let encryption_type_of_yojson = 
  fun (tree: t) path : encryption_type -> match tree with 
    | `String "KMS" -> KMS
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionType")

let record_of_yojson = 
  fun tree path : record ->
  let _list = assoc_of_yojson tree path in
  let _res : record = {
    encryption_type = option_of_yojson (value_for_key (encryption_type_of_yojson) "EncryptionType") _list path;
    partition_key = value_for_key (partition_key_of_yojson) "PartitionKey" _list path;
    data = value_for_key (data_of_yojson) "Data" _list path;
    approximate_arrival_timestamp = option_of_yojson (value_for_key (timestamp__of_yojson) "ApproximateArrivalTimestamp") _list path;
    sequence_number = value_for_key (sequence_number_of_yojson) "SequenceNumber" _list path;
    
  }
  in _res

let record_list_of_yojson = 
  fun tree path -> list_of_yojson record_of_yojson tree path 

let millis_behind_latest_of_yojson = long_of_yojson

let shard_id_of_yojson = string_of_yojson

let shard_id_list_of_yojson = 
  fun tree path -> list_of_yojson shard_id_of_yojson tree path 

let hash_key_of_yojson = string_of_yojson

let hash_key_range_of_yojson = 
  fun tree path : hash_key_range ->
  let _list = assoc_of_yojson tree path in
  let _res : hash_key_range = {
    ending_hash_key = value_for_key (hash_key_of_yojson) "EndingHashKey" _list path;
    starting_hash_key = value_for_key (hash_key_of_yojson) "StartingHashKey" _list path;
    
  }
  in _res

let child_shard_of_yojson = 
  fun tree path : child_shard ->
  let _list = assoc_of_yojson tree path in
  let _res : child_shard = {
    hash_key_range = value_for_key (hash_key_range_of_yojson) "HashKeyRange" _list path;
    parent_shards = value_for_key (shard_id_list_of_yojson) "ParentShards" _list path;
    shard_id = value_for_key (shard_id_of_yojson) "ShardId" _list path;
    
  }
  in _res

let child_shard_list_of_yojson = 
  fun tree path -> list_of_yojson child_shard_of_yojson tree path 

let subscribe_to_shard_event_of_yojson = 
  fun tree path : subscribe_to_shard_event ->
  let _list = assoc_of_yojson tree path in
  let _res : subscribe_to_shard_event = {
    child_shards = option_of_yojson (value_for_key (child_shard_list_of_yojson) "ChildShards") _list path;
    millis_behind_latest = value_for_key (millis_behind_latest_of_yojson) "MillisBehindLatest" _list path;
    continuation_sequence_number = value_for_key (sequence_number_of_yojson) "ContinuationSequenceNumber" _list path;
    records = value_for_key (record_list_of_yojson) "Records" _list path;
    
  }
  in _res

let kms_disabled_exception_of_yojson = 
  fun tree path : kms_disabled_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_disabled_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let kms_invalid_state_exception_of_yojson = 
  fun tree path : kms_invalid_state_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_invalid_state_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let kms_access_denied_exception_of_yojson = 
  fun tree path : kms_access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_access_denied_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let kms_not_found_exception_of_yojson = 
  fun tree path : kms_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let kms_opt_in_required_of_yojson = 
  fun tree path : kms_opt_in_required ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_opt_in_required = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let kms_throttling_exception_of_yojson = 
  fun tree path : kms_throttling_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_throttling_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let internal_failure_exception_of_yojson = 
  fun tree path : internal_failure_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : internal_failure_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let subscribe_to_shard_event_stream_of_yojson = 
  fun (tree: t) path : subscribe_to_shard_event_stream ->
  let _list = assoc_of_yojson tree path in
  let key, value_ = match _list with
    | (key, value_) :: _ -> key, value_ 
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  match key with
    | "InternalFailureException" -> InternalFailureException (internal_failure_exception_of_yojson value_ (path))
    | "KMSThrottlingException" -> KMSThrottlingException (kms_throttling_exception_of_yojson value_ (path))
    | "KMSOptInRequired" -> KMSOptInRequired (kms_opt_in_required_of_yojson value_ (path))
    | "KMSNotFoundException" -> KMSNotFoundException (kms_not_found_exception_of_yojson value_ (path))
    | "KMSAccessDeniedException" -> KMSAccessDeniedException (kms_access_denied_exception_of_yojson value_ (path))
    | "KMSInvalidStateException" -> KMSInvalidStateException (kms_invalid_state_exception_of_yojson value_ (path))
    | "KMSDisabledException" -> KMSDisabledException (kms_disabled_exception_of_yojson value_ (path))
    | "ResourceInUseException" -> ResourceInUseException (resource_in_use_exception_of_yojson value_ (path))
    | "ResourceNotFoundException" -> ResourceNotFoundException (resource_not_found_exception_of_yojson value_ (path))
    | "SubscribeToShardEvent" -> SubscribeToShardEvent (subscribe_to_shard_event_of_yojson value_ (path))
    | _ as unknown -> raise(deserialize_unknown_enum_value_error path
                           "SubscribeToShardEventStream" unknown)
  

let subscribe_to_shard_output_of_yojson = 
  fun tree path : subscribe_to_shard_output ->
  let _list = assoc_of_yojson tree path in
  let _res : subscribe_to_shard_output = {
    event_stream = value_for_key (subscribe_to_shard_event_stream_of_yojson) "EventStream" _list path;
    
  }
  in _res

let consumer_ar_n_of_yojson = string_of_yojson

let shard_iterator_type_of_yojson = 
  fun (tree: t) path : shard_iterator_type -> match tree with 
    | `String "AT_TIMESTAMP" -> AT_TIMESTAMP
    | `String "LATEST" -> LATEST
    | `String "TRIM_HORIZON" -> TRIM_HORIZON
    | `String "AFTER_SEQUENCE_NUMBER" -> AFTER_SEQUENCE_NUMBER
    | `String "AT_SEQUENCE_NUMBER" -> AT_SEQUENCE_NUMBER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShardIteratorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ShardIteratorType")

let starting_position_of_yojson = 
  fun tree path : starting_position ->
  let _list = assoc_of_yojson tree path in
  let _res : starting_position = {
    timestamp_ = option_of_yojson (value_for_key (timestamp__of_yojson) "Timestamp") _list path;
    sequence_number = option_of_yojson (value_for_key (sequence_number_of_yojson) "SequenceNumber") _list path;
    type_ = value_for_key (shard_iterator_type_of_yojson) "Type" _list path;
    
  }
  in _res

let subscribe_to_shard_input_of_yojson = 
  fun tree path : subscribe_to_shard_input ->
  let _list = assoc_of_yojson tree path in
  let _res : subscribe_to_shard_input = {
    starting_position = value_for_key (starting_position_of_yojson) "StartingPosition" _list path;
    shard_id = value_for_key (shard_id_of_yojson) "ShardId" _list path;
    consumer_ar_n = value_for_key (consumer_ar_n_of_yojson) "ConsumerARN" _list path;
    
  }
  in _res

let stream_status_of_yojson = 
  fun (tree: t) path : stream_status -> match tree with 
    | `String "UPDATING" -> UPDATING
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamStatus")

let stream_summary_of_yojson = 
  fun tree path : stream_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : stream_summary = {
    stream_creation_timestamp = option_of_yojson (value_for_key (timestamp__of_yojson) "StreamCreationTimestamp") _list path;
    stream_mode_details = option_of_yojson (value_for_key (stream_mode_details_of_yojson) "StreamModeDetails") _list path;
    stream_status = value_for_key (stream_status_of_yojson) "StreamStatus" _list path;
    stream_ar_n = value_for_key (stream_ar_n_of_yojson) "StreamARN" _list path;
    stream_name = value_for_key (stream_name_of_yojson) "StreamName" _list path;
    
  }
  in _res

let stream_summary_list_of_yojson = 
  fun tree path -> list_of_yojson stream_summary_of_yojson tree path 

let stream_name_list_of_yojson = 
  fun tree path -> list_of_yojson stream_name_of_yojson tree path 

let retention_period_hours_of_yojson = int_of_yojson

let metrics_name_of_yojson = 
  fun (tree: t) path : metrics_name -> match tree with 
    | `String "ALL" -> ALL
    | `String "IteratorAgeMilliseconds" -> ITERATOR_AGE_MILLISECONDS
    | `String "ReadProvisionedThroughputExceeded" -> READ_PROVISIONED_THROUGHPUT_EXCEEDED
    | `String "WriteProvisionedThroughputExceeded" -> WRITE_PROVISIONED_THROUGHPUT_EXCEEDED
    | `String "OutgoingRecords" -> OUTGOING_RECORDS
    | `String "OutgoingBytes" -> OUTGOING_BYTES
    | `String "IncomingRecords" -> INCOMING_RECORDS
    | `String "IncomingBytes" -> INCOMING_BYTES
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricsName" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricsName")

let metrics_name_list_of_yojson = 
  fun tree path -> list_of_yojson metrics_name_of_yojson tree path 

let enhanced_metrics_of_yojson = 
  fun tree path : enhanced_metrics ->
  let _list = assoc_of_yojson tree path in
  let _res : enhanced_metrics = {
    shard_level_metrics = option_of_yojson (value_for_key (metrics_name_list_of_yojson) "ShardLevelMetrics") _list path;
    
  }
  in _res

let enhanced_monitoring_list_of_yojson = 
  fun tree path -> list_of_yojson enhanced_metrics_of_yojson tree path 

let key_id_of_yojson = string_of_yojson

let shard_count_object_of_yojson = int_of_yojson

let consumer_count_object_of_yojson = int_of_yojson

let stream_description_summary_of_yojson = 
  fun tree path : stream_description_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : stream_description_summary = {
    consumer_count = option_of_yojson (value_for_key (consumer_count_object_of_yojson) "ConsumerCount") _list path;
    open_shard_count = value_for_key (shard_count_object_of_yojson) "OpenShardCount" _list path;
    key_id = option_of_yojson (value_for_key (key_id_of_yojson) "KeyId") _list path;
    encryption_type = option_of_yojson (value_for_key (encryption_type_of_yojson) "EncryptionType") _list path;
    enhanced_monitoring = value_for_key (enhanced_monitoring_list_of_yojson) "EnhancedMonitoring" _list path;
    stream_creation_timestamp = value_for_key (timestamp__of_yojson) "StreamCreationTimestamp" _list path;
    retention_period_hours = value_for_key (retention_period_hours_of_yojson) "RetentionPeriodHours" _list path;
    stream_mode_details = option_of_yojson (value_for_key (stream_mode_details_of_yojson) "StreamModeDetails") _list path;
    stream_status = value_for_key (stream_status_of_yojson) "StreamStatus" _list path;
    stream_ar_n = value_for_key (stream_ar_n_of_yojson) "StreamARN" _list path;
    stream_name = value_for_key (stream_name_of_yojson) "StreamName" _list path;
    
  }
  in _res

let sequence_number_range_of_yojson = 
  fun tree path : sequence_number_range ->
  let _list = assoc_of_yojson tree path in
  let _res : sequence_number_range = {
    ending_sequence_number = option_of_yojson (value_for_key (sequence_number_of_yojson) "EndingSequenceNumber") _list path;
    starting_sequence_number = value_for_key (sequence_number_of_yojson) "StartingSequenceNumber" _list path;
    
  }
  in _res

let shard_of_yojson = 
  fun tree path : shard ->
  let _list = assoc_of_yojson tree path in
  let _res : shard = {
    sequence_number_range = value_for_key (sequence_number_range_of_yojson) "SequenceNumberRange" _list path;
    hash_key_range = value_for_key (hash_key_range_of_yojson) "HashKeyRange" _list path;
    adjacent_parent_shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "AdjacentParentShardId") _list path;
    parent_shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "ParentShardId") _list path;
    shard_id = value_for_key (shard_id_of_yojson) "ShardId" _list path;
    
  }
  in _res

let shard_list_of_yojson = 
  fun tree path -> list_of_yojson shard_of_yojson tree path 

let boolean_object_of_yojson = bool_of_yojson

let stream_description_of_yojson = 
  fun tree path : stream_description ->
  let _list = assoc_of_yojson tree path in
  let _res : stream_description = {
    key_id = option_of_yojson (value_for_key (key_id_of_yojson) "KeyId") _list path;
    encryption_type = option_of_yojson (value_for_key (encryption_type_of_yojson) "EncryptionType") _list path;
    enhanced_monitoring = value_for_key (enhanced_monitoring_list_of_yojson) "EnhancedMonitoring" _list path;
    stream_creation_timestamp = value_for_key (timestamp__of_yojson) "StreamCreationTimestamp" _list path;
    retention_period_hours = value_for_key (retention_period_hours_of_yojson) "RetentionPeriodHours" _list path;
    has_more_shards = value_for_key (boolean_object_of_yojson) "HasMoreShards" _list path;
    shards = value_for_key (shard_list_of_yojson) "Shards" _list path;
    stream_mode_details = option_of_yojson (value_for_key (stream_mode_details_of_yojson) "StreamModeDetails") _list path;
    stream_status = value_for_key (stream_status_of_yojson) "StreamStatus" _list path;
    stream_ar_n = value_for_key (stream_ar_n_of_yojson) "StreamARN" _list path;
    stream_name = value_for_key (stream_name_of_yojson) "StreamName" _list path;
    
  }
  in _res

let stop_stream_encryption_input_of_yojson = 
  fun tree path : stop_stream_encryption_input ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_stream_encryption_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    key_id = value_for_key (key_id_of_yojson) "KeyId" _list path;
    encryption_type = value_for_key (encryption_type_of_yojson) "EncryptionType" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let start_stream_encryption_input_of_yojson = 
  fun tree path : start_stream_encryption_input ->
  let _list = assoc_of_yojson tree path in
  let _res : start_stream_encryption_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    key_id = value_for_key (key_id_of_yojson) "KeyId" _list path;
    encryption_type = value_for_key (encryption_type_of_yojson) "EncryptionType" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let split_shard_input_of_yojson = 
  fun tree path : split_shard_input ->
  let _list = assoc_of_yojson tree path in
  let _res : split_shard_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    new_starting_hash_key = value_for_key (hash_key_of_yojson) "NewStartingHashKey" _list path;
    shard_to_split = value_for_key (shard_id_of_yojson) "ShardToSplit" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let shard_iterator_of_yojson = string_of_yojson

let shard_filter_type_of_yojson = 
  fun (tree: t) path : shard_filter_type -> match tree with 
    | `String "FROM_TIMESTAMP" -> FROM_TIMESTAMP
    | `String "AT_TIMESTAMP" -> AT_TIMESTAMP
    | `String "AT_LATEST" -> AT_LATEST
    | `String "FROM_TRIM_HORIZON" -> FROM_TRIM_HORIZON
    | `String "AT_TRIM_HORIZON" -> AT_TRIM_HORIZON
    | `String "AFTER_SHARD_ID" -> AFTER_SHARD_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShardFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "ShardFilterType")

let shard_filter_of_yojson = 
  fun tree path : shard_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : shard_filter = {
    timestamp_ = option_of_yojson (value_for_key (timestamp__of_yojson) "Timestamp") _list path;
    shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "ShardId") _list path;
    type_ = value_for_key (shard_filter_type_of_yojson) "Type" _list path;
    
  }
  in _res

let resource_ar_n_of_yojson = string_of_yojson

let remove_tags_from_stream_input_of_yojson = 
  fun tree path : remove_tags_from_stream_input ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_tags_from_stream_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    tag_keys = value_for_key (tag_key_list_of_yojson) "TagKeys" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let consumer_name_of_yojson = string_of_yojson

let consumer_status_of_yojson = 
  fun (tree: t) path : consumer_status -> match tree with 
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConsumerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConsumerStatus")

let consumer_of_yojson = 
  fun tree path : consumer ->
  let _list = assoc_of_yojson tree path in
  let _res : consumer = {
    consumer_creation_timestamp = value_for_key (timestamp__of_yojson) "ConsumerCreationTimestamp" _list path;
    consumer_status = value_for_key (consumer_status_of_yojson) "ConsumerStatus" _list path;
    consumer_ar_n = value_for_key (consumer_ar_n_of_yojson) "ConsumerARN" _list path;
    consumer_name = value_for_key (consumer_name_of_yojson) "ConsumerName" _list path;
    
  }
  in _res

let register_stream_consumer_output_of_yojson = 
  fun tree path : register_stream_consumer_output ->
  let _list = assoc_of_yojson tree path in
  let _res : register_stream_consumer_output = {
    consumer = value_for_key (consumer_of_yojson) "Consumer" _list path;
    
  }
  in _res

let register_stream_consumer_input_of_yojson = 
  fun tree path : register_stream_consumer_input ->
  let _list = assoc_of_yojson tree path in
  let _res : register_stream_consumer_input = {
    consumer_name = value_for_key (consumer_name_of_yojson) "ConsumerName" _list path;
    stream_ar_n = value_for_key (stream_ar_n_of_yojson) "StreamARN" _list path;
    
  }
  in _res

let policy_of_yojson = string_of_yojson

let put_resource_policy_input_of_yojson = 
  fun tree path : put_resource_policy_input ->
  let _list = assoc_of_yojson tree path in
  let _res : put_resource_policy_input = {
    policy = value_for_key (policy_of_yojson) "Policy" _list path;
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let error_code_of_yojson = string_of_yojson

let put_records_result_entry_of_yojson = 
  fun tree path : put_records_result_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : put_records_result_entry = {
    error_message = option_of_yojson (value_for_key (error_message_of_yojson) "ErrorMessage") _list path;
    error_code = option_of_yojson (value_for_key (error_code_of_yojson) "ErrorCode") _list path;
    shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "ShardId") _list path;
    sequence_number = option_of_yojson (value_for_key (sequence_number_of_yojson) "SequenceNumber") _list path;
    
  }
  in _res

let put_records_result_entry_list_of_yojson = 
  fun tree path -> list_of_yojson put_records_result_entry_of_yojson tree path 

let put_records_request_entry_of_yojson = 
  fun tree path : put_records_request_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : put_records_request_entry = {
    partition_key = value_for_key (partition_key_of_yojson) "PartitionKey" _list path;
    explicit_hash_key = option_of_yojson (value_for_key (hash_key_of_yojson) "ExplicitHashKey") _list path;
    data = value_for_key (data_of_yojson) "Data" _list path;
    
  }
  in _res

let put_records_request_entry_list_of_yojson = 
  fun tree path -> list_of_yojson put_records_request_entry_of_yojson tree path 

let put_records_output_of_yojson = 
  fun tree path : put_records_output ->
  let _list = assoc_of_yojson tree path in
  let _res : put_records_output = {
    encryption_type = option_of_yojson (value_for_key (encryption_type_of_yojson) "EncryptionType") _list path;
    records = value_for_key (put_records_result_entry_list_of_yojson) "Records" _list path;
    failed_record_count = option_of_yojson (value_for_key (positive_integer_object_of_yojson) "FailedRecordCount") _list path;
    
  }
  in _res

let put_records_input_of_yojson = 
  fun tree path : put_records_input ->
  let _list = assoc_of_yojson tree path in
  let _res : put_records_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    records = value_for_key (put_records_request_entry_list_of_yojson) "Records" _list path;
    
  }
  in _res

let provisioned_throughput_exceeded_exception_of_yojson = 
  fun tree path : provisioned_throughput_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : provisioned_throughput_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let put_record_output_of_yojson = 
  fun tree path : put_record_output ->
  let _list = assoc_of_yojson tree path in
  let _res : put_record_output = {
    encryption_type = option_of_yojson (value_for_key (encryption_type_of_yojson) "EncryptionType") _list path;
    sequence_number = value_for_key (sequence_number_of_yojson) "SequenceNumber" _list path;
    shard_id = value_for_key (shard_id_of_yojson) "ShardId" _list path;
    
  }
  in _res

let put_record_input_of_yojson = 
  fun tree path : put_record_input ->
  let _list = assoc_of_yojson tree path in
  let _res : put_record_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    sequence_number_for_ordering = option_of_yojson (value_for_key (sequence_number_of_yojson) "SequenceNumberForOrdering") _list path;
    explicit_hash_key = option_of_yojson (value_for_key (hash_key_of_yojson) "ExplicitHashKey") _list path;
    partition_key = value_for_key (partition_key_of_yojson) "PartitionKey" _list path;
    data = value_for_key (data_of_yojson) "Data" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let on_demand_stream_count_object_of_yojson = int_of_yojson

let on_demand_stream_count_limit_object_of_yojson = int_of_yojson

let next_token_of_yojson = string_of_yojson

let merge_shards_input_of_yojson = 
  fun tree path : merge_shards_input ->
  let _list = assoc_of_yojson tree path in
  let _res : merge_shards_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    adjacent_shard_to_merge = value_for_key (shard_id_of_yojson) "AdjacentShardToMerge" _list path;
    shard_to_merge = value_for_key (shard_id_of_yojson) "ShardToMerge" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let list_tags_for_stream_output_of_yojson = 
  fun tree path : list_tags_for_stream_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_stream_output = {
    has_more_tags = value_for_key (boolean_object_of_yojson) "HasMoreTags" _list path;
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    
  }
  in _res

let list_tags_for_stream_input_limit_of_yojson = int_of_yojson

let list_tags_for_stream_input_of_yojson = 
  fun tree path : list_tags_for_stream_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_stream_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    limit = option_of_yojson (value_for_key (list_tags_for_stream_input_limit_of_yojson) "Limit") _list path;
    exclusive_start_tag_key = option_of_yojson (value_for_key (tag_key_of_yojson) "ExclusiveStartTagKey") _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let list_streams_output_of_yojson = 
  fun tree path : list_streams_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_streams_output = {
    stream_summaries = option_of_yojson (value_for_key (stream_summary_list_of_yojson) "StreamSummaries") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    has_more_streams = value_for_key (boolean_object_of_yojson) "HasMoreStreams" _list path;
    stream_names = value_for_key (stream_name_list_of_yojson) "StreamNames" _list path;
    
  }
  in _res

let list_streams_input_limit_of_yojson = int_of_yojson

let list_streams_input_of_yojson = 
  fun tree path : list_streams_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_streams_input = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    exclusive_start_stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "ExclusiveStartStreamName") _list path;
    limit = option_of_yojson (value_for_key (list_streams_input_limit_of_yojson) "Limit") _list path;
    
  }
  in _res

let expired_next_token_exception_of_yojson = 
  fun tree path : expired_next_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : expired_next_token_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let consumer_list_of_yojson = 
  fun tree path -> list_of_yojson consumer_of_yojson tree path 

let list_stream_consumers_output_of_yojson = 
  fun tree path : list_stream_consumers_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_stream_consumers_output = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    consumers = option_of_yojson (value_for_key (consumer_list_of_yojson) "Consumers") _list path;
    
  }
  in _res

let list_stream_consumers_input_limit_of_yojson = int_of_yojson

let list_stream_consumers_input_of_yojson = 
  fun tree path : list_stream_consumers_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_stream_consumers_input = {
    stream_creation_timestamp = option_of_yojson (value_for_key (timestamp__of_yojson) "StreamCreationTimestamp") _list path;
    max_results = option_of_yojson (value_for_key (list_stream_consumers_input_limit_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    stream_ar_n = value_for_key (stream_ar_n_of_yojson) "StreamARN" _list path;
    
  }
  in _res

let list_shards_output_of_yojson = 
  fun tree path : list_shards_output ->
  let _list = assoc_of_yojson tree path in
  let _res : list_shards_output = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    shards = option_of_yojson (value_for_key (shard_list_of_yojson) "Shards") _list path;
    
  }
  in _res

let list_shards_input_limit_of_yojson = int_of_yojson

let list_shards_input_of_yojson = 
  fun tree path : list_shards_input ->
  let _list = assoc_of_yojson tree path in
  let _res : list_shards_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    shard_filter = option_of_yojson (value_for_key (shard_filter_of_yojson) "ShardFilter") _list path;
    stream_creation_timestamp = option_of_yojson (value_for_key (timestamp__of_yojson) "StreamCreationTimestamp") _list path;
    max_results = option_of_yojson (value_for_key (list_shards_input_limit_of_yojson) "MaxResults") _list path;
    exclusive_start_shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "ExclusiveStartShardId") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let increase_stream_retention_period_input_of_yojson = 
  fun tree path : increase_stream_retention_period_input ->
  let _list = assoc_of_yojson tree path in
  let _res : increase_stream_retention_period_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    retention_period_hours = value_for_key (retention_period_hours_of_yojson) "RetentionPeriodHours" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
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
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    timestamp_ = option_of_yojson (value_for_key (timestamp__of_yojson) "Timestamp") _list path;
    starting_sequence_number = option_of_yojson (value_for_key (sequence_number_of_yojson) "StartingSequenceNumber") _list path;
    shard_iterator_type = value_for_key (shard_iterator_type_of_yojson) "ShardIteratorType" _list path;
    shard_id = value_for_key (shard_id_of_yojson) "ShardId" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let get_resource_policy_output_of_yojson = 
  fun tree path : get_resource_policy_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_policy_output = {
    policy = value_for_key (policy_of_yojson) "Policy" _list path;
    
  }
  in _res

let get_resource_policy_input_of_yojson = 
  fun tree path : get_resource_policy_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_policy_input = {
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let expired_iterator_exception_of_yojson = 
  fun tree path : expired_iterator_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : expired_iterator_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let get_records_output_of_yojson = 
  fun tree path : get_records_output ->
  let _list = assoc_of_yojson tree path in
  let _res : get_records_output = {
    child_shards = option_of_yojson (value_for_key (child_shard_list_of_yojson) "ChildShards") _list path;
    millis_behind_latest = option_of_yojson (value_for_key (millis_behind_latest_of_yojson) "MillisBehindLatest") _list path;
    next_shard_iterator = option_of_yojson (value_for_key (shard_iterator_of_yojson) "NextShardIterator") _list path;
    records = value_for_key (record_list_of_yojson) "Records" _list path;
    
  }
  in _res

let get_records_input_limit_of_yojson = int_of_yojson

let get_records_input_of_yojson = 
  fun tree path : get_records_input ->
  let _list = assoc_of_yojson tree path in
  let _res : get_records_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    limit = option_of_yojson (value_for_key (get_records_input_limit_of_yojson) "Limit") _list path;
    shard_iterator = value_for_key (shard_iterator_of_yojson) "ShardIterator" _list path;
    
  }
  in _res

let enhanced_monitoring_output_of_yojson = 
  fun tree path : enhanced_monitoring_output ->
  let _list = assoc_of_yojson tree path in
  let _res : enhanced_monitoring_output = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    desired_shard_level_metrics = option_of_yojson (value_for_key (metrics_name_list_of_yojson) "DesiredShardLevelMetrics") _list path;
    current_shard_level_metrics = option_of_yojson (value_for_key (metrics_name_list_of_yojson) "CurrentShardLevelMetrics") _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let enable_enhanced_monitoring_input_of_yojson = 
  fun tree path : enable_enhanced_monitoring_input ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_enhanced_monitoring_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    shard_level_metrics = value_for_key (metrics_name_list_of_yojson) "ShardLevelMetrics" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let disable_enhanced_monitoring_input_of_yojson = 
  fun tree path : disable_enhanced_monitoring_input ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_enhanced_monitoring_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    shard_level_metrics = value_for_key (metrics_name_list_of_yojson) "ShardLevelMetrics" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let describe_stream_summary_output_of_yojson = 
  fun tree path : describe_stream_summary_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_stream_summary_output = {
    stream_description_summary = value_for_key (stream_description_summary_of_yojson) "StreamDescriptionSummary" _list path;
    
  }
  in _res

let describe_stream_summary_input_of_yojson = 
  fun tree path : describe_stream_summary_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_stream_summary_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let consumer_description_of_yojson = 
  fun tree path : consumer_description ->
  let _list = assoc_of_yojson tree path in
  let _res : consumer_description = {
    stream_ar_n = value_for_key (stream_ar_n_of_yojson) "StreamARN" _list path;
    consumer_creation_timestamp = value_for_key (timestamp__of_yojson) "ConsumerCreationTimestamp" _list path;
    consumer_status = value_for_key (consumer_status_of_yojson) "ConsumerStatus" _list path;
    consumer_ar_n = value_for_key (consumer_ar_n_of_yojson) "ConsumerARN" _list path;
    consumer_name = value_for_key (consumer_name_of_yojson) "ConsumerName" _list path;
    
  }
  in _res

let describe_stream_consumer_output_of_yojson = 
  fun tree path : describe_stream_consumer_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_stream_consumer_output = {
    consumer_description = value_for_key (consumer_description_of_yojson) "ConsumerDescription" _list path;
    
  }
  in _res

let describe_stream_consumer_input_of_yojson = 
  fun tree path : describe_stream_consumer_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_stream_consumer_input = {
    consumer_ar_n = option_of_yojson (value_for_key (consumer_ar_n_of_yojson) "ConsumerARN") _list path;
    consumer_name = option_of_yojson (value_for_key (consumer_name_of_yojson) "ConsumerName") _list path;
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    
  }
  in _res

let describe_stream_output_of_yojson = 
  fun tree path : describe_stream_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_stream_output = {
    stream_description = value_for_key (stream_description_of_yojson) "StreamDescription" _list path;
    
  }
  in _res

let describe_stream_input_limit_of_yojson = int_of_yojson

let describe_stream_input_of_yojson = 
  fun tree path : describe_stream_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_stream_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    exclusive_start_shard_id = option_of_yojson (value_for_key (shard_id_of_yojson) "ExclusiveStartShardId") _list path;
    limit = option_of_yojson (value_for_key (describe_stream_input_limit_of_yojson) "Limit") _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let describe_limits_output_of_yojson = 
  fun tree path : describe_limits_output ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_limits_output = {
    on_demand_stream_count_limit = value_for_key (on_demand_stream_count_limit_object_of_yojson) "OnDemandStreamCountLimit" _list path;
    on_demand_stream_count = value_for_key (on_demand_stream_count_object_of_yojson) "OnDemandStreamCount" _list path;
    open_shard_count = value_for_key (shard_count_object_of_yojson) "OpenShardCount" _list path;
    shard_limit = value_for_key (shard_count_object_of_yojson) "ShardLimit" _list path;
    
  }
  in _res

let describe_limits_input_of_yojson = 
  fun tree path : describe_limits_input ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_limits_input = ()
  in _res

let deregister_stream_consumer_input_of_yojson = 
  fun tree path : deregister_stream_consumer_input ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_stream_consumer_input = {
    consumer_ar_n = option_of_yojson (value_for_key (consumer_ar_n_of_yojson) "ConsumerARN") _list path;
    consumer_name = option_of_yojson (value_for_key (consumer_name_of_yojson) "ConsumerName") _list path;
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    
  }
  in _res

let delete_stream_input_of_yojson = 
  fun tree path : delete_stream_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_stream_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    enforce_consumer_deletion = option_of_yojson (value_for_key (boolean_object_of_yojson) "EnforceConsumerDeletion") _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let delete_resource_policy_input_of_yojson = 
  fun tree path : delete_resource_policy_input ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_policy_input = {
    resource_ar_n = value_for_key (resource_ar_n_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let decrease_stream_retention_period_input_of_yojson = 
  fun tree path : decrease_stream_retention_period_input ->
  let _list = assoc_of_yojson tree path in
  let _res : decrease_stream_retention_period_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    retention_period_hours = value_for_key (retention_period_hours_of_yojson) "RetentionPeriodHours" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let create_stream_input_of_yojson = 
  fun tree path : create_stream_input ->
  let _list = assoc_of_yojson tree path in
  let _res : create_stream_input = {
    stream_mode_details = option_of_yojson (value_for_key (stream_mode_details_of_yojson) "StreamModeDetails") _list path;
    shard_count = option_of_yojson (value_for_key (positive_integer_object_of_yojson) "ShardCount") _list path;
    stream_name = value_for_key (stream_name_of_yojson) "StreamName" _list path;
    
  }
  in _res

let add_tags_to_stream_input_of_yojson = 
  fun tree path : add_tags_to_stream_input ->
  let _list = assoc_of_yojson tree path in
  let _res : add_tags_to_stream_input = {
    stream_ar_n = option_of_yojson (value_for_key (stream_ar_n_of_yojson) "StreamARN") _list path;
    tags = value_for_key (tag_map_of_yojson) "Tags" _list path;
    stream_name = option_of_yojson (value_for_key (stream_name_of_yojson) "StreamName") _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

