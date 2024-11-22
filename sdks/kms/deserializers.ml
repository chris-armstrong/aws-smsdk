open Smaws_Lib.Json.DeserializeHelpers

open Types

let error_message_type_of_yojson = string_of_yojson

let xks_proxy_vpc_endpoint_service_not_found_exception_of_yojson = 
  fun tree path : xks_proxy_vpc_endpoint_service_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_vpc_endpoint_service_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_proxy_vpc_endpoint_service_name_type_of_yojson = string_of_yojson

let xks_proxy_vpc_endpoint_service_invalid_configuration_exception_of_yojson
= 
  fun tree path : xks_proxy_vpc_endpoint_service_invalid_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_vpc_endpoint_service_invalid_configuration_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_proxy_vpc_endpoint_service_in_use_exception_of_yojson = 
  fun tree path : xks_proxy_vpc_endpoint_service_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_vpc_endpoint_service_in_use_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_proxy_uri_unreachable_exception_of_yojson = 
  fun tree path : xks_proxy_uri_unreachable_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_uri_unreachable_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_proxy_uri_path_type_of_yojson = string_of_yojson

let xks_proxy_uri_in_use_exception_of_yojson = 
  fun tree path : xks_proxy_uri_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_uri_in_use_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_proxy_uri_endpoint_type_of_yojson = string_of_yojson

let xks_proxy_uri_endpoint_in_use_exception_of_yojson = 
  fun tree path : xks_proxy_uri_endpoint_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_uri_endpoint_in_use_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_proxy_invalid_response_exception_of_yojson = 
  fun tree path : xks_proxy_invalid_response_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_invalid_response_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_proxy_invalid_configuration_exception_of_yojson = 
  fun tree path : xks_proxy_invalid_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_invalid_configuration_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_proxy_incorrect_authentication_credential_exception_of_yojson = 
  fun tree path : xks_proxy_incorrect_authentication_credential_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_incorrect_authentication_credential_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let base_unit_of_yojson = unit_of_yojson

let xks_proxy_connectivity_type_of_yojson = 
  fun (tree: t) path : xks_proxy_connectivity_type -> match tree with 
    | `String "VPC_ENDPOINT_SERVICE" -> VPC_ENDPOINT_SERVICE
    | `String "PUBLIC_ENDPOINT" -> PUBLIC_ENDPOINT
    | `String value -> raise (deserialize_unknown_enum_value_error path "XksProxyConnectivityType" value)
    | _ -> raise (deserialize_wrong_type_error path "XksProxyConnectivityType")

let xks_proxy_authentication_access_key_id_type_of_yojson = 
  string_of_yojson

let xks_proxy_configuration_type_of_yojson = 
  fun tree path : xks_proxy_configuration_type ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_configuration_type = {
    vpc_endpoint_service_name = option_of_yojson (value_for_key (xks_proxy_vpc_endpoint_service_name_type_of_yojson) "VpcEndpointServiceName") _list path;
    uri_path = option_of_yojson (value_for_key (xks_proxy_uri_path_type_of_yojson) "UriPath") _list path;
    uri_endpoint = option_of_yojson (value_for_key (xks_proxy_uri_endpoint_type_of_yojson) "UriEndpoint") _list path;
    access_key_id = option_of_yojson (value_for_key (xks_proxy_authentication_access_key_id_type_of_yojson) "AccessKeyId") _list path;
    connectivity = option_of_yojson (value_for_key (xks_proxy_connectivity_type_of_yojson) "Connectivity") _list path;
    
  }
  in _res

let xks_proxy_authentication_raw_secret_access_key_type_of_yojson = 
  string_of_yojson

let xks_proxy_authentication_credential_type_of_yojson = 
  fun tree path : xks_proxy_authentication_credential_type ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_proxy_authentication_credential_type = {
    raw_secret_access_key = value_for_key (xks_proxy_authentication_raw_secret_access_key_type_of_yojson) "RawSecretAccessKey" _list path;
    access_key_id = value_for_key (xks_proxy_authentication_access_key_id_type_of_yojson) "AccessKeyId" _list path;
    
  }
  in _res

let xks_key_not_found_exception_of_yojson = 
  fun tree path : xks_key_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_key_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_key_invalid_configuration_exception_of_yojson = 
  fun tree path : xks_key_invalid_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_key_invalid_configuration_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let xks_key_id_type_of_yojson = string_of_yojson

let xks_key_configuration_type_of_yojson = 
  fun tree path : xks_key_configuration_type ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_key_configuration_type = {
    id = option_of_yojson (value_for_key (xks_key_id_type_of_yojson) "Id") _list path;
    
  }
  in _res

let xks_key_already_in_use_exception_of_yojson = 
  fun tree path : xks_key_already_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : xks_key_already_in_use_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let wrapping_key_spec_of_yojson = 
  fun (tree: t) path : wrapping_key_spec -> match tree with 
    | `String "SM2" -> SM2
    | `String "RSA_4096" -> RSA_4096
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_2048" -> RSA_2048
    | `String value -> raise (deserialize_unknown_enum_value_error path "WrappingKeySpec" value)
    | _ -> raise (deserialize_wrong_type_error path "WrappingKeySpec")

let key_id_type_of_yojson = string_of_yojson

let boolean_type_of_yojson = bool_of_yojson

let signing_algorithm_spec_of_yojson = 
  fun (tree: t) path : signing_algorithm_spec -> match tree with 
    | `String "SM2DSA" -> SM2DSA
    | `String "ECDSA_SHA_512" -> ECDSA_SHA_512
    | `String "ECDSA_SHA_384" -> ECDSA_SHA_384
    | `String "ECDSA_SHA_256" -> ECDSA_SHA_256
    | `String "RSASSA_PKCS1_V1_5_SHA_512" -> RSASSA_PKCS1_V1_5_SHA_512
    | `String "RSASSA_PKCS1_V1_5_SHA_384" -> RSASSA_PKCS1_V1_5_SHA_384
    | `String "RSASSA_PKCS1_V1_5_SHA_256" -> RSASSA_PKCS1_V1_5_SHA_256
    | `String "RSASSA_PSS_SHA_512" -> RSASSA_PSS_SHA_512
    | `String "RSASSA_PSS_SHA_384" -> RSASSA_PSS_SHA_384
    | `String "RSASSA_PSS_SHA_256" -> RSASSA_PSS_SHA_256
    | `String value -> raise (deserialize_unknown_enum_value_error path "SigningAlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "SigningAlgorithmSpec")

let verify_response_of_yojson = 
  fun tree path : verify_response ->
  let _list = assoc_of_yojson tree path in
  let _res : verify_response = {
    signing_algorithm = option_of_yojson (value_for_key (signing_algorithm_spec_of_yojson) "SigningAlgorithm") _list path;
    signature_valid = option_of_yojson (value_for_key (boolean_type_of_yojson) "SignatureValid") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let plaintext_type_of_yojson = blob_of_yojson

let message_type_of_yojson = 
  fun (tree: t) path : message_type -> match tree with 
    | `String "DIGEST" -> DIGEST
    | `String "RAW" -> RAW
    | `String value -> raise (deserialize_unknown_enum_value_error path "MessageType" value)
    | _ -> raise (deserialize_wrong_type_error path "MessageType")

let ciphertext_type_of_yojson = blob_of_yojson

let grant_token_type_of_yojson = string_of_yojson

let grant_token_list_of_yojson = 
  fun tree path -> list_of_yojson grant_token_type_of_yojson tree path 

let nullable_boolean_type_of_yojson = bool_of_yojson

let verify_request_of_yojson = 
  fun tree path : verify_request ->
  let _list = assoc_of_yojson tree path in
  let _res : verify_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    signing_algorithm = value_for_key (signing_algorithm_spec_of_yojson) "SigningAlgorithm" _list path;
    signature = value_for_key (ciphertext_type_of_yojson) "Signature" _list path;
    message_type = option_of_yojson (value_for_key (message_type_of_yojson) "MessageType") _list path;
    message = value_for_key (plaintext_type_of_yojson) "Message" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let mac_algorithm_spec_of_yojson = 
  fun (tree: t) path : mac_algorithm_spec -> match tree with 
    | `String "HMAC_SHA_512" -> HMAC_SHA_512
    | `String "HMAC_SHA_384" -> HMAC_SHA_384
    | `String "HMAC_SHA_256" -> HMAC_SHA_256
    | `String "HMAC_SHA_224" -> HMAC_SHA_224
    | `String value -> raise (deserialize_unknown_enum_value_error path "MacAlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "MacAlgorithmSpec")

let verify_mac_response_of_yojson = 
  fun tree path : verify_mac_response ->
  let _list = assoc_of_yojson tree path in
  let _res : verify_mac_response = {
    mac_algorithm = option_of_yojson (value_for_key (mac_algorithm_spec_of_yojson) "MacAlgorithm") _list path;
    mac_valid = option_of_yojson (value_for_key (boolean_type_of_yojson) "MacValid") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let verify_mac_request_of_yojson = 
  fun tree path : verify_mac_request ->
  let _list = assoc_of_yojson tree path in
  let _res : verify_mac_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    mac = value_for_key (ciphertext_type_of_yojson) "Mac" _list path;
    mac_algorithm = value_for_key (mac_algorithm_spec_of_yojson) "MacAlgorithm" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    message = value_for_key (plaintext_type_of_yojson) "Message" _list path;
    
  }
  in _res

let not_found_exception_of_yojson = 
  fun tree path : not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let kms_invalid_state_exception_of_yojson = 
  fun tree path : kms_invalid_state_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_invalid_state_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let kms_invalid_mac_exception_of_yojson = 
  fun tree path : kms_invalid_mac_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_invalid_mac_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let kms_internal_exception_of_yojson = 
  fun tree path : kms_internal_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_internal_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let key_unavailable_exception_of_yojson = 
  fun tree path : key_unavailable_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : key_unavailable_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_key_usage_exception_of_yojson = 
  fun tree path : invalid_key_usage_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_key_usage_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_grant_token_exception_of_yojson = 
  fun tree path : invalid_grant_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_grant_token_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let dry_run_operation_exception_of_yojson = 
  fun tree path : dry_run_operation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : dry_run_operation_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let disabled_exception_of_yojson = 
  fun tree path : disabled_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : disabled_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let kms_invalid_signature_exception_of_yojson = 
  fun tree path : kms_invalid_signature_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_invalid_signature_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let dependency_timeout_exception_of_yojson = 
  fun tree path : dependency_timeout_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : dependency_timeout_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let region_type_of_yojson = string_of_yojson

let update_primary_region_request_of_yojson = 
  fun tree path : update_primary_region_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_primary_region_request = {
    primary_region = value_for_key (region_type_of_yojson) "PrimaryRegion" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let unsupported_operation_exception_of_yojson = 
  fun tree path : unsupported_operation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_operation_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_arn_exception_of_yojson = 
  fun tree path : invalid_arn_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_arn_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let description_type_of_yojson = string_of_yojson

let update_key_description_request_of_yojson = 
  fun tree path : update_key_description_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_key_description_request = {
    description = value_for_key (description_type_of_yojson) "Description" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let update_custom_key_store_response_of_yojson = 
  fun tree path : update_custom_key_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_custom_key_store_response = ()
  in _res

let custom_key_store_id_type_of_yojson = string_of_yojson

let custom_key_store_name_type_of_yojson = string_of_yojson

let key_store_password_type_of_yojson = string_of_yojson

let cloud_hsm_cluster_id_type_of_yojson = string_of_yojson

let update_custom_key_store_request_of_yojson = 
  fun tree path : update_custom_key_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_custom_key_store_request = {
    xks_proxy_connectivity = option_of_yojson (value_for_key (xks_proxy_connectivity_type_of_yojson) "XksProxyConnectivity") _list path;
    xks_proxy_authentication_credential = option_of_yojson (value_for_key (xks_proxy_authentication_credential_type_of_yojson) "XksProxyAuthenticationCredential") _list path;
    xks_proxy_vpc_endpoint_service_name = option_of_yojson (value_for_key (xks_proxy_vpc_endpoint_service_name_type_of_yojson) "XksProxyVpcEndpointServiceName") _list path;
    xks_proxy_uri_path = option_of_yojson (value_for_key (xks_proxy_uri_path_type_of_yojson) "XksProxyUriPath") _list path;
    xks_proxy_uri_endpoint = option_of_yojson (value_for_key (xks_proxy_uri_endpoint_type_of_yojson) "XksProxyUriEndpoint") _list path;
    cloud_hsm_cluster_id = option_of_yojson (value_for_key (cloud_hsm_cluster_id_type_of_yojson) "CloudHsmClusterId") _list path;
    key_store_password = option_of_yojson (value_for_key (key_store_password_type_of_yojson) "KeyStorePassword") _list path;
    new_custom_key_store_name = option_of_yojson (value_for_key (custom_key_store_name_type_of_yojson) "NewCustomKeyStoreName") _list path;
    custom_key_store_id = value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId" _list path;
    
  }
  in _res

let custom_key_store_not_found_exception_of_yojson = 
  fun tree path : custom_key_store_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_key_store_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let custom_key_store_name_in_use_exception_of_yojson = 
  fun tree path : custom_key_store_name_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_key_store_name_in_use_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let custom_key_store_invalid_state_exception_of_yojson = 
  fun tree path : custom_key_store_invalid_state_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_key_store_invalid_state_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let cloud_hsm_cluster_not_related_exception_of_yojson = 
  fun tree path : cloud_hsm_cluster_not_related_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_hsm_cluster_not_related_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let cloud_hsm_cluster_not_found_exception_of_yojson = 
  fun tree path : cloud_hsm_cluster_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_hsm_cluster_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let cloud_hsm_cluster_not_active_exception_of_yojson = 
  fun tree path : cloud_hsm_cluster_not_active_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_hsm_cluster_not_active_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let cloud_hsm_cluster_invalid_configuration_exception_of_yojson = 
  fun tree path : cloud_hsm_cluster_invalid_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_hsm_cluster_invalid_configuration_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let alias_name_type_of_yojson = string_of_yojson

let update_alias_request_of_yojson = 
  fun tree path : update_alias_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_alias_request = {
    target_key_id = value_for_key (key_id_type_of_yojson) "TargetKeyId" _list path;
    alias_name = value_for_key (alias_name_type_of_yojson) "AliasName" _list path;
    
  }
  in _res

let limit_exceeded_exception_of_yojson = 
  fun tree path : limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let tag_key_type_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_type_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "TagKeys" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let tag_exception_of_yojson = 
  fun tree path : tag_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let trust_anchor_certificate_type_of_yojson = string_of_yojson

let tag_value_type_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    tag_value = value_for_key (tag_value_type_of_yojson) "TagValue" _list path;
    tag_key = value_for_key (tag_key_type_of_yojson) "TagKey" _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let sign_response_of_yojson = 
  fun tree path : sign_response ->
  let _list = assoc_of_yojson tree path in
  let _res : sign_response = {
    signing_algorithm = option_of_yojson (value_for_key (signing_algorithm_spec_of_yojson) "SigningAlgorithm") _list path;
    signature = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "Signature") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let sign_request_of_yojson = 
  fun tree path : sign_request ->
  let _list = assoc_of_yojson tree path in
  let _res : sign_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    signing_algorithm = value_for_key (signing_algorithm_spec_of_yojson) "SigningAlgorithm" _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    message_type = option_of_yojson (value_for_key (message_type_of_yojson) "MessageType") _list path;
    message = value_for_key (plaintext_type_of_yojson) "Message" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let date_type_of_yojson = timestamp_of_yojson

let key_state_of_yojson = 
  fun (tree: t) path : key_state -> match tree with 
    | `String "Updating" -> Updating
    | `String "Unavailable" -> Unavailable
    | `String "PendingReplicaDeletion" -> PendingReplicaDeletion
    | `String "PendingImport" -> PendingImport
    | `String "PendingDeletion" -> PendingDeletion
    | `String "Disabled" -> Disabled
    | `String "Enabled" -> Enabled
    | `String "Creating" -> Creating
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyState" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyState")

let pending_window_in_days_type_of_yojson = int_of_yojson

let schedule_key_deletion_response_of_yojson = 
  fun tree path : schedule_key_deletion_response ->
  let _list = assoc_of_yojson tree path in
  let _res : schedule_key_deletion_response = {
    pending_window_in_days = option_of_yojson (value_for_key (pending_window_in_days_type_of_yojson) "PendingWindowInDays") _list path;
    key_state = option_of_yojson (value_for_key (key_state_of_yojson) "KeyState") _list path;
    deletion_date = option_of_yojson (value_for_key (date_type_of_yojson) "DeletionDate") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let schedule_key_deletion_request_of_yojson = 
  fun tree path : schedule_key_deletion_request ->
  let _list = assoc_of_yojson tree path in
  let _res : schedule_key_deletion_request = {
    pending_window_in_days = option_of_yojson (value_for_key (pending_window_in_days_type_of_yojson) "PendingWindowInDays") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let conflict_exception_of_yojson = 
  fun tree path : conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let rotate_key_on_demand_response_of_yojson = 
  fun tree path : rotate_key_on_demand_response ->
  let _list = assoc_of_yojson tree path in
  let _res : rotate_key_on_demand_response = {
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let rotate_key_on_demand_request_of_yojson = 
  fun tree path : rotate_key_on_demand_request ->
  let _list = assoc_of_yojson tree path in
  let _res : rotate_key_on_demand_request = {
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let invalid_grant_id_exception_of_yojson = 
  fun tree path : invalid_grant_id_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_grant_id_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let grant_id_type_of_yojson = string_of_yojson

let revoke_grant_request_of_yojson = 
  fun tree path : revoke_grant_request ->
  let _list = assoc_of_yojson tree path in
  let _res : revoke_grant_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    grant_id = value_for_key (grant_id_type_of_yojson) "GrantId" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let retire_grant_request_of_yojson = 
  fun tree path : retire_grant_request ->
  let _list = assoc_of_yojson tree path in
  let _res : retire_grant_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    grant_id = option_of_yojson (value_for_key (grant_id_type_of_yojson) "GrantId") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    grant_token = option_of_yojson (value_for_key (grant_token_type_of_yojson) "GrantToken") _list path;
    
  }
  in _res

let malformed_policy_document_exception_of_yojson = 
  fun tree path : malformed_policy_document_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : malformed_policy_document_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let already_exists_exception_of_yojson = 
  fun tree path : already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : already_exists_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let aws_account_id_type_of_yojson = string_of_yojson

let arn_type_of_yojson = string_of_yojson

let key_usage_type_of_yojson = 
  fun (tree: t) path : key_usage_type -> match tree with 
    | `String "KEY_AGREEMENT" -> KEY_AGREEMENT
    | `String "GENERATE_VERIFY_MAC" -> GENERATE_VERIFY_MAC
    | `String "ENCRYPT_DECRYPT" -> ENCRYPT_DECRYPT
    | `String "SIGN_VERIFY" -> SIGN_VERIFY
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyUsageType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyUsageType")

let origin_type_of_yojson = 
  fun (tree: t) path : origin_type -> match tree with 
    | `String "EXTERNAL_KEY_STORE" -> EXTERNAL_KEY_STORE
    | `String "AWS_CLOUDHSM" -> AWS_CLOUDHSM
    | `String "EXTERNAL" -> EXTERNAL
    | `String "AWS_KMS" -> AWS_KMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "OriginType" value)
    | _ -> raise (deserialize_wrong_type_error path "OriginType")

let expiration_model_type_of_yojson = 
  fun (tree: t) path : expiration_model_type -> match tree with 
    | `String "KEY_MATERIAL_DOES_NOT_EXPIRE" -> KEY_MATERIAL_DOES_NOT_EXPIRE
    | `String "KEY_MATERIAL_EXPIRES" -> KEY_MATERIAL_EXPIRES
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExpirationModelType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExpirationModelType")

let key_manager_type_of_yojson = 
  fun (tree: t) path : key_manager_type -> match tree with 
    | `String "CUSTOMER" -> CUSTOMER
    | `String "AWS" -> AWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyManagerType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyManagerType")

let customer_master_key_spec_of_yojson = 
  fun (tree: t) path : customer_master_key_spec -> match tree with 
    | `String "SM2" -> SM2
    | `String "HMAC_512" -> HMAC_512
    | `String "HMAC_384" -> HMAC_384
    | `String "HMAC_256" -> HMAC_256
    | `String "HMAC_224" -> HMAC_224
    | `String "SYMMETRIC_DEFAULT" -> SYMMETRIC_DEFAULT
    | `String "ECC_SECG_P256K1" -> ECC_SECG_P256K1
    | `String "ECC_NIST_P521" -> ECC_NIST_P521
    | `String "ECC_NIST_P384" -> ECC_NIST_P384
    | `String "ECC_NIST_P256" -> ECC_NIST_P256
    | `String "RSA_4096" -> RSA_4096
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_2048" -> RSA_2048
    | `String value -> raise (deserialize_unknown_enum_value_error path "CustomerMasterKeySpec" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomerMasterKeySpec")

let key_spec_of_yojson = 
  fun (tree: t) path : key_spec -> match tree with 
    | `String "SM2" -> SM2
    | `String "HMAC_512" -> HMAC_512
    | `String "HMAC_384" -> HMAC_384
    | `String "HMAC_256" -> HMAC_256
    | `String "HMAC_224" -> HMAC_224
    | `String "SYMMETRIC_DEFAULT" -> SYMMETRIC_DEFAULT
    | `String "ECC_SECG_P256K1" -> ECC_SECG_P256K1
    | `String "ECC_NIST_P521" -> ECC_NIST_P521
    | `String "ECC_NIST_P384" -> ECC_NIST_P384
    | `String "ECC_NIST_P256" -> ECC_NIST_P256
    | `String "RSA_4096" -> RSA_4096
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_2048" -> RSA_2048
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeySpec" value)
    | _ -> raise (deserialize_wrong_type_error path "KeySpec")

let encryption_algorithm_spec_of_yojson = 
  fun (tree: t) path : encryption_algorithm_spec -> match tree with 
    | `String "SM2PKE" -> SM2PKE
    | `String "RSAES_OAEP_SHA_256" -> RSAES_OAEP_SHA_256
    | `String "RSAES_OAEP_SHA_1" -> RSAES_OAEP_SHA_1
    | `String "SYMMETRIC_DEFAULT" -> SYMMETRIC_DEFAULT
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionAlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionAlgorithmSpec")

let encryption_algorithm_spec_list_of_yojson = 
  fun tree path -> list_of_yojson encryption_algorithm_spec_of_yojson tree path 

let signing_algorithm_spec_list_of_yojson = 
  fun tree path -> list_of_yojson signing_algorithm_spec_of_yojson tree path 

let key_agreement_algorithm_spec_of_yojson = 
  fun (tree: t) path : key_agreement_algorithm_spec -> match tree with 
    | `String "ECDH" -> ECDH
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyAgreementAlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyAgreementAlgorithmSpec")

let key_agreement_algorithm_spec_list_of_yojson = 
  fun tree path -> list_of_yojson key_agreement_algorithm_spec_of_yojson tree path 

let multi_region_key_type_of_yojson = 
  fun (tree: t) path : multi_region_key_type -> match tree with 
    | `String "REPLICA" -> REPLICA
    | `String "PRIMARY" -> PRIMARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "MultiRegionKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "MultiRegionKeyType")

let multi_region_key_of_yojson = 
  fun tree path : multi_region_key ->
  let _list = assoc_of_yojson tree path in
  let _res : multi_region_key = {
    region = option_of_yojson (value_for_key (region_type_of_yojson) "Region") _list path;
    arn = option_of_yojson (value_for_key (arn_type_of_yojson) "Arn") _list path;
    
  }
  in _res

let multi_region_key_list_of_yojson = 
  fun tree path -> list_of_yojson multi_region_key_of_yojson tree path 

let multi_region_configuration_of_yojson = 
  fun tree path : multi_region_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : multi_region_configuration = {
    replica_keys = option_of_yojson (value_for_key (multi_region_key_list_of_yojson) "ReplicaKeys") _list path;
    primary_key = option_of_yojson (value_for_key (multi_region_key_of_yojson) "PrimaryKey") _list path;
    multi_region_key_type = option_of_yojson (value_for_key (multi_region_key_type_of_yojson) "MultiRegionKeyType") _list path;
    
  }
  in _res

let mac_algorithm_spec_list_of_yojson = 
  fun tree path -> list_of_yojson mac_algorithm_spec_of_yojson tree path 

let key_metadata_of_yojson = 
  fun tree path : key_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : key_metadata = {
    xks_key_configuration = option_of_yojson (value_for_key (xks_key_configuration_type_of_yojson) "XksKeyConfiguration") _list path;
    mac_algorithms = option_of_yojson (value_for_key (mac_algorithm_spec_list_of_yojson) "MacAlgorithms") _list path;
    pending_deletion_window_in_days = option_of_yojson (value_for_key (pending_window_in_days_type_of_yojson) "PendingDeletionWindowInDays") _list path;
    multi_region_configuration = option_of_yojson (value_for_key (multi_region_configuration_of_yojson) "MultiRegionConfiguration") _list path;
    multi_region = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "MultiRegion") _list path;
    key_agreement_algorithms = option_of_yojson (value_for_key (key_agreement_algorithm_spec_list_of_yojson) "KeyAgreementAlgorithms") _list path;
    signing_algorithms = option_of_yojson (value_for_key (signing_algorithm_spec_list_of_yojson) "SigningAlgorithms") _list path;
    encryption_algorithms = option_of_yojson (value_for_key (encryption_algorithm_spec_list_of_yojson) "EncryptionAlgorithms") _list path;
    key_spec = option_of_yojson (value_for_key (key_spec_of_yojson) "KeySpec") _list path;
    customer_master_key_spec = option_of_yojson (value_for_key (customer_master_key_spec_of_yojson) "CustomerMasterKeySpec") _list path;
    key_manager = option_of_yojson (value_for_key (key_manager_type_of_yojson) "KeyManager") _list path;
    expiration_model = option_of_yojson (value_for_key (expiration_model_type_of_yojson) "ExpirationModel") _list path;
    cloud_hsm_cluster_id = option_of_yojson (value_for_key (cloud_hsm_cluster_id_type_of_yojson) "CloudHsmClusterId") _list path;
    custom_key_store_id = option_of_yojson (value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId") _list path;
    origin = option_of_yojson (value_for_key (origin_type_of_yojson) "Origin") _list path;
    valid_to = option_of_yojson (value_for_key (date_type_of_yojson) "ValidTo") _list path;
    deletion_date = option_of_yojson (value_for_key (date_type_of_yojson) "DeletionDate") _list path;
    key_state = option_of_yojson (value_for_key (key_state_of_yojson) "KeyState") _list path;
    key_usage = option_of_yojson (value_for_key (key_usage_type_of_yojson) "KeyUsage") _list path;
    description = option_of_yojson (value_for_key (description_type_of_yojson) "Description") _list path;
    enabled = option_of_yojson (value_for_key (boolean_type_of_yojson) "Enabled") _list path;
    creation_date = option_of_yojson (value_for_key (date_type_of_yojson) "CreationDate") _list path;
    arn = option_of_yojson (value_for_key (arn_type_of_yojson) "Arn") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    aws_account_id = option_of_yojson (value_for_key (aws_account_id_type_of_yojson) "AWSAccountId") _list path;
    
  }
  in _res

let policy_type_of_yojson = string_of_yojson

let replicate_key_response_of_yojson = 
  fun tree path : replicate_key_response ->
  let _list = assoc_of_yojson tree path in
  let _res : replicate_key_response = {
    replica_tags = option_of_yojson (value_for_key (tag_list_of_yojson) "ReplicaTags") _list path;
    replica_policy = option_of_yojson (value_for_key (policy_type_of_yojson) "ReplicaPolicy") _list path;
    replica_key_metadata = option_of_yojson (value_for_key (key_metadata_of_yojson) "ReplicaKeyMetadata") _list path;
    
  }
  in _res

let replicate_key_request_of_yojson = 
  fun tree path : replicate_key_request ->
  let _list = assoc_of_yojson tree path in
  let _res : replicate_key_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    description = option_of_yojson (value_for_key (description_type_of_yojson) "Description") _list path;
    bypass_policy_lockout_safety_check = option_of_yojson (value_for_key (boolean_type_of_yojson) "BypassPolicyLockoutSafetyCheck") _list path;
    policy = option_of_yojson (value_for_key (policy_type_of_yojson) "Policy") _list path;
    replica_region = value_for_key (region_type_of_yojson) "ReplicaRegion" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let invalid_ciphertext_exception_of_yojson = 
  fun tree path : invalid_ciphertext_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_ciphertext_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let incorrect_key_exception_of_yojson = 
  fun tree path : incorrect_key_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : incorrect_key_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let re_encrypt_response_of_yojson = 
  fun tree path : re_encrypt_response ->
  let _list = assoc_of_yojson tree path in
  let _res : re_encrypt_response = {
    destination_encryption_algorithm = option_of_yojson (value_for_key (encryption_algorithm_spec_of_yojson) "DestinationEncryptionAlgorithm") _list path;
    source_encryption_algorithm = option_of_yojson (value_for_key (encryption_algorithm_spec_of_yojson) "SourceEncryptionAlgorithm") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    source_key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "SourceKeyId") _list path;
    ciphertext_blob = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "CiphertextBlob") _list path;
    
  }
  in _res

let encryption_context_value_of_yojson = string_of_yojson

let encryption_context_key_of_yojson = string_of_yojson

let encryption_context_type_of_yojson = 
  fun tree path -> map_of_yojson encryption_context_value_of_yojson tree path

let re_encrypt_request_of_yojson = 
  fun tree path : re_encrypt_request ->
  let _list = assoc_of_yojson tree path in
  let _res : re_encrypt_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    destination_encryption_algorithm = option_of_yojson (value_for_key (encryption_algorithm_spec_of_yojson) "DestinationEncryptionAlgorithm") _list path;
    source_encryption_algorithm = option_of_yojson (value_for_key (encryption_algorithm_spec_of_yojson) "SourceEncryptionAlgorithm") _list path;
    destination_encryption_context = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "DestinationEncryptionContext") _list path;
    destination_key_id = value_for_key (key_id_type_of_yojson) "DestinationKeyId" _list path;
    source_key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "SourceKeyId") _list path;
    source_encryption_context = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "SourceEncryptionContext") _list path;
    ciphertext_blob = value_for_key (ciphertext_type_of_yojson) "CiphertextBlob" _list path;
    
  }
  in _res

let policy_name_type_of_yojson = string_of_yojson

let put_key_policy_request_of_yojson = 
  fun tree path : put_key_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_key_policy_request = {
    bypass_policy_lockout_safety_check = option_of_yojson (value_for_key (boolean_type_of_yojson) "BypassPolicyLockoutSafetyCheck") _list path;
    policy = value_for_key (policy_type_of_yojson) "Policy" _list path;
    policy_name = option_of_yojson (value_for_key (policy_name_type_of_yojson) "PolicyName") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let invalid_marker_exception_of_yojson = 
  fun tree path : invalid_marker_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_marker_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let grant_name_type_of_yojson = string_of_yojson

let principal_id_type_of_yojson = string_of_yojson

let grant_operation_of_yojson = 
  fun (tree: t) path : grant_operation -> match tree with 
    | `String "DeriveSharedSecret" -> DeriveSharedSecret
    | `String "VerifyMac" -> VerifyMac
    | `String "GenerateMac" -> GenerateMac
    | `String "GenerateDataKeyPairWithoutPlaintext" -> GenerateDataKeyPairWithoutPlaintext
    | `String "GenerateDataKeyPair" -> GenerateDataKeyPair
    | `String "DescribeKey" -> DescribeKey
    | `String "RetireGrant" -> RetireGrant
    | `String "CreateGrant" -> CreateGrant
    | `String "GetPublicKey" -> GetPublicKey
    | `String "Verify" -> Verify
    | `String "Sign" -> Sign
    | `String "ReEncryptTo" -> ReEncryptTo
    | `String "ReEncryptFrom" -> ReEncryptFrom
    | `String "GenerateDataKeyWithoutPlaintext" -> GenerateDataKeyWithoutPlaintext
    | `String "GenerateDataKey" -> GenerateDataKey
    | `String "Encrypt" -> Encrypt
    | `String "Decrypt" -> Decrypt
    | `String value -> raise (deserialize_unknown_enum_value_error path "GrantOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "GrantOperation")

let grant_operation_list_of_yojson = 
  fun tree path -> list_of_yojson grant_operation_of_yojson tree path 

let grant_constraints_of_yojson = 
  fun tree path : grant_constraints ->
  let _list = assoc_of_yojson tree path in
  let _res : grant_constraints = {
    encryption_context_equals = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "EncryptionContextEquals") _list path;
    encryption_context_subset = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "EncryptionContextSubset") _list path;
    
  }
  in _res

let grant_list_entry_of_yojson = 
  fun tree path : grant_list_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : grant_list_entry = {
    constraints = option_of_yojson (value_for_key (grant_constraints_of_yojson) "Constraints") _list path;
    operations = option_of_yojson (value_for_key (grant_operation_list_of_yojson) "Operations") _list path;
    issuing_account = option_of_yojson (value_for_key (principal_id_type_of_yojson) "IssuingAccount") _list path;
    retiring_principal = option_of_yojson (value_for_key (principal_id_type_of_yojson) "RetiringPrincipal") _list path;
    grantee_principal = option_of_yojson (value_for_key (principal_id_type_of_yojson) "GranteePrincipal") _list path;
    creation_date = option_of_yojson (value_for_key (date_type_of_yojson) "CreationDate") _list path;
    name = option_of_yojson (value_for_key (grant_name_type_of_yojson) "Name") _list path;
    grant_id = option_of_yojson (value_for_key (grant_id_type_of_yojson) "GrantId") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let grant_list_of_yojson = 
  fun tree path -> list_of_yojson grant_list_entry_of_yojson tree path 

let marker_type_of_yojson = string_of_yojson

let list_grants_response_of_yojson = 
  fun tree path : list_grants_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_grants_response = {
    truncated = option_of_yojson (value_for_key (boolean_type_of_yojson) "Truncated") _list path;
    next_marker = option_of_yojson (value_for_key (marker_type_of_yojson) "NextMarker") _list path;
    grants = option_of_yojson (value_for_key (grant_list_of_yojson) "Grants") _list path;
    
  }
  in _res

let limit_type_of_yojson = int_of_yojson

let list_retirable_grants_request_of_yojson = 
  fun tree path : list_retirable_grants_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_retirable_grants_request = {
    retiring_principal = value_for_key (principal_id_type_of_yojson) "RetiringPrincipal" _list path;
    marker = option_of_yojson (value_for_key (marker_type_of_yojson) "Marker") _list path;
    limit = option_of_yojson (value_for_key (limit_type_of_yojson) "Limit") _list path;
    
  }
  in _res

let list_resource_tags_response_of_yojson = 
  fun tree path : list_resource_tags_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_tags_response = {
    truncated = option_of_yojson (value_for_key (boolean_type_of_yojson) "Truncated") _list path;
    next_marker = option_of_yojson (value_for_key (marker_type_of_yojson) "NextMarker") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_resource_tags_request_of_yojson = 
  fun tree path : list_resource_tags_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_tags_request = {
    marker = option_of_yojson (value_for_key (marker_type_of_yojson) "Marker") _list path;
    limit = option_of_yojson (value_for_key (limit_type_of_yojson) "Limit") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let key_list_entry_of_yojson = 
  fun tree path : key_list_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : key_list_entry = {
    key_arn = option_of_yojson (value_for_key (arn_type_of_yojson) "KeyArn") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let key_list_of_yojson = 
  fun tree path -> list_of_yojson key_list_entry_of_yojson tree path 

let list_keys_response_of_yojson = 
  fun tree path : list_keys_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_keys_response = {
    truncated = option_of_yojson (value_for_key (boolean_type_of_yojson) "Truncated") _list path;
    next_marker = option_of_yojson (value_for_key (marker_type_of_yojson) "NextMarker") _list path;
    keys = option_of_yojson (value_for_key (key_list_of_yojson) "Keys") _list path;
    
  }
  in _res

let list_keys_request_of_yojson = 
  fun tree path : list_keys_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_keys_request = {
    marker = option_of_yojson (value_for_key (marker_type_of_yojson) "Marker") _list path;
    limit = option_of_yojson (value_for_key (limit_type_of_yojson) "Limit") _list path;
    
  }
  in _res

let rotation_type_of_yojson = 
  fun (tree: t) path : rotation_type -> match tree with 
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "RotationType" value)
    | _ -> raise (deserialize_wrong_type_error path "RotationType")

let rotations_list_entry_of_yojson = 
  fun tree path : rotations_list_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : rotations_list_entry = {
    rotation_type = option_of_yojson (value_for_key (rotation_type_of_yojson) "RotationType") _list path;
    rotation_date = option_of_yojson (value_for_key (date_type_of_yojson) "RotationDate") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let rotations_list_of_yojson = 
  fun tree path -> list_of_yojson rotations_list_entry_of_yojson tree path 

let list_key_rotations_response_of_yojson = 
  fun tree path : list_key_rotations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_key_rotations_response = {
    truncated = option_of_yojson (value_for_key (boolean_type_of_yojson) "Truncated") _list path;
    next_marker = option_of_yojson (value_for_key (marker_type_of_yojson) "NextMarker") _list path;
    rotations = option_of_yojson (value_for_key (rotations_list_of_yojson) "Rotations") _list path;
    
  }
  in _res

let list_key_rotations_request_of_yojson = 
  fun tree path : list_key_rotations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_key_rotations_request = {
    marker = option_of_yojson (value_for_key (marker_type_of_yojson) "Marker") _list path;
    limit = option_of_yojson (value_for_key (limit_type_of_yojson) "Limit") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let policy_name_list_of_yojson = 
  fun tree path -> list_of_yojson policy_name_type_of_yojson tree path 

let list_key_policies_response_of_yojson = 
  fun tree path : list_key_policies_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_key_policies_response = {
    truncated = option_of_yojson (value_for_key (boolean_type_of_yojson) "Truncated") _list path;
    next_marker = option_of_yojson (value_for_key (marker_type_of_yojson) "NextMarker") _list path;
    policy_names = option_of_yojson (value_for_key (policy_name_list_of_yojson) "PolicyNames") _list path;
    
  }
  in _res

let list_key_policies_request_of_yojson = 
  fun tree path : list_key_policies_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_key_policies_request = {
    marker = option_of_yojson (value_for_key (marker_type_of_yojson) "Marker") _list path;
    limit = option_of_yojson (value_for_key (limit_type_of_yojson) "Limit") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let list_grants_request_of_yojson = 
  fun tree path : list_grants_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_grants_request = {
    grantee_principal = option_of_yojson (value_for_key (principal_id_type_of_yojson) "GranteePrincipal") _list path;
    grant_id = option_of_yojson (value_for_key (grant_id_type_of_yojson) "GrantId") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    marker = option_of_yojson (value_for_key (marker_type_of_yojson) "Marker") _list path;
    limit = option_of_yojson (value_for_key (limit_type_of_yojson) "Limit") _list path;
    
  }
  in _res

let alias_list_entry_of_yojson = 
  fun tree path : alias_list_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : alias_list_entry = {
    last_updated_date = option_of_yojson (value_for_key (date_type_of_yojson) "LastUpdatedDate") _list path;
    creation_date = option_of_yojson (value_for_key (date_type_of_yojson) "CreationDate") _list path;
    target_key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "TargetKeyId") _list path;
    alias_arn = option_of_yojson (value_for_key (arn_type_of_yojson) "AliasArn") _list path;
    alias_name = option_of_yojson (value_for_key (alias_name_type_of_yojson) "AliasName") _list path;
    
  }
  in _res

let alias_list_of_yojson = 
  fun tree path -> list_of_yojson alias_list_entry_of_yojson tree path 

let list_aliases_response_of_yojson = 
  fun tree path : list_aliases_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_aliases_response = {
    truncated = option_of_yojson (value_for_key (boolean_type_of_yojson) "Truncated") _list path;
    next_marker = option_of_yojson (value_for_key (marker_type_of_yojson) "NextMarker") _list path;
    aliases = option_of_yojson (value_for_key (alias_list_of_yojson) "Aliases") _list path;
    
  }
  in _res

let list_aliases_request_of_yojson = 
  fun tree path : list_aliases_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_aliases_request = {
    marker = option_of_yojson (value_for_key (marker_type_of_yojson) "Marker") _list path;
    limit = option_of_yojson (value_for_key (limit_type_of_yojson) "Limit") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let invalid_import_token_exception_of_yojson = 
  fun tree path : invalid_import_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_import_token_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let incorrect_key_material_exception_of_yojson = 
  fun tree path : incorrect_key_material_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : incorrect_key_material_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let expired_import_token_exception_of_yojson = 
  fun tree path : expired_import_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : expired_import_token_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let import_key_material_response_of_yojson = 
  fun tree path : import_key_material_response ->
  let _list = assoc_of_yojson tree path in
  let _res : import_key_material_response = ()
  in _res

let import_key_material_request_of_yojson = 
  fun tree path : import_key_material_request ->
  let _list = assoc_of_yojson tree path in
  let _res : import_key_material_request = {
    expiration_model = option_of_yojson (value_for_key (expiration_model_type_of_yojson) "ExpirationModel") _list path;
    valid_to = option_of_yojson (value_for_key (date_type_of_yojson) "ValidTo") _list path;
    encrypted_key_material = value_for_key (ciphertext_type_of_yojson) "EncryptedKeyMaterial" _list path;
    import_token = value_for_key (ciphertext_type_of_yojson) "ImportToken" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let public_key_type_of_yojson = blob_of_yojson

let get_public_key_response_of_yojson = 
  fun tree path : get_public_key_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_public_key_response = {
    key_agreement_algorithms = option_of_yojson (value_for_key (key_agreement_algorithm_spec_list_of_yojson) "KeyAgreementAlgorithms") _list path;
    signing_algorithms = option_of_yojson (value_for_key (signing_algorithm_spec_list_of_yojson) "SigningAlgorithms") _list path;
    encryption_algorithms = option_of_yojson (value_for_key (encryption_algorithm_spec_list_of_yojson) "EncryptionAlgorithms") _list path;
    key_usage = option_of_yojson (value_for_key (key_usage_type_of_yojson) "KeyUsage") _list path;
    key_spec = option_of_yojson (value_for_key (key_spec_of_yojson) "KeySpec") _list path;
    customer_master_key_spec = option_of_yojson (value_for_key (customer_master_key_spec_of_yojson) "CustomerMasterKeySpec") _list path;
    public_key = option_of_yojson (value_for_key (public_key_type_of_yojson) "PublicKey") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let get_public_key_request_of_yojson = 
  fun tree path : get_public_key_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_public_key_request = {
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let get_parameters_for_import_response_of_yojson = 
  fun tree path : get_parameters_for_import_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameters_for_import_response = {
    parameters_valid_to = option_of_yojson (value_for_key (date_type_of_yojson) "ParametersValidTo") _list path;
    public_key = option_of_yojson (value_for_key (plaintext_type_of_yojson) "PublicKey") _list path;
    import_token = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "ImportToken") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let algorithm_spec_of_yojson = 
  fun (tree: t) path : algorithm_spec -> match tree with 
    | `String "SM2PKE" -> SM2PKE
    | `String "RSA_AES_KEY_WRAP_SHA_256" -> RSA_AES_KEY_WRAP_SHA_256
    | `String "RSA_AES_KEY_WRAP_SHA_1" -> RSA_AES_KEY_WRAP_SHA_1
    | `String "RSAES_OAEP_SHA_256" -> RSAES_OAEP_SHA_256
    | `String "RSAES_OAEP_SHA_1" -> RSAES_OAEP_SHA_1
    | `String "RSAES_PKCS1_V1_5" -> RSAES_PKCS1_V1_5
    | `String value -> raise (deserialize_unknown_enum_value_error path "AlgorithmSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "AlgorithmSpec")

let get_parameters_for_import_request_of_yojson = 
  fun tree path : get_parameters_for_import_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameters_for_import_request = {
    wrapping_key_spec = value_for_key (wrapping_key_spec_of_yojson) "WrappingKeySpec" _list path;
    wrapping_algorithm = value_for_key (algorithm_spec_of_yojson) "WrappingAlgorithm" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let rotation_period_in_days_type_of_yojson = int_of_yojson

let get_key_rotation_status_response_of_yojson = 
  fun tree path : get_key_rotation_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_key_rotation_status_response = {
    on_demand_rotation_start_date = option_of_yojson (value_for_key (date_type_of_yojson) "OnDemandRotationStartDate") _list path;
    next_rotation_date = option_of_yojson (value_for_key (date_type_of_yojson) "NextRotationDate") _list path;
    rotation_period_in_days = option_of_yojson (value_for_key (rotation_period_in_days_type_of_yojson) "RotationPeriodInDays") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    key_rotation_enabled = option_of_yojson (value_for_key (boolean_type_of_yojson) "KeyRotationEnabled") _list path;
    
  }
  in _res

let get_key_rotation_status_request_of_yojson = 
  fun tree path : get_key_rotation_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_key_rotation_status_request = {
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let get_key_policy_response_of_yojson = 
  fun tree path : get_key_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_key_policy_response = {
    policy_name = option_of_yojson (value_for_key (policy_name_type_of_yojson) "PolicyName") _list path;
    policy = option_of_yojson (value_for_key (policy_type_of_yojson) "Policy") _list path;
    
  }
  in _res

let get_key_policy_request_of_yojson = 
  fun tree path : get_key_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_key_policy_request = {
    policy_name = option_of_yojson (value_for_key (policy_name_type_of_yojson) "PolicyName") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let generate_random_response_of_yojson = 
  fun tree path : generate_random_response ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_random_response = {
    ciphertext_for_recipient = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "CiphertextForRecipient") _list path;
    plaintext = option_of_yojson (value_for_key (plaintext_type_of_yojson) "Plaintext") _list path;
    
  }
  in _res

let number_of_bytes_type_of_yojson = int_of_yojson

let key_encryption_mechanism_of_yojson = 
  fun (tree: t) path : key_encryption_mechanism -> match tree with 
    | `String "RSAES_OAEP_SHA_256" -> RSAES_OAEP_SHA_256
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyEncryptionMechanism" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyEncryptionMechanism")

let attestation_document_type_of_yojson = blob_of_yojson

let recipient_info_of_yojson = 
  fun tree path : recipient_info ->
  let _list = assoc_of_yojson tree path in
  let _res : recipient_info = {
    attestation_document = option_of_yojson (value_for_key (attestation_document_type_of_yojson) "AttestationDocument") _list path;
    key_encryption_algorithm = option_of_yojson (value_for_key (key_encryption_mechanism_of_yojson) "KeyEncryptionAlgorithm") _list path;
    
  }
  in _res

let generate_random_request_of_yojson = 
  fun tree path : generate_random_request ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_random_request = {
    recipient = option_of_yojson (value_for_key (recipient_info_of_yojson) "Recipient") _list path;
    custom_key_store_id = option_of_yojson (value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId") _list path;
    number_of_bytes = option_of_yojson (value_for_key (number_of_bytes_type_of_yojson) "NumberOfBytes") _list path;
    
  }
  in _res

let generate_mac_response_of_yojson = 
  fun tree path : generate_mac_response ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_mac_response = {
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    mac_algorithm = option_of_yojson (value_for_key (mac_algorithm_spec_of_yojson) "MacAlgorithm") _list path;
    mac = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "Mac") _list path;
    
  }
  in _res

let generate_mac_request_of_yojson = 
  fun tree path : generate_mac_request ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_mac_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    mac_algorithm = value_for_key (mac_algorithm_spec_of_yojson) "MacAlgorithm" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    message = value_for_key (plaintext_type_of_yojson) "Message" _list path;
    
  }
  in _res

let generate_data_key_without_plaintext_response_of_yojson = 
  fun tree path : generate_data_key_without_plaintext_response ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_data_key_without_plaintext_response = {
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    ciphertext_blob = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "CiphertextBlob") _list path;
    
  }
  in _res

let data_key_spec_of_yojson = 
  fun (tree: t) path : data_key_spec -> match tree with 
    | `String "AES_128" -> AES_128
    | `String "AES_256" -> AES_256
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataKeySpec" value)
    | _ -> raise (deserialize_wrong_type_error path "DataKeySpec")

let generate_data_key_without_plaintext_request_of_yojson = 
  fun tree path : generate_data_key_without_plaintext_request ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_data_key_without_plaintext_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    number_of_bytes = option_of_yojson (value_for_key (number_of_bytes_type_of_yojson) "NumberOfBytes") _list path;
    key_spec = option_of_yojson (value_for_key (data_key_spec_of_yojson) "KeySpec") _list path;
    encryption_context = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "EncryptionContext") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let data_key_pair_spec_of_yojson = 
  fun (tree: t) path : data_key_pair_spec -> match tree with 
    | `String "SM2" -> SM2
    | `String "ECC_SECG_P256K1" -> ECC_SECG_P256K1
    | `String "ECC_NIST_P521" -> ECC_NIST_P521
    | `String "ECC_NIST_P384" -> ECC_NIST_P384
    | `String "ECC_NIST_P256" -> ECC_NIST_P256
    | `String "RSA_4096" -> RSA_4096
    | `String "RSA_3072" -> RSA_3072
    | `String "RSA_2048" -> RSA_2048
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataKeyPairSpec" value)
    | _ -> raise (deserialize_wrong_type_error path "DataKeyPairSpec")

let generate_data_key_pair_without_plaintext_response_of_yojson = 
  fun tree path : generate_data_key_pair_without_plaintext_response ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_data_key_pair_without_plaintext_response = {
    key_pair_spec = option_of_yojson (value_for_key (data_key_pair_spec_of_yojson) "KeyPairSpec") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    public_key = option_of_yojson (value_for_key (public_key_type_of_yojson) "PublicKey") _list path;
    private_key_ciphertext_blob = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "PrivateKeyCiphertextBlob") _list path;
    
  }
  in _res

let generate_data_key_pair_without_plaintext_request_of_yojson = 
  fun tree path : generate_data_key_pair_without_plaintext_request ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_data_key_pair_without_plaintext_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    key_pair_spec = value_for_key (data_key_pair_spec_of_yojson) "KeyPairSpec" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    encryption_context = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "EncryptionContext") _list path;
    
  }
  in _res

let generate_data_key_pair_response_of_yojson = 
  fun tree path : generate_data_key_pair_response ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_data_key_pair_response = {
    ciphertext_for_recipient = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "CiphertextForRecipient") _list path;
    key_pair_spec = option_of_yojson (value_for_key (data_key_pair_spec_of_yojson) "KeyPairSpec") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    public_key = option_of_yojson (value_for_key (public_key_type_of_yojson) "PublicKey") _list path;
    private_key_plaintext = option_of_yojson (value_for_key (plaintext_type_of_yojson) "PrivateKeyPlaintext") _list path;
    private_key_ciphertext_blob = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "PrivateKeyCiphertextBlob") _list path;
    
  }
  in _res

let generate_data_key_pair_request_of_yojson = 
  fun tree path : generate_data_key_pair_request ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_data_key_pair_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    recipient = option_of_yojson (value_for_key (recipient_info_of_yojson) "Recipient") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    key_pair_spec = value_for_key (data_key_pair_spec_of_yojson) "KeyPairSpec" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    encryption_context = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "EncryptionContext") _list path;
    
  }
  in _res

let generate_data_key_response_of_yojson = 
  fun tree path : generate_data_key_response ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_data_key_response = {
    ciphertext_for_recipient = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "CiphertextForRecipient") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    plaintext = option_of_yojson (value_for_key (plaintext_type_of_yojson) "Plaintext") _list path;
    ciphertext_blob = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "CiphertextBlob") _list path;
    
  }
  in _res

let generate_data_key_request_of_yojson = 
  fun tree path : generate_data_key_request ->
  let _list = assoc_of_yojson tree path in
  let _res : generate_data_key_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    recipient = option_of_yojson (value_for_key (recipient_info_of_yojson) "Recipient") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    key_spec = option_of_yojson (value_for_key (data_key_spec_of_yojson) "KeySpec") _list path;
    number_of_bytes = option_of_yojson (value_for_key (number_of_bytes_type_of_yojson) "NumberOfBytes") _list path;
    encryption_context = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "EncryptionContext") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let encrypt_response_of_yojson = 
  fun tree path : encrypt_response ->
  let _list = assoc_of_yojson tree path in
  let _res : encrypt_response = {
    encryption_algorithm = option_of_yojson (value_for_key (encryption_algorithm_spec_of_yojson) "EncryptionAlgorithm") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    ciphertext_blob = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "CiphertextBlob") _list path;
    
  }
  in _res

let encrypt_request_of_yojson = 
  fun tree path : encrypt_request ->
  let _list = assoc_of_yojson tree path in
  let _res : encrypt_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    encryption_algorithm = option_of_yojson (value_for_key (encryption_algorithm_spec_of_yojson) "EncryptionAlgorithm") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    encryption_context = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "EncryptionContext") _list path;
    plaintext = value_for_key (plaintext_type_of_yojson) "Plaintext" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let enable_key_rotation_request_of_yojson = 
  fun tree path : enable_key_rotation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_key_rotation_request = {
    rotation_period_in_days = option_of_yojson (value_for_key (rotation_period_in_days_type_of_yojson) "RotationPeriodInDays") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let enable_key_request_of_yojson = 
  fun tree path : enable_key_request ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_key_request = {
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let disconnect_custom_key_store_response_of_yojson = 
  fun tree path : disconnect_custom_key_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : disconnect_custom_key_store_response = ()
  in _res

let disconnect_custom_key_store_request_of_yojson = 
  fun tree path : disconnect_custom_key_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disconnect_custom_key_store_request = {
    custom_key_store_id = value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId" _list path;
    
  }
  in _res

let disable_key_rotation_request_of_yojson = 
  fun tree path : disable_key_rotation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_key_rotation_request = {
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let disable_key_request_of_yojson = 
  fun tree path : disable_key_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_key_request = {
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let describe_key_response_of_yojson = 
  fun tree path : describe_key_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_key_response = {
    key_metadata = option_of_yojson (value_for_key (key_metadata_of_yojson) "KeyMetadata") _list path;
    
  }
  in _res

let describe_key_request_of_yojson = 
  fun tree path : describe_key_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_key_request = {
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let connection_state_type_of_yojson = 
  fun (tree: t) path : connection_state_type -> match tree with 
    | `String "DISCONNECTING" -> DISCONNECTING
    | `String "DISCONNECTED" -> DISCONNECTED
    | `String "FAILED" -> FAILED
    | `String "CONNECTING" -> CONNECTING
    | `String "CONNECTED" -> CONNECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionStateType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionStateType")

let connection_error_code_type_of_yojson = 
  fun (tree: t) path : connection_error_code_type -> match tree with 
    | `String "XKS_PROXY_INVALID_TLS_CONFIGURATION" -> XKS_PROXY_INVALID_TLS_CONFIGURATION
    | `String "XKS_PROXY_TIMED_OUT" -> XKS_PROXY_TIMED_OUT
    | `String "XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION" -> XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION
    | `String "XKS_PROXY_INVALID_CONFIGURATION" -> XKS_PROXY_INVALID_CONFIGURATION
    | `String "XKS_PROXY_INVALID_RESPONSE" -> XKS_PROXY_INVALID_RESPONSE
    | `String "XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND" -> XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND
    | `String "XKS_PROXY_NOT_REACHABLE" -> XKS_PROXY_NOT_REACHABLE
    | `String "XKS_PROXY_ACCESS_DENIED" -> XKS_PROXY_ACCESS_DENIED
    | `String "INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET" -> INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET
    | `String "SUBNET_NOT_FOUND" -> SUBNET_NOT_FOUND
    | `String "USER_LOGGED_IN" -> USER_LOGGED_IN
    | `String "USER_NOT_FOUND" -> USER_NOT_FOUND
    | `String "USER_LOCKED_OUT" -> USER_LOCKED_OUT
    | `String "INSUFFICIENT_CLOUDHSM_HSMS" -> INSUFFICIENT_CLOUDHSM_HSMS
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String "NETWORK_ERRORS" -> NETWORK_ERRORS
    | `String "CLUSTER_NOT_FOUND" -> CLUSTER_NOT_FOUND
    | `String "INVALID_CREDENTIALS" -> INVALID_CREDENTIALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionErrorCodeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionErrorCodeType")

let custom_key_store_type_of_yojson = 
  fun (tree: t) path : custom_key_store_type -> match tree with 
    | `String "EXTERNAL_KEY_STORE" -> EXTERNAL_KEY_STORE
    | `String "AWS_CLOUDHSM" -> AWS_CLOUDHSM
    | `String value -> raise (deserialize_unknown_enum_value_error path "CustomKeyStoreType" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomKeyStoreType")

let custom_key_stores_list_entry_of_yojson = 
  fun tree path : custom_key_stores_list_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_key_stores_list_entry = {
    xks_proxy_configuration = option_of_yojson (value_for_key (xks_proxy_configuration_type_of_yojson) "XksProxyConfiguration") _list path;
    custom_key_store_type = option_of_yojson (value_for_key (custom_key_store_type_of_yojson) "CustomKeyStoreType") _list path;
    creation_date = option_of_yojson (value_for_key (date_type_of_yojson) "CreationDate") _list path;
    connection_error_code = option_of_yojson (value_for_key (connection_error_code_type_of_yojson) "ConnectionErrorCode") _list path;
    connection_state = option_of_yojson (value_for_key (connection_state_type_of_yojson) "ConnectionState") _list path;
    trust_anchor_certificate = option_of_yojson (value_for_key (trust_anchor_certificate_type_of_yojson) "TrustAnchorCertificate") _list path;
    cloud_hsm_cluster_id = option_of_yojson (value_for_key (cloud_hsm_cluster_id_type_of_yojson) "CloudHsmClusterId") _list path;
    custom_key_store_name = option_of_yojson (value_for_key (custom_key_store_name_type_of_yojson) "CustomKeyStoreName") _list path;
    custom_key_store_id = option_of_yojson (value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId") _list path;
    
  }
  in _res

let custom_key_stores_list_of_yojson = 
  fun tree path -> list_of_yojson custom_key_stores_list_entry_of_yojson tree path 

let describe_custom_key_stores_response_of_yojson = 
  fun tree path : describe_custom_key_stores_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_custom_key_stores_response = {
    truncated = option_of_yojson (value_for_key (boolean_type_of_yojson) "Truncated") _list path;
    next_marker = option_of_yojson (value_for_key (marker_type_of_yojson) "NextMarker") _list path;
    custom_key_stores = option_of_yojson (value_for_key (custom_key_stores_list_of_yojson) "CustomKeyStores") _list path;
    
  }
  in _res

let describe_custom_key_stores_request_of_yojson = 
  fun tree path : describe_custom_key_stores_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_custom_key_stores_request = {
    marker = option_of_yojson (value_for_key (marker_type_of_yojson) "Marker") _list path;
    limit = option_of_yojson (value_for_key (limit_type_of_yojson) "Limit") _list path;
    custom_key_store_name = option_of_yojson (value_for_key (custom_key_store_name_type_of_yojson) "CustomKeyStoreName") _list path;
    custom_key_store_id = option_of_yojson (value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId") _list path;
    
  }
  in _res

let derive_shared_secret_response_of_yojson = 
  fun tree path : derive_shared_secret_response ->
  let _list = assoc_of_yojson tree path in
  let _res : derive_shared_secret_response = {
    key_origin = option_of_yojson (value_for_key (origin_type_of_yojson) "KeyOrigin") _list path;
    key_agreement_algorithm = option_of_yojson (value_for_key (key_agreement_algorithm_spec_of_yojson) "KeyAgreementAlgorithm") _list path;
    ciphertext_for_recipient = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "CiphertextForRecipient") _list path;
    shared_secret = option_of_yojson (value_for_key (plaintext_type_of_yojson) "SharedSecret") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let derive_shared_secret_request_of_yojson = 
  fun tree path : derive_shared_secret_request ->
  let _list = assoc_of_yojson tree path in
  let _res : derive_shared_secret_request = {
    recipient = option_of_yojson (value_for_key (recipient_info_of_yojson) "Recipient") _list path;
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    public_key = value_for_key (public_key_type_of_yojson) "PublicKey" _list path;
    key_agreement_algorithm = value_for_key (key_agreement_algorithm_spec_of_yojson) "KeyAgreementAlgorithm" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let delete_imported_key_material_request_of_yojson = 
  fun tree path : delete_imported_key_material_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_imported_key_material_request = {
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let custom_key_store_has_cm_ks_exception_of_yojson = 
  fun tree path : custom_key_store_has_cm_ks_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_key_store_has_cm_ks_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let delete_custom_key_store_response_of_yojson = 
  fun tree path : delete_custom_key_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_custom_key_store_response = ()
  in _res

let delete_custom_key_store_request_of_yojson = 
  fun tree path : delete_custom_key_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_custom_key_store_request = {
    custom_key_store_id = value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId" _list path;
    
  }
  in _res

let delete_alias_request_of_yojson = 
  fun tree path : delete_alias_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_alias_request = {
    alias_name = value_for_key (alias_name_type_of_yojson) "AliasName" _list path;
    
  }
  in _res

let decrypt_response_of_yojson = 
  fun tree path : decrypt_response ->
  let _list = assoc_of_yojson tree path in
  let _res : decrypt_response = {
    ciphertext_for_recipient = option_of_yojson (value_for_key (ciphertext_type_of_yojson) "CiphertextForRecipient") _list path;
    encryption_algorithm = option_of_yojson (value_for_key (encryption_algorithm_spec_of_yojson) "EncryptionAlgorithm") _list path;
    plaintext = option_of_yojson (value_for_key (plaintext_type_of_yojson) "Plaintext") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let decrypt_request_of_yojson = 
  fun tree path : decrypt_request ->
  let _list = assoc_of_yojson tree path in
  let _res : decrypt_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    recipient = option_of_yojson (value_for_key (recipient_info_of_yojson) "Recipient") _list path;
    encryption_algorithm = option_of_yojson (value_for_key (encryption_algorithm_spec_of_yojson) "EncryptionAlgorithm") _list path;
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    encryption_context = option_of_yojson (value_for_key (encryption_context_type_of_yojson) "EncryptionContext") _list path;
    ciphertext_blob = value_for_key (ciphertext_type_of_yojson) "CiphertextBlob" _list path;
    
  }
  in _res

let create_key_response_of_yojson = 
  fun tree path : create_key_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_key_response = {
    key_metadata = option_of_yojson (value_for_key (key_metadata_of_yojson) "KeyMetadata") _list path;
    
  }
  in _res

let create_key_request_of_yojson = 
  fun tree path : create_key_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_key_request = {
    xks_key_id = option_of_yojson (value_for_key (xks_key_id_type_of_yojson) "XksKeyId") _list path;
    multi_region = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "MultiRegion") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    bypass_policy_lockout_safety_check = option_of_yojson (value_for_key (boolean_type_of_yojson) "BypassPolicyLockoutSafetyCheck") _list path;
    custom_key_store_id = option_of_yojson (value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId") _list path;
    origin = option_of_yojson (value_for_key (origin_type_of_yojson) "Origin") _list path;
    key_spec = option_of_yojson (value_for_key (key_spec_of_yojson) "KeySpec") _list path;
    customer_master_key_spec = option_of_yojson (value_for_key (customer_master_key_spec_of_yojson) "CustomerMasterKeySpec") _list path;
    key_usage = option_of_yojson (value_for_key (key_usage_type_of_yojson) "KeyUsage") _list path;
    description = option_of_yojson (value_for_key (description_type_of_yojson) "Description") _list path;
    policy = option_of_yojson (value_for_key (policy_type_of_yojson) "Policy") _list path;
    
  }
  in _res

let create_grant_response_of_yojson = 
  fun tree path : create_grant_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_grant_response = {
    grant_id = option_of_yojson (value_for_key (grant_id_type_of_yojson) "GrantId") _list path;
    grant_token = option_of_yojson (value_for_key (grant_token_type_of_yojson) "GrantToken") _list path;
    
  }
  in _res

let create_grant_request_of_yojson = 
  fun tree path : create_grant_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_grant_request = {
    dry_run = option_of_yojson (value_for_key (nullable_boolean_type_of_yojson) "DryRun") _list path;
    name = option_of_yojson (value_for_key (grant_name_type_of_yojson) "Name") _list path;
    grant_tokens = option_of_yojson (value_for_key (grant_token_list_of_yojson) "GrantTokens") _list path;
    constraints = option_of_yojson (value_for_key (grant_constraints_of_yojson) "Constraints") _list path;
    operations = value_for_key (grant_operation_list_of_yojson) "Operations" _list path;
    retiring_principal = option_of_yojson (value_for_key (principal_id_type_of_yojson) "RetiringPrincipal") _list path;
    grantee_principal = value_for_key (principal_id_type_of_yojson) "GranteePrincipal" _list path;
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let incorrect_trust_anchor_exception_of_yojson = 
  fun tree path : incorrect_trust_anchor_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : incorrect_trust_anchor_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let cloud_hsm_cluster_in_use_exception_of_yojson = 
  fun tree path : cloud_hsm_cluster_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_hsm_cluster_in_use_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let create_custom_key_store_response_of_yojson = 
  fun tree path : create_custom_key_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_custom_key_store_response = {
    custom_key_store_id = option_of_yojson (value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId") _list path;
    
  }
  in _res

let create_custom_key_store_request_of_yojson = 
  fun tree path : create_custom_key_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_custom_key_store_request = {
    xks_proxy_connectivity = option_of_yojson (value_for_key (xks_proxy_connectivity_type_of_yojson) "XksProxyConnectivity") _list path;
    xks_proxy_authentication_credential = option_of_yojson (value_for_key (xks_proxy_authentication_credential_type_of_yojson) "XksProxyAuthenticationCredential") _list path;
    xks_proxy_vpc_endpoint_service_name = option_of_yojson (value_for_key (xks_proxy_vpc_endpoint_service_name_type_of_yojson) "XksProxyVpcEndpointServiceName") _list path;
    xks_proxy_uri_path = option_of_yojson (value_for_key (xks_proxy_uri_path_type_of_yojson) "XksProxyUriPath") _list path;
    xks_proxy_uri_endpoint = option_of_yojson (value_for_key (xks_proxy_uri_endpoint_type_of_yojson) "XksProxyUriEndpoint") _list path;
    custom_key_store_type = option_of_yojson (value_for_key (custom_key_store_type_of_yojson) "CustomKeyStoreType") _list path;
    key_store_password = option_of_yojson (value_for_key (key_store_password_type_of_yojson) "KeyStorePassword") _list path;
    trust_anchor_certificate = option_of_yojson (value_for_key (trust_anchor_certificate_type_of_yojson) "TrustAnchorCertificate") _list path;
    cloud_hsm_cluster_id = option_of_yojson (value_for_key (cloud_hsm_cluster_id_type_of_yojson) "CloudHsmClusterId") _list path;
    custom_key_store_name = value_for_key (custom_key_store_name_type_of_yojson) "CustomKeyStoreName" _list path;
    
  }
  in _res

let invalid_alias_name_exception_of_yojson = 
  fun tree path : invalid_alias_name_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_alias_name_exception = {
    message = option_of_yojson (value_for_key (error_message_type_of_yojson) "message") _list path;
    
  }
  in _res

let create_alias_request_of_yojson = 
  fun tree path : create_alias_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_alias_request = {
    target_key_id = value_for_key (key_id_type_of_yojson) "TargetKeyId" _list path;
    alias_name = value_for_key (alias_name_type_of_yojson) "AliasName" _list path;
    
  }
  in _res

let connect_custom_key_store_response_of_yojson = 
  fun tree path : connect_custom_key_store_response ->
  let _list = assoc_of_yojson tree path in
  let _res : connect_custom_key_store_response = ()
  in _res

let connect_custom_key_store_request_of_yojson = 
  fun tree path : connect_custom_key_store_request ->
  let _list = assoc_of_yojson tree path in
  let _res : connect_custom_key_store_request = {
    custom_key_store_id = value_for_key (custom_key_store_id_type_of_yojson) "CustomKeyStoreId" _list path;
    
  }
  in _res

let cancel_key_deletion_response_of_yojson = 
  fun tree path : cancel_key_deletion_response ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_key_deletion_response = {
    key_id = option_of_yojson (value_for_key (key_id_type_of_yojson) "KeyId") _list path;
    
  }
  in _res

let cancel_key_deletion_request_of_yojson = 
  fun tree path : cancel_key_deletion_request ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_key_deletion_request = {
    key_id = value_for_key (key_id_type_of_yojson) "KeyId" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

