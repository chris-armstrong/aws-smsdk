open Types 
let (let+) res map = Result.map map res
module AddPermission = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "OverLimit" ->
         (`OverLimit (over_limit_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: add_permission_request) ->
    let input = Serializers.add_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.AddPermission" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module CancelMessageMoveTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_message_move_task_request) ->
    let input = Serializers.cancel_message_move_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.CancelMessageMoveTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_message_move_task_result_of_yojson
      ~error_deserializer
      
end

module ChangeMessageVisibility = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "MessageNotInflight" ->
         (`MessageNotInflight (message_not_inflight_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "ReceiptHandleIsInvalid" ->
         (`ReceiptHandleIsInvalid (receipt_handle_is_invalid_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: change_message_visibility_request) ->
    let input = Serializers.change_message_visibility_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.ChangeMessageVisibility" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module ChangeMessageVisibilityBatch = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "BatchEntryIdsNotDistinct" ->
         (`BatchEntryIdsNotDistinct (batch_entry_ids_not_distinct_of_yojson tree path))
      | "com.amazonaws.sqs", "EmptyBatchRequest" ->
         (`EmptyBatchRequest (empty_batch_request_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidBatchEntryId" ->
         (`InvalidBatchEntryId (invalid_batch_entry_id_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "TooManyEntriesInBatchRequest" ->
         (`TooManyEntriesInBatchRequest (too_many_entries_in_batch_request_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: change_message_visibility_batch_request) ->
    let input = Serializers.change_message_visibility_batch_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.ChangeMessageVisibilityBatch" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.change_message_visibility_batch_result_of_yojson
      ~error_deserializer
      
end

module CreateQueue = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidAttributeName" ->
         (`InvalidAttributeName (invalid_attribute_name_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidAttributeValue" ->
         (`InvalidAttributeValue (invalid_attribute_value_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDeletedRecently" ->
         (`QueueDeletedRecently (queue_deleted_recently_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueNameExists" ->
         (`QueueNameExists (queue_name_exists_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_queue_request) ->
    let input = Serializers.create_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.CreateQueue" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_queue_result_of_yojson
      ~error_deserializer
      
end

module DeleteMessage = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidIdFormat" ->
         (`InvalidIdFormat (invalid_id_format_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "ReceiptHandleIsInvalid" ->
         (`ReceiptHandleIsInvalid (receipt_handle_is_invalid_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_message_request) ->
    let input = Serializers.delete_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.DeleteMessage" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteMessageBatch = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "BatchEntryIdsNotDistinct" ->
         (`BatchEntryIdsNotDistinct (batch_entry_ids_not_distinct_of_yojson tree path))
      | "com.amazonaws.sqs", "EmptyBatchRequest" ->
         (`EmptyBatchRequest (empty_batch_request_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidBatchEntryId" ->
         (`InvalidBatchEntryId (invalid_batch_entry_id_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "TooManyEntriesInBatchRequest" ->
         (`TooManyEntriesInBatchRequest (too_many_entries_in_batch_request_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_message_batch_request) ->
    let input = Serializers.delete_message_batch_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.DeleteMessageBatch" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_message_batch_result_of_yojson
      ~error_deserializer
      
end

module DeleteQueue = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_queue_request) ->
    let input = Serializers.delete_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.DeleteQueue" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module GetQueueAttributes = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidAttributeName" ->
         (`InvalidAttributeName (invalid_attribute_name_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_queue_attributes_request) ->
    let input = Serializers.get_queue_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.GetQueueAttributes" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_queue_attributes_result_of_yojson
      ~error_deserializer
      
end

module GetQueueUrl = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_queue_url_request) ->
    let input = Serializers.get_queue_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.GetQueueUrl" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_queue_url_result_of_yojson
      ~error_deserializer
      
end

module ListDeadLetterSourceQueues = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_dead_letter_source_queues_request) ->
    let input = Serializers.list_dead_letter_source_queues_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.ListDeadLetterSourceQueues" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_dead_letter_source_queues_result_of_yojson
      ~error_deserializer
      
end

module ListMessageMoveTasks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_message_move_tasks_request) ->
    let input = Serializers.list_message_move_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.ListMessageMoveTasks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_message_move_tasks_result_of_yojson
      ~error_deserializer
      
end

module ListQueueTags = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_queue_tags_request) ->
    let input = Serializers.list_queue_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.ListQueueTags" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_queue_tags_result_of_yojson
      ~error_deserializer
      
end

module ListQueues = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_queues_request) ->
    let input = Serializers.list_queues_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.ListQueues" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_queues_result_of_yojson
      ~error_deserializer
      
end

module PurgeQueue = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "PurgeQueueInProgress" ->
         (`PurgeQueueInProgress (purge_queue_in_progress_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: purge_queue_request) ->
    let input = Serializers.purge_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.PurgeQueue" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module ReceiveMessage = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsAccessDenied" ->
         (`KmsAccessDenied (kms_access_denied_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsDisabled" ->
         (`KmsDisabled (kms_disabled_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsInvalidKeyUsage" ->
         (`KmsInvalidKeyUsage (kms_invalid_key_usage_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsInvalidState" ->
         (`KmsInvalidState (kms_invalid_state_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsNotFound" ->
         (`KmsNotFound (kms_not_found_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsOptInRequired" ->
         (`KmsOptInRequired (kms_opt_in_required_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsThrottled" ->
         (`KmsThrottled (kms_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "OverLimit" ->
         (`OverLimit (over_limit_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: receive_message_request) ->
    let input = Serializers.receive_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.ReceiveMessage" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.receive_message_result_of_yojson
      ~error_deserializer
      
end

module RemovePermission = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_permission_request) ->
    let input = Serializers.remove_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.RemovePermission" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module SendMessage = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidMessageContents" ->
         (`InvalidMessageContents (invalid_message_contents_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsAccessDenied" ->
         (`KmsAccessDenied (kms_access_denied_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsDisabled" ->
         (`KmsDisabled (kms_disabled_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsInvalidKeyUsage" ->
         (`KmsInvalidKeyUsage (kms_invalid_key_usage_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsInvalidState" ->
         (`KmsInvalidState (kms_invalid_state_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsNotFound" ->
         (`KmsNotFound (kms_not_found_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsOptInRequired" ->
         (`KmsOptInRequired (kms_opt_in_required_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsThrottled" ->
         (`KmsThrottled (kms_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: send_message_request) ->
    let input = Serializers.send_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.SendMessage" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.send_message_result_of_yojson
      ~error_deserializer
      
end

module SendMessageBatch = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "BatchEntryIdsNotDistinct" ->
         (`BatchEntryIdsNotDistinct (batch_entry_ids_not_distinct_of_yojson tree path))
      | "com.amazonaws.sqs", "BatchRequestTooLong" ->
         (`BatchRequestTooLong (batch_request_too_long_of_yojson tree path))
      | "com.amazonaws.sqs", "EmptyBatchRequest" ->
         (`EmptyBatchRequest (empty_batch_request_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidBatchEntryId" ->
         (`InvalidBatchEntryId (invalid_batch_entry_id_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsAccessDenied" ->
         (`KmsAccessDenied (kms_access_denied_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsDisabled" ->
         (`KmsDisabled (kms_disabled_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsInvalidKeyUsage" ->
         (`KmsInvalidKeyUsage (kms_invalid_key_usage_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsInvalidState" ->
         (`KmsInvalidState (kms_invalid_state_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsNotFound" ->
         (`KmsNotFound (kms_not_found_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsOptInRequired" ->
         (`KmsOptInRequired (kms_opt_in_required_of_yojson tree path))
      | "com.amazonaws.sqs", "KmsThrottled" ->
         (`KmsThrottled (kms_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "TooManyEntriesInBatchRequest" ->
         (`TooManyEntriesInBatchRequest (too_many_entries_in_batch_request_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: send_message_batch_request) ->
    let input = Serializers.send_message_batch_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.SendMessageBatch" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.send_message_batch_result_of_yojson
      ~error_deserializer
      
end

module SetQueueAttributes = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidAttributeName" ->
         (`InvalidAttributeName (invalid_attribute_name_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidAttributeValue" ->
         (`InvalidAttributeValue (invalid_attribute_value_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "OverLimit" ->
         (`OverLimit (over_limit_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: set_queue_attributes_request) ->
    let input = Serializers.set_queue_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.SetQueueAttributes" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module StartMessageMoveTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_message_move_task_request) ->
    let input = Serializers.start_message_move_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.StartMessageMoveTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_message_move_task_result_of_yojson
      ~error_deserializer
      
end

module TagQueue = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_queue_request) ->
    let input = Serializers.tag_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.TagQueue" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UntagQueue = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.sqs", "InvalidAddress" ->
         (`InvalidAddress (invalid_address_of_yojson tree path))
      | "com.amazonaws.sqs", "InvalidSecurity" ->
         (`InvalidSecurity (invalid_security_of_yojson tree path))
      | "com.amazonaws.sqs", "QueueDoesNotExist" ->
         (`QueueDoesNotExist (queue_does_not_exist_of_yojson tree path))
      | "com.amazonaws.sqs", "RequestThrottled" ->
         (`RequestThrottled (request_throttled_of_yojson tree path))
      | "com.amazonaws.sqs", "UnsupportedOperation" ->
         (`UnsupportedOperation (unsupported_operation_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_queue_request) ->
    let input = Serializers.untag_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AmazonSQS.UntagQueue" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

