[@@@warning "-39"]
open Types
let make_data_source_to_index_field_mapping 
  ?(date_field_format : string option)
  ~(index_field_name : string)
  ~(data_source_field_name : string)
  () : data_source_to_index_field_mapping = {
  index_field_name; date_field_format; data_source_field_name; 
}

let make_work_docs_configuration 
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(use_change_log : bool option)
  ?(crawl_comments : bool option)
  ~(organization_id : string)
  () : work_docs_configuration = {
  field_mappings;
  exclusion_patterns;
  inclusion_patterns;
  use_change_log;
  crawl_comments;
  organization_id;
   }

let make_seed_url_configuration 
  ?(web_crawler_mode : web_crawler_mode option) ~(seed_urls : string list) ()
: seed_url_configuration = { web_crawler_mode; seed_urls; 
}

let make_site_maps_configuration  ~(site_maps : string list) ()
: site_maps_configuration = { site_maps;  }

let make_urls 
  ?(site_maps_configuration : site_maps_configuration option)
  ?(seed_url_configuration : seed_url_configuration option)
  () : urls = { site_maps_configuration; seed_url_configuration; 
}

let make_proxy_configuration 
  ?(credentials : string option) ~(port : int) ~(host : string) ()
: proxy_configuration = { credentials; port; host; 
}

let make_basic_authentication_configuration 
  ~(credentials : string) ~(port : int) ~(host : string) ()
: basic_authentication_configuration = { credentials; port; host; 
}

let make_authentication_configuration 
  ?(basic_authentication : basic_authentication_configuration list option) ()
: authentication_configuration = { basic_authentication; 
}

let make_web_crawler_configuration 
  ?(authentication_configuration : authentication_configuration option)
  ?(proxy_configuration : proxy_configuration option)
  ?(url_exclusion_patterns : string list option)
  ?(url_inclusion_patterns : string list option)
  ?(max_urls_per_minute_crawl_rate : int option)
  ?(max_content_size_per_page_in_mega_bytes : float option)
  ?(max_links_per_page : int option)
  ?(crawl_depth : int option)
  ~(urls : urls)
  () : web_crawler_configuration = {
  authentication_configuration;
  proxy_configuration;
  url_exclusion_patterns;
  url_inclusion_patterns;
  max_urls_per_minute_crawl_rate;
  max_content_size_per_page_in_mega_bytes;
  max_links_per_page;
  crawl_depth;
  urls;
   }

let make_warning  ?(code : warning_code option) ?(message : string option) ()
: warning = { code; message;  }

let make_jwt_token_type_configuration 
  ?(claim_regex : string option)
  ?(issuer : string option)
  ?(group_attribute_field : string option)
  ?(user_name_attribute_field : string option)
  ?(secret_manager_arn : string option)
  ?(ur_l : string option)
  ~(key_location : key_location)
  () : jwt_token_type_configuration = {
  claim_regex;
  issuer;
  group_attribute_field;
  user_name_attribute_field;
  secret_manager_arn;
  ur_l;
  key_location;
   }

let make_json_token_type_configuration 
  ~(group_attribute_field : string) ~(user_name_attribute_field : string) ()
: json_token_type_configuration = {
  group_attribute_field; user_name_attribute_field; 
}

let make_user_token_configuration 
  ?(json_token_type_configuration : json_token_type_configuration option)
  ?(jwt_token_type_configuration : jwt_token_type_configuration option)
  () : user_token_configuration = {
  json_token_type_configuration; jwt_token_type_configuration; 
}

let make_user_identity_configuration 
  ?(identity_attribute_name : string option) () : user_identity_configuration
= { identity_attribute_name;  }

let make_user_group_resolution_configuration 
  ~(user_group_resolution_mode : user_group_resolution_mode) ()
: user_group_resolution_configuration = { user_group_resolution_mode; 
}

let make_data_source_group 
  ~(data_source_id : string) ~(group_id : string) () : data_source_group = {
  data_source_id; group_id;  }

let make_user_context 
  ?(data_source_groups : data_source_group list option)
  ?(groups : string list option)
  ?(user_id : string option)
  ?(token : string option)
  () : user_context = { data_source_groups; groups; user_id; token; 
}

let make_s3_path  ~(key : string) ~(bucket : string) () : s3_path = {
  key; bucket;  }

let make_update_thesaurus_request 
  ?(source_s3_path : s3_path option)
  ?(role_arn : string option)
  ?(description : string option)
  ?(name : string option)
  ~(index_id : string)
  ~(id : string)
  () : update_thesaurus_request = {
  source_s3_path; role_arn; description; index_id; name; id; 
}

let make_suggestable_config 
  ?(suggestable : bool option) ?(attribute_name : string option) ()
: suggestable_config = { suggestable; attribute_name; 
}

let make_attribute_suggestions_update_config 
  ?(attribute_suggestions_mode : attribute_suggestions_mode option)
  ?(suggestable_config_list : suggestable_config list option)
  () : attribute_suggestions_update_config = {
  attribute_suggestions_mode; suggestable_config_list; 
}

let make_update_query_suggestions_config_request 
  ?(attribute_suggestions_config : attribute_suggestions_update_config option)
  ?(minimum_query_count : int option)
  ?(minimum_number_of_querying_users : int option)
  ?(include_queries_without_user_information : bool option)
  ?(query_log_look_back_window_in_days : int option)
  ?(mode : mode option)
  ~(index_id : string)
  () : update_query_suggestions_config_request = {
  attribute_suggestions_config;
  minimum_query_count;
  minimum_number_of_querying_users;
  include_queries_without_user_information;
  query_log_look_back_window_in_days;
  mode;
  index_id;
   }

let make_update_query_suggestions_block_list_request 
  ?(role_arn : string option)
  ?(source_s3_path : s3_path option)
  ?(description : string option)
  ?(name : string option)
  ~(id : string)
  ~(index_id : string)
  () : update_query_suggestions_block_list_request = {
  role_arn; source_s3_path; description; name; id; index_id; 
}

let make_relevance 
  ?(value_importance_map : (string * int) list option)
  ?(rank_order : order option)
  ?(duration : string option)
  ?(importance : int option)
  ?(freshness : bool option)
  () : relevance = {
  value_importance_map; rank_order; duration; importance; freshness; 
}

let make_search 
  ?(sortable : bool option)
  ?(displayable : bool option)
  ?(searchable : bool option)
  ?(facetable : bool option)
  () : search = { sortable; displayable; searchable; facetable; 
}

let make_document_metadata_configuration 
  ?(search : search option)
  ?(relevance : relevance option)
  ~(type_ : document_attribute_value_type)
  ~(name : string)
  () : document_metadata_configuration = { search; relevance; type_; name; 
}

let make_capacity_units_configuration 
  ~(query_capacity_units : int) ~(storage_capacity_units : int) ()
: capacity_units_configuration = {
  query_capacity_units; storage_capacity_units; 
}

let make_update_index_request 
  ?(user_group_resolution_configuration : user_group_resolution_configuration option)
  ?(user_context_policy : user_context_policy option)
  ?(user_token_configurations : user_token_configuration list option)
  ?(capacity_units : capacity_units_configuration option)
  ?(document_metadata_configuration_updates : document_metadata_configuration list option)
  ?(description : string option)
  ?(role_arn : string option)
  ?(name : string option)
  ~(id : string)
  () : update_index_request = {
  user_group_resolution_configuration;
  user_context_policy;
  user_token_configurations;
  capacity_units;
  document_metadata_configuration_updates;
  description;
  role_arn;
  name;
  id;
   }

let make_featured_document  ?(id : string option) () : featured_document = {
  id;  }

let make_featured_results_set 
  ?(creation_timestamp : int option)
  ?(last_updated_timestamp : int option)
  ?(featured_documents : featured_document list option)
  ?(query_texts : string list option)
  ?(status : featured_results_set_status option)
  ?(description : string option)
  ?(featured_results_set_name : string option)
  ?(featured_results_set_id : string option)
  () : featured_results_set = {
  creation_timestamp;
  last_updated_timestamp;
  featured_documents;
  query_texts;
  status;
  description;
  featured_results_set_name;
  featured_results_set_id;
   }

let make_update_featured_results_set_response 
  ?(featured_results_set : featured_results_set option) ()
: update_featured_results_set_response = { featured_results_set; 
}

let make_update_featured_results_set_request 
  ?(featured_documents : featured_document list option)
  ?(query_texts : string list option)
  ?(status : featured_results_set_status option)
  ?(description : string option)
  ?(featured_results_set_name : string option)
  ~(featured_results_set_id : string)
  ~(index_id : string)
  () : update_featured_results_set_request = {
  featured_documents;
  query_texts;
  status;
  description;
  featured_results_set_name;
  featured_results_set_id;
  index_id;
   }

let make_conflicting_item 
  ?(set_id : string option)
  ?(set_name : string option)
  ?(query_text : string option)
  () : conflicting_item = { set_id; set_name; query_text; 
}

let make_content_source_configuration 
  ?(direct_put_content : bool option)
  ?(faq_ids : string list option)
  ?(data_source_ids : string list option)
  () : content_source_configuration = {
  direct_put_content; faq_ids; data_source_ids; 
}

let make_experience_configuration 
  ?(user_identity_configuration : user_identity_configuration option)
  ?(content_source_configuration : content_source_configuration option)
  () : experience_configuration = {
  user_identity_configuration; content_source_configuration; 
}

let make_update_experience_request 
  ?(description : string option)
  ?(configuration : experience_configuration option)
  ?(role_arn : string option)
  ?(name : string option)
  ~(index_id : string)
  ~(id : string)
  () : update_experience_request = {
  description; configuration; role_arn; index_id; name; id; 
}

let make_documents_metadata_configuration  ?(s3_prefix : string option) ()
: documents_metadata_configuration = { s3_prefix; 
}

let make_access_control_list_configuration  ?(key_path : string option) ()
: access_control_list_configuration = { key_path; 
}

let make_s3_data_source_configuration 
  ?(access_control_list_configuration : access_control_list_configuration option)
  ?(documents_metadata_configuration : documents_metadata_configuration option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(inclusion_prefixes : string list option)
  ~(bucket_name : string)
  () : s3_data_source_configuration = {
  access_control_list_configuration;
  documents_metadata_configuration;
  exclusion_patterns;
  inclusion_patterns;
  inclusion_prefixes;
  bucket_name;
   }

let make_data_source_vpc_configuration 
  ~(security_group_ids : string list) ~(subnet_ids : string list) ()
: data_source_vpc_configuration = { security_group_ids; subnet_ids; 
}

let make_share_point_configuration 
  ?(proxy_configuration : proxy_configuration option)
  ?(authentication_type : share_point_online_authentication_type option)
  ?(ssl_certificate_s3_path : s3_path option)
  ?(disable_local_groups : bool option)
  ?(document_title_field_name : string option)
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(use_change_log : bool option)
  ?(crawl_attachments : bool option)
  ~(secret_arn : string)
  ~(urls : string list)
  ~(share_point_version : share_point_version)
  () : share_point_configuration = {
  proxy_configuration;
  authentication_type;
  ssl_certificate_s3_path;
  disable_local_groups;
  document_title_field_name;
  field_mappings;
  vpc_configuration;
  exclusion_patterns;
  inclusion_patterns;
  use_change_log;
  crawl_attachments;
  secret_arn;
  urls;
  share_point_version;
   }

let make_connection_configuration 
  ~(secret_arn : string)
  ~(table_name : string)
  ~(database_name : string)
  ~(database_port : int)
  ~(database_host : string)
  () : connection_configuration = {
  secret_arn; table_name; database_name; database_port; database_host; 
}

let make_column_configuration 
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(document_title_column_name : string option)
  ~(change_detecting_columns : string list)
  ~(document_data_column_name : string)
  ~(document_id_column_name : string)
  () : column_configuration = {
  change_detecting_columns;
  field_mappings;
  document_title_column_name;
  document_data_column_name;
  document_id_column_name;
   }

let make_acl_configuration  ~(allowed_groups_column_name : string) ()
: acl_configuration = { allowed_groups_column_name; 
}

let make_sql_configuration 
  ?(query_identifiers_enclosing_option : query_identifiers_enclosing_option option)
  () : sql_configuration = { query_identifiers_enclosing_option; 
}

let make_database_configuration 
  ?(sql_configuration : sql_configuration option)
  ?(acl_configuration : acl_configuration option)
  ?(vpc_configuration : data_source_vpc_configuration option)
  ~(column_configuration : column_configuration)
  ~(connection_configuration : connection_configuration)
  ~(database_engine_type : database_engine_type)
  () : database_configuration = {
  sql_configuration;
  acl_configuration;
  column_configuration;
  vpc_configuration;
  connection_configuration;
  database_engine_type;
   }

let make_salesforce_standard_object_configuration 
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(document_title_field_name : string option)
  ~(document_data_field_name : string)
  ~(name : salesforce_standard_object_name)
  () : salesforce_standard_object_configuration = {
  field_mappings; document_title_field_name; document_data_field_name; name; 
}

let make_salesforce_standard_knowledge_article_type_configuration 
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(document_title_field_name : string option)
  ~(document_data_field_name : string)
  () : salesforce_standard_knowledge_article_type_configuration = {
  field_mappings; document_title_field_name; document_data_field_name; 
}

let make_salesforce_custom_knowledge_article_type_configuration 
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(document_title_field_name : string option)
  ~(document_data_field_name : string)
  ~(name : string)
  () : salesforce_custom_knowledge_article_type_configuration = {
  field_mappings; document_title_field_name; document_data_field_name; name; 
}

let make_salesforce_knowledge_article_configuration 
  ?(custom_knowledge_article_type_configurations : salesforce_custom_knowledge_article_type_configuration list option)
  ?(standard_knowledge_article_type_configuration : salesforce_standard_knowledge_article_type_configuration option)
  ~(included_states : salesforce_knowledge_article_state list)
  () : salesforce_knowledge_article_configuration = {
  custom_knowledge_article_type_configurations;
  standard_knowledge_article_type_configuration;
  included_states;
   }

let make_salesforce_chatter_feed_configuration 
  ?(include_filter_types : salesforce_chatter_feed_include_filter_type list option)
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(document_title_field_name : string option)
  ~(document_data_field_name : string)
  () : salesforce_chatter_feed_configuration = {
  include_filter_types;
  field_mappings;
  document_title_field_name;
  document_data_field_name;
   }

let make_salesforce_standard_object_attachment_configuration 
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(document_title_field_name : string option)
  () : salesforce_standard_object_attachment_configuration = {
  field_mappings; document_title_field_name; 
}

let make_salesforce_configuration 
  ?(exclude_attachment_file_patterns : string list option)
  ?(include_attachment_file_patterns : string list option)
  ?(standard_object_attachment_configuration : salesforce_standard_object_attachment_configuration option)
  ?(crawl_attachments : bool option)
  ?(chatter_feed_configuration : salesforce_chatter_feed_configuration option)
  ?(knowledge_article_configuration : salesforce_knowledge_article_configuration option)
  ?(standard_object_configurations : salesforce_standard_object_configuration list option)
  ~(secret_arn : string)
  ~(server_url : string)
  () : salesforce_configuration = {
  exclude_attachment_file_patterns;
  include_attachment_file_patterns;
  standard_object_attachment_configuration;
  crawl_attachments;
  chatter_feed_configuration;
  knowledge_article_configuration;
  standard_object_configurations;
  secret_arn;
  server_url;
   }

let make_one_drive_users 
  ?(one_drive_user_s3_path : s3_path option)
  ?(one_drive_user_list : string list option)
  () : one_drive_users = { one_drive_user_s3_path; one_drive_user_list; 
}

let make_one_drive_configuration 
  ?(disable_local_groups : bool option)
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ~(one_drive_users : one_drive_users)
  ~(secret_arn : string)
  ~(tenant_domain : string)
  () : one_drive_configuration = {
  disable_local_groups;
  field_mappings;
  exclusion_patterns;
  inclusion_patterns;
  one_drive_users;
  secret_arn;
  tenant_domain;
   }

let make_service_now_knowledge_article_configuration 
  ?(filter_query : string option)
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(document_title_field_name : string option)
  ?(exclude_attachment_file_patterns : string list option)
  ?(include_attachment_file_patterns : string list option)
  ?(crawl_attachments : bool option)
  ~(document_data_field_name : string)
  () : service_now_knowledge_article_configuration = {
  filter_query;
  field_mappings;
  document_title_field_name;
  document_data_field_name;
  exclude_attachment_file_patterns;
  include_attachment_file_patterns;
  crawl_attachments;
   }

let make_service_now_service_catalog_configuration 
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(document_title_field_name : string option)
  ?(exclude_attachment_file_patterns : string list option)
  ?(include_attachment_file_patterns : string list option)
  ?(crawl_attachments : bool option)
  ~(document_data_field_name : string)
  () : service_now_service_catalog_configuration = {
  field_mappings;
  document_title_field_name;
  document_data_field_name;
  exclude_attachment_file_patterns;
  include_attachment_file_patterns;
  crawl_attachments;
   }

let make_service_now_configuration 
  ?(authentication_type : service_now_authentication_type option)
  ?(service_catalog_configuration : service_now_service_catalog_configuration option)
  ?(knowledge_article_configuration : service_now_knowledge_article_configuration option)
  ~(service_now_build_version : service_now_build_version_type)
  ~(secret_arn : string)
  ~(host_url : string)
  () : service_now_configuration = {
  authentication_type;
  service_catalog_configuration;
  knowledge_article_configuration;
  service_now_build_version;
  secret_arn;
  host_url;
   }

let make_confluence_space_to_index_field_mapping 
  ?(index_field_name : string option)
  ?(date_field_format : string option)
  ?(data_source_field_name : confluence_space_field_name option)
  () : confluence_space_to_index_field_mapping = {
  index_field_name; date_field_format; data_source_field_name; 
}

let make_confluence_space_configuration 
  ?(space_field_mappings : confluence_space_to_index_field_mapping list option)
  ?(exclude_spaces : string list option)
  ?(include_spaces : string list option)
  ?(crawl_archived_spaces : bool option)
  ?(crawl_personal_spaces : bool option)
  () : confluence_space_configuration = {
  space_field_mappings;
  exclude_spaces;
  include_spaces;
  crawl_archived_spaces;
  crawl_personal_spaces;
   }

let make_confluence_page_to_index_field_mapping 
  ?(index_field_name : string option)
  ?(date_field_format : string option)
  ?(data_source_field_name : confluence_page_field_name option)
  () : confluence_page_to_index_field_mapping = {
  index_field_name; date_field_format; data_source_field_name; 
}

let make_confluence_page_configuration 
  ?(page_field_mappings : confluence_page_to_index_field_mapping list option)
  () : confluence_page_configuration = { page_field_mappings; 
}

let make_confluence_blog_to_index_field_mapping 
  ?(index_field_name : string option)
  ?(date_field_format : string option)
  ?(data_source_field_name : confluence_blog_field_name option)
  () : confluence_blog_to_index_field_mapping = {
  index_field_name; date_field_format; data_source_field_name; 
}

let make_confluence_blog_configuration 
  ?(blog_field_mappings : confluence_blog_to_index_field_mapping list option)
  () : confluence_blog_configuration = { blog_field_mappings; 
}

let make_confluence_attachment_to_index_field_mapping 
  ?(index_field_name : string option)
  ?(date_field_format : string option)
  ?(data_source_field_name : confluence_attachment_field_name option)
  () : confluence_attachment_to_index_field_mapping = {
  index_field_name; date_field_format; data_source_field_name; 
}

let make_confluence_attachment_configuration 
  ?(attachment_field_mappings : confluence_attachment_to_index_field_mapping list option)
  ?(crawl_attachments : bool option)
  () : confluence_attachment_configuration = {
  attachment_field_mappings; crawl_attachments; 
}

let make_confluence_configuration 
  ?(authentication_type : confluence_authentication_type option)
  ?(proxy_configuration : proxy_configuration option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(attachment_configuration : confluence_attachment_configuration option)
  ?(blog_configuration : confluence_blog_configuration option)
  ?(page_configuration : confluence_page_configuration option)
  ?(space_configuration : confluence_space_configuration option)
  ~(version : confluence_version)
  ~(secret_arn : string)
  ~(server_url : string)
  () : confluence_configuration = {
  authentication_type;
  proxy_configuration;
  exclusion_patterns;
  inclusion_patterns;
  vpc_configuration;
  attachment_configuration;
  blog_configuration;
  page_configuration;
  space_configuration;
  version;
  secret_arn;
  server_url;
   }

let make_google_drive_configuration 
  ?(exclude_shared_drives : string list option)
  ?(exclude_user_accounts : string list option)
  ?(exclude_mime_types : string list option)
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ~(secret_arn : string)
  () : google_drive_configuration = {
  exclude_shared_drives;
  exclude_user_accounts;
  exclude_mime_types;
  field_mappings;
  exclusion_patterns;
  inclusion_patterns;
  secret_arn;
   }

let make_fsx_configuration 
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(secret_arn : string option)
  ~(vpc_configuration : data_source_vpc_configuration)
  ~(file_system_type : fsx_file_system_type)
  ~(file_system_id : string)
  () : fsx_configuration = {
  field_mappings;
  exclusion_patterns;
  inclusion_patterns;
  secret_arn;
  vpc_configuration;
  file_system_type;
  file_system_id;
   }

let make_slack_configuration 
  ?(field_mappings : data_source_to_index_field_mapping list option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(public_channel_filter : string list option)
  ?(private_channel_filter : string list option)
  ?(look_back_period : int option)
  ?(exclude_archived : bool option)
  ?(crawl_bot_message : bool option)
  ?(use_change_log : bool option)
  ?(vpc_configuration : data_source_vpc_configuration option)
  ~(since_crawl_date : string)
  ~(slack_entity_list : slack_entity list)
  ~(secret_arn : string)
  ~(team_id : string)
  () : slack_configuration = {
  field_mappings;
  exclusion_patterns;
  inclusion_patterns;
  public_channel_filter;
  private_channel_filter;
  look_back_period;
  since_crawl_date;
  exclude_archived;
  crawl_bot_message;
  use_change_log;
  slack_entity_list;
  vpc_configuration;
  secret_arn;
  team_id;
   }

let make_box_configuration 
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(web_link_field_mappings : data_source_to_index_field_mapping list option)
  ?(comment_field_mappings : data_source_to_index_field_mapping list option)
  ?(task_field_mappings : data_source_to_index_field_mapping list option)
  ?(file_field_mappings : data_source_to_index_field_mapping list option)
  ?(crawl_web_links : bool option)
  ?(crawl_tasks : bool option)
  ?(crawl_comments : bool option)
  ?(use_change_log : bool option)
  ~(secret_arn : string)
  ~(enterprise_id : string)
  () : box_configuration = {
  vpc_configuration;
  exclusion_patterns;
  inclusion_patterns;
  web_link_field_mappings;
  comment_field_mappings;
  task_field_mappings;
  file_field_mappings;
  crawl_web_links;
  crawl_tasks;
  crawl_comments;
  use_change_log;
  secret_arn;
  enterprise_id;
   }

let make_quip_configuration 
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(attachment_field_mappings : data_source_to_index_field_mapping list option)
  ?(message_field_mappings : data_source_to_index_field_mapping list option)
  ?(thread_field_mappings : data_source_to_index_field_mapping list option)
  ?(folder_ids : string list option)
  ?(crawl_attachments : bool option)
  ?(crawl_chat_rooms : bool option)
  ?(crawl_file_comments : bool option)
  ~(secret_arn : string)
  ~(domain : string)
  () : quip_configuration = {
  vpc_configuration;
  exclusion_patterns;
  inclusion_patterns;
  attachment_field_mappings;
  message_field_mappings;
  thread_field_mappings;
  folder_ids;
  crawl_attachments;
  crawl_chat_rooms;
  crawl_file_comments;
  secret_arn;
  domain;
   }

let make_jira_configuration 
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(work_log_field_mappings : data_source_to_index_field_mapping list option)
  ?(project_field_mappings : data_source_to_index_field_mapping list option)
  ?(issue_field_mappings : data_source_to_index_field_mapping list option)
  ?(comment_field_mappings : data_source_to_index_field_mapping list option)
  ?(attachment_field_mappings : data_source_to_index_field_mapping list option)
  ?(issue_sub_entity_filter : issue_sub_entity list option)
  ?(status : string list option)
  ?(issue_type : string list option)
  ?(project : string list option)
  ?(use_change_log : bool option)
  ~(secret_arn : string)
  ~(jira_account_url : string)
  () : jira_configuration = {
  vpc_configuration;
  exclusion_patterns;
  inclusion_patterns;
  work_log_field_mappings;
  project_field_mappings;
  issue_field_mappings;
  comment_field_mappings;
  attachment_field_mappings;
  issue_sub_entity_filter;
  status;
  issue_type;
  project;
  use_change_log;
  secret_arn;
  jira_account_url;
   }

let make_saa_s_configuration 
  ~(host_url : string) ~(organization_name : string) () : saa_s_configuration
= { host_url; organization_name;  }

let make_on_premise_configuration 
  ~(ssl_certificate_s3_path : s3_path)
  ~(organization_name : string)
  ~(host_url : string)
  () : on_premise_configuration = {
  ssl_certificate_s3_path; organization_name; host_url; 
}

let make_git_hub_document_crawl_properties 
  ?(crawl_pull_request_comment_attachment : bool option)
  ?(crawl_pull_request_comment : bool option)
  ?(crawl_pull_request : bool option)
  ?(crawl_issue_comment_attachment : bool option)
  ?(crawl_issue_comment : bool option)
  ?(crawl_issue : bool option)
  ?(crawl_repository_documents : bool option)
  () : git_hub_document_crawl_properties = {
  crawl_pull_request_comment_attachment;
  crawl_pull_request_comment;
  crawl_pull_request;
  crawl_issue_comment_attachment;
  crawl_issue_comment;
  crawl_issue;
  crawl_repository_documents;
   }

let make_git_hub_configuration 
  ?(git_hub_pull_request_document_attachment_configuration_field_mappings : data_source_to_index_field_mapping list option)
  ?(git_hub_pull_request_document_configuration_field_mappings : data_source_to_index_field_mapping list option)
  ?(git_hub_pull_request_comment_configuration_field_mappings : data_source_to_index_field_mapping list option)
  ?(git_hub_issue_attachment_configuration_field_mappings : data_source_to_index_field_mapping list option)
  ?(git_hub_issue_comment_configuration_field_mappings : data_source_to_index_field_mapping list option)
  ?(git_hub_issue_document_configuration_field_mappings : data_source_to_index_field_mapping list option)
  ?(git_hub_commit_configuration_field_mappings : data_source_to_index_field_mapping list option)
  ?(git_hub_repository_configuration_field_mappings : data_source_to_index_field_mapping list option)
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(exclusion_file_name_patterns : string list option)
  ?(exclusion_file_type_patterns : string list option)
  ?(exclusion_folder_name_patterns : string list option)
  ?(inclusion_file_name_patterns : string list option)
  ?(inclusion_file_type_patterns : string list option)
  ?(inclusion_folder_name_patterns : string list option)
  ?(repository_filter : string list option)
  ?(git_hub_document_crawl_properties : git_hub_document_crawl_properties option)
  ?(use_change_log : bool option)
  ?(type_ : type_ option)
  ?(on_premise_configuration : on_premise_configuration option)
  ?(saa_s_configuration : saa_s_configuration option)
  ~(secret_arn : string)
  () : git_hub_configuration = {
  git_hub_pull_request_document_attachment_configuration_field_mappings;
  git_hub_pull_request_document_configuration_field_mappings;
  git_hub_pull_request_comment_configuration_field_mappings;
  git_hub_issue_attachment_configuration_field_mappings;
  git_hub_issue_comment_configuration_field_mappings;
  git_hub_issue_document_configuration_field_mappings;
  git_hub_commit_configuration_field_mappings;
  git_hub_repository_configuration_field_mappings;
  vpc_configuration;
  exclusion_file_name_patterns;
  exclusion_file_type_patterns;
  exclusion_folder_name_patterns;
  inclusion_file_name_patterns;
  inclusion_file_type_patterns;
  inclusion_folder_name_patterns;
  repository_filter;
  git_hub_document_crawl_properties;
  use_change_log;
  secret_arn;
  type_;
  on_premise_configuration;
  saa_s_configuration;
   }

let make_alfresco_configuration 
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(exclusion_patterns : string list option)
  ?(inclusion_patterns : string list option)
  ?(wiki_field_mappings : data_source_to_index_field_mapping list option)
  ?(blog_field_mappings : data_source_to_index_field_mapping list option)
  ?(document_library_field_mappings : data_source_to_index_field_mapping list option)
  ?(entity_filter : alfresco_entity list option)
  ?(crawl_comments : bool option)
  ?(crawl_system_folders : bool option)
  ~(ssl_certificate_s3_path : s3_path)
  ~(secret_arn : string)
  ~(site_id : string)
  ~(site_url : string)
  () : alfresco_configuration = {
  vpc_configuration;
  exclusion_patterns;
  inclusion_patterns;
  wiki_field_mappings;
  blog_field_mappings;
  document_library_field_mappings;
  entity_filter;
  crawl_comments;
  crawl_system_folders;
  ssl_certificate_s3_path;
  secret_arn;
  site_id;
  site_url;
   }

let make_template_configuration  ?(template : template option) ()
: template_configuration = { template;  }

let make_data_source_configuration 
  ?(template_configuration : template_configuration option)
  ?(alfresco_configuration : alfresco_configuration option)
  ?(git_hub_configuration : git_hub_configuration option)
  ?(jira_configuration : jira_configuration option)
  ?(quip_configuration : quip_configuration option)
  ?(box_configuration : box_configuration option)
  ?(slack_configuration : slack_configuration option)
  ?(fsx_configuration : fsx_configuration option)
  ?(work_docs_configuration : work_docs_configuration option)
  ?(web_crawler_configuration : web_crawler_configuration option)
  ?(google_drive_configuration : google_drive_configuration option)
  ?(confluence_configuration : confluence_configuration option)
  ?(service_now_configuration : service_now_configuration option)
  ?(one_drive_configuration : one_drive_configuration option)
  ?(salesforce_configuration : salesforce_configuration option)
  ?(database_configuration : database_configuration option)
  ?(share_point_configuration : share_point_configuration option)
  ?(s3_configuration : s3_data_source_configuration option)
  () : data_source_configuration = {
  template_configuration;
  alfresco_configuration;
  git_hub_configuration;
  jira_configuration;
  quip_configuration;
  box_configuration;
  slack_configuration;
  fsx_configuration;
  work_docs_configuration;
  web_crawler_configuration;
  google_drive_configuration;
  confluence_configuration;
  service_now_configuration;
  one_drive_configuration;
  salesforce_configuration;
  database_configuration;
  share_point_configuration;
  s3_configuration;
   }

let make_document_attribute_value 
  ?(date_value : float option)
  ?(long_value : int option)
  ?(string_list_value : string list option)
  ?(string_value : string option)
  () : document_attribute_value = {
  date_value; long_value; string_list_value; string_value; 
}

let make_document_attribute_condition 
  ?(condition_on_value : document_attribute_value option)
  ~(operator : condition_operator)
  ~(condition_document_attribute_key : string)
  () : document_attribute_condition = {
  condition_on_value; operator; condition_document_attribute_key; 
}

let make_document_attribute_target 
  ?(target_document_attribute_value : document_attribute_value option)
  ?(target_document_attribute_value_deletion : bool option)
  ?(target_document_attribute_key : string option)
  () : document_attribute_target = {
  target_document_attribute_value;
  target_document_attribute_value_deletion;
  target_document_attribute_key;
   }

let make_inline_custom_document_enrichment_configuration 
  ?(document_content_deletion : bool option)
  ?(target : document_attribute_target option)
  ?(condition : document_attribute_condition option)
  () : inline_custom_document_enrichment_configuration = {
  document_content_deletion; target; condition; 
}

let make_hook_configuration 
  ?(invocation_condition : document_attribute_condition option)
  ~(s3_bucket : string)
  ~(lambda_arn : string)
  () : hook_configuration = { s3_bucket; lambda_arn; invocation_condition; 
}

let make_custom_document_enrichment_configuration 
  ?(role_arn : string option)
  ?(post_extraction_hook_configuration : hook_configuration option)
  ?(pre_extraction_hook_configuration : hook_configuration option)
  ?(inline_configurations : inline_custom_document_enrichment_configuration list option)
  () : custom_document_enrichment_configuration = {
  role_arn;
  post_extraction_hook_configuration;
  pre_extraction_hook_configuration;
  inline_configurations;
   }

let make_update_data_source_request 
  ?(custom_document_enrichment_configuration : custom_document_enrichment_configuration option)
  ?(language_code : string option)
  ?(role_arn : string option)
  ?(schedule : string option)
  ?(description : string option)
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(configuration : data_source_configuration option)
  ?(name : string option)
  ~(index_id : string)
  ~(id : string)
  () : update_data_source_request = {
  custom_document_enrichment_configuration;
  language_code;
  role_arn;
  schedule;
  description;
  vpc_configuration;
  configuration;
  index_id;
  name;
  id;
   }

let make_update_access_control_configuration_response  ()
: update_access_control_configuration_response = ()

let make_principal 
  ?(data_source_id : string option)
  ~(access : read_access_type)
  ~(type_ : principal_type)
  ~(name : string)
  () : principal = { data_source_id; access; type_; name; 
}

let make_hierarchical_principal  ~(principal_list : principal list) ()
: hierarchical_principal = { principal_list; 
}

let make_update_access_control_configuration_request 
  ?(hierarchical_access_control_list : hierarchical_principal list option)
  ?(access_control_list : principal list option)
  ?(description : string option)
  ?(name : string option)
  ~(id : string)
  ~(index_id : string)
  () : update_access_control_configuration_request = {
  hierarchical_access_control_list;
  access_control_list;
  description;
  name;
  id;
  index_id;
   }

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_ar_n : string) ()
: untag_resource_request = { tag_keys; resource_ar_n;  }

let make_time_range 
  ?(end_time : float option) ?(start_time : float option) () : time_range = {
  end_time; start_time;  }

let make_thesaurus_summary 
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(status : thesaurus_status option)
  ?(name : string option)
  ?(id : string option)
  () : thesaurus_summary = { updated_at; created_at; status; name; id; 
}

let make_highlight 
  ?(type_ : highlight_type option)
  ?(top_answer : bool option)
  ~(end_offset : int)
  ~(begin_offset : int)
  () : highlight = { type_; top_answer; end_offset; begin_offset; 
}

let make_text_with_highlights 
  ?(highlights : highlight list option) ?(text : string option) ()
: text_with_highlights = { highlights; text; 
}

let make_text_document_statistics 
  ~(indexed_text_bytes : int) ~(indexed_text_documents_count : int) ()
: text_document_statistics = {
  indexed_text_bytes; indexed_text_documents_count; 
}

let make_tag_resource_response  () : tag_resource_response = ()

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_request 
  ~(tags : tag list) ~(resource_ar_n : string) () : tag_resource_request = {
  tags; resource_ar_n;  }

let make_table_cell 
  ?(header : bool option)
  ?(highlighted : bool option)
  ?(top_answer : bool option)
  ?(value : string option)
  () : table_cell = { header; highlighted; top_answer; value; 
}

let make_table_row  ?(cells : table_cell list option) () : table_row = {
  cells;  }

let make_table_excerpt 
  ?(total_number_of_rows : int option) ?(rows : table_row list option) ()
: table_excerpt = { total_number_of_rows; rows; 
}

let make_suggestion_highlight 
  ?(end_offset : int option) ?(begin_offset : int option) ()
: suggestion_highlight = { end_offset; begin_offset; 
}

let make_suggestion_text_with_highlights 
  ?(highlights : suggestion_highlight list option) ?(text : string option) ()
: suggestion_text_with_highlights = { highlights; text; 
}

let make_suggestion_value 
  ?(text : suggestion_text_with_highlights option) () : suggestion_value = {
  text;  }

let make_document_attribute 
  ~(value : document_attribute_value) ~(key : string) () : document_attribute
= { value; key;  }

let make_source_document 
  ?(additional_attributes : document_attribute list option)
  ?(suggestion_attributes : string list option)
  ?(document_id : string option)
  () : source_document = {
  additional_attributes; suggestion_attributes; document_id; 
}

let make_suggestion 
  ?(source_documents : source_document list option)
  ?(value : suggestion_value option)
  ?(id : string option)
  () : suggestion = { source_documents; value; id;  }

let make_click_feedback  ~(click_time : float) ~(result_id : string) ()
: click_feedback = { click_time; result_id;  }

let make_relevance_feedback 
  ~(relevance_value : relevance_type) ~(result_id : string) ()
: relevance_feedback = { relevance_value; result_id; 
}

let make_submit_feedback_request 
  ?(relevance_feedback_items : relevance_feedback list option)
  ?(click_feedback_items : click_feedback list option)
  ~(query_id : string)
  ~(index_id : string)
  () : submit_feedback_request = {
  relevance_feedback_items; click_feedback_items; query_id; index_id; 
}

let make_stop_data_source_sync_job_request 
  ~(index_id : string) ~(id : string) () : stop_data_source_sync_job_request
= { index_id; id;  }

let make_status 
  ?(failure_reason : string option)
  ?(failure_code : string option)
  ?(document_status : document_status option)
  ?(document_id : string option)
  () : status = {
  failure_reason; failure_code; document_status; document_id; 
}

let make_start_data_source_sync_job_response 
  ?(execution_id : string option) () : start_data_source_sync_job_response =
{ execution_id;  }

let make_start_data_source_sync_job_request 
  ~(index_id : string) ~(id : string) () : start_data_source_sync_job_request
= { index_id; id;  }

let make_spell_correction_configuration 
  ~(include_query_spell_check_suggestions : bool) ()
: spell_correction_configuration = { include_query_spell_check_suggestions; 
}

let make_correction 
  ?(corrected_term : string option)
  ?(term : string option)
  ?(end_offset : int option)
  ?(begin_offset : int option)
  () : correction = { corrected_term; term; end_offset; begin_offset; 
}

let make_spell_corrected_query 
  ?(corrections : correction list option)
  ?(suggested_query_text : string option)
  () : spell_corrected_query = { corrections; suggested_query_text; 
}

let make_sorting_configuration 
  ~(sort_order : sort_order) ~(document_attribute_key : string) ()
: sorting_configuration = { sort_order; document_attribute_key; 
}

let make_server_side_encryption_configuration 
  ?(kms_key_id : string option) () : server_side_encryption_configuration = {
  kms_key_id;  }

let make_score_attributes  ?(score_confidence : score_confidence option) ()
: score_attributes = { score_confidence;  }

let make_retrieve_result_item 
  ?(score_attributes : score_attributes option)
  ?(document_attributes : document_attribute list option)
  ?(document_ur_i : string option)
  ?(content : string option)
  ?(document_title : string option)
  ?(document_id : string option)
  ?(id : string option)
  () : retrieve_result_item = {
  score_attributes;
  document_attributes;
  document_ur_i;
  content;
  document_title;
  document_id;
  id;
   }

let make_retrieve_result 
  ?(result_items : retrieve_result_item list option)
  ?(query_id : string option)
  () : retrieve_result = { result_items; query_id; 
}

let make_attribute_filter 
  ?(less_than_or_equals : document_attribute option)
  ?(less_than : document_attribute option)
  ?(greater_than_or_equals : document_attribute option)
  ?(greater_than : document_attribute option)
  ?(contains_any : document_attribute option)
  ?(contains_all : document_attribute option)
  ?(equals_to : document_attribute option)
  ?(not_filter : attribute_filter option)
  ?(or_all_filters : attribute_filter list option)
  ?(and_all_filters : attribute_filter list option)
  () : attribute_filter = {
  less_than_or_equals;
  less_than;
  greater_than_or_equals;
  greater_than;
  contains_any;
  contains_all;
  equals_to;
  not_filter;
  or_all_filters;
  and_all_filters;
   }

let make_document_relevance_configuration 
  ~(relevance : relevance) ~(name : string) ()
: document_relevance_configuration = { relevance; name; 
}

let make_retrieve_request 
  ?(user_context : user_context option)
  ?(page_size : int option)
  ?(page_number : int option)
  ?(document_relevance_override_configurations : document_relevance_configuration list option)
  ?(requested_document_attributes : string list option)
  ?(attribute_filter : attribute_filter option)
  ~(query_text : string)
  ~(index_id : string)
  () : retrieve_request = {
  user_context;
  page_size;
  page_number;
  document_relevance_override_configurations;
  requested_document_attributes;
  attribute_filter;
  query_text;
  index_id;
   }

let make_query_suggestions_block_list_summary 
  ?(item_count : int option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(status : query_suggestions_block_list_status option)
  ?(name : string option)
  ?(id : string option)
  () : query_suggestions_block_list_summary = {
  item_count; updated_at; created_at; status; name; id; 
}

let make_additional_result_attribute_value 
  ?(text_with_highlights_value : text_with_highlights option) ()
: additional_result_attribute_value = { text_with_highlights_value; 
}

let make_additional_result_attribute 
  ~(value : additional_result_attribute_value)
  ~(value_type : additional_result_attribute_value_type)
  ~(key : string)
  () : additional_result_attribute = { value; value_type; key; 
}

let make_expanded_result_item 
  ?(document_attributes : document_attribute list option)
  ?(document_ur_i : string option)
  ?(document_excerpt : text_with_highlights option)
  ?(document_title : text_with_highlights option)
  ?(document_id : string option)
  ?(id : string option)
  () : expanded_result_item = {
  document_attributes;
  document_ur_i;
  document_excerpt;
  document_title;
  document_id;
  id;
   }

let make_collapsed_result_detail 
  ?(expanded_results : expanded_result_item list option)
  ~(document_attribute : document_attribute)
  () : collapsed_result_detail = { expanded_results; document_attribute; 
}

let make_query_result_item 
  ?(collapsed_result_detail : collapsed_result_detail option)
  ?(table_excerpt : table_excerpt option)
  ?(feedback_token : string option)
  ?(score_attributes : score_attributes option)
  ?(document_attributes : document_attribute list option)
  ?(document_ur_i : string option)
  ?(document_excerpt : text_with_highlights option)
  ?(document_title : text_with_highlights option)
  ?(document_id : string option)
  ?(additional_attributes : additional_result_attribute list option)
  ?(format : query_result_format option)
  ?(type_ : query_result_type option)
  ?(id : string option)
  () : query_result_item = {
  collapsed_result_detail;
  table_excerpt;
  feedback_token;
  score_attributes;
  document_attributes;
  document_ur_i;
  document_excerpt;
  document_title;
  document_id;
  additional_attributes;
  format;
  type_;
  id;
   }

let rec
  make_document_attribute_value_count_pair 
    ?(facet_results : facet_result list option)
    ?(count : int option)
    ?(document_attribute_value : document_attribute_value option)
    ()
  : document_attribute_value_count_pair = {
    facet_results; count; document_attribute_value; 
  }
and
  make_facet_result 
    ?(document_attribute_value_count_pairs : document_attribute_value_count_pair list option)
    ?(document_attribute_value_type : document_attribute_value_type option)
    ?(document_attribute_key : string option)
    ()
  : facet_result = {
    document_attribute_value_count_pairs;
    document_attribute_value_type;
    document_attribute_key;
     }

let make_featured_results_item 
  ?(feedback_token : string option)
  ?(document_attributes : document_attribute list option)
  ?(document_ur_i : string option)
  ?(document_excerpt : text_with_highlights option)
  ?(document_title : text_with_highlights option)
  ?(document_id : string option)
  ?(additional_attributes : additional_result_attribute list option)
  ?(type_ : query_result_type option)
  ?(id : string option)
  () : featured_results_item = {
  feedback_token;
  document_attributes;
  document_ur_i;
  document_excerpt;
  document_title;
  document_id;
  additional_attributes;
  type_;
  id;
   }

let make_query_result 
  ?(featured_results_items : featured_results_item list option)
  ?(spell_corrected_queries : spell_corrected_query list option)
  ?(warnings : warning list option)
  ?(total_number_of_results : int option)
  ?(facet_results : facet_result list option)
  ?(result_items : query_result_item list option)
  ?(query_id : string option)
  () : query_result = {
  featured_results_items;
  spell_corrected_queries;
  warnings;
  total_number_of_results;
  facet_results;
  result_items;
  query_id;
   }

let make_facet 
  ?(max_results : int option)
  ?(facets : facet list option)
  ?(document_attribute_key : string option)
  () : facet = { max_results; facets; document_attribute_key; 
}

let make_expand_configuration 
  ?(max_expanded_results_per_item : int option)
  ?(max_result_items_to_expand : int option)
  () : expand_configuration = {
  max_expanded_results_per_item; max_result_items_to_expand; 
}

let make_collapse_configuration 
  ?(expand_configuration : expand_configuration option)
  ?(expand : bool option)
  ?(missing_attribute_key_strategy : missing_attribute_key_strategy option)
  ?(sorting_configurations : sorting_configuration list option)
  ~(document_attribute_key : string)
  () : collapse_configuration = {
  expand_configuration;
  expand;
  missing_attribute_key_strategy;
  sorting_configurations;
  document_attribute_key;
   }

let make_query_request 
  ?(collapse_configuration : collapse_configuration option)
  ?(spell_correction_configuration : spell_correction_configuration option)
  ?(visitor_id : string option)
  ?(user_context : user_context option)
  ?(sorting_configurations : sorting_configuration list option)
  ?(sorting_configuration : sorting_configuration option)
  ?(page_size : int option)
  ?(page_number : int option)
  ?(document_relevance_override_configurations : document_relevance_configuration list option)
  ?(query_result_type_filter : query_result_type option)
  ?(requested_document_attributes : string list option)
  ?(facets : facet list option)
  ?(attribute_filter : attribute_filter option)
  ?(query_text : string option)
  ~(index_id : string)
  () : query_request = {
  collapse_configuration;
  spell_correction_configuration;
  visitor_id;
  user_context;
  sorting_configurations;
  sorting_configuration;
  page_size;
  page_number;
  document_relevance_override_configurations;
  query_result_type_filter;
  requested_document_attributes;
  facets;
  attribute_filter;
  query_text;
  index_id;
   }

let make_member_group 
  ?(data_source_id : string option) ~(group_id : string) () : member_group =
{ data_source_id; group_id;  }

let make_member_user  ~(user_id : string) () : member_user = { user_id; 
}

let make_group_members 
  ?(s3_pathfor_group_members : s3_path option)
  ?(member_users : member_user list option)
  ?(member_groups : member_group list option)
  () : group_members = {
  s3_pathfor_group_members; member_users; member_groups; 
}

let make_put_principal_mapping_request 
  ?(role_arn : string option)
  ?(ordering_id : int option)
  ?(data_source_id : string option)
  ~(group_members : group_members)
  ~(group_id : string)
  ~(index_id : string)
  () : put_principal_mapping_request = {
  role_arn; ordering_id; group_members; group_id; data_source_id; index_id; 
}

let make_personas_summary 
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(persona : persona option)
  ?(entity_id : string option)
  () : personas_summary = { updated_at; created_at; persona; entity_id; 
}

let make_list_thesauri_response 
  ?(thesaurus_summary_items : thesaurus_summary list option)
  ?(next_token : string option)
  () : list_thesauri_response = { thesaurus_summary_items; next_token; 
}

let make_list_thesauri_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(index_id : string)
  () : list_thesauri_request = { max_results; next_token; index_id; 
}

let make_list_tags_for_resource_response  ?(tags : tag list option) ()
: list_tags_for_resource_response = { tags; 
}

let make_list_tags_for_resource_request  ~(resource_ar_n : string) ()
: list_tags_for_resource_request = { resource_ar_n; 
}

let make_list_query_suggestions_block_lists_response 
  ?(next_token : string option)
  ?(block_list_summary_items : query_suggestions_block_list_summary list option)
  () : list_query_suggestions_block_lists_response = {
  next_token; block_list_summary_items; 
}

let make_list_query_suggestions_block_lists_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(index_id : string)
  () : list_query_suggestions_block_lists_request = {
  max_results; next_token; index_id;  }

let make_group_summary 
  ?(ordering_id : int option) ?(group_id : string option) () : group_summary
= { ordering_id; group_id;  }

let make_index_configuration_summary 
  ?(edition : index_edition option)
  ?(id : string option)
  ?(name : string option)
  ~(status : index_status)
  ~(updated_at : float)
  ~(created_at : float)
  () : index_configuration_summary = {
  status; updated_at; created_at; edition; id; name; 
}

let make_list_indices_response 
  ?(next_token : string option)
  ?(index_configuration_summary_items : index_configuration_summary list option)
  () : list_indices_response = {
  next_token; index_configuration_summary_items; 
}

let make_list_indices_request 
  ?(max_results : int option) ?(next_token : string option) ()
: list_indices_request = { max_results; next_token; 
}

let make_list_groups_older_than_ordering_id_response 
  ?(next_token : string option)
  ?(groups_summaries : group_summary list option)
  () : list_groups_older_than_ordering_id_response = {
  next_token; groups_summaries; 
}

let make_list_groups_older_than_ordering_id_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(data_source_id : string option)
  ~(ordering_id : int)
  ~(index_id : string)
  () : list_groups_older_than_ordering_id_request = {
  max_results; next_token; ordering_id; data_source_id; index_id; 
}

let make_featured_results_set_summary 
  ?(creation_timestamp : int option)
  ?(last_updated_timestamp : int option)
  ?(status : featured_results_set_status option)
  ?(featured_results_set_name : string option)
  ?(featured_results_set_id : string option)
  () : featured_results_set_summary = {
  creation_timestamp;
  last_updated_timestamp;
  status;
  featured_results_set_name;
  featured_results_set_id;
   }

let make_list_featured_results_sets_response 
  ?(next_token : string option)
  ?(featured_results_set_summary_items : featured_results_set_summary list option)
  () : list_featured_results_sets_response = {
  next_token; featured_results_set_summary_items; 
}

let make_list_featured_results_sets_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(index_id : string)
  () : list_featured_results_sets_request = {
  max_results; next_token; index_id;  }

let make_faq_summary 
  ?(language_code : string option)
  ?(file_format : faq_file_format option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(status : faq_status option)
  ?(name : string option)
  ?(id : string option)
  () : faq_summary = {
  language_code; file_format; updated_at; created_at; status; name; id; 
}

let make_list_faqs_response 
  ?(faq_summary_items : faq_summary list option)
  ?(next_token : string option)
  () : list_faqs_response = { faq_summary_items; next_token; 
}

let make_list_faqs_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(index_id : string)
  () : list_faqs_request = { max_results; next_token; index_id; 
}

let make_experience_endpoint 
  ?(endpoint : string option) ?(endpoint_type : endpoint_type option) ()
: experience_endpoint = { endpoint; endpoint_type; 
}

let make_experiences_summary 
  ?(endpoints : experience_endpoint list option)
  ?(status : experience_status option)
  ?(created_at : float option)
  ?(id : string option)
  ?(name : string option)
  () : experiences_summary = { endpoints; status; created_at; id; name; 
}

let make_list_experiences_response 
  ?(next_token : string option)
  ?(summary_items : experiences_summary list option)
  () : list_experiences_response = { next_token; summary_items; 
}

let make_list_experiences_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(index_id : string)
  () : list_experiences_request = { max_results; next_token; index_id; 
}

let make_entity_display_data 
  ?(last_name : string option)
  ?(first_name : string option)
  ?(identified_user_name : string option)
  ?(group_name : string option)
  ?(user_name : string option)
  () : entity_display_data = {
  last_name; first_name; identified_user_name; group_name; user_name; 
}

let make_experience_entities_summary 
  ?(display_data : entity_display_data option)
  ?(entity_type : entity_type option)
  ?(entity_id : string option)
  () : experience_entities_summary = { display_data; entity_type; entity_id; 
}

let make_list_experience_entities_response 
  ?(next_token : string option)
  ?(summary_items : experience_entities_summary list option)
  () : list_experience_entities_response = { next_token; summary_items; 
}

let make_list_experience_entities_request 
  ?(next_token : string option) ~(index_id : string) ~(id : string) ()
: list_experience_entities_request = { next_token; index_id; id; 
}

let make_list_entity_personas_response 
  ?(next_token : string option)
  ?(summary_items : personas_summary list option)
  () : list_entity_personas_response = { next_token; summary_items; 
}

let make_list_entity_personas_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(index_id : string)
  ~(id : string)
  () : list_entity_personas_request = {
  max_results; next_token; index_id; id;  }

let make_data_source_summary 
  ?(language_code : string option)
  ?(status : data_source_status option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(type_ : data_source_type option)
  ?(id : string option)
  ?(name : string option)
  () : data_source_summary = {
  language_code; status; updated_at; created_at; type_; id; name; 
}

let make_list_data_sources_response 
  ?(next_token : string option)
  ?(summary_items : data_source_summary list option)
  () : list_data_sources_response = { next_token; summary_items; 
}

let make_list_data_sources_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(index_id : string)
  () : list_data_sources_request = { max_results; next_token; index_id; 
}

let make_data_source_sync_job_metrics 
  ?(documents_scanned : string option)
  ?(documents_failed : string option)
  ?(documents_deleted : string option)
  ?(documents_modified : string option)
  ?(documents_added : string option)
  () : data_source_sync_job_metrics = {
  documents_scanned;
  documents_failed;
  documents_deleted;
  documents_modified;
  documents_added;
   }

let make_data_source_sync_job 
  ?(metrics : data_source_sync_job_metrics option)
  ?(data_source_error_code : string option)
  ?(error_code : error_code option)
  ?(error_message : string option)
  ?(status : data_source_sync_job_status option)
  ?(end_time : float option)
  ?(start_time : float option)
  ?(execution_id : string option)
  () : data_source_sync_job = {
  metrics;
  data_source_error_code;
  error_code;
  error_message;
  status;
  end_time;
  start_time;
  execution_id;
   }

let make_list_data_source_sync_jobs_response 
  ?(next_token : string option)
  ?(history : data_source_sync_job list option)
  () : list_data_source_sync_jobs_response = { next_token; history; 
}

let make_list_data_source_sync_jobs_request 
  ?(status_filter : data_source_sync_job_status option)
  ?(start_time_filter : time_range option)
  ?(max_results : int option)
  ?(next_token : string option)
  ~(index_id : string)
  ~(id : string)
  () : list_data_source_sync_jobs_request = {
  status_filter; start_time_filter; max_results; next_token; index_id; id; 
}

let make_access_control_configuration_summary  ~(id : string) ()
: access_control_configuration_summary = { id; 
}

let make_list_access_control_configurations_response 
  ?(next_token : string option)
  ~(access_control_configurations : access_control_configuration_summary list)
  () : list_access_control_configurations_response = {
  access_control_configurations; next_token; 
}

let make_list_access_control_configurations_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(index_id : string)
  () : list_access_control_configurations_request = {
  max_results; next_token; index_id;  }

let make_faq_statistics  ~(indexed_question_answers_count : int) ()
: faq_statistics = { indexed_question_answers_count; 
}

let make_index_statistics 
  ~(text_document_statistics : text_document_statistics)
  ~(faq_statistics : faq_statistics)
  () : index_statistics = { text_document_statistics; faq_statistics; 
}

let make_group_ordering_id_summary 
  ?(failure_reason : string option)
  ?(ordering_id : int option)
  ?(received_at : float option)
  ?(last_updated_at : float option)
  ?(status : principal_mapping_status option)
  () : group_ordering_id_summary = {
  failure_reason; ordering_id; received_at; last_updated_at; status; 
}

let make_get_snapshots_response 
  ?(next_token : string option)
  ?(snapshots_data : string list list option)
  ?(snapshots_data_header : string list option)
  ?(snap_shot_time_filter : time_range option)
  () : get_snapshots_response = {
  next_token; snapshots_data; snapshots_data_header; snap_shot_time_filter; 
}

let make_get_snapshots_request 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(metric_type : metric_type)
  ~(interval : interval)
  ~(index_id : string)
  () : get_snapshots_request = {
  max_results; next_token; metric_type; interval; index_id; 
}

let make_get_query_suggestions_response 
  ?(suggestions : suggestion list option)
  ?(query_suggestions_id : string option)
  () : get_query_suggestions_response = { suggestions; query_suggestions_id; 
}

let make_attribute_suggestions_get_config 
  ?(user_context : user_context option)
  ?(attribute_filter : attribute_filter option)
  ?(additional_response_attributes : string list option)
  ?(suggestion_attributes : string list option)
  () : attribute_suggestions_get_config = {
  user_context;
  attribute_filter;
  additional_response_attributes;
  suggestion_attributes;
   }

let make_get_query_suggestions_request 
  ?(attribute_suggestions_config : attribute_suggestions_get_config option)
  ?(suggestion_types : suggestion_type list option)
  ?(max_suggestions_count : int option)
  ~(query_text : string)
  ~(index_id : string)
  () : get_query_suggestions_request = {
  attribute_suggestions_config;
  suggestion_types;
  max_suggestions_count;
  query_text;
  index_id;
   }

let make_featured_document_with_metadata 
  ?(ur_i : string option) ?(title : string option) ?(id : string option) ()
: featured_document_with_metadata = { ur_i; title; id; 
}

let make_featured_document_missing  ?(id : string option) ()
: featured_document_missing = { id;  }

let make_failed_entity 
  ?(error_message : string option) ?(entity_id : string option) ()
: failed_entity = { error_message; entity_id; 
}

let make_entity_persona_configuration 
  ~(persona : persona) ~(entity_id : string) ()
: entity_persona_configuration = { persona; entity_id; 
}

let make_entity_configuration 
  ~(entity_type : entity_type) ~(entity_id : string) ()
: entity_configuration = { entity_type; entity_id;  }

let make_document 
  ?(access_control_configuration_id : string option)
  ?(content_type : content_type option)
  ?(hierarchical_access_control_list : hierarchical_principal list option)
  ?(access_control_list : principal list option)
  ?(attributes : document_attribute list option)
  ?(s3_path : s3_path option)
  ?(blob : bytes option)
  ?(title : string option)
  ~(id : string)
  () : document = {
  access_control_configuration_id;
  content_type;
  hierarchical_access_control_list;
  access_control_list;
  attributes;
  s3_path;
  blob;
  title;
  id;
   }

let make_document_info 
  ?(attributes : document_attribute list option) ~(document_id : string) ()
: document_info = { attributes; document_id; 
}

let make_disassociate_personas_from_entities_response 
  ?(failed_entity_list : failed_entity list option) ()
: disassociate_personas_from_entities_response = { failed_entity_list; 
}

let make_disassociate_personas_from_entities_request 
  ~(entity_ids : string list) ~(index_id : string) ~(id : string) ()
: disassociate_personas_from_entities_request = { entity_ids; index_id; id; 
}

let make_disassociate_entities_from_experience_response 
  ?(failed_entity_list : failed_entity list option) ()
: disassociate_entities_from_experience_response = { failed_entity_list; 
}

let make_disassociate_entities_from_experience_request 
  ~(entity_list : entity_configuration list)
  ~(index_id : string)
  ~(id : string)
  () : disassociate_entities_from_experience_request = {
  entity_list; index_id; id;  }

let make_describe_thesaurus_response 
  ?(synonym_rule_count : int option)
  ?(term_count : int option)
  ?(file_size_bytes : int option)
  ?(source_s3_path : s3_path option)
  ?(role_arn : string option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(error_message : string option)
  ?(status : thesaurus_status option)
  ?(description : string option)
  ?(name : string option)
  ?(index_id : string option)
  ?(id : string option)
  () : describe_thesaurus_response = {
  synonym_rule_count;
  term_count;
  file_size_bytes;
  source_s3_path;
  role_arn;
  updated_at;
  created_at;
  error_message;
  status;
  description;
  name;
  index_id;
  id;
   }

let make_describe_thesaurus_request  ~(index_id : string) ~(id : string) ()
: describe_thesaurus_request = { index_id; id; 
}

let make_attribute_suggestions_describe_config 
  ?(attribute_suggestions_mode : attribute_suggestions_mode option)
  ?(suggestable_config_list : suggestable_config list option)
  () : attribute_suggestions_describe_config = {
  attribute_suggestions_mode; suggestable_config_list; 
}

let make_describe_query_suggestions_config_response 
  ?(attribute_suggestions_config : attribute_suggestions_describe_config option)
  ?(total_suggestions_count : int option)
  ?(last_clear_time : float option)
  ?(last_suggestions_build_time : float option)
  ?(minimum_query_count : int option)
  ?(minimum_number_of_querying_users : int option)
  ?(include_queries_without_user_information : bool option)
  ?(query_log_look_back_window_in_days : int option)
  ?(status : query_suggestions_status option)
  ?(mode : mode option)
  () : describe_query_suggestions_config_response = {
  attribute_suggestions_config;
  total_suggestions_count;
  last_clear_time;
  last_suggestions_build_time;
  minimum_query_count;
  minimum_number_of_querying_users;
  include_queries_without_user_information;
  query_log_look_back_window_in_days;
  status;
  mode;
   }

let make_describe_query_suggestions_config_request  ~(index_id : string) ()
: describe_query_suggestions_config_request = { index_id; 
}

let make_describe_query_suggestions_block_list_response 
  ?(role_arn : string option)
  ?(file_size_bytes : int option)
  ?(item_count : int option)
  ?(source_s3_path : s3_path option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(error_message : string option)
  ?(status : query_suggestions_block_list_status option)
  ?(description : string option)
  ?(name : string option)
  ?(id : string option)
  ?(index_id : string option)
  () : describe_query_suggestions_block_list_response = {
  role_arn;
  file_size_bytes;
  item_count;
  source_s3_path;
  updated_at;
  created_at;
  error_message;
  status;
  description;
  name;
  id;
  index_id;
   }

let make_describe_query_suggestions_block_list_request 
  ~(id : string) ~(index_id : string) ()
: describe_query_suggestions_block_list_request = { id; index_id; 
}

let make_describe_principal_mapping_response 
  ?(group_ordering_id_summaries : group_ordering_id_summary list option)
  ?(group_id : string option)
  ?(data_source_id : string option)
  ?(index_id : string option)
  () : describe_principal_mapping_response = {
  group_ordering_id_summaries; group_id; data_source_id; index_id; 
}

let make_describe_principal_mapping_request 
  ?(data_source_id : string option)
  ~(group_id : string)
  ~(index_id : string)
  () : describe_principal_mapping_request = {
  group_id; data_source_id; index_id;  }

let make_describe_index_response 
  ?(user_group_resolution_configuration : user_group_resolution_configuration option)
  ?(user_context_policy : user_context_policy option)
  ?(user_token_configurations : user_token_configuration list option)
  ?(capacity_units : capacity_units_configuration option)
  ?(error_message : string option)
  ?(index_statistics : index_statistics option)
  ?(document_metadata_configurations : document_metadata_configuration list option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(description : string option)
  ?(status : index_status option)
  ?(server_side_encryption_configuration : server_side_encryption_configuration option)
  ?(role_arn : string option)
  ?(edition : index_edition option)
  ?(id : string option)
  ?(name : string option)
  () : describe_index_response = {
  user_group_resolution_configuration;
  user_context_policy;
  user_token_configurations;
  capacity_units;
  error_message;
  index_statistics;
  document_metadata_configurations;
  updated_at;
  created_at;
  description;
  status;
  server_side_encryption_configuration;
  role_arn;
  edition;
  id;
  name;
   }

let make_describe_index_request  ~(id : string) () : describe_index_request =
{ id;  }

let make_describe_featured_results_set_response 
  ?(creation_timestamp : int option)
  ?(last_updated_timestamp : int option)
  ?(featured_documents_missing : featured_document_missing list option)
  ?(featured_documents_with_metadata : featured_document_with_metadata list option)
  ?(query_texts : string list option)
  ?(status : featured_results_set_status option)
  ?(description : string option)
  ?(featured_results_set_name : string option)
  ?(featured_results_set_id : string option)
  () : describe_featured_results_set_response = {
  creation_timestamp;
  last_updated_timestamp;
  featured_documents_missing;
  featured_documents_with_metadata;
  query_texts;
  status;
  description;
  featured_results_set_name;
  featured_results_set_id;
   }

let make_describe_featured_results_set_request 
  ~(featured_results_set_id : string) ~(index_id : string) ()
: describe_featured_results_set_request = {
  featured_results_set_id; index_id;  }

let make_describe_faq_response 
  ?(language_code : string option)
  ?(file_format : faq_file_format option)
  ?(error_message : string option)
  ?(role_arn : string option)
  ?(status : faq_status option)
  ?(s3_path : s3_path option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(description : string option)
  ?(name : string option)
  ?(index_id : string option)
  ?(id : string option)
  () : describe_faq_response = {
  language_code;
  file_format;
  error_message;
  role_arn;
  status;
  s3_path;
  updated_at;
  created_at;
  description;
  name;
  index_id;
  id;
   }

let make_describe_faq_request  ~(index_id : string) ~(id : string) ()
: describe_faq_request = { index_id; id; 
}

let make_describe_experience_response 
  ?(error_message : string option)
  ?(role_arn : string option)
  ?(status : experience_status option)
  ?(description : string option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(configuration : experience_configuration option)
  ?(endpoints : experience_endpoint list option)
  ?(name : string option)
  ?(index_id : string option)
  ?(id : string option)
  () : describe_experience_response = {
  error_message;
  role_arn;
  status;
  description;
  updated_at;
  created_at;
  configuration;
  endpoints;
  name;
  index_id;
  id;
   }

let make_describe_experience_request  ~(index_id : string) ~(id : string) ()
: describe_experience_request = { index_id; id; 
}

let make_describe_data_source_response 
  ?(custom_document_enrichment_configuration : custom_document_enrichment_configuration option)
  ?(language_code : string option)
  ?(error_message : string option)
  ?(role_arn : string option)
  ?(schedule : string option)
  ?(status : data_source_status option)
  ?(description : string option)
  ?(updated_at : float option)
  ?(created_at : float option)
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(configuration : data_source_configuration option)
  ?(type_ : data_source_type option)
  ?(name : string option)
  ?(index_id : string option)
  ?(id : string option)
  () : describe_data_source_response = {
  custom_document_enrichment_configuration;
  language_code;
  error_message;
  role_arn;
  schedule;
  status;
  description;
  updated_at;
  created_at;
  vpc_configuration;
  configuration;
  type_;
  name;
  index_id;
  id;
   }

let make_describe_data_source_request  ~(index_id : string) ~(id : string) ()
: describe_data_source_request = { index_id; id; 
}

let make_describe_access_control_configuration_response 
  ?(hierarchical_access_control_list : hierarchical_principal list option)
  ?(access_control_list : principal list option)
  ?(error_message : string option)
  ?(description : string option)
  ~(name : string)
  () : describe_access_control_configuration_response = {
  hierarchical_access_control_list;
  access_control_list;
  error_message;
  description;
  name;
   }

let make_describe_access_control_configuration_request 
  ~(id : string) ~(index_id : string) ()
: describe_access_control_configuration_request = { id; index_id; 
}

let make_delete_thesaurus_request  ~(index_id : string) ~(id : string) ()
: delete_thesaurus_request = { index_id; id; 
}

let make_delete_query_suggestions_block_list_request 
  ~(id : string) ~(index_id : string) ()
: delete_query_suggestions_block_list_request = { id; index_id; 
}

let make_delete_principal_mapping_request 
  ?(ordering_id : int option)
  ?(data_source_id : string option)
  ~(group_id : string)
  ~(index_id : string)
  () : delete_principal_mapping_request = {
  ordering_id; group_id; data_source_id; index_id; 
}

let make_delete_index_request  ~(id : string) () : delete_index_request = {
  id;  }

let make_delete_faq_request  ~(index_id : string) ~(id : string) ()
: delete_faq_request = { index_id; id;  }

let make_delete_experience_response  () : delete_experience_response =
()

let make_delete_experience_request  ~(index_id : string) ~(id : string) ()
: delete_experience_request = { index_id; id; 
}

let make_delete_data_source_request  ~(index_id : string) ~(id : string) ()
: delete_data_source_request = { index_id; id; 
}

let make_delete_access_control_configuration_response  ()
: delete_access_control_configuration_response =
()

let make_delete_access_control_configuration_request 
  ~(id : string) ~(index_id : string) ()
: delete_access_control_configuration_request = { id; index_id; 
}

let make_data_source_sync_job_metric_target 
  ?(data_source_sync_job_id : string option) ~(data_source_id : string) ()
: data_source_sync_job_metric_target = {
  data_source_sync_job_id; data_source_id; 
}

let make_create_thesaurus_response  ?(id : string option) ()
: create_thesaurus_response = { id;  }

let make_create_thesaurus_request 
  ?(client_token : string option)
  ?(tags : tag list option)
  ?(description : string option)
  ~(source_s3_path : s3_path)
  ~(role_arn : string)
  ~(name : string)
  ~(index_id : string)
  () : create_thesaurus_request = {
  client_token; source_s3_path; tags; role_arn; description; name; index_id; 
}

let make_create_query_suggestions_block_list_response 
  ?(id : string option) () : create_query_suggestions_block_list_response = {
  id;  }

let make_create_query_suggestions_block_list_request 
  ?(tags : tag list option)
  ?(client_token : string option)
  ?(description : string option)
  ~(role_arn : string)
  ~(source_s3_path : s3_path)
  ~(name : string)
  ~(index_id : string)
  () : create_query_suggestions_block_list_request = {
  tags; role_arn; client_token; source_s3_path; description; name; index_id; 
}

let make_create_index_response  ?(id : string option) ()
: create_index_response = { id;  }

let make_create_index_request 
  ?(user_group_resolution_configuration : user_group_resolution_configuration option)
  ?(user_context_policy : user_context_policy option)
  ?(user_token_configurations : user_token_configuration list option)
  ?(tags : tag list option)
  ?(client_token : string option)
  ?(description : string option)
  ?(server_side_encryption_configuration : server_side_encryption_configuration option)
  ?(edition : index_edition option)
  ~(role_arn : string)
  ~(name : string)
  () : create_index_request = {
  user_group_resolution_configuration;
  user_context_policy;
  user_token_configurations;
  tags;
  client_token;
  description;
  server_side_encryption_configuration;
  role_arn;
  edition;
  name;
   }

let make_create_featured_results_set_response 
  ?(featured_results_set : featured_results_set option) ()
: create_featured_results_set_response = { featured_results_set; 
}

let make_create_featured_results_set_request 
  ?(tags : tag list option)
  ?(featured_documents : featured_document list option)
  ?(query_texts : string list option)
  ?(status : featured_results_set_status option)
  ?(client_token : string option)
  ?(description : string option)
  ~(featured_results_set_name : string)
  ~(index_id : string)
  () : create_featured_results_set_request = {
  tags;
  featured_documents;
  query_texts;
  status;
  client_token;
  description;
  featured_results_set_name;
  index_id;
   }

let make_create_faq_response  ?(id : string option) () : create_faq_response
= { id;  }

let make_create_faq_request 
  ?(language_code : string option)
  ?(client_token : string option)
  ?(file_format : faq_file_format option)
  ?(tags : tag list option)
  ?(description : string option)
  ~(role_arn : string)
  ~(s3_path : s3_path)
  ~(name : string)
  ~(index_id : string)
  () : create_faq_request = {
  language_code;
  client_token;
  file_format;
  tags;
  role_arn;
  s3_path;
  description;
  name;
  index_id;
   }

let make_create_experience_response  ~(id : string) ()
: create_experience_response = { id;  }

let make_create_experience_request 
  ?(client_token : string option)
  ?(description : string option)
  ?(configuration : experience_configuration option)
  ?(role_arn : string option)
  ~(index_id : string)
  ~(name : string)
  () : create_experience_request = {
  client_token; description; configuration; role_arn; index_id; name; 
}

let make_create_data_source_response  ~(id : string) ()
: create_data_source_response = { id;  }

let make_create_data_source_request 
  ?(custom_document_enrichment_configuration : custom_document_enrichment_configuration option)
  ?(language_code : string option)
  ?(client_token : string option)
  ?(tags : tag list option)
  ?(role_arn : string option)
  ?(schedule : string option)
  ?(description : string option)
  ?(vpc_configuration : data_source_vpc_configuration option)
  ?(configuration : data_source_configuration option)
  ~(type_ : data_source_type)
  ~(index_id : string)
  ~(name : string)
  () : create_data_source_request = {
  custom_document_enrichment_configuration;
  language_code;
  client_token;
  tags;
  role_arn;
  schedule;
  description;
  vpc_configuration;
  configuration;
  type_;
  index_id;
  name;
   }

let make_create_access_control_configuration_response  ~(id : string) ()
: create_access_control_configuration_response = { id; 
}

let make_create_access_control_configuration_request 
  ?(client_token : string option)
  ?(hierarchical_access_control_list : hierarchical_principal list option)
  ?(access_control_list : principal list option)
  ?(description : string option)
  ~(name : string)
  ~(index_id : string)
  () : create_access_control_configuration_request = {
  client_token;
  hierarchical_access_control_list;
  access_control_list;
  description;
  name;
  index_id;
   }

let make_clear_query_suggestions_request  ~(index_id : string) ()
: clear_query_suggestions_request = { index_id; 
}

let make_batch_put_document_response_failed_document 
  ?(error_message : string option)
  ?(error_code : error_code option)
  ?(id : string option)
  () : batch_put_document_response_failed_document = {
  error_message; error_code; id;  }

let make_batch_put_document_response 
  ?(failed_documents : batch_put_document_response_failed_document list option)
  () : batch_put_document_response = { failed_documents; 
}

let make_batch_put_document_request 
  ?(custom_document_enrichment_configuration : custom_document_enrichment_configuration option)
  ?(role_arn : string option)
  ~(documents : document list)
  ~(index_id : string)
  () : batch_put_document_request = {
  custom_document_enrichment_configuration; documents; role_arn; index_id; 
}

let make_batch_get_document_status_response_error 
  ?(error_message : string option)
  ?(error_code : error_code option)
  ?(document_id : string option)
  () : batch_get_document_status_response_error = {
  error_message; error_code; document_id; 
}

let make_batch_get_document_status_response 
  ?(document_status_list : status list option)
  ?(errors : batch_get_document_status_response_error list option)
  () : batch_get_document_status_response = { document_status_list; errors; 
}

let make_batch_get_document_status_request 
  ~(document_info_list : document_info list) ~(index_id : string) ()
: batch_get_document_status_request = { document_info_list; index_id; 
}

let make_batch_delete_featured_results_set_error 
  ~(error_message : string) ~(error_code : error_code) ~(id : string) ()
: batch_delete_featured_results_set_error = { error_message; error_code; id; 
}

let make_batch_delete_featured_results_set_response 
  ~(errors : batch_delete_featured_results_set_error list) ()
: batch_delete_featured_results_set_response = { errors; 
}

let make_batch_delete_featured_results_set_request 
  ~(featured_results_set_ids : string list) ~(index_id : string) ()
: batch_delete_featured_results_set_request = {
  featured_results_set_ids; index_id; 
}

let make_batch_delete_document_response_failed_document 
  ?(error_message : string option)
  ?(error_code : error_code option)
  ?(id : string option)
  () : batch_delete_document_response_failed_document = {
  error_message; error_code; id;  }

let make_batch_delete_document_response 
  ?(failed_documents : batch_delete_document_response_failed_document list option)
  () : batch_delete_document_response = { failed_documents; 
}

let make_batch_delete_document_request 
  ?(data_source_sync_job_metric_target : data_source_sync_job_metric_target option)
  ~(document_id_list : string list)
  ~(index_id : string)
  () : batch_delete_document_request = {
  data_source_sync_job_metric_target; document_id_list; index_id; 
}

let make_associate_personas_to_entities_response 
  ?(failed_entity_list : failed_entity list option) ()
: associate_personas_to_entities_response = { failed_entity_list; 
}

let make_associate_personas_to_entities_request 
  ~(personas : entity_persona_configuration list)
  ~(index_id : string)
  ~(id : string)
  () : associate_personas_to_entities_request = { personas; index_id; id; 
}

let make_associate_entities_to_experience_response 
  ?(failed_entity_list : failed_entity list option) ()
: associate_entities_to_experience_response = { failed_entity_list; 
}

let make_associate_entities_to_experience_request 
  ~(entity_list : entity_configuration list)
  ~(index_id : string)
  ~(id : string)
  () : associate_entities_to_experience_request = {
  entity_list; index_id; id; 
}

