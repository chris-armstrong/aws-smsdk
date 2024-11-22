open Smaws_Lib.Json.SerializeHelpers

open Types

let operation_id_to_yojson = string_to_yojson

let update_service_response_to_yojson = 
  fun (x: update_service_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let resource_id_to_yojson = string_to_yojson

let resource_description_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let record_type_to_yojson = 
  fun (x: record_type) -> match x with 
 
| CNAME -> `String "CNAME"
  | AAAA -> `String "AAAA"
  | A -> `String "A"
  | SRV -> `String "SRV"
   

let record_tt_l_to_yojson = long_to_yojson

let dns_record_to_yojson = 
  fun (x: dns_record) -> assoc_to_yojson(
    [(
         "TTL",
         (Some (record_tt_l_to_yojson x.tt_l)));
       (
         "Type",
         (Some (record_type_to_yojson x.type_)));
       
  ])

let dns_record_list_to_yojson = 
  fun tree -> list_to_yojson dns_record_to_yojson tree

let dns_config_change_to_yojson = 
  fun (x: dns_config_change) -> assoc_to_yojson(
    [(
         "DnsRecords",
         (Some (dns_record_list_to_yojson x.dns_records)));
       
  ])

let health_check_type_to_yojson = 
  fun (x: health_check_type) -> match x with 
  | TCP -> `String "TCP"
    | HTTPS -> `String "HTTPS"
    | HTTP -> `String "HTTP"
     

let resource_path_to_yojson = string_to_yojson

let failure_threshold_to_yojson = int_to_yojson

let health_check_config_to_yojson = 
  fun (x: health_check_config) -> assoc_to_yojson(
    [(
         "FailureThreshold",
         (option_to_yojson failure_threshold_to_yojson x.failure_threshold));
       (
         "ResourcePath",
         (option_to_yojson resource_path_to_yojson x.resource_path));
       (
         "Type",
         (Some (health_check_type_to_yojson x.type_)));
       
  ])

let service_change_to_yojson = 
  fun (x: service_change) -> assoc_to_yojson(
    [(
         "HealthCheckConfig",
         (option_to_yojson health_check_config_to_yojson x.health_check_config));
       (
         "DnsConfig",
         (option_to_yojson dns_config_change_to_yojson x.dns_config));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       
  ])

let update_service_request_to_yojson = 
  fun (x: update_service_request) -> assoc_to_yojson(
    [(
         "Service",
         (Some (service_change_to_yojson x.service)));
       (
         "Id",
         (Some (resource_id_to_yojson x.id)));
       
  ])

let error_message_to_yojson = string_to_yojson

let service_not_found_to_yojson = 
  fun (x: service_not_found) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_input_to_yojson = 
  fun (x: invalid_input) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let duplicate_request_to_yojson = 
  fun (x: duplicate_request) -> assoc_to_yojson(
    [(
         "DuplicateOperationId",
         (option_to_yojson resource_id_to_yojson x.duplicate_operation_id));
       (
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let update_public_dns_namespace_response_to_yojson = 
  fun (x: update_public_dns_namespace_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let soa_change_to_yojson = 
  fun (x: soa_change) -> assoc_to_yojson(
    [(
         "TTL",
         (Some (record_tt_l_to_yojson x.tt_l)));
       
  ])

let public_dns_properties_mutable_change_to_yojson = 
  fun (x: public_dns_properties_mutable_change) -> assoc_to_yojson(
    [(
         "SOA",
         (Some (soa_change_to_yojson x.so_a)));
       
  ])

let public_dns_namespace_properties_change_to_yojson = 
  fun (x: public_dns_namespace_properties_change) -> assoc_to_yojson(
    [(
         "DnsProperties",
         (Some (public_dns_properties_mutable_change_to_yojson x.dns_properties)));
       
  ])

let public_dns_namespace_change_to_yojson = 
  fun (x: public_dns_namespace_change) -> assoc_to_yojson(
    [(
         "Properties",
         (option_to_yojson public_dns_namespace_properties_change_to_yojson x.properties));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       
  ])

let update_public_dns_namespace_request_to_yojson = 
  fun (x: update_public_dns_namespace_request) -> assoc_to_yojson(
    [(
         "Namespace",
         (Some (public_dns_namespace_change_to_yojson x.namespace)));
       (
         "UpdaterRequestId",
         (option_to_yojson resource_id_to_yojson x.updater_request_id));
       (
         "Id",
         (Some (resource_id_to_yojson x.id)));
       
  ])

let resource_in_use_to_yojson = 
  fun (x: resource_in_use) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let namespace_not_found_to_yojson = 
  fun (x: namespace_not_found) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let update_private_dns_namespace_response_to_yojson = 
  fun (x: update_private_dns_namespace_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let private_dns_properties_mutable_change_to_yojson = 
  fun (x: private_dns_properties_mutable_change) -> assoc_to_yojson(
    [(
         "SOA",
         (Some (soa_change_to_yojson x.so_a)));
       
  ])

let private_dns_namespace_properties_change_to_yojson = 
  fun (x: private_dns_namespace_properties_change) -> assoc_to_yojson(
    [(
         "DnsProperties",
         (Some (private_dns_properties_mutable_change_to_yojson x.dns_properties)));
       
  ])

let private_dns_namespace_change_to_yojson = 
  fun (x: private_dns_namespace_change) -> assoc_to_yojson(
    [(
         "Properties",
         (option_to_yojson private_dns_namespace_properties_change_to_yojson x.properties));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       
  ])

let update_private_dns_namespace_request_to_yojson = 
  fun (x: update_private_dns_namespace_request) -> assoc_to_yojson(
    [(
         "Namespace",
         (Some (private_dns_namespace_change_to_yojson x.namespace)));
       (
         "UpdaterRequestId",
         (option_to_yojson resource_id_to_yojson x.updater_request_id));
       (
         "Id",
         (Some (resource_id_to_yojson x.id)));
       
  ])

let custom_health_status_to_yojson = 
  fun (x: custom_health_status) -> match x with 
  | UNHEALTHY -> `String "UNHEALTHY"
    | HEALTHY -> `String "HEALTHY"
     

let update_instance_custom_health_status_request_to_yojson = 
  fun (x: update_instance_custom_health_status_request) -> assoc_to_yojson(
    [(
         "Status",
         (Some (custom_health_status_to_yojson x.status)));
       (
         "InstanceId",
         (Some (resource_id_to_yojson x.instance_id)));
       (
         "ServiceId",
         (Some (resource_id_to_yojson x.service_id)));
       
  ])

let instance_not_found_to_yojson = 
  fun (x: instance_not_found) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let custom_health_not_found_to_yojson = 
  fun (x: custom_health_not_found) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let update_http_namespace_response_to_yojson = 
  fun (x: update_http_namespace_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let http_namespace_change_to_yojson = 
  fun (x: http_namespace_change) -> assoc_to_yojson(
    [(
         "Description",
         (Some (resource_description_to_yojson x.description)));
       
  ])

let update_http_namespace_request_to_yojson = 
  fun (x: update_http_namespace_request) -> assoc_to_yojson(
    [(
         "Namespace",
         (Some (http_namespace_change_to_yojson x.namespace)));
       (
         "UpdaterRequestId",
         (option_to_yojson resource_id_to_yojson x.updater_request_id));
       (
         "Id",
         (Some (resource_id_to_yojson x.id)));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let amazon_resource_name_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let too_many_tags_exception_to_yojson = 
  fun (x: too_many_tags_exception) -> assoc_to_yojson(
    [(
         "ResourceName",
         (option_to_yojson amazon_resource_name_to_yojson x.resource_name));
       (
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let timestamp__to_yojson = timestamp_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
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

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       
  ])

let service_type_option_to_yojson = 
  fun (x: service_type_option) -> match x with 
  | HTTP -> `String "HTTP"
     

let service_type_to_yojson = 
  fun (x: service_type) -> match x with 
 
| DNS -> `String "DNS"
  | DNS_HTTP -> `String "DNS_HTTP"
  | HTTP -> `String "HTTP"
   

let arn_to_yojson = string_to_yojson

let service_name_to_yojson = string_to_yojson

let resource_count_to_yojson = int_to_yojson

let routing_policy_to_yojson = 
  fun (x: routing_policy) -> match x with 
  | WEIGHTED -> `String "WEIGHTED"
    | MULTIVALUE -> `String "MULTIVALUE"
     

let dns_config_to_yojson = 
  fun (x: dns_config) -> assoc_to_yojson(
    [(
         "DnsRecords",
         (Some (dns_record_list_to_yojson x.dns_records)));
       (
         "RoutingPolicy",
         (option_to_yojson routing_policy_to_yojson x.routing_policy));
       (
         "NamespaceId",
         (option_to_yojson resource_id_to_yojson x.namespace_id));
       
  ])

let health_check_custom_config_to_yojson = 
  fun (x: health_check_custom_config) -> assoc_to_yojson(
    [(
         "FailureThreshold",
         (option_to_yojson failure_threshold_to_yojson x.failure_threshold));
       
  ])

let service_summary_to_yojson = 
  fun (x: service_summary) -> assoc_to_yojson(
    [(
         "CreateDate",
         (option_to_yojson timestamp__to_yojson x.create_date));
       (
         "HealthCheckCustomConfig",
         (option_to_yojson health_check_custom_config_to_yojson x.health_check_custom_config));
       (
         "HealthCheckConfig",
         (option_to_yojson health_check_config_to_yojson x.health_check_config));
       (
         "DnsConfig",
         (option_to_yojson dns_config_to_yojson x.dns_config));
       (
         "InstanceCount",
         (option_to_yojson resource_count_to_yojson x.instance_count));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "Type",
         (option_to_yojson service_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson service_name_to_yojson x.name));
       (
         "Arn",
         (option_to_yojson arn_to_yojson x.arn));
       (
         "Id",
         (option_to_yojson resource_id_to_yojson x.id));
       
  ])

let service_summaries_list_to_yojson = 
  fun tree -> list_to_yojson service_summary_to_yojson tree

let service_filter_name_to_yojson = 
  fun (x: service_filter_name) -> match x with 
  | NAMESPACE_ID -> `String "NAMESPACE_ID"
     

let filter_value_to_yojson = string_to_yojson

let filter_values_to_yojson = 
  fun tree -> list_to_yojson filter_value_to_yojson tree

let filter_condition_to_yojson = 
  fun (x: filter_condition) -> match x with 
 
| BEGINS_WITH -> `String "BEGINS_WITH"
  | BETWEEN -> `String "BETWEEN"
  | IN -> `String "IN"
  | EQ -> `String "EQ"
   

let service_filter_to_yojson = 
  fun (x: service_filter) -> assoc_to_yojson(
    [(
         "Condition",
         (option_to_yojson filter_condition_to_yojson x.condition));
       (
         "Values",
         (Some (filter_values_to_yojson x.values)));
       (
         "Name",
         (Some (service_filter_name_to_yojson x.name)));
       
  ])

let service_filters_to_yojson = 
  fun tree -> list_to_yojson service_filter_to_yojson tree

let service_already_exists_to_yojson = 
  fun (x: service_already_exists) -> assoc_to_yojson(
    [(
         "ServiceId",
         (option_to_yojson resource_id_to_yojson x.service_id));
       (
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let service_to_yojson = 
  fun (x: service) -> assoc_to_yojson(
    [(
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "CreateDate",
         (option_to_yojson timestamp__to_yojson x.create_date));
       (
         "HealthCheckCustomConfig",
         (option_to_yojson health_check_custom_config_to_yojson x.health_check_custom_config));
       (
         "HealthCheckConfig",
         (option_to_yojson health_check_config_to_yojson x.health_check_config));
       (
         "Type",
         (option_to_yojson service_type_to_yojson x.type_));
       (
         "DnsConfig",
         (option_to_yojson dns_config_to_yojson x.dns_config));
       (
         "InstanceCount",
         (option_to_yojson resource_count_to_yojson x.instance_count));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "NamespaceId",
         (option_to_yojson resource_id_to_yojson x.namespace_id));
       (
         "Name",
         (option_to_yojson service_name_to_yojson x.name));
       (
         "Arn",
         (option_to_yojson arn_to_yojson x.arn));
       (
         "Id",
         (option_to_yojson resource_id_to_yojson x.id));
       
  ])

let so_a_to_yojson = 
  fun (x: so_a) -> assoc_to_yojson(
    [(
         "TTL",
         (Some (record_tt_l_to_yojson x.tt_l)));
       
  ])

let resource_limit_exceeded_to_yojson = 
  fun (x: resource_limit_exceeded) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let register_instance_response_to_yojson = 
  fun (x: register_instance_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let instance_id_to_yojson = string_to_yojson

let attr_value_to_yojson = string_to_yojson

let attr_key_to_yojson = string_to_yojson

let attributes_to_yojson = 
  fun tree -> map_to_yojson attr_value_to_yojson tree

let register_instance_request_to_yojson = 
  fun (x: register_instance_request) -> assoc_to_yojson(
    [(
         "Attributes",
         (Some (attributes_to_yojson x.attributes)));
       (
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       (
         "ServiceId",
         (Some (resource_id_to_yojson x.service_id)));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       
  ])

let next_token_to_yojson = string_to_yojson

let list_services_response_to_yojson = 
  fun (x: list_services_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Services",
         (option_to_yojson service_summaries_list_to_yojson x.services));
       
  ])

let max_results_to_yojson = int_to_yojson

let list_services_request_to_yojson = 
  fun (x: list_services_request) -> assoc_to_yojson(
    [(
         "Filters",
         (option_to_yojson service_filters_to_yojson x.filters));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let operation_status_to_yojson = 
  fun (x: operation_status) -> match x with 
 
| FAIL -> `String "FAIL"
  | SUCCESS -> `String "SUCCESS"
  | PENDING -> `String "PENDING"
  | SUBMITTED -> `String "SUBMITTED"
   

let operation_summary_to_yojson = 
  fun (x: operation_summary) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson operation_status_to_yojson x.status));
       (
         "Id",
         (option_to_yojson operation_id_to_yojson x.id));
       
  ])

let operation_summary_list_to_yojson = 
  fun tree -> list_to_yojson operation_summary_to_yojson tree

let list_operations_response_to_yojson = 
  fun (x: list_operations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Operations",
         (option_to_yojson operation_summary_list_to_yojson x.operations));
       
  ])

let operation_filter_name_to_yojson = 
  fun (x: operation_filter_name) -> match x with 
 
| UPDATE_DATE -> `String "UPDATE_DATE"
  | TYPE -> `String "TYPE"
  | STATUS -> `String "STATUS"
  | SERVICE_ID -> `String "SERVICE_ID"
  | NAMESPACE_ID -> `String "NAMESPACE_ID"
   

let operation_filter_to_yojson = 
  fun (x: operation_filter) -> assoc_to_yojson(
    [(
         "Condition",
         (option_to_yojson filter_condition_to_yojson x.condition));
       (
         "Values",
         (Some (filter_values_to_yojson x.values)));
       (
         "Name",
         (Some (operation_filter_name_to_yojson x.name)));
       
  ])

let operation_filters_to_yojson = 
  fun tree -> list_to_yojson operation_filter_to_yojson tree

let list_operations_request_to_yojson = 
  fun (x: list_operations_request) -> assoc_to_yojson(
    [(
         "Filters",
         (option_to_yojson operation_filters_to_yojson x.filters));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let namespace_name_to_yojson = string_to_yojson

let namespace_type_to_yojson = 
  fun (x: namespace_type) -> match x with 
 
| HTTP -> `String "HTTP"
  | DNS_PRIVATE -> `String "DNS_PRIVATE"
  | DNS_PUBLIC -> `String "DNS_PUBLIC"
   

let dns_properties_to_yojson = 
  fun (x: dns_properties) -> assoc_to_yojson(
    [(
         "SOA",
         (option_to_yojson so_a_to_yojson x.so_a));
       (
         "HostedZoneId",
         (option_to_yojson resource_id_to_yojson x.hosted_zone_id));
       
  ])

let http_properties_to_yojson = 
  fun (x: http_properties) -> assoc_to_yojson(
    [(
         "HttpName",
         (option_to_yojson namespace_name_to_yojson x.http_name));
       
  ])

let namespace_properties_to_yojson = 
  fun (x: namespace_properties) -> assoc_to_yojson(
    [(
         "HttpProperties",
         (option_to_yojson http_properties_to_yojson x.http_properties));
       (
         "DnsProperties",
         (option_to_yojson dns_properties_to_yojson x.dns_properties));
       
  ])

let namespace_summary_to_yojson = 
  fun (x: namespace_summary) -> assoc_to_yojson(
    [(
         "CreateDate",
         (option_to_yojson timestamp__to_yojson x.create_date));
       (
         "Properties",
         (option_to_yojson namespace_properties_to_yojson x.properties));
       (
         "ServiceCount",
         (option_to_yojson resource_count_to_yojson x.service_count));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "Type",
         (option_to_yojson namespace_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson namespace_name_to_yojson x.name));
       (
         "Arn",
         (option_to_yojson arn_to_yojson x.arn));
       (
         "Id",
         (option_to_yojson resource_id_to_yojson x.id));
       
  ])

let namespace_summaries_list_to_yojson = 
  fun tree -> list_to_yojson namespace_summary_to_yojson tree

let list_namespaces_response_to_yojson = 
  fun (x: list_namespaces_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Namespaces",
         (option_to_yojson namespace_summaries_list_to_yojson x.namespaces));
       
  ])

let namespace_filter_name_to_yojson = 
  fun (x: namespace_filter_name) -> match x with 
 
| HTTP_NAME -> `String "HTTP_NAME"
  | NAME -> `String "NAME"
  | TYPE -> `String "TYPE"
   

let namespace_filter_to_yojson = 
  fun (x: namespace_filter) -> assoc_to_yojson(
    [(
         "Condition",
         (option_to_yojson filter_condition_to_yojson x.condition));
       (
         "Values",
         (Some (filter_values_to_yojson x.values)));
       (
         "Name",
         (Some (namespace_filter_name_to_yojson x.name)));
       
  ])

let namespace_filters_to_yojson = 
  fun tree -> list_to_yojson namespace_filter_to_yojson tree

let list_namespaces_request_to_yojson = 
  fun (x: list_namespaces_request) -> assoc_to_yojson(
    [(
         "Filters",
         (option_to_yojson namespace_filters_to_yojson x.filters));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let instance_summary_to_yojson = 
  fun (x: instance_summary) -> assoc_to_yojson(
    [(
         "Attributes",
         (option_to_yojson attributes_to_yojson x.attributes));
       (
         "Id",
         (option_to_yojson resource_id_to_yojson x.id));
       
  ])

let instance_summary_list_to_yojson = 
  fun tree -> list_to_yojson instance_summary_to_yojson tree

let list_instances_response_to_yojson = 
  fun (x: list_instances_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Instances",
         (option_to_yojson instance_summary_list_to_yojson x.instances));
       
  ])

let list_instances_request_to_yojson = 
  fun (x: list_instances_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ServiceId",
         (Some (resource_id_to_yojson x.service_id)));
       
  ])

let get_service_response_to_yojson = 
  fun (x: get_service_response) -> assoc_to_yojson(
    [(
         "Service",
         (option_to_yojson service_to_yojson x.service));
       
  ])

let get_service_request_to_yojson = 
  fun (x: get_service_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (resource_id_to_yojson x.id)));
       
  ])

let operation_not_found_to_yojson = 
  fun (x: operation_not_found) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let operation_type_to_yojson = 
  fun (x: operation_type) -> match x with 
 
| DEREGISTER_INSTANCE -> `String "DEREGISTER_INSTANCE"
  | REGISTER_INSTANCE -> `String "REGISTER_INSTANCE"
  | UPDATE_SERVICE -> `String "UPDATE_SERVICE"
  | UPDATE_NAMESPACE -> `String "UPDATE_NAMESPACE"
  | DELETE_NAMESPACE -> `String "DELETE_NAMESPACE"
  | CREATE_NAMESPACE -> `String "CREATE_NAMESPACE"
   

let message_to_yojson = string_to_yojson

let code_to_yojson = string_to_yojson

let operation_target_type_to_yojson = 
  fun (x: operation_target_type) -> match x with 
 
| INSTANCE -> `String "INSTANCE"
  | SERVICE -> `String "SERVICE"
  | NAMESPACE -> `String "NAMESPACE"
   

let operation_targets_map_to_yojson = 
  fun tree -> map_to_yojson resource_id_to_yojson tree

let operation_to_yojson = 
  fun (x: operation) -> assoc_to_yojson(
    [(
         "Targets",
         (option_to_yojson operation_targets_map_to_yojson x.targets));
       (
         "UpdateDate",
         (option_to_yojson timestamp__to_yojson x.update_date));
       (
         "CreateDate",
         (option_to_yojson timestamp__to_yojson x.create_date));
       (
         "ErrorCode",
         (option_to_yojson code_to_yojson x.error_code));
       (
         "ErrorMessage",
         (option_to_yojson message_to_yojson x.error_message));
       (
         "Status",
         (option_to_yojson operation_status_to_yojson x.status));
       (
         "Type",
         (option_to_yojson operation_type_to_yojson x.type_));
       (
         "Id",
         (option_to_yojson operation_id_to_yojson x.id));
       
  ])

let get_operation_response_to_yojson = 
  fun (x: get_operation_response) -> assoc_to_yojson(
    [(
         "Operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let get_operation_request_to_yojson = 
  fun (x: get_operation_request) -> assoc_to_yojson(
    [(
         "OperationId",
         (Some (resource_id_to_yojson x.operation_id)));
       
  ])

let namespace_to_yojson = 
  fun (x: namespace) -> assoc_to_yojson(
    [(
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "CreateDate",
         (option_to_yojson timestamp__to_yojson x.create_date));
       (
         "Properties",
         (option_to_yojson namespace_properties_to_yojson x.properties));
       (
         "ServiceCount",
         (option_to_yojson resource_count_to_yojson x.service_count));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "Type",
         (option_to_yojson namespace_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson namespace_name_to_yojson x.name));
       (
         "Arn",
         (option_to_yojson arn_to_yojson x.arn));
       (
         "Id",
         (option_to_yojson resource_id_to_yojson x.id));
       
  ])

let get_namespace_response_to_yojson = 
  fun (x: get_namespace_response) -> assoc_to_yojson(
    [(
         "Namespace",
         (option_to_yojson namespace_to_yojson x.namespace));
       
  ])

let get_namespace_request_to_yojson = 
  fun (x: get_namespace_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (resource_id_to_yojson x.id)));
       
  ])

let health_status_to_yojson = 
  fun (x: health_status) -> match x with 
 
| UNKNOWN -> `String "UNKNOWN"
  | UNHEALTHY -> `String "UNHEALTHY"
  | HEALTHY -> `String "HEALTHY"
   

let instance_health_status_map_to_yojson = 
  fun tree -> map_to_yojson health_status_to_yojson tree

let get_instances_health_status_response_to_yojson = 
  fun (x: get_instances_health_status_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Status",
         (option_to_yojson instance_health_status_map_to_yojson x.status));
       
  ])

let instance_id_list_to_yojson = 
  fun tree -> list_to_yojson resource_id_to_yojson tree

let get_instances_health_status_request_to_yojson = 
  fun (x: get_instances_health_status_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Instances",
         (option_to_yojson instance_id_list_to_yojson x.instances));
       (
         "ServiceId",
         (Some (resource_id_to_yojson x.service_id)));
       
  ])

let instance_to_yojson = 
  fun (x: instance) -> assoc_to_yojson(
    [(
         "Attributes",
         (option_to_yojson attributes_to_yojson x.attributes));
       (
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "Id",
         (Some (resource_id_to_yojson x.id)));
       
  ])

let get_instance_response_to_yojson = 
  fun (x: get_instance_response) -> assoc_to_yojson(
    [(
         "Instance",
         (option_to_yojson instance_to_yojson x.instance));
       
  ])

let get_instance_request_to_yojson = 
  fun (x: get_instance_request) -> assoc_to_yojson(
    [(
         "InstanceId",
         (Some (resource_id_to_yojson x.instance_id)));
       (
         "ServiceId",
         (Some (resource_id_to_yojson x.service_id)));
       
  ])

let request_limit_exceeded_to_yojson = 
  fun (x: request_limit_exceeded) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let revision_to_yojson = long_to_yojson

let discover_instances_revision_response_to_yojson = 
  fun (x: discover_instances_revision_response) -> assoc_to_yojson(
    [(
         "InstancesRevision",
         (option_to_yojson revision_to_yojson x.instances_revision));
       
  ])

let discover_instances_revision_request_to_yojson = 
  fun (x: discover_instances_revision_request) -> assoc_to_yojson(
    [(
         "ServiceName",
         (Some (service_name_to_yojson x.service_name)));
       (
         "NamespaceName",
         (Some (namespace_name_to_yojson x.namespace_name)));
       
  ])

let namespace_name_http_to_yojson = string_to_yojson

let http_instance_summary_to_yojson = 
  fun (x: http_instance_summary) -> assoc_to_yojson(
    [(
         "Attributes",
         (option_to_yojson attributes_to_yojson x.attributes));
       (
         "HealthStatus",
         (option_to_yojson health_status_to_yojson x.health_status));
       (
         "ServiceName",
         (option_to_yojson service_name_to_yojson x.service_name));
       (
         "NamespaceName",
         (option_to_yojson namespace_name_http_to_yojson x.namespace_name));
       (
         "InstanceId",
         (option_to_yojson resource_id_to_yojson x.instance_id));
       
  ])

let http_instance_summary_list_to_yojson = 
  fun tree -> list_to_yojson http_instance_summary_to_yojson tree

let discover_instances_response_to_yojson = 
  fun (x: discover_instances_response) -> assoc_to_yojson(
    [(
         "InstancesRevision",
         (option_to_yojson revision_to_yojson x.instances_revision));
       (
         "Instances",
         (option_to_yojson http_instance_summary_list_to_yojson x.instances));
       
  ])

let discover_max_results_to_yojson = int_to_yojson

let health_status_filter_to_yojson = 
  fun (x: health_status_filter) -> match x with 
 
| HEALTHY_OR_ELSE_ALL -> `String "HEALTHY_OR_ELSE_ALL"
  | ALL -> `String "ALL"
  | UNHEALTHY -> `String "UNHEALTHY"
  | HEALTHY -> `String "HEALTHY"
   

let discover_instances_request_to_yojson = 
  fun (x: discover_instances_request) -> assoc_to_yojson(
    [(
         "HealthStatus",
         (option_to_yojson health_status_filter_to_yojson x.health_status));
       (
         "OptionalParameters",
         (option_to_yojson attributes_to_yojson x.optional_parameters));
       (
         "QueryParameters",
         (option_to_yojson attributes_to_yojson x.query_parameters));
       (
         "MaxResults",
         (option_to_yojson discover_max_results_to_yojson x.max_results));
       (
         "ServiceName",
         (Some (service_name_to_yojson x.service_name)));
       (
         "NamespaceName",
         (Some (namespace_name_to_yojson x.namespace_name)));
       
  ])

let deregister_instance_response_to_yojson = 
  fun (x: deregister_instance_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let deregister_instance_request_to_yojson = 
  fun (x: deregister_instance_request) -> assoc_to_yojson(
    [(
         "InstanceId",
         (Some (resource_id_to_yojson x.instance_id)));
       (
         "ServiceId",
         (Some (resource_id_to_yojson x.service_id)));
       
  ])

let delete_service_response_to_yojson = 
  fun (x: delete_service_response) -> assoc_to_yojson(
    [
  ])

let delete_service_request_to_yojson = 
  fun (x: delete_service_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (resource_id_to_yojson x.id)));
       
  ])

let delete_namespace_response_to_yojson = 
  fun (x: delete_namespace_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let delete_namespace_request_to_yojson = 
  fun (x: delete_namespace_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (resource_id_to_yojson x.id)));
       
  ])

let create_service_response_to_yojson = 
  fun (x: create_service_response) -> assoc_to_yojson(
    [(
         "Service",
         (option_to_yojson service_to_yojson x.service));
       
  ])

let create_service_request_to_yojson = 
  fun (x: create_service_request) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson service_type_option_to_yojson x.type_));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "HealthCheckCustomConfig",
         (option_to_yojson health_check_custom_config_to_yojson x.health_check_custom_config));
       (
         "HealthCheckConfig",
         (option_to_yojson health_check_config_to_yojson x.health_check_config));
       (
         "DnsConfig",
         (option_to_yojson dns_config_to_yojson x.dns_config));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "NamespaceId",
         (option_to_yojson resource_id_to_yojson x.namespace_id));
       (
         "Name",
         (Some (service_name_to_yojson x.name)));
       
  ])

let namespace_already_exists_to_yojson = 
  fun (x: namespace_already_exists) -> assoc_to_yojson(
    [(
         "NamespaceId",
         (option_to_yojson resource_id_to_yojson x.namespace_id));
       (
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let create_public_dns_namespace_response_to_yojson = 
  fun (x: create_public_dns_namespace_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let namespace_name_public_to_yojson = string_to_yojson

let public_dns_properties_mutable_to_yojson = 
  fun (x: public_dns_properties_mutable) -> assoc_to_yojson(
    [(
         "SOA",
         (Some (so_a_to_yojson x.so_a)));
       
  ])

let public_dns_namespace_properties_to_yojson = 
  fun (x: public_dns_namespace_properties) -> assoc_to_yojson(
    [(
         "DnsProperties",
         (Some (public_dns_properties_mutable_to_yojson x.dns_properties)));
       
  ])

let create_public_dns_namespace_request_to_yojson = 
  fun (x: create_public_dns_namespace_request) -> assoc_to_yojson(
    [(
         "Properties",
         (option_to_yojson public_dns_namespace_properties_to_yojson x.properties));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "Name",
         (Some (namespace_name_public_to_yojson x.name)));
       
  ])

let create_private_dns_namespace_response_to_yojson = 
  fun (x: create_private_dns_namespace_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let namespace_name_private_to_yojson = string_to_yojson

let private_dns_properties_mutable_to_yojson = 
  fun (x: private_dns_properties_mutable) -> assoc_to_yojson(
    [(
         "SOA",
         (Some (so_a_to_yojson x.so_a)));
       
  ])

let private_dns_namespace_properties_to_yojson = 
  fun (x: private_dns_namespace_properties) -> assoc_to_yojson(
    [(
         "DnsProperties",
         (Some (private_dns_properties_mutable_to_yojson x.dns_properties)));
       
  ])

let create_private_dns_namespace_request_to_yojson = 
  fun (x: create_private_dns_namespace_request) -> assoc_to_yojson(
    [(
         "Properties",
         (option_to_yojson private_dns_namespace_properties_to_yojson x.properties));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Vpc",
         (Some (resource_id_to_yojson x.vpc)));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "Name",
         (Some (namespace_name_private_to_yojson x.name)));
       
  ])

let create_http_namespace_response_to_yojson = 
  fun (x: create_http_namespace_response) -> assoc_to_yojson(
    [(
         "OperationId",
         (option_to_yojson operation_id_to_yojson x.operation_id));
       
  ])

let create_http_namespace_request_to_yojson = 
  fun (x: create_http_namespace_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Description",
         (option_to_yojson resource_description_to_yojson x.description));
       (
         "CreatorRequestId",
         (option_to_yojson resource_id_to_yojson x.creator_request_id));
       (
         "Name",
         (Some (namespace_name_http_to_yojson x.name)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

