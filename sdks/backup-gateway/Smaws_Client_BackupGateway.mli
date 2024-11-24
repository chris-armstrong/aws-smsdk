(** 
    Backup Gateway client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(**{|
    This displays the mapping of on-premises VMware tags to the corresponding
    Amazon Web Services tags.|}*)
type vmware_to_aws_tag_mapping = {
  aws_tag_value: string;
   (**{|
    The value part of the Amazon Web Services tag's key-value pair.|}*)

  aws_tag_key: string;
   (**{|
    The key part of the Amazon Web Services tag's key-value pair.|}*)

  vmware_tag_name: string;
   (**{|
    This is the user-defined name of a VMware tag.|}*)

  vmware_category: string;
   (**{|
    The is the category of VMware.|}*)

}

(**{|
    A VMware tag is a tag attached to a specific virtual machine. A
    {{: https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_Tag.html }tag}
    is a key-value pair you can use to manage, filter, and search for your
    resources.
    
    The content of VMware tags can be matched to Amazon Web Services tags.|}*)
type vmware_tag = {
  vmware_tag_description: string option;
   (**{|
    This is a user-defined description of a VMware tag.|}*)

  vmware_tag_name: string option;
   (**{|
    This is the user-defined name of a VMware tag.|}*)

  vmware_category: string option;
   (**{|
    The is the category of VMware.|}*)

}

(**{|
    A virtual machine that is on a hypervisor.|}*)
type virtual_machine = {
  last_backup_date: float option;
   (**{|
    The most recent date a virtual machine was backed up, in Unix format and
    UTC time.|}*)

  resource_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the virtual machine. For example,
    [arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL].|}*)

  path: string option;
   (**{|
    The path of the virtual machine.|}*)

  name: string option;
   (**{|
    The name of the virtual machine.|}*)

  hypervisor_id: string option;
   (**{|
    The ID of the virtual machine's hypervisor.|}*)

  host_name: string option;
   (**{|
    The host name of the virtual machine.|}*)

}

(**{|
    Your [VirtualMachine] objects, ordered by their Amazon Resource Names
    (ARNs).|}*)
type virtual_machine_details = {
  vmware_tags: vmware_tag list option;
   (**{|
    These are the details of the VMware tags associated with the specified
    virtual machine.|}*)

  last_backup_date: float option;
   (**{|
    The most recent date a virtual machine was backed up, in Unix format and
    UTC time.|}*)

  resource_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the virtual machine. For example,
    [arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL].|}*)

  path: string option;
   (**{|
    The path of the virtual machine.|}*)

  name: string option;
   (**{|
    The name of the virtual machine.|}*)

  hypervisor_id: string option;
   (**{|
    The ID of the virtual machine's hypervisor.|}*)

  host_name: string option;
   (**{|
    The host name of the virtual machine.|}*)

}

(**{|
    The operation did not succeed because a validation error occurred.|}*)
type validation_exception = {
  message: string option;
  
  error_code: string option;
   (**{|
    A description of what caused the validation error.|}*)

}

type update_hypervisor_output = {
  hypervisor_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor you updated.|}*)

}

type update_hypervisor_input = {
  log_group_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the group of gateways within the
    requested log.|}*)

  name: string option;
   (**{|
    The updated name for the hypervisor|}*)

  password: string option;
   (**{|
    The updated password for the hypervisor.|}*)

  username: string option;
   (**{|
    The updated username for the hypervisor.|}*)

  host: string option;
   (**{|
    The updated host of the hypervisor. This can be either an IP address or a
    fully-qualified domain name (FQDN).|}*)

  hypervisor_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor to update.|}*)

}

(**{|
    A resource that is required for the action wasn't found.|}*)
type resource_not_found_exception = {
  message: string option;
  
  error_code: string option;
   (**{|
    A description of which resource wasn't found.|}*)

}

(**{|
    The operation cannot proceed because it is not supported.|}*)
type conflict_exception = {
  message: string option;
  
  error_code: string;
   (**{|
    A description of why the operation is not supported.|}*)

}

(**{|
    The operation cannot proceed because you have insufficient permissions.|}*)
type access_denied_exception = {
  message: string option;
  
  error_code: string;
   (**{|
    A description of why you have insufficient permissions.|}*)

}

type update_gateway_software_now_output = {
  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the gateway you updated.|}*)

}

type update_gateway_software_now_input = {
  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the gateway to be updated.|}*)

}

type update_gateway_information_output = {
  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the gateway you updated.|}*)

}

type update_gateway_information_input = {
  gateway_display_name: string option;
   (**{|
    The updated display name of the gateway.|}*)

  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the gateway to update.|}*)

}

type untag_resource_output = {
  resource_ar_n: string option;
   (**{|
    The Amazon Resource Name (ARN) of the resource from which you removed
    tags.|}*)

}

type untag_resource_input = {
  tag_keys: string list;
   (**{|
    The list of tag keys specifying which tags to remove.|}*)

  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource from which to remove tags.|}*)

}

(**{|
    TPS has been limited to protect against intentional or unintentional high
    request volumes.|}*)
type throttling_exception = {
  message: string option;
  
  error_code: string;
   (**{|
    Error: TPS has been limited to protect against intentional or
    unintentional high request volumes.|}*)

}

type test_hypervisor_configuration_output = unit

type test_hypervisor_configuration_input = {
  password: string option;
   (**{|
    The password for the hypervisor.|}*)

  username: string option;
   (**{|
    The username for the hypervisor.|}*)

  host: string;
   (**{|
    The server host of the hypervisor. This can be either an IP address or a
    fully-qualified domain name (FQDN).|}*)

  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the gateway to the hypervisor to test.|}*)

}

(**{|
    A key-value pair you can use to manage, filter, and search for your
    resources. Allowed characters include UTF-8 letters, numbers, spaces, and
    the following characters: + - = . _ : /.|}*)
type tag = {
  value: string;
   (**{|
    The value part of a tag's key-value pair.|}*)

  key: string;
   (**{|
    The key part of a tag's key-value pair. The key can't start with [aws:].|}*)

}

type tag_resource_output = {
  resource_ar_n: string option;
   (**{|
    The Amazon Resource Name (ARN) of the resource you tagged.|}*)

}

type tag_resource_input = {
  tags: tag list;
   (**{|
    A list of tags to assign to the resource.|}*)

  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource to tag.|}*)

}

type sync_metadata_status = | CREATED
  | RUNNING
  | FAILED
  | PARTIALLY_FAILED
  | SUCCEEDED

type start_virtual_machines_metadata_sync_output = {
  hypervisor_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor.|}*)

}

type start_virtual_machines_metadata_sync_input = {
  hypervisor_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor.|}*)

}

type put_maintenance_start_time_output = {
  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of a gateway for which you set the
    maintenance start time.|}*)

}

type put_maintenance_start_time_input = {
  day_of_month: int option;
   (**{|
    The day of the month start maintenance on a gateway.
    
    Valid values range from [Sunday] to [Saturday].|}*)

  day_of_week: int option;
   (**{|
    The day of the week to start maintenance on a gateway.|}*)

  minute_of_hour: int;
   (**{|
    The minute of the hour to start maintenance on a gateway.|}*)

  hour_of_day: int;
   (**{|
    The hour of the day to start maintenance on a gateway.|}*)

  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) for the gateway, used to specify its
    maintenance start time.|}*)

}

type put_hypervisor_property_mappings_output = {
  hypervisor_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor.|}*)

}

type put_hypervisor_property_mappings_input = {
  iam_role_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the IAM role.|}*)

  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list;
   (**{|
    This action requests the mappings of on-premises VMware tags to the
    Amazon Web Services tags.|}*)

  hypervisor_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor.|}*)

}

type put_bandwidth_rate_limit_schedule_output = {
  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the gateway. Use the
    {{: https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html }[ListGateways]}
    operation to return a list of gateways for your account and Amazon Web
    Services Region.|}*)

}

(**{|
    Describes a bandwidth rate limit interval for a gateway. A bandwidth rate
    limit schedule consists of one or more bandwidth rate limit intervals. A
    bandwidth rate limit interval defines a period of time on one or more
    days of the week, during which bandwidth rate limits are specified for
    uploading, downloading, or both.|}*)
type bandwidth_rate_limit_interval = {
  days_of_week: int list;
   (**{|
    The days of the week component of the bandwidth rate limit interval,
    represented as ordinal numbers from 0 to 6, where 0 represents Sunday and
    6 represents Saturday.|}*)

  end_minute_of_hour: int;
   (**{|
    The minute of the hour to end the bandwidth rate limit interval.
    
    The bandwidth rate limit interval ends at the end of the minute. To end
    an interval at the end of an hour, use the value [59].
    |}*)

  start_minute_of_hour: int;
   (**{|
    The minute of the hour to start the bandwidth rate limit interval. The
    interval begins at the start of that minute. To begin an interval exactly
    at the start of the hour, use the value [0].|}*)

  end_hour_of_day: int;
   (**{|
    The hour of the day to end the bandwidth rate limit interval.|}*)

  start_hour_of_day: int;
   (**{|
    The hour of the day to start the bandwidth rate limit interval.|}*)

  average_upload_rate_limit_in_bits_per_sec: int option;
   (**{|
    The average upload rate limit component of the bandwidth rate limit
    interval, in bits per second. This field does not appear in the response
    if the upload rate limit is not set.
    
    For Backup Gateway, the minimum value is [(Value)].
    |}*)

}

type put_bandwidth_rate_limit_schedule_input = {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list;
   (**{|
    An array containing bandwidth rate limit schedule intervals for a
    gateway. When no bandwidth rate limit intervals have been scheduled, the
    array is empty.|}*)

  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the gateway. Use the
    {{: https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html }[ListGateways]}
    operation to return a list of gateways for your account and Amazon Web
    Services Region.|}*)

}

(**{|
    This is your gateway's weekly maintenance start time including the day
    and time of the week. Note that values are in terms of the gateway's time
    zone. Can be weekly or monthly.|}*)
type maintenance_start_time = {
  minute_of_hour: int;
   (**{|
    The minute component of the maintenance start time represented as {i mm},
    where {i mm} is the minute (0 to 59). The minute of the hour is in the
    time zone of the gateway.|}*)

  hour_of_day: int;
   (**{|
    The hour component of the maintenance start time represented as {i hh},
    where {i hh} is the hour (0 to 23). The hour of the day is in the time
    zone of the gateway.|}*)

  day_of_week: int option;
   (**{|
    An ordinal number between 0 and 6 that represents the day of the week,
    where 0 represents Sunday and 6 represents Saturday. The day of week is
    in the time zone of the gateway.|}*)

  day_of_month: int option;
   (**{|
    The day of the month component of the maintenance start time represented
    as an ordinal number from 1 to 28, where 1 represents the first day of
    the month and 28 represents the last day of the month.|}*)

}

type list_virtual_machines_output = {
  next_token: string option;
   (**{|
    The next item following a partial list of returned resources. For
    example, if a request is made to return [maxResults] number of resources,
    [NextToken] allows you to return more items in your list starting at the
    location pointed to by the next token.|}*)

  virtual_machines: virtual_machine list option;
   (**{|
    A list of your [VirtualMachine] objects, ordered by their Amazon Resource
    Names (ARNs).|}*)

}

type list_virtual_machines_input = {
  next_token: string option;
   (**{|
    The next item following a partial list of returned resources. For
    example, if a request is made to return [maxResults] number of resources,
    [NextToken] allows you to return more items in your list starting at the
    location pointed to by the next token.|}*)

  max_results: int option;
   (**{|
    The maximum number of virtual machines to list.|}*)

  hypervisor_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor connected to your
    virtual machine.|}*)

}

type list_tags_for_resource_output = {
  tags: tag list option;
   (**{|
    A list of the resource's tags.|}*)

  resource_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the resource's tags that you listed.|}*)

}

type list_tags_for_resource_input = {
  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource's tags to list.|}*)

}

type hypervisor_state = | PENDING
  | ONLINE
  | OFFLINE
  | ERROR

(**{|
    Represents the hypervisor's permissions to which the gateway will connect.
    
    A hypervisor is hardware, software, or firmware that creates and manages
    virtual machines, and allocates resources to them.|}*)
type hypervisor = {
  state: hypervisor_state option;
   (**{|
    The state of the hypervisor.|}*)

  name: string option;
   (**{|
    The name of the hypervisor.|}*)

  kms_key_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the Key Management Service used to
    encrypt the hypervisor.|}*)

  hypervisor_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor.|}*)

  host: string option;
   (**{|
    The server host of the hypervisor. This can be either an IP address or a
    fully-qualified domain name (FQDN).|}*)

}

type list_hypervisors_output = {
  next_token: string option;
   (**{|
    The next item following a partial list of returned resources. For
    example, if a request is made to return [maxResults] number of resources,
    [NextToken] allows you to return more items in your list starting at the
    location pointed to by the next token.|}*)

  hypervisors: hypervisor list option;
   (**{|
    A list of your [Hypervisor] objects, ordered by their Amazon Resource
    Names (ARNs).|}*)

}

type list_hypervisors_input = {
  next_token: string option;
   (**{|
    The next item following a partial list of returned resources. For
    example, if a request is made to return [maxResults] number of resources,
    [NextToken] allows you to return more items in your list starting at the
    location pointed to by the next token.|}*)

  max_results: int option;
   (**{|
    The maximum number of hypervisors to list.|}*)

}

type gateway_type = | BACKUP_VM

(**{|
    A gateway is an Backup Gateway appliance that runs on the customer's
    network to provide seamless connectivity to backup storage in the Amazon
    Web Services Cloud.|}*)
type gateway = {
  last_seen_time: float option;
   (**{|
    The last time Backup gateway communicated with the gateway, in Unix
    format and UTC time.|}*)

  hypervisor_id: string option;
   (**{|
    The hypervisor ID of the gateway.|}*)

  gateway_type: gateway_type option;
   (**{|
    The type of the gateway.|}*)

  gateway_display_name: string option;
   (**{|
    The display name of the gateway.|}*)

  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways]
    operation to return a list of gateways for your account and Amazon Web
    Services Region.|}*)

}

type list_gateways_output = {
  next_token: string option;
   (**{|
    The next item following a partial list of returned resources. For
    example, if a request is made to return [maxResults] number of resources,
    [NextToken] allows you to return more items in your list starting at the
    location pointed to by the next token.|}*)

  gateways: gateway list option;
   (**{|
    A list of your gateways.|}*)

}

type list_gateways_input = {
  next_token: string option;
   (**{|
    The next item following a partial list of returned resources. For
    example, if a request is made to return [MaxResults] number of resources,
    [NextToken] allows you to return more items in your list starting at the
    location pointed to by the next token.|}*)

  max_results: int option;
   (**{|
    The maximum number of gateways to list.|}*)

}

(**{|
    The operation did not succeed because an internal error occurred. Try
    again later.|}*)
type internal_server_exception = {
  message: string option;
  
  error_code: string option;
   (**{|
    A description of which internal error occured.|}*)

}

type import_hypervisor_configuration_output = {
  hypervisor_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor you disassociated.|}*)

}

type import_hypervisor_configuration_input = {
  tags: tag list option;
   (**{|
    The tags of the hypervisor configuration to import.|}*)

  kms_key_arn: string option;
   (**{|
    The Key Management Service for the hypervisor.|}*)

  password: string option;
   (**{|
    The password for the hypervisor.|}*)

  username: string option;
   (**{|
    The username for the hypervisor.|}*)

  host: string;
   (**{|
    The server host of the hypervisor. This can be either an IP address or a
    fully-qualified domain name (FQDN).|}*)

  name: string;
   (**{|
    The name of the hypervisor.|}*)

}

(**{|
    These are the details of the specified hypervisor. A hypervisor is
    hardware, software, or firmware that creates and manages virtual
    machines, and allocates resources to them.|}*)
type hypervisor_details = {
  latest_metadata_sync_status: sync_metadata_status option;
   (**{|
    This is the most recent status for the indicated metadata sync.|}*)

  latest_metadata_sync_status_message: string option;
   (**{|
    This is the most recent status for the indicated metadata sync.|}*)

  last_successful_metadata_sync_time: float option;
   (**{|
    This is the time when the most recent successful sync of metadata
    occurred.|}*)

  state: hypervisor_state option;
   (**{|
    This is the current state of the specified hypervisor.
    
    The possible states are [PENDING], [ONLINE], [OFFLINE], or [ERROR].|}*)

  log_group_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the group of gateways within the
    requested log.|}*)

  name: string option;
   (**{|
    This is the name of the specified hypervisor.|}*)

  kms_key_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the KMS used to encrypt the hypervisor.|}*)

  hypervisor_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor.|}*)

  host: string option;
   (**{|
    The server host of the hypervisor. This can be either an IP address or a
    fully-qualified domain name (FQDN).|}*)

}

type get_virtual_machine_output = {
  virtual_machine: virtual_machine_details option;
   (**{|
    This object contains the basic attributes of [VirtualMachine] contained
    by the output of [GetVirtualMachine]|}*)

}

type get_virtual_machine_input = {
  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the virtual machine.|}*)

}

type get_hypervisor_property_mappings_output = {
  iam_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM role.|}*)

  vmware_to_aws_tag_mappings: vmware_to_aws_tag_mapping list option;
   (**{|
    This is a display of the mappings of on-premises VMware tags to the
    Amazon Web Services tags.|}*)

  hypervisor_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor.|}*)

}

type get_hypervisor_property_mappings_input = {
  hypervisor_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor.|}*)

}

type get_hypervisor_output = {
  hypervisor: hypervisor_details option;
   (**{|
    Details about the requested hypervisor.|}*)

}

type get_hypervisor_input = {
  hypervisor_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor.|}*)

}

(**{|
    The details of gateway.|}*)
type gateway_details = {
  vpc_endpoint: string option;
   (**{|
    The DNS name for the virtual private cloud (VPC) endpoint the gateway
    uses to connect to the cloud for backup gateway.|}*)

  next_update_availability_time: float option;
   (**{|
    Details showing the next update availability time of the gateway.|}*)

  maintenance_start_time: maintenance_start_time option;
   (**{|
    Returns your gateway's weekly maintenance start time including the day
    and time of the week. Note that values are in terms of the gateway's time
    zone. Can be weekly or monthly.|}*)

  last_seen_time: float option;
   (**{|
    Details showing the last time Backup gateway communicated with the cloud,
    in Unix format and UTC time.|}*)

  hypervisor_id: string option;
   (**{|
    The hypervisor ID of the gateway.|}*)

  gateway_type: gateway_type option;
   (**{|
    The type of the gateway type.|}*)

  gateway_display_name: string option;
   (**{|
    The display name of the gateway.|}*)

  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways]
    operation to return a list of gateways for your account and Amazon Web
    Services Region.|}*)

}

type get_gateway_output = {
  gateway: gateway_details option;
   (**{|
    By providing the ARN (Amazon Resource Name), this API returns the gateway.|}*)

}

type get_gateway_input = {
  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the gateway.|}*)

}

type get_bandwidth_rate_limit_schedule_output = {
  bandwidth_rate_limit_intervals: bandwidth_rate_limit_interval list option;
   (**{|
    An array containing bandwidth rate limit schedule intervals for a
    gateway. When no bandwidth rate limit intervals have been scheduled, the
    array is empty.|}*)

  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the gateway. Use the
    {{: https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html }[ListGateways]}
    operation to return a list of gateways for your account and Amazon Web
    Services Region.|}*)

}

type get_bandwidth_rate_limit_schedule_input = {
  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the gateway. Use the
    {{: https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BGW_ListGateways.html }[ListGateways]}
    operation to return a list of gateways for your account and Amazon Web
    Services Region.|}*)

}

type disassociate_gateway_from_server_output = {
  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the gateway you disassociated.|}*)

}

type disassociate_gateway_from_server_input = {
  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the gateway to disassociate.|}*)

}

type delete_hypervisor_output = {
  hypervisor_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor you deleted.|}*)

}

type delete_hypervisor_input = {
  hypervisor_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the hypervisor to delete.|}*)

}

type delete_gateway_output = {
  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the gateway you deleted.|}*)

}

type delete_gateway_input = {
  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the gateway to delete.|}*)

}

type create_gateway_output = {
  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the gateway you create.|}*)

}

type create_gateway_input = {
  tags: tag list option;
   (**{|
    A list of up to 50 tags to assign to the gateway. Each tag is a key-value
    pair.|}*)

  gateway_type: gateway_type;
   (**{|
    The type of created gateway.|}*)

  gateway_display_name: string;
   (**{|
    The display name of the created gateway.|}*)

  activation_key: string;
   (**{|
    The activation key of the created gateway.|}*)

}

(**{|
    Backup
    gateway
    Backup gateway connects Backup to your hypervisor, so you can create,
    store, and restore backups of your virtual machines (VMs) anywhere,
    whether on-premises or in the VMware Cloud (VMC) on Amazon Web Services.
    
    Add on-premises resources by connecting to a hypervisor through a
    gateway. Backup will automatically discover the resources in your
    hypervisor.
    
    Use Backup to assign virtual or on-premises resources to a backup plan,
    or run on-demand backups. Once you have backed up your resources, you can
    view them and restore them like any resource supported by Backup.
    
    To download the Amazon Web Services software to get started, navigate to
    the Backup console, choose {b Gateways}, then choose {b Create gateway}.|}*)


type associate_gateway_to_server_output = {
  gateway_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of a gateway.|}*)

}

type associate_gateway_to_server_input = {
  server_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the server that hosts your virtual
    machines.|}*)

  gateway_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways]
    operation to return a list of gateways for your account and Amazon Web
    Services Region.|}*)

}

type base_document = Json.t

(** {1:builders Builders} *)

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

(** {1:operations Operations} *)

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

