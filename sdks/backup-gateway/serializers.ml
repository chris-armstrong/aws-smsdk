open Smaws_Lib.Json.SerializeHelpers

open Types

let string__to_yojson = string_to_yojson

let vpc_endpoint_to_yojson = string_to_yojson

let vmware_category_to_yojson = string_to_yojson

let vmware_tag_name_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let vmware_to_aws_tag_mapping_to_yojson = 
  fun (x: vmware_to_aws_tag_mapping) -> assoc_to_yojson(
    [(
         "AwsTagValue",
         (Some (tag_value_to_yojson x.aws_tag_value)));
       (
         "AwsTagKey",
         (Some (tag_key_to_yojson x.aws_tag_key)));
       (
         "VmwareTagName",
         (Some (vmware_tag_name_to_yojson x.vmware_tag_name)));
       (
         "VmwareCategory",
         (Some (vmware_category_to_yojson x.vmware_category)));
       
  ])

let vmware_to_aws_tag_mappings_to_yojson = 
  fun tree -> list_to_yojson vmware_to_aws_tag_mapping_to_yojson tree

let vmware_tag_to_yojson = 
  fun (x: vmware_tag) -> assoc_to_yojson(
    [(
         "VmwareTagDescription",
         (option_to_yojson string__to_yojson x.vmware_tag_description));
       (
         "VmwareTagName",
         (option_to_yojson vmware_tag_name_to_yojson x.vmware_tag_name));
       (
         "VmwareCategory",
         (option_to_yojson vmware_category_to_yojson x.vmware_category));
       
  ])

let vmware_tags_to_yojson = 
  fun tree -> list_to_yojson vmware_tag_to_yojson tree

let name_to_yojson = string_to_yojson

let path_to_yojson = string_to_yojson

let resource_arn_to_yojson = string_to_yojson

let time_to_yojson = timestamp_to_yojson

let virtual_machine_to_yojson = 
  fun (x: virtual_machine) -> assoc_to_yojson(
    [(
         "LastBackupDate",
         (option_to_yojson time_to_yojson x.last_backup_date));
       (
         "ResourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       (
         "Path",
         (option_to_yojson path_to_yojson x.path));
       (
         "Name",
         (option_to_yojson name_to_yojson x.name));
       (
         "HypervisorId",
         (option_to_yojson string__to_yojson x.hypervisor_id));
       (
         "HostName",
         (option_to_yojson name_to_yojson x.host_name));
       
  ])

let virtual_machines_to_yojson = 
  fun tree -> list_to_yojson virtual_machine_to_yojson tree

let virtual_machine_details_to_yojson = 
  fun (x: virtual_machine_details) -> assoc_to_yojson(
    [(
         "VmwareTags",
         (option_to_yojson vmware_tags_to_yojson x.vmware_tags));
       (
         "LastBackupDate",
         (option_to_yojson time_to_yojson x.last_backup_date));
       (
         "ResourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       (
         "Path",
         (option_to_yojson path_to_yojson x.path));
       (
         "Name",
         (option_to_yojson name_to_yojson x.name));
       (
         "HypervisorId",
         (option_to_yojson string__to_yojson x.hypervisor_id));
       (
         "HostName",
         (option_to_yojson name_to_yojson x.host_name));
       
  ])

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ErrorCode",
         (option_to_yojson string__to_yojson x.error_code));
       
  ])

let username_to_yojson = string_to_yojson

let server_arn_to_yojson = string_to_yojson

let update_hypervisor_output_to_yojson = 
  fun (x: update_hypervisor_output) -> assoc_to_yojson(
    [(
         "HypervisorArn",
         (option_to_yojson server_arn_to_yojson x.hypervisor_arn));
       
  ])

let host_to_yojson = string_to_yojson

let password_to_yojson = string_to_yojson

let log_group_arn_to_yojson = string_to_yojson

let update_hypervisor_input_to_yojson = 
  fun (x: update_hypervisor_input) -> assoc_to_yojson(
    [(
         "LogGroupArn",
         (option_to_yojson log_group_arn_to_yojson x.log_group_arn));
       (
         "Name",
         (option_to_yojson name_to_yojson x.name));
       (
         "Password",
         (option_to_yojson password_to_yojson x.password));
       (
         "Username",
         (option_to_yojson username_to_yojson x.username));
       (
         "Host",
         (option_to_yojson host_to_yojson x.host));
       (
         "HypervisorArn",
         (Some (server_arn_to_yojson x.hypervisor_arn)));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ErrorCode",
         (option_to_yojson string__to_yojson x.error_code));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ErrorCode",
         (Some (string__to_yojson x.error_code)));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ErrorCode",
         (Some (string__to_yojson x.error_code)));
       
  ])

let gateway_arn_to_yojson = string_to_yojson

let update_gateway_software_now_output_to_yojson = 
  fun (x: update_gateway_software_now_output) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let update_gateway_software_now_input_to_yojson = 
  fun (x: update_gateway_software_now_input) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let update_gateway_information_output_to_yojson = 
  fun (x: update_gateway_information_output) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let update_gateway_information_input_to_yojson = 
  fun (x: update_gateway_information_input) -> assoc_to_yojson(
    [(
         "GatewayDisplayName",
         (option_to_yojson name_to_yojson x.gateway_display_name));
       (
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let untag_resource_output_to_yojson = 
  fun (x: untag_resource_output) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (option_to_yojson resource_arn_to_yojson x.resource_ar_n));
       
  ])

let tag_keys_to_yojson = fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson = 
  fun (x: untag_resource_input) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_keys_to_yojson x.tag_keys)));
       (
         "ResourceARN",
         (Some (resource_arn_to_yojson x.resource_ar_n)));
       
  ])

let throttling_exception_to_yojson = 
  fun (x: throttling_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ErrorCode",
         (Some (string__to_yojson x.error_code)));
       
  ])

let test_hypervisor_configuration_output_to_yojson = 
  fun (x: test_hypervisor_configuration_output) -> assoc_to_yojson(
    [
  ])

let test_hypervisor_configuration_input_to_yojson = 
  fun (x: test_hypervisor_configuration_input) -> assoc_to_yojson(
    [(
         "Password",
         (option_to_yojson password_to_yojson x.password));
       (
         "Username",
         (option_to_yojson username_to_yojson x.username));
       (
         "Host",
         (Some (host_to_yojson x.host)));
       (
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (Some (tag_value_to_yojson x.value)));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tags_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_output_to_yojson = 
  fun (x: tag_resource_output) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (option_to_yojson resource_arn_to_yojson x.resource_ar_n));
       
  ])

let tag_resource_input_to_yojson = 
  fun (x: tag_resource_input) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tags_to_yojson x.tags)));
       (
         "ResourceARN",
         (Some (resource_arn_to_yojson x.resource_ar_n)));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let sync_metadata_status_to_yojson = 
  fun (x: sync_metadata_status) -> match x with 
 
| CREATED -> `String "CREATED"
  | RUNNING -> `String "RUNNING"
  | FAILED -> `String "FAILED"
  | PARTIALLY_FAILED -> `String "PARTIALLY_FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
   

let start_virtual_machines_metadata_sync_output_to_yojson = 
  fun (x: start_virtual_machines_metadata_sync_output) -> assoc_to_yojson(
    [(
         "HypervisorArn",
         (option_to_yojson server_arn_to_yojson x.hypervisor_arn));
       
  ])

let start_virtual_machines_metadata_sync_input_to_yojson = 
  fun (x: start_virtual_machines_metadata_sync_input) -> assoc_to_yojson(
    [(
         "HypervisorArn",
         (Some (server_arn_to_yojson x.hypervisor_arn)));
       
  ])

let put_maintenance_start_time_output_to_yojson = 
  fun (x: put_maintenance_start_time_output) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let hour_of_day_to_yojson = int_to_yojson

let minute_of_hour_to_yojson = int_to_yojson

let day_of_week_to_yojson = int_to_yojson

let day_of_month_to_yojson = int_to_yojson

let put_maintenance_start_time_input_to_yojson = 
  fun (x: put_maintenance_start_time_input) -> assoc_to_yojson(
    [(
         "DayOfMonth",
         (option_to_yojson day_of_month_to_yojson x.day_of_month));
       (
         "DayOfWeek",
         (option_to_yojson day_of_week_to_yojson x.day_of_week));
       (
         "MinuteOfHour",
         (Some (minute_of_hour_to_yojson x.minute_of_hour)));
       (
         "HourOfDay",
         (Some (hour_of_day_to_yojson x.hour_of_day)));
       (
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let put_hypervisor_property_mappings_output_to_yojson = 
  fun (x: put_hypervisor_property_mappings_output) -> assoc_to_yojson(
    [(
         "HypervisorArn",
         (option_to_yojson server_arn_to_yojson x.hypervisor_arn));
       
  ])

let iam_role_arn_to_yojson = string_to_yojson

let put_hypervisor_property_mappings_input_to_yojson = 
  fun (x: put_hypervisor_property_mappings_input) -> assoc_to_yojson(
    [(
         "IamRoleArn",
         (Some (iam_role_arn_to_yojson x.iam_role_arn)));
       (
         "VmwareToAwsTagMappings",
         (Some (vmware_to_aws_tag_mappings_to_yojson x.vmware_to_aws_tag_mappings)));
       (
         "HypervisorArn",
         (Some (server_arn_to_yojson x.hypervisor_arn)));
       
  ])

let put_bandwidth_rate_limit_schedule_output_to_yojson = 
  fun (x: put_bandwidth_rate_limit_schedule_output) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let average_upload_rate_limit_to_yojson = long_to_yojson

let days_of_week_to_yojson = 
  fun tree -> list_to_yojson day_of_week_to_yojson tree

let bandwidth_rate_limit_interval_to_yojson = 
  fun (x: bandwidth_rate_limit_interval) -> assoc_to_yojson(
    [(
         "DaysOfWeek",
         (Some (days_of_week_to_yojson x.days_of_week)));
       (
         "EndMinuteOfHour",
         (Some (minute_of_hour_to_yojson x.end_minute_of_hour)));
       (
         "StartMinuteOfHour",
         (Some (minute_of_hour_to_yojson x.start_minute_of_hour)));
       (
         "EndHourOfDay",
         (Some (hour_of_day_to_yojson x.end_hour_of_day)));
       (
         "StartHourOfDay",
         (Some (hour_of_day_to_yojson x.start_hour_of_day)));
       (
         "AverageUploadRateLimitInBitsPerSec",
         (option_to_yojson average_upload_rate_limit_to_yojson x.average_upload_rate_limit_in_bits_per_sec));
       
  ])

let bandwidth_rate_limit_intervals_to_yojson = 
  fun tree -> list_to_yojson bandwidth_rate_limit_interval_to_yojson tree

let put_bandwidth_rate_limit_schedule_input_to_yojson = 
  fun (x: put_bandwidth_rate_limit_schedule_input) -> assoc_to_yojson(
    [(
         "BandwidthRateLimitIntervals",
         (Some (bandwidth_rate_limit_intervals_to_yojson x.bandwidth_rate_limit_intervals)));
       (
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let next_token_to_yojson = string_to_yojson

let max_results_to_yojson = int_to_yojson

let maintenance_start_time_to_yojson = 
  fun (x: maintenance_start_time) -> assoc_to_yojson(
    [(
         "MinuteOfHour",
         (Some (minute_of_hour_to_yojson x.minute_of_hour)));
       (
         "HourOfDay",
         (Some (hour_of_day_to_yojson x.hour_of_day)));
       (
         "DayOfWeek",
         (option_to_yojson day_of_week_to_yojson x.day_of_week));
       (
         "DayOfMonth",
         (option_to_yojson day_of_month_to_yojson x.day_of_month));
       
  ])

let list_virtual_machines_output_to_yojson = 
  fun (x: list_virtual_machines_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "VirtualMachines",
         (option_to_yojson virtual_machines_to_yojson x.virtual_machines));
       
  ])

let list_virtual_machines_input_to_yojson = 
  fun (x: list_virtual_machines_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "HypervisorArn",
         (option_to_yojson server_arn_to_yojson x.hypervisor_arn));
       
  ])

let list_tags_for_resource_output_to_yojson = 
  fun (x: list_tags_for_resource_output) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "ResourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       
  ])

let list_tags_for_resource_input_to_yojson = 
  fun (x: list_tags_for_resource_input) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let kms_key_arn_to_yojson = string_to_yojson

let hypervisor_state_to_yojson = 
  fun (x: hypervisor_state) -> match x with 
 
| PENDING -> `String "PENDING"
  | ONLINE -> `String "ONLINE"
  | OFFLINE -> `String "OFFLINE"
  | ERROR -> `String "ERROR"
   

let hypervisor_to_yojson = 
  fun (x: hypervisor) -> assoc_to_yojson(
    [(
         "State",
         (option_to_yojson hypervisor_state_to_yojson x.state));
       (
         "Name",
         (option_to_yojson name_to_yojson x.name));
       (
         "KmsKeyArn",
         (option_to_yojson kms_key_arn_to_yojson x.kms_key_arn));
       (
         "HypervisorArn",
         (option_to_yojson server_arn_to_yojson x.hypervisor_arn));
       (
         "Host",
         (option_to_yojson host_to_yojson x.host));
       
  ])

let hypervisors_to_yojson = 
  fun tree -> list_to_yojson hypervisor_to_yojson tree

let list_hypervisors_output_to_yojson = 
  fun (x: list_hypervisors_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Hypervisors",
         (option_to_yojson hypervisors_to_yojson x.hypervisors));
       
  ])

let list_hypervisors_input_to_yojson = 
  fun (x: list_hypervisors_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       
  ])

let gateway_type_to_yojson = 
  fun (x: gateway_type) -> match x with 
  | BACKUP_VM -> `String "BACKUP_VM"
     

let hypervisor_id_to_yojson = string_to_yojson

let gateway_to_yojson = 
  fun (x: gateway) -> assoc_to_yojson(
    [(
         "LastSeenTime",
         (option_to_yojson time_to_yojson x.last_seen_time));
       (
         "HypervisorId",
         (option_to_yojson hypervisor_id_to_yojson x.hypervisor_id));
       (
         "GatewayType",
         (option_to_yojson gateway_type_to_yojson x.gateway_type));
       (
         "GatewayDisplayName",
         (option_to_yojson name_to_yojson x.gateway_display_name));
       (
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let gateways_to_yojson = fun tree -> list_to_yojson gateway_to_yojson tree

let list_gateways_output_to_yojson = 
  fun (x: list_gateways_output) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Gateways",
         (option_to_yojson gateways_to_yojson x.gateways));
       
  ])

let list_gateways_input_to_yojson = 
  fun (x: list_gateways_input) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       
  ])

let internal_server_exception_to_yojson = 
  fun (x: internal_server_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ErrorCode",
         (option_to_yojson string__to_yojson x.error_code));
       
  ])

let import_hypervisor_configuration_output_to_yojson = 
  fun (x: import_hypervisor_configuration_output) -> assoc_to_yojson(
    [(
         "HypervisorArn",
         (option_to_yojson server_arn_to_yojson x.hypervisor_arn));
       
  ])

let import_hypervisor_configuration_input_to_yojson = 
  fun (x: import_hypervisor_configuration_input) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "KmsKeyArn",
         (option_to_yojson kms_key_arn_to_yojson x.kms_key_arn));
       (
         "Password",
         (option_to_yojson password_to_yojson x.password));
       (
         "Username",
         (option_to_yojson username_to_yojson x.username));
       (
         "Host",
         (Some (host_to_yojson x.host)));
       (
         "Name",
         (Some (name_to_yojson x.name)));
       
  ])

let hypervisor_details_to_yojson = 
  fun (x: hypervisor_details) -> assoc_to_yojson(
    [(
         "LatestMetadataSyncStatus",
         (option_to_yojson sync_metadata_status_to_yojson x.latest_metadata_sync_status));
       (
         "LatestMetadataSyncStatusMessage",
         (option_to_yojson string__to_yojson x.latest_metadata_sync_status_message));
       (
         "LastSuccessfulMetadataSyncTime",
         (option_to_yojson time_to_yojson x.last_successful_metadata_sync_time));
       (
         "State",
         (option_to_yojson hypervisor_state_to_yojson x.state));
       (
         "LogGroupArn",
         (option_to_yojson log_group_arn_to_yojson x.log_group_arn));
       (
         "Name",
         (option_to_yojson name_to_yojson x.name));
       (
         "KmsKeyArn",
         (option_to_yojson kms_key_arn_to_yojson x.kms_key_arn));
       (
         "HypervisorArn",
         (option_to_yojson server_arn_to_yojson x.hypervisor_arn));
       (
         "Host",
         (option_to_yojson host_to_yojson x.host));
       
  ])

let get_virtual_machine_output_to_yojson = 
  fun (x: get_virtual_machine_output) -> assoc_to_yojson(
    [(
         "VirtualMachine",
         (option_to_yojson virtual_machine_details_to_yojson x.virtual_machine));
       
  ])

let get_virtual_machine_input_to_yojson = 
  fun (x: get_virtual_machine_input) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let get_hypervisor_property_mappings_output_to_yojson = 
  fun (x: get_hypervisor_property_mappings_output) -> assoc_to_yojson(
    [(
         "IamRoleArn",
         (option_to_yojson iam_role_arn_to_yojson x.iam_role_arn));
       (
         "VmwareToAwsTagMappings",
         (option_to_yojson vmware_to_aws_tag_mappings_to_yojson x.vmware_to_aws_tag_mappings));
       (
         "HypervisorArn",
         (option_to_yojson server_arn_to_yojson x.hypervisor_arn));
       
  ])

let get_hypervisor_property_mappings_input_to_yojson = 
  fun (x: get_hypervisor_property_mappings_input) -> assoc_to_yojson(
    [(
         "HypervisorArn",
         (Some (server_arn_to_yojson x.hypervisor_arn)));
       
  ])

let get_hypervisor_output_to_yojson = 
  fun (x: get_hypervisor_output) -> assoc_to_yojson(
    [(
         "Hypervisor",
         (option_to_yojson hypervisor_details_to_yojson x.hypervisor));
       
  ])

let get_hypervisor_input_to_yojson = 
  fun (x: get_hypervisor_input) -> assoc_to_yojson(
    [(
         "HypervisorArn",
         (Some (server_arn_to_yojson x.hypervisor_arn)));
       
  ])

let gateway_details_to_yojson = 
  fun (x: gateway_details) -> assoc_to_yojson(
    [(
         "VpcEndpoint",
         (option_to_yojson vpc_endpoint_to_yojson x.vpc_endpoint));
       (
         "NextUpdateAvailabilityTime",
         (option_to_yojson time_to_yojson x.next_update_availability_time));
       (
         "MaintenanceStartTime",
         (option_to_yojson maintenance_start_time_to_yojson x.maintenance_start_time));
       (
         "LastSeenTime",
         (option_to_yojson time_to_yojson x.last_seen_time));
       (
         "HypervisorId",
         (option_to_yojson hypervisor_id_to_yojson x.hypervisor_id));
       (
         "GatewayType",
         (option_to_yojson gateway_type_to_yojson x.gateway_type));
       (
         "GatewayDisplayName",
         (option_to_yojson name_to_yojson x.gateway_display_name));
       (
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let get_gateway_output_to_yojson = 
  fun (x: get_gateway_output) -> assoc_to_yojson(
    [(
         "Gateway",
         (option_to_yojson gateway_details_to_yojson x.gateway));
       
  ])

let get_gateway_input_to_yojson = 
  fun (x: get_gateway_input) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let get_bandwidth_rate_limit_schedule_output_to_yojson = 
  fun (x: get_bandwidth_rate_limit_schedule_output) -> assoc_to_yojson(
    [(
         "BandwidthRateLimitIntervals",
         (option_to_yojson bandwidth_rate_limit_intervals_to_yojson x.bandwidth_rate_limit_intervals));
       (
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let get_bandwidth_rate_limit_schedule_input_to_yojson = 
  fun (x: get_bandwidth_rate_limit_schedule_input) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let disassociate_gateway_from_server_output_to_yojson = 
  fun (x: disassociate_gateway_from_server_output) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let disassociate_gateway_from_server_input_to_yojson = 
  fun (x: disassociate_gateway_from_server_input) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let delete_hypervisor_output_to_yojson = 
  fun (x: delete_hypervisor_output) -> assoc_to_yojson(
    [(
         "HypervisorArn",
         (option_to_yojson server_arn_to_yojson x.hypervisor_arn));
       
  ])

let delete_hypervisor_input_to_yojson = 
  fun (x: delete_hypervisor_input) -> assoc_to_yojson(
    [(
         "HypervisorArn",
         (Some (server_arn_to_yojson x.hypervisor_arn)));
       
  ])

let delete_gateway_output_to_yojson = 
  fun (x: delete_gateway_output) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let delete_gateway_input_to_yojson = 
  fun (x: delete_gateway_input) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let create_gateway_output_to_yojson = 
  fun (x: create_gateway_output) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let activation_key_to_yojson = string_to_yojson

let create_gateway_input_to_yojson = 
  fun (x: create_gateway_input) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "GatewayType",
         (Some (gateway_type_to_yojson x.gateway_type)));
       (
         "GatewayDisplayName",
         (Some (name_to_yojson x.gateway_display_name)));
       (
         "ActivationKey",
         (Some (activation_key_to_yojson x.activation_key)));
       
  ])

let associate_gateway_to_server_output_to_yojson = 
  fun (x: associate_gateway_to_server_output) -> assoc_to_yojson(
    [(
         "GatewayArn",
         (option_to_yojson gateway_arn_to_yojson x.gateway_arn));
       
  ])

let associate_gateway_to_server_input_to_yojson = 
  fun (x: associate_gateway_to_server_input) -> assoc_to_yojson(
    [(
         "ServerArn",
         (Some (server_arn_to_yojson x.server_arn)));
       (
         "GatewayArn",
         (Some (gateway_arn_to_yojson x.gateway_arn)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

