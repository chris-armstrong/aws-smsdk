open Types 
module AddTagsToStream : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_stream_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateStream : sig
  val request :
    Smaws_Lib.Context.t ->
      create_stream_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
end

module DecreaseStreamRetentionPeriod : sig
  val request :
    Smaws_Lib.Context.t ->
      decrease_stream_retention_period_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteStream : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_stream_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeregisterStreamConsumer : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_stream_consumer_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_limits_input ->
        (describe_limits_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module DescribeStream : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_stream_input ->
        (describe_stream_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeStreamConsumer : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_stream_consumer_input ->
        (describe_stream_consumer_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeStreamSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_stream_summary_input ->
        (describe_stream_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisableEnhancedMonitoring : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_enhanced_monitoring_input ->
        (enhanced_monitoring_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module EnableEnhancedMonitoring : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_enhanced_monitoring_input ->
        (enhanced_monitoring_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ExpiredIteratorException of expired_iterator_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `KMSAccessDeniedException of kms_access_denied_exception
            | `KMSDisabledException of kms_disabled_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `KMSNotFoundException of kms_not_found_exception
            | `KMSOptInRequired of kms_opt_in_required
            | `KMSThrottlingException of kms_throttling_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policy_input ->
        (get_resource_policy_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetShardIterator : sig
  val request :
    Smaws_Lib.Context.t ->
      get_shard_iterator_input ->
        (get_shard_iterator_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module IncreaseStreamRetentionPeriod : sig
  val request :
    Smaws_Lib.Context.t ->
      increase_stream_retention_period_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListShards : sig
  val request :
    Smaws_Lib.Context.t ->
      list_shards_input ->
        (list_shards_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ExpiredNextTokenException of expired_next_token_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListStreamConsumers : sig
  val request :
    Smaws_Lib.Context.t ->
      list_stream_consumers_input ->
        (list_stream_consumers_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExpiredNextTokenException of expired_next_token_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListStreams : sig
  val request :
    Smaws_Lib.Context.t ->
      list_streams_input ->
        (list_streams_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExpiredNextTokenException of expired_next_token_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListTagsForStream : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_stream_input ->
        (list_tags_for_stream_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module MergeShards : sig
  val request :
    Smaws_Lib.Context.t ->
      merge_shards_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module PutRecord : sig
  val request :
    Smaws_Lib.Context.t ->
      put_record_input ->
        (put_record_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `KMSAccessDeniedException of kms_access_denied_exception
            | `KMSDisabledException of kms_disabled_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `KMSNotFoundException of kms_not_found_exception
            | `KMSOptInRequired of kms_opt_in_required
            | `KMSThrottlingException of kms_throttling_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutRecords : sig
  val request :
    Smaws_Lib.Context.t ->
      put_records_input ->
        (put_records_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `KMSAccessDeniedException of kms_access_denied_exception
            | `KMSDisabledException of kms_disabled_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `KMSNotFoundException of kms_not_found_exception
            | `KMSOptInRequired of kms_opt_in_required
            | `KMSThrottlingException of kms_throttling_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RegisterStreamConsumer : sig
  val request :
    Smaws_Lib.Context.t ->
      register_stream_consumer_input ->
        (register_stream_consumer_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RemoveTagsFromStream : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_stream_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module SplitShard : sig
  val request :
    Smaws_Lib.Context.t ->
      split_shard_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module StartStreamEncryption : sig
  val request :
    Smaws_Lib.Context.t ->
      start_stream_encryption_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `KMSAccessDeniedException of kms_access_denied_exception
            | `KMSDisabledException of kms_disabled_exception
            | `KMSInvalidStateException of kms_invalid_state_exception
            | `KMSNotFoundException of kms_not_found_exception
            | `KMSOptInRequired of kms_opt_in_required
            | `KMSThrottlingException of kms_throttling_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module StopStreamEncryption : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_stream_encryption_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module SubscribeToShard : sig
  val request :
    Smaws_Lib.Context.t ->
      subscribe_to_shard_input ->
        (subscribe_to_shard_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateShardCount : sig
  val request :
    Smaws_Lib.Context.t ->
      update_shard_count_input ->
        (update_shard_count_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateStreamMode : sig
  val request :
    Smaws_Lib.Context.t ->
      update_stream_mode_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

