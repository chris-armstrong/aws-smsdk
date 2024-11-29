open Types
val make_vmware_to_aws_tag_mapping :
  aws_tag_value:string ->
  aws_tag_key:string ->
  vmware_tag_name:string ->
  vmware_category:string ->
  unit
-> vmware_to_aws_tag_mapping
(** Create a {!type-vmware_to_aws_tag_mapping} type *)

val make_vmware_tag :
  ?vmware_tag_description:string ->
  ?vmware_tag_name:string ->
  ?vmware_category:string ->
  unit
-> vmware_tag
(** Create a {!type-vmware_tag} type *)

val make_virtual_machine :
  ?last_backup_date:float ->
  ?resource_arn:string ->
  ?path:string ->
  ?name:string ->
  ?hypervisor_id:string ->
  ?host_name:string ->
  unit
-> virtual_machine
(** Create a {!type-virtual_machine} type *)

val make_virtual_machine_details :
  ?vmware_tags:vmware_tag list ->
  ?last_backup_date:float ->
  ?resource_arn:string ->
  ?path:string ->
  ?name:string ->
  ?hypervisor_id:string ->
  ?host_name:string ->
  unit
-> virtual_machine_details
(** Create a {!type-virtual_machine_details} type *)

val make_update_hypervisor_output : ?hypervisor_arn:string -> unit
-> update_hypervisor_output
(** Create a {!type-update_hypervisor_output} type *)

val make_update_hypervisor_input :
  ?log_group_arn:string ->
  ?name:string ->
  ?password:string ->
  ?username:string ->
  ?host:string ->
  hypervisor_arn:string ->
  unit
-> update_hypervisor_input
(** Create a {!type-update_hypervisor_input} type *)

val make_update_gateway_software_now_output : ?gateway_arn:string -> unit
-> update_gateway_software_now_output
(** Create a {!type-update_gateway_software_now_output} type *)

val make_update_gateway_software_now_input : gateway_arn:string -> unit
-> update_gateway_software_now_input
(** Create a {!type-update_gateway_software_now_input} type *)

val make_update_gateway_information_output : ?gateway_arn:string -> unit
-> update_gateway_information_output
(** Create a {!type-update_gateway_information_output} type *)

val make_update_gateway_information_input :
  ?gateway_display_name:string -> gateway_arn:string -> unit
-> update_gateway_information_input
(** Create a {!type-update_gateway_information_input} type *)

val make_untag_resource_output : ?resource_ar_n:string -> unit
-> untag_resource_output
(** Create a {!type-untag_resource_output} type *)

val make_untag_resource_input :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_input
(** Create a {!type-untag_resource_input} type *)

val make_test_hypervisor_configuration_output : unit
-> test_hypervisor_configuration_output
(** Create a {!type-test_hypervisor_configuration_output} type *)

val make_test_hypervisor_configuration_input :
  ?password:string ->
  ?username:string ->
  host:string ->
  gateway_arn:string ->
  unit
-> test_hypervisor_configuration_input
(** Create a {!type-test_hypervisor_configuration_input} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_output : ?resource_ar_n:string -> unit
-> tag_resource_output
(** Create a {!type-tag_resource_output} type *)

val make_tag_resource_input : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_input
(** Create a {!type-tag_resource_input} type *)

val make_start_virtual_machines_metadata_sync_output :
  ?hypervisor_arn:string -> unit
-> start_virtual_machines_metadata_sync_output
(** Create a {!type-start_virtual_machines_metadata_sync_output} type *)

val make_start_virtual_machines_metadata_sync_input :
  hypervisor_arn:string -> unit
-> start_virtual_machines_metadata_sync_input
(** Create a {!type-start_virtual_machines_metadata_sync_input} type *)

val make_put_maintenance_start_time_output : ?gateway_arn:string -> unit
-> put_maintenance_start_time_output
(** Create a {!type-put_maintenance_start_time_output} type *)

val make_put_maintenance_start_time_input :
  ?day_of_month:int ->
  ?day_of_week:int ->
  minute_of_hour:int ->
  hour_of_day:int ->
  gateway_arn:string ->
  unit
-> put_maintenance_start_time_input
(** Create a {!type-put_maintenance_start_time_input} type *)

val make_put_hypervisor_property_mappings_output :
  ?hypervisor_arn:string -> unit
-> put_hypervisor_property_mappings_output
(** Create a {!type-put_hypervisor_property_mappings_output} type *)

val make_put_hypervisor_property_mappings_input :
  iam_role_arn:string ->
  vmware_to_aws_tag_mappings:vmware_to_aws_tag_mapping list ->
  hypervisor_arn:string ->
  unit
-> put_hypervisor_property_mappings_input
(** Create a {!type-put_hypervisor_property_mappings_input} type *)

val make_put_bandwidth_rate_limit_schedule_output :
  ?gateway_arn:string -> unit
-> put_bandwidth_rate_limit_schedule_output
(** Create a {!type-put_bandwidth_rate_limit_schedule_output} type *)

val make_bandwidth_rate_limit_interval :
  ?average_upload_rate_limit_in_bits_per_sec:int ->
  days_of_week:int list ->
  end_minute_of_hour:int ->
  start_minute_of_hour:int ->
  end_hour_of_day:int ->
  start_hour_of_day:int ->
  unit
-> bandwidth_rate_limit_interval
(** Create a {!type-bandwidth_rate_limit_interval} type *)

val make_put_bandwidth_rate_limit_schedule_input :
  bandwidth_rate_limit_intervals:bandwidth_rate_limit_interval list ->
  gateway_arn:string ->
  unit
-> put_bandwidth_rate_limit_schedule_input
(** Create a {!type-put_bandwidth_rate_limit_schedule_input} type *)

val make_maintenance_start_time :
  ?day_of_week:int ->
  ?day_of_month:int ->
  minute_of_hour:int ->
  hour_of_day:int ->
  unit
-> maintenance_start_time
(** Create a {!type-maintenance_start_time} type *)

val make_list_virtual_machines_output :
  ?next_token:string -> ?virtual_machines:virtual_machine list -> unit
-> list_virtual_machines_output
(** Create a {!type-list_virtual_machines_output} type *)

val make_list_virtual_machines_input :
  ?next_token:string -> ?max_results:int -> ?hypervisor_arn:string -> unit
-> list_virtual_machines_input
(** Create a {!type-list_virtual_machines_input} type *)

val make_list_tags_for_resource_output :
  ?tags:tag list -> ?resource_arn:string -> unit
-> list_tags_for_resource_output
(** Create a {!type-list_tags_for_resource_output} type *)

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input
(** Create a {!type-list_tags_for_resource_input} type *)

val make_hypervisor :
  ?state:hypervisor_state ->
  ?name:string ->
  ?kms_key_arn:string ->
  ?hypervisor_arn:string ->
  ?host:string ->
  unit
-> hypervisor
(** Create a {!type-hypervisor} type *)

val make_list_hypervisors_output :
  ?next_token:string -> ?hypervisors:hypervisor list -> unit
-> list_hypervisors_output
(** Create a {!type-list_hypervisors_output} type *)

val make_list_hypervisors_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_hypervisors_input
(** Create a {!type-list_hypervisors_input} type *)

val make_gateway :
  ?last_seen_time:float ->
  ?hypervisor_id:string ->
  ?gateway_type:gateway_type ->
  ?gateway_display_name:string ->
  ?gateway_arn:string ->
  unit
-> gateway
(** Create a {!type-gateway} type *)

val make_list_gateways_output :
  ?next_token:string -> ?gateways:gateway list -> unit
-> list_gateways_output
(** Create a {!type-list_gateways_output} type *)

val make_list_gateways_input : ?next_token:string -> ?max_results:int -> unit
-> list_gateways_input
(** Create a {!type-list_gateways_input} type *)

val make_import_hypervisor_configuration_output :
  ?hypervisor_arn:string -> unit
-> import_hypervisor_configuration_output
(** Create a {!type-import_hypervisor_configuration_output} type *)

val make_import_hypervisor_configuration_input :
  ?tags:tag list ->
  ?kms_key_arn:string ->
  ?password:string ->
  ?username:string ->
  host:string ->
  name:string ->
  unit
-> import_hypervisor_configuration_input
(** Create a {!type-import_hypervisor_configuration_input} type *)

val make_hypervisor_details :
  ?latest_metadata_sync_status:sync_metadata_status ->
  ?latest_metadata_sync_status_message:string ->
  ?last_successful_metadata_sync_time:float ->
  ?state:hypervisor_state ->
  ?log_group_arn:string ->
  ?name:string ->
  ?kms_key_arn:string ->
  ?hypervisor_arn:string ->
  ?host:string ->
  unit
-> hypervisor_details
(** Create a {!type-hypervisor_details} type *)

val make_get_virtual_machine_output :
  ?virtual_machine:virtual_machine_details -> unit
-> get_virtual_machine_output
(** Create a {!type-get_virtual_machine_output} type *)

val make_get_virtual_machine_input : resource_arn:string -> unit
-> get_virtual_machine_input
(** Create a {!type-get_virtual_machine_input} type *)

val make_get_hypervisor_property_mappings_output :
  ?iam_role_arn:string ->
  ?vmware_to_aws_tag_mappings:vmware_to_aws_tag_mapping list ->
  ?hypervisor_arn:string ->
  unit
-> get_hypervisor_property_mappings_output
(** Create a {!type-get_hypervisor_property_mappings_output} type *)

val make_get_hypervisor_property_mappings_input :
  hypervisor_arn:string -> unit
-> get_hypervisor_property_mappings_input
(** Create a {!type-get_hypervisor_property_mappings_input} type *)

val make_get_hypervisor_output : ?hypervisor:hypervisor_details -> unit
-> get_hypervisor_output
(** Create a {!type-get_hypervisor_output} type *)

val make_get_hypervisor_input : hypervisor_arn:string -> unit
-> get_hypervisor_input
(** Create a {!type-get_hypervisor_input} type *)

val make_gateway_details :
  ?vpc_endpoint:string ->
  ?next_update_availability_time:float ->
  ?maintenance_start_time:maintenance_start_time ->
  ?last_seen_time:float ->
  ?hypervisor_id:string ->
  ?gateway_type:gateway_type ->
  ?gateway_display_name:string ->
  ?gateway_arn:string ->
  unit
-> gateway_details
(** Create a {!type-gateway_details} type *)

val make_get_gateway_output : ?gateway:gateway_details -> unit
-> get_gateway_output
(** Create a {!type-get_gateway_output} type *)

val make_get_gateway_input : gateway_arn:string -> unit
-> get_gateway_input
(** Create a {!type-get_gateway_input} type *)

val make_get_bandwidth_rate_limit_schedule_output :
  ?bandwidth_rate_limit_intervals:bandwidth_rate_limit_interval list ->
  ?gateway_arn:string ->
  unit
-> get_bandwidth_rate_limit_schedule_output
(** Create a {!type-get_bandwidth_rate_limit_schedule_output} type *)

val make_get_bandwidth_rate_limit_schedule_input : gateway_arn:string -> unit
-> get_bandwidth_rate_limit_schedule_input
(** Create a {!type-get_bandwidth_rate_limit_schedule_input} type *)

val make_disassociate_gateway_from_server_output :
  ?gateway_arn:string -> unit
-> disassociate_gateway_from_server_output
(** Create a {!type-disassociate_gateway_from_server_output} type *)

val make_disassociate_gateway_from_server_input : gateway_arn:string -> unit
-> disassociate_gateway_from_server_input
(** Create a {!type-disassociate_gateway_from_server_input} type *)

val make_delete_hypervisor_output : ?hypervisor_arn:string -> unit
-> delete_hypervisor_output
(** Create a {!type-delete_hypervisor_output} type *)

val make_delete_hypervisor_input : hypervisor_arn:string -> unit
-> delete_hypervisor_input
(** Create a {!type-delete_hypervisor_input} type *)

val make_delete_gateway_output : ?gateway_arn:string -> unit
-> delete_gateway_output
(** Create a {!type-delete_gateway_output} type *)

val make_delete_gateway_input : gateway_arn:string -> unit
-> delete_gateway_input
(** Create a {!type-delete_gateway_input} type *)

val make_create_gateway_output : ?gateway_arn:string -> unit
-> create_gateway_output
(** Create a {!type-create_gateway_output} type *)

val make_create_gateway_input :
  ?tags:tag list ->
  gateway_type:gateway_type ->
  gateway_display_name:string ->
  activation_key:string ->
  unit
-> create_gateway_input
(** Create a {!type-create_gateway_input} type *)

val make_associate_gateway_to_server_output : ?gateway_arn:string -> unit
-> associate_gateway_to_server_output
(** Create a {!type-associate_gateway_to_server_output} type *)

val make_associate_gateway_to_server_input :
  server_arn:string -> gateway_arn:string -> unit
-> associate_gateway_to_server_input
(** Create a {!type-associate_gateway_to_server_input} type *)

