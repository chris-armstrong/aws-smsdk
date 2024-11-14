open Smaws_Lib.Json.SerializeHelpers

open Types

let organization_id_to_yojson = string_to_yojson

let boolean__to_yojson = bool_to_yojson

let data_source_inclusions_exclusions_strings_member_to_yojson = 
  string_to_yojson

let data_source_inclusions_exclusions_strings_to_yojson = 
  fun tree -> list_to_yojson data_source_inclusions_exclusions_strings_member_to_yojson tree

let data_source_field_name_to_yojson = string_to_yojson

let data_source_date_field_format_to_yojson = string_to_yojson

let index_field_name_to_yojson = string_to_yojson

let data_source_to_index_field_mapping_to_yojson = 
  fun (x: data_source_to_index_field_mapping) -> assoc_to_yojson(
    [(
         "IndexFieldName",
         (Some (index_field_name_to_yojson x.index_field_name)));
       (
         "DateFieldFormat",
         (option_to_yojson data_source_date_field_format_to_yojson x.date_field_format));
       (
         "DataSourceFieldName",
         (Some (data_source_field_name_to_yojson x.data_source_field_name)));
       
  ])

let data_source_to_index_field_mapping_list_to_yojson = 
  fun tree -> list_to_yojson data_source_to_index_field_mapping_to_yojson tree

let work_docs_configuration_to_yojson = 
  fun (x: work_docs_configuration) -> assoc_to_yojson(
    [(
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "UseChangeLog",
         (option_to_yojson boolean__to_yojson x.use_change_log));
       (
         "CrawlComments",
         (option_to_yojson boolean__to_yojson x.crawl_comments));
       (
         "OrganizationId",
         (Some (organization_id_to_yojson x.organization_id)));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let web_crawler_mode_to_yojson = 
  fun (x: web_crawler_mode) -> match x with 
 
| EVERYTHING -> `String "EVERYTHING"
  | SUBDOMAINS -> `String "SUBDOMAINS"
  | HOST_ONLY -> `String "HOST_ONLY"
   

let seed_url_to_yojson = string_to_yojson

let seed_url_list_to_yojson = 
  fun tree -> list_to_yojson seed_url_to_yojson tree

let seed_url_configuration_to_yojson = 
  fun (x: seed_url_configuration) -> assoc_to_yojson(
    [(
         "WebCrawlerMode",
         (option_to_yojson web_crawler_mode_to_yojson x.web_crawler_mode));
       (
         "SeedUrls",
         (Some (seed_url_list_to_yojson x.seed_urls)));
       
  ])

let site_map_to_yojson = string_to_yojson

let site_maps_list_to_yojson = 
  fun tree -> list_to_yojson site_map_to_yojson tree

let site_maps_configuration_to_yojson = 
  fun (x: site_maps_configuration) -> assoc_to_yojson(
    [(
         "SiteMaps",
         (Some (site_maps_list_to_yojson x.site_maps)));
       
  ])

let urls_to_yojson = 
  fun (x: urls) -> assoc_to_yojson(
    [(
         "SiteMapsConfiguration",
         (option_to_yojson site_maps_configuration_to_yojson x.site_maps_configuration));
       (
         "SeedUrlConfiguration",
         (option_to_yojson seed_url_configuration_to_yojson x.seed_url_configuration));
       
  ])

let crawl_depth_to_yojson = int_to_yojson

let max_links_per_page_to_yojson = int_to_yojson

let max_content_size_per_page_in_mega_bytes_to_yojson = float_to_yojson

let max_urls_per_minute_crawl_rate_to_yojson = int_to_yojson

let host_to_yojson = string_to_yojson

let port_to_yojson = int_to_yojson

let secret_arn_to_yojson = string_to_yojson

let proxy_configuration_to_yojson = 
  fun (x: proxy_configuration) -> assoc_to_yojson(
    [(
         "Credentials",
         (option_to_yojson secret_arn_to_yojson x.credentials));
       (
         "Port",
         (Some (port_to_yojson x.port)));
       (
         "Host",
         (Some (host_to_yojson x.host)));
       
  ])

let basic_authentication_configuration_to_yojson = 
  fun (x: basic_authentication_configuration) -> assoc_to_yojson(
    [(
         "Credentials",
         (Some (secret_arn_to_yojson x.credentials)));
       (
         "Port",
         (Some (port_to_yojson x.port)));
       (
         "Host",
         (Some (host_to_yojson x.host)));
       
  ])

let basic_authentication_configuration_list_to_yojson = 
  fun tree -> list_to_yojson basic_authentication_configuration_to_yojson tree

let authentication_configuration_to_yojson = 
  fun (x: authentication_configuration) -> assoc_to_yojson(
    [(
         "BasicAuthentication",
         (option_to_yojson basic_authentication_configuration_list_to_yojson x.basic_authentication));
       
  ])

let web_crawler_configuration_to_yojson = 
  fun (x: web_crawler_configuration) -> assoc_to_yojson(
    [(
         "AuthenticationConfiguration",
         (option_to_yojson authentication_configuration_to_yojson x.authentication_configuration));
       (
         "ProxyConfiguration",
         (option_to_yojson proxy_configuration_to_yojson x.proxy_configuration));
       (
         "UrlExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.url_exclusion_patterns));
       (
         "UrlInclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.url_inclusion_patterns));
       (
         "MaxUrlsPerMinuteCrawlRate",
         (option_to_yojson max_urls_per_minute_crawl_rate_to_yojson x.max_urls_per_minute_crawl_rate));
       (
         "MaxContentSizePerPageInMegaBytes",
         (option_to_yojson max_content_size_per_page_in_mega_bytes_to_yojson x.max_content_size_per_page_in_mega_bytes));
       (
         "MaxLinksPerPage",
         (option_to_yojson max_links_per_page_to_yojson x.max_links_per_page));
       (
         "CrawlDepth",
         (option_to_yojson crawl_depth_to_yojson x.crawl_depth));
       (
         "Urls",
         (Some (urls_to_yojson x.urls)));
       
  ])

let warning_message_to_yojson = string_to_yojson

let warning_code_to_yojson = 
  fun (x: warning_code) -> match x with 
  | QUERY_LANGUAGE_INVALID_SYNTAX -> `String "QUERY_LANGUAGE_INVALID_SYNTAX"
     

let warning_to_yojson = 
  fun (x: warning) -> assoc_to_yojson(
    [(
         "Code",
         (option_to_yojson warning_code_to_yojson x.code));
       (
         "Message",
         (option_to_yojson warning_message_to_yojson x.message));
       
  ])

let warning_list_to_yojson = 
  fun tree -> list_to_yojson warning_to_yojson tree

let vpc_security_group_id_to_yojson = string_to_yojson

let visitor_id_to_yojson = string_to_yojson

let value_importance_map_key_to_yojson = string_to_yojson

let importance_to_yojson = int_to_yojson

let value_importance_map_to_yojson = 
  fun tree -> map_to_yojson importance_to_yojson tree

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let key_location_to_yojson = 
  fun (x: key_location) -> match x with 
  | SECRET_MANAGER -> `String "SECRET_MANAGER"
    | URL -> `String "URL"
     

let url_to_yojson = string_to_yojson

let role_arn_to_yojson = string_to_yojson

let user_name_attribute_field_to_yojson = string_to_yojson

let group_attribute_field_to_yojson = string_to_yojson

let issuer_to_yojson = string_to_yojson

let claim_regex_to_yojson = string_to_yojson

let jwt_token_type_configuration_to_yojson = 
  fun (x: jwt_token_type_configuration) -> assoc_to_yojson(
    [(
         "ClaimRegex",
         (option_to_yojson claim_regex_to_yojson x.claim_regex));
       (
         "Issuer",
         (option_to_yojson issuer_to_yojson x.issuer));
       (
         "GroupAttributeField",
         (option_to_yojson group_attribute_field_to_yojson x.group_attribute_field));
       (
         "UserNameAttributeField",
         (option_to_yojson user_name_attribute_field_to_yojson x.user_name_attribute_field));
       (
         "SecretManagerArn",
         (option_to_yojson role_arn_to_yojson x.secret_manager_arn));
       (
         "URL",
         (option_to_yojson url_to_yojson x.ur_l));
       (
         "KeyLocation",
         (Some (key_location_to_yojson x.key_location)));
       
  ])

let string__to_yojson = string_to_yojson

let json_token_type_configuration_to_yojson = 
  fun (x: json_token_type_configuration) -> assoc_to_yojson(
    [(
         "GroupAttributeField",
         (Some (string__to_yojson x.group_attribute_field)));
       (
         "UserNameAttributeField",
         (Some (string__to_yojson x.user_name_attribute_field)));
       
  ])

let user_token_configuration_to_yojson = 
  fun (x: user_token_configuration) -> assoc_to_yojson(
    [(
         "JsonTokenTypeConfiguration",
         (option_to_yojson json_token_type_configuration_to_yojson x.json_token_type_configuration));
       (
         "JwtTokenTypeConfiguration",
         (option_to_yojson jwt_token_type_configuration_to_yojson x.jwt_token_type_configuration));
       
  ])

let user_token_configuration_list_to_yojson = 
  fun tree -> list_to_yojson user_token_configuration_to_yojson tree

let identity_attribute_name_to_yojson = string_to_yojson

let user_identity_configuration_to_yojson = 
  fun (x: user_identity_configuration) -> assoc_to_yojson(
    [(
         "IdentityAttributeName",
         (option_to_yojson identity_attribute_name_to_yojson x.identity_attribute_name));
       
  ])

let user_id_to_yojson = string_to_yojson

let user_group_resolution_mode_to_yojson = 
  fun (x: user_group_resolution_mode) -> match x with 
  | NONE -> `String "NONE"
    | AWS_SSO -> `String "AWS_SSO"
     

let user_group_resolution_configuration_to_yojson = 
  fun (x: user_group_resolution_configuration) -> assoc_to_yojson(
    [(
         "UserGroupResolutionMode",
         (Some (user_group_resolution_mode_to_yojson x.user_group_resolution_mode)));
       
  ])

let user_context_policy_to_yojson = 
  fun (x: user_context_policy) -> match x with 
 
| USER_TOKEN -> `String "USER_TOKEN"
  | ATTRIBUTE_FILTER -> `String "ATTRIBUTE_FILTER"
   

let token_to_yojson = string_to_yojson

let principal_name_to_yojson = string_to_yojson

let groups_to_yojson = 
  fun tree -> list_to_yojson principal_name_to_yojson tree

let data_source_id_to_yojson = string_to_yojson

let data_source_group_to_yojson = 
  fun (x: data_source_group) -> assoc_to_yojson(
    [(
         "DataSourceId",
         (Some (data_source_id_to_yojson x.data_source_id)));
       (
         "GroupId",
         (Some (principal_name_to_yojson x.group_id)));
       
  ])

let data_source_groups_to_yojson = 
  fun tree -> list_to_yojson data_source_group_to_yojson tree

let user_context_to_yojson = 
  fun (x: user_context) -> assoc_to_yojson(
    [(
         "DataSourceGroups",
         (option_to_yojson data_source_groups_to_yojson x.data_source_groups));
       (
         "Groups",
         (option_to_yojson groups_to_yojson x.groups));
       (
         "UserId",
         (option_to_yojson principal_name_to_yojson x.user_id));
       (
         "Token",
         (option_to_yojson token_to_yojson x.token));
       
  ])

let user_account_to_yojson = string_to_yojson

let thesaurus_id_to_yojson = string_to_yojson

let thesaurus_name_to_yojson = string_to_yojson

let index_id_to_yojson = string_to_yojson

let description_to_yojson = string_to_yojson

let s3_bucket_name_to_yojson = string_to_yojson

let s3_object_key_to_yojson = string_to_yojson

let s3_path_to_yojson = 
  fun (x: s3_path) -> assoc_to_yojson(
    [(
         "Key",
         (Some (s3_object_key_to_yojson x.key)));
       (
         "Bucket",
         (Some (s3_bucket_name_to_yojson x.bucket)));
       
  ])

let update_thesaurus_request_to_yojson = 
  fun (x: update_thesaurus_request) -> assoc_to_yojson(
    [(
         "SourceS3Path",
         (option_to_yojson s3_path_to_yojson x.source_s3_path));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Name",
         (option_to_yojson thesaurus_name_to_yojson x.name));
       (
         "Id",
         (Some (thesaurus_id_to_yojson x.id)));
       
  ])

let throttling_exception_to_yojson = 
  fun (x: throttling_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let internal_server_exception_to_yojson = 
  fun (x: internal_server_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let mode_to_yojson = 
  fun (x: mode) -> match x with 
  | LEARN_ONLY -> `String "LEARN_ONLY"
    | ENABLED -> `String "ENABLED"
     

let integer__to_yojson = int_to_yojson

let object_boolean_to_yojson = bool_to_yojson

let minimum_number_of_querying_users_to_yojson = int_to_yojson

let minimum_query_count_to_yojson = int_to_yojson

let document_attribute_key_to_yojson = string_to_yojson

let suggestable_config_to_yojson = 
  fun (x: suggestable_config) -> assoc_to_yojson(
    [(
         "Suggestable",
         (option_to_yojson object_boolean_to_yojson x.suggestable));
       (
         "AttributeName",
         (option_to_yojson document_attribute_key_to_yojson x.attribute_name));
       
  ])

let suggestable_config_list_to_yojson = 
  fun tree -> list_to_yojson suggestable_config_to_yojson tree

let attribute_suggestions_mode_to_yojson = 
  fun (x: attribute_suggestions_mode) -> match x with 
  | INACTIVE -> `String "INACTIVE"
    | ACTIVE -> `String "ACTIVE"
     

let attribute_suggestions_update_config_to_yojson = 
  fun (x: attribute_suggestions_update_config) -> assoc_to_yojson(
    [(
         "AttributeSuggestionsMode",
         (option_to_yojson attribute_suggestions_mode_to_yojson x.attribute_suggestions_mode));
       (
         "SuggestableConfigList",
         (option_to_yojson suggestable_config_list_to_yojson x.suggestable_config_list));
       
  ])

let update_query_suggestions_config_request_to_yojson = 
  fun (x: update_query_suggestions_config_request) -> assoc_to_yojson(
    [(
         "AttributeSuggestionsConfig",
         (option_to_yojson attribute_suggestions_update_config_to_yojson x.attribute_suggestions_config));
       (
         "MinimumQueryCount",
         (option_to_yojson minimum_query_count_to_yojson x.minimum_query_count));
       (
         "MinimumNumberOfQueryingUsers",
         (option_to_yojson minimum_number_of_querying_users_to_yojson x.minimum_number_of_querying_users));
       (
         "IncludeQueriesWithoutUserInformation",
         (option_to_yojson object_boolean_to_yojson x.include_queries_without_user_information));
       (
         "QueryLogLookBackWindowInDays",
         (option_to_yojson integer__to_yojson x.query_log_look_back_window_in_days));
       (
         "Mode",
         (option_to_yojson mode_to_yojson x.mode));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let query_suggestions_block_list_id_to_yojson = string_to_yojson

let query_suggestions_block_list_name_to_yojson = string_to_yojson

let update_query_suggestions_block_list_request_to_yojson = 
  fun (x: update_query_suggestions_block_list_request) -> assoc_to_yojson(
    [(
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "SourceS3Path",
         (option_to_yojson s3_path_to_yojson x.source_s3_path));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson query_suggestions_block_list_name_to_yojson x.name));
       (
         "Id",
         (Some (query_suggestions_block_list_id_to_yojson x.id)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let index_name_to_yojson = string_to_yojson

let document_metadata_configuration_name_to_yojson = string_to_yojson

let document_attribute_value_type_to_yojson = 
  fun (x: document_attribute_value_type) -> match x with 
 
| DATE_VALUE -> `String "DATE_VALUE"
  | LONG_VALUE -> `String "LONG_VALUE"
  | STRING_LIST_VALUE -> `String "STRING_LIST_VALUE"
  | STRING_VALUE -> `String "STRING_VALUE"
   

let document_metadata_boolean_to_yojson = bool_to_yojson

let duration_to_yojson = string_to_yojson

let order_to_yojson = 
  fun (x: order) -> match x with 
  | DESCENDING -> `String "DESCENDING"
    | ASCENDING -> `String "ASCENDING"
     

let relevance_to_yojson = 
  fun (x: relevance) -> assoc_to_yojson(
    [(
         "ValueImportanceMap",
         (option_to_yojson value_importance_map_to_yojson x.value_importance_map));
       (
         "RankOrder",
         (option_to_yojson order_to_yojson x.rank_order));
       (
         "Duration",
         (option_to_yojson duration_to_yojson x.duration));
       (
         "Importance",
         (option_to_yojson importance_to_yojson x.importance));
       (
         "Freshness",
         (option_to_yojson document_metadata_boolean_to_yojson x.freshness));
       
  ])

let search_to_yojson = 
  fun (x: search) -> assoc_to_yojson(
    [(
         "Sortable",
         (option_to_yojson boolean__to_yojson x.sortable));
       (
         "Displayable",
         (option_to_yojson boolean__to_yojson x.displayable));
       (
         "Searchable",
         (option_to_yojson boolean__to_yojson x.searchable));
       (
         "Facetable",
         (option_to_yojson boolean__to_yojson x.facetable));
       
  ])

let document_metadata_configuration_to_yojson = 
  fun (x: document_metadata_configuration) -> assoc_to_yojson(
    [(
         "Search",
         (option_to_yojson search_to_yojson x.search));
       (
         "Relevance",
         (option_to_yojson relevance_to_yojson x.relevance));
       (
         "Type",
         (Some (document_attribute_value_type_to_yojson x.type_)));
       (
         "Name",
         (Some (document_metadata_configuration_name_to_yojson x.name)));
       
  ])

let document_metadata_configuration_list_to_yojson = 
  fun tree -> list_to_yojson document_metadata_configuration_to_yojson tree

let storage_capacity_unit_to_yojson = int_to_yojson

let query_capacity_unit_to_yojson = int_to_yojson

let capacity_units_configuration_to_yojson = 
  fun (x: capacity_units_configuration) -> assoc_to_yojson(
    [(
         "QueryCapacityUnits",
         (Some (query_capacity_unit_to_yojson x.query_capacity_units)));
       (
         "StorageCapacityUnits",
         (Some (storage_capacity_unit_to_yojson x.storage_capacity_units)));
       
  ])

let update_index_request_to_yojson = 
  fun (x: update_index_request) -> assoc_to_yojson(
    [(
         "UserGroupResolutionConfiguration",
         (option_to_yojson user_group_resolution_configuration_to_yojson x.user_group_resolution_configuration));
       (
         "UserContextPolicy",
         (option_to_yojson user_context_policy_to_yojson x.user_context_policy));
       (
         "UserTokenConfigurations",
         (option_to_yojson user_token_configuration_list_to_yojson x.user_token_configurations));
       (
         "CapacityUnits",
         (option_to_yojson capacity_units_configuration_to_yojson x.capacity_units));
       (
         "DocumentMetadataConfigurationUpdates",
         (option_to_yojson document_metadata_configuration_list_to_yojson x.document_metadata_configuration_updates));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Name",
         (option_to_yojson index_name_to_yojson x.name));
       (
         "Id",
         (Some (index_id_to_yojson x.id)));
       
  ])

let service_quota_exceeded_exception_to_yojson = 
  fun (x: service_quota_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let featured_results_set_id_to_yojson = string_to_yojson

let featured_results_set_name_to_yojson = string_to_yojson

let featured_results_set_description_to_yojson = string_to_yojson

let featured_results_set_status_to_yojson = 
  fun (x: featured_results_set_status) -> match x with 
  | INACTIVE -> `String "INACTIVE"
    | ACTIVE -> `String "ACTIVE"
     

let query_text_to_yojson = string_to_yojson

let query_text_list_to_yojson = 
  fun tree -> list_to_yojson query_text_to_yojson tree

let document_id_to_yojson = string_to_yojson

let featured_document_to_yojson = 
  fun (x: featured_document) -> assoc_to_yojson(
    [(
         "Id",
         (option_to_yojson document_id_to_yojson x.id));
       
  ])

let featured_document_list_to_yojson = 
  fun tree -> list_to_yojson featured_document_to_yojson tree

let long_to_yojson = long_to_yojson

let featured_results_set_to_yojson = 
  fun (x: featured_results_set) -> assoc_to_yojson(
    [(
         "CreationTimestamp",
         (option_to_yojson long_to_yojson x.creation_timestamp));
       (
         "LastUpdatedTimestamp",
         (option_to_yojson long_to_yojson x.last_updated_timestamp));
       (
         "FeaturedDocuments",
         (option_to_yojson featured_document_list_to_yojson x.featured_documents));
       (
         "QueryTexts",
         (option_to_yojson query_text_list_to_yojson x.query_texts));
       (
         "Status",
         (option_to_yojson featured_results_set_status_to_yojson x.status));
       (
         "Description",
         (option_to_yojson featured_results_set_description_to_yojson x.description));
       (
         "FeaturedResultsSetName",
         (option_to_yojson featured_results_set_name_to_yojson x.featured_results_set_name));
       (
         "FeaturedResultsSetId",
         (option_to_yojson featured_results_set_id_to_yojson x.featured_results_set_id));
       
  ])

let update_featured_results_set_response_to_yojson = 
  fun (x: update_featured_results_set_response) -> assoc_to_yojson(
    [(
         "FeaturedResultsSet",
         (option_to_yojson featured_results_set_to_yojson x.featured_results_set));
       
  ])

let update_featured_results_set_request_to_yojson = 
  fun (x: update_featured_results_set_request) -> assoc_to_yojson(
    [(
         "FeaturedDocuments",
         (option_to_yojson featured_document_list_to_yojson x.featured_documents));
       (
         "QueryTexts",
         (option_to_yojson query_text_list_to_yojson x.query_texts));
       (
         "Status",
         (option_to_yojson featured_results_set_status_to_yojson x.status));
       (
         "Description",
         (option_to_yojson featured_results_set_description_to_yojson x.description));
       (
         "FeaturedResultsSetName",
         (option_to_yojson featured_results_set_name_to_yojson x.featured_results_set_name));
       (
         "FeaturedResultsSetId",
         (Some (featured_results_set_id_to_yojson x.featured_results_set_id)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let conflicting_item_to_yojson = 
  fun (x: conflicting_item) -> assoc_to_yojson(
    [(
         "SetId",
         (option_to_yojson string__to_yojson x.set_id));
       (
         "SetName",
         (option_to_yojson string__to_yojson x.set_name));
       (
         "QueryText",
         (option_to_yojson query_text_to_yojson x.query_text));
       
  ])

let conflicting_items_to_yojson = 
  fun tree -> list_to_yojson conflicting_item_to_yojson tree

let featured_results_conflict_exception_to_yojson = 
  fun (x: featured_results_conflict_exception) -> assoc_to_yojson(
    [(
         "ConflictingItems",
         (option_to_yojson conflicting_items_to_yojson x.conflicting_items));
       (
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let experience_id_to_yojson = string_to_yojson

let experience_name_to_yojson = string_to_yojson

let data_source_id_list_to_yojson = 
  fun tree -> list_to_yojson data_source_id_to_yojson tree

let faq_id_to_yojson = string_to_yojson

let faq_ids_list_to_yojson = 
  fun tree -> list_to_yojson faq_id_to_yojson tree

let content_source_configuration_to_yojson = 
  fun (x: content_source_configuration) -> assoc_to_yojson(
    [(
         "DirectPutContent",
         (option_to_yojson boolean__to_yojson x.direct_put_content));
       (
         "FaqIds",
         (option_to_yojson faq_ids_list_to_yojson x.faq_ids));
       (
         "DataSourceIds",
         (option_to_yojson data_source_id_list_to_yojson x.data_source_ids));
       
  ])

let experience_configuration_to_yojson = 
  fun (x: experience_configuration) -> assoc_to_yojson(
    [(
         "UserIdentityConfiguration",
         (option_to_yojson user_identity_configuration_to_yojson x.user_identity_configuration));
       (
         "ContentSourceConfiguration",
         (option_to_yojson content_source_configuration_to_yojson x.content_source_configuration));
       
  ])

let update_experience_request_to_yojson = 
  fun (x: update_experience_request) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Configuration",
         (option_to_yojson experience_configuration_to_yojson x.configuration));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Name",
         (option_to_yojson experience_name_to_yojson x.name));
       (
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let data_source_name_to_yojson = string_to_yojson

let documents_metadata_configuration_to_yojson = 
  fun (x: documents_metadata_configuration) -> assoc_to_yojson(
    [(
         "S3Prefix",
         (option_to_yojson s3_object_key_to_yojson x.s3_prefix));
       
  ])

let access_control_list_configuration_to_yojson = 
  fun (x: access_control_list_configuration) -> assoc_to_yojson(
    [(
         "KeyPath",
         (option_to_yojson s3_object_key_to_yojson x.key_path));
       
  ])

let s3_data_source_configuration_to_yojson = 
  fun (x: s3_data_source_configuration) -> assoc_to_yojson(
    [(
         "AccessControlListConfiguration",
         (option_to_yojson access_control_list_configuration_to_yojson x.access_control_list_configuration));
       (
         "DocumentsMetadataConfiguration",
         (option_to_yojson documents_metadata_configuration_to_yojson x.documents_metadata_configuration));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "InclusionPrefixes",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_prefixes));
       (
         "BucketName",
         (Some (s3_bucket_name_to_yojson x.bucket_name)));
       
  ])

let share_point_version_to_yojson = 
  fun (x: share_point_version) -> match x with 
 
| SHAREPOINT_2019 -> `String "SHAREPOINT_2019"
  | SHAREPOINT_ONLINE -> `String "SHAREPOINT_ONLINE"
  | SHAREPOINT_2016 -> `String "SHAREPOINT_2016"
  | SHAREPOINT_2013 -> `String "SHAREPOINT_2013"
   

let share_point_url_list_to_yojson = 
  fun tree -> list_to_yojson url_to_yojson tree

let subnet_id_to_yojson = string_to_yojson

let subnet_id_list_to_yojson = 
  fun tree -> list_to_yojson subnet_id_to_yojson tree

let security_group_id_list_to_yojson = 
  fun tree -> list_to_yojson vpc_security_group_id_to_yojson tree

let data_source_vpc_configuration_to_yojson = 
  fun (x: data_source_vpc_configuration) -> assoc_to_yojson(
    [(
         "SecurityGroupIds",
         (Some (security_group_id_list_to_yojson x.security_group_ids)));
       (
         "SubnetIds",
         (Some (subnet_id_list_to_yojson x.subnet_ids)));
       
  ])

let share_point_online_authentication_type_to_yojson = 
  fun (x: share_point_online_authentication_type) -> match x with 
  | OAUTH2 -> `String "OAUTH2"
    | HTTP_BASIC -> `String "HTTP_BASIC"
     

let share_point_configuration_to_yojson = 
  fun (x: share_point_configuration) -> assoc_to_yojson(
    [(
         "ProxyConfiguration",
         (option_to_yojson proxy_configuration_to_yojson x.proxy_configuration));
       (
         "AuthenticationType",
         (option_to_yojson share_point_online_authentication_type_to_yojson x.authentication_type));
       (
         "SslCertificateS3Path",
         (option_to_yojson s3_path_to_yojson x.ssl_certificate_s3_path));
       (
         "DisableLocalGroups",
         (option_to_yojson boolean__to_yojson x.disable_local_groups));
       (
         "DocumentTitleFieldName",
         (option_to_yojson data_source_field_name_to_yojson x.document_title_field_name));
       (
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "UseChangeLog",
         (option_to_yojson boolean__to_yojson x.use_change_log));
       (
         "CrawlAttachments",
         (option_to_yojson boolean__to_yojson x.crawl_attachments));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "Urls",
         (Some (share_point_url_list_to_yojson x.urls)));
       (
         "SharePointVersion",
         (Some (share_point_version_to_yojson x.share_point_version)));
       
  ])

let database_engine_type_to_yojson = 
  fun (x: database_engine_type) -> match x with 
 
| RDS_POSTGRESQL -> `String "RDS_POSTGRESQL"
  | RDS_MYSQL -> `String "RDS_MYSQL"
  | RDS_AURORA_POSTGRESQL -> `String "RDS_AURORA_POSTGRESQL"
  | RDS_AURORA_MYSQL -> `String "RDS_AURORA_MYSQL"
   

let database_host_to_yojson = string_to_yojson

let database_port_to_yojson = int_to_yojson

let database_name_to_yojson = string_to_yojson

let table_name_to_yojson = string_to_yojson

let connection_configuration_to_yojson = 
  fun (x: connection_configuration) -> assoc_to_yojson(
    [(
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "TableName",
         (Some (table_name_to_yojson x.table_name)));
       (
         "DatabaseName",
         (Some (database_name_to_yojson x.database_name)));
       (
         "DatabasePort",
         (Some (database_port_to_yojson x.database_port)));
       (
         "DatabaseHost",
         (Some (database_host_to_yojson x.database_host)));
       
  ])

let column_name_to_yojson = string_to_yojson

let change_detecting_columns_to_yojson = 
  fun tree -> list_to_yojson column_name_to_yojson tree

let column_configuration_to_yojson = 
  fun (x: column_configuration) -> assoc_to_yojson(
    [(
         "ChangeDetectingColumns",
         (Some (change_detecting_columns_to_yojson x.change_detecting_columns)));
       (
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "DocumentTitleColumnName",
         (option_to_yojson column_name_to_yojson x.document_title_column_name));
       (
         "DocumentDataColumnName",
         (Some (column_name_to_yojson x.document_data_column_name)));
       (
         "DocumentIdColumnName",
         (Some (column_name_to_yojson x.document_id_column_name)));
       
  ])

let acl_configuration_to_yojson = 
  fun (x: acl_configuration) -> assoc_to_yojson(
    [(
         "AllowedGroupsColumnName",
         (Some (column_name_to_yojson x.allowed_groups_column_name)));
       
  ])

let query_identifiers_enclosing_option_to_yojson = 
  fun (x: query_identifiers_enclosing_option) -> match x with 
  | NONE -> `String "NONE"
    | DOUBLE_QUOTES -> `String "DOUBLE_QUOTES"
     

let sql_configuration_to_yojson = 
  fun (x: sql_configuration) -> assoc_to_yojson(
    [(
         "QueryIdentifiersEnclosingOption",
         (option_to_yojson query_identifiers_enclosing_option_to_yojson x.query_identifiers_enclosing_option));
       
  ])

let database_configuration_to_yojson = 
  fun (x: database_configuration) -> assoc_to_yojson(
    [(
         "SqlConfiguration",
         (option_to_yojson sql_configuration_to_yojson x.sql_configuration));
       (
         "AclConfiguration",
         (option_to_yojson acl_configuration_to_yojson x.acl_configuration));
       (
         "ColumnConfiguration",
         (Some (column_configuration_to_yojson x.column_configuration)));
       (
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ConnectionConfiguration",
         (Some (connection_configuration_to_yojson x.connection_configuration)));
       (
         "DatabaseEngineType",
         (Some (database_engine_type_to_yojson x.database_engine_type)));
       
  ])

let salesforce_standard_object_name_to_yojson = 
  fun (x: salesforce_standard_object_name) -> match x with 
 
| USER -> `String "USER"
  | TASK -> `String "TASK"
  | SOLUTION -> `String "SOLUTION"
  | PROFILE -> `String "PROFILE"
  | PRODUCT -> `String "PRODUCT"
  | PRICEBOOK -> `String "PRICEBOOK"
  | PARTNER -> `String "PARTNER"
  | OPPORTUNITY -> `String "OPPORTUNITY"
  | LEAD -> `String "LEAD"
  | IDEA -> `String "IDEA"
  | GROUP -> `String "GROUP"
  | DOCUMENT -> `String "DOCUMENT"
  | CONTRACT -> `String "CONTRACT"
  | CONTACT -> `String "CONTACT"
  | CASE -> `String "CASE"
  | CAMPAIGN -> `String "CAMPAIGN"
  | ACCOUNT -> `String "ACCOUNT"
   

let salesforce_standard_object_configuration_to_yojson = 
  fun (x: salesforce_standard_object_configuration) -> assoc_to_yojson(
    [(
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "DocumentTitleFieldName",
         (option_to_yojson data_source_field_name_to_yojson x.document_title_field_name));
       (
         "DocumentDataFieldName",
         (Some (data_source_field_name_to_yojson x.document_data_field_name)));
       (
         "Name",
         (Some (salesforce_standard_object_name_to_yojson x.name)));
       
  ])

let salesforce_standard_object_configuration_list_to_yojson = 
  fun tree -> list_to_yojson salesforce_standard_object_configuration_to_yojson tree

let salesforce_knowledge_article_state_to_yojson = 
  fun (x: salesforce_knowledge_article_state) -> match x with 
 
| ARCHIVED -> `String "ARCHIVED"
  | PUBLISHED -> `String "PUBLISHED"
  | DRAFT -> `String "DRAFT"
   

let salesforce_knowledge_article_state_list_to_yojson = 
  fun tree -> list_to_yojson salesforce_knowledge_article_state_to_yojson tree

let salesforce_standard_knowledge_article_type_configuration_to_yojson = 
  fun (x: salesforce_standard_knowledge_article_type_configuration) -> assoc_to_yojson(
    [(
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "DocumentTitleFieldName",
         (option_to_yojson data_source_field_name_to_yojson x.document_title_field_name));
       (
         "DocumentDataFieldName",
         (Some (data_source_field_name_to_yojson x.document_data_field_name)));
       
  ])

let salesforce_custom_knowledge_article_type_name_to_yojson = 
  string_to_yojson

let salesforce_custom_knowledge_article_type_configuration_to_yojson = 
  fun (x: salesforce_custom_knowledge_article_type_configuration) -> assoc_to_yojson(
    [(
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "DocumentTitleFieldName",
         (option_to_yojson data_source_field_name_to_yojson x.document_title_field_name));
       (
         "DocumentDataFieldName",
         (Some (data_source_field_name_to_yojson x.document_data_field_name)));
       (
         "Name",
         (Some (salesforce_custom_knowledge_article_type_name_to_yojson x.name)));
       
  ])

let salesforce_custom_knowledge_article_type_configuration_list_to_yojson = 
  fun tree -> list_to_yojson salesforce_custom_knowledge_article_type_configuration_to_yojson tree

let salesforce_knowledge_article_configuration_to_yojson = 
  fun (x: salesforce_knowledge_article_configuration) -> assoc_to_yojson(
    [(
         "CustomKnowledgeArticleTypeConfigurations",
         (option_to_yojson salesforce_custom_knowledge_article_type_configuration_list_to_yojson x.custom_knowledge_article_type_configurations));
       (
         "StandardKnowledgeArticleTypeConfiguration",
         (option_to_yojson salesforce_standard_knowledge_article_type_configuration_to_yojson x.standard_knowledge_article_type_configuration));
       (
         "IncludedStates",
         (Some (salesforce_knowledge_article_state_list_to_yojson x.included_states)));
       
  ])

let salesforce_chatter_feed_include_filter_type_to_yojson = 
  fun (x: salesforce_chatter_feed_include_filter_type) -> match x with 
 
| STANDARD_USER -> `String "STANDARD_USER"
  | ACTIVE_USER -> `String "ACTIVE_USER"
   

let salesforce_chatter_feed_include_filter_types_to_yojson = 
  fun tree -> list_to_yojson salesforce_chatter_feed_include_filter_type_to_yojson tree

let salesforce_chatter_feed_configuration_to_yojson = 
  fun (x: salesforce_chatter_feed_configuration) -> assoc_to_yojson(
    [(
         "IncludeFilterTypes",
         (option_to_yojson salesforce_chatter_feed_include_filter_types_to_yojson x.include_filter_types));
       (
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "DocumentTitleFieldName",
         (option_to_yojson data_source_field_name_to_yojson x.document_title_field_name));
       (
         "DocumentDataFieldName",
         (Some (data_source_field_name_to_yojson x.document_data_field_name)));
       
  ])

let salesforce_standard_object_attachment_configuration_to_yojson = 
  fun (x: salesforce_standard_object_attachment_configuration) -> assoc_to_yojson(
    [(
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "DocumentTitleFieldName",
         (option_to_yojson data_source_field_name_to_yojson x.document_title_field_name));
       
  ])

let salesforce_configuration_to_yojson = 
  fun (x: salesforce_configuration) -> assoc_to_yojson(
    [(
         "ExcludeAttachmentFilePatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclude_attachment_file_patterns));
       (
         "IncludeAttachmentFilePatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.include_attachment_file_patterns));
       (
         "StandardObjectAttachmentConfiguration",
         (option_to_yojson salesforce_standard_object_attachment_configuration_to_yojson x.standard_object_attachment_configuration));
       (
         "CrawlAttachments",
         (option_to_yojson boolean__to_yojson x.crawl_attachments));
       (
         "ChatterFeedConfiguration",
         (option_to_yojson salesforce_chatter_feed_configuration_to_yojson x.chatter_feed_configuration));
       (
         "KnowledgeArticleConfiguration",
         (option_to_yojson salesforce_knowledge_article_configuration_to_yojson x.knowledge_article_configuration));
       (
         "StandardObjectConfigurations",
         (option_to_yojson salesforce_standard_object_configuration_list_to_yojson x.standard_object_configurations));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "ServerUrl",
         (Some (url_to_yojson x.server_url)));
       
  ])

let tenant_domain_to_yojson = string_to_yojson

let one_drive_user_to_yojson = string_to_yojson

let one_drive_user_list_to_yojson = 
  fun tree -> list_to_yojson one_drive_user_to_yojson tree

let one_drive_users_to_yojson = 
  fun (x: one_drive_users) -> assoc_to_yojson(
    [(
         "OneDriveUserS3Path",
         (option_to_yojson s3_path_to_yojson x.one_drive_user_s3_path));
       (
         "OneDriveUserList",
         (option_to_yojson one_drive_user_list_to_yojson x.one_drive_user_list));
       
  ])

let one_drive_configuration_to_yojson = 
  fun (x: one_drive_configuration) -> assoc_to_yojson(
    [(
         "DisableLocalGroups",
         (option_to_yojson boolean__to_yojson x.disable_local_groups));
       (
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "OneDriveUsers",
         (Some (one_drive_users_to_yojson x.one_drive_users)));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "TenantDomain",
         (Some (tenant_domain_to_yojson x.tenant_domain)));
       
  ])

let service_now_host_url_to_yojson = string_to_yojson

let service_now_build_version_type_to_yojson = 
  fun (x: service_now_build_version_type) -> match x with 
  | OTHERS -> `String "OTHERS"
    | LONDON -> `String "LONDON"
     

let service_now_knowledge_article_filter_query_to_yojson = 
  string_to_yojson

let service_now_knowledge_article_configuration_to_yojson = 
  fun (x: service_now_knowledge_article_configuration) -> assoc_to_yojson(
    [(
         "FilterQuery",
         (option_to_yojson service_now_knowledge_article_filter_query_to_yojson x.filter_query));
       (
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "DocumentTitleFieldName",
         (option_to_yojson data_source_field_name_to_yojson x.document_title_field_name));
       (
         "DocumentDataFieldName",
         (Some (data_source_field_name_to_yojson x.document_data_field_name)));
       (
         "ExcludeAttachmentFilePatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclude_attachment_file_patterns));
       (
         "IncludeAttachmentFilePatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.include_attachment_file_patterns));
       (
         "CrawlAttachments",
         (option_to_yojson boolean__to_yojson x.crawl_attachments));
       
  ])

let service_now_service_catalog_configuration_to_yojson = 
  fun (x: service_now_service_catalog_configuration) -> assoc_to_yojson(
    [(
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "DocumentTitleFieldName",
         (option_to_yojson data_source_field_name_to_yojson x.document_title_field_name));
       (
         "DocumentDataFieldName",
         (Some (data_source_field_name_to_yojson x.document_data_field_name)));
       (
         "ExcludeAttachmentFilePatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclude_attachment_file_patterns));
       (
         "IncludeAttachmentFilePatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.include_attachment_file_patterns));
       (
         "CrawlAttachments",
         (option_to_yojson boolean__to_yojson x.crawl_attachments));
       
  ])

let service_now_authentication_type_to_yojson = 
  fun (x: service_now_authentication_type) -> match x with 
  | OAUTH2 -> `String "OAUTH2"
    | HTTP_BASIC -> `String "HTTP_BASIC"
     

let service_now_configuration_to_yojson = 
  fun (x: service_now_configuration) -> assoc_to_yojson(
    [(
         "AuthenticationType",
         (option_to_yojson service_now_authentication_type_to_yojson x.authentication_type));
       (
         "ServiceCatalogConfiguration",
         (option_to_yojson service_now_service_catalog_configuration_to_yojson x.service_catalog_configuration));
       (
         "KnowledgeArticleConfiguration",
         (option_to_yojson service_now_knowledge_article_configuration_to_yojson x.knowledge_article_configuration));
       (
         "ServiceNowBuildVersion",
         (Some (service_now_build_version_type_to_yojson x.service_now_build_version)));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "HostUrl",
         (Some (service_now_host_url_to_yojson x.host_url)));
       
  ])

let confluence_version_to_yojson = 
  fun (x: confluence_version) -> match x with 
  | SERVER -> `String "SERVER"
    | CLOUD -> `String "CLOUD"
     

let confluence_space_identifier_to_yojson = string_to_yojson

let confluence_space_list_to_yojson = 
  fun tree -> list_to_yojson confluence_space_identifier_to_yojson tree

let confluence_space_field_name_to_yojson = 
  fun (x: confluence_space_field_name) -> match x with 
 
| URL -> `String "URL"
  | SPACE_KEY -> `String "SPACE_KEY"
  | ITEM_TYPE -> `String "ITEM_TYPE"
  | DISPLAY_URL -> `String "DISPLAY_URL"
   

let confluence_space_to_index_field_mapping_to_yojson = 
  fun (x: confluence_space_to_index_field_mapping) -> assoc_to_yojson(
    [(
         "IndexFieldName",
         (option_to_yojson index_field_name_to_yojson x.index_field_name));
       (
         "DateFieldFormat",
         (option_to_yojson data_source_date_field_format_to_yojson x.date_field_format));
       (
         "DataSourceFieldName",
         (option_to_yojson confluence_space_field_name_to_yojson x.data_source_field_name));
       
  ])

let confluence_space_field_mappings_list_to_yojson = 
  fun tree -> list_to_yojson confluence_space_to_index_field_mapping_to_yojson tree

let confluence_space_configuration_to_yojson = 
  fun (x: confluence_space_configuration) -> assoc_to_yojson(
    [(
         "SpaceFieldMappings",
         (option_to_yojson confluence_space_field_mappings_list_to_yojson x.space_field_mappings));
       (
         "ExcludeSpaces",
         (option_to_yojson confluence_space_list_to_yojson x.exclude_spaces));
       (
         "IncludeSpaces",
         (option_to_yojson confluence_space_list_to_yojson x.include_spaces));
       (
         "CrawlArchivedSpaces",
         (option_to_yojson boolean__to_yojson x.crawl_archived_spaces));
       (
         "CrawlPersonalSpaces",
         (option_to_yojson boolean__to_yojson x.crawl_personal_spaces));
       
  ])

let confluence_page_field_name_to_yojson = 
  fun (x: confluence_page_field_name) -> match x with 
 
| VERSION -> `String "VERSION"
  | URL -> `String "URL"
  | SPACE_NAME -> `String "SPACE_NAME"
  | SPACE_KEY -> `String "SPACE_KEY"
  | PARENT_ID -> `String "PARENT_ID"
  | MODIFIED_DATE -> `String "MODIFIED_DATE"
  | LABELS -> `String "LABELS"
  | ITEM_TYPE -> `String "ITEM_TYPE"
  | DISPLAY_URL -> `String "DISPLAY_URL"
  | CREATED_DATE -> `String "CREATED_DATE"
  | CONTENT_STATUS -> `String "CONTENT_STATUS"
  | AUTHOR -> `String "AUTHOR"
   

let confluence_page_to_index_field_mapping_to_yojson = 
  fun (x: confluence_page_to_index_field_mapping) -> assoc_to_yojson(
    [(
         "IndexFieldName",
         (option_to_yojson index_field_name_to_yojson x.index_field_name));
       (
         "DateFieldFormat",
         (option_to_yojson data_source_date_field_format_to_yojson x.date_field_format));
       (
         "DataSourceFieldName",
         (option_to_yojson confluence_page_field_name_to_yojson x.data_source_field_name));
       
  ])

let confluence_page_field_mappings_list_to_yojson = 
  fun tree -> list_to_yojson confluence_page_to_index_field_mapping_to_yojson tree

let confluence_page_configuration_to_yojson = 
  fun (x: confluence_page_configuration) -> assoc_to_yojson(
    [(
         "PageFieldMappings",
         (option_to_yojson confluence_page_field_mappings_list_to_yojson x.page_field_mappings));
       
  ])

let confluence_blog_field_name_to_yojson = 
  fun (x: confluence_blog_field_name) -> match x with 
 
| VERSION -> `String "VERSION"
  | URL -> `String "URL"
  | SPACE_NAME -> `String "SPACE_NAME"
  | SPACE_KEY -> `String "SPACE_KEY"
  | PUBLISH_DATE -> `String "PUBLISH_DATE"
  | LABELS -> `String "LABELS"
  | ITEM_TYPE -> `String "ITEM_TYPE"
  | DISPLAY_URL -> `String "DISPLAY_URL"
  | AUTHOR -> `String "AUTHOR"
   

let confluence_blog_to_index_field_mapping_to_yojson = 
  fun (x: confluence_blog_to_index_field_mapping) -> assoc_to_yojson(
    [(
         "IndexFieldName",
         (option_to_yojson index_field_name_to_yojson x.index_field_name));
       (
         "DateFieldFormat",
         (option_to_yojson data_source_date_field_format_to_yojson x.date_field_format));
       (
         "DataSourceFieldName",
         (option_to_yojson confluence_blog_field_name_to_yojson x.data_source_field_name));
       
  ])

let confluence_blog_field_mappings_list_to_yojson = 
  fun tree -> list_to_yojson confluence_blog_to_index_field_mapping_to_yojson tree

let confluence_blog_configuration_to_yojson = 
  fun (x: confluence_blog_configuration) -> assoc_to_yojson(
    [(
         "BlogFieldMappings",
         (option_to_yojson confluence_blog_field_mappings_list_to_yojson x.blog_field_mappings));
       
  ])

let confluence_attachment_field_name_to_yojson = 
  fun (x: confluence_attachment_field_name) -> match x with 
 
| VERSION -> `String "VERSION"
  | URL -> `String "URL"
  | SPACE_NAME -> `String "SPACE_NAME"
  | SPACE_KEY -> `String "SPACE_KEY"
  | PARENT_ID -> `String "PARENT_ID"
  | ITEM_TYPE -> `String "ITEM_TYPE"
  | FILE_SIZE -> `String "FILE_SIZE"
  | DISPLAY_URL -> `String "DISPLAY_URL"
  | CREATED_DATE -> `String "CREATED_DATE"
  | CONTENT_TYPE -> `String "CONTENT_TYPE"
  | AUTHOR -> `String "AUTHOR"
   

let confluence_attachment_to_index_field_mapping_to_yojson = 
  fun (x: confluence_attachment_to_index_field_mapping) -> assoc_to_yojson(
    [(
         "IndexFieldName",
         (option_to_yojson index_field_name_to_yojson x.index_field_name));
       (
         "DateFieldFormat",
         (option_to_yojson data_source_date_field_format_to_yojson x.date_field_format));
       (
         "DataSourceFieldName",
         (option_to_yojson confluence_attachment_field_name_to_yojson x.data_source_field_name));
       
  ])

let confluence_attachment_field_mappings_list_to_yojson = 
  fun tree -> list_to_yojson confluence_attachment_to_index_field_mapping_to_yojson tree

let confluence_attachment_configuration_to_yojson = 
  fun (x: confluence_attachment_configuration) -> assoc_to_yojson(
    [(
         "AttachmentFieldMappings",
         (option_to_yojson confluence_attachment_field_mappings_list_to_yojson x.attachment_field_mappings));
       (
         "CrawlAttachments",
         (option_to_yojson boolean__to_yojson x.crawl_attachments));
       
  ])

let confluence_authentication_type_to_yojson = 
  fun (x: confluence_authentication_type) -> match x with 
  | PAT -> `String "PAT"
    | HTTP_BASIC -> `String "HTTP_BASIC"
     

let confluence_configuration_to_yojson = 
  fun (x: confluence_configuration) -> assoc_to_yojson(
    [(
         "AuthenticationType",
         (option_to_yojson confluence_authentication_type_to_yojson x.authentication_type));
       (
         "ProxyConfiguration",
         (option_to_yojson proxy_configuration_to_yojson x.proxy_configuration));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "AttachmentConfiguration",
         (option_to_yojson confluence_attachment_configuration_to_yojson x.attachment_configuration));
       (
         "BlogConfiguration",
         (option_to_yojson confluence_blog_configuration_to_yojson x.blog_configuration));
       (
         "PageConfiguration",
         (option_to_yojson confluence_page_configuration_to_yojson x.page_configuration));
       (
         "SpaceConfiguration",
         (option_to_yojson confluence_space_configuration_to_yojson x.space_configuration));
       (
         "Version",
         (Some (confluence_version_to_yojson x.version)));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "ServerUrl",
         (Some (url_to_yojson x.server_url)));
       
  ])

let mime_type_to_yojson = string_to_yojson

let exclude_mime_types_list_to_yojson = 
  fun tree -> list_to_yojson mime_type_to_yojson tree

let exclude_user_accounts_list_to_yojson = 
  fun tree -> list_to_yojson user_account_to_yojson tree

let shared_drive_id_to_yojson = string_to_yojson

let exclude_shared_drives_list_to_yojson = 
  fun tree -> list_to_yojson shared_drive_id_to_yojson tree

let google_drive_configuration_to_yojson = 
  fun (x: google_drive_configuration) -> assoc_to_yojson(
    [(
         "ExcludeSharedDrives",
         (option_to_yojson exclude_shared_drives_list_to_yojson x.exclude_shared_drives));
       (
         "ExcludeUserAccounts",
         (option_to_yojson exclude_user_accounts_list_to_yojson x.exclude_user_accounts));
       (
         "ExcludeMimeTypes",
         (option_to_yojson exclude_mime_types_list_to_yojson x.exclude_mime_types));
       (
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       
  ])

let file_system_id_to_yojson = string_to_yojson

let fsx_file_system_type_to_yojson = 
  fun (x: fsx_file_system_type) -> match x with 
  | WINDOWS -> `String "WINDOWS"
     

let fsx_configuration_to_yojson = 
  fun (x: fsx_configuration) -> assoc_to_yojson(
    [(
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "SecretArn",
         (option_to_yojson secret_arn_to_yojson x.secret_arn));
       (
         "VpcConfiguration",
         (Some (data_source_vpc_configuration_to_yojson x.vpc_configuration)));
       (
         "FileSystemType",
         (Some (fsx_file_system_type_to_yojson x.file_system_type)));
       (
         "FileSystemId",
         (Some (file_system_id_to_yojson x.file_system_id)));
       
  ])

let team_id_to_yojson = string_to_yojson

let slack_entity_to_yojson = 
  fun (x: slack_entity) -> match x with 
 
| DIRECT_MESSAGE -> `String "DIRECT_MESSAGE"
  | GROUP_MESSAGE -> `String "GROUP_MESSAGE"
  | PRIVATE_CHANNEL -> `String "PRIVATE_CHANNEL"
  | PUBLIC_CHANNEL -> `String "PUBLIC_CHANNEL"
   

let slack_entity_list_to_yojson = 
  fun tree -> list_to_yojson slack_entity_to_yojson tree

let since_crawl_date_to_yojson = string_to_yojson

let look_back_period_to_yojson = int_to_yojson

let private_channel_filter_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let public_channel_filter_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let slack_configuration_to_yojson = 
  fun (x: slack_configuration) -> assoc_to_yojson(
    [(
         "FieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.field_mappings));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "PublicChannelFilter",
         (option_to_yojson public_channel_filter_to_yojson x.public_channel_filter));
       (
         "PrivateChannelFilter",
         (option_to_yojson private_channel_filter_to_yojson x.private_channel_filter));
       (
         "LookBackPeriod",
         (option_to_yojson look_back_period_to_yojson x.look_back_period));
       (
         "SinceCrawlDate",
         (Some (since_crawl_date_to_yojson x.since_crawl_date)));
       (
         "ExcludeArchived",
         (option_to_yojson boolean__to_yojson x.exclude_archived));
       (
         "CrawlBotMessage",
         (option_to_yojson boolean__to_yojson x.crawl_bot_message));
       (
         "UseChangeLog",
         (option_to_yojson boolean__to_yojson x.use_change_log));
       (
         "SlackEntityList",
         (Some (slack_entity_list_to_yojson x.slack_entity_list)));
       (
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "TeamId",
         (Some (team_id_to_yojson x.team_id)));
       
  ])

let enterprise_id_to_yojson = string_to_yojson

let box_configuration_to_yojson = 
  fun (x: box_configuration) -> assoc_to_yojson(
    [(
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "WebLinkFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.web_link_field_mappings));
       (
         "CommentFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.comment_field_mappings));
       (
         "TaskFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.task_field_mappings));
       (
         "FileFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.file_field_mappings));
       (
         "CrawlWebLinks",
         (option_to_yojson boolean__to_yojson x.crawl_web_links));
       (
         "CrawlTasks",
         (option_to_yojson boolean__to_yojson x.crawl_tasks));
       (
         "CrawlComments",
         (option_to_yojson boolean__to_yojson x.crawl_comments));
       (
         "UseChangeLog",
         (option_to_yojson boolean__to_yojson x.use_change_log));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "EnterpriseId",
         (Some (enterprise_id_to_yojson x.enterprise_id)));
       
  ])

let domain_to_yojson = string_to_yojson

let folder_id_to_yojson = string_to_yojson

let folder_id_list_to_yojson = 
  fun tree -> list_to_yojson folder_id_to_yojson tree

let quip_configuration_to_yojson = 
  fun (x: quip_configuration) -> assoc_to_yojson(
    [(
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "AttachmentFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.attachment_field_mappings));
       (
         "MessageFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.message_field_mappings));
       (
         "ThreadFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.thread_field_mappings));
       (
         "FolderIds",
         (option_to_yojson folder_id_list_to_yojson x.folder_ids));
       (
         "CrawlAttachments",
         (option_to_yojson boolean__to_yojson x.crawl_attachments));
       (
         "CrawlChatRooms",
         (option_to_yojson boolean__to_yojson x.crawl_chat_rooms));
       (
         "CrawlFileComments",
         (option_to_yojson boolean__to_yojson x.crawl_file_comments));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "Domain",
         (Some (domain_to_yojson x.domain)));
       
  ])

let jira_account_url_to_yojson = string_to_yojson

let project_to_yojson = fun tree -> list_to_yojson string__to_yojson tree

let issue_type_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let jira_status_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let issue_sub_entity_to_yojson = 
  fun (x: issue_sub_entity) -> match x with 
 
| WORKLOGS -> `String "WORKLOGS"
  | ATTACHMENTS -> `String "ATTACHMENTS"
  | COMMENTS -> `String "COMMENTS"
   

let issue_sub_entity_filter_to_yojson = 
  fun tree -> list_to_yojson issue_sub_entity_to_yojson tree

let jira_configuration_to_yojson = 
  fun (x: jira_configuration) -> assoc_to_yojson(
    [(
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "WorkLogFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.work_log_field_mappings));
       (
         "ProjectFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.project_field_mappings));
       (
         "IssueFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.issue_field_mappings));
       (
         "CommentFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.comment_field_mappings));
       (
         "AttachmentFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.attachment_field_mappings));
       (
         "IssueSubEntityFilter",
         (option_to_yojson issue_sub_entity_filter_to_yojson x.issue_sub_entity_filter));
       (
         "Status",
         (option_to_yojson jira_status_to_yojson x.status));
       (
         "IssueType",
         (option_to_yojson issue_type_to_yojson x.issue_type));
       (
         "Project",
         (option_to_yojson project_to_yojson x.project));
       (
         "UseChangeLog",
         (option_to_yojson boolean__to_yojson x.use_change_log));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "JiraAccountUrl",
         (Some (jira_account_url_to_yojson x.jira_account_url)));
       
  ])

let organization_name_to_yojson = string_to_yojson

let saa_s_configuration_to_yojson = 
  fun (x: saa_s_configuration) -> assoc_to_yojson(
    [(
         "HostUrl",
         (Some (url_to_yojson x.host_url)));
       (
         "OrganizationName",
         (Some (organization_name_to_yojson x.organization_name)));
       
  ])

let on_premise_configuration_to_yojson = 
  fun (x: on_premise_configuration) -> assoc_to_yojson(
    [(
         "SslCertificateS3Path",
         (Some (s3_path_to_yojson x.ssl_certificate_s3_path)));
       (
         "OrganizationName",
         (Some (organization_name_to_yojson x.organization_name)));
       (
         "HostUrl",
         (Some (url_to_yojson x.host_url)));
       
  ])

let type__to_yojson = 
  fun (x: type_) -> match x with 
  | ON_PREMISE -> `String "ON_PREMISE"
    | SAAS -> `String "SAAS"
     

let git_hub_document_crawl_properties_to_yojson = 
  fun (x: git_hub_document_crawl_properties) -> assoc_to_yojson(
    [(
         "CrawlPullRequestCommentAttachment",
         (option_to_yojson boolean__to_yojson x.crawl_pull_request_comment_attachment));
       (
         "CrawlPullRequestComment",
         (option_to_yojson boolean__to_yojson x.crawl_pull_request_comment));
       (
         "CrawlPullRequest",
         (option_to_yojson boolean__to_yojson x.crawl_pull_request));
       (
         "CrawlIssueCommentAttachment",
         (option_to_yojson boolean__to_yojson x.crawl_issue_comment_attachment));
       (
         "CrawlIssueComment",
         (option_to_yojson boolean__to_yojson x.crawl_issue_comment));
       (
         "CrawlIssue",
         (option_to_yojson boolean__to_yojson x.crawl_issue));
       (
         "CrawlRepositoryDocuments",
         (option_to_yojson boolean__to_yojson x.crawl_repository_documents));
       
  ])

let repository_name_to_yojson = string_to_yojson

let repository_names_to_yojson = 
  fun tree -> list_to_yojson repository_name_to_yojson tree

let string_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let git_hub_configuration_to_yojson = 
  fun (x: git_hub_configuration) -> assoc_to_yojson(
    [(
         "GitHubPullRequestDocumentAttachmentConfigurationFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.git_hub_pull_request_document_attachment_configuration_field_mappings));
       (
         "GitHubPullRequestDocumentConfigurationFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.git_hub_pull_request_document_configuration_field_mappings));
       (
         "GitHubPullRequestCommentConfigurationFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.git_hub_pull_request_comment_configuration_field_mappings));
       (
         "GitHubIssueAttachmentConfigurationFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.git_hub_issue_attachment_configuration_field_mappings));
       (
         "GitHubIssueCommentConfigurationFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.git_hub_issue_comment_configuration_field_mappings));
       (
         "GitHubIssueDocumentConfigurationFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.git_hub_issue_document_configuration_field_mappings));
       (
         "GitHubCommitConfigurationFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.git_hub_commit_configuration_field_mappings));
       (
         "GitHubRepositoryConfigurationFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.git_hub_repository_configuration_field_mappings));
       (
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ExclusionFileNamePatterns",
         (option_to_yojson string_list_to_yojson x.exclusion_file_name_patterns));
       (
         "ExclusionFileTypePatterns",
         (option_to_yojson string_list_to_yojson x.exclusion_file_type_patterns));
       (
         "ExclusionFolderNamePatterns",
         (option_to_yojson string_list_to_yojson x.exclusion_folder_name_patterns));
       (
         "InclusionFileNamePatterns",
         (option_to_yojson string_list_to_yojson x.inclusion_file_name_patterns));
       (
         "InclusionFileTypePatterns",
         (option_to_yojson string_list_to_yojson x.inclusion_file_type_patterns));
       (
         "InclusionFolderNamePatterns",
         (option_to_yojson string_list_to_yojson x.inclusion_folder_name_patterns));
       (
         "RepositoryFilter",
         (option_to_yojson repository_names_to_yojson x.repository_filter));
       (
         "GitHubDocumentCrawlProperties",
         (option_to_yojson git_hub_document_crawl_properties_to_yojson x.git_hub_document_crawl_properties));
       (
         "UseChangeLog",
         (option_to_yojson boolean__to_yojson x.use_change_log));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "Type",
         (option_to_yojson type__to_yojson x.type_));
       (
         "OnPremiseConfiguration",
         (option_to_yojson on_premise_configuration_to_yojson x.on_premise_configuration));
       (
         "SaaSConfiguration",
         (option_to_yojson saa_s_configuration_to_yojson x.saa_s_configuration));
       
  ])

let site_url_to_yojson = string_to_yojson

let site_id_to_yojson = string_to_yojson

let alfresco_entity_to_yojson = 
  fun (x: alfresco_entity) -> match x with 
 
| DocumentLibrary -> `String "documentLibrary"
  | Blog -> `String "blog"
  | Wiki -> `String "wiki"
   

let entity_filter_to_yojson = 
  fun tree -> list_to_yojson alfresco_entity_to_yojson tree

let alfresco_configuration_to_yojson = 
  fun (x: alfresco_configuration) -> assoc_to_yojson(
    [(
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "ExclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.exclusion_patterns));
       (
         "InclusionPatterns",
         (option_to_yojson data_source_inclusions_exclusions_strings_to_yojson x.inclusion_patterns));
       (
         "WikiFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.wiki_field_mappings));
       (
         "BlogFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.blog_field_mappings));
       (
         "DocumentLibraryFieldMappings",
         (option_to_yojson data_source_to_index_field_mapping_list_to_yojson x.document_library_field_mappings));
       (
         "EntityFilter",
         (option_to_yojson entity_filter_to_yojson x.entity_filter));
       (
         "CrawlComments",
         (option_to_yojson boolean__to_yojson x.crawl_comments));
       (
         "CrawlSystemFolders",
         (option_to_yojson boolean__to_yojson x.crawl_system_folders));
       (
         "SslCertificateS3Path",
         (Some (s3_path_to_yojson x.ssl_certificate_s3_path)));
       (
         "SecretArn",
         (Some (secret_arn_to_yojson x.secret_arn)));
       (
         "SiteId",
         (Some (site_id_to_yojson x.site_id)));
       (
         "SiteUrl",
         (Some (site_url_to_yojson x.site_url)));
       
  ])

let template_to_yojson = json_to_yojson

let template_configuration_to_yojson = 
  fun (x: template_configuration) -> assoc_to_yojson(
    [(
         "Template",
         (option_to_yojson template_to_yojson x.template));
       
  ])

let data_source_configuration_to_yojson = 
  fun (x: data_source_configuration) -> assoc_to_yojson(
    [(
         "TemplateConfiguration",
         (option_to_yojson template_configuration_to_yojson x.template_configuration));
       (
         "AlfrescoConfiguration",
         (option_to_yojson alfresco_configuration_to_yojson x.alfresco_configuration));
       (
         "GitHubConfiguration",
         (option_to_yojson git_hub_configuration_to_yojson x.git_hub_configuration));
       (
         "JiraConfiguration",
         (option_to_yojson jira_configuration_to_yojson x.jira_configuration));
       (
         "QuipConfiguration",
         (option_to_yojson quip_configuration_to_yojson x.quip_configuration));
       (
         "BoxConfiguration",
         (option_to_yojson box_configuration_to_yojson x.box_configuration));
       (
         "SlackConfiguration",
         (option_to_yojson slack_configuration_to_yojson x.slack_configuration));
       (
         "FsxConfiguration",
         (option_to_yojson fsx_configuration_to_yojson x.fsx_configuration));
       (
         "WorkDocsConfiguration",
         (option_to_yojson work_docs_configuration_to_yojson x.work_docs_configuration));
       (
         "WebCrawlerConfiguration",
         (option_to_yojson web_crawler_configuration_to_yojson x.web_crawler_configuration));
       (
         "GoogleDriveConfiguration",
         (option_to_yojson google_drive_configuration_to_yojson x.google_drive_configuration));
       (
         "ConfluenceConfiguration",
         (option_to_yojson confluence_configuration_to_yojson x.confluence_configuration));
       (
         "ServiceNowConfiguration",
         (option_to_yojson service_now_configuration_to_yojson x.service_now_configuration));
       (
         "OneDriveConfiguration",
         (option_to_yojson one_drive_configuration_to_yojson x.one_drive_configuration));
       (
         "SalesforceConfiguration",
         (option_to_yojson salesforce_configuration_to_yojson x.salesforce_configuration));
       (
         "DatabaseConfiguration",
         (option_to_yojson database_configuration_to_yojson x.database_configuration));
       (
         "SharePointConfiguration",
         (option_to_yojson share_point_configuration_to_yojson x.share_point_configuration));
       (
         "S3Configuration",
         (option_to_yojson s3_data_source_configuration_to_yojson x.s3_configuration));
       
  ])

let scan_schedule_to_yojson = string_to_yojson

let language_code_to_yojson = string_to_yojson

let condition_operator_to_yojson = 
  fun (x: condition_operator) -> match x with 
 
| BeginsWith -> `String "BeginsWith"
  | NotExists -> `String "NotExists"
  | Exists -> `String "Exists"
  | NotContains -> `String "NotContains"
  | Contains -> `String "Contains"
  | NotEquals -> `String "NotEquals"
  | Equals -> `String "Equals"
  | LessThanOrEquals -> `String "LessThanOrEquals"
  | LessThan -> `String "LessThan"
  | GreaterThanOrEquals -> `String "GreaterThanOrEquals"
  | GreaterThan -> `String "GreaterThan"
   

let document_attribute_string_value_to_yojson = string_to_yojson

let document_attribute_string_list_value_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let timestamp__to_yojson = timestamp_to_yojson

let document_attribute_value_to_yojson = 
  fun (x: document_attribute_value) -> assoc_to_yojson(
    [(
         "DateValue",
         (option_to_yojson timestamp__to_yojson x.date_value));
       (
         "LongValue",
         (option_to_yojson long_to_yojson x.long_value));
       (
         "StringListValue",
         (option_to_yojson document_attribute_string_list_value_to_yojson x.string_list_value));
       (
         "StringValue",
         (option_to_yojson document_attribute_string_value_to_yojson x.string_value));
       
  ])

let document_attribute_condition_to_yojson = 
  fun (x: document_attribute_condition) -> assoc_to_yojson(
    [(
         "ConditionOnValue",
         (option_to_yojson document_attribute_value_to_yojson x.condition_on_value));
       (
         "Operator",
         (Some (condition_operator_to_yojson x.operator)));
       (
         "ConditionDocumentAttributeKey",
         (Some (document_attribute_key_to_yojson x.condition_document_attribute_key)));
       
  ])

let document_attribute_target_to_yojson = 
  fun (x: document_attribute_target) -> assoc_to_yojson(
    [(
         "TargetDocumentAttributeValue",
         (option_to_yojson document_attribute_value_to_yojson x.target_document_attribute_value));
       (
         "TargetDocumentAttributeValueDeletion",
         (option_to_yojson boolean__to_yojson x.target_document_attribute_value_deletion));
       (
         "TargetDocumentAttributeKey",
         (option_to_yojson document_attribute_key_to_yojson x.target_document_attribute_key));
       
  ])

let inline_custom_document_enrichment_configuration_to_yojson = 
  fun (x: inline_custom_document_enrichment_configuration) -> assoc_to_yojson(
    [(
         "DocumentContentDeletion",
         (option_to_yojson boolean__to_yojson x.document_content_deletion));
       (
         "Target",
         (option_to_yojson document_attribute_target_to_yojson x.target));
       (
         "Condition",
         (option_to_yojson document_attribute_condition_to_yojson x.condition));
       
  ])

let inline_custom_document_enrichment_configuration_list_to_yojson = 
  fun tree -> list_to_yojson inline_custom_document_enrichment_configuration_to_yojson tree

let lambda_arn_to_yojson = string_to_yojson

let hook_configuration_to_yojson = 
  fun (x: hook_configuration) -> assoc_to_yojson(
    [(
         "S3Bucket",
         (Some (s3_bucket_name_to_yojson x.s3_bucket)));
       (
         "LambdaArn",
         (Some (lambda_arn_to_yojson x.lambda_arn)));
       (
         "InvocationCondition",
         (option_to_yojson document_attribute_condition_to_yojson x.invocation_condition));
       
  ])

let custom_document_enrichment_configuration_to_yojson = 
  fun (x: custom_document_enrichment_configuration) -> assoc_to_yojson(
    [(
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "PostExtractionHookConfiguration",
         (option_to_yojson hook_configuration_to_yojson x.post_extraction_hook_configuration));
       (
         "PreExtractionHookConfiguration",
         (option_to_yojson hook_configuration_to_yojson x.pre_extraction_hook_configuration));
       (
         "InlineConfigurations",
         (option_to_yojson inline_custom_document_enrichment_configuration_list_to_yojson x.inline_configurations));
       
  ])

let update_data_source_request_to_yojson = 
  fun (x: update_data_source_request) -> assoc_to_yojson(
    [(
         "CustomDocumentEnrichmentConfiguration",
         (option_to_yojson custom_document_enrichment_configuration_to_yojson x.custom_document_enrichment_configuration));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Schedule",
         (option_to_yojson scan_schedule_to_yojson x.schedule));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "Configuration",
         (option_to_yojson data_source_configuration_to_yojson x.configuration));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Name",
         (option_to_yojson data_source_name_to_yojson x.name));
       (
         "Id",
         (Some (data_source_id_to_yojson x.id)));
       
  ])

let update_access_control_configuration_response_to_yojson = 
  fun (x: update_access_control_configuration_response) -> assoc_to_yojson(
    [
  ])

let access_control_configuration_id_to_yojson = string_to_yojson

let access_control_configuration_name_to_yojson = string_to_yojson

let principal_type_to_yojson = 
  fun (x: principal_type) -> match x with 
  | GROUP -> `String "GROUP"
    | USER -> `String "USER"
     

let read_access_type_to_yojson = 
  fun (x: read_access_type) -> match x with 
  | DENY -> `String "DENY"
    | ALLOW -> `String "ALLOW"
     

let principal_to_yojson = 
  fun (x: principal) -> assoc_to_yojson(
    [(
         "DataSourceId",
         (option_to_yojson data_source_id_to_yojson x.data_source_id));
       (
         "Access",
         (Some (read_access_type_to_yojson x.access)));
       (
         "Type",
         (Some (principal_type_to_yojson x.type_)));
       (
         "Name",
         (Some (principal_name_to_yojson x.name)));
       
  ])

let principal_list_to_yojson = 
  fun tree -> list_to_yojson principal_to_yojson tree

let hierarchical_principal_to_yojson = 
  fun (x: hierarchical_principal) -> assoc_to_yojson(
    [(
         "PrincipalList",
         (Some (principal_list_to_yojson x.principal_list)));
       
  ])

let hierarchical_principal_list_to_yojson = 
  fun tree -> list_to_yojson hierarchical_principal_to_yojson tree

let update_access_control_configuration_request_to_yojson = 
  fun (x: update_access_control_configuration_request) -> assoc_to_yojson(
    [(
         "HierarchicalAccessControlList",
         (option_to_yojson hierarchical_principal_list_to_yojson x.hierarchical_access_control_list));
       (
         "AccessControlList",
         (option_to_yojson principal_list_to_yojson x.access_control_list));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson access_control_configuration_name_to_yojson x.name));
       (
         "Id",
         (Some (access_control_configuration_id_to_yojson x.id)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

let amazon_resource_name_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       
  ])

let resource_unavailable_exception_to_yojson = 
  fun (x: resource_unavailable_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let top_document_attribute_value_count_pairs_size_to_yojson = 
  int_to_yojson

let title_to_yojson = string_to_yojson

let time_range_to_yojson = 
  fun (x: time_range) -> assoc_to_yojson(
    [(
         "EndTime",
         (option_to_yojson timestamp__to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson timestamp__to_yojson x.start_time));
       
  ])

let thesaurus_status_to_yojson = 
  fun (x: thesaurus_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | ACTIVE_BUT_UPDATE_FAILED -> `String "ACTIVE_BUT_UPDATE_FAILED"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
   

let thesaurus_summary_to_yojson = 
  fun (x: thesaurus_summary) -> assoc_to_yojson(
    [(
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Status",
         (option_to_yojson thesaurus_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson thesaurus_name_to_yojson x.name));
       (
         "Id",
         (option_to_yojson thesaurus_id_to_yojson x.id));
       
  ])

let thesaurus_summary_items_to_yojson = 
  fun tree -> list_to_yojson thesaurus_summary_to_yojson tree

let highlight_type_to_yojson = 
  fun (x: highlight_type) -> match x with 
 
| THESAURUS_SYNONYM -> `String "THESAURUS_SYNONYM"
  | STANDARD -> `String "STANDARD"
   

let highlight_to_yojson = 
  fun (x: highlight) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson highlight_type_to_yojson x.type_));
       (
         "TopAnswer",
         (option_to_yojson boolean__to_yojson x.top_answer));
       (
         "EndOffset",
         (Some (integer__to_yojson x.end_offset)));
       (
         "BeginOffset",
         (Some (integer__to_yojson x.begin_offset)));
       
  ])

let highlight_list_to_yojson = 
  fun tree -> list_to_yojson highlight_to_yojson tree

let text_with_highlights_to_yojson = 
  fun (x: text_with_highlights) -> assoc_to_yojson(
    [(
         "Highlights",
         (option_to_yojson highlight_list_to_yojson x.highlights));
       (
         "Text",
         (option_to_yojson string__to_yojson x.text));
       
  ])

let indexed_text_documents_count_to_yojson = int_to_yojson

let indexed_text_bytes_to_yojson = long_to_yojson

let text_document_statistics_to_yojson = 
  fun (x: text_document_statistics) -> assoc_to_yojson(
    [(
         "IndexedTextBytes",
         (Some (indexed_text_bytes_to_yojson x.indexed_text_bytes)));
       (
         "IndexedTextDocumentsCount",
         (Some (indexed_text_documents_count_to_yojson x.indexed_text_documents_count)));
       
  ])

let tag_value_to_yojson = string_to_yojson

let tag_resource_response_to_yojson = 
  fun (x: tag_resource_response) -> assoc_to_yojson(
    [
  ])

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (Some (tag_value_to_yojson x.value)));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       
  ])

let table_cell_to_yojson = 
  fun (x: table_cell) -> assoc_to_yojson(
    [(
         "Header",
         (option_to_yojson boolean__to_yojson x.header));
       (
         "Highlighted",
         (option_to_yojson boolean__to_yojson x.highlighted));
       (
         "TopAnswer",
         (option_to_yojson boolean__to_yojson x.top_answer));
       (
         "Value",
         (option_to_yojson string__to_yojson x.value));
       
  ])

let table_cell_list_to_yojson = 
  fun tree -> list_to_yojson table_cell_to_yojson tree

let table_row_to_yojson = 
  fun (x: table_row) -> assoc_to_yojson(
    [(
         "Cells",
         (option_to_yojson table_cell_list_to_yojson x.cells));
       
  ])

let table_row_list_to_yojson = 
  fun tree -> list_to_yojson table_row_to_yojson tree

let table_excerpt_to_yojson = 
  fun (x: table_excerpt) -> assoc_to_yojson(
    [(
         "TotalNumberOfRows",
         (option_to_yojson integer__to_yojson x.total_number_of_rows));
       (
         "Rows",
         (option_to_yojson table_row_list_to_yojson x.rows));
       
  ])

let suggestion_highlight_to_yojson = 
  fun (x: suggestion_highlight) -> assoc_to_yojson(
    [(
         "EndOffset",
         (option_to_yojson integer__to_yojson x.end_offset));
       (
         "BeginOffset",
         (option_to_yojson integer__to_yojson x.begin_offset));
       
  ])

let suggestion_highlight_list_to_yojson = 
  fun tree -> list_to_yojson suggestion_highlight_to_yojson tree

let suggestion_text_with_highlights_to_yojson = 
  fun (x: suggestion_text_with_highlights) -> assoc_to_yojson(
    [(
         "Highlights",
         (option_to_yojson suggestion_highlight_list_to_yojson x.highlights));
       (
         "Text",
         (option_to_yojson string__to_yojson x.text));
       
  ])

let suggestion_value_to_yojson = 
  fun (x: suggestion_value) -> assoc_to_yojson(
    [(
         "Text",
         (option_to_yojson suggestion_text_with_highlights_to_yojson x.text));
       
  ])

let suggestion_type_to_yojson = 
  fun (x: suggestion_type) -> match x with 
 
| DOCUMENT_ATTRIBUTES -> `String "DOCUMENT_ATTRIBUTES"
  | QUERY -> `String "QUERY"
   

let suggestion_types_to_yojson = 
  fun tree -> list_to_yojson suggestion_type_to_yojson tree

let suggestion_query_text_to_yojson = string_to_yojson

let result_id_to_yojson = string_to_yojson

let document_attribute_key_list_to_yojson = 
  fun tree -> list_to_yojson document_attribute_key_to_yojson tree

let document_attribute_to_yojson = 
  fun (x: document_attribute) -> assoc_to_yojson(
    [(
         "Value",
         (Some (document_attribute_value_to_yojson x.value)));
       (
         "Key",
         (Some (document_attribute_key_to_yojson x.key)));
       
  ])

let document_attribute_list_to_yojson = 
  fun tree -> list_to_yojson document_attribute_to_yojson tree

let source_document_to_yojson = 
  fun (x: source_document) -> assoc_to_yojson(
    [(
         "AdditionalAttributes",
         (option_to_yojson document_attribute_list_to_yojson x.additional_attributes));
       (
         "SuggestionAttributes",
         (option_to_yojson document_attribute_key_list_to_yojson x.suggestion_attributes));
       (
         "DocumentId",
         (option_to_yojson string__to_yojson x.document_id));
       
  ])

let source_documents_to_yojson = 
  fun tree -> list_to_yojson source_document_to_yojson tree

let suggestion_to_yojson = 
  fun (x: suggestion) -> assoc_to_yojson(
    [(
         "SourceDocuments",
         (option_to_yojson source_documents_to_yojson x.source_documents));
       (
         "Value",
         (option_to_yojson suggestion_value_to_yojson x.value));
       (
         "Id",
         (option_to_yojson result_id_to_yojson x.id));
       
  ])

let suggestion_list_to_yojson = 
  fun tree -> list_to_yojson suggestion_to_yojson tree

let suggested_query_text_to_yojson = string_to_yojson

let query_id_to_yojson = string_to_yojson

let click_feedback_to_yojson = 
  fun (x: click_feedback) -> assoc_to_yojson(
    [(
         "ClickTime",
         (Some (timestamp__to_yojson x.click_time)));
       (
         "ResultId",
         (Some (result_id_to_yojson x.result_id)));
       
  ])

let click_feedback_list_to_yojson = 
  fun tree -> list_to_yojson click_feedback_to_yojson tree

let relevance_type_to_yojson = 
  fun (x: relevance_type) -> match x with 
  | NOT_RELEVANT -> `String "NOT_RELEVANT"
    | RELEVANT -> `String "RELEVANT"
     

let relevance_feedback_to_yojson = 
  fun (x: relevance_feedback) -> assoc_to_yojson(
    [(
         "RelevanceValue",
         (Some (relevance_type_to_yojson x.relevance_value)));
       (
         "ResultId",
         (Some (result_id_to_yojson x.result_id)));
       
  ])

let relevance_feedback_list_to_yojson = 
  fun tree -> list_to_yojson relevance_feedback_to_yojson tree

let submit_feedback_request_to_yojson = 
  fun (x: submit_feedback_request) -> assoc_to_yojson(
    [(
         "RelevanceFeedbackItems",
         (option_to_yojson relevance_feedback_list_to_yojson x.relevance_feedback_items));
       (
         "ClickFeedbackItems",
         (option_to_yojson click_feedback_list_to_yojson x.click_feedback_items));
       (
         "QueryId",
         (Some (query_id_to_yojson x.query_id)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let stop_data_source_sync_job_request_to_yojson = 
  fun (x: stop_data_source_sync_job_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (data_source_id_to_yojson x.id)));
       
  ])

let document_status_to_yojson = 
  fun (x: document_status) -> match x with 
 
| UPDATE_FAILED -> `String "UPDATE_FAILED"
  | FAILED -> `String "FAILED"
  | UPDATED -> `String "UPDATED"
  | INDEXED -> `String "INDEXED"
  | PROCESSING -> `String "PROCESSING"
  | NOT_FOUND -> `String "NOT_FOUND"
   

let status_to_yojson = 
  fun (x: status) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson string__to_yojson x.failure_reason));
       (
         "FailureCode",
         (option_to_yojson string__to_yojson x.failure_code));
       (
         "DocumentStatus",
         (option_to_yojson document_status_to_yojson x.document_status));
       (
         "DocumentId",
         (option_to_yojson document_id_to_yojson x.document_id));
       
  ])

let start_data_source_sync_job_response_to_yojson = 
  fun (x: start_data_source_sync_job_response) -> assoc_to_yojson(
    [(
         "ExecutionId",
         (option_to_yojson string__to_yojson x.execution_id));
       
  ])

let start_data_source_sync_job_request_to_yojson = 
  fun (x: start_data_source_sync_job_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (data_source_id_to_yojson x.id)));
       
  ])

let resource_in_use_exception_to_yojson = 
  fun (x: resource_in_use_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let spell_correction_configuration_to_yojson = 
  fun (x: spell_correction_configuration) -> assoc_to_yojson(
    [(
         "IncludeQuerySpellCheckSuggestions",
         (Some (boolean__to_yojson x.include_query_spell_check_suggestions)));
       
  ])

let correction_to_yojson = 
  fun (x: correction) -> assoc_to_yojson(
    [(
         "CorrectedTerm",
         (option_to_yojson string__to_yojson x.corrected_term));
       (
         "Term",
         (option_to_yojson string__to_yojson x.term));
       (
         "EndOffset",
         (option_to_yojson integer__to_yojson x.end_offset));
       (
         "BeginOffset",
         (option_to_yojson integer__to_yojson x.begin_offset));
       
  ])

let correction_list_to_yojson = 
  fun tree -> list_to_yojson correction_to_yojson tree

let spell_corrected_query_to_yojson = 
  fun (x: spell_corrected_query) -> assoc_to_yojson(
    [(
         "Corrections",
         (option_to_yojson correction_list_to_yojson x.corrections));
       (
         "SuggestedQueryText",
         (option_to_yojson suggested_query_text_to_yojson x.suggested_query_text));
       
  ])

let spell_corrected_query_list_to_yojson = 
  fun tree -> list_to_yojson spell_corrected_query_to_yojson tree

let sort_order_to_yojson = 
  fun (x: sort_order) -> match x with 
  | ASC -> `String "ASC"
    | DESC -> `String "DESC"
     

let sorting_configuration_to_yojson = 
  fun (x: sorting_configuration) -> assoc_to_yojson(
    [(
         "SortOrder",
         (Some (sort_order_to_yojson x.sort_order)));
       (
         "DocumentAttributeKey",
         (Some (document_attribute_key_to_yojson x.document_attribute_key)));
       
  ])

let sorting_configuration_list_to_yojson = 
  fun tree -> list_to_yojson sorting_configuration_to_yojson tree

let snapshots_data_record_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let snapshots_data_records_to_yojson = 
  fun tree -> list_to_yojson snapshots_data_record_to_yojson tree

let snapshots_data_header_fields_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let kms_key_id_to_yojson = string_to_yojson

let server_side_encryption_configuration_to_yojson = 
  fun (x: server_side_encryption_configuration) -> assoc_to_yojson(
    [(
         "KmsKeyId",
         (option_to_yojson kms_key_id_to_yojson x.kms_key_id));
       
  ])

let score_confidence_to_yojson = 
  fun (x: score_confidence) -> match x with 
 
| NOT_AVAILABLE -> `String "NOT_AVAILABLE"
  | LOW -> `String "LOW"
  | MEDIUM -> `String "MEDIUM"
  | HIGH -> `String "HIGH"
  | VERY_HIGH -> `String "VERY_HIGH"
   

let score_attributes_to_yojson = 
  fun (x: score_attributes) -> assoc_to_yojson(
    [(
         "ScoreConfidence",
         (option_to_yojson score_confidence_to_yojson x.score_confidence));
       
  ])

let document_title_to_yojson = string_to_yojson

let content_to_yojson = string_to_yojson

let retrieve_result_item_to_yojson = 
  fun (x: retrieve_result_item) -> assoc_to_yojson(
    [(
         "ScoreAttributes",
         (option_to_yojson score_attributes_to_yojson x.score_attributes));
       (
         "DocumentAttributes",
         (option_to_yojson document_attribute_list_to_yojson x.document_attributes));
       (
         "DocumentURI",
         (option_to_yojson url_to_yojson x.document_ur_i));
       (
         "Content",
         (option_to_yojson content_to_yojson x.content));
       (
         "DocumentTitle",
         (option_to_yojson document_title_to_yojson x.document_title));
       (
         "DocumentId",
         (option_to_yojson document_id_to_yojson x.document_id));
       (
         "Id",
         (option_to_yojson result_id_to_yojson x.id));
       
  ])

let retrieve_result_item_list_to_yojson = 
  fun tree -> list_to_yojson retrieve_result_item_to_yojson tree

let retrieve_result_to_yojson = 
  fun (x: retrieve_result) -> assoc_to_yojson(
    [(
         "ResultItems",
         (option_to_yojson retrieve_result_item_list_to_yojson x.result_items));
       (
         "QueryId",
         (option_to_yojson query_id_to_yojson x.query_id));
       
  ])

let rec attribute_filter_to_yojson = 
  fun (x: attribute_filter) -> assoc_to_yojson(
    [(
         "LessThanOrEquals",
         (option_to_yojson document_attribute_to_yojson x.less_than_or_equals));
       (
         "LessThan",
         (option_to_yojson document_attribute_to_yojson x.less_than));
       (
         "GreaterThanOrEquals",
         (option_to_yojson document_attribute_to_yojson x.greater_than_or_equals));
       (
         "GreaterThan",
         (option_to_yojson document_attribute_to_yojson x.greater_than));
       (
         "ContainsAny",
         (option_to_yojson document_attribute_to_yojson x.contains_any));
       (
         "ContainsAll",
         (option_to_yojson document_attribute_to_yojson x.contains_all));
       (
         "EqualsTo",
         (option_to_yojson document_attribute_to_yojson x.equals_to));
       (
         "NotFilter",
         (option_to_yojson attribute_filter_to_yojson x.not_filter));
       (
         "OrAllFilters",
         (option_to_yojson attribute_filter_list_to_yojson x.or_all_filters));
       (
         "AndAllFilters",
         (option_to_yojson attribute_filter_list_to_yojson x.and_all_filters));
       
  ])

and attribute_filter_list_to_yojson = 
  fun tree -> list_to_yojson attribute_filter_to_yojson tree

let document_relevance_configuration_to_yojson = 
  fun (x: document_relevance_configuration) -> assoc_to_yojson(
    [(
         "Relevance",
         (Some (relevance_to_yojson x.relevance)));
       (
         "Name",
         (Some (document_metadata_configuration_name_to_yojson x.name)));
       
  ])

let document_relevance_override_configuration_list_to_yojson = 
  fun tree -> list_to_yojson document_relevance_configuration_to_yojson tree

let retrieve_request_to_yojson = 
  fun (x: retrieve_request) -> assoc_to_yojson(
    [(
         "UserContext",
         (option_to_yojson user_context_to_yojson x.user_context));
       (
         "PageSize",
         (option_to_yojson integer__to_yojson x.page_size));
       (
         "PageNumber",
         (option_to_yojson integer__to_yojson x.page_number));
       (
         "DocumentRelevanceOverrideConfigurations",
         (option_to_yojson document_relevance_override_configuration_list_to_yojson x.document_relevance_override_configurations));
       (
         "RequestedDocumentAttributes",
         (option_to_yojson document_attribute_key_list_to_yojson x.requested_document_attributes));
       (
         "AttributeFilter",
         (option_to_yojson attribute_filter_to_yojson x.attribute_filter));
       (
         "QueryText",
         (Some (query_text_to_yojson x.query_text)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let resource_already_exist_exception_to_yojson = 
  fun (x: resource_already_exist_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let query_suggestions_status_to_yojson = 
  fun (x: query_suggestions_status) -> match x with 
  | UPDATING -> `String "UPDATING"
    | ACTIVE -> `String "ACTIVE"
     

let query_suggestions_id_to_yojson = string_to_yojson

let query_suggestions_block_list_status_to_yojson = 
  fun (x: query_suggestions_block_list_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | ACTIVE_BUT_UPDATE_FAILED -> `String "ACTIVE_BUT_UPDATE_FAILED"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
   

let query_suggestions_block_list_summary_to_yojson = 
  fun (x: query_suggestions_block_list_summary) -> assoc_to_yojson(
    [(
         "ItemCount",
         (option_to_yojson integer__to_yojson x.item_count));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Status",
         (option_to_yojson query_suggestions_block_list_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson query_suggestions_block_list_name_to_yojson x.name));
       (
         "Id",
         (option_to_yojson query_suggestions_block_list_id_to_yojson x.id));
       
  ])

let query_suggestions_block_list_summary_items_to_yojson = 
  fun tree -> list_to_yojson query_suggestions_block_list_summary_to_yojson tree

let query_result_type_to_yojson = 
  fun (x: query_result_type) -> match x with 
 
| ANSWER -> `String "ANSWER"
  | QUESTION_ANSWER -> `String "QUESTION_ANSWER"
  | DOCUMENT -> `String "DOCUMENT"
   

let query_result_format_to_yojson = 
  fun (x: query_result_format) -> match x with 
  | TEXT -> `String "TEXT"
    | TABLE -> `String "TABLE"
     

let additional_result_attribute_value_type_to_yojson = 
  fun (x: additional_result_attribute_value_type) -> match x with 
  | TEXT_WITH_HIGHLIGHTS_VALUE -> `String "TEXT_WITH_HIGHLIGHTS_VALUE"
     

let additional_result_attribute_value_to_yojson = 
  fun (x: additional_result_attribute_value) -> assoc_to_yojson(
    [(
         "TextWithHighlightsValue",
         (option_to_yojson text_with_highlights_to_yojson x.text_with_highlights_value));
       
  ])

let additional_result_attribute_to_yojson = 
  fun (x: additional_result_attribute) -> assoc_to_yojson(
    [(
         "Value",
         (Some (additional_result_attribute_value_to_yojson x.value)));
       (
         "ValueType",
         (Some (additional_result_attribute_value_type_to_yojson x.value_type)));
       (
         "Key",
         (Some (string__to_yojson x.key)));
       
  ])

let additional_result_attribute_list_to_yojson = 
  fun tree -> list_to_yojson additional_result_attribute_to_yojson tree

let feedback_token_to_yojson = string_to_yojson

let expanded_result_item_to_yojson = 
  fun (x: expanded_result_item) -> assoc_to_yojson(
    [(
         "DocumentAttributes",
         (option_to_yojson document_attribute_list_to_yojson x.document_attributes));
       (
         "DocumentURI",
         (option_to_yojson url_to_yojson x.document_ur_i));
       (
         "DocumentExcerpt",
         (option_to_yojson text_with_highlights_to_yojson x.document_excerpt));
       (
         "DocumentTitle",
         (option_to_yojson text_with_highlights_to_yojson x.document_title));
       (
         "DocumentId",
         (option_to_yojson document_id_to_yojson x.document_id));
       (
         "Id",
         (option_to_yojson result_id_to_yojson x.id));
       
  ])

let expanded_result_list_to_yojson = 
  fun tree -> list_to_yojson expanded_result_item_to_yojson tree

let collapsed_result_detail_to_yojson = 
  fun (x: collapsed_result_detail) -> assoc_to_yojson(
    [(
         "ExpandedResults",
         (option_to_yojson expanded_result_list_to_yojson x.expanded_results));
       (
         "DocumentAttribute",
         (Some (document_attribute_to_yojson x.document_attribute)));
       
  ])

let query_result_item_to_yojson = 
  fun (x: query_result_item) -> assoc_to_yojson(
    [(
         "CollapsedResultDetail",
         (option_to_yojson collapsed_result_detail_to_yojson x.collapsed_result_detail));
       (
         "TableExcerpt",
         (option_to_yojson table_excerpt_to_yojson x.table_excerpt));
       (
         "FeedbackToken",
         (option_to_yojson feedback_token_to_yojson x.feedback_token));
       (
         "ScoreAttributes",
         (option_to_yojson score_attributes_to_yojson x.score_attributes));
       (
         "DocumentAttributes",
         (option_to_yojson document_attribute_list_to_yojson x.document_attributes));
       (
         "DocumentURI",
         (option_to_yojson url_to_yojson x.document_ur_i));
       (
         "DocumentExcerpt",
         (option_to_yojson text_with_highlights_to_yojson x.document_excerpt));
       (
         "DocumentTitle",
         (option_to_yojson text_with_highlights_to_yojson x.document_title));
       (
         "DocumentId",
         (option_to_yojson document_id_to_yojson x.document_id));
       (
         "AdditionalAttributes",
         (option_to_yojson additional_result_attribute_list_to_yojson x.additional_attributes));
       (
         "Format",
         (option_to_yojson query_result_format_to_yojson x.format));
       (
         "Type",
         (option_to_yojson query_result_type_to_yojson x.type_));
       (
         "Id",
         (option_to_yojson result_id_to_yojson x.id));
       
  ])

let query_result_item_list_to_yojson = 
  fun tree -> list_to_yojson query_result_item_to_yojson tree

let rec document_attribute_value_count_pair_to_yojson = 
  fun (x: document_attribute_value_count_pair) -> assoc_to_yojson(
    [(
         "FacetResults",
         (option_to_yojson facet_result_list_to_yojson x.facet_results));
       (
         "Count",
         (option_to_yojson integer__to_yojson x.count));
       (
         "DocumentAttributeValue",
         (option_to_yojson document_attribute_value_to_yojson x.document_attribute_value));
       
  ])

and document_attribute_value_count_pair_list_to_yojson = 
  fun tree -> list_to_yojson document_attribute_value_count_pair_to_yojson tree

and facet_result_to_yojson = 
  fun (x: facet_result) -> assoc_to_yojson(
    [(
         "DocumentAttributeValueCountPairs",
         (option_to_yojson document_attribute_value_count_pair_list_to_yojson x.document_attribute_value_count_pairs));
       (
         "DocumentAttributeValueType",
         (option_to_yojson document_attribute_value_type_to_yojson x.document_attribute_value_type));
       (
         "DocumentAttributeKey",
         (option_to_yojson document_attribute_key_to_yojson x.document_attribute_key));
       
  ])

and facet_result_list_to_yojson = 
  fun tree -> list_to_yojson facet_result_to_yojson tree

let featured_results_item_to_yojson = 
  fun (x: featured_results_item) -> assoc_to_yojson(
    [(
         "FeedbackToken",
         (option_to_yojson feedback_token_to_yojson x.feedback_token));
       (
         "DocumentAttributes",
         (option_to_yojson document_attribute_list_to_yojson x.document_attributes));
       (
         "DocumentURI",
         (option_to_yojson url_to_yojson x.document_ur_i));
       (
         "DocumentExcerpt",
         (option_to_yojson text_with_highlights_to_yojson x.document_excerpt));
       (
         "DocumentTitle",
         (option_to_yojson text_with_highlights_to_yojson x.document_title));
       (
         "DocumentId",
         (option_to_yojson document_id_to_yojson x.document_id));
       (
         "AdditionalAttributes",
         (option_to_yojson additional_result_attribute_list_to_yojson x.additional_attributes));
       (
         "Type",
         (option_to_yojson query_result_type_to_yojson x.type_));
       (
         "Id",
         (option_to_yojson result_id_to_yojson x.id));
       
  ])

let featured_results_item_list_to_yojson = 
  fun tree -> list_to_yojson featured_results_item_to_yojson tree

let query_result_to_yojson = 
  fun (x: query_result) -> assoc_to_yojson(
    [(
         "FeaturedResultsItems",
         (option_to_yojson featured_results_item_list_to_yojson x.featured_results_items));
       (
         "SpellCorrectedQueries",
         (option_to_yojson spell_corrected_query_list_to_yojson x.spell_corrected_queries));
       (
         "Warnings",
         (option_to_yojson warning_list_to_yojson x.warnings));
       (
         "TotalNumberOfResults",
         (option_to_yojson integer__to_yojson x.total_number_of_results));
       (
         "FacetResults",
         (option_to_yojson facet_result_list_to_yojson x.facet_results));
       (
         "ResultItems",
         (option_to_yojson query_result_item_list_to_yojson x.result_items));
       (
         "QueryId",
         (option_to_yojson query_id_to_yojson x.query_id));
       
  ])

let rec facet_to_yojson = 
  fun (x: facet) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson top_document_attribute_value_count_pairs_size_to_yojson x.max_results));
       (
         "Facets",
         (option_to_yojson facet_list_to_yojson x.facets));
       (
         "DocumentAttributeKey",
         (option_to_yojson document_attribute_key_to_yojson x.document_attribute_key));
       
  ])

and facet_list_to_yojson = fun tree -> list_to_yojson facet_to_yojson tree

let missing_attribute_key_strategy_to_yojson = 
  fun (x: missing_attribute_key_strategy) -> match x with 
 
| EXPAND -> `String "EXPAND"
  | COLLAPSE -> `String "COLLAPSE"
  | IGNORE -> `String "IGNORE"
   

let expand_configuration_to_yojson = 
  fun (x: expand_configuration) -> assoc_to_yojson(
    [(
         "MaxExpandedResultsPerItem",
         (option_to_yojson integer__to_yojson x.max_expanded_results_per_item));
       (
         "MaxResultItemsToExpand",
         (option_to_yojson integer__to_yojson x.max_result_items_to_expand));
       
  ])

let collapse_configuration_to_yojson = 
  fun (x: collapse_configuration) -> assoc_to_yojson(
    [(
         "ExpandConfiguration",
         (option_to_yojson expand_configuration_to_yojson x.expand_configuration));
       (
         "Expand",
         (option_to_yojson boolean__to_yojson x.expand));
       (
         "MissingAttributeKeyStrategy",
         (option_to_yojson missing_attribute_key_strategy_to_yojson x.missing_attribute_key_strategy));
       (
         "SortingConfigurations",
         (option_to_yojson sorting_configuration_list_to_yojson x.sorting_configurations));
       (
         "DocumentAttributeKey",
         (Some (document_attribute_key_to_yojson x.document_attribute_key)));
       
  ])

let query_request_to_yojson = 
  fun (x: query_request) -> assoc_to_yojson(
    [(
         "CollapseConfiguration",
         (option_to_yojson collapse_configuration_to_yojson x.collapse_configuration));
       (
         "SpellCorrectionConfiguration",
         (option_to_yojson spell_correction_configuration_to_yojson x.spell_correction_configuration));
       (
         "VisitorId",
         (option_to_yojson visitor_id_to_yojson x.visitor_id));
       (
         "UserContext",
         (option_to_yojson user_context_to_yojson x.user_context));
       (
         "SortingConfigurations",
         (option_to_yojson sorting_configuration_list_to_yojson x.sorting_configurations));
       (
         "SortingConfiguration",
         (option_to_yojson sorting_configuration_to_yojson x.sorting_configuration));
       (
         "PageSize",
         (option_to_yojson integer__to_yojson x.page_size));
       (
         "PageNumber",
         (option_to_yojson integer__to_yojson x.page_number));
       (
         "DocumentRelevanceOverrideConfigurations",
         (option_to_yojson document_relevance_override_configuration_list_to_yojson x.document_relevance_override_configurations));
       (
         "QueryResultTypeFilter",
         (option_to_yojson query_result_type_to_yojson x.query_result_type_filter));
       (
         "RequestedDocumentAttributes",
         (option_to_yojson document_attribute_key_list_to_yojson x.requested_document_attributes));
       (
         "Facets",
         (option_to_yojson facet_list_to_yojson x.facets));
       (
         "AttributeFilter",
         (option_to_yojson attribute_filter_to_yojson x.attribute_filter));
       (
         "QueryText",
         (option_to_yojson query_text_to_yojson x.query_text));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let group_id_to_yojson = string_to_yojson

let member_group_to_yojson = 
  fun (x: member_group) -> assoc_to_yojson(
    [(
         "DataSourceId",
         (option_to_yojson data_source_id_to_yojson x.data_source_id));
       (
         "GroupId",
         (Some (group_id_to_yojson x.group_id)));
       
  ])

let member_groups_to_yojson = 
  fun tree -> list_to_yojson member_group_to_yojson tree

let member_user_to_yojson = 
  fun (x: member_user) -> assoc_to_yojson(
    [(
         "UserId",
         (Some (user_id_to_yojson x.user_id)));
       
  ])

let member_users_to_yojson = 
  fun tree -> list_to_yojson member_user_to_yojson tree

let group_members_to_yojson = 
  fun (x: group_members) -> assoc_to_yojson(
    [(
         "S3PathforGroupMembers",
         (option_to_yojson s3_path_to_yojson x.s3_pathfor_group_members));
       (
         "MemberUsers",
         (option_to_yojson member_users_to_yojson x.member_users));
       (
         "MemberGroups",
         (option_to_yojson member_groups_to_yojson x.member_groups));
       
  ])

let principal_ordering_id_to_yojson = long_to_yojson

let put_principal_mapping_request_to_yojson = 
  fun (x: put_principal_mapping_request) -> assoc_to_yojson(
    [(
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "OrderingId",
         (option_to_yojson principal_ordering_id_to_yojson x.ordering_id));
       (
         "GroupMembers",
         (Some (group_members_to_yojson x.group_members)));
       (
         "GroupId",
         (Some (group_id_to_yojson x.group_id)));
       (
         "DataSourceId",
         (option_to_yojson data_source_id_to_yojson x.data_source_id));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let principal_mapping_status_to_yojson = 
  fun (x: principal_mapping_status) -> match x with 
 
| DELETED -> `String "DELETED"
  | DELETING -> `String "DELETING"
  | PROCESSING -> `String "PROCESSING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
   

let entity_id_to_yojson = string_to_yojson

let persona_to_yojson = 
  fun (x: persona) -> match x with 
  | VIEWER -> `String "VIEWER"
    | OWNER -> `String "OWNER"
     

let personas_summary_to_yojson = 
  fun (x: personas_summary) -> assoc_to_yojson(
    [(
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Persona",
         (option_to_yojson persona_to_yojson x.persona));
       (
         "EntityId",
         (option_to_yojson entity_id_to_yojson x.entity_id));
       
  ])

let personas_summary_list_to_yojson = 
  fun tree -> list_to_yojson personas_summary_to_yojson tree

let next_token_to_yojson = string_to_yojson

let name_type_to_yojson = string_to_yojson

let metric_value_to_yojson = string_to_yojson

let metric_type_to_yojson = 
  fun (x: metric_type) -> match x with 
 
| TREND_QUERY_DOC_METRICS -> `String "TREND_QUERY_DOC_METRICS"
  | AGG_QUERY_DOC_METRICS -> `String "AGG_QUERY_DOC_METRICS"
  | DOCS_BY_CLICK_COUNT -> `String "DOCS_BY_CLICK_COUNT"
  | QUERIES_BY_ZERO_RESULT_RATE -> `String "QUERIES_BY_ZERO_RESULT_RATE"
  | QUERIES_BY_ZERO_CLICK_RATE -> `String "QUERIES_BY_ZERO_CLICK_RATE"
  | QUERIES_BY_COUNT -> `String "QUERIES_BY_COUNT"
   

let max_results_integer_for_list_thesauri_request_to_yojson = 
  int_to_yojson

let max_results_integer_for_list_query_suggestions_block_lists_to_yojson = 
  int_to_yojson

let max_results_integer_for_list_principals_request_to_yojson = 
  int_to_yojson

let max_results_integer_for_list_indices_request_to_yojson = int_to_yojson

let max_results_integer_for_list_featured_results_sets_request_to_yojson = 
  int_to_yojson

let max_results_integer_for_list_faqs_request_to_yojson = int_to_yojson

let max_results_integer_for_list_experiences_request_to_yojson = 
  int_to_yojson

let max_results_integer_for_list_entity_personas_request_to_yojson = 
  int_to_yojson

let max_results_integer_for_list_data_sources_request_to_yojson = 
  int_to_yojson

let max_results_integer_for_list_data_source_sync_jobs_request_to_yojson = 
  int_to_yojson

let
max_results_integer_for_list_access_control_configurations_request_to_yojson
= int_to_yojson

let list_thesauri_response_to_yojson = 
  fun (x: list_thesauri_response) -> assoc_to_yojson(
    [(
         "ThesaurusSummaryItems",
         (option_to_yojson thesaurus_summary_items_to_yojson x.thesaurus_summary_items));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_thesauri_request_to_yojson = 
  fun (x: list_thesauri_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_thesauri_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (amazon_resource_name_to_yojson x.resource_ar_n)));
       
  ])

let list_query_suggestions_block_lists_response_to_yojson = 
  fun (x: list_query_suggestions_block_lists_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "BlockListSummaryItems",
         (option_to_yojson query_suggestions_block_list_summary_items_to_yojson x.block_list_summary_items));
       
  ])

let list_query_suggestions_block_lists_request_to_yojson = 
  fun (x: list_query_suggestions_block_lists_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_query_suggestions_block_lists_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let group_summary_to_yojson = 
  fun (x: group_summary) -> assoc_to_yojson(
    [(
         "OrderingId",
         (option_to_yojson principal_ordering_id_to_yojson x.ordering_id));
       (
         "GroupId",
         (option_to_yojson group_id_to_yojson x.group_id));
       
  ])

let list_of_group_summaries_to_yojson = 
  fun tree -> list_to_yojson group_summary_to_yojson tree

let index_edition_to_yojson = 
  fun (x: index_edition) -> match x with 
 
| ENTERPRISE_EDITION -> `String "ENTERPRISE_EDITION"
  | DEVELOPER_EDITION -> `String "DEVELOPER_EDITION"
   

let index_status_to_yojson = 
  fun (x: index_status) -> match x with 
 
| SYSTEM_UPDATING -> `String "SYSTEM_UPDATING"
  | UPDATING -> `String "UPDATING"
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
   

let index_configuration_summary_to_yojson = 
  fun (x: index_configuration_summary) -> assoc_to_yojson(
    [(
         "Status",
         (Some (index_status_to_yojson x.status)));
       (
         "UpdatedAt",
         (Some (timestamp__to_yojson x.updated_at)));
       (
         "CreatedAt",
         (Some (timestamp__to_yojson x.created_at)));
       (
         "Edition",
         (option_to_yojson index_edition_to_yojson x.edition));
       (
         "Id",
         (option_to_yojson index_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson index_name_to_yojson x.name));
       
  ])

let index_configuration_summary_list_to_yojson = 
  fun tree -> list_to_yojson index_configuration_summary_to_yojson tree

let list_indices_response_to_yojson = 
  fun (x: list_indices_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexConfigurationSummaryItems",
         (option_to_yojson index_configuration_summary_list_to_yojson x.index_configuration_summary_items));
       
  ])

let list_indices_request_to_yojson = 
  fun (x: list_indices_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_indices_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_groups_older_than_ordering_id_response_to_yojson = 
  fun (x: list_groups_older_than_ordering_id_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "GroupsSummaries",
         (option_to_yojson list_of_group_summaries_to_yojson x.groups_summaries));
       
  ])

let list_groups_older_than_ordering_id_request_to_yojson = 
  fun (x: list_groups_older_than_ordering_id_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_principals_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "OrderingId",
         (Some (principal_ordering_id_to_yojson x.ordering_id)));
       (
         "DataSourceId",
         (option_to_yojson data_source_id_to_yojson x.data_source_id));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let featured_results_set_summary_to_yojson = 
  fun (x: featured_results_set_summary) -> assoc_to_yojson(
    [(
         "CreationTimestamp",
         (option_to_yojson long_to_yojson x.creation_timestamp));
       (
         "LastUpdatedTimestamp",
         (option_to_yojson long_to_yojson x.last_updated_timestamp));
       (
         "Status",
         (option_to_yojson featured_results_set_status_to_yojson x.status));
       (
         "FeaturedResultsSetName",
         (option_to_yojson featured_results_set_name_to_yojson x.featured_results_set_name));
       (
         "FeaturedResultsSetId",
         (option_to_yojson featured_results_set_id_to_yojson x.featured_results_set_id));
       
  ])

let featured_results_set_summary_items_to_yojson = 
  fun tree -> list_to_yojson featured_results_set_summary_to_yojson tree

let list_featured_results_sets_response_to_yojson = 
  fun (x: list_featured_results_sets_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "FeaturedResultsSetSummaryItems",
         (option_to_yojson featured_results_set_summary_items_to_yojson x.featured_results_set_summary_items));
       
  ])

let list_featured_results_sets_request_to_yojson = 
  fun (x: list_featured_results_sets_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_featured_results_sets_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let faq_name_to_yojson = string_to_yojson

let faq_status_to_yojson = 
  fun (x: faq_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"
   

let faq_file_format_to_yojson = 
  fun (x: faq_file_format) -> match x with 
 
| JSON -> `String "JSON"
  | CSV_WITH_HEADER -> `String "CSV_WITH_HEADER"
  | CSV -> `String "CSV"
   

let faq_summary_to_yojson = 
  fun (x: faq_summary) -> assoc_to_yojson(
    [(
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "FileFormat",
         (option_to_yojson faq_file_format_to_yojson x.file_format));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Status",
         (option_to_yojson faq_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson faq_name_to_yojson x.name));
       (
         "Id",
         (option_to_yojson faq_id_to_yojson x.id));
       
  ])

let faq_summary_items_to_yojson = 
  fun tree -> list_to_yojson faq_summary_to_yojson tree

let list_faqs_response_to_yojson = 
  fun (x: list_faqs_response) -> assoc_to_yojson(
    [(
         "FaqSummaryItems",
         (option_to_yojson faq_summary_items_to_yojson x.faq_summary_items));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let list_faqs_request_to_yojson = 
  fun (x: list_faqs_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_faqs_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let experience_status_to_yojson = 
  fun (x: experience_status) -> match x with 
 
| FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"
   

let endpoint_type_to_yojson = 
  fun (x: endpoint_type) -> match x with 
  | HOME -> `String "HOME"
     

let endpoint_to_yojson = string_to_yojson

let experience_endpoint_to_yojson = 
  fun (x: experience_endpoint) -> assoc_to_yojson(
    [(
         "Endpoint",
         (option_to_yojson endpoint_to_yojson x.endpoint));
       (
         "EndpointType",
         (option_to_yojson endpoint_type_to_yojson x.endpoint_type));
       
  ])

let experience_endpoints_to_yojson = 
  fun tree -> list_to_yojson experience_endpoint_to_yojson tree

let experiences_summary_to_yojson = 
  fun (x: experiences_summary) -> assoc_to_yojson(
    [(
         "Endpoints",
         (option_to_yojson experience_endpoints_to_yojson x.endpoints));
       (
         "Status",
         (option_to_yojson experience_status_to_yojson x.status));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Id",
         (option_to_yojson experience_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson experience_name_to_yojson x.name));
       
  ])

let experiences_summary_list_to_yojson = 
  fun tree -> list_to_yojson experiences_summary_to_yojson tree

let list_experiences_response_to_yojson = 
  fun (x: list_experiences_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SummaryItems",
         (option_to_yojson experiences_summary_list_to_yojson x.summary_items));
       
  ])

let list_experiences_request_to_yojson = 
  fun (x: list_experiences_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_experiences_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let entity_type_to_yojson = 
  fun (x: entity_type) -> match x with 
  | GROUP -> `String "GROUP"
    | USER -> `String "USER"
     

let entity_display_data_to_yojson = 
  fun (x: entity_display_data) -> assoc_to_yojson(
    [(
         "LastName",
         (option_to_yojson name_type_to_yojson x.last_name));
       (
         "FirstName",
         (option_to_yojson name_type_to_yojson x.first_name));
       (
         "IdentifiedUserName",
         (option_to_yojson name_type_to_yojson x.identified_user_name));
       (
         "GroupName",
         (option_to_yojson name_type_to_yojson x.group_name));
       (
         "UserName",
         (option_to_yojson name_type_to_yojson x.user_name));
       
  ])

let experience_entities_summary_to_yojson = 
  fun (x: experience_entities_summary) -> assoc_to_yojson(
    [(
         "DisplayData",
         (option_to_yojson entity_display_data_to_yojson x.display_data));
       (
         "EntityType",
         (option_to_yojson entity_type_to_yojson x.entity_type));
       (
         "EntityId",
         (option_to_yojson entity_id_to_yojson x.entity_id));
       
  ])

let experience_entities_summary_list_to_yojson = 
  fun tree -> list_to_yojson experience_entities_summary_to_yojson tree

let list_experience_entities_response_to_yojson = 
  fun (x: list_experience_entities_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SummaryItems",
         (option_to_yojson experience_entities_summary_list_to_yojson x.summary_items));
       
  ])

let list_experience_entities_request_to_yojson = 
  fun (x: list_experience_entities_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let list_entity_personas_response_to_yojson = 
  fun (x: list_entity_personas_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SummaryItems",
         (option_to_yojson personas_summary_list_to_yojson x.summary_items));
       
  ])

let list_entity_personas_request_to_yojson = 
  fun (x: list_entity_personas_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_entity_personas_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let data_source_type_to_yojson = 
  fun (x: data_source_type) -> match x with 
 
| TEMPLATE -> `String "TEMPLATE"
  | ALFRESCO -> `String "ALFRESCO"
  | GITHUB -> `String "GITHUB"
  | JIRA -> `String "JIRA"
  | QUIP -> `String "QUIP"
  | BOX -> `String "BOX"
  | SLACK -> `String "SLACK"
  | FSX -> `String "FSX"
  | WORKDOCS -> `String "WORKDOCS"
  | WEBCRAWLER -> `String "WEBCRAWLER"
  | GOOGLEDRIVE -> `String "GOOGLEDRIVE"
  | CONFLUENCE -> `String "CONFLUENCE"
  | CUSTOM -> `String "CUSTOM"
  | SERVICENOW -> `String "SERVICENOW"
  | ONEDRIVE -> `String "ONEDRIVE"
  | SALESFORCE -> `String "SALESFORCE"
  | DATABASE -> `String "DATABASE"
  | SHAREPOINT -> `String "SHAREPOINT"
  | S3 -> `String "S3"
   

let data_source_status_to_yojson = 
  fun (x: data_source_status) -> match x with 
 
| ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
   

let data_source_summary_to_yojson = 
  fun (x: data_source_summary) -> assoc_to_yojson(
    [(
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "Status",
         (option_to_yojson data_source_status_to_yojson x.status));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Type",
         (option_to_yojson data_source_type_to_yojson x.type_));
       (
         "Id",
         (option_to_yojson data_source_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson data_source_name_to_yojson x.name));
       
  ])

let data_source_summary_list_to_yojson = 
  fun tree -> list_to_yojson data_source_summary_to_yojson tree

let list_data_sources_response_to_yojson = 
  fun (x: list_data_sources_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SummaryItems",
         (option_to_yojson data_source_summary_list_to_yojson x.summary_items));
       
  ])

let list_data_sources_request_to_yojson = 
  fun (x: list_data_sources_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_data_sources_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let data_source_sync_job_status_to_yojson = 
  fun (x: data_source_sync_job_status) -> match x with 
 
| SYNCING_INDEXING -> `String "SYNCING_INDEXING"
  | ABORTED -> `String "ABORTED"
  | STOPPING -> `String "STOPPING"
  | INCOMPLETE -> `String "INCOMPLETE"
  | SYNCING -> `String "SYNCING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
   

let error_code_to_yojson = 
  fun (x: error_code) -> match x with 
 
| INVALID_REQUEST -> `String "InvalidRequest"
  | INTERNAL_ERROR -> `String "InternalError"
   

let data_source_sync_job_metrics_to_yojson = 
  fun (x: data_source_sync_job_metrics) -> assoc_to_yojson(
    [(
         "DocumentsScanned",
         (option_to_yojson metric_value_to_yojson x.documents_scanned));
       (
         "DocumentsFailed",
         (option_to_yojson metric_value_to_yojson x.documents_failed));
       (
         "DocumentsDeleted",
         (option_to_yojson metric_value_to_yojson x.documents_deleted));
       (
         "DocumentsModified",
         (option_to_yojson metric_value_to_yojson x.documents_modified));
       (
         "DocumentsAdded",
         (option_to_yojson metric_value_to_yojson x.documents_added));
       
  ])

let data_source_sync_job_to_yojson = 
  fun (x: data_source_sync_job) -> assoc_to_yojson(
    [(
         "Metrics",
         (option_to_yojson data_source_sync_job_metrics_to_yojson x.metrics));
       (
         "DataSourceErrorCode",
         (option_to_yojson string__to_yojson x.data_source_error_code));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "Status",
         (option_to_yojson data_source_sync_job_status_to_yojson x.status));
       (
         "EndTime",
         (option_to_yojson timestamp__to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson timestamp__to_yojson x.start_time));
       (
         "ExecutionId",
         (option_to_yojson string__to_yojson x.execution_id));
       
  ])

let data_source_sync_job_history_list_to_yojson = 
  fun tree -> list_to_yojson data_source_sync_job_to_yojson tree

let list_data_source_sync_jobs_response_to_yojson = 
  fun (x: list_data_source_sync_jobs_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "History",
         (option_to_yojson data_source_sync_job_history_list_to_yojson x.history));
       
  ])

let list_data_source_sync_jobs_request_to_yojson = 
  fun (x: list_data_source_sync_jobs_request) -> assoc_to_yojson(
    [(
         "StatusFilter",
         (option_to_yojson data_source_sync_job_status_to_yojson x.status_filter));
       (
         "StartTimeFilter",
         (option_to_yojson time_range_to_yojson x.start_time_filter));
       (
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_data_source_sync_jobs_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (data_source_id_to_yojson x.id)));
       
  ])

let access_control_configuration_summary_to_yojson = 
  fun (x: access_control_configuration_summary) -> assoc_to_yojson(
    [(
         "Id",
         (Some (access_control_configuration_id_to_yojson x.id)));
       
  ])

let access_control_configuration_summary_list_to_yojson = 
  fun tree -> list_to_yojson access_control_configuration_summary_to_yojson tree

let list_access_control_configurations_response_to_yojson = 
  fun (x: list_access_control_configurations_response) -> assoc_to_yojson(
    [(
         "AccessControlConfigurations",
         (Some (access_control_configuration_summary_list_to_yojson x.access_control_configurations)));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let list_access_control_configurations_request_to_yojson = 
  fun (x: list_access_control_configurations_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_integer_for_list_access_control_configurations_request_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let invalid_request_exception_to_yojson = 
  fun (x: invalid_request_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let interval_to_yojson = 
  fun (x: interval) -> match x with 
 
| TWO_MONTHS_AGO -> `String "TWO_MONTHS_AGO"
  | ONE_MONTH_AGO -> `String "ONE_MONTH_AGO"
  | TWO_WEEKS_AGO -> `String "TWO_WEEKS_AGO"
  | ONE_WEEK_AGO -> `String "ONE_WEEK_AGO"
  | THIS_WEEK -> `String "THIS_WEEK"
  | THIS_MONTH -> `String "THIS_MONTH"
   

let indexed_question_answers_count_to_yojson = int_to_yojson

let faq_statistics_to_yojson = 
  fun (x: faq_statistics) -> assoc_to_yojson(
    [(
         "IndexedQuestionAnswersCount",
         (Some (indexed_question_answers_count_to_yojson x.indexed_question_answers_count)));
       
  ])

let index_statistics_to_yojson = 
  fun (x: index_statistics) -> assoc_to_yojson(
    [(
         "TextDocumentStatistics",
         (Some (text_document_statistics_to_yojson x.text_document_statistics)));
       (
         "FaqStatistics",
         (Some (faq_statistics_to_yojson x.faq_statistics)));
       
  ])

let failure_reason_to_yojson = string_to_yojson

let group_ordering_id_summary_to_yojson = 
  fun (x: group_ordering_id_summary) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson failure_reason_to_yojson x.failure_reason));
       (
         "OrderingId",
         (option_to_yojson principal_ordering_id_to_yojson x.ordering_id));
       (
         "ReceivedAt",
         (option_to_yojson timestamp__to_yojson x.received_at));
       (
         "LastUpdatedAt",
         (option_to_yojson timestamp__to_yojson x.last_updated_at));
       (
         "Status",
         (option_to_yojson principal_mapping_status_to_yojson x.status));
       
  ])

let group_ordering_id_summaries_to_yojson = 
  fun tree -> list_to_yojson group_ordering_id_summary_to_yojson tree

let get_snapshots_response_to_yojson = 
  fun (x: get_snapshots_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SnapshotsData",
         (option_to_yojson snapshots_data_records_to_yojson x.snapshots_data));
       (
         "SnapshotsDataHeader",
         (option_to_yojson snapshots_data_header_fields_to_yojson x.snapshots_data_header));
       (
         "SnapShotTimeFilter",
         (option_to_yojson time_range_to_yojson x.snap_shot_time_filter));
       
  ])

let get_snapshots_request_to_yojson = 
  fun (x: get_snapshots_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson integer__to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MetricType",
         (Some (metric_type_to_yojson x.metric_type)));
       (
         "Interval",
         (Some (interval_to_yojson x.interval)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let get_query_suggestions_response_to_yojson = 
  fun (x: get_query_suggestions_response) -> assoc_to_yojson(
    [(
         "Suggestions",
         (option_to_yojson suggestion_list_to_yojson x.suggestions));
       (
         "QuerySuggestionsId",
         (option_to_yojson query_suggestions_id_to_yojson x.query_suggestions_id));
       
  ])

let attribute_suggestions_get_config_to_yojson = 
  fun (x: attribute_suggestions_get_config) -> assoc_to_yojson(
    [(
         "UserContext",
         (option_to_yojson user_context_to_yojson x.user_context));
       (
         "AttributeFilter",
         (option_to_yojson attribute_filter_to_yojson x.attribute_filter));
       (
         "AdditionalResponseAttributes",
         (option_to_yojson document_attribute_key_list_to_yojson x.additional_response_attributes));
       (
         "SuggestionAttributes",
         (option_to_yojson document_attribute_key_list_to_yojson x.suggestion_attributes));
       
  ])

let get_query_suggestions_request_to_yojson = 
  fun (x: get_query_suggestions_request) -> assoc_to_yojson(
    [(
         "AttributeSuggestionsConfig",
         (option_to_yojson attribute_suggestions_get_config_to_yojson x.attribute_suggestions_config));
       (
         "SuggestionTypes",
         (option_to_yojson suggestion_types_to_yojson x.suggestion_types));
       (
         "MaxSuggestionsCount",
         (option_to_yojson integer__to_yojson x.max_suggestions_count));
       (
         "QueryText",
         (Some (suggestion_query_text_to_yojson x.query_text)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let featured_results_set_id_list_to_yojson = 
  fun tree -> list_to_yojson featured_results_set_id_to_yojson tree

let featured_document_with_metadata_to_yojson = 
  fun (x: featured_document_with_metadata) -> assoc_to_yojson(
    [(
         "URI",
         (option_to_yojson url_to_yojson x.ur_i));
       (
         "Title",
         (option_to_yojson string__to_yojson x.title));
       (
         "Id",
         (option_to_yojson document_id_to_yojson x.id));
       
  ])

let featured_document_with_metadata_list_to_yojson = 
  fun tree -> list_to_yojson featured_document_with_metadata_to_yojson tree

let featured_document_missing_to_yojson = 
  fun (x: featured_document_missing) -> assoc_to_yojson(
    [(
         "Id",
         (option_to_yojson document_id_to_yojson x.id));
       
  ])

let featured_document_missing_list_to_yojson = 
  fun tree -> list_to_yojson featured_document_missing_to_yojson tree

let failed_entity_to_yojson = 
  fun (x: failed_entity) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "EntityId",
         (option_to_yojson entity_id_to_yojson x.entity_id));
       
  ])

let failed_entity_list_to_yojson = 
  fun tree -> list_to_yojson failed_entity_to_yojson tree

let entity_persona_configuration_to_yojson = 
  fun (x: entity_persona_configuration) -> assoc_to_yojson(
    [(
         "Persona",
         (Some (persona_to_yojson x.persona)));
       (
         "EntityId",
         (Some (entity_id_to_yojson x.entity_id)));
       
  ])

let entity_persona_configuration_list_to_yojson = 
  fun tree -> list_to_yojson entity_persona_configuration_to_yojson tree

let entity_ids_list_to_yojson = 
  fun tree -> list_to_yojson entity_id_to_yojson tree

let entity_configuration_to_yojson = 
  fun (x: entity_configuration) -> assoc_to_yojson(
    [(
         "EntityType",
         (Some (entity_type_to_yojson x.entity_type)));
       (
         "EntityId",
         (Some (entity_id_to_yojson x.entity_id)));
       
  ])

let document_status_list_to_yojson = 
  fun tree -> list_to_yojson status_to_yojson tree

let blob_to_yojson = blob_to_yojson

let content_type_to_yojson = 
  fun (x: content_type) -> match x with 
 
| MD -> `String "MD"
  | JSON -> `String "JSON"
  | CSV -> `String "CSV"
  | MS_EXCEL -> `String "MS_EXCEL"
  | XSLT -> `String "XSLT"
  | XML -> `String "XML"
  | RTF -> `String "RTF"
  | PPT -> `String "PPT"
  | PLAIN_TEXT -> `String "PLAIN_TEXT"
  | MS_WORD -> `String "MS_WORD"
  | HTML -> `String "HTML"
  | PDF -> `String "PDF"
   

let document_to_yojson = 
  fun (x: document) -> assoc_to_yojson(
    [(
         "AccessControlConfigurationId",
         (option_to_yojson access_control_configuration_id_to_yojson x.access_control_configuration_id));
       (
         "ContentType",
         (option_to_yojson content_type_to_yojson x.content_type));
       (
         "HierarchicalAccessControlList",
         (option_to_yojson hierarchical_principal_list_to_yojson x.hierarchical_access_control_list));
       (
         "AccessControlList",
         (option_to_yojson principal_list_to_yojson x.access_control_list));
       (
         "Attributes",
         (option_to_yojson document_attribute_list_to_yojson x.attributes));
       (
         "S3Path",
         (option_to_yojson s3_path_to_yojson x.s3_path));
       (
         "Blob",
         (option_to_yojson blob_to_yojson x.blob));
       (
         "Title",
         (option_to_yojson title_to_yojson x.title));
       (
         "Id",
         (Some (document_id_to_yojson x.id)));
       
  ])

let document_list_to_yojson = 
  fun tree -> list_to_yojson document_to_yojson tree

let document_info_to_yojson = 
  fun (x: document_info) -> assoc_to_yojson(
    [(
         "Attributes",
         (option_to_yojson document_attribute_list_to_yojson x.attributes));
       (
         "DocumentId",
         (Some (document_id_to_yojson x.document_id)));
       
  ])

let document_info_list_to_yojson = 
  fun tree -> list_to_yojson document_info_to_yojson tree

let document_id_list_to_yojson = 
  fun tree -> list_to_yojson document_id_to_yojson tree

let disassociate_personas_from_entities_response_to_yojson = 
  fun (x: disassociate_personas_from_entities_response) -> assoc_to_yojson(
    [(
         "FailedEntityList",
         (option_to_yojson failed_entity_list_to_yojson x.failed_entity_list));
       
  ])

let disassociate_personas_from_entities_request_to_yojson = 
  fun (x: disassociate_personas_from_entities_request) -> assoc_to_yojson(
    [(
         "EntityIds",
         (Some (entity_ids_list_to_yojson x.entity_ids)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let disassociate_entity_list_to_yojson = 
  fun tree -> list_to_yojson entity_configuration_to_yojson tree

let disassociate_entities_from_experience_response_to_yojson = 
  fun (x: disassociate_entities_from_experience_response) -> assoc_to_yojson(
    [(
         "FailedEntityList",
         (option_to_yojson failed_entity_list_to_yojson x.failed_entity_list));
       
  ])

let disassociate_entities_from_experience_request_to_yojson = 
  fun (x: disassociate_entities_from_experience_request) -> assoc_to_yojson(
    [(
         "EntityList",
         (Some (disassociate_entity_list_to_yojson x.entity_list)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let describe_thesaurus_response_to_yojson = 
  fun (x: describe_thesaurus_response) -> assoc_to_yojson(
    [(
         "SynonymRuleCount",
         (option_to_yojson long_to_yojson x.synonym_rule_count));
       (
         "TermCount",
         (option_to_yojson long_to_yojson x.term_count));
       (
         "FileSizeBytes",
         (option_to_yojson long_to_yojson x.file_size_bytes));
       (
         "SourceS3Path",
         (option_to_yojson s3_path_to_yojson x.source_s3_path));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "Status",
         (option_to_yojson thesaurus_status_to_yojson x.status));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson thesaurus_name_to_yojson x.name));
       (
         "IndexId",
         (option_to_yojson index_id_to_yojson x.index_id));
       (
         "Id",
         (option_to_yojson thesaurus_id_to_yojson x.id));
       
  ])

let describe_thesaurus_request_to_yojson = 
  fun (x: describe_thesaurus_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (thesaurus_id_to_yojson x.id)));
       
  ])

let attribute_suggestions_describe_config_to_yojson = 
  fun (x: attribute_suggestions_describe_config) -> assoc_to_yojson(
    [(
         "AttributeSuggestionsMode",
         (option_to_yojson attribute_suggestions_mode_to_yojson x.attribute_suggestions_mode));
       (
         "SuggestableConfigList",
         (option_to_yojson suggestable_config_list_to_yojson x.suggestable_config_list));
       
  ])

let describe_query_suggestions_config_response_to_yojson = 
  fun (x: describe_query_suggestions_config_response) -> assoc_to_yojson(
    [(
         "AttributeSuggestionsConfig",
         (option_to_yojson attribute_suggestions_describe_config_to_yojson x.attribute_suggestions_config));
       (
         "TotalSuggestionsCount",
         (option_to_yojson integer__to_yojson x.total_suggestions_count));
       (
         "LastClearTime",
         (option_to_yojson timestamp__to_yojson x.last_clear_time));
       (
         "LastSuggestionsBuildTime",
         (option_to_yojson timestamp__to_yojson x.last_suggestions_build_time));
       (
         "MinimumQueryCount",
         (option_to_yojson minimum_query_count_to_yojson x.minimum_query_count));
       (
         "MinimumNumberOfQueryingUsers",
         (option_to_yojson minimum_number_of_querying_users_to_yojson x.minimum_number_of_querying_users));
       (
         "IncludeQueriesWithoutUserInformation",
         (option_to_yojson object_boolean_to_yojson x.include_queries_without_user_information));
       (
         "QueryLogLookBackWindowInDays",
         (option_to_yojson integer__to_yojson x.query_log_look_back_window_in_days));
       (
         "Status",
         (option_to_yojson query_suggestions_status_to_yojson x.status));
       (
         "Mode",
         (option_to_yojson mode_to_yojson x.mode));
       
  ])

let describe_query_suggestions_config_request_to_yojson = 
  fun (x: describe_query_suggestions_config_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let describe_query_suggestions_block_list_response_to_yojson = 
  fun (x: describe_query_suggestions_block_list_response) -> assoc_to_yojson(
    [(
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "FileSizeBytes",
         (option_to_yojson long_to_yojson x.file_size_bytes));
       (
         "ItemCount",
         (option_to_yojson integer__to_yojson x.item_count));
       (
         "SourceS3Path",
         (option_to_yojson s3_path_to_yojson x.source_s3_path));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "Status",
         (option_to_yojson query_suggestions_block_list_status_to_yojson x.status));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson query_suggestions_block_list_name_to_yojson x.name));
       (
         "Id",
         (option_to_yojson query_suggestions_block_list_id_to_yojson x.id));
       (
         "IndexId",
         (option_to_yojson index_id_to_yojson x.index_id));
       
  ])

let describe_query_suggestions_block_list_request_to_yojson = 
  fun (x: describe_query_suggestions_block_list_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (query_suggestions_block_list_id_to_yojson x.id)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let describe_principal_mapping_response_to_yojson = 
  fun (x: describe_principal_mapping_response) -> assoc_to_yojson(
    [(
         "GroupOrderingIdSummaries",
         (option_to_yojson group_ordering_id_summaries_to_yojson x.group_ordering_id_summaries));
       (
         "GroupId",
         (option_to_yojson group_id_to_yojson x.group_id));
       (
         "DataSourceId",
         (option_to_yojson data_source_id_to_yojson x.data_source_id));
       (
         "IndexId",
         (option_to_yojson index_id_to_yojson x.index_id));
       
  ])

let describe_principal_mapping_request_to_yojson = 
  fun (x: describe_principal_mapping_request) -> assoc_to_yojson(
    [(
         "GroupId",
         (Some (group_id_to_yojson x.group_id)));
       (
         "DataSourceId",
         (option_to_yojson data_source_id_to_yojson x.data_source_id));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let describe_index_response_to_yojson = 
  fun (x: describe_index_response) -> assoc_to_yojson(
    [(
         "UserGroupResolutionConfiguration",
         (option_to_yojson user_group_resolution_configuration_to_yojson x.user_group_resolution_configuration));
       (
         "UserContextPolicy",
         (option_to_yojson user_context_policy_to_yojson x.user_context_policy));
       (
         "UserTokenConfigurations",
         (option_to_yojson user_token_configuration_list_to_yojson x.user_token_configurations));
       (
         "CapacityUnits",
         (option_to_yojson capacity_units_configuration_to_yojson x.capacity_units));
       (
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "IndexStatistics",
         (option_to_yojson index_statistics_to_yojson x.index_statistics));
       (
         "DocumentMetadataConfigurations",
         (option_to_yojson document_metadata_configuration_list_to_yojson x.document_metadata_configurations));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Status",
         (option_to_yojson index_status_to_yojson x.status));
       (
         "ServerSideEncryptionConfiguration",
         (option_to_yojson server_side_encryption_configuration_to_yojson x.server_side_encryption_configuration));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Edition",
         (option_to_yojson index_edition_to_yojson x.edition));
       (
         "Id",
         (option_to_yojson index_id_to_yojson x.id));
       (
         "Name",
         (option_to_yojson index_name_to_yojson x.name));
       
  ])

let describe_index_request_to_yojson = 
  fun (x: describe_index_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (index_id_to_yojson x.id)));
       
  ])

let describe_featured_results_set_response_to_yojson = 
  fun (x: describe_featured_results_set_response) -> assoc_to_yojson(
    [(
         "CreationTimestamp",
         (option_to_yojson long_to_yojson x.creation_timestamp));
       (
         "LastUpdatedTimestamp",
         (option_to_yojson long_to_yojson x.last_updated_timestamp));
       (
         "FeaturedDocumentsMissing",
         (option_to_yojson featured_document_missing_list_to_yojson x.featured_documents_missing));
       (
         "FeaturedDocumentsWithMetadata",
         (option_to_yojson featured_document_with_metadata_list_to_yojson x.featured_documents_with_metadata));
       (
         "QueryTexts",
         (option_to_yojson query_text_list_to_yojson x.query_texts));
       (
         "Status",
         (option_to_yojson featured_results_set_status_to_yojson x.status));
       (
         "Description",
         (option_to_yojson featured_results_set_description_to_yojson x.description));
       (
         "FeaturedResultsSetName",
         (option_to_yojson featured_results_set_name_to_yojson x.featured_results_set_name));
       (
         "FeaturedResultsSetId",
         (option_to_yojson featured_results_set_id_to_yojson x.featured_results_set_id));
       
  ])

let describe_featured_results_set_request_to_yojson = 
  fun (x: describe_featured_results_set_request) -> assoc_to_yojson(
    [(
         "FeaturedResultsSetId",
         (Some (featured_results_set_id_to_yojson x.featured_results_set_id)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let describe_faq_response_to_yojson = 
  fun (x: describe_faq_response) -> assoc_to_yojson(
    [(
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "FileFormat",
         (option_to_yojson faq_file_format_to_yojson x.file_format));
       (
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Status",
         (option_to_yojson faq_status_to_yojson x.status));
       (
         "S3Path",
         (option_to_yojson s3_path_to_yojson x.s3_path));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson faq_name_to_yojson x.name));
       (
         "IndexId",
         (option_to_yojson index_id_to_yojson x.index_id));
       (
         "Id",
         (option_to_yojson faq_id_to_yojson x.id));
       
  ])

let describe_faq_request_to_yojson = 
  fun (x: describe_faq_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (faq_id_to_yojson x.id)));
       
  ])

let describe_experience_response_to_yojson = 
  fun (x: describe_experience_response) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Status",
         (option_to_yojson experience_status_to_yojson x.status));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "Configuration",
         (option_to_yojson experience_configuration_to_yojson x.configuration));
       (
         "Endpoints",
         (option_to_yojson experience_endpoints_to_yojson x.endpoints));
       (
         "Name",
         (option_to_yojson experience_name_to_yojson x.name));
       (
         "IndexId",
         (option_to_yojson index_id_to_yojson x.index_id));
       (
         "Id",
         (option_to_yojson experience_id_to_yojson x.id));
       
  ])

let describe_experience_request_to_yojson = 
  fun (x: describe_experience_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let describe_data_source_response_to_yojson = 
  fun (x: describe_data_source_response) -> assoc_to_yojson(
    [(
         "CustomDocumentEnrichmentConfiguration",
         (option_to_yojson custom_document_enrichment_configuration_to_yojson x.custom_document_enrichment_configuration));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Schedule",
         (option_to_yojson scan_schedule_to_yojson x.schedule));
       (
         "Status",
         (option_to_yojson data_source_status_to_yojson x.status));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "UpdatedAt",
         (option_to_yojson timestamp__to_yojson x.updated_at));
       (
         "CreatedAt",
         (option_to_yojson timestamp__to_yojson x.created_at));
       (
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "Configuration",
         (option_to_yojson data_source_configuration_to_yojson x.configuration));
       (
         "Type",
         (option_to_yojson data_source_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson data_source_name_to_yojson x.name));
       (
         "IndexId",
         (option_to_yojson index_id_to_yojson x.index_id));
       (
         "Id",
         (option_to_yojson data_source_id_to_yojson x.id));
       
  ])

let describe_data_source_request_to_yojson = 
  fun (x: describe_data_source_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (data_source_id_to_yojson x.id)));
       
  ])

let describe_access_control_configuration_response_to_yojson = 
  fun (x: describe_access_control_configuration_response) -> assoc_to_yojson(
    [(
         "HierarchicalAccessControlList",
         (option_to_yojson hierarchical_principal_list_to_yojson x.hierarchical_access_control_list));
       (
         "AccessControlList",
         (option_to_yojson principal_list_to_yojson x.access_control_list));
       (
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (Some (access_control_configuration_name_to_yojson x.name)));
       
  ])

let describe_access_control_configuration_request_to_yojson = 
  fun (x: describe_access_control_configuration_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (access_control_configuration_id_to_yojson x.id)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let delete_thesaurus_request_to_yojson = 
  fun (x: delete_thesaurus_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (thesaurus_id_to_yojson x.id)));
       
  ])

let delete_query_suggestions_block_list_request_to_yojson = 
  fun (x: delete_query_suggestions_block_list_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (query_suggestions_block_list_id_to_yojson x.id)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let delete_principal_mapping_request_to_yojson = 
  fun (x: delete_principal_mapping_request) -> assoc_to_yojson(
    [(
         "OrderingId",
         (option_to_yojson principal_ordering_id_to_yojson x.ordering_id));
       (
         "GroupId",
         (Some (group_id_to_yojson x.group_id)));
       (
         "DataSourceId",
         (option_to_yojson data_source_id_to_yojson x.data_source_id));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let delete_index_request_to_yojson = 
  fun (x: delete_index_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (index_id_to_yojson x.id)));
       
  ])

let delete_faq_request_to_yojson = 
  fun (x: delete_faq_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (faq_id_to_yojson x.id)));
       
  ])

let delete_experience_response_to_yojson = 
  fun (x: delete_experience_response) -> assoc_to_yojson(
    [
  ])

let delete_experience_request_to_yojson = 
  fun (x: delete_experience_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let delete_data_source_request_to_yojson = 
  fun (x: delete_data_source_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (data_source_id_to_yojson x.id)));
       
  ])

let delete_access_control_configuration_response_to_yojson = 
  fun (x: delete_access_control_configuration_response) -> assoc_to_yojson(
    [
  ])

let delete_access_control_configuration_request_to_yojson = 
  fun (x: delete_access_control_configuration_request) -> assoc_to_yojson(
    [(
         "Id",
         (Some (access_control_configuration_id_to_yojson x.id)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let data_source_sync_job_id_to_yojson = string_to_yojson

let data_source_sync_job_metric_target_to_yojson = 
  fun (x: data_source_sync_job_metric_target) -> assoc_to_yojson(
    [(
         "DataSourceSyncJobId",
         (option_to_yojson data_source_sync_job_id_to_yojson x.data_source_sync_job_id));
       (
         "DataSourceId",
         (Some (data_source_id_to_yojson x.data_source_id)));
       
  ])

let create_thesaurus_response_to_yojson = 
  fun (x: create_thesaurus_response) -> assoc_to_yojson(
    [(
         "Id",
         (option_to_yojson thesaurus_id_to_yojson x.id));
       
  ])

let client_token_name_to_yojson = string_to_yojson

let create_thesaurus_request_to_yojson = 
  fun (x: create_thesaurus_request) -> assoc_to_yojson(
    [(
         "ClientToken",
         (option_to_yojson client_token_name_to_yojson x.client_token));
       (
         "SourceS3Path",
         (Some (s3_path_to_yojson x.source_s3_path)));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "RoleArn",
         (Some (role_arn_to_yojson x.role_arn)));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (Some (thesaurus_name_to_yojson x.name)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let create_query_suggestions_block_list_response_to_yojson = 
  fun (x: create_query_suggestions_block_list_response) -> assoc_to_yojson(
    [(
         "Id",
         (option_to_yojson query_suggestions_block_list_id_to_yojson x.id));
       
  ])

let create_query_suggestions_block_list_request_to_yojson = 
  fun (x: create_query_suggestions_block_list_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "RoleArn",
         (Some (role_arn_to_yojson x.role_arn)));
       (
         "ClientToken",
         (option_to_yojson client_token_name_to_yojson x.client_token));
       (
         "SourceS3Path",
         (Some (s3_path_to_yojson x.source_s3_path)));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (Some (query_suggestions_block_list_name_to_yojson x.name)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let create_index_response_to_yojson = 
  fun (x: create_index_response) -> assoc_to_yojson(
    [(
         "Id",
         (option_to_yojson index_id_to_yojson x.id));
       
  ])

let create_index_request_to_yojson = 
  fun (x: create_index_request) -> assoc_to_yojson(
    [(
         "UserGroupResolutionConfiguration",
         (option_to_yojson user_group_resolution_configuration_to_yojson x.user_group_resolution_configuration));
       (
         "UserContextPolicy",
         (option_to_yojson user_context_policy_to_yojson x.user_context_policy));
       (
         "UserTokenConfigurations",
         (option_to_yojson user_token_configuration_list_to_yojson x.user_token_configurations));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ClientToken",
         (option_to_yojson client_token_name_to_yojson x.client_token));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "ServerSideEncryptionConfiguration",
         (option_to_yojson server_side_encryption_configuration_to_yojson x.server_side_encryption_configuration));
       (
         "RoleArn",
         (Some (role_arn_to_yojson x.role_arn)));
       (
         "Edition",
         (option_to_yojson index_edition_to_yojson x.edition));
       (
         "Name",
         (Some (index_name_to_yojson x.name)));
       
  ])

let create_featured_results_set_response_to_yojson = 
  fun (x: create_featured_results_set_response) -> assoc_to_yojson(
    [(
         "FeaturedResultsSet",
         (option_to_yojson featured_results_set_to_yojson x.featured_results_set));
       
  ])

let create_featured_results_set_request_to_yojson = 
  fun (x: create_featured_results_set_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "FeaturedDocuments",
         (option_to_yojson featured_document_list_to_yojson x.featured_documents));
       (
         "QueryTexts",
         (option_to_yojson query_text_list_to_yojson x.query_texts));
       (
         "Status",
         (option_to_yojson featured_results_set_status_to_yojson x.status));
       (
         "ClientToken",
         (option_to_yojson client_token_name_to_yojson x.client_token));
       (
         "Description",
         (option_to_yojson featured_results_set_description_to_yojson x.description));
       (
         "FeaturedResultsSetName",
         (Some (featured_results_set_name_to_yojson x.featured_results_set_name)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let create_faq_response_to_yojson = 
  fun (x: create_faq_response) -> assoc_to_yojson(
    [(
         "Id",
         (option_to_yojson faq_id_to_yojson x.id));
       
  ])

let create_faq_request_to_yojson = 
  fun (x: create_faq_request) -> assoc_to_yojson(
    [(
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "ClientToken",
         (option_to_yojson client_token_name_to_yojson x.client_token));
       (
         "FileFormat",
         (option_to_yojson faq_file_format_to_yojson x.file_format));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "RoleArn",
         (Some (role_arn_to_yojson x.role_arn)));
       (
         "S3Path",
         (Some (s3_path_to_yojson x.s3_path)));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (Some (faq_name_to_yojson x.name)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let create_experience_response_to_yojson = 
  fun (x: create_experience_response) -> assoc_to_yojson(
    [(
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let create_experience_request_to_yojson = 
  fun (x: create_experience_request) -> assoc_to_yojson(
    [(
         "ClientToken",
         (option_to_yojson client_token_name_to_yojson x.client_token));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Configuration",
         (option_to_yojson experience_configuration_to_yojson x.configuration));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Name",
         (Some (experience_name_to_yojson x.name)));
       
  ])

let create_data_source_response_to_yojson = 
  fun (x: create_data_source_response) -> assoc_to_yojson(
    [(
         "Id",
         (Some (data_source_id_to_yojson x.id)));
       
  ])

let create_data_source_request_to_yojson = 
  fun (x: create_data_source_request) -> assoc_to_yojson(
    [(
         "CustomDocumentEnrichmentConfiguration",
         (option_to_yojson custom_document_enrichment_configuration_to_yojson x.custom_document_enrichment_configuration));
       (
         "LanguageCode",
         (option_to_yojson language_code_to_yojson x.language_code));
       (
         "ClientToken",
         (option_to_yojson client_token_name_to_yojson x.client_token));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "Schedule",
         (option_to_yojson scan_schedule_to_yojson x.schedule));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "VpcConfiguration",
         (option_to_yojson data_source_vpc_configuration_to_yojson x.vpc_configuration));
       (
         "Configuration",
         (option_to_yojson data_source_configuration_to_yojson x.configuration));
       (
         "Type",
         (Some (data_source_type_to_yojson x.type_)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Name",
         (Some (data_source_name_to_yojson x.name)));
       
  ])

let create_access_control_configuration_response_to_yojson = 
  fun (x: create_access_control_configuration_response) -> assoc_to_yojson(
    [(
         "Id",
         (Some (access_control_configuration_id_to_yojson x.id)));
       
  ])

let create_access_control_configuration_request_to_yojson = 
  fun (x: create_access_control_configuration_request) -> assoc_to_yojson(
    [(
         "ClientToken",
         (option_to_yojson client_token_name_to_yojson x.client_token));
       (
         "HierarchicalAccessControlList",
         (option_to_yojson hierarchical_principal_list_to_yojson x.hierarchical_access_control_list));
       (
         "AccessControlList",
         (option_to_yojson principal_list_to_yojson x.access_control_list));
       (
         "Description",
         (option_to_yojson description_to_yojson x.description));
       (
         "Name",
         (Some (access_control_configuration_name_to_yojson x.name)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let clear_query_suggestions_request_to_yojson = 
  fun (x: clear_query_suggestions_request) -> assoc_to_yojson(
    [(
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let batch_put_document_response_failed_document_to_yojson = 
  fun (x: batch_put_document_response_failed_document) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "Id",
         (option_to_yojson document_id_to_yojson x.id));
       
  ])

let batch_put_document_response_failed_documents_to_yojson = 
  fun tree -> list_to_yojson batch_put_document_response_failed_document_to_yojson tree

let batch_put_document_response_to_yojson = 
  fun (x: batch_put_document_response) -> assoc_to_yojson(
    [(
         "FailedDocuments",
         (option_to_yojson batch_put_document_response_failed_documents_to_yojson x.failed_documents));
       
  ])

let batch_put_document_request_to_yojson = 
  fun (x: batch_put_document_request) -> assoc_to_yojson(
    [(
         "CustomDocumentEnrichmentConfiguration",
         (option_to_yojson custom_document_enrichment_configuration_to_yojson x.custom_document_enrichment_configuration));
       (
         "Documents",
         (Some (document_list_to_yojson x.documents)));
       (
         "RoleArn",
         (option_to_yojson role_arn_to_yojson x.role_arn));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let batch_get_document_status_response_error_to_yojson = 
  fun (x: batch_get_document_status_response_error) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "DocumentId",
         (option_to_yojson document_id_to_yojson x.document_id));
       
  ])

let batch_get_document_status_response_errors_to_yojson = 
  fun tree -> list_to_yojson batch_get_document_status_response_error_to_yojson tree

let batch_get_document_status_response_to_yojson = 
  fun (x: batch_get_document_status_response) -> assoc_to_yojson(
    [(
         "DocumentStatusList",
         (option_to_yojson document_status_list_to_yojson x.document_status_list));
       (
         "Errors",
         (option_to_yojson batch_get_document_status_response_errors_to_yojson x.errors));
       
  ])

let batch_get_document_status_request_to_yojson = 
  fun (x: batch_get_document_status_request) -> assoc_to_yojson(
    [(
         "DocumentInfoList",
         (Some (document_info_list_to_yojson x.document_info_list)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let batch_delete_featured_results_set_error_to_yojson = 
  fun (x: batch_delete_featured_results_set_error) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (Some (error_message_to_yojson x.error_message)));
       (
         "ErrorCode",
         (Some (error_code_to_yojson x.error_code)));
       (
         "Id",
         (Some (featured_results_set_id_to_yojson x.id)));
       
  ])

let batch_delete_featured_results_set_errors_to_yojson = 
  fun tree -> list_to_yojson batch_delete_featured_results_set_error_to_yojson tree

let batch_delete_featured_results_set_response_to_yojson = 
  fun (x: batch_delete_featured_results_set_response) -> assoc_to_yojson(
    [(
         "Errors",
         (Some (batch_delete_featured_results_set_errors_to_yojson x.errors)));
       
  ])

let batch_delete_featured_results_set_request_to_yojson = 
  fun (x: batch_delete_featured_results_set_request) -> assoc_to_yojson(
    [(
         "FeaturedResultsSetIds",
         (Some (featured_results_set_id_list_to_yojson x.featured_results_set_ids)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let batch_delete_document_response_failed_document_to_yojson = 
  fun (x: batch_delete_document_response_failed_document) -> assoc_to_yojson(
    [(
         "ErrorMessage",
         (option_to_yojson error_message_to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson error_code_to_yojson x.error_code));
       (
         "Id",
         (option_to_yojson document_id_to_yojson x.id));
       
  ])

let batch_delete_document_response_failed_documents_to_yojson = 
  fun tree -> list_to_yojson batch_delete_document_response_failed_document_to_yojson tree

let batch_delete_document_response_to_yojson = 
  fun (x: batch_delete_document_response) -> assoc_to_yojson(
    [(
         "FailedDocuments",
         (option_to_yojson batch_delete_document_response_failed_documents_to_yojson x.failed_documents));
       
  ])

let batch_delete_document_request_to_yojson = 
  fun (x: batch_delete_document_request) -> assoc_to_yojson(
    [(
         "DataSourceSyncJobMetricTarget",
         (option_to_yojson data_source_sync_job_metric_target_to_yojson x.data_source_sync_job_metric_target));
       (
         "DocumentIdList",
         (Some (document_id_list_to_yojson x.document_id_list)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       
  ])

let associate_personas_to_entities_response_to_yojson = 
  fun (x: associate_personas_to_entities_response) -> assoc_to_yojson(
    [(
         "FailedEntityList",
         (option_to_yojson failed_entity_list_to_yojson x.failed_entity_list));
       
  ])

let associate_personas_to_entities_request_to_yojson = 
  fun (x: associate_personas_to_entities_request) -> assoc_to_yojson(
    [(
         "Personas",
         (Some (entity_persona_configuration_list_to_yojson x.personas)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let associate_entity_list_to_yojson = 
  fun tree -> list_to_yojson entity_configuration_to_yojson tree

let associate_entities_to_experience_failed_entity_list_to_yojson = 
  fun tree -> list_to_yojson failed_entity_to_yojson tree

let associate_entities_to_experience_response_to_yojson = 
  fun (x: associate_entities_to_experience_response) -> assoc_to_yojson(
    [(
         "FailedEntityList",
         (option_to_yojson associate_entities_to_experience_failed_entity_list_to_yojson x.failed_entity_list));
       
  ])

let associate_entities_to_experience_request_to_yojson = 
  fun (x: associate_entities_to_experience_request) -> assoc_to_yojson(
    [(
         "EntityList",
         (Some (associate_entity_list_to_yojson x.entity_list)));
       (
         "IndexId",
         (Some (index_id_to_yojson x.index_id)));
       (
         "Id",
         (Some (experience_id_to_yojson x.id)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

