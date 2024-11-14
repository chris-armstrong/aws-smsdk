[@@@warning "-39"]
open Types
let make_untag_queue_request 
  ~(tag_keys : string list) ~(queue_url : string) () : untag_queue_request =
{ tag_keys; queue_url;  }

let make_tag_queue_request 
  ~(tags : (string * string) list) ~(queue_url : string) ()
: tag_queue_request = { tags; queue_url; 
}

let make_start_message_move_task_result  ?(task_handle : string option) ()
: start_message_move_task_result = { task_handle; 
}

let make_start_message_move_task_request 
  ?(max_number_of_messages_per_second : int option)
  ?(destination_arn : string option)
  ~(source_arn : string)
  () : start_message_move_task_request = {
  max_number_of_messages_per_second; destination_arn; source_arn; 
}

let make_set_queue_attributes_request 
  ~(attributes : (string * string) list) ~(queue_url : string) ()
: set_queue_attributes_request = { attributes; queue_url; 
}

let make_send_message_result 
  ?(sequence_number : string option)
  ?(message_id : string option)
  ?(md5_of_message_system_attributes : string option)
  ?(md5_of_message_attributes : string option)
  ?(md5_of_message_body : string option)
  () : send_message_result = {
  sequence_number;
  message_id;
  md5_of_message_system_attributes;
  md5_of_message_attributes;
  md5_of_message_body;
   }

let make_message_attribute_value 
  ?(binary_list_values : bytes list option)
  ?(string_list_values : string list option)
  ?(binary_value : bytes option)
  ?(string_value : string option)
  ~(data_type : string)
  () : message_attribute_value = {
  data_type;
  binary_list_values;
  string_list_values;
  binary_value;
  string_value;
   }

let make_message_system_attribute_value 
  ?(binary_list_values : bytes list option)
  ?(string_list_values : string list option)
  ?(binary_value : bytes option)
  ?(string_value : string option)
  ~(data_type : string)
  () : message_system_attribute_value = {
  data_type;
  binary_list_values;
  string_list_values;
  binary_value;
  string_value;
   }

let make_send_message_request 
  ?(message_group_id : string option)
  ?(message_deduplication_id : string option)
  ?(message_system_attributes : (string * message_system_attribute_value) list option)
  ?(message_attributes : (string * message_attribute_value) list option)
  ?(delay_seconds : int option)
  ~(message_body : string)
  ~(queue_url : string)
  () : send_message_request = {
  message_group_id;
  message_deduplication_id;
  message_system_attributes;
  message_attributes;
  delay_seconds;
  message_body;
  queue_url;
   }

let make_send_message_batch_result_entry 
  ?(sequence_number : string option)
  ?(md5_of_message_system_attributes : string option)
  ?(md5_of_message_attributes : string option)
  ~(md5_of_message_body : string)
  ~(message_id : string)
  ~(id : string)
  () : send_message_batch_result_entry = {
  sequence_number;
  md5_of_message_system_attributes;
  md5_of_message_attributes;
  md5_of_message_body;
  message_id;
  id;
   }

let make_batch_result_error_entry 
  ?(message : string option)
  ~(code : string)
  ~(sender_fault : bool)
  ~(id : string)
  () : batch_result_error_entry = { message; code; sender_fault; id; 
}

let make_send_message_batch_result 
  ~(failed : batch_result_error_entry list)
  ~(successful : send_message_batch_result_entry list)
  () : send_message_batch_result = { failed; successful; 
}

let make_send_message_batch_request_entry 
  ?(message_group_id : string option)
  ?(message_deduplication_id : string option)
  ?(message_system_attributes : (string * message_system_attribute_value) list option)
  ?(message_attributes : (string * message_attribute_value) list option)
  ?(delay_seconds : int option)
  ~(message_body : string)
  ~(id : string)
  () : send_message_batch_request_entry = {
  message_group_id;
  message_deduplication_id;
  message_system_attributes;
  message_attributes;
  delay_seconds;
  message_body;
  id;
   }

let make_send_message_batch_request 
  ~(entries : send_message_batch_request_entry list) ~(queue_url : string) ()
: send_message_batch_request = { entries; queue_url; 
}

let make_remove_permission_request 
  ~(label : string) ~(queue_url : string) () : remove_permission_request = {
  label; queue_url;  }

let make_message 
  ?(message_attributes : (string * message_attribute_value) list option)
  ?(md5_of_message_attributes : string option)
  ?(attributes : (string * string) list option)
  ?(body : string option)
  ?(md5_of_body : string option)
  ?(receipt_handle : string option)
  ?(message_id : string option)
  () : message = {
  message_attributes;
  md5_of_message_attributes;
  attributes;
  body;
  md5_of_body;
  receipt_handle;
  message_id;
   }

let make_receive_message_result  ?(messages : message list option) ()
: receive_message_result = { messages;  }

let make_receive_message_request 
  ?(receive_request_attempt_id : string option)
  ?(wait_time_seconds : int option)
  ?(visibility_timeout : int option)
  ?(max_number_of_messages : int option)
  ?(message_attribute_names : string list option)
  ?(message_system_attribute_names : message_system_attribute_name list option)
  ?(attribute_names : queue_attribute_name list option)
  ~(queue_url : string)
  () : receive_message_request = {
  receive_request_attempt_id;
  wait_time_seconds;
  visibility_timeout;
  max_number_of_messages;
  message_attribute_names;
  message_system_attribute_names;
  attribute_names;
  queue_url;
   }

let make_purge_queue_request  ~(queue_url : string) () : purge_queue_request
= { queue_url;  }

let make_list_queues_result 
  ?(next_token : string option) ?(queue_urls : string list option) ()
: list_queues_result = { next_token; queue_urls; 
}

let make_list_queues_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(queue_name_prefix : string option)
  () : list_queues_request = { max_results; next_token; queue_name_prefix; 
}

let make_list_queue_tags_result  ?(tags : (string * string) list option) ()
: list_queue_tags_result = { tags;  }

let make_list_queue_tags_request  ~(queue_url : string) ()
: list_queue_tags_request = { queue_url; 
}

let make_list_message_move_tasks_result_entry 
  ?(started_timestamp : int option)
  ?(failure_reason : string option)
  ?(approximate_number_of_messages_to_move : int option)
  ?(approximate_number_of_messages_moved : int option)
  ?(max_number_of_messages_per_second : int option)
  ?(destination_arn : string option)
  ?(source_arn : string option)
  ?(status : string option)
  ?(task_handle : string option)
  () : list_message_move_tasks_result_entry = {
  started_timestamp;
  failure_reason;
  approximate_number_of_messages_to_move;
  approximate_number_of_messages_moved;
  max_number_of_messages_per_second;
  destination_arn;
  source_arn;
  status;
  task_handle;
   }

let make_list_message_move_tasks_result 
  ?(results : list_message_move_tasks_result_entry list option) ()
: list_message_move_tasks_result = { results; 
}

let make_list_message_move_tasks_request 
  ?(max_results : int option) ~(source_arn : string) ()
: list_message_move_tasks_request = { max_results; source_arn; 
}

let make_list_dead_letter_source_queues_result 
  ?(next_token : string option) ~(queue_urls : string list) ()
: list_dead_letter_source_queues_result = { next_token; queue_urls; 
}

let make_list_dead_letter_source_queues_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(queue_url : string)
  () : list_dead_letter_source_queues_request = {
  max_results; next_token; queue_url;  }

let make_get_queue_url_result  ?(queue_url : string option) ()
: get_queue_url_result = { queue_url;  }

let make_get_queue_url_request 
  ?(queue_owner_aws_account_id : string option) ~(queue_name : string) ()
: get_queue_url_request = { queue_owner_aws_account_id; queue_name; 
}

let make_get_queue_attributes_result 
  ?(attributes : (string * string) list option) ()
: get_queue_attributes_result = { attributes; 
}

let make_get_queue_attributes_request 
  ?(attribute_names : queue_attribute_name list option)
  ~(queue_url : string)
  () : get_queue_attributes_request = { attribute_names; queue_url; 
}

let make_delete_queue_request  ~(queue_url : string) ()
: delete_queue_request = { queue_url;  }

let make_delete_message_request 
  ~(receipt_handle : string) ~(queue_url : string) ()
: delete_message_request = { receipt_handle; queue_url; 
}

let make_delete_message_batch_result_entry  ~(id : string) ()
: delete_message_batch_result_entry = { id; 
}

let make_delete_message_batch_result 
  ~(failed : batch_result_error_entry list)
  ~(successful : delete_message_batch_result_entry list)
  () : delete_message_batch_result = { failed; successful; 
}

let make_delete_message_batch_request_entry 
  ~(receipt_handle : string) ~(id : string) ()
: delete_message_batch_request_entry = { receipt_handle; id; 
}

let make_delete_message_batch_request 
  ~(entries : delete_message_batch_request_entry list)
  ~(queue_url : string)
  () : delete_message_batch_request = { entries; queue_url; 
}

let make_create_queue_result  ?(queue_url : string option) ()
: create_queue_result = { queue_url;  }

let make_create_queue_request 
  ?(tags : (string * string) list option)
  ?(attributes : (string * string) list option)
  ~(queue_name : string)
  () : create_queue_request = { tags; attributes; queue_name; 
}

let make_change_message_visibility_request 
  ~(visibility_timeout : int)
  ~(receipt_handle : string)
  ~(queue_url : string)
  () : change_message_visibility_request = {
  visibility_timeout; receipt_handle; queue_url; 
}

let make_change_message_visibility_batch_result_entry  ~(id : string) ()
: change_message_visibility_batch_result_entry = { id; 
}

let make_change_message_visibility_batch_result 
  ~(failed : batch_result_error_entry list)
  ~(successful : change_message_visibility_batch_result_entry list)
  () : change_message_visibility_batch_result = { failed; successful; 
}

let make_change_message_visibility_batch_request_entry 
  ?(visibility_timeout : int option)
  ~(receipt_handle : string)
  ~(id : string)
  () : change_message_visibility_batch_request_entry = {
  visibility_timeout; receipt_handle; id; 
}

let make_change_message_visibility_batch_request 
  ~(entries : change_message_visibility_batch_request_entry list)
  ~(queue_url : string)
  () : change_message_visibility_batch_request = { entries; queue_url; 
}

let make_cancel_message_move_task_result 
  ?(approximate_number_of_messages_moved : int option) ()
: cancel_message_move_task_result = { approximate_number_of_messages_moved; 
}

let make_cancel_message_move_task_request  ~(task_handle : string) ()
: cancel_message_move_task_request = { task_handle; 
}

let make_add_permission_request 
  ~(actions : string list)
  ~(aws_account_ids : string list)
  ~(label : string)
  ~(queue_url : string)
  () : add_permission_request = {
  actions; aws_account_ids; label; queue_url; 
}

