open Types
val make_put_request : item:(string * attribute_value) list -> unit
-> put_request

val make_delete_request : key:(string * attribute_value) list -> unit
-> delete_request

val make_write_request :
  ?delete_request:delete_request -> ?put_request:put_request -> unit
-> write_request

val make_time_to_live_specification :
  attribute_name:string -> enabled:bool -> unit
-> time_to_live_specification

val make_update_time_to_live_output :
  ?time_to_live_specification:time_to_live_specification -> unit
-> update_time_to_live_output

val make_update_time_to_live_input :
  time_to_live_specification:time_to_live_specification ->
  table_name:string ->
  unit
-> update_time_to_live_input

val make_auto_scaling_target_tracking_scaling_policy_configuration_description :
  ?scale_out_cooldown:int ->
  ?scale_in_cooldown:int ->
  ?disable_scale_in:bool ->
  target_value:float ->
  unit
-> auto_scaling_target_tracking_scaling_policy_configuration_description

val make_auto_scaling_policy_description :
  ?target_tracking_scaling_policy_configuration:auto_scaling_target_tracking_scaling_policy_configuration_description ->
  ?policy_name:string ->
  unit
-> auto_scaling_policy_description

val make_auto_scaling_settings_description :
  ?scaling_policies:auto_scaling_policy_description list ->
  ?auto_scaling_role_arn:string ->
  ?auto_scaling_disabled:bool ->
  ?maximum_units:int ->
  ?minimum_units:int ->
  unit
-> auto_scaling_settings_description

val make_replica_global_secondary_index_auto_scaling_description :
  ?provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?index_status:index_status ->
  ?index_name:string ->
  unit
-> replica_global_secondary_index_auto_scaling_description

val make_replica_auto_scaling_description :
  ?replica_status:replica_status ->
  ?replica_provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?global_secondary_indexes:replica_global_secondary_index_auto_scaling_description list ->
  ?region_name:string ->
  unit
-> replica_auto_scaling_description

val make_table_auto_scaling_description :
  ?replicas:replica_auto_scaling_description list ->
  ?table_status:table_status ->
  ?table_name:string ->
  unit
-> table_auto_scaling_description

val make_update_table_replica_auto_scaling_output :
  ?table_auto_scaling_description:table_auto_scaling_description -> unit
-> update_table_replica_auto_scaling_output

val make_auto_scaling_target_tracking_scaling_policy_configuration_update :
  ?scale_out_cooldown:int ->
  ?scale_in_cooldown:int ->
  ?disable_scale_in:bool ->
  target_value:float ->
  unit
-> auto_scaling_target_tracking_scaling_policy_configuration_update

val make_auto_scaling_policy_update :
  ?policy_name:string ->
  target_tracking_scaling_policy_configuration:auto_scaling_target_tracking_scaling_policy_configuration_update ->
  unit -> auto_scaling_policy_update

val make_auto_scaling_settings_update :
  ?scaling_policy_update:auto_scaling_policy_update ->
  ?auto_scaling_role_arn:string ->
  ?auto_scaling_disabled:bool ->
  ?maximum_units:int ->
  ?minimum_units:int ->
  unit
-> auto_scaling_settings_update

val make_global_secondary_index_auto_scaling_update :
  ?provisioned_write_capacity_auto_scaling_update:auto_scaling_settings_update ->
  ?index_name:string ->
  unit
-> global_secondary_index_auto_scaling_update

val make_replica_global_secondary_index_auto_scaling_update :
  ?provisioned_read_capacity_auto_scaling_update:auto_scaling_settings_update ->
  ?index_name:string ->
  unit
-> replica_global_secondary_index_auto_scaling_update

val make_replica_auto_scaling_update :
  ?replica_provisioned_read_capacity_auto_scaling_update:auto_scaling_settings_update ->
  ?replica_global_secondary_index_updates:replica_global_secondary_index_auto_scaling_update list ->
  region_name:string ->
  unit
-> replica_auto_scaling_update

val make_update_table_replica_auto_scaling_input :
  ?replica_updates:replica_auto_scaling_update list ->
  ?provisioned_write_capacity_auto_scaling_update:auto_scaling_settings_update ->
  ?global_secondary_index_updates:global_secondary_index_auto_scaling_update list ->
  table_name:string ->
  unit
-> update_table_replica_auto_scaling_input

val make_attribute_definition :
  attribute_type:scalar_attribute_type -> attribute_name:string -> unit
-> attribute_definition

val make_key_schema_element :
  key_type:key_type -> attribute_name:string -> unit
-> key_schema_element

val make_provisioned_throughput_description :
  ?write_capacity_units:int ->
  ?read_capacity_units:int ->
  ?number_of_decreases_today:int ->
  ?last_decrease_date_time:float ->
  ?last_increase_date_time:float ->
  unit -> provisioned_throughput_description

val make_billing_mode_summary :
  ?last_update_to_pay_per_request_date_time:float ->
  ?billing_mode:billing_mode ->
  unit -> billing_mode_summary

val make_projection :
  ?non_key_attributes:string list -> ?projection_type:projection_type -> unit
-> projection

val make_local_secondary_index_description :
  ?index_arn:string ->
  ?item_count:int ->
  ?index_size_bytes:int ->
  ?projection:projection ->
  ?key_schema:key_schema_element list ->
  ?index_name:string ->
  unit -> local_secondary_index_description

val make_on_demand_throughput :
  ?max_write_request_units:int -> ?max_read_request_units:int -> unit
-> on_demand_throughput

val make_global_secondary_index_description :
  ?on_demand_throughput:on_demand_throughput ->
  ?index_arn:string ->
  ?item_count:int ->
  ?index_size_bytes:int ->
  ?provisioned_throughput:provisioned_throughput_description ->
  ?backfilling:bool ->
  ?index_status:index_status ->
  ?projection:projection ->
  ?key_schema:key_schema_element list ->
  ?index_name:string ->
  unit -> global_secondary_index_description

val make_stream_specification :
  ?stream_view_type:stream_view_type -> stream_enabled:bool -> unit
-> stream_specification

val make_provisioned_throughput_override : ?read_capacity_units:int -> unit
-> provisioned_throughput_override

val make_on_demand_throughput_override : ?max_read_request_units:int -> unit
-> on_demand_throughput_override

val make_replica_global_secondary_index_description :
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?index_name:string ->
  unit
-> replica_global_secondary_index_description

val make_table_class_summary :
  ?last_update_date_time:float -> ?table_class:table_class -> unit
-> table_class_summary

val make_replica_description :
  ?replica_table_class_summary:table_class_summary ->
  ?replica_inaccessible_date_time:float ->
  ?global_secondary_indexes:replica_global_secondary_index_description list ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?kms_master_key_id:string ->
  ?replica_status_percent_progress:string ->
  ?replica_status_description:string ->
  ?replica_status:replica_status ->
  ?region_name:string ->
  unit -> replica_description

val make_restore_summary :
  ?source_table_arn:string ->
  ?source_backup_arn:string ->
  restore_in_progress:bool ->
  restore_date_time:float ->
  unit -> restore_summary

val make_sse_description :
  ?inaccessible_encryption_date_time:float ->
  ?kms_master_key_arn:string ->
  ?sse_type:sse_type ->
  ?status:sse_status ->
  unit -> sse_description

val make_archival_summary :
  ?archival_backup_arn:string ->
  ?archival_reason:string ->
  ?archival_date_time:float ->
  unit -> archival_summary

val make_table_description :
  ?on_demand_throughput:on_demand_throughput ->
  ?deletion_protection_enabled:bool ->
  ?table_class_summary:table_class_summary ->
  ?archival_summary:archival_summary ->
  ?sse_description:sse_description ->
  ?restore_summary:restore_summary ->
  ?replicas:replica_description list ->
  ?global_table_version:string ->
  ?latest_stream_arn:string ->
  ?latest_stream_label:string ->
  ?stream_specification:stream_specification ->
  ?global_secondary_indexes:global_secondary_index_description list ->
  ?local_secondary_indexes:local_secondary_index_description list ->
  ?billing_mode_summary:billing_mode_summary ->
  ?table_id:string ->
  ?table_arn:string ->
  ?item_count:int ->
  ?table_size_bytes:int ->
  ?provisioned_throughput:provisioned_throughput_description ->
  ?creation_date_time:float ->
  ?table_status:table_status ->
  ?key_schema:key_schema_element list ->
  ?table_name:string ->
  ?attribute_definitions:attribute_definition list ->
  unit -> table_description

val make_update_table_output : ?table_description:table_description -> unit
-> update_table_output

val make_provisioned_throughput :
  write_capacity_units:int -> read_capacity_units:int -> unit
-> provisioned_throughput

val make_update_global_secondary_index_action :
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  index_name:string ->
  unit
-> update_global_secondary_index_action

val make_create_global_secondary_index_action :
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  projection:projection ->
  key_schema:key_schema_element list ->
  index_name:string ->
  unit
-> create_global_secondary_index_action

val make_delete_global_secondary_index_action : index_name:string -> unit
-> delete_global_secondary_index_action

val make_global_secondary_index_update :
  ?delete:delete_global_secondary_index_action ->
  ?create:create_global_secondary_index_action ->
  ?update:update_global_secondary_index_action ->
  unit -> global_secondary_index_update

val make_sse_specification :
  ?kms_master_key_id:string -> ?sse_type:sse_type -> ?enabled:bool -> unit
-> sse_specification

val make_replica_global_secondary_index :
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  index_name:string ->
  unit
-> replica_global_secondary_index

val make_create_replication_group_member_action :
  ?table_class_override:table_class ->
  ?global_secondary_indexes:replica_global_secondary_index list ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?kms_master_key_id:string ->
  region_name:string ->
  unit
-> create_replication_group_member_action

val make_update_replication_group_member_action :
  ?table_class_override:table_class ->
  ?global_secondary_indexes:replica_global_secondary_index list ->
  ?on_demand_throughput_override:on_demand_throughput_override ->
  ?provisioned_throughput_override:provisioned_throughput_override ->
  ?kms_master_key_id:string ->
  region_name:string ->
  unit
-> update_replication_group_member_action

val make_delete_replication_group_member_action : region_name:string -> unit
-> delete_replication_group_member_action

val make_replication_group_update :
  ?delete:delete_replication_group_member_action ->
  ?update:update_replication_group_member_action ->
  ?create:create_replication_group_member_action ->
  unit -> replication_group_update

val make_update_table_input :
  ?on_demand_throughput:on_demand_throughput ->
  ?deletion_protection_enabled:bool ->
  ?table_class:table_class ->
  ?replica_updates:replication_group_update list ->
  ?sse_specification:sse_specification ->
  ?stream_specification:stream_specification ->
  ?global_secondary_index_updates:global_secondary_index_update list ->
  ?provisioned_throughput:provisioned_throughput ->
  ?billing_mode:billing_mode ->
  ?attribute_definitions:attribute_definition list ->
  table_name:string ->
  unit -> update_table_input

val make_update_kinesis_streaming_configuration :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision ->
  unit
-> update_kinesis_streaming_configuration

val make_update_kinesis_streaming_destination_output :
  ?update_kinesis_streaming_configuration:update_kinesis_streaming_configuration ->
  ?destination_status:destination_status ->
  ?stream_arn:string ->
  ?table_name:string ->
  unit
-> update_kinesis_streaming_destination_output

val make_update_kinesis_streaming_destination_input :
  ?update_kinesis_streaming_configuration:update_kinesis_streaming_configuration ->
  stream_arn:string ->
  table_name:string ->
  unit -> update_kinesis_streaming_destination_input

val make_capacity :
  ?capacity_units:float ->
  ?write_capacity_units:float ->
  ?read_capacity_units:float ->
  unit -> capacity

val make_consumed_capacity :
  ?global_secondary_indexes:(string * capacity) list ->
  ?local_secondary_indexes:(string * capacity) list ->
  ?table:capacity ->
  ?write_capacity_units:float ->
  ?read_capacity_units:float ->
  ?capacity_units:float ->
  ?table_name:string ->
  unit -> consumed_capacity

val make_item_collection_metrics :
  ?size_estimate_range_g_b:float list ->
  ?item_collection_key:(string * attribute_value) list ->
  unit -> item_collection_metrics

val make_update_item_output :
  ?item_collection_metrics:item_collection_metrics ->
  ?consumed_capacity:consumed_capacity ->
  ?attributes:(string * attribute_value) list ->
  unit -> update_item_output

val make_attribute_value_update :
  ?action:attribute_action -> ?value:attribute_value -> unit
-> attribute_value_update

val make_expected_attribute_value :
  ?attribute_value_list:attribute_value list ->
  ?comparison_operator:comparison_operator ->
  ?exists:bool ->
  ?value:attribute_value ->
  unit -> expected_attribute_value

val make_update_item_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:(string * attribute_value) list ->
  ?expression_attribute_names:(string * string) list ->
  ?condition_expression:string ->
  ?update_expression:string ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_values:return_value ->
  ?conditional_operator:conditional_operator ->
  ?expected:(string * expected_attribute_value) list ->
  ?attribute_updates:(string * attribute_value_update) list ->
  key:(string * attribute_value) list ->
  table_name:string ->
  unit
-> update_item_input

val make_replica_global_secondary_index_settings_description :
  ?provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?provisioned_write_capacity_units:int ->
  ?provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?provisioned_read_capacity_units:int ->
  ?index_status:index_status ->
  index_name:string ->
  unit
-> replica_global_secondary_index_settings_description

val make_replica_settings_description :
  ?replica_table_class_summary:table_class_summary ->
  ?replica_global_secondary_index_settings:replica_global_secondary_index_settings_description list ->
  ?replica_provisioned_write_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_provisioned_write_capacity_units:int ->
  ?replica_provisioned_read_capacity_auto_scaling_settings:auto_scaling_settings_description ->
  ?replica_provisioned_read_capacity_units:int ->
  ?replica_billing_mode_summary:billing_mode_summary ->
  ?replica_status:replica_status ->
  region_name:string ->
  unit
-> replica_settings_description

val make_update_global_table_settings_output :
  ?replica_settings:replica_settings_description list ->
  ?global_table_name:string ->
  unit
-> update_global_table_settings_output

val make_global_table_global_secondary_index_settings_update :
  ?provisioned_write_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?provisioned_write_capacity_units:int ->
  index_name:string ->
  unit
-> global_table_global_secondary_index_settings_update

val make_replica_global_secondary_index_settings_update :
  ?provisioned_read_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?provisioned_read_capacity_units:int ->
  index_name:string ->
  unit
-> replica_global_secondary_index_settings_update

val make_replica_settings_update :
  ?replica_table_class:table_class ->
  ?replica_global_secondary_index_settings_update:replica_global_secondary_index_settings_update list ->
  ?replica_provisioned_read_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?replica_provisioned_read_capacity_units:int ->
  region_name:string ->
  unit
-> replica_settings_update

val make_update_global_table_settings_input :
  ?replica_settings_update:replica_settings_update list ->
  ?global_table_global_secondary_index_settings_update:global_table_global_secondary_index_settings_update list ->
  ?global_table_provisioned_write_capacity_auto_scaling_settings_update:auto_scaling_settings_update ->
  ?global_table_provisioned_write_capacity_units:int ->
  ?global_table_billing_mode:billing_mode ->
  global_table_name:string ->
  unit
-> update_global_table_settings_input

val make_global_table_description :
  ?global_table_name:string ->
  ?global_table_status:global_table_status ->
  ?creation_date_time:float ->
  ?global_table_arn:string ->
  ?replication_group:replica_description list ->
  unit -> global_table_description

val make_update_global_table_output :
  ?global_table_description:global_table_description -> unit
-> update_global_table_output

val make_create_replica_action : region_name:string -> unit
-> create_replica_action

val make_delete_replica_action : region_name:string -> unit
-> delete_replica_action

val make_replica_update :
  ?delete:delete_replica_action -> ?create:create_replica_action -> unit
-> replica_update

val make_update_global_table_input :
  replica_updates:replica_update list -> global_table_name:string -> unit
-> update_global_table_input

val make_update_contributor_insights_output :
  ?contributor_insights_status:contributor_insights_status ->
  ?index_name:string ->
  ?table_name:string ->
  unit
-> update_contributor_insights_output

val make_update_contributor_insights_input :
  ?index_name:string ->
  contributor_insights_action:contributor_insights_action ->
  table_name:string ->
  unit
-> update_contributor_insights_input

val make_point_in_time_recovery_description :
  ?latest_restorable_date_time:float ->
  ?earliest_restorable_date_time:float ->
  ?point_in_time_recovery_status:point_in_time_recovery_status ->
  unit
-> point_in_time_recovery_description

val make_continuous_backups_description :
  ?point_in_time_recovery_description:point_in_time_recovery_description ->
  continuous_backups_status:continuous_backups_status ->
  unit
-> continuous_backups_description

val make_update_continuous_backups_output :
  ?continuous_backups_description:continuous_backups_description -> unit
-> update_continuous_backups_output

val make_point_in_time_recovery_specification :
  point_in_time_recovery_enabled:bool -> unit
-> point_in_time_recovery_specification

val make_update_continuous_backups_input :
  point_in_time_recovery_specification:point_in_time_recovery_specification ->
  table_name:string ->
  unit -> update_continuous_backups_input

val make_update :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:(string * attribute_value) list ->
  ?expression_attribute_names:(string * string) list ->
  ?condition_expression:string ->
  table_name:string ->
  update_expression:string ->
  key:(string * attribute_value) list ->
  unit -> update

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_cancellation_reason :
  ?message:string ->
  ?code:string ->
  ?item:(string * attribute_value) list ->
  unit -> cancellation_reason

val make_transact_write_items_output :
  ?item_collection_metrics:(string * item_collection_metrics list) list ->
  ?consumed_capacity:consumed_capacity list ->
  unit -> transact_write_items_output

val make_condition_check :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:(string * attribute_value) list ->
  ?expression_attribute_names:(string * string) list ->
  condition_expression:string ->
  table_name:string ->
  key:(string * attribute_value) list ->
  unit -> condition_check

val make_put :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:(string * attribute_value) list ->
  ?expression_attribute_names:(string * string) list ->
  ?condition_expression:string ->
  table_name:string ->
  item:(string * attribute_value) list ->
  unit -> put

val make_delete :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:(string * attribute_value) list ->
  ?expression_attribute_names:(string * string) list ->
  ?condition_expression:string ->
  table_name:string ->
  key:(string * attribute_value) list ->
  unit -> delete

val make_transact_write_item :
  ?update:update ->
  ?delete:delete ->
  ?put:put ->
  ?condition_check:condition_check ->
  unit -> transact_write_item

val make_transact_write_items_input :
  ?client_request_token:string ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  transact_items:transact_write_item list ->
  unit -> transact_write_items_input

val make_item_response : ?item:(string * attribute_value) list -> unit
-> item_response

val make_transact_get_items_output :
  ?responses:item_response list ->
  ?consumed_capacity:consumed_capacity list ->
  unit -> transact_get_items_output

val make_get :
  ?expression_attribute_names:(string * string) list ->
  ?projection_expression:string ->
  table_name:string ->
  key:(string * attribute_value) list ->
  unit -> get

val make_transact_get_item : get:get -> unit
-> transact_get_item

val make_transact_get_items_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  transact_items:transact_get_item list ->
  unit -> transact_get_items_input

val make_time_to_live_description :
  ?attribute_name:string -> ?time_to_live_status:time_to_live_status -> unit
-> time_to_live_description

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input

val make_global_secondary_index :
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  projection:projection ->
  key_schema:key_schema_element list ->
  index_name:string ->
  unit -> global_secondary_index

val make_table_creation_parameters :
  ?global_secondary_indexes:global_secondary_index list ->
  ?sse_specification:sse_specification ->
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  ?billing_mode:billing_mode ->
  key_schema:key_schema_element list ->
  attribute_definitions:attribute_definition list ->
  table_name:string ->
  unit -> table_creation_parameters

val make_local_secondary_index_info :
  ?projection:projection ->
  ?key_schema:key_schema_element list ->
  ?index_name:string ->
  unit -> local_secondary_index_info

val make_global_secondary_index_info :
  ?on_demand_throughput:on_demand_throughput ->
  ?provisioned_throughput:provisioned_throughput ->
  ?projection:projection ->
  ?key_schema:key_schema_element list ->
  ?index_name:string ->
  unit -> global_secondary_index_info

val make_source_table_feature_details :
  ?sse_description:sse_description ->
  ?time_to_live_description:time_to_live_description ->
  ?stream_description:stream_specification ->
  ?global_secondary_indexes:global_secondary_index_info list ->
  ?local_secondary_indexes:local_secondary_index_info list ->
  unit -> source_table_feature_details

val make_source_table_details :
  ?billing_mode:billing_mode ->
  ?item_count:int ->
  ?on_demand_throughput:on_demand_throughput ->
  ?table_size_bytes:int ->
  ?table_arn:string ->
  provisioned_throughput:provisioned_throughput ->
  table_creation_date_time:float ->
  key_schema:key_schema_element list ->
  table_id:string ->
  table_name:string ->
  unit -> source_table_details

val make_scan_output :
  ?consumed_capacity:consumed_capacity ->
  ?last_evaluated_key:(string * attribute_value) list ->
  ?scanned_count:int ->
  ?count:int ->
  ?items:(string * attribute_value) list list ->
  unit -> scan_output

val make_condition :
  ?attribute_value_list:attribute_value list ->
  comparison_operator:comparison_operator ->
  unit -> condition

val make_scan_input :
  ?consistent_read:bool ->
  ?expression_attribute_values:(string * attribute_value) list ->
  ?expression_attribute_names:(string * string) list ->
  ?filter_expression:string ->
  ?projection_expression:string ->
  ?segment:int ->
  ?total_segments:int ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?exclusive_start_key:(string * attribute_value) list ->
  ?conditional_operator:conditional_operator ->
  ?scan_filter:(string * condition) list ->
  ?select:select ->
  ?limit:int ->
  ?attributes_to_get:string list ->
  ?index_name:string ->
  table_name:string ->
  unit -> scan_input

val make_s3_bucket_source :
  ?s3_key_prefix:string ->
  ?s3_bucket_owner:string ->
  s3_bucket:string ->
  unit -> s3_bucket_source

val make_restore_table_to_point_in_time_output :
  ?table_description:table_description -> unit
-> restore_table_to_point_in_time_output

val make_local_secondary_index :
  projection:projection ->
  key_schema:key_schema_element list ->
  index_name:string ->
  unit
-> local_secondary_index

val make_restore_table_to_point_in_time_input :
  ?sse_specification_override:sse_specification ->
  ?on_demand_throughput_override:on_demand_throughput ->
  ?provisioned_throughput_override:provisioned_throughput ->
  ?local_secondary_index_override:local_secondary_index list ->
  ?global_secondary_index_override:global_secondary_index list ->
  ?billing_mode_override:billing_mode ->
  ?restore_date_time:float ->
  ?use_latest_restorable_time:bool ->
  ?source_table_name:string ->
  ?source_table_arn:string ->
  target_table_name:string ->
  unit
-> restore_table_to_point_in_time_input

val make_restore_table_from_backup_output :
  ?table_description:table_description -> unit
-> restore_table_from_backup_output

val make_restore_table_from_backup_input :
  ?sse_specification_override:sse_specification ->
  ?on_demand_throughput_override:on_demand_throughput ->
  ?provisioned_throughput_override:provisioned_throughput ->
  ?local_secondary_index_override:local_secondary_index list ->
  ?global_secondary_index_override:global_secondary_index list ->
  ?billing_mode_override:billing_mode ->
  backup_arn:string ->
  target_table_name:string ->
  unit -> restore_table_from_backup_input

val make_replica : ?region_name:string -> unit
-> replica

val make_query_output :
  ?consumed_capacity:consumed_capacity ->
  ?last_evaluated_key:(string * attribute_value) list ->
  ?scanned_count:int ->
  ?count:int ->
  ?items:(string * attribute_value) list list ->
  unit -> query_output

val make_query_input :
  ?expression_attribute_values:(string * attribute_value) list ->
  ?expression_attribute_names:(string * string) list ->
  ?key_condition_expression:string ->
  ?filter_expression:string ->
  ?projection_expression:string ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?exclusive_start_key:(string * attribute_value) list ->
  ?scan_index_forward:bool ->
  ?conditional_operator:conditional_operator ->
  ?query_filter:(string * condition) list ->
  ?key_conditions:(string * condition) list ->
  ?consistent_read:bool ->
  ?limit:int ->
  ?attributes_to_get:string list ->
  ?select:select ->
  ?index_name:string ->
  table_name:string ->
  unit -> query_input

val make_put_resource_policy_output : ?revision_id:string -> unit
-> put_resource_policy_output

val make_put_resource_policy_input :
  ?confirm_remove_self_resource_access:bool ->
  ?expected_revision_id:string ->
  policy:string ->
  resource_arn:string ->
  unit -> put_resource_policy_input

val make_put_item_output :
  ?item_collection_metrics:item_collection_metrics ->
  ?consumed_capacity:consumed_capacity ->
  ?attributes:(string * attribute_value) list ->
  unit -> put_item_output

val make_put_item_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:(string * attribute_value) list ->
  ?expression_attribute_names:(string * string) list ->
  ?condition_expression:string ->
  ?conditional_operator:conditional_operator ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_values:return_value ->
  ?expected:(string * expected_attribute_value) list ->
  item:(string * attribute_value) list ->
  table_name:string ->
  unit -> put_item_input

val make_batch_statement_error :
  ?item:(string * attribute_value) list ->
  ?message:string ->
  ?code:batch_statement_error_code_enum ->
  unit -> batch_statement_error

val make_batch_statement_response :
  ?item:(string * attribute_value) list ->
  ?table_name:string ->
  ?error:batch_statement_error ->
  unit -> batch_statement_response

val make_batch_statement_request :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?consistent_read:bool ->
  ?parameters:attribute_value list ->
  statement:string ->
  unit -> batch_statement_request

val make_parameterized_statement :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?parameters:attribute_value list ->
  statement:string ->
  unit -> parameterized_statement

val make_list_tags_of_resource_output :
  ?next_token:string -> ?tags:tag list -> unit
-> list_tags_of_resource_output

val make_list_tags_of_resource_input :
  ?next_token:string -> resource_arn:string -> unit
-> list_tags_of_resource_input

val make_list_tables_output :
  ?last_evaluated_table_name:string -> ?table_names:string list -> unit
-> list_tables_output

val make_list_tables_input :
  ?limit:int -> ?exclusive_start_table_name:string -> unit
-> list_tables_input

val make_import_summary :
  ?end_time:float ->
  ?start_time:float ->
  ?input_format:input_format ->
  ?cloud_watch_log_group_arn:string ->
  ?s3_bucket_source:s3_bucket_source ->
  ?table_arn:string ->
  ?import_status:import_status ->
  ?import_arn:string ->
  unit -> import_summary

val make_list_imports_output :
  ?next_token:string -> ?import_summary_list:import_summary list -> unit
-> list_imports_output

val make_list_imports_input :
  ?next_token:string -> ?page_size:int -> ?table_arn:string -> unit
-> list_imports_input

val make_global_table :
  ?replication_group:replica list -> ?global_table_name:string -> unit
-> global_table

val make_list_global_tables_output :
  ?last_evaluated_global_table_name:string ->
  ?global_tables:global_table list ->
  unit -> list_global_tables_output

val make_list_global_tables_input :
  ?region_name:string ->
  ?limit:int ->
  ?exclusive_start_global_table_name:string ->
  unit -> list_global_tables_input

val make_export_summary :
  ?export_type:export_type ->
  ?export_status:export_status ->
  ?export_arn:string ->
  unit -> export_summary

val make_list_exports_output :
  ?next_token:string -> ?export_summaries:export_summary list -> unit
-> list_exports_output

val make_list_exports_input :
  ?next_token:string -> ?max_results:int -> ?table_arn:string -> unit
-> list_exports_input

val make_contributor_insights_summary :
  ?contributor_insights_status:contributor_insights_status ->
  ?index_name:string ->
  ?table_name:string ->
  unit
-> contributor_insights_summary

val make_list_contributor_insights_output :
  ?next_token:string ->
  ?contributor_insights_summaries:contributor_insights_summary list ->
  unit
-> list_contributor_insights_output

val make_list_contributor_insights_input :
  ?max_results:int -> ?next_token:string -> ?table_name:string -> unit
-> list_contributor_insights_input

val make_backup_summary :
  ?backup_size_bytes:int ->
  ?backup_type:backup_type ->
  ?backup_status:backup_status ->
  ?backup_expiry_date_time:float ->
  ?backup_creation_date_time:float ->
  ?backup_name:string ->
  ?backup_arn:string ->
  ?table_arn:string ->
  ?table_id:string ->
  ?table_name:string ->
  unit -> backup_summary

val make_list_backups_output :
  ?last_evaluated_backup_arn:string ->
  ?backup_summaries:backup_summary list ->
  unit -> list_backups_output

val make_list_backups_input :
  ?backup_type:backup_type_filter ->
  ?exclusive_start_backup_arn:string ->
  ?time_range_upper_bound:float ->
  ?time_range_lower_bound:float ->
  ?limit:int ->
  ?table_name:string ->
  unit -> list_backups_input

val make_enable_kinesis_streaming_configuration :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision ->
  unit
-> enable_kinesis_streaming_configuration

val make_kinesis_streaming_destination_output :
  ?enable_kinesis_streaming_configuration:enable_kinesis_streaming_configuration ->
  ?destination_status:destination_status ->
  ?stream_arn:string ->
  ?table_name:string ->
  unit
-> kinesis_streaming_destination_output

val make_kinesis_streaming_destination_input :
  ?enable_kinesis_streaming_configuration:enable_kinesis_streaming_configuration ->
  stream_arn:string ->
  table_name:string ->
  unit
-> kinesis_streaming_destination_input

val make_kinesis_data_stream_destination :
  ?approximate_creation_date_time_precision:approximate_creation_date_time_precision ->
  ?destination_status_description:string ->
  ?destination_status:destination_status ->
  ?stream_arn:string ->
  unit -> kinesis_data_stream_destination

val make_keys_and_attributes :
  ?expression_attribute_names:(string * string) list ->
  ?projection_expression:string ->
  ?consistent_read:bool ->
  ?attributes_to_get:string list ->
  keys:(string * attribute_value) list list ->
  unit -> keys_and_attributes

val make_csv_options : ?header_list:string list -> ?delimiter:string -> unit
-> csv_options

val make_input_format_options : ?csv:csv_options -> unit
-> input_format_options

val make_incremental_export_specification :
  ?export_view_type:export_view_type ->
  ?export_to_time:float ->
  ?export_from_time:float ->
  unit -> incremental_export_specification

val make_import_table_description :
  ?failure_message:string ->
  ?failure_code:string ->
  ?imported_item_count:int ->
  ?processed_item_count:int ->
  ?processed_size_bytes:int ->
  ?end_time:float ->
  ?start_time:float ->
  ?table_creation_parameters:table_creation_parameters ->
  ?input_compression_type:input_compression_type ->
  ?input_format_options:input_format_options ->
  ?input_format:input_format ->
  ?cloud_watch_log_group_arn:string ->
  ?error_count:int ->
  ?s3_bucket_source:s3_bucket_source ->
  ?client_token:string ->
  ?table_id:string ->
  ?table_arn:string ->
  ?import_status:import_status ->
  ?import_arn:string ->
  unit -> import_table_description

val make_import_table_output :
  import_table_description:import_table_description -> unit
-> import_table_output

val make_import_table_input :
  ?input_compression_type:input_compression_type ->
  ?input_format_options:input_format_options ->
  ?client_token:string ->
  table_creation_parameters:table_creation_parameters ->
  input_format:input_format ->
  s3_bucket_source:s3_bucket_source ->
  unit -> import_table_input

val make_get_resource_policy_output :
  ?revision_id:string -> ?policy:string -> unit
-> get_resource_policy_output

val make_get_resource_policy_input : resource_arn:string -> unit
-> get_resource_policy_input

val make_get_item_output :
  ?consumed_capacity:consumed_capacity ->
  ?item:(string * attribute_value) list ->
  unit -> get_item_output

val make_get_item_input :
  ?expression_attribute_names:(string * string) list ->
  ?projection_expression:string ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?consistent_read:bool ->
  ?attributes_to_get:string list ->
  key:(string * attribute_value) list ->
  table_name:string ->
  unit -> get_item_input

val make_failure_exception :
  ?exception_description:string -> ?exception_name:string -> unit
-> failure_exception

val make_export_description :
  ?incremental_export_specification:incremental_export_specification ->
  ?export_type:export_type ->
  ?item_count:int ->
  ?billed_size_bytes:int ->
  ?export_format:export_format ->
  ?failure_message:string ->
  ?failure_code:string ->
  ?s3_sse_kms_key_id:string ->
  ?s3_sse_algorithm:s3_sse_algorithm ->
  ?s3_prefix:string ->
  ?s3_bucket_owner:string ->
  ?s3_bucket:string ->
  ?client_token:string ->
  ?export_time:float ->
  ?table_id:string ->
  ?table_arn:string ->
  ?export_manifest:string ->
  ?end_time:float ->
  ?start_time:float ->
  ?export_status:export_status ->
  ?export_arn:string ->
  unit -> export_description

val make_export_table_to_point_in_time_output :
  ?export_description:export_description -> unit
-> export_table_to_point_in_time_output

val make_export_table_to_point_in_time_input :
  ?incremental_export_specification:incremental_export_specification ->
  ?export_type:export_type ->
  ?export_format:export_format ->
  ?s3_sse_kms_key_id:string ->
  ?s3_sse_algorithm:s3_sse_algorithm ->
  ?s3_prefix:string ->
  ?s3_bucket_owner:string ->
  ?client_token:string ->
  ?export_time:float ->
  s3_bucket:string ->
  table_arn:string ->
  unit
-> export_table_to_point_in_time_input

val make_execute_transaction_output :
  ?consumed_capacity:consumed_capacity list ->
  ?responses:item_response list ->
  unit -> execute_transaction_output

val make_execute_transaction_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  ?client_request_token:string ->
  transact_statements:parameterized_statement list ->
  unit -> execute_transaction_input

val make_execute_statement_output :
  ?last_evaluated_key:(string * attribute_value) list ->
  ?consumed_capacity:consumed_capacity ->
  ?next_token:string ->
  ?items:(string * attribute_value) list list ->
  unit -> execute_statement_output

val make_execute_statement_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?limit:int ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?next_token:string ->
  ?consistent_read:bool ->
  ?parameters:attribute_value list ->
  statement:string ->
  unit -> execute_statement_input

val make_endpoint : cache_period_in_minutes:int -> address:string -> unit
-> endpoint

val make_describe_time_to_live_output :
  ?time_to_live_description:time_to_live_description -> unit
-> describe_time_to_live_output

val make_describe_time_to_live_input : table_name:string -> unit
-> describe_time_to_live_input

val make_describe_table_replica_auto_scaling_output :
  ?table_auto_scaling_description:table_auto_scaling_description -> unit
-> describe_table_replica_auto_scaling_output

val make_describe_table_replica_auto_scaling_input :
  table_name:string -> unit
-> describe_table_replica_auto_scaling_input

val make_describe_table_output : ?table:table_description -> unit
-> describe_table_output

val make_describe_table_input : table_name:string -> unit
-> describe_table_input

val make_describe_limits_output :
  ?table_max_write_capacity_units:int ->
  ?table_max_read_capacity_units:int ->
  ?account_max_write_capacity_units:int ->
  ?account_max_read_capacity_units:int ->
  unit -> describe_limits_output

val make_describe_limits_input : unit
-> describe_limits_input

val make_describe_kinesis_streaming_destination_output :
  ?kinesis_data_stream_destinations:kinesis_data_stream_destination list ->
  ?table_name:string ->
  unit
-> describe_kinesis_streaming_destination_output

val make_describe_kinesis_streaming_destination_input :
  table_name:string -> unit
-> describe_kinesis_streaming_destination_input

val make_describe_import_output :
  import_table_description:import_table_description -> unit
-> describe_import_output

val make_describe_import_input : import_arn:string -> unit
-> describe_import_input

val make_describe_global_table_settings_output :
  ?replica_settings:replica_settings_description list ->
  ?global_table_name:string ->
  unit
-> describe_global_table_settings_output

val make_describe_global_table_settings_input :
  global_table_name:string -> unit
-> describe_global_table_settings_input

val make_describe_global_table_output :
  ?global_table_description:global_table_description -> unit
-> describe_global_table_output

val make_describe_global_table_input : global_table_name:string -> unit
-> describe_global_table_input

val make_describe_export_output :
  ?export_description:export_description -> unit
-> describe_export_output

val make_describe_export_input : export_arn:string -> unit
-> describe_export_input

val make_describe_endpoints_response : endpoints:endpoint list -> unit
-> describe_endpoints_response

val make_describe_endpoints_request : unit
-> describe_endpoints_request

val make_describe_contributor_insights_output :
  ?failure_exception:failure_exception ->
  ?last_update_date_time:float ->
  ?contributor_insights_status:contributor_insights_status ->
  ?contributor_insights_rule_list:string list ->
  ?index_name:string ->
  ?table_name:string ->
  unit
-> describe_contributor_insights_output

val make_describe_contributor_insights_input :
  ?index_name:string -> table_name:string -> unit
-> describe_contributor_insights_input

val make_describe_continuous_backups_output :
  ?continuous_backups_description:continuous_backups_description -> unit
-> describe_continuous_backups_output

val make_describe_continuous_backups_input : table_name:string -> unit
-> describe_continuous_backups_input

val make_backup_details :
  ?backup_expiry_date_time:float ->
  ?backup_size_bytes:int ->
  backup_creation_date_time:float ->
  backup_type:backup_type ->
  backup_status:backup_status ->
  backup_name:string ->
  backup_arn:string ->
  unit -> backup_details

val make_backup_description :
  ?source_table_feature_details:source_table_feature_details ->
  ?source_table_details:source_table_details ->
  ?backup_details:backup_details ->
  unit -> backup_description

val make_describe_backup_output :
  ?backup_description:backup_description -> unit
-> describe_backup_output

val make_describe_backup_input : backup_arn:string -> unit
-> describe_backup_input

val make_delete_table_output : ?table_description:table_description -> unit
-> delete_table_output

val make_delete_table_input : table_name:string -> unit
-> delete_table_input

val make_delete_resource_policy_output : ?revision_id:string -> unit
-> delete_resource_policy_output

val make_delete_resource_policy_input :
  ?expected_revision_id:string -> resource_arn:string -> unit
-> delete_resource_policy_input

val make_delete_item_output :
  ?item_collection_metrics:item_collection_metrics ->
  ?consumed_capacity:consumed_capacity ->
  ?attributes:(string * attribute_value) list ->
  unit -> delete_item_output

val make_delete_item_input :
  ?return_values_on_condition_check_failure:return_values_on_condition_check_failure ->
  ?expression_attribute_values:(string * attribute_value) list ->
  ?expression_attribute_names:(string * string) list ->
  ?condition_expression:string ->
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  ?return_values:return_value ->
  ?conditional_operator:conditional_operator ->
  ?expected:(string * expected_attribute_value) list ->
  key:(string * attribute_value) list ->
  table_name:string ->
  unit -> delete_item_input

val make_delete_backup_output :
  ?backup_description:backup_description -> unit
-> delete_backup_output

val make_delete_backup_input : backup_arn:string -> unit
-> delete_backup_input

val make_create_table_output : ?table_description:table_description -> unit
-> create_table_output

val make_create_table_input :
  ?on_demand_throughput:on_demand_throughput ->
  ?resource_policy:string ->
  ?deletion_protection_enabled:bool ->
  ?table_class:table_class ->
  ?tags:tag list ->
  ?sse_specification:sse_specification ->
  ?stream_specification:stream_specification ->
  ?provisioned_throughput:provisioned_throughput ->
  ?billing_mode:billing_mode ->
  ?global_secondary_indexes:global_secondary_index list ->
  ?local_secondary_indexes:local_secondary_index list ->
  key_schema:key_schema_element list ->
  table_name:string ->
  attribute_definitions:attribute_definition list ->
  unit -> create_table_input

val make_create_global_table_output :
  ?global_table_description:global_table_description -> unit
-> create_global_table_output

val make_create_global_table_input :
  replication_group:replica list -> global_table_name:string -> unit
-> create_global_table_input

val make_create_backup_output : ?backup_details:backup_details -> unit
-> create_backup_output

val make_create_backup_input :
  backup_name:string -> table_name:string -> unit
-> create_backup_input

val make_batch_write_item_output :
  ?consumed_capacity:consumed_capacity list ->
  ?item_collection_metrics:(string * item_collection_metrics list) list ->
  ?unprocessed_items:(string * write_request list) list ->
  unit -> batch_write_item_output

val make_batch_write_item_input :
  ?return_item_collection_metrics:return_item_collection_metrics ->
  ?return_consumed_capacity:return_consumed_capacity ->
  request_items:(string * write_request list) list ->
  unit -> batch_write_item_input

val make_batch_get_item_output :
  ?consumed_capacity:consumed_capacity list ->
  ?unprocessed_keys:(string * keys_and_attributes) list ->
  ?responses:(string * (string * attribute_value) list list) list ->
  unit -> batch_get_item_output

val make_batch_get_item_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  request_items:(string * keys_and_attributes) list ->
  unit -> batch_get_item_input

val make_batch_execute_statement_output :
  ?consumed_capacity:consumed_capacity list ->
  ?responses:batch_statement_response list ->
  unit
-> batch_execute_statement_output

val make_batch_execute_statement_input :
  ?return_consumed_capacity:return_consumed_capacity ->
  statements:batch_statement_request list ->
  unit
-> batch_execute_statement_input

