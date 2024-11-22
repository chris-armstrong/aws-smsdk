open Smaws_Lib
val service : Service.descriptor

type vpc_endpoint_status = | PENDING
  | DELETING
  | ACTIVE
  | FAILED

type vpc_endpoint_summary = {
  status: vpc_endpoint_status option;
  name: string option;
  id: string option
}

type vpc_endpoint_filters = {
  status: vpc_endpoint_status option
}

type vpc_endpoint_error_detail = {
  error_code: string option;
  error_message: string option;
  id: string option
}

type vpc_endpoint_detail = {
  created_date: int option;
  status: vpc_endpoint_status option;
  security_group_ids: string list option;
  subnet_ids: string list option;
  vpc_id: string option;
  name: string option;
  id: string option
}

type validation_exception = {
  message: string option
}

type update_vpc_endpoint_detail = {
  last_modified_date: int option;
  security_group_ids: string list option;
  subnet_ids: string list option;
  status: vpc_endpoint_status option;
  name: string option;
  id: string option
}

type update_vpc_endpoint_response = {
  update_vpc_endpoint_detail: update_vpc_endpoint_detail option
}

type update_vpc_endpoint_request = {
  client_token: string option;
  remove_security_group_ids: string list option;
  add_security_group_ids: string list option;
  remove_subnet_ids: string list option;
  add_subnet_ids: string list option;
  id: string
}

type internal_server_exception = {
  message: string option
}

type conflict_exception = {
  message: string option
}

type security_policy_type = | Encryption
  | Network

type base_document = Json.t

type security_policy_detail = {
  last_modified_date: int option;
  created_date: int option;
  policy: base_document option;
  description: string option;
  policy_version: string option;
  name: string option;
  type_: security_policy_type option
}

type update_security_policy_response = {
  security_policy_detail: security_policy_detail option
}

type update_security_policy_request = {
  client_token: string option;
  policy: string option;
  description: string option;
  policy_version: string;
  name: string;
  type_: security_policy_type
}

type service_quota_exceeded_exception = {
  quota_code: string option;
  service_code: string;
  resource_type: string option;
  resource_id: string option;
  message: string
}

type resource_not_found_exception = {
  message: string option
}

type security_config_type = | Saml

type saml_config_options = {
  session_timeout: int option;
  group_attribute: string option;
  user_attribute: string option;
  metadata: string
}

type security_config_detail = {
  last_modified_date: int option;
  created_date: int option;
  saml_options: saml_config_options option;
  description: string option;
  config_version: string option;
  type_: security_config_type option;
  id: string option
}

type update_security_config_response = {
  security_config_detail: security_config_detail option
}

type update_security_config_request = {
  client_token: string option;
  saml_options: saml_config_options option;
  description: string option;
  config_version: string;
  id: string
}

type lifecycle_policy_type = | Retention

type lifecycle_policy_detail = {
  last_modified_date: int option;
  created_date: int option;
  policy: base_document option;
  description: string option;
  policy_version: string option;
  name: string option;
  type_: lifecycle_policy_type option
}

type update_lifecycle_policy_response = {
  lifecycle_policy_detail: lifecycle_policy_detail option
}

type update_lifecycle_policy_request = {
  client_token: string option;
  policy: string option;
  description: string option;
  policy_version: string;
  name: string;
  type_: lifecycle_policy_type
}

type collection_status = | CREATING
  | DELETING
  | ACTIVE
  | FAILED

type collection_type = | SEARCH
  | TIMESERIES
  | VECTORSEARCH

type update_collection_detail = {
  last_modified_date: int option;
  created_date: int option;
  arn: string option;
  description: string option;
  type_: collection_type option;
  status: collection_status option;
  name: string option;
  id: string option
}

type update_collection_response = {
  update_collection_detail: update_collection_detail option
}

type update_collection_request = {
  client_token: string option;
  description: string option;
  id: string
}

type capacity_limits = {
  max_search_capacity_in_oc_u: int option;
  max_indexing_capacity_in_oc_u: int option
}

type account_settings_detail = {
  capacity_limits: capacity_limits option
}

type update_account_settings_response = {
  account_settings_detail: account_settings_detail option
}

type update_account_settings_request = {
  capacity_limits: capacity_limits option
}

type access_policy_type = | Data

type access_policy_detail = {
  last_modified_date: int option;
  created_date: int option;
  policy: base_document option;
  description: string option;
  policy_version: string option;
  name: string option;
  type_: access_policy_type option
}

type update_access_policy_response = {
  access_policy_detail: access_policy_detail option
}

type update_access_policy_request = {
  client_token: string option;
  policy: string option;
  description: string option;
  policy_version: string;
  name: string;
  type_: access_policy_type
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_arn: string
}

type tag = {
  value: string;
  key: string
}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
  resource_arn: string
}

type standby_replicas = | ENABLED
  | DISABLED

type security_policy_summary = {
  last_modified_date: int option;
  created_date: int option;
  description: string option;
  policy_version: string option;
  name: string option;
  type_: security_policy_type option
}

type security_policy_stats = {
  network_policy_count: int option;
  encryption_policy_count: int option
}

type security_config_summary = {
  last_modified_date: int option;
  created_date: int option;
  description: string option;
  config_version: string option;
  type_: security_config_type option;
  id: string option
}

type security_config_stats = {
  saml_config_count: int option
}

type resource_type = | Index

type list_tags_for_resource_response = {
  tags: tag list option
}

type list_tags_for_resource_request = {
  resource_arn: string
}

type access_policy_stats = {
  data_policy_count: int option
}

type lifecycle_policy_stats = {
  retention_policy_count: int option
}

type get_policies_stats_response = {
  total_policy_count: int option;
  lifecycle_policy_stats: lifecycle_policy_stats option;
  security_config_stats: security_config_stats option;
  security_policy_stats: security_policy_stats option;
  access_policy_stats: access_policy_stats option
}

type get_policies_stats_request = unit

type get_account_settings_response = {
  account_settings_detail: account_settings_detail option
}

type get_account_settings_request = unit

type create_security_policy_response = {
  security_policy_detail: security_policy_detail option
}

type create_security_policy_request = {
  client_token: string option;
  policy: string;
  description: string option;
  name: string;
  type_: security_policy_type
}

type create_lifecycle_policy_response = {
  lifecycle_policy_detail: lifecycle_policy_detail option
}

type create_lifecycle_policy_request = {
  client_token: string option;
  policy: string;
  description: string option;
  name: string;
  type_: lifecycle_policy_type
}

type batch_get_vpc_endpoint_response = {
  vpc_endpoint_error_details: vpc_endpoint_error_detail list option;
  vpc_endpoint_details: vpc_endpoint_detail list option
}

type batch_get_vpc_endpoint_request = {
  ids: string list
}

type lifecycle_policy_error_detail = {
  error_code: string option;
  error_message: string option;
  name: string option;
  type_: lifecycle_policy_type option
}

type batch_get_lifecycle_policy_response = {
  lifecycle_policy_error_details: lifecycle_policy_error_detail list option;
  lifecycle_policy_details: lifecycle_policy_detail list option
}

type lifecycle_policy_identifier = {
  name: string;
  type_: lifecycle_policy_type
}

type batch_get_lifecycle_policy_request = {
  identifiers: lifecycle_policy_identifier list
}

type effective_lifecycle_policy_detail = {
  no_min_retention_period: bool option;
  retention_period: string option;
  resource_type: resource_type option;
  policy_name: string option;
  resource: string option;
  type_: lifecycle_policy_type option
}

type effective_lifecycle_policy_error_detail = {
  error_code: string option;
  error_message: string option;
  resource: string option;
  type_: lifecycle_policy_type option
}

type batch_get_effective_lifecycle_policy_response = {
  effective_lifecycle_policy_error_details: effective_lifecycle_policy_error_detail list option;
  effective_lifecycle_policy_details: effective_lifecycle_policy_detail list option
}

type lifecycle_policy_resource_identifier = {
  resource: string;
  type_: lifecycle_policy_type
}

type batch_get_effective_lifecycle_policy_request = {
  resource_identifiers: lifecycle_policy_resource_identifier list
}

type collection_detail = {
  dashboard_endpoint: string option;
  collection_endpoint: string option;
  last_modified_date: int option;
  created_date: int option;
  standby_replicas: standby_replicas option;
  kms_key_arn: string option;
  arn: string option;
  description: string option;
  type_: collection_type option;
  status: collection_status option;
  name: string option;
  id: string option
}

type collection_error_detail = {
  error_code: string option;
  error_message: string option;
  name: string option;
  id: string option
}

type batch_get_collection_response = {
  collection_error_details: collection_error_detail list option;
  collection_details: collection_detail list option
}

type batch_get_collection_request = {
  names: string list option;
  ids: string list option
}



type ocu_limit_exceeded_exception = {
  message: string
}

type list_vpc_endpoints_response = {
  next_token: string option;
  vpc_endpoint_summaries: vpc_endpoint_summary list option
}

type list_vpc_endpoints_request = {
  max_results: int option;
  next_token: string option;
  vpc_endpoint_filters: vpc_endpoint_filters option
}

type list_security_policies_response = {
  next_token: string option;
  security_policy_summaries: security_policy_summary list option
}

type list_security_policies_request = {
  max_results: int option;
  next_token: string option;
  resource: string list option;
  type_: security_policy_type
}

type list_security_configs_response = {
  next_token: string option;
  security_config_summaries: security_config_summary list option
}

type list_security_configs_request = {
  max_results: int option;
  next_token: string option;
  type_: security_config_type
}

type lifecycle_policy_summary = {
  last_modified_date: int option;
  created_date: int option;
  description: string option;
  policy_version: string option;
  name: string option;
  type_: lifecycle_policy_type option
}

type list_lifecycle_policies_response = {
  next_token: string option;
  lifecycle_policy_summaries: lifecycle_policy_summary list option
}

type list_lifecycle_policies_request = {
  max_results: int option;
  next_token: string option;
  resources: string list option;
  type_: lifecycle_policy_type
}

type collection_summary = {
  arn: string option;
  status: collection_status option;
  name: string option;
  id: string option
}

type list_collections_response = {
  next_token: string option;
  collection_summaries: collection_summary list option
}

type collection_filters = {
  status: collection_status option;
  name: string option
}

type list_collections_request = {
  max_results: int option;
  next_token: string option;
  collection_filters: collection_filters option
}

type access_policy_summary = {
  last_modified_date: int option;
  created_date: int option;
  description: string option;
  policy_version: string option;
  name: string option;
  type_: access_policy_type option
}

type list_access_policies_response = {
  next_token: string option;
  access_policy_summaries: access_policy_summary list option
}

type list_access_policies_request = {
  max_results: int option;
  next_token: string option;
  resource: string list option;
  type_: access_policy_type
}

type get_security_policy_response = {
  security_policy_detail: security_policy_detail option
}

type get_security_policy_request = {
  name: string;
  type_: security_policy_type
}

type get_security_config_response = {
  security_config_detail: security_config_detail option
}

type get_security_config_request = {
  id: string
}

type get_access_policy_response = {
  access_policy_detail: access_policy_detail option
}

type get_access_policy_request = {
  name: string;
  type_: access_policy_type
}

type delete_vpc_endpoint_detail = {
  status: vpc_endpoint_status option;
  name: string option;
  id: string option
}

type delete_vpc_endpoint_response = {
  delete_vpc_endpoint_detail: delete_vpc_endpoint_detail option
}

type delete_vpc_endpoint_request = {
  client_token: string option;
  id: string
}

type delete_security_policy_response = unit

type delete_security_policy_request = {
  client_token: string option;
  name: string;
  type_: security_policy_type
}

type delete_security_config_response = unit

type delete_security_config_request = {
  client_token: string option;
  id: string
}

type delete_lifecycle_policy_response = unit

type delete_lifecycle_policy_request = {
  client_token: string option;
  name: string;
  type_: lifecycle_policy_type
}

type delete_collection_detail = {
  status: collection_status option;
  name: string option;
  id: string option
}

type delete_collection_response = {
  delete_collection_detail: delete_collection_detail option
}

type delete_collection_request = {
  client_token: string option;
  id: string
}

type delete_access_policy_response = unit

type delete_access_policy_request = {
  client_token: string option;
  name: string;
  type_: access_policy_type
}

type create_vpc_endpoint_detail = {
  status: vpc_endpoint_status option;
  name: string option;
  id: string option
}

type create_vpc_endpoint_response = {
  create_vpc_endpoint_detail: create_vpc_endpoint_detail option
}

type create_vpc_endpoint_request = {
  client_token: string option;
  security_group_ids: string list option;
  subnet_ids: string list;
  vpc_id: string;
  name: string
}

type create_security_config_response = {
  security_config_detail: security_config_detail option
}

type create_security_config_request = {
  client_token: string option;
  saml_options: saml_config_options option;
  description: string option;
  name: string;
  type_: security_config_type
}

type create_collection_detail = {
  last_modified_date: int option;
  created_date: int option;
  standby_replicas: standby_replicas option;
  kms_key_arn: string option;
  arn: string option;
  description: string option;
  type_: collection_type option;
  status: collection_status option;
  name: string option;
  id: string option
}

type create_collection_response = {
  create_collection_detail: create_collection_detail option
}

type create_collection_request = {
  client_token: string option;
  standby_replicas: standby_replicas option;
  tags: tag list option;
  description: string option;
  type_: collection_type option;
  name: string
}

type create_access_policy_response = {
  access_policy_detail: access_policy_detail option
}

type create_access_policy_request = {
  client_token: string option;
  policy: string;
  description: string option;
  name: string;
  type_: access_policy_type
}

