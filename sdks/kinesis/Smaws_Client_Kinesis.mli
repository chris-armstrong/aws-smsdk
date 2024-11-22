open Smaws_Lib
val service : Service.descriptor

type validation_exception = {
  message: string option
}

type stream_mode = | ON_DEMAND
  | PROVISIONED

type stream_mode_details = {
  stream_mode: stream_mode
}

type update_stream_mode_input = {
  stream_mode_details: stream_mode_details;
  stream_ar_n: string
}

type resource_not_found_exception = {
  message: string option
}

type resource_in_use_exception = {
  message: string option
}

type limit_exceeded_exception = {
  message: string option
}

type invalid_argument_exception = {
  message: string option
}

type update_shard_count_output = {
  stream_ar_n: string option;
  target_shard_count: int option;
  current_shard_count: int option;
  stream_name: string option
}

type scaling_type = | UNIFORM_SCALING

type update_shard_count_input = {
  stream_ar_n: string option;
  scaling_type: scaling_type;
  target_shard_count: int;
  stream_name: string option
}

type access_denied_exception = {
  message: string option
}

type tag = {
  value: string option;
  key: string
}

type encryption_type = | KMS
  | NONE

type record = {
  encryption_type: encryption_type option;
  partition_key: string;
  data: bytes;
  approximate_arrival_timestamp: float option;
  sequence_number: string
}

type hash_key_range = {
  ending_hash_key: string;
  starting_hash_key: string
}

type child_shard = {
  hash_key_range: hash_key_range;
  parent_shards: string list;
  shard_id: string
}

type subscribe_to_shard_event = {
  child_shards: child_shard list option;
  millis_behind_latest: int;
  continuation_sequence_number: string;
  records: record list
}

type kms_disabled_exception = {
  message: string option
}

type kms_invalid_state_exception = {
  message: string option
}

type kms_access_denied_exception = {
  message: string option
}

type kms_not_found_exception = {
  message: string option
}

type kms_opt_in_required = {
  message: string option
}

type kms_throttling_exception = {
  message: string option
}

type internal_failure_exception = {
  message: string option
}

type subscribe_to_shard_event_stream = InternalFailureException of internal_failure_exception | KMSThrottlingException of kms_throttling_exception | KMSOptInRequired of kms_opt_in_required | KMSNotFoundException of kms_not_found_exception | KMSAccessDeniedException of kms_access_denied_exception | KMSInvalidStateException of kms_invalid_state_exception | KMSDisabledException of kms_disabled_exception | ResourceInUseException of resource_in_use_exception | ResourceNotFoundException of resource_not_found_exception | SubscribeToShardEvent of subscribe_to_shard_event

type subscribe_to_shard_output = {
  event_stream: subscribe_to_shard_event_stream
}

type shard_iterator_type = | AT_TIMESTAMP
  | LATEST
  | TRIM_HORIZON
  | AFTER_SEQUENCE_NUMBER
  | AT_SEQUENCE_NUMBER

type starting_position = {
  timestamp_: float option;
  sequence_number: string option;
  type_: shard_iterator_type
}

type subscribe_to_shard_input = {
  starting_position: starting_position;
  shard_id: string;
  consumer_ar_n: string
}

type stream_status = | UPDATING
  | ACTIVE
  | DELETING
  | CREATING

type stream_summary = {
  stream_creation_timestamp: float option;
  stream_mode_details: stream_mode_details option;
  stream_status: stream_status;
  stream_ar_n: string;
  stream_name: string
}

type metrics_name = | ALL
  | ITERATOR_AGE_MILLISECONDS
  | READ_PROVISIONED_THROUGHPUT_EXCEEDED
  | WRITE_PROVISIONED_THROUGHPUT_EXCEEDED
  | OUTGOING_RECORDS
  | OUTGOING_BYTES
  | INCOMING_RECORDS
  | INCOMING_BYTES

type enhanced_metrics = {
  shard_level_metrics: metrics_name list option
}

type stream_description_summary = {
  consumer_count: int option;
  open_shard_count: int;
  key_id: string option;
  encryption_type: encryption_type option;
  enhanced_monitoring: enhanced_metrics list;
  stream_creation_timestamp: float;
  retention_period_hours: int;
  stream_mode_details: stream_mode_details option;
  stream_status: stream_status;
  stream_ar_n: string;
  stream_name: string
}

type sequence_number_range = {
  ending_sequence_number: string option;
  starting_sequence_number: string
}

type shard = {
  sequence_number_range: sequence_number_range;
  hash_key_range: hash_key_range;
  adjacent_parent_shard_id: string option;
  parent_shard_id: string option;
  shard_id: string
}

type stream_description = {
  key_id: string option;
  encryption_type: encryption_type option;
  enhanced_monitoring: enhanced_metrics list;
  stream_creation_timestamp: float;
  retention_period_hours: int;
  has_more_shards: bool;
  shards: shard list;
  stream_mode_details: stream_mode_details option;
  stream_status: stream_status;
  stream_ar_n: string;
  stream_name: string
}

type stop_stream_encryption_input = {
  stream_ar_n: string option;
  key_id: string;
  encryption_type: encryption_type;
  stream_name: string option
}

type start_stream_encryption_input = {
  stream_ar_n: string option;
  key_id: string;
  encryption_type: encryption_type;
  stream_name: string option
}

type split_shard_input = {
  stream_ar_n: string option;
  new_starting_hash_key: string;
  shard_to_split: string;
  stream_name: string option
}

type shard_filter_type = | FROM_TIMESTAMP
  | AT_TIMESTAMP
  | AT_LATEST
  | FROM_TRIM_HORIZON
  | AT_TRIM_HORIZON
  | AFTER_SHARD_ID

type shard_filter = {
  timestamp_: float option;
  shard_id: string option;
  type_: shard_filter_type
}

type remove_tags_from_stream_input = {
  stream_ar_n: string option;
  tag_keys: string list;
  stream_name: string option
}

type consumer_status = | ACTIVE
  | DELETING
  | CREATING

type consumer = {
  consumer_creation_timestamp: float;
  consumer_status: consumer_status;
  consumer_ar_n: string;
  consumer_name: string
}

type register_stream_consumer_output = {
  consumer: consumer
}

type register_stream_consumer_input = {
  consumer_name: string;
  stream_ar_n: string
}

type put_resource_policy_input = {
  policy: string;
  resource_ar_n: string
}

type put_records_result_entry = {
  error_message: string option;
  error_code: string option;
  shard_id: string option;
  sequence_number: string option
}

type put_records_request_entry = {
  partition_key: string;
  explicit_hash_key: string option;
  data: bytes
}

type put_records_output = {
  encryption_type: encryption_type option;
  records: put_records_result_entry list;
  failed_record_count: int option
}

type put_records_input = {
  stream_ar_n: string option;
  stream_name: string option;
  records: put_records_request_entry list
}

type provisioned_throughput_exceeded_exception = {
  message: string option
}

type put_record_output = {
  encryption_type: encryption_type option;
  sequence_number: string;
  shard_id: string
}

type put_record_input = {
  stream_ar_n: string option;
  sequence_number_for_ordering: string option;
  explicit_hash_key: string option;
  partition_key: string;
  data: bytes;
  stream_name: string option
}

type merge_shards_input = {
  stream_ar_n: string option;
  adjacent_shard_to_merge: string;
  shard_to_merge: string;
  stream_name: string option
}

type list_tags_for_stream_output = {
  has_more_tags: bool;
  tags: tag list
}

type list_tags_for_stream_input = {
  stream_ar_n: string option;
  limit: int option;
  exclusive_start_tag_key: string option;
  stream_name: string option
}

type list_streams_output = {
  stream_summaries: stream_summary list option;
  next_token: string option;
  has_more_streams: bool;
  stream_names: string list
}

type list_streams_input = {
  next_token: string option;
  exclusive_start_stream_name: string option;
  limit: int option
}

type expired_next_token_exception = {
  message: string option
}

type list_stream_consumers_output = {
  next_token: string option;
  consumers: consumer list option
}

type list_stream_consumers_input = {
  stream_creation_timestamp: float option;
  max_results: int option;
  next_token: string option;
  stream_ar_n: string
}

type list_shards_output = {
  next_token: string option;
  shards: shard list option
}

type list_shards_input = {
  stream_ar_n: string option;
  shard_filter: shard_filter option;
  stream_creation_timestamp: float option;
  max_results: int option;
  exclusive_start_shard_id: string option;
  next_token: string option;
  stream_name: string option
}

type increase_stream_retention_period_input = {
  stream_ar_n: string option;
  retention_period_hours: int;
  stream_name: string option
}

type get_shard_iterator_output = {
  shard_iterator: string option
}

type get_shard_iterator_input = {
  stream_ar_n: string option;
  timestamp_: float option;
  starting_sequence_number: string option;
  shard_iterator_type: shard_iterator_type;
  shard_id: string;
  stream_name: string option
}

type get_resource_policy_output = {
  policy: string
}

type get_resource_policy_input = {
  resource_ar_n: string
}

type expired_iterator_exception = {
  message: string option
}

type get_records_output = {
  child_shards: child_shard list option;
  millis_behind_latest: int option;
  next_shard_iterator: string option;
  records: record list
}

type get_records_input = {
  stream_ar_n: string option;
  limit: int option;
  shard_iterator: string
}

type enhanced_monitoring_output = {
  stream_ar_n: string option;
  desired_shard_level_metrics: metrics_name list option;
  current_shard_level_metrics: metrics_name list option;
  stream_name: string option
}

type enable_enhanced_monitoring_input = {
  stream_ar_n: string option;
  shard_level_metrics: metrics_name list;
  stream_name: string option
}

type disable_enhanced_monitoring_input = {
  stream_ar_n: string option;
  shard_level_metrics: metrics_name list;
  stream_name: string option
}

type describe_stream_summary_output = {
  stream_description_summary: stream_description_summary
}

type describe_stream_summary_input = {
  stream_ar_n: string option;
  stream_name: string option
}

type consumer_description = {
  stream_ar_n: string;
  consumer_creation_timestamp: float;
  consumer_status: consumer_status;
  consumer_ar_n: string;
  consumer_name: string
}

type describe_stream_consumer_output = {
  consumer_description: consumer_description
}

type describe_stream_consumer_input = {
  consumer_ar_n: string option;
  consumer_name: string option;
  stream_ar_n: string option
}

type describe_stream_output = {
  stream_description: stream_description
}

type describe_stream_input = {
  stream_ar_n: string option;
  exclusive_start_shard_id: string option;
  limit: int option;
  stream_name: string option
}

type describe_limits_output = {
  on_demand_stream_count_limit: int;
  on_demand_stream_count: int;
  open_shard_count: int;
  shard_limit: int
}

type describe_limits_input = unit

type deregister_stream_consumer_input = {
  consumer_ar_n: string option;
  consumer_name: string option;
  stream_ar_n: string option
}

type delete_stream_input = {
  stream_ar_n: string option;
  enforce_consumer_deletion: bool option;
  stream_name: string option
}

type delete_resource_policy_input = {
  resource_ar_n: string
}

type decrease_stream_retention_period_input = {
  stream_ar_n: string option;
  retention_period_hours: int;
  stream_name: string option
}

type create_stream_input = {
  stream_mode_details: stream_mode_details option;
  shard_count: int option;
  stream_name: string
}

type add_tags_to_stream_input = {
  stream_ar_n: string option;
  tags: (string * string) list;
  stream_name: string option
}



type base_document = Json.t

val make_stream_mode_details :
  stream_mode:stream_mode -> unit
-> stream_mode_details

val make_update_stream_mode_input :
  stream_mode_details:stream_mode_details -> stream_ar_n:string -> unit
-> update_stream_mode_input

val make_update_shard_count_output :
  ?stream_ar_n:string ->
  ?target_shard_count:int ->
  ?current_shard_count:int ->
  ?stream_name:string ->
  unit -> update_shard_count_output

val make_update_shard_count_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  scaling_type:scaling_type ->
  target_shard_count:int ->
  unit -> update_shard_count_input

val make_tag : ?value:string -> key:string -> unit -> tag

val make_record :
  ?encryption_type:encryption_type ->
  ?approximate_arrival_timestamp:float ->
  partition_key:string ->
  data:bytes ->
  sequence_number:string ->
  unit -> record

val make_hash_key_range :
  ending_hash_key:string -> starting_hash_key:string -> unit
-> hash_key_range

val make_child_shard :
  hash_key_range:hash_key_range ->
  parent_shards:string list ->
  shard_id:string ->
  unit -> child_shard

val make_subscribe_to_shard_event :
  ?child_shards:child_shard list ->
  millis_behind_latest:int ->
  continuation_sequence_number:string ->
  records:record list ->
  unit -> subscribe_to_shard_event

val make_subscribe_to_shard_output :
  event_stream:subscribe_to_shard_event_stream -> unit
-> subscribe_to_shard_output

val make_starting_position :
  ?timestamp_:float ->
  ?sequence_number:string ->
  type_:shard_iterator_type ->
  unit -> starting_position

val make_subscribe_to_shard_input :
  starting_position:starting_position ->
  shard_id:string ->
  consumer_ar_n:string ->
  unit -> subscribe_to_shard_input

val make_stream_summary :
  ?stream_creation_timestamp:float ->
  ?stream_mode_details:stream_mode_details ->
  stream_status:stream_status ->
  stream_ar_n:string ->
  stream_name:string ->
  unit -> stream_summary

val make_enhanced_metrics : ?shard_level_metrics:metrics_name list -> unit
-> enhanced_metrics

val make_stream_description_summary :
  ?consumer_count:int ->
  ?key_id:string ->
  ?encryption_type:encryption_type ->
  ?stream_mode_details:stream_mode_details ->
  open_shard_count:int ->
  enhanced_monitoring:enhanced_metrics list ->
  stream_creation_timestamp:float ->
  retention_period_hours:int ->
  stream_status:stream_status ->
  stream_ar_n:string ->
  stream_name:string ->
  unit -> stream_description_summary

val make_sequence_number_range :
  ?ending_sequence_number:string -> starting_sequence_number:string -> unit
-> sequence_number_range

val make_shard :
  ?adjacent_parent_shard_id:string ->
  ?parent_shard_id:string ->
  sequence_number_range:sequence_number_range ->
  hash_key_range:hash_key_range ->
  shard_id:string ->
  unit -> shard

val make_stream_description :
  ?key_id:string ->
  ?encryption_type:encryption_type ->
  ?stream_mode_details:stream_mode_details ->
  enhanced_monitoring:enhanced_metrics list ->
  stream_creation_timestamp:float ->
  retention_period_hours:int ->
  has_more_shards:bool ->
  shards:shard list ->
  stream_status:stream_status ->
  stream_ar_n:string ->
  stream_name:string ->
  unit -> stream_description

val make_stop_stream_encryption_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  key_id:string ->
  encryption_type:encryption_type ->
  unit
-> stop_stream_encryption_input

val make_start_stream_encryption_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  key_id:string ->
  encryption_type:encryption_type ->
  unit -> start_stream_encryption_input

val make_split_shard_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  new_starting_hash_key:string ->
  shard_to_split:string ->
  unit -> split_shard_input

val make_shard_filter :
  ?timestamp_:float -> ?shard_id:string -> type_:shard_filter_type -> unit
-> shard_filter

val make_remove_tags_from_stream_input :
  ?stream_ar_n:string -> ?stream_name:string -> tag_keys:string list -> unit
-> remove_tags_from_stream_input

val make_consumer :
  consumer_creation_timestamp:float ->
  consumer_status:consumer_status ->
  consumer_ar_n:string ->
  consumer_name:string ->
  unit -> consumer

val make_register_stream_consumer_output : consumer:consumer -> unit
-> register_stream_consumer_output

val make_register_stream_consumer_input :
  consumer_name:string -> stream_ar_n:string -> unit
-> register_stream_consumer_input

val make_put_resource_policy_input :
  policy:string -> resource_ar_n:string -> unit
-> put_resource_policy_input

val make_put_records_result_entry :
  ?error_message:string ->
  ?error_code:string ->
  ?shard_id:string ->
  ?sequence_number:string ->
  unit -> put_records_result_entry

val make_put_records_request_entry :
  ?explicit_hash_key:string -> partition_key:string -> data:bytes -> unit
-> put_records_request_entry

val make_put_records_output :
  ?encryption_type:encryption_type ->
  ?failed_record_count:int ->
  records:put_records_result_entry list ->
  unit -> put_records_output

val make_put_records_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  records:put_records_request_entry list ->
  unit -> put_records_input

val make_put_record_output :
  ?encryption_type:encryption_type ->
  sequence_number:string ->
  shard_id:string ->
  unit -> put_record_output

val make_put_record_input :
  ?stream_ar_n:string ->
  ?sequence_number_for_ordering:string ->
  ?explicit_hash_key:string ->
  ?stream_name:string ->
  partition_key:string ->
  data:bytes ->
  unit -> put_record_input

val make_merge_shards_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  adjacent_shard_to_merge:string ->
  shard_to_merge:string ->
  unit -> merge_shards_input

val make_list_tags_for_stream_output :
  has_more_tags:bool -> tags:tag list -> unit
-> list_tags_for_stream_output

val make_list_tags_for_stream_input :
  ?stream_ar_n:string ->
  ?limit:int ->
  ?exclusive_start_tag_key:string ->
  ?stream_name:string ->
  unit -> list_tags_for_stream_input

val make_list_streams_output :
  ?stream_summaries:stream_summary list ->
  ?next_token:string ->
  has_more_streams:bool ->
  stream_names:string list ->
  unit -> list_streams_output

val make_list_streams_input :
  ?next_token:string ->
  ?exclusive_start_stream_name:string ->
  ?limit:int ->
  unit -> list_streams_input

val make_list_stream_consumers_output :
  ?next_token:string -> ?consumers:consumer list -> unit
-> list_stream_consumers_output

val make_list_stream_consumers_input :
  ?stream_creation_timestamp:float ->
  ?max_results:int ->
  ?next_token:string ->
  stream_ar_n:string ->
  unit -> list_stream_consumers_input

val make_list_shards_output :
  ?next_token:string -> ?shards:shard list -> unit
-> list_shards_output

val make_list_shards_input :
  ?stream_ar_n:string ->
  ?shard_filter:shard_filter ->
  ?stream_creation_timestamp:float ->
  ?max_results:int ->
  ?exclusive_start_shard_id:string ->
  ?next_token:string ->
  ?stream_name:string ->
  unit -> list_shards_input

val make_increase_stream_retention_period_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  retention_period_hours:int ->
  unit
-> increase_stream_retention_period_input

val make_get_shard_iterator_output : ?shard_iterator:string -> unit
-> get_shard_iterator_output

val make_get_shard_iterator_input :
  ?stream_ar_n:string ->
  ?timestamp_:float ->
  ?starting_sequence_number:string ->
  ?stream_name:string ->
  shard_iterator_type:shard_iterator_type ->
  shard_id:string ->
  unit -> get_shard_iterator_input

val make_get_resource_policy_output : policy:string -> unit
-> get_resource_policy_output

val make_get_resource_policy_input : resource_ar_n:string -> unit
-> get_resource_policy_input

val make_get_records_output :
  ?child_shards:child_shard list ->
  ?millis_behind_latest:int ->
  ?next_shard_iterator:string ->
  records:record list ->
  unit -> get_records_output

val make_get_records_input :
  ?stream_ar_n:string -> ?limit:int -> shard_iterator:string -> unit
-> get_records_input

val make_enhanced_monitoring_output :
  ?stream_ar_n:string ->
  ?desired_shard_level_metrics:metrics_name list ->
  ?current_shard_level_metrics:metrics_name list ->
  ?stream_name:string ->
  unit
-> enhanced_monitoring_output

val make_enable_enhanced_monitoring_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  shard_level_metrics:metrics_name list ->
  unit
-> enable_enhanced_monitoring_input

val make_disable_enhanced_monitoring_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  shard_level_metrics:metrics_name list ->
  unit
-> disable_enhanced_monitoring_input

val make_describe_stream_summary_output :
  stream_description_summary:stream_description_summary -> unit
-> describe_stream_summary_output

val make_describe_stream_summary_input :
  ?stream_ar_n:string -> ?stream_name:string -> unit
-> describe_stream_summary_input

val make_consumer_description :
  stream_ar_n:string ->
  consumer_creation_timestamp:float ->
  consumer_status:consumer_status ->
  consumer_ar_n:string ->
  consumer_name:string ->
  unit -> consumer_description

val make_describe_stream_consumer_output :
  consumer_description:consumer_description -> unit
-> describe_stream_consumer_output

val make_describe_stream_consumer_input :
  ?consumer_ar_n:string ->
  ?consumer_name:string ->
  ?stream_ar_n:string ->
  unit -> describe_stream_consumer_input

val make_describe_stream_output :
  stream_description:stream_description -> unit
-> describe_stream_output

val make_describe_stream_input :
  ?stream_ar_n:string ->
  ?exclusive_start_shard_id:string ->
  ?limit:int ->
  ?stream_name:string ->
  unit -> describe_stream_input

val make_describe_limits_output :
  on_demand_stream_count_limit:int ->
  on_demand_stream_count:int ->
  open_shard_count:int ->
  shard_limit:int ->
  unit -> describe_limits_output

val make_describe_limits_input : unit
-> describe_limits_input

val make_deregister_stream_consumer_input :
  ?consumer_ar_n:string ->
  ?consumer_name:string ->
  ?stream_ar_n:string ->
  unit -> deregister_stream_consumer_input

val make_delete_stream_input :
  ?stream_ar_n:string ->
  ?enforce_consumer_deletion:bool ->
  ?stream_name:string ->
  unit -> delete_stream_input

val make_delete_resource_policy_input : resource_ar_n:string -> unit
-> delete_resource_policy_input

val make_decrease_stream_retention_period_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  retention_period_hours:int ->
  unit
-> decrease_stream_retention_period_input

val make_create_stream_input :
  ?stream_mode_details:stream_mode_details ->
  ?shard_count:int ->
  stream_name:string ->
  unit -> create_stream_input

val make_add_tags_to_stream_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  tags:(string * string) list ->
  unit -> add_tags_to_stream_input

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

