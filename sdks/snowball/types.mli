open Smaws_Lib
val service : Service.descriptor

type wireless_connection = {
  is_wifi_enabled: bool option
}

type update_long_term_pricing_result = unit

type update_long_term_pricing_request = {
  is_long_term_pricing_auto_renew: bool option;
  replacement_job: string option;
  long_term_pricing_id: string
}

type invalid_resource_exception = {
  resource_type: string option;
  message: string option
}

type update_job_shipment_state_result = unit

type shipment_state = | RETURNED
  | RECEIVED

type update_job_shipment_state_request = {
  shipment_state: shipment_state;
  job_id: string
}

type invalid_job_state_exception = {
  message: string option
}

type update_job_result = unit

type job_state = | PENDING
  | LISTING
  | CANCELLED
  | COMPLETE
  | IN_PROGRESS
  | WITH_AWS
  | WITH_AWS_SORTING_FACILITY
  | IN_TRANSIT_TO_AWS
  | WITH_CUSTOMER
  | IN_TRANSIT_TO_CUSTOMER
  | PREPARING_SHIPMENT
  | PREPARING_APPLIANCE
  | NEW

type notification = {
  device_pickup_sns_topic_ar_n: string option;
  notify_all: bool option;
  job_states_to_notify: job_state list option;
  sns_topic_ar_n: string option
}

type key_range = {
  end_marker: string option;
  begin_marker: string option
}

type device_service_name = | S3_ON_DEVICE_SERVICE
  | NFS_ON_DEVICE_SERVICE

type transfer_option = | LOCAL_USE
  | EXPORT
  | IMPORT

type target_on_device_service = {
  transfer_option: transfer_option option;
  service_name: device_service_name option
}

type s3_resource = {
  target_on_device_services: target_on_device_service list option;
  key_range: key_range option;
  bucket_arn: string option
}

type event_trigger_definition = {
  event_resource_ar_n: string option
}

type lambda_resource = {
  event_triggers: event_trigger_definition list option;
  lambda_arn: string option
}

type ec2_ami_resource = {
  snowball_ami_id: string option;
  ami_id: string
}

type job_resource = {
  ec2_ami_resources: ec2_ami_resource list option;
  lambda_resources: lambda_resource list option;
  s3_resources: s3_resource list option
}

type storage_unit = | TB

type nfs_on_device_service_configuration = {
  storage_unit: storage_unit option;
  storage_limit: int option
}

type tgw_on_device_service_configuration = {
  storage_unit: storage_unit option;
  storage_limit: int option
}

type eks_on_device_service_configuration = {
  eks_anywhere_version: string option;
  kubernetes_version: string option
}

type s3_on_device_service_configuration = {
  fault_tolerance: int option;
  service_size: int option;
  storage_unit: storage_unit option;
  storage_limit: float option
}

type on_device_service_configuration = {
  s3_on_device_service: s3_on_device_service_configuration option;
  eks_on_device_service: eks_on_device_service_configuration option;
  tgw_on_device_service: tgw_on_device_service_configuration option;
  nfs_on_device_service: nfs_on_device_service_configuration option
}

type shipping_option = | STANDARD
  | EXPRESS
  | NEXT_DAY
  | SECOND_DAY

type snowball_capacity = | T13
  | T240
  | NO_PREFERENCE
  | T32
  | T14
  | T8
  | T98
  | T42
  | T100
  | T80
  | T50

type pickup_details = {
  device_pickup_id: string option;
  identification_issuing_org: string option;
  identification_expiration_date: float option;
  identification_number: string option;
  email: string option;
  phone_number: string option;
  name: string option
}

type update_job_request = {
  pickup_details: pickup_details option;
  forwarding_address_id: string option;
  snowball_capacity_preference: snowball_capacity option;
  description: string option;
  shipping_option: shipping_option option;
  address_id: string option;
  on_device_service_configuration: on_device_service_configuration option;
  resources: job_resource option;
  notification: notification option;
  role_ar_n: string option;
  job_id: string
}

type kms_request_failed_exception = {
  message: string option
}

type invalid_input_combination_exception = {
  message: string option
}

type ec2_request_failed_exception = {
  message: string option
}

type cluster_limit_exceeded_exception = {
  message: string option
}

type update_cluster_result = unit

type update_cluster_request = {
  forwarding_address_id: string option;
  notification: notification option;
  shipping_option: shipping_option option;
  address_id: string option;
  on_device_service_configuration: on_device_service_configuration option;
  resources: job_resource option;
  description: string option;
  role_ar_n: string option;
  cluster_id: string
}

type unsupported_address_exception = {
  message: string option
}

type ind_tax_documents = {
  gsti_n: string option
}

type tax_documents = {
  in_d: ind_tax_documents option
}

type snowcone_device_configuration = {
  wireless_connection: wireless_connection option
}

type snowball_type = | RACK_5U_C
  | V3_5S
  | V3_5C
  | SNC1_SSD
  | SNC1_HDD
  | EDGE_S
  | EDGE_CG
  | EDGE_C
  | EDGE
  | STANDARD

type shipping_label_status = | FAILED
  | SUCCEEDED
  | TIMED_OUT
  | IN_PROGRESS

type shipment = {
  tracking_number: string option;
  status: string option
}

type shipping_details = {
  outbound_shipment: shipment option;
  inbound_shipment: shipment option;
  shipping_option: shipping_option option
}

type service_version = {
  version: string option
}

type service_name = | EKS_ANYWHERE
  | KUBERNETES

type return_shipping_label_already_exists_exception = {
  message: string option
}

type remote_management = | NOT_INSTALLED
  | INSTALLED_AUTOSTART
  | INSTALLED_ONLY

type long_term_pricing_type = | ONE_MONTH
  | THREE_YEAR
  | ONE_YEAR

type long_term_pricing_list_entry = {
  job_ids: string list option;
  snowball_type: snowball_type option;
  long_term_pricing_status: string option;
  is_long_term_pricing_auto_renew: bool option;
  replacement_job: string option;
  current_active_job: string option;
  long_term_pricing_type: long_term_pricing_type option;
  long_term_pricing_start_date: float option;
  long_term_pricing_end_date: float option;
  long_term_pricing_id: string option
}

type dependent_service = {
  service_version: service_version option;
  service_name: service_name option
}

type list_service_versions_result = {
  next_token: string option;
  dependent_services: dependent_service list option;
  service_name: service_name;
  service_versions: service_version list
}

type list_service_versions_request = {
  next_token: string option;
  max_results: int option;
  dependent_services: dependent_service list option;
  service_name: service_name
}

type invalid_next_token_exception = {
  message: string option
}

type address_type = | AWS_SHIP
  | CUST_PICKUP

type address = {
  type_: address_type option;
  is_restricted: bool option;
  phone_number: string option;
  postal_code: string option;
  country: string option;
  landmark: string option;
  prefecture_or_district: string option;
  state_or_province: string option;
  city: string option;
  street3: string option;
  street2: string option;
  street1: string option;
  company: string option;
  name: string option;
  address_id: string option
}

type list_pickup_locations_result = {
  next_token: string option;
  addresses: address list option
}

type list_pickup_locations_request = {
  next_token: string option;
  max_results: int option
}

type list_long_term_pricing_result = {
  next_token: string option;
  long_term_pricing_entries: long_term_pricing_list_entry list option
}

type list_long_term_pricing_request = {
  next_token: string option;
  max_results: int option
}

type job_type = | LOCAL_USE
  | EXPORT
  | IMPORT

type job_list_entry = {
  description: string option;
  creation_date: float option;
  snowball_type: snowball_type option;
  job_type: job_type option;
  is_master: bool option;
  job_state: job_state option;
  job_id: string option
}

type list_jobs_result = {
  next_token: string option;
  job_list_entries: job_list_entry list option
}

type list_jobs_request = {
  next_token: string option;
  max_results: int option
}

type compatible_image = {
  name: string option;
  ami_id: string option
}

type list_compatible_images_result = {
  next_token: string option;
  compatible_images: compatible_image list option
}

type list_compatible_images_request = {
  next_token: string option;
  max_results: int option
}

type cluster_state = | CANCELLED
  | COMPLETE
  | IN_USE
  | PENDING
  | AWAITING_QUORUM

type cluster_list_entry = {
  description: string option;
  creation_date: float option;
  cluster_state: cluster_state option;
  cluster_id: string option
}

type list_clusters_result = {
  next_token: string option;
  cluster_list_entries: cluster_list_entry list option
}

type list_clusters_request = {
  next_token: string option;
  max_results: int option
}

type list_cluster_jobs_result = {
  next_token: string option;
  job_list_entries: job_list_entry list option
}

type list_cluster_jobs_request = {
  next_token: string option;
  max_results: int option;
  cluster_id: string
}

type data_transfer = {
  total_objects: int option;
  total_bytes: int option;
  objects_transferred: int option;
  bytes_transferred: int option
}

type job_logs = {
  job_failure_log_ur_i: string option;
  job_success_log_ur_i: string option;
  job_completion_report_ur_i: string option
}

type device_configuration = {
  snowcone_device_configuration: snowcone_device_configuration option
}

type impact_level = | IL99
  | IL6
  | IL5
  | IL4
  | IL2

type job_metadata = {
  snowball_id: string option;
  pickup_details: pickup_details option;
  impact_level: impact_level option;
  on_device_service_configuration: on_device_service_configuration option;
  long_term_pricing_id: string option;
  remote_management: remote_management option;
  device_configuration: device_configuration option;
  tax_documents: tax_documents option;
  forwarding_address_id: string option;
  cluster_id: string option;
  job_log_info: job_logs option;
  data_transfer_progress: data_transfer option;
  notification: notification option;
  snowball_capacity_preference: snowball_capacity option;
  shipping_details: shipping_details option;
  address_id: string option;
  role_ar_n: string option;
  kms_key_ar_n: string option;
  description: string option;
  resources: job_resource option;
  creation_date: float option;
  snowball_type: snowball_type option;
  job_type: job_type option;
  job_state: job_state option;
  job_id: string option
}

type invalid_address_exception = {
  message: string option
}

type get_software_updates_result = {
  updates_ur_i: string option
}

type get_software_updates_request = {
  job_id: string
}

type get_snowball_usage_result = {
  snowballs_in_use: int option;
  snowball_limit: int option
}

type get_snowball_usage_request = unit

type get_job_unlock_code_result = {
  unlock_code: string option
}

type get_job_unlock_code_request = {
  job_id: string
}

type get_job_manifest_result = {
  manifest_ur_i: string option
}

type get_job_manifest_request = {
  job_id: string
}

type describe_return_shipping_label_result = {
  return_shipping_label_ur_i: string option;
  expiration_date: float option;
  status: shipping_label_status option
}

type describe_return_shipping_label_request = {
  job_id: string
}

type conflict_exception = {
  message: string option;
  conflict_resource: string option
}

type describe_job_result = {
  sub_job_metadata: job_metadata list option;
  job_metadata: job_metadata option
}

type describe_job_request = {
  job_id: string
}

type cluster_metadata = {
  on_device_service_configuration: on_device_service_configuration option;
  tax_documents: tax_documents option;
  forwarding_address_id: string option;
  notification: notification option;
  shipping_option: shipping_option option;
  address_id: string option;
  resources: job_resource option;
  creation_date: float option;
  snowball_type: snowball_type option;
  job_type: job_type option;
  cluster_state: cluster_state option;
  role_ar_n: string option;
  kms_key_ar_n: string option;
  description: string option;
  cluster_id: string option
}

type describe_cluster_result = {
  cluster_metadata: cluster_metadata option
}

type describe_cluster_request = {
  cluster_id: string
}

type describe_addresses_result = {
  next_token: string option;
  addresses: address list option
}

type describe_addresses_request = {
  next_token: string option;
  max_results: int option
}

type describe_address_result = {
  address: address option
}

type describe_address_request = {
  address_id: string
}

type create_return_shipping_label_result = {
  status: shipping_label_status option
}

type create_return_shipping_label_request = {
  shipping_option: shipping_option option;
  job_id: string
}

type create_long_term_pricing_result = {
  long_term_pricing_id: string option
}

type create_long_term_pricing_request = {
  snowball_type: snowball_type;
  is_long_term_pricing_auto_renew: bool option;
  long_term_pricing_type: long_term_pricing_type
}

type create_job_result = {
  job_id: string option
}

type create_job_request = {
  pickup_details: pickup_details option;
  impact_level: impact_level option;
  long_term_pricing_id: string option;
  remote_management: remote_management option;
  device_configuration: device_configuration option;
  tax_documents: tax_documents option;
  forwarding_address_id: string option;
  snowball_type: snowball_type option;
  cluster_id: string option;
  notification: notification option;
  shipping_option: shipping_option option;
  snowball_capacity_preference: snowball_capacity option;
  role_ar_n: string option;
  kms_key_ar_n: string option;
  address_id: string option;
  description: string option;
  on_device_service_configuration: on_device_service_configuration option;
  resources: job_resource option;
  job_type: job_type option
}

type create_cluster_result = {
  job_list_entries: job_list_entry list option;
  cluster_id: string option
}

type create_cluster_request = {
  snowball_capacity_preference: snowball_capacity option;
  long_term_pricing_ids: string list option;
  force_create_jobs: bool option;
  initial_cluster_size: int option;
  remote_management: remote_management option;
  tax_documents: tax_documents option;
  forwarding_address_id: string option;
  notification: notification option;
  shipping_option: shipping_option;
  snowball_type: snowball_type;
  role_ar_n: string option;
  kms_key_ar_n: string option;
  address_id: string;
  description: string option;
  on_device_service_configuration: on_device_service_configuration option;
  resources: job_resource option;
  job_type: job_type
}

type create_address_result = {
  address_id: string option
}

type create_address_request = {
  address: address
}

type cancel_job_result = unit

type cancel_job_request = {
  job_id: string
}

type cancel_cluster_result = unit

type cancel_cluster_request = {
  cluster_id: string
}



type base_document = Json.t

