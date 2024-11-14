open Smaws_Lib.Json.SerializeHelpers

open Types

let string_attribute_value_to_yojson = string_to_yojson

let number_attribute_value_to_yojson = string_to_yojson

let binary_attribute_value_to_yojson = blob_to_yojson

let string_set_attribute_value_to_yojson = 
  fun tree -> list_to_yojson string_attribute_value_to_yojson tree

let number_set_attribute_value_to_yojson = 
  fun tree -> list_to_yojson number_attribute_value_to_yojson tree

let binary_set_attribute_value_to_yojson = 
  fun tree -> list_to_yojson binary_attribute_value_to_yojson tree

let attribute_name_to_yojson = string_to_yojson

let null_attribute_value_to_yojson = bool_to_yojson

let boolean_attribute_value_to_yojson = bool_to_yojson

let rec attribute_value_to_yojson = 
  fun (x: attribute_value) -> 
  match x with 
    | BOOL(arg) -> assoc_to_yojson ["BOOL", Some (boolean_attribute_value_to_yojson arg)]
      | NULL(arg) -> assoc_to_yojson ["NULL", Some (null_attribute_value_to_yojson arg)]
      | L(arg) -> assoc_to_yojson ["L", Some (list_attribute_value_to_yojson arg)]
      | M(arg) -> assoc_to_yojson ["M", Some (map_attribute_value_to_yojson arg)]
      | BS(arg) -> assoc_to_yojson ["BS", Some (binary_set_attribute_value_to_yojson arg)]
      | NS(arg) -> assoc_to_yojson ["NS", Some (number_set_attribute_value_to_yojson arg)]
      | SS(arg) -> assoc_to_yojson ["SS", Some (string_set_attribute_value_to_yojson arg)]
      | B(arg) -> assoc_to_yojson ["B", Some (binary_attribute_value_to_yojson arg)]
      | N(arg) -> assoc_to_yojson ["N", Some (number_attribute_value_to_yojson arg)]
      | S(arg) -> assoc_to_yojson ["S", Some (string_attribute_value_to_yojson arg)]
      
      
    

and list_attribute_value_to_yojson = 
  fun tree -> list_to_yojson attribute_value_to_yojson tree

and map_attribute_value_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let put_item_input_attribute_map_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let put_request_to_yojson = 
  fun (x: put_request) -> assoc_to_yojson(
    [(
         "Item",
         (Some (put_item_input_attribute_map_to_yojson x.item)));
       
  ])

let key_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let delete_request_to_yojson = 
  fun (x: delete_request) -> assoc_to_yojson(
    [(
         "Key",
         (Some (key_to_yojson x.key)));
       
  ])

let write_request_to_yojson = 
  fun (x: write_request) -> assoc_to_yojson(
    [(
         "DeleteRequest",
         (option_to_yojson delete_request_to_yojson x.delete_request));
       (
         "PutRequest",
         (option_to_yojson put_request_to_yojson x.put_request));
       
  ])

let write_requests_to_yojson = 
  fun tree -> list_to_yojson write_request_to_yojson tree

let time_to_live_enabled_to_yojson = bool_to_yojson

let time_to_live_attribute_name_to_yojson = string_to_yojson

let time_to_live_specification_to_yojson = 
  fun (x: time_to_live_specification) -> assoc_to_yojson(
    [(
         "AttributeName",
         (Some (time_to_live_attribute_name_to_yojson x.attribute_name)));
       (
         "Enabled",
         (Some (time_to_live_enabled_to_yojson x.enabled)));
       
  ])

let update_time_to_live_output_to_yojson = 
  fun (x: update_time_to_live_output) -> assoc_to_yojson(
    [(
         "TimeToLiveSpecification",
         (option_to_yojson time_to_live_specification_to_yojson x.time_to_live_specification));
       
  ])

let table_arn_to_yojson = string_to_yojson

let update_time_to_live_input_to_yojson = 
  fun (x: update_time_to_live_input) -> assoc_to_yojson(
    [(
         "TimeToLiveSpecification",
         (Some (time_to_live_specification_to_yojson x.time_to_live_specification)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_in_use_exception_to_yojson = 
  fun (x: resource_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let string__to_yojson = string_to_yojson

let invalid_endpoint_exception_to_yojson = 
  fun (x: invalid_endpoint_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let internal_server_error_to_yojson = 
  fun (x: internal_server_error) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let table_name_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let table_status_to_yojson = 
  fun (x: table_status) -> match x with 
 
| ARCHIVED -> `String "ARCHIVED"
  | ARCHIVING -> `String "ARCHIVING"
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS -> `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"
   

let region_name_to_yojson = string_to_yojson

let index_name_to_yojson = string_to_yojson

let index_status_to_yojson = 
  fun (x: index_status) -> match x with 
 
| ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"
   

let positive_long_object_to_yojson = long_to_yojson

let boolean_object_to_yojson = bool_to_yojson

let auto_scaling_policy_name_to_yojson = string_to_yojson

let integer_object_to_yojson = int_to_yojson

let double_object_to_yojson = double_to_yojson

let
auto_scaling_target_tracking_scaling_policy_configuration_description_to_yojson
= 
  fun (x: auto_scaling_target_tracking_scaling_policy_configuration_description) -> assoc_to_yojson(
    [(
         "TargetValue",
         (Some (double_object_to_yojson x.target_value)));
       (
         "ScaleOutCooldown",
         (option_to_yojson integer_object_to_yojson x.scale_out_cooldown));
       (
         "ScaleInCooldown",
         (option_to_yojson integer_object_to_yojson x.scale_in_cooldown));
       (
         "DisableScaleIn",
         (option_to_yojson boolean_object_to_yojson x.disable_scale_in));
       
  ])

let auto_scaling_policy_description_to_yojson = 
  fun (x: auto_scaling_policy_description) -> assoc_to_yojson(
    [(
         "TargetTrackingScalingPolicyConfiguration",
         (option_to_yojson auto_scaling_target_tracking_scaling_policy_configuration_description_to_yojson x.target_tracking_scaling_policy_configuration));
       (
         "PolicyName",
         (option_to_yojson auto_scaling_policy_name_to_yojson x.policy_name));
       
  ])

let auto_scaling_policy_description_list_to_yojson = 
  fun tree -> list_to_yojson auto_scaling_policy_description_to_yojson tree

let auto_scaling_settings_description_to_yojson = 
  fun (x: auto_scaling_settings_description) -> assoc_to_yojson(
    [(
         "ScalingPolicies",
         (option_to_yojson auto_scaling_policy_description_list_to_yojson x.scaling_policies));
       (
         "AutoScalingRoleArn",
         (option_to_yojson string__to_yojson x.auto_scaling_role_arn));
       (
         "AutoScalingDisabled",
         (option_to_yojson boolean_object_to_yojson x.auto_scaling_disabled));
       (
         "MaximumUnits",
         (option_to_yojson positive_long_object_to_yojson x.maximum_units));
       (
         "MinimumUnits",
         (option_to_yojson positive_long_object_to_yojson x.minimum_units));
       
  ])

let replica_global_secondary_index_auto_scaling_description_to_yojson = 
  fun (x: replica_global_secondary_index_auto_scaling_description) -> assoc_to_yojson(
    [(
         "ProvisionedWriteCapacityAutoScalingSettings",
         (option_to_yojson auto_scaling_settings_description_to_yojson x.provisioned_write_capacity_auto_scaling_settings));
       (
         "ProvisionedReadCapacityAutoScalingSettings",
         (option_to_yojson auto_scaling_settings_description_to_yojson x.provisioned_read_capacity_auto_scaling_settings));
       (
         "IndexStatus",
         (option_to_yojson index_status_to_yojson x.index_status));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       
  ])

let replica_global_secondary_index_auto_scaling_description_list_to_yojson = 
  fun tree -> list_to_yojson replica_global_secondary_index_auto_scaling_description_to_yojson tree

let replica_status_to_yojson = 
  fun (x: replica_status) -> match x with 
 
| INACCESSIBLE_ENCRYPTION_CREDENTIALS -> `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
  | REGION_DISABLED -> `String "REGION_DISABLED"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | CREATION_FAILED -> `String "CREATION_FAILED"
  | CREATING -> `String "CREATING"
   

let replica_auto_scaling_description_to_yojson = 
  fun (x: replica_auto_scaling_description) -> assoc_to_yojson(
    [(
         "ReplicaStatus",
         (option_to_yojson replica_status_to_yojson x.replica_status));
       (
         "ReplicaProvisionedWriteCapacityAutoScalingSettings",
         (option_to_yojson auto_scaling_settings_description_to_yojson x.replica_provisioned_write_capacity_auto_scaling_settings));
       (
         "ReplicaProvisionedReadCapacityAutoScalingSettings",
         (option_to_yojson auto_scaling_settings_description_to_yojson x.replica_provisioned_read_capacity_auto_scaling_settings));
       (
         "GlobalSecondaryIndexes",
         (option_to_yojson replica_global_secondary_index_auto_scaling_description_list_to_yojson x.global_secondary_indexes));
       (
         "RegionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       
  ])

let replica_auto_scaling_description_list_to_yojson = 
  fun tree -> list_to_yojson replica_auto_scaling_description_to_yojson tree

let table_auto_scaling_description_to_yojson = 
  fun (x: table_auto_scaling_description) -> assoc_to_yojson(
    [(
         "Replicas",
         (option_to_yojson replica_auto_scaling_description_list_to_yojson x.replicas));
       (
         "TableStatus",
         (option_to_yojson table_status_to_yojson x.table_status));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       
  ])

let update_table_replica_auto_scaling_output_to_yojson = 
  fun (x: update_table_replica_auto_scaling_output) -> assoc_to_yojson(
    [(
         "TableAutoScalingDescription",
         (option_to_yojson table_auto_scaling_description_to_yojson x.table_auto_scaling_description));
       
  ])

let auto_scaling_role_arn_to_yojson = string_to_yojson

let
auto_scaling_target_tracking_scaling_policy_configuration_update_to_yojson = 
  fun (x: auto_scaling_target_tracking_scaling_policy_configuration_update) -> assoc_to_yojson(
    [(
         "TargetValue",
         (Some (double_object_to_yojson x.target_value)));
       (
         "ScaleOutCooldown",
         (option_to_yojson integer_object_to_yojson x.scale_out_cooldown));
       (
         "ScaleInCooldown",
         (option_to_yojson integer_object_to_yojson x.scale_in_cooldown));
       (
         "DisableScaleIn",
         (option_to_yojson boolean_object_to_yojson x.disable_scale_in));
       
  ])

let auto_scaling_policy_update_to_yojson = 
  fun (x: auto_scaling_policy_update) -> assoc_to_yojson(
    [(
         "TargetTrackingScalingPolicyConfiguration",
         (Some (auto_scaling_target_tracking_scaling_policy_configuration_update_to_yojson x.target_tracking_scaling_policy_configuration)));
       (
         "PolicyName",
         (option_to_yojson auto_scaling_policy_name_to_yojson x.policy_name));
       
  ])

let auto_scaling_settings_update_to_yojson = 
  fun (x: auto_scaling_settings_update) -> assoc_to_yojson(
    [(
         "ScalingPolicyUpdate",
         (option_to_yojson auto_scaling_policy_update_to_yojson x.scaling_policy_update));
       (
         "AutoScalingRoleArn",
         (option_to_yojson auto_scaling_role_arn_to_yojson x.auto_scaling_role_arn));
       (
         "AutoScalingDisabled",
         (option_to_yojson boolean_object_to_yojson x.auto_scaling_disabled));
       (
         "MaximumUnits",
         (option_to_yojson positive_long_object_to_yojson x.maximum_units));
       (
         "MinimumUnits",
         (option_to_yojson positive_long_object_to_yojson x.minimum_units));
       
  ])

let global_secondary_index_auto_scaling_update_to_yojson = 
  fun (x: global_secondary_index_auto_scaling_update) -> assoc_to_yojson(
    [(
         "ProvisionedWriteCapacityAutoScalingUpdate",
         (option_to_yojson auto_scaling_settings_update_to_yojson x.provisioned_write_capacity_auto_scaling_update));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       
  ])

let global_secondary_index_auto_scaling_update_list_to_yojson = 
  fun tree -> list_to_yojson global_secondary_index_auto_scaling_update_to_yojson tree

let replica_global_secondary_index_auto_scaling_update_to_yojson = 
  fun (x: replica_global_secondary_index_auto_scaling_update) -> assoc_to_yojson(
    [(
         "ProvisionedReadCapacityAutoScalingUpdate",
         (option_to_yojson auto_scaling_settings_update_to_yojson x.provisioned_read_capacity_auto_scaling_update));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       
  ])

let replica_global_secondary_index_auto_scaling_update_list_to_yojson = 
  fun tree -> list_to_yojson replica_global_secondary_index_auto_scaling_update_to_yojson tree

let replica_auto_scaling_update_to_yojson = 
  fun (x: replica_auto_scaling_update) -> assoc_to_yojson(
    [(
         "ReplicaProvisionedReadCapacityAutoScalingUpdate",
         (option_to_yojson auto_scaling_settings_update_to_yojson x.replica_provisioned_read_capacity_auto_scaling_update));
       (
         "ReplicaGlobalSecondaryIndexUpdates",
         (option_to_yojson replica_global_secondary_index_auto_scaling_update_list_to_yojson x.replica_global_secondary_index_updates));
       (
         "RegionName",
         (Some (region_name_to_yojson x.region_name)));
       
  ])

let replica_auto_scaling_update_list_to_yojson = 
  fun tree -> list_to_yojson replica_auto_scaling_update_to_yojson tree

let update_table_replica_auto_scaling_input_to_yojson = 
  fun (x: update_table_replica_auto_scaling_input) -> assoc_to_yojson(
    [(
         "ReplicaUpdates",
         (option_to_yojson replica_auto_scaling_update_list_to_yojson x.replica_updates));
       (
         "ProvisionedWriteCapacityAutoScalingUpdate",
         (option_to_yojson auto_scaling_settings_update_to_yojson x.provisioned_write_capacity_auto_scaling_update));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       (
         "GlobalSecondaryIndexUpdates",
         (option_to_yojson global_secondary_index_auto_scaling_update_list_to_yojson x.global_secondary_index_updates));
       
  ])

let key_schema_attribute_name_to_yojson = string_to_yojson

let scalar_attribute_type_to_yojson = 
  fun (x: scalar_attribute_type) -> match x with 
  | B -> `String "B"
    | N -> `String "N"
    | S -> `String "S"
     

let attribute_definition_to_yojson = 
  fun (x: attribute_definition) -> assoc_to_yojson(
    [(
         "AttributeType",
         (Some (scalar_attribute_type_to_yojson x.attribute_type)));
       (
         "AttributeName",
         (Some (key_schema_attribute_name_to_yojson x.attribute_name)));
       
  ])

let attribute_definitions_to_yojson = 
  fun tree -> list_to_yojson attribute_definition_to_yojson tree

let key_type_to_yojson = 
  fun (x: key_type) -> match x with 
  | RANGE -> `String "RANGE"
    | HASH -> `String "HASH"
     

let key_schema_element_to_yojson = 
  fun (x: key_schema_element) -> assoc_to_yojson(
    [(
         "KeyType",
         (Some (key_type_to_yojson x.key_type)));
       (
         "AttributeName",
         (Some (key_schema_attribute_name_to_yojson x.attribute_name)));
       
  ])

let key_schema_to_yojson = 
  fun tree -> list_to_yojson key_schema_element_to_yojson tree

let date_to_yojson = timestamp_to_yojson

let non_negative_long_object_to_yojson = long_to_yojson

let provisioned_throughput_description_to_yojson = 
  fun (x: provisioned_throughput_description) -> assoc_to_yojson(
    [(
         "WriteCapacityUnits",
         (option_to_yojson non_negative_long_object_to_yojson x.write_capacity_units));
       (
         "ReadCapacityUnits",
         (option_to_yojson non_negative_long_object_to_yojson x.read_capacity_units));
       (
         "NumberOfDecreasesToday",
         (option_to_yojson positive_long_object_to_yojson x.number_of_decreases_today));
       (
         "LastDecreaseDateTime",
         (option_to_yojson date_to_yojson x.last_decrease_date_time));
       (
         "LastIncreaseDateTime",
         (option_to_yojson date_to_yojson x.last_increase_date_time));
       
  ])

let long_object_to_yojson = long_to_yojson

let table_id_to_yojson = string_to_yojson

let billing_mode_to_yojson = 
  fun (x: billing_mode) -> match x with 
 
| PAY_PER_REQUEST -> `String "PAY_PER_REQUEST"
  | PROVISIONED -> `String "PROVISIONED"
   

let billing_mode_summary_to_yojson = 
  fun (x: billing_mode_summary) -> assoc_to_yojson(
    [(
         "LastUpdateToPayPerRequestDateTime",
         (option_to_yojson date_to_yojson x.last_update_to_pay_per_request_date_time));
       (
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       
  ])

let projection_type_to_yojson = 
  fun (x: projection_type) -> match x with 
 
| INCLUDE -> `String "INCLUDE"
  | KEYS_ONLY -> `String "KEYS_ONLY"
  | ALL -> `String "ALL"
   

let non_key_attribute_name_to_yojson = string_to_yojson

let non_key_attribute_name_list_to_yojson = 
  fun tree -> list_to_yojson non_key_attribute_name_to_yojson tree

let projection_to_yojson = 
  fun (x: projection) -> assoc_to_yojson(
    [(
         "NonKeyAttributes",
         (option_to_yojson non_key_attribute_name_list_to_yojson x.non_key_attributes));
       (
         "ProjectionType",
         (option_to_yojson projection_type_to_yojson x.projection_type));
       
  ])

let local_secondary_index_description_to_yojson = 
  fun (x: local_secondary_index_description) -> assoc_to_yojson(
    [(
         "IndexArn",
         (option_to_yojson string__to_yojson x.index_arn));
       (
         "ItemCount",
         (option_to_yojson long_object_to_yojson x.item_count));
       (
         "IndexSizeBytes",
         (option_to_yojson long_object_to_yojson x.index_size_bytes));
       (
         "Projection",
         (option_to_yojson projection_to_yojson x.projection));
       (
         "KeySchema",
         (option_to_yojson key_schema_to_yojson x.key_schema));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       
  ])

let local_secondary_index_description_list_to_yojson = 
  fun tree -> list_to_yojson local_secondary_index_description_to_yojson tree

let backfilling_to_yojson = bool_to_yojson

let on_demand_throughput_to_yojson = 
  fun (x: on_demand_throughput) -> assoc_to_yojson(
    [(
         "MaxWriteRequestUnits",
         (option_to_yojson long_object_to_yojson x.max_write_request_units));
       (
         "MaxReadRequestUnits",
         (option_to_yojson long_object_to_yojson x.max_read_request_units));
       
  ])

let global_secondary_index_description_to_yojson = 
  fun (x: global_secondary_index_description) -> assoc_to_yojson(
    [(
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "IndexArn",
         (option_to_yojson string__to_yojson x.index_arn));
       (
         "ItemCount",
         (option_to_yojson long_object_to_yojson x.item_count));
       (
         "IndexSizeBytes",
         (option_to_yojson long_object_to_yojson x.index_size_bytes));
       (
         "ProvisionedThroughput",
         (option_to_yojson provisioned_throughput_description_to_yojson x.provisioned_throughput));
       (
         "Backfilling",
         (option_to_yojson backfilling_to_yojson x.backfilling));
       (
         "IndexStatus",
         (option_to_yojson index_status_to_yojson x.index_status));
       (
         "Projection",
         (option_to_yojson projection_to_yojson x.projection));
       (
         "KeySchema",
         (option_to_yojson key_schema_to_yojson x.key_schema));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       
  ])

let global_secondary_index_description_list_to_yojson = 
  fun tree -> list_to_yojson global_secondary_index_description_to_yojson tree

let stream_enabled_to_yojson = bool_to_yojson

let stream_view_type_to_yojson = 
  fun (x: stream_view_type) -> match x with 
 
| KEYS_ONLY -> `String "KEYS_ONLY"
  | NEW_AND_OLD_IMAGES -> `String "NEW_AND_OLD_IMAGES"
  | OLD_IMAGE -> `String "OLD_IMAGE"
  | NEW_IMAGE -> `String "NEW_IMAGE"
   

let stream_specification_to_yojson = 
  fun (x: stream_specification) -> assoc_to_yojson(
    [(
         "StreamViewType",
         (option_to_yojson stream_view_type_to_yojson x.stream_view_type));
       (
         "StreamEnabled",
         (Some (stream_enabled_to_yojson x.stream_enabled)));
       
  ])

let stream_arn_to_yojson = string_to_yojson

let replica_status_description_to_yojson = string_to_yojson

let replica_status_percent_progress_to_yojson = string_to_yojson

let kms_master_key_id_to_yojson = string_to_yojson

let provisioned_throughput_override_to_yojson = 
  fun (x: provisioned_throughput_override) -> assoc_to_yojson(
    [(
         "ReadCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.read_capacity_units));
       
  ])

let on_demand_throughput_override_to_yojson = 
  fun (x: on_demand_throughput_override) -> assoc_to_yojson(
    [(
         "MaxReadRequestUnits",
         (option_to_yojson long_object_to_yojson x.max_read_request_units));
       
  ])

let replica_global_secondary_index_description_to_yojson = 
  fun (x: replica_global_secondary_index_description) -> assoc_to_yojson(
    [(
         "OnDemandThroughputOverride",
         (option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override));
       (
         "ProvisionedThroughputOverride",
         (option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       
  ])

let replica_global_secondary_index_description_list_to_yojson = 
  fun tree -> list_to_yojson replica_global_secondary_index_description_to_yojson tree

let table_class_to_yojson = 
  fun (x: table_class) -> match x with 
 
| STANDARD_INFREQUENT_ACCESS -> `String "STANDARD_INFREQUENT_ACCESS"
  | STANDARD -> `String "STANDARD"
   

let table_class_summary_to_yojson = 
  fun (x: table_class_summary) -> assoc_to_yojson(
    [(
         "LastUpdateDateTime",
         (option_to_yojson date_to_yojson x.last_update_date_time));
       (
         "TableClass",
         (option_to_yojson table_class_to_yojson x.table_class));
       
  ])

let replica_description_to_yojson = 
  fun (x: replica_description) -> assoc_to_yojson(
    [(
         "ReplicaTableClassSummary",
         (option_to_yojson table_class_summary_to_yojson x.replica_table_class_summary));
       (
         "ReplicaInaccessibleDateTime",
         (option_to_yojson date_to_yojson x.replica_inaccessible_date_time));
       (
         "GlobalSecondaryIndexes",
         (option_to_yojson replica_global_secondary_index_description_list_to_yojson x.global_secondary_indexes));
       (
         "OnDemandThroughputOverride",
         (option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override));
       (
         "ProvisionedThroughputOverride",
         (option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override));
       (
         "KMSMasterKeyId",
         (option_to_yojson kms_master_key_id_to_yojson x.kms_master_key_id));
       (
         "ReplicaStatusPercentProgress",
         (option_to_yojson replica_status_percent_progress_to_yojson x.replica_status_percent_progress));
       (
         "ReplicaStatusDescription",
         (option_to_yojson replica_status_description_to_yojson x.replica_status_description));
       (
         "ReplicaStatus",
         (option_to_yojson replica_status_to_yojson x.replica_status));
       (
         "RegionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       
  ])

let replica_description_list_to_yojson = 
  fun tree -> list_to_yojson replica_description_to_yojson tree

let backup_arn_to_yojson = string_to_yojson

let restore_in_progress_to_yojson = bool_to_yojson

let restore_summary_to_yojson = 
  fun (x: restore_summary) -> assoc_to_yojson(
    [(
         "RestoreInProgress",
         (Some (restore_in_progress_to_yojson x.restore_in_progress)));
       (
         "RestoreDateTime",
         (Some (date_to_yojson x.restore_date_time)));
       (
         "SourceTableArn",
         (option_to_yojson table_arn_to_yojson x.source_table_arn));
       (
         "SourceBackupArn",
         (option_to_yojson backup_arn_to_yojson x.source_backup_arn));
       
  ])

let sse_status_to_yojson = 
  fun (x: sse_status) -> match x with 
 
| UPDATING -> `String "UPDATING"
  | DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"
   

let sse_type_to_yojson = 
  fun (x: sse_type) -> match x with 
  | KMS -> `String "KMS"
    | AES256 -> `String "AES256"
     

let kms_master_key_arn_to_yojson = string_to_yojson

let sse_description_to_yojson = 
  fun (x: sse_description) -> assoc_to_yojson(
    [(
         "InaccessibleEncryptionDateTime",
         (option_to_yojson date_to_yojson x.inaccessible_encryption_date_time));
       (
         "KMSMasterKeyArn",
         (option_to_yojson kms_master_key_arn_to_yojson x.kms_master_key_arn));
       (
         "SSEType",
         (option_to_yojson sse_type_to_yojson x.sse_type));
       (
         "Status",
         (option_to_yojson sse_status_to_yojson x.status));
       
  ])

let archival_reason_to_yojson = string_to_yojson

let archival_summary_to_yojson = 
  fun (x: archival_summary) -> assoc_to_yojson(
    [(
         "ArchivalBackupArn",
         (option_to_yojson backup_arn_to_yojson x.archival_backup_arn));
       (
         "ArchivalReason",
         (option_to_yojson archival_reason_to_yojson x.archival_reason));
       (
         "ArchivalDateTime",
         (option_to_yojson date_to_yojson x.archival_date_time));
       
  ])

let deletion_protection_enabled_to_yojson = bool_to_yojson

let table_description_to_yojson = 
  fun (x: table_description) -> assoc_to_yojson(
    [(
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "DeletionProtectionEnabled",
         (option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled));
       (
         "TableClassSummary",
         (option_to_yojson table_class_summary_to_yojson x.table_class_summary));
       (
         "ArchivalSummary",
         (option_to_yojson archival_summary_to_yojson x.archival_summary));
       (
         "SSEDescription",
         (option_to_yojson sse_description_to_yojson x.sse_description));
       (
         "RestoreSummary",
         (option_to_yojson restore_summary_to_yojson x.restore_summary));
       (
         "Replicas",
         (option_to_yojson replica_description_list_to_yojson x.replicas));
       (
         "GlobalTableVersion",
         (option_to_yojson string__to_yojson x.global_table_version));
       (
         "LatestStreamArn",
         (option_to_yojson stream_arn_to_yojson x.latest_stream_arn));
       (
         "LatestStreamLabel",
         (option_to_yojson string__to_yojson x.latest_stream_label));
       (
         "StreamSpecification",
         (option_to_yojson stream_specification_to_yojson x.stream_specification));
       (
         "GlobalSecondaryIndexes",
         (option_to_yojson global_secondary_index_description_list_to_yojson x.global_secondary_indexes));
       (
         "LocalSecondaryIndexes",
         (option_to_yojson local_secondary_index_description_list_to_yojson x.local_secondary_indexes));
       (
         "BillingModeSummary",
         (option_to_yojson billing_mode_summary_to_yojson x.billing_mode_summary));
       (
         "TableId",
         (option_to_yojson table_id_to_yojson x.table_id));
       (
         "TableArn",
         (option_to_yojson string__to_yojson x.table_arn));
       (
         "ItemCount",
         (option_to_yojson long_object_to_yojson x.item_count));
       (
         "TableSizeBytes",
         (option_to_yojson long_object_to_yojson x.table_size_bytes));
       (
         "ProvisionedThroughput",
         (option_to_yojson provisioned_throughput_description_to_yojson x.provisioned_throughput));
       (
         "CreationDateTime",
         (option_to_yojson date_to_yojson x.creation_date_time));
       (
         "TableStatus",
         (option_to_yojson table_status_to_yojson x.table_status));
       (
         "KeySchema",
         (option_to_yojson key_schema_to_yojson x.key_schema));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       (
         "AttributeDefinitions",
         (option_to_yojson attribute_definitions_to_yojson x.attribute_definitions));
       
  ])

let update_table_output_to_yojson = 
  fun (x: update_table_output) -> assoc_to_yojson(
    [(
         "TableDescription",
         (option_to_yojson table_description_to_yojson x.table_description));
       
  ])

let provisioned_throughput_to_yojson = 
  fun (x: provisioned_throughput) -> assoc_to_yojson(
    [(
         "WriteCapacityUnits",
         (Some (positive_long_object_to_yojson x.write_capacity_units)));
       (
         "ReadCapacityUnits",
         (Some (positive_long_object_to_yojson x.read_capacity_units)));
       
  ])

let update_global_secondary_index_action_to_yojson = 
  fun (x: update_global_secondary_index_action) -> assoc_to_yojson(
    [(
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "ProvisionedThroughput",
         (option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput));
       (
         "IndexName",
         (Some (index_name_to_yojson x.index_name)));
       
  ])

let create_global_secondary_index_action_to_yojson = 
  fun (x: create_global_secondary_index_action) -> assoc_to_yojson(
    [(
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "ProvisionedThroughput",
         (option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput));
       (
         "Projection",
         (Some (projection_to_yojson x.projection)));
       (
         "KeySchema",
         (Some (key_schema_to_yojson x.key_schema)));
       (
         "IndexName",
         (Some (index_name_to_yojson x.index_name)));
       
  ])

let delete_global_secondary_index_action_to_yojson = 
  fun (x: delete_global_secondary_index_action) -> assoc_to_yojson(
    [(
         "IndexName",
         (Some (index_name_to_yojson x.index_name)));
       
  ])

let global_secondary_index_update_to_yojson = 
  fun (x: global_secondary_index_update) -> assoc_to_yojson(
    [(
         "Delete",
         (option_to_yojson delete_global_secondary_index_action_to_yojson x.delete));
       (
         "Create",
         (option_to_yojson create_global_secondary_index_action_to_yojson x.create));
       (
         "Update",
         (option_to_yojson update_global_secondary_index_action_to_yojson x.update));
       
  ])

let global_secondary_index_update_list_to_yojson = 
  fun tree -> list_to_yojson global_secondary_index_update_to_yojson tree

let sse_enabled_to_yojson = bool_to_yojson

let sse_specification_to_yojson = 
  fun (x: sse_specification) -> assoc_to_yojson(
    [(
         "KMSMasterKeyId",
         (option_to_yojson kms_master_key_id_to_yojson x.kms_master_key_id));
       (
         "SSEType",
         (option_to_yojson sse_type_to_yojson x.sse_type));
       (
         "Enabled",
         (option_to_yojson sse_enabled_to_yojson x.enabled));
       
  ])

let replica_global_secondary_index_to_yojson = 
  fun (x: replica_global_secondary_index) -> assoc_to_yojson(
    [(
         "OnDemandThroughputOverride",
         (option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override));
       (
         "ProvisionedThroughputOverride",
         (option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override));
       (
         "IndexName",
         (Some (index_name_to_yojson x.index_name)));
       
  ])

let replica_global_secondary_index_list_to_yojson = 
  fun tree -> list_to_yojson replica_global_secondary_index_to_yojson tree

let create_replication_group_member_action_to_yojson = 
  fun (x: create_replication_group_member_action) -> assoc_to_yojson(
    [(
         "TableClassOverride",
         (option_to_yojson table_class_to_yojson x.table_class_override));
       (
         "GlobalSecondaryIndexes",
         (option_to_yojson replica_global_secondary_index_list_to_yojson x.global_secondary_indexes));
       (
         "OnDemandThroughputOverride",
         (option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override));
       (
         "ProvisionedThroughputOverride",
         (option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override));
       (
         "KMSMasterKeyId",
         (option_to_yojson kms_master_key_id_to_yojson x.kms_master_key_id));
       (
         "RegionName",
         (Some (region_name_to_yojson x.region_name)));
       
  ])

let update_replication_group_member_action_to_yojson = 
  fun (x: update_replication_group_member_action) -> assoc_to_yojson(
    [(
         "TableClassOverride",
         (option_to_yojson table_class_to_yojson x.table_class_override));
       (
         "GlobalSecondaryIndexes",
         (option_to_yojson replica_global_secondary_index_list_to_yojson x.global_secondary_indexes));
       (
         "OnDemandThroughputOverride",
         (option_to_yojson on_demand_throughput_override_to_yojson x.on_demand_throughput_override));
       (
         "ProvisionedThroughputOverride",
         (option_to_yojson provisioned_throughput_override_to_yojson x.provisioned_throughput_override));
       (
         "KMSMasterKeyId",
         (option_to_yojson kms_master_key_id_to_yojson x.kms_master_key_id));
       (
         "RegionName",
         (Some (region_name_to_yojson x.region_name)));
       
  ])

let delete_replication_group_member_action_to_yojson = 
  fun (x: delete_replication_group_member_action) -> assoc_to_yojson(
    [(
         "RegionName",
         (Some (region_name_to_yojson x.region_name)));
       
  ])

let replication_group_update_to_yojson = 
  fun (x: replication_group_update) -> assoc_to_yojson(
    [(
         "Delete",
         (option_to_yojson delete_replication_group_member_action_to_yojson x.delete));
       (
         "Update",
         (option_to_yojson update_replication_group_member_action_to_yojson x.update));
       (
         "Create",
         (option_to_yojson create_replication_group_member_action_to_yojson x.create));
       
  ])

let replication_group_update_list_to_yojson = 
  fun tree -> list_to_yojson replication_group_update_to_yojson tree

let update_table_input_to_yojson = 
  fun (x: update_table_input) -> assoc_to_yojson(
    [(
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "DeletionProtectionEnabled",
         (option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled));
       (
         "TableClass",
         (option_to_yojson table_class_to_yojson x.table_class));
       (
         "ReplicaUpdates",
         (option_to_yojson replication_group_update_list_to_yojson x.replica_updates));
       (
         "SSESpecification",
         (option_to_yojson sse_specification_to_yojson x.sse_specification));
       (
         "StreamSpecification",
         (option_to_yojson stream_specification_to_yojson x.stream_specification));
       (
         "GlobalSecondaryIndexUpdates",
         (option_to_yojson global_secondary_index_update_list_to_yojson x.global_secondary_index_updates));
       (
         "ProvisionedThroughput",
         (option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput));
       (
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       (
         "AttributeDefinitions",
         (option_to_yojson attribute_definitions_to_yojson x.attribute_definitions));
       
  ])

let destination_status_to_yojson = 
  fun (x: destination_status) -> match x with 
 
| UPDATING -> `String "UPDATING"
  | ENABLE_FAILED -> `String "ENABLE_FAILED"
  | DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"
  | ACTIVE -> `String "ACTIVE"
  | ENABLING -> `String "ENABLING"
   

let approximate_creation_date_time_precision_to_yojson = 
  fun (x: approximate_creation_date_time_precision) -> match x with 
 
| MICROSECOND -> `String "MICROSECOND"
  | MILLISECOND -> `String "MILLISECOND"
   

let update_kinesis_streaming_configuration_to_yojson = 
  fun (x: update_kinesis_streaming_configuration) -> assoc_to_yojson(
    [(
         "ApproximateCreationDateTimePrecision",
         (option_to_yojson approximate_creation_date_time_precision_to_yojson x.approximate_creation_date_time_precision));
       
  ])

let update_kinesis_streaming_destination_output_to_yojson = 
  fun (x: update_kinesis_streaming_destination_output) -> assoc_to_yojson(
    [(
         "UpdateKinesisStreamingConfiguration",
         (option_to_yojson update_kinesis_streaming_configuration_to_yojson x.update_kinesis_streaming_configuration));
       (
         "DestinationStatus",
         (option_to_yojson destination_status_to_yojson x.destination_status));
       (
         "StreamArn",
         (option_to_yojson stream_arn_to_yojson x.stream_arn));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       
  ])

let update_kinesis_streaming_destination_input_to_yojson = 
  fun (x: update_kinesis_streaming_destination_input) -> assoc_to_yojson(
    [(
         "UpdateKinesisStreamingConfiguration",
         (option_to_yojson update_kinesis_streaming_configuration_to_yojson x.update_kinesis_streaming_configuration));
       (
         "StreamArn",
         (Some (stream_arn_to_yojson x.stream_arn)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let attribute_map_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let consumed_capacity_units_to_yojson = double_to_yojson

let capacity_to_yojson = 
  fun (x: capacity) -> assoc_to_yojson(
    [(
         "CapacityUnits",
         (option_to_yojson consumed_capacity_units_to_yojson x.capacity_units));
       (
         "WriteCapacityUnits",
         (option_to_yojson consumed_capacity_units_to_yojson x.write_capacity_units));
       (
         "ReadCapacityUnits",
         (option_to_yojson consumed_capacity_units_to_yojson x.read_capacity_units));
       
  ])

let secondary_indexes_capacity_map_to_yojson = 
  fun tree -> map_to_yojson capacity_to_yojson tree

let consumed_capacity_to_yojson = 
  fun (x: consumed_capacity) -> assoc_to_yojson(
    [(
         "GlobalSecondaryIndexes",
         (option_to_yojson secondary_indexes_capacity_map_to_yojson x.global_secondary_indexes));
       (
         "LocalSecondaryIndexes",
         (option_to_yojson secondary_indexes_capacity_map_to_yojson x.local_secondary_indexes));
       (
         "Table",
         (option_to_yojson capacity_to_yojson x.table));
       (
         "WriteCapacityUnits",
         (option_to_yojson consumed_capacity_units_to_yojson x.write_capacity_units));
       (
         "ReadCapacityUnits",
         (option_to_yojson consumed_capacity_units_to_yojson x.read_capacity_units));
       (
         "CapacityUnits",
         (option_to_yojson consumed_capacity_units_to_yojson x.capacity_units));
       (
         "TableName",
         (option_to_yojson table_arn_to_yojson x.table_name));
       
  ])

let item_collection_key_attribute_map_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let item_collection_size_estimate_bound_to_yojson = double_to_yojson

let item_collection_size_estimate_range_to_yojson = 
  fun tree -> list_to_yojson item_collection_size_estimate_bound_to_yojson tree

let item_collection_metrics_to_yojson = 
  fun (x: item_collection_metrics) -> assoc_to_yojson(
    [(
         "SizeEstimateRangeGB",
         (option_to_yojson item_collection_size_estimate_range_to_yojson x.size_estimate_range_g_b));
       (
         "ItemCollectionKey",
         (option_to_yojson item_collection_key_attribute_map_to_yojson x.item_collection_key));
       
  ])

let update_item_output_to_yojson = 
  fun (x: update_item_output) -> assoc_to_yojson(
    [(
         "ItemCollectionMetrics",
         (option_to_yojson item_collection_metrics_to_yojson x.item_collection_metrics));
       (
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_to_yojson x.consumed_capacity));
       (
         "Attributes",
         (option_to_yojson attribute_map_to_yojson x.attributes));
       
  ])

let attribute_action_to_yojson = 
  fun (x: attribute_action) -> match x with 
  | DELETE -> `String "DELETE"
    | PUT -> `String "PUT"
    | ADD -> `String "ADD"
     

let attribute_value_update_to_yojson = 
  fun (x: attribute_value_update) -> assoc_to_yojson(
    [(
         "Action",
         (option_to_yojson attribute_action_to_yojson x.action));
       (
         "Value",
         (option_to_yojson attribute_value_to_yojson x.value));
       
  ])

let attribute_updates_to_yojson = 
  fun tree -> map_to_yojson attribute_value_update_to_yojson tree

let comparison_operator_to_yojson = 
  fun (x: comparison_operator) -> match x with 
 
| BEGINS_WITH -> `String "BEGINS_WITH"
  | NOT_CONTAINS -> `String "NOT_CONTAINS"
  | CONTAINS -> `String "CONTAINS"
  | NULL -> `String "NULL"
  | NOT_NULL -> `String "NOT_NULL"
  | BETWEEN -> `String "BETWEEN"
  | GT -> `String "GT"
  | GE -> `String "GE"
  | LT -> `String "LT"
  | LE -> `String "LE"
  | IN -> `String "IN"
  | NE -> `String "NE"
  | EQ -> `String "EQ"
   

let attribute_value_list_to_yojson = 
  fun tree -> list_to_yojson attribute_value_to_yojson tree

let expected_attribute_value_to_yojson = 
  fun (x: expected_attribute_value) -> assoc_to_yojson(
    [(
         "AttributeValueList",
         (option_to_yojson attribute_value_list_to_yojson x.attribute_value_list));
       (
         "ComparisonOperator",
         (option_to_yojson comparison_operator_to_yojson x.comparison_operator));
       (
         "Exists",
         (option_to_yojson boolean_object_to_yojson x.exists));
       (
         "Value",
         (option_to_yojson attribute_value_to_yojson x.value));
       
  ])

let expected_attribute_map_to_yojson = 
  fun tree -> map_to_yojson expected_attribute_value_to_yojson tree

let conditional_operator_to_yojson = 
  fun (x: conditional_operator) -> match x with 
  | OR -> `String "OR"
    | AND -> `String "AND"
     

let return_value_to_yojson = 
  fun (x: return_value) -> match x with 
 
| UPDATED_NEW -> `String "UPDATED_NEW"
  | ALL_NEW -> `String "ALL_NEW"
  | UPDATED_OLD -> `String "UPDATED_OLD"
  | ALL_OLD -> `String "ALL_OLD"
  | NONE -> `String "NONE"
   

let return_consumed_capacity_to_yojson = 
  fun (x: return_consumed_capacity) -> match x with 
 
| NONE -> `String "NONE"
  | TOTAL -> `String "TOTAL"
  | INDEXES -> `String "INDEXES"
   

let return_item_collection_metrics_to_yojson = 
  fun (x: return_item_collection_metrics) -> match x with 
  | NONE -> `String "NONE"
    | SIZE -> `String "SIZE"
     

let update_expression_to_yojson = string_to_yojson

let condition_expression_to_yojson = string_to_yojson

let expression_attribute_name_variable_to_yojson = string_to_yojson

let expression_attribute_name_map_to_yojson = 
  fun tree -> map_to_yojson attribute_name_to_yojson tree

let expression_attribute_value_variable_to_yojson = string_to_yojson

let expression_attribute_value_map_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let return_values_on_condition_check_failure_to_yojson = 
  fun (x: return_values_on_condition_check_failure) -> match x with 
  | NONE -> `String "NONE"
    | ALL_OLD -> `String "ALL_OLD"
     

let update_item_input_to_yojson = 
  fun (x: update_item_input) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "ExpressionAttributeValues",
         (option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values));
       (
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ConditionExpression",
         (option_to_yojson condition_expression_to_yojson x.condition_expression));
       (
         "UpdateExpression",
         (option_to_yojson update_expression_to_yojson x.update_expression));
       (
         "ReturnItemCollectionMetrics",
         (option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics));
       (
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "ReturnValues",
         (option_to_yojson return_value_to_yojson x.return_values));
       (
         "ConditionalOperator",
         (option_to_yojson conditional_operator_to_yojson x.conditional_operator));
       (
         "Expected",
         (option_to_yojson expected_attribute_map_to_yojson x.expected));
       (
         "AttributeUpdates",
         (option_to_yojson attribute_updates_to_yojson x.attribute_updates));
       (
         "Key",
         (Some (key_to_yojson x.key)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let transaction_conflict_exception_to_yojson = 
  fun (x: transaction_conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let request_limit_exceeded_to_yojson = 
  fun (x: request_limit_exceeded) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let provisioned_throughput_exceeded_exception_to_yojson = 
  fun (x: provisioned_throughput_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let item_collection_size_limit_exceeded_exception_to_yojson = 
  fun (x: item_collection_size_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let conditional_check_failed_exception_to_yojson = 
  fun (x: conditional_check_failed_exception) -> assoc_to_yojson(
    [(
         "Item",
         (option_to_yojson attribute_map_to_yojson x.item));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let replica_global_secondary_index_settings_description_to_yojson = 
  fun (x: replica_global_secondary_index_settings_description) -> assoc_to_yojson(
    [(
         "ProvisionedWriteCapacityAutoScalingSettings",
         (option_to_yojson auto_scaling_settings_description_to_yojson x.provisioned_write_capacity_auto_scaling_settings));
       (
         "ProvisionedWriteCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.provisioned_write_capacity_units));
       (
         "ProvisionedReadCapacityAutoScalingSettings",
         (option_to_yojson auto_scaling_settings_description_to_yojson x.provisioned_read_capacity_auto_scaling_settings));
       (
         "ProvisionedReadCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.provisioned_read_capacity_units));
       (
         "IndexStatus",
         (option_to_yojson index_status_to_yojson x.index_status));
       (
         "IndexName",
         (Some (index_name_to_yojson x.index_name)));
       
  ])

let replica_global_secondary_index_settings_description_list_to_yojson = 
  fun tree -> list_to_yojson replica_global_secondary_index_settings_description_to_yojson tree

let replica_settings_description_to_yojson = 
  fun (x: replica_settings_description) -> assoc_to_yojson(
    [(
         "ReplicaTableClassSummary",
         (option_to_yojson table_class_summary_to_yojson x.replica_table_class_summary));
       (
         "ReplicaGlobalSecondaryIndexSettings",
         (option_to_yojson replica_global_secondary_index_settings_description_list_to_yojson x.replica_global_secondary_index_settings));
       (
         "ReplicaProvisionedWriteCapacityAutoScalingSettings",
         (option_to_yojson auto_scaling_settings_description_to_yojson x.replica_provisioned_write_capacity_auto_scaling_settings));
       (
         "ReplicaProvisionedWriteCapacityUnits",
         (option_to_yojson non_negative_long_object_to_yojson x.replica_provisioned_write_capacity_units));
       (
         "ReplicaProvisionedReadCapacityAutoScalingSettings",
         (option_to_yojson auto_scaling_settings_description_to_yojson x.replica_provisioned_read_capacity_auto_scaling_settings));
       (
         "ReplicaProvisionedReadCapacityUnits",
         (option_to_yojson non_negative_long_object_to_yojson x.replica_provisioned_read_capacity_units));
       (
         "ReplicaBillingModeSummary",
         (option_to_yojson billing_mode_summary_to_yojson x.replica_billing_mode_summary));
       (
         "ReplicaStatus",
         (option_to_yojson replica_status_to_yojson x.replica_status));
       (
         "RegionName",
         (Some (region_name_to_yojson x.region_name)));
       
  ])

let replica_settings_description_list_to_yojson = 
  fun tree -> list_to_yojson replica_settings_description_to_yojson tree

let update_global_table_settings_output_to_yojson = 
  fun (x: update_global_table_settings_output) -> assoc_to_yojson(
    [(
         "ReplicaSettings",
         (option_to_yojson replica_settings_description_list_to_yojson x.replica_settings));
       (
         "GlobalTableName",
         (option_to_yojson table_name_to_yojson x.global_table_name));
       
  ])

let global_table_global_secondary_index_settings_update_to_yojson = 
  fun (x: global_table_global_secondary_index_settings_update) -> assoc_to_yojson(
    [(
         "ProvisionedWriteCapacityAutoScalingSettingsUpdate",
         (option_to_yojson auto_scaling_settings_update_to_yojson x.provisioned_write_capacity_auto_scaling_settings_update));
       (
         "ProvisionedWriteCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.provisioned_write_capacity_units));
       (
         "IndexName",
         (Some (index_name_to_yojson x.index_name)));
       
  ])

let global_table_global_secondary_index_settings_update_list_to_yojson = 
  fun tree -> list_to_yojson global_table_global_secondary_index_settings_update_to_yojson tree

let replica_global_secondary_index_settings_update_to_yojson = 
  fun (x: replica_global_secondary_index_settings_update) -> assoc_to_yojson(
    [(
         "ProvisionedReadCapacityAutoScalingSettingsUpdate",
         (option_to_yojson auto_scaling_settings_update_to_yojson x.provisioned_read_capacity_auto_scaling_settings_update));
       (
         "ProvisionedReadCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.provisioned_read_capacity_units));
       (
         "IndexName",
         (Some (index_name_to_yojson x.index_name)));
       
  ])

let replica_global_secondary_index_settings_update_list_to_yojson = 
  fun tree -> list_to_yojson replica_global_secondary_index_settings_update_to_yojson tree

let replica_settings_update_to_yojson = 
  fun (x: replica_settings_update) -> assoc_to_yojson(
    [(
         "ReplicaTableClass",
         (option_to_yojson table_class_to_yojson x.replica_table_class));
       (
         "ReplicaGlobalSecondaryIndexSettingsUpdate",
         (option_to_yojson replica_global_secondary_index_settings_update_list_to_yojson x.replica_global_secondary_index_settings_update));
       (
         "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate",
         (option_to_yojson auto_scaling_settings_update_to_yojson x.replica_provisioned_read_capacity_auto_scaling_settings_update));
       (
         "ReplicaProvisionedReadCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.replica_provisioned_read_capacity_units));
       (
         "RegionName",
         (Some (region_name_to_yojson x.region_name)));
       
  ])

let replica_settings_update_list_to_yojson = 
  fun tree -> list_to_yojson replica_settings_update_to_yojson tree

let update_global_table_settings_input_to_yojson = 
  fun (x: update_global_table_settings_input) -> assoc_to_yojson(
    [(
         "ReplicaSettingsUpdate",
         (option_to_yojson replica_settings_update_list_to_yojson x.replica_settings_update));
       (
         "GlobalTableGlobalSecondaryIndexSettingsUpdate",
         (option_to_yojson global_table_global_secondary_index_settings_update_list_to_yojson x.global_table_global_secondary_index_settings_update));
       (
         "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate",
         (option_to_yojson auto_scaling_settings_update_to_yojson x.global_table_provisioned_write_capacity_auto_scaling_settings_update));
       (
         "GlobalTableProvisionedWriteCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.global_table_provisioned_write_capacity_units));
       (
         "GlobalTableBillingMode",
         (option_to_yojson billing_mode_to_yojson x.global_table_billing_mode));
       (
         "GlobalTableName",
         (Some (table_name_to_yojson x.global_table_name)));
       
  ])

let replica_not_found_exception_to_yojson = 
  fun (x: replica_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let index_not_found_exception_to_yojson = 
  fun (x: index_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let global_table_not_found_exception_to_yojson = 
  fun (x: global_table_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let global_table_arn_string_to_yojson = string_to_yojson

let global_table_status_to_yojson = 
  fun (x: global_table_status) -> match x with 
 
| UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
   

let global_table_description_to_yojson = 
  fun (x: global_table_description) -> assoc_to_yojson(
    [(
         "GlobalTableName",
         (option_to_yojson table_name_to_yojson x.global_table_name));
       (
         "GlobalTableStatus",
         (option_to_yojson global_table_status_to_yojson x.global_table_status));
       (
         "CreationDateTime",
         (option_to_yojson date_to_yojson x.creation_date_time));
       (
         "GlobalTableArn",
         (option_to_yojson global_table_arn_string_to_yojson x.global_table_arn));
       (
         "ReplicationGroup",
         (option_to_yojson replica_description_list_to_yojson x.replication_group));
       
  ])

let update_global_table_output_to_yojson = 
  fun (x: update_global_table_output) -> assoc_to_yojson(
    [(
         "GlobalTableDescription",
         (option_to_yojson global_table_description_to_yojson x.global_table_description));
       
  ])

let create_replica_action_to_yojson = 
  fun (x: create_replica_action) -> assoc_to_yojson(
    [(
         "RegionName",
         (Some (region_name_to_yojson x.region_name)));
       
  ])

let delete_replica_action_to_yojson = 
  fun (x: delete_replica_action) -> assoc_to_yojson(
    [(
         "RegionName",
         (Some (region_name_to_yojson x.region_name)));
       
  ])

let replica_update_to_yojson = 
  fun (x: replica_update) -> assoc_to_yojson(
    [(
         "Delete",
         (option_to_yojson delete_replica_action_to_yojson x.delete));
       (
         "Create",
         (option_to_yojson create_replica_action_to_yojson x.create));
       
  ])

let replica_update_list_to_yojson = 
  fun tree -> list_to_yojson replica_update_to_yojson tree

let update_global_table_input_to_yojson = 
  fun (x: update_global_table_input) -> assoc_to_yojson(
    [(
         "ReplicaUpdates",
         (Some (replica_update_list_to_yojson x.replica_updates)));
       (
         "GlobalTableName",
         (Some (table_name_to_yojson x.global_table_name)));
       
  ])

let table_not_found_exception_to_yojson = 
  fun (x: table_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let replica_already_exists_exception_to_yojson = 
  fun (x: replica_already_exists_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let contributor_insights_status_to_yojson = 
  fun (x: contributor_insights_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"
   

let update_contributor_insights_output_to_yojson = 
  fun (x: update_contributor_insights_output) -> assoc_to_yojson(
    [(
         "ContributorInsightsStatus",
         (option_to_yojson contributor_insights_status_to_yojson x.contributor_insights_status));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       
  ])

let contributor_insights_action_to_yojson = 
  fun (x: contributor_insights_action) -> match x with 
  | DISABLE -> `String "DISABLE"
    | ENABLE -> `String "ENABLE"
     

let update_contributor_insights_input_to_yojson = 
  fun (x: update_contributor_insights_input) -> assoc_to_yojson(
    [(
         "ContributorInsightsAction",
         (Some (contributor_insights_action_to_yojson x.contributor_insights_action)));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let continuous_backups_status_to_yojson = 
  fun (x: continuous_backups_status) -> match x with 
  | DISABLED -> `String "DISABLED"
    | ENABLED -> `String "ENABLED"
     

let point_in_time_recovery_status_to_yojson = 
  fun (x: point_in_time_recovery_status) -> match x with 
  | DISABLED -> `String "DISABLED"
    | ENABLED -> `String "ENABLED"
     

let point_in_time_recovery_description_to_yojson = 
  fun (x: point_in_time_recovery_description) -> assoc_to_yojson(
    [(
         "LatestRestorableDateTime",
         (option_to_yojson date_to_yojson x.latest_restorable_date_time));
       (
         "EarliestRestorableDateTime",
         (option_to_yojson date_to_yojson x.earliest_restorable_date_time));
       (
         "PointInTimeRecoveryStatus",
         (option_to_yojson point_in_time_recovery_status_to_yojson x.point_in_time_recovery_status));
       
  ])

let continuous_backups_description_to_yojson = 
  fun (x: continuous_backups_description) -> assoc_to_yojson(
    [(
         "PointInTimeRecoveryDescription",
         (option_to_yojson point_in_time_recovery_description_to_yojson x.point_in_time_recovery_description));
       (
         "ContinuousBackupsStatus",
         (Some (continuous_backups_status_to_yojson x.continuous_backups_status)));
       
  ])

let update_continuous_backups_output_to_yojson = 
  fun (x: update_continuous_backups_output) -> assoc_to_yojson(
    [(
         "ContinuousBackupsDescription",
         (option_to_yojson continuous_backups_description_to_yojson x.continuous_backups_description));
       
  ])

let point_in_time_recovery_specification_to_yojson = 
  fun (x: point_in_time_recovery_specification) -> assoc_to_yojson(
    [(
         "PointInTimeRecoveryEnabled",
         (Some (boolean_object_to_yojson x.point_in_time_recovery_enabled)));
       
  ])

let update_continuous_backups_input_to_yojson = 
  fun (x: update_continuous_backups_input) -> assoc_to_yojson(
    [(
         "PointInTimeRecoverySpecification",
         (Some (point_in_time_recovery_specification_to_yojson x.point_in_time_recovery_specification)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let continuous_backups_unavailable_exception_to_yojson = 
  fun (x: continuous_backups_unavailable_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let update_to_yojson = 
  fun (x: update) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "ExpressionAttributeValues",
         (option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values));
       (
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ConditionExpression",
         (option_to_yojson condition_expression_to_yojson x.condition_expression));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       (
         "UpdateExpression",
         (Some (update_expression_to_yojson x.update_expression)));
       (
         "Key",
         (Some (key_to_yojson x.key)));
       
  ])

let resource_arn_string_to_yojson = string_to_yojson

let tag_key_string_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_string_to_yojson tree

let untag_resource_input_to_yojson = 
  fun (x: untag_resource_input) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceArn",
         (Some (resource_arn_string_to_yojson x.resource_arn)));
       
  ])

let transaction_in_progress_exception_to_yojson = 
  fun (x: transaction_in_progress_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let code_to_yojson = string_to_yojson

let cancellation_reason_to_yojson = 
  fun (x: cancellation_reason) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       (
         "Code",
         (option_to_yojson code_to_yojson x.code));
       (
         "Item",
         (option_to_yojson attribute_map_to_yojson x.item));
       
  ])

let cancellation_reason_list_to_yojson = 
  fun tree -> list_to_yojson cancellation_reason_to_yojson tree

let transaction_canceled_exception_to_yojson = 
  fun (x: transaction_canceled_exception) -> assoc_to_yojson(
    [(
         "CancellationReasons",
         (option_to_yojson cancellation_reason_list_to_yojson x.cancellation_reasons));
       (
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let consumed_capacity_multiple_to_yojson = 
  fun tree -> list_to_yojson consumed_capacity_to_yojson tree

let item_collection_metrics_multiple_to_yojson = 
  fun tree -> list_to_yojson item_collection_metrics_to_yojson tree

let item_collection_metrics_per_table_to_yojson = 
  fun tree -> map_to_yojson item_collection_metrics_multiple_to_yojson tree

let transact_write_items_output_to_yojson = 
  fun (x: transact_write_items_output) -> assoc_to_yojson(
    [(
         "ItemCollectionMetrics",
         (option_to_yojson item_collection_metrics_per_table_to_yojson x.item_collection_metrics));
       (
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity));
       
  ])

let condition_check_to_yojson = 
  fun (x: condition_check) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "ExpressionAttributeValues",
         (option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values));
       (
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ConditionExpression",
         (Some (condition_expression_to_yojson x.condition_expression)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       (
         "Key",
         (Some (key_to_yojson x.key)));
       
  ])

let put_to_yojson = 
  fun (x: put) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "ExpressionAttributeValues",
         (option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values));
       (
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ConditionExpression",
         (option_to_yojson condition_expression_to_yojson x.condition_expression));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       (
         "Item",
         (Some (put_item_input_attribute_map_to_yojson x.item)));
       
  ])

let delete_to_yojson = 
  fun (x: delete) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "ExpressionAttributeValues",
         (option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values));
       (
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ConditionExpression",
         (option_to_yojson condition_expression_to_yojson x.condition_expression));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       (
         "Key",
         (Some (key_to_yojson x.key)));
       
  ])

let transact_write_item_to_yojson = 
  fun (x: transact_write_item) -> assoc_to_yojson(
    [(
         "Update",
         (option_to_yojson update_to_yojson x.update));
       (
         "Delete",
         (option_to_yojson delete_to_yojson x.delete));
       (
         "Put",
         (option_to_yojson put_to_yojson x.put));
       (
         "ConditionCheck",
         (option_to_yojson condition_check_to_yojson x.condition_check));
       
  ])

let transact_write_item_list_to_yojson = 
  fun tree -> list_to_yojson transact_write_item_to_yojson tree

let client_request_token_to_yojson = string_to_yojson

let transact_write_items_input_to_yojson = 
  fun (x: transact_write_items_input) -> assoc_to_yojson(
    [(
         "ClientRequestToken",
         (option_to_yojson client_request_token_to_yojson x.client_request_token));
       (
         "ReturnItemCollectionMetrics",
         (option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics));
       (
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "TransactItems",
         (Some (transact_write_item_list_to_yojson x.transact_items)));
       
  ])

let idempotent_parameter_mismatch_exception_to_yojson = 
  fun (x: idempotent_parameter_mismatch_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let item_response_to_yojson = 
  fun (x: item_response) -> assoc_to_yojson(
    [(
         "Item",
         (option_to_yojson attribute_map_to_yojson x.item));
       
  ])

let item_response_list_to_yojson = 
  fun tree -> list_to_yojson item_response_to_yojson tree

let transact_get_items_output_to_yojson = 
  fun (x: transact_get_items_output) -> assoc_to_yojson(
    [(
         "Responses",
         (option_to_yojson item_response_list_to_yojson x.responses));
       (
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity));
       
  ])

let projection_expression_to_yojson = string_to_yojson

let get_to_yojson = 
  fun (x: get) -> assoc_to_yojson(
    [(
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ProjectionExpression",
         (option_to_yojson projection_expression_to_yojson x.projection_expression));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       (
         "Key",
         (Some (key_to_yojson x.key)));
       
  ])

let transact_get_item_to_yojson = 
  fun (x: transact_get_item) -> assoc_to_yojson(
    [(
         "Get",
         (Some (get_to_yojson x.get)));
       
  ])

let transact_get_item_list_to_yojson = 
  fun tree -> list_to_yojson transact_get_item_to_yojson tree

let transact_get_items_input_to_yojson = 
  fun (x: transact_get_items_input) -> assoc_to_yojson(
    [(
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "TransactItems",
         (Some (transact_get_item_list_to_yojson x.transact_items)));
       
  ])

let time_to_live_status_to_yojson = 
  fun (x: time_to_live_status) -> match x with 
 
| DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
  | DISABLING -> `String "DISABLING"
  | ENABLING -> `String "ENABLING"
   

let time_to_live_description_to_yojson = 
  fun (x: time_to_live_description) -> assoc_to_yojson(
    [(
         "AttributeName",
         (option_to_yojson time_to_live_attribute_name_to_yojson x.attribute_name));
       (
         "TimeToLiveStatus",
         (option_to_yojson time_to_live_status_to_yojson x.time_to_live_status));
       
  ])

let time_range_upper_bound_to_yojson = timestamp_to_yojson

let time_range_lower_bound_to_yojson = timestamp_to_yojson

let tag_value_string_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (Some (tag_value_string_to_yojson x.value)));
       (
         "Key",
         (Some (tag_key_string_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson = 
  fun (x: tag_resource_input) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceArn",
         (Some (resource_arn_string_to_yojson x.resource_arn)));
       
  ])

let table_name_list_to_yojson = 
  fun tree -> list_to_yojson table_name_to_yojson tree

let table_in_use_exception_to_yojson = 
  fun (x: table_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let global_secondary_index_to_yojson = 
  fun (x: global_secondary_index) -> assoc_to_yojson(
    [(
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "ProvisionedThroughput",
         (option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput));
       (
         "Projection",
         (Some (projection_to_yojson x.projection)));
       (
         "KeySchema",
         (Some (key_schema_to_yojson x.key_schema)));
       (
         "IndexName",
         (Some (index_name_to_yojson x.index_name)));
       
  ])

let global_secondary_index_list_to_yojson = 
  fun tree -> list_to_yojson global_secondary_index_to_yojson tree

let table_creation_parameters_to_yojson = 
  fun (x: table_creation_parameters) -> assoc_to_yojson(
    [(
         "GlobalSecondaryIndexes",
         (option_to_yojson global_secondary_index_list_to_yojson x.global_secondary_indexes));
       (
         "SSESpecification",
         (option_to_yojson sse_specification_to_yojson x.sse_specification));
       (
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "ProvisionedThroughput",
         (option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput));
       (
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "KeySchema",
         (Some (key_schema_to_yojson x.key_schema)));
       (
         "AttributeDefinitions",
         (Some (attribute_definitions_to_yojson x.attribute_definitions)));
       (
         "TableName",
         (Some (table_name_to_yojson x.table_name)));
       
  ])

let table_creation_date_time_to_yojson = timestamp_to_yojson

let table_already_exists_exception_to_yojson = 
  fun (x: table_already_exists_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let local_secondary_index_info_to_yojson = 
  fun (x: local_secondary_index_info) -> assoc_to_yojson(
    [(
         "Projection",
         (option_to_yojson projection_to_yojson x.projection));
       (
         "KeySchema",
         (option_to_yojson key_schema_to_yojson x.key_schema));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       
  ])

let local_secondary_indexes_to_yojson = 
  fun tree -> list_to_yojson local_secondary_index_info_to_yojson tree

let global_secondary_index_info_to_yojson = 
  fun (x: global_secondary_index_info) -> assoc_to_yojson(
    [(
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "ProvisionedThroughput",
         (option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput));
       (
         "Projection",
         (option_to_yojson projection_to_yojson x.projection));
       (
         "KeySchema",
         (option_to_yojson key_schema_to_yojson x.key_schema));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       
  ])

let global_secondary_indexes_to_yojson = 
  fun tree -> list_to_yojson global_secondary_index_info_to_yojson tree

let source_table_feature_details_to_yojson = 
  fun (x: source_table_feature_details) -> assoc_to_yojson(
    [(
         "SSEDescription",
         (option_to_yojson sse_description_to_yojson x.sse_description));
       (
         "TimeToLiveDescription",
         (option_to_yojson time_to_live_description_to_yojson x.time_to_live_description));
       (
         "StreamDescription",
         (option_to_yojson stream_specification_to_yojson x.stream_description));
       (
         "GlobalSecondaryIndexes",
         (option_to_yojson global_secondary_indexes_to_yojson x.global_secondary_indexes));
       (
         "LocalSecondaryIndexes",
         (option_to_yojson local_secondary_indexes_to_yojson x.local_secondary_indexes));
       
  ])

let item_count_to_yojson = long_to_yojson

let source_table_details_to_yojson = 
  fun (x: source_table_details) -> assoc_to_yojson(
    [(
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "ItemCount",
         (option_to_yojson item_count_to_yojson x.item_count));
       (
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "ProvisionedThroughput",
         (Some (provisioned_throughput_to_yojson x.provisioned_throughput)));
       (
         "TableCreationDateTime",
         (Some (table_creation_date_time_to_yojson x.table_creation_date_time)));
       (
         "KeySchema",
         (Some (key_schema_to_yojson x.key_schema)));
       (
         "TableSizeBytes",
         (option_to_yojson long_object_to_yojson x.table_size_bytes));
       (
         "TableArn",
         (option_to_yojson table_arn_to_yojson x.table_arn));
       (
         "TableId",
         (Some (table_id_to_yojson x.table_id)));
       (
         "TableName",
         (Some (table_name_to_yojson x.table_name)));
       
  ])

let select_to_yojson = 
  fun (x: select) -> match x with 
 
| COUNT -> `String "COUNT"
  | SPECIFIC_ATTRIBUTES -> `String "SPECIFIC_ATTRIBUTES"
  | ALL_PROJECTED_ATTRIBUTES -> `String "ALL_PROJECTED_ATTRIBUTES"
  | ALL_ATTRIBUTES -> `String "ALL_ATTRIBUTES"
   

let scan_total_segments_to_yojson = int_to_yojson

let scan_segment_to_yojson = int_to_yojson

let item_list_to_yojson = 
  fun tree -> list_to_yojson attribute_map_to_yojson tree

let integer__to_yojson = int_to_yojson

let scan_output_to_yojson = 
  fun (x: scan_output) -> assoc_to_yojson(
    [(
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_to_yojson x.consumed_capacity));
       (
         "LastEvaluatedKey",
         (option_to_yojson key_to_yojson x.last_evaluated_key));
       (
         "ScannedCount",
         (option_to_yojson integer__to_yojson x.scanned_count));
       (
         "Count",
         (option_to_yojson integer__to_yojson x.count));
       (
         "Items",
         (option_to_yojson item_list_to_yojson x.items));
       
  ])

let attribute_name_list_to_yojson = 
  fun tree -> list_to_yojson attribute_name_to_yojson tree

let positive_integer_object_to_yojson = int_to_yojson

let condition_to_yojson = 
  fun (x: condition) -> assoc_to_yojson(
    [(
         "ComparisonOperator",
         (Some (comparison_operator_to_yojson x.comparison_operator)));
       (
         "AttributeValueList",
         (option_to_yojson attribute_value_list_to_yojson x.attribute_value_list));
       
  ])

let filter_condition_map_to_yojson = 
  fun tree -> map_to_yojson condition_to_yojson tree

let consistent_read_to_yojson = bool_to_yojson

let scan_input_to_yojson = 
  fun (x: scan_input) -> assoc_to_yojson(
    [(
         "ConsistentRead",
         (option_to_yojson consistent_read_to_yojson x.consistent_read));
       (
         "ExpressionAttributeValues",
         (option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values));
       (
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "FilterExpression",
         (option_to_yojson condition_expression_to_yojson x.filter_expression));
       (
         "ProjectionExpression",
         (option_to_yojson projection_expression_to_yojson x.projection_expression));
       (
         "Segment",
         (option_to_yojson scan_segment_to_yojson x.segment));
       (
         "TotalSegments",
         (option_to_yojson scan_total_segments_to_yojson x.total_segments));
       (
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "ExclusiveStartKey",
         (option_to_yojson key_to_yojson x.exclusive_start_key));
       (
         "ConditionalOperator",
         (option_to_yojson conditional_operator_to_yojson x.conditional_operator));
       (
         "ScanFilter",
         (option_to_yojson filter_condition_map_to_yojson x.scan_filter));
       (
         "Select",
         (option_to_yojson select_to_yojson x.select));
       (
         "Limit",
         (option_to_yojson positive_integer_object_to_yojson x.limit));
       (
         "AttributesToGet",
         (option_to_yojson attribute_name_list_to_yojson x.attributes_to_get));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let s3_sse_kms_key_id_to_yojson = string_to_yojson

let s3_sse_algorithm_to_yojson = 
  fun (x: s3_sse_algorithm) -> match x with 
  | KMS -> `String "KMS"
    | AES256 -> `String "AES256"
     

let s3_prefix_to_yojson = string_to_yojson

let s3_bucket_owner_to_yojson = string_to_yojson

let s3_bucket_to_yojson = string_to_yojson

let s3_bucket_source_to_yojson = 
  fun (x: s3_bucket_source) -> assoc_to_yojson(
    [(
         "S3KeyPrefix",
         (option_to_yojson s3_prefix_to_yojson x.s3_key_prefix));
       (
         "S3Bucket",
         (Some (s3_bucket_to_yojson x.s3_bucket)));
       (
         "S3BucketOwner",
         (option_to_yojson s3_bucket_owner_to_yojson x.s3_bucket_owner));
       
  ])

let restore_table_to_point_in_time_output_to_yojson = 
  fun (x: restore_table_to_point_in_time_output) -> assoc_to_yojson(
    [(
         "TableDescription",
         (option_to_yojson table_description_to_yojson x.table_description));
       
  ])

let local_secondary_index_to_yojson = 
  fun (x: local_secondary_index) -> assoc_to_yojson(
    [(
         "Projection",
         (Some (projection_to_yojson x.projection)));
       (
         "KeySchema",
         (Some (key_schema_to_yojson x.key_schema)));
       (
         "IndexName",
         (Some (index_name_to_yojson x.index_name)));
       
  ])

let local_secondary_index_list_to_yojson = 
  fun tree -> list_to_yojson local_secondary_index_to_yojson tree

let restore_table_to_point_in_time_input_to_yojson = 
  fun (x: restore_table_to_point_in_time_input) -> assoc_to_yojson(
    [(
         "SSESpecificationOverride",
         (option_to_yojson sse_specification_to_yojson x.sse_specification_override));
       (
         "OnDemandThroughputOverride",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput_override));
       (
         "ProvisionedThroughputOverride",
         (option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput_override));
       (
         "LocalSecondaryIndexOverride",
         (option_to_yojson local_secondary_index_list_to_yojson x.local_secondary_index_override));
       (
         "GlobalSecondaryIndexOverride",
         (option_to_yojson global_secondary_index_list_to_yojson x.global_secondary_index_override));
       (
         "BillingModeOverride",
         (option_to_yojson billing_mode_to_yojson x.billing_mode_override));
       (
         "RestoreDateTime",
         (option_to_yojson date_to_yojson x.restore_date_time));
       (
         "UseLatestRestorableTime",
         (option_to_yojson boolean_object_to_yojson x.use_latest_restorable_time));
       (
         "TargetTableName",
         (Some (table_name_to_yojson x.target_table_name)));
       (
         "SourceTableName",
         (option_to_yojson table_name_to_yojson x.source_table_name));
       (
         "SourceTableArn",
         (option_to_yojson table_arn_to_yojson x.source_table_arn));
       
  ])

let point_in_time_recovery_unavailable_exception_to_yojson = 
  fun (x: point_in_time_recovery_unavailable_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_restore_time_exception_to_yojson = 
  fun (x: invalid_restore_time_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let restore_table_from_backup_output_to_yojson = 
  fun (x: restore_table_from_backup_output) -> assoc_to_yojson(
    [(
         "TableDescription",
         (option_to_yojson table_description_to_yojson x.table_description));
       
  ])

let restore_table_from_backup_input_to_yojson = 
  fun (x: restore_table_from_backup_input) -> assoc_to_yojson(
    [(
         "SSESpecificationOverride",
         (option_to_yojson sse_specification_to_yojson x.sse_specification_override));
       (
         "OnDemandThroughputOverride",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput_override));
       (
         "ProvisionedThroughputOverride",
         (option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput_override));
       (
         "LocalSecondaryIndexOverride",
         (option_to_yojson local_secondary_index_list_to_yojson x.local_secondary_index_override));
       (
         "GlobalSecondaryIndexOverride",
         (option_to_yojson global_secondary_index_list_to_yojson x.global_secondary_index_override));
       (
         "BillingModeOverride",
         (option_to_yojson billing_mode_to_yojson x.billing_mode_override));
       (
         "BackupArn",
         (Some (backup_arn_to_yojson x.backup_arn)));
       (
         "TargetTableName",
         (Some (table_name_to_yojson x.target_table_name)));
       
  ])

let backup_not_found_exception_to_yojson = 
  fun (x: backup_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let backup_in_use_exception_to_yojson = 
  fun (x: backup_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_policy_to_yojson = string_to_yojson

let replica_to_yojson = 
  fun (x: replica) -> assoc_to_yojson(
    [(
         "RegionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       
  ])

let replica_list_to_yojson = 
  fun tree -> list_to_yojson replica_to_yojson tree

let query_output_to_yojson = 
  fun (x: query_output) -> assoc_to_yojson(
    [(
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_to_yojson x.consumed_capacity));
       (
         "LastEvaluatedKey",
         (option_to_yojson key_to_yojson x.last_evaluated_key));
       (
         "ScannedCount",
         (option_to_yojson integer__to_yojson x.scanned_count));
       (
         "Count",
         (option_to_yojson integer__to_yojson x.count));
       (
         "Items",
         (option_to_yojson item_list_to_yojson x.items));
       
  ])

let key_conditions_to_yojson = 
  fun tree -> map_to_yojson condition_to_yojson tree

let key_expression_to_yojson = string_to_yojson

let query_input_to_yojson = 
  fun (x: query_input) -> assoc_to_yojson(
    [(
         "ExpressionAttributeValues",
         (option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values));
       (
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "KeyConditionExpression",
         (option_to_yojson key_expression_to_yojson x.key_condition_expression));
       (
         "FilterExpression",
         (option_to_yojson condition_expression_to_yojson x.filter_expression));
       (
         "ProjectionExpression",
         (option_to_yojson projection_expression_to_yojson x.projection_expression));
       (
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "ExclusiveStartKey",
         (option_to_yojson key_to_yojson x.exclusive_start_key));
       (
         "ScanIndexForward",
         (option_to_yojson boolean_object_to_yojson x.scan_index_forward));
       (
         "ConditionalOperator",
         (option_to_yojson conditional_operator_to_yojson x.conditional_operator));
       (
         "QueryFilter",
         (option_to_yojson filter_condition_map_to_yojson x.query_filter));
       (
         "KeyConditions",
         (option_to_yojson key_conditions_to_yojson x.key_conditions));
       (
         "ConsistentRead",
         (option_to_yojson consistent_read_to_yojson x.consistent_read));
       (
         "Limit",
         (option_to_yojson positive_integer_object_to_yojson x.limit));
       (
         "AttributesToGet",
         (option_to_yojson attribute_name_list_to_yojson x.attributes_to_get));
       (
         "Select",
         (option_to_yojson select_to_yojson x.select));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let policy_revision_id_to_yojson = string_to_yojson

let put_resource_policy_output_to_yojson = 
  fun (x: put_resource_policy_output) -> assoc_to_yojson(
    [(
         "RevisionId",
         (option_to_yojson policy_revision_id_to_yojson x.revision_id));
       
  ])

let confirm_remove_self_resource_access_to_yojson = bool_to_yojson

let put_resource_policy_input_to_yojson = 
  fun (x: put_resource_policy_input) -> assoc_to_yojson(
    [(
         "ConfirmRemoveSelfResourceAccess",
         (option_to_yojson confirm_remove_self_resource_access_to_yojson x.confirm_remove_self_resource_access));
       (
         "ExpectedRevisionId",
         (option_to_yojson policy_revision_id_to_yojson x.expected_revision_id));
       (
         "Policy",
         (Some (resource_policy_to_yojson x.policy)));
       (
         "ResourceArn",
         (Some (resource_arn_string_to_yojson x.resource_arn)));
       
  ])

let policy_not_found_exception_to_yojson = 
  fun (x: policy_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let put_item_output_to_yojson = 
  fun (x: put_item_output) -> assoc_to_yojson(
    [(
         "ItemCollectionMetrics",
         (option_to_yojson item_collection_metrics_to_yojson x.item_collection_metrics));
       (
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_to_yojson x.consumed_capacity));
       (
         "Attributes",
         (option_to_yojson attribute_map_to_yojson x.attributes));
       
  ])

let put_item_input_to_yojson = 
  fun (x: put_item_input) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "ExpressionAttributeValues",
         (option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values));
       (
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ConditionExpression",
         (option_to_yojson condition_expression_to_yojson x.condition_expression));
       (
         "ConditionalOperator",
         (option_to_yojson conditional_operator_to_yojson x.conditional_operator));
       (
         "ReturnItemCollectionMetrics",
         (option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics));
       (
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "ReturnValues",
         (option_to_yojson return_value_to_yojson x.return_values));
       (
         "Expected",
         (option_to_yojson expected_attribute_map_to_yojson x.expected));
       (
         "Item",
         (Some (put_item_input_attribute_map_to_yojson x.item)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let processed_item_count_to_yojson = long_to_yojson

let prepared_statement_parameters_to_yojson = 
  fun tree -> list_to_yojson attribute_value_to_yojson tree

let parti_ql_statement_to_yojson = string_to_yojson

let parti_ql_next_token_to_yojson = string_to_yojson

let batch_statement_error_code_enum_to_yojson = 
  fun (x: batch_statement_error_code_enum) -> match x with 
 
| DuplicateItem -> `String "DuplicateItem"
  | AccessDenied -> `String "AccessDenied"
  | ResourceNotFound -> `String "ResourceNotFound"
  | InternalServerError -> `String "InternalServerError"
  | ThrottlingError -> `String "ThrottlingError"
  | TransactionConflict -> `String "TransactionConflict"
  | ProvisionedThroughputExceeded -> `String "ProvisionedThroughputExceeded"
  | ValidationError -> `String "ValidationError"
  | RequestLimitExceeded -> `String "RequestLimitExceeded"
  | ItemCollectionSizeLimitExceeded -> `String "ItemCollectionSizeLimitExceeded"
  | ConditionalCheckFailed -> `String "ConditionalCheckFailed"
   

let batch_statement_error_to_yojson = 
  fun (x: batch_statement_error) -> assoc_to_yojson(
    [(
         "Item",
         (option_to_yojson attribute_map_to_yojson x.item));
       (
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "Code",
         (option_to_yojson batch_statement_error_code_enum_to_yojson x.code));
       
  ])

let batch_statement_response_to_yojson = 
  fun (x: batch_statement_response) -> assoc_to_yojson(
    [(
         "Item",
         (option_to_yojson attribute_map_to_yojson x.item));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       (
         "Error",
         (option_to_yojson batch_statement_error_to_yojson x.error));
       
  ])

let parti_ql_batch_response_to_yojson = 
  fun tree -> list_to_yojson batch_statement_response_to_yojson tree

let batch_statement_request_to_yojson = 
  fun (x: batch_statement_request) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "ConsistentRead",
         (option_to_yojson consistent_read_to_yojson x.consistent_read));
       (
         "Parameters",
         (option_to_yojson prepared_statement_parameters_to_yojson x.parameters));
       (
         "Statement",
         (Some (parti_ql_statement_to_yojson x.statement)));
       
  ])

let parti_ql_batch_request_to_yojson = 
  fun tree -> list_to_yojson batch_statement_request_to_yojson tree

let parameterized_statement_to_yojson = 
  fun (x: parameterized_statement) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "Parameters",
         (option_to_yojson prepared_statement_parameters_to_yojson x.parameters));
       (
         "Statement",
         (Some (parti_ql_statement_to_yojson x.statement)));
       
  ])

let parameterized_statements_to_yojson = 
  fun tree -> list_to_yojson parameterized_statement_to_yojson tree

let next_token_string_to_yojson = string_to_yojson

let long_to_yojson = long_to_yojson

let list_tags_of_resource_output_to_yojson = 
  fun (x: list_tags_of_resource_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_string_to_yojson x.next_token));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_of_resource_input_to_yojson = 
  fun (x: list_tags_of_resource_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_string_to_yojson x.next_token));
       (
         "ResourceArn",
         (Some (resource_arn_string_to_yojson x.resource_arn)));
       
  ])

let list_tables_output_to_yojson = 
  fun (x: list_tables_output) -> assoc_to_yojson(
    [(
         "LastEvaluatedTableName",
         (option_to_yojson table_name_to_yojson x.last_evaluated_table_name));
       (
         "TableNames",
         (option_to_yojson table_name_list_to_yojson x.table_names));
       
  ])

let list_tables_input_limit_to_yojson = int_to_yojson

let list_tables_input_to_yojson = 
  fun (x: list_tables_input) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson list_tables_input_limit_to_yojson x.limit));
       (
         "ExclusiveStartTableName",
         (option_to_yojson table_name_to_yojson x.exclusive_start_table_name));
       
  ])

let import_arn_to_yojson = string_to_yojson

let import_status_to_yojson = 
  fun (x: import_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | CANCELLED -> `String "CANCELLED"
  | CANCELLING -> `String "CANCELLING"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
   

let cloud_watch_log_group_arn_to_yojson = string_to_yojson

let input_format_to_yojson = 
  fun (x: input_format) -> match x with 
 
| CSV -> `String "CSV"
  | ION -> `String "ION"
  | DYNAMODB_JSON -> `String "DYNAMODB_JSON"
   

let import_start_time_to_yojson = timestamp_to_yojson

let import_end_time_to_yojson = timestamp_to_yojson

let import_summary_to_yojson = 
  fun (x: import_summary) -> assoc_to_yojson(
    [(
         "EndTime",
         (option_to_yojson import_end_time_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson import_start_time_to_yojson x.start_time));
       (
         "InputFormat",
         (option_to_yojson input_format_to_yojson x.input_format));
       (
         "CloudWatchLogGroupArn",
         (option_to_yojson cloud_watch_log_group_arn_to_yojson x.cloud_watch_log_group_arn));
       (
         "S3BucketSource",
         (option_to_yojson s3_bucket_source_to_yojson x.s3_bucket_source));
       (
         "TableArn",
         (option_to_yojson table_arn_to_yojson x.table_arn));
       (
         "ImportStatus",
         (option_to_yojson import_status_to_yojson x.import_status));
       (
         "ImportArn",
         (option_to_yojson import_arn_to_yojson x.import_arn));
       
  ])

let import_summary_list_to_yojson = 
  fun tree -> list_to_yojson import_summary_to_yojson tree

let import_next_token_to_yojson = string_to_yojson

let list_imports_output_to_yojson = 
  fun (x: list_imports_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson import_next_token_to_yojson x.next_token));
       (
         "ImportSummaryList",
         (option_to_yojson import_summary_list_to_yojson x.import_summary_list));
       
  ])

let list_imports_max_limit_to_yojson = int_to_yojson

let list_imports_input_to_yojson = 
  fun (x: list_imports_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson import_next_token_to_yojson x.next_token));
       (
         "PageSize",
         (option_to_yojson list_imports_max_limit_to_yojson x.page_size));
       (
         "TableArn",
         (option_to_yojson table_arn_to_yojson x.table_arn));
       
  ])

let global_table_to_yojson = 
  fun (x: global_table) -> assoc_to_yojson(
    [(
         "ReplicationGroup",
         (option_to_yojson replica_list_to_yojson x.replication_group));
       (
         "GlobalTableName",
         (option_to_yojson table_name_to_yojson x.global_table_name));
       
  ])

let global_table_list_to_yojson = 
  fun tree -> list_to_yojson global_table_to_yojson tree

let list_global_tables_output_to_yojson = 
  fun (x: list_global_tables_output) -> assoc_to_yojson(
    [(
         "LastEvaluatedGlobalTableName",
         (option_to_yojson table_name_to_yojson x.last_evaluated_global_table_name));
       (
         "GlobalTables",
         (option_to_yojson global_table_list_to_yojson x.global_tables));
       
  ])

let list_global_tables_input_to_yojson = 
  fun (x: list_global_tables_input) -> assoc_to_yojson(
    [(
         "RegionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       (
         "Limit",
         (option_to_yojson positive_integer_object_to_yojson x.limit));
       (
         "ExclusiveStartGlobalTableName",
         (option_to_yojson table_name_to_yojson x.exclusive_start_global_table_name));
       
  ])

let export_arn_to_yojson = string_to_yojson

let export_status_to_yojson = 
  fun (x: export_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
   

let export_type_to_yojson = 
  fun (x: export_type) -> match x with 
 
| INCREMENTAL_EXPORT -> `String "INCREMENTAL_EXPORT"
  | FULL_EXPORT -> `String "FULL_EXPORT"
   

let export_summary_to_yojson = 
  fun (x: export_summary) -> assoc_to_yojson(
    [(
         "ExportType",
         (option_to_yojson export_type_to_yojson x.export_type));
       (
         "ExportStatus",
         (option_to_yojson export_status_to_yojson x.export_status));
       (
         "ExportArn",
         (option_to_yojson export_arn_to_yojson x.export_arn));
       
  ])

let export_summaries_to_yojson = 
  fun tree -> list_to_yojson export_summary_to_yojson tree

let export_next_token_to_yojson = string_to_yojson

let list_exports_output_to_yojson = 
  fun (x: list_exports_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson export_next_token_to_yojson x.next_token));
       (
         "ExportSummaries",
         (option_to_yojson export_summaries_to_yojson x.export_summaries));
       
  ])

let list_exports_max_limit_to_yojson = int_to_yojson

let list_exports_input_to_yojson = 
  fun (x: list_exports_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson export_next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_exports_max_limit_to_yojson x.max_results));
       (
         "TableArn",
         (option_to_yojson table_arn_to_yojson x.table_arn));
       
  ])

let contributor_insights_summary_to_yojson = 
  fun (x: contributor_insights_summary) -> assoc_to_yojson(
    [(
         "ContributorInsightsStatus",
         (option_to_yojson contributor_insights_status_to_yojson x.contributor_insights_status));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       
  ])

let contributor_insights_summaries_to_yojson = 
  fun tree -> list_to_yojson contributor_insights_summary_to_yojson tree

let list_contributor_insights_output_to_yojson = 
  fun (x: list_contributor_insights_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_string_to_yojson x.next_token));
       (
         "ContributorInsightsSummaries",
         (option_to_yojson contributor_insights_summaries_to_yojson x.contributor_insights_summaries));
       
  ])

let list_contributor_insights_limit_to_yojson = int_to_yojson

let list_contributor_insights_input_to_yojson = 
  fun (x: list_contributor_insights_input) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson list_contributor_insights_limit_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_string_to_yojson x.next_token));
       (
         "TableName",
         (option_to_yojson table_arn_to_yojson x.table_name));
       
  ])

let backup_name_to_yojson = string_to_yojson

let backup_creation_date_time_to_yojson = timestamp_to_yojson

let backup_status_to_yojson = 
  fun (x: backup_status) -> match x with 
 
| AVAILABLE -> `String "AVAILABLE"
  | DELETED -> `String "DELETED"
  | CREATING -> `String "CREATING"
   

let backup_type_to_yojson = 
  fun (x: backup_type) -> match x with 
 
| AWS_BACKUP -> `String "AWS_BACKUP"
  | SYSTEM -> `String "SYSTEM"
  | USER -> `String "USER"
   

let backup_size_bytes_to_yojson = long_to_yojson

let backup_summary_to_yojson = 
  fun (x: backup_summary) -> assoc_to_yojson(
    [(
         "BackupSizeBytes",
         (option_to_yojson backup_size_bytes_to_yojson x.backup_size_bytes));
       (
         "BackupType",
         (option_to_yojson backup_type_to_yojson x.backup_type));
       (
         "BackupStatus",
         (option_to_yojson backup_status_to_yojson x.backup_status));
       (
         "BackupExpiryDateTime",
         (option_to_yojson date_to_yojson x.backup_expiry_date_time));
       (
         "BackupCreationDateTime",
         (option_to_yojson backup_creation_date_time_to_yojson x.backup_creation_date_time));
       (
         "BackupName",
         (option_to_yojson backup_name_to_yojson x.backup_name));
       (
         "BackupArn",
         (option_to_yojson backup_arn_to_yojson x.backup_arn));
       (
         "TableArn",
         (option_to_yojson table_arn_to_yojson x.table_arn));
       (
         "TableId",
         (option_to_yojson table_id_to_yojson x.table_id));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       
  ])

let backup_summaries_to_yojson = 
  fun tree -> list_to_yojson backup_summary_to_yojson tree

let list_backups_output_to_yojson = 
  fun (x: list_backups_output) -> assoc_to_yojson(
    [(
         "LastEvaluatedBackupArn",
         (option_to_yojson backup_arn_to_yojson x.last_evaluated_backup_arn));
       (
         "BackupSummaries",
         (option_to_yojson backup_summaries_to_yojson x.backup_summaries));
       
  ])

let backups_input_limit_to_yojson = int_to_yojson

let backup_type_filter_to_yojson = 
  fun (x: backup_type_filter) -> match x with 
 
| ALL -> `String "ALL"
  | AWS_BACKUP -> `String "AWS_BACKUP"
  | SYSTEM -> `String "SYSTEM"
  | USER -> `String "USER"
   

let list_backups_input_to_yojson = 
  fun (x: list_backups_input) -> assoc_to_yojson(
    [(
         "BackupType",
         (option_to_yojson backup_type_filter_to_yojson x.backup_type));
       (
         "ExclusiveStartBackupArn",
         (option_to_yojson backup_arn_to_yojson x.exclusive_start_backup_arn));
       (
         "TimeRangeUpperBound",
         (option_to_yojson time_range_upper_bound_to_yojson x.time_range_upper_bound));
       (
         "TimeRangeLowerBound",
         (option_to_yojson time_range_lower_bound_to_yojson x.time_range_lower_bound));
       (
         "Limit",
         (option_to_yojson backups_input_limit_to_yojson x.limit));
       (
         "TableName",
         (option_to_yojson table_arn_to_yojson x.table_name));
       
  ])

let last_update_date_time_to_yojson = timestamp_to_yojson

let enable_kinesis_streaming_configuration_to_yojson = 
  fun (x: enable_kinesis_streaming_configuration) -> assoc_to_yojson(
    [(
         "ApproximateCreationDateTimePrecision",
         (option_to_yojson approximate_creation_date_time_precision_to_yojson x.approximate_creation_date_time_precision));
       
  ])

let kinesis_streaming_destination_output_to_yojson = 
  fun (x: kinesis_streaming_destination_output) -> assoc_to_yojson(
    [(
         "EnableKinesisStreamingConfiguration",
         (option_to_yojson enable_kinesis_streaming_configuration_to_yojson x.enable_kinesis_streaming_configuration));
       (
         "DestinationStatus",
         (option_to_yojson destination_status_to_yojson x.destination_status));
       (
         "StreamArn",
         (option_to_yojson stream_arn_to_yojson x.stream_arn));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       
  ])

let kinesis_streaming_destination_input_to_yojson = 
  fun (x: kinesis_streaming_destination_input) -> assoc_to_yojson(
    [(
         "EnableKinesisStreamingConfiguration",
         (option_to_yojson enable_kinesis_streaming_configuration_to_yojson x.enable_kinesis_streaming_configuration));
       (
         "StreamArn",
         (Some (stream_arn_to_yojson x.stream_arn)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let kinesis_data_stream_destination_to_yojson = 
  fun (x: kinesis_data_stream_destination) -> assoc_to_yojson(
    [(
         "ApproximateCreationDateTimePrecision",
         (option_to_yojson approximate_creation_date_time_precision_to_yojson x.approximate_creation_date_time_precision));
       (
         "DestinationStatusDescription",
         (option_to_yojson string__to_yojson x.destination_status_description));
       (
         "DestinationStatus",
         (option_to_yojson destination_status_to_yojson x.destination_status));
       (
         "StreamArn",
         (option_to_yojson stream_arn_to_yojson x.stream_arn));
       
  ])

let kinesis_data_stream_destinations_to_yojson = 
  fun tree -> list_to_yojson kinesis_data_stream_destination_to_yojson tree

let key_list_to_yojson = fun tree -> list_to_yojson key_to_yojson tree

let keys_and_attributes_to_yojson = 
  fun (x: keys_and_attributes) -> assoc_to_yojson(
    [(
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ProjectionExpression",
         (option_to_yojson projection_expression_to_yojson x.projection_expression));
       (
         "ConsistentRead",
         (option_to_yojson consistent_read_to_yojson x.consistent_read));
       (
         "AttributesToGet",
         (option_to_yojson attribute_name_list_to_yojson x.attributes_to_get));
       (
         "Keys",
         (Some (key_list_to_yojson x.keys)));
       
  ])

let invalid_export_time_exception_to_yojson = 
  fun (x: invalid_export_time_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let csv_delimiter_to_yojson = string_to_yojson

let csv_header_to_yojson = string_to_yojson

let csv_header_list_to_yojson = 
  fun tree -> list_to_yojson csv_header_to_yojson tree

let csv_options_to_yojson = 
  fun (x: csv_options) -> assoc_to_yojson(
    [(
         "HeaderList",
         (option_to_yojson csv_header_list_to_yojson x.header_list));
       (
         "Delimiter",
         (option_to_yojson csv_delimiter_to_yojson x.delimiter));
       
  ])

let input_format_options_to_yojson = 
  fun (x: input_format_options) -> assoc_to_yojson(
    [(
         "Csv",
         (option_to_yojson csv_options_to_yojson x.csv));
       
  ])

let input_compression_type_to_yojson = 
  fun (x: input_compression_type) -> match x with 
  | NONE -> `String "NONE"
    | ZSTD -> `String "ZSTD"
    | GZIP -> `String "GZIP"
     

let export_from_time_to_yojson = timestamp_to_yojson

let export_to_time_to_yojson = timestamp_to_yojson

let export_view_type_to_yojson = 
  fun (x: export_view_type) -> match x with 
 
| NEW_AND_OLD_IMAGES -> `String "NEW_AND_OLD_IMAGES"
  | NEW_IMAGE -> `String "NEW_IMAGE"
   

let incremental_export_specification_to_yojson = 
  fun (x: incremental_export_specification) -> assoc_to_yojson(
    [(
         "ExportViewType",
         (option_to_yojson export_view_type_to_yojson x.export_view_type));
       (
         "ExportToTime",
         (option_to_yojson export_to_time_to_yojson x.export_to_time));
       (
         "ExportFromTime",
         (option_to_yojson export_from_time_to_yojson x.export_from_time));
       
  ])

let imported_item_count_to_yojson = long_to_yojson

let client_token_to_yojson = string_to_yojson

let error_count_to_yojson = long_to_yojson

let failure_code_to_yojson = string_to_yojson

let failure_message_to_yojson = string_to_yojson

let import_table_description_to_yojson = 
  fun (x: import_table_description) -> assoc_to_yojson(
    [(
         "FailureMessage",
         (option_to_yojson failure_message_to_yojson x.failure_message));
       (
         "FailureCode",
         (option_to_yojson failure_code_to_yojson x.failure_code));
       (
         "ImportedItemCount",
         (option_to_yojson imported_item_count_to_yojson x.imported_item_count));
       (
         "ProcessedItemCount",
         (option_to_yojson processed_item_count_to_yojson x.processed_item_count));
       (
         "ProcessedSizeBytes",
         (option_to_yojson long_object_to_yojson x.processed_size_bytes));
       (
         "EndTime",
         (option_to_yojson import_end_time_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson import_start_time_to_yojson x.start_time));
       (
         "TableCreationParameters",
         (option_to_yojson table_creation_parameters_to_yojson x.table_creation_parameters));
       (
         "InputCompressionType",
         (option_to_yojson input_compression_type_to_yojson x.input_compression_type));
       (
         "InputFormatOptions",
         (option_to_yojson input_format_options_to_yojson x.input_format_options));
       (
         "InputFormat",
         (option_to_yojson input_format_to_yojson x.input_format));
       (
         "CloudWatchLogGroupArn",
         (option_to_yojson cloud_watch_log_group_arn_to_yojson x.cloud_watch_log_group_arn));
       (
         "ErrorCount",
         (option_to_yojson error_count_to_yojson x.error_count));
       (
         "S3BucketSource",
         (option_to_yojson s3_bucket_source_to_yojson x.s3_bucket_source));
       (
         "ClientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "TableId",
         (option_to_yojson table_id_to_yojson x.table_id));
       (
         "TableArn",
         (option_to_yojson table_arn_to_yojson x.table_arn));
       (
         "ImportStatus",
         (option_to_yojson import_status_to_yojson x.import_status));
       (
         "ImportArn",
         (option_to_yojson import_arn_to_yojson x.import_arn));
       
  ])

let import_table_output_to_yojson = 
  fun (x: import_table_output) -> assoc_to_yojson(
    [(
         "ImportTableDescription",
         (Some (import_table_description_to_yojson x.import_table_description)));
       
  ])

let import_table_input_to_yojson = 
  fun (x: import_table_input) -> assoc_to_yojson(
    [(
         "TableCreationParameters",
         (Some (table_creation_parameters_to_yojson x.table_creation_parameters)));
       (
         "InputCompressionType",
         (option_to_yojson input_compression_type_to_yojson x.input_compression_type));
       (
         "InputFormatOptions",
         (option_to_yojson input_format_options_to_yojson x.input_format_options));
       (
         "InputFormat",
         (Some (input_format_to_yojson x.input_format)));
       (
         "S3BucketSource",
         (Some (s3_bucket_source_to_yojson x.s3_bucket_source)));
       (
         "ClientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       
  ])

let import_conflict_exception_to_yojson = 
  fun (x: import_conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let import_not_found_exception_to_yojson = 
  fun (x: import_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let global_table_already_exists_exception_to_yojson = 
  fun (x: global_table_already_exists_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let get_resource_policy_output_to_yojson = 
  fun (x: get_resource_policy_output) -> assoc_to_yojson(
    [(
         "RevisionId",
         (option_to_yojson policy_revision_id_to_yojson x.revision_id));
       (
         "Policy",
         (option_to_yojson resource_policy_to_yojson x.policy));
       
  ])

let get_resource_policy_input_to_yojson = 
  fun (x: get_resource_policy_input) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_string_to_yojson x.resource_arn)));
       
  ])

let get_item_output_to_yojson = 
  fun (x: get_item_output) -> assoc_to_yojson(
    [(
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_to_yojson x.consumed_capacity));
       (
         "Item",
         (option_to_yojson attribute_map_to_yojson x.item));
       
  ])

let get_item_input_to_yojson = 
  fun (x: get_item_input) -> assoc_to_yojson(
    [(
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ProjectionExpression",
         (option_to_yojson projection_expression_to_yojson x.projection_expression));
       (
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "ConsistentRead",
         (option_to_yojson consistent_read_to_yojson x.consistent_read));
       (
         "AttributesToGet",
         (option_to_yojson attribute_name_list_to_yojson x.attributes_to_get));
       (
         "Key",
         (Some (key_to_yojson x.key)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let exception_name_to_yojson = string_to_yojson

let exception_description_to_yojson = string_to_yojson

let failure_exception_to_yojson = 
  fun (x: failure_exception) -> assoc_to_yojson(
    [(
         "ExceptionDescription",
         (option_to_yojson exception_description_to_yojson x.exception_description));
       (
         "ExceptionName",
         (option_to_yojson exception_name_to_yojson x.exception_name));
       
  ])

let export_time_to_yojson = timestamp_to_yojson

let export_start_time_to_yojson = timestamp_to_yojson

let export_end_time_to_yojson = timestamp_to_yojson

let export_manifest_to_yojson = string_to_yojson

let export_format_to_yojson = 
  fun (x: export_format) -> match x with 
  | ION -> `String "ION"
    | DYNAMODB_JSON -> `String "DYNAMODB_JSON"
     

let billed_size_bytes_to_yojson = long_to_yojson

let export_description_to_yojson = 
  fun (x: export_description) -> assoc_to_yojson(
    [(
         "IncrementalExportSpecification",
         (option_to_yojson incremental_export_specification_to_yojson x.incremental_export_specification));
       (
         "ExportType",
         (option_to_yojson export_type_to_yojson x.export_type));
       (
         "ItemCount",
         (option_to_yojson item_count_to_yojson x.item_count));
       (
         "BilledSizeBytes",
         (option_to_yojson billed_size_bytes_to_yojson x.billed_size_bytes));
       (
         "ExportFormat",
         (option_to_yojson export_format_to_yojson x.export_format));
       (
         "FailureMessage",
         (option_to_yojson failure_message_to_yojson x.failure_message));
       (
         "FailureCode",
         (option_to_yojson failure_code_to_yojson x.failure_code));
       (
         "S3SseKmsKeyId",
         (option_to_yojson s3_sse_kms_key_id_to_yojson x.s3_sse_kms_key_id));
       (
         "S3SseAlgorithm",
         (option_to_yojson s3_sse_algorithm_to_yojson x.s3_sse_algorithm));
       (
         "S3Prefix",
         (option_to_yojson s3_prefix_to_yojson x.s3_prefix));
       (
         "S3BucketOwner",
         (option_to_yojson s3_bucket_owner_to_yojson x.s3_bucket_owner));
       (
         "S3Bucket",
         (option_to_yojson s3_bucket_to_yojson x.s3_bucket));
       (
         "ClientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "ExportTime",
         (option_to_yojson export_time_to_yojson x.export_time));
       (
         "TableId",
         (option_to_yojson table_id_to_yojson x.table_id));
       (
         "TableArn",
         (option_to_yojson table_arn_to_yojson x.table_arn));
       (
         "ExportManifest",
         (option_to_yojson export_manifest_to_yojson x.export_manifest));
       (
         "EndTime",
         (option_to_yojson export_end_time_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson export_start_time_to_yojson x.start_time));
       (
         "ExportStatus",
         (option_to_yojson export_status_to_yojson x.export_status));
       (
         "ExportArn",
         (option_to_yojson export_arn_to_yojson x.export_arn));
       
  ])

let export_table_to_point_in_time_output_to_yojson = 
  fun (x: export_table_to_point_in_time_output) -> assoc_to_yojson(
    [(
         "ExportDescription",
         (option_to_yojson export_description_to_yojson x.export_description));
       
  ])

let export_table_to_point_in_time_input_to_yojson = 
  fun (x: export_table_to_point_in_time_input) -> assoc_to_yojson(
    [(
         "IncrementalExportSpecification",
         (option_to_yojson incremental_export_specification_to_yojson x.incremental_export_specification));
       (
         "ExportType",
         (option_to_yojson export_type_to_yojson x.export_type));
       (
         "ExportFormat",
         (option_to_yojson export_format_to_yojson x.export_format));
       (
         "S3SseKmsKeyId",
         (option_to_yojson s3_sse_kms_key_id_to_yojson x.s3_sse_kms_key_id));
       (
         "S3SseAlgorithm",
         (option_to_yojson s3_sse_algorithm_to_yojson x.s3_sse_algorithm));
       (
         "S3Prefix",
         (option_to_yojson s3_prefix_to_yojson x.s3_prefix));
       (
         "S3BucketOwner",
         (option_to_yojson s3_bucket_owner_to_yojson x.s3_bucket_owner));
       (
         "S3Bucket",
         (Some (s3_bucket_to_yojson x.s3_bucket)));
       (
         "ClientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "ExportTime",
         (option_to_yojson export_time_to_yojson x.export_time));
       (
         "TableArn",
         (Some (table_arn_to_yojson x.table_arn)));
       
  ])

let export_conflict_exception_to_yojson = 
  fun (x: export_conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let export_not_found_exception_to_yojson = 
  fun (x: export_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let execute_transaction_output_to_yojson = 
  fun (x: execute_transaction_output) -> assoc_to_yojson(
    [(
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity));
       (
         "Responses",
         (option_to_yojson item_response_list_to_yojson x.responses));
       
  ])

let execute_transaction_input_to_yojson = 
  fun (x: execute_transaction_input) -> assoc_to_yojson(
    [(
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "ClientRequestToken",
         (option_to_yojson client_request_token_to_yojson x.client_request_token));
       (
         "TransactStatements",
         (Some (parameterized_statements_to_yojson x.transact_statements)));
       
  ])

let execute_statement_output_to_yojson = 
  fun (x: execute_statement_output) -> assoc_to_yojson(
    [(
         "LastEvaluatedKey",
         (option_to_yojson key_to_yojson x.last_evaluated_key));
       (
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_to_yojson x.consumed_capacity));
       (
         "NextToken",
         (option_to_yojson parti_ql_next_token_to_yojson x.next_token));
       (
         "Items",
         (option_to_yojson item_list_to_yojson x.items));
       
  ])

let execute_statement_input_to_yojson = 
  fun (x: execute_statement_input) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "Limit",
         (option_to_yojson positive_integer_object_to_yojson x.limit));
       (
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "NextToken",
         (option_to_yojson parti_ql_next_token_to_yojson x.next_token));
       (
         "ConsistentRead",
         (option_to_yojson consistent_read_to_yojson x.consistent_read));
       (
         "Parameters",
         (option_to_yojson prepared_statement_parameters_to_yojson x.parameters));
       (
         "Statement",
         (Some (parti_ql_statement_to_yojson x.statement)));
       
  ])

let duplicate_item_exception_to_yojson = 
  fun (x: duplicate_item_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let endpoint_to_yojson = 
  fun (x: endpoint) -> assoc_to_yojson(
    [(
         "CachePeriodInMinutes",
         (Some (long_to_yojson x.cache_period_in_minutes)));
       (
         "Address",
         (Some (string__to_yojson x.address)));
       
  ])

let endpoints_to_yojson = 
  fun tree -> list_to_yojson endpoint_to_yojson tree

let describe_time_to_live_output_to_yojson = 
  fun (x: describe_time_to_live_output) -> assoc_to_yojson(
    [(
         "TimeToLiveDescription",
         (option_to_yojson time_to_live_description_to_yojson x.time_to_live_description));
       
  ])

let describe_time_to_live_input_to_yojson = 
  fun (x: describe_time_to_live_input) -> assoc_to_yojson(
    [(
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let describe_table_replica_auto_scaling_output_to_yojson = 
  fun (x: describe_table_replica_auto_scaling_output) -> assoc_to_yojson(
    [(
         "TableAutoScalingDescription",
         (option_to_yojson table_auto_scaling_description_to_yojson x.table_auto_scaling_description));
       
  ])

let describe_table_replica_auto_scaling_input_to_yojson = 
  fun (x: describe_table_replica_auto_scaling_input) -> assoc_to_yojson(
    [(
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let describe_table_output_to_yojson = 
  fun (x: describe_table_output) -> assoc_to_yojson(
    [(
         "Table",
         (option_to_yojson table_description_to_yojson x.table));
       
  ])

let describe_table_input_to_yojson = 
  fun (x: describe_table_input) -> assoc_to_yojson(
    [(
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let describe_limits_output_to_yojson = 
  fun (x: describe_limits_output) -> assoc_to_yojson(
    [(
         "TableMaxWriteCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.table_max_write_capacity_units));
       (
         "TableMaxReadCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.table_max_read_capacity_units));
       (
         "AccountMaxWriteCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.account_max_write_capacity_units));
       (
         "AccountMaxReadCapacityUnits",
         (option_to_yojson positive_long_object_to_yojson x.account_max_read_capacity_units));
       
  ])

let describe_limits_input_to_yojson = 
  fun (x: describe_limits_input) -> assoc_to_yojson(
    [
  ])

let describe_kinesis_streaming_destination_output_to_yojson = 
  fun (x: describe_kinesis_streaming_destination_output) -> assoc_to_yojson(
    [(
         "KinesisDataStreamDestinations",
         (option_to_yojson kinesis_data_stream_destinations_to_yojson x.kinesis_data_stream_destinations));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       
  ])

let describe_kinesis_streaming_destination_input_to_yojson = 
  fun (x: describe_kinesis_streaming_destination_input) -> assoc_to_yojson(
    [(
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let describe_import_output_to_yojson = 
  fun (x: describe_import_output) -> assoc_to_yojson(
    [(
         "ImportTableDescription",
         (Some (import_table_description_to_yojson x.import_table_description)));
       
  ])

let describe_import_input_to_yojson = 
  fun (x: describe_import_input) -> assoc_to_yojson(
    [(
         "ImportArn",
         (Some (import_arn_to_yojson x.import_arn)));
       
  ])

let describe_global_table_settings_output_to_yojson = 
  fun (x: describe_global_table_settings_output) -> assoc_to_yojson(
    [(
         "ReplicaSettings",
         (option_to_yojson replica_settings_description_list_to_yojson x.replica_settings));
       (
         "GlobalTableName",
         (option_to_yojson table_name_to_yojson x.global_table_name));
       
  ])

let describe_global_table_settings_input_to_yojson = 
  fun (x: describe_global_table_settings_input) -> assoc_to_yojson(
    [(
         "GlobalTableName",
         (Some (table_name_to_yojson x.global_table_name)));
       
  ])

let describe_global_table_output_to_yojson = 
  fun (x: describe_global_table_output) -> assoc_to_yojson(
    [(
         "GlobalTableDescription",
         (option_to_yojson global_table_description_to_yojson x.global_table_description));
       
  ])

let describe_global_table_input_to_yojson = 
  fun (x: describe_global_table_input) -> assoc_to_yojson(
    [(
         "GlobalTableName",
         (Some (table_name_to_yojson x.global_table_name)));
       
  ])

let describe_export_output_to_yojson = 
  fun (x: describe_export_output) -> assoc_to_yojson(
    [(
         "ExportDescription",
         (option_to_yojson export_description_to_yojson x.export_description));
       
  ])

let describe_export_input_to_yojson = 
  fun (x: describe_export_input) -> assoc_to_yojson(
    [(
         "ExportArn",
         (Some (export_arn_to_yojson x.export_arn)));
       
  ])

let describe_endpoints_response_to_yojson = 
  fun (x: describe_endpoints_response) -> assoc_to_yojson(
    [(
         "Endpoints",
         (Some (endpoints_to_yojson x.endpoints)));
       
  ])

let describe_endpoints_request_to_yojson = 
  fun (x: describe_endpoints_request) -> assoc_to_yojson(
    [
  ])

let contributor_insights_rule_to_yojson = string_to_yojson

let contributor_insights_rule_list_to_yojson = 
  fun tree -> list_to_yojson contributor_insights_rule_to_yojson tree

let describe_contributor_insights_output_to_yojson = 
  fun (x: describe_contributor_insights_output) -> assoc_to_yojson(
    [(
         "FailureException",
         (option_to_yojson failure_exception_to_yojson x.failure_exception));
       (
         "LastUpdateDateTime",
         (option_to_yojson last_update_date_time_to_yojson x.last_update_date_time));
       (
         "ContributorInsightsStatus",
         (option_to_yojson contributor_insights_status_to_yojson x.contributor_insights_status));
       (
         "ContributorInsightsRuleList",
         (option_to_yojson contributor_insights_rule_list_to_yojson x.contributor_insights_rule_list));
       (
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       (
         "TableName",
         (option_to_yojson table_name_to_yojson x.table_name));
       
  ])

let describe_contributor_insights_input_to_yojson = 
  fun (x: describe_contributor_insights_input) -> assoc_to_yojson(
    [(
         "IndexName",
         (option_to_yojson index_name_to_yojson x.index_name));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let describe_continuous_backups_output_to_yojson = 
  fun (x: describe_continuous_backups_output) -> assoc_to_yojson(
    [(
         "ContinuousBackupsDescription",
         (option_to_yojson continuous_backups_description_to_yojson x.continuous_backups_description));
       
  ])

let describe_continuous_backups_input_to_yojson = 
  fun (x: describe_continuous_backups_input) -> assoc_to_yojson(
    [(
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let backup_details_to_yojson = 
  fun (x: backup_details) -> assoc_to_yojson(
    [(
         "BackupExpiryDateTime",
         (option_to_yojson date_to_yojson x.backup_expiry_date_time));
       (
         "BackupCreationDateTime",
         (Some (backup_creation_date_time_to_yojson x.backup_creation_date_time)));
       (
         "BackupType",
         (Some (backup_type_to_yojson x.backup_type)));
       (
         "BackupStatus",
         (Some (backup_status_to_yojson x.backup_status)));
       (
         "BackupSizeBytes",
         (option_to_yojson backup_size_bytes_to_yojson x.backup_size_bytes));
       (
         "BackupName",
         (Some (backup_name_to_yojson x.backup_name)));
       (
         "BackupArn",
         (Some (backup_arn_to_yojson x.backup_arn)));
       
  ])

let backup_description_to_yojson = 
  fun (x: backup_description) -> assoc_to_yojson(
    [(
         "SourceTableFeatureDetails",
         (option_to_yojson source_table_feature_details_to_yojson x.source_table_feature_details));
       (
         "SourceTableDetails",
         (option_to_yojson source_table_details_to_yojson x.source_table_details));
       (
         "BackupDetails",
         (option_to_yojson backup_details_to_yojson x.backup_details));
       
  ])

let describe_backup_output_to_yojson = 
  fun (x: describe_backup_output) -> assoc_to_yojson(
    [(
         "BackupDescription",
         (option_to_yojson backup_description_to_yojson x.backup_description));
       
  ])

let describe_backup_input_to_yojson = 
  fun (x: describe_backup_input) -> assoc_to_yojson(
    [(
         "BackupArn",
         (Some (backup_arn_to_yojson x.backup_arn)));
       
  ])

let delete_table_output_to_yojson = 
  fun (x: delete_table_output) -> assoc_to_yojson(
    [(
         "TableDescription",
         (option_to_yojson table_description_to_yojson x.table_description));
       
  ])

let delete_table_input_to_yojson = 
  fun (x: delete_table_input) -> assoc_to_yojson(
    [(
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let delete_resource_policy_output_to_yojson = 
  fun (x: delete_resource_policy_output) -> assoc_to_yojson(
    [(
         "RevisionId",
         (option_to_yojson policy_revision_id_to_yojson x.revision_id));
       
  ])

let delete_resource_policy_input_to_yojson = 
  fun (x: delete_resource_policy_input) -> assoc_to_yojson(
    [(
         "ExpectedRevisionId",
         (option_to_yojson policy_revision_id_to_yojson x.expected_revision_id));
       (
         "ResourceArn",
         (Some (resource_arn_string_to_yojson x.resource_arn)));
       
  ])

let delete_item_output_to_yojson = 
  fun (x: delete_item_output) -> assoc_to_yojson(
    [(
         "ItemCollectionMetrics",
         (option_to_yojson item_collection_metrics_to_yojson x.item_collection_metrics));
       (
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_to_yojson x.consumed_capacity));
       (
         "Attributes",
         (option_to_yojson attribute_map_to_yojson x.attributes));
       
  ])

let delete_item_input_to_yojson = 
  fun (x: delete_item_input) -> assoc_to_yojson(
    [(
         "ReturnValuesOnConditionCheckFailure",
         (option_to_yojson return_values_on_condition_check_failure_to_yojson x.return_values_on_condition_check_failure));
       (
         "ExpressionAttributeValues",
         (option_to_yojson expression_attribute_value_map_to_yojson x.expression_attribute_values));
       (
         "ExpressionAttributeNames",
         (option_to_yojson expression_attribute_name_map_to_yojson x.expression_attribute_names));
       (
         "ConditionExpression",
         (option_to_yojson condition_expression_to_yojson x.condition_expression));
       (
         "ReturnItemCollectionMetrics",
         (option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics));
       (
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "ReturnValues",
         (option_to_yojson return_value_to_yojson x.return_values));
       (
         "ConditionalOperator",
         (option_to_yojson conditional_operator_to_yojson x.conditional_operator));
       (
         "Expected",
         (option_to_yojson expected_attribute_map_to_yojson x.expected));
       (
         "Key",
         (Some (key_to_yojson x.key)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let delete_backup_output_to_yojson = 
  fun (x: delete_backup_output) -> assoc_to_yojson(
    [(
         "BackupDescription",
         (option_to_yojson backup_description_to_yojson x.backup_description));
       
  ])

let delete_backup_input_to_yojson = 
  fun (x: delete_backup_input) -> assoc_to_yojson(
    [(
         "BackupArn",
         (Some (backup_arn_to_yojson x.backup_arn)));
       
  ])

let create_table_output_to_yojson = 
  fun (x: create_table_output) -> assoc_to_yojson(
    [(
         "TableDescription",
         (option_to_yojson table_description_to_yojson x.table_description));
       
  ])

let create_table_input_to_yojson = 
  fun (x: create_table_input) -> assoc_to_yojson(
    [(
         "OnDemandThroughput",
         (option_to_yojson on_demand_throughput_to_yojson x.on_demand_throughput));
       (
         "ResourcePolicy",
         (option_to_yojson resource_policy_to_yojson x.resource_policy));
       (
         "DeletionProtectionEnabled",
         (option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled));
       (
         "TableClass",
         (option_to_yojson table_class_to_yojson x.table_class));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "SSESpecification",
         (option_to_yojson sse_specification_to_yojson x.sse_specification));
       (
         "StreamSpecification",
         (option_to_yojson stream_specification_to_yojson x.stream_specification));
       (
         "ProvisionedThroughput",
         (option_to_yojson provisioned_throughput_to_yojson x.provisioned_throughput));
       (
         "BillingMode",
         (option_to_yojson billing_mode_to_yojson x.billing_mode));
       (
         "GlobalSecondaryIndexes",
         (option_to_yojson global_secondary_index_list_to_yojson x.global_secondary_indexes));
       (
         "LocalSecondaryIndexes",
         (option_to_yojson local_secondary_index_list_to_yojson x.local_secondary_indexes));
       (
         "KeySchema",
         (Some (key_schema_to_yojson x.key_schema)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       (
         "AttributeDefinitions",
         (Some (attribute_definitions_to_yojson x.attribute_definitions)));
       
  ])

let create_global_table_output_to_yojson = 
  fun (x: create_global_table_output) -> assoc_to_yojson(
    [(
         "GlobalTableDescription",
         (option_to_yojson global_table_description_to_yojson x.global_table_description));
       
  ])

let create_global_table_input_to_yojson = 
  fun (x: create_global_table_input) -> assoc_to_yojson(
    [(
         "ReplicationGroup",
         (Some (replica_list_to_yojson x.replication_group)));
       (
         "GlobalTableName",
         (Some (table_name_to_yojson x.global_table_name)));
       
  ])

let create_backup_output_to_yojson = 
  fun (x: create_backup_output) -> assoc_to_yojson(
    [(
         "BackupDetails",
         (option_to_yojson backup_details_to_yojson x.backup_details));
       
  ])

let create_backup_input_to_yojson = 
  fun (x: create_backup_input) -> assoc_to_yojson(
    [(
         "BackupName",
         (Some (backup_name_to_yojson x.backup_name)));
       (
         "TableName",
         (Some (table_arn_to_yojson x.table_name)));
       
  ])

let batch_write_item_request_map_to_yojson = 
  fun tree -> map_to_yojson write_requests_to_yojson tree

let batch_write_item_output_to_yojson = 
  fun (x: batch_write_item_output) -> assoc_to_yojson(
    [(
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity));
       (
         "ItemCollectionMetrics",
         (option_to_yojson item_collection_metrics_per_table_to_yojson x.item_collection_metrics));
       (
         "UnprocessedItems",
         (option_to_yojson batch_write_item_request_map_to_yojson x.unprocessed_items));
       
  ])

let batch_write_item_input_to_yojson = 
  fun (x: batch_write_item_input) -> assoc_to_yojson(
    [(
         "ReturnItemCollectionMetrics",
         (option_to_yojson return_item_collection_metrics_to_yojson x.return_item_collection_metrics));
       (
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "RequestItems",
         (Some (batch_write_item_request_map_to_yojson x.request_items)));
       
  ])

let batch_get_response_map_to_yojson = 
  fun tree -> map_to_yojson item_list_to_yojson tree

let batch_get_request_map_to_yojson = 
  fun tree -> map_to_yojson keys_and_attributes_to_yojson tree

let batch_get_item_output_to_yojson = 
  fun (x: batch_get_item_output) -> assoc_to_yojson(
    [(
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity));
       (
         "UnprocessedKeys",
         (option_to_yojson batch_get_request_map_to_yojson x.unprocessed_keys));
       (
         "Responses",
         (option_to_yojson batch_get_response_map_to_yojson x.responses));
       
  ])

let batch_get_item_input_to_yojson = 
  fun (x: batch_get_item_input) -> assoc_to_yojson(
    [(
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "RequestItems",
         (Some (batch_get_request_map_to_yojson x.request_items)));
       
  ])

let batch_execute_statement_output_to_yojson = 
  fun (x: batch_execute_statement_output) -> assoc_to_yojson(
    [(
         "ConsumedCapacity",
         (option_to_yojson consumed_capacity_multiple_to_yojson x.consumed_capacity));
       (
         "Responses",
         (option_to_yojson parti_ql_batch_response_to_yojson x.responses));
       
  ])

let batch_execute_statement_input_to_yojson = 
  fun (x: batch_execute_statement_input) -> assoc_to_yojson(
    [(
         "ReturnConsumedCapacity",
         (option_to_yojson return_consumed_capacity_to_yojson x.return_consumed_capacity));
       (
         "Statements",
         (Some (parti_ql_batch_request_to_yojson x.statements)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

