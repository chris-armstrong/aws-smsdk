open Types
val make_stream_mode_details : stream_mode:stream_mode -> unit
-> stream_mode_details
(** Create a {!type-stream_mode_details} type *)

val make_update_stream_mode_input :
  stream_mode_details:stream_mode_details -> stream_ar_n:string -> unit
-> update_stream_mode_input
(** Create a {!type-update_stream_mode_input} type *)

val make_update_shard_count_output :
  ?stream_ar_n:string ->
  ?target_shard_count:int ->
  ?current_shard_count:int ->
  ?stream_name:string ->
  unit
-> update_shard_count_output
(** Create a {!type-update_shard_count_output} type *)

val make_update_shard_count_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  scaling_type:scaling_type ->
  target_shard_count:int ->
  unit
-> update_shard_count_input
(** Create a {!type-update_shard_count_input} type *)

val make_tag : ?value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_record :
  ?encryption_type:encryption_type ->
  ?approximate_arrival_timestamp:float ->
  partition_key:string ->
  data:bytes ->
  sequence_number:string ->
  unit -> record
(** Create a {!type-record} type *)

val make_hash_key_range :
  ending_hash_key:string -> starting_hash_key:string -> unit
-> hash_key_range
(** Create a {!type-hash_key_range} type *)

val make_child_shard :
  hash_key_range:hash_key_range ->
  parent_shards:string list ->
  shard_id:string ->
  unit
-> child_shard
(** Create a {!type-child_shard} type *)

val make_subscribe_to_shard_event :
  ?child_shards:child_shard list ->
  millis_behind_latest:int ->
  continuation_sequence_number:string ->
  records:record list ->
  unit
-> subscribe_to_shard_event
(** Create a {!type-subscribe_to_shard_event} type *)

val make_subscribe_to_shard_output :
  event_stream:subscribe_to_shard_event_stream -> unit
-> subscribe_to_shard_output
(** Create a {!type-subscribe_to_shard_output} type *)

val make_starting_position :
  ?timestamp_:float ->
  ?sequence_number:string ->
  type_:shard_iterator_type ->
  unit
-> starting_position
(** Create a {!type-starting_position} type *)

val make_subscribe_to_shard_input :
  starting_position:starting_position ->
  shard_id:string ->
  consumer_ar_n:string ->
  unit
-> subscribe_to_shard_input
(** Create a {!type-subscribe_to_shard_input} type *)

val make_stream_summary :
  ?stream_creation_timestamp:float ->
  ?stream_mode_details:stream_mode_details ->
  stream_status:stream_status ->
  stream_ar_n:string ->
  stream_name:string ->
  unit
-> stream_summary
(** Create a {!type-stream_summary} type *)

val make_enhanced_metrics : ?shard_level_metrics:metrics_name list -> unit
-> enhanced_metrics
(** Create a {!type-enhanced_metrics} type *)

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
  unit
-> stream_description_summary
(** Create a {!type-stream_description_summary} type *)

val make_sequence_number_range :
  ?ending_sequence_number:string -> starting_sequence_number:string -> unit
-> sequence_number_range
(** Create a {!type-sequence_number_range} type *)

val make_shard :
  ?adjacent_parent_shard_id:string ->
  ?parent_shard_id:string ->
  sequence_number_range:sequence_number_range ->
  hash_key_range:hash_key_range ->
  shard_id:string ->
  unit
-> shard
(** Create a {!type-shard} type *)

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
  unit
-> stream_description
(** Create a {!type-stream_description} type *)

val make_stop_stream_encryption_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  key_id:string ->
  encryption_type:encryption_type ->
  unit
-> stop_stream_encryption_input
(** Create a {!type-stop_stream_encryption_input} type *)

val make_start_stream_encryption_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  key_id:string ->
  encryption_type:encryption_type ->
  unit
-> start_stream_encryption_input
(** Create a {!type-start_stream_encryption_input} type *)

val make_split_shard_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  new_starting_hash_key:string ->
  shard_to_split:string ->
  unit
-> split_shard_input
(** Create a {!type-split_shard_input} type *)

val make_shard_filter :
  ?timestamp_:float -> ?shard_id:string -> type_:shard_filter_type -> unit
-> shard_filter
(** Create a {!type-shard_filter} type *)

val make_remove_tags_from_stream_input :
  ?stream_ar_n:string -> ?stream_name:string -> tag_keys:string list -> unit
-> remove_tags_from_stream_input
(** Create a {!type-remove_tags_from_stream_input} type *)

val make_consumer :
  consumer_creation_timestamp:float ->
  consumer_status:consumer_status ->
  consumer_ar_n:string ->
  consumer_name:string ->
  unit
-> consumer
(** Create a {!type-consumer} type *)

val make_register_stream_consumer_output : consumer:consumer -> unit
-> register_stream_consumer_output
(** Create a {!type-register_stream_consumer_output} type *)

val make_register_stream_consumer_input :
  consumer_name:string -> stream_ar_n:string -> unit
-> register_stream_consumer_input
(** Create a {!type-register_stream_consumer_input} type *)

val make_put_resource_policy_input :
  policy:string -> resource_ar_n:string -> unit
-> put_resource_policy_input
(** Create a {!type-put_resource_policy_input} type *)

val make_put_records_result_entry :
  ?error_message:string ->
  ?error_code:string ->
  ?shard_id:string ->
  ?sequence_number:string ->
  unit
-> put_records_result_entry
(** Create a {!type-put_records_result_entry} type *)

val make_put_records_request_entry :
  ?explicit_hash_key:string -> partition_key:string -> data:bytes -> unit
-> put_records_request_entry
(** Create a {!type-put_records_request_entry} type *)

val make_put_records_output :
  ?encryption_type:encryption_type ->
  ?failed_record_count:int ->
  records:put_records_result_entry list ->
  unit
-> put_records_output
(** Create a {!type-put_records_output} type *)

val make_put_records_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  records:put_records_request_entry list ->
  unit
-> put_records_input
(** Create a {!type-put_records_input} type *)

val make_put_record_output :
  ?encryption_type:encryption_type ->
  sequence_number:string ->
  shard_id:string ->
  unit
-> put_record_output
(** Create a {!type-put_record_output} type *)

val make_put_record_input :
  ?stream_ar_n:string ->
  ?sequence_number_for_ordering:string ->
  ?explicit_hash_key:string ->
  ?stream_name:string ->
  partition_key:string ->
  data:bytes ->
  unit
-> put_record_input
(** Create a {!type-put_record_input} type *)

val make_merge_shards_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  adjacent_shard_to_merge:string ->
  shard_to_merge:string ->
  unit
-> merge_shards_input
(** Create a {!type-merge_shards_input} type *)

val make_list_tags_for_stream_output :
  has_more_tags:bool -> tags:tag list -> unit
-> list_tags_for_stream_output
(** Create a {!type-list_tags_for_stream_output} type *)

val make_list_tags_for_stream_input :
  ?stream_ar_n:string ->
  ?limit:int ->
  ?exclusive_start_tag_key:string ->
  ?stream_name:string ->
  unit
-> list_tags_for_stream_input
(** Create a {!type-list_tags_for_stream_input} type *)

val make_list_streams_output :
  ?stream_summaries:stream_summary list ->
  ?next_token:string ->
  has_more_streams:bool ->
  stream_names:string list ->
  unit
-> list_streams_output
(** Create a {!type-list_streams_output} type *)

val make_list_streams_input :
  ?next_token:string ->
  ?exclusive_start_stream_name:string ->
  ?limit:int ->
  unit
-> list_streams_input
(** Create a {!type-list_streams_input} type *)

val make_list_stream_consumers_output :
  ?next_token:string -> ?consumers:consumer list -> unit
-> list_stream_consumers_output
(** Create a {!type-list_stream_consumers_output} type *)

val make_list_stream_consumers_input :
  ?stream_creation_timestamp:float ->
  ?max_results:int ->
  ?next_token:string ->
  stream_ar_n:string ->
  unit
-> list_stream_consumers_input
(** Create a {!type-list_stream_consumers_input} type *)

val make_list_shards_output :
  ?next_token:string -> ?shards:shard list -> unit
-> list_shards_output
(** Create a {!type-list_shards_output} type *)

val make_list_shards_input :
  ?stream_ar_n:string ->
  ?shard_filter:shard_filter ->
  ?stream_creation_timestamp:float ->
  ?max_results:int ->
  ?exclusive_start_shard_id:string ->
  ?next_token:string ->
  ?stream_name:string ->
  unit
-> list_shards_input
(** Create a {!type-list_shards_input} type *)

val make_increase_stream_retention_period_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  retention_period_hours:int ->
  unit
-> increase_stream_retention_period_input
(** Create a {!type-increase_stream_retention_period_input} type *)

val make_get_shard_iterator_output : ?shard_iterator:string -> unit
-> get_shard_iterator_output
(** Create a {!type-get_shard_iterator_output} type *)

val make_get_shard_iterator_input :
  ?stream_ar_n:string ->
  ?timestamp_:float ->
  ?starting_sequence_number:string ->
  ?stream_name:string ->
  shard_iterator_type:shard_iterator_type ->
  shard_id:string ->
  unit
-> get_shard_iterator_input
(** Create a {!type-get_shard_iterator_input} type *)

val make_get_resource_policy_output : policy:string -> unit
-> get_resource_policy_output
(** Create a {!type-get_resource_policy_output} type *)

val make_get_resource_policy_input : resource_ar_n:string -> unit
-> get_resource_policy_input
(** Create a {!type-get_resource_policy_input} type *)

val make_get_records_output :
  ?child_shards:child_shard list ->
  ?millis_behind_latest:int ->
  ?next_shard_iterator:string ->
  records:record list ->
  unit
-> get_records_output
(** Create a {!type-get_records_output} type *)

val make_get_records_input :
  ?stream_ar_n:string -> ?limit:int -> shard_iterator:string -> unit
-> get_records_input
(** Create a {!type-get_records_input} type *)

val make_enhanced_monitoring_output :
  ?stream_ar_n:string ->
  ?desired_shard_level_metrics:metrics_name list ->
  ?current_shard_level_metrics:metrics_name list ->
  ?stream_name:string ->
  unit
-> enhanced_monitoring_output
(** Create a {!type-enhanced_monitoring_output} type *)

val make_enable_enhanced_monitoring_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  shard_level_metrics:metrics_name list ->
  unit
-> enable_enhanced_monitoring_input
(** Create a {!type-enable_enhanced_monitoring_input} type *)

val make_disable_enhanced_monitoring_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  shard_level_metrics:metrics_name list ->
  unit
-> disable_enhanced_monitoring_input
(** Create a {!type-disable_enhanced_monitoring_input} type *)

val make_describe_stream_summary_output :
  stream_description_summary:stream_description_summary -> unit
-> describe_stream_summary_output
(** Create a {!type-describe_stream_summary_output} type *)

val make_describe_stream_summary_input :
  ?stream_ar_n:string -> ?stream_name:string -> unit
-> describe_stream_summary_input
(** Create a {!type-describe_stream_summary_input} type *)

val make_consumer_description :
  stream_ar_n:string ->
  consumer_creation_timestamp:float ->
  consumer_status:consumer_status ->
  consumer_ar_n:string ->
  consumer_name:string ->
  unit
-> consumer_description
(** Create a {!type-consumer_description} type *)

val make_describe_stream_consumer_output :
  consumer_description:consumer_description -> unit
-> describe_stream_consumer_output
(** Create a {!type-describe_stream_consumer_output} type *)

val make_describe_stream_consumer_input :
  ?consumer_ar_n:string ->
  ?consumer_name:string ->
  ?stream_ar_n:string ->
  unit
-> describe_stream_consumer_input
(** Create a {!type-describe_stream_consumer_input} type *)

val make_describe_stream_output :
  stream_description:stream_description -> unit
-> describe_stream_output
(** Create a {!type-describe_stream_output} type *)

val make_describe_stream_input :
  ?stream_ar_n:string ->
  ?exclusive_start_shard_id:string ->
  ?limit:int ->
  ?stream_name:string ->
  unit
-> describe_stream_input
(** Create a {!type-describe_stream_input} type *)

val make_describe_limits_output :
  on_demand_stream_count_limit:int ->
  on_demand_stream_count:int ->
  open_shard_count:int ->
  shard_limit:int ->
  unit
-> describe_limits_output
(** Create a {!type-describe_limits_output} type *)

val make_describe_limits_input : unit
-> describe_limits_input
(** Create a {!type-describe_limits_input} type *)

val make_deregister_stream_consumer_input :
  ?consumer_ar_n:string ->
  ?consumer_name:string ->
  ?stream_ar_n:string ->
  unit
-> deregister_stream_consumer_input
(** Create a {!type-deregister_stream_consumer_input} type *)

val make_delete_stream_input :
  ?stream_ar_n:string ->
  ?enforce_consumer_deletion:bool ->
  ?stream_name:string ->
  unit
-> delete_stream_input
(** Create a {!type-delete_stream_input} type *)

val make_delete_resource_policy_input : resource_ar_n:string -> unit
-> delete_resource_policy_input
(** Create a {!type-delete_resource_policy_input} type *)

val make_decrease_stream_retention_period_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  retention_period_hours:int ->
  unit
-> decrease_stream_retention_period_input
(** Create a {!type-decrease_stream_retention_period_input} type *)

val make_create_stream_input :
  ?stream_mode_details:stream_mode_details ->
  ?shard_count:int ->
  stream_name:string ->
  unit
-> create_stream_input
(** Create a {!type-create_stream_input} type *)

val make_add_tags_to_stream_input :
  ?stream_ar_n:string ->
  ?stream_name:string ->
  tags:(string * string) list ->
  unit
-> add_tags_to_stream_input
(** Create a {!type-add_tags_to_stream_input} type *)

