open Smaws_Lib.Json.SerializeHelpers

open Types

let saml_user_attribute_to_yojson = string_to_yojson

let saml_metadata_to_yojson = string_to_yojson

let saml_group_attribute_to_yojson = string_to_yojson

let vpc_id_to_yojson = string_to_yojson

let vpc_endpoint_id_to_yojson = string_to_yojson

let vpc_endpoint_name_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let vpc_endpoint_status_to_yojson = 
  fun (x: vpc_endpoint_status) -> match x with 
 
| PENDING -> `String "PENDING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | FAILED -> `String "FAILED"
   

let vpc_endpoint_summary_to_yojson = 
  fun (x: vpc_endpoint_summary) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson vpc_endpoint_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson vpc_endpoint_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson vpc_endpoint_id_to_yojson x.id));
       
  ])

let vpc_endpoint_summaries_to_yojson = 
  fun tree -> list_to_yojson vpc_endpoint_summary_to_yojson tree

let vpc_endpoint_ids_to_yojson = 
  fun tree -> list_to_yojson vpc_endpoint_id_to_yojson tree

let vpc_endpoint_filters_to_yojson = 
  fun (x: vpc_endpoint_filters) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson vpc_endpoint_status_to_yojson x.status));
       
  ])

let base_string_to_yojson = string_to_yojson

let vpc_endpoint_error_detail_to_yojson = 
  fun (x: vpc_endpoint_error_detail) -> assoc_to_yojson(
    [(
         "errorCode",
         (option_to_yojson base_string_to_yojson x.error_code));
       (
         "errorMessage",
         (option_to_yojson base_string_to_yojson x.error_message));
       (
         "id",
         (option_to_yojson vpc_endpoint_id_to_yojson x.id));
       
  ])

let vpc_endpoint_error_details_to_yojson = 
  fun tree -> list_to_yojson vpc_endpoint_error_detail_to_yojson tree

let subnet_id_to_yojson = string_to_yojson

let subnet_ids_to_yojson = 
  fun tree -> list_to_yojson subnet_id_to_yojson tree

let security_group_id_to_yojson = string_to_yojson

let security_group_ids_to_yojson = 
  fun tree -> list_to_yojson security_group_id_to_yojson tree

let base_long_to_yojson = long_to_yojson

let vpc_endpoint_detail_to_yojson = 
  fun (x: vpc_endpoint_detail) -> assoc_to_yojson(
    [(
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "status",
         (option_to_yojson vpc_endpoint_status_to_yojson x.status));
       (
         "securityGroupIds",
         (option_to_yojson security_group_ids_to_yojson x.security_group_ids));
       (
         "subnetIds",
         (option_to_yojson subnet_ids_to_yojson x.subnet_ids));
       (
         "vpcId",
         (option_to_yojson vpc_id_to_yojson x.vpc_id));
       (
         "name",
         (option_to_yojson vpc_endpoint_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson vpc_endpoint_id_to_yojson x.id));
       
  ])

let vpc_endpoint_details_to_yojson = 
  fun tree -> list_to_yojson vpc_endpoint_detail_to_yojson tree

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let update_vpc_endpoint_detail_to_yojson = 
  fun (x: update_vpc_endpoint_detail) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "securityGroupIds",
         (option_to_yojson security_group_ids_to_yojson x.security_group_ids));
       (
         "subnetIds",
         (option_to_yojson subnet_ids_to_yojson x.subnet_ids));
       (
         "status",
         (option_to_yojson vpc_endpoint_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson vpc_endpoint_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson vpc_endpoint_id_to_yojson x.id));
       
  ])

let update_vpc_endpoint_response_to_yojson = 
  fun (x: update_vpc_endpoint_response) -> assoc_to_yojson(
    [(
         "UpdateVpcEndpointDetail",
         (option_to_yojson update_vpc_endpoint_detail_to_yojson x.update_vpc_endpoint_detail));
       
  ])

let client_token_to_yojson = string_to_yojson

let update_vpc_endpoint_request_to_yojson = 
  fun (x: update_vpc_endpoint_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "removeSecurityGroupIds",
         (option_to_yojson security_group_ids_to_yojson x.remove_security_group_ids));
       (
         "addSecurityGroupIds",
         (option_to_yojson security_group_ids_to_yojson x.add_security_group_ids));
       (
         "removeSubnetIds",
         (option_to_yojson subnet_ids_to_yojson x.remove_subnet_ids));
       (
         "addSubnetIds",
         (option_to_yojson subnet_ids_to_yojson x.add_subnet_ids));
       (
         "id",
         (Some (vpc_endpoint_id_to_yojson x.id)));
       
  ])

let internal_server_exception_to_yojson = 
  fun (x: internal_server_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let security_policy_type_to_yojson = 
  fun (x: security_policy_type) -> match x with 
  | Encryption -> `String "encryption"
    | Network -> `String "network"
     

let policy_name_to_yojson = string_to_yojson

let policy_version_to_yojson = string_to_yojson

let policy_description_to_yojson = string_to_yojson

let base_document_to_yojson = json_to_yojson

let security_policy_detail_to_yojson = 
  fun (x: security_policy_detail) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "policy",
         (option_to_yojson base_document_to_yojson x.policy));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "policyVersion",
         (option_to_yojson policy_version_to_yojson x.policy_version));
       (
         "name",
         (option_to_yojson policy_name_to_yojson x.name));
       (
         "type",
         (option_to_yojson security_policy_type_to_yojson x.type_));
       
  ])

let update_security_policy_response_to_yojson = 
  fun (x: update_security_policy_response) -> assoc_to_yojson(
    [(
         "securityPolicyDetail",
         (option_to_yojson security_policy_detail_to_yojson x.security_policy_detail));
       
  ])

let policy_document_to_yojson = string_to_yojson

let update_security_policy_request_to_yojson = 
  fun (x: update_security_policy_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "policy",
         (option_to_yojson policy_document_to_yojson x.policy));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "policyVersion",
         (Some (policy_version_to_yojson x.policy_version)));
       (
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (security_policy_type_to_yojson x.type_)));
       
  ])

let service_quota_exceeded_exception_to_yojson = 
  fun (x: service_quota_exceeded_exception) -> assoc_to_yojson(
    [(
         "quotaCode",
         (option_to_yojson base_string_to_yojson x.quota_code));
       (
         "serviceCode",
         (Some (base_string_to_yojson x.service_code)));
       (
         "resourceType",
         (option_to_yojson base_string_to_yojson x.resource_type));
       (
         "resourceId",
         (option_to_yojson base_string_to_yojson x.resource_id));
       (
         "message",
         (Some (base_string_to_yojson x.message)));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson base_string_to_yojson x.message));
       
  ])

let security_config_id_to_yojson = string_to_yojson

let security_config_type_to_yojson = 
  fun (x: security_config_type) -> match x with 
  | Saml -> `String "saml"
     

let config_description_to_yojson = string_to_yojson

let base_integer_to_yojson = int_to_yojson

let saml_config_options_to_yojson = 
  fun (x: saml_config_options) -> assoc_to_yojson(
    [(
         "sessionTimeout",
         (option_to_yojson base_integer_to_yojson x.session_timeout));
       (
         "groupAttribute",
         (option_to_yojson saml_group_attribute_to_yojson x.group_attribute));
       (
         "userAttribute",
         (option_to_yojson saml_user_attribute_to_yojson x.user_attribute));
       (
         "metadata",
         (Some (saml_metadata_to_yojson x.metadata)));
       
  ])

let security_config_detail_to_yojson = 
  fun (x: security_config_detail) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "samlOptions",
         (option_to_yojson saml_config_options_to_yojson x.saml_options));
       (
         "description",
         (option_to_yojson config_description_to_yojson x.description));
       (
         "configVersion",
         (option_to_yojson policy_version_to_yojson x.config_version));
       (
         "type",
         (option_to_yojson security_config_type_to_yojson x.type_));
       (
         "id",
         (option_to_yojson security_config_id_to_yojson x.id));
       
  ])

let update_security_config_response_to_yojson = 
  fun (x: update_security_config_response) -> assoc_to_yojson(
    [(
         "securityConfigDetail",
         (option_to_yojson security_config_detail_to_yojson x.security_config_detail));
       
  ])

let update_security_config_request_to_yojson = 
  fun (x: update_security_config_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "samlOptions",
         (option_to_yojson saml_config_options_to_yojson x.saml_options));
       (
         "description",
         (option_to_yojson config_description_to_yojson x.description));
       (
         "configVersion",
         (Some (policy_version_to_yojson x.config_version)));
       (
         "id",
         (Some (security_config_id_to_yojson x.id)));
       
  ])

let lifecycle_policy_type_to_yojson = 
  fun (x: lifecycle_policy_type) -> match x with 
  | Retention -> `String "retention"
     

let lifecycle_policy_detail_to_yojson = 
  fun (x: lifecycle_policy_detail) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "policy",
         (option_to_yojson base_document_to_yojson x.policy));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "policyVersion",
         (option_to_yojson policy_version_to_yojson x.policy_version));
       (
         "name",
         (option_to_yojson policy_name_to_yojson x.name));
       (
         "type",
         (option_to_yojson lifecycle_policy_type_to_yojson x.type_));
       
  ])

let update_lifecycle_policy_response_to_yojson = 
  fun (x: update_lifecycle_policy_response) -> assoc_to_yojson(
    [(
         "lifecyclePolicyDetail",
         (option_to_yojson lifecycle_policy_detail_to_yojson x.lifecycle_policy_detail));
       
  ])

let update_lifecycle_policy_request_to_yojson = 
  fun (x: update_lifecycle_policy_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "policy",
         (option_to_yojson policy_document_to_yojson x.policy));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "policyVersion",
         (Some (policy_version_to_yojson x.policy_version)));
       (
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (lifecycle_policy_type_to_yojson x.type_)));
       
  ])

let collection_id_to_yojson = string_to_yojson

let collection_name_to_yojson = string_to_yojson

let collection_status_to_yojson = 
  fun (x: collection_status) -> match x with 
 
| CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | FAILED -> `String "FAILED"
   

let collection_type_to_yojson = 
  fun (x: collection_type) -> match x with 
 
| SEARCH -> `String "SEARCH"
  | TIMESERIES -> `String "TIMESERIES"
  | VECTORSEARCH -> `String "VECTORSEARCH"
   

let update_collection_detail_to_yojson = 
  fun (x: update_collection_detail) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "arn",
         (option_to_yojson base_string_to_yojson x.arn));
       (
         "description",
         (option_to_yojson base_string_to_yojson x.description));
       (
         "type",
         (option_to_yojson collection_type_to_yojson x.type_));
       (
         "status",
         (option_to_yojson collection_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson collection_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson collection_id_to_yojson x.id));
       
  ])

let update_collection_response_to_yojson = 
  fun (x: update_collection_response) -> assoc_to_yojson(
    [(
         "updateCollectionDetail",
         (option_to_yojson update_collection_detail_to_yojson x.update_collection_detail));
       
  ])

let update_collection_request_to_yojson = 
  fun (x: update_collection_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "description",
         (option_to_yojson base_string_to_yojson x.description));
       (
         "id",
         (Some (collection_id_to_yojson x.id)));
       
  ])

let indexing_capacity_value_to_yojson = int_to_yojson

let search_capacity_value_to_yojson = int_to_yojson

let capacity_limits_to_yojson = 
  fun (x: capacity_limits) -> assoc_to_yojson(
    [(
         "maxSearchCapacityInOCU",
         (option_to_yojson search_capacity_value_to_yojson x.max_search_capacity_in_oc_u));
       (
         "maxIndexingCapacityInOCU",
         (option_to_yojson indexing_capacity_value_to_yojson x.max_indexing_capacity_in_oc_u));
       
  ])

let account_settings_detail_to_yojson = 
  fun (x: account_settings_detail) -> assoc_to_yojson(
    [(
         "capacityLimits",
         (option_to_yojson capacity_limits_to_yojson x.capacity_limits));
       
  ])

let update_account_settings_response_to_yojson = 
  fun (x: update_account_settings_response) -> assoc_to_yojson(
    [(
         "accountSettingsDetail",
         (option_to_yojson account_settings_detail_to_yojson x.account_settings_detail));
       
  ])

let update_account_settings_request_to_yojson = 
  fun (x: update_account_settings_request) -> assoc_to_yojson(
    [(
         "capacityLimits",
         (option_to_yojson capacity_limits_to_yojson x.capacity_limits));
       
  ])

let access_policy_type_to_yojson = 
  fun (x: access_policy_type) -> match x with 
  | Data -> `String "data"
     

let access_policy_detail_to_yojson = 
  fun (x: access_policy_detail) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "policy",
         (option_to_yojson base_document_to_yojson x.policy));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "policyVersion",
         (option_to_yojson policy_version_to_yojson x.policy_version));
       (
         "name",
         (option_to_yojson policy_name_to_yojson x.name));
       (
         "type",
         (option_to_yojson access_policy_type_to_yojson x.type_));
       
  ])

let update_access_policy_response_to_yojson = 
  fun (x: update_access_policy_response) -> assoc_to_yojson(
    [(
         "accessPolicyDetail",
         (option_to_yojson access_policy_detail_to_yojson x.access_policy_detail));
       
  ])

let update_access_policy_request_to_yojson = 
  fun (x: update_access_policy_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "policy",
         (option_to_yojson policy_document_to_yojson x.policy));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "policyVersion",
         (Some (policy_version_to_yojson x.policy_version)));
       (
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (access_policy_type_to_yojson x.type_)));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let arn_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_keys_to_yojson = fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "tagKeys",
         (Some (tag_keys_to_yojson x.tag_keys)));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "value",
         (Some (tag_value_to_yojson x.value)));
       (
         "key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tags_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "tags",
         (Some (tags_to_yojson x.tags)));
       (
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let standby_replicas_to_yojson = 
  fun (x: standby_replicas) -> match x with 
  | ENABLED -> `String "ENABLED"
    | DISABLED -> `String "DISABLED"
     

let security_policy_summary_to_yojson = 
  fun (x: security_policy_summary) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "policyVersion",
         (option_to_yojson policy_version_to_yojson x.policy_version));
       (
         "name",
         (option_to_yojson policy_name_to_yojson x.name));
       (
         "type",
         (option_to_yojson security_policy_type_to_yojson x.type_));
       
  ])

let security_policy_summaries_to_yojson = 
  fun tree -> list_to_yojson security_policy_summary_to_yojson tree

let security_policy_stats_to_yojson = 
  fun (x: security_policy_stats) -> assoc_to_yojson(
    [(
         "NetworkPolicyCount",
         (option_to_yojson base_long_to_yojson x.network_policy_count));
       (
         "EncryptionPolicyCount",
         (option_to_yojson base_long_to_yojson x.encryption_policy_count));
       
  ])

let security_config_summary_to_yojson = 
  fun (x: security_config_summary) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "description",
         (option_to_yojson config_description_to_yojson x.description));
       (
         "configVersion",
         (option_to_yojson policy_version_to_yojson x.config_version));
       (
         "type",
         (option_to_yojson security_config_type_to_yojson x.type_));
       (
         "id",
         (option_to_yojson security_config_id_to_yojson x.id));
       
  ])

let security_config_summaries_to_yojson = 
  fun tree -> list_to_yojson security_config_summary_to_yojson tree

let security_config_stats_to_yojson = 
  fun (x: security_config_stats) -> assoc_to_yojson(
    [(
         "SamlConfigCount",
         (option_to_yojson base_long_to_yojson x.saml_config_count));
       
  ])

let resource_type_to_yojson = 
  fun (x: resource_type) -> match x with 
  | Index -> `String "index"
     

let resource_name_to_yojson = string_to_yojson

let resource_to_yojson = string_to_yojson

let resource_filter_to_yojson = 
  fun tree -> list_to_yojson resource_to_yojson tree

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tags_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "resourceArn",
         (Some (arn_to_yojson x.resource_arn)));
       
  ])

let access_policy_stats_to_yojson = 
  fun (x: access_policy_stats) -> assoc_to_yojson(
    [(
         "DataPolicyCount",
         (option_to_yojson base_long_to_yojson x.data_policy_count));
       
  ])

let lifecycle_policy_stats_to_yojson = 
  fun (x: lifecycle_policy_stats) -> assoc_to_yojson(
    [(
         "RetentionPolicyCount",
         (option_to_yojson base_long_to_yojson x.retention_policy_count));
       
  ])

let get_policies_stats_response_to_yojson = 
  fun (x: get_policies_stats_response) -> assoc_to_yojson(
    [(
         "TotalPolicyCount",
         (option_to_yojson base_long_to_yojson x.total_policy_count));
       (
         "LifecyclePolicyStats",
         (option_to_yojson lifecycle_policy_stats_to_yojson x.lifecycle_policy_stats));
       (
         "SecurityConfigStats",
         (option_to_yojson security_config_stats_to_yojson x.security_config_stats));
       (
         "SecurityPolicyStats",
         (option_to_yojson security_policy_stats_to_yojson x.security_policy_stats));
       (
         "AccessPolicyStats",
         (option_to_yojson access_policy_stats_to_yojson x.access_policy_stats));
       
  ])

let get_policies_stats_request_to_yojson = 
  fun (x: get_policies_stats_request) -> assoc_to_yojson(
    [
  ])

let get_account_settings_response_to_yojson = 
  fun (x: get_account_settings_response) -> assoc_to_yojson(
    [(
         "accountSettingsDetail",
         (option_to_yojson account_settings_detail_to_yojson x.account_settings_detail));
       
  ])

let get_account_settings_request_to_yojson = 
  fun (x: get_account_settings_request) -> assoc_to_yojson(
    [
  ])

let create_security_policy_response_to_yojson = 
  fun (x: create_security_policy_response) -> assoc_to_yojson(
    [(
         "securityPolicyDetail",
         (option_to_yojson security_policy_detail_to_yojson x.security_policy_detail));
       
  ])

let create_security_policy_request_to_yojson = 
  fun (x: create_security_policy_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "policy",
         (Some (policy_document_to_yojson x.policy)));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (security_policy_type_to_yojson x.type_)));
       
  ])

let create_lifecycle_policy_response_to_yojson = 
  fun (x: create_lifecycle_policy_response) -> assoc_to_yojson(
    [(
         "lifecyclePolicyDetail",
         (option_to_yojson lifecycle_policy_detail_to_yojson x.lifecycle_policy_detail));
       
  ])

let create_lifecycle_policy_request_to_yojson = 
  fun (x: create_lifecycle_policy_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "policy",
         (Some (policy_document_to_yojson x.policy)));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (lifecycle_policy_type_to_yojson x.type_)));
       
  ])

let batch_get_vpc_endpoint_response_to_yojson = 
  fun (x: batch_get_vpc_endpoint_response) -> assoc_to_yojson(
    [(
         "vpcEndpointErrorDetails",
         (option_to_yojson vpc_endpoint_error_details_to_yojson x.vpc_endpoint_error_details));
       (
         "vpcEndpointDetails",
         (option_to_yojson vpc_endpoint_details_to_yojson x.vpc_endpoint_details));
       
  ])

let batch_get_vpc_endpoint_request_to_yojson = 
  fun (x: batch_get_vpc_endpoint_request) -> assoc_to_yojson(
    [(
         "ids",
         (Some (vpc_endpoint_ids_to_yojson x.ids)));
       
  ])

let lifecycle_policy_details_to_yojson = 
  fun tree -> list_to_yojson lifecycle_policy_detail_to_yojson tree

let lifecycle_policy_error_detail_to_yojson = 
  fun (x: lifecycle_policy_error_detail) -> assoc_to_yojson(
    [(
         "errorCode",
         (option_to_yojson base_string_to_yojson x.error_code));
       (
         "errorMessage",
         (option_to_yojson base_string_to_yojson x.error_message));
       (
         "name",
         (option_to_yojson policy_name_to_yojson x.name));
       (
         "type",
         (option_to_yojson lifecycle_policy_type_to_yojson x.type_));
       
  ])

let lifecycle_policy_error_details_to_yojson = 
  fun tree -> list_to_yojson lifecycle_policy_error_detail_to_yojson tree

let batch_get_lifecycle_policy_response_to_yojson = 
  fun (x: batch_get_lifecycle_policy_response) -> assoc_to_yojson(
    [(
         "lifecyclePolicyErrorDetails",
         (option_to_yojson lifecycle_policy_error_details_to_yojson x.lifecycle_policy_error_details));
       (
         "lifecyclePolicyDetails",
         (option_to_yojson lifecycle_policy_details_to_yojson x.lifecycle_policy_details));
       
  ])

let lifecycle_policy_identifier_to_yojson = 
  fun (x: lifecycle_policy_identifier) -> assoc_to_yojson(
    [(
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (lifecycle_policy_type_to_yojson x.type_)));
       
  ])

let lifecycle_policy_identifiers_to_yojson = 
  fun tree -> list_to_yojson lifecycle_policy_identifier_to_yojson tree

let batch_get_lifecycle_policy_request_to_yojson = 
  fun (x: batch_get_lifecycle_policy_request) -> assoc_to_yojson(
    [(
         "identifiers",
         (Some (lifecycle_policy_identifiers_to_yojson x.identifiers)));
       
  ])

let base_boolean_to_yojson = bool_to_yojson

let effective_lifecycle_policy_detail_to_yojson = 
  fun (x: effective_lifecycle_policy_detail) -> assoc_to_yojson(
    [(
         "noMinRetentionPeriod",
         (option_to_yojson base_boolean_to_yojson x.no_min_retention_period));
       (
         "retentionPeriod",
         (option_to_yojson base_string_to_yojson x.retention_period));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "policyName",
         (option_to_yojson policy_name_to_yojson x.policy_name));
       (
         "resource",
         (option_to_yojson resource_to_yojson x.resource));
       (
         "type",
         (option_to_yojson lifecycle_policy_type_to_yojson x.type_));
       
  ])

let effective_lifecycle_policy_details_to_yojson = 
  fun tree -> list_to_yojson effective_lifecycle_policy_detail_to_yojson tree

let effective_lifecycle_policy_error_detail_to_yojson = 
  fun (x: effective_lifecycle_policy_error_detail) -> assoc_to_yojson(
    [(
         "errorCode",
         (option_to_yojson base_string_to_yojson x.error_code));
       (
         "errorMessage",
         (option_to_yojson base_string_to_yojson x.error_message));
       (
         "resource",
         (option_to_yojson resource_to_yojson x.resource));
       (
         "type",
         (option_to_yojson lifecycle_policy_type_to_yojson x.type_));
       
  ])

let effective_lifecycle_policy_error_details_to_yojson = 
  fun tree -> list_to_yojson effective_lifecycle_policy_error_detail_to_yojson tree

let batch_get_effective_lifecycle_policy_response_to_yojson = 
  fun (x: batch_get_effective_lifecycle_policy_response) -> assoc_to_yojson(
    [(
         "effectiveLifecyclePolicyErrorDetails",
         (option_to_yojson effective_lifecycle_policy_error_details_to_yojson x.effective_lifecycle_policy_error_details));
       (
         "effectiveLifecyclePolicyDetails",
         (option_to_yojson effective_lifecycle_policy_details_to_yojson x.effective_lifecycle_policy_details));
       
  ])

let lifecycle_policy_resource_identifier_to_yojson = 
  fun (x: lifecycle_policy_resource_identifier) -> assoc_to_yojson(
    [(
         "resource",
         (Some (resource_name_to_yojson x.resource)));
       (
         "type",
         (Some (lifecycle_policy_type_to_yojson x.type_)));
       
  ])

let lifecycle_policy_resource_identifiers_to_yojson = 
  fun tree -> list_to_yojson lifecycle_policy_resource_identifier_to_yojson tree

let batch_get_effective_lifecycle_policy_request_to_yojson = 
  fun (x: batch_get_effective_lifecycle_policy_request) -> assoc_to_yojson(
    [(
         "resourceIdentifiers",
         (Some (lifecycle_policy_resource_identifiers_to_yojson x.resource_identifiers)));
       
  ])

let collection_detail_to_yojson = 
  fun (x: collection_detail) -> assoc_to_yojson(
    [(
         "dashboardEndpoint",
         (option_to_yojson base_string_to_yojson x.dashboard_endpoint));
       (
         "collectionEndpoint",
         (option_to_yojson base_string_to_yojson x.collection_endpoint));
       (
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "standbyReplicas",
         (option_to_yojson standby_replicas_to_yojson x.standby_replicas));
       (
         "kmsKeyArn",
         (option_to_yojson base_string_to_yojson x.kms_key_arn));
       (
         "arn",
         (option_to_yojson base_string_to_yojson x.arn));
       (
         "description",
         (option_to_yojson base_string_to_yojson x.description));
       (
         "type",
         (option_to_yojson collection_type_to_yojson x.type_));
       (
         "status",
         (option_to_yojson collection_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson collection_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson collection_id_to_yojson x.id));
       
  ])

let collection_details_to_yojson = 
  fun tree -> list_to_yojson collection_detail_to_yojson tree

let collection_error_detail_to_yojson = 
  fun (x: collection_error_detail) -> assoc_to_yojson(
    [(
         "errorCode",
         (option_to_yojson base_string_to_yojson x.error_code));
       (
         "errorMessage",
         (option_to_yojson base_string_to_yojson x.error_message));
       (
         "name",
         (option_to_yojson collection_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson collection_id_to_yojson x.id));
       
  ])

let collection_error_details_to_yojson = 
  fun tree -> list_to_yojson collection_error_detail_to_yojson tree

let batch_get_collection_response_to_yojson = 
  fun (x: batch_get_collection_response) -> assoc_to_yojson(
    [(
         "collectionErrorDetails",
         (option_to_yojson collection_error_details_to_yojson x.collection_error_details));
       (
         "collectionDetails",
         (option_to_yojson collection_details_to_yojson x.collection_details));
       
  ])

let collection_ids_to_yojson = 
  fun tree -> list_to_yojson collection_id_to_yojson tree

let collection_names_to_yojson = 
  fun tree -> list_to_yojson collection_name_to_yojson tree

let batch_get_collection_request_to_yojson = 
  fun (x: batch_get_collection_request) -> assoc_to_yojson(
    [(
         "names",
         (option_to_yojson collection_names_to_yojson x.names));
       (
         "ids",
         (option_to_yojson collection_ids_to_yojson x.ids));
       
  ])

let ocu_limit_exceeded_exception_to_yojson = 
  fun (x: ocu_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (Some (base_string_to_yojson x.message)));
       
  ])

let list_vpc_endpoints_response_to_yojson = 
  fun (x: list_vpc_endpoints_response) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "vpcEndpointSummaries",
         (option_to_yojson vpc_endpoint_summaries_to_yojson x.vpc_endpoint_summaries));
       
  ])

let list_vpc_endpoints_request_to_yojson = 
  fun (x: list_vpc_endpoints_request) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson base_integer_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "vpcEndpointFilters",
         (option_to_yojson vpc_endpoint_filters_to_yojson x.vpc_endpoint_filters));
       
  ])

let list_security_policies_response_to_yojson = 
  fun (x: list_security_policies_response) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "securityPolicySummaries",
         (option_to_yojson security_policy_summaries_to_yojson x.security_policy_summaries));
       
  ])

let list_security_policies_request_to_yojson = 
  fun (x: list_security_policies_request) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson base_integer_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "resource",
         (option_to_yojson resource_filter_to_yojson x.resource));
       (
         "type",
         (Some (security_policy_type_to_yojson x.type_)));
       
  ])

let list_security_configs_response_to_yojson = 
  fun (x: list_security_configs_response) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "securityConfigSummaries",
         (option_to_yojson security_config_summaries_to_yojson x.security_config_summaries));
       
  ])

let list_security_configs_request_to_yojson = 
  fun (x: list_security_configs_request) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson base_integer_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "type",
         (Some (security_config_type_to_yojson x.type_)));
       
  ])

let lifecycle_policy_summary_to_yojson = 
  fun (x: lifecycle_policy_summary) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "policyVersion",
         (option_to_yojson policy_version_to_yojson x.policy_version));
       (
         "name",
         (option_to_yojson policy_name_to_yojson x.name));
       (
         "type",
         (option_to_yojson lifecycle_policy_type_to_yojson x.type_));
       
  ])

let lifecycle_policy_summaries_to_yojson = 
  fun tree -> list_to_yojson lifecycle_policy_summary_to_yojson tree

let list_lifecycle_policies_response_to_yojson = 
  fun (x: list_lifecycle_policies_response) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "lifecyclePolicySummaries",
         (option_to_yojson lifecycle_policy_summaries_to_yojson x.lifecycle_policy_summaries));
       
  ])

let lifecycle_resource_to_yojson = string_to_yojson

let lifecycle_resource_filter_to_yojson = 
  fun tree -> list_to_yojson lifecycle_resource_to_yojson tree

let list_lifecycle_policies_request_to_yojson = 
  fun (x: list_lifecycle_policies_request) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson base_integer_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "resources",
         (option_to_yojson lifecycle_resource_filter_to_yojson x.resources));
       (
         "type",
         (Some (lifecycle_policy_type_to_yojson x.type_)));
       
  ])

let collection_summary_to_yojson = 
  fun (x: collection_summary) -> assoc_to_yojson(
    [(
         "arn",
         (option_to_yojson base_string_to_yojson x.arn));
       (
         "status",
         (option_to_yojson collection_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson collection_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson collection_id_to_yojson x.id));
       
  ])

let collection_summaries_to_yojson = 
  fun tree -> list_to_yojson collection_summary_to_yojson tree

let list_collections_response_to_yojson = 
  fun (x: list_collections_response) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "collectionSummaries",
         (option_to_yojson collection_summaries_to_yojson x.collection_summaries));
       
  ])

let collection_filters_to_yojson = 
  fun (x: collection_filters) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson collection_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson collection_name_to_yojson x.name));
       
  ])

let list_collections_request_to_yojson = 
  fun (x: list_collections_request) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson base_integer_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "collectionFilters",
         (option_to_yojson collection_filters_to_yojson x.collection_filters));
       
  ])

let access_policy_summary_to_yojson = 
  fun (x: access_policy_summary) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "policyVersion",
         (option_to_yojson policy_version_to_yojson x.policy_version));
       (
         "name",
         (option_to_yojson policy_name_to_yojson x.name));
       (
         "type",
         (option_to_yojson access_policy_type_to_yojson x.type_));
       
  ])

let access_policy_summaries_to_yojson = 
  fun tree -> list_to_yojson access_policy_summary_to_yojson tree

let list_access_policies_response_to_yojson = 
  fun (x: list_access_policies_response) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "accessPolicySummaries",
         (option_to_yojson access_policy_summaries_to_yojson x.access_policy_summaries));
       
  ])

let list_access_policies_request_to_yojson = 
  fun (x: list_access_policies_request) -> assoc_to_yojson(
    [(
         "maxResults",
         (option_to_yojson base_integer_to_yojson x.max_results));
       (
         "nextToken",
         (option_to_yojson base_string_to_yojson x.next_token));
       (
         "resource",
         (option_to_yojson resource_filter_to_yojson x.resource));
       (
         "type",
         (Some (access_policy_type_to_yojson x.type_)));
       
  ])

let get_security_policy_response_to_yojson = 
  fun (x: get_security_policy_response) -> assoc_to_yojson(
    [(
         "securityPolicyDetail",
         (option_to_yojson security_policy_detail_to_yojson x.security_policy_detail));
       
  ])

let get_security_policy_request_to_yojson = 
  fun (x: get_security_policy_request) -> assoc_to_yojson(
    [(
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (security_policy_type_to_yojson x.type_)));
       
  ])

let get_security_config_response_to_yojson = 
  fun (x: get_security_config_response) -> assoc_to_yojson(
    [(
         "securityConfigDetail",
         (option_to_yojson security_config_detail_to_yojson x.security_config_detail));
       
  ])

let get_security_config_request_to_yojson = 
  fun (x: get_security_config_request) -> assoc_to_yojson(
    [(
         "id",
         (Some (security_config_id_to_yojson x.id)));
       
  ])

let get_access_policy_response_to_yojson = 
  fun (x: get_access_policy_response) -> assoc_to_yojson(
    [(
         "accessPolicyDetail",
         (option_to_yojson access_policy_detail_to_yojson x.access_policy_detail));
       
  ])

let get_access_policy_request_to_yojson = 
  fun (x: get_access_policy_request) -> assoc_to_yojson(
    [(
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (access_policy_type_to_yojson x.type_)));
       
  ])

let delete_vpc_endpoint_detail_to_yojson = 
  fun (x: delete_vpc_endpoint_detail) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson vpc_endpoint_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson vpc_endpoint_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson vpc_endpoint_id_to_yojson x.id));
       
  ])

let delete_vpc_endpoint_response_to_yojson = 
  fun (x: delete_vpc_endpoint_response) -> assoc_to_yojson(
    [(
         "deleteVpcEndpointDetail",
         (option_to_yojson delete_vpc_endpoint_detail_to_yojson x.delete_vpc_endpoint_detail));
       
  ])

let delete_vpc_endpoint_request_to_yojson = 
  fun (x: delete_vpc_endpoint_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "id",
         (Some (vpc_endpoint_id_to_yojson x.id)));
       
  ])

let delete_security_policy_response_to_yojson = 
  fun (x: delete_security_policy_response) -> assoc_to_yojson(
    [
  ])

let delete_security_policy_request_to_yojson = 
  fun (x: delete_security_policy_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (security_policy_type_to_yojson x.type_)));
       
  ])

let delete_security_config_response_to_yojson = 
  fun (x: delete_security_config_response) -> assoc_to_yojson(
    [
  ])

let delete_security_config_request_to_yojson = 
  fun (x: delete_security_config_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "id",
         (Some (security_config_id_to_yojson x.id)));
       
  ])

let delete_lifecycle_policy_response_to_yojson = 
  fun (x: delete_lifecycle_policy_response) -> assoc_to_yojson(
    [
  ])

let delete_lifecycle_policy_request_to_yojson = 
  fun (x: delete_lifecycle_policy_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (lifecycle_policy_type_to_yojson x.type_)));
       
  ])

let delete_collection_detail_to_yojson = 
  fun (x: delete_collection_detail) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson collection_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson collection_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson collection_id_to_yojson x.id));
       
  ])

let delete_collection_response_to_yojson = 
  fun (x: delete_collection_response) -> assoc_to_yojson(
    [(
         "deleteCollectionDetail",
         (option_to_yojson delete_collection_detail_to_yojson x.delete_collection_detail));
       
  ])

let delete_collection_request_to_yojson = 
  fun (x: delete_collection_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "id",
         (Some (collection_id_to_yojson x.id)));
       
  ])

let delete_access_policy_response_to_yojson = 
  fun (x: delete_access_policy_response) -> assoc_to_yojson(
    [
  ])

let delete_access_policy_request_to_yojson = 
  fun (x: delete_access_policy_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (access_policy_type_to_yojson x.type_)));
       
  ])

let create_vpc_endpoint_detail_to_yojson = 
  fun (x: create_vpc_endpoint_detail) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson vpc_endpoint_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson vpc_endpoint_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson vpc_endpoint_id_to_yojson x.id));
       
  ])

let create_vpc_endpoint_response_to_yojson = 
  fun (x: create_vpc_endpoint_response) -> assoc_to_yojson(
    [(
         "createVpcEndpointDetail",
         (option_to_yojson create_vpc_endpoint_detail_to_yojson x.create_vpc_endpoint_detail));
       
  ])

let create_vpc_endpoint_request_to_yojson = 
  fun (x: create_vpc_endpoint_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "securityGroupIds",
         (option_to_yojson security_group_ids_to_yojson x.security_group_ids));
       (
         "subnetIds",
         (Some (subnet_ids_to_yojson x.subnet_ids)));
       (
         "vpcId",
         (Some (vpc_id_to_yojson x.vpc_id)));
       (
         "name",
         (Some (vpc_endpoint_name_to_yojson x.name)));
       
  ])

let create_security_config_response_to_yojson = 
  fun (x: create_security_config_response) -> assoc_to_yojson(
    [(
         "securityConfigDetail",
         (option_to_yojson security_config_detail_to_yojson x.security_config_detail));
       
  ])

let config_name_to_yojson = string_to_yojson

let create_security_config_request_to_yojson = 
  fun (x: create_security_config_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "samlOptions",
         (option_to_yojson saml_config_options_to_yojson x.saml_options));
       (
         "description",
         (option_to_yojson config_description_to_yojson x.description));
       (
         "name",
         (Some (config_name_to_yojson x.name)));
       (
         "type",
         (Some (security_config_type_to_yojson x.type_)));
       
  ])

let create_collection_detail_to_yojson = 
  fun (x: create_collection_detail) -> assoc_to_yojson(
    [(
         "lastModifiedDate",
         (option_to_yojson base_long_to_yojson x.last_modified_date));
       (
         "createdDate",
         (option_to_yojson base_long_to_yojson x.created_date));
       (
         "standbyReplicas",
         (option_to_yojson standby_replicas_to_yojson x.standby_replicas));
       (
         "kmsKeyArn",
         (option_to_yojson base_string_to_yojson x.kms_key_arn));
       (
         "arn",
         (option_to_yojson base_string_to_yojson x.arn));
       (
         "description",
         (option_to_yojson base_string_to_yojson x.description));
       (
         "type",
         (option_to_yojson collection_type_to_yojson x.type_));
       (
         "status",
         (option_to_yojson collection_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson collection_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson collection_id_to_yojson x.id));
       
  ])

let create_collection_response_to_yojson = 
  fun (x: create_collection_response) -> assoc_to_yojson(
    [(
         "createCollectionDetail",
         (option_to_yojson create_collection_detail_to_yojson x.create_collection_detail));
       
  ])

let create_collection_request_to_yojson = 
  fun (x: create_collection_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "standbyReplicas",
         (option_to_yojson standby_replicas_to_yojson x.standby_replicas));
       (
         "tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "description",
         (option_to_yojson base_string_to_yojson x.description));
       (
         "type",
         (option_to_yojson collection_type_to_yojson x.type_));
       (
         "name",
         (Some (collection_name_to_yojson x.name)));
       
  ])

let create_access_policy_response_to_yojson = 
  fun (x: create_access_policy_response) -> assoc_to_yojson(
    [(
         "accessPolicyDetail",
         (option_to_yojson access_policy_detail_to_yojson x.access_policy_detail));
       
  ])

let create_access_policy_request_to_yojson = 
  fun (x: create_access_policy_request) -> assoc_to_yojson(
    [(
         "clientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "policy",
         (Some (policy_document_to_yojson x.policy)));
       (
         "description",
         (option_to_yojson policy_description_to_yojson x.description));
       (
         "name",
         (Some (policy_name_to_yojson x.name)));
       (
         "type",
         (Some (access_policy_type_to_yojson x.type_)));
       
  ])

let base_timestamp_to_yojson = 
  timestamp_to_yojson

