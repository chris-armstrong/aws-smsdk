[@@@warning "-39"]
open Types
let make_workflow_type  ~(version : string) ~(name : string) ()
: workflow_type = { version; name;  }

let make_workflow_type_info 
  ?(deprecation_date : float option)
  ?(description : string option)
  ~(creation_date : float)
  ~(status : registration_status)
  ~(workflow_type : workflow_type)
  () : workflow_type_info = {
  deprecation_date; creation_date; description; status; workflow_type; 
}

let make_workflow_type_infos 
  ?(next_page_token : string option)
  ~(type_infos : workflow_type_info list)
  () : workflow_type_infos = { next_page_token; type_infos; 
}

let make_workflow_type_filter  ?(version : string option) ~(name : string) ()
: workflow_type_filter = { version; name;  }

let make_task_list  ~(name : string) () : task_list = { name; 
}

let make_workflow_type_configuration 
  ?(default_lambda_role : string option)
  ?(default_child_policy : child_policy option)
  ?(default_task_priority : string option)
  ?(default_task_list : task_list option)
  ?(default_execution_start_to_close_timeout : string option)
  ?(default_task_start_to_close_timeout : string option)
  () : workflow_type_configuration = {
  default_lambda_role;
  default_child_policy;
  default_task_priority;
  default_task_list;
  default_execution_start_to_close_timeout;
  default_task_start_to_close_timeout;
   }

let make_workflow_type_detail 
  ~(configuration : workflow_type_configuration)
  ~(type_info : workflow_type_info)
  () : workflow_type_detail = { configuration; type_info; 
}

let make_workflow_execution_timed_out_event_attributes 
  ~(child_policy : child_policy)
  ~(timeout_type : workflow_execution_timeout_type)
  () : workflow_execution_timed_out_event_attributes = {
  child_policy; timeout_type; 
}

let make_workflow_execution_terminated_event_attributes 
  ?(cause : workflow_execution_terminated_cause option)
  ?(details : string option)
  ?(reason : string option)
  ~(child_policy : child_policy)
  () : workflow_execution_terminated_event_attributes = {
  cause; child_policy; details; reason;  }

let make_workflow_execution  ~(run_id : string) ~(workflow_id : string) ()
: workflow_execution = { run_id; workflow_id; 
}

let make_workflow_execution_started_event_attributes 
  ?(lambda_role : string option)
  ?(parent_initiated_event_id : int option)
  ?(parent_workflow_execution : workflow_execution option)
  ?(continued_execution_run_id : string option)
  ?(tag_list : string list option)
  ?(task_priority : string option)
  ?(task_start_to_close_timeout : string option)
  ?(execution_start_to_close_timeout : string option)
  ?(input : string option)
  ~(workflow_type : workflow_type)
  ~(task_list : task_list)
  ~(child_policy : child_policy)
  () : workflow_execution_started_event_attributes = {
  lambda_role;
  parent_initiated_event_id;
  parent_workflow_execution;
  continued_execution_run_id;
  tag_list;
  workflow_type;
  task_priority;
  task_list;
  child_policy;
  task_start_to_close_timeout;
  execution_start_to_close_timeout;
  input;
   }

let make_workflow_execution_signaled_event_attributes 
  ?(external_initiated_event_id : int option)
  ?(external_workflow_execution : workflow_execution option)
  ?(input : string option)
  ~(signal_name : string)
  () : workflow_execution_signaled_event_attributes = {
  external_initiated_event_id;
  external_workflow_execution;
  input;
  signal_name;
   }

let make_workflow_execution_open_counts 
  ?(open_lambda_functions : int option)
  ~(open_child_workflow_executions : int)
  ~(open_timers : int)
  ~(open_decision_tasks : int)
  ~(open_activity_tasks : int)
  () : workflow_execution_open_counts = {
  open_lambda_functions;
  open_child_workflow_executions;
  open_timers;
  open_decision_tasks;
  open_activity_tasks;
   }

let make_workflow_execution_info 
  ?(cancel_requested : bool option)
  ?(tag_list : string list option)
  ?(parent : workflow_execution option)
  ?(close_status : close_status option)
  ?(close_timestamp : float option)
  ~(execution_status : execution_status)
  ~(start_timestamp : float)
  ~(workflow_type : workflow_type)
  ~(execution : workflow_execution)
  () : workflow_execution_info = {
  cancel_requested;
  tag_list;
  parent;
  close_status;
  execution_status;
  close_timestamp;
  start_timestamp;
  workflow_type;
  execution;
   }

let make_workflow_execution_infos 
  ?(next_page_token : string option)
  ~(execution_infos : workflow_execution_info list)
  () : workflow_execution_infos = { next_page_token; execution_infos; 
}

let make_workflow_execution_filter  ~(workflow_id : string) ()
: workflow_execution_filter = { workflow_id; 
}

let make_workflow_execution_failed_event_attributes 
  ?(details : string option)
  ?(reason : string option)
  ~(decision_task_completed_event_id : int)
  () : workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id; details; reason; 
}

let make_workflow_execution_configuration 
  ?(lambda_role : string option)
  ?(task_priority : string option)
  ~(child_policy : child_policy)
  ~(task_list : task_list)
  ~(execution_start_to_close_timeout : string)
  ~(task_start_to_close_timeout : string)
  () : workflow_execution_configuration = {
  lambda_role;
  child_policy;
  task_priority;
  task_list;
  execution_start_to_close_timeout;
  task_start_to_close_timeout;
   }

let make_workflow_execution_detail 
  ?(latest_execution_context : string option)
  ?(latest_activity_task_timestamp : float option)
  ~(open_counts : workflow_execution_open_counts)
  ~(execution_configuration : workflow_execution_configuration)
  ~(execution_info : workflow_execution_info)
  () : workflow_execution_detail = {
  latest_execution_context;
  latest_activity_task_timestamp;
  open_counts;
  execution_configuration;
  execution_info;
   }

let make_workflow_execution_count 
  ?(truncated : bool option) ~(count : int) () : workflow_execution_count = {
  truncated; count; 
}

let make_workflow_execution_continued_as_new_event_attributes 
  ?(lambda_role : string option)
  ?(tag_list : string list option)
  ?(task_start_to_close_timeout : string option)
  ?(task_priority : string option)
  ?(execution_start_to_close_timeout : string option)
  ?(input : string option)
  ~(workflow_type : workflow_type)
  ~(child_policy : child_policy)
  ~(task_list : task_list)
  ~(new_execution_run_id : string)
  ~(decision_task_completed_event_id : int)
  () : workflow_execution_continued_as_new_event_attributes = {
  lambda_role;
  workflow_type;
  tag_list;
  child_policy;
  task_start_to_close_timeout;
  task_priority;
  task_list;
  execution_start_to_close_timeout;
  new_execution_run_id;
  decision_task_completed_event_id;
  input;
   }

let make_workflow_execution_completed_event_attributes 
  ?(result : string option) ~(decision_task_completed_event_id : int) ()
: workflow_execution_completed_event_attributes = {
  decision_task_completed_event_id; result; 
}

let make_workflow_execution_canceled_event_attributes 
  ?(details : string option) ~(decision_task_completed_event_id : int) ()
: workflow_execution_canceled_event_attributes = {
  decision_task_completed_event_id; details; 
}

let make_workflow_execution_cancel_requested_event_attributes 
  ?(cause : workflow_execution_cancel_requested_cause option)
  ?(external_initiated_event_id : int option)
  ?(external_workflow_execution : workflow_execution option)
  () : workflow_execution_cancel_requested_event_attributes = {
  cause; external_initiated_event_id; external_workflow_execution; 
}

let make_untag_resource_input 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_input = { tag_keys; resource_arn; 
}

let make_undeprecate_workflow_type_input 
  ~(workflow_type : workflow_type) ~(domain : string) ()
: undeprecate_workflow_type_input = { workflow_type; domain; 
}

let make_undeprecate_domain_input  ~(name : string) ()
: undeprecate_domain_input = { name;  }

let make_activity_type  ~(version : string) ~(name : string) ()
: activity_type = { version; name; 
}

let make_undeprecate_activity_type_input 
  ~(activity_type : activity_type) ~(domain : string) ()
: undeprecate_activity_type_input = { activity_type; domain; 
}

let make_timer_started_event_attributes 
  ?(control : string option)
  ~(decision_task_completed_event_id : int)
  ~(start_to_fire_timeout : string)
  ~(timer_id : string)
  () : timer_started_event_attributes = {
  decision_task_completed_event_id; start_to_fire_timeout; control; timer_id; 
}

let make_timer_fired_event_attributes 
  ~(started_event_id : int) ~(timer_id : string) ()
: timer_fired_event_attributes = { started_event_id; timer_id; 
}

let make_timer_canceled_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(started_event_id : int)
  ~(timer_id : string)
  () : timer_canceled_event_attributes = {
  decision_task_completed_event_id; started_event_id; timer_id; 
}

let make_terminate_workflow_execution_input 
  ?(child_policy : child_policy option)
  ?(details : string option)
  ?(reason : string option)
  ?(run_id : string option)
  ~(workflow_id : string)
  ~(domain : string)
  () : terminate_workflow_execution_input = {
  child_policy; details; reason; run_id; workflow_id; domain; 
}

let make_resource_tag  ?(value : string option) ~(key : string) ()
: resource_tag = { value; key;  }

let make_tag_resource_input 
  ~(tags : resource_tag list) ~(resource_arn : string) ()
: tag_resource_input = { tags; resource_arn;  }

let make_tag_filter  ~(tag : string) () : tag_filter = { tag; 
}

let make_start_workflow_execution_input 
  ?(lambda_role : string option)
  ?(child_policy : child_policy option)
  ?(task_start_to_close_timeout : string option)
  ?(tag_list : string list option)
  ?(execution_start_to_close_timeout : string option)
  ?(input : string option)
  ?(task_priority : string option)
  ?(task_list : task_list option)
  ~(workflow_type : workflow_type)
  ~(workflow_id : string)
  ~(domain : string)
  () : start_workflow_execution_input = {
  lambda_role;
  child_policy;
  task_start_to_close_timeout;
  tag_list;
  execution_start_to_close_timeout;
  input;
  task_priority;
  task_list;
  workflow_type;
  workflow_id;
  domain;
   }

let make_run  ?(run_id : string option) () : run = { run_id; 
}

let make_start_timer_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : start_timer_failed_cause)
  ~(timer_id : string)
  () : start_timer_failed_event_attributes = {
  decision_task_completed_event_id; cause; timer_id; 
}

let make_start_timer_decision_attributes 
  ?(control : string option)
  ~(start_to_fire_timeout : string)
  ~(timer_id : string)
  () : start_timer_decision_attributes = {
  start_to_fire_timeout; control; timer_id; 
}

let make_start_lambda_function_failed_event_attributes 
  ?(message : string option)
  ?(cause : start_lambda_function_failed_cause option)
  ?(scheduled_event_id : int option)
  () : start_lambda_function_failed_event_attributes = {
  message; cause; scheduled_event_id; 
}

let make_start_child_workflow_execution_initiated_event_attributes 
  ?(lambda_role : string option)
  ?(tag_list : string list option)
  ?(task_start_to_close_timeout : string option)
  ?(task_priority : string option)
  ?(execution_start_to_close_timeout : string option)
  ?(input : string option)
  ?(control : string option)
  ~(child_policy : child_policy)
  ~(decision_task_completed_event_id : int)
  ~(task_list : task_list)
  ~(workflow_type : workflow_type)
  ~(workflow_id : string)
  () : start_child_workflow_execution_initiated_event_attributes = {
  lambda_role;
  tag_list;
  task_start_to_close_timeout;
  child_policy;
  decision_task_completed_event_id;
  task_priority;
  task_list;
  execution_start_to_close_timeout;
  input;
  control;
  workflow_type;
  workflow_id;
   }

let make_start_child_workflow_execution_failed_event_attributes 
  ?(control : string option)
  ~(decision_task_completed_event_id : int)
  ~(initiated_event_id : int)
  ~(workflow_id : string)
  ~(cause : start_child_workflow_execution_failed_cause)
  ~(workflow_type : workflow_type)
  () : start_child_workflow_execution_failed_event_attributes = {
  control;
  decision_task_completed_event_id;
  initiated_event_id;
  workflow_id;
  cause;
  workflow_type;
   }

let make_start_child_workflow_execution_decision_attributes 
  ?(lambda_role : string option)
  ?(tag_list : string list option)
  ?(child_policy : child_policy option)
  ?(task_start_to_close_timeout : string option)
  ?(task_priority : string option)
  ?(task_list : task_list option)
  ?(execution_start_to_close_timeout : string option)
  ?(input : string option)
  ?(control : string option)
  ~(workflow_id : string)
  ~(workflow_type : workflow_type)
  () : start_child_workflow_execution_decision_attributes = {
  lambda_role;
  tag_list;
  child_policy;
  task_start_to_close_timeout;
  task_priority;
  task_list;
  execution_start_to_close_timeout;
  input;
  control;
  workflow_id;
  workflow_type;
   }

let make_signal_workflow_execution_input 
  ?(input : string option)
  ?(run_id : string option)
  ~(signal_name : string)
  ~(workflow_id : string)
  ~(domain : string)
  () : signal_workflow_execution_input = {
  input; signal_name; run_id; workflow_id; domain; 
}

let make_schedule_activity_task_decision_attributes 
  ?(heartbeat_timeout : string option)
  ?(start_to_close_timeout : string option)
  ?(schedule_to_start_timeout : string option)
  ?(task_priority : string option)
  ?(task_list : task_list option)
  ?(schedule_to_close_timeout : string option)
  ?(input : string option)
  ?(control : string option)
  ~(activity_id : string)
  ~(activity_type : activity_type)
  () : schedule_activity_task_decision_attributes = {
  heartbeat_timeout;
  start_to_close_timeout;
  schedule_to_start_timeout;
  task_priority;
  task_list;
  schedule_to_close_timeout;
  input;
  control;
  activity_id;
  activity_type;
   }

let make_request_cancel_activity_task_decision_attributes 
  ~(activity_id : string) ()
: request_cancel_activity_task_decision_attributes = { activity_id; 
}

let make_complete_workflow_execution_decision_attributes 
  ?(result : string option) ()
: complete_workflow_execution_decision_attributes = { result; 
}

let make_fail_workflow_execution_decision_attributes 
  ?(details : string option) ?(reason : string option) ()
: fail_workflow_execution_decision_attributes = { details; reason; 
}

let make_cancel_workflow_execution_decision_attributes 
  ?(details : string option) ()
: cancel_workflow_execution_decision_attributes = { details; 
}

let make_continue_as_new_workflow_execution_decision_attributes 
  ?(lambda_role : string option)
  ?(workflow_type_version : string option)
  ?(tag_list : string list option)
  ?(child_policy : child_policy option)
  ?(task_start_to_close_timeout : string option)
  ?(task_priority : string option)
  ?(task_list : task_list option)
  ?(execution_start_to_close_timeout : string option)
  ?(input : string option)
  () : continue_as_new_workflow_execution_decision_attributes = {
  lambda_role;
  workflow_type_version;
  tag_list;
  child_policy;
  task_start_to_close_timeout;
  task_priority;
  task_list;
  execution_start_to_close_timeout;
  input;
   }

let make_record_marker_decision_attributes 
  ?(details : string option) ~(marker_name : string) ()
: record_marker_decision_attributes = { details; marker_name; 
}

let make_cancel_timer_decision_attributes  ~(timer_id : string) ()
: cancel_timer_decision_attributes = { timer_id; 
}

let make_signal_external_workflow_execution_decision_attributes 
  ?(control : string option)
  ?(input : string option)
  ?(run_id : string option)
  ~(signal_name : string)
  ~(workflow_id : string)
  () : signal_external_workflow_execution_decision_attributes = {
  control; input; signal_name; run_id; workflow_id; 
}

let make_request_cancel_external_workflow_execution_decision_attributes 
  ?(control : string option)
  ?(run_id : string option)
  ~(workflow_id : string)
  () : request_cancel_external_workflow_execution_decision_attributes = {
  control; run_id; workflow_id; 
}

let make_schedule_lambda_function_decision_attributes 
  ?(start_to_close_timeout : string option)
  ?(input : string option)
  ?(control : string option)
  ~(name : string)
  ~(id : string)
  () : schedule_lambda_function_decision_attributes = {
  start_to_close_timeout; input; control; name; id;  }

let make_decision 
  ?(schedule_lambda_function_decision_attributes : schedule_lambda_function_decision_attributes option)
  ?(start_child_workflow_execution_decision_attributes : start_child_workflow_execution_decision_attributes option)
  ?(request_cancel_external_workflow_execution_decision_attributes : request_cancel_external_workflow_execution_decision_attributes option)
  ?(signal_external_workflow_execution_decision_attributes : signal_external_workflow_execution_decision_attributes option)
  ?(cancel_timer_decision_attributes : cancel_timer_decision_attributes option)
  ?(start_timer_decision_attributes : start_timer_decision_attributes option)
  ?(record_marker_decision_attributes : record_marker_decision_attributes option)
  ?(continue_as_new_workflow_execution_decision_attributes : continue_as_new_workflow_execution_decision_attributes option)
  ?(cancel_workflow_execution_decision_attributes : cancel_workflow_execution_decision_attributes option)
  ?(fail_workflow_execution_decision_attributes : fail_workflow_execution_decision_attributes option)
  ?(complete_workflow_execution_decision_attributes : complete_workflow_execution_decision_attributes option)
  ?(request_cancel_activity_task_decision_attributes : request_cancel_activity_task_decision_attributes option)
  ?(schedule_activity_task_decision_attributes : schedule_activity_task_decision_attributes option)
  ~(decision_type : decision_type)
  () : decision = {
  schedule_lambda_function_decision_attributes;
  start_child_workflow_execution_decision_attributes;
  request_cancel_external_workflow_execution_decision_attributes;
  signal_external_workflow_execution_decision_attributes;
  cancel_timer_decision_attributes;
  start_timer_decision_attributes;
  record_marker_decision_attributes;
  continue_as_new_workflow_execution_decision_attributes;
  cancel_workflow_execution_decision_attributes;
  fail_workflow_execution_decision_attributes;
  complete_workflow_execution_decision_attributes;
  request_cancel_activity_task_decision_attributes;
  schedule_activity_task_decision_attributes;
  decision_type;
   }

let make_respond_decision_task_completed_input 
  ?(task_list_schedule_to_start_timeout : string option)
  ?(task_list : task_list option)
  ?(execution_context : string option)
  ?(decisions : decision list option)
  ~(task_token : string)
  () : respond_decision_task_completed_input = {
  task_list_schedule_to_start_timeout;
  task_list;
  execution_context;
  decisions;
  task_token;
   }

let make_respond_activity_task_failed_input 
  ?(details : string option)
  ?(reason : string option)
  ~(task_token : string)
  () : respond_activity_task_failed_input = { details; reason; task_token; 
}

let make_respond_activity_task_completed_input 
  ?(result : string option) ~(task_token : string) ()
: respond_activity_task_completed_input = { result; task_token; 
}

let make_respond_activity_task_canceled_input 
  ?(details : string option) ~(task_token : string) ()
: respond_activity_task_canceled_input = { details; task_token; 
}

let make_request_cancel_workflow_execution_input 
  ?(run_id : string option) ~(workflow_id : string) ~(domain : string) ()
: request_cancel_workflow_execution_input = { run_id; workflow_id; domain; 
}

let make_register_workflow_type_input 
  ?(default_lambda_role : string option)
  ?(default_child_policy : child_policy option)
  ?(default_task_priority : string option)
  ?(default_task_list : task_list option)
  ?(default_execution_start_to_close_timeout : string option)
  ?(default_task_start_to_close_timeout : string option)
  ?(description : string option)
  ~(version : string)
  ~(name : string)
  ~(domain : string)
  () : register_workflow_type_input = {
  default_lambda_role;
  default_child_policy;
  default_task_priority;
  default_task_list;
  default_execution_start_to_close_timeout;
  default_task_start_to_close_timeout;
  description;
  version;
  name;
  domain;
   }

let make_register_domain_input 
  ?(tags : resource_tag list option)
  ?(description : string option)
  ~(workflow_execution_retention_period_in_days : string)
  ~(name : string)
  () : register_domain_input = {
  tags; workflow_execution_retention_period_in_days; description; name; 
}

let make_register_activity_type_input 
  ?(default_task_schedule_to_close_timeout : string option)
  ?(default_task_schedule_to_start_timeout : string option)
  ?(default_task_priority : string option)
  ?(default_task_list : task_list option)
  ?(default_task_heartbeat_timeout : string option)
  ?(default_task_start_to_close_timeout : string option)
  ?(description : string option)
  ~(version : string)
  ~(name : string)
  ~(domain : string)
  () : register_activity_type_input = {
  default_task_schedule_to_close_timeout;
  default_task_schedule_to_start_timeout;
  default_task_priority;
  default_task_list;
  default_task_heartbeat_timeout;
  default_task_start_to_close_timeout;
  description;
  version;
  name;
  domain;
   }

let make_activity_task_status  ~(cancel_requested : bool) ()
: activity_task_status = { cancel_requested; 
}

let make_record_activity_task_heartbeat_input 
  ?(details : string option) ~(task_token : string) ()
: record_activity_task_heartbeat_input = { details; task_token; 
}

let make_complete_workflow_execution_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : complete_workflow_execution_failed_cause)
  () : complete_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id; cause; 
}

let make_fail_workflow_execution_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : fail_workflow_execution_failed_cause)
  () : fail_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id; cause; 
}

let make_cancel_workflow_execution_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : cancel_workflow_execution_failed_cause)
  () : cancel_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id; cause; 
}

let make_continue_as_new_workflow_execution_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : continue_as_new_workflow_execution_failed_cause)
  () : continue_as_new_workflow_execution_failed_event_attributes = {
  decision_task_completed_event_id; cause; 
}

let make_decision_task_scheduled_event_attributes 
  ?(schedule_to_start_timeout : string option)
  ?(start_to_close_timeout : string option)
  ?(task_priority : string option)
  ~(task_list : task_list)
  () : decision_task_scheduled_event_attributes = {
  schedule_to_start_timeout;
  start_to_close_timeout;
  task_priority;
  task_list;
   }

let make_decision_task_started_event_attributes 
  ?(identity : string option) ~(scheduled_event_id : int) ()
: decision_task_started_event_attributes = { scheduled_event_id; identity; 
}

let make_decision_task_completed_event_attributes 
  ?(task_list_schedule_to_start_timeout : string option)
  ?(task_list : task_list option)
  ?(execution_context : string option)
  ~(started_event_id : int)
  ~(scheduled_event_id : int)
  () : decision_task_completed_event_attributes = {
  task_list_schedule_to_start_timeout;
  task_list;
  started_event_id;
  scheduled_event_id;
  execution_context;
   }

let make_decision_task_timed_out_event_attributes 
  ~(started_event_id : int)
  ~(scheduled_event_id : int)
  ~(timeout_type : decision_task_timeout_type)
  () : decision_task_timed_out_event_attributes = {
  started_event_id; scheduled_event_id; timeout_type; 
}

let make_activity_task_scheduled_event_attributes 
  ?(heartbeat_timeout : string option)
  ?(task_priority : string option)
  ?(start_to_close_timeout : string option)
  ?(schedule_to_close_timeout : string option)
  ?(schedule_to_start_timeout : string option)
  ?(control : string option)
  ?(input : string option)
  ~(decision_task_completed_event_id : int)
  ~(task_list : task_list)
  ~(activity_id : string)
  ~(activity_type : activity_type)
  () : activity_task_scheduled_event_attributes = {
  heartbeat_timeout;
  decision_task_completed_event_id;
  task_priority;
  task_list;
  start_to_close_timeout;
  schedule_to_close_timeout;
  schedule_to_start_timeout;
  control;
  input;
  activity_id;
  activity_type;
   }

let make_activity_task_started_event_attributes 
  ?(identity : string option) ~(scheduled_event_id : int) ()
: activity_task_started_event_attributes = { scheduled_event_id; identity; 
}

let make_activity_task_completed_event_attributes 
  ?(result : string option)
  ~(started_event_id : int)
  ~(scheduled_event_id : int)
  () : activity_task_completed_event_attributes = {
  started_event_id; scheduled_event_id; result; 
}

let make_activity_task_failed_event_attributes 
  ?(details : string option)
  ?(reason : string option)
  ~(started_event_id : int)
  ~(scheduled_event_id : int)
  () : activity_task_failed_event_attributes = {
  started_event_id; scheduled_event_id; details; reason; 
}

let make_activity_task_timed_out_event_attributes 
  ?(details : string option)
  ~(started_event_id : int)
  ~(scheduled_event_id : int)
  ~(timeout_type : activity_task_timeout_type)
  () : activity_task_timed_out_event_attributes = {
  details; started_event_id; scheduled_event_id; timeout_type; 
}

let make_activity_task_canceled_event_attributes 
  ?(latest_cancel_requested_event_id : int option)
  ?(details : string option)
  ~(started_event_id : int)
  ~(scheduled_event_id : int)
  () : activity_task_canceled_event_attributes = {
  latest_cancel_requested_event_id;
  started_event_id;
  scheduled_event_id;
  details;
   }

let make_activity_task_cancel_requested_event_attributes 
  ~(activity_id : string) ~(decision_task_completed_event_id : int) ()
: activity_task_cancel_requested_event_attributes = {
  activity_id; decision_task_completed_event_id; 
}

let make_marker_recorded_event_attributes 
  ?(details : string option)
  ~(decision_task_completed_event_id : int)
  ~(marker_name : string)
  () : marker_recorded_event_attributes = {
  decision_task_completed_event_id; details; marker_name; 
}

let make_record_marker_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : record_marker_failed_cause)
  ~(marker_name : string)
  () : record_marker_failed_event_attributes = {
  decision_task_completed_event_id; cause; marker_name; 
}

let make_child_workflow_execution_started_event_attributes 
  ~(initiated_event_id : int)
  ~(workflow_type : workflow_type)
  ~(workflow_execution : workflow_execution)
  () : child_workflow_execution_started_event_attributes = {
  initiated_event_id; workflow_type; workflow_execution; 
}

let make_child_workflow_execution_completed_event_attributes 
  ?(result : string option)
  ~(started_event_id : int)
  ~(initiated_event_id : int)
  ~(workflow_type : workflow_type)
  ~(workflow_execution : workflow_execution)
  () : child_workflow_execution_completed_event_attributes = {
  started_event_id;
  initiated_event_id;
  result;
  workflow_type;
  workflow_execution;
   }

let make_child_workflow_execution_failed_event_attributes 
  ?(details : string option)
  ?(reason : string option)
  ~(started_event_id : int)
  ~(initiated_event_id : int)
  ~(workflow_type : workflow_type)
  ~(workflow_execution : workflow_execution)
  () : child_workflow_execution_failed_event_attributes = {
  started_event_id;
  initiated_event_id;
  details;
  reason;
  workflow_type;
  workflow_execution;
   }

let make_child_workflow_execution_timed_out_event_attributes 
  ~(started_event_id : int)
  ~(initiated_event_id : int)
  ~(timeout_type : workflow_execution_timeout_type)
  ~(workflow_type : workflow_type)
  ~(workflow_execution : workflow_execution)
  () : child_workflow_execution_timed_out_event_attributes = {
  started_event_id;
  initiated_event_id;
  timeout_type;
  workflow_type;
  workflow_execution;
   }

let make_child_workflow_execution_canceled_event_attributes 
  ?(details : string option)
  ~(started_event_id : int)
  ~(initiated_event_id : int)
  ~(workflow_type : workflow_type)
  ~(workflow_execution : workflow_execution)
  () : child_workflow_execution_canceled_event_attributes = {
  started_event_id;
  initiated_event_id;
  details;
  workflow_type;
  workflow_execution;
   }

let make_child_workflow_execution_terminated_event_attributes 
  ~(started_event_id : int)
  ~(initiated_event_id : int)
  ~(workflow_type : workflow_type)
  ~(workflow_execution : workflow_execution)
  () : child_workflow_execution_terminated_event_attributes = {
  started_event_id; initiated_event_id; workflow_type; workflow_execution; 
}

let make_signal_external_workflow_execution_initiated_event_attributes 
  ?(control : string option)
  ?(input : string option)
  ?(run_id : string option)
  ~(decision_task_completed_event_id : int)
  ~(signal_name : string)
  ~(workflow_id : string)
  () : signal_external_workflow_execution_initiated_event_attributes = {
  control;
  decision_task_completed_event_id;
  input;
  signal_name;
  run_id;
  workflow_id;
   }

let make_external_workflow_execution_signaled_event_attributes 
  ~(initiated_event_id : int) ~(workflow_execution : workflow_execution) ()
: external_workflow_execution_signaled_event_attributes = {
  initiated_event_id; workflow_execution; 
}

let make_signal_external_workflow_execution_failed_event_attributes 
  ?(control : string option)
  ?(run_id : string option)
  ~(decision_task_completed_event_id : int)
  ~(initiated_event_id : int)
  ~(cause : signal_external_workflow_execution_failed_cause)
  ~(workflow_id : string)
  () : signal_external_workflow_execution_failed_event_attributes = {
  control;
  decision_task_completed_event_id;
  initiated_event_id;
  cause;
  run_id;
  workflow_id;
   }

let make_external_workflow_execution_cancel_requested_event_attributes 
  ~(initiated_event_id : int) ~(workflow_execution : workflow_execution) ()
: external_workflow_execution_cancel_requested_event_attributes = {
  initiated_event_id; workflow_execution; 
}

let make_request_cancel_external_workflow_execution_initiated_event_attributes 
  ?(control : string option)
  ?(run_id : string option)
  ~(decision_task_completed_event_id : int)
  ~(workflow_id : string)
  () : request_cancel_external_workflow_execution_initiated_event_attributes
= { control; decision_task_completed_event_id; run_id; workflow_id; 
}

let make_request_cancel_external_workflow_execution_failed_event_attributes 
  ?(control : string option)
  ?(run_id : string option)
  ~(decision_task_completed_event_id : int)
  ~(initiated_event_id : int)
  ~(cause : request_cancel_external_workflow_execution_failed_cause)
  ~(workflow_id : string)
  () : request_cancel_external_workflow_execution_failed_event_attributes = {
  control;
  decision_task_completed_event_id;
  initiated_event_id;
  cause;
  run_id;
  workflow_id;
   }

let make_schedule_activity_task_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : schedule_activity_task_failed_cause)
  ~(activity_id : string)
  ~(activity_type : activity_type)
  () : schedule_activity_task_failed_event_attributes = {
  decision_task_completed_event_id; cause; activity_id; activity_type; 
}

let make_request_cancel_activity_task_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : request_cancel_activity_task_failed_cause)
  ~(activity_id : string)
  () : request_cancel_activity_task_failed_event_attributes = {
  decision_task_completed_event_id; cause; activity_id; 
}

let make_cancel_timer_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : cancel_timer_failed_cause)
  ~(timer_id : string)
  () : cancel_timer_failed_event_attributes = {
  decision_task_completed_event_id; cause; timer_id; 
}

let make_lambda_function_scheduled_event_attributes 
  ?(start_to_close_timeout : string option)
  ?(input : string option)
  ?(control : string option)
  ~(decision_task_completed_event_id : int)
  ~(name : string)
  ~(id : string)
  () : lambda_function_scheduled_event_attributes = {
  decision_task_completed_event_id;
  start_to_close_timeout;
  input;
  control;
  name;
  id;
   }

let make_lambda_function_started_event_attributes 
  ~(scheduled_event_id : int) () : lambda_function_started_event_attributes =
{ scheduled_event_id;  }

let make_lambda_function_completed_event_attributes 
  ?(result : string option)
  ~(started_event_id : int)
  ~(scheduled_event_id : int)
  () : lambda_function_completed_event_attributes = {
  result; started_event_id; scheduled_event_id; 
}

let make_lambda_function_failed_event_attributes 
  ?(details : string option)
  ?(reason : string option)
  ~(started_event_id : int)
  ~(scheduled_event_id : int)
  () : lambda_function_failed_event_attributes = {
  details; reason; started_event_id; scheduled_event_id; 
}

let make_lambda_function_timed_out_event_attributes 
  ?(timeout_type : lambda_function_timeout_type option)
  ~(started_event_id : int)
  ~(scheduled_event_id : int)
  () : lambda_function_timed_out_event_attributes = {
  timeout_type; started_event_id; scheduled_event_id; 
}

let make_schedule_lambda_function_failed_event_attributes 
  ~(decision_task_completed_event_id : int)
  ~(cause : schedule_lambda_function_failed_cause)
  ~(name : string)
  ~(id : string)
  () : schedule_lambda_function_failed_event_attributes = {
  decision_task_completed_event_id; cause; name; id; 
}

let make_history_event 
  ?(start_lambda_function_failed_event_attributes : start_lambda_function_failed_event_attributes option)
  ?(schedule_lambda_function_failed_event_attributes : schedule_lambda_function_failed_event_attributes option)
  ?(lambda_function_timed_out_event_attributes : lambda_function_timed_out_event_attributes option)
  ?(lambda_function_failed_event_attributes : lambda_function_failed_event_attributes option)
  ?(lambda_function_completed_event_attributes : lambda_function_completed_event_attributes option)
  ?(lambda_function_started_event_attributes : lambda_function_started_event_attributes option)
  ?(lambda_function_scheduled_event_attributes : lambda_function_scheduled_event_attributes option)
  ?(start_child_workflow_execution_failed_event_attributes : start_child_workflow_execution_failed_event_attributes option)
  ?(cancel_timer_failed_event_attributes : cancel_timer_failed_event_attributes option)
  ?(start_timer_failed_event_attributes : start_timer_failed_event_attributes option)
  ?(request_cancel_activity_task_failed_event_attributes : request_cancel_activity_task_failed_event_attributes option)
  ?(schedule_activity_task_failed_event_attributes : schedule_activity_task_failed_event_attributes option)
  ?(request_cancel_external_workflow_execution_failed_event_attributes : request_cancel_external_workflow_execution_failed_event_attributes option)
  ?(request_cancel_external_workflow_execution_initiated_event_attributes : request_cancel_external_workflow_execution_initiated_event_attributes option)
  ?(external_workflow_execution_cancel_requested_event_attributes : external_workflow_execution_cancel_requested_event_attributes option)
  ?(signal_external_workflow_execution_failed_event_attributes : signal_external_workflow_execution_failed_event_attributes option)
  ?(external_workflow_execution_signaled_event_attributes : external_workflow_execution_signaled_event_attributes option)
  ?(signal_external_workflow_execution_initiated_event_attributes : signal_external_workflow_execution_initiated_event_attributes option)
  ?(child_workflow_execution_terminated_event_attributes : child_workflow_execution_terminated_event_attributes option)
  ?(child_workflow_execution_canceled_event_attributes : child_workflow_execution_canceled_event_attributes option)
  ?(child_workflow_execution_timed_out_event_attributes : child_workflow_execution_timed_out_event_attributes option)
  ?(child_workflow_execution_failed_event_attributes : child_workflow_execution_failed_event_attributes option)
  ?(child_workflow_execution_completed_event_attributes : child_workflow_execution_completed_event_attributes option)
  ?(child_workflow_execution_started_event_attributes : child_workflow_execution_started_event_attributes option)
  ?(start_child_workflow_execution_initiated_event_attributes : start_child_workflow_execution_initiated_event_attributes option)
  ?(timer_canceled_event_attributes : timer_canceled_event_attributes option)
  ?(timer_fired_event_attributes : timer_fired_event_attributes option)
  ?(timer_started_event_attributes : timer_started_event_attributes option)
  ?(record_marker_failed_event_attributes : record_marker_failed_event_attributes option)
  ?(marker_recorded_event_attributes : marker_recorded_event_attributes option)
  ?(workflow_execution_signaled_event_attributes : workflow_execution_signaled_event_attributes option)
  ?(activity_task_cancel_requested_event_attributes : activity_task_cancel_requested_event_attributes option)
  ?(activity_task_canceled_event_attributes : activity_task_canceled_event_attributes option)
  ?(activity_task_timed_out_event_attributes : activity_task_timed_out_event_attributes option)
  ?(activity_task_failed_event_attributes : activity_task_failed_event_attributes option)
  ?(activity_task_completed_event_attributes : activity_task_completed_event_attributes option)
  ?(activity_task_started_event_attributes : activity_task_started_event_attributes option)
  ?(activity_task_scheduled_event_attributes : activity_task_scheduled_event_attributes option)
  ?(decision_task_timed_out_event_attributes : decision_task_timed_out_event_attributes option)
  ?(decision_task_completed_event_attributes : decision_task_completed_event_attributes option)
  ?(decision_task_started_event_attributes : decision_task_started_event_attributes option)
  ?(decision_task_scheduled_event_attributes : decision_task_scheduled_event_attributes option)
  ?(workflow_execution_cancel_requested_event_attributes : workflow_execution_cancel_requested_event_attributes option)
  ?(workflow_execution_terminated_event_attributes : workflow_execution_terminated_event_attributes option)
  ?(continue_as_new_workflow_execution_failed_event_attributes : continue_as_new_workflow_execution_failed_event_attributes option)
  ?(workflow_execution_continued_as_new_event_attributes : workflow_execution_continued_as_new_event_attributes option)
  ?(cancel_workflow_execution_failed_event_attributes : cancel_workflow_execution_failed_event_attributes option)
  ?(workflow_execution_canceled_event_attributes : workflow_execution_canceled_event_attributes option)
  ?(workflow_execution_timed_out_event_attributes : workflow_execution_timed_out_event_attributes option)
  ?(fail_workflow_execution_failed_event_attributes : fail_workflow_execution_failed_event_attributes option)
  ?(workflow_execution_failed_event_attributes : workflow_execution_failed_event_attributes option)
  ?(complete_workflow_execution_failed_event_attributes : complete_workflow_execution_failed_event_attributes option)
  ?(workflow_execution_completed_event_attributes : workflow_execution_completed_event_attributes option)
  ?(workflow_execution_started_event_attributes : workflow_execution_started_event_attributes option)
  ~(event_id : int)
  ~(event_type : event_type)
  ~(event_timestamp : float)
  () : history_event = {
  start_lambda_function_failed_event_attributes;
  schedule_lambda_function_failed_event_attributes;
  lambda_function_timed_out_event_attributes;
  lambda_function_failed_event_attributes;
  lambda_function_completed_event_attributes;
  lambda_function_started_event_attributes;
  lambda_function_scheduled_event_attributes;
  start_child_workflow_execution_failed_event_attributes;
  cancel_timer_failed_event_attributes;
  start_timer_failed_event_attributes;
  request_cancel_activity_task_failed_event_attributes;
  schedule_activity_task_failed_event_attributes;
  request_cancel_external_workflow_execution_failed_event_attributes;
  request_cancel_external_workflow_execution_initiated_event_attributes;
  external_workflow_execution_cancel_requested_event_attributes;
  signal_external_workflow_execution_failed_event_attributes;
  external_workflow_execution_signaled_event_attributes;
  signal_external_workflow_execution_initiated_event_attributes;
  child_workflow_execution_terminated_event_attributes;
  child_workflow_execution_canceled_event_attributes;
  child_workflow_execution_timed_out_event_attributes;
  child_workflow_execution_failed_event_attributes;
  child_workflow_execution_completed_event_attributes;
  child_workflow_execution_started_event_attributes;
  start_child_workflow_execution_initiated_event_attributes;
  timer_canceled_event_attributes;
  timer_fired_event_attributes;
  timer_started_event_attributes;
  record_marker_failed_event_attributes;
  marker_recorded_event_attributes;
  workflow_execution_signaled_event_attributes;
  activity_task_cancel_requested_event_attributes;
  activity_task_canceled_event_attributes;
  activity_task_timed_out_event_attributes;
  activity_task_failed_event_attributes;
  activity_task_completed_event_attributes;
  activity_task_started_event_attributes;
  activity_task_scheduled_event_attributes;
  decision_task_timed_out_event_attributes;
  decision_task_completed_event_attributes;
  decision_task_started_event_attributes;
  decision_task_scheduled_event_attributes;
  workflow_execution_cancel_requested_event_attributes;
  workflow_execution_terminated_event_attributes;
  continue_as_new_workflow_execution_failed_event_attributes;
  workflow_execution_continued_as_new_event_attributes;
  cancel_workflow_execution_failed_event_attributes;
  workflow_execution_canceled_event_attributes;
  workflow_execution_timed_out_event_attributes;
  fail_workflow_execution_failed_event_attributes;
  workflow_execution_failed_event_attributes;
  complete_workflow_execution_failed_event_attributes;
  workflow_execution_completed_event_attributes;
  workflow_execution_started_event_attributes;
  event_id;
  event_type;
  event_timestamp;
   }

let make_decision_task 
  ?(previous_started_event_id : int option)
  ?(next_page_token : string option)
  ~(events : history_event list)
  ~(workflow_type : workflow_type)
  ~(workflow_execution : workflow_execution)
  ~(started_event_id : int)
  ~(task_token : string)
  () : decision_task = {
  previous_started_event_id;
  next_page_token;
  events;
  workflow_type;
  workflow_execution;
  started_event_id;
  task_token;
   }

let make_poll_for_decision_task_input 
  ?(start_at_previous_started_event : bool option)
  ?(reverse_order : bool option)
  ?(maximum_page_size : int option)
  ?(next_page_token : string option)
  ?(identity : string option)
  ~(task_list : task_list)
  ~(domain : string)
  () : poll_for_decision_task_input = {
  start_at_previous_started_event;
  reverse_order;
  maximum_page_size;
  next_page_token;
  identity;
  task_list;
  domain;
   }

let make_activity_task 
  ?(input : string option)
  ~(activity_type : activity_type)
  ~(workflow_execution : workflow_execution)
  ~(started_event_id : int)
  ~(activity_id : string)
  ~(task_token : string)
  () : activity_task = {
  input;
  activity_type;
  workflow_execution;
  started_event_id;
  activity_id;
  task_token;
   }

let make_poll_for_activity_task_input 
  ?(identity : string option) ~(task_list : task_list) ~(domain : string) ()
: poll_for_activity_task_input = { identity; task_list; domain; 
}

let make_list_workflow_types_input 
  ?(reverse_order : bool option)
  ?(maximum_page_size : int option)
  ?(next_page_token : string option)
  ?(name : string option)
  ~(registration_status : registration_status)
  ~(domain : string)
  () : list_workflow_types_input = {
  reverse_order;
  maximum_page_size;
  next_page_token;
  registration_status;
  name;
  domain;
   }

let make_list_tags_for_resource_output  ?(tags : resource_tag list option) ()
: list_tags_for_resource_output = { tags; 
}

let make_list_tags_for_resource_input  ~(resource_arn : string) ()
: list_tags_for_resource_input = { resource_arn; 
}

let make_execution_time_filter 
  ?(latest_date : float option) ~(oldest_date : float) ()
: execution_time_filter = { latest_date; oldest_date; 
}

let make_list_open_workflow_executions_input 
  ?(execution_filter : workflow_execution_filter option)
  ?(reverse_order : bool option)
  ?(maximum_page_size : int option)
  ?(next_page_token : string option)
  ?(tag_filter : tag_filter option)
  ?(type_filter : workflow_type_filter option)
  ~(start_time_filter : execution_time_filter)
  ~(domain : string)
  () : list_open_workflow_executions_input = {
  execution_filter;
  reverse_order;
  maximum_page_size;
  next_page_token;
  tag_filter;
  type_filter;
  start_time_filter;
  domain;
   }

let make_domain_info 
  ?(arn : string option)
  ?(description : string option)
  ~(status : registration_status)
  ~(name : string)
  () : domain_info = { arn; description; status; name; 
}

let make_domain_infos 
  ?(next_page_token : string option) ~(domain_infos : domain_info list) ()
: domain_infos = { next_page_token; domain_infos; 
}

let make_list_domains_input 
  ?(reverse_order : bool option)
  ?(maximum_page_size : int option)
  ?(next_page_token : string option)
  ~(registration_status : registration_status)
  () : list_domains_input = {
  reverse_order; maximum_page_size; registration_status; next_page_token; 
}

let make_close_status_filter  ~(status : close_status) ()
: close_status_filter = { status; 
}

let make_list_closed_workflow_executions_input 
  ?(reverse_order : bool option)
  ?(maximum_page_size : int option)
  ?(next_page_token : string option)
  ?(tag_filter : tag_filter option)
  ?(type_filter : workflow_type_filter option)
  ?(close_status_filter : close_status_filter option)
  ?(execution_filter : workflow_execution_filter option)
  ?(close_time_filter : execution_time_filter option)
  ?(start_time_filter : execution_time_filter option)
  ~(domain : string)
  () : list_closed_workflow_executions_input = {
  reverse_order;
  maximum_page_size;
  next_page_token;
  tag_filter;
  type_filter;
  close_status_filter;
  execution_filter;
  close_time_filter;
  start_time_filter;
  domain;
   }

let make_activity_type_info 
  ?(deprecation_date : float option)
  ?(description : string option)
  ~(creation_date : float)
  ~(status : registration_status)
  ~(activity_type : activity_type)
  () : activity_type_info = {
  deprecation_date; creation_date; description; status; activity_type; 
}

let make_activity_type_infos 
  ?(next_page_token : string option)
  ~(type_infos : activity_type_info list)
  () : activity_type_infos = { next_page_token; type_infos; 
}

let make_list_activity_types_input 
  ?(reverse_order : bool option)
  ?(maximum_page_size : int option)
  ?(next_page_token : string option)
  ?(name : string option)
  ~(registration_status : registration_status)
  ~(domain : string)
  () : list_activity_types_input = {
  reverse_order;
  maximum_page_size;
  next_page_token;
  registration_status;
  name;
  domain;
   }

let make_history 
  ?(next_page_token : string option) ~(events : history_event list) ()
: history = { next_page_token; events; 
}

let make_get_workflow_execution_history_input 
  ?(reverse_order : bool option)
  ?(maximum_page_size : int option)
  ?(next_page_token : string option)
  ~(execution : workflow_execution)
  ~(domain : string)
  () : get_workflow_execution_history_input = {
  reverse_order; maximum_page_size; next_page_token; execution; domain; 
}

let make_describe_workflow_type_input 
  ~(workflow_type : workflow_type) ~(domain : string) ()
: describe_workflow_type_input = { workflow_type; domain; 
}

let make_describe_workflow_execution_input 
  ~(execution : workflow_execution) ~(domain : string) ()
: describe_workflow_execution_input = { execution; domain; 
}

let make_domain_configuration 
  ~(workflow_execution_retention_period_in_days : string) ()
: domain_configuration = { workflow_execution_retention_period_in_days; 
}

let make_domain_detail 
  ~(configuration : domain_configuration) ~(domain_info : domain_info) ()
: domain_detail = { configuration; domain_info; 
}

let make_describe_domain_input  ~(name : string) () : describe_domain_input =
{ name;  }

let make_activity_type_configuration 
  ?(default_task_schedule_to_close_timeout : string option)
  ?(default_task_schedule_to_start_timeout : string option)
  ?(default_task_priority : string option)
  ?(default_task_list : task_list option)
  ?(default_task_heartbeat_timeout : string option)
  ?(default_task_start_to_close_timeout : string option)
  () : activity_type_configuration = {
  default_task_schedule_to_close_timeout;
  default_task_schedule_to_start_timeout;
  default_task_priority;
  default_task_list;
  default_task_heartbeat_timeout;
  default_task_start_to_close_timeout;
   }

let make_activity_type_detail 
  ~(configuration : activity_type_configuration)
  ~(type_info : activity_type_info)
  () : activity_type_detail = { configuration; type_info; 
}

let make_describe_activity_type_input 
  ~(activity_type : activity_type) ~(domain : string) ()
: describe_activity_type_input = { activity_type; domain; 
}

let make_deprecate_workflow_type_input 
  ~(workflow_type : workflow_type) ~(domain : string) ()
: deprecate_workflow_type_input = { workflow_type; domain; 
}

let make_deprecate_domain_input  ~(name : string) () : deprecate_domain_input
= { name;  }

let make_deprecate_activity_type_input 
  ~(activity_type : activity_type) ~(domain : string) ()
: deprecate_activity_type_input = { activity_type; domain; 
}

let make_delete_workflow_type_input 
  ~(workflow_type : workflow_type) ~(domain : string) ()
: delete_workflow_type_input = { workflow_type; domain; 
}

let make_delete_activity_type_input 
  ~(activity_type : activity_type) ~(domain : string) ()
: delete_activity_type_input = { activity_type; domain; 
}

let make_pending_task_count  ?(truncated : bool option) ~(count : int) ()
: pending_task_count = { truncated; count; 
}

let make_count_pending_decision_tasks_input 
  ~(task_list : task_list) ~(domain : string) ()
: count_pending_decision_tasks_input = { task_list; domain; 
}

let make_count_pending_activity_tasks_input 
  ~(task_list : task_list) ~(domain : string) ()
: count_pending_activity_tasks_input = { task_list; domain; 
}

let make_count_open_workflow_executions_input 
  ?(execution_filter : workflow_execution_filter option)
  ?(tag_filter : tag_filter option)
  ?(type_filter : workflow_type_filter option)
  ~(start_time_filter : execution_time_filter)
  ~(domain : string)
  () : count_open_workflow_executions_input = {
  execution_filter; tag_filter; type_filter; start_time_filter; domain; 
}

let make_count_closed_workflow_executions_input 
  ?(close_status_filter : close_status_filter option)
  ?(tag_filter : tag_filter option)
  ?(type_filter : workflow_type_filter option)
  ?(execution_filter : workflow_execution_filter option)
  ?(close_time_filter : execution_time_filter option)
  ?(start_time_filter : execution_time_filter option)
  ~(domain : string)
  () : count_closed_workflow_executions_input = {
  close_status_filter;
  tag_filter;
  type_filter;
  execution_filter;
  close_time_filter;
  start_time_filter;
  domain;
  
}

