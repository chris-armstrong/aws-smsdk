[@@@warning "-39"]
open Types
let make_vpc_ingress_connection_summary 
  ?(service_arn : string option)
  ?(vpc_ingress_connection_arn : string option)
  () : vpc_ingress_connection_summary = {
  service_arn; vpc_ingress_connection_arn; 
}

let make_ingress_vpc_configuration 
  ?(vpc_endpoint_id : string option) ?(vpc_id : string option) ()
: ingress_vpc_configuration = { vpc_endpoint_id; vpc_id; 
}

let make_vpc_ingress_connection 
  ?(deleted_at : float option)
  ?(created_at : float option)
  ?(ingress_vpc_configuration : ingress_vpc_configuration option)
  ?(domain_name : string option)
  ?(account_id : string option)
  ?(status : vpc_ingress_connection_status option)
  ?(service_arn : string option)
  ?(vpc_ingress_connection_name : string option)
  ?(vpc_ingress_connection_arn : string option)
  () : vpc_ingress_connection = {
  deleted_at;
  created_at;
  ingress_vpc_configuration;
  domain_name;
  account_id;
  status;
  service_arn;
  vpc_ingress_connection_name;
  vpc_ingress_connection_arn;
   }

let make_vpc_dns_target 
  ?(domain_name : string option)
  ?(vpc_id : string option)
  ?(vpc_ingress_connection_arn : string option)
  () : vpc_dns_target = { domain_name; vpc_id; vpc_ingress_connection_arn; 
}

let make_vpc_connector 
  ?(deleted_at : float option)
  ?(created_at : float option)
  ?(status : vpc_connector_status option)
  ?(security_groups : string list option)
  ?(subnets : string list option)
  ?(vpc_connector_revision : int option)
  ?(vpc_connector_arn : string option)
  ?(vpc_connector_name : string option)
  () : vpc_connector = {
  deleted_at;
  created_at;
  status;
  security_groups;
  subnets;
  vpc_connector_revision;
  vpc_connector_arn;
  vpc_connector_name;
   }

let make_update_vpc_ingress_connection_response 
  ~(vpc_ingress_connection : vpc_ingress_connection) ()
: update_vpc_ingress_connection_response = { vpc_ingress_connection; 
}

let make_update_vpc_ingress_connection_request 
  ~(ingress_vpc_configuration : ingress_vpc_configuration)
  ~(vpc_ingress_connection_arn : string)
  () : update_vpc_ingress_connection_request = {
  ingress_vpc_configuration; vpc_ingress_connection_arn; 
}

let make_source_code_version 
  ~(value : string) ~(type_ : source_code_version_type) ()
: source_code_version = { value; type_;  }

let make_code_configuration_values 
  ?(runtime_environment_secrets : (string * string) list option)
  ?(runtime_environment_variables : (string * string) list option)
  ?(port : string option)
  ?(start_command : string option)
  ?(build_command : string option)
  ~(runtime : runtime)
  () : code_configuration_values = {
  runtime_environment_secrets;
  runtime_environment_variables;
  port;
  start_command;
  build_command;
  runtime;
   }

let make_code_configuration 
  ?(code_configuration_values : code_configuration_values option)
  ~(configuration_source : configuration_source)
  () : code_configuration = {
  code_configuration_values; configuration_source; 
}

let make_code_repository 
  ?(source_directory : string option)
  ?(code_configuration : code_configuration option)
  ~(source_code_version : source_code_version)
  ~(repository_url : string)
  () : code_repository = {
  source_directory; code_configuration; source_code_version; repository_url; 
}

let make_image_configuration 
  ?(runtime_environment_secrets : (string * string) list option)
  ?(port : string option)
  ?(start_command : string option)
  ?(runtime_environment_variables : (string * string) list option)
  () : image_configuration = {
  runtime_environment_secrets;
  port;
  start_command;
  runtime_environment_variables;
   }

let make_image_repository 
  ?(image_configuration : image_configuration option)
  ~(image_repository_type : image_repository_type)
  ~(image_identifier : string)
  () : image_repository = {
  image_repository_type; image_configuration; image_identifier; 
}

let make_authentication_configuration 
  ?(access_role_arn : string option) ?(connection_arn : string option) ()
: authentication_configuration = { access_role_arn; connection_arn; 
}

let make_source_configuration 
  ?(authentication_configuration : authentication_configuration option)
  ?(auto_deployments_enabled : bool option)
  ?(image_repository : image_repository option)
  ?(code_repository : code_repository option)
  () : source_configuration = {
  authentication_configuration;
  auto_deployments_enabled;
  image_repository;
  code_repository;
   }

let make_instance_configuration 
  ?(instance_role_arn : string option)
  ?(memory : string option)
  ?(cpu : string option)
  () : instance_configuration = { instance_role_arn; memory; cpu; 
}

let make_encryption_configuration  ~(kms_key : string) ()
: encryption_configuration = { kms_key; 
}

let make_health_check_configuration 
  ?(unhealthy_threshold : int option)
  ?(healthy_threshold : int option)
  ?(timeout : int option)
  ?(interval : int option)
  ?(path : string option)
  ?(protocol : health_check_protocol option)
  () : health_check_configuration = {
  unhealthy_threshold; healthy_threshold; timeout; interval; path; protocol; 
}

let make_auto_scaling_configuration_summary 
  ?(is_default : bool option)
  ?(has_associated_service : bool option)
  ?(created_at : float option)
  ?(status : auto_scaling_configuration_status option)
  ?(auto_scaling_configuration_revision : int option)
  ?(auto_scaling_configuration_name : string option)
  ?(auto_scaling_configuration_arn : string option)
  () : auto_scaling_configuration_summary = {
  is_default;
  has_associated_service;
  created_at;
  status;
  auto_scaling_configuration_revision;
  auto_scaling_configuration_name;
  auto_scaling_configuration_arn;
   }

let make_egress_configuration 
  ?(vpc_connector_arn : string option) ?(egress_type : egress_type option) ()
: egress_configuration = { vpc_connector_arn; egress_type; 
}

let make_ingress_configuration  ?(is_publicly_accessible : bool option) ()
: ingress_configuration = { is_publicly_accessible; 
}

let make_network_configuration 
  ?(ip_address_type : ip_address_type option)
  ?(ingress_configuration : ingress_configuration option)
  ?(egress_configuration : egress_configuration option)
  () : network_configuration = {
  ip_address_type; ingress_configuration; egress_configuration; 
}

let make_service_observability_configuration 
  ?(observability_configuration_arn : string option)
  ~(observability_enabled : bool)
  () : service_observability_configuration = {
  observability_configuration_arn; observability_enabled;  }

let make_service 
  ?(observability_configuration : service_observability_configuration option)
  ?(health_check_configuration : health_check_configuration option)
  ?(encryption_configuration : encryption_configuration option)
  ?(deleted_at : float option)
  ?(service_url : string option)
  ~(network_configuration : network_configuration)
  ~(auto_scaling_configuration_summary : auto_scaling_configuration_summary)
  ~(instance_configuration : instance_configuration)
  ~(source_configuration : source_configuration)
  ~(status : service_status)
  ~(updated_at : float)
  ~(created_at : float)
  ~(service_arn : string)
  ~(service_id : string)
  ~(service_name : string)
  () : service = {
  observability_configuration;
  network_configuration;
  auto_scaling_configuration_summary;
  health_check_configuration;
  encryption_configuration;
  instance_configuration;
  source_configuration;
  status;
  deleted_at;
  updated_at;
  created_at;
  service_url;
  service_arn;
  service_id;
  service_name;
   }

let make_update_service_response 
  ~(operation_id : string) ~(service : service) () : update_service_response
= { operation_id; service;  }

let make_update_service_request 
  ?(observability_configuration : service_observability_configuration option)
  ?(network_configuration : network_configuration option)
  ?(health_check_configuration : health_check_configuration option)
  ?(auto_scaling_configuration_arn : string option)
  ?(instance_configuration : instance_configuration option)
  ?(source_configuration : source_configuration option)
  ~(service_arn : string)
  () : update_service_request = {
  observability_configuration;
  network_configuration;
  health_check_configuration;
  auto_scaling_configuration_arn;
  instance_configuration;
  source_configuration;
  service_arn;
   }

let make_auto_scaling_configuration 
  ?(is_default : bool option)
  ?(has_associated_service : bool option)
  ?(deleted_at : float option)
  ?(created_at : float option)
  ?(max_size : int option)
  ?(min_size : int option)
  ?(max_concurrency : int option)
  ?(status : auto_scaling_configuration_status option)
  ?(latest : bool option)
  ?(auto_scaling_configuration_revision : int option)
  ?(auto_scaling_configuration_name : string option)
  ?(auto_scaling_configuration_arn : string option)
  () : auto_scaling_configuration = {
  is_default;
  has_associated_service;
  deleted_at;
  created_at;
  max_size;
  min_size;
  max_concurrency;
  status;
  latest;
  auto_scaling_configuration_revision;
  auto_scaling_configuration_name;
  auto_scaling_configuration_arn;
   }

let make_update_default_auto_scaling_configuration_response 
  ~(auto_scaling_configuration : auto_scaling_configuration) ()
: update_default_auto_scaling_configuration_response = {
  auto_scaling_configuration; 
}

let make_update_default_auto_scaling_configuration_request 
  ~(auto_scaling_configuration_arn : string) ()
: update_default_auto_scaling_configuration_request = {
  auto_scaling_configuration_arn;  }

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_request = { tag_keys; resource_arn; 
}

let make_trace_configuration  ~(vendor : tracing_vendor) ()
: trace_configuration = { vendor;  }

let make_tag_resource_response  () : tag_resource_response = ()

let make_tag  ?(value : string option) ?(key : string option) () : tag = {
  value; key;  }

let make_tag_resource_request  ~(tags : tag list) ~(resource_arn : string) ()
: tag_resource_request = { tags; resource_arn; 
}

let make_start_deployment_response  ~(operation_id : string) ()
: start_deployment_response = { operation_id; 
}

let make_start_deployment_request  ~(service_arn : string) ()
: start_deployment_request = { service_arn;  }

let make_service_summary 
  ?(status : service_status option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(service_url : string option)
  ?(service_arn : string option)
  ?(service_id : string option)
  ?(service_name : string option)
  () : service_summary = {
  status;
  updated_at;
  created_at;
  service_url;
  service_arn;
  service_id;
  service_name;
   }

let make_resume_service_response 
  ?(operation_id : string option) ~(service : service) ()
: resume_service_response = { operation_id; service; 
}

let make_resume_service_request  ~(service_arn : string) ()
: resume_service_request = { service_arn;  }

let make_pause_service_response 
  ?(operation_id : string option) ~(service : service) ()
: pause_service_response = { operation_id; service; 
}

let make_pause_service_request  ~(service_arn : string) ()
: pause_service_request = { service_arn;  }

let make_operation_summary 
  ?(updated_at : float option)
  ?(ended_at : float option)
  ?(started_at : float option)
  ?(target_arn : string option)
  ?(status : operation_status option)
  ?(type_ : operation_type option)
  ?(id : string option)
  () : operation_summary = {
  updated_at; ended_at; started_at; target_arn; status; type_; id; 
}

let make_observability_configuration_summary 
  ?(observability_configuration_revision : int option)
  ?(observability_configuration_name : string option)
  ?(observability_configuration_arn : string option)
  () : observability_configuration_summary = {
  observability_configuration_revision;
  observability_configuration_name;
  observability_configuration_arn;
   }

let make_observability_configuration 
  ?(deleted_at : float option)
  ?(created_at : float option)
  ?(status : observability_configuration_status option)
  ?(latest : bool option)
  ?(observability_configuration_revision : int option)
  ?(trace_configuration : trace_configuration option)
  ?(observability_configuration_name : string option)
  ?(observability_configuration_arn : string option)
  () : observability_configuration = {
  deleted_at;
  created_at;
  status;
  latest;
  observability_configuration_revision;
  trace_configuration;
  observability_configuration_name;
  observability_configuration_arn;
   }

let make_list_vpc_ingress_connections_response 
  ?(next_token : string option)
  ~(vpc_ingress_connection_summary_list : vpc_ingress_connection_summary list)
  () : list_vpc_ingress_connections_response = {
  next_token; vpc_ingress_connection_summary_list; 
}

let make_list_vpc_ingress_connections_filter 
  ?(vpc_endpoint_id : string option) ?(service_arn : string option) ()
: list_vpc_ingress_connections_filter = { vpc_endpoint_id; service_arn; 
}

let make_list_vpc_ingress_connections_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(filter : list_vpc_ingress_connections_filter option)
  () : list_vpc_ingress_connections_request = {
  next_token; max_results; filter;  }

let make_list_vpc_connectors_response 
  ?(next_token : string option) ~(vpc_connectors : vpc_connector list) ()
: list_vpc_connectors_response = { next_token; vpc_connectors; 
}

let make_list_vpc_connectors_request 
  ?(next_token : string option) ?(max_results : int option) ()
: list_vpc_connectors_request = { next_token; max_results; 
}

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request  ~(resource_arn : string) ()
: list_tags_for_resource_request = { resource_arn; 
}

let make_list_services_response 
  ?(next_token : string option)
  ~(service_summary_list : service_summary list)
  () : list_services_response = { next_token; service_summary_list; 
}

let make_list_services_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_services_request = { max_results; next_token; 
}

let make_list_services_for_auto_scaling_configuration_response 
  ?(next_token : string option) ~(service_arn_list : string list) ()
: list_services_for_auto_scaling_configuration_response = {
  next_token; service_arn_list; 
}

let make_list_services_for_auto_scaling_configuration_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ~(auto_scaling_configuration_arn : string)
  () : list_services_for_auto_scaling_configuration_request = {
  next_token; max_results; auto_scaling_configuration_arn; 
}

let make_list_operations_response 
  ?(next_token : string option)
  ?(operation_summary_list : operation_summary list option)
  () : list_operations_response = { next_token; operation_summary_list; 
}

let make_list_operations_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(service_arn : string)
  () : list_operations_request = { max_results; next_token; service_arn; 
}

let make_list_observability_configurations_response 
  ?(next_token : string option)
  ~(observability_configuration_summary_list : observability_configuration_summary list)
  () : list_observability_configurations_response = {
  next_token; observability_configuration_summary_list; 
}

let make_list_observability_configurations_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(latest_only : bool option)
  ?(observability_configuration_name : string option)
  () : list_observability_configurations_request = {
  next_token; max_results; latest_only; observability_configuration_name; 
}

let make_connection_summary 
  ?(created_at : float option)
  ?(status : connection_status option)
  ?(provider_type : provider_type option)
  ?(connection_arn : string option)
  ?(connection_name : string option)
  () : connection_summary = {
  created_at; status; provider_type; connection_arn; connection_name; 
}

let make_list_connections_response 
  ?(next_token : string option)
  ~(connection_summary_list : connection_summary list)
  () : list_connections_response = { next_token; connection_summary_list; 
}

let make_list_connections_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(connection_name : string option)
  () : list_connections_request = {
  next_token; max_results; connection_name; 
}

let make_list_auto_scaling_configurations_response 
  ?(next_token : string option)
  ~(auto_scaling_configuration_summary_list : auto_scaling_configuration_summary list)
  () : list_auto_scaling_configurations_response = {
  next_token; auto_scaling_configuration_summary_list; 
}

let make_list_auto_scaling_configurations_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(latest_only : bool option)
  ?(auto_scaling_configuration_name : string option)
  () : list_auto_scaling_configurations_request = {
  next_token; max_results; latest_only; auto_scaling_configuration_name; 
}

let make_certificate_validation_record 
  ?(status : certificate_validation_record_status option)
  ?(value : string option)
  ?(type_ : string option)
  ?(name : string option)
  () : certificate_validation_record = { status; value; type_; name; 
}

let make_custom_domain 
  ?(certificate_validation_records : certificate_validation_record list option)
  ~(status : custom_domain_association_status)
  ~(enable_www_subdomain : bool)
  ~(domain_name : string)
  () : custom_domain = {
  status; certificate_validation_records; enable_www_subdomain; domain_name; 
}

let make_disassociate_custom_domain_response 
  ~(vpc_dns_targets : vpc_dns_target list)
  ~(custom_domain : custom_domain)
  ~(service_arn : string)
  ~(dns_target : string)
  () : disassociate_custom_domain_response = {
  vpc_dns_targets; custom_domain; service_arn; dns_target; 
}

let make_disassociate_custom_domain_request 
  ~(domain_name : string) ~(service_arn : string) ()
: disassociate_custom_domain_request = { domain_name; service_arn; 
}

let make_describe_vpc_ingress_connection_response 
  ~(vpc_ingress_connection : vpc_ingress_connection) ()
: describe_vpc_ingress_connection_response = { vpc_ingress_connection; 
}

let make_describe_vpc_ingress_connection_request 
  ~(vpc_ingress_connection_arn : string) ()
: describe_vpc_ingress_connection_request = { vpc_ingress_connection_arn; 
}

let make_describe_vpc_connector_response  ~(vpc_connector : vpc_connector) ()
: describe_vpc_connector_response = { vpc_connector; 
}

let make_describe_vpc_connector_request  ~(vpc_connector_arn : string) ()
: describe_vpc_connector_request = { vpc_connector_arn; 
}

let make_describe_service_response  ~(service : service) ()
: describe_service_response = { service;  }

let make_describe_service_request  ~(service_arn : string) ()
: describe_service_request = { service_arn; 
}

let make_describe_observability_configuration_response 
  ~(observability_configuration : observability_configuration) ()
: describe_observability_configuration_response = {
  observability_configuration; 
}

let make_describe_observability_configuration_request 
  ~(observability_configuration_arn : string) ()
: describe_observability_configuration_request = {
  observability_configuration_arn; 
}

let make_describe_custom_domains_response 
  ?(next_token : string option)
  ~(vpc_dns_targets : vpc_dns_target list)
  ~(custom_domains : custom_domain list)
  ~(service_arn : string)
  ~(dns_target : string)
  () : describe_custom_domains_response = {
  next_token; vpc_dns_targets; custom_domains; service_arn; dns_target; 
}

let make_describe_custom_domains_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(service_arn : string)
  () : describe_custom_domains_request = {
  max_results; next_token; service_arn; 
}

let make_describe_auto_scaling_configuration_response 
  ~(auto_scaling_configuration : auto_scaling_configuration) ()
: describe_auto_scaling_configuration_response = {
  auto_scaling_configuration; 
}

let make_describe_auto_scaling_configuration_request 
  ~(auto_scaling_configuration_arn : string) ()
: describe_auto_scaling_configuration_request = {
  auto_scaling_configuration_arn; 
}

let make_delete_vpc_ingress_connection_response 
  ~(vpc_ingress_connection : vpc_ingress_connection) ()
: delete_vpc_ingress_connection_response = { vpc_ingress_connection; 
}

let make_delete_vpc_ingress_connection_request 
  ~(vpc_ingress_connection_arn : string) ()
: delete_vpc_ingress_connection_request = { vpc_ingress_connection_arn; 
}

let make_delete_vpc_connector_response  ~(vpc_connector : vpc_connector) ()
: delete_vpc_connector_response = { vpc_connector; 
}

let make_delete_vpc_connector_request  ~(vpc_connector_arn : string) ()
: delete_vpc_connector_request = { vpc_connector_arn; 
}

let make_delete_service_response 
  ~(operation_id : string) ~(service : service) () : delete_service_response
= { operation_id; service;  }

let make_delete_service_request  ~(service_arn : string) ()
: delete_service_request = { service_arn; 
}

let make_delete_observability_configuration_response 
  ~(observability_configuration : observability_configuration) ()
: delete_observability_configuration_response = {
  observability_configuration; 
}

let make_delete_observability_configuration_request 
  ~(observability_configuration_arn : string) ()
: delete_observability_configuration_request = {
  observability_configuration_arn;  }

let make_connection 
  ?(created_at : float option)
  ?(status : connection_status option)
  ?(provider_type : provider_type option)
  ?(connection_arn : string option)
  ?(connection_name : string option)
  () : connection = {
  created_at; status; provider_type; connection_arn; connection_name; 
}

let make_delete_connection_response  ?(connection : connection option) ()
: delete_connection_response = { connection; 
}

let make_delete_connection_request  ~(connection_arn : string) ()
: delete_connection_request = { connection_arn; 
}

let make_delete_auto_scaling_configuration_response 
  ~(auto_scaling_configuration : auto_scaling_configuration) ()
: delete_auto_scaling_configuration_response = { auto_scaling_configuration; 
}

let make_delete_auto_scaling_configuration_request 
  ?(delete_all_revisions : bool option)
  ~(auto_scaling_configuration_arn : string)
  () : delete_auto_scaling_configuration_request = {
  delete_all_revisions; auto_scaling_configuration_arn; 
}

let make_create_vpc_ingress_connection_response 
  ~(vpc_ingress_connection : vpc_ingress_connection) ()
: create_vpc_ingress_connection_response = { vpc_ingress_connection; 
}

let make_create_vpc_ingress_connection_request 
  ?(tags : tag list option)
  ~(ingress_vpc_configuration : ingress_vpc_configuration)
  ~(vpc_ingress_connection_name : string)
  ~(service_arn : string)
  () : create_vpc_ingress_connection_request = {
  tags; ingress_vpc_configuration; vpc_ingress_connection_name; service_arn; 
}

let make_create_vpc_connector_response  ~(vpc_connector : vpc_connector) ()
: create_vpc_connector_response = { vpc_connector; 
}

let make_create_vpc_connector_request 
  ?(tags : tag list option)
  ?(security_groups : string list option)
  ~(subnets : string list)
  ~(vpc_connector_name : string)
  () : create_vpc_connector_request = {
  tags; security_groups; subnets; vpc_connector_name; 
}

let make_create_service_response 
  ~(operation_id : string) ~(service : service) () : create_service_response
= { operation_id; service;  }

let make_create_service_request 
  ?(observability_configuration : service_observability_configuration option)
  ?(network_configuration : network_configuration option)
  ?(auto_scaling_configuration_arn : string option)
  ?(health_check_configuration : health_check_configuration option)
  ?(encryption_configuration : encryption_configuration option)
  ?(tags : tag list option)
  ?(instance_configuration : instance_configuration option)
  ~(source_configuration : source_configuration)
  ~(service_name : string)
  () : create_service_request = {
  observability_configuration;
  network_configuration;
  auto_scaling_configuration_arn;
  health_check_configuration;
  encryption_configuration;
  tags;
  instance_configuration;
  source_configuration;
  service_name;
   }

let make_create_observability_configuration_response 
  ~(observability_configuration : observability_configuration) ()
: create_observability_configuration_response = {
  observability_configuration; 
}

let make_create_observability_configuration_request 
  ?(tags : tag list option)
  ?(trace_configuration : trace_configuration option)
  ~(observability_configuration_name : string)
  () : create_observability_configuration_request = {
  tags; trace_configuration; observability_configuration_name; 
}

let make_create_connection_response  ~(connection : connection) ()
: create_connection_response = { connection; 
}

let make_create_connection_request 
  ?(tags : tag list option)
  ~(provider_type : provider_type)
  ~(connection_name : string)
  () : create_connection_request = { tags; provider_type; connection_name; 
}

let make_create_auto_scaling_configuration_response 
  ~(auto_scaling_configuration : auto_scaling_configuration) ()
: create_auto_scaling_configuration_response = { auto_scaling_configuration; 
}

let make_create_auto_scaling_configuration_request 
  ?(tags : tag list option)
  ?(max_size : int option)
  ?(min_size : int option)
  ?(max_concurrency : int option)
  ~(auto_scaling_configuration_name : string)
  () : create_auto_scaling_configuration_request = {
  tags; max_size; min_size; max_concurrency; auto_scaling_configuration_name; 
}

let make_associate_custom_domain_response 
  ~(vpc_dns_targets : vpc_dns_target list)
  ~(custom_domain : custom_domain)
  ~(service_arn : string)
  ~(dns_target : string)
  () : associate_custom_domain_response = {
  vpc_dns_targets; custom_domain; service_arn; dns_target; 
}

let make_associate_custom_domain_request 
  ?(enable_www_subdomain : bool option)
  ~(domain_name : string)
  ~(service_arn : string)
  () : associate_custom_domain_request = {
  enable_www_subdomain; domain_name; service_arn; 
}

