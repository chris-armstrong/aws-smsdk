[@@@warning "-39"]
open Types
let make_put_request  ~(item : (string * attribute_value) list) ()
: put_request = { item;  }

let make_delete_request  ~(key : (string * attribute_value) list) ()
: delete_request = { key;  }

let make_write_request 
  ?(delete_request : delete_request option)
  ?(put_request : put_request option)
  () : write_request = { delete_request; put_request; 
}

let make_time_to_live_specification 
  ~(attribute_name : string) ~(enabled : bool) ()
: time_to_live_specification = { attribute_name; enabled; 
}

let make_update_time_to_live_output 
  ?(time_to_live_specification : time_to_live_specification option) ()
: update_time_to_live_output = { time_to_live_specification; 
}

let make_update_time_to_live_input 
  ~(time_to_live_specification : time_to_live_specification)
  ~(table_name : string)
  () : update_time_to_live_input = { time_to_live_specification; table_name; 
}

let make_auto_scaling_target_tracking_scaling_policy_configuration_description 
  ?(scale_out_cooldown : int option)
  ?(scale_in_cooldown : int option)
  ?(disable_scale_in : bool option)
  ~(target_value : float)
  () : auto_scaling_target_tracking_scaling_policy_configuration_description
= { target_value; scale_out_cooldown; scale_in_cooldown; disable_scale_in; 
}

let make_auto_scaling_policy_description 
  ?(target_tracking_scaling_policy_configuration : auto_scaling_target_tracking_scaling_policy_configuration_description option)
  ?(policy_name : string option)
  () : auto_scaling_policy_description = {
  target_tracking_scaling_policy_configuration; policy_name; 
}

let make_auto_scaling_settings_description 
  ?(scaling_policies : auto_scaling_policy_description list option)
  ?(auto_scaling_role_arn : string option)
  ?(auto_scaling_disabled : bool option)
  ?(maximum_units : int option)
  ?(minimum_units : int option)
  () : auto_scaling_settings_description = {
  scaling_policies;
  auto_scaling_role_arn;
  auto_scaling_disabled;
  maximum_units;
  minimum_units;
   }

let make_replica_global_secondary_index_auto_scaling_description 
  ?(provisioned_write_capacity_auto_scaling_settings : auto_scaling_settings_description option)
  ?(provisioned_read_capacity_auto_scaling_settings : auto_scaling_settings_description option)
  ?(index_status : index_status option)
  ?(index_name : string option)
  () : replica_global_secondary_index_auto_scaling_description = {
  provisioned_write_capacity_auto_scaling_settings;
  provisioned_read_capacity_auto_scaling_settings;
  index_status;
  index_name;
   }

let make_replica_auto_scaling_description 
  ?(replica_status : replica_status option)
  ?(replica_provisioned_write_capacity_auto_scaling_settings : auto_scaling_settings_description option)
  ?(replica_provisioned_read_capacity_auto_scaling_settings : auto_scaling_settings_description option)
  ?(global_secondary_indexes : replica_global_secondary_index_auto_scaling_description list option)
  ?(region_name : string option)
  () : replica_auto_scaling_description = {
  replica_status;
  replica_provisioned_write_capacity_auto_scaling_settings;
  replica_provisioned_read_capacity_auto_scaling_settings;
  global_secondary_indexes;
  region_name;
   }

let make_table_auto_scaling_description 
  ?(replicas : replica_auto_scaling_description list option)
  ?(table_status : table_status option)
  ?(table_name : string option)
  () : table_auto_scaling_description = {
  replicas; table_status; table_name; 
}

let make_update_table_replica_auto_scaling_output 
  ?(table_auto_scaling_description : table_auto_scaling_description option)
  () : update_table_replica_auto_scaling_output = {
  table_auto_scaling_description; 
}

let make_auto_scaling_target_tracking_scaling_policy_configuration_update 
  ?(scale_out_cooldown : int option)
  ?(scale_in_cooldown : int option)
  ?(disable_scale_in : bool option)
  ~(target_value : float)
  () : auto_scaling_target_tracking_scaling_policy_configuration_update = {
  target_value; scale_out_cooldown; scale_in_cooldown; disable_scale_in; 
}

let make_auto_scaling_policy_update 
  ?(policy_name : string option)
  ~(target_tracking_scaling_policy_configuration : auto_scaling_target_tracking_scaling_policy_configuration_update)
  () : auto_scaling_policy_update = {
  target_tracking_scaling_policy_configuration; policy_name; 
}

let make_auto_scaling_settings_update 
  ?(scaling_policy_update : auto_scaling_policy_update option)
  ?(auto_scaling_role_arn : string option)
  ?(auto_scaling_disabled : bool option)
  ?(maximum_units : int option)
  ?(minimum_units : int option)
  () : auto_scaling_settings_update = {
  scaling_policy_update;
  auto_scaling_role_arn;
  auto_scaling_disabled;
  maximum_units;
  minimum_units;
   }

let make_global_secondary_index_auto_scaling_update 
  ?(provisioned_write_capacity_auto_scaling_update : auto_scaling_settings_update option)
  ?(index_name : string option)
  () : global_secondary_index_auto_scaling_update = {
  provisioned_write_capacity_auto_scaling_update; index_name; 
}

let make_replica_global_secondary_index_auto_scaling_update 
  ?(provisioned_read_capacity_auto_scaling_update : auto_scaling_settings_update option)
  ?(index_name : string option)
  () : replica_global_secondary_index_auto_scaling_update = {
  provisioned_read_capacity_auto_scaling_update; index_name; 
}

let make_replica_auto_scaling_update 
  ?(replica_provisioned_read_capacity_auto_scaling_update : auto_scaling_settings_update option)
  ?(replica_global_secondary_index_updates : replica_global_secondary_index_auto_scaling_update list option)
  ~(region_name : string)
  () : replica_auto_scaling_update = {
  replica_provisioned_read_capacity_auto_scaling_update;
  replica_global_secondary_index_updates;
  region_name;
   }

let make_update_table_replica_auto_scaling_input 
  ?(replica_updates : replica_auto_scaling_update list option)
  ?(provisioned_write_capacity_auto_scaling_update : auto_scaling_settings_update option)
  ?(global_secondary_index_updates : global_secondary_index_auto_scaling_update list option)
  ~(table_name : string)
  () : update_table_replica_auto_scaling_input = {
  replica_updates;
  provisioned_write_capacity_auto_scaling_update;
  table_name;
  global_secondary_index_updates;
   }

let make_attribute_definition 
  ~(attribute_type : scalar_attribute_type) ~(attribute_name : string) ()
: attribute_definition = { attribute_type; attribute_name; 
}

let make_key_schema_element 
  ~(key_type : key_type) ~(attribute_name : string) () : key_schema_element =
{ key_type; attribute_name;  }

let make_provisioned_throughput_description 
  ?(write_capacity_units : int option)
  ?(read_capacity_units : int option)
  ?(number_of_decreases_today : int option)
  ?(last_decrease_date_time : float option)
  ?(last_increase_date_time : float option)
  () : provisioned_throughput_description = {
  write_capacity_units;
  read_capacity_units;
  number_of_decreases_today;
  last_decrease_date_time;
  last_increase_date_time;
   }

let make_billing_mode_summary 
  ?(last_update_to_pay_per_request_date_time : float option)
  ?(billing_mode : billing_mode option)
  () : billing_mode_summary = {
  last_update_to_pay_per_request_date_time; billing_mode; 
}

let make_projection 
  ?(non_key_attributes : string list option)
  ?(projection_type : projection_type option)
  () : projection = { non_key_attributes; projection_type; 
}

let make_local_secondary_index_description 
  ?(index_arn : string option)
  ?(item_count : int option)
  ?(index_size_bytes : int option)
  ?(projection : projection option)
  ?(key_schema : key_schema_element list option)
  ?(index_name : string option)
  () : local_secondary_index_description = {
  index_arn;
  item_count;
  index_size_bytes;
  projection;
  key_schema;
  index_name;
   }

let make_on_demand_throughput 
  ?(max_write_request_units : int option)
  ?(max_read_request_units : int option)
  () : on_demand_throughput = {
  max_write_request_units; max_read_request_units; 
}

let make_global_secondary_index_description 
  ?(on_demand_throughput : on_demand_throughput option)
  ?(index_arn : string option)
  ?(item_count : int option)
  ?(index_size_bytes : int option)
  ?(provisioned_throughput : provisioned_throughput_description option)
  ?(backfilling : bool option)
  ?(index_status : index_status option)
  ?(projection : projection option)
  ?(key_schema : key_schema_element list option)
  ?(index_name : string option)
  () : global_secondary_index_description = {
  on_demand_throughput;
  index_arn;
  item_count;
  index_size_bytes;
  provisioned_throughput;
  backfilling;
  index_status;
  projection;
  key_schema;
  index_name;
   }

let make_stream_specification 
  ?(stream_view_type : stream_view_type option) ~(stream_enabled : bool) ()
: stream_specification = { stream_view_type; stream_enabled; 
}

let make_provisioned_throughput_override 
  ?(read_capacity_units : int option) () : provisioned_throughput_override =
{ read_capacity_units;  }

let make_on_demand_throughput_override 
  ?(max_read_request_units : int option) () : on_demand_throughput_override =
{ max_read_request_units; 
}

let make_replica_global_secondary_index_description 
  ?(on_demand_throughput_override : on_demand_throughput_override option)
  ?(provisioned_throughput_override : provisioned_throughput_override option)
  ?(index_name : string option)
  () : replica_global_secondary_index_description = {
  on_demand_throughput_override; provisioned_throughput_override; index_name; 
}

let make_table_class_summary 
  ?(last_update_date_time : float option)
  ?(table_class : table_class option)
  () : table_class_summary = { last_update_date_time; table_class; 
}

let make_replica_description 
  ?(replica_table_class_summary : table_class_summary option)
  ?(replica_inaccessible_date_time : float option)
  ?(global_secondary_indexes : replica_global_secondary_index_description list option)
  ?(on_demand_throughput_override : on_demand_throughput_override option)
  ?(provisioned_throughput_override : provisioned_throughput_override option)
  ?(kms_master_key_id : string option)
  ?(replica_status_percent_progress : string option)
  ?(replica_status_description : string option)
  ?(replica_status : replica_status option)
  ?(region_name : string option)
  () : replica_description = {
  replica_table_class_summary;
  replica_inaccessible_date_time;
  global_secondary_indexes;
  on_demand_throughput_override;
  provisioned_throughput_override;
  kms_master_key_id;
  replica_status_percent_progress;
  replica_status_description;
  replica_status;
  region_name;
   }

let make_restore_summary 
  ?(source_table_arn : string option)
  ?(source_backup_arn : string option)
  ~(restore_in_progress : bool)
  ~(restore_date_time : float)
  () : restore_summary = {
  restore_in_progress;
  restore_date_time;
  source_table_arn;
  source_backup_arn;
   }

let make_sse_description 
  ?(inaccessible_encryption_date_time : float option)
  ?(kms_master_key_arn : string option)
  ?(sse_type : sse_type option)
  ?(status : sse_status option)
  () : sse_description = {
  inaccessible_encryption_date_time; kms_master_key_arn; sse_type; status; 
}

let make_archival_summary 
  ?(archival_backup_arn : string option)
  ?(archival_reason : string option)
  ?(archival_date_time : float option)
  () : archival_summary = {
  archival_backup_arn; archival_reason; archival_date_time; 
}

let make_table_description 
  ?(on_demand_throughput : on_demand_throughput option)
  ?(deletion_protection_enabled : bool option)
  ?(table_class_summary : table_class_summary option)
  ?(archival_summary : archival_summary option)
  ?(sse_description : sse_description option)
  ?(restore_summary : restore_summary option)
  ?(replicas : replica_description list option)
  ?(global_table_version : string option)
  ?(latest_stream_arn : string option)
  ?(latest_stream_label : string option)
  ?(stream_specification : stream_specification option)
  ?(global_secondary_indexes : global_secondary_index_description list option)
  ?(local_secondary_indexes : local_secondary_index_description list option)
  ?(billing_mode_summary : billing_mode_summary option)
  ?(table_id : string option)
  ?(table_arn : string option)
  ?(item_count : int option)
  ?(table_size_bytes : int option)
  ?(provisioned_throughput : provisioned_throughput_description option)
  ?(creation_date_time : float option)
  ?(table_status : table_status option)
  ?(key_schema : key_schema_element list option)
  ?(table_name : string option)
  ?(attribute_definitions : attribute_definition list option)
  () : table_description = {
  on_demand_throughput;
  deletion_protection_enabled;
  table_class_summary;
  archival_summary;
  sse_description;
  restore_summary;
  replicas;
  global_table_version;
  latest_stream_arn;
  latest_stream_label;
  stream_specification;
  global_secondary_indexes;
  local_secondary_indexes;
  billing_mode_summary;
  table_id;
  table_arn;
  item_count;
  table_size_bytes;
  provisioned_throughput;
  creation_date_time;
  table_status;
  key_schema;
  table_name;
  attribute_definitions;
   }

let make_update_table_output 
  ?(table_description : table_description option) () : update_table_output =
{ table_description;  }

let make_provisioned_throughput 
  ~(write_capacity_units : int) ~(read_capacity_units : int) ()
: provisioned_throughput = { write_capacity_units; read_capacity_units; 
}

let make_update_global_secondary_index_action 
  ?(on_demand_throughput : on_demand_throughput option)
  ?(provisioned_throughput : provisioned_throughput option)
  ~(index_name : string)
  () : update_global_secondary_index_action = {
  on_demand_throughput; provisioned_throughput; index_name; 
}

let make_create_global_secondary_index_action 
  ?(on_demand_throughput : on_demand_throughput option)
  ?(provisioned_throughput : provisioned_throughput option)
  ~(projection : projection)
  ~(key_schema : key_schema_element list)
  ~(index_name : string)
  () : create_global_secondary_index_action = {
  on_demand_throughput;
  provisioned_throughput;
  projection;
  key_schema;
  index_name;
   }

let make_delete_global_secondary_index_action  ~(index_name : string) ()
: delete_global_secondary_index_action = { index_name; 
}

let make_global_secondary_index_update 
  ?(delete : delete_global_secondary_index_action option)
  ?(create : create_global_secondary_index_action option)
  ?(update : update_global_secondary_index_action option)
  () : global_secondary_index_update = { delete; create; update; 
}

let make_sse_specification 
  ?(kms_master_key_id : string option)
  ?(sse_type : sse_type option)
  ?(enabled : bool option)
  () : sse_specification = { kms_master_key_id; sse_type; enabled; 
}

let make_replica_global_secondary_index 
  ?(on_demand_throughput_override : on_demand_throughput_override option)
  ?(provisioned_throughput_override : provisioned_throughput_override option)
  ~(index_name : string)
  () : replica_global_secondary_index = {
  on_demand_throughput_override; provisioned_throughput_override; index_name; 
}

let make_create_replication_group_member_action 
  ?(table_class_override : table_class option)
  ?(global_secondary_indexes : replica_global_secondary_index list option)
  ?(on_demand_throughput_override : on_demand_throughput_override option)
  ?(provisioned_throughput_override : provisioned_throughput_override option)
  ?(kms_master_key_id : string option)
  ~(region_name : string)
  () : create_replication_group_member_action = {
  table_class_override;
  global_secondary_indexes;
  on_demand_throughput_override;
  provisioned_throughput_override;
  kms_master_key_id;
  region_name;
   }

let make_update_replication_group_member_action 
  ?(table_class_override : table_class option)
  ?(global_secondary_indexes : replica_global_secondary_index list option)
  ?(on_demand_throughput_override : on_demand_throughput_override option)
  ?(provisioned_throughput_override : provisioned_throughput_override option)
  ?(kms_master_key_id : string option)
  ~(region_name : string)
  () : update_replication_group_member_action = {
  table_class_override;
  global_secondary_indexes;
  on_demand_throughput_override;
  provisioned_throughput_override;
  kms_master_key_id;
  region_name;
   }

let make_delete_replication_group_member_action  ~(region_name : string) ()
: delete_replication_group_member_action = { region_name; 
}

let make_replication_group_update 
  ?(delete : delete_replication_group_member_action option)
  ?(update : update_replication_group_member_action option)
  ?(create : create_replication_group_member_action option)
  () : replication_group_update = { delete; update; create; 
}

let make_update_table_input 
  ?(on_demand_throughput : on_demand_throughput option)
  ?(deletion_protection_enabled : bool option)
  ?(table_class : table_class option)
  ?(replica_updates : replication_group_update list option)
  ?(sse_specification : sse_specification option)
  ?(stream_specification : stream_specification option)
  ?(global_secondary_index_updates : global_secondary_index_update list option)
  ?(provisioned_throughput : provisioned_throughput option)
  ?(billing_mode : billing_mode option)
  ?(attribute_definitions : attribute_definition list option)
  ~(table_name : string)
  () : update_table_input = {
  on_demand_throughput;
  deletion_protection_enabled;
  table_class;
  replica_updates;
  sse_specification;
  stream_specification;
  global_secondary_index_updates;
  provisioned_throughput;
  billing_mode;
  table_name;
  attribute_definitions;
   }

let make_update_kinesis_streaming_configuration 
  ?(approximate_creation_date_time_precision : approximate_creation_date_time_precision option)
  () : update_kinesis_streaming_configuration = {
  approximate_creation_date_time_precision; 
}

let make_update_kinesis_streaming_destination_output 
  ?(update_kinesis_streaming_configuration : update_kinesis_streaming_configuration option)
  ?(destination_status : destination_status option)
  ?(stream_arn : string option)
  ?(table_name : string option)
  () : update_kinesis_streaming_destination_output = {
  update_kinesis_streaming_configuration;
  destination_status;
  stream_arn;
  table_name;
   }

let make_update_kinesis_streaming_destination_input 
  ?(update_kinesis_streaming_configuration : update_kinesis_streaming_configuration option)
  ~(stream_arn : string)
  ~(table_name : string)
  () : update_kinesis_streaming_destination_input = {
  update_kinesis_streaming_configuration; stream_arn; table_name; 
}

let make_capacity 
  ?(capacity_units : float option)
  ?(write_capacity_units : float option)
  ?(read_capacity_units : float option)
  () : capacity = {
  capacity_units; write_capacity_units; read_capacity_units; 
}

let make_consumed_capacity 
  ?(global_secondary_indexes : (string * capacity) list option)
  ?(local_secondary_indexes : (string * capacity) list option)
  ?(table : capacity option)
  ?(write_capacity_units : float option)
  ?(read_capacity_units : float option)
  ?(capacity_units : float option)
  ?(table_name : string option)
  () : consumed_capacity = {
  global_secondary_indexes;
  local_secondary_indexes;
  table;
  write_capacity_units;
  read_capacity_units;
  capacity_units;
  table_name;
   }

let make_item_collection_metrics 
  ?(size_estimate_range_g_b : float list option)
  ?(item_collection_key : (string * attribute_value) list option)
  () : item_collection_metrics = {
  size_estimate_range_g_b; item_collection_key; 
}

let make_update_item_output 
  ?(item_collection_metrics : item_collection_metrics option)
  ?(consumed_capacity : consumed_capacity option)
  ?(attributes : (string * attribute_value) list option)
  () : update_item_output = {
  item_collection_metrics; consumed_capacity; attributes; 
}

let make_attribute_value_update 
  ?(action : attribute_action option) ?(value : attribute_value option) ()
: attribute_value_update = { action; value; 
}

let make_expected_attribute_value 
  ?(attribute_value_list : attribute_value list option)
  ?(comparison_operator : comparison_operator option)
  ?(exists : bool option)
  ?(value : attribute_value option)
  () : expected_attribute_value = {
  attribute_value_list; comparison_operator; exists; value; 
}

let make_update_item_input 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(expression_attribute_values : (string * attribute_value) list option)
  ?(expression_attribute_names : (string * string) list option)
  ?(condition_expression : string option)
  ?(update_expression : string option)
  ?(return_item_collection_metrics : return_item_collection_metrics option)
  ?(return_consumed_capacity : return_consumed_capacity option)
  ?(return_values : return_value option)
  ?(conditional_operator : conditional_operator option)
  ?(expected : (string * expected_attribute_value) list option)
  ?(attribute_updates : (string * attribute_value_update) list option)
  ~(key : (string * attribute_value) list)
  ~(table_name : string)
  () : update_item_input = {
  return_values_on_condition_check_failure;
  expression_attribute_values;
  expression_attribute_names;
  condition_expression;
  update_expression;
  return_item_collection_metrics;
  return_consumed_capacity;
  return_values;
  conditional_operator;
  expected;
  attribute_updates;
  key;
  table_name;
   }

let make_replica_global_secondary_index_settings_description 
  ?(provisioned_write_capacity_auto_scaling_settings : auto_scaling_settings_description option)
  ?(provisioned_write_capacity_units : int option)
  ?(provisioned_read_capacity_auto_scaling_settings : auto_scaling_settings_description option)
  ?(provisioned_read_capacity_units : int option)
  ?(index_status : index_status option)
  ~(index_name : string)
  () : replica_global_secondary_index_settings_description = {
  provisioned_write_capacity_auto_scaling_settings;
  provisioned_write_capacity_units;
  provisioned_read_capacity_auto_scaling_settings;
  provisioned_read_capacity_units;
  index_status;
  index_name;
   }

let make_replica_settings_description 
  ?(replica_table_class_summary : table_class_summary option)
  ?(replica_global_secondary_index_settings : replica_global_secondary_index_settings_description list option)
  ?(replica_provisioned_write_capacity_auto_scaling_settings : auto_scaling_settings_description option)
  ?(replica_provisioned_write_capacity_units : int option)
  ?(replica_provisioned_read_capacity_auto_scaling_settings : auto_scaling_settings_description option)
  ?(replica_provisioned_read_capacity_units : int option)
  ?(replica_billing_mode_summary : billing_mode_summary option)
  ?(replica_status : replica_status option)
  ~(region_name : string)
  () : replica_settings_description = {
  replica_table_class_summary;
  replica_global_secondary_index_settings;
  replica_provisioned_write_capacity_auto_scaling_settings;
  replica_provisioned_write_capacity_units;
  replica_provisioned_read_capacity_auto_scaling_settings;
  replica_provisioned_read_capacity_units;
  replica_billing_mode_summary;
  replica_status;
  region_name;
   }

let make_update_global_table_settings_output 
  ?(replica_settings : replica_settings_description list option)
  ?(global_table_name : string option)
  () : update_global_table_settings_output = {
  replica_settings; global_table_name; 
}

let make_global_table_global_secondary_index_settings_update 
  ?(provisioned_write_capacity_auto_scaling_settings_update : auto_scaling_settings_update option)
  ?(provisioned_write_capacity_units : int option)
  ~(index_name : string)
  () : global_table_global_secondary_index_settings_update = {
  provisioned_write_capacity_auto_scaling_settings_update;
  provisioned_write_capacity_units;
  index_name;
   }

let make_replica_global_secondary_index_settings_update 
  ?(provisioned_read_capacity_auto_scaling_settings_update : auto_scaling_settings_update option)
  ?(provisioned_read_capacity_units : int option)
  ~(index_name : string)
  () : replica_global_secondary_index_settings_update = {
  provisioned_read_capacity_auto_scaling_settings_update;
  provisioned_read_capacity_units;
  index_name;
   }

let make_replica_settings_update 
  ?(replica_table_class : table_class option)
  ?(replica_global_secondary_index_settings_update : replica_global_secondary_index_settings_update list option)
  ?(replica_provisioned_read_capacity_auto_scaling_settings_update : auto_scaling_settings_update option)
  ?(replica_provisioned_read_capacity_units : int option)
  ~(region_name : string)
  () : replica_settings_update = {
  replica_table_class;
  replica_global_secondary_index_settings_update;
  replica_provisioned_read_capacity_auto_scaling_settings_update;
  replica_provisioned_read_capacity_units;
  region_name;
   }

let make_update_global_table_settings_input 
  ?(replica_settings_update : replica_settings_update list option)
  ?(global_table_global_secondary_index_settings_update : global_table_global_secondary_index_settings_update list option)
  ?(global_table_provisioned_write_capacity_auto_scaling_settings_update : auto_scaling_settings_update option)
  ?(global_table_provisioned_write_capacity_units : int option)
  ?(global_table_billing_mode : billing_mode option)
  ~(global_table_name : string)
  () : update_global_table_settings_input = {
  replica_settings_update;
  global_table_global_secondary_index_settings_update;
  global_table_provisioned_write_capacity_auto_scaling_settings_update;
  global_table_provisioned_write_capacity_units;
  global_table_billing_mode;
  global_table_name;
   }

let make_global_table_description 
  ?(global_table_name : string option)
  ?(global_table_status : global_table_status option)
  ?(creation_date_time : float option)
  ?(global_table_arn : string option)
  ?(replication_group : replica_description list option)
  () : global_table_description = {
  global_table_name;
  global_table_status;
  creation_date_time;
  global_table_arn;
  replication_group;
   }

let make_update_global_table_output 
  ?(global_table_description : global_table_description option) ()
: update_global_table_output = { global_table_description; 
}

let make_create_replica_action  ~(region_name : string) ()
: create_replica_action = { region_name;  }

let make_delete_replica_action  ~(region_name : string) ()
: delete_replica_action = { region_name;  }

let make_replica_update 
  ?(delete : delete_replica_action option)
  ?(create : create_replica_action option)
  () : replica_update = { delete; create; 
}

let make_update_global_table_input 
  ~(replica_updates : replica_update list) ~(global_table_name : string) ()
: update_global_table_input = { replica_updates; global_table_name; 
}

let make_update_contributor_insights_output 
  ?(contributor_insights_status : contributor_insights_status option)
  ?(index_name : string option)
  ?(table_name : string option)
  () : update_contributor_insights_output = {
  contributor_insights_status; index_name; table_name; 
}

let make_update_contributor_insights_input 
  ?(index_name : string option)
  ~(contributor_insights_action : contributor_insights_action)
  ~(table_name : string)
  () : update_contributor_insights_input = {
  contributor_insights_action; index_name; table_name; 
}

let make_point_in_time_recovery_description 
  ?(latest_restorable_date_time : float option)
  ?(earliest_restorable_date_time : float option)
  ?(point_in_time_recovery_status : point_in_time_recovery_status option)
  () : point_in_time_recovery_description = {
  latest_restorable_date_time;
  earliest_restorable_date_time;
  point_in_time_recovery_status;
   }

let make_continuous_backups_description 
  ?(point_in_time_recovery_description : point_in_time_recovery_description option)
  ~(continuous_backups_status : continuous_backups_status)
  () : continuous_backups_description = {
  point_in_time_recovery_description; continuous_backups_status; 
}

let make_update_continuous_backups_output 
  ?(continuous_backups_description : continuous_backups_description option)
  () : update_continuous_backups_output = { continuous_backups_description; 
}

let make_point_in_time_recovery_specification 
  ~(point_in_time_recovery_enabled : bool) ()
: point_in_time_recovery_specification = { point_in_time_recovery_enabled; 
}

let make_update_continuous_backups_input 
  ~(point_in_time_recovery_specification : point_in_time_recovery_specification)
  ~(table_name : string)
  () : update_continuous_backups_input = {
  point_in_time_recovery_specification; table_name;  }

let make_update 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(expression_attribute_values : (string * attribute_value) list option)
  ?(expression_attribute_names : (string * string) list option)
  ?(condition_expression : string option)
  ~(table_name : string)
  ~(update_expression : string)
  ~(key : (string * attribute_value) list)
  () : update = {
  return_values_on_condition_check_failure;
  expression_attribute_values;
  expression_attribute_names;
  condition_expression;
  table_name;
  update_expression;
  key;
   }

let make_untag_resource_input 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_input = { tag_keys; resource_arn; 
}

let make_cancellation_reason 
  ?(message : string option)
  ?(code : string option)
  ?(item : (string * attribute_value) list option)
  () : cancellation_reason = { message; code; item; 
}

let make_transact_write_items_output 
  ?(item_collection_metrics : (string * item_collection_metrics list) list option)
  ?(consumed_capacity : consumed_capacity list option)
  () : transact_write_items_output = {
  item_collection_metrics; consumed_capacity;  }

let make_condition_check 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(expression_attribute_values : (string * attribute_value) list option)
  ?(expression_attribute_names : (string * string) list option)
  ~(condition_expression : string)
  ~(table_name : string)
  ~(key : (string * attribute_value) list)
  () : condition_check = {
  return_values_on_condition_check_failure;
  expression_attribute_values;
  expression_attribute_names;
  condition_expression;
  table_name;
  key;
   }

let make_put 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(expression_attribute_values : (string * attribute_value) list option)
  ?(expression_attribute_names : (string * string) list option)
  ?(condition_expression : string option)
  ~(table_name : string)
  ~(item : (string * attribute_value) list)
  () : put = {
  return_values_on_condition_check_failure;
  expression_attribute_values;
  expression_attribute_names;
  condition_expression;
  table_name;
  item;
   }

let make_delete 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(expression_attribute_values : (string * attribute_value) list option)
  ?(expression_attribute_names : (string * string) list option)
  ?(condition_expression : string option)
  ~(table_name : string)
  ~(key : (string * attribute_value) list)
  () : delete = {
  return_values_on_condition_check_failure;
  expression_attribute_values;
  expression_attribute_names;
  condition_expression;
  table_name;
  key;
   }

let make_transact_write_item 
  ?(update : update option)
  ?(delete : delete option)
  ?(put : put option)
  ?(condition_check : condition_check option)
  () : transact_write_item = { update; delete; put; condition_check; 
}

let make_transact_write_items_input 
  ?(client_request_token : string option)
  ?(return_item_collection_metrics : return_item_collection_metrics option)
  ?(return_consumed_capacity : return_consumed_capacity option)
  ~(transact_items : transact_write_item list)
  () : transact_write_items_input = {
  client_request_token;
  return_item_collection_metrics;
  return_consumed_capacity;
  transact_items;
   }

let make_item_response  ?(item : (string * attribute_value) list option) ()
: item_response = { item;  }

let make_transact_get_items_output 
  ?(responses : item_response list option)
  ?(consumed_capacity : consumed_capacity list option)
  () : transact_get_items_output = { responses; consumed_capacity; 
}

let make_get 
  ?(expression_attribute_names : (string * string) list option)
  ?(projection_expression : string option)
  ~(table_name : string)
  ~(key : (string * attribute_value) list)
  () : get = {
  expression_attribute_names; projection_expression; table_name; key; 
}

let make_transact_get_item  ~(get : get) () : transact_get_item = { get; 
}

let make_transact_get_items_input 
  ?(return_consumed_capacity : return_consumed_capacity option)
  ~(transact_items : transact_get_item list)
  () : transact_get_items_input = {
  return_consumed_capacity; transact_items; 
}

let make_time_to_live_description 
  ?(attribute_name : string option)
  ?(time_to_live_status : time_to_live_status option)
  () : time_to_live_description = { attribute_name; time_to_live_status; 
}

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_input  ~(tags : tag list) ~(resource_arn : string) ()
: tag_resource_input = { tags; resource_arn; 
}

let make_global_secondary_index 
  ?(on_demand_throughput : on_demand_throughput option)
  ?(provisioned_throughput : provisioned_throughput option)
  ~(projection : projection)
  ~(key_schema : key_schema_element list)
  ~(index_name : string)
  () : global_secondary_index = {
  on_demand_throughput;
  provisioned_throughput;
  projection;
  key_schema;
  index_name;
   }

let make_table_creation_parameters 
  ?(global_secondary_indexes : global_secondary_index list option)
  ?(sse_specification : sse_specification option)
  ?(on_demand_throughput : on_demand_throughput option)
  ?(provisioned_throughput : provisioned_throughput option)
  ?(billing_mode : billing_mode option)
  ~(key_schema : key_schema_element list)
  ~(attribute_definitions : attribute_definition list)
  ~(table_name : string)
  () : table_creation_parameters = {
  global_secondary_indexes;
  sse_specification;
  on_demand_throughput;
  provisioned_throughput;
  billing_mode;
  key_schema;
  attribute_definitions;
  table_name;
   }

let make_local_secondary_index_info 
  ?(projection : projection option)
  ?(key_schema : key_schema_element list option)
  ?(index_name : string option)
  () : local_secondary_index_info = { projection; key_schema; index_name; 
}

let make_global_secondary_index_info 
  ?(on_demand_throughput : on_demand_throughput option)
  ?(provisioned_throughput : provisioned_throughput option)
  ?(projection : projection option)
  ?(key_schema : key_schema_element list option)
  ?(index_name : string option)
  () : global_secondary_index_info = {
  on_demand_throughput;
  provisioned_throughput;
  projection;
  key_schema;
  index_name;
   }

let make_source_table_feature_details 
  ?(sse_description : sse_description option)
  ?(time_to_live_description : time_to_live_description option)
  ?(stream_description : stream_specification option)
  ?(global_secondary_indexes : global_secondary_index_info list option)
  ?(local_secondary_indexes : local_secondary_index_info list option)
  () : source_table_feature_details = {
  sse_description;
  time_to_live_description;
  stream_description;
  global_secondary_indexes;
  local_secondary_indexes;
   }

let make_source_table_details 
  ?(billing_mode : billing_mode option)
  ?(item_count : int option)
  ?(on_demand_throughput : on_demand_throughput option)
  ?(table_size_bytes : int option)
  ?(table_arn : string option)
  ~(provisioned_throughput : provisioned_throughput)
  ~(table_creation_date_time : float)
  ~(key_schema : key_schema_element list)
  ~(table_id : string)
  ~(table_name : string)
  () : source_table_details = {
  billing_mode;
  item_count;
  on_demand_throughput;
  provisioned_throughput;
  table_creation_date_time;
  key_schema;
  table_size_bytes;
  table_arn;
  table_id;
  table_name;
   }

let make_scan_output 
  ?(consumed_capacity : consumed_capacity option)
  ?(last_evaluated_key : (string * attribute_value) list option)
  ?(scanned_count : int option)
  ?(count : int option)
  ?(items : (string * attribute_value) list list option)
  () : scan_output = {
  consumed_capacity; last_evaluated_key; scanned_count; count; items; 
}

let make_condition 
  ?(attribute_value_list : attribute_value list option)
  ~(comparison_operator : comparison_operator)
  () : condition = { comparison_operator; attribute_value_list; 
}

let make_scan_input 
  ?(consistent_read : bool option)
  ?(expression_attribute_values : (string * attribute_value) list option)
  ?(expression_attribute_names : (string * string) list option)
  ?(filter_expression : string option)
  ?(projection_expression : string option)
  ?(segment : int option)
  ?(total_segments : int option)
  ?(return_consumed_capacity : return_consumed_capacity option)
  ?(exclusive_start_key : (string * attribute_value) list option)
  ?(conditional_operator : conditional_operator option)
  ?(scan_filter : (string * condition) list option)
  ?(select : select option)
  ?(limit : int option)
  ?(attributes_to_get : string list option)
  ?(index_name : string option)
  ~(table_name : string)
  () : scan_input = {
  consistent_read;
  expression_attribute_values;
  expression_attribute_names;
  filter_expression;
  projection_expression;
  segment;
  total_segments;
  return_consumed_capacity;
  exclusive_start_key;
  conditional_operator;
  scan_filter;
  select;
  limit;
  attributes_to_get;
  index_name;
  table_name;
   }

let make_s3_bucket_source 
  ?(s3_key_prefix : string option)
  ?(s3_bucket_owner : string option)
  ~(s3_bucket : string)
  () : s3_bucket_source = { s3_key_prefix; s3_bucket; s3_bucket_owner; 
}

let make_restore_table_to_point_in_time_output 
  ?(table_description : table_description option) ()
: restore_table_to_point_in_time_output = { table_description; 
}

let make_local_secondary_index 
  ~(projection : projection)
  ~(key_schema : key_schema_element list)
  ~(index_name : string)
  () : local_secondary_index = { projection; key_schema; index_name; 
}

let make_restore_table_to_point_in_time_input 
  ?(sse_specification_override : sse_specification option)
  ?(on_demand_throughput_override : on_demand_throughput option)
  ?(provisioned_throughput_override : provisioned_throughput option)
  ?(local_secondary_index_override : local_secondary_index list option)
  ?(global_secondary_index_override : global_secondary_index list option)
  ?(billing_mode_override : billing_mode option)
  ?(restore_date_time : float option)
  ?(use_latest_restorable_time : bool option)
  ?(source_table_name : string option)
  ?(source_table_arn : string option)
  ~(target_table_name : string)
  () : restore_table_to_point_in_time_input = {
  sse_specification_override;
  on_demand_throughput_override;
  provisioned_throughput_override;
  local_secondary_index_override;
  global_secondary_index_override;
  billing_mode_override;
  restore_date_time;
  use_latest_restorable_time;
  target_table_name;
  source_table_name;
  source_table_arn;
   }

let make_restore_table_from_backup_output 
  ?(table_description : table_description option) ()
: restore_table_from_backup_output = { table_description; 
}

let make_restore_table_from_backup_input 
  ?(sse_specification_override : sse_specification option)
  ?(on_demand_throughput_override : on_demand_throughput option)
  ?(provisioned_throughput_override : provisioned_throughput option)
  ?(local_secondary_index_override : local_secondary_index list option)
  ?(global_secondary_index_override : global_secondary_index list option)
  ?(billing_mode_override : billing_mode option)
  ~(backup_arn : string)
  ~(target_table_name : string)
  () : restore_table_from_backup_input = {
  sse_specification_override;
  on_demand_throughput_override;
  provisioned_throughput_override;
  local_secondary_index_override;
  global_secondary_index_override;
  billing_mode_override;
  backup_arn;
  target_table_name;
   }

let make_replica  ?(region_name : string option) () : replica = {
  region_name;  }

let make_query_output 
  ?(consumed_capacity : consumed_capacity option)
  ?(last_evaluated_key : (string * attribute_value) list option)
  ?(scanned_count : int option)
  ?(count : int option)
  ?(items : (string * attribute_value) list list option)
  () : query_output = {
  consumed_capacity; last_evaluated_key; scanned_count; count; items; 
}

let make_query_input 
  ?(expression_attribute_values : (string * attribute_value) list option)
  ?(expression_attribute_names : (string * string) list option)
  ?(key_condition_expression : string option)
  ?(filter_expression : string option)
  ?(projection_expression : string option)
  ?(return_consumed_capacity : return_consumed_capacity option)
  ?(exclusive_start_key : (string * attribute_value) list option)
  ?(scan_index_forward : bool option)
  ?(conditional_operator : conditional_operator option)
  ?(query_filter : (string * condition) list option)
  ?(key_conditions : (string * condition) list option)
  ?(consistent_read : bool option)
  ?(limit : int option)
  ?(attributes_to_get : string list option)
  ?(select : select option)
  ?(index_name : string option)
  ~(table_name : string)
  () : query_input = {
  expression_attribute_values;
  expression_attribute_names;
  key_condition_expression;
  filter_expression;
  projection_expression;
  return_consumed_capacity;
  exclusive_start_key;
  scan_index_forward;
  conditional_operator;
  query_filter;
  key_conditions;
  consistent_read;
  limit;
  attributes_to_get;
  select;
  index_name;
  table_name;
   }

let make_put_resource_policy_output  ?(revision_id : string option) ()
: put_resource_policy_output = { revision_id; 
}

let make_put_resource_policy_input 
  ?(confirm_remove_self_resource_access : bool option)
  ?(expected_revision_id : string option)
  ~(policy : string)
  ~(resource_arn : string)
  () : put_resource_policy_input = {
  confirm_remove_self_resource_access;
  expected_revision_id;
  policy;
  resource_arn;
   }

let make_put_item_output 
  ?(item_collection_metrics : item_collection_metrics option)
  ?(consumed_capacity : consumed_capacity option)
  ?(attributes : (string * attribute_value) list option)
  () : put_item_output = {
  item_collection_metrics; consumed_capacity; attributes; 
}

let make_put_item_input 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(expression_attribute_values : (string * attribute_value) list option)
  ?(expression_attribute_names : (string * string) list option)
  ?(condition_expression : string option)
  ?(conditional_operator : conditional_operator option)
  ?(return_item_collection_metrics : return_item_collection_metrics option)
  ?(return_consumed_capacity : return_consumed_capacity option)
  ?(return_values : return_value option)
  ?(expected : (string * expected_attribute_value) list option)
  ~(item : (string * attribute_value) list)
  ~(table_name : string)
  () : put_item_input = {
  return_values_on_condition_check_failure;
  expression_attribute_values;
  expression_attribute_names;
  condition_expression;
  conditional_operator;
  return_item_collection_metrics;
  return_consumed_capacity;
  return_values;
  expected;
  item;
  table_name;
   }

let make_batch_statement_error 
  ?(item : (string * attribute_value) list option)
  ?(message : string option)
  ?(code : batch_statement_error_code_enum option)
  () : batch_statement_error = { item; message; code; 
}

let make_batch_statement_response 
  ?(item : (string * attribute_value) list option)
  ?(table_name : string option)
  ?(error : batch_statement_error option)
  () : batch_statement_response = { item; table_name; error; 
}

let make_batch_statement_request 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(consistent_read : bool option)
  ?(parameters : attribute_value list option)
  ~(statement : string)
  () : batch_statement_request = {
  return_values_on_condition_check_failure;
  consistent_read;
  parameters;
  statement;
   }

let make_parameterized_statement 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(parameters : attribute_value list option)
  ~(statement : string)
  () : parameterized_statement = {
  return_values_on_condition_check_failure; parameters; statement; 
}

let make_list_tags_of_resource_output 
  ?(next_token : string option) ?(tags : tag list option) ()
: list_tags_of_resource_output = { next_token; tags; 
}

let make_list_tags_of_resource_input 
  ?(next_token : string option) ~(resource_arn : string) ()
: list_tags_of_resource_input = { next_token; resource_arn; 
}

let make_list_tables_output 
  ?(last_evaluated_table_name : string option)
  ?(table_names : string list option)
  () : list_tables_output = { last_evaluated_table_name; table_names; 
}

let make_list_tables_input 
  ?(limit : int option) ?(exclusive_start_table_name : string option) ()
: list_tables_input = { limit; exclusive_start_table_name; 
}

let make_import_summary 
  ?(end_time : float option)
  ?(start_time : float option)
  ?(input_format : input_format option)
  ?(cloud_watch_log_group_arn : string option)
  ?(s3_bucket_source : s3_bucket_source option)
  ?(table_arn : string option)
  ?(import_status : import_status option)
  ?(import_arn : string option)
  () : import_summary = {
  end_time;
  start_time;
  input_format;
  cloud_watch_log_group_arn;
  s3_bucket_source;
  table_arn;
  import_status;
  import_arn;
   }

let make_list_imports_output 
  ?(next_token : string option)
  ?(import_summary_list : import_summary list option)
  () : list_imports_output = { next_token; import_summary_list; 
}

let make_list_imports_input 
  ?(next_token : string option)
  ?(page_size : int option)
  ?(table_arn : string option)
  () : list_imports_input = { next_token; page_size; table_arn; 
}

let make_global_table 
  ?(replication_group : replica list option)
  ?(global_table_name : string option)
  () : global_table = { replication_group; global_table_name; 
}

let make_list_global_tables_output 
  ?(last_evaluated_global_table_name : string option)
  ?(global_tables : global_table list option)
  () : list_global_tables_output = {
  last_evaluated_global_table_name; global_tables; 
}

let make_list_global_tables_input 
  ?(region_name : string option)
  ?(limit : int option)
  ?(exclusive_start_global_table_name : string option)
  () : list_global_tables_input = {
  region_name; limit; exclusive_start_global_table_name; 
}

let make_export_summary 
  ?(export_type : export_type option)
  ?(export_status : export_status option)
  ?(export_arn : string option)
  () : export_summary = { export_type; export_status; export_arn; 
}

let make_list_exports_output 
  ?(next_token : string option)
  ?(export_summaries : export_summary list option)
  () : list_exports_output = { next_token; export_summaries; 
}

let make_list_exports_input 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(table_arn : string option)
  () : list_exports_input = { next_token; max_results; table_arn; 
}

let make_contributor_insights_summary 
  ?(contributor_insights_status : contributor_insights_status option)
  ?(index_name : string option)
  ?(table_name : string option)
  () : contributor_insights_summary = {
  contributor_insights_status; index_name; table_name; 
}

let make_list_contributor_insights_output 
  ?(next_token : string option)
  ?(contributor_insights_summaries : contributor_insights_summary list option)
  () : list_contributor_insights_output = {
  next_token; contributor_insights_summaries; 
}

let make_list_contributor_insights_input 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(table_name : string option)
  () : list_contributor_insights_input = {
  max_results; next_token; table_name;  }

let make_backup_summary 
  ?(backup_size_bytes : int option)
  ?(backup_type : backup_type option)
  ?(backup_status : backup_status option)
  ?(backup_expiry_date_time : float option)
  ?(backup_creation_date_time : float option)
  ?(backup_name : string option)
  ?(backup_arn : string option)
  ?(table_arn : string option)
  ?(table_id : string option)
  ?(table_name : string option)
  () : backup_summary = {
  backup_size_bytes;
  backup_type;
  backup_status;
  backup_expiry_date_time;
  backup_creation_date_time;
  backup_name;
  backup_arn;
  table_arn;
  table_id;
  table_name;
   }

let make_list_backups_output 
  ?(last_evaluated_backup_arn : string option)
  ?(backup_summaries : backup_summary list option)
  () : list_backups_output = { last_evaluated_backup_arn; backup_summaries; 
}

let make_list_backups_input 
  ?(backup_type : backup_type_filter option)
  ?(exclusive_start_backup_arn : string option)
  ?(time_range_upper_bound : float option)
  ?(time_range_lower_bound : float option)
  ?(limit : int option)
  ?(table_name : string option)
  () : list_backups_input = {
  backup_type;
  exclusive_start_backup_arn;
  time_range_upper_bound;
  time_range_lower_bound;
  limit;
  table_name;
   }

let make_enable_kinesis_streaming_configuration 
  ?(approximate_creation_date_time_precision : approximate_creation_date_time_precision option)
  () : enable_kinesis_streaming_configuration = {
  approximate_creation_date_time_precision; 
}

let make_kinesis_streaming_destination_output 
  ?(enable_kinesis_streaming_configuration : enable_kinesis_streaming_configuration option)
  ?(destination_status : destination_status option)
  ?(stream_arn : string option)
  ?(table_name : string option)
  () : kinesis_streaming_destination_output = {
  enable_kinesis_streaming_configuration;
  destination_status;
  stream_arn;
  table_name;
   }

let make_kinesis_streaming_destination_input 
  ?(enable_kinesis_streaming_configuration : enable_kinesis_streaming_configuration option)
  ~(stream_arn : string)
  ~(table_name : string)
  () : kinesis_streaming_destination_input = {
  enable_kinesis_streaming_configuration; stream_arn; table_name; 
}

let make_kinesis_data_stream_destination 
  ?(approximate_creation_date_time_precision : approximate_creation_date_time_precision option)
  ?(destination_status_description : string option)
  ?(destination_status : destination_status option)
  ?(stream_arn : string option)
  () : kinesis_data_stream_destination = {
  approximate_creation_date_time_precision;
  destination_status_description;
  destination_status;
  stream_arn;
   }

let make_keys_and_attributes 
  ?(expression_attribute_names : (string * string) list option)
  ?(projection_expression : string option)
  ?(consistent_read : bool option)
  ?(attributes_to_get : string list option)
  ~(keys : (string * attribute_value) list list)
  () : keys_and_attributes = {
  expression_attribute_names;
  projection_expression;
  consistent_read;
  attributes_to_get;
  keys;
   }

let make_csv_options 
  ?(header_list : string list option) ?(delimiter : string option) ()
: csv_options = { header_list; delimiter;  }

let make_input_format_options  ?(csv : csv_options option) ()
: input_format_options = { csv;  }

let make_incremental_export_specification 
  ?(export_view_type : export_view_type option)
  ?(export_to_time : float option)
  ?(export_from_time : float option)
  () : incremental_export_specification = {
  export_view_type; export_to_time; export_from_time; 
}

let make_import_table_description 
  ?(failure_message : string option)
  ?(failure_code : string option)
  ?(imported_item_count : int option)
  ?(processed_item_count : int option)
  ?(processed_size_bytes : int option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(table_creation_parameters : table_creation_parameters option)
  ?(input_compression_type : input_compression_type option)
  ?(input_format_options : input_format_options option)
  ?(input_format : input_format option)
  ?(cloud_watch_log_group_arn : string option)
  ?(error_count : int option)
  ?(s3_bucket_source : s3_bucket_source option)
  ?(client_token : string option)
  ?(table_id : string option)
  ?(table_arn : string option)
  ?(import_status : import_status option)
  ?(import_arn : string option)
  () : import_table_description = {
  failure_message;
  failure_code;
  imported_item_count;
  processed_item_count;
  processed_size_bytes;
  end_time;
  start_time;
  table_creation_parameters;
  input_compression_type;
  input_format_options;
  input_format;
  cloud_watch_log_group_arn;
  error_count;
  s3_bucket_source;
  client_token;
  table_id;
  table_arn;
  import_status;
  import_arn;
   }

let make_import_table_output 
  ~(import_table_description : import_table_description) ()
: import_table_output = { import_table_description; 
}

let make_import_table_input 
  ?(input_compression_type : input_compression_type option)
  ?(input_format_options : input_format_options option)
  ?(client_token : string option)
  ~(table_creation_parameters : table_creation_parameters)
  ~(input_format : input_format)
  ~(s3_bucket_source : s3_bucket_source)
  () : import_table_input = {
  table_creation_parameters;
  input_compression_type;
  input_format_options;
  input_format;
  s3_bucket_source;
  client_token;
   }

let make_get_resource_policy_output 
  ?(revision_id : string option) ?(policy : string option) ()
: get_resource_policy_output = { revision_id; policy; 
}

let make_get_resource_policy_input  ~(resource_arn : string) ()
: get_resource_policy_input = { resource_arn;  }

let make_get_item_output 
  ?(consumed_capacity : consumed_capacity option)
  ?(item : (string * attribute_value) list option)
  () : get_item_output = { consumed_capacity; item; 
}

let make_get_item_input 
  ?(expression_attribute_names : (string * string) list option)
  ?(projection_expression : string option)
  ?(return_consumed_capacity : return_consumed_capacity option)
  ?(consistent_read : bool option)
  ?(attributes_to_get : string list option)
  ~(key : (string * attribute_value) list)
  ~(table_name : string)
  () : get_item_input = {
  expression_attribute_names;
  projection_expression;
  return_consumed_capacity;
  consistent_read;
  attributes_to_get;
  key;
  table_name;
   }

let make_failure_exception 
  ?(exception_description : string option)
  ?(exception_name : string option)
  () : failure_exception = { exception_description; exception_name; 
}

let make_export_description 
  ?(incremental_export_specification : incremental_export_specification option)
  ?(export_type : export_type option)
  ?(item_count : int option)
  ?(billed_size_bytes : int option)
  ?(export_format : export_format option)
  ?(failure_message : string option)
  ?(failure_code : string option)
  ?(s3_sse_kms_key_id : string option)
  ?(s3_sse_algorithm : s3_sse_algorithm option)
  ?(s3_prefix : string option)
  ?(s3_bucket_owner : string option)
  ?(s3_bucket : string option)
  ?(client_token : string option)
  ?(export_time : float option)
  ?(table_id : string option)
  ?(table_arn : string option)
  ?(export_manifest : string option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(export_status : export_status option)
  ?(export_arn : string option)
  () : export_description = {
  incremental_export_specification;
  export_type;
  item_count;
  billed_size_bytes;
  export_format;
  failure_message;
  failure_code;
  s3_sse_kms_key_id;
  s3_sse_algorithm;
  s3_prefix;
  s3_bucket_owner;
  s3_bucket;
  client_token;
  export_time;
  table_id;
  table_arn;
  export_manifest;
  end_time;
  start_time;
  export_status;
  export_arn;
   }

let make_export_table_to_point_in_time_output 
  ?(export_description : export_description option) ()
: export_table_to_point_in_time_output = { export_description; 
}

let make_export_table_to_point_in_time_input 
  ?(incremental_export_specification : incremental_export_specification option)
  ?(export_type : export_type option)
  ?(export_format : export_format option)
  ?(s3_sse_kms_key_id : string option)
  ?(s3_sse_algorithm : s3_sse_algorithm option)
  ?(s3_prefix : string option)
  ?(s3_bucket_owner : string option)
  ?(client_token : string option)
  ?(export_time : float option)
  ~(s3_bucket : string)
  ~(table_arn : string)
  () : export_table_to_point_in_time_input = {
  incremental_export_specification;
  export_type;
  export_format;
  s3_sse_kms_key_id;
  s3_sse_algorithm;
  s3_prefix;
  s3_bucket_owner;
  s3_bucket;
  client_token;
  export_time;
  table_arn;
   }

let make_execute_transaction_output 
  ?(consumed_capacity : consumed_capacity list option)
  ?(responses : item_response list option)
  () : execute_transaction_output = { consumed_capacity; responses; 
}

let make_execute_transaction_input 
  ?(return_consumed_capacity : return_consumed_capacity option)
  ?(client_request_token : string option)
  ~(transact_statements : parameterized_statement list)
  () : execute_transaction_input = {
  return_consumed_capacity; client_request_token; transact_statements; 
}

let make_execute_statement_output 
  ?(last_evaluated_key : (string * attribute_value) list option)
  ?(consumed_capacity : consumed_capacity option)
  ?(next_token : string option)
  ?(items : (string * attribute_value) list list option)
  () : execute_statement_output = {
  last_evaluated_key; consumed_capacity; next_token; items; 
}

let make_execute_statement_input 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(limit : int option)
  ?(return_consumed_capacity : return_consumed_capacity option)
  ?(next_token : string option)
  ?(consistent_read : bool option)
  ?(parameters : attribute_value list option)
  ~(statement : string)
  () : execute_statement_input = {
  return_values_on_condition_check_failure;
  limit;
  return_consumed_capacity;
  next_token;
  consistent_read;
  parameters;
  statement;
   }

let make_endpoint  ~(cache_period_in_minutes : int) ~(address : string) ()
: endpoint = { cache_period_in_minutes; address; 
}

let make_describe_time_to_live_output 
  ?(time_to_live_description : time_to_live_description option) ()
: describe_time_to_live_output = { time_to_live_description; 
}

let make_describe_time_to_live_input  ~(table_name : string) ()
: describe_time_to_live_input = { table_name; 
}

let make_describe_table_replica_auto_scaling_output 
  ?(table_auto_scaling_description : table_auto_scaling_description option)
  () : describe_table_replica_auto_scaling_output = {
  table_auto_scaling_description; 
}

let make_describe_table_replica_auto_scaling_input  ~(table_name : string) ()
: describe_table_replica_auto_scaling_input = { table_name; 
}

let make_describe_table_output  ?(table : table_description option) ()
: describe_table_output = { table;  }

let make_describe_table_input  ~(table_name : string) ()
: describe_table_input = { table_name;  }

let make_describe_limits_output 
  ?(table_max_write_capacity_units : int option)
  ?(table_max_read_capacity_units : int option)
  ?(account_max_write_capacity_units : int option)
  ?(account_max_read_capacity_units : int option)
  () : describe_limits_output = {
  table_max_write_capacity_units;
  table_max_read_capacity_units;
  account_max_write_capacity_units;
  account_max_read_capacity_units;
   }

let make_describe_limits_input  () : describe_limits_input =
()

let make_describe_kinesis_streaming_destination_output 
  ?(kinesis_data_stream_destinations : kinesis_data_stream_destination list option)
  ?(table_name : string option)
  () : describe_kinesis_streaming_destination_output = {
  kinesis_data_stream_destinations; table_name; 
}

let make_describe_kinesis_streaming_destination_input 
  ~(table_name : string) () : describe_kinesis_streaming_destination_input =
{ table_name;  }

let make_describe_import_output 
  ~(import_table_description : import_table_description) ()
: describe_import_output = { import_table_description; 
}

let make_describe_import_input  ~(import_arn : string) ()
: describe_import_input = { import_arn; 
}

let make_describe_global_table_settings_output 
  ?(replica_settings : replica_settings_description list option)
  ?(global_table_name : string option)
  () : describe_global_table_settings_output = {
  replica_settings; global_table_name; 
}

let make_describe_global_table_settings_input 
  ~(global_table_name : string) () : describe_global_table_settings_input = {
  global_table_name;  }

let make_describe_global_table_output 
  ?(global_table_description : global_table_description option) ()
: describe_global_table_output = { global_table_description; 
}

let make_describe_global_table_input  ~(global_table_name : string) ()
: describe_global_table_input = { global_table_name; 
}

let make_describe_export_output 
  ?(export_description : export_description option) ()
: describe_export_output = { export_description; 
}

let make_describe_export_input  ~(export_arn : string) ()
: describe_export_input = { export_arn; 
}

let make_describe_endpoints_response  ~(endpoints : endpoint list) ()
: describe_endpoints_response = { endpoints; 
}

let make_describe_endpoints_request  () : describe_endpoints_request =
()

let make_describe_contributor_insights_output 
  ?(failure_exception : failure_exception option)
  ?(last_update_date_time : float option)
  ?(contributor_insights_status : contributor_insights_status option)
  ?(contributor_insights_rule_list : string list option)
  ?(index_name : string option)
  ?(table_name : string option)
  () : describe_contributor_insights_output = {
  failure_exception;
  last_update_date_time;
  contributor_insights_status;
  contributor_insights_rule_list;
  index_name;
  table_name;
   }

let make_describe_contributor_insights_input 
  ?(index_name : string option) ~(table_name : string) ()
: describe_contributor_insights_input = { index_name; table_name; 
}

let make_describe_continuous_backups_output 
  ?(continuous_backups_description : continuous_backups_description option)
  () : describe_continuous_backups_output = {
  continuous_backups_description; 
}

let make_describe_continuous_backups_input  ~(table_name : string) ()
: describe_continuous_backups_input = { table_name; 
}

let make_backup_details 
  ?(backup_expiry_date_time : float option)
  ?(backup_size_bytes : int option)
  ~(backup_creation_date_time : float)
  ~(backup_type : backup_type)
  ~(backup_status : backup_status)
  ~(backup_name : string)
  ~(backup_arn : string)
  () : backup_details = {
  backup_expiry_date_time;
  backup_creation_date_time;
  backup_type;
  backup_status;
  backup_size_bytes;
  backup_name;
  backup_arn;
   }

let make_backup_description 
  ?(source_table_feature_details : source_table_feature_details option)
  ?(source_table_details : source_table_details option)
  ?(backup_details : backup_details option)
  () : backup_description = {
  source_table_feature_details; source_table_details; backup_details; 
}

let make_describe_backup_output 
  ?(backup_description : backup_description option) ()
: describe_backup_output = { backup_description; 
}

let make_describe_backup_input  ~(backup_arn : string) ()
: describe_backup_input = { backup_arn;  }

let make_delete_table_output 
  ?(table_description : table_description option) () : delete_table_output =
{ table_description;  }

let make_delete_table_input  ~(table_name : string) () : delete_table_input =
{ table_name;  }

let make_delete_resource_policy_output  ?(revision_id : string option) ()
: delete_resource_policy_output = { revision_id; 
}

let make_delete_resource_policy_input 
  ?(expected_revision_id : string option) ~(resource_arn : string) ()
: delete_resource_policy_input = { expected_revision_id; resource_arn; 
}

let make_delete_item_output 
  ?(item_collection_metrics : item_collection_metrics option)
  ?(consumed_capacity : consumed_capacity option)
  ?(attributes : (string * attribute_value) list option)
  () : delete_item_output = {
  item_collection_metrics; consumed_capacity; attributes; 
}

let make_delete_item_input 
  ?(return_values_on_condition_check_failure : return_values_on_condition_check_failure option)
  ?(expression_attribute_values : (string * attribute_value) list option)
  ?(expression_attribute_names : (string * string) list option)
  ?(condition_expression : string option)
  ?(return_item_collection_metrics : return_item_collection_metrics option)
  ?(return_consumed_capacity : return_consumed_capacity option)
  ?(return_values : return_value option)
  ?(conditional_operator : conditional_operator option)
  ?(expected : (string * expected_attribute_value) list option)
  ~(key : (string * attribute_value) list)
  ~(table_name : string)
  () : delete_item_input = {
  return_values_on_condition_check_failure;
  expression_attribute_values;
  expression_attribute_names;
  condition_expression;
  return_item_collection_metrics;
  return_consumed_capacity;
  return_values;
  conditional_operator;
  expected;
  key;
  table_name;
   }

let make_delete_backup_output 
  ?(backup_description : backup_description option) () : delete_backup_output
= { backup_description;  }

let make_delete_backup_input  ~(backup_arn : string) () : delete_backup_input
= { backup_arn;  }

let make_create_table_output 
  ?(table_description : table_description option) () : create_table_output =
{ table_description;  }

let make_create_table_input 
  ?(on_demand_throughput : on_demand_throughput option)
  ?(resource_policy : string option)
  ?(deletion_protection_enabled : bool option)
  ?(table_class : table_class option)
  ?(tags : tag list option)
  ?(sse_specification : sse_specification option)
  ?(stream_specification : stream_specification option)
  ?(provisioned_throughput : provisioned_throughput option)
  ?(billing_mode : billing_mode option)
  ?(global_secondary_indexes : global_secondary_index list option)
  ?(local_secondary_indexes : local_secondary_index list option)
  ~(key_schema : key_schema_element list)
  ~(table_name : string)
  ~(attribute_definitions : attribute_definition list)
  () : create_table_input = {
  on_demand_throughput;
  resource_policy;
  deletion_protection_enabled;
  table_class;
  tags;
  sse_specification;
  stream_specification;
  provisioned_throughput;
  billing_mode;
  global_secondary_indexes;
  local_secondary_indexes;
  key_schema;
  table_name;
  attribute_definitions;
   }

let make_create_global_table_output 
  ?(global_table_description : global_table_description option) ()
: create_global_table_output = { global_table_description; 
}

let make_create_global_table_input 
  ~(replication_group : replica list) ~(global_table_name : string) ()
: create_global_table_input = { replication_group; global_table_name; 
}

let make_create_backup_output  ?(backup_details : backup_details option) ()
: create_backup_output = { backup_details;  }

let make_create_backup_input 
  ~(backup_name : string) ~(table_name : string) () : create_backup_input = {
  backup_name; table_name;  }

let make_batch_write_item_output 
  ?(consumed_capacity : consumed_capacity list option)
  ?(item_collection_metrics : (string * item_collection_metrics list) list option)
  ?(unprocessed_items : (string * write_request list) list option)
  () : batch_write_item_output = {
  consumed_capacity; item_collection_metrics; unprocessed_items; 
}

let make_batch_write_item_input 
  ?(return_item_collection_metrics : return_item_collection_metrics option)
  ?(return_consumed_capacity : return_consumed_capacity option)
  ~(request_items : (string * write_request list) list)
  () : batch_write_item_input = {
  return_item_collection_metrics; return_consumed_capacity; request_items; 
}

let make_batch_get_item_output 
  ?(consumed_capacity : consumed_capacity list option)
  ?(unprocessed_keys : (string * keys_and_attributes) list option)
  ?(responses : (string * (string * attribute_value) list list) list option)
  () : batch_get_item_output = {
  consumed_capacity; unprocessed_keys; responses; 
}

let make_batch_get_item_input 
  ?(return_consumed_capacity : return_consumed_capacity option)
  ~(request_items : (string * keys_and_attributes) list)
  () : batch_get_item_input = { return_consumed_capacity; request_items; 
}

let make_batch_execute_statement_output 
  ?(consumed_capacity : consumed_capacity list option)
  ?(responses : batch_statement_response list option)
  () : batch_execute_statement_output = { consumed_capacity; responses; 
}

let make_batch_execute_statement_input 
  ?(return_consumed_capacity : return_consumed_capacity option)
  ~(statements : batch_statement_request list)
  () : batch_execute_statement_input = {
  return_consumed_capacity; statements; 
}

