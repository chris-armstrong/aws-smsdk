open Smaws_Lib
val service : Service.descriptor

type vmware_to_aws_tag_mapping = {
  aws_tag_value: string;
  aws_tag_key: string;
  vmware_tag_name: string;
  vmware_category: string
}

type vmware_tag = {
  vmware_tag_description: string option;
  vmware_tag_name: string option;
  vmware_category: string option
}

type virtual_machine = {
  last_backup_date: float option;
  resource_arn: string option;
  path: string option;
  name: string option;
  hypervisor_id: string option;
  host_name: string option
}

type virtual_machine_details = {
  vmware_tags: vmware_tag list option;
  last_backup_date: float option;
  resource_arn: string option;
  path: string option;
  name: string option;
  hypervisor_id: string option;
  host_name: string option
}

type validation_exception = {
  message: string option;
  error_code: string option
}

type update_hypervisor_output = {
  hypervisor_arn: string option
}

type update_hypervisor_input = {
  log_group_arn: string option;
  name: string option;
  password: string option;
  username: string option;
  host: string option;
  hypervisor_arn: string
}

type resource_not_found_exception = {
  message: string option;
  error_code: string option
}

type conflict_exception = {
  message: string option;
  error_code: string
}

type access_denied_exception = {
  message: string option;
  error_code: string
}

type update_gateway_software_now_output = {
  gateway_arn: string option
}

type update_gateway_software_now_input = {
  gateway_arn: string
}

type update_gateway_information_output = {
  gateway_arn: string option
}

type update_gateway_information_input = {
  gateway_display_name: string option;
  gateway_arn: string
}

type untag_resource_output = {
  resource_ar_n: string option
}

type untag_resource_input = {
  tag_keys: string list;
  resource_ar_n: string
}

type throttling_exception = {
  message: string option;
  error_code: string
}

type test_hypervisor_configuration_output = unit

type test_hypervisor_configuration_input = {
  password: string option;
  username: string option;
  host: string;
  gateway_arn: string
}

type tag = {
  value: string;
  key: string
}

type tag_resource_output = {
  resource_ar_n: string option
}

type tag_resource_input = {
  tags: tag list;
  resource_ar_n: string
}

type sync_metadata_status = | CREATED
  | RUNNING
  | FAILED
  | PARTIALLY_FAILED
  | SUCCEEDED

type start_virtual_machines_metadata_sync_output = {
  hypervisor_arn: string option
}

type start_virtual_machines_metadata_sync_input = {
  hypervisor_arn: string
}

type put_maintenance_start_time_output = {
  gateway_arn: string option
}

type put_maintenance_start_time_input = {
  day_of_month: int option;
  day_of_week: int option;
  minute_of_hour: int;
  hour_of_day: int;
  gateway_arn: string
}

type put_hypervisor_property_mappings_output = {
  hypervisor_arn: string option
}

type put_hypervisor_property_mappings_input = {
  iam_role_arn: string;
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list;
  hypervisor_arn: string
}

type put_bandwidth_rate_limit_schedule_output = {
  gateway_arn: string option
}

type bandwidth_rate_limit_interval = {
  days_of_week: int list;
  end_minute_of_hour: int;
  start_minute_of_hour: int;
  end_hour_of_day: int;
  start_hour_of_day: int;
  average_upload_rate_limit_in_bits_per_sec: int option
}

type put_bandwidth_rate_limit_schedule_input = {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list;
  gateway_arn: string
}

type maintenance_start_time = {
  minute_of_hour: int;
  hour_of_day: int;
  day_of_week: int option;
  day_of_month: int option
}

type list_virtual_machines_output = {
  next_token: string option;
  virtual_machines: virtual_machine list option
}

type list_virtual_machines_input = {
  next_token: string option;
  max_results: int option;
  hypervisor_arn: string option
}

type list_tags_for_resource_output = {
  tags: tag list option;
  resource_arn: string option
}

type list_tags_for_resource_input = {
  resource_arn: string
}

type hypervisor_state = | PENDING
  | ONLINE
  | OFFLINE
  | ERROR

type hypervisor = {
  state: hypervisor_state option;
  name: string option;
  kms_key_arn: string option;
  hypervisor_arn: string option;
  host: string option
}

type list_hypervisors_output = {
  next_token: string option;
  hypervisors: hypervisor list option
}

type list_hypervisors_input = {
  next_token: string option;
  max_results: int option
}

type gateway_type = | BACKUP_VM

type gateway = {
  last_seen_time: float option;
  hypervisor_id: string option;
  gateway_type: gateway_type option;
  gateway_display_name: string option;
  gateway_arn: string option
}

type list_gateways_output = {
  next_token: string option;
  gateways: gateway list option
}

type list_gateways_input = {
  next_token: string option;
  max_results: int option
}

type internal_server_exception = {
  message: string option;
  error_code: string option
}

type import_hypervisor_configuration_output = {
  hypervisor_arn: string option
}

type import_hypervisor_configuration_input = {
  tags: tag list option;
  kms_key_arn: string option;
  password: string option;
  username: string option;
  host: string;
  name: string
}

type hypervisor_details = {
  latest_metadata_sync_status: sync_metadata_status option;
  latest_metadata_sync_status_message: string option;
  last_successful_metadata_sync_time: float option;
  state: hypervisor_state option;
  log_group_arn: string option;
  name: string option;
  kms_key_arn: string option;
  hypervisor_arn: string option;
  host: string option
}

type get_virtual_machine_output = {
  virtual_machine: virtual_machine_details option
}

type get_virtual_machine_input = {
  resource_arn: string
}

type get_hypervisor_property_mappings_output = {
  iam_role_arn: string option;
  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list option;
  hypervisor_arn: string option
}

type get_hypervisor_property_mappings_input = {
  hypervisor_arn: string
}

type get_hypervisor_output = {
  hypervisor: hypervisor_details option
}

type get_hypervisor_input = {
  hypervisor_arn: string
}

type gateway_details = {
  vpc_endpoint: string option;
  next_update_availability_time: float option;
  maintenance_start_time: maintenance_start_time option;
  last_seen_time: float option;
  hypervisor_id: string option;
  gateway_type: gateway_type option;
  gateway_display_name: string option;
  gateway_arn: string option
}

type get_gateway_output = {
  gateway: gateway_details option
}

type get_gateway_input = {
  gateway_arn: string
}

type get_bandwidth_rate_limit_schedule_output = {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list option;
  gateway_arn: string option
}

type get_bandwidth_rate_limit_schedule_input = {
  gateway_arn: string
}

type disassociate_gateway_from_server_output = {
  gateway_arn: string option
}

type disassociate_gateway_from_server_input = {
  gateway_arn: string
}

type delete_hypervisor_output = {
  hypervisor_arn: string option
}

type delete_hypervisor_input = {
  hypervisor_arn: string
}

type delete_gateway_output = {
  gateway_arn: string option
}

type delete_gateway_input = {
  gateway_arn: string
}

type create_gateway_output = {
  gateway_arn: string option
}

type create_gateway_input = {
  tags: tag list option;
  gateway_type: gateway_type;
  gateway_display_name: string;
  activation_key: string
}



type associate_gateway_to_server_output = {
  gateway_arn: string option
}

type associate_gateway_to_server_input = {
  server_arn: string;
  gateway_arn: string
}

type base_document = Json.t

val make_vmware_to_aws_tag_mapping :
  aws_tag_value:string ->
  aws_tag_key:string ->
  vmware_tag_name:string ->
  vmware_category:string ->
  unit -> vmware_to_aws_tag_mapping

val make_vmware_tag :
  ?vmware_tag_description:string ->
  ?vmware_tag_name:string ->
  ?vmware_category:string ->
  unit -> vmware_tag

val make_virtual_machine :
  ?last_backup_date:float ->
  ?resource_arn:string ->
  ?path:string ->
  ?name:string ->
  ?hypervisor_id:string ->
  ?host_name:string ->
  unit -> virtual_machine

val make_virtual_machine_details :
  ?vmware_tags:vmware_tag list ->
  ?last_backup_date:float ->
  ?resource_arn:string ->
  ?path:string ->
  ?name:string ->
  ?hypervisor_id:string ->
  ?host_name:string ->
  unit -> virtual_machine_details

val make_update_hypervisor_output : ?hypervisor_arn:string -> unit
-> update_hypervisor_output

val make_update_hypervisor_input :
  ?log_group_arn:string ->
  ?name:string ->
  ?password:string ->
  ?username:string ->
  ?host:string ->
  hypervisor_arn:string ->
  unit
-> update_hypervisor_input

val make_update_gateway_software_now_output : ?gateway_arn:string -> unit
-> update_gateway_software_now_output

val make_update_gateway_software_now_input : gateway_arn:string -> unit
-> update_gateway_software_now_input

val make_update_gateway_information_output : ?gateway_arn:string -> unit
-> update_gateway_information_output

val make_update_gateway_information_input :
  ?gateway_display_name:string -> gateway_arn:string -> unit
-> update_gateway_information_input

val make_untag_resource_output : ?resource_ar_n:string -> unit
-> untag_resource_output

val make_untag_resource_input :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_input

val make_test_hypervisor_configuration_output : unit
-> test_hypervisor_configuration_output

val make_test_hypervisor_configuration_input :
  ?password:string ->
  ?username:string ->
  host:string ->
  gateway_arn:string ->
  unit -> test_hypervisor_configuration_input

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_output : ?resource_ar_n:string -> unit
-> tag_resource_output

val make_tag_resource_input : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_input

val make_start_virtual_machines_metadata_sync_output :
  ?hypervisor_arn:string -> unit
-> start_virtual_machines_metadata_sync_output

val make_start_virtual_machines_metadata_sync_input :
  hypervisor_arn:string -> unit
-> start_virtual_machines_metadata_sync_input

val make_put_maintenance_start_time_output : ?gateway_arn:string -> unit
-> put_maintenance_start_time_output

val make_put_maintenance_start_time_input :
  ?day_of_month:int ->
  ?day_of_week:int ->
  minute_of_hour:int ->
  hour_of_day:int ->
  gateway_arn:string ->
  unit
-> put_maintenance_start_time_input

val make_put_hypervisor_property_mappings_output :
  ?hypervisor_arn:string -> unit
-> put_hypervisor_property_mappings_output

val make_put_hypervisor_property_mappings_input :
  iam_role_arn:string ->
  vmware_to_aws_tag_mappings:vmware_to_aws_tag_mapping list ->
  hypervisor_arn:string ->
  unit
-> put_hypervisor_property_mappings_input

val make_put_bandwidth_rate_limit_schedule_output :
  ?gateway_arn:string -> unit
-> put_bandwidth_rate_limit_schedule_output

val make_bandwidth_rate_limit_interval :
  ?average_upload_rate_limit_in_bits_per_sec:int ->
  days_of_week:int list ->
  end_minute_of_hour:int ->
  start_minute_of_hour:int ->
  end_hour_of_day:int ->
  start_hour_of_day:int ->
  unit
-> bandwidth_rate_limit_interval

val make_put_bandwidth_rate_limit_schedule_input :
  bandwidth_rate_limit_intervals:bandwidth_rate_limit_interval list ->
  gateway_arn:string ->
  unit
-> put_bandwidth_rate_limit_schedule_input

val make_maintenance_start_time :
  ?day_of_week:int ->
  ?day_of_month:int ->
  minute_of_hour:int ->
  hour_of_day:int ->
  unit -> maintenance_start_time

val make_list_virtual_machines_output :
  ?next_token:string -> ?virtual_machines:virtual_machine list -> unit
-> list_virtual_machines_output

val make_list_virtual_machines_input :
  ?next_token:string -> ?max_results:int -> ?hypervisor_arn:string -> unit
-> list_virtual_machines_input

val make_list_tags_for_resource_output :
  ?tags:tag list -> ?resource_arn:string -> unit
-> list_tags_for_resource_output

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input

val make_hypervisor :
  ?state:hypervisor_state ->
  ?name:string ->
  ?kms_key_arn:string ->
  ?hypervisor_arn:string ->
  ?host:string ->
  unit -> hypervisor

val make_list_hypervisors_output :
  ?next_token:string -> ?hypervisors:hypervisor list -> unit
-> list_hypervisors_output

val make_list_hypervisors_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_hypervisors_input

val make_gateway :
  ?last_seen_time:float ->
  ?hypervisor_id:string ->
  ?gateway_type:gateway_type ->
  ?gateway_display_name:string ->
  ?gateway_arn:string ->
  unit -> gateway

val make_list_gateways_output :
  ?next_token:string -> ?gateways:gateway list -> unit
-> list_gateways_output

val make_list_gateways_input : ?next_token:string -> ?max_results:int -> unit
-> list_gateways_input

val make_import_hypervisor_configuration_output :
  ?hypervisor_arn:string -> unit
-> import_hypervisor_configuration_output

val make_import_hypervisor_configuration_input :
  ?tags:tag list ->
  ?kms_key_arn:string ->
  ?password:string ->
  ?username:string ->
  host:string ->
  name:string ->
  unit -> import_hypervisor_configuration_input

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
  unit -> hypervisor_details

val make_get_virtual_machine_output :
  ?virtual_machine:virtual_machine_details -> unit
-> get_virtual_machine_output

val make_get_virtual_machine_input : resource_arn:string -> unit
-> get_virtual_machine_input

val make_get_hypervisor_property_mappings_output :
  ?iam_role_arn:string ->
  ?vmware_to_aws_tag_mappings:vmware_to_aws_tag_mapping list ->
  ?hypervisor_arn:string ->
  unit
-> get_hypervisor_property_mappings_output

val make_get_hypervisor_property_mappings_input :
  hypervisor_arn:string -> unit
-> get_hypervisor_property_mappings_input

val make_get_hypervisor_output : ?hypervisor:hypervisor_details -> unit
-> get_hypervisor_output

val make_get_hypervisor_input : hypervisor_arn:string -> unit
-> get_hypervisor_input

val make_gateway_details :
  ?vpc_endpoint:string ->
  ?next_update_availability_time:float ->
  ?maintenance_start_time:maintenance_start_time ->
  ?last_seen_time:float ->
  ?hypervisor_id:string ->
  ?gateway_type:gateway_type ->
  ?gateway_display_name:string ->
  ?gateway_arn:string ->
  unit -> gateway_details

val make_get_gateway_output : ?gateway:gateway_details -> unit
-> get_gateway_output

val make_get_gateway_input : gateway_arn:string -> unit
-> get_gateway_input

val make_get_bandwidth_rate_limit_schedule_output :
  ?bandwidth_rate_limit_intervals:bandwidth_rate_limit_interval list ->
  ?gateway_arn:string ->
  unit
-> get_bandwidth_rate_limit_schedule_output

val make_get_bandwidth_rate_limit_schedule_input : gateway_arn:string -> unit
-> get_bandwidth_rate_limit_schedule_input

val make_disassociate_gateway_from_server_output :
  ?gateway_arn:string -> unit
-> disassociate_gateway_from_server_output

val make_disassociate_gateway_from_server_input : gateway_arn:string -> unit
-> disassociate_gateway_from_server_input

val make_delete_hypervisor_output : ?hypervisor_arn:string -> unit
-> delete_hypervisor_output

val make_delete_hypervisor_input : hypervisor_arn:string -> unit
-> delete_hypervisor_input

val make_delete_gateway_output : ?gateway_arn:string -> unit
-> delete_gateway_output

val make_delete_gateway_input : gateway_arn:string -> unit
-> delete_gateway_input

val make_create_gateway_output : ?gateway_arn:string -> unit
-> create_gateway_output

val make_create_gateway_input :
  ?tags:tag list ->
  gateway_type:gateway_type ->
  gateway_display_name:string ->
  activation_key:string ->
  unit -> create_gateway_input

val make_associate_gateway_to_server_output : ?gateway_arn:string -> unit
-> associate_gateway_to_server_output

val make_associate_gateway_to_server_input :
  server_arn:string -> gateway_arn:string -> unit
-> associate_gateway_to_server_input

module UpdateHypervisor : sig
  val request :
    Smaws_Lib.Context.t ->
      update_hypervisor_input ->
        (update_hypervisor_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateGatewaySoftwareNow : sig
  val request :
    Smaws_Lib.Context.t ->
      update_gateway_software_now_input ->
        (update_gateway_software_now_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateGatewayInformation : sig
  val request :
    Smaws_Lib.Context.t ->
      update_gateway_information_input ->
        (update_gateway_information_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TestHypervisorConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      test_hypervisor_configuration_input ->
        (test_hypervisor_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module StartVirtualMachinesMetadataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      start_virtual_machines_metadata_sync_input ->
        (start_virtual_machines_metadata_sync_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutMaintenanceStartTime : sig
  val request :
    Smaws_Lib.Context.t ->
      put_maintenance_start_time_input ->
        (put_maintenance_start_time_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutHypervisorPropertyMappings : sig
  val request :
    Smaws_Lib.Context.t ->
      put_hypervisor_property_mappings_input ->
        (put_hypervisor_property_mappings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module PutBandwidthRateLimitSchedule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_bandwidth_rate_limit_schedule_input ->
        (put_bandwidth_rate_limit_schedule_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListVirtualMachines : sig
  val request :
    Smaws_Lib.Context.t ->
      list_virtual_machines_input ->
        (list_virtual_machines_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListHypervisors : sig
  val request :
    Smaws_Lib.Context.t ->
      list_hypervisors_input ->
        (list_hypervisors_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module ListGateways : sig
  val request :
    Smaws_Lib.Context.t ->
      list_gateways_input ->
        (list_gateways_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module ImportHypervisorConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      import_hypervisor_configuration_input ->
        (import_hypervisor_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            
        ]
      ) result
end

module GetVirtualMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      get_virtual_machine_input ->
        (get_virtual_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetHypervisorPropertyMappings : sig
  val request :
    Smaws_Lib.Context.t ->
      get_hypervisor_property_mappings_input ->
        (get_hypervisor_property_mappings_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetHypervisor : sig
  val request :
    Smaws_Lib.Context.t ->
      get_hypervisor_input ->
        (get_hypervisor_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetGateway : sig
  val request :
    Smaws_Lib.Context.t ->
      get_gateway_input ->
        (get_gateway_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetBandwidthRateLimitSchedule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bandwidth_rate_limit_schedule_input ->
        (get_bandwidth_rate_limit_schedule_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateGatewayFromServer : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_gateway_from_server_input ->
        (disassociate_gateway_from_server_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteHypervisor : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_hypervisor_input ->
        (delete_hypervisor_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteGateway : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_gateway_input ->
        (delete_gateway_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateGateway : sig
  val request :
    Smaws_Lib.Context.t ->
      create_gateway_input ->
        (create_gateway_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module AssociateGatewayToServer : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_gateway_to_server_input ->
        (associate_gateway_to_server_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            
        ]
      ) result
end

