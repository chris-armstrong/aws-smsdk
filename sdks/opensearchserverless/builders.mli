open Types
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
  unit
-> create_access_policy_request

