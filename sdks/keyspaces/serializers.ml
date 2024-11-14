open Smaws_Lib.Json.SerializeHelpers

open Types

let base_unit_to_yojson = unit_to_yojson

let rs_to_yojson = 
  fun (x: rs) -> match x with 
 
| SINGLE_REGION -> `String "SINGLE_REGION"
  | MULTI_REGION -> `String "MULTI_REGION"
   

let region_to_yojson = string_to_yojson

let kms_key_ar_n_to_yojson = string_to_yojson

let base_string_to_yojson = string_to_yojson

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let ar_n_to_yojson = string_to_yojson

let update_table_response_to_yojson = 
  fun (x: update_table_response) -> assoc_to_yojson(
    [(
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       
  ])

let keyspace_name_to_yojson = string_to_yojson

let table_name_to_yojson = string_to_yojson

let generic_string_to_yojson = string_to_yojson

let column_definition_to_yojson = 
  fun (x: column_definition) -> assoc_to_yojson(
    [(
         "type",
         (Some (generic_string_to_yojson x.type_)));
       (
         "name",
         (Some (generic_string_to_yojson x.name)));
       
  ])

let column_definition_list_to_yojson = 
  fun tree -> list_to_yojson column_definition_to_yojson tree

let throughput_mode_to_yojson = 
  fun (x: throughput_mode) -> match x with 
 
| PAY_PER_REQUEST -> `String "PAY_PER_REQUEST"
  | PROVISIONED -> `String "PROVISIONED"
   

let capacity_units_to_yojson = long_to_yojson

let capacity_specification_to_yojson = 
  fun (x: capacity_specification) -> assoc_to_yojson(
    [(
         "writeCapacityUnits",
         (option_to_yojson capacity_units_to_yojson x.write_capacity_units));
       (
         "readCapacityUnits",
         (option_to_yojson capacity_units_to_yojson x.read_capacity_units));
       (
         "throughputMode",
         (Some (throughput_mode_to_yojson x.throughput_mode)));
       
  ])

let encryption_type_to_yojson = 
  fun (x: encryption_type) -> match x with 
 
| CUSTOMER_MANAGED_KMS_KEY -> `String "CUSTOMER_MANAGED_KMS_KEY"
  | AWS_OWNED_KMS_KEY -> `String "AWS_OWNED_KMS_KEY"
   

let encryption_specification_to_yojson = 
  fun (x: encryption_specification) -> assoc_to_yojson(
    [(
         "kmsKeyIdentifier",
         (option_to_yojson kms_key_ar_n_to_yojson x.kms_key_identifier));
       (
         "type",
         (Some (encryption_type_to_yojson x.type_)));
       
  ])

let point_in_time_recovery_status_to_yojson = 
  fun (x: point_in_time_recovery_status) -> match x with 
  | ENABLED -> `String "ENABLED"
    | DISABLED -> `String "DISABLED"
     

let point_in_time_recovery_to_yojson = 
  fun (x: point_in_time_recovery) -> assoc_to_yojson(
    [(
         "status",
         (Some (point_in_time_recovery_status_to_yojson x.status)));
       
  ])

let time_to_live_status_to_yojson = 
  fun (x: time_to_live_status) -> match x with 
  | ENABLED -> `String "ENABLED"
     

let time_to_live_to_yojson = 
  fun (x: time_to_live) -> assoc_to_yojson(
    [(
         "status",
         (Some (time_to_live_status_to_yojson x.status)));
       
  ])

let default_time_to_live_to_yojson = int_to_yojson

let client_side_timestamps_status_to_yojson = 
  fun (x: client_side_timestamps_status) -> match x with 
  | ENABLED -> `String "ENABLED"
     

let client_side_timestamps_to_yojson = 
  fun (x: client_side_timestamps) -> assoc_to_yojson(
    [(
         "status",
         (Some (client_side_timestamps_status_to_yojson x.status)));
       
  ])

let boolean_object_to_yojson = bool_to_yojson

let integer_object_to_yojson = int_to_yojson

let double_object_to_yojson = double_to_yojson

let target_tracking_scaling_policy_configuration_to_yojson = 
  fun (x: target_tracking_scaling_policy_configuration) -> assoc_to_yojson(
    [(
         "targetValue",
         (Some (double_object_to_yojson x.target_value)));
       (
         "scaleOutCooldown",
         (option_to_yojson integer_object_to_yojson x.scale_out_cooldown));
       (
         "scaleInCooldown",
         (option_to_yojson integer_object_to_yojson x.scale_in_cooldown));
       (
         "disableScaleIn",
         (option_to_yojson boolean_object_to_yojson x.disable_scale_in));
       
  ])

let auto_scaling_policy_to_yojson = 
  fun (x: auto_scaling_policy) -> assoc_to_yojson(
    [(
         "targetTrackingScalingPolicyConfiguration",
         (option_to_yojson target_tracking_scaling_policy_configuration_to_yojson x.target_tracking_scaling_policy_configuration));
       
  ])

let auto_scaling_settings_to_yojson = 
  fun (x: auto_scaling_settings) -> assoc_to_yojson(
    [(
         "scalingPolicy",
         (option_to_yojson auto_scaling_policy_to_yojson x.scaling_policy));
       (
         "maximumUnits",
         (option_to_yojson capacity_units_to_yojson x.maximum_units));
       (
         "minimumUnits",
         (option_to_yojson capacity_units_to_yojson x.minimum_units));
       (
         "autoScalingDisabled",
         (option_to_yojson boolean_object_to_yojson x.auto_scaling_disabled));
       
  ])

let auto_scaling_specification_to_yojson = 
  fun (x: auto_scaling_specification) -> assoc_to_yojson(
    [(
         "readCapacityAutoScaling",
         (option_to_yojson auto_scaling_settings_to_yojson x.read_capacity_auto_scaling));
       (
         "writeCapacityAutoScaling",
         (option_to_yojson auto_scaling_settings_to_yojson x.write_capacity_auto_scaling));
       
  ])

let replica_specification_to_yojson = 
  fun (x: replica_specification) -> assoc_to_yojson(
    [(
         "readCapacityAutoScaling",
         (option_to_yojson auto_scaling_settings_to_yojson x.read_capacity_auto_scaling));
       (
         "readCapacityUnits",
         (option_to_yojson capacity_units_to_yojson x.read_capacity_units));
       (
         "region",
         (Some (region_to_yojson x.region)));
       
  ])

let replica_specification_list_to_yojson = 
  fun tree -> list_to_yojson replica_specification_to_yojson tree

let update_table_request_to_yojson = 
  fun (x: update_table_request) -> assoc_to_yojson(
    [(
         "replicaSpecifications",
         (option_to_yojson replica_specification_list_to_yojson x.replica_specifications));
       (
         "autoScalingSpecification",
         (option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification));
       (
         "clientSideTimestamps",
         (option_to_yojson client_side_timestamps_to_yojson x.client_side_timestamps));
       (
         "defaultTimeToLive",
         (option_to_yojson default_time_to_live_to_yojson x.default_time_to_live));
       (
         "ttl",
         (option_to_yojson time_to_live_to_yojson x.ttl));
       (
         "pointInTimeRecovery",
         (option_to_yojson point_in_time_recovery_to_yojson x.point_in_time_recovery));
       (
         "encryptionSpecification",
         (option_to_yojson encryption_specification_to_yojson x.encryption_specification));
       (
         "capacitySpecification",
         (option_to_yojson capacity_specification_to_yojson x.capacity_specification));
       (
         "addColumns",
         (option_to_yojson column_definition_list_to_yojson x.add_columns));
       (
         "tableName",
         (Some (table_name_to_yojson x.table_name)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let service_quota_exceeded_exception_to_yojson = 
  fun (x: service_quota_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "resourceArn",
         (option_to_yojson ar_n_to_yojson x.resource_arn));
       (
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let internal_server_exception_to_yojson = 
  fun (x: internal_server_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_key_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "value",
         (Some (tag_value_to_yojson x.value)));
       (
         "key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       
  ])

let timestamp__to_yojson = timestamp_to_yojson

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       
  ])

let table_summary_to_yojson = 
  fun (x: table_summary) -> assoc_to_yojson(
    [(
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       (
         "tableName",
         (Some (table_name_to_yojson x.table_name)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let table_summary_list_to_yojson = 
  fun tree -> list_to_yojson table_summary_to_yojson tree

let table_status_to_yojson = 
  fun (x: table_status) -> match x with 
 
| ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | DELETED -> `String "DELETED"
  | RESTORING -> `String "RESTORING"
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS -> `String "INACCESSIBLE_ENCRYPTION_CREDENTIALS"
   

let static_column_to_yojson = 
  fun (x: static_column) -> assoc_to_yojson(
    [(
         "name",
         (Some (generic_string_to_yojson x.name)));
       
  ])

let static_column_list_to_yojson = 
  fun tree -> list_to_yojson static_column_to_yojson tree

let sort_order_to_yojson = 
  fun (x: sort_order) -> match x with 
  | ASC -> `String "ASC"
    | DESC -> `String "DESC"
     

let partition_key_to_yojson = 
  fun (x: partition_key) -> assoc_to_yojson(
    [(
         "name",
         (Some (generic_string_to_yojson x.name)));
       
  ])

let partition_key_list_to_yojson = 
  fun tree -> list_to_yojson partition_key_to_yojson tree

let clustering_key_to_yojson = 
  fun (x: clustering_key) -> assoc_to_yojson(
    [(
         "orderBy",
         (Some (sort_order_to_yojson x.order_by)));
       (
         "name",
         (Some (generic_string_to_yojson x.name)));
       
  ])

let clustering_key_list_to_yojson = 
  fun tree -> list_to_yojson clustering_key_to_yojson tree

let schema_definition_to_yojson = 
  fun (x: schema_definition) -> assoc_to_yojson(
    [(
         "staticColumns",
         (option_to_yojson static_column_list_to_yojson x.static_columns));
       (
         "clusteringKeys",
         (option_to_yojson clustering_key_list_to_yojson x.clustering_keys));
       (
         "partitionKeys",
         (Some (partition_key_list_to_yojson x.partition_keys)));
       (
         "allColumns",
         (Some (column_definition_list_to_yojson x.all_columns)));
       
  ])

let restore_table_response_to_yojson = 
  fun (x: restore_table_response) -> assoc_to_yojson(
    [(
         "restoredTableARN",
         (Some (ar_n_to_yojson x.restored_table_ar_n)));
       
  ])

let restore_table_request_to_yojson = 
  fun (x: restore_table_request) -> assoc_to_yojson(
    [(
         "replicaSpecifications",
         (option_to_yojson replica_specification_list_to_yojson x.replica_specifications));
       (
         "autoScalingSpecification",
         (option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification));
       (
         "tagsOverride",
         (option_to_yojson tag_list_to_yojson x.tags_override));
       (
         "pointInTimeRecoveryOverride",
         (option_to_yojson point_in_time_recovery_to_yojson x.point_in_time_recovery_override));
       (
         "encryptionSpecificationOverride",
         (option_to_yojson encryption_specification_to_yojson x.encryption_specification_override));
       (
         "capacitySpecificationOverride",
         (option_to_yojson capacity_specification_to_yojson x.capacity_specification_override));
       (
         "restoreTimestamp",
         (option_to_yojson timestamp__to_yojson x.restore_timestamp));
       (
         "targetTableName",
         (Some (table_name_to_yojson x.target_table_name)));
       (
         "targetKeyspaceName",
         (Some (keyspace_name_to_yojson x.target_keyspace_name)));
       (
         "sourceTableName",
         (Some (table_name_to_yojson x.source_table_name)));
       (
         "sourceKeyspaceName",
         (Some (keyspace_name_to_yojson x.source_keyspace_name)));
       
  ])

let region_list_to_yojson = 
  fun tree -> list_to_yojson region_to_yojson tree

let replication_specification_to_yojson = 
  fun (x: replication_specification) -> assoc_to_yojson(
    [(
         "regionList",
         (option_to_yojson region_list_to_yojson x.region_list));
       (
         "replicationStrategy",
         (Some (rs_to_yojson x.replication_strategy)));
       
  ])

let capacity_specification_summary_to_yojson = 
  fun (x: capacity_specification_summary) -> assoc_to_yojson(
    [(
         "lastUpdateToPayPerRequestTimestamp",
         (option_to_yojson timestamp__to_yojson x.last_update_to_pay_per_request_timestamp));
       (
         "writeCapacityUnits",
         (option_to_yojson capacity_units_to_yojson x.write_capacity_units));
       (
         "readCapacityUnits",
         (option_to_yojson capacity_units_to_yojson x.read_capacity_units));
       (
         "throughputMode",
         (Some (throughput_mode_to_yojson x.throughput_mode)));
       
  ])

let replica_specification_summary_to_yojson = 
  fun (x: replica_specification_summary) -> assoc_to_yojson(
    [(
         "capacitySpecification",
         (option_to_yojson capacity_specification_summary_to_yojson x.capacity_specification));
       (
         "status",
         (option_to_yojson table_status_to_yojson x.status));
       (
         "region",
         (option_to_yojson region_to_yojson x.region));
       
  ])

let replica_specification_summary_list_to_yojson = 
  fun tree -> list_to_yojson replica_specification_summary_to_yojson tree

let replica_auto_scaling_specification_to_yojson = 
  fun (x: replica_auto_scaling_specification) -> assoc_to_yojson(
    [(
         "autoScalingSpecification",
         (option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification));
       (
         "region",
         (option_to_yojson region_to_yojson x.region));
       
  ])

let replica_auto_scaling_specification_list_to_yojson = 
  fun tree -> list_to_yojson replica_auto_scaling_specification_to_yojson tree

let point_in_time_recovery_summary_to_yojson = 
  fun (x: point_in_time_recovery_summary) -> assoc_to_yojson(
    [(
         "earliestRestorableTimestamp",
         (option_to_yojson timestamp__to_yojson x.earliest_restorable_timestamp));
       (
         "status",
         (Some (point_in_time_recovery_status_to_yojson x.status)));
       
  ])

let next_token_to_yojson = string_to_yojson

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       
  ])

let list_tables_response_to_yojson = 
  fun (x: list_tables_response) -> assoc_to_yojson(
    [(
         "tables",
         (option_to_yojson table_summary_list_to_yojson x.tables));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_tables_request_to_yojson = 
  fun (x: list_tables_request) -> assoc_to_yojson(
    [(
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       (
         "maxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let keyspace_summary_to_yojson = 
  fun (x: keyspace_summary) -> assoc_to_yojson(
    [(
         "replicationRegions",
         (option_to_yojson region_list_to_yojson x.replication_regions));
       (
         "replicationStrategy",
         (Some (rs_to_yojson x.replication_strategy)));
       (
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let keyspace_summary_list_to_yojson = 
  fun tree -> list_to_yojson keyspace_summary_to_yojson tree

let list_keyspaces_response_to_yojson = 
  fun (x: list_keyspaces_response) -> assoc_to_yojson(
    [(
         "keyspaces",
         (Some (keyspace_summary_list_to_yojson x.keyspaces)));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_keyspaces_request_to_yojson = 
  fun (x: list_keyspaces_request) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let get_table_auto_scaling_settings_response_to_yojson = 
  fun (x: get_table_auto_scaling_settings_response) -> assoc_to_yojson(
    [(
         "replicaSpecifications",
         (option_to_yojson replica_auto_scaling_specification_list_to_yojson x.replica_specifications));
       (
         "autoScalingSpecification",
         (option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification));
       (
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       (
         "tableName",
         (Some (table_name_to_yojson x.table_name)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let get_table_auto_scaling_settings_request_to_yojson = 
  fun (x: get_table_auto_scaling_settings_request) -> assoc_to_yojson(
    [(
         "tableName",
         (Some (table_name_to_yojson x.table_name)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let comment_to_yojson = 
  fun (x: comment) -> assoc_to_yojson(
    [(
         "message",
         (Some (base_string_to_yojson x.message)));
       
  ])

let get_table_response_to_yojson = 
  fun (x: get_table_response) -> assoc_to_yojson(
    [(
         "replicaSpecifications",
         (option_to_yojson replica_specification_summary_list_to_yojson x.replica_specifications));
       (
         "clientSideTimestamps",
         (option_to_yojson client_side_timestamps_to_yojson x.client_side_timestamps));
       (
         "comment",
         (option_to_yojson comment_to_yojson x.comment));
       (
         "defaultTimeToLive",
         (option_to_yojson default_time_to_live_to_yojson x.default_time_to_live));
       (
         "ttl",
         (option_to_yojson time_to_live_to_yojson x.ttl));
       (
         "pointInTimeRecovery",
         (option_to_yojson point_in_time_recovery_summary_to_yojson x.point_in_time_recovery));
       (
         "encryptionSpecification",
         (option_to_yojson encryption_specification_to_yojson x.encryption_specification));
       (
         "capacitySpecification",
         (option_to_yojson capacity_specification_summary_to_yojson x.capacity_specification));
       (
         "schemaDefinition",
         (option_to_yojson schema_definition_to_yojson x.schema_definition));
       (
         "status",
         (option_to_yojson table_status_to_yojson x.status));
       (
         "creationTimestamp",
         (option_to_yojson timestamp__to_yojson x.creation_timestamp));
       (
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       (
         "tableName",
         (Some (table_name_to_yojson x.table_name)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let get_table_request_to_yojson = 
  fun (x: get_table_request) -> assoc_to_yojson(
    [(
         "tableName",
         (Some (table_name_to_yojson x.table_name)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let get_keyspace_response_to_yojson = 
  fun (x: get_keyspace_response) -> assoc_to_yojson(
    [(
         "replicationRegions",
         (option_to_yojson region_list_to_yojson x.replication_regions));
       (
         "replicationStrategy",
         (Some (rs_to_yojson x.replication_strategy)));
       (
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let get_keyspace_request_to_yojson = 
  fun (x: get_keyspace_request) -> assoc_to_yojson(
    [(
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let delete_table_response_to_yojson = 
  fun (x: delete_table_response) -> assoc_to_yojson(
    [
  ])

let delete_table_request_to_yojson = 
  fun (x: delete_table_request) -> assoc_to_yojson(
    [(
         "tableName",
         (Some (table_name_to_yojson x.table_name)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let delete_keyspace_response_to_yojson = 
  fun (x: delete_keyspace_response) -> assoc_to_yojson(
    [
  ])

let delete_keyspace_request_to_yojson = 
  fun (x: delete_keyspace_request) -> assoc_to_yojson(
    [(
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let create_table_response_to_yojson = 
  fun (x: create_table_response) -> assoc_to_yojson(
    [(
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       
  ])

let create_table_request_to_yojson = 
  fun (x: create_table_request) -> assoc_to_yojson(
    [(
         "replicaSpecifications",
         (option_to_yojson replica_specification_list_to_yojson x.replica_specifications));
       (
         "autoScalingSpecification",
         (option_to_yojson auto_scaling_specification_to_yojson x.auto_scaling_specification));
       (
         "clientSideTimestamps",
         (option_to_yojson client_side_timestamps_to_yojson x.client_side_timestamps));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "defaultTimeToLive",
         (option_to_yojson default_time_to_live_to_yojson x.default_time_to_live));
       (
         "ttl",
         (option_to_yojson time_to_live_to_yojson x.ttl));
       (
         "pointInTimeRecovery",
         (option_to_yojson point_in_time_recovery_to_yojson x.point_in_time_recovery));
       (
         "encryptionSpecification",
         (option_to_yojson encryption_specification_to_yojson x.encryption_specification));
       (
         "capacitySpecification",
         (option_to_yojson capacity_specification_to_yojson x.capacity_specification));
       (
         "comment",
         (option_to_yojson comment_to_yojson x.comment));
       (
         "schemaDefinition",
         (Some (schema_definition_to_yojson x.schema_definition)));
       (
         "tableName",
         (Some (table_name_to_yojson x.table_name)));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let create_keyspace_response_to_yojson = 
  fun (x: create_keyspace_response) -> assoc_to_yojson(
    [(
         "resourceArn",
         (Some (ar_n_to_yojson x.resource_arn)));
       
  ])

let create_keyspace_request_to_yojson = 
  fun (x: create_keyspace_request) -> assoc_to_yojson(
    [(
         "replicationSpecification",
         (option_to_yojson replication_specification_to_yojson x.replication_specification));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "keyspaceName",
         (Some (keyspace_name_to_yojson x.keyspace_name)));
       
  ])

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

