open Types
val make_workflow_type : version:string -> name:string -> unit
-> workflow_type

val make_workflow_type_info :
  ?deprecation_date:float ->
  ?description:string ->
  creation_date:float ->
  status:registration_status ->
  workflow_type:workflow_type ->
  unit -> workflow_type_info

val make_workflow_type_infos :
  ?next_page_token:string -> type_infos:workflow_type_info list -> unit
-> workflow_type_infos

val make_workflow_type_filter : ?version:string -> name:string -> unit
-> workflow_type_filter

val make_task_list : name:string -> unit
-> task_list

val make_workflow_type_configuration :
  ?default_lambda_role:string ->
  ?default_child_policy:child_policy ->
  ?default_task_priority:string ->
  ?default_task_list:task_list ->
  ?default_execution_start_to_close_timeout:string ->
  ?default_task_start_to_close_timeout:string ->
  unit -> workflow_type_configuration

val make_workflow_type_detail :
  configuration:workflow_type_configuration ->
  type_info:workflow_type_info ->
  unit
-> workflow_type_detail

val make_workflow_execution_timed_out_event_attributes :
  child_policy:child_policy ->
  timeout_type:workflow_execution_timeout_type ->
  unit
-> workflow_execution_timed_out_event_attributes

val make_workflow_execution_terminated_event_attributes :
  ?cause:workflow_execution_terminated_cause ->
  ?details:string ->
  ?reason:string ->
  child_policy:child_policy ->
  unit
-> workflow_execution_terminated_event_attributes

val make_workflow_execution : run_id:string -> workflow_id:string -> unit
-> workflow_execution

val make_workflow_execution_started_event_attributes :
  ?lambda_role:string ->
  ?parent_initiated_event_id:int ->
  ?parent_workflow_execution:workflow_execution ->
  ?continued_execution_run_id:string ->
  ?tag_list:string list ->
  ?task_priority:string ->
  ?task_start_to_close_timeout:string ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  workflow_type:workflow_type ->
  task_list:task_list ->
  child_policy:child_policy ->
  unit
-> workflow_execution_started_event_attributes

val make_workflow_execution_signaled_event_attributes :
  ?external_initiated_event_id:int ->
  ?external_workflow_execution:workflow_execution ->
  ?input:string ->
  signal_name:string ->
  unit
-> workflow_execution_signaled_event_attributes

val make_workflow_execution_open_counts :
  ?open_lambda_functions:int ->
  open_child_workflow_executions:int ->
  open_timers:int ->
  open_decision_tasks:int ->
  open_activity_tasks:int ->
  unit -> workflow_execution_open_counts

val make_workflow_execution_info :
  ?cancel_requested:bool ->
  ?tag_list:string list ->
  ?parent:workflow_execution ->
  ?close_status:close_status ->
  ?close_timestamp:float ->
  execution_status:execution_status ->
  start_timestamp:float ->
  workflow_type:workflow_type ->
  execution:workflow_execution ->
  unit -> workflow_execution_info

val make_workflow_execution_infos :
  ?next_page_token:string ->
  execution_infos:workflow_execution_info list ->
  unit -> workflow_execution_infos

val make_workflow_execution_filter : workflow_id:string -> unit
-> workflow_execution_filter

val make_workflow_execution_failed_event_attributes :
  ?details:string ->
  ?reason:string ->
  decision_task_completed_event_id:int ->
  unit
-> workflow_execution_failed_event_attributes

val make_workflow_execution_configuration :
  ?lambda_role:string ->
  ?task_priority:string ->
  child_policy:child_policy ->
  task_list:task_list ->
  execution_start_to_close_timeout:string ->
  task_start_to_close_timeout:string ->
  unit
-> workflow_execution_configuration

val make_workflow_execution_detail :
  ?latest_execution_context:string ->
  ?latest_activity_task_timestamp:float ->
  open_counts:workflow_execution_open_counts ->
  execution_configuration:workflow_execution_configuration ->
  execution_info:workflow_execution_info ->
  unit -> workflow_execution_detail

val make_workflow_execution_count : ?truncated:bool -> count:int -> unit
-> workflow_execution_count

val make_workflow_execution_continued_as_new_event_attributes :
  ?lambda_role:string ->
  ?tag_list:string list ->
  ?task_start_to_close_timeout:string ->
  ?task_priority:string ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  workflow_type:workflow_type ->
  child_policy:child_policy ->
  task_list:task_list ->
  new_execution_run_id:string ->
  decision_task_completed_event_id:int ->
  unit
-> workflow_execution_continued_as_new_event_attributes

val make_workflow_execution_completed_event_attributes :
  ?result:string -> decision_task_completed_event_id:int -> unit
-> workflow_execution_completed_event_attributes

val make_workflow_execution_canceled_event_attributes :
  ?details:string -> decision_task_completed_event_id:int -> unit
-> workflow_execution_canceled_event_attributes

val make_workflow_execution_cancel_requested_event_attributes :
  ?cause:workflow_execution_cancel_requested_cause ->
  ?external_initiated_event_id:int ->
  ?external_workflow_execution:workflow_execution ->
  unit
-> workflow_execution_cancel_requested_event_attributes

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_undeprecate_workflow_type_input :
  workflow_type:workflow_type -> domain:string -> unit
-> undeprecate_workflow_type_input

val make_undeprecate_domain_input : name:string -> unit
-> undeprecate_domain_input

val make_activity_type : version:string -> name:string -> unit
-> activity_type

val make_undeprecate_activity_type_input :
  activity_type:activity_type -> domain:string -> unit
-> undeprecate_activity_type_input

val make_timer_started_event_attributes :
  ?control:string ->
  decision_task_completed_event_id:int ->
  start_to_fire_timeout:string ->
  timer_id:string ->
  unit
-> timer_started_event_attributes

val make_timer_fired_event_attributes :
  started_event_id:int -> timer_id:string -> unit
-> timer_fired_event_attributes

val make_timer_canceled_event_attributes :
  decision_task_completed_event_id:int ->
  started_event_id:int ->
  timer_id:string ->
  unit
-> timer_canceled_event_attributes

val make_terminate_workflow_execution_input :
  ?child_policy:child_policy ->
  ?details:string ->
  ?reason:string ->
  ?run_id:string ->
  workflow_id:string ->
  domain:string ->
  unit -> terminate_workflow_execution_input

val make_resource_tag : ?value:string -> key:string -> unit
-> resource_tag

val make_tag_resource_input :
  tags:resource_tag list -> resource_arn:string -> unit
-> tag_resource_input

val make_tag_filter : tag:string -> unit
-> tag_filter

val make_start_workflow_execution_input :
  ?lambda_role:string ->
  ?child_policy:child_policy ->
  ?task_start_to_close_timeout:string ->
  ?tag_list:string list ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  ?task_priority:string ->
  ?task_list:task_list ->
  workflow_type:workflow_type ->
  workflow_id:string ->
  domain:string ->
  unit -> start_workflow_execution_input

val make_run : ?run_id:string -> unit
-> run

val make_start_timer_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:start_timer_failed_cause ->
  timer_id:string ->
  unit
-> start_timer_failed_event_attributes

val make_start_timer_decision_attributes :
  ?control:string -> start_to_fire_timeout:string -> timer_id:string -> unit
-> start_timer_decision_attributes

val make_start_lambda_function_failed_event_attributes :
  ?message:string ->
  ?cause:start_lambda_function_failed_cause ->
  ?scheduled_event_id:int ->
  unit
-> start_lambda_function_failed_event_attributes

val make_start_child_workflow_execution_initiated_event_attributes :
  ?lambda_role:string ->
  ?tag_list:string list ->
  ?task_start_to_close_timeout:string ->
  ?task_priority:string ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  child_policy:child_policy ->
  decision_task_completed_event_id:int ->
  task_list:task_list ->
  workflow_type:workflow_type ->
  workflow_id:string ->
  unit
-> start_child_workflow_execution_initiated_event_attributes

val make_start_child_workflow_execution_failed_event_attributes :
  ?control:string ->
  decision_task_completed_event_id:int ->
  initiated_event_id:int ->
  workflow_id:string ->
  cause:start_child_workflow_execution_failed_cause ->
  workflow_type:workflow_type ->
  unit
-> start_child_workflow_execution_failed_event_attributes

val make_start_child_workflow_execution_decision_attributes :
  ?lambda_role:string ->
  ?tag_list:string list ->
  ?child_policy:child_policy ->
  ?task_start_to_close_timeout:string ->
  ?task_priority:string ->
  ?task_list:task_list ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  workflow_id:string ->
  workflow_type:workflow_type ->
  unit
-> start_child_workflow_execution_decision_attributes

val make_signal_workflow_execution_input :
  ?input:string ->
  ?run_id:string ->
  signal_name:string ->
  workflow_id:string ->
  domain:string ->
  unit
-> signal_workflow_execution_input

val make_schedule_activity_task_decision_attributes :
  ?heartbeat_timeout:string ->
  ?start_to_close_timeout:string ->
  ?schedule_to_start_timeout:string ->
  ?task_priority:string ->
  ?task_list:task_list ->
  ?schedule_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  activity_id:string ->
  activity_type:activity_type ->
  unit
-> schedule_activity_task_decision_attributes

val make_request_cancel_activity_task_decision_attributes :
  activity_id:string -> unit
-> request_cancel_activity_task_decision_attributes

val make_complete_workflow_execution_decision_attributes :
  ?result:string -> unit
-> complete_workflow_execution_decision_attributes

val make_fail_workflow_execution_decision_attributes :
  ?details:string -> ?reason:string -> unit
-> fail_workflow_execution_decision_attributes

val make_cancel_workflow_execution_decision_attributes :
  ?details:string -> unit
-> cancel_workflow_execution_decision_attributes

val make_continue_as_new_workflow_execution_decision_attributes :
  ?lambda_role:string ->
  ?workflow_type_version:string ->
  ?tag_list:string list ->
  ?child_policy:child_policy ->
  ?task_start_to_close_timeout:string ->
  ?task_priority:string ->
  ?task_list:task_list ->
  ?execution_start_to_close_timeout:string ->
  ?input:string ->
  unit
-> continue_as_new_workflow_execution_decision_attributes

val make_record_marker_decision_attributes :
  ?details:string -> marker_name:string -> unit
-> record_marker_decision_attributes

val make_cancel_timer_decision_attributes : timer_id:string -> unit
-> cancel_timer_decision_attributes

val make_signal_external_workflow_execution_decision_attributes :
  ?control:string ->
  ?input:string ->
  ?run_id:string ->
  signal_name:string ->
  workflow_id:string ->
  unit
-> signal_external_workflow_execution_decision_attributes

val make_request_cancel_external_workflow_execution_decision_attributes :
  ?control:string -> ?run_id:string -> workflow_id:string -> unit
-> request_cancel_external_workflow_execution_decision_attributes

val make_schedule_lambda_function_decision_attributes :
  ?start_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  name:string ->
  id:string ->
  unit -> schedule_lambda_function_decision_attributes

val make_decision :
  ?schedule_lambda_function_decision_attributes:schedule_lambda_function_decision_attributes ->
  ?start_child_workflow_execution_decision_attributes:start_child_workflow_execution_decision_attributes ->
  ?request_cancel_external_workflow_execution_decision_attributes:request_cancel_external_workflow_execution_decision_attributes ->
  ?signal_external_workflow_execution_decision_attributes:signal_external_workflow_execution_decision_attributes ->
  ?cancel_timer_decision_attributes:cancel_timer_decision_attributes ->
  ?start_timer_decision_attributes:start_timer_decision_attributes ->
  ?record_marker_decision_attributes:record_marker_decision_attributes ->
  ?continue_as_new_workflow_execution_decision_attributes:continue_as_new_workflow_execution_decision_attributes ->
  ?cancel_workflow_execution_decision_attributes:cancel_workflow_execution_decision_attributes ->
  ?fail_workflow_execution_decision_attributes:fail_workflow_execution_decision_attributes ->
  ?complete_workflow_execution_decision_attributes:complete_workflow_execution_decision_attributes ->
  ?request_cancel_activity_task_decision_attributes:request_cancel_activity_task_decision_attributes ->
  ?schedule_activity_task_decision_attributes:schedule_activity_task_decision_attributes ->
  decision_type:decision_type ->
  unit -> decision

val make_respond_decision_task_completed_input :
  ?task_list_schedule_to_start_timeout:string ->
  ?task_list:task_list ->
  ?execution_context:string ->
  ?decisions:decision list ->
  task_token:string ->
  unit
-> respond_decision_task_completed_input

val make_respond_activity_task_failed_input :
  ?details:string -> ?reason:string -> task_token:string -> unit
-> respond_activity_task_failed_input

val make_respond_activity_task_completed_input :
  ?result:string -> task_token:string -> unit
-> respond_activity_task_completed_input

val make_respond_activity_task_canceled_input :
  ?details:string -> task_token:string -> unit
-> respond_activity_task_canceled_input

val make_request_cancel_workflow_execution_input :
  ?run_id:string -> workflow_id:string -> domain:string -> unit
-> request_cancel_workflow_execution_input

val make_register_workflow_type_input :
  ?default_lambda_role:string ->
  ?default_child_policy:child_policy ->
  ?default_task_priority:string ->
  ?default_task_list:task_list ->
  ?default_execution_start_to_close_timeout:string ->
  ?default_task_start_to_close_timeout:string ->
  ?description:string ->
  version:string ->
  name:string ->
  domain:string ->
  unit -> register_workflow_type_input

val make_register_domain_input :
  ?tags:resource_tag list ->
  ?description:string ->
  workflow_execution_retention_period_in_days:string ->
  name:string ->
  unit -> register_domain_input

val make_register_activity_type_input :
  ?default_task_schedule_to_close_timeout:string ->
  ?default_task_schedule_to_start_timeout:string ->
  ?default_task_priority:string ->
  ?default_task_list:task_list ->
  ?default_task_heartbeat_timeout:string ->
  ?default_task_start_to_close_timeout:string ->
  ?description:string ->
  version:string ->
  name:string ->
  domain:string ->
  unit -> register_activity_type_input

val make_activity_task_status : cancel_requested:bool -> unit
-> activity_task_status

val make_record_activity_task_heartbeat_input :
  ?details:string -> task_token:string -> unit
-> record_activity_task_heartbeat_input

val make_complete_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:complete_workflow_execution_failed_cause ->
  unit
-> complete_workflow_execution_failed_event_attributes

val make_fail_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:fail_workflow_execution_failed_cause ->
  unit
-> fail_workflow_execution_failed_event_attributes

val make_cancel_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:cancel_workflow_execution_failed_cause ->
  unit
-> cancel_workflow_execution_failed_event_attributes

val make_continue_as_new_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:continue_as_new_workflow_execution_failed_cause ->
  unit
-> continue_as_new_workflow_execution_failed_event_attributes

val make_decision_task_scheduled_event_attributes :
  ?schedule_to_start_timeout:string ->
  ?start_to_close_timeout:string ->
  ?task_priority:string ->
  task_list:task_list ->
  unit
-> decision_task_scheduled_event_attributes

val make_decision_task_started_event_attributes :
  ?identity:string -> scheduled_event_id:int -> unit
-> decision_task_started_event_attributes

val make_decision_task_completed_event_attributes :
  ?task_list_schedule_to_start_timeout:string ->
  ?task_list:task_list ->
  ?execution_context:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> decision_task_completed_event_attributes

val make_decision_task_timed_out_event_attributes :
  started_event_id:int ->
  scheduled_event_id:int ->
  timeout_type:decision_task_timeout_type ->
  unit
-> decision_task_timed_out_event_attributes

val make_activity_task_scheduled_event_attributes :
  ?heartbeat_timeout:string ->
  ?task_priority:string ->
  ?start_to_close_timeout:string ->
  ?schedule_to_close_timeout:string ->
  ?schedule_to_start_timeout:string ->
  ?control:string ->
  ?input:string ->
  decision_task_completed_event_id:int ->
  task_list:task_list ->
  activity_id:string ->
  activity_type:activity_type ->
  unit
-> activity_task_scheduled_event_attributes

val make_activity_task_started_event_attributes :
  ?identity:string -> scheduled_event_id:int -> unit
-> activity_task_started_event_attributes

val make_activity_task_completed_event_attributes :
  ?result:string -> started_event_id:int -> scheduled_event_id:int -> unit
-> activity_task_completed_event_attributes

val make_activity_task_failed_event_attributes :
  ?details:string ->
  ?reason:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> activity_task_failed_event_attributes

val make_activity_task_timed_out_event_attributes :
  ?details:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  timeout_type:activity_task_timeout_type ->
  unit
-> activity_task_timed_out_event_attributes

val make_activity_task_canceled_event_attributes :
  ?latest_cancel_requested_event_id:int ->
  ?details:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> activity_task_canceled_event_attributes

val make_activity_task_cancel_requested_event_attributes :
  activity_id:string -> decision_task_completed_event_id:int -> unit
-> activity_task_cancel_requested_event_attributes

val make_marker_recorded_event_attributes :
  ?details:string ->
  decision_task_completed_event_id:int ->
  marker_name:string ->
  unit
-> marker_recorded_event_attributes

val make_record_marker_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:record_marker_failed_cause ->
  marker_name:string ->
  unit
-> record_marker_failed_event_attributes

val make_child_workflow_execution_started_event_attributes :
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_started_event_attributes

val make_child_workflow_execution_completed_event_attributes :
  ?result:string ->
  started_event_id:int ->
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_completed_event_attributes

val make_child_workflow_execution_failed_event_attributes :
  ?details:string ->
  ?reason:string ->
  started_event_id:int ->
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_failed_event_attributes

val make_child_workflow_execution_timed_out_event_attributes :
  started_event_id:int ->
  initiated_event_id:int ->
  timeout_type:workflow_execution_timeout_type ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_timed_out_event_attributes

val make_child_workflow_execution_canceled_event_attributes :
  ?details:string ->
  started_event_id:int ->
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_canceled_event_attributes

val make_child_workflow_execution_terminated_event_attributes :
  started_event_id:int ->
  initiated_event_id:int ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  unit
-> child_workflow_execution_terminated_event_attributes

val make_signal_external_workflow_execution_initiated_event_attributes :
  ?control:string ->
  ?input:string ->
  ?run_id:string ->
  decision_task_completed_event_id:int ->
  signal_name:string ->
  workflow_id:string ->
  unit
-> signal_external_workflow_execution_initiated_event_attributes

val make_external_workflow_execution_signaled_event_attributes :
  initiated_event_id:int -> workflow_execution:workflow_execution -> unit
-> external_workflow_execution_signaled_event_attributes

val make_signal_external_workflow_execution_failed_event_attributes :
  ?control:string ->
  ?run_id:string ->
  decision_task_completed_event_id:int ->
  initiated_event_id:int ->
  cause:signal_external_workflow_execution_failed_cause ->
  workflow_id:string ->
  unit
-> signal_external_workflow_execution_failed_event_attributes

val make_external_workflow_execution_cancel_requested_event_attributes :
  initiated_event_id:int -> workflow_execution:workflow_execution -> unit
-> external_workflow_execution_cancel_requested_event_attributes

val make_request_cancel_external_workflow_execution_initiated_event_attributes :
  ?control:string ->
  ?run_id:string ->
  decision_task_completed_event_id:int ->
  workflow_id:string ->
  unit
-> request_cancel_external_workflow_execution_initiated_event_attributes

val make_request_cancel_external_workflow_execution_failed_event_attributes :
  ?control:string ->
  ?run_id:string ->
  decision_task_completed_event_id:int ->
  initiated_event_id:int ->
  cause:request_cancel_external_workflow_execution_failed_cause ->
  workflow_id:string ->
  unit
-> request_cancel_external_workflow_execution_failed_event_attributes

val make_schedule_activity_task_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:schedule_activity_task_failed_cause ->
  activity_id:string ->
  activity_type:activity_type ->
  unit
-> schedule_activity_task_failed_event_attributes

val make_request_cancel_activity_task_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:request_cancel_activity_task_failed_cause ->
  activity_id:string ->
  unit
-> request_cancel_activity_task_failed_event_attributes

val make_cancel_timer_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:cancel_timer_failed_cause ->
  timer_id:string ->
  unit
-> cancel_timer_failed_event_attributes

val make_lambda_function_scheduled_event_attributes :
  ?start_to_close_timeout:string ->
  ?input:string ->
  ?control:string ->
  decision_task_completed_event_id:int ->
  name:string ->
  id:string ->
  unit
-> lambda_function_scheduled_event_attributes

val make_lambda_function_started_event_attributes :
  scheduled_event_id:int -> unit
-> lambda_function_started_event_attributes

val make_lambda_function_completed_event_attributes :
  ?result:string -> started_event_id:int -> scheduled_event_id:int -> unit
-> lambda_function_completed_event_attributes

val make_lambda_function_failed_event_attributes :
  ?details:string ->
  ?reason:string ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> lambda_function_failed_event_attributes

val make_lambda_function_timed_out_event_attributes :
  ?timeout_type:lambda_function_timeout_type ->
  started_event_id:int ->
  scheduled_event_id:int ->
  unit
-> lambda_function_timed_out_event_attributes

val make_schedule_lambda_function_failed_event_attributes :
  decision_task_completed_event_id:int ->
  cause:schedule_lambda_function_failed_cause ->
  name:string ->
  id:string ->
  unit
-> schedule_lambda_function_failed_event_attributes

val make_history_event :
  ?start_lambda_function_failed_event_attributes:start_lambda_function_failed_event_attributes ->
  ?schedule_lambda_function_failed_event_attributes:schedule_lambda_function_failed_event_attributes ->
  ?lambda_function_timed_out_event_attributes:lambda_function_timed_out_event_attributes ->
  ?lambda_function_failed_event_attributes:lambda_function_failed_event_attributes ->
  ?lambda_function_completed_event_attributes:lambda_function_completed_event_attributes ->
  ?lambda_function_started_event_attributes:lambda_function_started_event_attributes ->
  ?lambda_function_scheduled_event_attributes:lambda_function_scheduled_event_attributes ->
  ?start_child_workflow_execution_failed_event_attributes:start_child_workflow_execution_failed_event_attributes ->
  ?cancel_timer_failed_event_attributes:cancel_timer_failed_event_attributes ->
  ?start_timer_failed_event_attributes:start_timer_failed_event_attributes ->
  ?request_cancel_activity_task_failed_event_attributes:request_cancel_activity_task_failed_event_attributes ->
  ?schedule_activity_task_failed_event_attributes:schedule_activity_task_failed_event_attributes ->
  ?request_cancel_external_workflow_execution_failed_event_attributes:request_cancel_external_workflow_execution_failed_event_attributes ->
  ?request_cancel_external_workflow_execution_initiated_event_attributes:request_cancel_external_workflow_execution_initiated_event_attributes ->
  ?external_workflow_execution_cancel_requested_event_attributes:external_workflow_execution_cancel_requested_event_attributes ->
  ?signal_external_workflow_execution_failed_event_attributes:signal_external_workflow_execution_failed_event_attributes ->
  ?external_workflow_execution_signaled_event_attributes:external_workflow_execution_signaled_event_attributes ->
  ?signal_external_workflow_execution_initiated_event_attributes:signal_external_workflow_execution_initiated_event_attributes ->
  ?child_workflow_execution_terminated_event_attributes:child_workflow_execution_terminated_event_attributes ->
  ?child_workflow_execution_canceled_event_attributes:child_workflow_execution_canceled_event_attributes ->
  ?child_workflow_execution_timed_out_event_attributes:child_workflow_execution_timed_out_event_attributes ->
  ?child_workflow_execution_failed_event_attributes:child_workflow_execution_failed_event_attributes ->
  ?child_workflow_execution_completed_event_attributes:child_workflow_execution_completed_event_attributes ->
  ?child_workflow_execution_started_event_attributes:child_workflow_execution_started_event_attributes ->
  ?start_child_workflow_execution_initiated_event_attributes:start_child_workflow_execution_initiated_event_attributes ->
  ?timer_canceled_event_attributes:timer_canceled_event_attributes ->
  ?timer_fired_event_attributes:timer_fired_event_attributes ->
  ?timer_started_event_attributes:timer_started_event_attributes ->
  ?record_marker_failed_event_attributes:record_marker_failed_event_attributes ->
  ?marker_recorded_event_attributes:marker_recorded_event_attributes ->
  ?workflow_execution_signaled_event_attributes:workflow_execution_signaled_event_attributes ->
  ?activity_task_cancel_requested_event_attributes:activity_task_cancel_requested_event_attributes ->
  ?activity_task_canceled_event_attributes:activity_task_canceled_event_attributes ->
  ?activity_task_timed_out_event_attributes:activity_task_timed_out_event_attributes ->
  ?activity_task_failed_event_attributes:activity_task_failed_event_attributes ->
  ?activity_task_completed_event_attributes:activity_task_completed_event_attributes ->
  ?activity_task_started_event_attributes:activity_task_started_event_attributes ->
  ?activity_task_scheduled_event_attributes:activity_task_scheduled_event_attributes ->
  ?decision_task_timed_out_event_attributes:decision_task_timed_out_event_attributes ->
  ?decision_task_completed_event_attributes:decision_task_completed_event_attributes ->
  ?decision_task_started_event_attributes:decision_task_started_event_attributes ->
  ?decision_task_scheduled_event_attributes:decision_task_scheduled_event_attributes ->
  ?workflow_execution_cancel_requested_event_attributes:workflow_execution_cancel_requested_event_attributes ->
  ?workflow_execution_terminated_event_attributes:workflow_execution_terminated_event_attributes ->
  ?continue_as_new_workflow_execution_failed_event_attributes:continue_as_new_workflow_execution_failed_event_attributes ->
  ?workflow_execution_continued_as_new_event_attributes:workflow_execution_continued_as_new_event_attributes ->
  ?cancel_workflow_execution_failed_event_attributes:cancel_workflow_execution_failed_event_attributes ->
  ?workflow_execution_canceled_event_attributes:workflow_execution_canceled_event_attributes ->
  ?workflow_execution_timed_out_event_attributes:workflow_execution_timed_out_event_attributes ->
  ?fail_workflow_execution_failed_event_attributes:fail_workflow_execution_failed_event_attributes ->
  ?workflow_execution_failed_event_attributes:workflow_execution_failed_event_attributes ->
  ?complete_workflow_execution_failed_event_attributes:complete_workflow_execution_failed_event_attributes ->
  ?workflow_execution_completed_event_attributes:workflow_execution_completed_event_attributes ->
  ?workflow_execution_started_event_attributes:workflow_execution_started_event_attributes ->
  event_id:int ->
  event_type:event_type ->
  event_timestamp:float ->
  unit -> history_event

val make_decision_task :
  ?previous_started_event_id:int ->
  ?next_page_token:string ->
  events:history_event list ->
  workflow_type:workflow_type ->
  workflow_execution:workflow_execution ->
  started_event_id:int ->
  task_token:string ->
  unit -> decision_task

val make_poll_for_decision_task_input :
  ?start_at_previous_started_event:bool ->
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?identity:string ->
  task_list:task_list ->
  domain:string ->
  unit -> poll_for_decision_task_input

val make_activity_task :
  ?input:string ->
  activity_type:activity_type ->
  workflow_execution:workflow_execution ->
  started_event_id:int ->
  activity_id:string ->
  task_token:string ->
  unit -> activity_task

val make_poll_for_activity_task_input :
  ?identity:string -> task_list:task_list -> domain:string -> unit
-> poll_for_activity_task_input

val make_list_workflow_types_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?name:string ->
  registration_status:registration_status ->
  domain:string ->
  unit -> list_workflow_types_input

val make_list_tags_for_resource_output : ?tags:resource_tag list -> unit
-> list_tags_for_resource_output

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input

val make_execution_time_filter :
  ?latest_date:float -> oldest_date:float -> unit
-> execution_time_filter

val make_list_open_workflow_executions_input :
  ?execution_filter:workflow_execution_filter ->
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?tag_filter:tag_filter ->
  ?type_filter:workflow_type_filter ->
  start_time_filter:execution_time_filter ->
  domain:string ->
  unit -> list_open_workflow_executions_input

val make_domain_info :
  ?arn:string ->
  ?description:string ->
  status:registration_status ->
  name:string ->
  unit -> domain_info

val make_domain_infos :
  ?next_page_token:string -> domain_infos:domain_info list -> unit
-> domain_infos

val make_list_domains_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  registration_status:registration_status ->
  unit -> list_domains_input

val make_close_status_filter : status:close_status -> unit
-> close_status_filter

val make_list_closed_workflow_executions_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?tag_filter:tag_filter ->
  ?type_filter:workflow_type_filter ->
  ?close_status_filter:close_status_filter ->
  ?execution_filter:workflow_execution_filter ->
  ?close_time_filter:execution_time_filter ->
  ?start_time_filter:execution_time_filter ->
  domain:string ->
  unit -> list_closed_workflow_executions_input

val make_activity_type_info :
  ?deprecation_date:float ->
  ?description:string ->
  creation_date:float ->
  status:registration_status ->
  activity_type:activity_type ->
  unit -> activity_type_info

val make_activity_type_infos :
  ?next_page_token:string -> type_infos:activity_type_info list -> unit
-> activity_type_infos

val make_list_activity_types_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  ?name:string ->
  registration_status:registration_status ->
  domain:string ->
  unit -> list_activity_types_input

val make_history :
  ?next_page_token:string -> events:history_event list -> unit
-> history

val make_get_workflow_execution_history_input :
  ?reverse_order:bool ->
  ?maximum_page_size:int ->
  ?next_page_token:string ->
  execution:workflow_execution ->
  domain:string ->
  unit
-> get_workflow_execution_history_input

val make_describe_workflow_type_input :
  workflow_type:workflow_type -> domain:string -> unit
-> describe_workflow_type_input

val make_describe_workflow_execution_input :
  execution:workflow_execution -> domain:string -> unit
-> describe_workflow_execution_input

val make_domain_configuration :
  workflow_execution_retention_period_in_days:string -> unit
-> domain_configuration

val make_domain_detail :
  configuration:domain_configuration -> domain_info:domain_info -> unit
-> domain_detail

val make_describe_domain_input : name:string -> unit
-> describe_domain_input

val make_activity_type_configuration :
  ?default_task_schedule_to_close_timeout:string ->
  ?default_task_schedule_to_start_timeout:string ->
  ?default_task_priority:string ->
  ?default_task_list:task_list ->
  ?default_task_heartbeat_timeout:string ->
  ?default_task_start_to_close_timeout:string ->
  unit -> activity_type_configuration

val make_activity_type_detail :
  configuration:activity_type_configuration ->
  type_info:activity_type_info ->
  unit -> activity_type_detail

val make_describe_activity_type_input :
  activity_type:activity_type -> domain:string -> unit
-> describe_activity_type_input

val make_deprecate_workflow_type_input :
  workflow_type:workflow_type -> domain:string -> unit
-> deprecate_workflow_type_input

val make_deprecate_domain_input : name:string -> unit
-> deprecate_domain_input

val make_deprecate_activity_type_input :
  activity_type:activity_type -> domain:string -> unit
-> deprecate_activity_type_input

val make_delete_workflow_type_input :
  workflow_type:workflow_type -> domain:string -> unit
-> delete_workflow_type_input

val make_delete_activity_type_input :
  activity_type:activity_type -> domain:string -> unit
-> delete_activity_type_input

val make_pending_task_count : ?truncated:bool -> count:int -> unit
-> pending_task_count

val make_count_pending_decision_tasks_input :
  task_list:task_list -> domain:string -> unit
-> count_pending_decision_tasks_input

val make_count_pending_activity_tasks_input :
  task_list:task_list -> domain:string -> unit
-> count_pending_activity_tasks_input

val make_count_open_workflow_executions_input :
  ?execution_filter:workflow_execution_filter ->
  ?tag_filter:tag_filter ->
  ?type_filter:workflow_type_filter ->
  start_time_filter:execution_time_filter ->
  domain:string ->
  unit
-> count_open_workflow_executions_input

val make_count_closed_workflow_executions_input :
  ?close_status_filter:close_status_filter ->
  ?tag_filter:tag_filter ->
  ?type_filter:workflow_type_filter ->
  ?execution_filter:workflow_execution_filter ->
  ?close_time_filter:execution_time_filter ->
  ?start_time_filter:execution_time_filter ->
  domain:string ->
  unit
-> count_closed_workflow_executions_input

