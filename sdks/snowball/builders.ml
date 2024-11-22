[@@@warning "-39"]
open Types
let make_wireless_connection  ?(is_wifi_enabled : bool option) ()
: wireless_connection = { is_wifi_enabled; 
}

let make_update_long_term_pricing_result  ()
: update_long_term_pricing_result =
()

let make_update_long_term_pricing_request 
  ?(is_long_term_pricing_auto_renew : bool option)
  ?(replacement_job : string option)
  ~(long_term_pricing_id : string)
  () : update_long_term_pricing_request = {
  is_long_term_pricing_auto_renew; replacement_job; long_term_pricing_id; 
}

let make_update_job_shipment_state_result  ()
: update_job_shipment_state_result =
()

let make_update_job_shipment_state_request 
  ~(shipment_state : shipment_state) ~(job_id : string) ()
: update_job_shipment_state_request = { shipment_state; job_id; 
}

let make_update_job_result  () : update_job_result = ()

let make_notification 
  ?(device_pickup_sns_topic_ar_n : string option)
  ?(notify_all : bool option)
  ?(job_states_to_notify : job_state list option)
  ?(sns_topic_ar_n : string option)
  () : notification = {
  device_pickup_sns_topic_ar_n;
  notify_all;
  job_states_to_notify;
  sns_topic_ar_n;
   }

let make_key_range 
  ?(end_marker : string option) ?(begin_marker : string option) ()
: key_range = { end_marker; begin_marker; 
}

let make_target_on_device_service 
  ?(transfer_option : transfer_option option)
  ?(service_name : device_service_name option)
  () : target_on_device_service = { transfer_option; service_name; 
}

let make_s3_resource 
  ?(target_on_device_services : target_on_device_service list option)
  ?(key_range : key_range option)
  ?(bucket_arn : string option)
  () : s3_resource = { target_on_device_services; key_range; bucket_arn; 
}

let make_event_trigger_definition  ?(event_resource_ar_n : string option) ()
: event_trigger_definition = { event_resource_ar_n; 
}

let make_lambda_resource 
  ?(event_triggers : event_trigger_definition list option)
  ?(lambda_arn : string option)
  () : lambda_resource = { event_triggers; lambda_arn; 
}

let make_ec2_ami_resource 
  ?(snowball_ami_id : string option) ~(ami_id : string) () : ec2_ami_resource
= { snowball_ami_id; ami_id;  }

let make_job_resource 
  ?(ec2_ami_resources : ec2_ami_resource list option)
  ?(lambda_resources : lambda_resource list option)
  ?(s3_resources : s3_resource list option)
  () : job_resource = { ec2_ami_resources; lambda_resources; s3_resources; 
}

let make_nfs_on_device_service_configuration 
  ?(storage_unit : storage_unit option) ?(storage_limit : int option) ()
: nfs_on_device_service_configuration = { storage_unit; storage_limit; 
}

let make_tgw_on_device_service_configuration 
  ?(storage_unit : storage_unit option) ?(storage_limit : int option) ()
: tgw_on_device_service_configuration = { storage_unit; storage_limit; 
}

let make_eks_on_device_service_configuration 
  ?(eks_anywhere_version : string option)
  ?(kubernetes_version : string option)
  () : eks_on_device_service_configuration = {
  eks_anywhere_version; kubernetes_version; 
}

let make_s3_on_device_service_configuration 
  ?(fault_tolerance : int option)
  ?(service_size : int option)
  ?(storage_unit : storage_unit option)
  ?(storage_limit : float option)
  () : s3_on_device_service_configuration = {
  fault_tolerance; service_size; storage_unit; storage_limit; 
}

let make_on_device_service_configuration 
  ?(s3_on_device_service : s3_on_device_service_configuration option)
  ?(eks_on_device_service : eks_on_device_service_configuration option)
  ?(tgw_on_device_service : tgw_on_device_service_configuration option)
  ?(nfs_on_device_service : nfs_on_device_service_configuration option)
  () : on_device_service_configuration = {
  s3_on_device_service;
  eks_on_device_service;
  tgw_on_device_service;
  nfs_on_device_service;
   }

let make_pickup_details 
  ?(device_pickup_id : string option)
  ?(identification_issuing_org : string option)
  ?(identification_expiration_date : float option)
  ?(identification_number : string option)
  ?(email : string option)
  ?(phone_number : string option)
  ?(name : string option)
  () : pickup_details = {
  device_pickup_id;
  identification_issuing_org;
  identification_expiration_date;
  identification_number;
  email;
  phone_number;
  name;
   }

let make_update_job_request 
  ?(pickup_details : pickup_details option)
  ?(forwarding_address_id : string option)
  ?(snowball_capacity_preference : snowball_capacity option)
  ?(description : string option)
  ?(shipping_option : shipping_option option)
  ?(address_id : string option)
  ?(on_device_service_configuration : on_device_service_configuration option)
  ?(resources : job_resource option)
  ?(notification : notification option)
  ?(role_ar_n : string option)
  ~(job_id : string)
  () : update_job_request = {
  pickup_details;
  forwarding_address_id;
  snowball_capacity_preference;
  description;
  shipping_option;
  address_id;
  on_device_service_configuration;
  resources;
  notification;
  role_ar_n;
  job_id;
   }

let make_update_cluster_result  () : update_cluster_result =
()

let make_update_cluster_request 
  ?(forwarding_address_id : string option)
  ?(notification : notification option)
  ?(shipping_option : shipping_option option)
  ?(address_id : string option)
  ?(on_device_service_configuration : on_device_service_configuration option)
  ?(resources : job_resource option)
  ?(description : string option)
  ?(role_ar_n : string option)
  ~(cluster_id : string)
  () : update_cluster_request = {
  forwarding_address_id;
  notification;
  shipping_option;
  address_id;
  on_device_service_configuration;
  resources;
  description;
  role_ar_n;
  cluster_id;
   }

let make_ind_tax_documents  ?(gsti_n : string option) () : ind_tax_documents
= { gsti_n;  }

let make_tax_documents  ?(in_d : ind_tax_documents option) () : tax_documents
= { in_d;  }

let make_snowcone_device_configuration 
  ?(wireless_connection : wireless_connection option) ()
: snowcone_device_configuration = { wireless_connection;  }

let make_shipment 
  ?(tracking_number : string option) ?(status : string option) () : shipment
= { tracking_number; status;  }

let make_shipping_details 
  ?(outbound_shipment : shipment option)
  ?(inbound_shipment : shipment option)
  ?(shipping_option : shipping_option option)
  () : shipping_details = {
  outbound_shipment; inbound_shipment; shipping_option; 
}

let make_service_version  ?(version : string option) () : service_version = {
  version;  }

let make_long_term_pricing_list_entry 
  ?(job_ids : string list option)
  ?(snowball_type : snowball_type option)
  ?(long_term_pricing_status : string option)
  ?(is_long_term_pricing_auto_renew : bool option)
  ?(replacement_job : string option)
  ?(current_active_job : string option)
  ?(long_term_pricing_type : long_term_pricing_type option)
  ?(long_term_pricing_start_date : float option)
  ?(long_term_pricing_end_date : float option)
  ?(long_term_pricing_id : string option)
  () : long_term_pricing_list_entry = {
  job_ids;
  snowball_type;
  long_term_pricing_status;
  is_long_term_pricing_auto_renew;
  replacement_job;
  current_active_job;
  long_term_pricing_type;
  long_term_pricing_start_date;
  long_term_pricing_end_date;
  long_term_pricing_id;
   }

let make_dependent_service 
  ?(service_version : service_version option)
  ?(service_name : service_name option)
  () : dependent_service = { service_version; service_name; 
}

let make_list_service_versions_result 
  ?(next_token : string option)
  ?(dependent_services : dependent_service list option)
  ~(service_name : service_name)
  ~(service_versions : service_version list)
  () : list_service_versions_result = {
  next_token; dependent_services; service_name; service_versions; 
}

let make_list_service_versions_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(dependent_services : dependent_service list option)
  ~(service_name : service_name)
  () : list_service_versions_request = {
  next_token; max_results; dependent_services; service_name; 
}

let make_address 
  ?(type_ : address_type option)
  ?(is_restricted : bool option)
  ?(phone_number : string option)
  ?(postal_code : string option)
  ?(country : string option)
  ?(landmark : string option)
  ?(prefecture_or_district : string option)
  ?(state_or_province : string option)
  ?(city : string option)
  ?(street3 : string option)
  ?(street2 : string option)
  ?(street1 : string option)
  ?(company : string option)
  ?(name : string option)
  ?(address_id : string option)
  () : address = {
  type_;
  is_restricted;
  phone_number;
  postal_code;
  country;
  landmark;
  prefecture_or_district;
  state_or_province;
  city;
  street3;
  street2;
  street1;
  company;
  name;
  address_id;
   }

let make_list_pickup_locations_result 
  ?(next_token : string option) ?(addresses : address list option) ()
: list_pickup_locations_result = { next_token; addresses; 
}

let make_list_pickup_locations_request 
  ?(next_token : string option) ?(max_results : int option) ()
: list_pickup_locations_request = { next_token; max_results; 
}

let make_list_long_term_pricing_result 
  ?(next_token : string option)
  ?(long_term_pricing_entries : long_term_pricing_list_entry list option)
  () : list_long_term_pricing_result = {
  next_token; long_term_pricing_entries; 
}

let make_list_long_term_pricing_request 
  ?(next_token : string option) ?(max_results : int option) ()
: list_long_term_pricing_request = { next_token; max_results; 
}

let make_job_list_entry 
  ?(description : string option)
  ?(creation_date : float option)
  ?(snowball_type : snowball_type option)
  ?(job_type : job_type option)
  ?(is_master : bool option)
  ?(job_state : job_state option)
  ?(job_id : string option)
  () : job_list_entry = {
  description;
  creation_date;
  snowball_type;
  job_type;
  is_master;
  job_state;
  job_id;
   }

let make_list_jobs_result 
  ?(next_token : string option)
  ?(job_list_entries : job_list_entry list option)
  () : list_jobs_result = { next_token; job_list_entries; 
}

let make_list_jobs_request 
  ?(next_token : string option) ?(max_results : int option) ()
: list_jobs_request = { next_token; max_results;  }

let make_compatible_image 
  ?(name : string option) ?(ami_id : string option) () : compatible_image = {
  name; ami_id;  }

let make_list_compatible_images_result 
  ?(next_token : string option)
  ?(compatible_images : compatible_image list option)
  () : list_compatible_images_result = { next_token; compatible_images; 
}

let make_list_compatible_images_request 
  ?(next_token : string option) ?(max_results : int option) ()
: list_compatible_images_request = { next_token; max_results; 
}

let make_cluster_list_entry 
  ?(description : string option)
  ?(creation_date : float option)
  ?(cluster_state : cluster_state option)
  ?(cluster_id : string option)
  () : cluster_list_entry = {
  description; creation_date; cluster_state; cluster_id; 
}

let make_list_clusters_result 
  ?(next_token : string option)
  ?(cluster_list_entries : cluster_list_entry list option)
  () : list_clusters_result = { next_token; cluster_list_entries; 
}

let make_list_clusters_request 
  ?(next_token : string option) ?(max_results : int option) ()
: list_clusters_request = { next_token; max_results; 
}

let make_list_cluster_jobs_result 
  ?(next_token : string option)
  ?(job_list_entries : job_list_entry list option)
  () : list_cluster_jobs_result = { next_token; job_list_entries; 
}

let make_list_cluster_jobs_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(cluster_id : string)
  () : list_cluster_jobs_request = { next_token; max_results; cluster_id; 
}

let make_data_transfer 
  ?(total_objects : int option)
  ?(total_bytes : int option)
  ?(objects_transferred : int option)
  ?(bytes_transferred : int option)
  () : data_transfer = {
  total_objects; total_bytes; objects_transferred; bytes_transferred; 
}

let make_job_logs 
  ?(job_failure_log_ur_i : string option)
  ?(job_success_log_ur_i : string option)
  ?(job_completion_report_ur_i : string option)
  () : job_logs = {
  job_failure_log_ur_i; job_success_log_ur_i; job_completion_report_ur_i; 
}

let make_device_configuration 
  ?(snowcone_device_configuration : snowcone_device_configuration option) ()
: device_configuration = { snowcone_device_configuration; 
}

let make_job_metadata 
  ?(snowball_id : string option)
  ?(pickup_details : pickup_details option)
  ?(impact_level : impact_level option)
  ?(on_device_service_configuration : on_device_service_configuration option)
  ?(long_term_pricing_id : string option)
  ?(remote_management : remote_management option)
  ?(device_configuration : device_configuration option)
  ?(tax_documents : tax_documents option)
  ?(forwarding_address_id : string option)
  ?(cluster_id : string option)
  ?(job_log_info : job_logs option)
  ?(data_transfer_progress : data_transfer option)
  ?(notification : notification option)
  ?(snowball_capacity_preference : snowball_capacity option)
  ?(shipping_details : shipping_details option)
  ?(address_id : string option)
  ?(role_ar_n : string option)
  ?(kms_key_ar_n : string option)
  ?(description : string option)
  ?(resources : job_resource option)
  ?(creation_date : float option)
  ?(snowball_type : snowball_type option)
  ?(job_type : job_type option)
  ?(job_state : job_state option)
  ?(job_id : string option)
  () : job_metadata = {
  snowball_id;
  pickup_details;
  impact_level;
  on_device_service_configuration;
  long_term_pricing_id;
  remote_management;
  device_configuration;
  tax_documents;
  forwarding_address_id;
  cluster_id;
  job_log_info;
  data_transfer_progress;
  notification;
  snowball_capacity_preference;
  shipping_details;
  address_id;
  role_ar_n;
  kms_key_ar_n;
  description;
  resources;
  creation_date;
  snowball_type;
  job_type;
  job_state;
  job_id;
   }

let make_get_software_updates_result  ?(updates_ur_i : string option) ()
: get_software_updates_result = { updates_ur_i; 
}

let make_get_software_updates_request  ~(job_id : string) ()
: get_software_updates_request = { job_id; 
}

let make_get_snowball_usage_result 
  ?(snowballs_in_use : int option) ?(snowball_limit : int option) ()
: get_snowball_usage_result = { snowballs_in_use; snowball_limit; 
}

let make_get_snowball_usage_request  () : get_snowball_usage_request =
()

let make_get_job_unlock_code_result  ?(unlock_code : string option) ()
: get_job_unlock_code_result = { unlock_code; 
}

let make_get_job_unlock_code_request  ~(job_id : string) ()
: get_job_unlock_code_request = { job_id;  }

let make_get_job_manifest_result  ?(manifest_ur_i : string option) ()
: get_job_manifest_result = { manifest_ur_i; 
}

let make_get_job_manifest_request  ~(job_id : string) ()
: get_job_manifest_request = { job_id; 
}

let make_describe_return_shipping_label_result 
  ?(return_shipping_label_ur_i : string option)
  ?(expiration_date : float option)
  ?(status : shipping_label_status option)
  () : describe_return_shipping_label_result = {
  return_shipping_label_ur_i; expiration_date; status; 
}

let make_describe_return_shipping_label_request  ~(job_id : string) ()
: describe_return_shipping_label_request = { job_id; 
}

let make_describe_job_result 
  ?(sub_job_metadata : job_metadata list option)
  ?(job_metadata : job_metadata option)
  () : describe_job_result = { sub_job_metadata; job_metadata; 
}

let make_describe_job_request  ~(job_id : string) () : describe_job_request =
{ job_id;  }

let make_cluster_metadata 
  ?(on_device_service_configuration : on_device_service_configuration option)
  ?(tax_documents : tax_documents option)
  ?(forwarding_address_id : string option)
  ?(notification : notification option)
  ?(shipping_option : shipping_option option)
  ?(address_id : string option)
  ?(resources : job_resource option)
  ?(creation_date : float option)
  ?(snowball_type : snowball_type option)
  ?(job_type : job_type option)
  ?(cluster_state : cluster_state option)
  ?(role_ar_n : string option)
  ?(kms_key_ar_n : string option)
  ?(description : string option)
  ?(cluster_id : string option)
  () : cluster_metadata = {
  on_device_service_configuration;
  tax_documents;
  forwarding_address_id;
  notification;
  shipping_option;
  address_id;
  resources;
  creation_date;
  snowball_type;
  job_type;
  cluster_state;
  role_ar_n;
  kms_key_ar_n;
  description;
  cluster_id;
   }

let make_describe_cluster_result 
  ?(cluster_metadata : cluster_metadata option) () : describe_cluster_result
= { cluster_metadata;  }

let make_describe_cluster_request  ~(cluster_id : string) ()
: describe_cluster_request = { cluster_id; 
}

let make_describe_addresses_result 
  ?(next_token : string option) ?(addresses : address list option) ()
: describe_addresses_result = { next_token; addresses; 
}

let make_describe_addresses_request 
  ?(next_token : string option) ?(max_results : int option) ()
: describe_addresses_request = { next_token; max_results; 
}

let make_describe_address_result  ?(address : address option) ()
: describe_address_result = { address;  }

let make_describe_address_request  ~(address_id : string) ()
: describe_address_request = { address_id; 
}

let make_create_return_shipping_label_result 
  ?(status : shipping_label_status option) ()
: create_return_shipping_label_result = { status; 
}

let make_create_return_shipping_label_request 
  ?(shipping_option : shipping_option option) ~(job_id : string) ()
: create_return_shipping_label_request = { shipping_option; job_id; 
}

let make_create_long_term_pricing_result 
  ?(long_term_pricing_id : string option) ()
: create_long_term_pricing_result = { long_term_pricing_id; 
}

let make_create_long_term_pricing_request 
  ?(is_long_term_pricing_auto_renew : bool option)
  ~(snowball_type : snowball_type)
  ~(long_term_pricing_type : long_term_pricing_type)
  () : create_long_term_pricing_request = {
  snowball_type; is_long_term_pricing_auto_renew; long_term_pricing_type; 
}

let make_create_job_result  ?(job_id : string option) () : create_job_result
= { job_id;  }

let make_create_job_request 
  ?(pickup_details : pickup_details option)
  ?(impact_level : impact_level option)
  ?(long_term_pricing_id : string option)
  ?(remote_management : remote_management option)
  ?(device_configuration : device_configuration option)
  ?(tax_documents : tax_documents option)
  ?(forwarding_address_id : string option)
  ?(snowball_type : snowball_type option)
  ?(cluster_id : string option)
  ?(notification : notification option)
  ?(shipping_option : shipping_option option)
  ?(snowball_capacity_preference : snowball_capacity option)
  ?(role_ar_n : string option)
  ?(kms_key_ar_n : string option)
  ?(address_id : string option)
  ?(description : string option)
  ?(on_device_service_configuration : on_device_service_configuration option)
  ?(resources : job_resource option)
  ?(job_type : job_type option)
  () : create_job_request = {
  pickup_details;
  impact_level;
  long_term_pricing_id;
  remote_management;
  device_configuration;
  tax_documents;
  forwarding_address_id;
  snowball_type;
  cluster_id;
  notification;
  shipping_option;
  snowball_capacity_preference;
  role_ar_n;
  kms_key_ar_n;
  address_id;
  description;
  on_device_service_configuration;
  resources;
  job_type;
   }

let make_create_cluster_result 
  ?(job_list_entries : job_list_entry list option)
  ?(cluster_id : string option)
  () : create_cluster_result = { job_list_entries; cluster_id; 
}

let make_create_cluster_request 
  ?(snowball_capacity_preference : snowball_capacity option)
  ?(long_term_pricing_ids : string list option)
  ?(force_create_jobs : bool option)
  ?(initial_cluster_size : int option)
  ?(remote_management : remote_management option)
  ?(tax_documents : tax_documents option)
  ?(forwarding_address_id : string option)
  ?(notification : notification option)
  ?(role_ar_n : string option)
  ?(kms_key_ar_n : string option)
  ?(description : string option)
  ?(on_device_service_configuration : on_device_service_configuration option)
  ?(resources : job_resource option)
  ~(shipping_option : shipping_option)
  ~(snowball_type : snowball_type)
  ~(address_id : string)
  ~(job_type : job_type)
  () : create_cluster_request = {
  snowball_capacity_preference;
  long_term_pricing_ids;
  force_create_jobs;
  initial_cluster_size;
  remote_management;
  tax_documents;
  forwarding_address_id;
  notification;
  shipping_option;
  snowball_type;
  role_ar_n;
  kms_key_ar_n;
  address_id;
  description;
  on_device_service_configuration;
  resources;
  job_type;
   }

let make_create_address_result  ?(address_id : string option) ()
: create_address_result = { address_id;  }

let make_create_address_request  ~(address : address) ()
: create_address_request = { address;  }

let make_cancel_job_result  () : cancel_job_result =
()

let make_cancel_job_request  ~(job_id : string) () : cancel_job_request = {
  job_id;  }

let make_cancel_cluster_result  () : cancel_cluster_result =
()

let make_cancel_cluster_request  ~(cluster_id : string) ()
: cancel_cluster_request = { cluster_id; 
}

