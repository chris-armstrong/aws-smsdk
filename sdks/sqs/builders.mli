open Types
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
  unit
-> add_permission_request

