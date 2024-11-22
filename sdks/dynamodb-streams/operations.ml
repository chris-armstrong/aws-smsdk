open Types 
let (let+) res map = Result.map map res
module ListStreams = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodbstreams", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodbstreams", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_streams_input) ->
    let input = Serializers.list_streams_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDBStreams_20120810.ListStreams" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_streams_output_of_yojson
      ~error_deserializer
      
end

module GetShardIterator = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodbstreams", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodbstreams", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodbstreams", "TrimmedDataAccessException" ->
         (`TrimmedDataAccessException (trimmed_data_access_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_shard_iterator_input) ->
    let input = Serializers.get_shard_iterator_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDBStreams_20120810.GetShardIterator" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_shard_iterator_output_of_yojson
      ~error_deserializer
      
end

module GetRecords = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodbstreams", "ExpiredIteratorException" ->
         (`ExpiredIteratorException (expired_iterator_exception_of_yojson tree path))
      | "com.amazonaws.dynamodbstreams", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodbstreams", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodbstreams", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodbstreams", "TrimmedDataAccessException" ->
         (`TrimmedDataAccessException (trimmed_data_access_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_records_input) ->
    let input = Serializers.get_records_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDBStreams_20120810.GetRecords" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_records_output_of_yojson
      ~error_deserializer
      
end

module DescribeStream = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodbstreams", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodbstreams", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_stream_input) ->
    let input = Serializers.describe_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDBStreams_20120810.DescribeStream" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_stream_output_of_yojson
      ~error_deserializer
      
end

