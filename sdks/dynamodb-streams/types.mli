open Smaws_Lib
val service : Service.descriptor

(** 
    The operation attempted to read past the oldest stream record in a shard.
    
     In DynamoDB Streams, there is a 24 hour limit on data retention. Stream records whose age exceeds this limit are subject to removal (trimming) from the stream. You might receive a TrimmedDataAccessException if:
     
      {ul
           {- You request a shard iterator with a sequence number older than the trim point (24 hours).
              
              }
            {- You obtain a shard iterator, but before you use the iterator in a [GetRecords] request, a stream record in the shard exceeds the 24 hour period and is trimmed. This causes the iterator to access a record that no longer exists.
               
               }
           
      }
       *)
type trimmed_data_access_exception = {
  message: string option;
  [@ocaml.doc {| 
    "The data you are trying to access has been trimmed.
     |}]

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

(** 
    A description of a single data modification that was performed on an item in a DynamoDB table.
     *)
type stream_record = {
  stream_view_type: stream_view_type option;
  (** 
    The type of data from the modified DynamoDB item that was captured in this stream record:
    
     {ul
          {- [KEYS_ONLY] - only the key attributes of the modified item.
             
             }
           {- [NEW_IMAGE] - the entire item, as it appeared after it was modified.
              
              }
           {- [OLD_IMAGE] - the entire item, as it appeared before it was modified.
              
              }
           {- [NEW_AND_OLD_IMAGES] - both the new and the old item images of the item.
              
              }
          
      }
       *)

  size_bytes: int option;
  (** 
    The size of the stream record, in bytes.
     *)

  sequence_number: string option;
  (** 
    The sequence number of the stream record.
     *)

  old_image: (string * attribute_value) list option;
  (** 
    The item in the DynamoDB table as it appeared before it was modified.
     *)

  new_image: (string * attribute_value) list option;
  (** 
    The item in the DynamoDB table as it appeared after it was modified.
     *)

  keys: (string * attribute_value) list option;
  (** 
    The primary key attribute(s) for the DynamoDB item that was modified.
     *)

  approximate_creation_date_time: float option;
  (** 
    The approximate date and time when the stream record was created, in {{:http://www.epochconverter.com/}UNIX epoch time} format and rounded down to the closest second.
     *)

}

(** 
    Represents all of the data describing a particular stream.
     *)
type stream = {
  stream_label: string option;
  (** 
    A timestamp, in ISO 8601 format, for this stream.
    
     Note that [LatestStreamLabel] is not a unique identifier for the stream, because it is possible that a stream from another table might have the same timestamp. However, the combination of the following three elements is guaranteed to be unique:
     
      {ul
           {- the Amazon Web Services customer ID.
              
              }
            {- the table name
               
               }
            {- the [StreamLabel]
               
               }
           
      }
       *)

  table_name: string option;
  (** 
    The DynamoDB table with which the stream is associated.
     *)

  stream_arn: string option;
  (** 
    The Amazon Resource Name (ARN) for the stream.
     *)

}

type key_type = | RANGE
  | HASH

(** 
    Represents {i a single element} of a key schema. A key schema specifies the attributes that make up the primary key of a table, or the key attributes of an index.
    
     A [KeySchemaElement] represents exactly one attribute of the primary key. For example, a simple primary key would be represented by one [KeySchemaElement] (for the partition key). A composite primary key would require one [KeySchemaElement] for the partition key, and another [KeySchemaElement] for the sort key.
     
      A [KeySchemaElement] must be a scalar, top-level attribute (not a nested attribute). The data type must be one of String, Number, or Binary. The attribute cannot be nested within a List or a Map.
       *)
type key_schema_element = {
  key_type: key_type;
  [@ocaml.doc {| 
    The role that this key attribute will assume:
    
     {ul
          {- [HASH] - partition key
             
             }
           {- [RANGE] - sort key
              
              }
          
      }
       The partition key of an item is also known as its {i hash attribute}. The term "hash attribute" derives from DynamoDB's usage of an internal hash function to evenly distribute data items across partitions, based on their partition key values.
       
        The sort key of an item is also known as its {i range attribute}. The term "range attribute" derives from the way DynamoDB stores items with the same partition key physically close together, in sorted order by the sort key value.
        
         |}]

  attribute_name: string;
  (** 
    The name of a key attribute.
     *)

}

(** 
    The beginning and ending sequence numbers for the stream records contained within a shard.
     *)
type sequence_number_range = {
  ending_sequence_number: string option;
  (** 
    The last sequence number for the stream records contained within a shard. String contains numeric characters only.
     *)

  starting_sequence_number: string option;
  (** 
    The first sequence number for the stream records contained within a shard. String contains numeric characters only.
     *)

}

(** 
    A uniquely identified group of stream records within a stream.
     *)
type shard = {
  parent_shard_id: string option;
  (** 
    The shard ID of the current shard's parent.
     *)

  sequence_number_range: sequence_number_range option;
  (** 
    The range of possible sequence numbers for the shard.
     *)

  shard_id: string option;
  (** 
    The system-generated identifier for this shard.
     *)

}

(** 
    Represents all of the data describing a particular stream.
     *)
type stream_description = {
  last_evaluated_shard_id: string option;
  [@ocaml.doc {| 
    The shard ID of the item where the operation stopped, inclusive of the previous result set. Use this value to start a new operation, excluding this value in the new request.
    
     If [LastEvaluatedShardId] is empty, then the "last page" of results has been processed and there is currently no more data to be retrieved.
     
      If [LastEvaluatedShardId] is not empty, it does not necessarily mean that there is more data in the result set. The only way to know when you have reached the end of the result set is when [LastEvaluatedShardId] is empty.
       |}]

  shards: shard list option;
  (** 
    The shards that comprise the stream.
     *)

  key_schema: key_schema_element list option;
  (** 
    The key attribute(s) of the stream's DynamoDB table.
     *)

  table_name: string option;
  (** 
    The DynamoDB table with which the stream is associated.
     *)

  creation_request_date_time: float option;
  (** 
    The date and time when the request to create this stream was issued.
     *)

  stream_view_type: stream_view_type option;
  (** 
    Indicates the format of the records within this stream:
    
     {ul
          {- [KEYS_ONLY] - only the key attributes of items that were modified in the DynamoDB table.
             
             }
           {- [NEW_IMAGE] - entire items from the table, as they appeared after they were modified.
              
              }
           {- [OLD_IMAGE] - entire items from the table, as they appeared before they were modified.
              
              }
           {- [NEW_AND_OLD_IMAGES] - both the new and the old images of the items from the table.
              
              }
          
      }
       *)

  stream_status: stream_status option;
  (** 
    Indicates the current status of the stream:
    
     {ul
          {- [ENABLING] - Streams is currently being enabled on the DynamoDB table.
             
             }
           {- [ENABLED] - the stream is enabled.
              
              }
           {- [DISABLING] - Streams is currently being disabled on the DynamoDB table.
              
              }
           {- [DISABLED] - the stream is disabled.
              
              }
          
      }
       *)

  stream_label: string option;
  (** 
    A timestamp, in ISO 8601 format, for this stream.
    
     Note that [LatestStreamLabel] is not a unique identifier for the stream, because it is possible that a stream from another table might have the same timestamp. However, the combination of the following three elements is guaranteed to be unique:
     
      {ul
           {- the Amazon Web Services customer ID.
              
              }
            {- the table name
               
               }
            {- the [StreamLabel]
               
               }
           
      }
       *)

  stream_arn: string option;
  (** 
    The Amazon Resource Name (ARN) for the stream.
     *)

}

type shard_iterator_type = | AFTER_SEQUENCE_NUMBER
  | AT_SEQUENCE_NUMBER
  | LATEST
  | TRIM_HORIZON

(** 
    The operation tried to access a nonexistent table or index. The resource might not be specified correctly, or its status might not be [ACTIVE].
     *)
type resource_not_found_exception = {
  message: string option;
  (** 
    The resource which is being requested does not exist.
     *)

}

type operation_type = | REMOVE
  | MODIFY
  | INSERT

(** 
    Contains details about the type of identity that made the request.
     *)
type identity = {
  type_: string option;
  [@ocaml.doc {| 
    The type of the identity. For Time To Live, the type is "Service".
     |}]

  principal_id: string option;
  [@ocaml.doc {| 
    A unique identifier for the entity that made the call. For Time To Live, the principalId is "dynamodb.amazonaws.com".
     |}]

}

(** 
    A description of a unique event within a stream.
     *)
type record = {
  user_identity: identity option;
  [@ocaml.doc {| 
    Items that are deleted by the Time to Live process after expiration have the following fields:
    
     {ul
          {- Records[].userIdentity.type
             
              "Service"
              
              }
           {- Records[].userIdentity.principalId
              
               "dynamodb.amazonaws.com"
               
               }
          
      }
       |}]

  dynamodb: stream_record option;
  (** 
    The main body of the stream record, containing all of the DynamoDB-specific fields.
     *)

  aws_region: string option;
  (** 
    The region in which the [GetRecords] request was received.
     *)

  event_source: string option;
  (** 
    The Amazon Web Services service from which the stream record originated. For DynamoDB Streams, this is [aws:dynamodb].
     *)

  event_version: string option;
  (** 
    The version number of the stream record format. This number is updated whenever the structure of [Record] is modified.
    
     Client applications must not assume that [eventVersion] will remain at a particular value, as this number is subject to change at any time. In general, [eventVersion] will only increase as the low-level DynamoDB Streams API evolves.
      *)

  event_name: operation_type option;
  (** 
    The type of data modification that was performed on the DynamoDB table:
    
     {ul
          {- [INSERT] - a new item was added to the table.
             
             }
           {- [MODIFY] - one or more of an existing item's attributes were modified.
              
              }
           {- [REMOVE] - the item was deleted from the table
              
              }
          
      }
       *)

  event_i_d: string option;
  (** 
    A globally unique identifier for the event that was recorded in this stream record.
     *)

}

(** 
    Represents the output of a [ListStreams] operation.
     *)
type list_streams_output = {
  last_evaluated_stream_arn: string option;
  [@ocaml.doc {| 
    The stream ARN of the item where the operation stopped, inclusive of the previous result set. Use this value to start a new operation, excluding this value in the new request.
    
     If [LastEvaluatedStreamArn] is empty, then the "last page" of results has been processed and there is no more data to be retrieved.
     
      If [LastEvaluatedStreamArn] is not empty, it does not necessarily mean that there is more data in the result set. The only way to know when you have reached the end of the result set is when [LastEvaluatedStreamArn] is empty.
       |}]

  streams: stream list option;
  (** 
    A list of stream descriptors associated with the current account and endpoint.
     *)

}

(** 
    Represents the input of a [ListStreams] operation.
     *)
type list_streams_input = {
  exclusive_start_stream_arn: string option;
  (** 
    The ARN (Amazon Resource Name) of the first item that this operation will evaluate. Use the value that was returned for [LastEvaluatedStreamArn] in the previous operation.
     *)

  limit: int option;
  (** 
    The maximum number of streams to return. The upper limit is 100.
     *)

  table_name: string option;
  (** 
    If this parameter is provided, then only the streams associated with this table name are returned.
     *)

}

(** 
    An error occurred on the server side.
     *)
type internal_server_error = {
  message: string option;
  (** 
    The server encountered an internal error trying to fulfill the request.
     *)

}

(** 
    There is no limit to the number of daily on-demand backups that can be taken.
    
     For most purposes, up to 500 simultaneous table operations are allowed per account. These operations include [CreateTable], [UpdateTable], [DeleteTable],[UpdateTimeToLive], [RestoreTableFromBackup], and [RestoreTableToPointInTime].
     
      When you are creating a table with one or more secondary indexes, you can have up to 250 such requests running at a time. However, if the table or index specifications are complex, then DynamoDB might temporarily reduce the number of concurrent operations.
      
       When importing into DynamoDB, up to 50 simultaneous import table operations are allowed per account.
       
        There is a soft account quota of 2,500 tables.
        
         GetRecords was called with a value of more than 1000 for the limit request parameter.
         
          More than 2 processes are reading from the same streams shard at the same time. Exceeding this limit may result in request throttling.
           *)
type limit_exceeded_exception = {
  message: string option;
  (** 
    Too many operations for a given subscriber.
     *)

}

(** 
    Represents the output of a [GetShardIterator] operation.
     *)
type get_shard_iterator_output = {
  shard_iterator: string option;
  (** 
    The position in the shard from which to start reading stream records sequentially. A shard iterator specifies this position using the sequence number of a stream record in a shard.
     *)

}

(** 
    Represents the input of a [GetShardIterator] operation.
     *)
type get_shard_iterator_input = {
  sequence_number: string option;
  (** 
    The sequence number of a stream record in the shard from which to start reading.
     *)

  shard_iterator_type: shard_iterator_type;
  (** 
    Determines how the shard iterator is used to start reading stream records from the shard:
    
     {ul
          {- [AT_SEQUENCE_NUMBER] - Start reading exactly from the position denoted by a specific sequence number.
             
             }
           {- [AFTER_SEQUENCE_NUMBER] - Start reading right after the position denoted by a specific sequence number.
              
              }
           {- [TRIM_HORIZON] - Start reading at the last (untrimmed) stream record, which is the oldest record in the shard. In DynamoDB Streams, there is a 24 hour limit on data retention. Stream records whose age exceeds this limit are subject to removal (trimming) from the stream.
              
              }
           {- [LATEST] - Start reading just after the most recent stream record in the shard, so that you always read the most recent data in the shard.
              
              }
          
      }
       *)

  shard_id: string;
  (** 
    The identifier of the shard. The iterator will be returned for this shard ID.
     *)

  stream_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the stream.
     *)

}

(** 
    Represents the output of a [GetRecords] operation.
     *)
type get_records_output = {
  next_shard_iterator: string option;
  (** 
    The next position in the shard from which to start sequentially reading stream records. If set to [null], the shard has been closed and the requested iterator will not return any more data.
     *)

  records: record list option;
  (** 
    The stream records from the shard, which were retrieved using the shard iterator.
     *)

}

(** 
    Represents the input of a [GetRecords] operation.
     *)
type get_records_input = {
  limit: int option;
  (** 
    The maximum number of records to return from the shard. The upper limit is 1000.
     *)

  shard_iterator: string;
  (** 
    A shard iterator that was retrieved from a previous GetShardIterator operation. This iterator can be used to access the stream records in this shard.
     *)

}

(** 
    The shard iterator has expired and can no longer be used to retrieve stream records. A shard iterator expires 15 minutes after it is retrieved using the [GetShardIterator] action.
     *)
type expired_iterator_exception = {
  message: string option;
  (** 
    The provided iterator exceeds the maximum age allowed.
     *)

}

(** 
    Represents the output of a [DescribeStream] operation.
     *)
type describe_stream_output = {
  stream_description: stream_description option;
  (** 
    A complete description of the stream, including its creation date and time, the DynamoDB table associated with the stream, the shard IDs within the stream, and the beginning and ending sequence numbers of stream records within the shards.
     *)

}

(** 
    Represents the input of a [DescribeStream] operation.
     *)
type describe_stream_input = {
  exclusive_start_shard_id: string option;
  (** 
    The shard ID of the first item that this operation will evaluate. Use the value that was returned for [LastEvaluatedShardId] in the previous operation.
     *)

  limit: int option;
  (** 
    The maximum number of shard objects to return. The upper limit is 100.
     *)

  stream_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the stream.
     *)

}

(** 
    Amazon DynamoDB Amazon DynamoDB Streams provides API actions for accessing streams and processing stream records. To learn more about application development with Streams, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html}Capturing Table Activity with DynamoDB Streams} in the Amazon DynamoDB Developer Guide.
                     *)


type base_document = Json.t

