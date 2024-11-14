[@@@warning "-39"]
open Types
let make_stream_record 
  ?(stream_view_type : stream_view_type option)
  ?(size_bytes : int option)
  ?(sequence_number : string option)
  ?(old_image : (string * attribute_value) list option)
  ?(new_image : (string * attribute_value) list option)
  ?(keys : (string * attribute_value) list option)
  ?(approximate_creation_date_time : float option)
  () : stream_record = {
  stream_view_type;
  size_bytes;
  sequence_number;
  old_image;
  new_image;
  keys;
  approximate_creation_date_time;
   }

let make_stream 
  ?(stream_label : string option)
  ?(table_name : string option)
  ?(stream_arn : string option)
  () : stream = { stream_label; table_name; stream_arn; 
}

let make_key_schema_element 
  ~(key_type : key_type) ~(attribute_name : string) () : key_schema_element =
{ key_type; attribute_name;  }

let make_sequence_number_range 
  ?(ending_sequence_number : string option)
  ?(starting_sequence_number : string option)
  () : sequence_number_range = {
  ending_sequence_number; starting_sequence_number;  }

let make_shard 
  ?(parent_shard_id : string option)
  ?(sequence_number_range : sequence_number_range option)
  ?(shard_id : string option)
  () : shard = { parent_shard_id; sequence_number_range; shard_id; 
}

let make_stream_description 
  ?(last_evaluated_shard_id : string option)
  ?(shards : shard list option)
  ?(key_schema : key_schema_element list option)
  ?(table_name : string option)
  ?(creation_request_date_time : float option)
  ?(stream_view_type : stream_view_type option)
  ?(stream_status : stream_status option)
  ?(stream_label : string option)
  ?(stream_arn : string option)
  () : stream_description = {
  last_evaluated_shard_id;
  shards;
  key_schema;
  table_name;
  creation_request_date_time;
  stream_view_type;
  stream_status;
  stream_label;
  stream_arn;
   }

let make_identity 
  ?(type_ : string option) ?(principal_id : string option) () : identity = {
  type_; principal_id;  }

let make_record 
  ?(user_identity : identity option)
  ?(dynamodb : stream_record option)
  ?(aws_region : string option)
  ?(event_source : string option)
  ?(event_version : string option)
  ?(event_name : operation_type option)
  ?(event_i_d : string option)
  () : record = {
  user_identity;
  dynamodb;
  aws_region;
  event_source;
  event_version;
  event_name;
  event_i_d;
   }

let make_list_streams_output 
  ?(last_evaluated_stream_arn : string option)
  ?(streams : stream list option)
  () : list_streams_output = { last_evaluated_stream_arn; streams; 
}

let make_list_streams_input 
  ?(exclusive_start_stream_arn : string option)
  ?(limit : int option)
  ?(table_name : string option)
  () : list_streams_input = { exclusive_start_stream_arn; limit; table_name; 
}

let make_get_shard_iterator_output  ?(shard_iterator : string option) ()
: get_shard_iterator_output = { shard_iterator; 
}

let make_get_shard_iterator_input 
  ?(sequence_number : string option)
  ~(shard_iterator_type : shard_iterator_type)
  ~(shard_id : string)
  ~(stream_arn : string)
  () : get_shard_iterator_input = {
  sequence_number; shard_iterator_type; shard_id; stream_arn; 
}

let make_get_records_output 
  ?(next_shard_iterator : string option) ?(records : record list option) ()
: get_records_output = { next_shard_iterator; records; 
}

let make_get_records_input 
  ?(limit : int option) ~(shard_iterator : string) () : get_records_input = {
  limit; shard_iterator;  }

let make_describe_stream_output 
  ?(stream_description : stream_description option) ()
: describe_stream_output = { stream_description; 
}

let make_describe_stream_input 
  ?(exclusive_start_shard_id : string option)
  ?(limit : int option)
  ~(stream_arn : string)
  () : describe_stream_input = {
  exclusive_start_shard_id; limit; stream_arn; 
}

