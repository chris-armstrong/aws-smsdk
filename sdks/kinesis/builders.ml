[@@@warning "-39"]
open Types
let make_stream_mode_details  ~(stream_mode : stream_mode) ()
: stream_mode_details = { stream_mode;  }

let make_update_stream_mode_input 
  ~(stream_mode_details : stream_mode_details) ~(stream_ar_n : string) ()
: update_stream_mode_input = { stream_mode_details; stream_ar_n; 
}

let make_update_shard_count_output 
  ?(stream_ar_n : string option)
  ?(target_shard_count : int option)
  ?(current_shard_count : int option)
  ?(stream_name : string option)
  () : update_shard_count_output = {
  stream_ar_n; target_shard_count; current_shard_count; stream_name; 
}

let make_update_shard_count_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(scaling_type : scaling_type)
  ~(target_shard_count : int)
  () : update_shard_count_input = {
  stream_ar_n; scaling_type; target_shard_count; stream_name;  }

let make_tag  ?(value : string option) ~(key : string) () : tag = {
  value; key;  }

let make_record 
  ?(encryption_type : encryption_type option)
  ?(approximate_arrival_timestamp : float option)
  ~(partition_key : string)
  ~(data : bytes)
  ~(sequence_number : string)
  () : record = {
  encryption_type;
  partition_key;
  data;
  approximate_arrival_timestamp;
  sequence_number;
   }

let make_hash_key_range 
  ~(ending_hash_key : string) ~(starting_hash_key : string) ()
: hash_key_range = { ending_hash_key; starting_hash_key; 
}

let make_child_shard 
  ~(hash_key_range : hash_key_range)
  ~(parent_shards : string list)
  ~(shard_id : string)
  () : child_shard = { hash_key_range; parent_shards; shard_id; 
}

let make_subscribe_to_shard_event 
  ?(child_shards : child_shard list option)
  ~(millis_behind_latest : int)
  ~(continuation_sequence_number : string)
  ~(records : record list)
  () : subscribe_to_shard_event = {
  child_shards; millis_behind_latest; continuation_sequence_number; records; 
}

let make_subscribe_to_shard_output 
  ~(event_stream : subscribe_to_shard_event_stream) ()
: subscribe_to_shard_output = { event_stream;  }

let make_starting_position 
  ?(timestamp_ : float option)
  ?(sequence_number : string option)
  ~(type_ : shard_iterator_type)
  () : starting_position = { timestamp_; sequence_number; type_; 
}

let make_subscribe_to_shard_input 
  ~(starting_position : starting_position)
  ~(shard_id : string)
  ~(consumer_ar_n : string)
  () : subscribe_to_shard_input = {
  starting_position; shard_id; consumer_ar_n;  }

let make_stream_summary 
  ?(stream_creation_timestamp : float option)
  ?(stream_mode_details : stream_mode_details option)
  ~(stream_status : stream_status)
  ~(stream_ar_n : string)
  ~(stream_name : string)
  () : stream_summary = {
  stream_creation_timestamp;
  stream_mode_details;
  stream_status;
  stream_ar_n;
  stream_name;
   }

let make_enhanced_metrics 
  ?(shard_level_metrics : metrics_name list option) () : enhanced_metrics = {
  shard_level_metrics;  }

let make_stream_description_summary 
  ?(consumer_count : int option)
  ?(key_id : string option)
  ?(encryption_type : encryption_type option)
  ?(stream_mode_details : stream_mode_details option)
  ~(open_shard_count : int)
  ~(enhanced_monitoring : enhanced_metrics list)
  ~(stream_creation_timestamp : float)
  ~(retention_period_hours : int)
  ~(stream_status : stream_status)
  ~(stream_ar_n : string)
  ~(stream_name : string)
  () : stream_description_summary = {
  consumer_count;
  open_shard_count;
  key_id;
  encryption_type;
  enhanced_monitoring;
  stream_creation_timestamp;
  retention_period_hours;
  stream_mode_details;
  stream_status;
  stream_ar_n;
  stream_name;
   }

let make_sequence_number_range 
  ?(ending_sequence_number : string option)
  ~(starting_sequence_number : string)
  () : sequence_number_range = {
  ending_sequence_number; starting_sequence_number;  }

let make_shard 
  ?(adjacent_parent_shard_id : string option)
  ?(parent_shard_id : string option)
  ~(sequence_number_range : sequence_number_range)
  ~(hash_key_range : hash_key_range)
  ~(shard_id : string)
  () : shard = {
  sequence_number_range;
  hash_key_range;
  adjacent_parent_shard_id;
  parent_shard_id;
  shard_id;
   }

let make_stream_description 
  ?(key_id : string option)
  ?(encryption_type : encryption_type option)
  ?(stream_mode_details : stream_mode_details option)
  ~(enhanced_monitoring : enhanced_metrics list)
  ~(stream_creation_timestamp : float)
  ~(retention_period_hours : int)
  ~(has_more_shards : bool)
  ~(shards : shard list)
  ~(stream_status : stream_status)
  ~(stream_ar_n : string)
  ~(stream_name : string)
  () : stream_description = {
  key_id;
  encryption_type;
  enhanced_monitoring;
  stream_creation_timestamp;
  retention_period_hours;
  has_more_shards;
  shards;
  stream_mode_details;
  stream_status;
  stream_ar_n;
  stream_name;
   }

let make_stop_stream_encryption_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(key_id : string)
  ~(encryption_type : encryption_type)
  () : stop_stream_encryption_input = {
  stream_ar_n; key_id; encryption_type; stream_name; 
}

let make_start_stream_encryption_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(key_id : string)
  ~(encryption_type : encryption_type)
  () : start_stream_encryption_input = {
  stream_ar_n; key_id; encryption_type; stream_name; 
}

let make_split_shard_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(new_starting_hash_key : string)
  ~(shard_to_split : string)
  () : split_shard_input = {
  stream_ar_n; new_starting_hash_key; shard_to_split; stream_name; 
}

let make_shard_filter 
  ?(timestamp_ : float option)
  ?(shard_id : string option)
  ~(type_ : shard_filter_type)
  () : shard_filter = { timestamp_; shard_id; type_; 
}

let make_remove_tags_from_stream_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(tag_keys : string list)
  () : remove_tags_from_stream_input = { stream_ar_n; tag_keys; stream_name; 
}

let make_consumer 
  ~(consumer_creation_timestamp : float)
  ~(consumer_status : consumer_status)
  ~(consumer_ar_n : string)
  ~(consumer_name : string)
  () : consumer = {
  consumer_creation_timestamp; consumer_status; consumer_ar_n; consumer_name; 
}

let make_register_stream_consumer_output  ~(consumer : consumer) ()
: register_stream_consumer_output = { consumer; 
}

let make_register_stream_consumer_input 
  ~(consumer_name : string) ~(stream_ar_n : string) ()
: register_stream_consumer_input = { consumer_name; stream_ar_n; 
}

let make_put_resource_policy_input 
  ~(policy : string) ~(resource_ar_n : string) () : put_resource_policy_input
= { policy; resource_ar_n;  }

let make_put_records_result_entry 
  ?(error_message : string option)
  ?(error_code : string option)
  ?(shard_id : string option)
  ?(sequence_number : string option)
  () : put_records_result_entry = {
  error_message; error_code; shard_id; sequence_number; 
}

let make_put_records_request_entry 
  ?(explicit_hash_key : string option)
  ~(partition_key : string)
  ~(data : bytes)
  () : put_records_request_entry = { partition_key; explicit_hash_key; data; 
}

let make_put_records_output 
  ?(encryption_type : encryption_type option)
  ?(failed_record_count : int option)
  ~(records : put_records_result_entry list)
  () : put_records_output = { encryption_type; records; failed_record_count; 
}

let make_put_records_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(records : put_records_request_entry list)
  () : put_records_input = { stream_ar_n; stream_name; records; 
}

let make_put_record_output 
  ?(encryption_type : encryption_type option)
  ~(sequence_number : string)
  ~(shard_id : string)
  () : put_record_output = { encryption_type; sequence_number; shard_id; 
}

let make_put_record_input 
  ?(stream_ar_n : string option)
  ?(sequence_number_for_ordering : string option)
  ?(explicit_hash_key : string option)
  ?(stream_name : string option)
  ~(partition_key : string)
  ~(data : bytes)
  () : put_record_input = {
  stream_ar_n;
  sequence_number_for_ordering;
  explicit_hash_key;
  partition_key;
  data;
  stream_name;
   }

let make_merge_shards_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(adjacent_shard_to_merge : string)
  ~(shard_to_merge : string)
  () : merge_shards_input = {
  stream_ar_n; adjacent_shard_to_merge; shard_to_merge; stream_name; 
}

let make_list_tags_for_stream_output 
  ~(has_more_tags : bool) ~(tags : tag list) () : list_tags_for_stream_output
= { has_more_tags; tags;  }

let make_list_tags_for_stream_input 
  ?(stream_ar_n : string option)
  ?(limit : int option)
  ?(exclusive_start_tag_key : string option)
  ?(stream_name : string option)
  () : list_tags_for_stream_input = {
  stream_ar_n; limit; exclusive_start_tag_key; stream_name; 
}

let make_list_streams_output 
  ?(stream_summaries : stream_summary list option)
  ?(next_token : string option)
  ~(has_more_streams : bool)
  ~(stream_names : string list)
  () : list_streams_output = {
  stream_summaries; next_token; has_more_streams; stream_names; 
}

let make_list_streams_input 
  ?(next_token : string option)
  ?(exclusive_start_stream_name : string option)
  ?(limit : int option)
  () : list_streams_input = {
  next_token; exclusive_start_stream_name; limit; 
}

let make_list_stream_consumers_output 
  ?(next_token : string option) ?(consumers : consumer list option) ()
: list_stream_consumers_output = { next_token; consumers; 
}

let make_list_stream_consumers_input 
  ?(stream_creation_timestamp : float option)
  ?(max_results : int option)
  ?(next_token : string option)
  ~(stream_ar_n : string)
  () : list_stream_consumers_input = {
  stream_creation_timestamp; max_results; next_token; stream_ar_n; 
}

let make_list_shards_output 
  ?(next_token : string option) ?(shards : shard list option) ()
: list_shards_output = { next_token; shards;  }

let make_list_shards_input 
  ?(stream_ar_n : string option)
  ?(shard_filter : shard_filter option)
  ?(stream_creation_timestamp : float option)
  ?(max_results : int option)
  ?(exclusive_start_shard_id : string option)
  ?(next_token : string option)
  ?(stream_name : string option)
  () : list_shards_input = {
  stream_ar_n;
  shard_filter;
  stream_creation_timestamp;
  max_results;
  exclusive_start_shard_id;
  next_token;
  stream_name;
   }

let make_increase_stream_retention_period_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(retention_period_hours : int)
  () : increase_stream_retention_period_input = {
  stream_ar_n; retention_period_hours; stream_name; 
}

let make_get_shard_iterator_output  ?(shard_iterator : string option) ()
: get_shard_iterator_output = { shard_iterator; 
}

let make_get_shard_iterator_input 
  ?(stream_ar_n : string option)
  ?(timestamp_ : float option)
  ?(starting_sequence_number : string option)
  ?(stream_name : string option)
  ~(shard_iterator_type : shard_iterator_type)
  ~(shard_id : string)
  () : get_shard_iterator_input = {
  stream_ar_n;
  timestamp_;
  starting_sequence_number;
  shard_iterator_type;
  shard_id;
  stream_name;
   }

let make_get_resource_policy_output  ~(policy : string) ()
: get_resource_policy_output = { policy; 
}

let make_get_resource_policy_input  ~(resource_ar_n : string) ()
: get_resource_policy_input = { resource_ar_n;  }

let make_get_records_output 
  ?(child_shards : child_shard list option)
  ?(millis_behind_latest : int option)
  ?(next_shard_iterator : string option)
  ~(records : record list)
  () : get_records_output = {
  child_shards; millis_behind_latest; next_shard_iterator; records; 
}

let make_get_records_input 
  ?(stream_ar_n : string option)
  ?(limit : int option)
  ~(shard_iterator : string)
  () : get_records_input = { stream_ar_n; limit; shard_iterator; 
}

let make_enhanced_monitoring_output 
  ?(stream_ar_n : string option)
  ?(desired_shard_level_metrics : metrics_name list option)
  ?(current_shard_level_metrics : metrics_name list option)
  ?(stream_name : string option)
  () : enhanced_monitoring_output = {
  stream_ar_n;
  desired_shard_level_metrics;
  current_shard_level_metrics;
  stream_name;
   }

let make_enable_enhanced_monitoring_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(shard_level_metrics : metrics_name list)
  () : enable_enhanced_monitoring_input = {
  stream_ar_n; shard_level_metrics; stream_name; 
}

let make_disable_enhanced_monitoring_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(shard_level_metrics : metrics_name list)
  () : disable_enhanced_monitoring_input = {
  stream_ar_n; shard_level_metrics; stream_name; 
}

let make_describe_stream_summary_output 
  ~(stream_description_summary : stream_description_summary) ()
: describe_stream_summary_output = { stream_description_summary; 
}

let make_describe_stream_summary_input 
  ?(stream_ar_n : string option) ?(stream_name : string option) ()
: describe_stream_summary_input = { stream_ar_n; stream_name; 
}

let make_consumer_description 
  ~(stream_ar_n : string)
  ~(consumer_creation_timestamp : float)
  ~(consumer_status : consumer_status)
  ~(consumer_ar_n : string)
  ~(consumer_name : string)
  () : consumer_description = {
  stream_ar_n;
  consumer_creation_timestamp;
  consumer_status;
  consumer_ar_n;
  consumer_name;
   }

let make_describe_stream_consumer_output 
  ~(consumer_description : consumer_description) ()
: describe_stream_consumer_output = { consumer_description; 
}

let make_describe_stream_consumer_input 
  ?(consumer_ar_n : string option)
  ?(consumer_name : string option)
  ?(stream_ar_n : string option)
  () : describe_stream_consumer_input = {
  consumer_ar_n; consumer_name; stream_ar_n; 
}

let make_describe_stream_output 
  ~(stream_description : stream_description) () : describe_stream_output = {
  stream_description;  }

let make_describe_stream_input 
  ?(stream_ar_n : string option)
  ?(exclusive_start_shard_id : string option)
  ?(limit : int option)
  ?(stream_name : string option)
  () : describe_stream_input = {
  stream_ar_n; exclusive_start_shard_id; limit; stream_name; 
}

let make_describe_limits_output 
  ~(on_demand_stream_count_limit : int)
  ~(on_demand_stream_count : int)
  ~(open_shard_count : int)
  ~(shard_limit : int)
  () : describe_limits_output = {
  on_demand_stream_count_limit;
  on_demand_stream_count;
  open_shard_count;
  shard_limit;
   }

let make_describe_limits_input  () : describe_limits_input =
()

let make_deregister_stream_consumer_input 
  ?(consumer_ar_n : string option)
  ?(consumer_name : string option)
  ?(stream_ar_n : string option)
  () : deregister_stream_consumer_input = {
  consumer_ar_n; consumer_name; stream_ar_n;  }

let make_delete_stream_input 
  ?(stream_ar_n : string option)
  ?(enforce_consumer_deletion : bool option)
  ?(stream_name : string option)
  () : delete_stream_input = {
  stream_ar_n; enforce_consumer_deletion; stream_name; 
}

let make_delete_resource_policy_input  ~(resource_ar_n : string) ()
: delete_resource_policy_input = { resource_ar_n; 
}

let make_decrease_stream_retention_period_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(retention_period_hours : int)
  () : decrease_stream_retention_period_input = {
  stream_ar_n; retention_period_hours; stream_name; 
}

let make_create_stream_input 
  ?(stream_mode_details : stream_mode_details option)
  ?(shard_count : int option)
  ~(stream_name : string)
  () : create_stream_input = {
  stream_mode_details; shard_count; stream_name; 
}

let make_add_tags_to_stream_input 
  ?(stream_ar_n : string option)
  ?(stream_name : string option)
  ~(tags : (string * string) list)
  () : add_tags_to_stream_input = { stream_ar_n; tags; stream_name; 
}

