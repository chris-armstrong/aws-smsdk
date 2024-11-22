[@@@warning "-39"]
open Types
let make_update_service_response  ?(operation_id : string option) ()
: update_service_response = { operation_id;  }

let make_dns_record  ~(tt_l : int) ~(type_ : record_type) () : dns_record = {
  tt_l; type_;  }

let make_dns_config_change  ~(dns_records : dns_record list) ()
: dns_config_change = { dns_records;  }

let make_health_check_config 
  ?(failure_threshold : int option)
  ?(resource_path : string option)
  ~(type_ : health_check_type)
  () : health_check_config = { failure_threshold; resource_path; type_; 
}

let make_service_change 
  ?(health_check_config : health_check_config option)
  ?(dns_config : dns_config_change option)
  ?(description : string option)
  () : service_change = { health_check_config; dns_config; description; 
}

let make_update_service_request 
  ~(service : service_change) ~(id : string) () : update_service_request = {
  service; id;  }

let make_update_public_dns_namespace_response 
  ?(operation_id : string option) () : update_public_dns_namespace_response =
{ operation_id;  }

let make_soa_change  ~(tt_l : int) () : soa_change = { tt_l; 
}

let make_public_dns_properties_mutable_change  ~(so_a : soa_change) ()
: public_dns_properties_mutable_change = { so_a; 
}

let make_public_dns_namespace_properties_change 
  ~(dns_properties : public_dns_properties_mutable_change) ()
: public_dns_namespace_properties_change = { dns_properties; 
}

let make_public_dns_namespace_change 
  ?(properties : public_dns_namespace_properties_change option)
  ?(description : string option)
  () : public_dns_namespace_change = { properties; description; 
}

let make_update_public_dns_namespace_request 
  ?(updater_request_id : string option)
  ~(namespace : public_dns_namespace_change)
  ~(id : string)
  () : update_public_dns_namespace_request = {
  namespace; updater_request_id; id; 
}

let make_update_private_dns_namespace_response 
  ?(operation_id : string option) () : update_private_dns_namespace_response
= { operation_id;  }

let make_private_dns_properties_mutable_change  ~(so_a : soa_change) ()
: private_dns_properties_mutable_change = { so_a; 
}

let make_private_dns_namespace_properties_change 
  ~(dns_properties : private_dns_properties_mutable_change) ()
: private_dns_namespace_properties_change = { dns_properties; 
}

let make_private_dns_namespace_change 
  ?(properties : private_dns_namespace_properties_change option)
  ?(description : string option)
  () : private_dns_namespace_change = { properties; description; 
}

let make_update_private_dns_namespace_request 
  ?(updater_request_id : string option)
  ~(namespace : private_dns_namespace_change)
  ~(id : string)
  () : update_private_dns_namespace_request = {
  namespace; updater_request_id; id; 
}

let make_update_instance_custom_health_status_request 
  ~(status : custom_health_status)
  ~(instance_id : string)
  ~(service_id : string)
  () : update_instance_custom_health_status_request = {
  status; instance_id; service_id;  }

let make_update_http_namespace_response  ?(operation_id : string option) ()
: update_http_namespace_response = { operation_id; 
}

let make_http_namespace_change  ~(description : string) ()
: http_namespace_change = { description; 
}

let make_update_http_namespace_request 
  ?(updater_request_id : string option)
  ~(namespace : http_namespace_change)
  ~(id : string)
  () : update_http_namespace_request = { namespace; updater_request_id; id; 
}

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_ar_n : string) ()
: untag_resource_request = { tag_keys; resource_ar_n; 
}

let make_tag_resource_response  () : tag_resource_response = ()

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_request 
  ~(tags : tag list) ~(resource_ar_n : string) () : tag_resource_request = {
  tags; resource_ar_n;  }

let make_dns_config 
  ?(routing_policy : routing_policy option)
  ?(namespace_id : string option)
  ~(dns_records : dns_record list)
  () : dns_config = { dns_records; routing_policy; namespace_id; 
}

let make_health_check_custom_config  ?(failure_threshold : int option) ()
: health_check_custom_config = { failure_threshold; 
}

let make_service_summary 
  ?(create_date : float option)
  ?(health_check_custom_config : health_check_custom_config option)
  ?(health_check_config : health_check_config option)
  ?(dns_config : dns_config option)
  ?(instance_count : int option)
  ?(description : string option)
  ?(type_ : service_type option)
  ?(name : string option)
  ?(arn : string option)
  ?(id : string option)
  () : service_summary = {
  create_date;
  health_check_custom_config;
  health_check_config;
  dns_config;
  instance_count;
  description;
  type_;
  name;
  arn;
  id;
   }

let make_service_filter 
  ?(condition : filter_condition option)
  ~(values : string list)
  ~(name : service_filter_name)
  () : service_filter = { condition; values; name;  }

let make_service 
  ?(creator_request_id : string option)
  ?(create_date : float option)
  ?(health_check_custom_config : health_check_custom_config option)
  ?(health_check_config : health_check_config option)
  ?(type_ : service_type option)
  ?(dns_config : dns_config option)
  ?(instance_count : int option)
  ?(description : string option)
  ?(namespace_id : string option)
  ?(name : string option)
  ?(arn : string option)
  ?(id : string option)
  () : service = {
  creator_request_id;
  create_date;
  health_check_custom_config;
  health_check_config;
  type_;
  dns_config;
  instance_count;
  description;
  namespace_id;
  name;
  arn;
  id;
   }

let make_so_a  ~(tt_l : int) () : so_a = { tt_l; 
}

let make_register_instance_response  ?(operation_id : string option) ()
: register_instance_response = { operation_id; 
}

let make_register_instance_request 
  ?(creator_request_id : string option)
  ~(attributes : (string * string) list)
  ~(instance_id : string)
  ~(service_id : string)
  () : register_instance_request = {
  attributes; creator_request_id; instance_id; service_id; 
}

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request  ~(resource_ar_n : string) ()
: list_tags_for_resource_request = { resource_ar_n; 
}

let make_list_services_response 
  ?(next_token : string option) ?(services : service_summary list option) ()
: list_services_response = { next_token; services; 
}

let make_list_services_request 
  ?(filters : service_filter list option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_services_request = { filters; max_results; next_token; 
}

let make_operation_summary 
  ?(status : operation_status option) ?(id : string option) ()
: operation_summary = { status; id;  }

let make_list_operations_response 
  ?(next_token : string option)
  ?(operations : operation_summary list option)
  () : list_operations_response = { next_token; operations; 
}

let make_operation_filter 
  ?(condition : filter_condition option)
  ~(values : string list)
  ~(name : operation_filter_name)
  () : operation_filter = { condition; values; name; 
}

let make_list_operations_request 
  ?(filters : operation_filter list option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_operations_request = { filters; max_results; next_token; 
}

let make_dns_properties 
  ?(so_a : so_a option) ?(hosted_zone_id : string option) () : dns_properties
= { so_a; hosted_zone_id;  }

let make_http_properties  ?(http_name : string option) () : http_properties =
{ http_name;  }

let make_namespace_properties 
  ?(http_properties : http_properties option)
  ?(dns_properties : dns_properties option)
  () : namespace_properties = { http_properties; dns_properties; 
}

let make_namespace_summary 
  ?(create_date : float option)
  ?(properties : namespace_properties option)
  ?(service_count : int option)
  ?(description : string option)
  ?(type_ : namespace_type option)
  ?(name : string option)
  ?(arn : string option)
  ?(id : string option)
  () : namespace_summary = {
  create_date; properties; service_count; description; type_; name; arn; id; 
}

let make_list_namespaces_response 
  ?(next_token : string option)
  ?(namespaces : namespace_summary list option)
  () : list_namespaces_response = { next_token; namespaces; 
}

let make_namespace_filter 
  ?(condition : filter_condition option)
  ~(values : string list)
  ~(name : namespace_filter_name)
  () : namespace_filter = { condition; values; name; 
}

let make_list_namespaces_request 
  ?(filters : namespace_filter list option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_namespaces_request = { filters; max_results; next_token; 
}

let make_instance_summary 
  ?(attributes : (string * string) list option) ?(id : string option) ()
: instance_summary = { attributes; id;  }

let make_list_instances_response 
  ?(next_token : string option)
  ?(instances : instance_summary list option)
  () : list_instances_response = { next_token; instances; 
}

let make_list_instances_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(service_id : string)
  () : list_instances_request = { max_results; next_token; service_id; 
}

let make_get_service_response  ?(service : service option) ()
: get_service_response = { service;  }

let make_get_service_request  ~(id : string) () : get_service_request = {
  id;  }

let make_operation 
  ?(targets : (string * string) list option)
  ?(update_date : float option)
  ?(create_date : float option)
  ?(error_code : string option)
  ?(error_message : string option)
  ?(status : operation_status option)
  ?(type_ : operation_type option)
  ?(id : string option)
  () : operation = {
  targets;
  update_date;
  create_date;
  error_code;
  error_message;
  status;
  type_;
  id;
   }

let make_get_operation_response  ?(operation : operation option) ()
: get_operation_response = { operation;  }

let make_get_operation_request  ~(operation_id : string) ()
: get_operation_request = { operation_id;  }

let make_namespace 
  ?(creator_request_id : string option)
  ?(create_date : float option)
  ?(properties : namespace_properties option)
  ?(service_count : int option)
  ?(description : string option)
  ?(type_ : namespace_type option)
  ?(name : string option)
  ?(arn : string option)
  ?(id : string option)
  () : namespace = {
  creator_request_id;
  create_date;
  properties;
  service_count;
  description;
  type_;
  name;
  arn;
  id;
   }

let make_get_namespace_response  ?(namespace : namespace option) ()
: get_namespace_response = { namespace;  }

let make_get_namespace_request  ~(id : string) () : get_namespace_request = {
  id;  }

let make_get_instances_health_status_response 
  ?(next_token : string option)
  ?(status : (string * health_status) list option)
  () : get_instances_health_status_response = { next_token; status; 
}

let make_get_instances_health_status_request 
  ?(next_token : string option)
  ?(max_results : int option)
  ?(instances : string list option)
  ~(service_id : string)
  () : get_instances_health_status_request = {
  next_token; max_results; instances; service_id;  }

let make_instance 
  ?(attributes : (string * string) list option)
  ?(creator_request_id : string option)
  ~(id : string)
  () : instance = { attributes; creator_request_id; id; 
}

let make_get_instance_response  ?(instance : instance option) ()
: get_instance_response = { instance;  }

let make_get_instance_request 
  ~(instance_id : string) ~(service_id : string) () : get_instance_request =
{ instance_id; service_id;  }

let make_discover_instances_revision_response 
  ?(instances_revision : int option) ()
: discover_instances_revision_response = { instances_revision; 
}

let make_discover_instances_revision_request 
  ~(service_name : string) ~(namespace_name : string) ()
: discover_instances_revision_request = { service_name; namespace_name; 
}

let make_http_instance_summary 
  ?(attributes : (string * string) list option)
  ?(health_status : health_status option)
  ?(service_name : string option)
  ?(namespace_name : string option)
  ?(instance_id : string option)
  () : http_instance_summary = {
  attributes; health_status; service_name; namespace_name; instance_id; 
}

let make_discover_instances_response 
  ?(instances_revision : int option)
  ?(instances : http_instance_summary list option)
  () : discover_instances_response = { instances_revision; instances; 
}

let make_discover_instances_request 
  ?(health_status : health_status_filter option)
  ?(optional_parameters : (string * string) list option)
  ?(query_parameters : (string * string) list option)
  ?(max_results : int option)
  ~(service_name : string)
  ~(namespace_name : string)
  () : discover_instances_request = {
  health_status;
  optional_parameters;
  query_parameters;
  max_results;
  service_name;
  namespace_name;
   }

let make_deregister_instance_response  ?(operation_id : string option) ()
: deregister_instance_response = { operation_id; 
}

let make_deregister_instance_request 
  ~(instance_id : string) ~(service_id : string) ()
: deregister_instance_request = { instance_id; service_id; 
}

let make_delete_service_response  () : delete_service_response =
()

let make_delete_service_request  ~(id : string) () : delete_service_request =
{ id;  }

let make_delete_namespace_response  ?(operation_id : string option) ()
: delete_namespace_response = { operation_id; 
}

let make_delete_namespace_request  ~(id : string) ()
: delete_namespace_request = { id;  }

let make_create_service_response  ?(service : service option) ()
: create_service_response = { service;  }

let make_create_service_request 
  ?(type_ : service_type_option option)
  ?(tags : tag list option)
  ?(health_check_custom_config : health_check_custom_config option)
  ?(health_check_config : health_check_config option)
  ?(dns_config : dns_config option)
  ?(description : string option)
  ?(creator_request_id : string option)
  ?(namespace_id : string option)
  ~(name : string)
  () : create_service_request = {
  type_;
  tags;
  health_check_custom_config;
  health_check_config;
  dns_config;
  description;
  creator_request_id;
  namespace_id;
  name;
   }

let make_create_public_dns_namespace_response 
  ?(operation_id : string option) () : create_public_dns_namespace_response =
{ operation_id;  }

let make_public_dns_properties_mutable  ~(so_a : so_a) ()
: public_dns_properties_mutable = { so_a; 
}

let make_public_dns_namespace_properties 
  ~(dns_properties : public_dns_properties_mutable) ()
: public_dns_namespace_properties = { dns_properties; 
}

let make_create_public_dns_namespace_request 
  ?(properties : public_dns_namespace_properties option)
  ?(tags : tag list option)
  ?(description : string option)
  ?(creator_request_id : string option)
  ~(name : string)
  () : create_public_dns_namespace_request = {
  properties; tags; description; creator_request_id; name; 
}

let make_create_private_dns_namespace_response 
  ?(operation_id : string option) () : create_private_dns_namespace_response
= { operation_id;  }

let make_private_dns_properties_mutable  ~(so_a : so_a) ()
: private_dns_properties_mutable = { so_a; 
}

let make_private_dns_namespace_properties 
  ~(dns_properties : private_dns_properties_mutable) ()
: private_dns_namespace_properties = { dns_properties; 
}

let make_create_private_dns_namespace_request 
  ?(properties : private_dns_namespace_properties option)
  ?(tags : tag list option)
  ?(description : string option)
  ?(creator_request_id : string option)
  ~(vpc : string)
  ~(name : string)
  () : create_private_dns_namespace_request = {
  properties; tags; vpc; description; creator_request_id; name; 
}

let make_create_http_namespace_response  ?(operation_id : string option) ()
: create_http_namespace_response = { operation_id; 
}

let make_create_http_namespace_request 
  ?(tags : tag list option)
  ?(description : string option)
  ?(creator_request_id : string option)
  ~(name : string)
  () : create_http_namespace_request = {
  tags; description; creator_request_id; name; 
}

