open Smaws_Lib.Json.DeserializeHelpers

open Types

let operation_id_of_yojson = string_of_yojson

let update_service_response_of_yojson = 
  fun tree path : update_service_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let resource_id_of_yojson = string_of_yojson

let resource_description_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let record_type_of_yojson = 
  fun (tree: t) path : record_type -> match tree with 
    | `String "CNAME" -> CNAME
    | `String "AAAA" -> AAAA
    | `String "A" -> A
    | `String "SRV" -> SRV
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordType")

let record_tt_l_of_yojson = long_of_yojson

let dns_record_of_yojson = 
  fun tree path : dns_record ->
  let _list = assoc_of_yojson tree path in
  let _res : dns_record = {
    tt_l = value_for_key (record_tt_l_of_yojson) "TTL" _list path;
    type_ = value_for_key (record_type_of_yojson) "Type" _list path;
    
  }
  in _res

let dns_record_list_of_yojson = 
  fun tree path -> list_of_yojson dns_record_of_yojson tree path 

let dns_config_change_of_yojson = 
  fun tree path : dns_config_change ->
  let _list = assoc_of_yojson tree path in
  let _res : dns_config_change = {
    dns_records = value_for_key (dns_record_list_of_yojson) "DnsRecords" _list path;
    
  }
  in _res

let health_check_type_of_yojson = 
  fun (tree: t) path : health_check_type -> match tree with 
    | `String "TCP" -> TCP
    | `String "HTTPS" -> HTTPS
    | `String "HTTP" -> HTTP
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthCheckType" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthCheckType")

let resource_path_of_yojson = string_of_yojson

let failure_threshold_of_yojson = int_of_yojson

let health_check_config_of_yojson = 
  fun tree path : health_check_config ->
  let _list = assoc_of_yojson tree path in
  let _res : health_check_config = {
    failure_threshold = option_of_yojson (value_for_key (failure_threshold_of_yojson) "FailureThreshold") _list path;
    resource_path = option_of_yojson (value_for_key (resource_path_of_yojson) "ResourcePath") _list path;
    type_ = value_for_key (health_check_type_of_yojson) "Type" _list path;
    
  }
  in _res

let service_change_of_yojson = 
  fun tree path : service_change ->
  let _list = assoc_of_yojson tree path in
  let _res : service_change = {
    health_check_config = option_of_yojson (value_for_key (health_check_config_of_yojson) "HealthCheckConfig") _list path;
    dns_config = option_of_yojson (value_for_key (dns_config_change_of_yojson) "DnsConfig") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    
  }
  in _res

let update_service_request_of_yojson = 
  fun tree path : update_service_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_request = {
    service = value_for_key (service_change_of_yojson) "Service" _list path;
    id = value_for_key (resource_id_of_yojson) "Id" _list path;
    
  }
  in _res

let error_message_of_yojson = string_of_yojson

let service_not_found_of_yojson = 
  fun tree path : service_not_found ->
  let _list = assoc_of_yojson tree path in
  let _res : service_not_found = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_input_of_yojson = 
  fun tree path : invalid_input ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_input = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let duplicate_request_of_yojson = 
  fun tree path : duplicate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : duplicate_request = {
    duplicate_operation_id = option_of_yojson (value_for_key (resource_id_of_yojson) "DuplicateOperationId") _list path;
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let update_public_dns_namespace_response_of_yojson = 
  fun tree path : update_public_dns_namespace_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_public_dns_namespace_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let soa_change_of_yojson = 
  fun tree path : soa_change ->
  let _list = assoc_of_yojson tree path in
  let _res : soa_change = {
    tt_l = value_for_key (record_tt_l_of_yojson) "TTL" _list path;
    
  }
  in _res

let public_dns_properties_mutable_change_of_yojson = 
  fun tree path : public_dns_properties_mutable_change ->
  let _list = assoc_of_yojson tree path in
  let _res : public_dns_properties_mutable_change = {
    so_a = value_for_key (soa_change_of_yojson) "SOA" _list path;
    
  }
  in _res

let public_dns_namespace_properties_change_of_yojson = 
  fun tree path : public_dns_namespace_properties_change ->
  let _list = assoc_of_yojson tree path in
  let _res : public_dns_namespace_properties_change = {
    dns_properties = value_for_key (public_dns_properties_mutable_change_of_yojson) "DnsProperties" _list path;
    
  }
  in _res

let public_dns_namespace_change_of_yojson = 
  fun tree path : public_dns_namespace_change ->
  let _list = assoc_of_yojson tree path in
  let _res : public_dns_namespace_change = {
    properties = option_of_yojson (value_for_key (public_dns_namespace_properties_change_of_yojson) "Properties") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    
  }
  in _res

let update_public_dns_namespace_request_of_yojson = 
  fun tree path : update_public_dns_namespace_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_public_dns_namespace_request = {
    namespace = value_for_key (public_dns_namespace_change_of_yojson) "Namespace" _list path;
    updater_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "UpdaterRequestId") _list path;
    id = value_for_key (resource_id_of_yojson) "Id" _list path;
    
  }
  in _res

let resource_in_use_of_yojson = 
  fun tree path : resource_in_use ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_in_use = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let namespace_not_found_of_yojson = 
  fun tree path : namespace_not_found ->
  let _list = assoc_of_yojson tree path in
  let _res : namespace_not_found = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let update_private_dns_namespace_response_of_yojson = 
  fun tree path : update_private_dns_namespace_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_private_dns_namespace_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let private_dns_properties_mutable_change_of_yojson = 
  fun tree path : private_dns_properties_mutable_change ->
  let _list = assoc_of_yojson tree path in
  let _res : private_dns_properties_mutable_change = {
    so_a = value_for_key (soa_change_of_yojson) "SOA" _list path;
    
  }
  in _res

let private_dns_namespace_properties_change_of_yojson = 
  fun tree path : private_dns_namespace_properties_change ->
  let _list = assoc_of_yojson tree path in
  let _res : private_dns_namespace_properties_change = {
    dns_properties = value_for_key (private_dns_properties_mutable_change_of_yojson) "DnsProperties" _list path;
    
  }
  in _res

let private_dns_namespace_change_of_yojson = 
  fun tree path : private_dns_namespace_change ->
  let _list = assoc_of_yojson tree path in
  let _res : private_dns_namespace_change = {
    properties = option_of_yojson (value_for_key (private_dns_namespace_properties_change_of_yojson) "Properties") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    
  }
  in _res

let update_private_dns_namespace_request_of_yojson = 
  fun tree path : update_private_dns_namespace_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_private_dns_namespace_request = {
    namespace = value_for_key (private_dns_namespace_change_of_yojson) "Namespace" _list path;
    updater_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "UpdaterRequestId") _list path;
    id = value_for_key (resource_id_of_yojson) "Id" _list path;
    
  }
  in _res

let custom_health_status_of_yojson = 
  fun (tree: t) path : custom_health_status -> match tree with 
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "CustomHealthStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomHealthStatus")

let update_instance_custom_health_status_request_of_yojson = 
  fun tree path : update_instance_custom_health_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_instance_custom_health_status_request = {
    status = value_for_key (custom_health_status_of_yojson) "Status" _list path;
    instance_id = value_for_key (resource_id_of_yojson) "InstanceId" _list path;
    service_id = value_for_key (resource_id_of_yojson) "ServiceId" _list path;
    
  }
  in _res

let instance_not_found_of_yojson = 
  fun tree path : instance_not_found ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_not_found = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let custom_health_not_found_of_yojson = 
  fun tree path : custom_health_not_found ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_health_not_found = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let update_http_namespace_response_of_yojson = 
  fun tree path : update_http_namespace_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_http_namespace_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let http_namespace_change_of_yojson = 
  fun tree path : http_namespace_change ->
  let _list = assoc_of_yojson tree path in
  let _res : http_namespace_change = {
    description = value_for_key (resource_description_of_yojson) "Description" _list path;
    
  }
  in _res

let update_http_namespace_request_of_yojson = 
  fun tree path : update_http_namespace_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_http_namespace_request = {
    namespace = value_for_key (http_namespace_change_of_yojson) "Namespace" _list path;
    updater_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "UpdaterRequestId") _list path;
    id = value_for_key (resource_id_of_yojson) "Id" _list path;
    
  }
  in _res

let untag_resource_response_of_yojson = 
  fun tree path : untag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_response = ()
  in _res

let amazon_resource_name_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "TagKeys" _list path;
    resource_ar_n = value_for_key (amazon_resource_name_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let too_many_tags_exception_of_yojson = 
  fun tree path : too_many_tags_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : too_many_tags_exception = {
    resource_name = option_of_yojson (value_for_key (amazon_resource_name_of_yojson) "ResourceName") _list path;
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let timestamp__of_yojson = timestamp_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson = 
  fun tree path : tag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_response = ()
  in _res

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = value_for_key (tag_value_of_yojson) "Value" _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    resource_ar_n = value_for_key (amazon_resource_name_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let service_type_option_of_yojson = 
  fun (tree: t) path : service_type_option -> match tree with 
    | `String "HTTP" -> HTTP
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceTypeOption" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceTypeOption")

let service_type_of_yojson = 
  fun (tree: t) path : service_type -> match tree with 
    | `String "DNS" -> DNS
    | `String "DNS_HTTP" -> DNS_HTTP
    | `String "HTTP" -> HTTP
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceType")

let arn_of_yojson = string_of_yojson

let service_name_of_yojson = string_of_yojson

let resource_count_of_yojson = int_of_yojson

let routing_policy_of_yojson = 
  fun (tree: t) path : routing_policy -> match tree with 
    | `String "WEIGHTED" -> WEIGHTED
    | `String "MULTIVALUE" -> MULTIVALUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RoutingPolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "RoutingPolicy")

let dns_config_of_yojson = 
  fun tree path : dns_config ->
  let _list = assoc_of_yojson tree path in
  let _res : dns_config = {
    dns_records = value_for_key (dns_record_list_of_yojson) "DnsRecords" _list path;
    routing_policy = option_of_yojson (value_for_key (routing_policy_of_yojson) "RoutingPolicy") _list path;
    namespace_id = option_of_yojson (value_for_key (resource_id_of_yojson) "NamespaceId") _list path;
    
  }
  in _res

let health_check_custom_config_of_yojson = 
  fun tree path : health_check_custom_config ->
  let _list = assoc_of_yojson tree path in
  let _res : health_check_custom_config = {
    failure_threshold = option_of_yojson (value_for_key (failure_threshold_of_yojson) "FailureThreshold") _list path;
    
  }
  in _res

let service_summary_of_yojson = 
  fun tree path : service_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : service_summary = {
    create_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CreateDate") _list path;
    health_check_custom_config = option_of_yojson (value_for_key (health_check_custom_config_of_yojson) "HealthCheckCustomConfig") _list path;
    health_check_config = option_of_yojson (value_for_key (health_check_config_of_yojson) "HealthCheckConfig") _list path;
    dns_config = option_of_yojson (value_for_key (dns_config_of_yojson) "DnsConfig") _list path;
    instance_count = option_of_yojson (value_for_key (resource_count_of_yojson) "InstanceCount") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    type_ = option_of_yojson (value_for_key (service_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (service_name_of_yojson) "Name") _list path;
    arn = option_of_yojson (value_for_key (arn_of_yojson) "Arn") _list path;
    id = option_of_yojson (value_for_key (resource_id_of_yojson) "Id") _list path;
    
  }
  in _res

let service_summaries_list_of_yojson = 
  fun tree path -> list_of_yojson service_summary_of_yojson tree path 

let service_filter_name_of_yojson = 
  fun (tree: t) path : service_filter_name -> match tree with 
    | `String "NAMESPACE_ID" -> NAMESPACE_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceFilterName")

let filter_value_of_yojson = string_of_yojson

let filter_values_of_yojson = 
  fun tree path -> list_of_yojson filter_value_of_yojson tree path 

let filter_condition_of_yojson = 
  fun (tree: t) path : filter_condition -> match tree with 
    | `String "BEGINS_WITH" -> BEGINS_WITH
    | `String "BETWEEN" -> BETWEEN
    | `String "IN" -> IN
    | `String "EQ" -> EQ
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterCondition" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterCondition")

let service_filter_of_yojson = 
  fun tree path : service_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : service_filter = {
    condition = option_of_yojson (value_for_key (filter_condition_of_yojson) "Condition") _list path;
    values = value_for_key (filter_values_of_yojson) "Values" _list path;
    name = value_for_key (service_filter_name_of_yojson) "Name" _list path;
    
  }
  in _res

let service_filters_of_yojson = 
  fun tree path -> list_of_yojson service_filter_of_yojson tree path 

let service_already_exists_of_yojson = 
  fun tree path : service_already_exists ->
  let _list = assoc_of_yojson tree path in
  let _res : service_already_exists = {
    service_id = option_of_yojson (value_for_key (resource_id_of_yojson) "ServiceId") _list path;
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let service_of_yojson = 
  fun tree path : service ->
  let _list = assoc_of_yojson tree path in
  let _res : service = {
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    create_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CreateDate") _list path;
    health_check_custom_config = option_of_yojson (value_for_key (health_check_custom_config_of_yojson) "HealthCheckCustomConfig") _list path;
    health_check_config = option_of_yojson (value_for_key (health_check_config_of_yojson) "HealthCheckConfig") _list path;
    type_ = option_of_yojson (value_for_key (service_type_of_yojson) "Type") _list path;
    dns_config = option_of_yojson (value_for_key (dns_config_of_yojson) "DnsConfig") _list path;
    instance_count = option_of_yojson (value_for_key (resource_count_of_yojson) "InstanceCount") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    namespace_id = option_of_yojson (value_for_key (resource_id_of_yojson) "NamespaceId") _list path;
    name = option_of_yojson (value_for_key (service_name_of_yojson) "Name") _list path;
    arn = option_of_yojson (value_for_key (arn_of_yojson) "Arn") _list path;
    id = option_of_yojson (value_for_key (resource_id_of_yojson) "Id") _list path;
    
  }
  in _res

let so_a_of_yojson = 
  fun tree path : so_a ->
  let _list = assoc_of_yojson tree path in
  let _res : so_a = {
    tt_l = value_for_key (record_tt_l_of_yojson) "TTL" _list path;
    
  }
  in _res

let resource_limit_exceeded_of_yojson = 
  fun tree path : resource_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_limit_exceeded = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let register_instance_response_of_yojson = 
  fun tree path : register_instance_response ->
  let _list = assoc_of_yojson tree path in
  let _res : register_instance_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let instance_id_of_yojson = string_of_yojson

let attr_value_of_yojson = string_of_yojson

let attr_key_of_yojson = string_of_yojson

let attributes_of_yojson = 
  fun tree path -> map_of_yojson attr_value_of_yojson tree path

let register_instance_request_of_yojson = 
  fun tree path : register_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_instance_request = {
    attributes = value_for_key (attributes_of_yojson) "Attributes" _list path;
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    service_id = value_for_key (resource_id_of_yojson) "ServiceId" _list path;
    
  }
  in _res

let list_tags_for_resource_response_of_yojson = 
  fun tree path : list_tags_for_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_response = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    resource_ar_n = value_for_key (amazon_resource_name_of_yojson) "ResourceARN" _list path;
    
  }
  in _res

let next_token_of_yojson = string_of_yojson

let list_services_response_of_yojson = 
  fun tree path : list_services_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_services_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    services = option_of_yojson (value_for_key (service_summaries_list_of_yojson) "Services") _list path;
    
  }
  in _res

let max_results_of_yojson = int_of_yojson

let list_services_request_of_yojson = 
  fun tree path : list_services_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_services_request = {
    filters = option_of_yojson (value_for_key (service_filters_of_yojson) "Filters") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let operation_status_of_yojson = 
  fun (tree: t) path : operation_status -> match tree with 
    | `String "FAIL" -> FAIL
    | `String "SUCCESS" -> SUCCESS
    | `String "PENDING" -> PENDING
    | `String "SUBMITTED" -> SUBMITTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationStatus")

let operation_summary_of_yojson = 
  fun tree path : operation_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : operation_summary = {
    status = option_of_yojson (value_for_key (operation_status_of_yojson) "Status") _list path;
    id = option_of_yojson (value_for_key (operation_id_of_yojson) "Id") _list path;
    
  }
  in _res

let operation_summary_list_of_yojson = 
  fun tree path -> list_of_yojson operation_summary_of_yojson tree path 

let list_operations_response_of_yojson = 
  fun tree path : list_operations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_operations_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    operations = option_of_yojson (value_for_key (operation_summary_list_of_yojson) "Operations") _list path;
    
  }
  in _res

let operation_filter_name_of_yojson = 
  fun (tree: t) path : operation_filter_name -> match tree with 
    | `String "UPDATE_DATE" -> UPDATE_DATE
    | `String "TYPE" -> TYPE
    | `String "STATUS" -> STATUS
    | `String "SERVICE_ID" -> SERVICE_ID
    | `String "NAMESPACE_ID" -> NAMESPACE_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationFilterName")

let operation_filter_of_yojson = 
  fun tree path : operation_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : operation_filter = {
    condition = option_of_yojson (value_for_key (filter_condition_of_yojson) "Condition") _list path;
    values = value_for_key (filter_values_of_yojson) "Values" _list path;
    name = value_for_key (operation_filter_name_of_yojson) "Name" _list path;
    
  }
  in _res

let operation_filters_of_yojson = 
  fun tree path -> list_of_yojson operation_filter_of_yojson tree path 

let list_operations_request_of_yojson = 
  fun tree path : list_operations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_operations_request = {
    filters = option_of_yojson (value_for_key (operation_filters_of_yojson) "Filters") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let namespace_name_of_yojson = string_of_yojson

let namespace_type_of_yojson = 
  fun (tree: t) path : namespace_type -> match tree with 
    | `String "HTTP" -> HTTP
    | `String "DNS_PRIVATE" -> DNS_PRIVATE
    | `String "DNS_PUBLIC" -> DNS_PUBLIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "NamespaceType" value)
    | _ -> raise (deserialize_wrong_type_error path "NamespaceType")

let dns_properties_of_yojson = 
  fun tree path : dns_properties ->
  let _list = assoc_of_yojson tree path in
  let _res : dns_properties = {
    so_a = option_of_yojson (value_for_key (so_a_of_yojson) "SOA") _list path;
    hosted_zone_id = option_of_yojson (value_for_key (resource_id_of_yojson) "HostedZoneId") _list path;
    
  }
  in _res

let http_properties_of_yojson = 
  fun tree path : http_properties ->
  let _list = assoc_of_yojson tree path in
  let _res : http_properties = {
    http_name = option_of_yojson (value_for_key (namespace_name_of_yojson) "HttpName") _list path;
    
  }
  in _res

let namespace_properties_of_yojson = 
  fun tree path : namespace_properties ->
  let _list = assoc_of_yojson tree path in
  let _res : namespace_properties = {
    http_properties = option_of_yojson (value_for_key (http_properties_of_yojson) "HttpProperties") _list path;
    dns_properties = option_of_yojson (value_for_key (dns_properties_of_yojson) "DnsProperties") _list path;
    
  }
  in _res

let namespace_summary_of_yojson = 
  fun tree path : namespace_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : namespace_summary = {
    create_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CreateDate") _list path;
    properties = option_of_yojson (value_for_key (namespace_properties_of_yojson) "Properties") _list path;
    service_count = option_of_yojson (value_for_key (resource_count_of_yojson) "ServiceCount") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    type_ = option_of_yojson (value_for_key (namespace_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (namespace_name_of_yojson) "Name") _list path;
    arn = option_of_yojson (value_for_key (arn_of_yojson) "Arn") _list path;
    id = option_of_yojson (value_for_key (resource_id_of_yojson) "Id") _list path;
    
  }
  in _res

let namespace_summaries_list_of_yojson = 
  fun tree path -> list_of_yojson namespace_summary_of_yojson tree path 

let list_namespaces_response_of_yojson = 
  fun tree path : list_namespaces_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_namespaces_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    namespaces = option_of_yojson (value_for_key (namespace_summaries_list_of_yojson) "Namespaces") _list path;
    
  }
  in _res

let namespace_filter_name_of_yojson = 
  fun (tree: t) path : namespace_filter_name -> match tree with 
    | `String "HTTP_NAME" -> HTTP_NAME
    | `String "NAME" -> NAME
    | `String "TYPE" -> TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "NamespaceFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "NamespaceFilterName")

let namespace_filter_of_yojson = 
  fun tree path : namespace_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : namespace_filter = {
    condition = option_of_yojson (value_for_key (filter_condition_of_yojson) "Condition") _list path;
    values = value_for_key (filter_values_of_yojson) "Values" _list path;
    name = value_for_key (namespace_filter_name_of_yojson) "Name" _list path;
    
  }
  in _res

let namespace_filters_of_yojson = 
  fun tree path -> list_of_yojson namespace_filter_of_yojson tree path 

let list_namespaces_request_of_yojson = 
  fun tree path : list_namespaces_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_namespaces_request = {
    filters = option_of_yojson (value_for_key (namespace_filters_of_yojson) "Filters") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let instance_summary_of_yojson = 
  fun tree path : instance_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_summary = {
    attributes = option_of_yojson (value_for_key (attributes_of_yojson) "Attributes") _list path;
    id = option_of_yojson (value_for_key (resource_id_of_yojson) "Id") _list path;
    
  }
  in _res

let instance_summary_list_of_yojson = 
  fun tree path -> list_of_yojson instance_summary_of_yojson tree path 

let list_instances_response_of_yojson = 
  fun tree path : list_instances_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_instances_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    instances = option_of_yojson (value_for_key (instance_summary_list_of_yojson) "Instances") _list path;
    
  }
  in _res

let list_instances_request_of_yojson = 
  fun tree path : list_instances_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_instances_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    service_id = value_for_key (resource_id_of_yojson) "ServiceId" _list path;
    
  }
  in _res

let get_service_response_of_yojson = 
  fun tree path : get_service_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_response = {
    service = option_of_yojson (value_for_key (service_of_yojson) "Service") _list path;
    
  }
  in _res

let get_service_request_of_yojson = 
  fun tree path : get_service_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_request = {
    id = value_for_key (resource_id_of_yojson) "Id" _list path;
    
  }
  in _res

let operation_not_found_of_yojson = 
  fun tree path : operation_not_found ->
  let _list = assoc_of_yojson tree path in
  let _res : operation_not_found = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let operation_type_of_yojson = 
  fun (tree: t) path : operation_type -> match tree with 
    | `String "DEREGISTER_INSTANCE" -> DEREGISTER_INSTANCE
    | `String "REGISTER_INSTANCE" -> REGISTER_INSTANCE
    | `String "UPDATE_SERVICE" -> UPDATE_SERVICE
    | `String "UPDATE_NAMESPACE" -> UPDATE_NAMESPACE
    | `String "DELETE_NAMESPACE" -> DELETE_NAMESPACE
    | `String "CREATE_NAMESPACE" -> CREATE_NAMESPACE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationType")

let message_of_yojson = string_of_yojson

let code_of_yojson = string_of_yojson

let operation_target_type_of_yojson = 
  fun (tree: t) path : operation_target_type -> match tree with 
    | `String "INSTANCE" -> INSTANCE
    | `String "SERVICE" -> SERVICE
    | `String "NAMESPACE" -> NAMESPACE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationTargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationTargetType")

let operation_targets_map_of_yojson = 
  fun tree path -> map_of_yojson resource_id_of_yojson tree path

let operation_of_yojson = 
  fun tree path : operation ->
  let _list = assoc_of_yojson tree path in
  let _res : operation = {
    targets = option_of_yojson (value_for_key (operation_targets_map_of_yojson) "Targets") _list path;
    update_date = option_of_yojson (value_for_key (timestamp__of_yojson) "UpdateDate") _list path;
    create_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CreateDate") _list path;
    error_code = option_of_yojson (value_for_key (code_of_yojson) "ErrorCode") _list path;
    error_message = option_of_yojson (value_for_key (message_of_yojson) "ErrorMessage") _list path;
    status = option_of_yojson (value_for_key (operation_status_of_yojson) "Status") _list path;
    type_ = option_of_yojson (value_for_key (operation_type_of_yojson) "Type") _list path;
    id = option_of_yojson (value_for_key (operation_id_of_yojson) "Id") _list path;
    
  }
  in _res

let get_operation_response_of_yojson = 
  fun tree path : get_operation_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_operation_response = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "Operation") _list path;
    
  }
  in _res

let get_operation_request_of_yojson = 
  fun tree path : get_operation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_operation_request = {
    operation_id = value_for_key (resource_id_of_yojson) "OperationId" _list path;
    
  }
  in _res

let namespace_of_yojson = 
  fun tree path : namespace ->
  let _list = assoc_of_yojson tree path in
  let _res : namespace = {
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    create_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CreateDate") _list path;
    properties = option_of_yojson (value_for_key (namespace_properties_of_yojson) "Properties") _list path;
    service_count = option_of_yojson (value_for_key (resource_count_of_yojson) "ServiceCount") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    type_ = option_of_yojson (value_for_key (namespace_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (namespace_name_of_yojson) "Name") _list path;
    arn = option_of_yojson (value_for_key (arn_of_yojson) "Arn") _list path;
    id = option_of_yojson (value_for_key (resource_id_of_yojson) "Id") _list path;
    
  }
  in _res

let get_namespace_response_of_yojson = 
  fun tree path : get_namespace_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_namespace_response = {
    namespace = option_of_yojson (value_for_key (namespace_of_yojson) "Namespace") _list path;
    
  }
  in _res

let get_namespace_request_of_yojson = 
  fun tree path : get_namespace_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_namespace_request = {
    id = value_for_key (resource_id_of_yojson) "Id" _list path;
    
  }
  in _res

let health_status_of_yojson = 
  fun (tree: t) path : health_status -> match tree with 
    | `String "UNKNOWN" -> UNKNOWN
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatus")

let instance_health_status_map_of_yojson = 
  fun tree path -> map_of_yojson health_status_of_yojson tree path

let get_instances_health_status_response_of_yojson = 
  fun tree path : get_instances_health_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instances_health_status_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    status = option_of_yojson (value_for_key (instance_health_status_map_of_yojson) "Status") _list path;
    
  }
  in _res

let instance_id_list_of_yojson = 
  fun tree path -> list_of_yojson resource_id_of_yojson tree path 

let get_instances_health_status_request_of_yojson = 
  fun tree path : get_instances_health_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instances_health_status_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    instances = option_of_yojson (value_for_key (instance_id_list_of_yojson) "Instances") _list path;
    service_id = value_for_key (resource_id_of_yojson) "ServiceId" _list path;
    
  }
  in _res

let instance_of_yojson = 
  fun tree path : instance ->
  let _list = assoc_of_yojson tree path in
  let _res : instance = {
    attributes = option_of_yojson (value_for_key (attributes_of_yojson) "Attributes") _list path;
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    id = value_for_key (resource_id_of_yojson) "Id" _list path;
    
  }
  in _res

let get_instance_response_of_yojson = 
  fun tree path : get_instance_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_response = {
    instance = option_of_yojson (value_for_key (instance_of_yojson) "Instance") _list path;
    
  }
  in _res

let get_instance_request_of_yojson = 
  fun tree path : get_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_request = {
    instance_id = value_for_key (resource_id_of_yojson) "InstanceId" _list path;
    service_id = value_for_key (resource_id_of_yojson) "ServiceId" _list path;
    
  }
  in _res

let request_limit_exceeded_of_yojson = 
  fun tree path : request_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : request_limit_exceeded = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let revision_of_yojson = long_of_yojson

let discover_instances_revision_response_of_yojson = 
  fun tree path : discover_instances_revision_response ->
  let _list = assoc_of_yojson tree path in
  let _res : discover_instances_revision_response = {
    instances_revision = option_of_yojson (value_for_key (revision_of_yojson) "InstancesRevision") _list path;
    
  }
  in _res

let discover_instances_revision_request_of_yojson = 
  fun tree path : discover_instances_revision_request ->
  let _list = assoc_of_yojson tree path in
  let _res : discover_instances_revision_request = {
    service_name = value_for_key (service_name_of_yojson) "ServiceName" _list path;
    namespace_name = value_for_key (namespace_name_of_yojson) "NamespaceName" _list path;
    
  }
  in _res

let namespace_name_http_of_yojson = string_of_yojson

let http_instance_summary_of_yojson = 
  fun tree path : http_instance_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : http_instance_summary = {
    attributes = option_of_yojson (value_for_key (attributes_of_yojson) "Attributes") _list path;
    health_status = option_of_yojson (value_for_key (health_status_of_yojson) "HealthStatus") _list path;
    service_name = option_of_yojson (value_for_key (service_name_of_yojson) "ServiceName") _list path;
    namespace_name = option_of_yojson (value_for_key (namespace_name_http_of_yojson) "NamespaceName") _list path;
    instance_id = option_of_yojson (value_for_key (resource_id_of_yojson) "InstanceId") _list path;
    
  }
  in _res

let http_instance_summary_list_of_yojson = 
  fun tree path -> list_of_yojson http_instance_summary_of_yojson tree path 

let discover_instances_response_of_yojson = 
  fun tree path : discover_instances_response ->
  let _list = assoc_of_yojson tree path in
  let _res : discover_instances_response = {
    instances_revision = option_of_yojson (value_for_key (revision_of_yojson) "InstancesRevision") _list path;
    instances = option_of_yojson (value_for_key (http_instance_summary_list_of_yojson) "Instances") _list path;
    
  }
  in _res

let discover_max_results_of_yojson = int_of_yojson

let health_status_filter_of_yojson = 
  fun (tree: t) path : health_status_filter -> match tree with 
    | `String "HEALTHY_OR_ELSE_ALL" -> HEALTHY_OR_ELSE_ALL
    | `String "ALL" -> ALL
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "HealthStatusFilter" value)
    | _ -> raise (deserialize_wrong_type_error path "HealthStatusFilter")

let discover_instances_request_of_yojson = 
  fun tree path : discover_instances_request ->
  let _list = assoc_of_yojson tree path in
  let _res : discover_instances_request = {
    health_status = option_of_yojson (value_for_key (health_status_filter_of_yojson) "HealthStatus") _list path;
    optional_parameters = option_of_yojson (value_for_key (attributes_of_yojson) "OptionalParameters") _list path;
    query_parameters = option_of_yojson (value_for_key (attributes_of_yojson) "QueryParameters") _list path;
    max_results = option_of_yojson (value_for_key (discover_max_results_of_yojson) "MaxResults") _list path;
    service_name = value_for_key (service_name_of_yojson) "ServiceName" _list path;
    namespace_name = value_for_key (namespace_name_of_yojson) "NamespaceName" _list path;
    
  }
  in _res

let deregister_instance_response_of_yojson = 
  fun tree path : deregister_instance_response ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_instance_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let deregister_instance_request_of_yojson = 
  fun tree path : deregister_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_instance_request = {
    instance_id = value_for_key (resource_id_of_yojson) "InstanceId" _list path;
    service_id = value_for_key (resource_id_of_yojson) "ServiceId" _list path;
    
  }
  in _res

let delete_service_response_of_yojson = 
  fun tree path : delete_service_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_response = ()
  in _res

let delete_service_request_of_yojson = 
  fun tree path : delete_service_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_service_request = {
    id = value_for_key (resource_id_of_yojson) "Id" _list path;
    
  }
  in _res

let delete_namespace_response_of_yojson = 
  fun tree path : delete_namespace_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_namespace_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let delete_namespace_request_of_yojson = 
  fun tree path : delete_namespace_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_namespace_request = {
    id = value_for_key (resource_id_of_yojson) "Id" _list path;
    
  }
  in _res

let create_service_response_of_yojson = 
  fun tree path : create_service_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_response = {
    service = option_of_yojson (value_for_key (service_of_yojson) "Service") _list path;
    
  }
  in _res

let create_service_request_of_yojson = 
  fun tree path : create_service_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_service_request = {
    type_ = option_of_yojson (value_for_key (service_type_option_of_yojson) "Type") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    health_check_custom_config = option_of_yojson (value_for_key (health_check_custom_config_of_yojson) "HealthCheckCustomConfig") _list path;
    health_check_config = option_of_yojson (value_for_key (health_check_config_of_yojson) "HealthCheckConfig") _list path;
    dns_config = option_of_yojson (value_for_key (dns_config_of_yojson) "DnsConfig") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    namespace_id = option_of_yojson (value_for_key (resource_id_of_yojson) "NamespaceId") _list path;
    name = value_for_key (service_name_of_yojson) "Name" _list path;
    
  }
  in _res

let namespace_already_exists_of_yojson = 
  fun tree path : namespace_already_exists ->
  let _list = assoc_of_yojson tree path in
  let _res : namespace_already_exists = {
    namespace_id = option_of_yojson (value_for_key (resource_id_of_yojson) "NamespaceId") _list path;
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    message = option_of_yojson (value_for_key (error_message_of_yojson) "Message") _list path;
    
  }
  in _res

let create_public_dns_namespace_response_of_yojson = 
  fun tree path : create_public_dns_namespace_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_public_dns_namespace_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let namespace_name_public_of_yojson = string_of_yojson

let public_dns_properties_mutable_of_yojson = 
  fun tree path : public_dns_properties_mutable ->
  let _list = assoc_of_yojson tree path in
  let _res : public_dns_properties_mutable = {
    so_a = value_for_key (so_a_of_yojson) "SOA" _list path;
    
  }
  in _res

let public_dns_namespace_properties_of_yojson = 
  fun tree path : public_dns_namespace_properties ->
  let _list = assoc_of_yojson tree path in
  let _res : public_dns_namespace_properties = {
    dns_properties = value_for_key (public_dns_properties_mutable_of_yojson) "DnsProperties" _list path;
    
  }
  in _res

let create_public_dns_namespace_request_of_yojson = 
  fun tree path : create_public_dns_namespace_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_public_dns_namespace_request = {
    properties = option_of_yojson (value_for_key (public_dns_namespace_properties_of_yojson) "Properties") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    name = value_for_key (namespace_name_public_of_yojson) "Name" _list path;
    
  }
  in _res

let create_private_dns_namespace_response_of_yojson = 
  fun tree path : create_private_dns_namespace_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_private_dns_namespace_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let namespace_name_private_of_yojson = string_of_yojson

let private_dns_properties_mutable_of_yojson = 
  fun tree path : private_dns_properties_mutable ->
  let _list = assoc_of_yojson tree path in
  let _res : private_dns_properties_mutable = {
    so_a = value_for_key (so_a_of_yojson) "SOA" _list path;
    
  }
  in _res

let private_dns_namespace_properties_of_yojson = 
  fun tree path : private_dns_namespace_properties ->
  let _list = assoc_of_yojson tree path in
  let _res : private_dns_namespace_properties = {
    dns_properties = value_for_key (private_dns_properties_mutable_of_yojson) "DnsProperties" _list path;
    
  }
  in _res

let create_private_dns_namespace_request_of_yojson = 
  fun tree path : create_private_dns_namespace_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_private_dns_namespace_request = {
    properties = option_of_yojson (value_for_key (private_dns_namespace_properties_of_yojson) "Properties") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    vpc = value_for_key (resource_id_of_yojson) "Vpc" _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    name = value_for_key (namespace_name_private_of_yojson) "Name" _list path;
    
  }
  in _res

let create_http_namespace_response_of_yojson = 
  fun tree path : create_http_namespace_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_http_namespace_response = {
    operation_id = option_of_yojson (value_for_key (operation_id_of_yojson) "OperationId") _list path;
    
  }
  in _res

let create_http_namespace_request_of_yojson = 
  fun tree path : create_http_namespace_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_http_namespace_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    description = option_of_yojson (value_for_key (resource_description_of_yojson) "Description") _list path;
    creator_request_id = option_of_yojson (value_for_key (resource_id_of_yojson) "CreatorRequestId") _list path;
    name = value_for_key (namespace_name_http_of_yojson) "Name" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

