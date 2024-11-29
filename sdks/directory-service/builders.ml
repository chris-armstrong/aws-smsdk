[@@@warning "-39"]
open Types
let make_verify_trust_request  ~(trust_id : string) () : verify_trust_request
= { trust_id;  }

let make_os_update_settings  ?(os_version : os_version option) ()
: os_update_settings = { os_version;  }

let make_update_value  ?(os_update_settings : os_update_settings option) ()
: update_value = { os_update_settings;  }

let make_update_trust_request 
  ?(selective_auth : selective_auth option) ~(trust_id : string) ()
: update_trust_request = { selective_auth; trust_id;  }

let make_setting  ~(value : string) ~(name : string) () : setting = {
  value; name;  }

let make_update_settings_request 
  ~(settings : setting list) ~(directory_id : string) ()
: update_settings_request = { settings; directory_id; 
}

let make_radius_settings 
  ?(use_same_username : bool option)
  ?(display_label : string option)
  ?(authentication_protocol : radius_authentication_protocol option)
  ?(shared_secret : string option)
  ?(radius_retries : int option)
  ?(radius_timeout : int option)
  ?(radius_port : int option)
  ?(radius_servers : string list option)
  () : radius_settings = {
  use_same_username;
  display_label;
  authentication_protocol;
  shared_secret;
  radius_retries;
  radius_timeout;
  radius_port;
  radius_servers;
   }

let make_update_radius_request 
  ~(radius_settings : radius_settings) ~(directory_id : string) ()
: update_radius_request = { radius_settings; directory_id; 
}

let make_update_number_of_domain_controllers_request 
  ~(desired_number : int) ~(directory_id : string) ()
: update_number_of_domain_controllers_request = {
  desired_number; directory_id;  }

let make_update_info_entry 
  ?(last_updated_date_time : float option)
  ?(start_time : float option)
  ?(previous_value : update_value option)
  ?(new_value : update_value option)
  ?(initiated_by : string option)
  ?(status_reason : string option)
  ?(status : update_status option)
  ?(region : string option)
  () : update_info_entry = {
  last_updated_date_time;
  start_time;
  previous_value;
  new_value;
  initiated_by;
  status_reason;
  status;
  region;
   }

let make_update_directory_setup_request 
  ?(create_snapshot_before_update : bool option)
  ?(os_update_settings : os_update_settings option)
  ~(update_type : update_type)
  ~(directory_id : string)
  () : update_directory_setup_request = {
  create_snapshot_before_update;
  os_update_settings;
  update_type;
  directory_id;
   }

let make_update_conditional_forwarder_request 
  ~(dns_ip_addrs : string list)
  ~(remote_domain_name : string)
  ~(directory_id : string)
  () : update_conditional_forwarder_request = {
  dns_ip_addrs; remote_domain_name; directory_id;  }

let make_unshare_target  ~(type_ : target_type) ~(id : string) ()
: unshare_target = { type_; id;  }

let make_unshare_directory_request 
  ~(unshare_target : unshare_target) ~(directory_id : string) ()
: unshare_directory_request = { unshare_target; directory_id; 
}

let make_trust 
  ?(selective_auth : selective_auth option)
  ?(trust_state_reason : string option)
  ?(state_last_updated_date_time : float option)
  ?(last_updated_date_time : float option)
  ?(created_date_time : float option)
  ?(trust_state : trust_state option)
  ?(trust_direction : trust_direction option)
  ?(trust_type : trust_type option)
  ?(remote_domain_name : string option)
  ?(trust_id : string option)
  ?(directory_id : string option)
  () : trust = {
  selective_auth;
  trust_state_reason;
  state_last_updated_date_time;
  last_updated_date_time;
  created_date_time;
  trust_state;
  trust_direction;
  trust_type;
  remote_domain_name;
  trust_id;
  directory_id;
   }

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_start_schema_extension_request 
  ~(description : string)
  ~(ldif_content : string)
  ~(create_snapshot_before_schema_extension : bool)
  ~(directory_id : string)
  () : start_schema_extension_request = {
  description;
  ldif_content;
  create_snapshot_before_schema_extension;
  directory_id;
   }

let make_snapshot 
  ?(start_time : float option)
  ?(status : snapshot_status option)
  ?(name : string option)
  ?(type_ : snapshot_type option)
  ?(snapshot_id : string option)
  ?(directory_id : string option)
  () : snapshot = {
  start_time; status; name; type_; snapshot_id; directory_id; 
}

let make_snapshot_limits 
  ?(manual_snapshots_limit_reached : bool option)
  ?(manual_snapshots_current_count : int option)
  ?(manual_snapshots_limit : int option)
  () : snapshot_limits = {
  manual_snapshots_limit_reached;
  manual_snapshots_current_count;
  manual_snapshots_limit;
   }

let make_shared_directory 
  ?(last_updated_date_time : float option)
  ?(created_date_time : float option)
  ?(share_notes : string option)
  ?(share_status : share_status option)
  ?(shared_directory_id : string option)
  ?(shared_account_id : string option)
  ?(share_method : share_method option)
  ?(owner_directory_id : string option)
  ?(owner_account_id : string option)
  () : shared_directory = {
  last_updated_date_time;
  created_date_time;
  share_notes;
  share_status;
  shared_directory_id;
  shared_account_id;
  share_method;
  owner_directory_id;
  owner_account_id;
   }

let make_share_target  ~(type_ : target_type) ~(id : string) ()
: share_target = { type_; id;  }

let make_share_directory_request 
  ?(share_notes : string option)
  ~(share_method : share_method)
  ~(share_target : share_target)
  ~(directory_id : string)
  () : share_directory_request = {
  share_method; share_target; share_notes; directory_id; 
}

let make_setting_entry 
  ?(data_type : string option)
  ?(last_requested_date_time : float option)
  ?(last_updated_date_time : float option)
  ?(request_status_message : string option)
  ?(request_detailed_status : (string * directory_configuration_status) list option)
  ?(request_status : directory_configuration_status option)
  ?(requested_value : string option)
  ?(applied_value : string option)
  ?(allowed_values : string option)
  ?(name : string option)
  ?(type_ : string option)
  () : setting_entry = {
  data_type;
  last_requested_date_time;
  last_updated_date_time;
  request_status_message;
  request_detailed_status;
  request_status;
  requested_value;
  applied_value;
  allowed_values;
  name;
  type_;
   }

let make_schema_extension_info 
  ?(end_date_time : float option)
  ?(start_date_time : float option)
  ?(schema_extension_status_reason : string option)
  ?(schema_extension_status : schema_extension_status option)
  ?(description : string option)
  ?(schema_extension_id : string option)
  ?(directory_id : string option)
  () : schema_extension_info = {
  end_date_time;
  start_date_time;
  schema_extension_status_reason;
  schema_extension_status;
  description;
  schema_extension_id;
  directory_id;
   }

let make_restore_from_snapshot_request  ~(snapshot_id : string) ()
: restore_from_snapshot_request = { snapshot_id; 
}

let make_reset_user_password_request 
  ~(new_password : string) ~(user_name : string) ~(directory_id : string) ()
: reset_user_password_request = { new_password; user_name; directory_id; 
}

let make_remove_tags_from_resource_request 
  ~(tag_keys : string list) ~(resource_id : string) ()
: remove_tags_from_resource_request = { tag_keys; resource_id; 
}

let make_remove_region_request  ~(directory_id : string) ()
: remove_region_request = { directory_id; 
}

let make_remove_ip_routes_request 
  ~(cidr_ips : string list) ~(directory_id : string) ()
: remove_ip_routes_request = { cidr_ips; directory_id; 
}

let make_reject_shared_directory_request  ~(shared_directory_id : string) ()
: reject_shared_directory_request = { shared_directory_id; 
}

let make_register_event_topic_request 
  ~(topic_name : string) ~(directory_id : string) ()
: register_event_topic_request = { topic_name; directory_id; 
}

let make_client_cert_auth_settings  ?(ocsp_url : string option) ()
: client_cert_auth_settings = { ocsp_url; 
}

let make_register_certificate_request 
  ?(client_cert_auth_settings : client_cert_auth_settings option)
  ?(type_ : certificate_type option)
  ~(certificate_data : string)
  ~(directory_id : string)
  () : register_certificate_request = {
  client_cert_auth_settings; type_; certificate_data; directory_id; 
}

let make_regions_info 
  ?(additional_regions : string list option)
  ?(primary_region : string option)
  () : regions_info = { additional_regions; primary_region; 
}

let make_directory_vpc_settings 
  ~(subnet_ids : string list) ~(vpc_id : string) () : directory_vpc_settings
= { subnet_ids; vpc_id;  }

let make_region_description 
  ?(last_updated_date_time : float option)
  ?(status_last_updated_date_time : float option)
  ?(launch_time : float option)
  ?(desired_number_of_domain_controllers : int option)
  ?(vpc_settings : directory_vpc_settings option)
  ?(status : directory_stage option)
  ?(region_type : region_type option)
  ?(region_name : string option)
  ?(directory_id : string option)
  () : region_description = {
  last_updated_date_time;
  status_last_updated_date_time;
  launch_time;
  desired_number_of_domain_controllers;
  vpc_settings;
  status;
  region_type;
  region_name;
  directory_id;
   }

let make_directory_vpc_settings_description 
  ?(availability_zones : string list option)
  ?(security_group_id : string option)
  ?(subnet_ids : string list option)
  ?(vpc_id : string option)
  () : directory_vpc_settings_description = {
  availability_zones; security_group_id; subnet_ids; vpc_id; 
}

let make_owner_directory_description 
  ?(radius_status : radius_status option)
  ?(radius_settings : radius_settings option)
  ?(vpc_settings : directory_vpc_settings_description option)
  ?(dns_ip_addrs : string list option)
  ?(account_id : string option)
  ?(directory_id : string option)
  () : owner_directory_description = {
  radius_status;
  radius_settings;
  vpc_settings;
  dns_ip_addrs;
  account_id;
  directory_id;
   }

let make_log_subscription 
  ?(subscription_created_date_time : float option)
  ?(log_group_name : string option)
  ?(directory_id : string option)
  () : log_subscription = {
  subscription_created_date_time; log_group_name; directory_id; 
}

let make_list_tags_for_resource_request 
  ?(limit : int option)
  ?(next_token : string option)
  ~(resource_id : string)
  () : list_tags_for_resource_request = { limit; next_token; resource_id; 
}

let make_list_schema_extensions_request 
  ?(limit : int option)
  ?(next_token : string option)
  ~(directory_id : string)
  () : list_schema_extensions_request = { limit; next_token; directory_id; 
}

let make_list_log_subscriptions_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(directory_id : string option)
  () : list_log_subscriptions_request = { limit; next_token; directory_id; 
}

let make_ip_route_info 
  ?(description : string option)
  ?(ip_route_status_reason : string option)
  ?(added_date_time : float option)
  ?(ip_route_status_msg : ip_route_status_msg option)
  ?(cidr_ip : string option)
  ?(directory_id : string option)
  () : ip_route_info = {
  description;
  ip_route_status_reason;
  added_date_time;
  ip_route_status_msg;
  cidr_ip;
  directory_id;
   }

let make_list_ip_routes_request 
  ?(limit : int option)
  ?(next_token : string option)
  ~(directory_id : string)
  () : list_ip_routes_request = { limit; next_token; directory_id; 
}

let make_certificate_info 
  ?(type_ : certificate_type option)
  ?(expiry_date_time : float option)
  ?(state : certificate_state option)
  ?(common_name : string option)
  ?(certificate_id : string option)
  () : certificate_info = {
  type_; expiry_date_time; state; common_name; certificate_id; 
}

let make_list_certificates_request 
  ?(limit : int option)
  ?(next_token : string option)
  ~(directory_id : string)
  () : list_certificates_request = { limit; next_token; directory_id; 
}

let make_ldaps_setting_info 
  ?(last_updated_date_time : float option)
  ?(ldaps_status_reason : string option)
  ?(ldaps_status : ldaps_status option)
  () : ldaps_setting_info = {
  last_updated_date_time; ldaps_status_reason; ldaps_status; 
}

let make_ip_route 
  ?(description : string option) ?(cidr_ip : string option) () : ip_route = {
  description; cidr_ip;  }

let make_get_snapshot_limits_request  ~(directory_id : string) ()
: get_snapshot_limits_request = { directory_id;  }

let make_directory_limits 
  ?(connected_directories_limit_reached : bool option)
  ?(connected_directories_current_count : int option)
  ?(connected_directories_limit : int option)
  ?(cloud_only_microsoft_ad_limit_reached : bool option)
  ?(cloud_only_microsoft_ad_current_count : int option)
  ?(cloud_only_microsoft_ad_limit : int option)
  ?(cloud_only_directories_limit_reached : bool option)
  ?(cloud_only_directories_current_count : int option)
  ?(cloud_only_directories_limit : int option)
  () : directory_limits = {
  connected_directories_limit_reached;
  connected_directories_current_count;
  connected_directories_limit;
  cloud_only_microsoft_ad_limit_reached;
  cloud_only_microsoft_ad_current_count;
  cloud_only_microsoft_ad_limit;
  cloud_only_directories_limit_reached;
  cloud_only_directories_current_count;
  cloud_only_directories_limit;
   }

let make_get_directory_limits_request  () : get_directory_limits_request =
()

let make_event_topic 
  ?(status : topic_status option)
  ?(created_date_time : float option)
  ?(topic_arn : string option)
  ?(topic_name : string option)
  ?(directory_id : string option)
  () : event_topic = {
  status; created_date_time; topic_arn; topic_name; directory_id; 
}

let make_enable_sso_request 
  ?(password : string option)
  ?(user_name : string option)
  ~(directory_id : string)
  () : enable_sso_request = { password; user_name; directory_id; 
}

let make_enable_radius_request 
  ~(radius_settings : radius_settings) ~(directory_id : string) ()
: enable_radius_request = { radius_settings; directory_id; 
}

let make_enable_ldaps_request 
  ~(type_ : ldaps_type) ~(directory_id : string) () : enable_ldaps_request =
{ type_; directory_id;  }

let make_enable_client_authentication_request 
  ~(type_ : client_authentication_type) ~(directory_id : string) ()
: enable_client_authentication_request = { type_; directory_id; 
}

let make_domain_controller 
  ?(status_last_updated_date_time : float option)
  ?(launch_time : float option)
  ?(status_reason : string option)
  ?(status : domain_controller_status option)
  ?(availability_zone : string option)
  ?(subnet_id : string option)
  ?(vpc_id : string option)
  ?(dns_ip_addr : string option)
  ?(domain_controller_id : string option)
  ?(directory_id : string option)
  () : domain_controller = {
  status_last_updated_date_time;
  launch_time;
  status_reason;
  status;
  availability_zone;
  subnet_id;
  vpc_id;
  dns_ip_addr;
  domain_controller_id;
  directory_id;
   }

let make_disable_sso_request 
  ?(password : string option)
  ?(user_name : string option)
  ~(directory_id : string)
  () : disable_sso_request = { password; user_name; directory_id; 
}

let make_disable_radius_request  ~(directory_id : string) ()
: disable_radius_request = { directory_id;  }

let make_disable_ldaps_request 
  ~(type_ : ldaps_type) ~(directory_id : string) () : disable_ldaps_request =
{ type_; directory_id;  }

let make_disable_client_authentication_request 
  ~(type_ : client_authentication_type) ~(directory_id : string) ()
: disable_client_authentication_request = { type_; directory_id; 
}

let make_describe_update_directory_request 
  ?(next_token : string option)
  ?(region_name : string option)
  ~(update_type : update_type)
  ~(directory_id : string)
  () : describe_update_directory_request = {
  next_token; region_name; update_type; directory_id; 
}

let make_describe_trusts_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(trust_ids : string list option)
  ?(directory_id : string option)
  () : describe_trusts_request = {
  limit; next_token; trust_ids; directory_id; 
}

let make_describe_snapshots_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(snapshot_ids : string list option)
  ?(directory_id : string option)
  () : describe_snapshots_request = {
  limit; next_token; snapshot_ids; directory_id; 
}

let make_describe_shared_directories_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(shared_directory_ids : string list option)
  ~(owner_directory_id : string)
  () : describe_shared_directories_request = {
  limit; next_token; shared_directory_ids; owner_directory_id; 
}

let make_describe_settings_request 
  ?(next_token : string option)
  ?(status : directory_configuration_status option)
  ~(directory_id : string)
  () : describe_settings_request = { next_token; status; directory_id; 
}

let make_describe_regions_request 
  ?(next_token : string option)
  ?(region_name : string option)
  ~(directory_id : string)
  () : describe_regions_request = { next_token; region_name; directory_id; 
}

let make_describe_ldaps_settings_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(type_ : ldaps_type option)
  ~(directory_id : string)
  () : describe_ldaps_settings_request = {
  limit; next_token; type_; directory_id; 
}

let make_describe_event_topics_request 
  ?(topic_names : string list option) ?(directory_id : string option) ()
: describe_event_topics_request = { topic_names; directory_id; 
}

let make_describe_domain_controllers_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(domain_controller_ids : string list option)
  ~(directory_id : string)
  () : describe_domain_controllers_request = {
  limit; next_token; domain_controller_ids; directory_id; 
}

let make_directory_connect_settings_description 
  ?(connect_ips : string list option)
  ?(availability_zones : string list option)
  ?(security_group_id : string option)
  ?(customer_user_name : string option)
  ?(subnet_ids : string list option)
  ?(vpc_id : string option)
  () : directory_connect_settings_description = {
  connect_ips;
  availability_zones;
  security_group_id;
  customer_user_name;
  subnet_ids;
  vpc_id;
   }

let make_directory_description 
  ?(os_version : os_version option)
  ?(regions_info : regions_info option)
  ?(owner_directory_description : owner_directory_description option)
  ?(desired_number_of_domain_controllers : int option)
  ?(sso_enabled : bool option)
  ?(stage_reason : string option)
  ?(radius_status : radius_status option)
  ?(radius_settings : radius_settings option)
  ?(connect_settings : directory_connect_settings_description option)
  ?(vpc_settings : directory_vpc_settings_description option)
  ?(type_ : directory_type option)
  ?(stage_last_updated_date_time : float option)
  ?(launch_time : float option)
  ?(share_notes : string option)
  ?(share_method : share_method option)
  ?(share_status : share_status option)
  ?(stage : directory_stage option)
  ?(dns_ip_addrs : string list option)
  ?(description : string option)
  ?(access_url : string option)
  ?(alias : string option)
  ?(edition : directory_edition option)
  ?(size : directory_size option)
  ?(short_name : string option)
  ?(name : string option)
  ?(directory_id : string option)
  () : directory_description = {
  os_version;
  regions_info;
  owner_directory_description;
  desired_number_of_domain_controllers;
  sso_enabled;
  stage_reason;
  radius_status;
  radius_settings;
  connect_settings;
  vpc_settings;
  type_;
  stage_last_updated_date_time;
  launch_time;
  share_notes;
  share_method;
  share_status;
  stage;
  dns_ip_addrs;
  description;
  access_url;
  alias;
  edition;
  size;
  short_name;
  name;
  directory_id;
   }

let make_describe_directories_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(directory_ids : string list option)
  () : describe_directories_request = { limit; next_token; directory_ids; 
}

let make_conditional_forwarder 
  ?(replication_scope : replication_scope option)
  ?(dns_ip_addrs : string list option)
  ?(remote_domain_name : string option)
  () : conditional_forwarder = {
  replication_scope; dns_ip_addrs; remote_domain_name; 
}

let make_describe_conditional_forwarders_request 
  ?(remote_domain_names : string list option) ~(directory_id : string) ()
: describe_conditional_forwarders_request = {
  remote_domain_names; directory_id; 
}

let make_client_authentication_setting_info 
  ?(last_updated_date_time : float option)
  ?(status : client_authentication_status option)
  ?(type_ : client_authentication_type option)
  () : client_authentication_setting_info = {
  last_updated_date_time; status; type_; 
}

let make_describe_client_authentication_settings_request 
  ?(limit : int option)
  ?(next_token : string option)
  ?(type_ : client_authentication_type option)
  ~(directory_id : string)
  () : describe_client_authentication_settings_request = {
  limit; next_token; type_; directory_id;  }

let make_certificate 
  ?(client_cert_auth_settings : client_cert_auth_settings option)
  ?(type_ : certificate_type option)
  ?(expiry_date_time : float option)
  ?(registered_date_time : float option)
  ?(common_name : string option)
  ?(state_reason : string option)
  ?(state : certificate_state option)
  ?(certificate_id : string option)
  () : certificate = {
  client_cert_auth_settings;
  type_;
  expiry_date_time;
  registered_date_time;
  common_name;
  state_reason;
  state;
  certificate_id;
   }

let make_describe_certificate_request 
  ~(certificate_id : string) ~(directory_id : string) ()
: describe_certificate_request = { certificate_id; directory_id; 
}

let make_deregister_event_topic_request 
  ~(topic_name : string) ~(directory_id : string) ()
: deregister_event_topic_request = { topic_name; directory_id; 
}

let make_deregister_certificate_request 
  ~(certificate_id : string) ~(directory_id : string) ()
: deregister_certificate_request = { certificate_id; directory_id; 
}

let make_delete_trust_request 
  ?(delete_associated_conditional_forwarder : bool option)
  ~(trust_id : string)
  () : delete_trust_request = {
  delete_associated_conditional_forwarder; trust_id; 
}

let make_delete_snapshot_request  ~(snapshot_id : string) ()
: delete_snapshot_request = { snapshot_id; 
}

let make_delete_log_subscription_request  ~(directory_id : string) ()
: delete_log_subscription_request = { directory_id; 
}

let make_delete_directory_request  ~(directory_id : string) ()
: delete_directory_request = { directory_id; 
}

let make_delete_conditional_forwarder_request 
  ~(remote_domain_name : string) ~(directory_id : string) ()
: delete_conditional_forwarder_request = { remote_domain_name; directory_id; 
}

let make_create_trust_request 
  ?(selective_auth : selective_auth option)
  ?(conditional_forwarder_ip_addrs : string list option)
  ?(trust_type : trust_type option)
  ~(trust_direction : trust_direction)
  ~(trust_password : string)
  ~(remote_domain_name : string)
  ~(directory_id : string)
  () : create_trust_request = {
  selective_auth;
  conditional_forwarder_ip_addrs;
  trust_type;
  trust_direction;
  trust_password;
  remote_domain_name;
  directory_id;
   }

let make_create_snapshot_request 
  ?(name : string option) ~(directory_id : string) ()
: create_snapshot_request = { name; directory_id; 
}

let make_create_microsoft_ad_request 
  ?(tags : tag list option)
  ?(edition : directory_edition option)
  ?(description : string option)
  ?(short_name : string option)
  ~(vpc_settings : directory_vpc_settings)
  ~(password : string)
  ~(name : string)
  () : create_microsoft_ad_request = {
  tags; edition; vpc_settings; description; password; short_name; name; 
}

let make_create_log_subscription_request 
  ~(log_group_name : string) ~(directory_id : string) ()
: create_log_subscription_request = { log_group_name; directory_id; 
}

let make_create_directory_request 
  ?(tags : tag list option)
  ?(vpc_settings : directory_vpc_settings option)
  ?(description : string option)
  ?(short_name : string option)
  ~(size : directory_size)
  ~(password : string)
  ~(name : string)
  () : create_directory_request = {
  tags; vpc_settings; size; description; password; short_name; name; 
}

let make_create_conditional_forwarder_request 
  ~(dns_ip_addrs : string list)
  ~(remote_domain_name : string)
  ~(directory_id : string)
  () : create_conditional_forwarder_request = {
  dns_ip_addrs; remote_domain_name; directory_id;  }

let make_attribute  ?(value : string option) ?(name : string option) ()
: attribute = { value; name;  }

let make_computer 
  ?(computer_attributes : attribute list option)
  ?(computer_name : string option)
  ?(computer_id : string option)
  () : computer = { computer_attributes; computer_name; computer_id; 
}

let make_create_computer_request 
  ?(computer_attributes : attribute list option)
  ?(organizational_unit_distinguished_name : string option)
  ~(password : string)
  ~(computer_name : string)
  ~(directory_id : string)
  () : create_computer_request = {
  computer_attributes;
  organizational_unit_distinguished_name;
  password;
  computer_name;
  directory_id;
   }

let make_create_alias_request  ~(alias : string) ~(directory_id : string) ()
: create_alias_request = { alias; directory_id; 
}

let make_directory_connect_settings 
  ~(customer_user_name : string)
  ~(customer_dns_ips : string list)
  ~(subnet_ids : string list)
  ~(vpc_id : string)
  () : directory_connect_settings = {
  customer_user_name; customer_dns_ips; subnet_ids; vpc_id; 
}

let make_connect_directory_request 
  ?(tags : tag list option)
  ?(description : string option)
  ?(short_name : string option)
  ~(connect_settings : directory_connect_settings)
  ~(size : directory_size)
  ~(password : string)
  ~(name : string)
  () : connect_directory_request = {
  tags; connect_settings; size; description; password; short_name; name; 
}

let make_cancel_schema_extension_request 
  ~(schema_extension_id : string) ~(directory_id : string) ()
: cancel_schema_extension_request = { schema_extension_id; directory_id; 
}

let make_add_tags_to_resource_request 
  ~(tags : tag list) ~(resource_id : string) ()
: add_tags_to_resource_request = { tags; resource_id; 
}

let make_add_region_request 
  ~(vpc_settings : directory_vpc_settings)
  ~(region_name : string)
  ~(directory_id : string)
  () : add_region_request = { vpc_settings; region_name; directory_id; 
}

let make_add_ip_routes_request 
  ?(update_security_group_for_directory_controllers : bool option)
  ~(ip_routes : ip_route list)
  ~(directory_id : string)
  () : add_ip_routes_request = {
  update_security_group_for_directory_controllers; ip_routes; directory_id; 
}

let make_accept_shared_directory_request  ~(shared_directory_id : string) ()
: accept_shared_directory_request = { shared_directory_id; 
}

