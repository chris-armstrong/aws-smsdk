[@@@warning "-39"]
open Types
let make_setup_request 
  ?(certificate_provider : certificate_provider option)
  ?(domain_names : string list option)
  ?(instance_name : string option)
  () : setup_request = { certificate_provider; domain_names; instance_name; 
}

let make_resource_location 
  ?(region_name : region_name option) ?(availability_zone : string option) ()
: resource_location = { region_name; availability_zone; 
}

let make_setup_history_resource 
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(arn : string option)
  ?(name : string option)
  () : setup_history_resource = {
  resource_type; location; created_at; arn; name; 
}

let make_setup_execution_details 
  ?(version : string option)
  ?(standard_output : string option)
  ?(standard_error : string option)
  ?(status : setup_status option)
  ?(name : string option)
  ?(date_time : float option)
  ?(command : string option)
  () : setup_execution_details = {
  version; standard_output; standard_error; status; name; date_time; command; 
}

let make_setup_history 
  ?(status : setup_status option)
  ?(execution_details : setup_execution_details list option)
  ?(resource : setup_history_resource option)
  ?(request : setup_request option)
  ?(operation_id : string option)
  () : setup_history = {
  status; execution_details; resource; request; operation_id; 
}

let make_operation 
  ?(error_details : string option)
  ?(error_code : string option)
  ?(status_changed_at : float option)
  ?(status : operation_status option)
  ?(operation_type : operation_type option)
  ?(operation_details : string option)
  ?(is_terminal : bool option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(resource_type : resource_type option)
  ?(resource_name : string option)
  ?(id : string option)
  () : operation = {
  error_details;
  error_code;
  status_changed_at;
  status;
  operation_type;
  operation_details;
  is_terminal;
  location;
  created_at;
  resource_type;
  resource_name;
  id;
   }

let make_update_relational_database_request 
  ?(relational_database_blueprint_id : string option)
  ?(ca_certificate_identifier : string option)
  ?(apply_immediately : bool option)
  ?(publicly_accessible : bool option)
  ?(disable_backup_retention : bool option)
  ?(enable_backup_retention : bool option)
  ?(preferred_maintenance_window : string option)
  ?(preferred_backup_window : string option)
  ?(rotate_master_user_password : bool option)
  ?(master_user_password : string option)
  ~(relational_database_name : string)
  () : update_relational_database_request = {
  relational_database_blueprint_id;
  ca_certificate_identifier;
  apply_immediately;
  publicly_accessible;
  disable_backup_retention;
  enable_backup_retention;
  preferred_maintenance_window;
  preferred_backup_window;
  rotate_master_user_password;
  master_user_password;
  relational_database_name;
   }

let make_relational_database_parameter 
  ?(parameter_value : string option)
  ?(parameter_name : string option)
  ?(is_modifiable : bool option)
  ?(description : string option)
  ?(data_type : string option)
  ?(apply_type : string option)
  ?(apply_method : string option)
  ?(allowed_values : string option)
  () : relational_database_parameter = {
  parameter_value;
  parameter_name;
  is_modifiable;
  description;
  data_type;
  apply_type;
  apply_method;
  allowed_values;
   }

let make_update_relational_database_parameters_request 
  ~(parameters : relational_database_parameter list)
  ~(relational_database_name : string)
  () : update_relational_database_parameters_request = {
  parameters; relational_database_name; 
}

let make_update_load_balancer_attribute_request 
  ~(attribute_value : string)
  ~(attribute_name : load_balancer_attribute_name)
  ~(load_balancer_name : string)
  () : update_load_balancer_attribute_request = {
  attribute_value; attribute_name; load_balancer_name; 
}

let make_update_instance_metadata_options_request 
  ?(http_protocol_ipv6 : http_protocol_ipv6 option)
  ?(http_put_response_hop_limit : int option)
  ?(http_endpoint : http_endpoint option)
  ?(http_tokens : http_tokens option)
  ~(instance_name : string)
  () : update_instance_metadata_options_request = {
  http_protocol_ipv6;
  http_put_response_hop_limit;
  http_endpoint;
  http_tokens;
  instance_name;
   }

let make_domain_entry 
  ?(options : (string * string) list option)
  ?(type_ : string option)
  ?(is_alias : bool option)
  ?(target : string option)
  ?(name : string option)
  ?(id : string option)
  () : domain_entry = { options; type_; is_alias; target; name; id; 
}

let make_update_domain_entry_request 
  ~(domain_entry : domain_entry) ~(domain_name : string) ()
: update_domain_entry_request = { domain_entry; domain_name; 
}

let make_input_origin 
  ?(response_timeout : int option)
  ?(protocol_policy : origin_protocol_policy_enum option)
  ?(region_name : region_name option)
  ?(name : string option)
  () : input_origin = {
  response_timeout; protocol_policy; region_name; name; 
}

let make_cache_behavior  ?(behavior : behavior_enum option) ()
: cache_behavior = { behavior;  }

let make_cookie_object 
  ?(cookies_allow_list : string list option)
  ?(option_ : forward_values option)
  () : cookie_object = { cookies_allow_list; option_; 
}

let make_header_object 
  ?(headers_allow_list : header_enum list option)
  ?(option_ : forward_values option)
  () : header_object = { headers_allow_list; option_; 
}

let make_query_string_object 
  ?(query_strings_allow_list : string list option)
  ?(option_ : bool option)
  () : query_string_object = { query_strings_allow_list; option_; 
}

let make_cache_settings 
  ?(forwarded_query_strings : query_string_object option)
  ?(forwarded_headers : header_object option)
  ?(forwarded_cookies : cookie_object option)
  ?(cached_http_methods : string option)
  ?(allowed_http_methods : string option)
  ?(maximum_tt_l : int option)
  ?(minimum_tt_l : int option)
  ?(default_tt_l : int option)
  () : cache_settings = {
  forwarded_query_strings;
  forwarded_headers;
  forwarded_cookies;
  cached_http_methods;
  allowed_http_methods;
  maximum_tt_l;
  minimum_tt_l;
  default_tt_l;
   }

let make_cache_behavior_per_path 
  ?(behavior : behavior_enum option) ?(path : string option) ()
: cache_behavior_per_path = { behavior; path; 
}

let make_update_distribution_request 
  ?(use_default_certificate : bool option)
  ?(certificate_name : string option)
  ?(viewer_minimum_tls_protocol_version : viewer_minimum_tls_protocol_version_enum option)
  ?(is_enabled : bool option)
  ?(cache_behaviors : cache_behavior_per_path list option)
  ?(cache_behavior_settings : cache_settings option)
  ?(default_cache_behavior : cache_behavior option)
  ?(origin : input_origin option)
  ~(distribution_name : string)
  () : update_distribution_request = {
  use_default_certificate;
  certificate_name;
  viewer_minimum_tls_protocol_version;
  is_enabled;
  cache_behaviors;
  cache_behavior_settings;
  default_cache_behavior;
  origin;
  distribution_name;
   }

let make_update_distribution_bundle_request 
  ?(bundle_id : string option) ?(distribution_name : string option) ()
: update_distribution_bundle_request = { bundle_id; distribution_name; 
}

let make_tag  ?(value : string option) ?(key : string option) () : tag = {
  value; key;  }

let make_container_service_state_detail 
  ?(message : string option)
  ?(code : container_service_state_detail_code option)
  () : container_service_state_detail = { message; code; 
}

let make_container 
  ?(ports : (string * container_service_protocol) list option)
  ?(environment : (string * string) list option)
  ?(command : string list option)
  ?(image : string option)
  () : container = { ports; environment; command; image; 
}

let make_container_service_health_check_config 
  ?(success_codes : string option)
  ?(path : string option)
  ?(interval_seconds : int option)
  ?(timeout_seconds : int option)
  ?(unhealthy_threshold : int option)
  ?(healthy_threshold : int option)
  () : container_service_health_check_config = {
  success_codes;
  path;
  interval_seconds;
  timeout_seconds;
  unhealthy_threshold;
  healthy_threshold;
   }

let make_container_service_endpoint 
  ?(health_check : container_service_health_check_config option)
  ?(container_port : int option)
  ?(container_name : string option)
  () : container_service_endpoint = {
  health_check; container_port; container_name; 
}

let make_container_service_deployment 
  ?(created_at : float option)
  ?(public_endpoint : container_service_endpoint option)
  ?(containers : (string * container) list option)
  ?(state : container_service_deployment_state option)
  ?(version : int option)
  () : container_service_deployment = {
  created_at; public_endpoint; containers; state; version; 
}

let make_container_service_ecr_image_puller_role 
  ?(principal_arn : string option) ?(is_active : bool option) ()
: container_service_ecr_image_puller_role = { principal_arn; is_active; 
}

let make_private_registry_access 
  ?(ecr_image_puller_role : container_service_ecr_image_puller_role option)
  () : private_registry_access = { ecr_image_puller_role; 
}

let make_container_service 
  ?(private_registry_access : private_registry_access option)
  ?(url : string option)
  ?(public_domain_names : (string * string list) list option)
  ?(private_domain_name : string option)
  ?(principal_arn : string option)
  ?(is_disabled : bool option)
  ?(next_deployment : container_service_deployment option)
  ?(current_deployment : container_service_deployment option)
  ?(scale : int option)
  ?(state_detail : container_service_state_detail option)
  ?(state : container_service_state option)
  ?(power_id : string option)
  ?(power : container_service_power_name option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(arn : string option)
  ?(container_service_name : string option)
  () : container_service = {
  private_registry_access;
  url;
  public_domain_names;
  private_domain_name;
  principal_arn;
  is_disabled;
  next_deployment;
  current_deployment;
  scale;
  state_detail;
  state;
  power_id;
  power;
  tags;
  resource_type;
  location;
  created_at;
  arn;
  container_service_name;
   }

let make_container_service_ecr_image_puller_role_request 
  ?(is_active : bool option) ()
: container_service_ecr_image_puller_role_request = { is_active; 
}

let make_private_registry_access_request 
  ?(ecr_image_puller_role : container_service_ecr_image_puller_role_request option)
  () : private_registry_access_request = { ecr_image_puller_role; 
}

let make_update_container_service_request 
  ?(private_registry_access : private_registry_access_request option)
  ?(public_domain_names : (string * string list) list option)
  ?(is_disabled : bool option)
  ?(scale : int option)
  ?(power : container_service_power_name option)
  ~(service_name : string)
  () : update_container_service_request = {
  private_registry_access;
  public_domain_names;
  is_disabled;
  scale;
  power;
  service_name;
   }

let make_access_rules 
  ?(allow_public_overrides : bool option)
  ?(get_object : access_type option)
  () : access_rules = { allow_public_overrides; get_object; 
}

let make_resource_receiving_access 
  ?(resource_type : string option) ?(name : string option) ()
: resource_receiving_access = { resource_type; name;  }

let make_bucket_state  ?(message : string option) ?(code : string option) ()
: bucket_state = { message; code;  }

let make_bucket_access_log_config 
  ?(prefix : string option)
  ?(destination : string option)
  ~(enabled : bool)
  () : bucket_access_log_config = { prefix; destination; enabled; 
}

let make_bucket 
  ?(access_log_config : bucket_access_log_config option)
  ?(state : bucket_state option)
  ?(resources_receiving_access : resource_receiving_access list option)
  ?(readonly_access_accounts : string list option)
  ?(able_to_update_bundle : bool option)
  ?(object_versioning : string option)
  ?(tags : tag list option)
  ?(support_code : string option)
  ?(name : string option)
  ?(location : resource_location option)
  ?(url : string option)
  ?(created_at : float option)
  ?(bundle_id : string option)
  ?(arn : string option)
  ?(access_rules : access_rules option)
  ?(resource_type : string option)
  () : bucket = {
  access_log_config;
  state;
  resources_receiving_access;
  readonly_access_accounts;
  able_to_update_bundle;
  object_versioning;
  tags;
  support_code;
  name;
  location;
  url;
  created_at;
  bundle_id;
  arn;
  access_rules;
  resource_type;
   }

let make_update_bucket_request 
  ?(access_log_config : bucket_access_log_config option)
  ?(readonly_access_accounts : string list option)
  ?(versioning : string option)
  ?(access_rules : access_rules option)
  ~(bucket_name : string)
  () : update_bucket_request = {
  access_log_config;
  readonly_access_accounts;
  versioning;
  access_rules;
  bucket_name;
   }

let make_update_bucket_bundle_request 
  ~(bundle_id : string) ~(bucket_name : string) ()
: update_bucket_bundle_request = { bundle_id; bucket_name; 
}

let make_untag_resource_request 
  ?(resource_arn : string option)
  ~(tag_keys : string list)
  ~(resource_name : string)
  () : untag_resource_request = { tag_keys; resource_arn; resource_name; 
}

let make_unpeer_vpc_request  () : unpeer_vpc_request =
()

let make_time_period  ?(end_ : float option) ?(start : float option) ()
: time_period = { end_; start;  }

let make_test_alarm_request  ~(state : alarm_state) ~(alarm_name : string) ()
: test_alarm_request = { state; alarm_name;  }

let make_tag_resource_request 
  ?(resource_arn : string option)
  ~(tags : tag list)
  ~(resource_name : string)
  () : tag_resource_request = { tags; resource_arn; resource_name; 
}

let make_stop_relational_database_request 
  ?(relational_database_snapshot_name : string option)
  ~(relational_database_name : string)
  () : stop_relational_database_request = {
  relational_database_snapshot_name; relational_database_name; 
}

let make_stop_instance_request 
  ?(force : bool option) ~(instance_name : string) () : stop_instance_request
= { force; instance_name;  }

let make_stop_instance_on_idle_request 
  ?(duration : string option) ?(threshold : string option) ()
: stop_instance_on_idle_request = { duration; threshold; 
}

let make_stop_gui_session_request  ~(resource_name : string) ()
: stop_gui_session_request = { resource_name;  }

let make_static_ip 
  ?(is_attached : bool option)
  ?(attached_to : string option)
  ?(ip_address : string option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : static_ip = {
  is_attached;
  attached_to;
  ip_address;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_start_relational_database_request 
  ~(relational_database_name : string) () : start_relational_database_request
= { relational_database_name;  }

let make_start_instance_request  ~(instance_name : string) ()
: start_instance_request = { instance_name; 
}

let make_start_gui_session_request  ~(resource_name : string) ()
: start_gui_session_request = { resource_name; 
}

let make_setup_instance_https_request 
  ~(certificate_provider : certificate_provider)
  ~(domain_names : string list)
  ~(email_address : string)
  ~(instance_name : string)
  () : setup_instance_https_request = {
  certificate_provider; domain_names; email_address; instance_name; 
}

let make_set_resource_access_for_bucket_request 
  ~(access : resource_bucket_access)
  ~(bucket_name : string)
  ~(resource_name : string)
  () : set_resource_access_for_bucket_request = {
  access; bucket_name; resource_name;  }

let make_set_ip_address_type_request 
  ?(accept_bundle_update : bool option)
  ~(ip_address_type : ip_address_type)
  ~(resource_name : string)
  ~(resource_type : resource_type)
  () : set_ip_address_type_request = {
  accept_bundle_update; ip_address_type; resource_name; resource_type; 
}

let make_session 
  ?(is_primary : bool option)
  ?(url : string option)
  ?(name : string option)
  () : session = { is_primary; url; name; 
}

let make_send_contact_method_verification_request 
  ~(protocol : contact_method_verification_protocol) ()
: send_contact_method_verification_request = { protocol; 
}

let make_estimate_by_time 
  ?(time_period : time_period option)
  ?(currency : currency option)
  ?(unit_ : float option)
  ?(pricing_unit : pricing_unit option)
  ?(usage_cost : float option)
  () : estimate_by_time = {
  time_period; currency; unit_; pricing_unit; usage_cost; 
}

let make_cost_estimate 
  ?(results_by_time : estimate_by_time list option)
  ?(usage_type : string option)
  () : cost_estimate = { results_by_time; usage_type; 
}

let make_resource_budget_estimate 
  ?(end_time : float option)
  ?(start_time : float option)
  ?(cost_estimates : cost_estimate list option)
  ?(resource_type : resource_type option)
  ?(resource_name : string option)
  () : resource_budget_estimate = {
  end_time; start_time; cost_estimates; resource_type; resource_name; 
}

let make_resource_record 
  ?(value : string option)
  ?(type_ : string option)
  ?(name : string option)
  () : resource_record = { value; type_; name; 
}

let make_reset_distribution_cache_request 
  ?(distribution_name : string option) () : reset_distribution_cache_request
= { distribution_name;  }

let make_dns_record_creation_state 
  ?(message : string option)
  ?(code : dns_record_creation_state_code option)
  () : dns_record_creation_state = { message; code; 
}

let make_domain_validation_record 
  ?(validation_status : certificate_domain_validation_status option)
  ?(dns_record_creation_state : dns_record_creation_state option)
  ?(resource_record : resource_record option)
  ?(domain_name : string option)
  () : domain_validation_record = {
  validation_status; dns_record_creation_state; resource_record; domain_name; 
}

let make_renewal_summary 
  ?(updated_at : float option)
  ?(renewal_status_reason : string option)
  ?(renewal_status : renewal_status option)
  ?(domain_validation_records : domain_validation_record list option)
  () : renewal_summary = {
  updated_at;
  renewal_status_reason;
  renewal_status;
  domain_validation_records;
   }

let make_release_static_ip_request  ~(static_ip_name : string) ()
: release_static_ip_request = { static_ip_name; 
}

let make_relational_database_snapshot 
  ?(from_relational_database_blueprint_id : string option)
  ?(from_relational_database_bundle_id : string option)
  ?(from_relational_database_arn : string option)
  ?(from_relational_database_name : string option)
  ?(state : string option)
  ?(size_in_gb : int option)
  ?(engine_version : string option)
  ?(engine : string option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : relational_database_snapshot = {
  from_relational_database_blueprint_id;
  from_relational_database_bundle_id;
  from_relational_database_arn;
  from_relational_database_name;
  state;
  size_in_gb;
  engine_version;
  engine;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_relational_database_hardware 
  ?(ram_size_in_gb : float option)
  ?(disk_size_in_gb : int option)
  ?(cpu_count : int option)
  () : relational_database_hardware = {
  ram_size_in_gb; disk_size_in_gb; cpu_count; 
}

let make_pending_modified_relational_database_values 
  ?(backup_retention_enabled : bool option)
  ?(engine_version : string option)
  ?(master_user_password : string option)
  () : pending_modified_relational_database_values = {
  backup_retention_enabled; engine_version; master_user_password; 
}

let make_relational_database_endpoint 
  ?(address : string option) ?(port : int option) ()
: relational_database_endpoint = { address; port; 
}

let make_pending_maintenance_action 
  ?(current_apply_date : float option)
  ?(description : string option)
  ?(action : string option)
  () : pending_maintenance_action = {
  current_apply_date; description; action;  }

let make_relational_database 
  ?(ca_certificate_identifier : string option)
  ?(pending_maintenance_actions : pending_maintenance_action list option)
  ?(master_endpoint : relational_database_endpoint option)
  ?(publicly_accessible : bool option)
  ?(preferred_maintenance_window : string option)
  ?(preferred_backup_window : string option)
  ?(parameter_apply_status : string option)
  ?(master_username : string option)
  ?(latest_restorable_time : float option)
  ?(engine_version : string option)
  ?(engine : string option)
  ?(pending_modified_values : pending_modified_relational_database_values option)
  ?(backup_retention_enabled : bool option)
  ?(secondary_availability_zone : string option)
  ?(state : string option)
  ?(hardware : relational_database_hardware option)
  ?(master_database_name : string option)
  ?(relational_database_bundle_id : string option)
  ?(relational_database_blueprint_id : string option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : relational_database = {
  ca_certificate_identifier;
  pending_maintenance_actions;
  master_endpoint;
  publicly_accessible;
  preferred_maintenance_window;
  preferred_backup_window;
  parameter_apply_status;
  master_username;
  latest_restorable_time;
  engine_version;
  engine;
  pending_modified_values;
  backup_retention_enabled;
  secondary_availability_zone;
  state;
  hardware;
  master_database_name;
  relational_database_bundle_id;
  relational_database_blueprint_id;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_relational_database_event 
  ?(event_categories : string list option)
  ?(message : string option)
  ?(created_at : float option)
  ?(resource : string option)
  () : relational_database_event = {
  event_categories; message; created_at; resource; 
}

let make_relational_database_bundle 
  ?(is_active : bool option)
  ?(is_encrypted : bool option)
  ?(cpu_count : int option)
  ?(transfer_per_month_in_gb : int option)
  ?(disk_size_in_gb : int option)
  ?(ram_size_in_gb : float option)
  ?(price : float option)
  ?(name : string option)
  ?(bundle_id : string option)
  () : relational_database_bundle = {
  is_active;
  is_encrypted;
  cpu_count;
  transfer_per_month_in_gb;
  disk_size_in_gb;
  ram_size_in_gb;
  price;
  name;
  bundle_id;
   }

let make_relational_database_blueprint 
  ?(is_engine_default : bool option)
  ?(engine_version_description : string option)
  ?(engine_description : string option)
  ?(engine_version : string option)
  ?(engine : relational_database_engine option)
  ?(blueprint_id : string option)
  () : relational_database_blueprint = {
  is_engine_default;
  engine_version_description;
  engine_description;
  engine_version;
  engine;
  blueprint_id;
   }

let make_name_servers_update_state 
  ?(message : string option)
  ?(code : name_servers_update_state_code option)
  () : name_servers_update_state = { message; code; 
}

let make_r53_hosted_zone_deletion_state 
  ?(message : string option)
  ?(code : r53_hosted_zone_deletion_state_code option)
  () : r53_hosted_zone_deletion_state = { message; code; 
}

let make_registered_domain_delegation_info 
  ?(r53_hosted_zone_deletion_state : r53_hosted_zone_deletion_state option)
  ?(name_servers_update_state : name_servers_update_state option)
  () : registered_domain_delegation_info = {
  r53_hosted_zone_deletion_state; name_servers_update_state; 
}

let make_container_image 
  ?(created_at : float option)
  ?(digest : string option)
  ?(image : string option)
  () : container_image = { created_at; digest; image; 
}

let make_register_container_image_request 
  ~(digest : string) ~(label : string) ~(service_name : string) ()
: register_container_image_request = { digest; label; service_name; 
}

let make_availability_zone 
  ?(state : string option) ?(zone_name : string option) ()
: availability_zone = { state; zone_name;  }

let make_region 
  ?(relational_database_availability_zones : availability_zone list option)
  ?(availability_zones : availability_zone list option)
  ?(name : region_name option)
  ?(display_name : string option)
  ?(description : string option)
  ?(continent_code : string option)
  () : region = {
  relational_database_availability_zones;
  availability_zones;
  name;
  display_name;
  description;
  continent_code;
   }

let make_reboot_relational_database_request 
  ~(relational_database_name : string) ()
: reboot_relational_database_request = { relational_database_name; 
}

let make_reboot_instance_request  ~(instance_name : string) ()
: reboot_instance_request = { instance_name;  }

let make_port_info 
  ?(cidr_list_aliases : string list option)
  ?(ipv6_cidrs : string list option)
  ?(cidrs : string list option)
  ?(protocol : network_protocol option)
  ?(to_port : int option)
  ?(from_port : int option)
  () : port_info = {
  cidr_list_aliases; ipv6_cidrs; cidrs; protocol; to_port; from_port; 
}

let make_put_instance_public_ports_request 
  ~(instance_name : string) ~(port_infos : port_info list) ()
: put_instance_public_ports_request = { instance_name; port_infos; 
}

let make_put_alarm_request 
  ?(notification_enabled : bool option)
  ?(notification_triggers : alarm_state list option)
  ?(contact_protocols : contact_protocol list option)
  ?(treat_missing_data : treat_missing_data option)
  ?(datapoints_to_alarm : int option)
  ~(evaluation_periods : int)
  ~(threshold : float)
  ~(comparison_operator : comparison_operator)
  ~(monitored_resource_name : string)
  ~(metric_name : metric_name)
  ~(alarm_name : string)
  () : put_alarm_request = {
  notification_enabled;
  notification_triggers;
  contact_protocols;
  treat_missing_data;
  datapoints_to_alarm;
  evaluation_periods;
  threshold;
  comparison_operator;
  monitored_resource_name;
  metric_name;
  alarm_name;
   }

let make_peer_vpc_request  () : peer_vpc_request = ()

let make_password_data 
  ?(key_pair_name : string option) ?(ciphertext : string option) ()
: password_data = { key_pair_name; ciphertext;  }

let make_origin 
  ?(response_timeout : int option)
  ?(protocol_policy : origin_protocol_policy_enum option)
  ?(region_name : region_name option)
  ?(resource_type : resource_type option)
  ?(name : string option)
  () : origin = {
  response_timeout; protocol_policy; region_name; resource_type; name; 
}

let make_open_instance_public_ports_request 
  ~(instance_name : string) ~(port_info : port_info) ()
: open_instance_public_ports_request = { instance_name; port_info; 
}

let make_monthly_transfer  ?(gb_per_month_allocated : int option) ()
: monthly_transfer = { gb_per_month_allocated; 
}

let make_monitored_resource_info 
  ?(resource_type : resource_type option)
  ?(name : string option)
  ?(arn : string option)
  () : monitored_resource_info = { resource_type; name; arn; 
}

let make_metric_datapoint 
  ?(unit_ : metric_unit option)
  ?(timestamp_ : float option)
  ?(sum : float option)
  ?(sample_count : float option)
  ?(minimum : float option)
  ?(maximum : float option)
  ?(average : float option)
  () : metric_datapoint = {
  unit_; timestamp_; sum; sample_count; minimum; maximum; average; 
}

let make_log_event 
  ?(message : string option) ?(created_at : float option) () : log_event = {
  message; created_at;  }

let make_load_balancer_tls_policy 
  ?(ciphers : string list option)
  ?(protocols : string list option)
  ?(description : string option)
  ?(is_default : bool option)
  ?(name : string option)
  () : load_balancer_tls_policy = {
  ciphers; protocols; description; is_default; name; 
}

let make_load_balancer_tls_certificate_summary 
  ?(is_attached : bool option) ?(name : string option) ()
: load_balancer_tls_certificate_summary = { is_attached; name; 
}

let make_load_balancer_tls_certificate_domain_validation_option 
  ?(validation_status : load_balancer_tls_certificate_domain_status option)
  ?(domain_name : string option)
  () : load_balancer_tls_certificate_domain_validation_option = {
  validation_status; domain_name; 
}

let make_load_balancer_tls_certificate_renewal_summary 
  ?(domain_validation_options : load_balancer_tls_certificate_domain_validation_option list option)
  ?(renewal_status : load_balancer_tls_certificate_renewal_status option)
  () : load_balancer_tls_certificate_renewal_summary = {
  domain_validation_options; renewal_status; 
}

let make_load_balancer_tls_certificate_dns_record_creation_state 
  ?(message : string option)
  ?(code : load_balancer_tls_certificate_dns_record_creation_state_code option)
  () : load_balancer_tls_certificate_dns_record_creation_state = {
  message; code; 
}

let make_load_balancer_tls_certificate_domain_validation_record 
  ?(dns_record_creation_state : load_balancer_tls_certificate_dns_record_creation_state option)
  ?(domain_name : string option)
  ?(validation_status : load_balancer_tls_certificate_domain_status option)
  ?(value : string option)
  ?(type_ : string option)
  ?(name : string option)
  () : load_balancer_tls_certificate_domain_validation_record = {
  dns_record_creation_state;
  domain_name;
  validation_status;
  value;
  type_;
  name;
   }

let make_load_balancer_tls_certificate 
  ?(subject_alternative_names : string list option)
  ?(subject : string option)
  ?(signature_algorithm : string option)
  ?(serial : string option)
  ?(revoked_at : float option)
  ?(revocation_reason : load_balancer_tls_certificate_revocation_reason option)
  ?(renewal_summary : load_balancer_tls_certificate_renewal_summary option)
  ?(not_before : float option)
  ?(not_after : float option)
  ?(key_algorithm : string option)
  ?(issuer : string option)
  ?(issued_at : float option)
  ?(failure_reason : load_balancer_tls_certificate_failure_reason option)
  ?(domain_validation_records : load_balancer_tls_certificate_domain_validation_record list option)
  ?(domain_name : string option)
  ?(status : load_balancer_tls_certificate_status option)
  ?(is_attached : bool option)
  ?(load_balancer_name : string option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : load_balancer_tls_certificate = {
  subject_alternative_names;
  subject;
  signature_algorithm;
  serial;
  revoked_at;
  revocation_reason;
  renewal_summary;
  not_before;
  not_after;
  key_algorithm;
  issuer;
  issued_at;
  failure_reason;
  domain_validation_records;
  domain_name;
  status;
  is_attached;
  load_balancer_name;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_instance_health_summary 
  ?(instance_health_reason : instance_health_reason option)
  ?(instance_health : instance_health_state option)
  ?(instance_name : string option)
  () : instance_health_summary = {
  instance_health_reason; instance_health; instance_name; 
}

let make_load_balancer 
  ?(tls_policy_name : string option)
  ?(https_redirection_enabled : bool option)
  ?(ip_address_type : ip_address_type option)
  ?(configuration_options : (string * string) list option)
  ?(tls_certificate_summaries : load_balancer_tls_certificate_summary list option)
  ?(instance_health_summary : instance_health_summary list option)
  ?(instance_port : int option)
  ?(health_check_path : string option)
  ?(public_ports : int list option)
  ?(protocol : load_balancer_protocol option)
  ?(state : load_balancer_state option)
  ?(dns_name : string option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : load_balancer = {
  tls_policy_name;
  https_redirection_enabled;
  ip_address_type;
  configuration_options;
  tls_certificate_summaries;
  instance_health_summary;
  instance_port;
  health_check_path;
  public_ports;
  protocol;
  state;
  dns_name;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_is_vpc_peered_request  () : is_vpc_peered_request =
()

let make_import_key_pair_request 
  ~(public_key_base64 : string) ~(key_pair_name : string) ()
: import_key_pair_request = { public_key_base64; key_pair_name; 
}

let make_get_static_ips_request  ?(page_token : string option) ()
: get_static_ips_request = { page_token;  }

let make_get_static_ip_request  ~(static_ip_name : string) ()
: get_static_ip_request = { static_ip_name; 
}

let make_get_setup_history_request 
  ?(page_token : string option) ~(resource_name : string) ()
: get_setup_history_request = { page_token; resource_name; 
}

let make_get_relational_database_snapshots_request 
  ?(page_token : string option) ()
: get_relational_database_snapshots_request = { page_token; 
}

let make_get_relational_database_snapshot_request 
  ~(relational_database_snapshot_name : string) ()
: get_relational_database_snapshot_request = {
  relational_database_snapshot_name; 
}

let make_get_relational_databases_request  ?(page_token : string option) ()
: get_relational_databases_request = { page_token; 
}

let make_get_relational_database_parameters_request 
  ?(page_token : string option) ~(relational_database_name : string) ()
: get_relational_database_parameters_request = {
  page_token; relational_database_name; 
}

let make_get_relational_database_metric_data_request 
  ~(statistics : metric_statistic list)
  ~(unit_ : metric_unit)
  ~(end_time : float)
  ~(start_time : float)
  ~(period : int)
  ~(metric_name : relational_database_metric_name)
  ~(relational_database_name : string)
  () : get_relational_database_metric_data_request = {
  statistics;
  unit_;
  end_time;
  start_time;
  period;
  metric_name;
  relational_database_name;
   }

let make_get_relational_database_master_user_password_request 
  ?(password_version : relational_database_password_version option)
  ~(relational_database_name : string)
  () : get_relational_database_master_user_password_request = {
  password_version; relational_database_name; 
}

let make_get_relational_database_log_streams_request 
  ~(relational_database_name : string) ()
: get_relational_database_log_streams_request = { relational_database_name; 
}

let make_get_relational_database_log_events_request 
  ?(page_token : string option)
  ?(start_from_head : bool option)
  ?(end_time : float option)
  ?(start_time : float option)
  ~(log_stream_name : string)
  ~(relational_database_name : string)
  () : get_relational_database_log_events_request = {
  page_token;
  start_from_head;
  end_time;
  start_time;
  log_stream_name;
  relational_database_name;
   }

let make_get_relational_database_events_request 
  ?(page_token : string option)
  ?(duration_in_minutes : int option)
  ~(relational_database_name : string)
  () : get_relational_database_events_request = {
  page_token; duration_in_minutes; relational_database_name; 
}

let make_get_relational_database_bundles_request 
  ?(include_inactive : bool option) ?(page_token : string option) ()
: get_relational_database_bundles_request = { include_inactive; page_token; 
}

let make_get_relational_database_blueprints_request 
  ?(page_token : string option) ()
: get_relational_database_blueprints_request = { page_token; 
}

let make_get_relational_database_request 
  ~(relational_database_name : string) () : get_relational_database_request =
{ relational_database_name;  }

let make_get_regions_request 
  ?(include_relational_database_availability_zones : bool option)
  ?(include_availability_zones : bool option)
  () : get_regions_request = {
  include_relational_database_availability_zones; include_availability_zones; 
}

let make_get_operations_for_resource_request 
  ?(page_token : string option) ~(resource_name : string) ()
: get_operations_for_resource_request = { page_token; resource_name; 
}

let make_get_operations_request  ?(page_token : string option) ()
: get_operations_request = { page_token;  }

let make_get_operation_request  ~(operation_id : string) ()
: get_operation_request = { operation_id; 
}

let make_get_load_balancer_tls_policies_request 
  ?(page_token : string option) () : get_load_balancer_tls_policies_request =
{ page_token;  }

let make_get_load_balancer_tls_certificates_request 
  ~(load_balancer_name : string) ()
: get_load_balancer_tls_certificates_request = { load_balancer_name; 
}

let make_get_load_balancers_request  ?(page_token : string option) ()
: get_load_balancers_request = { page_token; 
}

let make_get_load_balancer_metric_data_request 
  ~(statistics : metric_statistic list)
  ~(unit_ : metric_unit)
  ~(end_time : float)
  ~(start_time : float)
  ~(period : int)
  ~(metric_name : load_balancer_metric_name)
  ~(load_balancer_name : string)
  () : get_load_balancer_metric_data_request = {
  statistics;
  unit_;
  end_time;
  start_time;
  period;
  metric_name;
  load_balancer_name;
   }

let make_get_load_balancer_request  ~(load_balancer_name : string) ()
: get_load_balancer_request = { load_balancer_name;  }

let make_key_pair 
  ?(fingerprint : string option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : key_pair = {
  fingerprint;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_get_key_pairs_request 
  ?(include_default_key_pair : bool option) ?(page_token : string option) ()
: get_key_pairs_request = { include_default_key_pair; page_token; 
}

let make_get_key_pair_request  ~(key_pair_name : string) ()
: get_key_pair_request = { key_pair_name;  }

let make_instance_state  ?(name : string option) ?(code : int option) ()
: instance_state = { name; code;  }

let make_get_instance_state_request  ~(instance_name : string) ()
: get_instance_state_request = { instance_name;  }

let make_add_on 
  ?(duration : string option)
  ?(threshold : string option)
  ?(next_snapshot_time_of_day : string option)
  ?(snapshot_time_of_day : string option)
  ?(status : string option)
  ?(name : string option)
  () : add_on = {
  duration;
  threshold;
  next_snapshot_time_of_day;
  snapshot_time_of_day;
  status;
  name;
   }

let make_disk 
  ?(auto_mount_status : auto_mount_status option)
  ?(gb_in_use : int option)
  ?(attachment_state : string option)
  ?(is_attached : bool option)
  ?(attached_to : string option)
  ?(state : disk_state option)
  ?(path : string option)
  ?(iops : int option)
  ?(is_system_disk : bool option)
  ?(size_in_gb : int option)
  ?(add_ons : add_on list option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : disk = {
  auto_mount_status;
  gb_in_use;
  attachment_state;
  is_attached;
  attached_to;
  state;
  path;
  iops;
  is_system_disk;
  size_in_gb;
  add_ons;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_instance_snapshot 
  ?(size_in_gb : int option)
  ?(is_from_auto_snapshot : bool option)
  ?(from_bundle_id : string option)
  ?(from_blueprint_id : string option)
  ?(from_instance_arn : string option)
  ?(from_instance_name : string option)
  ?(from_attached_disks : disk list option)
  ?(progress : string option)
  ?(state : instance_snapshot_state option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : instance_snapshot = {
  size_in_gb;
  is_from_auto_snapshot;
  from_bundle_id;
  from_blueprint_id;
  from_instance_arn;
  from_instance_name;
  from_attached_disks;
  progress;
  state;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_get_instance_snapshots_request  ?(page_token : string option) ()
: get_instance_snapshots_request = { page_token; 
}

let make_get_instance_snapshot_request  ~(instance_snapshot_name : string) ()
: get_instance_snapshot_request = { instance_snapshot_name; 
}

let make_instance_hardware 
  ?(ram_size_in_gb : float option)
  ?(disks : disk list option)
  ?(cpu_count : int option)
  () : instance_hardware = { ram_size_in_gb; disks; cpu_count; 
}

let make_instance_port_info 
  ?(cidr_list_aliases : string list option)
  ?(ipv6_cidrs : string list option)
  ?(cidrs : string list option)
  ?(access_direction : access_direction option)
  ?(common_name : string option)
  ?(access_type : port_access_type option)
  ?(access_from : string option)
  ?(protocol : network_protocol option)
  ?(to_port : int option)
  ?(from_port : int option)
  () : instance_port_info = {
  cidr_list_aliases;
  ipv6_cidrs;
  cidrs;
  access_direction;
  common_name;
  access_type;
  access_from;
  protocol;
  to_port;
  from_port;
   }

let make_instance_networking 
  ?(ports : instance_port_info list option)
  ?(monthly_transfer : monthly_transfer option)
  () : instance_networking = { ports; monthly_transfer; 
}

let make_instance_metadata_options 
  ?(http_protocol_ipv6 : http_protocol_ipv6 option)
  ?(http_put_response_hop_limit : int option)
  ?(http_endpoint : http_endpoint option)
  ?(http_tokens : http_tokens option)
  ?(state : instance_metadata_state option)
  () : instance_metadata_options = {
  http_protocol_ipv6;
  http_put_response_hop_limit;
  http_endpoint;
  http_tokens;
  state;
   }

let make_instance 
  ?(metadata_options : instance_metadata_options option)
  ?(ssh_key_name : string option)
  ?(username : string option)
  ?(state : instance_state option)
  ?(networking : instance_networking option)
  ?(hardware : instance_hardware option)
  ?(ip_address_type : ip_address_type option)
  ?(ipv6_addresses : string list option)
  ?(public_ip_address : string option)
  ?(private_ip_address : string option)
  ?(is_static_ip : bool option)
  ?(add_ons : add_on list option)
  ?(bundle_id : string option)
  ?(blueprint_name : string option)
  ?(blueprint_id : string option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : instance = {
  metadata_options;
  ssh_key_name;
  username;
  state;
  networking;
  hardware;
  ip_address_type;
  ipv6_addresses;
  public_ip_address;
  private_ip_address;
  is_static_ip;
  add_ons;
  bundle_id;
  blueprint_name;
  blueprint_id;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_get_instances_request  ?(page_token : string option) ()
: get_instances_request = { page_token;  }

let make_instance_port_state 
  ?(cidr_list_aliases : string list option)
  ?(ipv6_cidrs : string list option)
  ?(cidrs : string list option)
  ?(state : port_state option)
  ?(protocol : network_protocol option)
  ?(to_port : int option)
  ?(from_port : int option)
  () : instance_port_state = {
  cidr_list_aliases; ipv6_cidrs; cidrs; state; protocol; to_port; from_port; 
}

let make_get_instance_port_states_request  ~(instance_name : string) ()
: get_instance_port_states_request = { instance_name; 
}

let make_get_instance_metric_data_request 
  ~(statistics : metric_statistic list)
  ~(unit_ : metric_unit)
  ~(end_time : float)
  ~(start_time : float)
  ~(period : int)
  ~(metric_name : instance_metric_name)
  ~(instance_name : string)
  () : get_instance_metric_data_request = {
  statistics;
  unit_;
  end_time;
  start_time;
  period;
  metric_name;
  instance_name;
   }

let make_host_key_attributes 
  ?(not_valid_after : float option)
  ?(not_valid_before : float option)
  ?(fingerprint_sh_a256 : string option)
  ?(fingerprint_sh_a1 : string option)
  ?(witnessed_at : float option)
  ?(public_key : string option)
  ?(algorithm : string option)
  () : host_key_attributes = {
  not_valid_after;
  not_valid_before;
  fingerprint_sh_a256;
  fingerprint_sh_a1;
  witnessed_at;
  public_key;
  algorithm;
   }

let make_instance_access_details 
  ?(host_keys : host_key_attributes list option)
  ?(username : string option)
  ?(instance_name : string option)
  ?(protocol : instance_access_protocol option)
  ?(private_key : string option)
  ?(password_data : password_data option)
  ?(password : string option)
  ?(ipv6_addresses : string list option)
  ?(ip_address : string option)
  ?(expires_at : float option)
  ?(cert_key : string option)
  () : instance_access_details = {
  host_keys;
  username;
  instance_name;
  protocol;
  private_key;
  password_data;
  password;
  ipv6_addresses;
  ip_address;
  expires_at;
  cert_key;
   }

let make_get_instance_access_details_request 
  ?(protocol : instance_access_protocol option) ~(instance_name : string) ()
: get_instance_access_details_request = { protocol; instance_name; 
}

let make_get_instance_request  ~(instance_name : string) ()
: get_instance_request = { instance_name;  }

let make_disk_info 
  ?(is_system_disk : bool option)
  ?(size_in_gb : int option)
  ?(path : string option)
  ?(name : string option)
  () : disk_info = { is_system_disk; size_in_gb; path; name; 
}

let make_instance_snapshot_info 
  ?(from_disk_info : disk_info list option)
  ?(from_blueprint_id : string option)
  ?(from_bundle_id : string option)
  () : instance_snapshot_info = {
  from_disk_info; from_blueprint_id; from_bundle_id; 
}

let make_disk_snapshot_info  ?(size_in_gb : int option) ()
: disk_snapshot_info = { size_in_gb; 
}

let make_export_snapshot_record_source_info 
  ?(disk_snapshot_info : disk_snapshot_info option)
  ?(instance_snapshot_info : instance_snapshot_info option)
  ?(from_resource_arn : string option)
  ?(from_resource_name : string option)
  ?(arn : string option)
  ?(name : string option)
  ?(created_at : float option)
  ?(resource_type : export_snapshot_record_source_type option)
  () : export_snapshot_record_source_info = {
  disk_snapshot_info;
  instance_snapshot_info;
  from_resource_arn;
  from_resource_name;
  arn;
  name;
  created_at;
  resource_type;
   }

let make_destination_info 
  ?(service : string option) ?(id : string option) () : destination_info = {
  service; id;  }

let make_export_snapshot_record 
  ?(destination_info : destination_info option)
  ?(source_info : export_snapshot_record_source_info option)
  ?(state : record_state option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(arn : string option)
  ?(name : string option)
  () : export_snapshot_record = {
  destination_info;
  source_info;
  state;
  resource_type;
  location;
  created_at;
  arn;
  name;
   }

let make_get_export_snapshot_records_request 
  ?(page_token : string option) () : get_export_snapshot_records_request = {
  page_token;  }

let make_domain 
  ?(registered_domain_delegation_info : registered_domain_delegation_info option)
  ?(domain_entries : domain_entry list option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : domain = {
  registered_domain_delegation_info;
  domain_entries;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_get_domains_request  ?(page_token : string option) ()
: get_domains_request = { page_token;  }

let make_get_domain_request  ~(domain_name : string) () : get_domain_request
= { domain_name;  }

let make_lightsail_distribution 
  ?(viewer_minimum_tls_protocol_version : string option)
  ?(tags : tag list option)
  ?(ip_address_type : ip_address_type option)
  ?(able_to_update_bundle : bool option)
  ?(cache_behaviors : cache_behavior_per_path list option)
  ?(cache_behavior_settings : cache_settings option)
  ?(default_cache_behavior : cache_behavior option)
  ?(origin_public_dn_s : string option)
  ?(origin : origin option)
  ?(certificate_name : string option)
  ?(bundle_id : string option)
  ?(domain_name : string option)
  ?(is_enabled : bool option)
  ?(status : string option)
  ?(alternative_domain_names : string list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : lightsail_distribution = {
  viewer_minimum_tls_protocol_version;
  tags;
  ip_address_type;
  able_to_update_bundle;
  cache_behaviors;
  cache_behavior_settings;
  default_cache_behavior;
  origin_public_dn_s;
  origin;
  certificate_name;
  bundle_id;
  domain_name;
  is_enabled;
  status;
  alternative_domain_names;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_get_distributions_request 
  ?(page_token : string option) ?(distribution_name : string option) ()
: get_distributions_request = { page_token; distribution_name; 
}

let make_get_distribution_metric_data_request 
  ~(statistics : metric_statistic list)
  ~(unit_ : metric_unit)
  ~(period : int)
  ~(end_time : float)
  ~(start_time : float)
  ~(metric_name : distribution_metric_name)
  ~(distribution_name : string)
  () : get_distribution_metric_data_request = {
  statistics;
  unit_;
  period;
  end_time;
  start_time;
  metric_name;
  distribution_name;
   }

let make_get_distribution_latest_cache_reset_request 
  ?(distribution_name : string option) ()
: get_distribution_latest_cache_reset_request = { distribution_name; 
}

let make_distribution_bundle 
  ?(is_active : bool option)
  ?(transfer_per_month_in_gb : int option)
  ?(price : float option)
  ?(name : string option)
  ?(bundle_id : string option)
  () : distribution_bundle = {
  is_active; transfer_per_month_in_gb; price; name; bundle_id; 
}

let make_get_distribution_bundles_request  ()
: get_distribution_bundles_request = ()

let make_disk_snapshot 
  ?(is_from_auto_snapshot : bool option)
  ?(from_instance_arn : string option)
  ?(from_instance_name : string option)
  ?(from_disk_arn : string option)
  ?(from_disk_name : string option)
  ?(progress : string option)
  ?(state : disk_snapshot_state option)
  ?(size_in_gb : int option)
  ?(tags : tag list option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(support_code : string option)
  ?(arn : string option)
  ?(name : string option)
  () : disk_snapshot = {
  is_from_auto_snapshot;
  from_instance_arn;
  from_instance_name;
  from_disk_arn;
  from_disk_name;
  progress;
  state;
  size_in_gb;
  tags;
  resource_type;
  location;
  created_at;
  support_code;
  arn;
  name;
   }

let make_get_disk_snapshots_request  ?(page_token : string option) ()
: get_disk_snapshots_request = { page_token; 
}

let make_get_disk_snapshot_request  ~(disk_snapshot_name : string) ()
: get_disk_snapshot_request = { disk_snapshot_name; 
}

let make_get_disks_request  ?(page_token : string option) ()
: get_disks_request = { page_token;  }

let make_get_disk_request  ~(disk_name : string) () : get_disk_request = {
  disk_name;  }

let make_get_cost_estimate_request 
  ~(end_time : float) ~(start_time : float) ~(resource_name : string) ()
: get_cost_estimate_request = { end_time; start_time; resource_name; 
}

let make_get_container_services_request  ?(service_name : string option) ()
: get_container_services_request = { service_name; 
}

let make_container_service_power 
  ?(is_active : bool option)
  ?(name : string option)
  ?(ram_size_in_gb : float option)
  ?(cpu_count : float option)
  ?(price : float option)
  ?(power_id : string option)
  () : container_service_power = {
  is_active; name; ram_size_in_gb; cpu_count; price; power_id; 
}

let make_get_container_service_powers_request  ()
: get_container_service_powers_request =
()

let make_get_container_service_metric_data_request 
  ~(statistics : metric_statistic list)
  ~(period : int)
  ~(end_time : float)
  ~(start_time : float)
  ~(metric_name : container_service_metric_name)
  ~(service_name : string)
  () : get_container_service_metric_data_request = {
  statistics; period; end_time; start_time; metric_name; service_name; 
}

let make_get_container_service_deployments_request 
  ~(service_name : string) () : get_container_service_deployments_request = {
  service_name;  }

let make_container_service_log_event 
  ?(message : string option) ?(created_at : float option) ()
: container_service_log_event = { message; created_at; 
}

let make_get_container_log_request 
  ?(page_token : string option)
  ?(filter_pattern : string option)
  ?(end_time : float option)
  ?(start_time : float option)
  ~(container_name : string)
  ~(service_name : string)
  () : get_container_log_request = {
  page_token;
  filter_pattern;
  end_time;
  start_time;
  container_name;
  service_name;
   }

let make_get_container_images_request  ~(service_name : string) ()
: get_container_images_request = { service_name; 
}

let make_get_container_api_metadata_request  ()
: get_container_api_metadata_request = ()

let make_contact_method 
  ?(support_code : string option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(arn : string option)
  ?(name : string option)
  ?(protocol : contact_protocol option)
  ?(status : contact_method_status option)
  ?(contact_endpoint : string option)
  () : contact_method = {
  support_code;
  resource_type;
  location;
  created_at;
  arn;
  name;
  protocol;
  status;
  contact_endpoint;
   }

let make_get_contact_methods_request 
  ?(protocols : contact_protocol list option) ()
: get_contact_methods_request = { protocols; 
}

let make_cloud_formation_stack_record_source_info 
  ?(arn : string option)
  ?(name : string option)
  ?(resource_type : cloud_formation_stack_record_source_type option)
  () : cloud_formation_stack_record_source_info = {
  arn; name; resource_type;  }

let make_cloud_formation_stack_record 
  ?(destination_info : destination_info option)
  ?(source_info : cloud_formation_stack_record_source_info list option)
  ?(state : record_state option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(arn : string option)
  ?(name : string option)
  () : cloud_formation_stack_record = {
  destination_info;
  source_info;
  state;
  resource_type;
  location;
  created_at;
  arn;
  name;
   }

let make_get_cloud_formation_stack_records_request 
  ?(page_token : string option) ()
: get_cloud_formation_stack_records_request = { page_token; 
}

let make_certificate 
  ?(support_code : string option)
  ?(tags : tag list option)
  ?(revocation_reason : string option)
  ?(revoked_at : float option)
  ?(renewal_summary : renewal_summary option)
  ?(eligible_to_renew : string option)
  ?(not_after : float option)
  ?(not_before : float option)
  ?(issuer_c_a : string option)
  ?(issued_at : float option)
  ?(created_at : float option)
  ?(key_algorithm : string option)
  ?(in_use_resource_count : int option)
  ?(request_failure_reason : string option)
  ?(domain_validation_records : domain_validation_record list option)
  ?(subject_alternative_names : string list option)
  ?(serial_number : string option)
  ?(status : certificate_status option)
  ?(domain_name : string option)
  ?(name : string option)
  ?(arn : string option)
  () : certificate = {
  support_code;
  tags;
  revocation_reason;
  revoked_at;
  renewal_summary;
  eligible_to_renew;
  not_after;
  not_before;
  issuer_c_a;
  issued_at;
  created_at;
  key_algorithm;
  in_use_resource_count;
  request_failure_reason;
  domain_validation_records;
  subject_alternative_names;
  serial_number;
  status;
  domain_name;
  name;
  arn;
   }

let make_certificate_summary 
  ?(tags : tag list option)
  ?(certificate_detail : certificate option)
  ?(domain_name : string option)
  ?(certificate_name : string option)
  ?(certificate_arn : string option)
  () : certificate_summary = {
  tags; certificate_detail; domain_name; certificate_name; certificate_arn; 
}

let make_get_certificates_request 
  ?(page_token : string option)
  ?(certificate_name : string option)
  ?(include_certificate_details : bool option)
  ?(certificate_statuses : certificate_status list option)
  () : get_certificates_request = {
  page_token;
  certificate_name;
  include_certificate_details;
  certificate_statuses;
   }

let make_bundle 
  ?(public_ipv4_address_count : int option)
  ?(supported_app_categories : app_category list option)
  ?(supported_platforms : instance_platform list option)
  ?(transfer_per_month_in_gb : int option)
  ?(ram_size_in_gb : float option)
  ?(power : int option)
  ?(name : string option)
  ?(is_active : bool option)
  ?(instance_type : string option)
  ?(bundle_id : string option)
  ?(disk_size_in_gb : int option)
  ?(cpu_count : int option)
  ?(price : float option)
  () : bundle = {
  public_ipv4_address_count;
  supported_app_categories;
  supported_platforms;
  transfer_per_month_in_gb;
  ram_size_in_gb;
  power;
  name;
  is_active;
  instance_type;
  bundle_id;
  disk_size_in_gb;
  cpu_count;
  price;
   }

let make_get_bundles_request 
  ?(app_category : app_category option)
  ?(page_token : string option)
  ?(include_inactive : bool option)
  () : get_bundles_request = { app_category; page_token; include_inactive; 
}

let make_account_level_bpa_sync 
  ?(bpa_impacts_lightsail : bool option)
  ?(message : bpa_status_message option)
  ?(last_synced_at : float option)
  ?(status : account_level_bpa_sync_status option)
  () : account_level_bpa_sync = {
  bpa_impacts_lightsail; message; last_synced_at; status; 
}

let make_get_buckets_request 
  ?(include_connected_resources : bool option)
  ?(page_token : string option)
  ?(bucket_name : string option)
  () : get_buckets_request = {
  include_connected_resources; page_token; bucket_name; 
}

let make_get_bucket_metric_data_request 
  ~(unit_ : metric_unit)
  ~(statistics : metric_statistic list)
  ~(period : int)
  ~(end_time : float)
  ~(start_time : float)
  ~(metric_name : bucket_metric_name)
  ~(bucket_name : string)
  () : get_bucket_metric_data_request = {
  unit_; statistics; period; end_time; start_time; metric_name; bucket_name; 
}

let make_bucket_bundle 
  ?(is_active : bool option)
  ?(transfer_per_month_in_gb : int option)
  ?(storage_per_month_in_gb : int option)
  ?(price : float option)
  ?(name : string option)
  ?(bundle_id : string option)
  () : bucket_bundle = {
  is_active;
  transfer_per_month_in_gb;
  storage_per_month_in_gb;
  price;
  name;
  bundle_id;
   }

let make_get_bucket_bundles_request  ?(include_inactive : bool option) ()
: get_bucket_bundles_request = { include_inactive; 
}

let make_access_key_last_used 
  ?(service_name : string option)
  ?(region : string option)
  ?(last_used_date : float option)
  () : access_key_last_used = { service_name; region; last_used_date; 
}

let make_access_key 
  ?(last_used : access_key_last_used option)
  ?(created_at : float option)
  ?(status : status_type option)
  ?(secret_access_key : string option)
  ?(access_key_id : string option)
  () : access_key = {
  last_used; created_at; status; secret_access_key; access_key_id; 
}

let make_get_bucket_access_keys_request  ~(bucket_name : string) ()
: get_bucket_access_keys_request = { bucket_name;  }

let make_blueprint 
  ?(app_category : app_category option)
  ?(platform : instance_platform option)
  ?(license_url : string option)
  ?(product_url : string option)
  ?(version_code : string option)
  ?(version : string option)
  ?(min_power : int option)
  ?(is_active : bool option)
  ?(description : string option)
  ?(type_ : blueprint_type option)
  ?(group : string option)
  ?(name : string option)
  ?(blueprint_id : string option)
  () : blueprint = {
  app_category;
  platform;
  license_url;
  product_url;
  version_code;
  version;
  min_power;
  is_active;
  description;
  type_;
  group;
  name;
  blueprint_id;
   }

let make_get_blueprints_request 
  ?(app_category : app_category option)
  ?(page_token : string option)
  ?(include_inactive : bool option)
  () : get_blueprints_request = {
  app_category; page_token; include_inactive;  }

let make_attached_disk  ?(size_in_gb : int option) ?(path : string option) ()
: attached_disk = { size_in_gb; path;  }

let make_auto_snapshot_details 
  ?(from_attached_disks : attached_disk list option)
  ?(status : auto_snapshot_status option)
  ?(created_at : float option)
  ?(date : string option)
  () : auto_snapshot_details = {
  from_attached_disks; status; created_at; date; 
}

let make_get_auto_snapshots_request  ~(resource_name : string) ()
: get_auto_snapshots_request = { resource_name;  }

let make_alarm 
  ?(notification_enabled : bool option)
  ?(notification_triggers : alarm_state list option)
  ?(contact_protocols : contact_protocol list option)
  ?(unit_ : metric_unit option)
  ?(state : alarm_state option)
  ?(metric_name : metric_name option)
  ?(statistic : metric_statistic option)
  ?(treat_missing_data : treat_missing_data option)
  ?(datapoints_to_alarm : int option)
  ?(threshold : float option)
  ?(period : int option)
  ?(evaluation_periods : int option)
  ?(comparison_operator : comparison_operator option)
  ?(monitored_resource_info : monitored_resource_info option)
  ?(support_code : string option)
  ?(resource_type : resource_type option)
  ?(location : resource_location option)
  ?(created_at : float option)
  ?(arn : string option)
  ?(name : string option)
  () : alarm = {
  notification_enabled;
  notification_triggers;
  contact_protocols;
  unit_;
  state;
  metric_name;
  statistic;
  treat_missing_data;
  datapoints_to_alarm;
  threshold;
  period;
  evaluation_periods;
  comparison_operator;
  monitored_resource_info;
  support_code;
  resource_type;
  location;
  created_at;
  arn;
  name;
   }

let make_get_alarms_request 
  ?(monitored_resource_name : string option)
  ?(page_token : string option)
  ?(alarm_name : string option)
  () : get_alarms_request = {
  monitored_resource_name; page_token; alarm_name; 
}

let make_get_active_names_request  ?(page_token : string option) ()
: get_active_names_request = { page_token; 
}

let make_export_snapshot_request  ~(source_snapshot_name : string) ()
: export_snapshot_request = { source_snapshot_name; 
}

let make_auto_snapshot_add_on_request 
  ?(snapshot_time_of_day : string option) () : auto_snapshot_add_on_request =
{ snapshot_time_of_day;  }

let make_add_on_request 
  ?(stop_instance_on_idle_request : stop_instance_on_idle_request option)
  ?(auto_snapshot_add_on_request : auto_snapshot_add_on_request option)
  ~(add_on_type : add_on_type)
  () : add_on_request = {
  stop_instance_on_idle_request; auto_snapshot_add_on_request; add_on_type; 
}

let make_enable_add_on_request 
  ~(add_on_request : add_on_request) ~(resource_name : string) ()
: enable_add_on_request = { add_on_request; resource_name; 
}

let make_download_default_key_pair_request  ()
: download_default_key_pair_request = ()

let make_disable_add_on_request 
  ~(resource_name : string) ~(add_on_type : add_on_type) ()
: disable_add_on_request = { resource_name; add_on_type; 
}

let make_detach_static_ip_request  ~(static_ip_name : string) ()
: detach_static_ip_request = { static_ip_name; 
}

let make_detach_instances_from_load_balancer_request 
  ~(instance_names : string list) ~(load_balancer_name : string) ()
: detach_instances_from_load_balancer_request = {
  instance_names; load_balancer_name;  }

let make_detach_disk_request  ~(disk_name : string) () : detach_disk_request
= { disk_name;  }

let make_detach_certificate_from_distribution_request 
  ~(distribution_name : string) ()
: detach_certificate_from_distribution_request = { distribution_name; 
}

let make_delete_relational_database_snapshot_request 
  ~(relational_database_snapshot_name : string) ()
: delete_relational_database_snapshot_request = {
  relational_database_snapshot_name; 
}

let make_delete_relational_database_request 
  ?(final_relational_database_snapshot_name : string option)
  ?(skip_final_snapshot : bool option)
  ~(relational_database_name : string)
  () : delete_relational_database_request = {
  final_relational_database_snapshot_name;
  skip_final_snapshot;
  relational_database_name;
   }

let make_delete_load_balancer_tls_certificate_request 
  ?(force : bool option)
  ~(certificate_name : string)
  ~(load_balancer_name : string)
  () : delete_load_balancer_tls_certificate_request = {
  force; certificate_name; load_balancer_name; 
}

let make_delete_load_balancer_request  ~(load_balancer_name : string) ()
: delete_load_balancer_request = { load_balancer_name; 
}

let make_delete_known_host_keys_request  ~(instance_name : string) ()
: delete_known_host_keys_request = { instance_name; 
}

let make_delete_key_pair_request 
  ?(expected_fingerprint : string option) ~(key_pair_name : string) ()
: delete_key_pair_request = { expected_fingerprint; key_pair_name; 
}

let make_delete_instance_snapshot_request 
  ~(instance_snapshot_name : string) () : delete_instance_snapshot_request =
{ instance_snapshot_name;  }

let make_delete_instance_request 
  ?(force_delete_add_ons : bool option) ~(instance_name : string) ()
: delete_instance_request = { force_delete_add_ons; instance_name; 
}

let make_delete_domain_entry_request 
  ~(domain_entry : domain_entry) ~(domain_name : string) ()
: delete_domain_entry_request = { domain_entry; domain_name; 
}

let make_delete_domain_request  ~(domain_name : string) ()
: delete_domain_request = { domain_name; 
}

let make_delete_distribution_request  ?(distribution_name : string option) ()
: delete_distribution_request = { distribution_name; 
}

let make_delete_disk_snapshot_request  ~(disk_snapshot_name : string) ()
: delete_disk_snapshot_request = { disk_snapshot_name; 
}

let make_delete_disk_request 
  ?(force_delete_add_ons : bool option) ~(disk_name : string) ()
: delete_disk_request = { force_delete_add_ons; disk_name; 
}

let make_delete_container_service_request  ~(service_name : string) ()
: delete_container_service_request = { service_name; 
}

let make_delete_container_image_request 
  ~(image : string) ~(service_name : string) ()
: delete_container_image_request = { image; service_name; 
}

let make_delete_contact_method_request  ~(protocol : contact_protocol) ()
: delete_contact_method_request = { protocol; 
}

let make_delete_certificate_request  ~(certificate_name : string) ()
: delete_certificate_request = { certificate_name; 
}

let make_delete_bucket_access_key_request 
  ~(access_key_id : string) ~(bucket_name : string) ()
: delete_bucket_access_key_request = { access_key_id; bucket_name; 
}

let make_delete_bucket_request 
  ?(force_delete : bool option) ~(bucket_name : string) ()
: delete_bucket_request = { force_delete; bucket_name; 
}

let make_delete_auto_snapshot_request 
  ~(date : string) ~(resource_name : string) ()
: delete_auto_snapshot_request = { date; resource_name; 
}

let make_delete_alarm_request  ~(alarm_name : string) ()
: delete_alarm_request = { alarm_name; 
}

let make_create_relational_database_snapshot_request 
  ?(tags : tag list option)
  ~(relational_database_snapshot_name : string)
  ~(relational_database_name : string)
  () : create_relational_database_snapshot_request = {
  tags; relational_database_snapshot_name; relational_database_name; 
}

let make_create_relational_database_from_snapshot_request 
  ?(tags : tag list option)
  ?(use_latest_restorable_time : bool option)
  ?(restore_time : float option)
  ?(source_relational_database_name : string option)
  ?(relational_database_bundle_id : string option)
  ?(relational_database_snapshot_name : string option)
  ?(publicly_accessible : bool option)
  ?(availability_zone : string option)
  ~(relational_database_name : string)
  () : create_relational_database_from_snapshot_request = {
  tags;
  use_latest_restorable_time;
  restore_time;
  source_relational_database_name;
  relational_database_bundle_id;
  relational_database_snapshot_name;
  publicly_accessible;
  availability_zone;
  relational_database_name;
   }

let make_create_relational_database_request 
  ?(tags : tag list option)
  ?(publicly_accessible : bool option)
  ?(preferred_maintenance_window : string option)
  ?(preferred_backup_window : string option)
  ?(master_user_password : string option)
  ?(availability_zone : string option)
  ~(master_username : string)
  ~(master_database_name : string)
  ~(relational_database_bundle_id : string)
  ~(relational_database_blueprint_id : string)
  ~(relational_database_name : string)
  () : create_relational_database_request = {
  tags;
  publicly_accessible;
  preferred_maintenance_window;
  preferred_backup_window;
  master_user_password;
  master_username;
  master_database_name;
  relational_database_bundle_id;
  relational_database_blueprint_id;
  availability_zone;
  relational_database_name;
   }

let make_create_load_balancer_tls_certificate_request 
  ?(tags : tag list option)
  ?(certificate_alternative_names : string list option)
  ~(certificate_domain_name : string)
  ~(certificate_name : string)
  ~(load_balancer_name : string)
  () : create_load_balancer_tls_certificate_request = {
  tags;
  certificate_alternative_names;
  certificate_domain_name;
  certificate_name;
  load_balancer_name;
   }

let make_create_load_balancer_request 
  ?(tls_policy_name : string option)
  ?(ip_address_type : ip_address_type option)
  ?(tags : tag list option)
  ?(certificate_alternative_names : string list option)
  ?(certificate_domain_name : string option)
  ?(certificate_name : string option)
  ?(health_check_path : string option)
  ~(instance_port : int)
  ~(load_balancer_name : string)
  () : create_load_balancer_request = {
  tls_policy_name;
  ip_address_type;
  tags;
  certificate_alternative_names;
  certificate_domain_name;
  certificate_name;
  health_check_path;
  instance_port;
  load_balancer_name;
   }

let make_create_key_pair_request 
  ?(tags : tag list option) ~(key_pair_name : string) ()
: create_key_pair_request = { tags; key_pair_name; 
}

let make_create_instance_snapshot_request 
  ?(tags : tag list option)
  ~(instance_name : string)
  ~(instance_snapshot_name : string)
  () : create_instance_snapshot_request = {
  tags; instance_name; instance_snapshot_name;  }

let make_disk_map 
  ?(new_disk_name : string option) ?(original_disk_path : string option) ()
: disk_map = { new_disk_name; original_disk_path; 
}

let make_create_instances_from_snapshot_request 
  ?(use_latest_restorable_auto_snapshot : bool option)
  ?(restore_date : string option)
  ?(source_instance_name : string option)
  ?(ip_address_type : ip_address_type option)
  ?(add_ons : add_on_request list option)
  ?(tags : tag list option)
  ?(key_pair_name : string option)
  ?(user_data : string option)
  ?(instance_snapshot_name : string option)
  ?(attached_disk_mapping : (string * disk_map list) list option)
  ~(bundle_id : string)
  ~(availability_zone : string)
  ~(instance_names : string list)
  () : create_instances_from_snapshot_request = {
  use_latest_restorable_auto_snapshot;
  restore_date;
  source_instance_name;
  ip_address_type;
  add_ons;
  tags;
  key_pair_name;
  user_data;
  bundle_id;
  instance_snapshot_name;
  availability_zone;
  attached_disk_mapping;
  instance_names;
   }

let make_create_instances_request 
  ?(ip_address_type : ip_address_type option)
  ?(add_ons : add_on_request list option)
  ?(tags : tag list option)
  ?(key_pair_name : string option)
  ?(user_data : string option)
  ?(custom_image_name : string option)
  ~(bundle_id : string)
  ~(blueprint_id : string)
  ~(availability_zone : string)
  ~(instance_names : string list)
  () : create_instances_request = {
  ip_address_type;
  add_ons;
  tags;
  key_pair_name;
  user_data;
  bundle_id;
  blueprint_id;
  custom_image_name;
  availability_zone;
  instance_names;
   }

let make_create_gui_session_access_details_request 
  ~(resource_name : string) () : create_gui_session_access_details_request =
{ resource_name;  }

let make_create_domain_entry_request 
  ~(domain_entry : domain_entry) ~(domain_name : string) ()
: create_domain_entry_request = { domain_entry; domain_name; 
}

let make_create_domain_request 
  ?(tags : tag list option) ~(domain_name : string) ()
: create_domain_request = { tags; domain_name; 
}

let make_create_distribution_request 
  ?(viewer_minimum_tls_protocol_version : viewer_minimum_tls_protocol_version_enum option)
  ?(certificate_name : string option)
  ?(tags : tag list option)
  ?(ip_address_type : ip_address_type option)
  ?(cache_behaviors : cache_behavior_per_path list option)
  ?(cache_behavior_settings : cache_settings option)
  ~(bundle_id : string)
  ~(default_cache_behavior : cache_behavior)
  ~(origin : input_origin)
  ~(distribution_name : string)
  () : create_distribution_request = {
  viewer_minimum_tls_protocol_version;
  certificate_name;
  tags;
  ip_address_type;
  bundle_id;
  cache_behaviors;
  cache_behavior_settings;
  default_cache_behavior;
  origin;
  distribution_name;
   }

let make_create_disk_snapshot_request 
  ?(tags : tag list option)
  ?(instance_name : string option)
  ?(disk_name : string option)
  ~(disk_snapshot_name : string)
  () : create_disk_snapshot_request = {
  tags; instance_name; disk_snapshot_name; disk_name; 
}

let make_create_disk_from_snapshot_request 
  ?(use_latest_restorable_auto_snapshot : bool option)
  ?(restore_date : string option)
  ?(source_disk_name : string option)
  ?(add_ons : add_on_request list option)
  ?(tags : tag list option)
  ?(disk_snapshot_name : string option)
  ~(size_in_gb : int)
  ~(availability_zone : string)
  ~(disk_name : string)
  () : create_disk_from_snapshot_request = {
  use_latest_restorable_auto_snapshot;
  restore_date;
  source_disk_name;
  add_ons;
  tags;
  size_in_gb;
  availability_zone;
  disk_snapshot_name;
  disk_name;
   }

let make_create_disk_request 
  ?(add_ons : add_on_request list option)
  ?(tags : tag list option)
  ~(size_in_gb : int)
  ~(availability_zone : string)
  ~(disk_name : string)
  () : create_disk_request = {
  add_ons; tags; size_in_gb; availability_zone; disk_name; 
}

let make_container_service_registry_login 
  ?(registry : string option)
  ?(expires_at : float option)
  ?(password : string option)
  ?(username : string option)
  () : container_service_registry_login = {
  registry; expires_at; password; username; 
}

let make_create_container_service_registry_login_request  ()
: create_container_service_registry_login_request =
()

let make_endpoint_request 
  ?(health_check : container_service_health_check_config option)
  ~(container_port : int)
  ~(container_name : string)
  () : endpoint_request = { health_check; container_port; container_name; 
}

let make_create_container_service_deployment_request 
  ?(public_endpoint : endpoint_request option)
  ?(containers : (string * container) list option)
  ~(service_name : string)
  () : create_container_service_deployment_request = {
  public_endpoint; containers; service_name; 
}

let make_container_service_deployment_request 
  ?(public_endpoint : endpoint_request option)
  ?(containers : (string * container) list option)
  () : container_service_deployment_request = { public_endpoint; containers; 
}

let make_create_container_service_request 
  ?(private_registry_access : private_registry_access_request option)
  ?(deployment : container_service_deployment_request option)
  ?(public_domain_names : (string * string list) list option)
  ?(tags : tag list option)
  ~(scale : int)
  ~(power : container_service_power_name)
  ~(service_name : string)
  () : create_container_service_request = {
  private_registry_access;
  deployment;
  public_domain_names;
  tags;
  scale;
  power;
  service_name;
   }

let make_create_contact_method_request 
  ~(contact_endpoint : string) ~(protocol : contact_protocol) ()
: create_contact_method_request = { contact_endpoint; protocol; 
}

let make_instance_entry 
  ?(user_data : string option)
  ~(availability_zone : string)
  ~(port_info_source : port_info_source_type)
  ~(instance_type : string)
  ~(source_name : string)
  () : instance_entry = {
  availability_zone; user_data; port_info_source; instance_type; source_name; 
}

let make_create_cloud_formation_stack_request 
  ~(instances : instance_entry list) ()
: create_cloud_formation_stack_request = { instances; 
}

let make_create_certificate_request 
  ?(tags : tag list option)
  ?(subject_alternative_names : string list option)
  ~(domain_name : string)
  ~(certificate_name : string)
  () : create_certificate_request = {
  tags; subject_alternative_names; domain_name; certificate_name; 
}

let make_create_bucket_access_key_request  ~(bucket_name : string) ()
: create_bucket_access_key_request = { bucket_name; 
}

let make_create_bucket_request 
  ?(enable_object_versioning : bool option)
  ?(tags : tag list option)
  ~(bundle_id : string)
  ~(bucket_name : string)
  () : create_bucket_request = {
  enable_object_versioning; tags; bundle_id; bucket_name; 
}

let make_copy_snapshot_request 
  ?(use_latest_restorable_auto_snapshot : bool option)
  ?(restore_date : string option)
  ?(source_resource_name : string option)
  ?(source_snapshot_name : string option)
  ~(source_region : region_name)
  ~(target_snapshot_name : string)
  () : copy_snapshot_request = {
  source_region;
  target_snapshot_name;
  use_latest_restorable_auto_snapshot;
  restore_date;
  source_resource_name;
  source_snapshot_name;
   }

let make_close_instance_public_ports_request 
  ~(instance_name : string) ~(port_info : port_info) ()
: close_instance_public_ports_request = { instance_name; port_info; 
}

let make_attach_static_ip_request 
  ~(instance_name : string) ~(static_ip_name : string) ()
: attach_static_ip_request = { instance_name; static_ip_name; 
}

let make_attach_load_balancer_tls_certificate_request 
  ~(certificate_name : string) ~(load_balancer_name : string) ()
: attach_load_balancer_tls_certificate_request = {
  certificate_name; load_balancer_name; 
}

let make_attach_instances_to_load_balancer_request 
  ~(instance_names : string list) ~(load_balancer_name : string) ()
: attach_instances_to_load_balancer_request = {
  instance_names; load_balancer_name;  }

let make_attach_disk_request 
  ?(auto_mounting : bool option)
  ~(disk_path : string)
  ~(instance_name : string)
  ~(disk_name : string)
  () : attach_disk_request = {
  auto_mounting; disk_path; instance_name; disk_name; 
}

let make_attach_certificate_to_distribution_request 
  ~(certificate_name : string) ~(distribution_name : string) ()
: attach_certificate_to_distribution_request = {
  certificate_name; distribution_name;  }

let make_allocate_static_ip_request  ~(static_ip_name : string) ()
: allocate_static_ip_request = { static_ip_name; 
}

