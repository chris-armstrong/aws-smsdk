open Types 
let (let+) res map = Result.map map res
module UpdateTimeToLive = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_time_to_live_input) ->
    let input = Serializers.update_time_to_live_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UpdateTimeToLive" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_time_to_live_output_of_yojson
      ~error_deserializer
      
end

module UpdateTableReplicaAutoScaling = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_table_replica_auto_scaling_input) ->
    let input = Serializers.update_table_replica_auto_scaling_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UpdateTableReplicaAutoScaling" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_table_replica_auto_scaling_output_of_yojson
      ~error_deserializer
      
end

module UpdateTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_table_input) ->
    let input = Serializers.update_table_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UpdateTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_table_output_of_yojson
      ~error_deserializer
      
end

module UpdateKinesisStreamingDestination = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_kinesis_streaming_destination_input) ->
    let input = Serializers.update_kinesis_streaming_destination_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UpdateKinesisStreamingDestination" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_kinesis_streaming_destination_output_of_yojson
      ~error_deserializer
      
end

module UpdateItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "ConditionalCheckFailedException" ->
         (`ConditionalCheckFailedException (conditional_check_failed_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ItemCollectionSizeLimitExceededException" ->
         (`ItemCollectionSizeLimitExceededException (item_collection_size_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TransactionConflictException" ->
         (`TransactionConflictException (transaction_conflict_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_item_input) ->
    let input = Serializers.update_item_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UpdateItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_item_output_of_yojson
      ~error_deserializer
      
end

module UpdateGlobalTableSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "GlobalTableNotFoundException" ->
         (`GlobalTableNotFoundException (global_table_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "IndexNotFoundException" ->
         (`IndexNotFoundException (index_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ReplicaNotFoundException" ->
         (`ReplicaNotFoundException (replica_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_global_table_settings_input) ->
    let input = Serializers.update_global_table_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UpdateGlobalTableSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_global_table_settings_output_of_yojson
      ~error_deserializer
      
end

module UpdateGlobalTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "GlobalTableNotFoundException" ->
         (`GlobalTableNotFoundException (global_table_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ReplicaAlreadyExistsException" ->
         (`ReplicaAlreadyExistsException (replica_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ReplicaNotFoundException" ->
         (`ReplicaNotFoundException (replica_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableNotFoundException" ->
         (`TableNotFoundException (table_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_global_table_input) ->
    let input = Serializers.update_global_table_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UpdateGlobalTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_global_table_output_of_yojson
      ~error_deserializer
      
end

module UpdateContributorInsights = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_contributor_insights_input) ->
    let input = Serializers.update_contributor_insights_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UpdateContributorInsights" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_contributor_insights_output_of_yojson
      ~error_deserializer
      
end

module UpdateContinuousBackups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "ContinuousBackupsUnavailableException" ->
         (`ContinuousBackupsUnavailableException (continuous_backups_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableNotFoundException" ->
         (`TableNotFoundException (table_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_continuous_backups_input) ->
    let input = Serializers.update_continuous_backups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UpdateContinuousBackups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_continuous_backups_output_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_input) ->
    let input = Serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module TransactWriteItems = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "IdempotentParameterMismatchException" ->
         (`IdempotentParameterMismatchException (idempotent_parameter_mismatch_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TransactionCanceledException" ->
         (`TransactionCanceledException (transaction_canceled_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TransactionInProgressException" ->
         (`TransactionInProgressException (transaction_in_progress_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: transact_write_items_input) ->
    let input = Serializers.transact_write_items_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.TransactWriteItems" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.transact_write_items_output_of_yojson
      ~error_deserializer
      
end

module TransactGetItems = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TransactionCanceledException" ->
         (`TransactionCanceledException (transaction_canceled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: transact_get_items_input) ->
    let input = Serializers.transact_get_items_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.TransactGetItems" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.transact_get_items_output_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_input) ->
    let input = Serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module Scan = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: scan_input) ->
    let input = Serializers.scan_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.Scan" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.scan_output_of_yojson
      ~error_deserializer
      
end

module RestoreTableToPointInTime = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidRestoreTimeException" ->
         (`InvalidRestoreTimeException (invalid_restore_time_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "PointInTimeRecoveryUnavailableException" ->
         (`PointInTimeRecoveryUnavailableException (point_in_time_recovery_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableAlreadyExistsException" ->
         (`TableAlreadyExistsException (table_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableInUseException" ->
         (`TableInUseException (table_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableNotFoundException" ->
         (`TableNotFoundException (table_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: restore_table_to_point_in_time_input) ->
    let input = Serializers.restore_table_to_point_in_time_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.RestoreTableToPointInTime" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.restore_table_to_point_in_time_output_of_yojson
      ~error_deserializer
      
end

module RestoreTableFromBackup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "BackupInUseException" ->
         (`BackupInUseException (backup_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "BackupNotFoundException" ->
         (`BackupNotFoundException (backup_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableAlreadyExistsException" ->
         (`TableAlreadyExistsException (table_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableInUseException" ->
         (`TableInUseException (table_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: restore_table_from_backup_input) ->
    let input = Serializers.restore_table_from_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.RestoreTableFromBackup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.restore_table_from_backup_output_of_yojson
      ~error_deserializer
      
end

module Query = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: query_input) ->
    let input = Serializers.query_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.Query" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.query_output_of_yojson
      ~error_deserializer
      
end

module PutResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "PolicyNotFoundException" ->
         (`PolicyNotFoundException (policy_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_resource_policy_input) ->
    let input = Serializers.put_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.PutResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_resource_policy_output_of_yojson
      ~error_deserializer
      
end

module PutItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "ConditionalCheckFailedException" ->
         (`ConditionalCheckFailedException (conditional_check_failed_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ItemCollectionSizeLimitExceededException" ->
         (`ItemCollectionSizeLimitExceededException (item_collection_size_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TransactionConflictException" ->
         (`TransactionConflictException (transaction_conflict_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_item_input) ->
    let input = Serializers.put_item_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.PutItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_item_output_of_yojson
      ~error_deserializer
      
end

module ListTagsOfResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_of_resource_input) ->
    let input = Serializers.list_tags_of_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ListTagsOfResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_of_resource_output_of_yojson
      ~error_deserializer
      
end

module ListTables = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tables_input) ->
    let input = Serializers.list_tables_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ListTables" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tables_output_of_yojson
      ~error_deserializer
      
end

module ListImports = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_imports_input) ->
    let input = Serializers.list_imports_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ListImports" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_imports_output_of_yojson
      ~error_deserializer
      
end

module ListGlobalTables = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_global_tables_input) ->
    let input = Serializers.list_global_tables_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ListGlobalTables" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_global_tables_output_of_yojson
      ~error_deserializer
      
end

module ListExports = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_exports_input) ->
    let input = Serializers.list_exports_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ListExports" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_exports_output_of_yojson
      ~error_deserializer
      
end

module ListContributorInsights = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_contributor_insights_input) ->
    let input = Serializers.list_contributor_insights_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ListContributorInsights" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_contributor_insights_output_of_yojson
      ~error_deserializer
      
end

module ListBackups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_backups_input) ->
    let input = Serializers.list_backups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ListBackups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_backups_output_of_yojson
      ~error_deserializer
      
end

module ImportTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "ImportConflictException" ->
         (`ImportConflictException (import_conflict_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: import_table_input) ->
    let input = Serializers.import_table_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ImportTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.import_table_output_of_yojson
      ~error_deserializer
      
end

module GetResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "PolicyNotFoundException" ->
         (`PolicyNotFoundException (policy_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_policy_input) ->
    let input = Serializers.get_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.GetResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_policy_output_of_yojson
      ~error_deserializer
      
end

module GetItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_item_input) ->
    let input = Serializers.get_item_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.GetItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_item_output_of_yojson
      ~error_deserializer
      
end

module ExportTableToPointInTime = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "ExportConflictException" ->
         (`ExportConflictException (export_conflict_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidExportTimeException" ->
         (`InvalidExportTimeException (invalid_export_time_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "PointInTimeRecoveryUnavailableException" ->
         (`PointInTimeRecoveryUnavailableException (point_in_time_recovery_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableNotFoundException" ->
         (`TableNotFoundException (table_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: export_table_to_point_in_time_input) ->
    let input = Serializers.export_table_to_point_in_time_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ExportTableToPointInTime" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.export_table_to_point_in_time_output_of_yojson
      ~error_deserializer
      
end

module ExecuteTransaction = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "IdempotentParameterMismatchException" ->
         (`IdempotentParameterMismatchException (idempotent_parameter_mismatch_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TransactionCanceledException" ->
         (`TransactionCanceledException (transaction_canceled_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TransactionInProgressException" ->
         (`TransactionInProgressException (transaction_in_progress_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: execute_transaction_input) ->
    let input = Serializers.execute_transaction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ExecuteTransaction" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.execute_transaction_output_of_yojson
      ~error_deserializer
      
end

module ExecuteStatement = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "ConditionalCheckFailedException" ->
         (`ConditionalCheckFailedException (conditional_check_failed_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "DuplicateItemException" ->
         (`DuplicateItemException (duplicate_item_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ItemCollectionSizeLimitExceededException" ->
         (`ItemCollectionSizeLimitExceededException (item_collection_size_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TransactionConflictException" ->
         (`TransactionConflictException (transaction_conflict_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: execute_statement_input) ->
    let input = Serializers.execute_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.ExecuteStatement" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.execute_statement_output_of_yojson
      ~error_deserializer
      
end

module EnableKinesisStreamingDestination = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: kinesis_streaming_destination_input) ->
    let input = Serializers.kinesis_streaming_destination_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.EnableKinesisStreamingDestination" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.kinesis_streaming_destination_output_of_yojson
      ~error_deserializer
      
end

module DisableKinesisStreamingDestination = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: kinesis_streaming_destination_input) ->
    let input = Serializers.kinesis_streaming_destination_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DisableKinesisStreamingDestination" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.kinesis_streaming_destination_output_of_yojson
      ~error_deserializer
      
end

module DescribeTimeToLive = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_time_to_live_input) ->
    let input = Serializers.describe_time_to_live_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeTimeToLive" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_time_to_live_output_of_yojson
      ~error_deserializer
      
end

module DescribeTableReplicaAutoScaling = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_table_replica_auto_scaling_input) ->
    let input = Serializers.describe_table_replica_auto_scaling_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeTableReplicaAutoScaling" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_table_replica_auto_scaling_output_of_yojson
      ~error_deserializer
      
end

module DescribeTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_table_input) ->
    let input = Serializers.describe_table_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_table_output_of_yojson
      ~error_deserializer
      
end

module DescribeLimits = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_limits_input) ->
    let input = Serializers.describe_limits_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeLimits" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_limits_output_of_yojson
      ~error_deserializer
      
end

module DescribeKinesisStreamingDestination = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_kinesis_streaming_destination_input) ->
    let input = Serializers.describe_kinesis_streaming_destination_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeKinesisStreamingDestination" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_kinesis_streaming_destination_output_of_yojson
      ~error_deserializer
      
end

module DescribeImport = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "ImportNotFoundException" ->
         (`ImportNotFoundException (import_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_import_input) ->
    let input = Serializers.describe_import_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeImport" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_import_output_of_yojson
      ~error_deserializer
      
end

module DescribeGlobalTableSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "GlobalTableNotFoundException" ->
         (`GlobalTableNotFoundException (global_table_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_global_table_settings_input) ->
    let input = Serializers.describe_global_table_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeGlobalTableSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_global_table_settings_output_of_yojson
      ~error_deserializer
      
end

module DescribeGlobalTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "GlobalTableNotFoundException" ->
         (`GlobalTableNotFoundException (global_table_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_global_table_input) ->
    let input = Serializers.describe_global_table_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeGlobalTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_global_table_output_of_yojson
      ~error_deserializer
      
end

module DescribeExport = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "ExportNotFoundException" ->
         (`ExportNotFoundException (export_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_export_input) ->
    let input = Serializers.describe_export_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeExport" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_export_output_of_yojson
      ~error_deserializer
      
end

module DescribeEndpoints = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_endpoints_request) ->
    let input = Serializers.describe_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeEndpoints" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_endpoints_response_of_yojson
      ~error_deserializer
      
end

module DescribeContributorInsights = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_contributor_insights_input) ->
    let input = Serializers.describe_contributor_insights_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeContributorInsights" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_contributor_insights_output_of_yojson
      ~error_deserializer
      
end

module DescribeContinuousBackups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableNotFoundException" ->
         (`TableNotFoundException (table_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_continuous_backups_input) ->
    let input = Serializers.describe_continuous_backups_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeContinuousBackups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_continuous_backups_output_of_yojson
      ~error_deserializer
      
end

module DescribeBackup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "BackupNotFoundException" ->
         (`BackupNotFoundException (backup_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_backup_input) ->
    let input = Serializers.describe_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DescribeBackup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_backup_output_of_yojson
      ~error_deserializer
      
end

module DeleteTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_table_input) ->
    let input = Serializers.delete_table_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DeleteTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_table_output_of_yojson
      ~error_deserializer
      
end

module DeleteResourcePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "PolicyNotFoundException" ->
         (`PolicyNotFoundException (policy_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_resource_policy_input) ->
    let input = Serializers.delete_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DeleteResourcePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_resource_policy_output_of_yojson
      ~error_deserializer
      
end

module DeleteItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "ConditionalCheckFailedException" ->
         (`ConditionalCheckFailedException (conditional_check_failed_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ItemCollectionSizeLimitExceededException" ->
         (`ItemCollectionSizeLimitExceededException (item_collection_size_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TransactionConflictException" ->
         (`TransactionConflictException (transaction_conflict_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_item_input) ->
    let input = Serializers.delete_item_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DeleteItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_item_output_of_yojson
      ~error_deserializer
      
end

module DeleteBackup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "BackupInUseException" ->
         (`BackupInUseException (backup_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "BackupNotFoundException" ->
         (`BackupNotFoundException (backup_not_found_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_backup_input) ->
    let input = Serializers.delete_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.DeleteBackup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_backup_output_of_yojson
      ~error_deserializer
      
end

module CreateTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceInUseException" ->
         (`ResourceInUseException (resource_in_use_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_table_input) ->
    let input = Serializers.create_table_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.CreateTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_table_output_of_yojson
      ~error_deserializer
      
end

module CreateGlobalTable = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "GlobalTableAlreadyExistsException" ->
         (`GlobalTableAlreadyExistsException (global_table_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableNotFoundException" ->
         (`TableNotFoundException (table_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_global_table_input) ->
    let input = Serializers.create_global_table_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.CreateGlobalTable" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_global_table_output_of_yojson
      ~error_deserializer
      
end

module CreateBackup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "BackupInUseException" ->
         (`BackupInUseException (backup_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ContinuousBackupsUnavailableException" ->
         (`ContinuousBackupsUnavailableException (continuous_backups_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableInUseException" ->
         (`TableInUseException (table_in_use_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "TableNotFoundException" ->
         (`TableNotFoundException (table_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_backup_input) ->
    let input = Serializers.create_backup_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.CreateBackup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_backup_output_of_yojson
      ~error_deserializer
      
end

module BatchWriteItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ItemCollectionSizeLimitExceededException" ->
         (`ItemCollectionSizeLimitExceededException (item_collection_size_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_write_item_input) ->
    let input = Serializers.batch_write_item_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.BatchWriteItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_write_item_output_of_yojson
      ~error_deserializer
      
end

module BatchGetItem = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "InvalidEndpointException" ->
         (`InvalidEndpointException (invalid_endpoint_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ProvisionedThroughputExceededException" ->
         (`ProvisionedThroughputExceededException (provisioned_throughput_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | "com.amazonaws.dynamodb", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_get_item_input) ->
    let input = Serializers.batch_get_item_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.BatchGetItem" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_get_item_output_of_yojson
      ~error_deserializer
      
end

module BatchExecuteStatement = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.dynamodb", "InternalServerError" ->
         (`InternalServerError (internal_server_error_of_yojson tree path))
      | "com.amazonaws.dynamodb", "RequestLimitExceeded" ->
         (`RequestLimitExceeded (request_limit_exceeded_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_execute_statement_input) ->
    let input = Serializers.batch_execute_statement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"DynamoDB_20120810.BatchExecuteStatement" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_execute_statement_output_of_yojson
      ~error_deserializer
      
end

