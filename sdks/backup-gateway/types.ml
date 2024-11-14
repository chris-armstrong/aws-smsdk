open Smaws_Lib
let service =
  Service.{
    namespace = "backup-gateway";
    endpointPrefix = "backup-gateway";
    version = "2021-01-01";
    protocol = AwsJson_1_0
  };
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

