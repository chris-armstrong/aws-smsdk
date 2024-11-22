[@@@warning "-39"]
open Types
let make_update_table_response  ~(resource_arn : string) ()
: update_table_response = { resource_arn;  }

let make_column_definition  ~(type_ : string) ~(name : string) ()
: column_definition = { type_; name;  }

let make_capacity_specification 
  ?(write_capacity_units : int option)
  ?(read_capacity_units : int option)
  ~(throughput_mode : throughput_mode)
  () : capacity_specification = {
  write_capacity_units; read_capacity_units; throughput_mode; 
}

let make_encryption_specification 
  ?(kms_key_identifier : string option) ~(type_ : encryption_type) ()
: encryption_specification = { kms_key_identifier; type_; 
}

let make_point_in_time_recovery  ~(status : point_in_time_recovery_status) ()
: point_in_time_recovery = { status;  }

let make_time_to_live  ~(status : time_to_live_status) () : time_to_live = {
  status;  }

let make_client_side_timestamps  ~(status : client_side_timestamps_status) ()
: client_side_timestamps = { status; 
}

let make_target_tracking_scaling_policy_configuration 
  ?(scale_out_cooldown : int option)
  ?(scale_in_cooldown : int option)
  ?(disable_scale_in : bool option)
  ~(target_value : float)
  () : target_tracking_scaling_policy_configuration = {
  target_value; scale_out_cooldown; scale_in_cooldown; disable_scale_in; 
}

let make_auto_scaling_policy 
  ?(target_tracking_scaling_policy_configuration : target_tracking_scaling_policy_configuration option)
  () : auto_scaling_policy = { target_tracking_scaling_policy_configuration; 
}

let make_auto_scaling_settings 
  ?(scaling_policy : auto_scaling_policy option)
  ?(maximum_units : int option)
  ?(minimum_units : int option)
  ?(auto_scaling_disabled : bool option)
  () : auto_scaling_settings = {
  scaling_policy; maximum_units; minimum_units; auto_scaling_disabled; 
}

let make_auto_scaling_specification 
  ?(read_capacity_auto_scaling : auto_scaling_settings option)
  ?(write_capacity_auto_scaling : auto_scaling_settings option)
  () : auto_scaling_specification = {
  read_capacity_auto_scaling; write_capacity_auto_scaling; 
}

let make_replica_specification 
  ?(read_capacity_auto_scaling : auto_scaling_settings option)
  ?(read_capacity_units : int option)
  ~(region : string)
  () : replica_specification = {
  read_capacity_auto_scaling; read_capacity_units; region; 
}

let make_update_table_request 
  ?(replica_specifications : replica_specification list option)
  ?(auto_scaling_specification : auto_scaling_specification option)
  ?(client_side_timestamps : client_side_timestamps option)
  ?(default_time_to_live : int option)
  ?(ttl : time_to_live option)
  ?(point_in_time_recovery : point_in_time_recovery option)
  ?(encryption_specification : encryption_specification option)
  ?(capacity_specification : capacity_specification option)
  ?(add_columns : column_definition list option)
  ~(table_name : string)
  ~(keyspace_name : string)
  () : update_table_request = {
  replica_specifications;
  auto_scaling_specification;
  client_side_timestamps;
  default_time_to_live;
  ttl;
  point_in_time_recovery;
  encryption_specification;
  capacity_specification;
  add_columns;
  table_name;
  keyspace_name;
   }

let make_untag_resource_response  () : untag_resource_response =
()

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_untag_resource_request 
  ~(tags : tag list) ~(resource_arn : string) () : untag_resource_request = {
  tags; resource_arn;  }

let make_tag_resource_response  () : tag_resource_response =
()

let make_tag_resource_request  ~(tags : tag list) ~(resource_arn : string) ()
: tag_resource_request = { tags; resource_arn;  }

let make_table_summary 
  ~(resource_arn : string)
  ~(table_name : string)
  ~(keyspace_name : string)
  () : table_summary = { resource_arn; table_name; keyspace_name; 
}

let make_static_column  ~(name : string) () : static_column = { name; 
}

let make_partition_key  ~(name : string) () : partition_key = { name; 
}

let make_clustering_key  ~(order_by : sort_order) ~(name : string) ()
: clustering_key = { order_by; name;  }

let make_schema_definition 
  ?(static_columns : static_column list option)
  ?(clustering_keys : clustering_key list option)
  ~(partition_keys : partition_key list)
  ~(all_columns : column_definition list)
  () : schema_definition = {
  static_columns; clustering_keys; partition_keys; all_columns; 
}

let make_restore_table_response  ~(restored_table_ar_n : string) ()
: restore_table_response = { restored_table_ar_n; 
}

let make_restore_table_request 
  ?(replica_specifications : replica_specification list option)
  ?(auto_scaling_specification : auto_scaling_specification option)
  ?(tags_override : tag list option)
  ?(point_in_time_recovery_override : point_in_time_recovery option)
  ?(encryption_specification_override : encryption_specification option)
  ?(capacity_specification_override : capacity_specification option)
  ?(restore_timestamp : float option)
  ~(target_table_name : string)
  ~(target_keyspace_name : string)
  ~(source_table_name : string)
  ~(source_keyspace_name : string)
  () : restore_table_request = {
  replica_specifications;
  auto_scaling_specification;
  tags_override;
  point_in_time_recovery_override;
  encryption_specification_override;
  capacity_specification_override;
  restore_timestamp;
  target_table_name;
  target_keyspace_name;
  source_table_name;
  source_keyspace_name;
   }

let make_replication_specification 
  ?(region_list : string list option) ~(replication_strategy : rs) ()
: replication_specification = { region_list; replication_strategy; 
}

let make_capacity_specification_summary 
  ?(last_update_to_pay_per_request_timestamp : float option)
  ?(write_capacity_units : int option)
  ?(read_capacity_units : int option)
  ~(throughput_mode : throughput_mode)
  () : capacity_specification_summary = {
  last_update_to_pay_per_request_timestamp;
  write_capacity_units;
  read_capacity_units;
  throughput_mode;
   }

let make_replica_specification_summary 
  ?(capacity_specification : capacity_specification_summary option)
  ?(status : table_status option)
  ?(region : string option)
  () : replica_specification_summary = {
  capacity_specification; status; region; 
}

let make_replica_auto_scaling_specification 
  ?(auto_scaling_specification : auto_scaling_specification option)
  ?(region : string option)
  () : replica_auto_scaling_specification = {
  auto_scaling_specification; region; 
}

let make_point_in_time_recovery_summary 
  ?(earliest_restorable_timestamp : float option)
  ~(status : point_in_time_recovery_status)
  () : point_in_time_recovery_summary = {
  earliest_restorable_timestamp; status; 
}

let make_list_tags_for_resource_response 
  ?(tags : tag list option) ?(next_token : string option) ()
: list_tags_for_resource_response = { tags; next_token; 
}

let make_list_tags_for_resource_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(resource_arn : string)
  () : list_tags_for_resource_request = {
  max_results; next_token; resource_arn;  }

let make_list_tables_response 
  ?(tables : table_summary list option) ?(next_token : string option) ()
: list_tables_response = { tables; next_token; 
}

let make_list_tables_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(keyspace_name : string)
  () : list_tables_request = { keyspace_name; max_results; next_token; 
}

let make_keyspace_summary 
  ?(replication_regions : string list option)
  ~(replication_strategy : rs)
  ~(resource_arn : string)
  ~(keyspace_name : string)
  () : keyspace_summary = {
  replication_regions; replication_strategy; resource_arn; keyspace_name; 
}

let make_list_keyspaces_response 
  ?(next_token : string option) ~(keyspaces : keyspace_summary list) ()
: list_keyspaces_response = { keyspaces; next_token; 
}

let make_list_keyspaces_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_keyspaces_request = { max_results; next_token; 
}

let make_get_table_auto_scaling_settings_response 
  ?(replica_specifications : replica_auto_scaling_specification list option)
  ?(auto_scaling_specification : auto_scaling_specification option)
  ~(resource_arn : string)
  ~(table_name : string)
  ~(keyspace_name : string)
  () : get_table_auto_scaling_settings_response = {
  replica_specifications;
  auto_scaling_specification;
  resource_arn;
  table_name;
  keyspace_name;
   }

let make_get_table_auto_scaling_settings_request 
  ~(table_name : string) ~(keyspace_name : string) ()
: get_table_auto_scaling_settings_request = { table_name; keyspace_name; 
}

let make_comment  ~(message : string) () : comment = { message; 
}

let make_get_table_response 
  ?(replica_specifications : replica_specification_summary list option)
  ?(client_side_timestamps : client_side_timestamps option)
  ?(comment : comment option)
  ?(default_time_to_live : int option)
  ?(ttl : time_to_live option)
  ?(point_in_time_recovery : point_in_time_recovery_summary option)
  ?(encryption_specification : encryption_specification option)
  ?(capacity_specification : capacity_specification_summary option)
  ?(schema_definition : schema_definition option)
  ?(status : table_status option)
  ?(creation_timestamp : float option)
  ~(resource_arn : string)
  ~(table_name : string)
  ~(keyspace_name : string)
  () : get_table_response = {
  replica_specifications;
  client_side_timestamps;
  comment;
  default_time_to_live;
  ttl;
  point_in_time_recovery;
  encryption_specification;
  capacity_specification;
  schema_definition;
  status;
  creation_timestamp;
  resource_arn;
  table_name;
  keyspace_name;
   }

let make_get_table_request 
  ~(table_name : string) ~(keyspace_name : string) () : get_table_request = {
  table_name; keyspace_name;  }

let make_get_keyspace_response 
  ?(replication_regions : string list option)
  ~(replication_strategy : rs)
  ~(resource_arn : string)
  ~(keyspace_name : string)
  () : get_keyspace_response = {
  replication_regions; replication_strategy; resource_arn; keyspace_name; 
}

let make_get_keyspace_request  ~(keyspace_name : string) ()
: get_keyspace_request = { keyspace_name;  }

let make_delete_table_response  () : delete_table_response =
()

let make_delete_table_request 
  ~(table_name : string) ~(keyspace_name : string) () : delete_table_request
= { table_name; keyspace_name;  }

let make_delete_keyspace_response  () : delete_keyspace_response =
()

let make_delete_keyspace_request  ~(keyspace_name : string) ()
: delete_keyspace_request = { keyspace_name; 
}

let make_create_table_response  ~(resource_arn : string) ()
: create_table_response = { resource_arn;  }

let make_create_table_request 
  ?(replica_specifications : replica_specification list option)
  ?(auto_scaling_specification : auto_scaling_specification option)
  ?(client_side_timestamps : client_side_timestamps option)
  ?(tags : tag list option)
  ?(default_time_to_live : int option)
  ?(ttl : time_to_live option)
  ?(point_in_time_recovery : point_in_time_recovery option)
  ?(encryption_specification : encryption_specification option)
  ?(capacity_specification : capacity_specification option)
  ?(comment : comment option)
  ~(schema_definition : schema_definition)
  ~(table_name : string)
  ~(keyspace_name : string)
  () : create_table_request = {
  replica_specifications;
  auto_scaling_specification;
  client_side_timestamps;
  tags;
  default_time_to_live;
  ttl;
  point_in_time_recovery;
  encryption_specification;
  capacity_specification;
  comment;
  schema_definition;
  table_name;
  keyspace_name;
   }

let make_create_keyspace_response  ~(resource_arn : string) ()
: create_keyspace_response = { resource_arn; 
}

let make_create_keyspace_request 
  ?(replication_specification : replication_specification option)
  ?(tags : tag list option)
  ~(keyspace_name : string)
  () : create_keyspace_request = {
  replication_specification; tags; keyspace_name; 
}

