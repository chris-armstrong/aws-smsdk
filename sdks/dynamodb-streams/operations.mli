open Types 
module DescribeStream : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_stream_input ->
        (describe_stream_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns information about a stream, including the current status of the stream, its Amazon Resource Name (ARN), the composition of its shards, and its corresponding DynamoDB table.
    
     You can call [DescribeStream] at a maximum rate of 10 times per second.
     
      Each shard in the stream has a [SequenceNumberRange] associated with it. If the [SequenceNumberRange] has a [StartingSequenceNumber] but no [EndingSequenceNumber], then the shard is still open (able to receive more stream records). If both [StartingSequenceNumber] and [EndingSequenceNumber] are present, then that shard is closed and can no longer receive more data.
       *)

  
end

module GetRecords : sig
  val request :
    Smaws_Lib.Context.t ->
      get_records_input ->
        (get_records_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExpiredIteratorException of expired_iterator_exception
            | `InternalServerError of internal_server_error
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TrimmedDataAccessException of trimmed_data_access_exception
            
        ]
      ) result
  (** 
    Retrieves the stream records from a given shard.
    
     Specify a shard iterator using the [ShardIterator] parameter. The shard iterator specifies the position in the shard from which you want to start reading stream records sequentially. If there are no stream records available in the portion of the shard that the iterator points to, [GetRecords] returns an empty list. Note that it might take multiple calls to get to a portion of the shard that contains stream records.
     
      [GetRecords] can retrieve a maximum of 1 MB of data or 1000 stream records, whichever comes first.
      
       *)

  
end

module GetShardIterator : sig
  val request :
    Smaws_Lib.Context.t ->
      get_shard_iterator_input ->
        (get_shard_iterator_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            | `TrimmedDataAccessException of trimmed_data_access_exception
            
        ]
      ) result
  (** 
    Returns a shard iterator. A shard iterator provides information about how to retrieve the stream records from within a shard. Use the shard iterator in a subsequent [GetRecords] request to read the stream records from the shard.
    
     A shard iterator expires 15 minutes after it is returned to the requester.
     
      *)

  
end

module ListStreams : sig
  val request :
    Smaws_Lib.Context.t ->
      list_streams_input ->
        (list_streams_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns an array of stream ARNs associated with the current account and endpoint. If the [TableName] parameter is present, then [ListStreams] will return only the streams ARNs for that table.
    
     You can call [ListStreams] at a maximum rate of 5 times per second.
     
      *)

  
end

