open Types 
module UntagQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module TagQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module StartMessageMoveTask : sig
  val request :
    Smaws_Lib.Context.t ->
      start_message_move_task_request ->
        (start_message_move_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module SetQueueAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
      set_queue_attributes_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidAttributeName of invalid_attribute_name
            | `InvalidAttributeValue of invalid_attribute_value
            | `InvalidSecurity of invalid_security
            | `OverLimit of over_limit
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module SendMessageBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      send_message_batch_request ->
        (send_message_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
            | `BatchRequestTooLong of batch_request_too_long
            | `EmptyBatchRequest of empty_batch_request
            | `InvalidAddress of invalid_address
            | `InvalidBatchEntryId of invalid_batch_entry_id
            | `InvalidSecurity of invalid_security
            | `KmsAccessDenied of kms_access_denied
            | `KmsDisabled of kms_disabled
            | `KmsInvalidKeyUsage of kms_invalid_key_usage
            | `KmsInvalidState of kms_invalid_state
            | `KmsNotFound of kms_not_found
            | `KmsOptInRequired of kms_opt_in_required
            | `KmsThrottled of kms_throttled
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module SendMessage : sig
  val request :
    Smaws_Lib.Context.t ->
      send_message_request ->
        (send_message_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidMessageContents of invalid_message_contents
            | `InvalidSecurity of invalid_security
            | `KmsAccessDenied of kms_access_denied
            | `KmsDisabled of kms_disabled
            | `KmsInvalidKeyUsage of kms_invalid_key_usage
            | `KmsInvalidState of kms_invalid_state
            | `KmsNotFound of kms_not_found
            | `KmsOptInRequired of kms_opt_in_required
            | `KmsThrottled of kms_throttled
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module RemovePermission : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module ReceiveMessage : sig
  val request :
    Smaws_Lib.Context.t ->
      receive_message_request ->
        (receive_message_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `KmsAccessDenied of kms_access_denied
            | `KmsDisabled of kms_disabled
            | `KmsInvalidKeyUsage of kms_invalid_key_usage
            | `KmsInvalidState of kms_invalid_state
            | `KmsNotFound of kms_not_found
            | `KmsOptInRequired of kms_opt_in_required
            | `KmsThrottled of kms_throttled
            | `OverLimit of over_limit
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module PurgeQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      purge_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `PurgeQueueInProgress of purge_queue_in_progress
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module ListQueues : sig
  val request :
    Smaws_Lib.Context.t ->
      list_queues_request ->
        (list_queues_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module ListQueueTags : sig
  val request :
    Smaws_Lib.Context.t ->
      list_queue_tags_request ->
        (list_queue_tags_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module ListMessageMoveTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_message_move_tasks_request ->
        (list_message_move_tasks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module ListDeadLetterSourceQueues : sig
  val request :
    Smaws_Lib.Context.t ->
      list_dead_letter_source_queues_request ->
        (list_dead_letter_source_queues_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module GetQueueUrl : sig
  val request :
    Smaws_Lib.Context.t ->
      get_queue_url_request ->
        (get_queue_url_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module GetQueueAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
      get_queue_attributes_request ->
        (get_queue_attributes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidAttributeName of invalid_attribute_name
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module DeleteQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_queue_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module DeleteMessageBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_message_batch_request ->
        (delete_message_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
            | `EmptyBatchRequest of empty_batch_request
            | `InvalidAddress of invalid_address
            | `InvalidBatchEntryId of invalid_batch_entry_id
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module DeleteMessage : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_message_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidIdFormat of invalid_id_format
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `ReceiptHandleIsInvalid of receipt_handle_is_invalid
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module CreateQueue : sig
  val request :
    Smaws_Lib.Context.t ->
      create_queue_request ->
        (create_queue_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidAttributeName of invalid_attribute_name
            | `InvalidAttributeValue of invalid_attribute_value
            | `InvalidSecurity of invalid_security
            | `QueueDeletedRecently of queue_deleted_recently
            | `QueueNameExists of queue_name_exists
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module ChangeMessageVisibilityBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      change_message_visibility_batch_request ->
        (change_message_visibility_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `BatchEntryIdsNotDistinct of batch_entry_ids_not_distinct
            | `EmptyBatchRequest of empty_batch_request
            | `InvalidAddress of invalid_address
            | `InvalidBatchEntryId of invalid_batch_entry_id
            | `InvalidSecurity of invalid_security
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `TooManyEntriesInBatchRequest of too_many_entries_in_batch_request
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module ChangeMessageVisibility : sig
  val request :
    Smaws_Lib.Context.t ->
      change_message_visibility_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `MessageNotInflight of message_not_inflight
            | `QueueDoesNotExist of queue_does_not_exist
            | `ReceiptHandleIsInvalid of receipt_handle_is_invalid
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module CancelMessageMoveTask : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_message_move_task_request ->
        (cancel_message_move_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `RequestThrottled of request_throttled
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

module AddPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      add_permission_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddress of invalid_address
            | `InvalidSecurity of invalid_security
            | `OverLimit of over_limit
            | `QueueDoesNotExist of queue_does_not_exist
            | `RequestThrottled of request_throttled
            | `UnsupportedOperation of unsupported_operation
            
        ]
      ) result
end

