open Smaws_Lib.Json.SerializeHelpers

open Types

let string__to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_queue_request_to_yojson = 
  fun (x: untag_queue_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let exception_message_to_yojson = string_to_yojson

let unsupported_operation_to_yojson = 
  fun (x: unsupported_operation) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let request_throttled_to_yojson = 
  fun (x: request_throttled) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let queue_does_not_exist_to_yojson = 
  fun (x: queue_does_not_exist) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_security_to_yojson = 
  fun (x: invalid_security) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_address_to_yojson = 
  fun (x: invalid_address) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let too_many_entries_in_batch_request_to_yojson = 
  fun (x: too_many_entries_in_batch_request) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let token_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_map_to_yojson = fun tree -> map_to_yojson tag_value_to_yojson tree

let tag_queue_request_to_yojson = 
  fun (x: tag_queue_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_map_to_yojson x.tags)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let string_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let start_message_move_task_result_to_yojson = 
  fun (x: start_message_move_task_result) -> assoc_to_yojson(
    [(
         "TaskHandle",
         (option_to_yojson string__to_yojson x.task_handle));
       
  ])

let nullable_integer_to_yojson = int_to_yojson

let start_message_move_task_request_to_yojson = 
  fun (x: start_message_move_task_request) -> assoc_to_yojson(
    [(
         "MaxNumberOfMessagesPerSecond",
         (option_to_yojson nullable_integer_to_yojson x.max_number_of_messages_per_second));
       (
         "DestinationArn",
         (option_to_yojson string__to_yojson x.destination_arn));
       (
         "SourceArn",
         (Some (string__to_yojson x.source_arn)));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let queue_attribute_name_to_yojson = 
  fun (x: queue_attribute_name) -> match x with 
 
| SqsManagedSseEnabled -> `String "SqsManagedSseEnabled"
  | RedriveAllowPolicy -> `String "RedriveAllowPolicy"
  | FifoThroughputLimit -> `String "FifoThroughputLimit"
  | DeduplicationScope -> `String "DeduplicationScope"
  | KmsDataKeyReusePeriodSeconds -> `String "KmsDataKeyReusePeriodSeconds"
  | KmsMasterKeyId -> `String "KmsMasterKeyId"
  | ContentBasedDeduplication -> `String "ContentBasedDeduplication"
  | FifoQueue -> `String "FifoQueue"
  | RedrivePolicy -> `String "RedrivePolicy"
  | ReceiveMessageWaitTimeSeconds -> `String "ReceiveMessageWaitTimeSeconds"
  | DelaySeconds -> `String "DelaySeconds"
  | ApproximateNumberOfMessagesDelayed -> `String "ApproximateNumberOfMessagesDelayed"
  | QueueArn -> `String "QueueArn"
  | LastModifiedTimestamp -> `String "LastModifiedTimestamp"
  | CreatedTimestamp -> `String "CreatedTimestamp"
  | ApproximateNumberOfMessagesNotVisible -> `String "ApproximateNumberOfMessagesNotVisible"
  | ApproximateNumberOfMessages -> `String "ApproximateNumberOfMessages"
  | MessageRetentionPeriod -> `String "MessageRetentionPeriod"
  | MaximumMessageSize -> `String "MaximumMessageSize"
  | VisibilityTimeout -> `String "VisibilityTimeout"
  | Policy -> `String "Policy"
  | All -> `String "All"
   

let queue_attribute_map_to_yojson = 
  fun tree -> map_to_yojson string__to_yojson tree

let set_queue_attributes_request_to_yojson = 
  fun (x: set_queue_attributes_request) -> assoc_to_yojson(
    [(
         "Attributes",
         (Some (queue_attribute_map_to_yojson x.attributes)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let over_limit_to_yojson = 
  fun (x: over_limit) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_attribute_value_to_yojson = 
  fun (x: invalid_attribute_value) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_attribute_name_to_yojson = 
  fun (x: invalid_attribute_name) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let send_message_result_to_yojson = 
  fun (x: send_message_result) -> assoc_to_yojson(
    [(
         "SequenceNumber",
         (option_to_yojson string__to_yojson x.sequence_number));
       (
         "MessageId",
         (option_to_yojson string__to_yojson x.message_id));
       (
         "MD5OfMessageSystemAttributes",
         (option_to_yojson string__to_yojson x.md5_of_message_system_attributes));
       (
         "MD5OfMessageAttributes",
         (option_to_yojson string__to_yojson x.md5_of_message_attributes));
       (
         "MD5OfMessageBody",
         (option_to_yojson string__to_yojson x.md5_of_message_body));
       
  ])

let binary_to_yojson = blob_to_yojson

let binary_list_to_yojson = 
  fun tree -> list_to_yojson binary_to_yojson tree

let message_attribute_value_to_yojson = 
  fun (x: message_attribute_value) -> assoc_to_yojson(
    [(
         "DataType",
         (Some (string__to_yojson x.data_type)));
       (
         "BinaryListValues",
         (option_to_yojson binary_list_to_yojson x.binary_list_values));
       (
         "StringListValues",
         (option_to_yojson string_list_to_yojson x.string_list_values));
       (
         "BinaryValue",
         (option_to_yojson binary_to_yojson x.binary_value));
       (
         "StringValue",
         (option_to_yojson string__to_yojson x.string_value));
       
  ])

let message_body_attribute_map_to_yojson = 
  fun tree -> map_to_yojson message_attribute_value_to_yojson tree

let message_system_attribute_value_to_yojson = 
  fun (x: message_system_attribute_value) -> assoc_to_yojson(
    [(
         "DataType",
         (Some (string__to_yojson x.data_type)));
       (
         "BinaryListValues",
         (option_to_yojson binary_list_to_yojson x.binary_list_values));
       (
         "StringListValues",
         (option_to_yojson string_list_to_yojson x.string_list_values));
       (
         "BinaryValue",
         (option_to_yojson binary_to_yojson x.binary_value));
       (
         "StringValue",
         (option_to_yojson string__to_yojson x.string_value));
       
  ])

let message_system_attribute_name_for_sends_to_yojson = 
  fun (x: message_system_attribute_name_for_sends) -> match x with 
  | AWSTraceHeader -> `String "AWSTraceHeader"
     

let message_body_system_attribute_map_to_yojson = 
  fun tree -> map_to_yojson message_system_attribute_value_to_yojson tree

let send_message_request_to_yojson = 
  fun (x: send_message_request) -> assoc_to_yojson(
    [(
         "MessageGroupId",
         (option_to_yojson string__to_yojson x.message_group_id));
       (
         "MessageDeduplicationId",
         (option_to_yojson string__to_yojson x.message_deduplication_id));
       (
         "MessageSystemAttributes",
         (option_to_yojson message_body_system_attribute_map_to_yojson x.message_system_attributes));
       (
         "MessageAttributes",
         (option_to_yojson message_body_attribute_map_to_yojson x.message_attributes));
       (
         "DelaySeconds",
         (option_to_yojson nullable_integer_to_yojson x.delay_seconds));
       (
         "MessageBody",
         (Some (string__to_yojson x.message_body)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let send_message_batch_result_entry_to_yojson = 
  fun (x: send_message_batch_result_entry) -> assoc_to_yojson(
    [(
         "SequenceNumber",
         (option_to_yojson string__to_yojson x.sequence_number));
       (
         "MD5OfMessageSystemAttributes",
         (option_to_yojson string__to_yojson x.md5_of_message_system_attributes));
       (
         "MD5OfMessageAttributes",
         (option_to_yojson string__to_yojson x.md5_of_message_attributes));
       (
         "MD5OfMessageBody",
         (Some (string__to_yojson x.md5_of_message_body)));
       (
         "MessageId",
         (Some (string__to_yojson x.message_id)));
       (
         "Id",
         (Some (string__to_yojson x.id)));
       
  ])

let send_message_batch_result_entry_list_to_yojson = 
  fun tree -> list_to_yojson send_message_batch_result_entry_to_yojson tree

let boolean__to_yojson = bool_to_yojson

let batch_result_error_entry_to_yojson = 
  fun (x: batch_result_error_entry) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "Code",
         (Some (string__to_yojson x.code)));
       (
         "SenderFault",
         (Some (boolean__to_yojson x.sender_fault)));
       (
         "Id",
         (Some (string__to_yojson x.id)));
       
  ])

let batch_result_error_entry_list_to_yojson = 
  fun tree -> list_to_yojson batch_result_error_entry_to_yojson tree

let send_message_batch_result_to_yojson = 
  fun (x: send_message_batch_result) -> assoc_to_yojson(
    [(
         "Failed",
         (Some (batch_result_error_entry_list_to_yojson x.failed)));
       (
         "Successful",
         (Some (send_message_batch_result_entry_list_to_yojson x.successful)));
       
  ])

let send_message_batch_request_entry_to_yojson = 
  fun (x: send_message_batch_request_entry) -> assoc_to_yojson(
    [(
         "MessageGroupId",
         (option_to_yojson string__to_yojson x.message_group_id));
       (
         "MessageDeduplicationId",
         (option_to_yojson string__to_yojson x.message_deduplication_id));
       (
         "MessageSystemAttributes",
         (option_to_yojson message_body_system_attribute_map_to_yojson x.message_system_attributes));
       (
         "MessageAttributes",
         (option_to_yojson message_body_attribute_map_to_yojson x.message_attributes));
       (
         "DelaySeconds",
         (option_to_yojson nullable_integer_to_yojson x.delay_seconds));
       (
         "MessageBody",
         (Some (string__to_yojson x.message_body)));
       (
         "Id",
         (Some (string__to_yojson x.id)));
       
  ])

let send_message_batch_request_entry_list_to_yojson = 
  fun tree -> list_to_yojson send_message_batch_request_entry_to_yojson tree

let send_message_batch_request_to_yojson = 
  fun (x: send_message_batch_request) -> assoc_to_yojson(
    [(
         "Entries",
         (Some (send_message_batch_request_entry_list_to_yojson x.entries)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let kms_throttled_to_yojson = 
  fun (x: kms_throttled) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let kms_opt_in_required_to_yojson = 
  fun (x: kms_opt_in_required) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let kms_not_found_to_yojson = 
  fun (x: kms_not_found) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let kms_invalid_state_to_yojson = 
  fun (x: kms_invalid_state) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let kms_invalid_key_usage_to_yojson = 
  fun (x: kms_invalid_key_usage) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let kms_disabled_to_yojson = 
  fun (x: kms_disabled) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let kms_access_denied_to_yojson = 
  fun (x: kms_access_denied) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_batch_entry_id_to_yojson = 
  fun (x: invalid_batch_entry_id) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let empty_batch_request_to_yojson = 
  fun (x: empty_batch_request) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let batch_request_too_long_to_yojson = 
  fun (x: batch_request_too_long) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let batch_entry_ids_not_distinct_to_yojson = 
  fun (x: batch_entry_ids_not_distinct) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let invalid_message_contents_to_yojson = 
  fun (x: invalid_message_contents) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let remove_permission_request_to_yojson = 
  fun (x: remove_permission_request) -> assoc_to_yojson(
    [(
         "Label",
         (Some (string__to_yojson x.label)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let message_system_attribute_name_to_yojson = 
  fun (x: message_system_attribute_name) -> match x with 
 
| DeadLetterQueueSourceArn -> `String "DeadLetterQueueSourceArn"
  | AWSTraceHeader -> `String "AWSTraceHeader"
  | MessageGroupId -> `String "MessageGroupId"
  | MessageDeduplicationId -> `String "MessageDeduplicationId"
  | SequenceNumber -> `String "SequenceNumber"
  | ApproximateFirstReceiveTimestamp -> `String "ApproximateFirstReceiveTimestamp"
  | ApproximateReceiveCount -> `String "ApproximateReceiveCount"
  | SentTimestamp -> `String "SentTimestamp"
  | SenderId -> `String "SenderId"
  | All -> `String "All"
   

let message_system_attribute_map_to_yojson = 
  fun tree -> map_to_yojson string__to_yojson tree

let message_to_yojson = 
  fun (x: message) -> assoc_to_yojson(
    [(
         "MessageAttributes",
         (option_to_yojson message_body_attribute_map_to_yojson x.message_attributes));
       (
         "MD5OfMessageAttributes",
         (option_to_yojson string__to_yojson x.md5_of_message_attributes));
       (
         "Attributes",
         (option_to_yojson message_system_attribute_map_to_yojson x.attributes));
       (
         "Body",
         (option_to_yojson string__to_yojson x.body));
       (
         "MD5OfBody",
         (option_to_yojson string__to_yojson x.md5_of_body));
       (
         "ReceiptHandle",
         (option_to_yojson string__to_yojson x.receipt_handle));
       (
         "MessageId",
         (option_to_yojson string__to_yojson x.message_id));
       
  ])

let message_list_to_yojson = 
  fun tree -> list_to_yojson message_to_yojson tree

let receive_message_result_to_yojson = 
  fun (x: receive_message_result) -> assoc_to_yojson(
    [(
         "Messages",
         (option_to_yojson message_list_to_yojson x.messages));
       
  ])

let attribute_name_list_to_yojson = 
  fun tree -> list_to_yojson queue_attribute_name_to_yojson tree

let message_system_attribute_list_to_yojson = 
  fun tree -> list_to_yojson message_system_attribute_name_to_yojson tree

let message_attribute_name_to_yojson = string_to_yojson

let message_attribute_name_list_to_yojson = 
  fun tree -> list_to_yojson message_attribute_name_to_yojson tree

let receive_message_request_to_yojson = 
  fun (x: receive_message_request) -> assoc_to_yojson(
    [(
         "ReceiveRequestAttemptId",
         (option_to_yojson string__to_yojson x.receive_request_attempt_id));
       (
         "WaitTimeSeconds",
         (option_to_yojson nullable_integer_to_yojson x.wait_time_seconds));
       (
         "VisibilityTimeout",
         (option_to_yojson nullable_integer_to_yojson x.visibility_timeout));
       (
         "MaxNumberOfMessages",
         (option_to_yojson nullable_integer_to_yojson x.max_number_of_messages));
       (
         "MessageAttributeNames",
         (option_to_yojson message_attribute_name_list_to_yojson x.message_attribute_names));
       (
         "MessageSystemAttributeNames",
         (option_to_yojson message_system_attribute_list_to_yojson x.message_system_attribute_names));
       (
         "AttributeNames",
         (option_to_yojson attribute_name_list_to_yojson x.attribute_names));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let receipt_handle_is_invalid_to_yojson = 
  fun (x: receipt_handle_is_invalid) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let queue_url_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let queue_name_exists_to_yojson = 
  fun (x: queue_name_exists) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let queue_deleted_recently_to_yojson = 
  fun (x: queue_deleted_recently) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let purge_queue_request_to_yojson = 
  fun (x: purge_queue_request) -> assoc_to_yojson(
    [(
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let purge_queue_in_progress_to_yojson = 
  fun (x: purge_queue_in_progress) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson exception_message_to_yojson x.message));
       
  ])

let nullable_long_to_yojson = long_to_yojson

let message_not_inflight_to_yojson = 
  fun (x: message_not_inflight) -> assoc_to_yojson(
    [
  ])

let long_to_yojson = long_to_yojson

let list_queues_result_to_yojson = 
  fun (x: list_queues_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "QueueUrls",
         (option_to_yojson queue_url_list_to_yojson x.queue_urls));
       
  ])

let boxed_integer_to_yojson = int_to_yojson

let list_queues_request_to_yojson = 
  fun (x: list_queues_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson boxed_integer_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "QueueNamePrefix",
         (option_to_yojson string__to_yojson x.queue_name_prefix));
       
  ])

let list_queue_tags_result_to_yojson = 
  fun (x: list_queue_tags_result) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_map_to_yojson x.tags));
       
  ])

let list_queue_tags_request_to_yojson = 
  fun (x: list_queue_tags_request) -> assoc_to_yojson(
    [(
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let list_message_move_tasks_result_entry_to_yojson = 
  fun (x: list_message_move_tasks_result_entry) -> assoc_to_yojson(
    [(
         "StartedTimestamp",
         (option_to_yojson long_to_yojson x.started_timestamp));
       (
         "FailureReason",
         (option_to_yojson string__to_yojson x.failure_reason));
       (
         "ApproximateNumberOfMessagesToMove",
         (option_to_yojson nullable_long_to_yojson x.approximate_number_of_messages_to_move));
       (
         "ApproximateNumberOfMessagesMoved",
         (option_to_yojson long_to_yojson x.approximate_number_of_messages_moved));
       (
         "MaxNumberOfMessagesPerSecond",
         (option_to_yojson nullable_integer_to_yojson x.max_number_of_messages_per_second));
       (
         "DestinationArn",
         (option_to_yojson string__to_yojson x.destination_arn));
       (
         "SourceArn",
         (option_to_yojson string__to_yojson x.source_arn));
       (
         "Status",
         (option_to_yojson string__to_yojson x.status));
       (
         "TaskHandle",
         (option_to_yojson string__to_yojson x.task_handle));
       
  ])

let list_message_move_tasks_result_entry_list_to_yojson = 
  fun tree -> list_to_yojson list_message_move_tasks_result_entry_to_yojson tree

let list_message_move_tasks_result_to_yojson = 
  fun (x: list_message_move_tasks_result) -> assoc_to_yojson(
    [(
         "Results",
         (option_to_yojson list_message_move_tasks_result_entry_list_to_yojson x.results));
       
  ])

let list_message_move_tasks_request_to_yojson = 
  fun (x: list_message_move_tasks_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson nullable_integer_to_yojson x.max_results));
       (
         "SourceArn",
         (Some (string__to_yojson x.source_arn)));
       
  ])

let list_dead_letter_source_queues_result_to_yojson = 
  fun (x: list_dead_letter_source_queues_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "queueUrls",
         (Some (queue_url_list_to_yojson x.queue_urls)));
       
  ])

let list_dead_letter_source_queues_request_to_yojson = 
  fun (x: list_dead_letter_source_queues_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson boxed_integer_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson token_to_yojson x.next_token));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let invalid_id_format_to_yojson = 
  fun (x: invalid_id_format) -> assoc_to_yojson(
    [
  ])

let get_queue_url_result_to_yojson = 
  fun (x: get_queue_url_result) -> assoc_to_yojson(
    [(
         "QueueUrl",
         (option_to_yojson string__to_yojson x.queue_url));
       
  ])

let get_queue_url_request_to_yojson = 
  fun (x: get_queue_url_request) -> assoc_to_yojson(
    [(
         "QueueOwnerAWSAccountId",
         (option_to_yojson string__to_yojson x.queue_owner_aws_account_id));
       (
         "QueueName",
         (Some (string__to_yojson x.queue_name)));
       
  ])

let get_queue_attributes_result_to_yojson = 
  fun (x: get_queue_attributes_result) -> assoc_to_yojson(
    [(
         "Attributes",
         (option_to_yojson queue_attribute_map_to_yojson x.attributes));
       
  ])

let get_queue_attributes_request_to_yojson = 
  fun (x: get_queue_attributes_request) -> assoc_to_yojson(
    [(
         "AttributeNames",
         (option_to_yojson attribute_name_list_to_yojson x.attribute_names));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let delete_queue_request_to_yojson = 
  fun (x: delete_queue_request) -> assoc_to_yojson(
    [(
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let delete_message_request_to_yojson = 
  fun (x: delete_message_request) -> assoc_to_yojson(
    [(
         "ReceiptHandle",
         (Some (string__to_yojson x.receipt_handle)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let delete_message_batch_result_entry_to_yojson = 
  fun (x: delete_message_batch_result_entry) -> assoc_to_yojson(
    [(
         "Id",
         (Some (string__to_yojson x.id)));
       
  ])

let delete_message_batch_result_entry_list_to_yojson = 
  fun tree -> list_to_yojson delete_message_batch_result_entry_to_yojson tree

let delete_message_batch_result_to_yojson = 
  fun (x: delete_message_batch_result) -> assoc_to_yojson(
    [(
         "Failed",
         (Some (batch_result_error_entry_list_to_yojson x.failed)));
       (
         "Successful",
         (Some (delete_message_batch_result_entry_list_to_yojson x.successful)));
       
  ])

let delete_message_batch_request_entry_to_yojson = 
  fun (x: delete_message_batch_request_entry) -> assoc_to_yojson(
    [(
         "ReceiptHandle",
         (Some (string__to_yojson x.receipt_handle)));
       (
         "Id",
         (Some (string__to_yojson x.id)));
       
  ])

let delete_message_batch_request_entry_list_to_yojson = 
  fun tree -> list_to_yojson delete_message_batch_request_entry_to_yojson tree

let delete_message_batch_request_to_yojson = 
  fun (x: delete_message_batch_request) -> assoc_to_yojson(
    [(
         "Entries",
         (Some (delete_message_batch_request_entry_list_to_yojson x.entries)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let create_queue_result_to_yojson = 
  fun (x: create_queue_result) -> assoc_to_yojson(
    [(
         "QueueUrl",
         (option_to_yojson string__to_yojson x.queue_url));
       
  ])

let create_queue_request_to_yojson = 
  fun (x: create_queue_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_map_to_yojson x.tags));
       (
         "Attributes",
         (option_to_yojson queue_attribute_map_to_yojson x.attributes));
       (
         "QueueName",
         (Some (string__to_yojson x.queue_name)));
       
  ])

let change_message_visibility_request_to_yojson = 
  fun (x: change_message_visibility_request) -> assoc_to_yojson(
    [(
         "VisibilityTimeout",
         (Some (nullable_integer_to_yojson x.visibility_timeout)));
       (
         "ReceiptHandle",
         (Some (string__to_yojson x.receipt_handle)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let change_message_visibility_batch_result_entry_to_yojson = 
  fun (x: change_message_visibility_batch_result_entry) -> assoc_to_yojson(
    [(
         "Id",
         (Some (string__to_yojson x.id)));
       
  ])

let change_message_visibility_batch_result_entry_list_to_yojson = 
  fun tree -> list_to_yojson change_message_visibility_batch_result_entry_to_yojson tree

let change_message_visibility_batch_result_to_yojson = 
  fun (x: change_message_visibility_batch_result) -> assoc_to_yojson(
    [(
         "Failed",
         (Some (batch_result_error_entry_list_to_yojson x.failed)));
       (
         "Successful",
         (Some (change_message_visibility_batch_result_entry_list_to_yojson x.successful)));
       
  ])

let change_message_visibility_batch_request_entry_to_yojson = 
  fun (x: change_message_visibility_batch_request_entry) -> assoc_to_yojson(
    [(
         "VisibilityTimeout",
         (option_to_yojson nullable_integer_to_yojson x.visibility_timeout));
       (
         "ReceiptHandle",
         (Some (string__to_yojson x.receipt_handle)));
       (
         "Id",
         (Some (string__to_yojson x.id)));
       
  ])

let change_message_visibility_batch_request_entry_list_to_yojson = 
  fun tree -> list_to_yojson change_message_visibility_batch_request_entry_to_yojson tree

let change_message_visibility_batch_request_to_yojson = 
  fun (x: change_message_visibility_batch_request) -> assoc_to_yojson(
    [(
         "Entries",
         (Some (change_message_visibility_batch_request_entry_list_to_yojson x.entries)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let cancel_message_move_task_result_to_yojson = 
  fun (x: cancel_message_move_task_result) -> assoc_to_yojson(
    [(
         "ApproximateNumberOfMessagesMoved",
         (option_to_yojson long_to_yojson x.approximate_number_of_messages_moved));
       
  ])

let cancel_message_move_task_request_to_yojson = 
  fun (x: cancel_message_move_task_request) -> assoc_to_yojson(
    [(
         "TaskHandle",
         (Some (string__to_yojson x.task_handle)));
       
  ])

let aws_account_id_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let action_name_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let add_permission_request_to_yojson = 
  fun (x: add_permission_request) -> assoc_to_yojson(
    [(
         "Actions",
         (Some (action_name_list_to_yojson x.actions)));
       (
         "AWSAccountIds",
         (Some (aws_account_id_list_to_yojson x.aws_account_ids)));
       (
         "Label",
         (Some (string__to_yojson x.label)));
       (
         "QueueUrl",
         (Some (string__to_yojson x.queue_url)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

