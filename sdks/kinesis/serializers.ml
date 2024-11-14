open Smaws_Lib.Json.SerializeHelpers

open Types

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let stream_ar_n_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let stream_mode_to_yojson = 
  fun (x: stream_mode) -> match x with 
  | ON_DEMAND -> `String "ON_DEMAND"
    | PROVISIONED -> `String "PROVISIONED"
     

let stream_mode_details_to_yojson = 
  fun (x: stream_mode_details) -> assoc_to_yojson(
    [(
         "StreamMode",
         (Some (stream_mode_to_yojson x.stream_mode)));
       
  ])

let update_stream_mode_input_to_yojson = 
  fun (x: update_stream_mode_input) -> assoc_to_yojson(
    [(
         "StreamModeDetails",
         (Some (stream_mode_details_to_yojson x.stream_mode_details)));
       (
         "StreamARN",
         (Some (stream_ar_n_to_yojson x.stream_ar_n)));
       
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

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
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

let stream_name_to_yojson = string_to_yojson

let positive_integer_object_to_yojson = int_to_yojson

let update_shard_count_output_to_yojson = 
  fun (x: update_shard_count_output) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "TargetShardCount",
         (option_to_yojson positive_integer_object_to_yojson x.target_shard_count));
       (
         "CurrentShardCount",
         (option_to_yojson positive_integer_object_to_yojson x.current_shard_count));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let scaling_type_to_yojson = 
  fun (x: scaling_type) -> match x with 
  | UNIFORM_SCALING -> `String "UNIFORM_SCALING"
     

let update_shard_count_input_to_yojson = 
  fun (x: update_shard_count_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "ScalingType",
         (Some (scaling_type_to_yojson x.scaling_type)));
       (
         "TargetShardCount",
         (Some (positive_integer_object_to_yojson x.target_shard_count)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let timestamp__to_yojson = timestamp_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_map_to_yojson = fun tree -> map_to_yojson tag_value_to_yojson tree

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson tag_value_to_yojson x.value));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let sequence_number_to_yojson = string_to_yojson

let data_to_yojson = blob_to_yojson

let partition_key_to_yojson = string_to_yojson

let encryption_type_to_yojson = 
  fun (x: encryption_type) -> match x with 
  | KMS -> `String "KMS"
    | NONE -> `String "NONE"
     

let record_to_yojson = 
  fun (x: record) -> assoc_to_yojson(
    [(
         "EncryptionType",
         (option_to_yojson encryption_type_to_yojson x.encryption_type));
       (
         "PartitionKey",
         (Some (partition_key_to_yojson x.partition_key)));
       (
         "Data",
         (Some (data_to_yojson x.data)));
       (
         "ApproximateArrivalTimestamp",
         (option_to_yojson timestamp__to_yojson x.approximate_arrival_timestamp));
       (
         "SequenceNumber",
         (Some (sequence_number_to_yojson x.sequence_number)));
       
  ])

let record_list_to_yojson = 
  fun tree -> list_to_yojson record_to_yojson tree

let millis_behind_latest_to_yojson = long_to_yojson

let shard_id_to_yojson = string_to_yojson

let shard_id_list_to_yojson = 
  fun tree -> list_to_yojson shard_id_to_yojson tree

let hash_key_to_yojson = string_to_yojson

let hash_key_range_to_yojson = 
  fun (x: hash_key_range) -> assoc_to_yojson(
    [(
         "EndingHashKey",
         (Some (hash_key_to_yojson x.ending_hash_key)));
       (
         "StartingHashKey",
         (Some (hash_key_to_yojson x.starting_hash_key)));
       
  ])

let child_shard_to_yojson = 
  fun (x: child_shard) -> assoc_to_yojson(
    [(
         "HashKeyRange",
         (Some (hash_key_range_to_yojson x.hash_key_range)));
       (
         "ParentShards",
         (Some (shard_id_list_to_yojson x.parent_shards)));
       (
         "ShardId",
         (Some (shard_id_to_yojson x.shard_id)));
       
  ])

let child_shard_list_to_yojson = 
  fun tree -> list_to_yojson child_shard_to_yojson tree

let subscribe_to_shard_event_to_yojson = 
  fun (x: subscribe_to_shard_event) -> assoc_to_yojson(
    [(
         "ChildShards",
         (option_to_yojson child_shard_list_to_yojson x.child_shards));
       (
         "MillisBehindLatest",
         (Some (millis_behind_latest_to_yojson x.millis_behind_latest)));
       (
         "ContinuationSequenceNumber",
         (Some (sequence_number_to_yojson x.continuation_sequence_number)));
       (
         "Records",
         (Some (record_list_to_yojson x.records)));
       
  ])

let kms_disabled_exception_to_yojson = 
  fun (x: kms_disabled_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let kms_invalid_state_exception_to_yojson = 
  fun (x: kms_invalid_state_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let kms_access_denied_exception_to_yojson = 
  fun (x: kms_access_denied_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let kms_not_found_exception_to_yojson = 
  fun (x: kms_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let kms_opt_in_required_to_yojson = 
  fun (x: kms_opt_in_required) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let kms_throttling_exception_to_yojson = 
  fun (x: kms_throttling_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let internal_failure_exception_to_yojson = 
  fun (x: internal_failure_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let subscribe_to_shard_event_stream_to_yojson = 
  fun (x: subscribe_to_shard_event_stream) -> 
  match x with 
    | InternalFailureException(arg) -> assoc_to_yojson ["InternalFailureException", Some (internal_failure_exception_to_yojson arg)]
      | KMSThrottlingException(arg) -> assoc_to_yojson ["KMSThrottlingException", Some (kms_throttling_exception_to_yojson arg)]
      | KMSOptInRequired(arg) -> assoc_to_yojson ["KMSOptInRequired", Some (kms_opt_in_required_to_yojson arg)]
      | KMSNotFoundException(arg) -> assoc_to_yojson ["KMSNotFoundException", Some (kms_not_found_exception_to_yojson arg)]
      | KMSAccessDeniedException(arg) -> assoc_to_yojson ["KMSAccessDeniedException", Some (kms_access_denied_exception_to_yojson arg)]
      | KMSInvalidStateException(arg) -> assoc_to_yojson ["KMSInvalidStateException", Some (kms_invalid_state_exception_to_yojson arg)]
      | KMSDisabledException(arg) -> assoc_to_yojson ["KMSDisabledException", Some (kms_disabled_exception_to_yojson arg)]
      | ResourceInUseException(arg) -> assoc_to_yojson ["ResourceInUseException", Some (resource_in_use_exception_to_yojson arg)]
      | ResourceNotFoundException(arg) -> assoc_to_yojson ["ResourceNotFoundException", Some (resource_not_found_exception_to_yojson arg)]
      | SubscribeToShardEvent(arg) -> assoc_to_yojson ["SubscribeToShardEvent", Some (subscribe_to_shard_event_to_yojson arg)]
      
      
    

let subscribe_to_shard_output_to_yojson = 
  fun (x: subscribe_to_shard_output) -> assoc_to_yojson(
    [(
         "EventStream",
         (Some (subscribe_to_shard_event_stream_to_yojson x.event_stream)));
       
  ])

let consumer_ar_n_to_yojson = string_to_yojson

let shard_iterator_type_to_yojson = 
  fun (x: shard_iterator_type) -> match x with 
 
| AT_TIMESTAMP -> `String "AT_TIMESTAMP"
  | LATEST -> `String "LATEST"
  | TRIM_HORIZON -> `String "TRIM_HORIZON"
  | AFTER_SEQUENCE_NUMBER -> `String "AFTER_SEQUENCE_NUMBER"
  | AT_SEQUENCE_NUMBER -> `String "AT_SEQUENCE_NUMBER"
   

let starting_position_to_yojson = 
  fun (x: starting_position) -> assoc_to_yojson(
    [(
         "Timestamp",
         (option_to_yojson timestamp__to_yojson x.timestamp_));
       (
         "SequenceNumber",
         (option_to_yojson sequence_number_to_yojson x.sequence_number));
       (
         "Type",
         (Some (shard_iterator_type_to_yojson x.type_)));
       
  ])

let subscribe_to_shard_input_to_yojson = 
  fun (x: subscribe_to_shard_input) -> assoc_to_yojson(
    [(
         "StartingPosition",
         (Some (starting_position_to_yojson x.starting_position)));
       (
         "ShardId",
         (Some (shard_id_to_yojson x.shard_id)));
       (
         "ConsumerARN",
         (Some (consumer_ar_n_to_yojson x.consumer_ar_n)));
       
  ])

let stream_status_to_yojson = 
  fun (x: stream_status) -> match x with 
 
| UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
   

let stream_summary_to_yojson = 
  fun (x: stream_summary) -> assoc_to_yojson(
    [(
         "StreamCreationTimestamp",
         (option_to_yojson timestamp__to_yojson x.stream_creation_timestamp));
       (
         "StreamModeDetails",
         (option_to_yojson stream_mode_details_to_yojson x.stream_mode_details));
       (
         "StreamStatus",
         (Some (stream_status_to_yojson x.stream_status)));
       (
         "StreamARN",
         (Some (stream_ar_n_to_yojson x.stream_ar_n)));
       (
         "StreamName",
         (Some (stream_name_to_yojson x.stream_name)));
       
  ])

let stream_summary_list_to_yojson = 
  fun tree -> list_to_yojson stream_summary_to_yojson tree

let stream_name_list_to_yojson = 
  fun tree -> list_to_yojson stream_name_to_yojson tree

let retention_period_hours_to_yojson = int_to_yojson

let metrics_name_to_yojson = 
  fun (x: metrics_name) -> match x with 
 
| ALL -> `String "ALL"
  | ITERATOR_AGE_MILLISECONDS -> `String "IteratorAgeMilliseconds"
  | READ_PROVISIONED_THROUGHPUT_EXCEEDED -> `String "ReadProvisionedThroughputExceeded"
  | WRITE_PROVISIONED_THROUGHPUT_EXCEEDED -> `String "WriteProvisionedThroughputExceeded"
  | OUTGOING_RECORDS -> `String "OutgoingRecords"
  | OUTGOING_BYTES -> `String "OutgoingBytes"
  | INCOMING_RECORDS -> `String "IncomingRecords"
  | INCOMING_BYTES -> `String "IncomingBytes"
   

let metrics_name_list_to_yojson = 
  fun tree -> list_to_yojson metrics_name_to_yojson tree

let enhanced_metrics_to_yojson = 
  fun (x: enhanced_metrics) -> assoc_to_yojson(
    [(
         "ShardLevelMetrics",
         (option_to_yojson metrics_name_list_to_yojson x.shard_level_metrics));
       
  ])

let enhanced_monitoring_list_to_yojson = 
  fun tree -> list_to_yojson enhanced_metrics_to_yojson tree

let key_id_to_yojson = string_to_yojson

let shard_count_object_to_yojson = int_to_yojson

let consumer_count_object_to_yojson = int_to_yojson

let stream_description_summary_to_yojson = 
  fun (x: stream_description_summary) -> assoc_to_yojson(
    [(
         "ConsumerCount",
         (option_to_yojson consumer_count_object_to_yojson x.consumer_count));
       (
         "OpenShardCount",
         (Some (shard_count_object_to_yojson x.open_shard_count)));
       (
         "KeyId",
         (option_to_yojson key_id_to_yojson x.key_id));
       (
         "EncryptionType",
         (option_to_yojson encryption_type_to_yojson x.encryption_type));
       (
         "EnhancedMonitoring",
         (Some (enhanced_monitoring_list_to_yojson x.enhanced_monitoring)));
       (
         "StreamCreationTimestamp",
         (Some (timestamp__to_yojson x.stream_creation_timestamp)));
       (
         "RetentionPeriodHours",
         (Some (retention_period_hours_to_yojson x.retention_period_hours)));
       (
         "StreamModeDetails",
         (option_to_yojson stream_mode_details_to_yojson x.stream_mode_details));
       (
         "StreamStatus",
         (Some (stream_status_to_yojson x.stream_status)));
       (
         "StreamARN",
         (Some (stream_ar_n_to_yojson x.stream_ar_n)));
       (
         "StreamName",
         (Some (stream_name_to_yojson x.stream_name)));
       
  ])

let sequence_number_range_to_yojson = 
  fun (x: sequence_number_range) -> assoc_to_yojson(
    [(
         "EndingSequenceNumber",
         (option_to_yojson sequence_number_to_yojson x.ending_sequence_number));
       (
         "StartingSequenceNumber",
         (Some (sequence_number_to_yojson x.starting_sequence_number)));
       
  ])

let shard_to_yojson = 
  fun (x: shard) -> assoc_to_yojson(
    [(
         "SequenceNumberRange",
         (Some (sequence_number_range_to_yojson x.sequence_number_range)));
       (
         "HashKeyRange",
         (Some (hash_key_range_to_yojson x.hash_key_range)));
       (
         "AdjacentParentShardId",
         (option_to_yojson shard_id_to_yojson x.adjacent_parent_shard_id));
       (
         "ParentShardId",
         (option_to_yojson shard_id_to_yojson x.parent_shard_id));
       (
         "ShardId",
         (Some (shard_id_to_yojson x.shard_id)));
       
  ])

let shard_list_to_yojson = fun tree -> list_to_yojson shard_to_yojson tree

let boolean_object_to_yojson = bool_to_yojson

let stream_description_to_yojson = 
  fun (x: stream_description) -> assoc_to_yojson(
    [(
         "KeyId",
         (option_to_yojson key_id_to_yojson x.key_id));
       (
         "EncryptionType",
         (option_to_yojson encryption_type_to_yojson x.encryption_type));
       (
         "EnhancedMonitoring",
         (Some (enhanced_monitoring_list_to_yojson x.enhanced_monitoring)));
       (
         "StreamCreationTimestamp",
         (Some (timestamp__to_yojson x.stream_creation_timestamp)));
       (
         "RetentionPeriodHours",
         (Some (retention_period_hours_to_yojson x.retention_period_hours)));
       (
         "HasMoreShards",
         (Some (boolean_object_to_yojson x.has_more_shards)));
       (
         "Shards",
         (Some (shard_list_to_yojson x.shards)));
       (
         "StreamModeDetails",
         (option_to_yojson stream_mode_details_to_yojson x.stream_mode_details));
       (
         "StreamStatus",
         (Some (stream_status_to_yojson x.stream_status)));
       (
         "StreamARN",
         (Some (stream_ar_n_to_yojson x.stream_ar_n)));
       (
         "StreamName",
         (Some (stream_name_to_yojson x.stream_name)));
       
  ])

let stop_stream_encryption_input_to_yojson = 
  fun (x: stop_stream_encryption_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "KeyId",
         (Some (key_id_to_yojson x.key_id)));
       (
         "EncryptionType",
         (Some (encryption_type_to_yojson x.encryption_type)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let start_stream_encryption_input_to_yojson = 
  fun (x: start_stream_encryption_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "KeyId",
         (Some (key_id_to_yojson x.key_id)));
       (
         "EncryptionType",
         (Some (encryption_type_to_yojson x.encryption_type)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let split_shard_input_to_yojson = 
  fun (x: split_shard_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "NewStartingHashKey",
         (Some (hash_key_to_yojson x.new_starting_hash_key)));
       (
         "ShardToSplit",
         (Some (shard_id_to_yojson x.shard_to_split)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let shard_iterator_to_yojson = string_to_yojson

let shard_filter_type_to_yojson = 
  fun (x: shard_filter_type) -> match x with 
 
| FROM_TIMESTAMP -> `String "FROM_TIMESTAMP"
  | AT_TIMESTAMP -> `String "AT_TIMESTAMP"
  | AT_LATEST -> `String "AT_LATEST"
  | FROM_TRIM_HORIZON -> `String "FROM_TRIM_HORIZON"
  | AT_TRIM_HORIZON -> `String "AT_TRIM_HORIZON"
  | AFTER_SHARD_ID -> `String "AFTER_SHARD_ID"
   

let shard_filter_to_yojson = 
  fun (x: shard_filter) -> assoc_to_yojson(
    [(
         "Timestamp",
         (option_to_yojson timestamp__to_yojson x.timestamp_));
       (
         "ShardId",
         (option_to_yojson shard_id_to_yojson x.shard_id));
       (
         "Type",
         (Some (shard_filter_type_to_yojson x.type_)));
       
  ])

let resource_ar_n_to_yojson = string_to_yojson

let remove_tags_from_stream_input_to_yojson = 
  fun (x: remove_tags_from_stream_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let consumer_name_to_yojson = string_to_yojson

let consumer_status_to_yojson = 
  fun (x: consumer_status) -> match x with 
 
| ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
   

let consumer_to_yojson = 
  fun (x: consumer) -> assoc_to_yojson(
    [(
         "ConsumerCreationTimestamp",
         (Some (timestamp__to_yojson x.consumer_creation_timestamp)));
       (
         "ConsumerStatus",
         (Some (consumer_status_to_yojson x.consumer_status)));
       (
         "ConsumerARN",
         (Some (consumer_ar_n_to_yojson x.consumer_ar_n)));
       (
         "ConsumerName",
         (Some (consumer_name_to_yojson x.consumer_name)));
       
  ])

let register_stream_consumer_output_to_yojson = 
  fun (x: register_stream_consumer_output) -> assoc_to_yojson(
    [(
         "Consumer",
         (Some (consumer_to_yojson x.consumer)));
       
  ])

let register_stream_consumer_input_to_yojson = 
  fun (x: register_stream_consumer_input) -> assoc_to_yojson(
    [(
         "ConsumerName",
         (Some (consumer_name_to_yojson x.consumer_name)));
       (
         "StreamARN",
         (Some (stream_ar_n_to_yojson x.stream_ar_n)));
       
  ])

let policy_to_yojson = string_to_yojson

let put_resource_policy_input_to_yojson = 
  fun (x: put_resource_policy_input) -> assoc_to_yojson(
    [(
         "Policy",
         (Some (policy_to_yojson x.policy)));
       (
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let error_code_to_yojson = string_to_yojson

let put_records_result_entry_to_yojson = 
  fun (x: put_records_result_entry) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "ShardId",
         (option_to_yojson shard_id_to_yojson x.shard_id));
       (
         "SequenceNumber",
         (option_to_yojson sequence_number_to_yojson x.sequence_number));
       
  ])

let put_records_result_entry_list_to_yojson = 
  fun tree -> list_to_yojson put_records_result_entry_to_yojson tree

let put_records_request_entry_to_yojson = 
  fun (x: put_records_request_entry) -> assoc_to_yojson(
    [(
         "PartitionKey",
         (Some (partition_key_to_yojson x.partition_key)));
       (
         "ExplicitHashKey",
         (option_to_yojson hash_key_to_yojson x.explicit_hash_key));
       (
         "Data",
         (Some (data_to_yojson x.data)));
       
  ])

let put_records_request_entry_list_to_yojson = 
  fun tree -> list_to_yojson put_records_request_entry_to_yojson tree

let put_records_output_to_yojson = 
  fun (x: put_records_output) -> assoc_to_yojson(
    [(
         "EncryptionType",
         (option_to_yojson encryption_type_to_yojson x.encryption_type));
       (
         "Records",
         (Some (put_records_result_entry_list_to_yojson x.records)));
       (
         "FailedRecordCount",
         (option_to_yojson positive_integer_object_to_yojson x.failed_record_count));
       
  ])

let put_records_input_to_yojson = 
  fun (x: put_records_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       (
         "Records",
         (Some (put_records_request_entry_list_to_yojson x.records)));
       
  ])

let provisioned_throughput_exceeded_exception_to_yojson = 
  fun (x: provisioned_throughput_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let put_record_output_to_yojson = 
  fun (x: put_record_output) -> assoc_to_yojson(
    [(
         "EncryptionType",
         (option_to_yojson encryption_type_to_yojson x.encryption_type));
       (
         "SequenceNumber",
         (Some (sequence_number_to_yojson x.sequence_number)));
       (
         "ShardId",
         (Some (shard_id_to_yojson x.shard_id)));
       
  ])

let put_record_input_to_yojson = 
  fun (x: put_record_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "SequenceNumberForOrdering",
         (option_to_yojson sequence_number_to_yojson x.sequence_number_for_ordering));
       (
         "ExplicitHashKey",
         (option_to_yojson hash_key_to_yojson x.explicit_hash_key));
       (
         "PartitionKey",
         (Some (partition_key_to_yojson x.partition_key)));
       (
         "Data",
         (Some (data_to_yojson x.data)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let on_demand_stream_count_object_to_yojson = int_to_yojson

let on_demand_stream_count_limit_object_to_yojson = int_to_yojson

let next_token_to_yojson = string_to_yojson

let merge_shards_input_to_yojson = 
  fun (x: merge_shards_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "AdjacentShardToMerge",
         (Some (shard_id_to_yojson x.adjacent_shard_to_merge)));
       (
         "ShardToMerge",
         (Some (shard_id_to_yojson x.shard_to_merge)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let list_tags_for_stream_output_to_yojson = 
  fun (x: list_tags_for_stream_output) -> assoc_to_yojson(
    [(
         "HasMoreTags",
         (Some (boolean_object_to_yojson x.has_more_tags)));
       (
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       
  ])

let list_tags_for_stream_input_limit_to_yojson = int_to_yojson

let list_tags_for_stream_input_to_yojson = 
  fun (x: list_tags_for_stream_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "Limit",
         (option_to_yojson list_tags_for_stream_input_limit_to_yojson x.limit));
       (
         "ExclusiveStartTagKey",
         (option_to_yojson tag_key_to_yojson x.exclusive_start_tag_key));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let list_streams_output_to_yojson = 
  fun (x: list_streams_output) -> assoc_to_yojson(
    [(
         "StreamSummaries",
         (option_to_yojson stream_summary_list_to_yojson x.stream_summaries));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "HasMoreStreams",
         (Some (boolean_object_to_yojson x.has_more_streams)));
       (
         "StreamNames",
         (Some (stream_name_list_to_yojson x.stream_names)));
       
  ])

let list_streams_input_limit_to_yojson = int_to_yojson

let list_streams_input_to_yojson = 
  fun (x: list_streams_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ExclusiveStartStreamName",
         (option_to_yojson stream_name_to_yojson x.exclusive_start_stream_name));
       (
         "Limit",
         (option_to_yojson list_streams_input_limit_to_yojson x.limit));
       
  ])

let expired_next_token_exception_to_yojson = 
  fun (x: expired_next_token_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let consumer_list_to_yojson = 
  fun tree -> list_to_yojson consumer_to_yojson tree

let list_stream_consumers_output_to_yojson = 
  fun (x: list_stream_consumers_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Consumers",
         (option_to_yojson consumer_list_to_yojson x.consumers));
       
  ])

let list_stream_consumers_input_limit_to_yojson = int_to_yojson

let list_stream_consumers_input_to_yojson = 
  fun (x: list_stream_consumers_input) -> assoc_to_yojson(
    [(
         "StreamCreationTimestamp",
         (option_to_yojson timestamp__to_yojson x.stream_creation_timestamp));
       (
         "MaxResults",
         (option_to_yojson list_stream_consumers_input_limit_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "StreamARN",
         (Some (stream_ar_n_to_yojson x.stream_ar_n)));
       
  ])

let list_shards_output_to_yojson = 
  fun (x: list_shards_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Shards",
         (option_to_yojson shard_list_to_yojson x.shards));
       
  ])

let list_shards_input_limit_to_yojson = int_to_yojson

let list_shards_input_to_yojson = 
  fun (x: list_shards_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "ShardFilter",
         (option_to_yojson shard_filter_to_yojson x.shard_filter));
       (
         "StreamCreationTimestamp",
         (option_to_yojson timestamp__to_yojson x.stream_creation_timestamp));
       (
         "MaxResults",
         (option_to_yojson list_shards_input_limit_to_yojson x.max_results));
       (
         "ExclusiveStartShardId",
         (option_to_yojson shard_id_to_yojson x.exclusive_start_shard_id));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let increase_stream_retention_period_input_to_yojson = 
  fun (x: increase_stream_retention_period_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "RetentionPeriodHours",
         (Some (retention_period_hours_to_yojson x.retention_period_hours)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
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
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "Timestamp",
         (option_to_yojson timestamp__to_yojson x.timestamp_));
       (
         "StartingSequenceNumber",
         (option_to_yojson sequence_number_to_yojson x.starting_sequence_number));
       (
         "ShardIteratorType",
         (Some (shard_iterator_type_to_yojson x.shard_iterator_type)));
       (
         "ShardId",
         (Some (shard_id_to_yojson x.shard_id)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let get_resource_policy_output_to_yojson = 
  fun (x: get_resource_policy_output) -> assoc_to_yojson(
    [(
         "Policy",
         (Some (policy_to_yojson x.policy)));
       
  ])

let get_resource_policy_input_to_yojson = 
  fun (x: get_resource_policy_input) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let expired_iterator_exception_to_yojson = 
  fun (x: expired_iterator_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let get_records_output_to_yojson = 
  fun (x: get_records_output) -> assoc_to_yojson(
    [(
         "ChildShards",
         (option_to_yojson child_shard_list_to_yojson x.child_shards));
       (
         "MillisBehindLatest",
         (option_to_yojson millis_behind_latest_to_yojson x.millis_behind_latest));
       (
         "NextShardIterator",
         (option_to_yojson shard_iterator_to_yojson x.next_shard_iterator));
       (
         "Records",
         (Some (record_list_to_yojson x.records)));
       
  ])

let get_records_input_limit_to_yojson = int_to_yojson

let get_records_input_to_yojson = 
  fun (x: get_records_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "Limit",
         (option_to_yojson get_records_input_limit_to_yojson x.limit));
       (
         "ShardIterator",
         (Some (shard_iterator_to_yojson x.shard_iterator)));
       
  ])

let enhanced_monitoring_output_to_yojson = 
  fun (x: enhanced_monitoring_output) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "DesiredShardLevelMetrics",
         (option_to_yojson metrics_name_list_to_yojson x.desired_shard_level_metrics));
       (
         "CurrentShardLevelMetrics",
         (option_to_yojson metrics_name_list_to_yojson x.current_shard_level_metrics));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let enable_enhanced_monitoring_input_to_yojson = 
  fun (x: enable_enhanced_monitoring_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "ShardLevelMetrics",
         (Some (metrics_name_list_to_yojson x.shard_level_metrics)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let disable_enhanced_monitoring_input_to_yojson = 
  fun (x: disable_enhanced_monitoring_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "ShardLevelMetrics",
         (Some (metrics_name_list_to_yojson x.shard_level_metrics)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let describe_stream_summary_output_to_yojson = 
  fun (x: describe_stream_summary_output) -> assoc_to_yojson(
    [(
         "StreamDescriptionSummary",
         (Some (stream_description_summary_to_yojson x.stream_description_summary)));
       
  ])

let describe_stream_summary_input_to_yojson = 
  fun (x: describe_stream_summary_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let consumer_description_to_yojson = 
  fun (x: consumer_description) -> assoc_to_yojson(
    [(
         "StreamARN",
         (Some (stream_ar_n_to_yojson x.stream_ar_n)));
       (
         "ConsumerCreationTimestamp",
         (Some (timestamp__to_yojson x.consumer_creation_timestamp)));
       (
         "ConsumerStatus",
         (Some (consumer_status_to_yojson x.consumer_status)));
       (
         "ConsumerARN",
         (Some (consumer_ar_n_to_yojson x.consumer_ar_n)));
       (
         "ConsumerName",
         (Some (consumer_name_to_yojson x.consumer_name)));
       
  ])

let describe_stream_consumer_output_to_yojson = 
  fun (x: describe_stream_consumer_output) -> assoc_to_yojson(
    [(
         "ConsumerDescription",
         (Some (consumer_description_to_yojson x.consumer_description)));
       
  ])

let describe_stream_consumer_input_to_yojson = 
  fun (x: describe_stream_consumer_input) -> assoc_to_yojson(
    [(
         "ConsumerARN",
         (option_to_yojson consumer_ar_n_to_yojson x.consumer_ar_n));
       (
         "ConsumerName",
         (option_to_yojson consumer_name_to_yojson x.consumer_name));
       (
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       
  ])

let describe_stream_output_to_yojson = 
  fun (x: describe_stream_output) -> assoc_to_yojson(
    [(
         "StreamDescription",
         (Some (stream_description_to_yojson x.stream_description)));
       
  ])

let describe_stream_input_limit_to_yojson = int_to_yojson

let describe_stream_input_to_yojson = 
  fun (x: describe_stream_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "ExclusiveStartShardId",
         (option_to_yojson shard_id_to_yojson x.exclusive_start_shard_id));
       (
         "Limit",
         (option_to_yojson describe_stream_input_limit_to_yojson x.limit));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let describe_limits_output_to_yojson = 
  fun (x: describe_limits_output) -> assoc_to_yojson(
    [(
         "OnDemandStreamCountLimit",
         (Some (on_demand_stream_count_limit_object_to_yojson x.on_demand_stream_count_limit)));
       (
         "OnDemandStreamCount",
         (Some (on_demand_stream_count_object_to_yojson x.on_demand_stream_count)));
       (
         "OpenShardCount",
         (Some (shard_count_object_to_yojson x.open_shard_count)));
       (
         "ShardLimit",
         (Some (shard_count_object_to_yojson x.shard_limit)));
       
  ])

let describe_limits_input_to_yojson = 
  fun (x: describe_limits_input) -> assoc_to_yojson(
    [
  ])

let deregister_stream_consumer_input_to_yojson = 
  fun (x: deregister_stream_consumer_input) -> assoc_to_yojson(
    [(
         "ConsumerARN",
         (option_to_yojson consumer_ar_n_to_yojson x.consumer_ar_n));
       (
         "ConsumerName",
         (option_to_yojson consumer_name_to_yojson x.consumer_name));
       (
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       
  ])

let delete_stream_input_to_yojson = 
  fun (x: delete_stream_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "EnforceConsumerDeletion",
         (option_to_yojson boolean_object_to_yojson x.enforce_consumer_deletion));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let delete_resource_policy_input_to_yojson = 
  fun (x: delete_resource_policy_input) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_ar_n_to_yojson x.resource_ar_n)));
       
  ])

let decrease_stream_retention_period_input_to_yojson = 
  fun (x: decrease_stream_retention_period_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "RetentionPeriodHours",
         (Some (retention_period_hours_to_yojson x.retention_period_hours)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let create_stream_input_to_yojson = 
  fun (x: create_stream_input) -> assoc_to_yojson(
    [(
         "StreamModeDetails",
         (option_to_yojson stream_mode_details_to_yojson x.stream_mode_details));
       (
         "ShardCount",
         (option_to_yojson positive_integer_object_to_yojson x.shard_count));
       (
         "StreamName",
         (Some (stream_name_to_yojson x.stream_name)));
       
  ])

let add_tags_to_stream_input_to_yojson = 
  fun (x: add_tags_to_stream_input) -> assoc_to_yojson(
    [(
         "StreamARN",
         (option_to_yojson stream_ar_n_to_yojson x.stream_ar_n));
       (
         "Tags",
         (Some (tag_map_to_yojson x.tags)));
       (
         "StreamName",
         (option_to_yojson stream_name_to_yojson x.stream_name));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

