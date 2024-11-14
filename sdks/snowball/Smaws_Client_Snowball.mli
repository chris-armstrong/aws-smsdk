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

val make_wireless_connection :
  ?is_wifi_enabled:bool -> unit
-> wireless_connection

val make_update_long_term_pricing_result : unit
-> update_long_term_pricing_result

val make_update_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:bool ->
  ?replacement_job:string ->
  long_term_pricing_id:string ->
  unit
-> update_long_term_pricing_request

val make_update_job_shipment_state_result : unit
-> update_job_shipment_state_result

val make_update_job_shipment_state_request :
  shipment_state:shipment_state -> job_id:string -> unit
-> update_job_shipment_state_request

val make_update_job_result : unit -> update_job_result

val make_notification :
  ?device_pickup_sns_topic_ar_n:string ->
  ?notify_all:bool ->
  ?job_states_to_notify:job_state list ->
  ?sns_topic_ar_n:string ->
  unit -> notification

val make_key_range : ?end_marker:string -> ?begin_marker:string -> unit
-> key_range

val make_target_on_device_service :
  ?transfer_option:transfer_option ->
  ?service_name:device_service_name ->
  unit -> target_on_device_service

val make_s3_resource :
  ?target_on_device_services:target_on_device_service list ->
  ?key_range:key_range ->
  ?bucket_arn:string ->
  unit -> s3_resource

val make_event_trigger_definition : ?event_resource_ar_n:string -> unit
-> event_trigger_definition

val make_lambda_resource :
  ?event_triggers:event_trigger_definition list -> ?lambda_arn:string -> unit
-> lambda_resource

val make_ec2_ami_resource : ?snowball_ami_id:string -> ami_id:string -> unit
-> ec2_ami_resource

val make_job_resource :
  ?ec2_ami_resources:ec2_ami_resource list ->
  ?lambda_resources:lambda_resource list ->
  ?s3_resources:s3_resource list ->
  unit -> job_resource

val make_nfs_on_device_service_configuration :
  ?storage_unit:storage_unit -> ?storage_limit:int -> unit
-> nfs_on_device_service_configuration

val make_tgw_on_device_service_configuration :
  ?storage_unit:storage_unit -> ?storage_limit:int -> unit
-> tgw_on_device_service_configuration

val make_eks_on_device_service_configuration :
  ?eks_anywhere_version:string -> ?kubernetes_version:string -> unit
-> eks_on_device_service_configuration

val make_s3_on_device_service_configuration :
  ?fault_tolerance:int ->
  ?service_size:int ->
  ?storage_unit:storage_unit ->
  ?storage_limit:float ->
  unit
-> s3_on_device_service_configuration

val make_on_device_service_configuration :
  ?s3_on_device_service:s3_on_device_service_configuration ->
  ?eks_on_device_service:eks_on_device_service_configuration ->
  ?tgw_on_device_service:tgw_on_device_service_configuration ->
  ?nfs_on_device_service:nfs_on_device_service_configuration ->
  unit -> on_device_service_configuration

val make_pickup_details :
  ?device_pickup_id:string ->
  ?identification_issuing_org:string ->
  ?identification_expiration_date:float ->
  ?identification_number:string ->
  ?email:string ->
  ?phone_number:string ->
  ?name:string ->
  unit -> pickup_details

val make_update_job_request :
  ?pickup_details:pickup_details ->
  ?forwarding_address_id:string ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?description:string ->
  ?shipping_option:shipping_option ->
  ?address_id:string ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  ?notification:notification ->
  ?role_ar_n:string ->
  job_id:string ->
  unit -> update_job_request

val make_update_cluster_result : unit
-> update_cluster_result

val make_update_cluster_request :
  ?forwarding_address_id:string ->
  ?notification:notification ->
  ?shipping_option:shipping_option ->
  ?address_id:string ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  ?description:string ->
  ?role_ar_n:string ->
  cluster_id:string ->
  unit -> update_cluster_request

val make_ind_tax_documents : ?gsti_n:string -> unit
-> ind_tax_documents

val make_tax_documents : ?in_d:ind_tax_documents -> unit
-> tax_documents

val make_snowcone_device_configuration :
  ?wireless_connection:wireless_connection -> unit
-> snowcone_device_configuration

val make_shipment : ?tracking_number:string -> ?status:string -> unit
-> shipment

val make_shipping_details :
  ?outbound_shipment:shipment ->
  ?inbound_shipment:shipment ->
  ?shipping_option:shipping_option ->
  unit -> shipping_details

val make_service_version : ?version:string -> unit
-> service_version

val make_long_term_pricing_list_entry :
  ?job_ids:string list ->
  ?snowball_type:snowball_type ->
  ?long_term_pricing_status:string ->
  ?is_long_term_pricing_auto_renew:bool ->
  ?replacement_job:string ->
  ?current_active_job:string ->
  ?long_term_pricing_type:long_term_pricing_type ->
  ?long_term_pricing_start_date:float ->
  ?long_term_pricing_end_date:float ->
  ?long_term_pricing_id:string ->
  unit -> long_term_pricing_list_entry

val make_dependent_service :
  ?service_version:service_version -> ?service_name:service_name -> unit
-> dependent_service

val make_list_service_versions_result :
  ?next_token:string ->
  ?dependent_services:dependent_service list ->
  service_name:service_name ->
  service_versions:service_version list ->
  unit
-> list_service_versions_result

val make_list_service_versions_request :
  ?next_token:string ->
  ?max_results:int ->
  ?dependent_services:dependent_service list ->
  service_name:service_name ->
  unit -> list_service_versions_request

val make_address :
  ?type_:address_type ->
  ?is_restricted:bool ->
  ?phone_number:string ->
  ?postal_code:string ->
  ?country:string ->
  ?landmark:string ->
  ?prefecture_or_district:string ->
  ?state_or_province:string ->
  ?city:string ->
  ?street3:string ->
  ?street2:string ->
  ?street1:string ->
  ?company:string ->
  ?name:string ->
  ?address_id:string ->
  unit -> address

val make_list_pickup_locations_result :
  ?next_token:string -> ?addresses:address list -> unit
-> list_pickup_locations_result

val make_list_pickup_locations_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_pickup_locations_request

val make_list_long_term_pricing_result :
  ?next_token:string ->
  ?long_term_pricing_entries:long_term_pricing_list_entry list ->
  unit
-> list_long_term_pricing_result

val make_list_long_term_pricing_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_long_term_pricing_request

val make_job_list_entry :
  ?description:string ->
  ?creation_date:float ->
  ?snowball_type:snowball_type ->
  ?job_type:job_type ->
  ?is_master:bool ->
  ?job_state:job_state ->
  ?job_id:string ->
  unit -> job_list_entry

val make_list_jobs_result :
  ?next_token:string -> ?job_list_entries:job_list_entry list -> unit
-> list_jobs_result

val make_list_jobs_request : ?next_token:string -> ?max_results:int -> unit
-> list_jobs_request

val make_compatible_image : ?name:string -> ?ami_id:string -> unit
-> compatible_image

val make_list_compatible_images_result :
  ?next_token:string -> ?compatible_images:compatible_image list -> unit
-> list_compatible_images_result

val make_list_compatible_images_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_compatible_images_request

val make_cluster_list_entry :
  ?description:string ->
  ?creation_date:float ->
  ?cluster_state:cluster_state ->
  ?cluster_id:string ->
  unit -> cluster_list_entry

val make_list_clusters_result :
  ?next_token:string -> ?cluster_list_entries:cluster_list_entry list -> unit
-> list_clusters_result

val make_list_clusters_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_clusters_request

val make_list_cluster_jobs_result :
  ?next_token:string -> ?job_list_entries:job_list_entry list -> unit
-> list_cluster_jobs_result

val make_list_cluster_jobs_request :
  ?next_token:string -> ?max_results:int -> cluster_id:string -> unit
-> list_cluster_jobs_request

val make_data_transfer :
  ?total_objects:int ->
  ?total_bytes:int ->
  ?objects_transferred:int ->
  ?bytes_transferred:int ->
  unit -> data_transfer

val make_job_logs :
  ?job_failure_log_ur_i:string ->
  ?job_success_log_ur_i:string ->
  ?job_completion_report_ur_i:string ->
  unit -> job_logs

val make_device_configuration :
  ?snowcone_device_configuration:snowcone_device_configuration -> unit
-> device_configuration

val make_job_metadata :
  ?snowball_id:string ->
  ?pickup_details:pickup_details ->
  ?impact_level:impact_level ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?long_term_pricing_id:string ->
  ?remote_management:remote_management ->
  ?device_configuration:device_configuration ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:string ->
  ?cluster_id:string ->
  ?job_log_info:job_logs ->
  ?data_transfer_progress:data_transfer ->
  ?notification:notification ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?shipping_details:shipping_details ->
  ?address_id:string ->
  ?role_ar_n:string ->
  ?kms_key_ar_n:string ->
  ?description:string ->
  ?resources:job_resource ->
  ?creation_date:float ->
  ?snowball_type:snowball_type ->
  ?job_type:job_type ->
  ?job_state:job_state ->
  ?job_id:string ->
  unit -> job_metadata

val make_get_software_updates_result : ?updates_ur_i:string -> unit
-> get_software_updates_result

val make_get_software_updates_request : job_id:string -> unit
-> get_software_updates_request

val make_get_snowball_usage_result :
  ?snowballs_in_use:int -> ?snowball_limit:int -> unit
-> get_snowball_usage_result

val make_get_snowball_usage_request : unit
-> get_snowball_usage_request

val make_get_job_unlock_code_result : ?unlock_code:string -> unit
-> get_job_unlock_code_result

val make_get_job_unlock_code_request : job_id:string -> unit
-> get_job_unlock_code_request

val make_get_job_manifest_result : ?manifest_ur_i:string -> unit
-> get_job_manifest_result

val make_get_job_manifest_request : job_id:string -> unit
-> get_job_manifest_request

val make_describe_return_shipping_label_result :
  ?return_shipping_label_ur_i:string ->
  ?expiration_date:float ->
  ?status:shipping_label_status ->
  unit
-> describe_return_shipping_label_result

val make_describe_return_shipping_label_request : job_id:string -> unit
-> describe_return_shipping_label_request

val make_describe_job_result :
  ?sub_job_metadata:job_metadata list -> ?job_metadata:job_metadata -> unit
-> describe_job_result

val make_describe_job_request : job_id:string -> unit
-> describe_job_request

val make_cluster_metadata :
  ?on_device_service_configuration:on_device_service_configuration ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:string ->
  ?notification:notification ->
  ?shipping_option:shipping_option ->
  ?address_id:string ->
  ?resources:job_resource ->
  ?creation_date:float ->
  ?snowball_type:snowball_type ->
  ?job_type:job_type ->
  ?cluster_state:cluster_state ->
  ?role_ar_n:string ->
  ?kms_key_ar_n:string ->
  ?description:string ->
  ?cluster_id:string ->
  unit -> cluster_metadata

val make_describe_cluster_result : ?cluster_metadata:cluster_metadata -> unit
-> describe_cluster_result

val make_describe_cluster_request : cluster_id:string -> unit
-> describe_cluster_request

val make_describe_addresses_result :
  ?next_token:string -> ?addresses:address list -> unit
-> describe_addresses_result

val make_describe_addresses_request :
  ?next_token:string -> ?max_results:int -> unit
-> describe_addresses_request

val make_describe_address_result : ?address:address -> unit
-> describe_address_result

val make_describe_address_request : address_id:string -> unit
-> describe_address_request

val make_create_return_shipping_label_result :
  ?status:shipping_label_status -> unit
-> create_return_shipping_label_result

val make_create_return_shipping_label_request :
  ?shipping_option:shipping_option -> job_id:string -> unit
-> create_return_shipping_label_request

val make_create_long_term_pricing_result :
  ?long_term_pricing_id:string -> unit
-> create_long_term_pricing_result

val make_create_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:bool ->
  snowball_type:snowball_type ->
  long_term_pricing_type:long_term_pricing_type ->
  unit -> create_long_term_pricing_request

val make_create_job_result : ?job_id:string -> unit
-> create_job_result

val make_create_job_request :
  ?pickup_details:pickup_details ->
  ?impact_level:impact_level ->
  ?long_term_pricing_id:string ->
  ?remote_management:remote_management ->
  ?device_configuration:device_configuration ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:string ->
  ?snowball_type:snowball_type ->
  ?cluster_id:string ->
  ?notification:notification ->
  ?shipping_option:shipping_option ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?role_ar_n:string ->
  ?kms_key_ar_n:string ->
  ?address_id:string ->
  ?description:string ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  ?job_type:job_type ->
  unit -> create_job_request

val make_create_cluster_result :
  ?job_list_entries:job_list_entry list -> ?cluster_id:string -> unit
-> create_cluster_result

val make_create_cluster_request :
  ?snowball_capacity_preference:snowball_capacity ->
  ?long_term_pricing_ids:string list ->
  ?force_create_jobs:bool ->
  ?initial_cluster_size:int ->
  ?remote_management:remote_management ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:string ->
  ?notification:notification ->
  ?role_ar_n:string ->
  ?kms_key_ar_n:string ->
  ?description:string ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  shipping_option:shipping_option ->
  snowball_type:snowball_type ->
  address_id:string ->
  job_type:job_type ->
  unit -> create_cluster_request

val make_create_address_result : ?address_id:string -> unit
-> create_address_result

val make_create_address_request : address:address -> unit
-> create_address_request

val make_cancel_job_result : unit
-> cancel_job_result

val make_cancel_job_request : job_id:string -> unit
-> cancel_job_request

val make_cancel_cluster_result : unit
-> cancel_cluster_result

val make_cancel_cluster_request : cluster_id:string -> unit
-> cancel_cluster_request

module UpdateLongTermPricing : sig
  val request :
    Smaws_Lib.Context.t ->
      update_long_term_pricing_request ->
        (update_long_term_pricing_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module UpdateJobShipmentState : sig
  val request :
    Smaws_Lib.Context.t ->
      update_job_shipment_state_request ->
        (update_job_shipment_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module UpdateJob : sig
  val request :
    Smaws_Lib.Context.t ->
      update_job_request ->
        (update_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterLimitExceededException of cluster_limit_exceeded_exception
            | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module UpdateCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      update_cluster_request ->
        (update_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module ListServiceVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_service_versions_request ->
        (list_service_versions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module ListPickupLocations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_pickup_locations_request ->
        (list_pickup_locations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module ListLongTermPricing : sig
  val request :
    Smaws_Lib.Context.t ->
      list_long_term_pricing_request ->
        (list_long_term_pricing_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module ListJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_jobs_request ->
        (list_jobs_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
end

module ListCompatibleImages : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compatible_images_request ->
        (list_compatible_images_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
end

module ListClusters : sig
  val request :
    Smaws_Lib.Context.t ->
      list_clusters_request ->
        (list_clusters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
end

module ListClusterJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_cluster_jobs_request ->
        (list_cluster_jobs_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module GetSoftwareUpdates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_software_updates_request ->
        (get_software_updates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module GetSnowballUsage : sig
  val request :
    Smaws_Lib.Context.t ->
      get_snowball_usage_request ->
        (get_snowball_usage_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module GetJobUnlockCode : sig
  val request :
    Smaws_Lib.Context.t ->
      get_job_unlock_code_request ->
        (get_job_unlock_code_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module GetJobManifest : sig
  val request :
    Smaws_Lib.Context.t ->
      get_job_manifest_request ->
        (get_job_manifest_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module DescribeReturnShippingLabel : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_return_shipping_label_request ->
        (describe_return_shipping_label_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module DescribeJob : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_job_request ->
        (describe_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module DescribeCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_cluster_request ->
        (describe_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module DescribeAddresses : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_addresses_request ->
        (describe_addresses_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module DescribeAddress : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_address_request ->
        (describe_address_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module CreateReturnShippingLabel : sig
  val request :
    Smaws_Lib.Context.t ->
      create_return_shipping_label_request ->
        (create_return_shipping_label_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ReturnShippingLabelAlreadyExistsException of return_shipping_label_already_exists_exception
            
        ]
      ) result
end

module CreateLongTermPricing : sig
  val request :
    Smaws_Lib.Context.t ->
      create_long_term_pricing_request ->
        (create_long_term_pricing_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidResourceException of invalid_resource_exception
            
        ]
      ) result
end

module CreateJob : sig
  val request :
    Smaws_Lib.Context.t ->
      create_job_request ->
        (create_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClusterLimitExceededException of cluster_limit_exceeded_exception
            | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module CreateCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      create_cluster_request ->
        (create_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `Ec2RequestFailedException of ec2_request_failed_exception
            | `InvalidInputCombinationException of invalid_input_combination_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module CreateAddress : sig
  val request :
    Smaws_Lib.Context.t ->
      create_address_request ->
        (create_address_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidAddressException of invalid_address_exception
            | `UnsupportedAddressException of unsupported_address_exception
            
        ]
      ) result
end

module CancelJob : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_job_request ->
        (cancel_job_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

module CancelCluster : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_cluster_request ->
        (cancel_cluster_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidJobStateException of invalid_job_state_exception
            | `InvalidResourceException of invalid_resource_exception
            | `KMSRequestFailedException of kms_request_failed_exception
            
        ]
      ) result
end

