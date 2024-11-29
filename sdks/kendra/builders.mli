open Types
val make_data_source_to_index_field_mapping :
  ?date_field_format:string ->
  index_field_name:string ->
  data_source_field_name:string ->
  unit
-> data_source_to_index_field_mapping
(** Create a {!type-data_source_to_index_field_mapping} type *)

val make_work_docs_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?use_change_log:bool ->
  ?crawl_comments:bool ->
  organization_id:string ->
  unit
-> work_docs_configuration
(** Create a {!type-work_docs_configuration} type *)

val make_seed_url_configuration :
  ?web_crawler_mode:web_crawler_mode -> seed_urls:string list -> unit
-> seed_url_configuration
(** Create a {!type-seed_url_configuration} type *)

val make_site_maps_configuration : site_maps:string list -> unit
-> site_maps_configuration
(** Create a {!type-site_maps_configuration} type *)

val make_urls :
  ?site_maps_configuration:site_maps_configuration ->
  ?seed_url_configuration:seed_url_configuration ->
  unit -> urls
(** Create a {!type-urls} type *)

val make_proxy_configuration :
  ?credentials:string -> port:int -> host:string -> unit
-> proxy_configuration
(** Create a {!type-proxy_configuration} type *)

val make_basic_authentication_configuration :
  credentials:string -> port:int -> host:string -> unit
-> basic_authentication_configuration
(** Create a {!type-basic_authentication_configuration} type *)

val make_authentication_configuration :
  ?basic_authentication:basic_authentication_configuration list -> unit
-> authentication_configuration
(** Create a {!type-authentication_configuration} type *)

val make_web_crawler_configuration :
  ?authentication_configuration:authentication_configuration ->
  ?proxy_configuration:proxy_configuration ->
  ?url_exclusion_patterns:string list ->
  ?url_inclusion_patterns:string list ->
  ?max_urls_per_minute_crawl_rate:int ->
  ?max_content_size_per_page_in_mega_bytes:float ->
  ?max_links_per_page:int ->
  ?crawl_depth:int ->
  urls:urls ->
  unit
-> web_crawler_configuration
(** Create a {!type-web_crawler_configuration} type *)

val make_warning : ?code:warning_code -> ?message:string -> unit
-> warning
(** Create a {!type-warning} type *)

val make_jwt_token_type_configuration :
  ?claim_regex:string ->
  ?issuer:string ->
  ?group_attribute_field:string ->
  ?user_name_attribute_field:string ->
  ?secret_manager_arn:string ->
  ?ur_l:string ->
  key_location:key_location ->
  unit
-> jwt_token_type_configuration
(** Create a {!type-jwt_token_type_configuration} type *)

val make_json_token_type_configuration :
  group_attribute_field:string -> user_name_attribute_field:string -> unit
-> json_token_type_configuration
(** Create a {!type-json_token_type_configuration} type *)

val make_user_token_configuration :
  ?json_token_type_configuration:json_token_type_configuration ->
  ?jwt_token_type_configuration:jwt_token_type_configuration ->
  unit
-> user_token_configuration
(** Create a {!type-user_token_configuration} type *)

val make_user_identity_configuration :
  ?identity_attribute_name:string -> unit
-> user_identity_configuration
(** Create a {!type-user_identity_configuration} type *)

val make_user_group_resolution_configuration :
  user_group_resolution_mode:user_group_resolution_mode -> unit
-> user_group_resolution_configuration
(** Create a {!type-user_group_resolution_configuration} type *)

val make_data_source_group : data_source_id:string -> group_id:string -> unit
-> data_source_group
(** Create a {!type-data_source_group} type *)

val make_user_context :
  ?data_source_groups:data_source_group list ->
  ?groups:string list ->
  ?user_id:string ->
  ?token:string ->
  unit
-> user_context
(** Create a {!type-user_context} type *)

val make_s3_path : key:string -> bucket:string -> unit
-> s3_path
(** Create a {!type-s3_path} type *)

val make_update_thesaurus_request :
  ?source_s3_path:s3_path ->
  ?role_arn:string ->
  ?description:string ->
  ?name:string ->
  index_id:string ->
  id:string ->
  unit
-> update_thesaurus_request
(** Create a {!type-update_thesaurus_request} type *)

val make_suggestable_config :
  ?suggestable:bool -> ?attribute_name:string -> unit
-> suggestable_config
(** Create a {!type-suggestable_config} type *)

val make_attribute_suggestions_update_config :
  ?attribute_suggestions_mode:attribute_suggestions_mode ->
  ?suggestable_config_list:suggestable_config list ->
  unit
-> attribute_suggestions_update_config
(** Create a {!type-attribute_suggestions_update_config} type *)

val make_update_query_suggestions_config_request :
  ?attribute_suggestions_config:attribute_suggestions_update_config ->
  ?minimum_query_count:int ->
  ?minimum_number_of_querying_users:int ->
  ?include_queries_without_user_information:bool ->
  ?query_log_look_back_window_in_days:int ->
  ?mode:mode ->
  index_id:string ->
  unit
-> update_query_suggestions_config_request
(** Create a {!type-update_query_suggestions_config_request} type *)

val make_update_query_suggestions_block_list_request :
  ?role_arn:string ->
  ?source_s3_path:s3_path ->
  ?description:string ->
  ?name:string ->
  id:string ->
  index_id:string ->
  unit
-> update_query_suggestions_block_list_request
(** Create a {!type-update_query_suggestions_block_list_request} type *)

val make_relevance :
  ?value_importance_map:(string * int) list ->
  ?rank_order:order ->
  ?duration:string ->
  ?importance:int ->
  ?freshness:bool ->
  unit -> relevance
(** Create a {!type-relevance} type *)

val make_search :
  ?sortable:bool ->
  ?displayable:bool ->
  ?searchable:bool ->
  ?facetable:bool ->
  unit
-> search
(** Create a {!type-search} type *)

val make_document_metadata_configuration :
  ?search:search ->
  ?relevance:relevance ->
  type_:document_attribute_value_type ->
  name:string ->
  unit
-> document_metadata_configuration
(** Create a {!type-document_metadata_configuration} type *)

val make_capacity_units_configuration :
  query_capacity_units:int -> storage_capacity_units:int -> unit
-> capacity_units_configuration
(** Create a {!type-capacity_units_configuration} type *)

val make_update_index_request :
  ?user_group_resolution_configuration:user_group_resolution_configuration ->
  ?user_context_policy:user_context_policy ->
  ?user_token_configurations:user_token_configuration list ->
  ?capacity_units:capacity_units_configuration ->
  ?document_metadata_configuration_updates:document_metadata_configuration list ->
  ?description:string ->
  ?role_arn:string ->
  ?name:string ->
  id:string ->
  unit
-> update_index_request
(** Create a {!type-update_index_request} type *)

val make_featured_document : ?id:string -> unit
-> featured_document
(** Create a {!type-featured_document} type *)

val make_featured_results_set :
  ?creation_timestamp:int ->
  ?last_updated_timestamp:int ->
  ?featured_documents:featured_document list ->
  ?query_texts:string list ->
  ?status:featured_results_set_status ->
  ?description:string ->
  ?featured_results_set_name:string ->
  ?featured_results_set_id:string ->
  unit
-> featured_results_set
(** Create a {!type-featured_results_set} type *)

val make_update_featured_results_set_response :
  ?featured_results_set:featured_results_set -> unit
-> update_featured_results_set_response
(** Create a {!type-update_featured_results_set_response} type *)

val make_update_featured_results_set_request :
  ?featured_documents:featured_document list ->
  ?query_texts:string list ->
  ?status:featured_results_set_status ->
  ?description:string ->
  ?featured_results_set_name:string ->
  featured_results_set_id:string ->
  index_id:string ->
  unit
-> update_featured_results_set_request
(** Create a {!type-update_featured_results_set_request} type *)

val make_conflicting_item :
  ?set_id:string -> ?set_name:string -> ?query_text:string -> unit
-> conflicting_item
(** Create a {!type-conflicting_item} type *)

val make_content_source_configuration :
  ?direct_put_content:bool ->
  ?faq_ids:string list ->
  ?data_source_ids:string list ->
  unit
-> content_source_configuration
(** Create a {!type-content_source_configuration} type *)

val make_experience_configuration :
  ?user_identity_configuration:user_identity_configuration ->
  ?content_source_configuration:content_source_configuration ->
  unit
-> experience_configuration
(** Create a {!type-experience_configuration} type *)

val make_update_experience_request :
  ?description:string ->
  ?configuration:experience_configuration ->
  ?role_arn:string ->
  ?name:string ->
  index_id:string ->
  id:string ->
  unit
-> update_experience_request
(** Create a {!type-update_experience_request} type *)

val make_documents_metadata_configuration : ?s3_prefix:string -> unit
-> documents_metadata_configuration
(** Create a {!type-documents_metadata_configuration} type *)

val make_access_control_list_configuration : ?key_path:string -> unit
-> access_control_list_configuration
(** Create a {!type-access_control_list_configuration} type *)

val make_s3_data_source_configuration :
  ?access_control_list_configuration:access_control_list_configuration ->
  ?documents_metadata_configuration:documents_metadata_configuration ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?inclusion_prefixes:string list ->
  bucket_name:string ->
  unit
-> s3_data_source_configuration
(** Create a {!type-s3_data_source_configuration} type *)

val make_data_source_vpc_configuration :
  security_group_ids:string list -> subnet_ids:string list -> unit
-> data_source_vpc_configuration
(** Create a {!type-data_source_vpc_configuration} type *)

val make_share_point_configuration :
  ?proxy_configuration:proxy_configuration ->
  ?authentication_type:share_point_online_authentication_type ->
  ?ssl_certificate_s3_path:s3_path ->
  ?disable_local_groups:bool ->
  ?document_title_field_name:string ->
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?use_change_log:bool ->
  ?crawl_attachments:bool ->
  secret_arn:string ->
  urls:string list ->
  share_point_version:share_point_version ->
  unit
-> share_point_configuration
(** Create a {!type-share_point_configuration} type *)

val make_connection_configuration :
  secret_arn:string ->
  table_name:string ->
  database_name:string ->
  database_port:int ->
  database_host:string ->
  unit
-> connection_configuration
(** Create a {!type-connection_configuration} type *)

val make_column_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_column_name:string ->
  change_detecting_columns:string list ->
  document_data_column_name:string ->
  document_id_column_name:string ->
  unit
-> column_configuration
(** Create a {!type-column_configuration} type *)

val make_acl_configuration : allowed_groups_column_name:string -> unit
-> acl_configuration
(** Create a {!type-acl_configuration} type *)

val make_sql_configuration :
  ?query_identifiers_enclosing_option:query_identifiers_enclosing_option ->
  unit
-> sql_configuration
(** Create a {!type-sql_configuration} type *)

val make_database_configuration :
  ?sql_configuration:sql_configuration ->
  ?acl_configuration:acl_configuration ->
  ?vpc_configuration:data_source_vpc_configuration ->
  column_configuration:column_configuration ->
  connection_configuration:connection_configuration ->
  database_engine_type:database_engine_type ->
  unit
-> database_configuration
(** Create a {!type-database_configuration} type *)

val make_salesforce_standard_object_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  document_data_field_name:string ->
  name:salesforce_standard_object_name ->
  unit
-> salesforce_standard_object_configuration
(** Create a {!type-salesforce_standard_object_configuration} type *)

val make_salesforce_standard_knowledge_article_type_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  document_data_field_name:string ->
  unit
-> salesforce_standard_knowledge_article_type_configuration
(** Create a {!type-salesforce_standard_knowledge_article_type_configuration} type *)

val make_salesforce_custom_knowledge_article_type_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  document_data_field_name:string ->
  name:string ->
  unit
-> salesforce_custom_knowledge_article_type_configuration
(** Create a {!type-salesforce_custom_knowledge_article_type_configuration} type *)

val make_salesforce_knowledge_article_configuration :
  ?custom_knowledge_article_type_configurations:salesforce_custom_knowledge_article_type_configuration list ->
  ?standard_knowledge_article_type_configuration:salesforce_standard_knowledge_article_type_configuration ->
  included_states:salesforce_knowledge_article_state list ->
  unit
-> salesforce_knowledge_article_configuration
(** Create a {!type-salesforce_knowledge_article_configuration} type *)

val make_salesforce_chatter_feed_configuration :
  ?include_filter_types:salesforce_chatter_feed_include_filter_type list ->
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  document_data_field_name:string ->
  unit
-> salesforce_chatter_feed_configuration
(** Create a {!type-salesforce_chatter_feed_configuration} type *)

val make_salesforce_standard_object_attachment_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  unit
-> salesforce_standard_object_attachment_configuration
(** Create a {!type-salesforce_standard_object_attachment_configuration} type *)

val make_salesforce_configuration :
  ?exclude_attachment_file_patterns:string list ->
  ?include_attachment_file_patterns:string list ->
  ?standard_object_attachment_configuration:salesforce_standard_object_attachment_configuration ->
  ?crawl_attachments:bool ->
  ?chatter_feed_configuration:salesforce_chatter_feed_configuration ->
  ?knowledge_article_configuration:salesforce_knowledge_article_configuration ->
  ?standard_object_configurations:salesforce_standard_object_configuration list ->
  secret_arn:string ->
  server_url:string ->
  unit
-> salesforce_configuration
(** Create a {!type-salesforce_configuration} type *)

val make_one_drive_users :
  ?one_drive_user_s3_path:s3_path -> ?one_drive_user_list:string list -> unit
-> one_drive_users
(** Create a {!type-one_drive_users} type *)

val make_one_drive_configuration :
  ?disable_local_groups:bool ->
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  one_drive_users:one_drive_users ->
  secret_arn:string ->
  tenant_domain:string ->
  unit
-> one_drive_configuration
(** Create a {!type-one_drive_configuration} type *)

val make_service_now_knowledge_article_configuration :
  ?filter_query:string ->
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  ?exclude_attachment_file_patterns:string list ->
  ?include_attachment_file_patterns:string list ->
  ?crawl_attachments:bool ->
  document_data_field_name:string ->
  unit
-> service_now_knowledge_article_configuration
(** Create a {!type-service_now_knowledge_article_configuration} type *)

val make_service_now_service_catalog_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  ?exclude_attachment_file_patterns:string list ->
  ?include_attachment_file_patterns:string list ->
  ?crawl_attachments:bool ->
  document_data_field_name:string ->
  unit
-> service_now_service_catalog_configuration
(** Create a {!type-service_now_service_catalog_configuration} type *)

val make_service_now_configuration :
  ?authentication_type:service_now_authentication_type ->
  ?service_catalog_configuration:service_now_service_catalog_configuration ->
  ?knowledge_article_configuration:service_now_knowledge_article_configuration ->
  service_now_build_version:service_now_build_version_type ->
  secret_arn:string ->
  host_url:string ->
  unit
-> service_now_configuration
(** Create a {!type-service_now_configuration} type *)

val make_confluence_space_to_index_field_mapping :
  ?index_field_name:string ->
  ?date_field_format:string ->
  ?data_source_field_name:confluence_space_field_name ->
  unit
-> confluence_space_to_index_field_mapping
(** Create a {!type-confluence_space_to_index_field_mapping} type *)

val make_confluence_space_configuration :
  ?space_field_mappings:confluence_space_to_index_field_mapping list ->
  ?exclude_spaces:string list ->
  ?include_spaces:string list ->
  ?crawl_archived_spaces:bool ->
  ?crawl_personal_spaces:bool ->
  unit
-> confluence_space_configuration
(** Create a {!type-confluence_space_configuration} type *)

val make_confluence_page_to_index_field_mapping :
  ?index_field_name:string ->
  ?date_field_format:string ->
  ?data_source_field_name:confluence_page_field_name ->
  unit
-> confluence_page_to_index_field_mapping
(** Create a {!type-confluence_page_to_index_field_mapping} type *)

val make_confluence_page_configuration :
  ?page_field_mappings:confluence_page_to_index_field_mapping list -> unit
-> confluence_page_configuration
(** Create a {!type-confluence_page_configuration} type *)

val make_confluence_blog_to_index_field_mapping :
  ?index_field_name:string ->
  ?date_field_format:string ->
  ?data_source_field_name:confluence_blog_field_name ->
  unit
-> confluence_blog_to_index_field_mapping
(** Create a {!type-confluence_blog_to_index_field_mapping} type *)

val make_confluence_blog_configuration :
  ?blog_field_mappings:confluence_blog_to_index_field_mapping list -> unit
-> confluence_blog_configuration
(** Create a {!type-confluence_blog_configuration} type *)

val make_confluence_attachment_to_index_field_mapping :
  ?index_field_name:string ->
  ?date_field_format:string ->
  ?data_source_field_name:confluence_attachment_field_name ->
  unit
-> confluence_attachment_to_index_field_mapping
(** Create a {!type-confluence_attachment_to_index_field_mapping} type *)

val make_confluence_attachment_configuration :
  ?attachment_field_mappings:confluence_attachment_to_index_field_mapping list ->
  ?crawl_attachments:bool ->
  unit
-> confluence_attachment_configuration
(** Create a {!type-confluence_attachment_configuration} type *)

val make_confluence_configuration :
  ?authentication_type:confluence_authentication_type ->
  ?proxy_configuration:proxy_configuration ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?attachment_configuration:confluence_attachment_configuration ->
  ?blog_configuration:confluence_blog_configuration ->
  ?page_configuration:confluence_page_configuration ->
  ?space_configuration:confluence_space_configuration ->
  version:confluence_version ->
  secret_arn:string ->
  server_url:string ->
  unit
-> confluence_configuration
(** Create a {!type-confluence_configuration} type *)

val make_google_drive_configuration :
  ?exclude_shared_drives:string list ->
  ?exclude_user_accounts:string list ->
  ?exclude_mime_types:string list ->
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  secret_arn:string ->
  unit
-> google_drive_configuration
(** Create a {!type-google_drive_configuration} type *)

val make_fsx_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?secret_arn:string ->
  vpc_configuration:data_source_vpc_configuration ->
  file_system_type:fsx_file_system_type ->
  file_system_id:string ->
  unit
-> fsx_configuration
(** Create a {!type-fsx_configuration} type *)

val make_slack_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?public_channel_filter:string list ->
  ?private_channel_filter:string list ->
  ?look_back_period:int ->
  ?exclude_archived:bool ->
  ?crawl_bot_message:bool ->
  ?use_change_log:bool ->
  ?vpc_configuration:data_source_vpc_configuration ->
  since_crawl_date:string ->
  slack_entity_list:slack_entity list ->
  secret_arn:string ->
  team_id:string ->
  unit
-> slack_configuration
(** Create a {!type-slack_configuration} type *)

val make_box_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?web_link_field_mappings:data_source_to_index_field_mapping list ->
  ?comment_field_mappings:data_source_to_index_field_mapping list ->
  ?task_field_mappings:data_source_to_index_field_mapping list ->
  ?file_field_mappings:data_source_to_index_field_mapping list ->
  ?crawl_web_links:bool ->
  ?crawl_tasks:bool ->
  ?crawl_comments:bool ->
  ?use_change_log:bool ->
  secret_arn:string ->
  enterprise_id:string ->
  unit
-> box_configuration
(** Create a {!type-box_configuration} type *)

val make_quip_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?attachment_field_mappings:data_source_to_index_field_mapping list ->
  ?message_field_mappings:data_source_to_index_field_mapping list ->
  ?thread_field_mappings:data_source_to_index_field_mapping list ->
  ?folder_ids:string list ->
  ?crawl_attachments:bool ->
  ?crawl_chat_rooms:bool ->
  ?crawl_file_comments:bool ->
  secret_arn:string ->
  domain:string ->
  unit
-> quip_configuration
(** Create a {!type-quip_configuration} type *)

val make_jira_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?work_log_field_mappings:data_source_to_index_field_mapping list ->
  ?project_field_mappings:data_source_to_index_field_mapping list ->
  ?issue_field_mappings:data_source_to_index_field_mapping list ->
  ?comment_field_mappings:data_source_to_index_field_mapping list ->
  ?attachment_field_mappings:data_source_to_index_field_mapping list ->
  ?issue_sub_entity_filter:issue_sub_entity list ->
  ?status:string list ->
  ?issue_type:string list ->
  ?project:string list ->
  ?use_change_log:bool ->
  secret_arn:string ->
  jira_account_url:string ->
  unit
-> jira_configuration
(** Create a {!type-jira_configuration} type *)

val make_saa_s_configuration :
  host_url:string -> organization_name:string -> unit
-> saa_s_configuration
(** Create a {!type-saa_s_configuration} type *)

val make_on_premise_configuration :
  ssl_certificate_s3_path:s3_path ->
  organization_name:string ->
  host_url:string ->
  unit
-> on_premise_configuration
(** Create a {!type-on_premise_configuration} type *)

val make_git_hub_document_crawl_properties :
  ?crawl_pull_request_comment_attachment:bool ->
  ?crawl_pull_request_comment:bool ->
  ?crawl_pull_request:bool ->
  ?crawl_issue_comment_attachment:bool ->
  ?crawl_issue_comment:bool ->
  ?crawl_issue:bool ->
  ?crawl_repository_documents:bool ->
  unit
-> git_hub_document_crawl_properties
(** Create a {!type-git_hub_document_crawl_properties} type *)

val make_git_hub_configuration :
  ?git_hub_pull_request_document_attachment_configuration_field_mappings:data_source_to_index_field_mapping list ->
  ?git_hub_pull_request_document_configuration_field_mappings:data_source_to_index_field_mapping list ->
  ?git_hub_pull_request_comment_configuration_field_mappings:data_source_to_index_field_mapping list ->
  ?git_hub_issue_attachment_configuration_field_mappings:data_source_to_index_field_mapping list ->
  ?git_hub_issue_comment_configuration_field_mappings:data_source_to_index_field_mapping list ->
  ?git_hub_issue_document_configuration_field_mappings:data_source_to_index_field_mapping list ->
  ?git_hub_commit_configuration_field_mappings:data_source_to_index_field_mapping list ->
  ?git_hub_repository_configuration_field_mappings:data_source_to_index_field_mapping list ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?exclusion_file_name_patterns:string list ->
  ?exclusion_file_type_patterns:string list ->
  ?exclusion_folder_name_patterns:string list ->
  ?inclusion_file_name_patterns:string list ->
  ?inclusion_file_type_patterns:string list ->
  ?inclusion_folder_name_patterns:string list ->
  ?repository_filter:string list ->
  ?git_hub_document_crawl_properties:git_hub_document_crawl_properties ->
  ?use_change_log:bool ->
  ?type_:type_ ->
  ?on_premise_configuration:on_premise_configuration ->
  ?saa_s_configuration:saa_s_configuration ->
  secret_arn:string ->
  unit
-> git_hub_configuration
(** Create a {!type-git_hub_configuration} type *)

val make_alfresco_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?wiki_field_mappings:data_source_to_index_field_mapping list ->
  ?blog_field_mappings:data_source_to_index_field_mapping list ->
  ?document_library_field_mappings:data_source_to_index_field_mapping list ->
  ?entity_filter:alfresco_entity list ->
  ?crawl_comments:bool ->
  ?crawl_system_folders:bool ->
  ssl_certificate_s3_path:s3_path ->
  secret_arn:string ->
  site_id:string ->
  site_url:string ->
  unit
-> alfresco_configuration
(** Create a {!type-alfresco_configuration} type *)

val make_template_configuration : ?template:template -> unit
-> template_configuration
(** Create a {!type-template_configuration} type *)

val make_data_source_configuration :
  ?template_configuration:template_configuration ->
  ?alfresco_configuration:alfresco_configuration ->
  ?git_hub_configuration:git_hub_configuration ->
  ?jira_configuration:jira_configuration ->
  ?quip_configuration:quip_configuration ->
  ?box_configuration:box_configuration ->
  ?slack_configuration:slack_configuration ->
  ?fsx_configuration:fsx_configuration ->
  ?work_docs_configuration:work_docs_configuration ->
  ?web_crawler_configuration:web_crawler_configuration ->
  ?google_drive_configuration:google_drive_configuration ->
  ?confluence_configuration:confluence_configuration ->
  ?service_now_configuration:service_now_configuration ->
  ?one_drive_configuration:one_drive_configuration ->
  ?salesforce_configuration:salesforce_configuration ->
  ?database_configuration:database_configuration ->
  ?share_point_configuration:share_point_configuration ->
  ?s3_configuration:s3_data_source_configuration ->
  unit
-> data_source_configuration
(** Create a {!type-data_source_configuration} type *)

val make_document_attribute_value :
  ?date_value:float ->
  ?long_value:int ->
  ?string_list_value:string list ->
  ?string_value:string ->
  unit
-> document_attribute_value
(** Create a {!type-document_attribute_value} type *)

val make_document_attribute_condition :
  ?condition_on_value:document_attribute_value ->
  operator:condition_operator ->
  condition_document_attribute_key:string ->
  unit
-> document_attribute_condition
(** Create a {!type-document_attribute_condition} type *)

val make_document_attribute_target :
  ?target_document_attribute_value:document_attribute_value ->
  ?target_document_attribute_value_deletion:bool ->
  ?target_document_attribute_key:string ->
  unit
-> document_attribute_target
(** Create a {!type-document_attribute_target} type *)

val make_inline_custom_document_enrichment_configuration :
  ?document_content_deletion:bool ->
  ?target:document_attribute_target ->
  ?condition:document_attribute_condition ->
  unit
-> inline_custom_document_enrichment_configuration
(** Create a {!type-inline_custom_document_enrichment_configuration} type *)

val make_hook_configuration :
  ?invocation_condition:document_attribute_condition ->
  s3_bucket:string ->
  lambda_arn:string ->
  unit
-> hook_configuration
(** Create a {!type-hook_configuration} type *)

val make_custom_document_enrichment_configuration :
  ?role_arn:string ->
  ?post_extraction_hook_configuration:hook_configuration ->
  ?pre_extraction_hook_configuration:hook_configuration ->
  ?inline_configurations:inline_custom_document_enrichment_configuration list ->
  unit
-> custom_document_enrichment_configuration
(** Create a {!type-custom_document_enrichment_configuration} type *)

val make_update_data_source_request :
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration ->
  ?language_code:string ->
  ?role_arn:string ->
  ?schedule:string ->
  ?description:string ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?configuration:data_source_configuration ->
  ?name:string ->
  index_id:string ->
  id:string ->
  unit
-> update_data_source_request
(** Create a {!type-update_data_source_request} type *)

val make_update_access_control_configuration_response : unit
-> update_access_control_configuration_response
(** Create a {!type-update_access_control_configuration_response} type *)

val make_principal :
  ?data_source_id:string ->
  access:read_access_type ->
  type_:principal_type ->
  name:string ->
  unit
-> principal
(** Create a {!type-principal} type *)

val make_hierarchical_principal : principal_list:principal list -> unit
-> hierarchical_principal
(** Create a {!type-hierarchical_principal} type *)

val make_update_access_control_configuration_request :
  ?hierarchical_access_control_list:hierarchical_principal list ->
  ?access_control_list:principal list ->
  ?description:string ->
  ?name:string ->
  id:string ->
  index_id:string ->
  unit
-> update_access_control_configuration_request
(** Create a {!type-update_access_control_configuration_request} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_time_range : ?end_time:float -> ?start_time:float -> unit
-> time_range
(** Create a {!type-time_range} type *)

val make_thesaurus_summary :
  ?updated_at:float ->
  ?created_at:float ->
  ?status:thesaurus_status ->
  ?name:string ->
  ?id:string ->
  unit
-> thesaurus_summary
(** Create a {!type-thesaurus_summary} type *)

val make_highlight :
  ?type_:highlight_type ->
  ?top_answer:bool ->
  end_offset:int ->
  begin_offset:int ->
  unit
-> highlight
(** Create a {!type-highlight} type *)

val make_text_with_highlights :
  ?highlights:highlight list -> ?text:string -> unit
-> text_with_highlights
(** Create a {!type-text_with_highlights} type *)

val make_text_document_statistics :
  indexed_text_bytes:int -> indexed_text_documents_count:int -> unit
-> text_document_statistics
(** Create a {!type-text_document_statistics} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_table_cell :
  ?header:bool ->
  ?highlighted:bool ->
  ?top_answer:bool ->
  ?value:string ->
  unit
-> table_cell
(** Create a {!type-table_cell} type *)

val make_table_row : ?cells:table_cell list -> unit
-> table_row
(** Create a {!type-table_row} type *)

val make_table_excerpt :
  ?total_number_of_rows:int -> ?rows:table_row list -> unit
-> table_excerpt
(** Create a {!type-table_excerpt} type *)

val make_suggestion_highlight : ?end_offset:int -> ?begin_offset:int -> unit
-> suggestion_highlight
(** Create a {!type-suggestion_highlight} type *)

val make_suggestion_text_with_highlights :
  ?highlights:suggestion_highlight list -> ?text:string -> unit
-> suggestion_text_with_highlights
(** Create a {!type-suggestion_text_with_highlights} type *)

val make_suggestion_value : ?text:suggestion_text_with_highlights -> unit
-> suggestion_value
(** Create a {!type-suggestion_value} type *)

val make_document_attribute :
  value:document_attribute_value -> key:string -> unit
-> document_attribute
(** Create a {!type-document_attribute} type *)

val make_source_document :
  ?additional_attributes:document_attribute list ->
  ?suggestion_attributes:string list ->
  ?document_id:string ->
  unit
-> source_document
(** Create a {!type-source_document} type *)

val make_suggestion :
  ?source_documents:source_document list ->
  ?value:suggestion_value ->
  ?id:string ->
  unit
-> suggestion
(** Create a {!type-suggestion} type *)

val make_click_feedback : click_time:float -> result_id:string -> unit
-> click_feedback
(** Create a {!type-click_feedback} type *)

val make_relevance_feedback :
  relevance_value:relevance_type -> result_id:string -> unit
-> relevance_feedback
(** Create a {!type-relevance_feedback} type *)

val make_submit_feedback_request :
  ?relevance_feedback_items:relevance_feedback list ->
  ?click_feedback_items:click_feedback list ->
  query_id:string ->
  index_id:string ->
  unit
-> submit_feedback_request
(** Create a {!type-submit_feedback_request} type *)

val make_stop_data_source_sync_job_request :
  index_id:string -> id:string -> unit
-> stop_data_source_sync_job_request
(** Create a {!type-stop_data_source_sync_job_request} type *)

val make_status :
  ?failure_reason:string ->
  ?failure_code:string ->
  ?document_status:document_status ->
  ?document_id:string ->
  unit
-> status
(** Create a {!type-status} type *)

val make_start_data_source_sync_job_response : ?execution_id:string -> unit
-> start_data_source_sync_job_response
(** Create a {!type-start_data_source_sync_job_response} type *)

val make_start_data_source_sync_job_request :
  index_id:string -> id:string -> unit
-> start_data_source_sync_job_request
(** Create a {!type-start_data_source_sync_job_request} type *)

val make_spell_correction_configuration :
  include_query_spell_check_suggestions:bool -> unit
-> spell_correction_configuration
(** Create a {!type-spell_correction_configuration} type *)

val make_correction :
  ?corrected_term:string ->
  ?term:string ->
  ?end_offset:int ->
  ?begin_offset:int ->
  unit
-> correction
(** Create a {!type-correction} type *)

val make_spell_corrected_query :
  ?corrections:correction list -> ?suggested_query_text:string -> unit
-> spell_corrected_query
(** Create a {!type-spell_corrected_query} type *)

val make_sorting_configuration :
  sort_order:sort_order -> document_attribute_key:string -> unit
-> sorting_configuration
(** Create a {!type-sorting_configuration} type *)

val make_server_side_encryption_configuration : ?kms_key_id:string -> unit
-> server_side_encryption_configuration
(** Create a {!type-server_side_encryption_configuration} type *)

val make_score_attributes : ?score_confidence:score_confidence -> unit
-> score_attributes
(** Create a {!type-score_attributes} type *)

val make_retrieve_result_item :
  ?score_attributes:score_attributes ->
  ?document_attributes:document_attribute list ->
  ?document_ur_i:string ->
  ?content:string ->
  ?document_title:string ->
  ?document_id:string ->
  ?id:string ->
  unit
-> retrieve_result_item
(** Create a {!type-retrieve_result_item} type *)

val make_attribute_filter :
  ?less_than_or_equals:document_attribute ->
  ?less_than:document_attribute ->
  ?greater_than_or_equals:document_attribute ->
  ?greater_than:document_attribute ->
  ?contains_any:document_attribute ->
  ?contains_all:document_attribute ->
  ?equals_to:document_attribute ->
  ?not_filter:attribute_filter ->
  ?or_all_filters:attribute_filter list ->
  ?and_all_filters:attribute_filter list ->
  unit
-> attribute_filter
(** Create a {!type-attribute_filter} type *)

val make_document_relevance_configuration :
  relevance:relevance -> name:string -> unit
-> document_relevance_configuration
(** Create a {!type-document_relevance_configuration} type *)

val make_retrieve_request :
  ?user_context:user_context ->
  ?page_size:int ->
  ?page_number:int ->
  ?document_relevance_override_configurations:document_relevance_configuration list ->
  ?requested_document_attributes:string list ->
  ?attribute_filter:attribute_filter ->
  query_text:string ->
  index_id:string ->
  unit
-> retrieve_request
(** Create a {!type-retrieve_request} type *)

val make_query_suggestions_block_list_summary :
  ?item_count:int ->
  ?updated_at:float ->
  ?created_at:float ->
  ?status:query_suggestions_block_list_status ->
  ?name:string ->
  ?id:string ->
  unit
-> query_suggestions_block_list_summary
(** Create a {!type-query_suggestions_block_list_summary} type *)

val make_additional_result_attribute_value :
  ?text_with_highlights_value:text_with_highlights -> unit
-> additional_result_attribute_value
(** Create a {!type-additional_result_attribute_value} type *)

val make_additional_result_attribute :
  value:additional_result_attribute_value ->
  value_type:additional_result_attribute_value_type ->
  key:string ->
  unit
-> additional_result_attribute
(** Create a {!type-additional_result_attribute} type *)

val make_expanded_result_item :
  ?document_attributes:document_attribute list ->
  ?document_ur_i:string ->
  ?document_excerpt:text_with_highlights ->
  ?document_title:text_with_highlights ->
  ?document_id:string ->
  ?id:string ->
  unit
-> expanded_result_item
(** Create a {!type-expanded_result_item} type *)

val make_collapsed_result_detail :
  ?expanded_results:expanded_result_item list ->
  document_attribute:document_attribute ->
  unit
-> collapsed_result_detail
(** Create a {!type-collapsed_result_detail} type *)

val make_query_result_item :
  ?collapsed_result_detail:collapsed_result_detail ->
  ?table_excerpt:table_excerpt ->
  ?feedback_token:string ->
  ?score_attributes:score_attributes ->
  ?document_attributes:document_attribute list ->
  ?document_ur_i:string ->
  ?document_excerpt:text_with_highlights ->
  ?document_title:text_with_highlights ->
  ?document_id:string ->
  ?additional_attributes:additional_result_attribute list ->
  ?format:query_result_format ->
  ?type_:query_result_type ->
  ?id:string ->
  unit
-> query_result_item
(** Create a {!type-query_result_item} type *)

val make_document_attribute_value_count_pair :
  ?facet_results:facet_result list ->
  ?count:int ->
  ?document_attribute_value:document_attribute_value ->
  unit
-> document_attribute_value_count_pair
(** Create a {!type-document_attribute_value_count_pair} type *)

val make_featured_results_item :
  ?feedback_token:string ->
  ?document_attributes:document_attribute list ->
  ?document_ur_i:string ->
  ?document_excerpt:text_with_highlights ->
  ?document_title:text_with_highlights ->
  ?document_id:string ->
  ?additional_attributes:additional_result_attribute list ->
  ?type_:query_result_type ->
  ?id:string ->
  unit
-> featured_results_item
(** Create a {!type-featured_results_item} type *)

val make_facet :
  ?max_results:int ->
  ?facets:facet list ->
  ?document_attribute_key:string ->
  unit
-> facet
(** Create a {!type-facet} type *)

val make_expand_configuration :
  ?max_expanded_results_per_item:int ->
  ?max_result_items_to_expand:int ->
  unit
-> expand_configuration
(** Create a {!type-expand_configuration} type *)

val make_collapse_configuration :
  ?expand_configuration:expand_configuration ->
  ?expand:bool ->
  ?missing_attribute_key_strategy:missing_attribute_key_strategy ->
  ?sorting_configurations:sorting_configuration list ->
  document_attribute_key:string ->
  unit
-> collapse_configuration
(** Create a {!type-collapse_configuration} type *)

val make_query_request :
  ?collapse_configuration:collapse_configuration ->
  ?spell_correction_configuration:spell_correction_configuration ->
  ?visitor_id:string ->
  ?user_context:user_context ->
  ?sorting_configurations:sorting_configuration list ->
  ?sorting_configuration:sorting_configuration ->
  ?page_size:int ->
  ?page_number:int ->
  ?document_relevance_override_configurations:document_relevance_configuration list ->
  ?query_result_type_filter:query_result_type ->
  ?requested_document_attributes:string list ->
  ?facets:facet list ->
  ?attribute_filter:attribute_filter ->
  ?query_text:string ->
  index_id:string ->
  unit
-> query_request
(** Create a {!type-query_request} type *)

val make_member_group : ?data_source_id:string -> group_id:string -> unit
-> member_group
(** Create a {!type-member_group} type *)

val make_member_user : user_id:string -> unit
-> member_user
(** Create a {!type-member_user} type *)

val make_group_members :
  ?s3_pathfor_group_members:s3_path ->
  ?member_users:member_user list ->
  ?member_groups:member_group list ->
  unit
-> group_members
(** Create a {!type-group_members} type *)

val make_put_principal_mapping_request :
  ?role_arn:string ->
  ?ordering_id:int ->
  ?data_source_id:string ->
  group_members:group_members ->
  group_id:string ->
  index_id:string ->
  unit
-> put_principal_mapping_request
(** Create a {!type-put_principal_mapping_request} type *)

val make_personas_summary :
  ?updated_at:float ->
  ?created_at:float ->
  ?persona:persona ->
  ?entity_id:string ->
  unit
-> personas_summary
(** Create a {!type-personas_summary} type *)

val make_list_thesauri_response :
  ?thesaurus_summary_items:thesaurus_summary list ->
  ?next_token:string ->
  unit
-> list_thesauri_response
(** Create a {!type-list_thesauri_response} type *)

val make_list_thesauri_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_thesauri_request
(** Create a {!type-list_thesauri_request} type *)

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_list_query_suggestions_block_lists_response :
  ?next_token:string ->
  ?block_list_summary_items:query_suggestions_block_list_summary list ->
  unit
-> list_query_suggestions_block_lists_response
(** Create a {!type-list_query_suggestions_block_lists_response} type *)

val make_list_query_suggestions_block_lists_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_query_suggestions_block_lists_request
(** Create a {!type-list_query_suggestions_block_lists_request} type *)

val make_group_summary : ?ordering_id:int -> ?group_id:string -> unit
-> group_summary
(** Create a {!type-group_summary} type *)

val make_index_configuration_summary :
  ?edition:index_edition ->
  ?id:string ->
  ?name:string ->
  status:index_status ->
  updated_at:float ->
  created_at:float ->
  unit
-> index_configuration_summary
(** Create a {!type-index_configuration_summary} type *)

val make_list_indices_response :
  ?next_token:string ->
  ?index_configuration_summary_items:index_configuration_summary list ->
  unit
-> list_indices_response
(** Create a {!type-list_indices_response} type *)

val make_list_indices_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_indices_request
(** Create a {!type-list_indices_request} type *)

val make_list_groups_older_than_ordering_id_response :
  ?next_token:string -> ?groups_summaries:group_summary list -> unit
-> list_groups_older_than_ordering_id_response
(** Create a {!type-list_groups_older_than_ordering_id_response} type *)

val make_list_groups_older_than_ordering_id_request :
  ?max_results:int ->
  ?next_token:string ->
  ?data_source_id:string ->
  ordering_id:int ->
  index_id:string ->
  unit
-> list_groups_older_than_ordering_id_request
(** Create a {!type-list_groups_older_than_ordering_id_request} type *)

val make_featured_results_set_summary :
  ?creation_timestamp:int ->
  ?last_updated_timestamp:int ->
  ?status:featured_results_set_status ->
  ?featured_results_set_name:string ->
  ?featured_results_set_id:string ->
  unit
-> featured_results_set_summary
(** Create a {!type-featured_results_set_summary} type *)

val make_list_featured_results_sets_response :
  ?next_token:string ->
  ?featured_results_set_summary_items:featured_results_set_summary list ->
  unit
-> list_featured_results_sets_response
(** Create a {!type-list_featured_results_sets_response} type *)

val make_list_featured_results_sets_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_featured_results_sets_request
(** Create a {!type-list_featured_results_sets_request} type *)

val make_faq_summary :
  ?language_code:string ->
  ?file_format:faq_file_format ->
  ?updated_at:float ->
  ?created_at:float ->
  ?status:faq_status ->
  ?name:string ->
  ?id:string ->
  unit
-> faq_summary
(** Create a {!type-faq_summary} type *)

val make_list_faqs_response :
  ?faq_summary_items:faq_summary list -> ?next_token:string -> unit
-> list_faqs_response
(** Create a {!type-list_faqs_response} type *)

val make_list_faqs_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_faqs_request
(** Create a {!type-list_faqs_request} type *)

val make_experience_endpoint :
  ?endpoint:string -> ?endpoint_type:endpoint_type -> unit
-> experience_endpoint
(** Create a {!type-experience_endpoint} type *)

val make_experiences_summary :
  ?endpoints:experience_endpoint list ->
  ?status:experience_status ->
  ?created_at:float ->
  ?id:string ->
  ?name:string ->
  unit
-> experiences_summary
(** Create a {!type-experiences_summary} type *)

val make_list_experiences_response :
  ?next_token:string -> ?summary_items:experiences_summary list -> unit
-> list_experiences_response
(** Create a {!type-list_experiences_response} type *)

val make_list_experiences_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_experiences_request
(** Create a {!type-list_experiences_request} type *)

val make_entity_display_data :
  ?last_name:string ->
  ?first_name:string ->
  ?identified_user_name:string ->
  ?group_name:string ->
  ?user_name:string ->
  unit
-> entity_display_data
(** Create a {!type-entity_display_data} type *)

val make_experience_entities_summary :
  ?display_data:entity_display_data ->
  ?entity_type:entity_type ->
  ?entity_id:string ->
  unit
-> experience_entities_summary
(** Create a {!type-experience_entities_summary} type *)

val make_list_experience_entities_response :
  ?next_token:string ->
  ?summary_items:experience_entities_summary list ->
  unit
-> list_experience_entities_response
(** Create a {!type-list_experience_entities_response} type *)

val make_list_experience_entities_request :
  ?next_token:string -> index_id:string -> id:string -> unit
-> list_experience_entities_request
(** Create a {!type-list_experience_entities_request} type *)

val make_list_entity_personas_response :
  ?next_token:string -> ?summary_items:personas_summary list -> unit
-> list_entity_personas_response
(** Create a {!type-list_entity_personas_response} type *)

val make_list_entity_personas_request :
  ?max_results:int ->
  ?next_token:string ->
  index_id:string ->
  id:string ->
  unit
-> list_entity_personas_request
(** Create a {!type-list_entity_personas_request} type *)

val make_data_source_summary :
  ?language_code:string ->
  ?status:data_source_status ->
  ?updated_at:float ->
  ?created_at:float ->
  ?type_:data_source_type ->
  ?id:string ->
  ?name:string ->
  unit
-> data_source_summary
(** Create a {!type-data_source_summary} type *)

val make_list_data_sources_response :
  ?next_token:string -> ?summary_items:data_source_summary list -> unit
-> list_data_sources_response
(** Create a {!type-list_data_sources_response} type *)

val make_list_data_sources_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_data_sources_request
(** Create a {!type-list_data_sources_request} type *)

val make_data_source_sync_job_metrics :
  ?documents_scanned:string ->
  ?documents_failed:string ->
  ?documents_deleted:string ->
  ?documents_modified:string ->
  ?documents_added:string ->
  unit
-> data_source_sync_job_metrics
(** Create a {!type-data_source_sync_job_metrics} type *)

val make_data_source_sync_job :
  ?metrics:data_source_sync_job_metrics ->
  ?data_source_error_code:string ->
  ?error_code:error_code ->
  ?error_message:string ->
  ?status:data_source_sync_job_status ->
  ?end_time:float ->
  ?start_time:float ->
  ?execution_id:string ->
  unit
-> data_source_sync_job
(** Create a {!type-data_source_sync_job} type *)

val make_list_data_source_sync_jobs_response :
  ?next_token:string -> ?history:data_source_sync_job list -> unit
-> list_data_source_sync_jobs_response
(** Create a {!type-list_data_source_sync_jobs_response} type *)

val make_list_data_source_sync_jobs_request :
  ?status_filter:data_source_sync_job_status ->
  ?start_time_filter:time_range ->
  ?max_results:int ->
  ?next_token:string ->
  index_id:string ->
  id:string ->
  unit
-> list_data_source_sync_jobs_request
(** Create a {!type-list_data_source_sync_jobs_request} type *)

val make_access_control_configuration_summary : id:string -> unit
-> access_control_configuration_summary
(** Create a {!type-access_control_configuration_summary} type *)

val make_list_access_control_configurations_response :
  ?next_token:string ->
  access_control_configurations:access_control_configuration_summary list ->
  unit
-> list_access_control_configurations_response
(** Create a {!type-list_access_control_configurations_response} type *)

val make_list_access_control_configurations_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_access_control_configurations_request
(** Create a {!type-list_access_control_configurations_request} type *)

val make_faq_statistics : indexed_question_answers_count:int -> unit
-> faq_statistics
(** Create a {!type-faq_statistics} type *)

val make_index_statistics :
  text_document_statistics:text_document_statistics ->
  faq_statistics:faq_statistics ->
  unit
-> index_statistics
(** Create a {!type-index_statistics} type *)

val make_group_ordering_id_summary :
  ?failure_reason:string ->
  ?ordering_id:int ->
  ?received_at:float ->
  ?last_updated_at:float ->
  ?status:principal_mapping_status ->
  unit
-> group_ordering_id_summary
(** Create a {!type-group_ordering_id_summary} type *)

val make_get_snapshots_response :
  ?next_token:string ->
  ?snapshots_data:string list list ->
  ?snapshots_data_header:string list ->
  ?snap_shot_time_filter:time_range ->
  unit
-> get_snapshots_response
(** Create a {!type-get_snapshots_response} type *)

val make_get_snapshots_request :
  ?max_results:int ->
  ?next_token:string ->
  metric_type:metric_type ->
  interval:interval ->
  index_id:string ->
  unit
-> get_snapshots_request
(** Create a {!type-get_snapshots_request} type *)

val make_get_query_suggestions_response :
  ?suggestions:suggestion list -> ?query_suggestions_id:string -> unit
-> get_query_suggestions_response
(** Create a {!type-get_query_suggestions_response} type *)

val make_attribute_suggestions_get_config :
  ?user_context:user_context ->
  ?attribute_filter:attribute_filter ->
  ?additional_response_attributes:string list ->
  ?suggestion_attributes:string list ->
  unit
-> attribute_suggestions_get_config
(** Create a {!type-attribute_suggestions_get_config} type *)

val make_get_query_suggestions_request :
  ?attribute_suggestions_config:attribute_suggestions_get_config ->
  ?suggestion_types:suggestion_type list ->
  ?max_suggestions_count:int ->
  query_text:string ->
  index_id:string ->
  unit
-> get_query_suggestions_request
(** Create a {!type-get_query_suggestions_request} type *)

val make_featured_document_with_metadata :
  ?ur_i:string -> ?title:string -> ?id:string -> unit
-> featured_document_with_metadata
(** Create a {!type-featured_document_with_metadata} type *)

val make_featured_document_missing : ?id:string -> unit
-> featured_document_missing
(** Create a {!type-featured_document_missing} type *)

val make_failed_entity : ?error_message:string -> ?entity_id:string -> unit
-> failed_entity
(** Create a {!type-failed_entity} type *)

val make_entity_persona_configuration :
  persona:persona -> entity_id:string -> unit
-> entity_persona_configuration
(** Create a {!type-entity_persona_configuration} type *)

val make_entity_configuration :
  entity_type:entity_type -> entity_id:string -> unit
-> entity_configuration
(** Create a {!type-entity_configuration} type *)

val make_document :
  ?access_control_configuration_id:string ->
  ?content_type:content_type ->
  ?hierarchical_access_control_list:hierarchical_principal list ->
  ?access_control_list:principal list ->
  ?attributes:document_attribute list ->
  ?s3_path:s3_path ->
  ?blob:bytes ->
  ?title:string ->
  id:string ->
  unit
-> document
(** Create a {!type-document} type *)

val make_document_info :
  ?attributes:document_attribute list -> document_id:string -> unit
-> document_info
(** Create a {!type-document_info} type *)

val make_disassociate_personas_from_entities_response :
  ?failed_entity_list:failed_entity list -> unit
-> disassociate_personas_from_entities_response
(** Create a {!type-disassociate_personas_from_entities_response} type *)

val make_disassociate_personas_from_entities_request :
  entity_ids:string list -> index_id:string -> id:string -> unit
-> disassociate_personas_from_entities_request
(** Create a {!type-disassociate_personas_from_entities_request} type *)

val make_disassociate_entities_from_experience_response :
  ?failed_entity_list:failed_entity list -> unit
-> disassociate_entities_from_experience_response
(** Create a {!type-disassociate_entities_from_experience_response} type *)

val make_disassociate_entities_from_experience_request :
  entity_list:entity_configuration list ->
  index_id:string ->
  id:string ->
  unit
-> disassociate_entities_from_experience_request
(** Create a {!type-disassociate_entities_from_experience_request} type *)

val make_describe_thesaurus_response :
  ?synonym_rule_count:int ->
  ?term_count:int ->
  ?file_size_bytes:int ->
  ?source_s3_path:s3_path ->
  ?role_arn:string ->
  ?updated_at:float ->
  ?created_at:float ->
  ?error_message:string ->
  ?status:thesaurus_status ->
  ?description:string ->
  ?name:string ->
  ?index_id:string ->
  ?id:string ->
  unit
-> describe_thesaurus_response
(** Create a {!type-describe_thesaurus_response} type *)

val make_describe_thesaurus_request : index_id:string -> id:string -> unit
-> describe_thesaurus_request
(** Create a {!type-describe_thesaurus_request} type *)

val make_attribute_suggestions_describe_config :
  ?attribute_suggestions_mode:attribute_suggestions_mode ->
  ?suggestable_config_list:suggestable_config list ->
  unit
-> attribute_suggestions_describe_config
(** Create a {!type-attribute_suggestions_describe_config} type *)

val make_describe_query_suggestions_config_response :
  ?attribute_suggestions_config:attribute_suggestions_describe_config ->
  ?total_suggestions_count:int ->
  ?last_clear_time:float ->
  ?last_suggestions_build_time:float ->
  ?minimum_query_count:int ->
  ?minimum_number_of_querying_users:int ->
  ?include_queries_without_user_information:bool ->
  ?query_log_look_back_window_in_days:int ->
  ?status:query_suggestions_status ->
  ?mode:mode ->
  unit
-> describe_query_suggestions_config_response
(** Create a {!type-describe_query_suggestions_config_response} type *)

val make_describe_query_suggestions_config_request : index_id:string -> unit
-> describe_query_suggestions_config_request
(** Create a {!type-describe_query_suggestions_config_request} type *)

val make_describe_query_suggestions_block_list_response :
  ?role_arn:string ->
  ?file_size_bytes:int ->
  ?item_count:int ->
  ?source_s3_path:s3_path ->
  ?updated_at:float ->
  ?created_at:float ->
  ?error_message:string ->
  ?status:query_suggestions_block_list_status ->
  ?description:string ->
  ?name:string ->
  ?id:string ->
  ?index_id:string ->
  unit
-> describe_query_suggestions_block_list_response
(** Create a {!type-describe_query_suggestions_block_list_response} type *)

val make_describe_query_suggestions_block_list_request :
  id:string -> index_id:string -> unit
-> describe_query_suggestions_block_list_request
(** Create a {!type-describe_query_suggestions_block_list_request} type *)

val make_describe_principal_mapping_response :
  ?group_ordering_id_summaries:group_ordering_id_summary list ->
  ?group_id:string ->
  ?data_source_id:string ->
  ?index_id:string ->
  unit
-> describe_principal_mapping_response
(** Create a {!type-describe_principal_mapping_response} type *)

val make_describe_principal_mapping_request :
  ?data_source_id:string -> group_id:string -> index_id:string -> unit
-> describe_principal_mapping_request
(** Create a {!type-describe_principal_mapping_request} type *)

val make_describe_index_response :
  ?user_group_resolution_configuration:user_group_resolution_configuration ->
  ?user_context_policy:user_context_policy ->
  ?user_token_configurations:user_token_configuration list ->
  ?capacity_units:capacity_units_configuration ->
  ?error_message:string ->
  ?index_statistics:index_statistics ->
  ?document_metadata_configurations:document_metadata_configuration list ->
  ?updated_at:float ->
  ?created_at:float ->
  ?description:string ->
  ?status:index_status ->
  ?server_side_encryption_configuration:server_side_encryption_configuration ->
  ?role_arn:string ->
  ?edition:index_edition ->
  ?id:string ->
  ?name:string ->
  unit
-> describe_index_response
(** Create a {!type-describe_index_response} type *)

val make_describe_index_request : id:string -> unit
-> describe_index_request
(** Create a {!type-describe_index_request} type *)

val make_describe_featured_results_set_response :
  ?creation_timestamp:int ->
  ?last_updated_timestamp:int ->
  ?featured_documents_missing:featured_document_missing list ->
  ?featured_documents_with_metadata:featured_document_with_metadata list ->
  ?query_texts:string list ->
  ?status:featured_results_set_status ->
  ?description:string ->
  ?featured_results_set_name:string ->
  ?featured_results_set_id:string ->
  unit
-> describe_featured_results_set_response
(** Create a {!type-describe_featured_results_set_response} type *)

val make_describe_featured_results_set_request :
  featured_results_set_id:string -> index_id:string -> unit
-> describe_featured_results_set_request
(** Create a {!type-describe_featured_results_set_request} type *)

val make_describe_faq_response :
  ?language_code:string ->
  ?file_format:faq_file_format ->
  ?error_message:string ->
  ?role_arn:string ->
  ?status:faq_status ->
  ?s3_path:s3_path ->
  ?updated_at:float ->
  ?created_at:float ->
  ?description:string ->
  ?name:string ->
  ?index_id:string ->
  ?id:string ->
  unit
-> describe_faq_response
(** Create a {!type-describe_faq_response} type *)

val make_describe_faq_request : index_id:string -> id:string -> unit
-> describe_faq_request
(** Create a {!type-describe_faq_request} type *)

val make_describe_experience_response :
  ?error_message:string ->
  ?role_arn:string ->
  ?status:experience_status ->
  ?description:string ->
  ?updated_at:float ->
  ?created_at:float ->
  ?configuration:experience_configuration ->
  ?endpoints:experience_endpoint list ->
  ?name:string ->
  ?index_id:string ->
  ?id:string ->
  unit
-> describe_experience_response
(** Create a {!type-describe_experience_response} type *)

val make_describe_experience_request : index_id:string -> id:string -> unit
-> describe_experience_request
(** Create a {!type-describe_experience_request} type *)

val make_describe_data_source_response :
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration ->
  ?language_code:string ->
  ?error_message:string ->
  ?role_arn:string ->
  ?schedule:string ->
  ?status:data_source_status ->
  ?description:string ->
  ?updated_at:float ->
  ?created_at:float ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?configuration:data_source_configuration ->
  ?type_:data_source_type ->
  ?name:string ->
  ?index_id:string ->
  ?id:string ->
  unit
-> describe_data_source_response
(** Create a {!type-describe_data_source_response} type *)

val make_describe_data_source_request : index_id:string -> id:string -> unit
-> describe_data_source_request
(** Create a {!type-describe_data_source_request} type *)

val make_describe_access_control_configuration_response :
  ?hierarchical_access_control_list:hierarchical_principal list ->
  ?access_control_list:principal list ->
  ?error_message:string ->
  ?description:string ->
  name:string ->
  unit
-> describe_access_control_configuration_response
(** Create a {!type-describe_access_control_configuration_response} type *)

val make_describe_access_control_configuration_request :
  id:string -> index_id:string -> unit
-> describe_access_control_configuration_request
(** Create a {!type-describe_access_control_configuration_request} type *)

val make_delete_thesaurus_request : index_id:string -> id:string -> unit
-> delete_thesaurus_request
(** Create a {!type-delete_thesaurus_request} type *)

val make_delete_query_suggestions_block_list_request :
  id:string -> index_id:string -> unit
-> delete_query_suggestions_block_list_request
(** Create a {!type-delete_query_suggestions_block_list_request} type *)

val make_delete_principal_mapping_request :
  ?ordering_id:int ->
  ?data_source_id:string ->
  group_id:string ->
  index_id:string ->
  unit
-> delete_principal_mapping_request
(** Create a {!type-delete_principal_mapping_request} type *)

val make_delete_index_request : id:string -> unit
-> delete_index_request
(** Create a {!type-delete_index_request} type *)

val make_delete_faq_request : index_id:string -> id:string -> unit
-> delete_faq_request
(** Create a {!type-delete_faq_request} type *)

val make_delete_experience_response : unit
-> delete_experience_response
(** Create a {!type-delete_experience_response} type *)

val make_delete_experience_request : index_id:string -> id:string -> unit
-> delete_experience_request
(** Create a {!type-delete_experience_request} type *)

val make_delete_data_source_request : index_id:string -> id:string -> unit
-> delete_data_source_request
(** Create a {!type-delete_data_source_request} type *)

val make_delete_access_control_configuration_response : unit
-> delete_access_control_configuration_response
(** Create a {!type-delete_access_control_configuration_response} type *)

val make_delete_access_control_configuration_request :
  id:string -> index_id:string -> unit
-> delete_access_control_configuration_request
(** Create a {!type-delete_access_control_configuration_request} type *)

val make_data_source_sync_job_metric_target :
  ?data_source_sync_job_id:string -> data_source_id:string -> unit
-> data_source_sync_job_metric_target
(** Create a {!type-data_source_sync_job_metric_target} type *)

val make_create_thesaurus_response : ?id:string -> unit
-> create_thesaurus_response
(** Create a {!type-create_thesaurus_response} type *)

val make_create_thesaurus_request :
  ?client_token:string ->
  ?tags:tag list ->
  ?description:string ->
  source_s3_path:s3_path ->
  role_arn:string ->
  name:string ->
  index_id:string ->
  unit
-> create_thesaurus_request
(** Create a {!type-create_thesaurus_request} type *)

val make_create_query_suggestions_block_list_response : ?id:string -> unit
-> create_query_suggestions_block_list_response
(** Create a {!type-create_query_suggestions_block_list_response} type *)

val make_create_query_suggestions_block_list_request :
  ?tags:tag list ->
  ?client_token:string ->
  ?description:string ->
  role_arn:string ->
  source_s3_path:s3_path ->
  name:string ->
  index_id:string ->
  unit
-> create_query_suggestions_block_list_request
(** Create a {!type-create_query_suggestions_block_list_request} type *)

val make_create_index_response : ?id:string -> unit
-> create_index_response
(** Create a {!type-create_index_response} type *)

val make_create_index_request :
  ?user_group_resolution_configuration:user_group_resolution_configuration ->
  ?user_context_policy:user_context_policy ->
  ?user_token_configurations:user_token_configuration list ->
  ?tags:tag list ->
  ?client_token:string ->
  ?description:string ->
  ?server_side_encryption_configuration:server_side_encryption_configuration ->
  ?edition:index_edition ->
  role_arn:string ->
  name:string ->
  unit
-> create_index_request
(** Create a {!type-create_index_request} type *)

val make_create_featured_results_set_response :
  ?featured_results_set:featured_results_set -> unit
-> create_featured_results_set_response
(** Create a {!type-create_featured_results_set_response} type *)

val make_create_featured_results_set_request :
  ?tags:tag list ->
  ?featured_documents:featured_document list ->
  ?query_texts:string list ->
  ?status:featured_results_set_status ->
  ?client_token:string ->
  ?description:string ->
  featured_results_set_name:string ->
  index_id:string ->
  unit
-> create_featured_results_set_request
(** Create a {!type-create_featured_results_set_request} type *)

val make_create_faq_response : ?id:string -> unit
-> create_faq_response
(** Create a {!type-create_faq_response} type *)

val make_create_faq_request :
  ?language_code:string ->
  ?client_token:string ->
  ?file_format:faq_file_format ->
  ?tags:tag list ->
  ?description:string ->
  role_arn:string ->
  s3_path:s3_path ->
  name:string ->
  index_id:string ->
  unit
-> create_faq_request
(** Create a {!type-create_faq_request} type *)

val make_create_experience_response : id:string -> unit
-> create_experience_response
(** Create a {!type-create_experience_response} type *)

val make_create_experience_request :
  ?client_token:string ->
  ?description:string ->
  ?configuration:experience_configuration ->
  ?role_arn:string ->
  index_id:string ->
  name:string ->
  unit
-> create_experience_request
(** Create a {!type-create_experience_request} type *)

val make_create_data_source_response : id:string -> unit
-> create_data_source_response
(** Create a {!type-create_data_source_response} type *)

val make_create_data_source_request :
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration ->
  ?language_code:string ->
  ?client_token:string ->
  ?tags:tag list ->
  ?role_arn:string ->
  ?schedule:string ->
  ?description:string ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?configuration:data_source_configuration ->
  type_:data_source_type ->
  index_id:string ->
  name:string ->
  unit
-> create_data_source_request
(** Create a {!type-create_data_source_request} type *)

val make_create_access_control_configuration_response : id:string -> unit
-> create_access_control_configuration_response
(** Create a {!type-create_access_control_configuration_response} type *)

val make_create_access_control_configuration_request :
  ?client_token:string ->
  ?hierarchical_access_control_list:hierarchical_principal list ->
  ?access_control_list:principal list ->
  ?description:string ->
  name:string ->
  index_id:string ->
  unit
-> create_access_control_configuration_request
(** Create a {!type-create_access_control_configuration_request} type *)

val make_clear_query_suggestions_request : index_id:string -> unit
-> clear_query_suggestions_request
(** Create a {!type-clear_query_suggestions_request} type *)

val make_batch_put_document_response_failed_document :
  ?error_message:string -> ?error_code:error_code -> ?id:string -> unit
-> batch_put_document_response_failed_document
(** Create a {!type-batch_put_document_response_failed_document} type *)

val make_batch_put_document_response :
  ?failed_documents:batch_put_document_response_failed_document list -> unit
-> batch_put_document_response
(** Create a {!type-batch_put_document_response} type *)

val make_batch_put_document_request :
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration ->
  ?role_arn:string ->
  documents:document list ->
  index_id:string ->
  unit
-> batch_put_document_request
(** Create a {!type-batch_put_document_request} type *)

val make_batch_get_document_status_response_error :
  ?error_message:string ->
  ?error_code:error_code ->
  ?document_id:string ->
  unit
-> batch_get_document_status_response_error
(** Create a {!type-batch_get_document_status_response_error} type *)

val make_batch_get_document_status_response :
  ?document_status_list:status list ->
  ?errors:batch_get_document_status_response_error list ->
  unit
-> batch_get_document_status_response
(** Create a {!type-batch_get_document_status_response} type *)

val make_batch_get_document_status_request :
  document_info_list:document_info list -> index_id:string -> unit
-> batch_get_document_status_request
(** Create a {!type-batch_get_document_status_request} type *)

val make_batch_delete_featured_results_set_error :
  error_message:string -> error_code:error_code -> id:string -> unit
-> batch_delete_featured_results_set_error
(** Create a {!type-batch_delete_featured_results_set_error} type *)

val make_batch_delete_featured_results_set_response :
  errors:batch_delete_featured_results_set_error list -> unit
-> batch_delete_featured_results_set_response
(** Create a {!type-batch_delete_featured_results_set_response} type *)

val make_batch_delete_featured_results_set_request :
  featured_results_set_ids:string list -> index_id:string -> unit
-> batch_delete_featured_results_set_request
(** Create a {!type-batch_delete_featured_results_set_request} type *)

val make_batch_delete_document_response_failed_document :
  ?error_message:string -> ?error_code:error_code -> ?id:string -> unit
-> batch_delete_document_response_failed_document
(** Create a {!type-batch_delete_document_response_failed_document} type *)

val make_batch_delete_document_response :
  ?failed_documents:batch_delete_document_response_failed_document list ->
  unit
-> batch_delete_document_response
(** Create a {!type-batch_delete_document_response} type *)

val make_batch_delete_document_request :
  ?data_source_sync_job_metric_target:data_source_sync_job_metric_target ->
  document_id_list:string list ->
  index_id:string ->
  unit
-> batch_delete_document_request
(** Create a {!type-batch_delete_document_request} type *)

val make_associate_personas_to_entities_response :
  ?failed_entity_list:failed_entity list -> unit
-> associate_personas_to_entities_response
(** Create a {!type-associate_personas_to_entities_response} type *)

val make_associate_personas_to_entities_request :
  personas:entity_persona_configuration list ->
  index_id:string ->
  id:string ->
  unit
-> associate_personas_to_entities_request
(** Create a {!type-associate_personas_to_entities_request} type *)

val make_associate_entities_to_experience_response :
  ?failed_entity_list:failed_entity list -> unit
-> associate_entities_to_experience_response
(** Create a {!type-associate_entities_to_experience_response} type *)

val make_associate_entities_to_experience_request :
  entity_list:entity_configuration list ->
  index_id:string ->
  id:string ->
  unit
-> associate_entities_to_experience_request
(** Create a {!type-associate_entities_to_experience_request} type *)

