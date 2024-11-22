open Types
val make_update_table_response : resource_arn:string -> unit
-> update_table_response

val make_column_definition : type_:string -> name:string -> unit
-> column_definition

val make_capacity_specification :
  ?write_capacity_units:int ->
  ?read_capacity_units:int ->
  throughput_mode:throughput_mode ->
  unit -> capacity_specification

val make_encryption_specification :
  ?kms_key_identifier:string -> type_:encryption_type -> unit
-> encryption_specification

val make_point_in_time_recovery :
  status:point_in_time_recovery_status -> unit
-> point_in_time_recovery

val make_time_to_live : status:time_to_live_status -> unit
-> time_to_live

val make_client_side_timestamps :
  status:client_side_timestamps_status -> unit
-> client_side_timestamps

val make_target_tracking_scaling_policy_configuration :
  ?scale_out_cooldown:int ->
  ?scale_in_cooldown:int ->
  ?disable_scale_in:bool ->
  target_value:float ->
  unit
-> target_tracking_scaling_policy_configuration

val make_auto_scaling_policy :
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  unit -> auto_scaling_policy

val make_auto_scaling_settings :
  ?scaling_policy:auto_scaling_policy ->
  ?maximum_units:int ->
  ?minimum_units:int ->
  ?auto_scaling_disabled:bool ->
  unit -> auto_scaling_settings

val make_auto_scaling_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  ?write_capacity_auto_scaling:auto_scaling_settings ->
  unit -> auto_scaling_specification

val make_replica_specification :
  ?read_capacity_auto_scaling:auto_scaling_settings ->
  ?read_capacity_units:int ->
  region:string ->
  unit -> replica_specification

val make_update_table_request :
  ?replica_specifications:replica_specification list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?client_side_timestamps:client_side_timestamps ->
  ?default_time_to_live:int ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification ->
  ?add_columns:column_definition list ->
  table_name:string ->
  keyspace_name:string ->
  unit -> update_table_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_tag : value:string -> key:string -> unit
-> tag

val make_untag_resource_request :
  tags:tag list -> resource_arn:string -> unit
-> untag_resource_request

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_request : tags:tag list -> resource_arn:string -> unit
-> tag_resource_request

val make_table_summary :
  resource_arn:string -> table_name:string -> keyspace_name:string -> unit
-> table_summary

val make_static_column : name:string -> unit
-> static_column

val make_partition_key : name:string -> unit
-> partition_key

val make_clustering_key : order_by:sort_order -> name:string -> unit
-> clustering_key

val make_schema_definition :
  ?static_columns:static_column list ->
  ?clustering_keys:clustering_key list ->
  partition_keys:partition_key list ->
  all_columns:column_definition list ->
  unit -> schema_definition

val make_restore_table_response : restored_table_ar_n:string -> unit
-> restore_table_response

val make_restore_table_request :
  ?replica_specifications:replica_specification list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?tags_override:tag list ->
  ?point_in_time_recovery_override:point_in_time_recovery ->
  ?encryption_specification_override:encryption_specification ->
  ?capacity_specification_override:capacity_specification ->
  ?restore_timestamp:float ->
  target_table_name:string ->
  target_keyspace_name:string ->
  source_table_name:string ->
  source_keyspace_name:string ->
  unit -> restore_table_request

val make_replication_specification :
  ?region_list:string list -> replication_strategy:rs -> unit
-> replication_specification

val make_capacity_specification_summary :
  ?last_update_to_pay_per_request_timestamp:float ->
  ?write_capacity_units:int ->
  ?read_capacity_units:int ->
  throughput_mode:throughput_mode ->
  unit
-> capacity_specification_summary

val make_replica_specification_summary :
  ?capacity_specification:capacity_specification_summary ->
  ?status:table_status ->
  ?region:string ->
  unit
-> replica_specification_summary

val make_replica_auto_scaling_specification :
  ?auto_scaling_specification:auto_scaling_specification ->
  ?region:string ->
  unit
-> replica_auto_scaling_specification

val make_point_in_time_recovery_summary :
  ?earliest_restorable_timestamp:float ->
  status:point_in_time_recovery_status ->
  unit
-> point_in_time_recovery_summary

val make_list_tags_for_resource_response :
  ?tags:tag list -> ?next_token:string -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?max_results:int -> ?next_token:string -> resource_arn:string -> unit
-> list_tags_for_resource_request

val make_list_tables_response :
  ?tables:table_summary list -> ?next_token:string -> unit
-> list_tables_response

val make_list_tables_request :
  ?max_results:int -> ?next_token:string -> keyspace_name:string -> unit
-> list_tables_request

val make_keyspace_summary :
  ?replication_regions:string list ->
  replication_strategy:rs ->
  resource_arn:string ->
  keyspace_name:string ->
  unit -> keyspace_summary

val make_list_keyspaces_response :
  ?next_token:string -> keyspaces:keyspace_summary list -> unit
-> list_keyspaces_response

val make_list_keyspaces_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_keyspaces_request

val make_get_table_auto_scaling_settings_response :
  ?replica_specifications:replica_auto_scaling_specification list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  resource_arn:string ->
  table_name:string ->
  keyspace_name:string ->
  unit
-> get_table_auto_scaling_settings_response

val make_get_table_auto_scaling_settings_request :
  table_name:string -> keyspace_name:string -> unit
-> get_table_auto_scaling_settings_request

val make_comment : message:string -> unit
-> comment

val make_get_table_response :
  ?replica_specifications:replica_specification_summary list ->
  ?client_side_timestamps:client_side_timestamps ->
  ?comment:comment ->
  ?default_time_to_live:int ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery_summary ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification_summary ->
  ?schema_definition:schema_definition ->
  ?status:table_status ->
  ?creation_timestamp:float ->
  resource_arn:string ->
  table_name:string ->
  keyspace_name:string ->
  unit -> get_table_response

val make_get_table_request :
  table_name:string -> keyspace_name:string -> unit
-> get_table_request

val make_get_keyspace_response :
  ?replication_regions:string list ->
  replication_strategy:rs ->
  resource_arn:string ->
  keyspace_name:string ->
  unit -> get_keyspace_response

val make_get_keyspace_request : keyspace_name:string -> unit
-> get_keyspace_request

val make_delete_table_response : unit
-> delete_table_response

val make_delete_table_request :
  table_name:string -> keyspace_name:string -> unit
-> delete_table_request

val make_delete_keyspace_response : unit
-> delete_keyspace_response

val make_delete_keyspace_request : keyspace_name:string -> unit
-> delete_keyspace_request

val make_create_table_response : resource_arn:string -> unit
-> create_table_response

val make_create_table_request :
  ?replica_specifications:replica_specification list ->
  ?auto_scaling_specification:auto_scaling_specification ->
  ?client_side_timestamps:client_side_timestamps ->
  ?tags:tag list ->
  ?default_time_to_live:int ->
  ?ttl:time_to_live ->
  ?point_in_time_recovery:point_in_time_recovery ->
  ?encryption_specification:encryption_specification ->
  ?capacity_specification:capacity_specification ->
  ?comment:comment ->
  schema_definition:schema_definition ->
  table_name:string ->
  keyspace_name:string ->
  unit -> create_table_request

val make_create_keyspace_response : resource_arn:string -> unit
-> create_keyspace_response

val make_create_keyspace_request :
  ?replication_specification:replication_specification ->
  ?tags:tag list ->
  keyspace_name:string ->
  unit
-> create_keyspace_request

