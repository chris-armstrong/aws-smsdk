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

