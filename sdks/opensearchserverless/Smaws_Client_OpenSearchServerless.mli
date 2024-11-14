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

val make_vpc_endpoint_summary :
  ?status:vpc_endpoint_status -> ?name:string -> ?id:string -> unit
-> vpc_endpoint_summary

val make_vpc_endpoint_filters : ?status:vpc_endpoint_status -> unit
-> vpc_endpoint_filters

val make_vpc_endpoint_error_detail :
  ?error_code:string -> ?error_message:string -> ?id:string -> unit
-> vpc_endpoint_error_detail

val make_vpc_endpoint_detail :
  ?created_date:int ->
  ?status:vpc_endpoint_status ->
  ?security_group_ids:string list ->
  ?subnet_ids:string list ->
  ?vpc_id:string ->
  ?name:string ->
  ?id:string ->
  unit -> vpc_endpoint_detail

val make_update_vpc_endpoint_detail :
  ?last_modified_date:int ->
  ?security_group_ids:string list ->
  ?subnet_ids:string list ->
  ?status:vpc_endpoint_status ->
  ?name:string ->
  ?id:string ->
  unit -> update_vpc_endpoint_detail

val make_update_vpc_endpoint_response :
  ?update_vpc_endpoint_detail:update_vpc_endpoint_detail -> unit
-> update_vpc_endpoint_response

val make_update_vpc_endpoint_request :
  ?client_token:string ->
  ?remove_security_group_ids:string list ->
  ?add_security_group_ids:string list ->
  ?remove_subnet_ids:string list ->
  ?add_subnet_ids:string list ->
  id:string ->
  unit -> update_vpc_endpoint_request

val make_security_policy_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?policy:base_document ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:security_policy_type ->
  unit -> security_policy_detail

val make_update_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit
-> update_security_policy_response

val make_update_security_policy_request :
  ?client_token:string ->
  ?policy:string ->
  ?description:string ->
  policy_version:string ->
  name:string ->
  type_:security_policy_type ->
  unit -> update_security_policy_request

val make_saml_config_options :
  ?session_timeout:int ->
  ?group_attribute:string ->
  ?user_attribute:string ->
  metadata:string ->
  unit -> saml_config_options

val make_security_config_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?saml_options:saml_config_options ->
  ?description:string ->
  ?config_version:string ->
  ?type_:security_config_type ->
  ?id:string ->
  unit -> security_config_detail

val make_update_security_config_response :
  ?security_config_detail:security_config_detail -> unit
-> update_security_config_response

val make_update_security_config_request :
  ?client_token:string ->
  ?saml_options:saml_config_options ->
  ?description:string ->
  config_version:string ->
  id:string ->
  unit -> update_security_config_request

val make_lifecycle_policy_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?policy:base_document ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:lifecycle_policy_type ->
  unit -> lifecycle_policy_detail

val make_update_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail -> unit
-> update_lifecycle_policy_response

val make_update_lifecycle_policy_request :
  ?client_token:string ->
  ?policy:string ->
  ?description:string ->
  policy_version:string ->
  name:string ->
  type_:lifecycle_policy_type ->
  unit -> update_lifecycle_policy_request

val make_update_collection_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?arn:string ->
  ?description:string ->
  ?type_:collection_type ->
  ?status:collection_status ->
  ?name:string ->
  ?id:string ->
  unit -> update_collection_detail

val make_update_collection_response :
  ?update_collection_detail:update_collection_detail -> unit
-> update_collection_response

val make_update_collection_request :
  ?client_token:string -> ?description:string -> id:string -> unit
-> update_collection_request

val make_capacity_limits :
  ?max_search_capacity_in_oc_u:int ->
  ?max_indexing_capacity_in_oc_u:int ->
  unit -> capacity_limits

val make_account_settings_detail : ?capacity_limits:capacity_limits -> unit
-> account_settings_detail

val make_update_account_settings_response :
  ?account_settings_detail:account_settings_detail -> unit
-> update_account_settings_response

val make_update_account_settings_request :
  ?capacity_limits:capacity_limits -> unit
-> update_account_settings_request

val make_access_policy_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?policy:base_document ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:access_policy_type ->
  unit -> access_policy_detail

val make_update_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit
-> update_access_policy_response

val make_update_access_policy_request :
  ?client_token:string ->
  ?policy:string ->
  ?description:string ->
  policy_version:string ->
  name:string ->
  type_:access_policy_type ->
  unit -> update_access_policy_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_request

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_request : tags:tag list -> resource_arn:string -> unit
-> tag_resource_request

val make_security_policy_summary :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:security_policy_type ->
  unit -> security_policy_summary

val make_security_policy_stats :
  ?network_policy_count:int -> ?encryption_policy_count:int -> unit
-> security_policy_stats

val make_security_config_summary :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?description:string ->
  ?config_version:string ->
  ?type_:security_config_type ->
  ?id:string ->
  unit -> security_config_summary

val make_security_config_stats : ?saml_config_count:int -> unit
-> security_config_stats

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:string -> unit
-> list_tags_for_resource_request

val make_access_policy_stats : ?data_policy_count:int -> unit
-> access_policy_stats

val make_lifecycle_policy_stats : ?retention_policy_count:int -> unit
-> lifecycle_policy_stats

val make_get_policies_stats_response :
  ?total_policy_count:int ->
  ?lifecycle_policy_stats:lifecycle_policy_stats ->
  ?security_config_stats:security_config_stats ->
  ?security_policy_stats:security_policy_stats ->
  ?access_policy_stats:access_policy_stats ->
  unit -> get_policies_stats_response

val make_get_policies_stats_request : unit
-> get_policies_stats_request

val make_get_account_settings_response :
  ?account_settings_detail:account_settings_detail -> unit
-> get_account_settings_response

val make_get_account_settings_request : unit
-> get_account_settings_request

val make_create_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit
-> create_security_policy_response

val make_create_security_policy_request :
  ?client_token:string ->
  ?description:string ->
  policy:string ->
  name:string ->
  type_:security_policy_type ->
  unit
-> create_security_policy_request

val make_create_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail -> unit
-> create_lifecycle_policy_response

val make_create_lifecycle_policy_request :
  ?client_token:string ->
  ?description:string ->
  policy:string ->
  name:string ->
  type_:lifecycle_policy_type ->
  unit
-> create_lifecycle_policy_request

val make_batch_get_vpc_endpoint_response :
  ?vpc_endpoint_error_details:vpc_endpoint_error_detail list ->
  ?vpc_endpoint_details:vpc_endpoint_detail list ->
  unit
-> batch_get_vpc_endpoint_response

val make_batch_get_vpc_endpoint_request : ids:string list -> unit
-> batch_get_vpc_endpoint_request

val make_lifecycle_policy_error_detail :
  ?error_code:string ->
  ?error_message:string ->
  ?name:string ->
  ?type_:lifecycle_policy_type ->
  unit
-> lifecycle_policy_error_detail

val make_batch_get_lifecycle_policy_response :
  ?lifecycle_policy_error_details:lifecycle_policy_error_detail list ->
  ?lifecycle_policy_details:lifecycle_policy_detail list ->
  unit
-> batch_get_lifecycle_policy_response

val make_lifecycle_policy_identifier :
  name:string -> type_:lifecycle_policy_type -> unit
-> lifecycle_policy_identifier

val make_batch_get_lifecycle_policy_request :
  identifiers:lifecycle_policy_identifier list -> unit
-> batch_get_lifecycle_policy_request

val make_effective_lifecycle_policy_detail :
  ?no_min_retention_period:bool ->
  ?retention_period:string ->
  ?resource_type:resource_type ->
  ?policy_name:string ->
  ?resource:string ->
  ?type_:lifecycle_policy_type ->
  unit
-> effective_lifecycle_policy_detail

val make_effective_lifecycle_policy_error_detail :
  ?error_code:string ->
  ?error_message:string ->
  ?resource:string ->
  ?type_:lifecycle_policy_type ->
  unit
-> effective_lifecycle_policy_error_detail

val make_batch_get_effective_lifecycle_policy_response :
  ?effective_lifecycle_policy_error_details:effective_lifecycle_policy_error_detail list ->
  ?effective_lifecycle_policy_details:effective_lifecycle_policy_detail list ->
  unit
-> batch_get_effective_lifecycle_policy_response

val make_lifecycle_policy_resource_identifier :
  resource:string -> type_:lifecycle_policy_type -> unit
-> lifecycle_policy_resource_identifier

val make_batch_get_effective_lifecycle_policy_request :
  resource_identifiers:lifecycle_policy_resource_identifier list -> unit
-> batch_get_effective_lifecycle_policy_request

val make_collection_detail :
  ?dashboard_endpoint:string ->
  ?collection_endpoint:string ->
  ?last_modified_date:int ->
  ?created_date:int ->
  ?standby_replicas:standby_replicas ->
  ?kms_key_arn:string ->
  ?arn:string ->
  ?description:string ->
  ?type_:collection_type ->
  ?status:collection_status ->
  ?name:string ->
  ?id:string ->
  unit -> collection_detail

val make_collection_error_detail :
  ?error_code:string ->
  ?error_message:string ->
  ?name:string ->
  ?id:string ->
  unit -> collection_error_detail

val make_batch_get_collection_response :
  ?collection_error_details:collection_error_detail list ->
  ?collection_details:collection_detail list ->
  unit
-> batch_get_collection_response

val make_batch_get_collection_request :
  ?names:string list -> ?ids:string list -> unit
-> batch_get_collection_request

val make_list_vpc_endpoints_response :
  ?next_token:string ->
  ?vpc_endpoint_summaries:vpc_endpoint_summary list ->
  unit -> list_vpc_endpoints_response

val make_list_vpc_endpoints_request :
  ?max_results:int ->
  ?next_token:string ->
  ?vpc_endpoint_filters:vpc_endpoint_filters ->
  unit
-> list_vpc_endpoints_request

val make_list_security_policies_response :
  ?next_token:string ->
  ?security_policy_summaries:security_policy_summary list ->
  unit
-> list_security_policies_response

val make_list_security_policies_request :
  ?max_results:int ->
  ?next_token:string ->
  ?resource:string list ->
  type_:security_policy_type ->
  unit
-> list_security_policies_request

val make_list_security_configs_response :
  ?next_token:string ->
  ?security_config_summaries:security_config_summary list ->
  unit
-> list_security_configs_response

val make_list_security_configs_request :
  ?max_results:int ->
  ?next_token:string ->
  type_:security_config_type ->
  unit -> list_security_configs_request

val make_lifecycle_policy_summary :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:lifecycle_policy_type ->
  unit -> lifecycle_policy_summary

val make_list_lifecycle_policies_response :
  ?next_token:string ->
  ?lifecycle_policy_summaries:lifecycle_policy_summary list ->
  unit
-> list_lifecycle_policies_response

val make_list_lifecycle_policies_request :
  ?max_results:int ->
  ?next_token:string ->
  ?resources:string list ->
  type_:lifecycle_policy_type ->
  unit -> list_lifecycle_policies_request

val make_collection_summary :
  ?arn:string ->
  ?status:collection_status ->
  ?name:string ->
  ?id:string ->
  unit -> collection_summary

val make_list_collections_response :
  ?next_token:string -> ?collection_summaries:collection_summary list -> unit
-> list_collections_response

val make_collection_filters :
  ?status:collection_status -> ?name:string -> unit
-> collection_filters

val make_list_collections_request :
  ?max_results:int ->
  ?next_token:string ->
  ?collection_filters:collection_filters ->
  unit -> list_collections_request

val make_access_policy_summary :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:access_policy_type ->
  unit -> access_policy_summary

val make_list_access_policies_response :
  ?next_token:string ->
  ?access_policy_summaries:access_policy_summary list ->
  unit
-> list_access_policies_response

val make_list_access_policies_request :
  ?max_results:int ->
  ?next_token:string ->
  ?resource:string list ->
  type_:access_policy_type ->
  unit -> list_access_policies_request

val make_get_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit
-> get_security_policy_response

val make_get_security_policy_request :
  name:string -> type_:security_policy_type -> unit
-> get_security_policy_request

val make_get_security_config_response :
  ?security_config_detail:security_config_detail -> unit
-> get_security_config_response

val make_get_security_config_request : id:string -> unit
-> get_security_config_request

val make_get_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit
-> get_access_policy_response

val make_get_access_policy_request :
  name:string -> type_:access_policy_type -> unit
-> get_access_policy_request

val make_delete_vpc_endpoint_detail :
  ?status:vpc_endpoint_status -> ?name:string -> ?id:string -> unit
-> delete_vpc_endpoint_detail

val make_delete_vpc_endpoint_response :
  ?delete_vpc_endpoint_detail:delete_vpc_endpoint_detail -> unit
-> delete_vpc_endpoint_response

val make_delete_vpc_endpoint_request :
  ?client_token:string -> id:string -> unit
-> delete_vpc_endpoint_request

val make_delete_security_policy_response : unit
-> delete_security_policy_response

val make_delete_security_policy_request :
  ?client_token:string -> name:string -> type_:security_policy_type -> unit
-> delete_security_policy_request

val make_delete_security_config_response : unit
-> delete_security_config_response

val make_delete_security_config_request :
  ?client_token:string -> id:string -> unit
-> delete_security_config_request

val make_delete_lifecycle_policy_response : unit
-> delete_lifecycle_policy_response

val make_delete_lifecycle_policy_request :
  ?client_token:string -> name:string -> type_:lifecycle_policy_type -> unit
-> delete_lifecycle_policy_request

val make_delete_collection_detail :
  ?status:collection_status -> ?name:string -> ?id:string -> unit
-> delete_collection_detail

val make_delete_collection_response :
  ?delete_collection_detail:delete_collection_detail -> unit
-> delete_collection_response

val make_delete_collection_request :
  ?client_token:string -> id:string -> unit
-> delete_collection_request

val make_delete_access_policy_response : unit
-> delete_access_policy_response

val make_delete_access_policy_request :
  ?client_token:string -> name:string -> type_:access_policy_type -> unit
-> delete_access_policy_request

val make_create_vpc_endpoint_detail :
  ?status:vpc_endpoint_status -> ?name:string -> ?id:string -> unit
-> create_vpc_endpoint_detail

val make_create_vpc_endpoint_response :
  ?create_vpc_endpoint_detail:create_vpc_endpoint_detail -> unit
-> create_vpc_endpoint_response

val make_create_vpc_endpoint_request :
  ?client_token:string ->
  ?security_group_ids:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  name:string ->
  unit
-> create_vpc_endpoint_request

val make_create_security_config_response :
  ?security_config_detail:security_config_detail -> unit
-> create_security_config_response

val make_create_security_config_request :
  ?client_token:string ->
  ?saml_options:saml_config_options ->
  ?description:string ->
  name:string ->
  type_:security_config_type ->
  unit -> create_security_config_request

val make_create_collection_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?standby_replicas:standby_replicas ->
  ?kms_key_arn:string ->
  ?arn:string ->
  ?description:string ->
  ?type_:collection_type ->
  ?status:collection_status ->
  ?name:string ->
  ?id:string ->
  unit -> create_collection_detail

val make_create_collection_response :
  ?create_collection_detail:create_collection_detail -> unit
-> create_collection_response

val make_create_collection_request :
  ?client_token:string ->
  ?standby_replicas:standby_replicas ->
  ?tags:tag list ->
  ?description:string ->
  ?type_:collection_type ->
  name:string ->
  unit -> create_collection_request

val make_create_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit
-> create_access_policy_response

val make_create_access_policy_request :
  ?client_token:string ->
  ?description:string ->
  policy:string ->
  name:string ->
  type_:access_policy_type ->
  unit -> create_access_policy_request

module UpdateVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      update_vpc_endpoint_request ->
        (update_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_policy_request ->
        (update_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_config_request ->
        (update_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      update_lifecycle_policy_request ->
        (update_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_collection_request ->
        (update_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_account_settings_request ->
        (update_account_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      update_access_policy_request ->
        (update_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetPoliciesStats : sig
  val request :
    Smaws_Lib.Context.t ->
      get_policies_stats_request ->
        (get_policies_stats_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            
        ]
      ) result
end

module GetAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      get_account_settings_request ->
        (get_account_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_policy_request ->
        (create_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      create_lifecycle_policy_request ->
        (create_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchGetVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_vpc_endpoint_request ->
        (batch_get_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchGetLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_lifecycle_policy_request ->
        (batch_get_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchGetEffectiveLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_effective_lifecycle_policy_request ->
        (batch_get_effective_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchGetCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_collection_request ->
        (batch_get_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListVpcEndpoints : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_endpoints_request ->
        (list_vpc_endpoints_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListSecurityPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_policies_request ->
        (list_security_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListSecurityConfigs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_configs_request ->
        (list_security_configs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListLifecyclePolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_lifecycle_policies_request ->
        (list_lifecycle_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListCollections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_collections_request ->
        (list_collections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListAccessPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_policies_request ->
        (list_access_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_policy_request ->
        (get_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_config_request ->
        (get_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_policy_request ->
        (get_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_endpoint_request ->
        (delete_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_policy_request ->
        (delete_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_config_request ->
        (delete_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_lifecycle_policy_request ->
        (delete_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_collection_request ->
        (delete_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_policy_request ->
        (delete_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_endpoint_request ->
        (create_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_config_request ->
        (create_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_collection_request ->
        (create_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `OcuLimitExceededException of ocu_limit_exceeded_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      create_access_policy_request ->
        (create_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

