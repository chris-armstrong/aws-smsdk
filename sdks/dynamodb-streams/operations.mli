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
end

