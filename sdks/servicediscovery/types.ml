open Smaws_Lib
let service =
  Service.{
    namespace = "servicediscovery";
    endpointPrefix = "servicediscovery";
    version = "2017-03-14";
    protocol = AwsJson_1_1
  };
type update_service_response = {
  operation_id: string option
}

type record_type = | CNAME
  | AAAA
  | A
  | SRV

type dns_record = {
  tt_l: int;
  type_: record_type
}

type dns_config_change = {
  dns_records: dns_record list
}

type health_check_type = | TCP
  | HTTPS
  | HTTP

type health_check_config = {
  failure_threshold: int option;
  resource_path: string option;
  type_: health_check_type
}

type service_change = {
  health_check_config: health_check_config option;
  dns_config: dns_config_change option;
  description: string option
}

type update_service_request = {
  service: service_change;
  id: string
}

type service_not_found = {
  message: string option
}

type invalid_input = {
  message: string option
}

type duplicate_request = {
  duplicate_operation_id: string option;
  message: string option
}

type update_public_dns_namespace_response = {
  operation_id: string option
}

type soa_change = {
  tt_l: int
}

type public_dns_properties_mutable_change = {
  so_a: soa_change
}

type public_dns_namespace_properties_change = {
  dns_properties: public_dns_properties_mutable_change
}

type public_dns_namespace_change = {
  properties: public_dns_namespace_properties_change option;
  description: string option
}

type update_public_dns_namespace_request = {
  namespace: public_dns_namespace_change;
  updater_request_id: string option;
  id: string
}

type resource_in_use = {
  message: string option
}

type namespace_not_found = {
  message: string option
}

type update_private_dns_namespace_response = {
  operation_id: string option
}

type private_dns_properties_mutable_change = {
  so_a: soa_change
}

type private_dns_namespace_properties_change = {
  dns_properties: private_dns_properties_mutable_change
}

type private_dns_namespace_change = {
  properties: private_dns_namespace_properties_change option;
  description: string option
}

type update_private_dns_namespace_request = {
  namespace: private_dns_namespace_change;
  updater_request_id: string option;
  id: string
}

type custom_health_status = | UNHEALTHY
  | HEALTHY

type update_instance_custom_health_status_request = {
  status: custom_health_status;
  instance_id: string;
  service_id: string
}

type instance_not_found = {
  message: string option
}

type custom_health_not_found = {
  message: string option
}

type update_http_namespace_response = {
  operation_id: string option
}

type http_namespace_change = {
  description: string
}

type update_http_namespace_request = {
  namespace: http_namespace_change;
  updater_request_id: string option;
  id: string
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_ar_n: string
}

type resource_not_found_exception = {
  message: string option
}

type too_many_tags_exception = {
  resource_name: string option;
  message: string option
}

type tag_resource_response = unit

type tag = {
  value: string;
  key: string
}

type tag_resource_request = {
  tags: tag list;
  resource_ar_n: string
}

type service_type_option = | HTTP

type service_type = | DNS
  | DNS_HTTP
  | HTTP

type routing_policy = | WEIGHTED
  | MULTIVALUE

type dns_config = {
  dns_records: dns_record list;
  routing_policy: routing_policy option;
  namespace_id: string option
}

type health_check_custom_config = {
  failure_threshold: int option
}

type service_summary = {
  create_date: float option;
  health_check_custom_config: health_check_custom_config option;
  health_check_config: health_check_config option;
  dns_config: dns_config option;
  instance_count: int option;
  description: string option;
  type_: service_type option;
  name: string option;
  arn: string option;
  id: string option
}

type service_filter_name = | NAMESPACE_ID

type filter_condition = | BEGINS_WITH
  | BETWEEN
  | IN
  | EQ

type service_filter = {
  condition: filter_condition option;
  values: string list;
  name: service_filter_name
}

type service_already_exists = {
  service_id: string option;
  creator_request_id: string option;
  message: string option
}

type service = {
  creator_request_id: string option;
  create_date: float option;
  health_check_custom_config: health_check_custom_config option;
  health_check_config: health_check_config option;
  type_: service_type option;
  dns_config: dns_config option;
  instance_count: int option;
  description: string option;
  namespace_id: string option;
  name: string option;
  arn: string option;
  id: string option
}

type so_a = {
  tt_l: int
}

type resource_limit_exceeded = {
  message: string option
}

type register_instance_response = {
  operation_id: string option
}

type register_instance_request = {
  attributes: (string * string) list;
  creator_request_id: string option;
  instance_id: string;
  service_id: string
}

type list_tags_for_resource_response = {
  tags: tag list option
}

type list_tags_for_resource_request = {
  resource_ar_n: string
}

type list_services_response = {
  next_token: string option;
  services: service_summary list option
}

type list_services_request = {
  filters: service_filter list option;
  max_results: int option;
  next_token: string option
}

type operation_status = | FAIL
  | SUCCESS
  | PENDING
  | SUBMITTED

type operation_summary = {
  status: operation_status option;
  id: string option
}

type list_operations_response = {
  next_token: string option;
  operations: operation_summary list option
}

type operation_filter_name = | UPDATE_DATE
  | TYPE
  | STATUS
  | SERVICE_ID
  | NAMESPACE_ID

type operation_filter = {
  condition: filter_condition option;
  values: string list;
  name: operation_filter_name
}

type list_operations_request = {
  filters: operation_filter list option;
  max_results: int option;
  next_token: string option
}

type namespace_type = | HTTP
  | DNS_PRIVATE
  | DNS_PUBLIC

type dns_properties = {
  so_a: so_a option;
  hosted_zone_id: string option
}

type http_properties = {
  http_name: string option
}

type namespace_properties = {
  http_properties: http_properties option;
  dns_properties: dns_properties option
}

type namespace_summary = {
  create_date: float option;
  properties: namespace_properties option;
  service_count: int option;
  description: string option;
  type_: namespace_type option;
  name: string option;
  arn: string option;
  id: string option
}

type list_namespaces_response = {
  next_token: string option;
  namespaces: namespace_summary list option
}

type namespace_filter_name = | HTTP_NAME
  | NAME
  | TYPE

type namespace_filter = {
  condition: filter_condition option;
  values: string list;
  name: namespace_filter_name
}

type list_namespaces_request = {
  filters: namespace_filter list option;
  max_results: int option;
  next_token: string option
}

type instance_summary = {
  attributes: (string * string) list option;
  id: string option
}

type list_instances_response = {
  next_token: string option;
  instances: instance_summary list option
}

type list_instances_request = {
  max_results: int option;
  next_token: string option;
  service_id: string
}

type get_service_response = {
  service: service option
}

type get_service_request = {
  id: string
}

type operation_not_found = {
  message: string option
}

type operation_type = | DEREGISTER_INSTANCE
  | REGISTER_INSTANCE
  | UPDATE_SERVICE
  | UPDATE_NAMESPACE
  | DELETE_NAMESPACE
  | CREATE_NAMESPACE

type operation_target_type = | INSTANCE
  | SERVICE
  | NAMESPACE

type operation = {
  targets: (string * string) list option;
  update_date: float option;
  create_date: float option;
  error_code: string option;
  error_message: string option;
  status: operation_status option;
  type_: operation_type option;
  id: string option
}

type get_operation_response = {
  operation: operation option
}

type get_operation_request = {
  operation_id: string
}

type namespace = {
  creator_request_id: string option;
  create_date: float option;
  properties: namespace_properties option;
  service_count: int option;
  description: string option;
  type_: namespace_type option;
  name: string option;
  arn: string option;
  id: string option
}

type get_namespace_response = {
  namespace: namespace option
}

type get_namespace_request = {
  id: string
}

type health_status = | UNKNOWN
  | UNHEALTHY
  | HEALTHY

type get_instances_health_status_response = {
  next_token: string option;
  status: (string * health_status) list option
}

type get_instances_health_status_request = {
  next_token: string option;
  max_results: int option;
  instances: string list option;
  service_id: string
}

type instance = {
  attributes: (string * string) list option;
  creator_request_id: string option;
  id: string
}

type get_instance_response = {
  instance: instance option
}

type get_instance_request = {
  instance_id: string;
  service_id: string
}

type request_limit_exceeded = {
  message: string option
}

type discover_instances_revision_response = {
  instances_revision: int option
}

type discover_instances_revision_request = {
  service_name: string;
  namespace_name: string
}

type http_instance_summary = {
  attributes: (string * string) list option;
  health_status: health_status option;
  service_name: string option;
  namespace_name: string option;
  instance_id: string option
}

type discover_instances_response = {
  instances_revision: int option;
  instances: http_instance_summary list option
}

type health_status_filter = | HEALTHY_OR_ELSE_ALL
  | ALL
  | UNHEALTHY
  | HEALTHY

type discover_instances_request = {
  health_status: health_status_filter option;
  optional_parameters: (string * string) list option;
  query_parameters: (string * string) list option;
  max_results: int option;
  service_name: string;
  namespace_name: string
}

type deregister_instance_response = {
  operation_id: string option
}

type deregister_instance_request = {
  instance_id: string;
  service_id: string
}

type delete_service_response = unit

type delete_service_request = {
  id: string
}

type delete_namespace_response = {
  operation_id: string option
}

type delete_namespace_request = {
  id: string
}

type create_service_response = {
  service: service option
}

type create_service_request = {
  type_: service_type_option option;
  tags: tag list option;
  health_check_custom_config: health_check_custom_config option;
  health_check_config: health_check_config option;
  dns_config: dns_config option;
  description: string option;
  creator_request_id: string option;
  namespace_id: string option;
  name: string
}

type namespace_already_exists = {
  namespace_id: string option;
  creator_request_id: string option;
  message: string option
}

type create_public_dns_namespace_response = {
  operation_id: string option
}

type public_dns_properties_mutable = {
  so_a: so_a
}

type public_dns_namespace_properties = {
  dns_properties: public_dns_properties_mutable
}

type create_public_dns_namespace_request = {
  properties: public_dns_namespace_properties option;
  tags: tag list option;
  description: string option;
  creator_request_id: string option;
  name: string
}

type create_private_dns_namespace_response = {
  operation_id: string option
}

type private_dns_properties_mutable = {
  so_a: so_a
}

type private_dns_namespace_properties = {
  dns_properties: private_dns_properties_mutable
}

type create_private_dns_namespace_request = {
  properties: private_dns_namespace_properties option;
  tags: tag list option;
  vpc: string;
  description: string option;
  creator_request_id: string option;
  name: string
}

type create_http_namespace_response = {
  operation_id: string option
}

type create_http_namespace_request = {
  tags: tag list option;
  description: string option;
  creator_request_id: string option;
  name: string
}



type base_document = Json.t

