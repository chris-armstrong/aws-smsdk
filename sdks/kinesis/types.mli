open Smaws_Lib
val service : Service.descriptor

(** 
    Specifies that you tried to invoke this API for a data stream with the on-demand capacity mode. This API is only supported for data streams with the provisioned capacity mode.
     *)
type validation_exception = {
  message: string option;
  
}

type stream_mode = | ON_DEMAND
  | PROVISIONED

(** 
    Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams.
     *)
type stream_mode_details = {
  stream_mode: stream_mode;
  (** 
    Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams.
     *)

}

type update_stream_mode_input = {
  stream_mode_details: stream_mode_details;
  (** 
    Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams.
     *)

  stream_ar_n: string;
  (** 
    Specifies the ARN of the data stream whose capacity mode you want to update.
     *)

}

(** 
    The requested resource could not be found. The stream might not be specified correctly.
     *)
type resource_not_found_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    The resource is not available for this operation. For successful operation, the resource must be in the [ACTIVE] state.
     *)
type resource_in_use_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    The requested resource exceeds the maximum number allowed, or the number of concurrent stream requests exceeds the maximum number allowed.
     *)
type limit_exceeded_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    A specified parameter exceeds its restrictions, is not supported, or can't be used. For more information, see the returned message.
     *)
type invalid_argument_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

type update_shard_count_output = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  target_shard_count: int option;
  (** 
    The updated number of shards.
     *)

  current_shard_count: int option;
  (** 
    The current number of shards.
     *)

  stream_name: string option;
  (** 
    The name of the stream.
     *)

}

type scaling_type = | UNIFORM_SCALING

type update_shard_count_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  scaling_type: scaling_type;
  (** 
    The scaling type. Uniform scaling creates shards of equal size.
     *)

  target_shard_count: int;
  (** 
    The new number of shards. This value has the following default limits. By default, you cannot do the following:
    
     {ul
          {- Set this value to more than double your current shard count for a stream.
             
             }
           {- Set this value below half your current shard count for a stream.
              
              }
           {- Set this value to more than 10000 shards in a stream (the default limit for shard count per stream is 10000 per account per region), unless you request a limit increase.
              
              }
           {- Scale a stream with more than 10000 shards down unless you set this value to less than 10000 shards.
              
              }
          
      }
       *)

  stream_name: string option;
  (** 
    The name of the stream.
     *)

}

(** 
    Specifies that you do not have the permissions required to perform this operation.
     *)
type access_denied_exception = {
  message: string option;
  
}

(** 
    Metadata assigned to the stream, consisting of a key-value pair.
     *)
type tag = {
  value: string option;
  (** 
    An optional string, typically used to describe or define the tag. Maximum length: 256 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % \@
     *)

  key: string;
  (** 
    A unique identifier for the tag. Maximum length: 128 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % \@
     *)

}

type encryption_type = | KMS
  | NONE

(** 
    The unit of data of the Kinesis data stream, which is composed of a sequence number, a partition key, and a data blob.
     *)
type record = {
  encryption_type: encryption_type option;
  (** 
    The encryption type used on the record. This parameter can be one of the following values:
    
     {ul
          {- [NONE]: Do not encrypt the records in the stream.
             
             }
           {- [KMS]: Use server-side encryption on the records in the stream using a customer-managed Amazon Web Services KMS key.
              
              }
          
      }
       *)

  partition_key: string;
  (** 
    Identifies which shard in the stream the data record is assigned to.
     *)

  data: bytes;
  (** 
    The data blob. The data in the blob is both opaque and immutable to Kinesis Data Streams, which does not inspect, interpret, or change the data in the blob in any way. When the data blob (the payload before base64-encoding) is added to the partition key size, the total size must not exceed the maximum record size (1 MiB).
     *)

  approximate_arrival_timestamp: float option;
  (** 
    The approximate time that the record was inserted into the stream.
     *)

  sequence_number: string;
  (** 
    The unique identifier of the record within its shard.
     *)

}

(** 
    The range of possible hash key values for the shard, which is a set of ordered contiguous positive integers.
     *)
type hash_key_range = {
  ending_hash_key: string;
  (** 
    The ending hash key of the hash key range.
     *)

  starting_hash_key: string;
  (** 
    The starting hash key of the hash key range.
     *)

}

(** 
    Output parameter of the GetRecords API. The existing child shard of the current shard.
     *)
type child_shard = {
  hash_key_range: hash_key_range;
  
  parent_shards: string list;
  (** 
    The current shard that is the parent of the existing child shard.
     *)

  shard_id: string;
  (** 
    The shard ID of the existing child shard of the current shard.
     *)

}

(** 
    After you call [SubscribeToShard], Kinesis Data Streams sends events of this type over an HTTP/2 connection to your consumer.
     *)
type subscribe_to_shard_event = {
  child_shards: child_shard list option;
  (** 
    The list of the child shards of the current shard, returned only at the end of the current shard.
     *)

  millis_behind_latest: int;
  (** 
    The number of milliseconds the read records are from the tip of the stream, indicating how far behind current time the consumer is. A value of zero indicates that record processing is caught up, and there are no new records to process at this moment.
     *)

  continuation_sequence_number: string;
  (** 
    Use this as [SequenceNumber] in the next call to [SubscribeToShard], with [StartingPosition] set to [AT_SEQUENCE_NUMBER] or [AFTER_SEQUENCE_NUMBER]. Use [ContinuationSequenceNumber] for checkpointing because it captures your shard progress even when no data is written to the shard.
     *)

  records: record list;
  (** 
    
     *)

}

(** 
    The request was rejected because the specified customer master key (CMK) isn't enabled.
     *)
type kms_disabled_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    The request was rejected because the state of the specified resource isn't valid for this request. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}How Key State Affects Use of a Customer Master Key} in the {i Amazon Web Services Key Management Service Developer Guide}.
     *)
type kms_invalid_state_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    The ciphertext references a key that doesn't exist or that you don't have access to.
     *)
type kms_access_denied_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    The request was rejected because the specified entity or resource can't be found.
     *)
type kms_not_found_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    The Amazon Web Services access key ID needs a subscription for the service.
     *)
type kms_opt_in_required = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    The request was denied due to request throttling. For more information about throttling, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#requests-per-second}Limits} in the {i Amazon Web Services Key Management Service Developer Guide}.
     *)
type kms_throttling_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    The processing of the request failed because of an unknown error, exception, or failure.
     *)
type internal_failure_exception = {
  message: string option;
  
}

(** 
    This is a tagged union for all of the types of events an enhanced fan-out consumer can receive over HTTP/2 after a call to [SubscribeToShard].
     *)
type subscribe_to_shard_event_stream = InternalFailureException of internal_failure_exception | KMSThrottlingException of kms_throttling_exception | KMSOptInRequired of kms_opt_in_required | KMSNotFoundException of kms_not_found_exception | KMSAccessDeniedException of kms_access_denied_exception | KMSInvalidStateException of kms_invalid_state_exception | KMSDisabledException of kms_disabled_exception | ResourceInUseException of resource_in_use_exception | ResourceNotFoundException of resource_not_found_exception | SubscribeToShardEvent of subscribe_to_shard_event

type subscribe_to_shard_output = {
  event_stream: subscribe_to_shard_event_stream;
  (** 
    The event stream that your consumer can use to read records from the shard.
     *)

}

type shard_iterator_type = | AT_TIMESTAMP
  | LATEST
  | TRIM_HORIZON
  | AFTER_SEQUENCE_NUMBER
  | AT_SEQUENCE_NUMBER

(** 
    The starting position in the data stream from which to start streaming.
     *)
type starting_position = {
  timestamp_: float option;
  (** 
    The time stamp of the data record from which to start reading. To specify a time stamp, set [StartingPosition] to [Type AT_TIMESTAMP]. A time stamp is the Unix epoch date with precision in milliseconds. For example, [2016-04-04T19:58:46.480-00:00] or [1459799926.480]. If a record with this exact time stamp does not exist, records will be streamed from the next (later) record. If the time stamp is older than the current trim horizon, records will be streamed from the oldest untrimmed data record ([TRIM_HORIZON]).
     *)

  sequence_number: string option;
  (** 
    The sequence number of the data record in the shard from which to start streaming. To specify a sequence number, set [StartingPosition] to [AT_SEQUENCE_NUMBER] or [AFTER_SEQUENCE_NUMBER].
     *)

  type_: shard_iterator_type;
  (** 
    You can set the starting position to one of the following values:
    
     [AT_SEQUENCE_NUMBER]: Start streaming from the position denoted by the sequence number specified in the [SequenceNumber] field.
     
      [AFTER_SEQUENCE_NUMBER]: Start streaming right after the position denoted by the sequence number specified in the [SequenceNumber] field.
      
       [AT_TIMESTAMP]: Start streaming from the position denoted by the time stamp specified in the [Timestamp] field.
       
        [TRIM_HORIZON]: Start streaming at the last untrimmed record in the shard, which is the oldest data record in the shard.
        
         [LATEST]: Start streaming just after the most recent record in the shard, so that you always read the most recent data in the shard.
          *)

}

type subscribe_to_shard_input = {
  starting_position: starting_position;
  (** 
    The starting position in the data stream from which to start streaming.
     *)

  shard_id: string;
  (** 
    The ID of the shard you want to subscribe to. To see a list of all the shards for a given stream, use [ListShards].
     *)

  consumer_ar_n: string;
  (** 
    For this parameter, use the value you obtained when you called [RegisterStreamConsumer].
     *)

}

type stream_status = | UPDATING
  | ACTIVE
  | DELETING
  | CREATING

(** 
    The summary of a stream.
     *)
type stream_summary = {
  stream_creation_timestamp: float option;
  (** 
    The timestamp at which the stream was created.
     *)

  stream_mode_details: stream_mode_details option;
  
  stream_status: stream_status;
  (** 
    The status of the stream.
     *)

  stream_ar_n: string;
  (** 
    The ARN of the stream.
     *)

  stream_name: string;
  (** 
    The name of a stream.
     *)

}

type metrics_name = | ALL
  | ITERATOR_AGE_MILLISECONDS
  | READ_PROVISIONED_THROUGHPUT_EXCEEDED
  | WRITE_PROVISIONED_THROUGHPUT_EXCEEDED
  | OUTGOING_RECORDS
  | OUTGOING_BYTES
  | INCOMING_RECORDS
  | INCOMING_BYTES

(** 
    Represents enhanced metrics types.
     *)
type enhanced_metrics = {
  shard_level_metrics: metrics_name list option;
  [@ocaml.doc {| 
    List of shard-level metrics.
    
     The following are the valid shard-level metrics. The value "[ALL]" enhances every metric.
     
      {ul
           {- [IncomingBytes]
              
              }
            {- [IncomingRecords]
               
               }
            {- [OutgoingBytes]
               
               }
            {- [OutgoingRecords]
               
               }
            {- [WriteProvisionedThroughputExceeded]
               
               }
            {- [ReadProvisionedThroughputExceeded]
               
               }
            {- [IteratorAgeMilliseconds]
               
               }
            {- [ALL]
               
               }
           
      }
       For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html}Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch} in the {i Amazon Kinesis Data Streams Developer Guide}.
        |}]

}

(** 
    Represents the output for [DescribeStreamSummary]
     *)
type stream_description_summary = {
  consumer_count: int option;
  (** 
    The number of enhanced fan-out consumers registered with the stream.
     *)

  open_shard_count: int;
  (** 
    The number of open shards in the stream.
     *)

  key_id: string option;
  [@ocaml.doc {| 
    The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the alias [aws/kinesis].
    
     {ul
          {- Key ARN example: [arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012]
             
             }
           {- Alias ARN example: [
                        arn:aws:kms:us-east-1:123456789012:alias/MyAliasName]
              
              }
           {- Globally unique key ID example: [12345678-1234-1234-1234-123456789012]
              
              }
           {- Alias name example: [alias/MyAliasName]
              
              }
           {- Master key owned by Kinesis Data Streams: [alias/aws/kinesis]
              
              }
          
      }
       |}]

  encryption_type: encryption_type option;
  (** 
    The encryption type used. This value is one of the following:
    
     {ul
          {- [KMS]
             
             }
           {- [NONE]
              
              }
          
      }
       *)

  enhanced_monitoring: enhanced_metrics list;
  (** 
    Represents the current enhanced monitoring settings of the stream.
     *)

  stream_creation_timestamp: float;
  (** 
    The approximate time that the stream was created.
     *)

  retention_period_hours: int;
  (** 
    The current retention period, in hours.
     *)

  stream_mode_details: stream_mode_details option;
  (** 
    Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} ycapacity mode and a {b provisioned} capacity mode for your data streams.
     *)

  stream_status: stream_status;
  (** 
    The current status of the stream being described. The stream status is one of the following states:
    
     {ul
          {- [CREATING] - The stream is being created. Kinesis Data Streams immediately returns and sets [StreamStatus] to [CREATING].
             
             }
           {- [DELETING] - The stream is being deleted. The specified stream is in the [DELETING] state until Kinesis Data Streams completes the deletion.
              
              }
           {- [ACTIVE] - The stream exists and is ready for read and write operations or deletion. You should perform read and write operations only on an [ACTIVE] stream.
              
              }
           {- [UPDATING] - Shards in the stream are being merged or split. Read and write operations continue to work while the stream is in the [UPDATING] state.
              
              }
          
      }
       *)

  stream_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) for the stream being described.
     *)

  stream_name: string;
  (** 
    The name of the stream being described.
     *)

}

(** 
    The range of possible sequence numbers for the shard.
     *)
type sequence_number_range = {
  ending_sequence_number: string option;
  (** 
    The ending sequence number for the range. Shards that are in the OPEN state have an ending sequence number of [null].
     *)

  starting_sequence_number: string;
  (** 
    The starting sequence number for the range.
     *)

}

(** 
    A uniquely identified group of data records in a Kinesis data stream.
     *)
type shard = {
  sequence_number_range: sequence_number_range;
  (** 
    The range of possible sequence numbers for the shard.
     *)

  hash_key_range: hash_key_range;
  (** 
    The range of possible hash key values for the shard, which is a set of ordered contiguous positive integers.
     *)

  adjacent_parent_shard_id: string option;
  (** 
    The shard ID of the shard adjacent to the shard's parent.
     *)

  parent_shard_id: string option;
  (** 
    The shard ID of the shard's parent.
     *)

  shard_id: string;
  (** 
    The unique identifier of the shard within the stream.
     *)

}

(** 
    Represents the output for [DescribeStream].
     *)
type stream_description = {
  key_id: string option;
  [@ocaml.doc {| 
    The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the alias [aws/kinesis].
    
     {ul
          {- Key ARN example: [arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012]
             
             }
           {- Alias ARN example: [arn:aws:kms:us-east-1:123456789012:alias/MyAliasName]
              
              }
           {- Globally unique key ID example: [12345678-1234-1234-1234-123456789012]
              
              }
           {- Alias name example: [alias/MyAliasName]
              
              }
           {- Master key owned by Kinesis Data Streams: [alias/aws/kinesis]
              
              }
          
      }
       |}]

  encryption_type: encryption_type option;
  (** 
    The server-side encryption type used on the stream. This parameter can be one of the following values:
    
     {ul
          {- [NONE]: Do not encrypt the records in the stream.
             
             }
           {- [KMS]: Use server-side encryption on the records in the stream using a customer-managed Amazon Web Services KMS key.
              
              }
          
      }
       *)

  enhanced_monitoring: enhanced_metrics list;
  (** 
    Represents the current enhanced monitoring settings of the stream.
     *)

  stream_creation_timestamp: float;
  (** 
    The approximate time that the stream was created.
     *)

  retention_period_hours: int;
  (** 
    The current retention period, in hours. Minimum value of 24. Maximum value of 168.
     *)

  has_more_shards: bool;
  (** 
    If set to [true], more shards in the stream are available to describe.
     *)

  shards: shard list;
  (** 
    The shards that comprise the stream.
     *)

  stream_mode_details: stream_mode_details option;
  (** 
    Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams.
     *)

  stream_status: stream_status;
  (** 
    The current status of the stream being described. The stream status is one of the following states:
    
     {ul
          {- [CREATING] - The stream is being created. Kinesis Data Streams immediately returns and sets [StreamStatus] to [CREATING].
             
             }
           {- [DELETING] - The stream is being deleted. The specified stream is in the [DELETING] state until Kinesis Data Streams completes the deletion.
              
              }
           {- [ACTIVE] - The stream exists and is ready for read and write operations or deletion. You should perform read and write operations only on an [ACTIVE] stream.
              
              }
           {- [UPDATING] - Shards in the stream are being merged or split. Read and write operations continue to work while the stream is in the [UPDATING] state.
              
              }
          
      }
       *)

  stream_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) for the stream being described.
     *)

  stream_name: string;
  (** 
    The name of the stream being described.
     *)

}

type stop_stream_encryption_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  key_id: string;
  [@ocaml.doc {| 
    The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can be a globally unique identifier, a fully specified Amazon Resource Name (ARN) to either an alias or a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the alias [aws/kinesis].
    
     {ul
          {- Key ARN example: [arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012]
             
             }
           {- Alias ARN example: [arn:aws:kms:us-east-1:123456789012:alias/MyAliasName]
              
              }
           {- Globally unique key ID example: [12345678-1234-1234-1234-123456789012]
              
              }
           {- Alias name example: [alias/MyAliasName]
              
              }
           {- Master key owned by Kinesis Data Streams: [alias/aws/kinesis]
              
              }
          
      }
       |}]

  encryption_type: encryption_type;
  (** 
    The encryption type. The only valid value is [KMS].
     *)

  stream_name: string option;
  (** 
    The name of the stream on which to stop encrypting records.
     *)

}

type start_stream_encryption_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  key_id: string;
  [@ocaml.doc {| 
    The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can be a globally unique identifier, a fully specified Amazon Resource Name (ARN) to either an alias or a key, or an alias name prefixed by "alias/".You can also use a master key owned by Kinesis Data Streams by specifying the alias [aws/kinesis].
    
     {ul
          {- Key ARN example: [arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012]
             
             }
           {- Alias ARN example: [arn:aws:kms:us-east-1:123456789012:alias/MyAliasName]
              
              }
           {- Globally unique key ID example: [12345678-1234-1234-1234-123456789012]
              
              }
           {- Alias name example: [alias/MyAliasName]
              
              }
           {- Master key owned by Kinesis Data Streams: [alias/aws/kinesis]
              
              }
          
      }
       |}]

  encryption_type: encryption_type;
  (** 
    The encryption type to use. The only valid value is [KMS].
     *)

  stream_name: string option;
  (** 
    The name of the stream for which to start encrypting records.
     *)

}

(** 
    Represents the input for [SplitShard].
     *)
type split_shard_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  new_starting_hash_key: string;
  (** 
    A hash key value for the starting hash key of one of the child shards created by the split. The hash key range for a given shard constitutes a set of ordered contiguous positive integers. The value for [NewStartingHashKey] must be in the range of hash keys being mapped into the shard. The [NewStartingHashKey] hash key value and all higher hash key values in hash key range are distributed to one of the child shards. All the lower hash key values in the range are distributed to the other child shard.
     *)

  shard_to_split: string;
  (** 
    The shard ID of the shard to split.
     *)

  stream_name: string option;
  (** 
    The name of the stream for the shard split.
     *)

}

type shard_filter_type = | FROM_TIMESTAMP
  | AT_TIMESTAMP
  | AT_LATEST
  | FROM_TRIM_HORIZON
  | AT_TRIM_HORIZON
  | AFTER_SHARD_ID

(** 
    The request parameter used to filter out the response of the [ListShards] API.
     *)
type shard_filter = {
  timestamp_: float option;
  (** 
    The timestamps specified in the [ShardFilter] parameter. A timestamp is a Unix epoch date with precision in milliseconds. For example, 2016-04-04T19:58:46.480-00:00 or 1459799926.480. This property can only be used if [FROM_TIMESTAMP] or [AT_TIMESTAMP] shard types are specified.
     *)

  shard_id: string option;
  (** 
    The exclusive start [shardID] speified in the [ShardFilter] parameter. This property can only be used if the [AFTER_SHARD_ID] shard type is specified.
     *)

  type_: shard_filter_type;
  (** 
    The shard type specified in the [ShardFilter] parameter. This is a required property of the [ShardFilter] parameter.
    
     You can specify the following valid values:
     
      {ul
           {- [AFTER_SHARD_ID] - the response includes all the shards, starting with the shard whose ID immediately follows the [ShardId] that you provided.
              
              }
            {- [AT_TRIM_HORIZON] - the response includes all the shards that were open at [TRIM_HORIZON].
               
               }
            {- [FROM_TRIM_HORIZON] - (default), the response includes all the shards within the retention period of the data stream (trim to tip).
               
               }
            {- [AT_LATEST] - the response includes only the currently open shards of the data stream.
               
               }
            {- [AT_TIMESTAMP] - the response includes all shards whose start timestamp is less than or equal to the given timestamp and end timestamp is greater than or equal to the given timestamp or still open.
               
               }
            {- [FROM_TIMESTAMP] - the response incldues all closed shards whose end timestamp is greater than or equal to the given timestamp and also all open shards. Corrected to [TRIM_HORIZON] of the data stream if [FROM_TIMESTAMP] is less than the [TRIM_HORIZON] value.
               
               }
           
      }
       *)

}

(** 
    Represents the input for [RemoveTagsFromStream].
     *)
type remove_tags_from_stream_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  tag_keys: string list;
  (** 
    A list of tag keys. Each corresponding tag is removed from the stream.
     *)

  stream_name: string option;
  (** 
    The name of the stream.
     *)

}

type consumer_status = | ACTIVE
  | DELETING
  | CREATING

(** 
    An object that represents the details of the consumer you registered. This type of object is returned by [RegisterStreamConsumer].
     *)
type consumer = {
  consumer_creation_timestamp: float;
  (** 
    
     *)

  consumer_status: consumer_status;
  (** 
    A consumer can't read data while in the [CREATING] or [DELETING] states.
     *)

  consumer_ar_n: string;
  (** 
    When you register a consumer, Kinesis Data Streams generates an ARN for it. You need this ARN to be able to call [SubscribeToShard].
    
     If you delete a consumer and then create a new one with the same name, it won't have the same ARN. That's because consumer ARNs contain the creation timestamp. This is important to keep in mind if you have IAM policies that reference consumer ARNs.
      *)

  consumer_name: string;
  (** 
    The name of the consumer is something you choose when you register the consumer.
     *)

}

type register_stream_consumer_output = {
  consumer: consumer;
  (** 
    An object that represents the details of the consumer you registered. When you register a consumer, it gets an ARN that is generated by Kinesis Data Streams.
     *)

}

type register_stream_consumer_input = {
  consumer_name: string;
  (** 
    For a given Kinesis data stream, each consumer must have a unique name. However, consumer names don't have to be unique across data streams.
     *)

  stream_ar_n: string;
  (** 
    The ARN of the Kinesis data stream that you want to register the consumer with. For more info, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.
     *)

}

type put_resource_policy_input = {
  policy: string;
  (** 
    Details of the resource policy. It must include the identity of the principal and the actions allowed on this resource. This is formatted as a JSON string.
     *)

  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the data stream or consumer.
     *)

}

(** 
    Represents the result of an individual record from a [PutRecords] request. A record that is successfully added to a stream includes [SequenceNumber] and [ShardId] in the result. A record that fails to be added to the stream includes [ErrorCode] and [ErrorMessage] in the result.
     *)
type put_records_result_entry = {
  error_message: string option;
  [@ocaml.doc {| 
    The error message for an individual record result. An [ErrorCode] value of [ProvisionedThroughputExceededException] has an error message that includes the account ID, stream name, and shard ID. An [ErrorCode] value of [InternalFailure] has the error message ["Internal Service
                Failure"].
     |}]

  error_code: string option;
  (** 
    The error code for an individual record result. [ErrorCodes] can be either [ProvisionedThroughputExceededException] or [InternalFailure].
     *)

  shard_id: string option;
  (** 
    The shard ID for an individual record result.
     *)

  sequence_number: string option;
  (** 
    The sequence number for an individual record result.
     *)

}

(** 
    Represents the output for [PutRecords].
     *)
type put_records_request_entry = {
  partition_key: string;
  (** 
    Determines which shard in the stream the data record is assigned to. Partition keys are Unicode strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams uses the partition key as input to a hash function that maps the partition key and associated data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream.
     *)

  explicit_hash_key: string option;
  (** 
    The hash value used to determine explicitly the shard that the data record is assigned to by overriding the partition key hash.
     *)

  data: bytes;
  (** 
    The data blob to put into the record, which is base64-encoded when the blob is serialized. When the data blob (the payload before base64-encoding) is added to the partition key size, the total size must not exceed the maximum record size (1 MiB).
     *)

}

(** 
    [PutRecords] results.
     *)
type put_records_output = {
  encryption_type: encryption_type option;
  (** 
    The encryption type used on the records. This parameter can be one of the following values:
    
     {ul
          {- [NONE]: Do not encrypt the records.
             
             }
           {- [KMS]: Use server-side encryption on the records using a customer-managed Amazon Web Services KMS key.
              
              }
          
      }
       *)

  records: put_records_result_entry list;
  (** 
    An array of successfully and unsuccessfully processed record results. A record that is successfully added to a stream includes [SequenceNumber] and [ShardId] in the result. A record that fails to be added to a stream includes [ErrorCode] and [ErrorMessage] in the result.
     *)

  failed_record_count: int option;
  (** 
    The number of unsuccessfully processed records in a [PutRecords] request.
     *)

}

(** 
    A [PutRecords] request.
     *)
type put_records_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  stream_name: string option;
  (** 
    The stream name associated with the request.
     *)

  records: put_records_request_entry list;
  (** 
    The records associated with the request.
     *)

}

(** 
    The request rate for the stream is too high, or the requested data is too large for the available throughput. Reduce the frequency or size of your requests. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}, and {{:https://docs.aws.amazon.com/general/latest/gr/api-retries.html}Error Retries and Exponential Backoff in Amazon Web Services} in the {i Amazon Web Services General Reference}.
     *)
type provisioned_throughput_exceeded_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    Represents the output for [PutRecord].
     *)
type put_record_output = {
  encryption_type: encryption_type option;
  (** 
    The encryption type to use on the record. This parameter can be one of the following values:
    
     {ul
          {- [NONE]: Do not encrypt the records in the stream.
             
             }
           {- [KMS]: Use server-side encryption on the records in the stream using a customer-managed Amazon Web Services KMS key.
              
              }
          
      }
       *)

  sequence_number: string;
  (** 
    The sequence number identifier that was assigned to the put data record. The sequence number for the record is unique across all records in the stream. A sequence number is the identifier associated with every record put into the stream.
     *)

  shard_id: string;
  (** 
    The shard ID of the shard where the data record was placed.
     *)

}

(** 
    Represents the input for [PutRecord].
     *)
type put_record_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  sequence_number_for_ordering: string option;
  (** 
    Guarantees strictly increasing sequence numbers, for puts from the same client and to the same partition key. Usage: set the [SequenceNumberForOrdering] of record {i n} to the sequence number of record {i n-1} (as returned in the result when putting record {i n-1}). If this parameter is not set, records are coarsely ordered based on arrival time.
     *)

  explicit_hash_key: string option;
  (** 
    The hash value used to explicitly determine the shard the data record is assigned to by overriding the partition key hash.
     *)

  partition_key: string;
  (** 
    Determines which shard in the stream the data record is assigned to. Partition keys are Unicode strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams uses the partition key as input to a hash function that maps the partition key and associated data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream.
     *)

  data: bytes;
  (** 
    The data blob to put into the record, which is base64-encoded when the blob is serialized. When the data blob (the payload before base64-encoding) is added to the partition key size, the total size must not exceed the maximum record size (1 MiB).
     *)

  stream_name: string option;
  (** 
    The name of the stream to put the data record into.
     *)

}

(** 
    Represents the input for [MergeShards].
     *)
type merge_shards_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  adjacent_shard_to_merge: string;
  (** 
    The shard ID of the adjacent shard for the merge.
     *)

  shard_to_merge: string;
  (** 
    The shard ID of the shard to combine with the adjacent shard for the merge.
     *)

  stream_name: string option;
  (** 
    The name of the stream for the merge.
     *)

}

(** 
    Represents the output for [ListTagsForStream].
     *)
type list_tags_for_stream_output = {
  has_more_tags: bool;
  (** 
    If set to [true], more tags are available. To request additional tags, set [ExclusiveStartTagKey] to the key of the last tag returned.
     *)

  tags: tag list;
  (** 
    A list of tags associated with [StreamName], starting with the first tag after [ExclusiveStartTagKey] and up to the specified [Limit].
     *)

}

(** 
    Represents the input for [ListTagsForStream].
     *)
type list_tags_for_stream_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  limit: int option;
  (** 
    The number of tags to return. If this number is less than the total number of tags associated with the stream, [HasMoreTags] is set to [true]. To list additional tags, set [ExclusiveStartTagKey] to the last key in the response.
     *)

  exclusive_start_tag_key: string option;
  (** 
    The key to use as the starting point for the list of tags. If this parameter is set, [ListTagsForStream] gets all tags that occur after [ExclusiveStartTagKey].
     *)

  stream_name: string option;
  (** 
    The name of the stream.
     *)

}

(** 
    Represents the output for [ListStreams].
     *)
type list_streams_output = {
  stream_summaries: stream_summary list option;
  (** 
    
     *)

  next_token: string option;
  (** 
    
     *)

  has_more_streams: bool;
  (** 
    If set to [true], there are more streams available to list.
     *)

  stream_names: string list;
  (** 
    The names of the streams that are associated with the Amazon Web Services account making the [ListStreams] request.
     *)

}

(** 
    Represents the input for [ListStreams].
     *)
type list_streams_input = {
  next_token: string option;
  (** 
    
     *)

  exclusive_start_stream_name: string option;
  (** 
    The name of the stream to start the list with.
     *)

  limit: int option;
  (** 
    The maximum number of streams to list. The default value is 100. If you specify a value greater than 100, at most 100 results are returned.
     *)

}

(** 
    The pagination token passed to the operation is expired.
     *)
type expired_next_token_exception = {
  message: string option;
  
}

type list_stream_consumers_output = {
  next_token: string option;
  (** 
    When the number of consumers that are registered with the data stream is greater than the default value for the [MaxResults] parameter, or if you explicitly specify a value for [MaxResults] that is less than the number of registered consumers, the response includes a pagination token named [NextToken]. You can specify this [NextToken] value in a subsequent call to [ListStreamConsumers] to list the next set of registered consumers. For more information about the use of this pagination token when calling the [ListStreamConsumers] operation, see [ListStreamConsumersInput$NextToken].
    
     Tokens expire after 300 seconds. When you obtain a value for [NextToken] in the response to a call to [ListStreamConsumers], you have 300 seconds to use that value. If you specify an expired token in a call to [ListStreamConsumers], you get [ExpiredNextTokenException].
     
      *)

  consumers: consumer list option;
  (** 
    An array of JSON objects. Each object represents one registered consumer.
     *)

}

type list_stream_consumers_input = {
  stream_creation_timestamp: float option;
  (** 
    Specify this input parameter to distinguish data streams that have the same name. For example, if you create a data stream and then delete it, and you later create another data stream with the same name, you can use this input parameter to specify which of the two streams you want to list the consumers for.
    
     You can't specify this parameter if you specify the NextToken parameter.
      *)

  max_results: int option;
  (** 
    The maximum number of consumers that you want a single call of [ListStreamConsumers] to return. The default value is 100. If you specify a value greater than 100, at most 100 results are returned.
     *)

  next_token: string option;
  (** 
    When the number of consumers that are registered with the data stream is greater than the default value for the [MaxResults] parameter, or if you explicitly specify a value for [MaxResults] that is less than the number of consumers that are registered with the data stream, the response includes a pagination token named [NextToken]. You can specify this [NextToken] value in a subsequent call to [ListStreamConsumers] to list the next set of registered consumers.
    
     Don't specify [StreamName] or [StreamCreationTimestamp] if you specify [NextToken] because the latter unambiguously identifies the stream.
     
      You can optionally specify a value for the [MaxResults] parameter when you specify [NextToken]. If you specify a [MaxResults] value that is less than the number of consumers that the operation returns if you don't specify [MaxResults], the response will contain a new [NextToken] value. You can use the new [NextToken] value in a subsequent call to the [ListStreamConsumers] operation to list the next set of consumers.
      
       Tokens expire after 300 seconds. When you obtain a value for [NextToken] in the response to a call to [ListStreamConsumers], you have 300 seconds to use that value. If you specify an expired token in a call to [ListStreamConsumers], you get [ExpiredNextTokenException].
       
        *)

  stream_ar_n: string;
  (** 
    The ARN of the Kinesis data stream for which you want to list the registered consumers. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.
     *)

}

type list_shards_output = {
  next_token: string option;
  (** 
    When the number of shards in the data stream is greater than the default value for the [MaxResults] parameter, or if you explicitly specify a value for [MaxResults] that is less than the number of shards in the data stream, the response includes a pagination token named [NextToken]. You can specify this [NextToken] value in a subsequent call to [ListShards] to list the next set of shards. For more information about the use of this pagination token when calling the [ListShards] operation, see [ListShardsInput$NextToken].
    
     Tokens expire after 300 seconds. When you obtain a value for [NextToken] in the response to a call to [ListShards], you have 300 seconds to use that value. If you specify an expired token in a call to [ListShards], you get [ExpiredNextTokenException].
     
      *)

  shards: shard list option;
  (** 
    An array of JSON objects. Each object represents one shard and specifies the IDs of the shard, the shard's parent, and the shard that's adjacent to the shard's parent. Each object also contains the starting and ending hash keys and the starting and ending sequence numbers for the shard.
     *)

}

type list_shards_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  shard_filter: shard_filter option;
  (** 
    Enables you to filter out the response of the [ListShards] API. You can only specify one filter at a time.
    
     If you use the [ShardFilter] parameter when invoking the ListShards API, the [Type] is the required property and must be specified. If you specify the [AT_TRIM_HORIZON], [FROM_TRIM_HORIZON], or [AT_LATEST] types, you do not need to specify either the [ShardId] or the [Timestamp] optional properties.
     
      If you specify the [AFTER_SHARD_ID] type, you must also provide the value for the optional [ShardId] property. The [ShardId] property is identical in fuctionality to the [ExclusiveStartShardId] parameter of the [ListShards] API. When [ShardId] property is specified, the response includes the shards starting with the shard whose ID immediately follows the [ShardId] that you provided.
      
       If you specify the [AT_TIMESTAMP] or [FROM_TIMESTAMP_ID] type, you must also provide the value for the optional [Timestamp] property. If you specify the AT_TIMESTAMP type, then all shards that were open at the provided timestamp are returned. If you specify the FROM_TIMESTAMP type, then all shards starting from the provided timestamp to TIP are returned.
        *)

  stream_creation_timestamp: float option;
  (** 
    Specify this input parameter to distinguish data streams that have the same name. For example, if you create a data stream and then delete it, and you later create another data stream with the same name, you can use this input parameter to specify which of the two streams you want to list the shards for.
    
     You cannot specify this parameter if you specify the [NextToken] parameter.
      *)

  max_results: int option;
  (** 
    The maximum number of shards to return in a single call to [ListShards]. The maximum number of shards to return in a single call. The default value is 1000. If you specify a value greater than 1000, at most 1000 results are returned.
    
     When the number of shards to be listed is greater than the value of [MaxResults], the response contains a [NextToken] value that you can use in a subsequent call to [ListShards] to list the next set of shards.
      *)

  exclusive_start_shard_id: string option;
  (** 
    Specify this parameter to indicate that you want to list the shards starting with the shard whose ID immediately follows [ExclusiveStartShardId].
    
     If you don't specify this parameter, the default behavior is for [ListShards] to list the shards starting with the first one in the stream.
     
      You cannot specify this parameter if you specify [NextToken].
       *)

  next_token: string option;
  (** 
    When the number of shards in the data stream is greater than the default value for the [MaxResults] parameter, or if you explicitly specify a value for [MaxResults] that is less than the number of shards in the data stream, the response includes a pagination token named [NextToken]. You can specify this [NextToken] value in a subsequent call to [ListShards] to list the next set of shards.
    
     Don't specify [StreamName] or [StreamCreationTimestamp] if you specify [NextToken] because the latter unambiguously identifies the stream.
     
      You can optionally specify a value for the [MaxResults] parameter when you specify [NextToken]. If you specify a [MaxResults] value that is less than the number of shards that the operation returns if you don't specify [MaxResults], the response will contain a new [NextToken] value. You can use the new [NextToken] value in a subsequent call to the [ListShards] operation.
      
       Tokens expire after 300 seconds. When you obtain a value for [NextToken] in the response to a call to [ListShards], you have 300 seconds to use that value. If you specify an expired token in a call to [ListShards], you get [ExpiredNextTokenException].
       
        *)

  stream_name: string option;
  (** 
    The name of the data stream whose shards you want to list.
    
     You cannot specify this parameter if you specify the [NextToken] parameter.
      *)

}

(** 
    Represents the input for [IncreaseStreamRetentionPeriod].
     *)
type increase_stream_retention_period_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  retention_period_hours: int;
  (** 
    The new retention period of the stream, in hours. Must be more than the current retention period.
     *)

  stream_name: string option;
  (** 
    The name of the stream to modify.
     *)

}

(** 
    Represents the output for [GetShardIterator].
     *)
type get_shard_iterator_output = {
  shard_iterator: string option;
  (** 
    The position in the shard from which to start reading data records sequentially. A shard iterator specifies this position using the sequence number of a data record in a shard.
     *)

}

(** 
    Represents the input for [GetShardIterator].
     *)
type get_shard_iterator_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  timestamp_: float option;
  (** 
    The time stamp of the data record from which to start reading. Used with shard iterator type AT_TIMESTAMP. A time stamp is the Unix epoch date with precision in milliseconds. For example, [2016-04-04T19:58:46.480-00:00] or [1459799926.480]. If a record with this exact time stamp does not exist, the iterator returned is for the next (later) record. If the time stamp is older than the current trim horizon, the iterator returned is for the oldest untrimmed data record (TRIM_HORIZON).
     *)

  starting_sequence_number: string option;
  (** 
    The sequence number of the data record in the shard from which to start reading. Used with shard iterator type AT_SEQUENCE_NUMBER and AFTER_SEQUENCE_NUMBER.
     *)

  shard_iterator_type: shard_iterator_type;
  (** 
    Determines how the shard iterator is used to start reading data records from the shard.
    
     The following are the valid Amazon Kinesis shard iterator types:
     
      {ul
           {- AT_SEQUENCE_NUMBER - Start reading from the position denoted by a specific sequence number, provided in the value [StartingSequenceNumber].
              
              }
            {- AFTER_SEQUENCE_NUMBER - Start reading right after the position denoted by a specific sequence number, provided in the value [StartingSequenceNumber].
               
               }
            {- AT_TIMESTAMP - Start reading from the position denoted by a specific time stamp, provided in the value [Timestamp].
               
               }
            {- TRIM_HORIZON - Start reading at the last untrimmed record in the shard in the system, which is the oldest data record in the shard.
               
               }
            {- LATEST - Start reading just after the most recent record in the shard, so that you always read the most recent data in the shard.
               
               }
           
      }
       *)

  shard_id: string;
  (** 
    The shard ID of the Kinesis Data Streams shard to get the iterator for.
     *)

  stream_name: string option;
  (** 
    The name of the Amazon Kinesis data stream.
     *)

}

type get_resource_policy_output = {
  policy: string;
  (** 
    Details of the resource policy. This is formatted as a JSON string.
     *)

}

type get_resource_policy_input = {
  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the data stream or consumer.
     *)

}

(** 
    The provided iterator exceeds the maximum age allowed.
     *)
type expired_iterator_exception = {
  message: string option;
  (** 
    A message that provides information about the error.
     *)

}

(** 
    Represents the output for [GetRecords].
     *)
type get_records_output = {
  child_shards: child_shard list option;
  (** 
    The list of the current shard's child shards, returned in the [GetRecords] API's response only when the end of the current shard is reached.
     *)

  millis_behind_latest: int option;
  (** 
    The number of milliseconds the [GetRecords] response is from the tip of the stream, indicating how far behind current time the consumer is. A value of zero indicates that record processing is caught up, and there are no new records to process at this moment.
     *)

  next_shard_iterator: string option;
  (** 
    The next position in the shard from which to start sequentially reading data records. If set to [null], the shard has been closed and the requested iterator does not return any more data.
     *)

  records: record list;
  (** 
    The data records retrieved from the shard.
     *)

}

(** 
    Represents the input for [GetRecords].
     *)
type get_records_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  limit: int option;
  (** 
    The maximum number of records to return. Specify a value of up to 10,000. If you specify a value that is greater than 10,000, [GetRecords] throws [InvalidArgumentException]. The default value is 10,000.
     *)

  shard_iterator: string;
  (** 
    The position in the shard from which you want to start sequentially reading data records. A shard iterator specifies this position using the sequence number of a data record in the shard.
     *)

}

(** 
    Represents the output for [EnableEnhancedMonitoring] and [DisableEnhancedMonitoring].
     *)
type enhanced_monitoring_output = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  desired_shard_level_metrics: metrics_name list option;
  (** 
    Represents the list of all the metrics that would be in the enhanced state after the operation.
     *)

  current_shard_level_metrics: metrics_name list option;
  (** 
    Represents the current state of the metrics that are in the enhanced state before the operation.
     *)

  stream_name: string option;
  (** 
    The name of the Kinesis data stream.
     *)

}

(** 
    Represents the input for [EnableEnhancedMonitoring].
     *)
type enable_enhanced_monitoring_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  shard_level_metrics: metrics_name list;
  [@ocaml.doc {| 
    List of shard-level metrics to enable.
    
     The following are the valid shard-level metrics. The value "[ALL]" enables every metric.
     
      {ul
           {- [IncomingBytes]
              
              }
            {- [IncomingRecords]
               
               }
            {- [OutgoingBytes]
               
               }
            {- [OutgoingRecords]
               
               }
            {- [WriteProvisionedThroughputExceeded]
               
               }
            {- [ReadProvisionedThroughputExceeded]
               
               }
            {- [IteratorAgeMilliseconds]
               
               }
            {- [ALL]
               
               }
           
      }
       For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html}Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch} in the {i Amazon Kinesis Data Streams Developer Guide}.
        |}]

  stream_name: string option;
  (** 
    The name of the stream for which to enable enhanced monitoring.
     *)

}

(** 
    Represents the input for [DisableEnhancedMonitoring].
     *)
type disable_enhanced_monitoring_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  shard_level_metrics: metrics_name list;
  [@ocaml.doc {| 
    List of shard-level metrics to disable.
    
     The following are the valid shard-level metrics. The value "[ALL]" disables every metric.
     
      {ul
           {- [IncomingBytes]
              
              }
            {- [IncomingRecords]
               
               }
            {- [OutgoingBytes]
               
               }
            {- [OutgoingRecords]
               
               }
            {- [WriteProvisionedThroughputExceeded]
               
               }
            {- [ReadProvisionedThroughputExceeded]
               
               }
            {- [IteratorAgeMilliseconds]
               
               }
            {- [ALL]
               
               }
           
      }
       For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html}Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch} in the {i Amazon Kinesis Data Streams Developer Guide}.
        |}]

  stream_name: string option;
  (** 
    The name of the Kinesis data stream for which to disable enhanced monitoring.
     *)

}

type describe_stream_summary_output = {
  stream_description_summary: stream_description_summary;
  (** 
    A [StreamDescriptionSummary] containing information about the stream.
     *)

}

type describe_stream_summary_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  stream_name: string option;
  (** 
    The name of the stream to describe.
     *)

}

(** 
    An object that represents the details of a registered consumer. This type of object is returned by [DescribeStreamConsumer].
     *)
type consumer_description = {
  stream_ar_n: string;
  (** 
    The ARN of the stream with which you registered the consumer.
     *)

  consumer_creation_timestamp: float;
  (** 
    
     *)

  consumer_status: consumer_status;
  (** 
    A consumer can't read data while in the [CREATING] or [DELETING] states.
     *)

  consumer_ar_n: string;
  (** 
    When you register a consumer, Kinesis Data Streams generates an ARN for it. You need this ARN to be able to call [SubscribeToShard].
    
     If you delete a consumer and then create a new one with the same name, it won't have the same ARN. That's because consumer ARNs contain the creation timestamp. This is important to keep in mind if you have IAM policies that reference consumer ARNs.
      *)

  consumer_name: string;
  (** 
    The name of the consumer is something you choose when you register the consumer.
     *)

}

type describe_stream_consumer_output = {
  consumer_description: consumer_description;
  (** 
    An object that represents the details of the consumer.
     *)

}

type describe_stream_consumer_input = {
  consumer_ar_n: string option;
  (** 
    The ARN returned by Kinesis Data Streams when you registered the consumer.
     *)

  consumer_name: string option;
  (** 
    The name that you gave to the consumer.
     *)

  stream_ar_n: string option;
  (** 
    The ARN of the Kinesis data stream that the consumer is registered with. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.
     *)

}

(** 
    Represents the output for [DescribeStream].
     *)
type describe_stream_output = {
  stream_description: stream_description;
  (** 
    The current status of the stream, the stream Amazon Resource Name (ARN), an array of shard objects that comprise the stream, and whether there are more shards available.
     *)

}

(** 
    Represents the input for [DescribeStream].
     *)
type describe_stream_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  exclusive_start_shard_id: string option;
  (** 
    The shard ID of the shard to start with.
    
     Specify this parameter to indicate that you want to describe the stream starting with the shard whose ID immediately follows [ExclusiveStartShardId].
     
      If you don't specify this parameter, the default behavior for [DescribeStream] is to describe the stream starting with the first shard in the stream.
       *)

  limit: int option;
  (** 
    The maximum number of shards to return in a single call. The default value is 100. If you specify a value greater than 100, at most 100 results are returned.
     *)

  stream_name: string option;
  (** 
    The name of the stream to describe.
     *)

}

type describe_limits_output = {
  on_demand_stream_count_limit: int;
  (** 
    The maximum number of data streams with the on-demand capacity mode.
     *)

  on_demand_stream_count: int;
  (** 
    Indicates the number of data streams with the on-demand capacity mode.
     *)

  open_shard_count: int;
  (** 
    The number of open shards.
     *)

  shard_limit: int;
  (** 
    The maximum number of shards.
     *)

}

type describe_limits_input = unit

type deregister_stream_consumer_input = {
  consumer_ar_n: string option;
  (** 
    The ARN returned by Kinesis Data Streams when you registered the consumer. If you don't know the ARN of the consumer that you want to deregister, you can use the ListStreamConsumers operation to get a list of the descriptions of all the consumers that are currently registered with a given data stream. The description of a consumer contains its ARN.
     *)

  consumer_name: string option;
  (** 
    The name that you gave to the consumer.
     *)

  stream_ar_n: string option;
  (** 
    The ARN of the Kinesis data stream that the consumer is registered with. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.
     *)

}

(** 
    Represents the input for [DeleteStream].
     *)
type delete_stream_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  enforce_consumer_deletion: bool option;
  (** 
    If this parameter is unset ([null]) or if you set it to [false], and the stream has registered consumers, the call to [DeleteStream] fails with a [ResourceInUseException].
     *)

  stream_name: string option;
  (** 
    The name of the stream to delete.
     *)

}

type delete_resource_policy_input = {
  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the data stream or consumer.
     *)

}

(** 
    Represents the input for [DecreaseStreamRetentionPeriod].
     *)
type decrease_stream_retention_period_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  retention_period_hours: int;
  (** 
    The new retention period of the stream, in hours. Must be less than the current retention period.
     *)

  stream_name: string option;
  (** 
    The name of the stream to modify.
     *)

}

(** 
    Represents the input for [CreateStream].
     *)
type create_stream_input = {
  stream_mode_details: stream_mode_details option;
  (** 
    Indicates the capacity mode of the data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams.
     *)

  shard_count: int option;
  (** 
    The number of shards that the stream will use. The throughput of the stream is a function of the number of shards; more shards are required for greater provisioned throughput.
     *)

  stream_name: string;
  (** 
    A name to identify the stream. The stream name is scoped to the Amazon Web Services account used by the application that creates the stream. It is also scoped by Amazon Web Services Region. That is, two streams in two different Amazon Web Services accounts can have the same name. Two streams in the same Amazon Web Services account but in two different Regions can also have the same name.
     *)

}

(** 
    Represents the input for [AddTagsToStream].
     *)
type add_tags_to_stream_input = {
  stream_ar_n: string option;
  (** 
    The ARN of the stream.
     *)

  tags: (string * string) list;
  (** 
    A set of up to 10 key-value pairs to use to create the tags.
     *)

  stream_name: string option;
  (** 
    The name of the stream.
     *)

}

(** 
    Amazon Kinesis Data Streams Service API Reference Amazon Kinesis Data Streams is a managed service that scales elastically for real-time processing of streaming big data.
                                                       *)


type base_document = Json.t

