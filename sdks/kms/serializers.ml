open Smaws_Lib.Json.SerializeHelpers

open Types

let error_message_type_to_yojson = string_to_yojson

let xks_proxy_vpc_endpoint_service_not_found_exception_to_yojson = 
  fun (x: xks_proxy_vpc_endpoint_service_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_proxy_vpc_endpoint_service_name_type_to_yojson = string_to_yojson

let xks_proxy_vpc_endpoint_service_invalid_configuration_exception_to_yojson
= 
  fun (x: xks_proxy_vpc_endpoint_service_invalid_configuration_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_proxy_vpc_endpoint_service_in_use_exception_to_yojson = 
  fun (x: xks_proxy_vpc_endpoint_service_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_proxy_uri_unreachable_exception_to_yojson = 
  fun (x: xks_proxy_uri_unreachable_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_proxy_uri_path_type_to_yojson = string_to_yojson

let xks_proxy_uri_in_use_exception_to_yojson = 
  fun (x: xks_proxy_uri_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_proxy_uri_endpoint_type_to_yojson = string_to_yojson

let xks_proxy_uri_endpoint_in_use_exception_to_yojson = 
  fun (x: xks_proxy_uri_endpoint_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_proxy_invalid_response_exception_to_yojson = 
  fun (x: xks_proxy_invalid_response_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_proxy_invalid_configuration_exception_to_yojson = 
  fun (x: xks_proxy_invalid_configuration_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_proxy_incorrect_authentication_credential_exception_to_yojson = 
  fun (x: xks_proxy_incorrect_authentication_credential_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let xks_proxy_connectivity_type_to_yojson = 
  fun (x: xks_proxy_connectivity_type) -> match x with 
 
| VPC_ENDPOINT_SERVICE -> `String "VPC_ENDPOINT_SERVICE"
  | PUBLIC_ENDPOINT -> `String "PUBLIC_ENDPOINT"
   

let xks_proxy_authentication_access_key_id_type_to_yojson = 
  string_to_yojson

let xks_proxy_configuration_type_to_yojson = 
  fun (x: xks_proxy_configuration_type) -> assoc_to_yojson(
    [(
         "VpcEndpointServiceName",
         (option_to_yojson xks_proxy_vpc_endpoint_service_name_type_to_yojson x.vpc_endpoint_service_name));
       (
         "UriPath",
         (option_to_yojson xks_proxy_uri_path_type_to_yojson x.uri_path));
       (
         "UriEndpoint",
         (option_to_yojson xks_proxy_uri_endpoint_type_to_yojson x.uri_endpoint));
       (
         "AccessKeyId",
         (option_to_yojson xks_proxy_authentication_access_key_id_type_to_yojson x.access_key_id));
       (
         "Connectivity",
         (option_to_yojson xks_proxy_connectivity_type_to_yojson x.connectivity));
       
  ])

let xks_proxy_authentication_raw_secret_access_key_type_to_yojson = 
  string_to_yojson

let xks_proxy_authentication_credential_type_to_yojson = 
  fun (x: xks_proxy_authentication_credential_type) -> assoc_to_yojson(
    [(
         "RawSecretAccessKey",
         (Some (xks_proxy_authentication_raw_secret_access_key_type_to_yojson x.raw_secret_access_key)));
       (
         "AccessKeyId",
         (Some (xks_proxy_authentication_access_key_id_type_to_yojson x.access_key_id)));
       
  ])

let xks_key_not_found_exception_to_yojson = 
  fun (x: xks_key_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_key_invalid_configuration_exception_to_yojson = 
  fun (x: xks_key_invalid_configuration_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let xks_key_id_type_to_yojson = string_to_yojson

let xks_key_configuration_type_to_yojson = 
  fun (x: xks_key_configuration_type) -> assoc_to_yojson(
    [(
         "Id",
         (option_to_yojson xks_key_id_type_to_yojson x.id));
       
  ])

let xks_key_already_in_use_exception_to_yojson = 
  fun (x: xks_key_already_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let wrapping_key_spec_to_yojson = 
  fun (x: wrapping_key_spec) -> match x with 
 
| SM2 -> `String "SM2"
  | RSA_4096 -> `String "RSA_4096"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_2048 -> `String "RSA_2048"
   

let key_id_type_to_yojson = string_to_yojson

let boolean_type_to_yojson = bool_to_yojson

let signing_algorithm_spec_to_yojson = 
  fun (x: signing_algorithm_spec) -> match x with 
 
| SM2DSA -> `String "SM2DSA"
  | ECDSA_SHA_512 -> `String "ECDSA_SHA_512"
  | ECDSA_SHA_384 -> `String "ECDSA_SHA_384"
  | ECDSA_SHA_256 -> `String "ECDSA_SHA_256"
  | RSASSA_PKCS1_V1_5_SHA_512 -> `String "RSASSA_PKCS1_V1_5_SHA_512"
  | RSASSA_PKCS1_V1_5_SHA_384 -> `String "RSASSA_PKCS1_V1_5_SHA_384"
  | RSASSA_PKCS1_V1_5_SHA_256 -> `String "RSASSA_PKCS1_V1_5_SHA_256"
  | RSASSA_PSS_SHA_512 -> `String "RSASSA_PSS_SHA_512"
  | RSASSA_PSS_SHA_384 -> `String "RSASSA_PSS_SHA_384"
  | RSASSA_PSS_SHA_256 -> `String "RSASSA_PSS_SHA_256"
   

let verify_response_to_yojson = 
  fun (x: verify_response) -> assoc_to_yojson(
    [(
         "SigningAlgorithm",
         (option_to_yojson signing_algorithm_spec_to_yojson x.signing_algorithm));
       (
         "SignatureValid",
         (option_to_yojson boolean_type_to_yojson x.signature_valid));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let plaintext_type_to_yojson = blob_to_yojson

let message_type_to_yojson = 
  fun (x: message_type) -> match x with 
  | DIGEST -> `String "DIGEST"
    | RAW -> `String "RAW"
     

let ciphertext_type_to_yojson = blob_to_yojson

let grant_token_type_to_yojson = string_to_yojson

let grant_token_list_to_yojson = 
  fun tree -> list_to_yojson grant_token_type_to_yojson tree

let nullable_boolean_type_to_yojson = bool_to_yojson

let verify_request_to_yojson = 
  fun (x: verify_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "SigningAlgorithm",
         (Some (signing_algorithm_spec_to_yojson x.signing_algorithm)));
       (
         "Signature",
         (Some (ciphertext_type_to_yojson x.signature)));
       (
         "MessageType",
         (option_to_yojson message_type_to_yojson x.message_type));
       (
         "Message",
         (Some (plaintext_type_to_yojson x.message)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let mac_algorithm_spec_to_yojson = 
  fun (x: mac_algorithm_spec) -> match x with 
 
| HMAC_SHA_512 -> `String "HMAC_SHA_512"
  | HMAC_SHA_384 -> `String "HMAC_SHA_384"
  | HMAC_SHA_256 -> `String "HMAC_SHA_256"
  | HMAC_SHA_224 -> `String "HMAC_SHA_224"
   

let verify_mac_response_to_yojson = 
  fun (x: verify_mac_response) -> assoc_to_yojson(
    [(
         "MacAlgorithm",
         (option_to_yojson mac_algorithm_spec_to_yojson x.mac_algorithm));
       (
         "MacValid",
         (option_to_yojson boolean_type_to_yojson x.mac_valid));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let verify_mac_request_to_yojson = 
  fun (x: verify_mac_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "Mac",
         (Some (ciphertext_type_to_yojson x.mac)));
       (
         "MacAlgorithm",
         (Some (mac_algorithm_spec_to_yojson x.mac_algorithm)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       (
         "Message",
         (Some (plaintext_type_to_yojson x.message)));
       
  ])

let not_found_exception_to_yojson = 
  fun (x: not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let kms_invalid_state_exception_to_yojson = 
  fun (x: kms_invalid_state_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let kms_invalid_mac_exception_to_yojson = 
  fun (x: kms_invalid_mac_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let kms_internal_exception_to_yojson = 
  fun (x: kms_internal_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let key_unavailable_exception_to_yojson = 
  fun (x: key_unavailable_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let invalid_key_usage_exception_to_yojson = 
  fun (x: invalid_key_usage_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let invalid_grant_token_exception_to_yojson = 
  fun (x: invalid_grant_token_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let dry_run_operation_exception_to_yojson = 
  fun (x: dry_run_operation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let disabled_exception_to_yojson = 
  fun (x: disabled_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let kms_invalid_signature_exception_to_yojson = 
  fun (x: kms_invalid_signature_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let dependency_timeout_exception_to_yojson = 
  fun (x: dependency_timeout_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let region_type_to_yojson = string_to_yojson

let update_primary_region_request_to_yojson = 
  fun (x: update_primary_region_request) -> assoc_to_yojson(
    [(
         "PrimaryRegion",
         (Some (region_type_to_yojson x.primary_region)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let unsupported_operation_exception_to_yojson = 
  fun (x: unsupported_operation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let invalid_arn_exception_to_yojson = 
  fun (x: invalid_arn_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let description_type_to_yojson = string_to_yojson

let update_key_description_request_to_yojson = 
  fun (x: update_key_description_request) -> assoc_to_yojson(
    [(
         "Description",
         (Some (description_type_to_yojson x.description)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let update_custom_key_store_response_to_yojson = 
  fun (x: update_custom_key_store_response) -> assoc_to_yojson(
    [
  ])

let custom_key_store_id_type_to_yojson = string_to_yojson

let custom_key_store_name_type_to_yojson = string_to_yojson

let key_store_password_type_to_yojson = string_to_yojson

let cloud_hsm_cluster_id_type_to_yojson = string_to_yojson

let update_custom_key_store_request_to_yojson = 
  fun (x: update_custom_key_store_request) -> assoc_to_yojson(
    [(
         "XksProxyConnectivity",
         (option_to_yojson xks_proxy_connectivity_type_to_yojson x.xks_proxy_connectivity));
       (
         "XksProxyAuthenticationCredential",
         (option_to_yojson xks_proxy_authentication_credential_type_to_yojson x.xks_proxy_authentication_credential));
       (
         "XksProxyVpcEndpointServiceName",
         (option_to_yojson xks_proxy_vpc_endpoint_service_name_type_to_yojson x.xks_proxy_vpc_endpoint_service_name));
       (
         "XksProxyUriPath",
         (option_to_yojson xks_proxy_uri_path_type_to_yojson x.xks_proxy_uri_path));
       (
         "XksProxyUriEndpoint",
         (option_to_yojson xks_proxy_uri_endpoint_type_to_yojson x.xks_proxy_uri_endpoint));
       (
         "CloudHsmClusterId",
         (option_to_yojson cloud_hsm_cluster_id_type_to_yojson x.cloud_hsm_cluster_id));
       (
         "KeyStorePassword",
         (option_to_yojson key_store_password_type_to_yojson x.key_store_password));
       (
         "NewCustomKeyStoreName",
         (option_to_yojson custom_key_store_name_type_to_yojson x.new_custom_key_store_name));
       (
         "CustomKeyStoreId",
         (Some (custom_key_store_id_type_to_yojson x.custom_key_store_id)));
       
  ])

let custom_key_store_not_found_exception_to_yojson = 
  fun (x: custom_key_store_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let custom_key_store_name_in_use_exception_to_yojson = 
  fun (x: custom_key_store_name_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let custom_key_store_invalid_state_exception_to_yojson = 
  fun (x: custom_key_store_invalid_state_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let cloud_hsm_cluster_not_related_exception_to_yojson = 
  fun (x: cloud_hsm_cluster_not_related_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let cloud_hsm_cluster_not_found_exception_to_yojson = 
  fun (x: cloud_hsm_cluster_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let cloud_hsm_cluster_not_active_exception_to_yojson = 
  fun (x: cloud_hsm_cluster_not_active_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let cloud_hsm_cluster_invalid_configuration_exception_to_yojson = 
  fun (x: cloud_hsm_cluster_invalid_configuration_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let alias_name_type_to_yojson = string_to_yojson

let update_alias_request_to_yojson = 
  fun (x: update_alias_request) -> assoc_to_yojson(
    [(
         "TargetKeyId",
         (Some (key_id_type_to_yojson x.target_key_id)));
       (
         "AliasName",
         (Some (alias_name_type_to_yojson x.alias_name)));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let tag_key_type_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_type_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let tag_exception_to_yojson = 
  fun (x: tag_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let trust_anchor_certificate_type_to_yojson = string_to_yojson

let tag_value_type_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "TagValue",
         (Some (tag_value_type_to_yojson x.tag_value)));
       (
         "TagKey",
         (Some (tag_key_type_to_yojson x.tag_key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let sign_response_to_yojson = 
  fun (x: sign_response) -> assoc_to_yojson(
    [(
         "SigningAlgorithm",
         (option_to_yojson signing_algorithm_spec_to_yojson x.signing_algorithm));
       (
         "Signature",
         (option_to_yojson ciphertext_type_to_yojson x.signature));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let sign_request_to_yojson = 
  fun (x: sign_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "SigningAlgorithm",
         (Some (signing_algorithm_spec_to_yojson x.signing_algorithm)));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "MessageType",
         (option_to_yojson message_type_to_yojson x.message_type));
       (
         "Message",
         (Some (plaintext_type_to_yojson x.message)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let date_type_to_yojson = timestamp_to_yojson

let key_state_to_yojson = 
  fun (x: key_state) -> match x with 
 
| Updating -> `String "Updating"
  | Unavailable -> `String "Unavailable"
  | PendingReplicaDeletion -> `String "PendingReplicaDeletion"
  | PendingImport -> `String "PendingImport"
  | PendingDeletion -> `String "PendingDeletion"
  | Disabled -> `String "Disabled"
  | Enabled -> `String "Enabled"
  | Creating -> `String "Creating"
   

let pending_window_in_days_type_to_yojson = int_to_yojson

let schedule_key_deletion_response_to_yojson = 
  fun (x: schedule_key_deletion_response) -> assoc_to_yojson(
    [(
         "PendingWindowInDays",
         (option_to_yojson pending_window_in_days_type_to_yojson x.pending_window_in_days));
       (
         "KeyState",
         (option_to_yojson key_state_to_yojson x.key_state));
       (
         "DeletionDate",
         (option_to_yojson date_type_to_yojson x.deletion_date));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let schedule_key_deletion_request_to_yojson = 
  fun (x: schedule_key_deletion_request) -> assoc_to_yojson(
    [(
         "PendingWindowInDays",
         (option_to_yojson pending_window_in_days_type_to_yojson x.pending_window_in_days));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let rotate_key_on_demand_response_to_yojson = 
  fun (x: rotate_key_on_demand_response) -> assoc_to_yojson(
    [(
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let rotate_key_on_demand_request_to_yojson = 
  fun (x: rotate_key_on_demand_request) -> assoc_to_yojson(
    [(
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let invalid_grant_id_exception_to_yojson = 
  fun (x: invalid_grant_id_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let grant_id_type_to_yojson = string_to_yojson

let revoke_grant_request_to_yojson = 
  fun (x: revoke_grant_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "GrantId",
         (Some (grant_id_type_to_yojson x.grant_id)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let retire_grant_request_to_yojson = 
  fun (x: retire_grant_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "GrantId",
         (option_to_yojson grant_id_type_to_yojson x.grant_id));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "GrantToken",
         (option_to_yojson grant_token_type_to_yojson x.grant_token));
       
  ])

let malformed_policy_document_exception_to_yojson = 
  fun (x: malformed_policy_document_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let already_exists_exception_to_yojson = 
  fun (x: already_exists_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let aws_account_id_type_to_yojson = string_to_yojson

let arn_type_to_yojson = string_to_yojson

let key_usage_type_to_yojson = 
  fun (x: key_usage_type) -> match x with 
 
| KEY_AGREEMENT -> `String "KEY_AGREEMENT"
  | GENERATE_VERIFY_MAC -> `String "GENERATE_VERIFY_MAC"
  | ENCRYPT_DECRYPT -> `String "ENCRYPT_DECRYPT"
  | SIGN_VERIFY -> `String "SIGN_VERIFY"
   

let origin_type_to_yojson = 
  fun (x: origin_type) -> match x with 
 
| EXTERNAL_KEY_STORE -> `String "EXTERNAL_KEY_STORE"
  | AWS_CLOUDHSM -> `String "AWS_CLOUDHSM"
  | EXTERNAL -> `String "EXTERNAL"
  | AWS_KMS -> `String "AWS_KMS"
   

let expiration_model_type_to_yojson = 
  fun (x: expiration_model_type) -> match x with 
 
| KEY_MATERIAL_DOES_NOT_EXPIRE -> `String "KEY_MATERIAL_DOES_NOT_EXPIRE"
  | KEY_MATERIAL_EXPIRES -> `String "KEY_MATERIAL_EXPIRES"
   

let key_manager_type_to_yojson = 
  fun (x: key_manager_type) -> match x with 
  | CUSTOMER -> `String "CUSTOMER"
    | AWS -> `String "AWS"
     

let customer_master_key_spec_to_yojson = 
  fun (x: customer_master_key_spec) -> match x with 
 
| SM2 -> `String "SM2"
  | HMAC_512 -> `String "HMAC_512"
  | HMAC_384 -> `String "HMAC_384"
  | HMAC_256 -> `String "HMAC_256"
  | HMAC_224 -> `String "HMAC_224"
  | SYMMETRIC_DEFAULT -> `String "SYMMETRIC_DEFAULT"
  | ECC_SECG_P256K1 -> `String "ECC_SECG_P256K1"
  | ECC_NIST_P521 -> `String "ECC_NIST_P521"
  | ECC_NIST_P384 -> `String "ECC_NIST_P384"
  | ECC_NIST_P256 -> `String "ECC_NIST_P256"
  | RSA_4096 -> `String "RSA_4096"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_2048 -> `String "RSA_2048"
   

let key_spec_to_yojson = 
  fun (x: key_spec) -> match x with 
 
| SM2 -> `String "SM2"
  | HMAC_512 -> `String "HMAC_512"
  | HMAC_384 -> `String "HMAC_384"
  | HMAC_256 -> `String "HMAC_256"
  | HMAC_224 -> `String "HMAC_224"
  | SYMMETRIC_DEFAULT -> `String "SYMMETRIC_DEFAULT"
  | ECC_SECG_P256K1 -> `String "ECC_SECG_P256K1"
  | ECC_NIST_P521 -> `String "ECC_NIST_P521"
  | ECC_NIST_P384 -> `String "ECC_NIST_P384"
  | ECC_NIST_P256 -> `String "ECC_NIST_P256"
  | RSA_4096 -> `String "RSA_4096"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_2048 -> `String "RSA_2048"
   

let encryption_algorithm_spec_to_yojson = 
  fun (x: encryption_algorithm_spec) -> match x with 
 
| SM2PKE -> `String "SM2PKE"
  | RSAES_OAEP_SHA_256 -> `String "RSAES_OAEP_SHA_256"
  | RSAES_OAEP_SHA_1 -> `String "RSAES_OAEP_SHA_1"
  | SYMMETRIC_DEFAULT -> `String "SYMMETRIC_DEFAULT"
   

let encryption_algorithm_spec_list_to_yojson = 
  fun tree -> list_to_yojson encryption_algorithm_spec_to_yojson tree

let signing_algorithm_spec_list_to_yojson = 
  fun tree -> list_to_yojson signing_algorithm_spec_to_yojson tree

let key_agreement_algorithm_spec_to_yojson = 
  fun (x: key_agreement_algorithm_spec) -> match x with 
  | ECDH -> `String "ECDH"
     

let key_agreement_algorithm_spec_list_to_yojson = 
  fun tree -> list_to_yojson key_agreement_algorithm_spec_to_yojson tree

let multi_region_key_type_to_yojson = 
  fun (x: multi_region_key_type) -> match x with 
  | REPLICA -> `String "REPLICA"
    | PRIMARY -> `String "PRIMARY"
     

let multi_region_key_to_yojson = 
  fun (x: multi_region_key) -> assoc_to_yojson(
    [(
         "Region",
         (option_to_yojson region_type_to_yojson x.region));
       (
         "Arn",
         (option_to_yojson arn_type_to_yojson x.arn));
       
  ])

let multi_region_key_list_to_yojson = 
  fun tree -> list_to_yojson multi_region_key_to_yojson tree

let multi_region_configuration_to_yojson = 
  fun (x: multi_region_configuration) -> assoc_to_yojson(
    [(
         "ReplicaKeys",
         (option_to_yojson multi_region_key_list_to_yojson x.replica_keys));
       (
         "PrimaryKey",
         (option_to_yojson multi_region_key_to_yojson x.primary_key));
       (
         "MultiRegionKeyType",
         (option_to_yojson multi_region_key_type_to_yojson x.multi_region_key_type));
       
  ])

let mac_algorithm_spec_list_to_yojson = 
  fun tree -> list_to_yojson mac_algorithm_spec_to_yojson tree

let key_metadata_to_yojson = 
  fun (x: key_metadata) -> assoc_to_yojson(
    [(
         "XksKeyConfiguration",
         (option_to_yojson xks_key_configuration_type_to_yojson x.xks_key_configuration));
       (
         "MacAlgorithms",
         (option_to_yojson mac_algorithm_spec_list_to_yojson x.mac_algorithms));
       (
         "PendingDeletionWindowInDays",
         (option_to_yojson pending_window_in_days_type_to_yojson x.pending_deletion_window_in_days));
       (
         "MultiRegionConfiguration",
         (option_to_yojson multi_region_configuration_to_yojson x.multi_region_configuration));
       (
         "MultiRegion",
         (option_to_yojson nullable_boolean_type_to_yojson x.multi_region));
       (
         "KeyAgreementAlgorithms",
         (option_to_yojson key_agreement_algorithm_spec_list_to_yojson x.key_agreement_algorithms));
       (
         "SigningAlgorithms",
         (option_to_yojson signing_algorithm_spec_list_to_yojson x.signing_algorithms));
       (
         "EncryptionAlgorithms",
         (option_to_yojson encryption_algorithm_spec_list_to_yojson x.encryption_algorithms));
       (
         "KeySpec",
         (option_to_yojson key_spec_to_yojson x.key_spec));
       (
         "CustomerMasterKeySpec",
         (option_to_yojson customer_master_key_spec_to_yojson x.customer_master_key_spec));
       (
         "KeyManager",
         (option_to_yojson key_manager_type_to_yojson x.key_manager));
       (
         "ExpirationModel",
         (option_to_yojson expiration_model_type_to_yojson x.expiration_model));
       (
         "CloudHsmClusterId",
         (option_to_yojson cloud_hsm_cluster_id_type_to_yojson x.cloud_hsm_cluster_id));
       (
         "CustomKeyStoreId",
         (option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id));
       (
         "Origin",
         (option_to_yojson origin_type_to_yojson x.origin));
       (
         "ValidTo",
         (option_to_yojson date_type_to_yojson x.valid_to));
       (
         "DeletionDate",
         (option_to_yojson date_type_to_yojson x.deletion_date));
       (
         "KeyState",
         (option_to_yojson key_state_to_yojson x.key_state));
       (
         "KeyUsage",
         (option_to_yojson key_usage_type_to_yojson x.key_usage));
       (
         "Description",
         (option_to_yojson description_type_to_yojson x.description));
       (
         "Enabled",
         (option_to_yojson boolean_type_to_yojson x.enabled));
       (
         "CreationDate",
         (option_to_yojson date_type_to_yojson x.creation_date));
       (
         "Arn",
         (option_to_yojson arn_type_to_yojson x.arn));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       (
         "AWSAccountId",
         (option_to_yojson aws_account_id_type_to_yojson x.aws_account_id));
       
  ])

let policy_type_to_yojson = string_to_yojson

let replicate_key_response_to_yojson = 
  fun (x: replicate_key_response) -> assoc_to_yojson(
    [(
         "ReplicaTags",
         (option_to_yojson tag_list_to_yojson x.replica_tags));
       (
         "ReplicaPolicy",
         (option_to_yojson policy_type_to_yojson x.replica_policy));
       (
         "ReplicaKeyMetadata",
         (option_to_yojson key_metadata_to_yojson x.replica_key_metadata));
       
  ])

let replicate_key_request_to_yojson = 
  fun (x: replicate_key_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Description",
         (option_to_yojson description_type_to_yojson x.description));
       (
         "BypassPolicyLockoutSafetyCheck",
         (option_to_yojson boolean_type_to_yojson x.bypass_policy_lockout_safety_check));
       (
         "Policy",
         (option_to_yojson policy_type_to_yojson x.policy));
       (
         "ReplicaRegion",
         (Some (region_type_to_yojson x.replica_region)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let invalid_ciphertext_exception_to_yojson = 
  fun (x: invalid_ciphertext_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let incorrect_key_exception_to_yojson = 
  fun (x: incorrect_key_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let re_encrypt_response_to_yojson = 
  fun (x: re_encrypt_response) -> assoc_to_yojson(
    [(
         "DestinationEncryptionAlgorithm",
         (option_to_yojson encryption_algorithm_spec_to_yojson x.destination_encryption_algorithm));
       (
         "SourceEncryptionAlgorithm",
         (option_to_yojson encryption_algorithm_spec_to_yojson x.source_encryption_algorithm));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "SourceKeyId",
         (option_to_yojson key_id_type_to_yojson x.source_key_id));
       (
         "CiphertextBlob",
         (option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob));
       
  ])

let encryption_context_value_to_yojson = string_to_yojson

let encryption_context_key_to_yojson = string_to_yojson

let encryption_context_type_to_yojson = 
  fun tree -> map_to_yojson encryption_context_value_to_yojson tree

let re_encrypt_request_to_yojson = 
  fun (x: re_encrypt_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "DestinationEncryptionAlgorithm",
         (option_to_yojson encryption_algorithm_spec_to_yojson x.destination_encryption_algorithm));
       (
         "SourceEncryptionAlgorithm",
         (option_to_yojson encryption_algorithm_spec_to_yojson x.source_encryption_algorithm));
       (
         "DestinationEncryptionContext",
         (option_to_yojson encryption_context_type_to_yojson x.destination_encryption_context));
       (
         "DestinationKeyId",
         (Some (key_id_type_to_yojson x.destination_key_id)));
       (
         "SourceKeyId",
         (option_to_yojson key_id_type_to_yojson x.source_key_id));
       (
         "SourceEncryptionContext",
         (option_to_yojson encryption_context_type_to_yojson x.source_encryption_context));
       (
         "CiphertextBlob",
         (Some (ciphertext_type_to_yojson x.ciphertext_blob)));
       
  ])

let policy_name_type_to_yojson = string_to_yojson

let put_key_policy_request_to_yojson = 
  fun (x: put_key_policy_request) -> assoc_to_yojson(
    [(
         "BypassPolicyLockoutSafetyCheck",
         (option_to_yojson boolean_type_to_yojson x.bypass_policy_lockout_safety_check));
       (
         "Policy",
         (Some (policy_type_to_yojson x.policy)));
       (
         "PolicyName",
         (option_to_yojson policy_name_type_to_yojson x.policy_name));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let invalid_marker_exception_to_yojson = 
  fun (x: invalid_marker_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let grant_name_type_to_yojson = string_to_yojson

let principal_id_type_to_yojson = string_to_yojson

let grant_operation_to_yojson = 
  fun (x: grant_operation) -> match x with 
 
| DeriveSharedSecret -> `String "DeriveSharedSecret"
  | VerifyMac -> `String "VerifyMac"
  | GenerateMac -> `String "GenerateMac"
  | GenerateDataKeyPairWithoutPlaintext -> `String "GenerateDataKeyPairWithoutPlaintext"
  | GenerateDataKeyPair -> `String "GenerateDataKeyPair"
  | DescribeKey -> `String "DescribeKey"
  | RetireGrant -> `String "RetireGrant"
  | CreateGrant -> `String "CreateGrant"
  | GetPublicKey -> `String "GetPublicKey"
  | Verify -> `String "Verify"
  | Sign -> `String "Sign"
  | ReEncryptTo -> `String "ReEncryptTo"
  | ReEncryptFrom -> `String "ReEncryptFrom"
  | GenerateDataKeyWithoutPlaintext -> `String "GenerateDataKeyWithoutPlaintext"
  | GenerateDataKey -> `String "GenerateDataKey"
  | Encrypt -> `String "Encrypt"
  | Decrypt -> `String "Decrypt"
   

let grant_operation_list_to_yojson = 
  fun tree -> list_to_yojson grant_operation_to_yojson tree

let grant_constraints_to_yojson = 
  fun (x: grant_constraints) -> assoc_to_yojson(
    [(
         "EncryptionContextEquals",
         (option_to_yojson encryption_context_type_to_yojson x.encryption_context_equals));
       (
         "EncryptionContextSubset",
         (option_to_yojson encryption_context_type_to_yojson x.encryption_context_subset));
       
  ])

let grant_list_entry_to_yojson = 
  fun (x: grant_list_entry) -> assoc_to_yojson(
    [(
         "Constraints",
         (option_to_yojson grant_constraints_to_yojson x.constraints));
       (
         "Operations",
         (option_to_yojson grant_operation_list_to_yojson x.operations));
       (
         "IssuingAccount",
         (option_to_yojson principal_id_type_to_yojson x.issuing_account));
       (
         "RetiringPrincipal",
         (option_to_yojson principal_id_type_to_yojson x.retiring_principal));
       (
         "GranteePrincipal",
         (option_to_yojson principal_id_type_to_yojson x.grantee_principal));
       (
         "CreationDate",
         (option_to_yojson date_type_to_yojson x.creation_date));
       (
         "Name",
         (option_to_yojson grant_name_type_to_yojson x.name));
       (
         "GrantId",
         (option_to_yojson grant_id_type_to_yojson x.grant_id));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let grant_list_to_yojson = 
  fun tree -> list_to_yojson grant_list_entry_to_yojson tree

let marker_type_to_yojson = string_to_yojson

let list_grants_response_to_yojson = 
  fun (x: list_grants_response) -> assoc_to_yojson(
    [(
         "Truncated",
         (option_to_yojson boolean_type_to_yojson x.truncated));
       (
         "NextMarker",
         (option_to_yojson marker_type_to_yojson x.next_marker));
       (
         "Grants",
         (option_to_yojson grant_list_to_yojson x.grants));
       
  ])

let limit_type_to_yojson = int_to_yojson

let list_retirable_grants_request_to_yojson = 
  fun (x: list_retirable_grants_request) -> assoc_to_yojson(
    [(
         "RetiringPrincipal",
         (Some (principal_id_type_to_yojson x.retiring_principal)));
       (
         "Marker",
         (option_to_yojson marker_type_to_yojson x.marker));
       (
         "Limit",
         (option_to_yojson limit_type_to_yojson x.limit));
       
  ])

let list_resource_tags_response_to_yojson = 
  fun (x: list_resource_tags_response) -> assoc_to_yojson(
    [(
         "Truncated",
         (option_to_yojson boolean_type_to_yojson x.truncated));
       (
         "NextMarker",
         (option_to_yojson marker_type_to_yojson x.next_marker));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_resource_tags_request_to_yojson = 
  fun (x: list_resource_tags_request) -> assoc_to_yojson(
    [(
         "Marker",
         (option_to_yojson marker_type_to_yojson x.marker));
       (
         "Limit",
         (option_to_yojson limit_type_to_yojson x.limit));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let key_list_entry_to_yojson = 
  fun (x: key_list_entry) -> assoc_to_yojson(
    [(
         "KeyArn",
         (option_to_yojson arn_type_to_yojson x.key_arn));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let key_list_to_yojson = 
  fun tree -> list_to_yojson key_list_entry_to_yojson tree

let list_keys_response_to_yojson = 
  fun (x: list_keys_response) -> assoc_to_yojson(
    [(
         "Truncated",
         (option_to_yojson boolean_type_to_yojson x.truncated));
       (
         "NextMarker",
         (option_to_yojson marker_type_to_yojson x.next_marker));
       (
         "Keys",
         (option_to_yojson key_list_to_yojson x.keys));
       
  ])

let list_keys_request_to_yojson = 
  fun (x: list_keys_request) -> assoc_to_yojson(
    [(
         "Marker",
         (option_to_yojson marker_type_to_yojson x.marker));
       (
         "Limit",
         (option_to_yojson limit_type_to_yojson x.limit));
       
  ])

let rotation_type_to_yojson = 
  fun (x: rotation_type) -> match x with 
  | ON_DEMAND -> `String "ON_DEMAND"
    | AUTOMATIC -> `String "AUTOMATIC"
     

let rotations_list_entry_to_yojson = 
  fun (x: rotations_list_entry) -> assoc_to_yojson(
    [(
         "RotationType",
         (option_to_yojson rotation_type_to_yojson x.rotation_type));
       (
         "RotationDate",
         (option_to_yojson date_type_to_yojson x.rotation_date));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let rotations_list_to_yojson = 
  fun tree -> list_to_yojson rotations_list_entry_to_yojson tree

let list_key_rotations_response_to_yojson = 
  fun (x: list_key_rotations_response) -> assoc_to_yojson(
    [(
         "Truncated",
         (option_to_yojson boolean_type_to_yojson x.truncated));
       (
         "NextMarker",
         (option_to_yojson marker_type_to_yojson x.next_marker));
       (
         "Rotations",
         (option_to_yojson rotations_list_to_yojson x.rotations));
       
  ])

let list_key_rotations_request_to_yojson = 
  fun (x: list_key_rotations_request) -> assoc_to_yojson(
    [(
         "Marker",
         (option_to_yojson marker_type_to_yojson x.marker));
       (
         "Limit",
         (option_to_yojson limit_type_to_yojson x.limit));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let policy_name_list_to_yojson = 
  fun tree -> list_to_yojson policy_name_type_to_yojson tree

let list_key_policies_response_to_yojson = 
  fun (x: list_key_policies_response) -> assoc_to_yojson(
    [(
         "Truncated",
         (option_to_yojson boolean_type_to_yojson x.truncated));
       (
         "NextMarker",
         (option_to_yojson marker_type_to_yojson x.next_marker));
       (
         "PolicyNames",
         (option_to_yojson policy_name_list_to_yojson x.policy_names));
       
  ])

let list_key_policies_request_to_yojson = 
  fun (x: list_key_policies_request) -> assoc_to_yojson(
    [(
         "Marker",
         (option_to_yojson marker_type_to_yojson x.marker));
       (
         "Limit",
         (option_to_yojson limit_type_to_yojson x.limit));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let list_grants_request_to_yojson = 
  fun (x: list_grants_request) -> assoc_to_yojson(
    [(
         "GranteePrincipal",
         (option_to_yojson principal_id_type_to_yojson x.grantee_principal));
       (
         "GrantId",
         (option_to_yojson grant_id_type_to_yojson x.grant_id));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       (
         "Marker",
         (option_to_yojson marker_type_to_yojson x.marker));
       (
         "Limit",
         (option_to_yojson limit_type_to_yojson x.limit));
       
  ])

let alias_list_entry_to_yojson = 
  fun (x: alias_list_entry) -> assoc_to_yojson(
    [(
         "LastUpdatedDate",
         (option_to_yojson date_type_to_yojson x.last_updated_date));
       (
         "CreationDate",
         (option_to_yojson date_type_to_yojson x.creation_date));
       (
         "TargetKeyId",
         (option_to_yojson key_id_type_to_yojson x.target_key_id));
       (
         "AliasArn",
         (option_to_yojson arn_type_to_yojson x.alias_arn));
       (
         "AliasName",
         (option_to_yojson alias_name_type_to_yojson x.alias_name));
       
  ])

let alias_list_to_yojson = 
  fun tree -> list_to_yojson alias_list_entry_to_yojson tree

let list_aliases_response_to_yojson = 
  fun (x: list_aliases_response) -> assoc_to_yojson(
    [(
         "Truncated",
         (option_to_yojson boolean_type_to_yojson x.truncated));
       (
         "NextMarker",
         (option_to_yojson marker_type_to_yojson x.next_marker));
       (
         "Aliases",
         (option_to_yojson alias_list_to_yojson x.aliases));
       
  ])

let list_aliases_request_to_yojson = 
  fun (x: list_aliases_request) -> assoc_to_yojson(
    [(
         "Marker",
         (option_to_yojson marker_type_to_yojson x.marker));
       (
         "Limit",
         (option_to_yojson limit_type_to_yojson x.limit));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let invalid_import_token_exception_to_yojson = 
  fun (x: invalid_import_token_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let incorrect_key_material_exception_to_yojson = 
  fun (x: incorrect_key_material_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let expired_import_token_exception_to_yojson = 
  fun (x: expired_import_token_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let import_key_material_response_to_yojson = 
  fun (x: import_key_material_response) -> assoc_to_yojson(
    [
  ])

let import_key_material_request_to_yojson = 
  fun (x: import_key_material_request) -> assoc_to_yojson(
    [(
         "ExpirationModel",
         (option_to_yojson expiration_model_type_to_yojson x.expiration_model));
       (
         "ValidTo",
         (option_to_yojson date_type_to_yojson x.valid_to));
       (
         "EncryptedKeyMaterial",
         (Some (ciphertext_type_to_yojson x.encrypted_key_material)));
       (
         "ImportToken",
         (Some (ciphertext_type_to_yojson x.import_token)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let public_key_type_to_yojson = blob_to_yojson

let get_public_key_response_to_yojson = 
  fun (x: get_public_key_response) -> assoc_to_yojson(
    [(
         "KeyAgreementAlgorithms",
         (option_to_yojson key_agreement_algorithm_spec_list_to_yojson x.key_agreement_algorithms));
       (
         "SigningAlgorithms",
         (option_to_yojson signing_algorithm_spec_list_to_yojson x.signing_algorithms));
       (
         "EncryptionAlgorithms",
         (option_to_yojson encryption_algorithm_spec_list_to_yojson x.encryption_algorithms));
       (
         "KeyUsage",
         (option_to_yojson key_usage_type_to_yojson x.key_usage));
       (
         "KeySpec",
         (option_to_yojson key_spec_to_yojson x.key_spec));
       (
         "CustomerMasterKeySpec",
         (option_to_yojson customer_master_key_spec_to_yojson x.customer_master_key_spec));
       (
         "PublicKey",
         (option_to_yojson public_key_type_to_yojson x.public_key));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let get_public_key_request_to_yojson = 
  fun (x: get_public_key_request) -> assoc_to_yojson(
    [(
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let get_parameters_for_import_response_to_yojson = 
  fun (x: get_parameters_for_import_response) -> assoc_to_yojson(
    [(
         "ParametersValidTo",
         (option_to_yojson date_type_to_yojson x.parameters_valid_to));
       (
         "PublicKey",
         (option_to_yojson plaintext_type_to_yojson x.public_key));
       (
         "ImportToken",
         (option_to_yojson ciphertext_type_to_yojson x.import_token));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let algorithm_spec_to_yojson = 
  fun (x: algorithm_spec) -> match x with 
 
| SM2PKE -> `String "SM2PKE"
  | RSA_AES_KEY_WRAP_SHA_256 -> `String "RSA_AES_KEY_WRAP_SHA_256"
  | RSA_AES_KEY_WRAP_SHA_1 -> `String "RSA_AES_KEY_WRAP_SHA_1"
  | RSAES_OAEP_SHA_256 -> `String "RSAES_OAEP_SHA_256"
  | RSAES_OAEP_SHA_1 -> `String "RSAES_OAEP_SHA_1"
  | RSAES_PKCS1_V1_5 -> `String "RSAES_PKCS1_V1_5"
   

let get_parameters_for_import_request_to_yojson = 
  fun (x: get_parameters_for_import_request) -> assoc_to_yojson(
    [(
         "WrappingKeySpec",
         (Some (wrapping_key_spec_to_yojson x.wrapping_key_spec)));
       (
         "WrappingAlgorithm",
         (Some (algorithm_spec_to_yojson x.wrapping_algorithm)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let rotation_period_in_days_type_to_yojson = int_to_yojson

let get_key_rotation_status_response_to_yojson = 
  fun (x: get_key_rotation_status_response) -> assoc_to_yojson(
    [(
         "OnDemandRotationStartDate",
         (option_to_yojson date_type_to_yojson x.on_demand_rotation_start_date));
       (
         "NextRotationDate",
         (option_to_yojson date_type_to_yojson x.next_rotation_date));
       (
         "RotationPeriodInDays",
         (option_to_yojson rotation_period_in_days_type_to_yojson x.rotation_period_in_days));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "KeyRotationEnabled",
         (option_to_yojson boolean_type_to_yojson x.key_rotation_enabled));
       
  ])

let get_key_rotation_status_request_to_yojson = 
  fun (x: get_key_rotation_status_request) -> assoc_to_yojson(
    [(
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let get_key_policy_response_to_yojson = 
  fun (x: get_key_policy_response) -> assoc_to_yojson(
    [(
         "PolicyName",
         (option_to_yojson policy_name_type_to_yojson x.policy_name));
       (
         "Policy",
         (option_to_yojson policy_type_to_yojson x.policy));
       
  ])

let get_key_policy_request_to_yojson = 
  fun (x: get_key_policy_request) -> assoc_to_yojson(
    [(
         "PolicyName",
         (option_to_yojson policy_name_type_to_yojson x.policy_name));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let generate_random_response_to_yojson = 
  fun (x: generate_random_response) -> assoc_to_yojson(
    [(
         "CiphertextForRecipient",
         (option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient));
       (
         "Plaintext",
         (option_to_yojson plaintext_type_to_yojson x.plaintext));
       
  ])

let number_of_bytes_type_to_yojson = int_to_yojson

let key_encryption_mechanism_to_yojson = 
  fun (x: key_encryption_mechanism) -> match x with 
  | RSAES_OAEP_SHA_256 -> `String "RSAES_OAEP_SHA_256"
     

let attestation_document_type_to_yojson = blob_to_yojson

let recipient_info_to_yojson = 
  fun (x: recipient_info) -> assoc_to_yojson(
    [(
         "AttestationDocument",
         (option_to_yojson attestation_document_type_to_yojson x.attestation_document));
       (
         "KeyEncryptionAlgorithm",
         (option_to_yojson key_encryption_mechanism_to_yojson x.key_encryption_algorithm));
       
  ])

let generate_random_request_to_yojson = 
  fun (x: generate_random_request) -> assoc_to_yojson(
    [(
         "Recipient",
         (option_to_yojson recipient_info_to_yojson x.recipient));
       (
         "CustomKeyStoreId",
         (option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id));
       (
         "NumberOfBytes",
         (option_to_yojson number_of_bytes_type_to_yojson x.number_of_bytes));
       
  ])

let generate_mac_response_to_yojson = 
  fun (x: generate_mac_response) -> assoc_to_yojson(
    [(
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "MacAlgorithm",
         (option_to_yojson mac_algorithm_spec_to_yojson x.mac_algorithm));
       (
         "Mac",
         (option_to_yojson ciphertext_type_to_yojson x.mac));
       
  ])

let generate_mac_request_to_yojson = 
  fun (x: generate_mac_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "MacAlgorithm",
         (Some (mac_algorithm_spec_to_yojson x.mac_algorithm)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       (
         "Message",
         (Some (plaintext_type_to_yojson x.message)));
       
  ])

let generate_data_key_without_plaintext_response_to_yojson = 
  fun (x: generate_data_key_without_plaintext_response) -> assoc_to_yojson(
    [(
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "CiphertextBlob",
         (option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob));
       
  ])

let data_key_spec_to_yojson = 
  fun (x: data_key_spec) -> match x with 
  | AES_128 -> `String "AES_128"
    | AES_256 -> `String "AES_256"
     

let generate_data_key_without_plaintext_request_to_yojson = 
  fun (x: generate_data_key_without_plaintext_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "NumberOfBytes",
         (option_to_yojson number_of_bytes_type_to_yojson x.number_of_bytes));
       (
         "KeySpec",
         (option_to_yojson data_key_spec_to_yojson x.key_spec));
       (
         "EncryptionContext",
         (option_to_yojson encryption_context_type_to_yojson x.encryption_context));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let data_key_pair_spec_to_yojson = 
  fun (x: data_key_pair_spec) -> match x with 
 
| SM2 -> `String "SM2"
  | ECC_SECG_P256K1 -> `String "ECC_SECG_P256K1"
  | ECC_NIST_P521 -> `String "ECC_NIST_P521"
  | ECC_NIST_P384 -> `String "ECC_NIST_P384"
  | ECC_NIST_P256 -> `String "ECC_NIST_P256"
  | RSA_4096 -> `String "RSA_4096"
  | RSA_3072 -> `String "RSA_3072"
  | RSA_2048 -> `String "RSA_2048"
   

let generate_data_key_pair_without_plaintext_response_to_yojson = 
  fun (x: generate_data_key_pair_without_plaintext_response) -> assoc_to_yojson(
    [(
         "KeyPairSpec",
         (option_to_yojson data_key_pair_spec_to_yojson x.key_pair_spec));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "PublicKey",
         (option_to_yojson public_key_type_to_yojson x.public_key));
       (
         "PrivateKeyCiphertextBlob",
         (option_to_yojson ciphertext_type_to_yojson x.private_key_ciphertext_blob));
       
  ])

let generate_data_key_pair_without_plaintext_request_to_yojson = 
  fun (x: generate_data_key_pair_without_plaintext_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "KeyPairSpec",
         (Some (data_key_pair_spec_to_yojson x.key_pair_spec)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       (
         "EncryptionContext",
         (option_to_yojson encryption_context_type_to_yojson x.encryption_context));
       
  ])

let generate_data_key_pair_response_to_yojson = 
  fun (x: generate_data_key_pair_response) -> assoc_to_yojson(
    [(
         "CiphertextForRecipient",
         (option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient));
       (
         "KeyPairSpec",
         (option_to_yojson data_key_pair_spec_to_yojson x.key_pair_spec));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "PublicKey",
         (option_to_yojson public_key_type_to_yojson x.public_key));
       (
         "PrivateKeyPlaintext",
         (option_to_yojson plaintext_type_to_yojson x.private_key_plaintext));
       (
         "PrivateKeyCiphertextBlob",
         (option_to_yojson ciphertext_type_to_yojson x.private_key_ciphertext_blob));
       
  ])

let generate_data_key_pair_request_to_yojson = 
  fun (x: generate_data_key_pair_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "Recipient",
         (option_to_yojson recipient_info_to_yojson x.recipient));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "KeyPairSpec",
         (Some (data_key_pair_spec_to_yojson x.key_pair_spec)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       (
         "EncryptionContext",
         (option_to_yojson encryption_context_type_to_yojson x.encryption_context));
       
  ])

let generate_data_key_response_to_yojson = 
  fun (x: generate_data_key_response) -> assoc_to_yojson(
    [(
         "CiphertextForRecipient",
         (option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "Plaintext",
         (option_to_yojson plaintext_type_to_yojson x.plaintext));
       (
         "CiphertextBlob",
         (option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob));
       
  ])

let generate_data_key_request_to_yojson = 
  fun (x: generate_data_key_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "Recipient",
         (option_to_yojson recipient_info_to_yojson x.recipient));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "KeySpec",
         (option_to_yojson data_key_spec_to_yojson x.key_spec));
       (
         "NumberOfBytes",
         (option_to_yojson number_of_bytes_type_to_yojson x.number_of_bytes));
       (
         "EncryptionContext",
         (option_to_yojson encryption_context_type_to_yojson x.encryption_context));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let encrypt_response_to_yojson = 
  fun (x: encrypt_response) -> assoc_to_yojson(
    [(
         "EncryptionAlgorithm",
         (option_to_yojson encryption_algorithm_spec_to_yojson x.encryption_algorithm));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "CiphertextBlob",
         (option_to_yojson ciphertext_type_to_yojson x.ciphertext_blob));
       
  ])

let encrypt_request_to_yojson = 
  fun (x: encrypt_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "EncryptionAlgorithm",
         (option_to_yojson encryption_algorithm_spec_to_yojson x.encryption_algorithm));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "EncryptionContext",
         (option_to_yojson encryption_context_type_to_yojson x.encryption_context));
       (
         "Plaintext",
         (Some (plaintext_type_to_yojson x.plaintext)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let enable_key_rotation_request_to_yojson = 
  fun (x: enable_key_rotation_request) -> assoc_to_yojson(
    [(
         "RotationPeriodInDays",
         (option_to_yojson rotation_period_in_days_type_to_yojson x.rotation_period_in_days));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let enable_key_request_to_yojson = 
  fun (x: enable_key_request) -> assoc_to_yojson(
    [(
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let disconnect_custom_key_store_response_to_yojson = 
  fun (x: disconnect_custom_key_store_response) -> assoc_to_yojson(
    [
  ])

let disconnect_custom_key_store_request_to_yojson = 
  fun (x: disconnect_custom_key_store_request) -> assoc_to_yojson(
    [(
         "CustomKeyStoreId",
         (Some (custom_key_store_id_type_to_yojson x.custom_key_store_id)));
       
  ])

let disable_key_rotation_request_to_yojson = 
  fun (x: disable_key_rotation_request) -> assoc_to_yojson(
    [(
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let disable_key_request_to_yojson = 
  fun (x: disable_key_request) -> assoc_to_yojson(
    [(
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let describe_key_response_to_yojson = 
  fun (x: describe_key_response) -> assoc_to_yojson(
    [(
         "KeyMetadata",
         (option_to_yojson key_metadata_to_yojson x.key_metadata));
       
  ])

let describe_key_request_to_yojson = 
  fun (x: describe_key_request) -> assoc_to_yojson(
    [(
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let connection_state_type_to_yojson = 
  fun (x: connection_state_type) -> match x with 
 
| DISCONNECTING -> `String "DISCONNECTING"
  | DISCONNECTED -> `String "DISCONNECTED"
  | FAILED -> `String "FAILED"
  | CONNECTING -> `String "CONNECTING"
  | CONNECTED -> `String "CONNECTED"
   

let connection_error_code_type_to_yojson = 
  fun (x: connection_error_code_type) -> match x with 
 
| XKS_PROXY_INVALID_TLS_CONFIGURATION -> `String "XKS_PROXY_INVALID_TLS_CONFIGURATION"
  | XKS_PROXY_TIMED_OUT -> `String "XKS_PROXY_TIMED_OUT"
  | XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION -> `String "XKS_VPC_ENDPOINT_SERVICE_INVALID_CONFIGURATION"
  | XKS_PROXY_INVALID_CONFIGURATION -> `String "XKS_PROXY_INVALID_CONFIGURATION"
  | XKS_PROXY_INVALID_RESPONSE -> `String "XKS_PROXY_INVALID_RESPONSE"
  | XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND -> `String "XKS_VPC_ENDPOINT_SERVICE_NOT_FOUND"
  | XKS_PROXY_NOT_REACHABLE -> `String "XKS_PROXY_NOT_REACHABLE"
  | XKS_PROXY_ACCESS_DENIED -> `String "XKS_PROXY_ACCESS_DENIED"
  | INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET -> `String "INSUFFICIENT_FREE_ADDRESSES_IN_SUBNET"
  | SUBNET_NOT_FOUND -> `String "SUBNET_NOT_FOUND"
  | USER_LOGGED_IN -> `String "USER_LOGGED_IN"
  | USER_NOT_FOUND -> `String "USER_NOT_FOUND"
  | USER_LOCKED_OUT -> `String "USER_LOCKED_OUT"
  | INSUFFICIENT_CLOUDHSM_HSMS -> `String "INSUFFICIENT_CLOUDHSM_HSMS"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | NETWORK_ERRORS -> `String "NETWORK_ERRORS"
  | CLUSTER_NOT_FOUND -> `String "CLUSTER_NOT_FOUND"
  | INVALID_CREDENTIALS -> `String "INVALID_CREDENTIALS"
   

let custom_key_store_type_to_yojson = 
  fun (x: custom_key_store_type) -> match x with 
 
| EXTERNAL_KEY_STORE -> `String "EXTERNAL_KEY_STORE"
  | AWS_CLOUDHSM -> `String "AWS_CLOUDHSM"
   

let custom_key_stores_list_entry_to_yojson = 
  fun (x: custom_key_stores_list_entry) -> assoc_to_yojson(
    [(
         "XksProxyConfiguration",
         (option_to_yojson xks_proxy_configuration_type_to_yojson x.xks_proxy_configuration));
       (
         "CustomKeyStoreType",
         (option_to_yojson custom_key_store_type_to_yojson x.custom_key_store_type));
       (
         "CreationDate",
         (option_to_yojson date_type_to_yojson x.creation_date));
       (
         "ConnectionErrorCode",
         (option_to_yojson connection_error_code_type_to_yojson x.connection_error_code));
       (
         "ConnectionState",
         (option_to_yojson connection_state_type_to_yojson x.connection_state));
       (
         "TrustAnchorCertificate",
         (option_to_yojson trust_anchor_certificate_type_to_yojson x.trust_anchor_certificate));
       (
         "CloudHsmClusterId",
         (option_to_yojson cloud_hsm_cluster_id_type_to_yojson x.cloud_hsm_cluster_id));
       (
         "CustomKeyStoreName",
         (option_to_yojson custom_key_store_name_type_to_yojson x.custom_key_store_name));
       (
         "CustomKeyStoreId",
         (option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id));
       
  ])

let custom_key_stores_list_to_yojson = 
  fun tree -> list_to_yojson custom_key_stores_list_entry_to_yojson tree

let describe_custom_key_stores_response_to_yojson = 
  fun (x: describe_custom_key_stores_response) -> assoc_to_yojson(
    [(
         "Truncated",
         (option_to_yojson boolean_type_to_yojson x.truncated));
       (
         "NextMarker",
         (option_to_yojson marker_type_to_yojson x.next_marker));
       (
         "CustomKeyStores",
         (option_to_yojson custom_key_stores_list_to_yojson x.custom_key_stores));
       
  ])

let describe_custom_key_stores_request_to_yojson = 
  fun (x: describe_custom_key_stores_request) -> assoc_to_yojson(
    [(
         "Marker",
         (option_to_yojson marker_type_to_yojson x.marker));
       (
         "Limit",
         (option_to_yojson limit_type_to_yojson x.limit));
       (
         "CustomKeyStoreName",
         (option_to_yojson custom_key_store_name_type_to_yojson x.custom_key_store_name));
       (
         "CustomKeyStoreId",
         (option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id));
       
  ])

let derive_shared_secret_response_to_yojson = 
  fun (x: derive_shared_secret_response) -> assoc_to_yojson(
    [(
         "KeyOrigin",
         (option_to_yojson origin_type_to_yojson x.key_origin));
       (
         "KeyAgreementAlgorithm",
         (option_to_yojson key_agreement_algorithm_spec_to_yojson x.key_agreement_algorithm));
       (
         "CiphertextForRecipient",
         (option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient));
       (
         "SharedSecret",
         (option_to_yojson plaintext_type_to_yojson x.shared_secret));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let derive_shared_secret_request_to_yojson = 
  fun (x: derive_shared_secret_request) -> assoc_to_yojson(
    [(
         "Recipient",
         (option_to_yojson recipient_info_to_yojson x.recipient));
       (
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "PublicKey",
         (Some (public_key_type_to_yojson x.public_key)));
       (
         "KeyAgreementAlgorithm",
         (Some (key_agreement_algorithm_spec_to_yojson x.key_agreement_algorithm)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let delete_imported_key_material_request_to_yojson = 
  fun (x: delete_imported_key_material_request) -> assoc_to_yojson(
    [(
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let custom_key_store_has_cm_ks_exception_to_yojson = 
  fun (x: custom_key_store_has_cm_ks_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let delete_custom_key_store_response_to_yojson = 
  fun (x: delete_custom_key_store_response) -> assoc_to_yojson(
    [
  ])

let delete_custom_key_store_request_to_yojson = 
  fun (x: delete_custom_key_store_request) -> assoc_to_yojson(
    [(
         "CustomKeyStoreId",
         (Some (custom_key_store_id_type_to_yojson x.custom_key_store_id)));
       
  ])

let delete_alias_request_to_yojson = 
  fun (x: delete_alias_request) -> assoc_to_yojson(
    [(
         "AliasName",
         (Some (alias_name_type_to_yojson x.alias_name)));
       
  ])

let decrypt_response_to_yojson = 
  fun (x: decrypt_response) -> assoc_to_yojson(
    [(
         "CiphertextForRecipient",
         (option_to_yojson ciphertext_type_to_yojson x.ciphertext_for_recipient));
       (
         "EncryptionAlgorithm",
         (option_to_yojson encryption_algorithm_spec_to_yojson x.encryption_algorithm));
       (
         "Plaintext",
         (option_to_yojson plaintext_type_to_yojson x.plaintext));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let decrypt_request_to_yojson = 
  fun (x: decrypt_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "Recipient",
         (option_to_yojson recipient_info_to_yojson x.recipient));
       (
         "EncryptionAlgorithm",
         (option_to_yojson encryption_algorithm_spec_to_yojson x.encryption_algorithm));
       (
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "EncryptionContext",
         (option_to_yojson encryption_context_type_to_yojson x.encryption_context));
       (
         "CiphertextBlob",
         (Some (ciphertext_type_to_yojson x.ciphertext_blob)));
       
  ])

let create_key_response_to_yojson = 
  fun (x: create_key_response) -> assoc_to_yojson(
    [(
         "KeyMetadata",
         (option_to_yojson key_metadata_to_yojson x.key_metadata));
       
  ])

let create_key_request_to_yojson = 
  fun (x: create_key_request) -> assoc_to_yojson(
    [(
         "XksKeyId",
         (option_to_yojson xks_key_id_type_to_yojson x.xks_key_id));
       (
         "MultiRegion",
         (option_to_yojson nullable_boolean_type_to_yojson x.multi_region));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "BypassPolicyLockoutSafetyCheck",
         (option_to_yojson boolean_type_to_yojson x.bypass_policy_lockout_safety_check));
       (
         "CustomKeyStoreId",
         (option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id));
       (
         "Origin",
         (option_to_yojson origin_type_to_yojson x.origin));
       (
         "KeySpec",
         (option_to_yojson key_spec_to_yojson x.key_spec));
       (
         "CustomerMasterKeySpec",
         (option_to_yojson customer_master_key_spec_to_yojson x.customer_master_key_spec));
       (
         "KeyUsage",
         (option_to_yojson key_usage_type_to_yojson x.key_usage));
       (
         "Description",
         (option_to_yojson description_type_to_yojson x.description));
       (
         "Policy",
         (option_to_yojson policy_type_to_yojson x.policy));
       
  ])

let create_grant_response_to_yojson = 
  fun (x: create_grant_response) -> assoc_to_yojson(
    [(
         "GrantId",
         (option_to_yojson grant_id_type_to_yojson x.grant_id));
       (
         "GrantToken",
         (option_to_yojson grant_token_type_to_yojson x.grant_token));
       
  ])

let create_grant_request_to_yojson = 
  fun (x: create_grant_request) -> assoc_to_yojson(
    [(
         "DryRun",
         (option_to_yojson nullable_boolean_type_to_yojson x.dry_run));
       (
         "Name",
         (option_to_yojson grant_name_type_to_yojson x.name));
       (
         "GrantTokens",
         (option_to_yojson grant_token_list_to_yojson x.grant_tokens));
       (
         "Constraints",
         (option_to_yojson grant_constraints_to_yojson x.constraints));
       (
         "Operations",
         (Some (grant_operation_list_to_yojson x.operations)));
       (
         "RetiringPrincipal",
         (option_to_yojson principal_id_type_to_yojson x.retiring_principal));
       (
         "GranteePrincipal",
         (Some (principal_id_type_to_yojson x.grantee_principal)));
       (
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let incorrect_trust_anchor_exception_to_yojson = 
  fun (x: incorrect_trust_anchor_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let cloud_hsm_cluster_in_use_exception_to_yojson = 
  fun (x: cloud_hsm_cluster_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let create_custom_key_store_response_to_yojson = 
  fun (x: create_custom_key_store_response) -> assoc_to_yojson(
    [(
         "CustomKeyStoreId",
         (option_to_yojson custom_key_store_id_type_to_yojson x.custom_key_store_id));
       
  ])

let create_custom_key_store_request_to_yojson = 
  fun (x: create_custom_key_store_request) -> assoc_to_yojson(
    [(
         "XksProxyConnectivity",
         (option_to_yojson xks_proxy_connectivity_type_to_yojson x.xks_proxy_connectivity));
       (
         "XksProxyAuthenticationCredential",
         (option_to_yojson xks_proxy_authentication_credential_type_to_yojson x.xks_proxy_authentication_credential));
       (
         "XksProxyVpcEndpointServiceName",
         (option_to_yojson xks_proxy_vpc_endpoint_service_name_type_to_yojson x.xks_proxy_vpc_endpoint_service_name));
       (
         "XksProxyUriPath",
         (option_to_yojson xks_proxy_uri_path_type_to_yojson x.xks_proxy_uri_path));
       (
         "XksProxyUriEndpoint",
         (option_to_yojson xks_proxy_uri_endpoint_type_to_yojson x.xks_proxy_uri_endpoint));
       (
         "CustomKeyStoreType",
         (option_to_yojson custom_key_store_type_to_yojson x.custom_key_store_type));
       (
         "KeyStorePassword",
         (option_to_yojson key_store_password_type_to_yojson x.key_store_password));
       (
         "TrustAnchorCertificate",
         (option_to_yojson trust_anchor_certificate_type_to_yojson x.trust_anchor_certificate));
       (
         "CloudHsmClusterId",
         (option_to_yojson cloud_hsm_cluster_id_type_to_yojson x.cloud_hsm_cluster_id));
       (
         "CustomKeyStoreName",
         (Some (custom_key_store_name_type_to_yojson x.custom_key_store_name)));
       
  ])

let invalid_alias_name_exception_to_yojson = 
  fun (x: invalid_alias_name_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_type_to_yojson x.message));
       
  ])

let create_alias_request_to_yojson = 
  fun (x: create_alias_request) -> assoc_to_yojson(
    [(
         "TargetKeyId",
         (Some (key_id_type_to_yojson x.target_key_id)));
       (
         "AliasName",
         (Some (alias_name_type_to_yojson x.alias_name)));
       
  ])

let connect_custom_key_store_response_to_yojson = 
  fun (x: connect_custom_key_store_response) -> assoc_to_yojson(
    [
  ])

let connect_custom_key_store_request_to_yojson = 
  fun (x: connect_custom_key_store_request) -> assoc_to_yojson(
    [(
         "CustomKeyStoreId",
         (Some (custom_key_store_id_type_to_yojson x.custom_key_store_id)));
       
  ])

let cancel_key_deletion_response_to_yojson = 
  fun (x: cancel_key_deletion_response) -> assoc_to_yojson(
    [(
         "KeyId",
         (option_to_yojson key_id_type_to_yojson x.key_id));
       
  ])

let cancel_key_deletion_request_to_yojson = 
  fun (x: cancel_key_deletion_request) -> assoc_to_yojson(
    [(
         "KeyId",
         (Some (key_id_type_to_yojson x.key_id)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

