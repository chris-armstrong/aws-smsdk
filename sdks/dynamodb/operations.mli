open Types 
module BatchExecuteStatement : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_execute_statement_input ->
        (batch_execute_statement_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `RequestLimitExceeded of request_limit_exceeded
            
        ]
      ) result
end

module BatchGetItem : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_item_input ->
        (batch_get_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module BatchWriteItem : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_write_item_input ->
        (batch_write_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateBackup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_backup_input ->
        (create_backup_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BackupInUseException of backup_in_use_exception
            | `ContinuousBackupsUnavailableException of continuous_backups_unavailable_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TableInUseException of table_in_use_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
end

module CreateGlobalTable : sig
  val request :
    Smaws_Lib.Context.t ->
      create_global_table_input ->
        (create_global_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableAlreadyExistsException of global_table_already_exists_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
end

module CreateTable : sig
  val request :
    Smaws_Lib.Context.t ->
      create_table_input ->
        (create_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
end

module DeleteBackup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_backup_input ->
        (delete_backup_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BackupInUseException of backup_in_use_exception
            | `BackupNotFoundException of backup_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module DeleteItem : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_item_input ->
        (delete_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionConflictException of transaction_conflict_exception
            
        ]
      ) result
end

module DeleteResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_input ->
        (delete_resource_policy_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `PolicyNotFoundException of policy_not_found_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteTable : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_table_input ->
        (delete_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeBackup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_backup_input ->
        (describe_backup_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BackupNotFoundException of backup_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
end

module DescribeContinuousBackups : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_continuous_backups_input ->
        (describe_continuous_backups_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
end

module DescribeContributorInsights : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_contributor_insights_input ->
        (describe_contributor_insights_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEndpoints : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_endpoints_request ->
        (describe_endpoints_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module DescribeExport : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_export_input ->
        (describe_export_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExportNotFoundException of export_not_found_exception
            | `InternalServerError of internal_server_error
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module DescribeGlobalTable : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_global_table_input ->
        (describe_global_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableNotFoundException of global_table_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
end

module DescribeGlobalTableSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_global_table_settings_input ->
        (describe_global_table_settings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableNotFoundException of global_table_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
end

module DescribeImport : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_import_input ->
        (describe_import_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ImportNotFoundException of import_not_found_exception
            
        ]
      ) result
end

module DescribeKinesisStreamingDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_kinesis_streaming_destination_input ->
        (describe_kinesis_streaming_destination_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
end

module DescribeTable : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_table_input ->
        (describe_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeTableReplicaAutoScaling : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_table_replica_auto_scaling_input ->
        (describe_table_replica_auto_scaling_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeTimeToLive : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_time_to_live_input ->
        (describe_time_to_live_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisableKinesisStreamingDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      kinesis_streaming_destination_input ->
        (kinesis_streaming_destination_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module EnableKinesisStreamingDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      kinesis_streaming_destination_input ->
        (kinesis_streaming_destination_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ExecuteStatement : sig
  val request :
    Smaws_Lib.Context.t ->
      execute_statement_input ->
        (execute_statement_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `DuplicateItemException of duplicate_item_exception
            | `InternalServerError of internal_server_error
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionConflictException of transaction_conflict_exception
            
        ]
      ) result
end

module ExecuteTransaction : sig
  val request :
    Smaws_Lib.Context.t ->
      execute_transaction_input ->
        (execute_transaction_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
            | `InternalServerError of internal_server_error
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionCanceledException of transaction_canceled_exception
            | `TransactionInProgressException of transaction_in_progress_exception
            
        ]
      ) result
end

module ExportTableToPointInTime : sig
  val request :
    Smaws_Lib.Context.t ->
      export_table_to_point_in_time_input ->
        (export_table_to_point_in_time_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExportConflictException of export_conflict_exception
            | `InternalServerError of internal_server_error
            | `InvalidExportTimeException of invalid_export_time_exception
            | `LimitExceededException of limit_exceeded_exception
            | `PointInTimeRecoveryUnavailableException of point_in_time_recovery_unavailable_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
end

module GetItem : sig
  val request :
    Smaws_Lib.Context.t ->
      get_item_input ->
        (get_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
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
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `PolicyNotFoundException of policy_not_found_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ImportTable : sig
  val request :
    Smaws_Lib.Context.t ->
      import_table_input ->
        (import_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ImportConflictException of import_conflict_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
end

module ListBackups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_backups_input ->
        (list_backups_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
end

module ListContributorInsights : sig
  val request :
    Smaws_Lib.Context.t ->
      list_contributor_insights_input ->
        (list_contributor_insights_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListExports : sig
  val request :
    Smaws_Lib.Context.t ->
      list_exports_input ->
        (list_exports_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListGlobalTables : sig
  val request :
    Smaws_Lib.Context.t ->
      list_global_tables_input ->
        (list_global_tables_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
end

module ListImports : sig
  val request :
    Smaws_Lib.Context.t ->
      list_imports_input ->
        (list_imports_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module ListTables : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tables_input ->
        (list_tables_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            
        ]
      ) result
end

module ListTagsOfResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_of_resource_input ->
        (list_tags_of_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutItem : sig
  val request :
    Smaws_Lib.Context.t ->
      put_item_input ->
        (put_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionConflictException of transaction_conflict_exception
            
        ]
      ) result
end

module PutResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_input ->
        (put_resource_policy_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `PolicyNotFoundException of policy_not_found_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module Query : sig
  val request :
    Smaws_Lib.Context.t ->
      query_input ->
        (query_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module RestoreTableFromBackup : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_table_from_backup_input ->
        (restore_table_from_backup_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BackupInUseException of backup_in_use_exception
            | `BackupNotFoundException of backup_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `TableAlreadyExistsException of table_already_exists_exception
            | `TableInUseException of table_in_use_exception
            
        ]
      ) result
end

module RestoreTableToPointInTime : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_table_to_point_in_time_input ->
        (restore_table_to_point_in_time_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `InvalidRestoreTimeException of invalid_restore_time_exception
            | `LimitExceededException of limit_exceeded_exception
            | `PointInTimeRecoveryUnavailableException of point_in_time_recovery_unavailable_exception
            | `TableAlreadyExistsException of table_already_exists_exception
            | `TableInUseException of table_in_use_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
end

module Scan : sig
  val request :
    Smaws_Lib.Context.t ->
      scan_input ->
        (scan_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TransactGetItems : sig
  val request :
    Smaws_Lib.Context.t ->
      transact_get_items_input ->
        (transact_get_items_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionCanceledException of transaction_canceled_exception
            
        ]
      ) result
end

module TransactWriteItems : sig
  val request :
    Smaws_Lib.Context.t ->
      transact_write_items_input ->
        (transact_write_items_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionCanceledException of transaction_canceled_exception
            | `TransactionInProgressException of transaction_in_progress_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateContinuousBackups : sig
  val request :
    Smaws_Lib.Context.t ->
      update_continuous_backups_input ->
        (update_continuous_backups_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ContinuousBackupsUnavailableException of continuous_backups_unavailable_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
end

module UpdateContributorInsights : sig
  val request :
    Smaws_Lib.Context.t ->
      update_contributor_insights_input ->
        (update_contributor_insights_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateGlobalTable : sig
  val request :
    Smaws_Lib.Context.t ->
      update_global_table_input ->
        (update_global_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableNotFoundException of global_table_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ReplicaAlreadyExistsException of replica_already_exists_exception
            | `ReplicaNotFoundException of replica_not_found_exception
            | `TableNotFoundException of table_not_found_exception
            
        ]
      ) result
end

module UpdateGlobalTableSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_global_table_settings_input ->
        (update_global_table_settings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `GlobalTableNotFoundException of global_table_not_found_exception
            | `IndexNotFoundException of index_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ReplicaNotFoundException of replica_not_found_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
end

module UpdateItem : sig
  val request :
    Smaws_Lib.Context.t ->
      update_item_input ->
        (update_item_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `ItemCollectionSizeLimitExceededException of item_collection_size_limit_exceeded_exception
            | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
            | `RequestLimitExceeded of request_limit_exceeded
            | `ResourceNotFoundException of resource_not_found_exception
            | `TransactionConflictException of transaction_conflict_exception
            
        ]
      ) result
end

module UpdateKinesisStreamingDestination : sig
  val request :
    Smaws_Lib.Context.t ->
      update_kinesis_streaming_destination_input ->
        (update_kinesis_streaming_destination_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateTable : sig
  val request :
    Smaws_Lib.Context.t ->
      update_table_input ->
        (update_table_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateTableReplicaAutoScaling : sig
  val request :
    Smaws_Lib.Context.t ->
      update_table_replica_auto_scaling_input ->
        (update_table_replica_auto_scaling_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateTimeToLive : sig
  val request :
    Smaws_Lib.Context.t ->
      update_time_to_live_input ->
        (update_time_to_live_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidEndpointException of invalid_endpoint_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

