open Types 
let (let+) res map = Result.map map res
module UpdateStreamMode = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_stream_mode_input) ->
    let input = Serializers.update_stream_mode_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.UpdateStreamMode" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UpdateShardCount = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_shard_count_input) ->
    let input = Serializers.update_shard_count_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.UpdateShardCount" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_shard_count_output_of_yojson
      ~error_deserializer
      
end

module SubscribeToShard = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: subscribe_to_shard_input) ->
    let input = Serializers.subscribe_to_shard_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.SubscribeToShard" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.subscribe_to_shard_output_of_yojson
      ~error_deserializer
      
end

module StopStreamEncryption = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: stop_stream_encryption_input) ->
    let input = Serializers.stop_stream_encryption_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.StopStreamEncryption" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module StartStreamEncryption = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSAccessDeniedException" ->
         (`KMSAccessDeniedException (kms_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSDisabledException" ->
         (`KMSDisabledException (kms_disabled_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSNotFoundException" ->
         (`KMSNotFoundException (kms_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSOptInRequired" ->
         (`KMSOptInRequired (kms_opt_in_required_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSThrottlingException" ->
         (`KMSThrottlingException (kms_throttling_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_stream_encryption_input) ->
    let input = Serializers.start_stream_encryption_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.StartStreamEncryption" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module SplitShard = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: split_shard_input) ->
    let input = Serializers.split_shard_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.SplitShard" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RemoveTagsFromStream = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_tags_from_stream_input) ->
    let input = Serializers.remove_tags_from_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.RemoveTagsFromStream" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RegisterStreamConsumer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_stream_consumer_input) ->
    let input = Serializers.register_stream_consumer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.RegisterStreamConsumer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_stream_consumer_output_of_yojson
      ~error_deserializer
      
end

module PutResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_resource_policy_input) ->
    let input = Serializers.put_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.PutResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module PutRecords = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSAccessDeniedException" ->
         (`KMSAccessDeniedException (kms_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSDisabledException" ->
         (`KMSDisabledException (kms_disabled_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSNotFoundException" ->
         (`KMSNotFoundException (kms_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSOptInRequired" ->
         (`KMSOptInRequired (kms_opt_in_required_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSThrottlingException" ->
         (`KMSThrottlingException (kms_throttling_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_records_input) ->
    let input = Serializers.put_records_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.PutRecords" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_records_output_of_yojson
      ~error_deserializer
      
end

module PutRecord = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSAccessDeniedException" ->
         (`KMSAccessDeniedException (kms_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSDisabledException" ->
         (`KMSDisabledException (kms_disabled_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSNotFoundException" ->
         (`KMSNotFoundException (kms_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSOptInRequired" ->
         (`KMSOptInRequired (kms_opt_in_required_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSThrottlingException" ->
         (`KMSThrottlingException (kms_throttling_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_record_input) ->
    let input = Serializers.put_record_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.PutRecord" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_record_output_of_yojson
      ~error_deserializer
      
end

module MergeShards = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: merge_shards_input) ->
    let input = Serializers.merge_shards_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.MergeShards" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module ListTagsForStream = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_stream_input) ->
    let input = Serializers.list_tags_for_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.ListTagsForStream" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_stream_output_of_yojson
      ~error_deserializer
      
end

module ListStreams = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "ExpiredNextTokenException" ->
         (`ExpiredNextTokenException (expired_next_token_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_streams_input) ->
    let input = Serializers.list_streams_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.ListStreams" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_streams_output_of_yojson
      ~error_deserializer
      
end

module ListStreamConsumers = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "ExpiredNextTokenException" ->
         (`ExpiredNextTokenException (expired_next_token_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_stream_consumers_input) ->
    let input = Serializers.list_stream_consumers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.ListStreamConsumers" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_stream_consumers_output_of_yojson
      ~error_deserializer
      
end

module ListShards = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ExpiredNextTokenException" ->
         (`ExpiredNextTokenException (expired_next_token_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_shards_input) ->
    let input = Serializers.list_shards_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.ListShards" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_shards_output_of_yojson
      ~error_deserializer
      
end

module IncreaseStreamRetentionPeriod = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: increase_stream_retention_period_input) ->
    let input = Serializers.increase_stream_retention_period_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.IncreaseStreamRetentionPeriod" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module GetShardIterator = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_shard_iterator_input) ->
    let input = Serializers.get_shard_iterator_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.GetShardIterator" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_shard_iterator_output_of_yojson
      ~error_deserializer
      
end

module GetResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_policy_input) ->
    let input = Serializers.get_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.GetResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_policy_output_of_yojson
      ~error_deserializer
      
end

module GetRecords = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ExpiredIteratorException" ->
         (`ExpiredIteratorException (expired_iterator_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSAccessDeniedException" ->
         (`KMSAccessDeniedException (kms_access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSDisabledException" ->
         (`KMSDisabledException (kms_disabled_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSInvalidStateException" ->
         (`KMSInvalidStateException (kms_invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSNotFoundException" ->
         (`KMSNotFoundException (kms_not_found_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSOptInRequired" ->
         (`KMSOptInRequired (kms_opt_in_required_of_yojson tree path))
      | "com.amazonaws.kinesis", "KMSThrottlingException" ->
         (`KMSThrottlingException (kms_throttling_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_records_input) ->
    let input = Serializers.get_records_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.GetRecords" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_records_output_of_yojson
      ~error_deserializer
      
end

module EnableEnhancedMonitoring = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_enhanced_monitoring_input) ->
    let input = Serializers.enable_enhanced_monitoring_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.EnableEnhancedMonitoring" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enhanced_monitoring_output_of_yojson
      ~error_deserializer
      
end

module DisableEnhancedMonitoring = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_enhanced_monitoring_input) ->
    let input = Serializers.disable_enhanced_monitoring_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.DisableEnhancedMonitoring" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.enhanced_monitoring_output_of_yojson
      ~error_deserializer
      
end

module DescribeStreamSummary = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_stream_summary_input) ->
    let input = Serializers.describe_stream_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.DescribeStreamSummary" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_stream_summary_output_of_yojson
      ~error_deserializer
      
end

module DescribeStreamConsumer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_stream_consumer_input) ->
    let input = Serializers.describe_stream_consumer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.DescribeStreamConsumer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_stream_consumer_output_of_yojson
      ~error_deserializer
      
end

module DescribeStream = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_stream_input) ->
    let input = Serializers.describe_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.DescribeStream" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_stream_output_of_yojson
      ~error_deserializer
      
end

module DescribeLimits = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_limits_input) ->
    let input = Serializers.describe_limits_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.DescribeLimits" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_limits_output_of_yojson
      ~error_deserializer
      
end

module DeregisterStreamConsumer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_stream_consumer_input) ->
    let input = Serializers.deregister_stream_consumer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.DeregisterStreamConsumer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteStream = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_stream_input) ->
    let input = Serializers.delete_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.DeleteStream" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_resource_policy_input) ->
    let input = Serializers.delete_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.DeleteResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DecreaseStreamRetentionPeriod = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: decrease_stream_retention_period_input) ->
    let input = Serializers.decrease_stream_retention_period_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.DecreaseStreamRetentionPeriod" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module CreateStream = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_stream_input) ->
    let input = Serializers.create_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.CreateStream" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module AddTagsToStream = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.kinesis", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "InvalidArgumentException" ->
         (`InvalidArgumentException (invalid_argument_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.kinesis", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_tags_to_stream_input) ->
    let input = Serializers.add_tags_to_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"Kinesis_20131202.AddTagsToStream" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

