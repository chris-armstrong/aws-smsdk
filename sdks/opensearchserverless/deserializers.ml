open Smaws_Lib.Json.DeserializeHelpers

open Types

let saml_user_attribute_of_yojson = string_of_yojson

let saml_metadata_of_yojson = string_of_yojson

let saml_group_attribute_of_yojson = string_of_yojson

let vpc_id_of_yojson = string_of_yojson

let vpc_endpoint_id_of_yojson = string_of_yojson

let vpc_endpoint_name_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let vpc_endpoint_status_of_yojson = 
  fun (tree: t) path : vpc_endpoint_status -> match tree with 
    | `String "PENDING" -> PENDING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VpcEndpointStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "VpcEndpointStatus")

let vpc_endpoint_summary_of_yojson = 
  fun tree path : vpc_endpoint_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : vpc_endpoint_summary = {
    status = option_of_yojson (value_for_key (vpc_endpoint_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (vpc_endpoint_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (vpc_endpoint_id_of_yojson) "id") _list path;
    
  }
  in _res

let vpc_endpoint_summaries_of_yojson = 
  fun tree path -> list_of_yojson vpc_endpoint_summary_of_yojson tree path 

let vpc_endpoint_ids_of_yojson = 
  fun tree path -> list_of_yojson vpc_endpoint_id_of_yojson tree path 

let vpc_endpoint_filters_of_yojson = 
  fun tree path : vpc_endpoint_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : vpc_endpoint_filters = {
    status = option_of_yojson (value_for_key (vpc_endpoint_status_of_yojson) "status") _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let vpc_endpoint_error_detail_of_yojson = 
  fun tree path : vpc_endpoint_error_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : vpc_endpoint_error_detail = {
    error_code = option_of_yojson (value_for_key (base_string_of_yojson) "errorCode") _list path;
    error_message = option_of_yojson (value_for_key (base_string_of_yojson) "errorMessage") _list path;
    id = option_of_yojson (value_for_key (vpc_endpoint_id_of_yojson) "id") _list path;
    
  }
  in _res

let vpc_endpoint_error_details_of_yojson = 
  fun tree path -> list_of_yojson vpc_endpoint_error_detail_of_yojson tree path 

let subnet_id_of_yojson = string_of_yojson

let subnet_ids_of_yojson = 
  fun tree path -> list_of_yojson subnet_id_of_yojson tree path 

let security_group_id_of_yojson = string_of_yojson

let security_group_ids_of_yojson = 
  fun tree path -> list_of_yojson security_group_id_of_yojson tree path 

let base_long_of_yojson = long_of_yojson

let vpc_endpoint_detail_of_yojson = 
  fun tree path : vpc_endpoint_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : vpc_endpoint_detail = {
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    status = option_of_yojson (value_for_key (vpc_endpoint_status_of_yojson) "status") _list path;
    security_group_ids = option_of_yojson (value_for_key (security_group_ids_of_yojson) "securityGroupIds") _list path;
    subnet_ids = option_of_yojson (value_for_key (subnet_ids_of_yojson) "subnetIds") _list path;
    vpc_id = option_of_yojson (value_for_key (vpc_id_of_yojson) "vpcId") _list path;
    name = option_of_yojson (value_for_key (vpc_endpoint_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (vpc_endpoint_id_of_yojson) "id") _list path;
    
  }
  in _res

let vpc_endpoint_details_of_yojson = 
  fun tree path -> list_of_yojson vpc_endpoint_detail_of_yojson tree path 

let validation_exception_of_yojson = 
  fun tree path : validation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : validation_exception = {
    message = option_of_yojson (value_for_key (base_string_of_yojson) "message") _list path;
    
  }
  in _res

let update_vpc_endpoint_detail_of_yojson = 
  fun tree path : update_vpc_endpoint_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : update_vpc_endpoint_detail = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    security_group_ids = option_of_yojson (value_for_key (security_group_ids_of_yojson) "securityGroupIds") _list path;
    subnet_ids = option_of_yojson (value_for_key (subnet_ids_of_yojson) "subnetIds") _list path;
    status = option_of_yojson (value_for_key (vpc_endpoint_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (vpc_endpoint_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (vpc_endpoint_id_of_yojson) "id") _list path;
    
  }
  in _res

let update_vpc_endpoint_response_of_yojson = 
  fun tree path : update_vpc_endpoint_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_vpc_endpoint_response = {
    update_vpc_endpoint_detail = option_of_yojson (value_for_key (update_vpc_endpoint_detail_of_yojson) "UpdateVpcEndpointDetail") _list path;
    
  }
  in _res

let client_token_of_yojson = string_of_yojson

let update_vpc_endpoint_request_of_yojson = 
  fun tree path : update_vpc_endpoint_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_vpc_endpoint_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    remove_security_group_ids = option_of_yojson (value_for_key (security_group_ids_of_yojson) "removeSecurityGroupIds") _list path;
    add_security_group_ids = option_of_yojson (value_for_key (security_group_ids_of_yojson) "addSecurityGroupIds") _list path;
    remove_subnet_ids = option_of_yojson (value_for_key (subnet_ids_of_yojson) "removeSubnetIds") _list path;
    add_subnet_ids = option_of_yojson (value_for_key (subnet_ids_of_yojson) "addSubnetIds") _list path;
    id = value_for_key (vpc_endpoint_id_of_yojson) "id" _list path;
    
  }
  in _res

let internal_server_exception_of_yojson = 
  fun tree path : internal_server_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : internal_server_exception = {
    message = option_of_yojson (value_for_key (base_string_of_yojson) "message") _list path;
    
  }
  in _res

let conflict_exception_of_yojson = 
  fun tree path : conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception = {
    message = option_of_yojson (value_for_key (base_string_of_yojson) "message") _list path;
    
  }
  in _res

let security_policy_type_of_yojson = 
  fun (tree: t) path : security_policy_type -> match tree with 
    | `String "encryption" -> Encryption
    | `String "network" -> Network
    | `String value -> raise (deserialize_unknown_enum_value_error path "SecurityPolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "SecurityPolicyType")

let policy_name_of_yojson = string_of_yojson

let policy_version_of_yojson = string_of_yojson

let policy_description_of_yojson = string_of_yojson

let base_document_of_yojson = json_of_yojson

let security_policy_detail_of_yojson = 
  fun tree path : security_policy_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : security_policy_detail = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    policy = option_of_yojson (value_for_key (base_document_of_yojson) "policy") _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    policy_version = option_of_yojson (value_for_key (policy_version_of_yojson) "policyVersion") _list path;
    name = option_of_yojson (value_for_key (policy_name_of_yojson) "name") _list path;
    type_ = option_of_yojson (value_for_key (security_policy_type_of_yojson) "type") _list path;
    
  }
  in _res

let update_security_policy_response_of_yojson = 
  fun tree path : update_security_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_security_policy_response = {
    security_policy_detail = option_of_yojson (value_for_key (security_policy_detail_of_yojson) "securityPolicyDetail") _list path;
    
  }
  in _res

let policy_document_of_yojson = string_of_yojson

let update_security_policy_request_of_yojson = 
  fun tree path : update_security_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_security_policy_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    policy = option_of_yojson (value_for_key (policy_document_of_yojson) "policy") _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    policy_version = value_for_key (policy_version_of_yojson) "policyVersion" _list path;
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (security_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let service_quota_exceeded_exception_of_yojson = 
  fun tree path : service_quota_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : service_quota_exceeded_exception = {
    quota_code = option_of_yojson (value_for_key (base_string_of_yojson) "quotaCode") _list path;
    service_code = value_for_key (base_string_of_yojson) "serviceCode" _list path;
    resource_type = option_of_yojson (value_for_key (base_string_of_yojson) "resourceType") _list path;
    resource_id = option_of_yojson (value_for_key (base_string_of_yojson) "resourceId") _list path;
    message = value_for_key (base_string_of_yojson) "message" _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (base_string_of_yojson) "message") _list path;
    
  }
  in _res

let security_config_id_of_yojson = string_of_yojson

let security_config_type_of_yojson = 
  fun (tree: t) path : security_config_type -> match tree with 
    | `String "saml" -> Saml
    | `String value -> raise (deserialize_unknown_enum_value_error path "SecurityConfigType" value)
    | _ -> raise (deserialize_wrong_type_error path "SecurityConfigType")

let config_description_of_yojson = string_of_yojson

let base_integer_of_yojson = int_of_yojson

let saml_config_options_of_yojson = 
  fun tree path : saml_config_options ->
  let _list = assoc_of_yojson tree path in
  let _res : saml_config_options = {
    session_timeout = option_of_yojson (value_for_key (base_integer_of_yojson) "sessionTimeout") _list path;
    group_attribute = option_of_yojson (value_for_key (saml_group_attribute_of_yojson) "groupAttribute") _list path;
    user_attribute = option_of_yojson (value_for_key (saml_user_attribute_of_yojson) "userAttribute") _list path;
    metadata = value_for_key (saml_metadata_of_yojson) "metadata" _list path;
    
  }
  in _res

let security_config_detail_of_yojson = 
  fun tree path : security_config_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : security_config_detail = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    saml_options = option_of_yojson (value_for_key (saml_config_options_of_yojson) "samlOptions") _list path;
    description = option_of_yojson (value_for_key (config_description_of_yojson) "description") _list path;
    config_version = option_of_yojson (value_for_key (policy_version_of_yojson) "configVersion") _list path;
    type_ = option_of_yojson (value_for_key (security_config_type_of_yojson) "type") _list path;
    id = option_of_yojson (value_for_key (security_config_id_of_yojson) "id") _list path;
    
  }
  in _res

let update_security_config_response_of_yojson = 
  fun tree path : update_security_config_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_security_config_response = {
    security_config_detail = option_of_yojson (value_for_key (security_config_detail_of_yojson) "securityConfigDetail") _list path;
    
  }
  in _res

let update_security_config_request_of_yojson = 
  fun tree path : update_security_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_security_config_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    saml_options = option_of_yojson (value_for_key (saml_config_options_of_yojson) "samlOptions") _list path;
    description = option_of_yojson (value_for_key (config_description_of_yojson) "description") _list path;
    config_version = value_for_key (policy_version_of_yojson) "configVersion" _list path;
    id = value_for_key (security_config_id_of_yojson) "id" _list path;
    
  }
  in _res

let lifecycle_policy_type_of_yojson = 
  fun (tree: t) path : lifecycle_policy_type -> match tree with 
    | `String "retention" -> Retention
    | `String value -> raise (deserialize_unknown_enum_value_error path "LifecyclePolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "LifecyclePolicyType")

let lifecycle_policy_detail_of_yojson = 
  fun tree path : lifecycle_policy_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : lifecycle_policy_detail = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    policy = option_of_yojson (value_for_key (base_document_of_yojson) "policy") _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    policy_version = option_of_yojson (value_for_key (policy_version_of_yojson) "policyVersion") _list path;
    name = option_of_yojson (value_for_key (policy_name_of_yojson) "name") _list path;
    type_ = option_of_yojson (value_for_key (lifecycle_policy_type_of_yojson) "type") _list path;
    
  }
  in _res

let update_lifecycle_policy_response_of_yojson = 
  fun tree path : update_lifecycle_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_lifecycle_policy_response = {
    lifecycle_policy_detail = option_of_yojson (value_for_key (lifecycle_policy_detail_of_yojson) "lifecyclePolicyDetail") _list path;
    
  }
  in _res

let update_lifecycle_policy_request_of_yojson = 
  fun tree path : update_lifecycle_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_lifecycle_policy_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    policy = option_of_yojson (value_for_key (policy_document_of_yojson) "policy") _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    policy_version = value_for_key (policy_version_of_yojson) "policyVersion" _list path;
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (lifecycle_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let collection_id_of_yojson = string_of_yojson

let collection_name_of_yojson = string_of_yojson

let collection_status_of_yojson = 
  fun (tree: t) path : collection_status -> match tree with 
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CollectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CollectionStatus")

let collection_type_of_yojson = 
  fun (tree: t) path : collection_type -> match tree with 
    | `String "SEARCH" -> SEARCH
    | `String "TIMESERIES" -> TIMESERIES
    | `String "VECTORSEARCH" -> VECTORSEARCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "CollectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "CollectionType")

let update_collection_detail_of_yojson = 
  fun tree path : update_collection_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : update_collection_detail = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    arn = option_of_yojson (value_for_key (base_string_of_yojson) "arn") _list path;
    description = option_of_yojson (value_for_key (base_string_of_yojson) "description") _list path;
    type_ = option_of_yojson (value_for_key (collection_type_of_yojson) "type") _list path;
    status = option_of_yojson (value_for_key (collection_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (collection_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (collection_id_of_yojson) "id") _list path;
    
  }
  in _res

let update_collection_response_of_yojson = 
  fun tree path : update_collection_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_collection_response = {
    update_collection_detail = option_of_yojson (value_for_key (update_collection_detail_of_yojson) "updateCollectionDetail") _list path;
    
  }
  in _res

let update_collection_request_of_yojson = 
  fun tree path : update_collection_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_collection_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    description = option_of_yojson (value_for_key (base_string_of_yojson) "description") _list path;
    id = value_for_key (collection_id_of_yojson) "id" _list path;
    
  }
  in _res

let indexing_capacity_value_of_yojson = int_of_yojson

let search_capacity_value_of_yojson = int_of_yojson

let capacity_limits_of_yojson = 
  fun tree path : capacity_limits ->
  let _list = assoc_of_yojson tree path in
  let _res : capacity_limits = {
    max_search_capacity_in_oc_u = option_of_yojson (value_for_key (search_capacity_value_of_yojson) "maxSearchCapacityInOCU") _list path;
    max_indexing_capacity_in_oc_u = option_of_yojson (value_for_key (indexing_capacity_value_of_yojson) "maxIndexingCapacityInOCU") _list path;
    
  }
  in _res

let account_settings_detail_of_yojson = 
  fun tree path : account_settings_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : account_settings_detail = {
    capacity_limits = option_of_yojson (value_for_key (capacity_limits_of_yojson) "capacityLimits") _list path;
    
  }
  in _res

let update_account_settings_response_of_yojson = 
  fun tree path : update_account_settings_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_account_settings_response = {
    account_settings_detail = option_of_yojson (value_for_key (account_settings_detail_of_yojson) "accountSettingsDetail") _list path;
    
  }
  in _res

let update_account_settings_request_of_yojson = 
  fun tree path : update_account_settings_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_account_settings_request = {
    capacity_limits = option_of_yojson (value_for_key (capacity_limits_of_yojson) "capacityLimits") _list path;
    
  }
  in _res

let access_policy_type_of_yojson = 
  fun (tree: t) path : access_policy_type -> match tree with 
    | `String "data" -> Data
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessPolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessPolicyType")

let access_policy_detail_of_yojson = 
  fun tree path : access_policy_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : access_policy_detail = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    policy = option_of_yojson (value_for_key (base_document_of_yojson) "policy") _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    policy_version = option_of_yojson (value_for_key (policy_version_of_yojson) "policyVersion") _list path;
    name = option_of_yojson (value_for_key (policy_name_of_yojson) "name") _list path;
    type_ = option_of_yojson (value_for_key (access_policy_type_of_yojson) "type") _list path;
    
  }
  in _res

let update_access_policy_response_of_yojson = 
  fun tree path : update_access_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_access_policy_response = {
    access_policy_detail = option_of_yojson (value_for_key (access_policy_detail_of_yojson) "accessPolicyDetail") _list path;
    
  }
  in _res

let update_access_policy_request_of_yojson = 
  fun tree path : update_access_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_access_policy_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    policy = option_of_yojson (value_for_key (policy_document_of_yojson) "policy") _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    policy_version = value_for_key (policy_version_of_yojson) "policyVersion" _list path;
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (access_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let untag_resource_response_of_yojson = 
  fun tree path : untag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_response = ()
  in _res

let arn_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_keys_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_keys_of_yojson) "tagKeys" _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = value_for_key (tag_value_of_yojson) "value" _list path;
    key = value_for_key (tag_key_of_yojson) "key" _list path;
    
  }
  in _res

let tags_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_resource_response_of_yojson = 
  fun tree path : tag_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_response = ()
  in _res

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tags_of_yojson) "tags" _list path;
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let standby_replicas_of_yojson = 
  fun (tree: t) path : standby_replicas -> match tree with 
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StandbyReplicas" value)
    | _ -> raise (deserialize_wrong_type_error path "StandbyReplicas")

let security_policy_summary_of_yojson = 
  fun tree path : security_policy_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : security_policy_summary = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    policy_version = option_of_yojson (value_for_key (policy_version_of_yojson) "policyVersion") _list path;
    name = option_of_yojson (value_for_key (policy_name_of_yojson) "name") _list path;
    type_ = option_of_yojson (value_for_key (security_policy_type_of_yojson) "type") _list path;
    
  }
  in _res

let security_policy_summaries_of_yojson = 
  fun tree path -> list_of_yojson security_policy_summary_of_yojson tree path 

let security_policy_stats_of_yojson = 
  fun tree path : security_policy_stats ->
  let _list = assoc_of_yojson tree path in
  let _res : security_policy_stats = {
    network_policy_count = option_of_yojson (value_for_key (base_long_of_yojson) "NetworkPolicyCount") _list path;
    encryption_policy_count = option_of_yojson (value_for_key (base_long_of_yojson) "EncryptionPolicyCount") _list path;
    
  }
  in _res

let security_config_summary_of_yojson = 
  fun tree path : security_config_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : security_config_summary = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    description = option_of_yojson (value_for_key (config_description_of_yojson) "description") _list path;
    config_version = option_of_yojson (value_for_key (policy_version_of_yojson) "configVersion") _list path;
    type_ = option_of_yojson (value_for_key (security_config_type_of_yojson) "type") _list path;
    id = option_of_yojson (value_for_key (security_config_id_of_yojson) "id") _list path;
    
  }
  in _res

let security_config_summaries_of_yojson = 
  fun tree path -> list_of_yojson security_config_summary_of_yojson tree path 

let security_config_stats_of_yojson = 
  fun tree path : security_config_stats ->
  let _list = assoc_of_yojson tree path in
  let _res : security_config_stats = {
    saml_config_count = option_of_yojson (value_for_key (base_long_of_yojson) "SamlConfigCount") _list path;
    
  }
  in _res

let resource_type_of_yojson = 
  fun (tree: t) path : resource_type -> match tree with 
    | `String "index" -> Index
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")

let resource_name_of_yojson = string_of_yojson

let resource_of_yojson = string_of_yojson

let resource_filter_of_yojson = 
  fun tree path -> list_of_yojson resource_of_yojson tree path 

let list_tags_for_resource_response_of_yojson = 
  fun tree path : list_tags_for_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_response = {
    tags = option_of_yojson (value_for_key (tags_of_yojson) "tags") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    resource_arn = value_for_key (arn_of_yojson) "resourceArn" _list path;
    
  }
  in _res

let access_policy_stats_of_yojson = 
  fun tree path : access_policy_stats ->
  let _list = assoc_of_yojson tree path in
  let _res : access_policy_stats = {
    data_policy_count = option_of_yojson (value_for_key (base_long_of_yojson) "DataPolicyCount") _list path;
    
  }
  in _res

let lifecycle_policy_stats_of_yojson = 
  fun tree path : lifecycle_policy_stats ->
  let _list = assoc_of_yojson tree path in
  let _res : lifecycle_policy_stats = {
    retention_policy_count = option_of_yojson (value_for_key (base_long_of_yojson) "RetentionPolicyCount") _list path;
    
  }
  in _res

let get_policies_stats_response_of_yojson = 
  fun tree path : get_policies_stats_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_policies_stats_response = {
    total_policy_count = option_of_yojson (value_for_key (base_long_of_yojson) "TotalPolicyCount") _list path;
    lifecycle_policy_stats = option_of_yojson (value_for_key (lifecycle_policy_stats_of_yojson) "LifecyclePolicyStats") _list path;
    security_config_stats = option_of_yojson (value_for_key (security_config_stats_of_yojson) "SecurityConfigStats") _list path;
    security_policy_stats = option_of_yojson (value_for_key (security_policy_stats_of_yojson) "SecurityPolicyStats") _list path;
    access_policy_stats = option_of_yojson (value_for_key (access_policy_stats_of_yojson) "AccessPolicyStats") _list path;
    
  }
  in _res

let get_policies_stats_request_of_yojson = 
  fun tree path : get_policies_stats_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_policies_stats_request = ()
  in _res

let get_account_settings_response_of_yojson = 
  fun tree path : get_account_settings_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_account_settings_response = {
    account_settings_detail = option_of_yojson (value_for_key (account_settings_detail_of_yojson) "accountSettingsDetail") _list path;
    
  }
  in _res

let get_account_settings_request_of_yojson = 
  fun tree path : get_account_settings_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_account_settings_request = ()
  in _res

let create_security_policy_response_of_yojson = 
  fun tree path : create_security_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_security_policy_response = {
    security_policy_detail = option_of_yojson (value_for_key (security_policy_detail_of_yojson) "securityPolicyDetail") _list path;
    
  }
  in _res

let create_security_policy_request_of_yojson = 
  fun tree path : create_security_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_security_policy_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    policy = value_for_key (policy_document_of_yojson) "policy" _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (security_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let create_lifecycle_policy_response_of_yojson = 
  fun tree path : create_lifecycle_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_lifecycle_policy_response = {
    lifecycle_policy_detail = option_of_yojson (value_for_key (lifecycle_policy_detail_of_yojson) "lifecyclePolicyDetail") _list path;
    
  }
  in _res

let create_lifecycle_policy_request_of_yojson = 
  fun tree path : create_lifecycle_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_lifecycle_policy_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    policy = value_for_key (policy_document_of_yojson) "policy" _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (lifecycle_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let batch_get_vpc_endpoint_response_of_yojson = 
  fun tree path : batch_get_vpc_endpoint_response ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_vpc_endpoint_response = {
    vpc_endpoint_error_details = option_of_yojson (value_for_key (vpc_endpoint_error_details_of_yojson) "vpcEndpointErrorDetails") _list path;
    vpc_endpoint_details = option_of_yojson (value_for_key (vpc_endpoint_details_of_yojson) "vpcEndpointDetails") _list path;
    
  }
  in _res

let batch_get_vpc_endpoint_request_of_yojson = 
  fun tree path : batch_get_vpc_endpoint_request ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_vpc_endpoint_request = {
    ids = value_for_key (vpc_endpoint_ids_of_yojson) "ids" _list path;
    
  }
  in _res

let lifecycle_policy_details_of_yojson = 
  fun tree path -> list_of_yojson lifecycle_policy_detail_of_yojson tree path 

let lifecycle_policy_error_detail_of_yojson = 
  fun tree path : lifecycle_policy_error_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : lifecycle_policy_error_detail = {
    error_code = option_of_yojson (value_for_key (base_string_of_yojson) "errorCode") _list path;
    error_message = option_of_yojson (value_for_key (base_string_of_yojson) "errorMessage") _list path;
    name = option_of_yojson (value_for_key (policy_name_of_yojson) "name") _list path;
    type_ = option_of_yojson (value_for_key (lifecycle_policy_type_of_yojson) "type") _list path;
    
  }
  in _res

let lifecycle_policy_error_details_of_yojson = 
  fun tree path -> list_of_yojson lifecycle_policy_error_detail_of_yojson tree path 

let batch_get_lifecycle_policy_response_of_yojson = 
  fun tree path : batch_get_lifecycle_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_lifecycle_policy_response = {
    lifecycle_policy_error_details = option_of_yojson (value_for_key (lifecycle_policy_error_details_of_yojson) "lifecyclePolicyErrorDetails") _list path;
    lifecycle_policy_details = option_of_yojson (value_for_key (lifecycle_policy_details_of_yojson) "lifecyclePolicyDetails") _list path;
    
  }
  in _res

let lifecycle_policy_identifier_of_yojson = 
  fun tree path : lifecycle_policy_identifier ->
  let _list = assoc_of_yojson tree path in
  let _res : lifecycle_policy_identifier = {
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (lifecycle_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let lifecycle_policy_identifiers_of_yojson = 
  fun tree path -> list_of_yojson lifecycle_policy_identifier_of_yojson tree path 

let batch_get_lifecycle_policy_request_of_yojson = 
  fun tree path : batch_get_lifecycle_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_lifecycle_policy_request = {
    identifiers = value_for_key (lifecycle_policy_identifiers_of_yojson) "identifiers" _list path;
    
  }
  in _res

let base_boolean_of_yojson = bool_of_yojson

let effective_lifecycle_policy_detail_of_yojson = 
  fun tree path : effective_lifecycle_policy_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : effective_lifecycle_policy_detail = {
    no_min_retention_period = option_of_yojson (value_for_key (base_boolean_of_yojson) "noMinRetentionPeriod") _list path;
    retention_period = option_of_yojson (value_for_key (base_string_of_yojson) "retentionPeriod") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    policy_name = option_of_yojson (value_for_key (policy_name_of_yojson) "policyName") _list path;
    resource = option_of_yojson (value_for_key (resource_of_yojson) "resource") _list path;
    type_ = option_of_yojson (value_for_key (lifecycle_policy_type_of_yojson) "type") _list path;
    
  }
  in _res

let effective_lifecycle_policy_details_of_yojson = 
  fun tree path -> list_of_yojson effective_lifecycle_policy_detail_of_yojson tree path 

let effective_lifecycle_policy_error_detail_of_yojson = 
  fun tree path : effective_lifecycle_policy_error_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : effective_lifecycle_policy_error_detail = {
    error_code = option_of_yojson (value_for_key (base_string_of_yojson) "errorCode") _list path;
    error_message = option_of_yojson (value_for_key (base_string_of_yojson) "errorMessage") _list path;
    resource = option_of_yojson (value_for_key (resource_of_yojson) "resource") _list path;
    type_ = option_of_yojson (value_for_key (lifecycle_policy_type_of_yojson) "type") _list path;
    
  }
  in _res

let effective_lifecycle_policy_error_details_of_yojson = 
  fun tree path -> list_of_yojson effective_lifecycle_policy_error_detail_of_yojson tree path 

let batch_get_effective_lifecycle_policy_response_of_yojson = 
  fun tree path : batch_get_effective_lifecycle_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_effective_lifecycle_policy_response = {
    effective_lifecycle_policy_error_details = option_of_yojson (value_for_key (effective_lifecycle_policy_error_details_of_yojson) "effectiveLifecyclePolicyErrorDetails") _list path;
    effective_lifecycle_policy_details = option_of_yojson (value_for_key (effective_lifecycle_policy_details_of_yojson) "effectiveLifecyclePolicyDetails") _list path;
    
  }
  in _res

let lifecycle_policy_resource_identifier_of_yojson = 
  fun tree path : lifecycle_policy_resource_identifier ->
  let _list = assoc_of_yojson tree path in
  let _res : lifecycle_policy_resource_identifier = {
    resource = value_for_key (resource_name_of_yojson) "resource" _list path;
    type_ = value_for_key (lifecycle_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let lifecycle_policy_resource_identifiers_of_yojson = 
  fun tree path -> list_of_yojson lifecycle_policy_resource_identifier_of_yojson tree path 

let batch_get_effective_lifecycle_policy_request_of_yojson = 
  fun tree path : batch_get_effective_lifecycle_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_effective_lifecycle_policy_request = {
    resource_identifiers = value_for_key (lifecycle_policy_resource_identifiers_of_yojson) "resourceIdentifiers" _list path;
    
  }
  in _res

let collection_detail_of_yojson = 
  fun tree path : collection_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : collection_detail = {
    dashboard_endpoint = option_of_yojson (value_for_key (base_string_of_yojson) "dashboardEndpoint") _list path;
    collection_endpoint = option_of_yojson (value_for_key (base_string_of_yojson) "collectionEndpoint") _list path;
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    standby_replicas = option_of_yojson (value_for_key (standby_replicas_of_yojson) "standbyReplicas") _list path;
    kms_key_arn = option_of_yojson (value_for_key (base_string_of_yojson) "kmsKeyArn") _list path;
    arn = option_of_yojson (value_for_key (base_string_of_yojson) "arn") _list path;
    description = option_of_yojson (value_for_key (base_string_of_yojson) "description") _list path;
    type_ = option_of_yojson (value_for_key (collection_type_of_yojson) "type") _list path;
    status = option_of_yojson (value_for_key (collection_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (collection_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (collection_id_of_yojson) "id") _list path;
    
  }
  in _res

let collection_details_of_yojson = 
  fun tree path -> list_of_yojson collection_detail_of_yojson tree path 

let collection_error_detail_of_yojson = 
  fun tree path : collection_error_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : collection_error_detail = {
    error_code = option_of_yojson (value_for_key (base_string_of_yojson) "errorCode") _list path;
    error_message = option_of_yojson (value_for_key (base_string_of_yojson) "errorMessage") _list path;
    name = option_of_yojson (value_for_key (collection_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (collection_id_of_yojson) "id") _list path;
    
  }
  in _res

let collection_error_details_of_yojson = 
  fun tree path -> list_of_yojson collection_error_detail_of_yojson tree path 

let batch_get_collection_response_of_yojson = 
  fun tree path : batch_get_collection_response ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_collection_response = {
    collection_error_details = option_of_yojson (value_for_key (collection_error_details_of_yojson) "collectionErrorDetails") _list path;
    collection_details = option_of_yojson (value_for_key (collection_details_of_yojson) "collectionDetails") _list path;
    
  }
  in _res

let collection_ids_of_yojson = 
  fun tree path -> list_of_yojson collection_id_of_yojson tree path 

let collection_names_of_yojson = 
  fun tree path -> list_of_yojson collection_name_of_yojson tree path 

let batch_get_collection_request_of_yojson = 
  fun tree path : batch_get_collection_request ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_collection_request = {
    names = option_of_yojson (value_for_key (collection_names_of_yojson) "names") _list path;
    ids = option_of_yojson (value_for_key (collection_ids_of_yojson) "ids") _list path;
    
  }
  in _res

let ocu_limit_exceeded_exception_of_yojson = 
  fun tree path : ocu_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ocu_limit_exceeded_exception = {
    message = value_for_key (base_string_of_yojson) "message" _list path;
    
  }
  in _res

let list_vpc_endpoints_response_of_yojson = 
  fun tree path : list_vpc_endpoints_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_vpc_endpoints_response = {
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    vpc_endpoint_summaries = option_of_yojson (value_for_key (vpc_endpoint_summaries_of_yojson) "vpcEndpointSummaries") _list path;
    
  }
  in _res

let list_vpc_endpoints_request_of_yojson = 
  fun tree path : list_vpc_endpoints_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_vpc_endpoints_request = {
    max_results = option_of_yojson (value_for_key (base_integer_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    vpc_endpoint_filters = option_of_yojson (value_for_key (vpc_endpoint_filters_of_yojson) "vpcEndpointFilters") _list path;
    
  }
  in _res

let list_security_policies_response_of_yojson = 
  fun tree path : list_security_policies_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_security_policies_response = {
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    security_policy_summaries = option_of_yojson (value_for_key (security_policy_summaries_of_yojson) "securityPolicySummaries") _list path;
    
  }
  in _res

let list_security_policies_request_of_yojson = 
  fun tree path : list_security_policies_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_security_policies_request = {
    max_results = option_of_yojson (value_for_key (base_integer_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    resource = option_of_yojson (value_for_key (resource_filter_of_yojson) "resource") _list path;
    type_ = value_for_key (security_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let list_security_configs_response_of_yojson = 
  fun tree path : list_security_configs_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_security_configs_response = {
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    security_config_summaries = option_of_yojson (value_for_key (security_config_summaries_of_yojson) "securityConfigSummaries") _list path;
    
  }
  in _res

let list_security_configs_request_of_yojson = 
  fun tree path : list_security_configs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_security_configs_request = {
    max_results = option_of_yojson (value_for_key (base_integer_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    type_ = value_for_key (security_config_type_of_yojson) "type" _list path;
    
  }
  in _res

let lifecycle_policy_summary_of_yojson = 
  fun tree path : lifecycle_policy_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : lifecycle_policy_summary = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    policy_version = option_of_yojson (value_for_key (policy_version_of_yojson) "policyVersion") _list path;
    name = option_of_yojson (value_for_key (policy_name_of_yojson) "name") _list path;
    type_ = option_of_yojson (value_for_key (lifecycle_policy_type_of_yojson) "type") _list path;
    
  }
  in _res

let lifecycle_policy_summaries_of_yojson = 
  fun tree path -> list_of_yojson lifecycle_policy_summary_of_yojson tree path 

let list_lifecycle_policies_response_of_yojson = 
  fun tree path : list_lifecycle_policies_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_lifecycle_policies_response = {
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    lifecycle_policy_summaries = option_of_yojson (value_for_key (lifecycle_policy_summaries_of_yojson) "lifecyclePolicySummaries") _list path;
    
  }
  in _res

let lifecycle_resource_of_yojson = string_of_yojson

let lifecycle_resource_filter_of_yojson = 
  fun tree path -> list_of_yojson lifecycle_resource_of_yojson tree path 

let list_lifecycle_policies_request_of_yojson = 
  fun tree path : list_lifecycle_policies_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_lifecycle_policies_request = {
    max_results = option_of_yojson (value_for_key (base_integer_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    resources = option_of_yojson (value_for_key (lifecycle_resource_filter_of_yojson) "resources") _list path;
    type_ = value_for_key (lifecycle_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let collection_summary_of_yojson = 
  fun tree path : collection_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : collection_summary = {
    arn = option_of_yojson (value_for_key (base_string_of_yojson) "arn") _list path;
    status = option_of_yojson (value_for_key (collection_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (collection_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (collection_id_of_yojson) "id") _list path;
    
  }
  in _res

let collection_summaries_of_yojson = 
  fun tree path -> list_of_yojson collection_summary_of_yojson tree path 

let list_collections_response_of_yojson = 
  fun tree path : list_collections_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_collections_response = {
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    collection_summaries = option_of_yojson (value_for_key (collection_summaries_of_yojson) "collectionSummaries") _list path;
    
  }
  in _res

let collection_filters_of_yojson = 
  fun tree path : collection_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : collection_filters = {
    status = option_of_yojson (value_for_key (collection_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (collection_name_of_yojson) "name") _list path;
    
  }
  in _res

let list_collections_request_of_yojson = 
  fun tree path : list_collections_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_collections_request = {
    max_results = option_of_yojson (value_for_key (base_integer_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    collection_filters = option_of_yojson (value_for_key (collection_filters_of_yojson) "collectionFilters") _list path;
    
  }
  in _res

let access_policy_summary_of_yojson = 
  fun tree path : access_policy_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : access_policy_summary = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    policy_version = option_of_yojson (value_for_key (policy_version_of_yojson) "policyVersion") _list path;
    name = option_of_yojson (value_for_key (policy_name_of_yojson) "name") _list path;
    type_ = option_of_yojson (value_for_key (access_policy_type_of_yojson) "type") _list path;
    
  }
  in _res

let access_policy_summaries_of_yojson = 
  fun tree path -> list_of_yojson access_policy_summary_of_yojson tree path 

let list_access_policies_response_of_yojson = 
  fun tree path : list_access_policies_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_access_policies_response = {
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    access_policy_summaries = option_of_yojson (value_for_key (access_policy_summaries_of_yojson) "accessPolicySummaries") _list path;
    
  }
  in _res

let list_access_policies_request_of_yojson = 
  fun tree path : list_access_policies_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_access_policies_request = {
    max_results = option_of_yojson (value_for_key (base_integer_of_yojson) "maxResults") _list path;
    next_token = option_of_yojson (value_for_key (base_string_of_yojson) "nextToken") _list path;
    resource = option_of_yojson (value_for_key (resource_filter_of_yojson) "resource") _list path;
    type_ = value_for_key (access_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let get_security_policy_response_of_yojson = 
  fun tree path : get_security_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_security_policy_response = {
    security_policy_detail = option_of_yojson (value_for_key (security_policy_detail_of_yojson) "securityPolicyDetail") _list path;
    
  }
  in _res

let get_security_policy_request_of_yojson = 
  fun tree path : get_security_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_security_policy_request = {
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (security_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let get_security_config_response_of_yojson = 
  fun tree path : get_security_config_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_security_config_response = {
    security_config_detail = option_of_yojson (value_for_key (security_config_detail_of_yojson) "securityConfigDetail") _list path;
    
  }
  in _res

let get_security_config_request_of_yojson = 
  fun tree path : get_security_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_security_config_request = {
    id = value_for_key (security_config_id_of_yojson) "id" _list path;
    
  }
  in _res

let get_access_policy_response_of_yojson = 
  fun tree path : get_access_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_access_policy_response = {
    access_policy_detail = option_of_yojson (value_for_key (access_policy_detail_of_yojson) "accessPolicyDetail") _list path;
    
  }
  in _res

let get_access_policy_request_of_yojson = 
  fun tree path : get_access_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_access_policy_request = {
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (access_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let delete_vpc_endpoint_detail_of_yojson = 
  fun tree path : delete_vpc_endpoint_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_vpc_endpoint_detail = {
    status = option_of_yojson (value_for_key (vpc_endpoint_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (vpc_endpoint_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (vpc_endpoint_id_of_yojson) "id") _list path;
    
  }
  in _res

let delete_vpc_endpoint_response_of_yojson = 
  fun tree path : delete_vpc_endpoint_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_vpc_endpoint_response = {
    delete_vpc_endpoint_detail = option_of_yojson (value_for_key (delete_vpc_endpoint_detail_of_yojson) "deleteVpcEndpointDetail") _list path;
    
  }
  in _res

let delete_vpc_endpoint_request_of_yojson = 
  fun tree path : delete_vpc_endpoint_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_vpc_endpoint_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    id = value_for_key (vpc_endpoint_id_of_yojson) "id" _list path;
    
  }
  in _res

let delete_security_policy_response_of_yojson = 
  fun tree path : delete_security_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_security_policy_response = ()
  in _res

let delete_security_policy_request_of_yojson = 
  fun tree path : delete_security_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_security_policy_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (security_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let delete_security_config_response_of_yojson = 
  fun tree path : delete_security_config_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_security_config_response = ()
  in _res

let delete_security_config_request_of_yojson = 
  fun tree path : delete_security_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_security_config_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    id = value_for_key (security_config_id_of_yojson) "id" _list path;
    
  }
  in _res

let delete_lifecycle_policy_response_of_yojson = 
  fun tree path : delete_lifecycle_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_lifecycle_policy_response = ()
  in _res

let delete_lifecycle_policy_request_of_yojson = 
  fun tree path : delete_lifecycle_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_lifecycle_policy_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (lifecycle_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let delete_collection_detail_of_yojson = 
  fun tree path : delete_collection_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_collection_detail = {
    status = option_of_yojson (value_for_key (collection_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (collection_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (collection_id_of_yojson) "id") _list path;
    
  }
  in _res

let delete_collection_response_of_yojson = 
  fun tree path : delete_collection_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_collection_response = {
    delete_collection_detail = option_of_yojson (value_for_key (delete_collection_detail_of_yojson) "deleteCollectionDetail") _list path;
    
  }
  in _res

let delete_collection_request_of_yojson = 
  fun tree path : delete_collection_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_collection_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    id = value_for_key (collection_id_of_yojson) "id" _list path;
    
  }
  in _res

let delete_access_policy_response_of_yojson = 
  fun tree path : delete_access_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_access_policy_response = ()
  in _res

let delete_access_policy_request_of_yojson = 
  fun tree path : delete_access_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_access_policy_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (access_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let create_vpc_endpoint_detail_of_yojson = 
  fun tree path : create_vpc_endpoint_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : create_vpc_endpoint_detail = {
    status = option_of_yojson (value_for_key (vpc_endpoint_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (vpc_endpoint_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (vpc_endpoint_id_of_yojson) "id") _list path;
    
  }
  in _res

let create_vpc_endpoint_response_of_yojson = 
  fun tree path : create_vpc_endpoint_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_vpc_endpoint_response = {
    create_vpc_endpoint_detail = option_of_yojson (value_for_key (create_vpc_endpoint_detail_of_yojson) "createVpcEndpointDetail") _list path;
    
  }
  in _res

let create_vpc_endpoint_request_of_yojson = 
  fun tree path : create_vpc_endpoint_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_vpc_endpoint_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    security_group_ids = option_of_yojson (value_for_key (security_group_ids_of_yojson) "securityGroupIds") _list path;
    subnet_ids = value_for_key (subnet_ids_of_yojson) "subnetIds" _list path;
    vpc_id = value_for_key (vpc_id_of_yojson) "vpcId" _list path;
    name = value_for_key (vpc_endpoint_name_of_yojson) "name" _list path;
    
  }
  in _res

let create_security_config_response_of_yojson = 
  fun tree path : create_security_config_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_security_config_response = {
    security_config_detail = option_of_yojson (value_for_key (security_config_detail_of_yojson) "securityConfigDetail") _list path;
    
  }
  in _res

let config_name_of_yojson = string_of_yojson

let create_security_config_request_of_yojson = 
  fun tree path : create_security_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_security_config_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    saml_options = option_of_yojson (value_for_key (saml_config_options_of_yojson) "samlOptions") _list path;
    description = option_of_yojson (value_for_key (config_description_of_yojson) "description") _list path;
    name = value_for_key (config_name_of_yojson) "name" _list path;
    type_ = value_for_key (security_config_type_of_yojson) "type" _list path;
    
  }
  in _res

let create_collection_detail_of_yojson = 
  fun tree path : create_collection_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : create_collection_detail = {
    last_modified_date = option_of_yojson (value_for_key (base_long_of_yojson) "lastModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (base_long_of_yojson) "createdDate") _list path;
    standby_replicas = option_of_yojson (value_for_key (standby_replicas_of_yojson) "standbyReplicas") _list path;
    kms_key_arn = option_of_yojson (value_for_key (base_string_of_yojson) "kmsKeyArn") _list path;
    arn = option_of_yojson (value_for_key (base_string_of_yojson) "arn") _list path;
    description = option_of_yojson (value_for_key (base_string_of_yojson) "description") _list path;
    type_ = option_of_yojson (value_for_key (collection_type_of_yojson) "type") _list path;
    status = option_of_yojson (value_for_key (collection_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (collection_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (collection_id_of_yojson) "id") _list path;
    
  }
  in _res

let create_collection_response_of_yojson = 
  fun tree path : create_collection_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_collection_response = {
    create_collection_detail = option_of_yojson (value_for_key (create_collection_detail_of_yojson) "createCollectionDetail") _list path;
    
  }
  in _res

let create_collection_request_of_yojson = 
  fun tree path : create_collection_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_collection_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    standby_replicas = option_of_yojson (value_for_key (standby_replicas_of_yojson) "standbyReplicas") _list path;
    tags = option_of_yojson (value_for_key (tags_of_yojson) "tags") _list path;
    description = option_of_yojson (value_for_key (base_string_of_yojson) "description") _list path;
    type_ = option_of_yojson (value_for_key (collection_type_of_yojson) "type") _list path;
    name = value_for_key (collection_name_of_yojson) "name" _list path;
    
  }
  in _res

let create_access_policy_response_of_yojson = 
  fun tree path : create_access_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_access_policy_response = {
    access_policy_detail = option_of_yojson (value_for_key (access_policy_detail_of_yojson) "accessPolicyDetail") _list path;
    
  }
  in _res

let create_access_policy_request_of_yojson = 
  fun tree path : create_access_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_access_policy_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "clientToken") _list path;
    policy = value_for_key (policy_document_of_yojson) "policy" _list path;
    description = option_of_yojson (value_for_key (policy_description_of_yojson) "description") _list path;
    name = value_for_key (policy_name_of_yojson) "name" _list path;
    type_ = value_for_key (access_policy_type_of_yojson) "type" _list path;
    
  }
  in _res

let base_timestamp_of_yojson = 
  timestamp_of_yojson

