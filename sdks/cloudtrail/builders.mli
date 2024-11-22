open Types
val make_update_trail_response :
  ?is_organization_trail:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?log_file_validation_enabled:bool ->
  ?trail_ar_n:string ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_ar_n:string ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  ?name:string ->
  unit -> update_trail_response

val make_update_trail_request :
  ?is_organization_trail:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?enable_log_file_validation:bool ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  name:string ->
  unit -> update_trail_request

val make_advanced_field_selector :
  ?not_ends_with:string list ->
  ?not_starts_with:string list ->
  ?not_equals:string list ->
  ?ends_with:string list ->
  ?starts_with:string list ->
  ?equals:string list ->
  field:string ->
  unit -> advanced_field_selector

val make_advanced_event_selector :
  ?name:string -> field_selectors:advanced_field_selector list -> unit
-> advanced_event_selector

val make_update_event_data_store_response :
  ?federation_role_arn:string ->
  ?federation_status:federation_status ->
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit
-> update_event_data_store_response

val make_update_event_data_store_request :
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?name:string ->
  event_data_store:string ->
  unit -> update_event_data_store_request

val make_destination : location:string -> type_:destination_type -> unit
-> destination

val make_update_channel_response :
  ?destinations:destination list ->
  ?source:string ->
  ?name:string ->
  ?channel_arn:string ->
  unit -> update_channel_response

val make_update_channel_request :
  ?name:string -> ?destinations:destination list -> channel:string -> unit
-> update_channel_request

val make_trail_info :
  ?home_region:string -> ?name:string -> ?trail_ar_n:string -> unit
-> trail_info

val make_trail :
  ?is_organization_trail:bool ->
  ?has_insight_selectors:bool ->
  ?has_custom_event_selectors:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?log_file_validation_enabled:bool ->
  ?trail_ar_n:string ->
  ?home_region:string ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_ar_n:string ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  ?name:string ->
  unit -> trail

val make_tag : ?value:string -> key:string -> unit
-> tag

val make_stop_logging_response : unit
-> stop_logging_response

val make_stop_logging_request : name:string -> unit
-> stop_logging_request

val make_s3_import_source :
  s3_bucket_access_role_arn:string ->
  s3_bucket_region:string ->
  s3_location_uri:string ->
  unit -> s3_import_source

val make_import_source : s3:s3_import_source -> unit
-> import_source

val make_import_statistics :
  ?failed_entries:int ->
  ?events_completed:int ->
  ?files_completed:int ->
  ?prefixes_completed:int ->
  ?prefixes_found:int ->
  unit -> import_statistics

val make_stop_import_response :
  ?import_statistics:import_statistics ->
  ?end_event_time:float ->
  ?start_event_time:float ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?import_status:import_status ->
  ?destinations:string list ->
  ?import_source:import_source ->
  ?import_id:string ->
  unit -> stop_import_response

val make_stop_import_request : import_id:string -> unit
-> stop_import_request

val make_stop_event_data_store_ingestion_response : unit
-> stop_event_data_store_ingestion_response

val make_stop_event_data_store_ingestion_request :
  event_data_store:string -> unit
-> stop_event_data_store_ingestion_request

val make_start_query_response : ?query_id:string -> unit
-> start_query_response

val make_start_query_request :
  ?query_parameters:string list ->
  ?query_alias:string ->
  ?delivery_s3_uri:string ->
  ?query_statement:string ->
  unit -> start_query_request

val make_start_logging_response : unit
-> start_logging_response

val make_start_logging_request : name:string -> unit
-> start_logging_request

val make_start_import_response :
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?import_status:import_status ->
  ?end_event_time:float ->
  ?start_event_time:float ->
  ?import_source:import_source ->
  ?destinations:string list ->
  ?import_id:string ->
  unit -> start_import_response

val make_start_import_request :
  ?import_id:string ->
  ?end_event_time:float ->
  ?start_event_time:float ->
  ?import_source:import_source ->
  ?destinations:string list ->
  unit
-> start_import_request

val make_start_event_data_store_ingestion_response : unit
-> start_event_data_store_ingestion_response

val make_start_event_data_store_ingestion_request :
  event_data_store:string -> unit
-> start_event_data_store_ingestion_request

val make_source_config :
  ?advanced_event_selectors:advanced_event_selector list ->
  ?apply_to_all_regions:bool ->
  unit -> source_config

val make_restore_event_data_store_response :
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit
-> restore_event_data_store_response

val make_restore_event_data_store_request : event_data_store:string -> unit
-> restore_event_data_store_request

val make_resource_tag : ?tags_list:tag list -> ?resource_id:string -> unit
-> resource_tag

val make_resource : ?resource_name:string -> ?resource_type:string -> unit
-> resource

val make_remove_tags_response : unit
-> remove_tags_response

val make_remove_tags_request :
  tags_list:tag list -> resource_id:string -> unit
-> remove_tags_request

val make_register_organization_delegated_admin_response : unit
-> register_organization_delegated_admin_response

val make_register_organization_delegated_admin_request :
  member_account_id:string -> unit
-> register_organization_delegated_admin_request

val make_query_statistics_for_describe_query :
  ?creation_time:float ->
  ?execution_time_in_millis:int ->
  ?bytes_scanned:int ->
  ?events_scanned:int ->
  ?events_matched:int ->
  unit -> query_statistics_for_describe_query

val make_query_statistics :
  ?bytes_scanned:int ->
  ?total_results_count:int ->
  ?results_count:int ->
  unit -> query_statistics

val make_query :
  ?creation_time:float ->
  ?query_status:query_status ->
  ?query_id:string ->
  unit -> query

val make_put_resource_policy_response :
  ?resource_policy:string -> ?resource_arn:string -> unit
-> put_resource_policy_response

val make_put_resource_policy_request :
  resource_policy:string -> resource_arn:string -> unit
-> put_resource_policy_request

val make_insight_selector : ?insight_type:insight_type -> unit
-> insight_selector

val make_put_insight_selectors_response :
  ?insights_destination:string ->
  ?event_data_store_arn:string ->
  ?insight_selectors:insight_selector list ->
  ?trail_ar_n:string ->
  unit
-> put_insight_selectors_response

val make_put_insight_selectors_request :
  ?insights_destination:string ->
  ?event_data_store:string ->
  ?trail_name:string ->
  insight_selectors:insight_selector list ->
  unit -> put_insight_selectors_request

val make_data_resource : ?values:string list -> ?type_:string -> unit
-> data_resource

val make_event_selector :
  ?exclude_management_event_sources:string list ->
  ?data_resources:data_resource list ->
  ?include_management_events:bool ->
  ?read_write_type:read_write_type ->
  unit -> event_selector

val make_put_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selector list ->
  ?event_selectors:event_selector list ->
  ?trail_ar_n:string ->
  unit -> put_event_selectors_response

val make_put_event_selectors_request :
  ?advanced_event_selectors:advanced_event_selector list ->
  ?event_selectors:event_selector list ->
  trail_name:string ->
  unit -> put_event_selectors_request

val make_public_key :
  ?fingerprint:string ->
  ?validity_end_time:float ->
  ?validity_start_time:float ->
  ?value:bytes ->
  unit -> public_key

val make_partition_key : type_:string -> name:string -> unit
-> partition_key

val make_event :
  ?cloud_trail_event:string ->
  ?resources:resource list ->
  ?username:string ->
  ?event_source:string ->
  ?event_time:float ->
  ?access_key_id:string ->
  ?read_only:string ->
  ?event_name:string ->
  ?event_id:string ->
  unit -> event

val make_lookup_events_response :
  ?next_token:string -> ?events:event list -> unit
-> lookup_events_response

val make_lookup_attribute :
  attribute_value:string -> attribute_key:lookup_attribute_key -> unit
-> lookup_attribute

val make_lookup_events_request :
  ?next_token:string ->
  ?max_results:int ->
  ?event_category:event_category ->
  ?end_time:float ->
  ?start_time:float ->
  ?lookup_attributes:lookup_attribute list ->
  unit -> lookup_events_request

val make_list_trails_response :
  ?next_token:string -> ?trails:trail_info list -> unit
-> list_trails_response

val make_list_trails_request : ?next_token:string -> unit
-> list_trails_request

val make_list_tags_response :
  ?next_token:string -> ?resource_tag_list:resource_tag list -> unit
-> list_tags_response

val make_list_tags_request :
  ?next_token:string -> resource_id_list:string list -> unit
-> list_tags_request

val make_list_queries_response :
  ?next_token:string -> ?queries:query list -> unit
-> list_queries_response

val make_list_queries_request :
  ?query_status:query_status ->
  ?end_time:float ->
  ?start_time:float ->
  ?max_results:int ->
  ?next_token:string ->
  event_data_store:string ->
  unit -> list_queries_request

val make_list_public_keys_response :
  ?next_token:string -> ?public_key_list:public_key list -> unit
-> list_public_keys_response

val make_list_public_keys_request :
  ?next_token:string -> ?end_time:float -> ?start_time:float -> unit
-> list_public_keys_request

val make_list_insights_metric_data_response :
  ?next_token:string ->
  ?values:float list ->
  ?timestamps:float list ->
  ?error_code:string ->
  ?insight_type:insight_type ->
  ?event_name:string ->
  ?event_source:string ->
  unit
-> list_insights_metric_data_response

val make_list_insights_metric_data_request :
  ?next_token:string ->
  ?max_results:int ->
  ?data_type:insights_metric_data_type ->
  ?period:int ->
  ?end_time:float ->
  ?start_time:float ->
  ?error_code:string ->
  insight_type:insight_type ->
  event_name:string ->
  event_source:string ->
  unit -> list_insights_metric_data_request

val make_imports_list_item :
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?destinations:string list ->
  ?import_status:import_status ->
  ?import_id:string ->
  unit -> imports_list_item

val make_list_imports_response :
  ?next_token:string -> ?imports:imports_list_item list -> unit
-> list_imports_response

val make_list_imports_request :
  ?next_token:string ->
  ?import_status:import_status ->
  ?destination:string ->
  ?max_results:int ->
  unit -> list_imports_request

val make_import_failure_list_item :
  ?last_updated_time:float ->
  ?error_message:string ->
  ?error_type:string ->
  ?status:import_failure_status ->
  ?location:string ->
  unit -> import_failure_list_item

val make_list_import_failures_response :
  ?next_token:string -> ?failures:import_failure_list_item list -> unit
-> list_import_failures_response

val make_list_import_failures_request :
  ?next_token:string -> ?max_results:int -> import_id:string -> unit
-> list_import_failures_request

val make_event_data_store :
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?termination_protection_enabled:bool ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit -> event_data_store

val make_list_event_data_stores_response :
  ?next_token:string -> ?event_data_stores:event_data_store list -> unit
-> list_event_data_stores_response

val make_list_event_data_stores_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_event_data_stores_request

val make_channel : ?name:string -> ?channel_arn:string -> unit
-> channel

val make_list_channels_response :
  ?next_token:string -> ?channels:channel list -> unit
-> list_channels_response

val make_list_channels_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_channels_request

val make_ingestion_status :
  ?latest_ingestion_attempt_event_i_d:string ->
  ?latest_ingestion_attempt_time:float ->
  ?latest_ingestion_error_code:string ->
  ?latest_ingestion_success_event_i_d:string ->
  ?latest_ingestion_success_time:float ->
  unit -> ingestion_status

val make_get_trail_status_response :
  ?time_logging_stopped:string ->
  ?time_logging_started:string ->
  ?latest_delivery_attempt_succeeded:string ->
  ?latest_notification_attempt_succeeded:string ->
  ?latest_notification_attempt_time:string ->
  ?latest_delivery_attempt_time:string ->
  ?latest_digest_delivery_error:string ->
  ?latest_digest_delivery_time:float ->
  ?latest_cloud_watch_logs_delivery_time:float ->
  ?latest_cloud_watch_logs_delivery_error:string ->
  ?stop_logging_time:float ->
  ?start_logging_time:float ->
  ?latest_notification_time:float ->
  ?latest_delivery_time:float ->
  ?latest_notification_error:string ->
  ?latest_delivery_error:string ->
  ?is_logging:bool ->
  unit -> get_trail_status_response

val make_get_trail_status_request : name:string -> unit
-> get_trail_status_request

val make_get_trail_response : ?trail:trail -> unit
-> get_trail_response

val make_get_trail_request : name:string -> unit
-> get_trail_request

val make_get_resource_policy_response :
  ?resource_policy:string -> ?resource_arn:string -> unit
-> get_resource_policy_response

val make_get_resource_policy_request : resource_arn:string -> unit
-> get_resource_policy_request

val make_get_query_results_response :
  ?error_message:string ->
  ?next_token:string ->
  ?query_result_rows:(string * string) list list list ->
  ?query_statistics:query_statistics ->
  ?query_status:query_status ->
  unit -> get_query_results_response

val make_get_query_results_request :
  ?max_query_results:int ->
  ?next_token:string ->
  ?event_data_store:string ->
  query_id:string ->
  unit -> get_query_results_request

val make_get_insight_selectors_response :
  ?insights_destination:string ->
  ?event_data_store_arn:string ->
  ?insight_selectors:insight_selector list ->
  ?trail_ar_n:string ->
  unit
-> get_insight_selectors_response

val make_get_insight_selectors_request :
  ?event_data_store:string -> ?trail_name:string -> unit
-> get_insight_selectors_request

val make_get_import_response :
  ?import_statistics:import_statistics ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?import_status:import_status ->
  ?end_event_time:float ->
  ?start_event_time:float ->
  ?import_source:import_source ->
  ?destinations:string list ->
  ?import_id:string ->
  unit -> get_import_response

val make_get_import_request : import_id:string -> unit
-> get_import_request

val make_get_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selector list ->
  ?event_selectors:event_selector list ->
  ?trail_ar_n:string ->
  unit -> get_event_selectors_response

val make_get_event_selectors_request : trail_name:string -> unit
-> get_event_selectors_request

val make_get_event_data_store_response :
  ?partition_keys:partition_key list ->
  ?federation_role_arn:string ->
  ?federation_status:federation_status ->
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit
-> get_event_data_store_response

val make_get_event_data_store_request : event_data_store:string -> unit
-> get_event_data_store_request

val make_get_channel_response :
  ?ingestion_status:ingestion_status ->
  ?destinations:destination list ->
  ?source_config:source_config ->
  ?source:string ->
  ?name:string ->
  ?channel_arn:string ->
  unit -> get_channel_response

val make_get_channel_request : channel:string -> unit
-> get_channel_request

val make_enable_federation_response :
  ?federation_role_arn:string ->
  ?federation_status:federation_status ->
  ?event_data_store_arn:string ->
  unit -> enable_federation_response

val make_enable_federation_request :
  federation_role_arn:string -> event_data_store:string -> unit
-> enable_federation_request

val make_disable_federation_response :
  ?federation_status:federation_status ->
  ?event_data_store_arn:string ->
  unit -> disable_federation_response

val make_disable_federation_request : event_data_store:string -> unit
-> disable_federation_request

val make_describe_trails_response : ?trail_list:trail list -> unit
-> describe_trails_response

val make_describe_trails_request :
  ?include_shadow_trails:bool -> ?trail_name_list:string list -> unit
-> describe_trails_request

val make_describe_query_response :
  ?delivery_status:delivery_status ->
  ?delivery_s3_uri:string ->
  ?error_message:string ->
  ?query_statistics:query_statistics_for_describe_query ->
  ?query_status:query_status ->
  ?query_string:string ->
  ?query_id:string ->
  unit -> describe_query_response

val make_describe_query_request :
  ?query_alias:string -> ?query_id:string -> ?event_data_store:string -> unit
-> describe_query_request

val make_deregister_organization_delegated_admin_response : unit
-> deregister_organization_delegated_admin_response

val make_deregister_organization_delegated_admin_request :
  delegated_admin_account_id:string -> unit
-> deregister_organization_delegated_admin_request

val make_delete_trail_response : unit
-> delete_trail_response

val make_delete_trail_request : name:string -> unit
-> delete_trail_request

val make_delete_resource_policy_response : unit
-> delete_resource_policy_response

val make_delete_resource_policy_request : resource_arn:string -> unit
-> delete_resource_policy_request

val make_delete_event_data_store_response : unit
-> delete_event_data_store_response

val make_delete_event_data_store_request : event_data_store:string -> unit
-> delete_event_data_store_request

val make_delete_channel_response : unit
-> delete_channel_response

val make_delete_channel_request : channel:string -> unit
-> delete_channel_request

val make_create_trail_response :
  ?is_organization_trail:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?log_file_validation_enabled:bool ->
  ?trail_ar_n:string ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_ar_n:string ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  ?name:string ->
  unit -> create_trail_response

val make_create_trail_request :
  ?tags_list:tag list ->
  ?is_organization_trail:bool ->
  ?kms_key_id:string ->
  ?cloud_watch_logs_role_arn:string ->
  ?cloud_watch_logs_log_group_arn:string ->
  ?enable_log_file_validation:bool ->
  ?is_multi_region_trail:bool ->
  ?include_global_service_events:bool ->
  ?sns_topic_name:string ->
  ?s3_key_prefix:string ->
  s3_bucket_name:string ->
  name:string ->
  unit -> create_trail_request

val make_create_event_data_store_response :
  ?billing_mode:billing_mode ->
  ?kms_key_id:string ->
  ?updated_timestamp:float ->
  ?created_timestamp:float ->
  ?tags_list:tag list ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  ?status:event_data_store_status ->
  ?name:string ->
  ?event_data_store_arn:string ->
  unit
-> create_event_data_store_response

val make_create_event_data_store_request :
  ?billing_mode:billing_mode ->
  ?start_ingestion:bool ->
  ?kms_key_id:string ->
  ?tags_list:tag list ->
  ?termination_protection_enabled:bool ->
  ?retention_period:int ->
  ?organization_enabled:bool ->
  ?multi_region_enabled:bool ->
  ?advanced_event_selectors:advanced_event_selector list ->
  name:string ->
  unit -> create_event_data_store_request

val make_create_channel_response :
  ?tags:tag list ->
  ?destinations:destination list ->
  ?source:string ->
  ?name:string ->
  ?channel_arn:string ->
  unit -> create_channel_response

val make_create_channel_request :
  ?tags:tag list ->
  destinations:destination list ->
  source:string ->
  name:string ->
  unit -> create_channel_request

val make_cancel_query_response :
  query_status:query_status -> query_id:string -> unit
-> cancel_query_response

val make_cancel_query_request :
  ?event_data_store:string -> query_id:string -> unit
-> cancel_query_request

val make_add_tags_response : unit
-> add_tags_response

val make_add_tags_request : tags_list:tag list -> resource_id:string -> unit
-> add_tags_request

