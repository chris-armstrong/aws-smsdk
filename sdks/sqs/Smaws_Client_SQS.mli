open Smaws_Lib
val service : Service.descriptor

type untag_queue_request = {
  tag_keys: string list;
  queue_url: string
}

type unsupported_operation = {
  message: string option
}

type request_throttled = {
  message: string option
}

type queue_does_not_exist = {
  message: string option
}

type invalid_security = {
  message: string option
}

type invalid_address = {
  message: string option
}

type too_many_entries_in_batch_request = {
  message: string option
}

type tag_queue_request = {
  tags: (string * string) list;
  queue_url: string
}

type start_message_move_task_result = {
  task_handle: string option
}

type start_message_move_task_request = {
  max_number_of_messages_per_second: int option;
  destination_arn: string option;
  source_arn: string
}

type resource_not_found_exception = {
  message: string option
}

type queue_attribute_name = | SqsManagedSseEnabled
  | RedriveAllowPolicy
  | FifoThroughputLimit
  | DeduplicationScope
  | KmsDataKeyReusePeriodSeconds
  | KmsMasterKeyId
  | ContentBasedDeduplication
  | FifoQueue
  | RedrivePolicy
  | ReceiveMessageWaitTimeSeconds
  | DelaySeconds
  | ApproximateNumberOfMessagesDelayed
  | QueueArn
  | LastModifiedTimestamp
  | CreatedTimestamp
  | ApproximateNumberOfMessagesNotVisible
  | ApproximateNumberOfMessages
  | MessageRetentionPeriod
  | MaximumMessageSize
  | VisibilityTimeout
  | Policy
  | All

type set_queue_attributes_request = {
  attributes: (string * string) list;
  queue_url: string
}

type over_limit = {
  message: string option
}

type invalid_attribute_value = {
  message: string option
}

type invalid_attribute_name = {
  message: string option
}

type send_message_result = {
  sequence_number: string option;
  message_id: string option;
  md5_of_message_system_attributes: string option;
  md5_of_message_attributes: string option;
  md5_of_message_body: string option
}

type message_attribute_value = {
  data_type: string;
  binary_list_values: bytes list option;
  string_list_values: string list option;
  binary_value: bytes option;
  string_value: string option
}

type message_system_attribute_value = {
  data_type: string;
  binary_list_values: bytes list option;
  string_list_values: string list option;
  binary_value: bytes option;
  string_value: string option
}

type message_system_attribute_name_for_sends = | AWSTraceHeader

type send_message_request = {
  message_group_id: string option;
  message_deduplication_id: string option;
  message_system_attributes: (string * message_system_attribute_value) list option;
  message_attributes: (string * message_attribute_value) list option;
  delay_seconds: int option;
  message_body: string;
  queue_url: string
}

type send_message_batch_result_entry = {
  sequence_number: string option;
  md5_of_message_system_attributes: string option;
  md5_of_message_attributes: string option;
  md5_of_message_body: string;
  message_id: string;
  id: string
}

type batch_result_error_entry = {
  message: string option;
  code: string;
  sender_fault: bool;
  id: string
}

type send_message_batch_result = {
  failed: batch_result_error_entry list;
  successful: send_message_batch_result_entry list
}

type send_message_batch_request_entry = {
  message_group_id: string option;
  message_deduplication_id: string option;
  message_system_attributes: (string * message_system_attribute_value) list option;
  message_attributes: (string * message_attribute_value) list option;
  delay_seconds: int option;
  message_body: string;
  id: string
}

type send_message_batch_request = {
  entries: send_message_batch_request_entry list;
  queue_url: string
}

type kms_throttled = {
  message: string option
}

type kms_opt_in_required = {
  message: string option
}

type kms_not_found = {
  message: string option
}

type kms_invalid_state = {
  message: string option
}

type kms_invalid_key_usage = {
  message: string option
}

type kms_disabled = {
  message: string option
}

type kms_access_denied = {
  message: string option
}

type invalid_batch_entry_id = {
  message: string option
}

type empty_batch_request = {
  message: string option
}

type batch_request_too_long = {
  message: string option
}

type batch_entry_ids_not_distinct = {
  message: string option
}

type invalid_message_contents = {
  message: string option
}

type remove_permission_request = {
  label: string;
  queue_url: string
}

type message_system_attribute_name = | DeadLetterQueueSourceArn
  | AWSTraceHeader
  | MessageGroupId
  | MessageDeduplicationId
  | SequenceNumber
  | ApproximateFirstReceiveTimestamp
  | ApproximateReceiveCount
  | SentTimestamp
  | SenderId
  | All

type message = {
  message_attributes: (string * message_attribute_value) list option;
  md5_of_message_attributes: string option;
  attributes: (string * string) list option;
  body: string option;
  md5_of_body: string option;
  receipt_handle: string option;
  message_id: string option
}

type receive_message_result = {
  messages: message list option
}

type receive_message_request = {
  receive_request_attempt_id: string option;
  wait_time_seconds: int option;
  visibility_timeout: int option;
  max_number_of_messages: int option;
  message_attribute_names: string list option;
  message_system_attribute_names: message_system_attribute_name list option;
  attribute_names: queue_attribute_name list option;
  queue_url: string
}

type receipt_handle_is_invalid = {
  message: string option
}

type queue_name_exists = {
  message: string option
}

type queue_deleted_recently = {
  message: string option
}

type purge_queue_request = {
  queue_url: string
}

type purge_queue_in_progress = {
  message: string option
}

type message_not_inflight = unit

type list_queues_result = {
  next_token: string option;
  queue_urls: string list option
}

type list_queues_request = {
  max_results: int option;
  next_token: string option;
  queue_name_prefix: string option
}

type list_queue_tags_result = {
  tags: (string * string) list option
}

type list_queue_tags_request = {
  queue_url: string
}

type list_message_move_tasks_result_entry = {
  started_timestamp: int option;
  failure_reason: string option;
  approximate_number_of_messages_to_move: int option;
  approximate_number_of_messages_moved: int option;
  max_number_of_messages_per_second: int option;
  destination_arn: string option;
  source_arn: string option;
  status: string option;
  task_handle: string option
}

type list_message_move_tasks_result = {
  results: list_message_move_tasks_result_entry list option
}

type list_message_move_tasks_request = {
  max_results: int option;
  source_arn: string
}

type list_dead_letter_source_queues_result = {
  next_token: string option;
  queue_urls: string list
}

type list_dead_letter_source_queues_request = {
  max_results: int option;
  next_token: string option;
  queue_url: string
}

type invalid_id_format = unit

type get_queue_url_result = {
  queue_url: string option
}

type get_queue_url_request = {
  queue_owner_aws_account_id: string option;
  queue_name: string
}

type get_queue_attributes_result = {
  attributes: (string * string) list option
}

type get_queue_attributes_request = {
  attribute_names: queue_attribute_name list option;
  queue_url: string
}

type delete_queue_request = {
  queue_url: string
}

type delete_message_request = {
  receipt_handle: string;
  queue_url: string
}

type delete_message_batch_result_entry = {
  id: string
}

type delete_message_batch_result = {
  failed: batch_result_error_entry list;
  successful: delete_message_batch_result_entry list
}

type delete_message_batch_request_entry = {
  receipt_handle: string;
  id: string
}

type delete_message_batch_request = {
  entries: delete_message_batch_request_entry list;
  queue_url: string
}

type create_queue_result = {
  queue_url: string option
}

type create_queue_request = {
  tags: (string * string) list option;
  attributes: (string * string) list option;
  queue_name: string
}

type change_message_visibility_request = {
  visibility_timeout: int;
  receipt_handle: string;
  queue_url: string
}

type change_message_visibility_batch_result_entry = {
  id: string
}

type change_message_visibility_batch_result = {
  failed: batch_result_error_entry list;
  successful: change_message_visibility_batch_result_entry list
}

type change_message_visibility_batch_request_entry = {
  visibility_timeout: int option;
  receipt_handle: string;
  id: string
}

type change_message_visibility_batch_request = {
  entries: change_message_visibility_batch_request_entry list;
  queue_url: string
}

type cancel_message_move_task_result = {
  approximate_number_of_messages_moved: int option
}

type cancel_message_move_task_request = {
  task_handle: string
}

type add_permission_request = {
  actions: string list;
  aws_account_ids: string list;
  label: string;
  queue_url: string
}



type base_document = Json.t

val make_untag_queue_request :
  tag_keys:string list -> queue_url:string -> unit
-> untag_queue_request

val make_tag_queue_request :
  tags:(string * string) list -> queue_url:string -> unit
-> tag_queue_request

val make_start_message_move_task_result : ?task_handle:string -> unit
-> start_message_move_task_result

val make_start_message_move_task_request :
  ?max_number_of_messages_per_second:int ->
  ?destination_arn:string ->
  source_arn:string ->
  unit
-> start_message_move_task_request

val make_set_queue_attributes_request :
  attributes:(string * string) list -> queue_url:string -> unit
-> set_queue_attributes_request

val make_send_message_result :
  ?sequence_number:string ->
  ?message_id:string ->
  ?md5_of_message_system_attributes:string ->
  ?md5_of_message_attributes:string ->
  ?md5_of_message_body:string ->
  unit -> send_message_result

val make_message_attribute_value :
  ?binary_list_values:bytes list ->
  ?string_list_values:string list ->
  ?binary_value:bytes ->
  ?string_value:string ->
  data_type:string ->
  unit -> message_attribute_value

val make_message_system_attribute_value :
  ?binary_list_values:bytes list ->
  ?string_list_values:string list ->
  ?binary_value:bytes ->
  ?string_value:string ->
  data_type:string ->
  unit -> message_system_attribute_value

val make_send_message_request :
  ?message_group_id:string ->
  ?message_deduplication_id:string ->
  ?message_system_attributes:(string * message_system_attribute_value) list ->
  ?message_attributes:(string * message_attribute_value) list ->
  ?delay_seconds:int ->
  message_body:string ->
  queue_url:string ->
  unit -> send_message_request

val make_send_message_batch_result_entry :
  ?sequence_number:string ->
  ?md5_of_message_system_attributes:string ->
  ?md5_of_message_attributes:string ->
  md5_of_message_body:string ->
  message_id:string ->
  id:string ->
  unit -> send_message_batch_result_entry

val make_batch_result_error_entry :
  ?message:string -> code:string -> sender_fault:bool -> id:string -> unit
-> batch_result_error_entry

val make_send_message_batch_result :
  failed:batch_result_error_entry list ->
  successful:send_message_batch_result_entry list ->
  unit
-> send_message_batch_result

val make_send_message_batch_request_entry :
  ?message_group_id:string ->
  ?message_deduplication_id:string ->
  ?message_system_attributes:(string * message_system_attribute_value) list ->
  ?message_attributes:(string * message_attribute_value) list ->
  ?delay_seconds:int ->
  message_body:string ->
  id:string ->
  unit
-> send_message_batch_request_entry

val make_send_message_batch_request :
  entries:send_message_batch_request_entry list -> queue_url:string -> unit
-> send_message_batch_request

val make_remove_permission_request : label:string -> queue_url:string -> unit
-> remove_permission_request

val make_message :
  ?message_attributes:(string * message_attribute_value) list ->
  ?md5_of_message_attributes:string ->
  ?attributes:(string * string) list ->
  ?body:string ->
  ?md5_of_body:string ->
  ?receipt_handle:string ->
  ?message_id:string ->
  unit -> message

val make_receive_message_result : ?messages:message list -> unit
-> receive_message_result

val make_receive_message_request :
  ?receive_request_attempt_id:string ->
  ?wait_time_seconds:int ->
  ?visibility_timeout:int ->
  ?max_number_of_messages:int ->
  ?message_attribute_names:string list ->
  ?message_system_attribute_names:message_system_attribute_name list ->
  ?attribute_names:queue_attribute_name list ->
  queue_url:string ->
  unit -> receive_message_request

val make_purge_queue_request : queue_url:string -> unit
-> purge_queue_request

val make_list_queues_result :
  ?next_token:string -> ?queue_urls:string list -> unit
-> list_queues_result

val make_list_queues_request :
  ?max_results:int -> ?next_token:string -> ?queue_name_prefix:string -> unit
-> list_queues_request

val make_list_queue_tags_result : ?tags:(string * string) list -> unit
-> list_queue_tags_result

val make_list_queue_tags_request : queue_url:string -> unit
-> list_queue_tags_request

val make_list_message_move_tasks_result_entry :
  ?started_timestamp:int ->
  ?failure_reason:string ->
  ?approximate_number_of_messages_to_move:int ->
  ?approximate_number_of_messages_moved:int ->
  ?max_number_of_messages_per_second:int ->
  ?destination_arn:string ->
  ?source_arn:string ->
  ?status:string ->
  ?task_handle:string ->
  unit
-> list_message_move_tasks_result_entry

val make_list_message_move_tasks_result :
  ?results:list_message_move_tasks_result_entry list -> unit
-> list_message_move_tasks_result

val make_list_message_move_tasks_request :
  ?max_results:int -> source_arn:string -> unit
-> list_message_move_tasks_request

val make_list_dead_letter_source_queues_result :
  ?next_token:string -> queue_urls:string list -> unit
-> list_dead_letter_source_queues_result

val make_list_dead_letter_source_queues_request :
  ?max_results:int -> ?next_token:string -> queue_url:string -> unit
-> list_dead_letter_source_queues_request

val make_get_queue_url_result : ?queue_url:string -> unit
-> get_queue_url_result

val make_get_queue_url_request :
  ?queue_owner_aws_account_id:string -> queue_name:string -> unit
-> get_queue_url_request

val make_get_queue_attributes_result :
  ?attributes:(string * string) list -> unit
-> get_queue_attributes_result

val make_get_queue_attributes_request :
  ?attribute_names:queue_attribute_name list -> queue_url:string -> unit
-> get_queue_attributes_request

val make_delete_queue_request : queue_url:string -> unit
-> delete_queue_request

val make_delete_message_request :
  receipt_handle:string -> queue_url:string -> unit
-> delete_message_request

val make_delete_message_batch_result_entry : id:string -> unit
-> delete_message_batch_result_entry

val make_delete_message_batch_result :
  failed:batch_result_error_entry list ->
  successful:delete_message_batch_result_entry list ->
  unit
-> delete_message_batch_result

val make_delete_message_batch_request_entry :
  receipt_handle:string -> id:string -> unit
-> delete_message_batch_request_entry

val make_delete_message_batch_request :
  entries:delete_message_batch_request_entry list -> queue_url:string -> unit
-> delete_message_batch_request

val make_create_queue_result : ?queue_url:string -> unit
-> create_queue_result

val make_create_queue_request :
  ?tags:(string * string) list ->
  ?attributes:(string * string) list ->
  queue_name:string ->
  unit -> create_queue_request

val make_change_message_visibility_request :
  visibility_timeout:int -> receipt_handle:string -> queue_url:string -> unit
-> change_message_visibility_request

val make_change_message_visibility_batch_result_entry : id:string -> unit
-> change_message_visibility_batch_result_entry

val make_change_message_visibility_batch_result :
  failed:batch_result_error_entry list ->
  successful:change_message_visibility_batch_result_entry list ->
  unit
-> change_message_visibility_batch_result

val make_change_message_visibility_batch_request_entry :
  ?visibility_timeout:int -> receipt_handle:string -> id:string -> unit
-> change_message_visibility_batch_request_entry

val make_change_message_visibility_batch_request :
  entries:change_message_visibility_batch_request_entry list ->
  queue_url:string ->
  unit
-> change_message_visibility_batch_request

val make_cancel_message_move_task_result :
  ?approximate_number_of_messages_moved:int -> unit
-> cancel_message_move_task_result

val make_cancel_message_move_task_request : task_handle:string -> unit
-> cancel_message_move_task_request

val make_add_permission_request :
  actions:string list ->
  aws_account_ids:string list ->
  label:string ->
  queue_url:string ->
  unit -> add_permission_request

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

