[@@@warning "-39"]
open Types
let make_vmware_to_aws_tag_mapping 
  ~(aws_tag_value : string)
  ~(aws_tag_key : string)
  ~(vmware_tag_name : string)
  ~(vmware_category : string)
  () : vmware_to_aws_tag_mapping = {
  aws_tag_value; aws_tag_key; vmware_tag_name; vmware_category; 
}

let make_vmware_tag 
  ?(vmware_tag_description : string option)
  ?(vmware_tag_name : string option)
  ?(vmware_category : string option)
  () : vmware_tag = {
  vmware_tag_description; vmware_tag_name; vmware_category; 
}

let make_virtual_machine 
  ?(last_backup_date : float option)
  ?(resource_arn : string option)
  ?(path : string option)
  ?(name : string option)
  ?(hypervisor_id : string option)
  ?(host_name : string option)
  () : virtual_machine = {
  last_backup_date; resource_arn; path; name; hypervisor_id; host_name; 
}

let make_virtual_machine_details 
  ?(vmware_tags : vmware_tag list option)
  ?(last_backup_date : float option)
  ?(resource_arn : string option)
  ?(path : string option)
  ?(name : string option)
  ?(hypervisor_id : string option)
  ?(host_name : string option)
  () : virtual_machine_details = {
  vmware_tags;
  last_backup_date;
  resource_arn;
  path;
  name;
  hypervisor_id;
  host_name;
   }

let make_update_hypervisor_output  ?(hypervisor_arn : string option) ()
: update_hypervisor_output = { hypervisor_arn; 
}

let make_update_hypervisor_input 
  ?(log_group_arn : string option)
  ?(name : string option)
  ?(password : string option)
  ?(username : string option)
  ?(host : string option)
  ~(hypervisor_arn : string)
  () : update_hypervisor_input = {
  log_group_arn; name; password; username; host; hypervisor_arn; 
}

let make_update_gateway_software_now_output 
  ?(gateway_arn : string option) () : update_gateway_software_now_output = {
  gateway_arn;  }

let make_update_gateway_software_now_input  ~(gateway_arn : string) ()
: update_gateway_software_now_input = { gateway_arn; 
}

let make_update_gateway_information_output  ?(gateway_arn : string option) ()
: update_gateway_information_output = { gateway_arn; 
}

let make_update_gateway_information_input 
  ?(gateway_display_name : string option) ~(gateway_arn : string) ()
: update_gateway_information_input = { gateway_display_name; gateway_arn; 
}

let make_untag_resource_output  ?(resource_ar_n : string option) ()
: untag_resource_output = { resource_ar_n;  }

let make_untag_resource_input 
  ~(tag_keys : string list) ~(resource_ar_n : string) ()
: untag_resource_input = { tag_keys; resource_ar_n; 
}

let make_test_hypervisor_configuration_output  ()
: test_hypervisor_configuration_output =
()

let make_test_hypervisor_configuration_input 
  ?(password : string option)
  ?(username : string option)
  ~(host : string)
  ~(gateway_arn : string)
  () : test_hypervisor_configuration_input = {
  password; username; host; gateway_arn;  }

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_output  ?(resource_ar_n : string option) ()
: tag_resource_output = { resource_ar_n;  }

let make_tag_resource_input  ~(tags : tag list) ~(resource_ar_n : string) ()
: tag_resource_input = { tags; resource_ar_n; 
}

let make_start_virtual_machines_metadata_sync_output 
  ?(hypervisor_arn : string option) ()
: start_virtual_machines_metadata_sync_output = { hypervisor_arn; 
}

let make_start_virtual_machines_metadata_sync_input 
  ~(hypervisor_arn : string) () : start_virtual_machines_metadata_sync_input
= { hypervisor_arn;  }

let make_put_maintenance_start_time_output  ?(gateway_arn : string option) ()
: put_maintenance_start_time_output = { gateway_arn; 
}

let make_put_maintenance_start_time_input 
  ?(day_of_month : int option)
  ?(day_of_week : int option)
  ~(minute_of_hour : int)
  ~(hour_of_day : int)
  ~(gateway_arn : string)
  () : put_maintenance_start_time_input = {
  day_of_month; day_of_week; minute_of_hour; hour_of_day; gateway_arn; 
}

let make_put_hypervisor_property_mappings_output 
  ?(hypervisor_arn : string option) ()
: put_hypervisor_property_mappings_output = { hypervisor_arn; 
}

let make_put_hypervisor_property_mappings_input 
  ~(iam_role_arn : string)
  ~(vmware_to_aws_tag_mappings : vmware_to_aws_tag_mapping list)
  ~(hypervisor_arn : string)
  () : put_hypervisor_property_mappings_input = {
  iam_role_arn; vmware_to_aws_tag_mappings; hypervisor_arn; 
}

let make_put_bandwidth_rate_limit_schedule_output 
  ?(gateway_arn : string option) ()
: put_bandwidth_rate_limit_schedule_output = { gateway_arn; 
}

let make_bandwidth_rate_limit_interval 
  ?(average_upload_rate_limit_in_bits_per_sec : int option)
  ~(days_of_week : int list)
  ~(end_minute_of_hour : int)
  ~(start_minute_of_hour : int)
  ~(end_hour_of_day : int)
  ~(start_hour_of_day : int)
  () : bandwidth_rate_limit_interval = {
  days_of_week;
  end_minute_of_hour;
  start_minute_of_hour;
  end_hour_of_day;
  start_hour_of_day;
  average_upload_rate_limit_in_bits_per_sec;
   }

let make_put_bandwidth_rate_limit_schedule_input 
  ~(bandwidth_rate_limit_intervals : bandwidth_rate_limit_interval list)
  ~(gateway_arn : string)
  () : put_bandwidth_rate_limit_schedule_input = {
  bandwidth_rate_limit_intervals; gateway_arn; 
}

let make_maintenance_start_time 
  ?(day_of_week : int option)
  ?(day_of_month : int option)
  ~(minute_of_hour : int)
  ~(hour_of_day : int)
  () : maintenance_start_time = {
  minute_of_hour; hour_of_day; day_of_week; day_of_month; 
}

let make_list_virtual_machines_output 
  ?(next_token : string option)
  ?(virtual_machines : virtual_machine list option)
  () : list_virtual_machines_output = { next_token; virtual_machines; 
}

let make_list_virtual_machines_input 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(hypervisor_arn : string option)
  () : list_virtual_machines_input = {
  next_token; max_results; hypervisor_arn; 
}

let make_list_tags_for_resource_output 
  ?(tags : tag list option) ?(resource_arn : string option) ()
: list_tags_for_resource_output = { tags; resource_arn; 
}

let make_list_tags_for_resource_input  ~(resource_arn : string) ()
: list_tags_for_resource_input = { resource_arn;  }

let make_hypervisor 
  ?(state : hypervisor_state option)
  ?(name : string option)
  ?(kms_key_arn : string option)
  ?(hypervisor_arn : string option)
  ?(host : string option)
  () : hypervisor = { state; name; kms_key_arn; hypervisor_arn; host; 
}

let make_list_hypervisors_output 
  ?(next_token : string option) ?(hypervisors : hypervisor list option) ()
: list_hypervisors_output = { next_token; hypervisors; 
}

let make_list_hypervisors_input 
  ?(next_token : string option) ?(max_results : int option) ()
: list_hypervisors_input = { next_token; max_results;  }

let make_gateway 
  ?(last_seen_time : float option)
  ?(hypervisor_id : string option)
  ?(gateway_type : gateway_type option)
  ?(gateway_display_name : string option)
  ?(gateway_arn : string option)
  () : gateway = {
  last_seen_time;
  hypervisor_id;
  gateway_type;
  gateway_display_name;
  gateway_arn;
   }

let make_list_gateways_output 
  ?(next_token : string option) ?(gateways : gateway list option) ()
: list_gateways_output = { next_token; gateways; 
}

let make_list_gateways_input 
  ?(next_token : string option) ?(max_results : int option) ()
: list_gateways_input = { next_token; max_results; 
}

let make_import_hypervisor_configuration_output 
  ?(hypervisor_arn : string option) ()
: import_hypervisor_configuration_output = { hypervisor_arn; 
}

let make_import_hypervisor_configuration_input 
  ?(tags : tag list option)
  ?(kms_key_arn : string option)
  ?(password : string option)
  ?(username : string option)
  ~(host : string)
  ~(name : string)
  () : import_hypervisor_configuration_input = {
  tags; kms_key_arn; password; username; host; name; 
}

let make_hypervisor_details 
  ?(latest_metadata_sync_status : sync_metadata_status option)
  ?(latest_metadata_sync_status_message : string option)
  ?(last_successful_metadata_sync_time : float option)
  ?(state : hypervisor_state option)
  ?(log_group_arn : string option)
  ?(name : string option)
  ?(kms_key_arn : string option)
  ?(hypervisor_arn : string option)
  ?(host : string option)
  () : hypervisor_details = {
  latest_metadata_sync_status;
  latest_metadata_sync_status_message;
  last_successful_metadata_sync_time;
  state;
  log_group_arn;
  name;
  kms_key_arn;
  hypervisor_arn;
  host;
   }

let make_get_virtual_machine_output 
  ?(virtual_machine : virtual_machine_details option) ()
: get_virtual_machine_output = { virtual_machine; 
}

let make_get_virtual_machine_input  ~(resource_arn : string) ()
: get_virtual_machine_input = { resource_arn; 
}

let make_get_hypervisor_property_mappings_output 
  ?(iam_role_arn : string option)
  ?(vmware_to_aws_tag_mappings : vmware_to_aws_tag_mapping list option)
  ?(hypervisor_arn : string option)
  () : get_hypervisor_property_mappings_output = {
  iam_role_arn; vmware_to_aws_tag_mappings; hypervisor_arn; 
}

let make_get_hypervisor_property_mappings_input 
  ~(hypervisor_arn : string) () : get_hypervisor_property_mappings_input = {
  hypervisor_arn;  }

let make_get_hypervisor_output  ?(hypervisor : hypervisor_details option) ()
: get_hypervisor_output = { hypervisor;  }

let make_get_hypervisor_input  ~(hypervisor_arn : string) ()
: get_hypervisor_input = { hypervisor_arn;  }

let make_gateway_details 
  ?(vpc_endpoint : string option)
  ?(next_update_availability_time : float option)
  ?(maintenance_start_time : maintenance_start_time option)
  ?(last_seen_time : float option)
  ?(hypervisor_id : string option)
  ?(gateway_type : gateway_type option)
  ?(gateway_display_name : string option)
  ?(gateway_arn : string option)
  () : gateway_details = {
  vpc_endpoint;
  next_update_availability_time;
  maintenance_start_time;
  last_seen_time;
  hypervisor_id;
  gateway_type;
  gateway_display_name;
  gateway_arn;
   }

let make_get_gateway_output  ?(gateway : gateway_details option) ()
: get_gateway_output = { gateway;  }

let make_get_gateway_input  ~(gateway_arn : string) () : get_gateway_input =
{ gateway_arn;  }

let make_get_bandwidth_rate_limit_schedule_output 
  ?(bandwidth_rate_limit_intervals : bandwidth_rate_limit_interval list option)
  ?(gateway_arn : string option)
  () : get_bandwidth_rate_limit_schedule_output = {
  bandwidth_rate_limit_intervals; gateway_arn; 
}

let make_get_bandwidth_rate_limit_schedule_input  ~(gateway_arn : string) ()
: get_bandwidth_rate_limit_schedule_input = { gateway_arn; 
}

let make_disassociate_gateway_from_server_output 
  ?(gateway_arn : string option) () : disassociate_gateway_from_server_output
= { gateway_arn;  }

let make_disassociate_gateway_from_server_input  ~(gateway_arn : string) ()
: disassociate_gateway_from_server_input = { gateway_arn; 
}

let make_delete_hypervisor_output  ?(hypervisor_arn : string option) ()
: delete_hypervisor_output = { hypervisor_arn; 
}

let make_delete_hypervisor_input  ~(hypervisor_arn : string) ()
: delete_hypervisor_input = { hypervisor_arn; 
}

let make_delete_gateway_output  ?(gateway_arn : string option) ()
: delete_gateway_output = { gateway_arn;  }

let make_delete_gateway_input  ~(gateway_arn : string) ()
: delete_gateway_input = { gateway_arn;  }

let make_create_gateway_output  ?(gateway_arn : string option) ()
: create_gateway_output = { gateway_arn;  }

let make_create_gateway_input 
  ?(tags : tag list option)
  ~(gateway_type : gateway_type)
  ~(gateway_display_name : string)
  ~(activation_key : string)
  () : create_gateway_input = {
  tags; gateway_type; gateway_display_name; activation_key; 
}

let make_associate_gateway_to_server_output 
  ?(gateway_arn : string option) () : associate_gateway_to_server_output = {
  gateway_arn;  }

let make_associate_gateway_to_server_input 
  ~(server_arn : string) ~(gateway_arn : string) ()
: associate_gateway_to_server_input = { server_arn; gateway_arn; 
}

