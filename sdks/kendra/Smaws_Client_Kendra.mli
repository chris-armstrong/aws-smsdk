open Smaws_Lib
val service : Service.descriptor

type data_source_to_index_field_mapping = {
  index_field_name: string;
  date_field_format: string option;
  data_source_field_name: string
}

type work_docs_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  use_change_log: bool option;
  crawl_comments: bool option;
  organization_id: string
}

type web_crawler_mode = | EVERYTHING
  | SUBDOMAINS
  | HOST_ONLY

type seed_url_configuration = {
  web_crawler_mode: web_crawler_mode option;
  seed_urls: string list
}

type site_maps_configuration = {
  site_maps: string list
}

type urls = {
  site_maps_configuration: site_maps_configuration option;
  seed_url_configuration: seed_url_configuration option
}

type proxy_configuration = {
  credentials: string option;
  port: int;
  host: string
}

type basic_authentication_configuration = {
  credentials: string;
  port: int;
  host: string
}

type authentication_configuration = {
  basic_authentication: basic_authentication_configuration list option
}

type web_crawler_configuration = {
  authentication_configuration: authentication_configuration option;
  proxy_configuration: proxy_configuration option;
  url_exclusion_patterns: string list option;
  url_inclusion_patterns: string list option;
  max_urls_per_minute_crawl_rate: int option;
  max_content_size_per_page_in_mega_bytes: float option;
  max_links_per_page: int option;
  crawl_depth: int option;
  urls: urls
}

type warning_code = | QUERY_LANGUAGE_INVALID_SYNTAX

type warning = {
  code: warning_code option;
  message: string option
}

type validation_exception = {
  message: string option
}

type key_location = | SECRET_MANAGER
  | URL

type jwt_token_type_configuration = {
  claim_regex: string option;
  issuer: string option;
  group_attribute_field: string option;
  user_name_attribute_field: string option;
  secret_manager_arn: string option;
  ur_l: string option;
  key_location: key_location
}

type json_token_type_configuration = {
  group_attribute_field: string;
  user_name_attribute_field: string
}

type user_token_configuration = {
  json_token_type_configuration: json_token_type_configuration option;
  jwt_token_type_configuration: jwt_token_type_configuration option
}

type user_identity_configuration = {
  identity_attribute_name: string option
}

type user_group_resolution_mode = | NONE
  | AWS_SSO

type user_group_resolution_configuration = {
  user_group_resolution_mode: user_group_resolution_mode
}

type user_context_policy = | USER_TOKEN
  | ATTRIBUTE_FILTER

type data_source_group = {
  data_source_id: string;
  group_id: string
}

type user_context = {
  data_source_groups: data_source_group list option;
  groups: string list option;
  user_id: string option;
  token: string option
}

type s3_path = {
  key: string;
  bucket: string
}

type update_thesaurus_request = {
  source_s3_path: s3_path option;
  role_arn: string option;
  description: string option;
  index_id: string;
  name: string option;
  id: string
}

type throttling_exception = {
  message: string option
}

type resource_not_found_exception = {
  message: string option
}

type internal_server_exception = {
  message: string option
}

type conflict_exception = {
  message: string option
}

type access_denied_exception = {
  message: string option
}

type mode = | LEARN_ONLY
  | ENABLED

type suggestable_config = {
  suggestable: bool option;
  attribute_name: string option
}

type attribute_suggestions_mode = | INACTIVE
  | ACTIVE

type attribute_suggestions_update_config = {
  attribute_suggestions_mode: attribute_suggestions_mode option;
  suggestable_config_list: suggestable_config list option
}

type update_query_suggestions_config_request = {
  attribute_suggestions_config: attribute_suggestions_update_config option;
  minimum_query_count: int option;
  minimum_number_of_querying_users: int option;
  include_queries_without_user_information: bool option;
  query_log_look_back_window_in_days: int option;
  mode: mode option;
  index_id: string
}

type update_query_suggestions_block_list_request = {
  role_arn: string option;
  source_s3_path: s3_path option;
  description: string option;
  name: string option;
  id: string;
  index_id: string
}

type document_attribute_value_type = | DATE_VALUE
  | LONG_VALUE
  | STRING_LIST_VALUE
  | STRING_VALUE

type order = | DESCENDING
  | ASCENDING

type relevance = {
  value_importance_map: (string * int) list option;
  rank_order: order option;
  duration: string option;
  importance: int option;
  freshness: bool option
}

type search = {
  sortable: bool option;
  displayable: bool option;
  searchable: bool option;
  facetable: bool option
}

type document_metadata_configuration = {
  search: search option;
  relevance: relevance option;
  type_: document_attribute_value_type;
  name: string
}

type capacity_units_configuration = {
  query_capacity_units: int;
  storage_capacity_units: int
}

type update_index_request = {
  user_group_resolution_configuration: user_group_resolution_configuration option;
  user_context_policy: user_context_policy option;
  user_token_configurations: user_token_configuration list option;
  capacity_units: capacity_units_configuration option;
  document_metadata_configuration_updates: document_metadata_configuration list option;
  description: string option;
  role_arn: string option;
  name: string option;
  id: string
}

type service_quota_exceeded_exception = {
  message: string option
}

type featured_results_set_status = | INACTIVE
  | ACTIVE

type featured_document = {
  id: string option
}

type featured_results_set = {
  creation_timestamp: int option;
  last_updated_timestamp: int option;
  featured_documents: featured_document list option;
  query_texts: string list option;
  status: featured_results_set_status option;
  description: string option;
  featured_results_set_name: string option;
  featured_results_set_id: string option
}

type update_featured_results_set_response = {
  featured_results_set: featured_results_set option
}

type update_featured_results_set_request = {
  featured_documents: featured_document list option;
  query_texts: string list option;
  status: featured_results_set_status option;
  description: string option;
  featured_results_set_name: string option;
  featured_results_set_id: string;
  index_id: string
}

type conflicting_item = {
  set_id: string option;
  set_name: string option;
  query_text: string option
}

type featured_results_conflict_exception = {
  conflicting_items: conflicting_item list option;
  message: string option
}

type content_source_configuration = {
  direct_put_content: bool option;
  faq_ids: string list option;
  data_source_ids: string list option
}

type experience_configuration = {
  user_identity_configuration: user_identity_configuration option;
  content_source_configuration: content_source_configuration option
}

type update_experience_request = {
  description: string option;
  configuration: experience_configuration option;
  role_arn: string option;
  index_id: string;
  name: string option;
  id: string
}

type documents_metadata_configuration = {
  s3_prefix: string option
}

type access_control_list_configuration = {
  key_path: string option
}

type s3_data_source_configuration = {
  access_control_list_configuration: access_control_list_configuration option;
  documents_metadata_configuration: documents_metadata_configuration option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  inclusion_prefixes: string list option;
  bucket_name: string
}

type share_point_version = | SHAREPOINT_2019
  | SHAREPOINT_ONLINE
  | SHAREPOINT_2016
  | SHAREPOINT_2013

type data_source_vpc_configuration = {
  security_group_ids: string list;
  subnet_ids: string list
}

type share_point_online_authentication_type = | OAUTH2
  | HTTP_BASIC

type share_point_configuration = {
  proxy_configuration: proxy_configuration option;
  authentication_type: share_point_online_authentication_type option;
  ssl_certificate_s3_path: s3_path option;
  disable_local_groups: bool option;
  document_title_field_name: string option;
  field_mappings: data_source_to_index_field_mapping list option;
  vpc_configuration: data_source_vpc_configuration option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  use_change_log: bool option;
  crawl_attachments: bool option;
  secret_arn: string;
  urls: string list;
  share_point_version: share_point_version
}

type database_engine_type = | RDS_POSTGRESQL
  | RDS_MYSQL
  | RDS_AURORA_POSTGRESQL
  | RDS_AURORA_MYSQL

type connection_configuration = {
  secret_arn: string;
  table_name: string;
  database_name: string;
  database_port: int;
  database_host: string
}

type column_configuration = {
  change_detecting_columns: string list;
  field_mappings: data_source_to_index_field_mapping list option;
  document_title_column_name: string option;
  document_data_column_name: string;
  document_id_column_name: string
}

type acl_configuration = {
  allowed_groups_column_name: string
}

type query_identifiers_enclosing_option = | NONE
  | DOUBLE_QUOTES

type sql_configuration = {
  query_identifiers_enclosing_option: query_identifiers_enclosing_option option
}

type database_configuration = {
  sql_configuration: sql_configuration option;
  acl_configuration: acl_configuration option;
  column_configuration: column_configuration;
  vpc_configuration: data_source_vpc_configuration option;
  connection_configuration: connection_configuration;
  database_engine_type: database_engine_type
}

type salesforce_standard_object_name = | USER
  | TASK
  | SOLUTION
  | PROFILE
  | PRODUCT
  | PRICEBOOK
  | PARTNER
  | OPPORTUNITY
  | LEAD
  | IDEA
  | GROUP
  | DOCUMENT
  | CONTRACT
  | CONTACT
  | CASE
  | CAMPAIGN
  | ACCOUNT

type salesforce_standard_object_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
  document_title_field_name: string option;
  document_data_field_name: string;
  name: salesforce_standard_object_name
}

type salesforce_knowledge_article_state = | ARCHIVED
  | PUBLISHED
  | DRAFT

type salesforce_standard_knowledge_article_type_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
  document_title_field_name: string option;
  document_data_field_name: string
}

type salesforce_custom_knowledge_article_type_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
  document_title_field_name: string option;
  document_data_field_name: string;
  name: string
}

type salesforce_knowledge_article_configuration = {
  custom_knowledge_article_type_configurations: salesforce_custom_knowledge_article_type_configuration list option;
  standard_knowledge_article_type_configuration: salesforce_standard_knowledge_article_type_configuration option;
  included_states: salesforce_knowledge_article_state list
}

type salesforce_chatter_feed_include_filter_type = | STANDARD_USER
  | ACTIVE_USER

type salesforce_chatter_feed_configuration = {
  include_filter_types: salesforce_chatter_feed_include_filter_type list option;
  field_mappings: data_source_to_index_field_mapping list option;
  document_title_field_name: string option;
  document_data_field_name: string
}

type salesforce_standard_object_attachment_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
  document_title_field_name: string option
}

type salesforce_configuration = {
  exclude_attachment_file_patterns: string list option;
  include_attachment_file_patterns: string list option;
  standard_object_attachment_configuration: salesforce_standard_object_attachment_configuration option;
  crawl_attachments: bool option;
  chatter_feed_configuration: salesforce_chatter_feed_configuration option;
  knowledge_article_configuration: salesforce_knowledge_article_configuration option;
  standard_object_configurations: salesforce_standard_object_configuration list option;
  secret_arn: string;
  server_url: string
}

type one_drive_users = {
  one_drive_user_s3_path: s3_path option;
  one_drive_user_list: string list option
}

type one_drive_configuration = {
  disable_local_groups: bool option;
  field_mappings: data_source_to_index_field_mapping list option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  one_drive_users: one_drive_users;
  secret_arn: string;
  tenant_domain: string
}

type service_now_build_version_type = | OTHERS
  | LONDON

type service_now_knowledge_article_configuration = {
  filter_query: string option;
  field_mappings: data_source_to_index_field_mapping list option;
  document_title_field_name: string option;
  document_data_field_name: string;
  exclude_attachment_file_patterns: string list option;
  include_attachment_file_patterns: string list option;
  crawl_attachments: bool option
}

type service_now_service_catalog_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
  document_title_field_name: string option;
  document_data_field_name: string;
  exclude_attachment_file_patterns: string list option;
  include_attachment_file_patterns: string list option;
  crawl_attachments: bool option
}

type service_now_authentication_type = | OAUTH2
  | HTTP_BASIC

type service_now_configuration = {
  authentication_type: service_now_authentication_type option;
  service_catalog_configuration: service_now_service_catalog_configuration option;
  knowledge_article_configuration: service_now_knowledge_article_configuration option;
  service_now_build_version: service_now_build_version_type;
  secret_arn: string;
  host_url: string
}

type confluence_version = | SERVER
  | CLOUD

type confluence_space_field_name = | URL
  | SPACE_KEY
  | ITEM_TYPE
  | DISPLAY_URL

type confluence_space_to_index_field_mapping = {
  index_field_name: string option;
  date_field_format: string option;
  data_source_field_name: confluence_space_field_name option
}

type confluence_space_configuration = {
  space_field_mappings: confluence_space_to_index_field_mapping list option;
  exclude_spaces: string list option;
  include_spaces: string list option;
  crawl_archived_spaces: bool option;
  crawl_personal_spaces: bool option
}

type confluence_page_field_name = | VERSION
  | URL
  | SPACE_NAME
  | SPACE_KEY
  | PARENT_ID
  | MODIFIED_DATE
  | LABELS
  | ITEM_TYPE
  | DISPLAY_URL
  | CREATED_DATE
  | CONTENT_STATUS
  | AUTHOR

type confluence_page_to_index_field_mapping = {
  index_field_name: string option;
  date_field_format: string option;
  data_source_field_name: confluence_page_field_name option
}

type confluence_page_configuration = {
  page_field_mappings: confluence_page_to_index_field_mapping list option
}

type confluence_blog_field_name = | VERSION
  | URL
  | SPACE_NAME
  | SPACE_KEY
  | PUBLISH_DATE
  | LABELS
  | ITEM_TYPE
  | DISPLAY_URL
  | AUTHOR

type confluence_blog_to_index_field_mapping = {
  index_field_name: string option;
  date_field_format: string option;
  data_source_field_name: confluence_blog_field_name option
}

type confluence_blog_configuration = {
  blog_field_mappings: confluence_blog_to_index_field_mapping list option
}

type confluence_attachment_field_name = | VERSION
  | URL
  | SPACE_NAME
  | SPACE_KEY
  | PARENT_ID
  | ITEM_TYPE
  | FILE_SIZE
  | DISPLAY_URL
  | CREATED_DATE
  | CONTENT_TYPE
  | AUTHOR

type confluence_attachment_to_index_field_mapping = {
  index_field_name: string option;
  date_field_format: string option;
  data_source_field_name: confluence_attachment_field_name option
}

type confluence_attachment_configuration = {
  attachment_field_mappings: confluence_attachment_to_index_field_mapping list option;
  crawl_attachments: bool option
}

type confluence_authentication_type = | PAT
  | HTTP_BASIC

type confluence_configuration = {
  authentication_type: confluence_authentication_type option;
  proxy_configuration: proxy_configuration option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  vpc_configuration: data_source_vpc_configuration option;
  attachment_configuration: confluence_attachment_configuration option;
  blog_configuration: confluence_blog_configuration option;
  page_configuration: confluence_page_configuration option;
  space_configuration: confluence_space_configuration option;
  version: confluence_version;
  secret_arn: string;
  server_url: string
}

type google_drive_configuration = {
  exclude_shared_drives: string list option;
  exclude_user_accounts: string list option;
  exclude_mime_types: string list option;
  field_mappings: data_source_to_index_field_mapping list option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  secret_arn: string
}

type fsx_file_system_type = | WINDOWS

type fsx_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  secret_arn: string option;
  vpc_configuration: data_source_vpc_configuration;
  file_system_type: fsx_file_system_type;
  file_system_id: string
}

type slack_entity = | DIRECT_MESSAGE
  | GROUP_MESSAGE
  | PRIVATE_CHANNEL
  | PUBLIC_CHANNEL

type slack_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  public_channel_filter: string list option;
  private_channel_filter: string list option;
  look_back_period: int option;
  since_crawl_date: string;
  exclude_archived: bool option;
  crawl_bot_message: bool option;
  use_change_log: bool option;
  slack_entity_list: slack_entity list;
  vpc_configuration: data_source_vpc_configuration option;
  secret_arn: string;
  team_id: string
}

type box_configuration = {
  vpc_configuration: data_source_vpc_configuration option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  web_link_field_mappings: data_source_to_index_field_mapping list option;
  comment_field_mappings: data_source_to_index_field_mapping list option;
  task_field_mappings: data_source_to_index_field_mapping list option;
  file_field_mappings: data_source_to_index_field_mapping list option;
  crawl_web_links: bool option;
  crawl_tasks: bool option;
  crawl_comments: bool option;
  use_change_log: bool option;
  secret_arn: string;
  enterprise_id: string
}

type quip_configuration = {
  vpc_configuration: data_source_vpc_configuration option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  attachment_field_mappings: data_source_to_index_field_mapping list option;
  message_field_mappings: data_source_to_index_field_mapping list option;
  thread_field_mappings: data_source_to_index_field_mapping list option;
  folder_ids: string list option;
  crawl_attachments: bool option;
  crawl_chat_rooms: bool option;
  crawl_file_comments: bool option;
  secret_arn: string;
  domain: string
}

type issue_sub_entity = | WORKLOGS
  | ATTACHMENTS
  | COMMENTS

type jira_configuration = {
  vpc_configuration: data_source_vpc_configuration option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  work_log_field_mappings: data_source_to_index_field_mapping list option;
  project_field_mappings: data_source_to_index_field_mapping list option;
  issue_field_mappings: data_source_to_index_field_mapping list option;
  comment_field_mappings: data_source_to_index_field_mapping list option;
  attachment_field_mappings: data_source_to_index_field_mapping list option;
  issue_sub_entity_filter: issue_sub_entity list option;
  status: string list option;
  issue_type: string list option;
  project: string list option;
  use_change_log: bool option;
  secret_arn: string;
  jira_account_url: string
}

type saa_s_configuration = {
  host_url: string;
  organization_name: string
}

type on_premise_configuration = {
  ssl_certificate_s3_path: s3_path;
  organization_name: string;
  host_url: string
}

type type_ = | ON_PREMISE
  | SAAS

type git_hub_document_crawl_properties = {
  crawl_pull_request_comment_attachment: bool option;
  crawl_pull_request_comment: bool option;
  crawl_pull_request: bool option;
  crawl_issue_comment_attachment: bool option;
  crawl_issue_comment: bool option;
  crawl_issue: bool option;
  crawl_repository_documents: bool option
}

type git_hub_configuration = {
  git_hub_pull_request_document_attachment_configuration_field_mappings: data_source_to_index_field_mapping list option;
  git_hub_pull_request_document_configuration_field_mappings: data_source_to_index_field_mapping list option;
  git_hub_pull_request_comment_configuration_field_mappings: data_source_to_index_field_mapping list option;
  git_hub_issue_attachment_configuration_field_mappings: data_source_to_index_field_mapping list option;
  git_hub_issue_comment_configuration_field_mappings: data_source_to_index_field_mapping list option;
  git_hub_issue_document_configuration_field_mappings: data_source_to_index_field_mapping list option;
  git_hub_commit_configuration_field_mappings: data_source_to_index_field_mapping list option;
  git_hub_repository_configuration_field_mappings: data_source_to_index_field_mapping list option;
  vpc_configuration: data_source_vpc_configuration option;
  exclusion_file_name_patterns: string list option;
  exclusion_file_type_patterns: string list option;
  exclusion_folder_name_patterns: string list option;
  inclusion_file_name_patterns: string list option;
  inclusion_file_type_patterns: string list option;
  inclusion_folder_name_patterns: string list option;
  repository_filter: string list option;
  git_hub_document_crawl_properties: git_hub_document_crawl_properties option;
  use_change_log: bool option;
  secret_arn: string;
  type_: type_ option;
  on_premise_configuration: on_premise_configuration option;
  saa_s_configuration: saa_s_configuration option
}

type alfresco_entity = | DocumentLibrary
  | Blog
  | Wiki

type alfresco_configuration = {
  vpc_configuration: data_source_vpc_configuration option;
  exclusion_patterns: string list option;
  inclusion_patterns: string list option;
  wiki_field_mappings: data_source_to_index_field_mapping list option;
  blog_field_mappings: data_source_to_index_field_mapping list option;
  document_library_field_mappings: data_source_to_index_field_mapping list option;
  entity_filter: alfresco_entity list option;
  crawl_comments: bool option;
  crawl_system_folders: bool option;
  ssl_certificate_s3_path: s3_path;
  secret_arn: string;
  site_id: string;
  site_url: string
}

type template = Json.t

type template_configuration = {
  template: template option
}

type data_source_configuration = {
  template_configuration: template_configuration option;
  alfresco_configuration: alfresco_configuration option;
  git_hub_configuration: git_hub_configuration option;
  jira_configuration: jira_configuration option;
  quip_configuration: quip_configuration option;
  box_configuration: box_configuration option;
  slack_configuration: slack_configuration option;
  fsx_configuration: fsx_configuration option;
  work_docs_configuration: work_docs_configuration option;
  web_crawler_configuration: web_crawler_configuration option;
  google_drive_configuration: google_drive_configuration option;
  confluence_configuration: confluence_configuration option;
  service_now_configuration: service_now_configuration option;
  one_drive_configuration: one_drive_configuration option;
  salesforce_configuration: salesforce_configuration option;
  database_configuration: database_configuration option;
  share_point_configuration: share_point_configuration option;
  s3_configuration: s3_data_source_configuration option
}

type condition_operator = | BeginsWith
  | NotExists
  | Exists
  | NotContains
  | Contains
  | NotEquals
  | Equals
  | LessThanOrEquals
  | LessThan
  | GreaterThanOrEquals
  | GreaterThan

type document_attribute_value = {
  date_value: float option;
  long_value: int option;
  string_list_value: string list option;
  string_value: string option
}

type document_attribute_condition = {
  condition_on_value: document_attribute_value option;
  operator: condition_operator;
  condition_document_attribute_key: string
}

type document_attribute_target = {
  target_document_attribute_value: document_attribute_value option;
  target_document_attribute_value_deletion: bool option;
  target_document_attribute_key: string option
}

type inline_custom_document_enrichment_configuration = {
  document_content_deletion: bool option;
  target: document_attribute_target option;
  condition: document_attribute_condition option
}

type hook_configuration = {
  s3_bucket: string;
  lambda_arn: string;
  invocation_condition: document_attribute_condition option
}

type custom_document_enrichment_configuration = {
  role_arn: string option;
  post_extraction_hook_configuration: hook_configuration option;
  pre_extraction_hook_configuration: hook_configuration option;
  inline_configurations: inline_custom_document_enrichment_configuration list option
}

type update_data_source_request = {
  custom_document_enrichment_configuration: custom_document_enrichment_configuration option;
  language_code: string option;
  role_arn: string option;
  schedule: string option;
  description: string option;
  vpc_configuration: data_source_vpc_configuration option;
  configuration: data_source_configuration option;
  index_id: string;
  name: string option;
  id: string
}

type update_access_control_configuration_response = unit

type principal_type = | GROUP
  | USER

type read_access_type = | DENY
  | ALLOW

type principal = {
  data_source_id: string option;
  access: read_access_type;
  type_: principal_type;
  name: string
}

type hierarchical_principal = {
  principal_list: principal list
}

type update_access_control_configuration_request = {
  hierarchical_access_control_list: hierarchical_principal list option;
  access_control_list: principal list option;
  description: string option;
  name: string option;
  id: string;
  index_id: string
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_ar_n: string
}

type resource_unavailable_exception = {
  message: string option
}

type time_range = {
  end_time: float option;
  start_time: float option
}

type thesaurus_status = | FAILED
  | ACTIVE_BUT_UPDATE_FAILED
  | UPDATING
  | DELETING
  | ACTIVE
  | CREATING

type thesaurus_summary = {
  updated_at: float option;
  created_at: float option;
  status: thesaurus_status option;
  name: string option;
  id: string option
}

type highlight_type = | THESAURUS_SYNONYM
  | STANDARD

type highlight = {
  type_: highlight_type option;
  top_answer: bool option;
  end_offset: int;
  begin_offset: int
}

type text_with_highlights = {
  highlights: highlight list option;
  text: string option
}

type text_document_statistics = {
  indexed_text_bytes: int;
  indexed_text_documents_count: int
}

type tag_resource_response = unit

type tag = {
  value: string;
  key: string
}

type tag_resource_request = {
  tags: tag list;
  resource_ar_n: string
}

type table_cell = {
  header: bool option;
  highlighted: bool option;
  top_answer: bool option;
  value: string option
}

type table_row = {
  cells: table_cell list option
}

type table_excerpt = {
  total_number_of_rows: int option;
  rows: table_row list option
}

type suggestion_highlight = {
  end_offset: int option;
  begin_offset: int option
}

type suggestion_text_with_highlights = {
  highlights: suggestion_highlight list option;
  text: string option
}

type suggestion_value = {
  text: suggestion_text_with_highlights option
}

type suggestion_type = | DOCUMENT_ATTRIBUTES
  | QUERY

type document_attribute = {
  value: document_attribute_value;
  key: string
}

type source_document = {
  additional_attributes: document_attribute list option;
  suggestion_attributes: string list option;
  document_id: string option
}

type suggestion = {
  source_documents: source_document list option;
  value: suggestion_value option;
  id: string option
}

type click_feedback = {
  click_time: float;
  result_id: string
}

type relevance_type = | NOT_RELEVANT
  | RELEVANT

type relevance_feedback = {
  relevance_value: relevance_type;
  result_id: string
}

type submit_feedback_request = {
  relevance_feedback_items: relevance_feedback list option;
  click_feedback_items: click_feedback list option;
  query_id: string;
  index_id: string
}

type stop_data_source_sync_job_request = {
  index_id: string;
  id: string
}

type document_status = | UPDATE_FAILED
  | FAILED
  | UPDATED
  | INDEXED
  | PROCESSING
  | NOT_FOUND

type status = {
  failure_reason: string option;
  failure_code: string option;
  document_status: document_status option;
  document_id: string option
}

type start_data_source_sync_job_response = {
  execution_id: string option
}

type start_data_source_sync_job_request = {
  index_id: string;
  id: string
}

type resource_in_use_exception = {
  message: string option
}

type spell_correction_configuration = {
  include_query_spell_check_suggestions: bool
}

type correction = {
  corrected_term: string option;
  term: string option;
  end_offset: int option;
  begin_offset: int option
}

type spell_corrected_query = {
  corrections: correction list option;
  suggested_query_text: string option
}

type sort_order = | ASC
  | DESC

type sorting_configuration = {
  sort_order: sort_order;
  document_attribute_key: string
}

type server_side_encryption_configuration = {
  kms_key_id: string option
}

type score_confidence = | NOT_AVAILABLE
  | LOW
  | MEDIUM
  | HIGH
  | VERY_HIGH

type score_attributes = {
  score_confidence: score_confidence option
}

type retrieve_result_item = {
  score_attributes: score_attributes option;
  document_attributes: document_attribute list option;
  document_ur_i: string option;
  content: string option;
  document_title: string option;
  document_id: string option;
  id: string option
}

type retrieve_result = {
  result_items: retrieve_result_item list option;
  query_id: string option
}

type attribute_filter = {
  less_than_or_equals: document_attribute option;
  less_than: document_attribute option;
  greater_than_or_equals: document_attribute option;
  greater_than: document_attribute option;
  contains_any: document_attribute option;
  contains_all: document_attribute option;
  equals_to: document_attribute option;
  not_filter: attribute_filter option;
  or_all_filters: attribute_filter list option;
  and_all_filters: attribute_filter list option
}

type document_relevance_configuration = {
  relevance: relevance;
  name: string
}

type retrieve_request = {
  user_context: user_context option;
  page_size: int option;
  page_number: int option;
  document_relevance_override_configurations: document_relevance_configuration list option;
  requested_document_attributes: string list option;
  attribute_filter: attribute_filter option;
  query_text: string;
  index_id: string
}

type resource_already_exist_exception = {
  message: string option
}

type query_suggestions_status = | UPDATING
  | ACTIVE

type query_suggestions_block_list_status = | FAILED
  | ACTIVE_BUT_UPDATE_FAILED
  | UPDATING
  | DELETING
  | CREATING
  | ACTIVE

type query_suggestions_block_list_summary = {
  item_count: int option;
  updated_at: float option;
  created_at: float option;
  status: query_suggestions_block_list_status option;
  name: string option;
  id: string option
}

type query_result_type = | ANSWER
  | QUESTION_ANSWER
  | DOCUMENT

type query_result_format = | TEXT
  | TABLE

type additional_result_attribute_value_type = | TEXT_WITH_HIGHLIGHTS_VALUE

type additional_result_attribute_value = {
  text_with_highlights_value: text_with_highlights option
}

type additional_result_attribute = {
  value: additional_result_attribute_value;
  value_type: additional_result_attribute_value_type;
  key: string
}

type expanded_result_item = {
  document_attributes: document_attribute list option;
  document_ur_i: string option;
  document_excerpt: text_with_highlights option;
  document_title: text_with_highlights option;
  document_id: string option;
  id: string option
}

type collapsed_result_detail = {
  expanded_results: expanded_result_item list option;
  document_attribute: document_attribute
}

type query_result_item = {
  collapsed_result_detail: collapsed_result_detail option;
  table_excerpt: table_excerpt option;
  feedback_token: string option;
  score_attributes: score_attributes option;
  document_attributes: document_attribute list option;
  document_ur_i: string option;
  document_excerpt: text_with_highlights option;
  document_title: text_with_highlights option;
  document_id: string option;
  additional_attributes: additional_result_attribute list option;
  format: query_result_format option;
  type_: query_result_type option;
  id: string option
}

type document_attribute_value_count_pair = {
  facet_results: facet_result list option;
  count: int option;
  document_attribute_value: document_attribute_value option
} and facet_result = {
  document_attribute_value_count_pairs: document_attribute_value_count_pair list option;
  document_attribute_value_type: document_attribute_value_type option;
  document_attribute_key: string option
}

type featured_results_item = {
  feedback_token: string option;
  document_attributes: document_attribute list option;
  document_ur_i: string option;
  document_excerpt: text_with_highlights option;
  document_title: text_with_highlights option;
  document_id: string option;
  additional_attributes: additional_result_attribute list option;
  type_: query_result_type option;
  id: string option
}

type query_result = {
  featured_results_items: featured_results_item list option;
  spell_corrected_queries: spell_corrected_query list option;
  warnings: warning list option;
  total_number_of_results: int option;
  facet_results: facet_result list option;
  result_items: query_result_item list option;
  query_id: string option
}

type facet = {
  max_results: int option;
  facets: facet list option;
  document_attribute_key: string option
}

type missing_attribute_key_strategy = | EXPAND
  | COLLAPSE
  | IGNORE

type expand_configuration = {
  max_expanded_results_per_item: int option;
  max_result_items_to_expand: int option
}

type collapse_configuration = {
  expand_configuration: expand_configuration option;
  expand: bool option;
  missing_attribute_key_strategy: missing_attribute_key_strategy option;
  sorting_configurations: sorting_configuration list option;
  document_attribute_key: string
}

type query_request = {
  collapse_configuration: collapse_configuration option;
  spell_correction_configuration: spell_correction_configuration option;
  visitor_id: string option;
  user_context: user_context option;
  sorting_configurations: sorting_configuration list option;
  sorting_configuration: sorting_configuration option;
  page_size: int option;
  page_number: int option;
  document_relevance_override_configurations: document_relevance_configuration list option;
  query_result_type_filter: query_result_type option;
  requested_document_attributes: string list option;
  facets: facet list option;
  attribute_filter: attribute_filter option;
  query_text: string option;
  index_id: string
}

type member_group = {
  data_source_id: string option;
  group_id: string
}

type member_user = {
  user_id: string
}

type group_members = {
  s3_pathfor_group_members: s3_path option;
  member_users: member_user list option;
  member_groups: member_group list option
}

type put_principal_mapping_request = {
  role_arn: string option;
  ordering_id: int option;
  group_members: group_members;
  group_id: string;
  data_source_id: string option;
  index_id: string
}

type principal_mapping_status = | DELETED
  | DELETING
  | PROCESSING
  | SUCCEEDED
  | FAILED

type persona = | VIEWER
  | OWNER

type personas_summary = {
  updated_at: float option;
  created_at: float option;
  persona: persona option;
  entity_id: string option
}

type metric_type = | TREND_QUERY_DOC_METRICS
  | AGG_QUERY_DOC_METRICS
  | DOCS_BY_CLICK_COUNT
  | QUERIES_BY_ZERO_RESULT_RATE
  | QUERIES_BY_ZERO_CLICK_RATE
  | QUERIES_BY_COUNT

type list_thesauri_response = {
  thesaurus_summary_items: thesaurus_summary list option;
  next_token: string option
}

type list_thesauri_request = {
  max_results: int option;
  next_token: string option;
  index_id: string
}

type list_tags_for_resource_response = {
  tags: tag list option
}

type list_tags_for_resource_request = {
  resource_ar_n: string
}

type list_query_suggestions_block_lists_response = {
  next_token: string option;
  block_list_summary_items: query_suggestions_block_list_summary list option
}

type list_query_suggestions_block_lists_request = {
  max_results: int option;
  next_token: string option;
  index_id: string
}

type group_summary = {
  ordering_id: int option;
  group_id: string option
}

type index_edition = | ENTERPRISE_EDITION
  | DEVELOPER_EDITION

type index_status = | SYSTEM_UPDATING
  | UPDATING
  | FAILED
  | DELETING
  | ACTIVE
  | CREATING

type index_configuration_summary = {
  status: index_status;
  updated_at: float;
  created_at: float;
  edition: index_edition option;
  id: string option;
  name: string option
}

type list_indices_response = {
  next_token: string option;
  index_configuration_summary_items: index_configuration_summary list option
}

type list_indices_request = {
  max_results: int option;
  next_token: string option
}

type list_groups_older_than_ordering_id_response = {
  next_token: string option;
  groups_summaries: group_summary list option
}

type list_groups_older_than_ordering_id_request = {
  max_results: int option;
  next_token: string option;
  ordering_id: int;
  data_source_id: string option;
  index_id: string
}

type featured_results_set_summary = {
  creation_timestamp: int option;
  last_updated_timestamp: int option;
  status: featured_results_set_status option;
  featured_results_set_name: string option;
  featured_results_set_id: string option
}

type list_featured_results_sets_response = {
  next_token: string option;
  featured_results_set_summary_items: featured_results_set_summary list option
}

type list_featured_results_sets_request = {
  max_results: int option;
  next_token: string option;
  index_id: string
}

type faq_status = | FAILED
  | DELETING
  | ACTIVE
  | UPDATING
  | CREATING

type faq_file_format = | JSON
  | CSV_WITH_HEADER
  | CSV

type faq_summary = {
  language_code: string option;
  file_format: faq_file_format option;
  updated_at: float option;
  created_at: float option;
  status: faq_status option;
  name: string option;
  id: string option
}

type list_faqs_response = {
  faq_summary_items: faq_summary list option;
  next_token: string option
}

type list_faqs_request = {
  max_results: int option;
  next_token: string option;
  index_id: string
}

type experience_status = | FAILED
  | DELETING
  | ACTIVE
  | CREATING

type endpoint_type = | HOME

type experience_endpoint = {
  endpoint: string option;
  endpoint_type: endpoint_type option
}

type experiences_summary = {
  endpoints: experience_endpoint list option;
  status: experience_status option;
  created_at: float option;
  id: string option;
  name: string option
}

type list_experiences_response = {
  next_token: string option;
  summary_items: experiences_summary list option
}

type list_experiences_request = {
  max_results: int option;
  next_token: string option;
  index_id: string
}

type entity_type = | GROUP
  | USER

type entity_display_data = {
  last_name: string option;
  first_name: string option;
  identified_user_name: string option;
  group_name: string option;
  user_name: string option
}

type experience_entities_summary = {
  display_data: entity_display_data option;
  entity_type: entity_type option;
  entity_id: string option
}

type list_experience_entities_response = {
  next_token: string option;
  summary_items: experience_entities_summary list option
}

type list_experience_entities_request = {
  next_token: string option;
  index_id: string;
  id: string
}

type list_entity_personas_response = {
  next_token: string option;
  summary_items: personas_summary list option
}

type list_entity_personas_request = {
  max_results: int option;
  next_token: string option;
  index_id: string;
  id: string
}

type data_source_type = | TEMPLATE
  | ALFRESCO
  | GITHUB
  | JIRA
  | QUIP
  | BOX
  | SLACK
  | FSX
  | WORKDOCS
  | WEBCRAWLER
  | GOOGLEDRIVE
  | CONFLUENCE
  | CUSTOM
  | SERVICENOW
  | ONEDRIVE
  | SALESFORCE
  | DATABASE
  | SHAREPOINT
  | S3

type data_source_status = | ACTIVE
  | UPDATING
  | FAILED
  | DELETING
  | CREATING

type data_source_summary = {
  language_code: string option;
  status: data_source_status option;
  updated_at: float option;
  created_at: float option;
  type_: data_source_type option;
  id: string option;
  name: string option
}

type list_data_sources_response = {
  next_token: string option;
  summary_items: data_source_summary list option
}

type list_data_sources_request = {
  max_results: int option;
  next_token: string option;
  index_id: string
}

type data_source_sync_job_status = | SYNCING_INDEXING
  | ABORTED
  | STOPPING
  | INCOMPLETE
  | SYNCING
  | SUCCEEDED
  | FAILED

type error_code = | INVALID_REQUEST
  | INTERNAL_ERROR

type data_source_sync_job_metrics = {
  documents_scanned: string option;
  documents_failed: string option;
  documents_deleted: string option;
  documents_modified: string option;
  documents_added: string option
}

type data_source_sync_job = {
  metrics: data_source_sync_job_metrics option;
  data_source_error_code: string option;
  error_code: error_code option;
  error_message: string option;
  status: data_source_sync_job_status option;
  end_time: float option;
  start_time: float option;
  execution_id: string option
}

type list_data_source_sync_jobs_response = {
  next_token: string option;
  history: data_source_sync_job list option
}

type list_data_source_sync_jobs_request = {
  status_filter: data_source_sync_job_status option;
  start_time_filter: time_range option;
  max_results: int option;
  next_token: string option;
  index_id: string;
  id: string
}

type access_control_configuration_summary = {
  id: string
}

type list_access_control_configurations_response = {
  access_control_configurations: access_control_configuration_summary list;
  next_token: string option
}

type list_access_control_configurations_request = {
  max_results: int option;
  next_token: string option;
  index_id: string
}

type invalid_request_exception = {
  message: string option
}

type interval = | TWO_MONTHS_AGO
  | ONE_MONTH_AGO
  | TWO_WEEKS_AGO
  | ONE_WEEK_AGO
  | THIS_WEEK
  | THIS_MONTH

type faq_statistics = {
  indexed_question_answers_count: int
}

type index_statistics = {
  text_document_statistics: text_document_statistics;
  faq_statistics: faq_statistics
}

type group_ordering_id_summary = {
  failure_reason: string option;
  ordering_id: int option;
  received_at: float option;
  last_updated_at: float option;
  status: principal_mapping_status option
}

type get_snapshots_response = {
  next_token: string option;
  snapshots_data: string list list option;
  snapshots_data_header: string list option;
  snap_shot_time_filter: time_range option
}

type get_snapshots_request = {
  max_results: int option;
  next_token: string option;
  metric_type: metric_type;
  interval: interval;
  index_id: string
}

type get_query_suggestions_response = {
  suggestions: suggestion list option;
  query_suggestions_id: string option
}

type attribute_suggestions_get_config = {
  user_context: user_context option;
  attribute_filter: attribute_filter option;
  additional_response_attributes: string list option;
  suggestion_attributes: string list option
}

type get_query_suggestions_request = {
  attribute_suggestions_config: attribute_suggestions_get_config option;
  suggestion_types: suggestion_type list option;
  max_suggestions_count: int option;
  query_text: string;
  index_id: string
}

type featured_document_with_metadata = {
  ur_i: string option;
  title: string option;
  id: string option
}

type featured_document_missing = {
  id: string option
}

type failed_entity = {
  error_message: string option;
  entity_id: string option
}

type entity_persona_configuration = {
  persona: persona;
  entity_id: string
}

type entity_configuration = {
  entity_type: entity_type;
  entity_id: string
}

type content_type = | MD
  | JSON
  | CSV
  | MS_EXCEL
  | XSLT
  | XML
  | RTF
  | PPT
  | PLAIN_TEXT
  | MS_WORD
  | HTML
  | PDF

type document = {
  access_control_configuration_id: string option;
  content_type: content_type option;
  hierarchical_access_control_list: hierarchical_principal list option;
  access_control_list: principal list option;
  attributes: document_attribute list option;
  s3_path: s3_path option;
  blob: bytes option;
  title: string option;
  id: string
}

type document_info = {
  attributes: document_attribute list option;
  document_id: string
}

type disassociate_personas_from_entities_response = {
  failed_entity_list: failed_entity list option
}

type disassociate_personas_from_entities_request = {
  entity_ids: string list;
  index_id: string;
  id: string
}

type disassociate_entities_from_experience_response = {
  failed_entity_list: failed_entity list option
}

type disassociate_entities_from_experience_request = {
  entity_list: entity_configuration list;
  index_id: string;
  id: string
}

type describe_thesaurus_response = {
  synonym_rule_count: int option;
  term_count: int option;
  file_size_bytes: int option;
  source_s3_path: s3_path option;
  role_arn: string option;
  updated_at: float option;
  created_at: float option;
  error_message: string option;
  status: thesaurus_status option;
  description: string option;
  name: string option;
  index_id: string option;
  id: string option
}

type describe_thesaurus_request = {
  index_id: string;
  id: string
}

type attribute_suggestions_describe_config = {
  attribute_suggestions_mode: attribute_suggestions_mode option;
  suggestable_config_list: suggestable_config list option
}

type describe_query_suggestions_config_response = {
  attribute_suggestions_config: attribute_suggestions_describe_config option;
  total_suggestions_count: int option;
  last_clear_time: float option;
  last_suggestions_build_time: float option;
  minimum_query_count: int option;
  minimum_number_of_querying_users: int option;
  include_queries_without_user_information: bool option;
  query_log_look_back_window_in_days: int option;
  status: query_suggestions_status option;
  mode: mode option
}

type describe_query_suggestions_config_request = {
  index_id: string
}

type describe_query_suggestions_block_list_response = {
  role_arn: string option;
  file_size_bytes: int option;
  item_count: int option;
  source_s3_path: s3_path option;
  updated_at: float option;
  created_at: float option;
  error_message: string option;
  status: query_suggestions_block_list_status option;
  description: string option;
  name: string option;
  id: string option;
  index_id: string option
}

type describe_query_suggestions_block_list_request = {
  id: string;
  index_id: string
}

type describe_principal_mapping_response = {
  group_ordering_id_summaries: group_ordering_id_summary list option;
  group_id: string option;
  data_source_id: string option;
  index_id: string option
}

type describe_principal_mapping_request = {
  group_id: string;
  data_source_id: string option;
  index_id: string
}

type describe_index_response = {
  user_group_resolution_configuration: user_group_resolution_configuration option;
  user_context_policy: user_context_policy option;
  user_token_configurations: user_token_configuration list option;
  capacity_units: capacity_units_configuration option;
  error_message: string option;
  index_statistics: index_statistics option;
  document_metadata_configurations: document_metadata_configuration list option;
  updated_at: float option;
  created_at: float option;
  description: string option;
  status: index_status option;
  server_side_encryption_configuration: server_side_encryption_configuration option;
  role_arn: string option;
  edition: index_edition option;
  id: string option;
  name: string option
}

type describe_index_request = {
  id: string
}

type describe_featured_results_set_response = {
  creation_timestamp: int option;
  last_updated_timestamp: int option;
  featured_documents_missing: featured_document_missing list option;
  featured_documents_with_metadata: featured_document_with_metadata list option;
  query_texts: string list option;
  status: featured_results_set_status option;
  description: string option;
  featured_results_set_name: string option;
  featured_results_set_id: string option
}

type describe_featured_results_set_request = {
  featured_results_set_id: string;
  index_id: string
}

type describe_faq_response = {
  language_code: string option;
  file_format: faq_file_format option;
  error_message: string option;
  role_arn: string option;
  status: faq_status option;
  s3_path: s3_path option;
  updated_at: float option;
  created_at: float option;
  description: string option;
  name: string option;
  index_id: string option;
  id: string option
}

type describe_faq_request = {
  index_id: string;
  id: string
}

type describe_experience_response = {
  error_message: string option;
  role_arn: string option;
  status: experience_status option;
  description: string option;
  updated_at: float option;
  created_at: float option;
  configuration: experience_configuration option;
  endpoints: experience_endpoint list option;
  name: string option;
  index_id: string option;
  id: string option
}

type describe_experience_request = {
  index_id: string;
  id: string
}

type describe_data_source_response = {
  custom_document_enrichment_configuration: custom_document_enrichment_configuration option;
  language_code: string option;
  error_message: string option;
  role_arn: string option;
  schedule: string option;
  status: data_source_status option;
  description: string option;
  updated_at: float option;
  created_at: float option;
  vpc_configuration: data_source_vpc_configuration option;
  configuration: data_source_configuration option;
  type_: data_source_type option;
  name: string option;
  index_id: string option;
  id: string option
}

type describe_data_source_request = {
  index_id: string;
  id: string
}

type describe_access_control_configuration_response = {
  hierarchical_access_control_list: hierarchical_principal list option;
  access_control_list: principal list option;
  error_message: string option;
  description: string option;
  name: string
}

type describe_access_control_configuration_request = {
  id: string;
  index_id: string
}

type delete_thesaurus_request = {
  index_id: string;
  id: string
}

type delete_query_suggestions_block_list_request = {
  id: string;
  index_id: string
}

type delete_principal_mapping_request = {
  ordering_id: int option;
  group_id: string;
  data_source_id: string option;
  index_id: string
}

type delete_index_request = {
  id: string
}

type delete_faq_request = {
  index_id: string;
  id: string
}

type delete_experience_response = unit

type delete_experience_request = {
  index_id: string;
  id: string
}

type delete_data_source_request = {
  index_id: string;
  id: string
}

type delete_access_control_configuration_response = unit

type delete_access_control_configuration_request = {
  id: string;
  index_id: string
}

type data_source_sync_job_metric_target = {
  data_source_sync_job_id: string option;
  data_source_id: string
}

type create_thesaurus_response = {
  id: string option
}

type create_thesaurus_request = {
  client_token: string option;
  source_s3_path: s3_path;
  tags: tag list option;
  role_arn: string;
  description: string option;
  name: string;
  index_id: string
}

type create_query_suggestions_block_list_response = {
  id: string option
}

type create_query_suggestions_block_list_request = {
  tags: tag list option;
  role_arn: string;
  client_token: string option;
  source_s3_path: s3_path;
  description: string option;
  name: string;
  index_id: string
}

type create_index_response = {
  id: string option
}

type create_index_request = {
  user_group_resolution_configuration: user_group_resolution_configuration option;
  user_context_policy: user_context_policy option;
  user_token_configurations: user_token_configuration list option;
  tags: tag list option;
  client_token: string option;
  description: string option;
  server_side_encryption_configuration: server_side_encryption_configuration option;
  role_arn: string;
  edition: index_edition option;
  name: string
}

type create_featured_results_set_response = {
  featured_results_set: featured_results_set option
}

type create_featured_results_set_request = {
  tags: tag list option;
  featured_documents: featured_document list option;
  query_texts: string list option;
  status: featured_results_set_status option;
  client_token: string option;
  description: string option;
  featured_results_set_name: string;
  index_id: string
}

type create_faq_response = {
  id: string option
}

type create_faq_request = {
  language_code: string option;
  client_token: string option;
  file_format: faq_file_format option;
  tags: tag list option;
  role_arn: string;
  s3_path: s3_path;
  description: string option;
  name: string;
  index_id: string
}

type create_experience_response = {
  id: string
}

type create_experience_request = {
  client_token: string option;
  description: string option;
  configuration: experience_configuration option;
  role_arn: string option;
  index_id: string;
  name: string
}

type create_data_source_response = {
  id: string
}

type create_data_source_request = {
  custom_document_enrichment_configuration: custom_document_enrichment_configuration option;
  language_code: string option;
  client_token: string option;
  tags: tag list option;
  role_arn: string option;
  schedule: string option;
  description: string option;
  vpc_configuration: data_source_vpc_configuration option;
  configuration: data_source_configuration option;
  type_: data_source_type;
  index_id: string;
  name: string
}

type create_access_control_configuration_response = {
  id: string
}

type create_access_control_configuration_request = {
  client_token: string option;
  hierarchical_access_control_list: hierarchical_principal list option;
  access_control_list: principal list option;
  description: string option;
  name: string;
  index_id: string
}

type clear_query_suggestions_request = {
  index_id: string
}

type batch_put_document_response_failed_document = {
  error_message: string option;
  error_code: error_code option;
  id: string option
}

type batch_put_document_response = {
  failed_documents: batch_put_document_response_failed_document list option
}

type batch_put_document_request = {
  custom_document_enrichment_configuration: custom_document_enrichment_configuration option;
  documents: document list;
  role_arn: string option;
  index_id: string
}

type batch_get_document_status_response_error = {
  error_message: string option;
  error_code: error_code option;
  document_id: string option
}

type batch_get_document_status_response = {
  document_status_list: status list option;
  errors: batch_get_document_status_response_error list option
}

type batch_get_document_status_request = {
  document_info_list: document_info list;
  index_id: string
}

type batch_delete_featured_results_set_error = {
  error_message: string;
  error_code: error_code;
  id: string
}

type batch_delete_featured_results_set_response = {
  errors: batch_delete_featured_results_set_error list
}

type batch_delete_featured_results_set_request = {
  featured_results_set_ids: string list;
  index_id: string
}

type batch_delete_document_response_failed_document = {
  error_message: string option;
  error_code: error_code option;
  id: string option
}

type batch_delete_document_response = {
  failed_documents: batch_delete_document_response_failed_document list option
}

type batch_delete_document_request = {
  data_source_sync_job_metric_target: data_source_sync_job_metric_target option;
  document_id_list: string list;
  index_id: string
}

type associate_personas_to_entities_response = {
  failed_entity_list: failed_entity list option
}

type associate_personas_to_entities_request = {
  personas: entity_persona_configuration list;
  index_id: string;
  id: string
}

type associate_entities_to_experience_response = {
  failed_entity_list: failed_entity list option
}

type associate_entities_to_experience_request = {
  entity_list: entity_configuration list;
  index_id: string;
  id: string
}



type base_document = Json.t

val make_data_source_to_index_field_mapping :
  ?date_field_format:string ->
  index_field_name:string ->
  data_source_field_name:string ->
  unit
-> data_source_to_index_field_mapping

val make_work_docs_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?use_change_log:bool ->
  ?crawl_comments:bool ->
  organization_id:string ->
  unit -> work_docs_configuration

val make_seed_url_configuration :
  ?web_crawler_mode:web_crawler_mode -> seed_urls:string list -> unit
-> seed_url_configuration

val make_site_maps_configuration : site_maps:string list -> unit
-> site_maps_configuration

val make_urls :
  ?site_maps_configuration:site_maps_configuration ->
  ?seed_url_configuration:seed_url_configuration ->
  unit -> urls

val make_proxy_configuration :
  ?credentials:string -> port:int -> host:string -> unit
-> proxy_configuration

val make_basic_authentication_configuration :
  credentials:string -> port:int -> host:string -> unit
-> basic_authentication_configuration

val make_authentication_configuration :
  ?basic_authentication:basic_authentication_configuration list -> unit
-> authentication_configuration

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
  unit -> web_crawler_configuration

val make_warning : ?code:warning_code -> ?message:string -> unit
-> warning

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

val make_json_token_type_configuration :
  group_attribute_field:string -> user_name_attribute_field:string -> unit
-> json_token_type_configuration

val make_user_token_configuration :
  ?json_token_type_configuration:json_token_type_configuration ->
  ?jwt_token_type_configuration:jwt_token_type_configuration ->
  unit -> user_token_configuration

val make_user_identity_configuration :
  ?identity_attribute_name:string -> unit
-> user_identity_configuration

val make_user_group_resolution_configuration :
  user_group_resolution_mode:user_group_resolution_mode -> unit
-> user_group_resolution_configuration

val make_data_source_group : data_source_id:string -> group_id:string -> unit
-> data_source_group

val make_user_context :
  ?data_source_groups:data_source_group list ->
  ?groups:string list ->
  ?user_id:string ->
  ?token:string ->
  unit -> user_context

val make_s3_path : key:string -> bucket:string -> unit
-> s3_path

val make_update_thesaurus_request :
  ?source_s3_path:s3_path ->
  ?role_arn:string ->
  ?description:string ->
  ?name:string ->
  index_id:string ->
  id:string ->
  unit -> update_thesaurus_request

val make_suggestable_config :
  ?suggestable:bool -> ?attribute_name:string -> unit
-> suggestable_config

val make_attribute_suggestions_update_config :
  ?attribute_suggestions_mode:attribute_suggestions_mode ->
  ?suggestable_config_list:suggestable_config list ->
  unit
-> attribute_suggestions_update_config

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

val make_update_query_suggestions_block_list_request :
  ?role_arn:string ->
  ?source_s3_path:s3_path ->
  ?description:string ->
  ?name:string ->
  id:string ->
  index_id:string ->
  unit -> update_query_suggestions_block_list_request

val make_relevance :
  ?value_importance_map:(string * int) list ->
  ?rank_order:order ->
  ?duration:string ->
  ?importance:int ->
  ?freshness:bool ->
  unit -> relevance

val make_search :
  ?sortable:bool ->
  ?displayable:bool ->
  ?searchable:bool ->
  ?facetable:bool ->
  unit -> search

val make_document_metadata_configuration :
  ?search:search ->
  ?relevance:relevance ->
  type_:document_attribute_value_type ->
  name:string ->
  unit
-> document_metadata_configuration

val make_capacity_units_configuration :
  query_capacity_units:int -> storage_capacity_units:int -> unit
-> capacity_units_configuration

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
  unit -> update_index_request

val make_featured_document : ?id:string -> unit
-> featured_document

val make_featured_results_set :
  ?creation_timestamp:int ->
  ?last_updated_timestamp:int ->
  ?featured_documents:featured_document list ->
  ?query_texts:string list ->
  ?status:featured_results_set_status ->
  ?description:string ->
  ?featured_results_set_name:string ->
  ?featured_results_set_id:string ->
  unit -> featured_results_set

val make_update_featured_results_set_response :
  ?featured_results_set:featured_results_set -> unit
-> update_featured_results_set_response

val make_update_featured_results_set_request :
  ?featured_documents:featured_document list ->
  ?query_texts:string list ->
  ?status:featured_results_set_status ->
  ?description:string ->
  ?featured_results_set_name:string ->
  featured_results_set_id:string ->
  index_id:string ->
  unit -> update_featured_results_set_request

val make_conflicting_item :
  ?set_id:string -> ?set_name:string -> ?query_text:string -> unit
-> conflicting_item

val make_content_source_configuration :
  ?direct_put_content:bool ->
  ?faq_ids:string list ->
  ?data_source_ids:string list ->
  unit -> content_source_configuration

val make_experience_configuration :
  ?user_identity_configuration:user_identity_configuration ->
  ?content_source_configuration:content_source_configuration ->
  unit -> experience_configuration

val make_update_experience_request :
  ?description:string ->
  ?configuration:experience_configuration ->
  ?role_arn:string ->
  ?name:string ->
  index_id:string ->
  id:string ->
  unit
-> update_experience_request

val make_documents_metadata_configuration : ?s3_prefix:string -> unit
-> documents_metadata_configuration

val make_access_control_list_configuration : ?key_path:string -> unit
-> access_control_list_configuration

val make_s3_data_source_configuration :
  ?access_control_list_configuration:access_control_list_configuration ->
  ?documents_metadata_configuration:documents_metadata_configuration ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?inclusion_prefixes:string list ->
  bucket_name:string ->
  unit
-> s3_data_source_configuration

val make_data_source_vpc_configuration :
  security_group_ids:string list -> subnet_ids:string list -> unit
-> data_source_vpc_configuration

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
  unit -> share_point_configuration

val make_connection_configuration :
  secret_arn:string ->
  table_name:string ->
  database_name:string ->
  database_port:int ->
  database_host:string ->
  unit -> connection_configuration

val make_column_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_column_name:string ->
  change_detecting_columns:string list ->
  document_data_column_name:string ->
  document_id_column_name:string ->
  unit -> column_configuration

val make_acl_configuration : allowed_groups_column_name:string -> unit
-> acl_configuration

val make_sql_configuration :
  ?query_identifiers_enclosing_option:query_identifiers_enclosing_option ->
  unit -> sql_configuration

val make_database_configuration :
  ?sql_configuration:sql_configuration ->
  ?acl_configuration:acl_configuration ->
  ?vpc_configuration:data_source_vpc_configuration ->
  column_configuration:column_configuration ->
  connection_configuration:connection_configuration ->
  database_engine_type:database_engine_type ->
  unit
-> database_configuration

val make_salesforce_standard_object_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  document_data_field_name:string ->
  name:salesforce_standard_object_name ->
  unit
-> salesforce_standard_object_configuration

val make_salesforce_standard_knowledge_article_type_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  document_data_field_name:string ->
  unit
-> salesforce_standard_knowledge_article_type_configuration

val make_salesforce_custom_knowledge_article_type_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  document_data_field_name:string ->
  name:string ->
  unit
-> salesforce_custom_knowledge_article_type_configuration

val make_salesforce_knowledge_article_configuration :
  ?custom_knowledge_article_type_configurations:salesforce_custom_knowledge_article_type_configuration list ->
  ?standard_knowledge_article_type_configuration:salesforce_standard_knowledge_article_type_configuration ->
  included_states:salesforce_knowledge_article_state list ->
  unit
-> salesforce_knowledge_article_configuration

val make_salesforce_chatter_feed_configuration :
  ?include_filter_types:salesforce_chatter_feed_include_filter_type list ->
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  document_data_field_name:string ->
  unit
-> salesforce_chatter_feed_configuration

val make_salesforce_standard_object_attachment_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  unit
-> salesforce_standard_object_attachment_configuration

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
  unit -> salesforce_configuration

val make_one_drive_users :
  ?one_drive_user_s3_path:s3_path -> ?one_drive_user_list:string list -> unit
-> one_drive_users

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

val make_service_now_service_catalog_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?document_title_field_name:string ->
  ?exclude_attachment_file_patterns:string list ->
  ?include_attachment_file_patterns:string list ->
  ?crawl_attachments:bool ->
  document_data_field_name:string ->
  unit
-> service_now_service_catalog_configuration

val make_service_now_configuration :
  ?authentication_type:service_now_authentication_type ->
  ?service_catalog_configuration:service_now_service_catalog_configuration ->
  ?knowledge_article_configuration:service_now_knowledge_article_configuration ->
  service_now_build_version:service_now_build_version_type ->
  secret_arn:string ->
  host_url:string ->
  unit
-> service_now_configuration

val make_confluence_space_to_index_field_mapping :
  ?index_field_name:string ->
  ?date_field_format:string ->
  ?data_source_field_name:confluence_space_field_name ->
  unit
-> confluence_space_to_index_field_mapping

val make_confluence_space_configuration :
  ?space_field_mappings:confluence_space_to_index_field_mapping list ->
  ?exclude_spaces:string list ->
  ?include_spaces:string list ->
  ?crawl_archived_spaces:bool ->
  ?crawl_personal_spaces:bool ->
  unit
-> confluence_space_configuration

val make_confluence_page_to_index_field_mapping :
  ?index_field_name:string ->
  ?date_field_format:string ->
  ?data_source_field_name:confluence_page_field_name ->
  unit
-> confluence_page_to_index_field_mapping

val make_confluence_page_configuration :
  ?page_field_mappings:confluence_page_to_index_field_mapping list -> unit
-> confluence_page_configuration

val make_confluence_blog_to_index_field_mapping :
  ?index_field_name:string ->
  ?date_field_format:string ->
  ?data_source_field_name:confluence_blog_field_name ->
  unit
-> confluence_blog_to_index_field_mapping

val make_confluence_blog_configuration :
  ?blog_field_mappings:confluence_blog_to_index_field_mapping list -> unit
-> confluence_blog_configuration

val make_confluence_attachment_to_index_field_mapping :
  ?index_field_name:string ->
  ?date_field_format:string ->
  ?data_source_field_name:confluence_attachment_field_name ->
  unit
-> confluence_attachment_to_index_field_mapping

val make_confluence_attachment_configuration :
  ?attachment_field_mappings:confluence_attachment_to_index_field_mapping list ->
  ?crawl_attachments:bool ->
  unit
-> confluence_attachment_configuration

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
  unit -> confluence_configuration

val make_google_drive_configuration :
  ?exclude_shared_drives:string list ->
  ?exclude_user_accounts:string list ->
  ?exclude_mime_types:string list ->
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  secret_arn:string ->
  unit -> google_drive_configuration

val make_fsx_configuration :
  ?field_mappings:data_source_to_index_field_mapping list ->
  ?exclusion_patterns:string list ->
  ?inclusion_patterns:string list ->
  ?secret_arn:string ->
  vpc_configuration:data_source_vpc_configuration ->
  file_system_type:fsx_file_system_type ->
  file_system_id:string ->
  unit -> fsx_configuration

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
  unit -> slack_configuration

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
  unit -> box_configuration

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
  unit -> quip_configuration

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
  unit -> jira_configuration

val make_saa_s_configuration :
  host_url:string -> organization_name:string -> unit
-> saa_s_configuration

val make_on_premise_configuration :
  ssl_certificate_s3_path:s3_path ->
  organization_name:string ->
  host_url:string ->
  unit
-> on_premise_configuration

val make_git_hub_document_crawl_properties :
  ?crawl_pull_request_comment_attachment:bool ->
  ?crawl_pull_request_comment:bool ->
  ?crawl_pull_request:bool ->
  ?crawl_issue_comment_attachment:bool ->
  ?crawl_issue_comment:bool ->
  ?crawl_issue:bool ->
  ?crawl_repository_documents:bool ->
  unit -> git_hub_document_crawl_properties

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
  unit -> git_hub_configuration

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
  unit -> alfresco_configuration

val make_template_configuration : ?template:template -> unit
-> template_configuration

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
  unit -> data_source_configuration

val make_document_attribute_value :
  ?date_value:float ->
  ?long_value:int ->
  ?string_list_value:string list ->
  ?string_value:string ->
  unit -> document_attribute_value

val make_document_attribute_condition :
  ?condition_on_value:document_attribute_value ->
  operator:condition_operator ->
  condition_document_attribute_key:string ->
  unit -> document_attribute_condition

val make_document_attribute_target :
  ?target_document_attribute_value:document_attribute_value ->
  ?target_document_attribute_value_deletion:bool ->
  ?target_document_attribute_key:string ->
  unit
-> document_attribute_target

val make_inline_custom_document_enrichment_configuration :
  ?document_content_deletion:bool ->
  ?target:document_attribute_target ->
  ?condition:document_attribute_condition ->
  unit
-> inline_custom_document_enrichment_configuration

val make_hook_configuration :
  ?invocation_condition:document_attribute_condition ->
  s3_bucket:string ->
  lambda_arn:string ->
  unit
-> hook_configuration

val make_custom_document_enrichment_configuration :
  ?role_arn:string ->
  ?post_extraction_hook_configuration:hook_configuration ->
  ?pre_extraction_hook_configuration:hook_configuration ->
  ?inline_configurations:inline_custom_document_enrichment_configuration list ->
  unit
-> custom_document_enrichment_configuration

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

val make_update_access_control_configuration_response : unit
-> update_access_control_configuration_response

val make_principal :
  ?data_source_id:string ->
  access:read_access_type ->
  type_:principal_type ->
  name:string ->
  unit -> principal

val make_hierarchical_principal : principal_list:principal list -> unit
-> hierarchical_principal

val make_update_access_control_configuration_request :
  ?hierarchical_access_control_list:hierarchical_principal list ->
  ?access_control_list:principal list ->
  ?description:string ->
  ?name:string ->
  id:string ->
  index_id:string ->
  unit
-> update_access_control_configuration_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request

val make_time_range : ?end_time:float -> ?start_time:float -> unit
-> time_range

val make_thesaurus_summary :
  ?updated_at:float ->
  ?created_at:float ->
  ?status:thesaurus_status ->
  ?name:string ->
  ?id:string ->
  unit -> thesaurus_summary

val make_highlight :
  ?type_:highlight_type ->
  ?top_answer:bool ->
  end_offset:int ->
  begin_offset:int ->
  unit -> highlight

val make_text_with_highlights :
  ?highlights:highlight list -> ?text:string -> unit
-> text_with_highlights

val make_text_document_statistics :
  indexed_text_bytes:int -> indexed_text_documents_count:int -> unit
-> text_document_statistics

val make_tag_resource_response : unit -> tag_resource_response

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request

val make_table_cell :
  ?header:bool ->
  ?highlighted:bool ->
  ?top_answer:bool ->
  ?value:string ->
  unit -> table_cell

val make_table_row : ?cells:table_cell list -> unit
-> table_row

val make_table_excerpt :
  ?total_number_of_rows:int -> ?rows:table_row list -> unit
-> table_excerpt

val make_suggestion_highlight : ?end_offset:int -> ?begin_offset:int -> unit
-> suggestion_highlight

val make_suggestion_text_with_highlights :
  ?highlights:suggestion_highlight list -> ?text:string -> unit
-> suggestion_text_with_highlights

val make_suggestion_value : ?text:suggestion_text_with_highlights -> unit
-> suggestion_value

val make_document_attribute :
  value:document_attribute_value -> key:string -> unit
-> document_attribute

val make_source_document :
  ?additional_attributes:document_attribute list ->
  ?suggestion_attributes:string list ->
  ?document_id:string ->
  unit -> source_document

val make_suggestion :
  ?source_documents:source_document list ->
  ?value:suggestion_value ->
  ?id:string ->
  unit -> suggestion

val make_click_feedback : click_time:float -> result_id:string -> unit
-> click_feedback

val make_relevance_feedback :
  relevance_value:relevance_type -> result_id:string -> unit
-> relevance_feedback

val make_submit_feedback_request :
  ?relevance_feedback_items:relevance_feedback list ->
  ?click_feedback_items:click_feedback list ->
  query_id:string ->
  index_id:string ->
  unit -> submit_feedback_request

val make_stop_data_source_sync_job_request :
  index_id:string -> id:string -> unit
-> stop_data_source_sync_job_request

val make_status :
  ?failure_reason:string ->
  ?failure_code:string ->
  ?document_status:document_status ->
  ?document_id:string ->
  unit -> status

val make_start_data_source_sync_job_response : ?execution_id:string -> unit
-> start_data_source_sync_job_response

val make_start_data_source_sync_job_request :
  index_id:string -> id:string -> unit
-> start_data_source_sync_job_request

val make_spell_correction_configuration :
  include_query_spell_check_suggestions:bool -> unit
-> spell_correction_configuration

val make_correction :
  ?corrected_term:string ->
  ?term:string ->
  ?end_offset:int ->
  ?begin_offset:int ->
  unit -> correction

val make_spell_corrected_query :
  ?corrections:correction list -> ?suggested_query_text:string -> unit
-> spell_corrected_query

val make_sorting_configuration :
  sort_order:sort_order -> document_attribute_key:string -> unit
-> sorting_configuration

val make_server_side_encryption_configuration : ?kms_key_id:string -> unit
-> server_side_encryption_configuration

val make_score_attributes : ?score_confidence:score_confidence -> unit
-> score_attributes

val make_retrieve_result_item :
  ?score_attributes:score_attributes ->
  ?document_attributes:document_attribute list ->
  ?document_ur_i:string ->
  ?content:string ->
  ?document_title:string ->
  ?document_id:string ->
  ?id:string ->
  unit -> retrieve_result_item

val make_retrieve_result :
  ?result_items:retrieve_result_item list -> ?query_id:string -> unit
-> retrieve_result

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
  unit -> attribute_filter

val make_document_relevance_configuration :
  relevance:relevance -> name:string -> unit
-> document_relevance_configuration

val make_retrieve_request :
  ?user_context:user_context ->
  ?page_size:int ->
  ?page_number:int ->
  ?document_relevance_override_configurations:document_relevance_configuration list ->
  ?requested_document_attributes:string list ->
  ?attribute_filter:attribute_filter ->
  query_text:string ->
  index_id:string ->
  unit -> retrieve_request

val make_query_suggestions_block_list_summary :
  ?item_count:int ->
  ?updated_at:float ->
  ?created_at:float ->
  ?status:query_suggestions_block_list_status ->
  ?name:string ->
  ?id:string ->
  unit
-> query_suggestions_block_list_summary

val make_additional_result_attribute_value :
  ?text_with_highlights_value:text_with_highlights -> unit
-> additional_result_attribute_value

val make_additional_result_attribute :
  value:additional_result_attribute_value ->
  value_type:additional_result_attribute_value_type ->
  key:string ->
  unit -> additional_result_attribute

val make_expanded_result_item :
  ?document_attributes:document_attribute list ->
  ?document_ur_i:string ->
  ?document_excerpt:text_with_highlights ->
  ?document_title:text_with_highlights ->
  ?document_id:string ->
  ?id:string ->
  unit -> expanded_result_item

val make_collapsed_result_detail :
  ?expanded_results:expanded_result_item list ->
  document_attribute:document_attribute ->
  unit -> collapsed_result_detail

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
  unit -> query_result_item

val make_document_attribute_value_count_pair :
  ?facet_results:facet_result list ->
  ?count:int ->
  ?document_attribute_value:document_attribute_value ->
  unit -> document_attribute_value_count_pair

val make_facet_result :
  ?document_attribute_value_count_pairs:document_attribute_value_count_pair list ->
  ?document_attribute_value_type:document_attribute_value_type ->
  ?document_attribute_key:string ->
  unit -> facet_result

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
  unit -> featured_results_item

val make_query_result :
  ?featured_results_items:featured_results_item list ->
  ?spell_corrected_queries:spell_corrected_query list ->
  ?warnings:warning list ->
  ?total_number_of_results:int ->
  ?facet_results:facet_result list ->
  ?result_items:query_result_item list ->
  ?query_id:string ->
  unit -> query_result

val make_facet :
  ?max_results:int ->
  ?facets:facet list ->
  ?document_attribute_key:string ->
  unit -> facet

val make_expand_configuration :
  ?max_expanded_results_per_item:int ->
  ?max_result_items_to_expand:int ->
  unit -> expand_configuration

val make_collapse_configuration :
  ?expand_configuration:expand_configuration ->
  ?expand:bool ->
  ?missing_attribute_key_strategy:missing_attribute_key_strategy ->
  ?sorting_configurations:sorting_configuration list ->
  document_attribute_key:string ->
  unit -> collapse_configuration

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
  unit -> query_request

val make_member_group : ?data_source_id:string -> group_id:string -> unit
-> member_group

val make_member_user : user_id:string -> unit
-> member_user

val make_group_members :
  ?s3_pathfor_group_members:s3_path ->
  ?member_users:member_user list ->
  ?member_groups:member_group list ->
  unit -> group_members

val make_put_principal_mapping_request :
  ?role_arn:string ->
  ?ordering_id:int ->
  ?data_source_id:string ->
  group_members:group_members ->
  group_id:string ->
  index_id:string ->
  unit -> put_principal_mapping_request

val make_personas_summary :
  ?updated_at:float ->
  ?created_at:float ->
  ?persona:persona ->
  ?entity_id:string ->
  unit -> personas_summary

val make_list_thesauri_response :
  ?thesaurus_summary_items:thesaurus_summary list ->
  ?next_token:string ->
  unit -> list_thesauri_response

val make_list_thesauri_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_thesauri_request

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_list_query_suggestions_block_lists_response :
  ?next_token:string ->
  ?block_list_summary_items:query_suggestions_block_list_summary list ->
  unit
-> list_query_suggestions_block_lists_response

val make_list_query_suggestions_block_lists_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_query_suggestions_block_lists_request

val make_group_summary : ?ordering_id:int -> ?group_id:string -> unit
-> group_summary

val make_index_configuration_summary :
  ?edition:index_edition ->
  ?id:string ->
  ?name:string ->
  status:index_status ->
  updated_at:float ->
  created_at:float ->
  unit -> index_configuration_summary

val make_list_indices_response :
  ?next_token:string ->
  ?index_configuration_summary_items:index_configuration_summary list ->
  unit -> list_indices_response

val make_list_indices_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_indices_request

val make_list_groups_older_than_ordering_id_response :
  ?next_token:string -> ?groups_summaries:group_summary list -> unit
-> list_groups_older_than_ordering_id_response

val make_list_groups_older_than_ordering_id_request :
  ?max_results:int ->
  ?next_token:string ->
  ?data_source_id:string ->
  ordering_id:int ->
  index_id:string ->
  unit
-> list_groups_older_than_ordering_id_request

val make_featured_results_set_summary :
  ?creation_timestamp:int ->
  ?last_updated_timestamp:int ->
  ?status:featured_results_set_status ->
  ?featured_results_set_name:string ->
  ?featured_results_set_id:string ->
  unit
-> featured_results_set_summary

val make_list_featured_results_sets_response :
  ?next_token:string ->
  ?featured_results_set_summary_items:featured_results_set_summary list ->
  unit
-> list_featured_results_sets_response

val make_list_featured_results_sets_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_featured_results_sets_request

val make_faq_summary :
  ?language_code:string ->
  ?file_format:faq_file_format ->
  ?updated_at:float ->
  ?created_at:float ->
  ?status:faq_status ->
  ?name:string ->
  ?id:string ->
  unit -> faq_summary

val make_list_faqs_response :
  ?faq_summary_items:faq_summary list -> ?next_token:string -> unit
-> list_faqs_response

val make_list_faqs_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_faqs_request

val make_experience_endpoint :
  ?endpoint:string -> ?endpoint_type:endpoint_type -> unit
-> experience_endpoint

val make_experiences_summary :
  ?endpoints:experience_endpoint list ->
  ?status:experience_status ->
  ?created_at:float ->
  ?id:string ->
  ?name:string ->
  unit -> experiences_summary

val make_list_experiences_response :
  ?next_token:string -> ?summary_items:experiences_summary list -> unit
-> list_experiences_response

val make_list_experiences_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_experiences_request

val make_entity_display_data :
  ?last_name:string ->
  ?first_name:string ->
  ?identified_user_name:string ->
  ?group_name:string ->
  ?user_name:string ->
  unit -> entity_display_data

val make_experience_entities_summary :
  ?display_data:entity_display_data ->
  ?entity_type:entity_type ->
  ?entity_id:string ->
  unit
-> experience_entities_summary

val make_list_experience_entities_response :
  ?next_token:string ->
  ?summary_items:experience_entities_summary list ->
  unit
-> list_experience_entities_response

val make_list_experience_entities_request :
  ?next_token:string -> index_id:string -> id:string -> unit
-> list_experience_entities_request

val make_list_entity_personas_response :
  ?next_token:string -> ?summary_items:personas_summary list -> unit
-> list_entity_personas_response

val make_list_entity_personas_request :
  ?max_results:int ->
  ?next_token:string ->
  index_id:string ->
  id:string ->
  unit -> list_entity_personas_request

val make_data_source_summary :
  ?language_code:string ->
  ?status:data_source_status ->
  ?updated_at:float ->
  ?created_at:float ->
  ?type_:data_source_type ->
  ?id:string ->
  ?name:string ->
  unit -> data_source_summary

val make_list_data_sources_response :
  ?next_token:string -> ?summary_items:data_source_summary list -> unit
-> list_data_sources_response

val make_list_data_sources_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_data_sources_request

val make_data_source_sync_job_metrics :
  ?documents_scanned:string ->
  ?documents_failed:string ->
  ?documents_deleted:string ->
  ?documents_modified:string ->
  ?documents_added:string ->
  unit -> data_source_sync_job_metrics

val make_data_source_sync_job :
  ?metrics:data_source_sync_job_metrics ->
  ?data_source_error_code:string ->
  ?error_code:error_code ->
  ?error_message:string ->
  ?status:data_source_sync_job_status ->
  ?end_time:float ->
  ?start_time:float ->
  ?execution_id:string ->
  unit -> data_source_sync_job

val make_list_data_source_sync_jobs_response :
  ?next_token:string -> ?history:data_source_sync_job list -> unit
-> list_data_source_sync_jobs_response

val make_list_data_source_sync_jobs_request :
  ?status_filter:data_source_sync_job_status ->
  ?start_time_filter:time_range ->
  ?max_results:int ->
  ?next_token:string ->
  index_id:string ->
  id:string ->
  unit
-> list_data_source_sync_jobs_request

val make_access_control_configuration_summary : id:string -> unit
-> access_control_configuration_summary

val make_list_access_control_configurations_response :
  ?next_token:string ->
  access_control_configurations:access_control_configuration_summary list ->
  unit
-> list_access_control_configurations_response

val make_list_access_control_configurations_request :
  ?max_results:int -> ?next_token:string -> index_id:string -> unit
-> list_access_control_configurations_request

val make_faq_statistics : indexed_question_answers_count:int -> unit
-> faq_statistics

val make_index_statistics :
  text_document_statistics:text_document_statistics ->
  faq_statistics:faq_statistics ->
  unit -> index_statistics

val make_group_ordering_id_summary :
  ?failure_reason:string ->
  ?ordering_id:int ->
  ?received_at:float ->
  ?last_updated_at:float ->
  ?status:principal_mapping_status ->
  unit -> group_ordering_id_summary

val make_get_snapshots_response :
  ?next_token:string ->
  ?snapshots_data:string list list ->
  ?snapshots_data_header:string list ->
  ?snap_shot_time_filter:time_range ->
  unit -> get_snapshots_response

val make_get_snapshots_request :
  ?max_results:int ->
  ?next_token:string ->
  metric_type:metric_type ->
  interval:interval ->
  index_id:string ->
  unit -> get_snapshots_request

val make_get_query_suggestions_response :
  ?suggestions:suggestion list -> ?query_suggestions_id:string -> unit
-> get_query_suggestions_response

val make_attribute_suggestions_get_config :
  ?user_context:user_context ->
  ?attribute_filter:attribute_filter ->
  ?additional_response_attributes:string list ->
  ?suggestion_attributes:string list ->
  unit
-> attribute_suggestions_get_config

val make_get_query_suggestions_request :
  ?attribute_suggestions_config:attribute_suggestions_get_config ->
  ?suggestion_types:suggestion_type list ->
  ?max_suggestions_count:int ->
  query_text:string ->
  index_id:string ->
  unit
-> get_query_suggestions_request

val make_featured_document_with_metadata :
  ?ur_i:string -> ?title:string -> ?id:string -> unit
-> featured_document_with_metadata

val make_featured_document_missing : ?id:string -> unit
-> featured_document_missing

val make_failed_entity : ?error_message:string -> ?entity_id:string -> unit
-> failed_entity

val make_entity_persona_configuration :
  persona:persona -> entity_id:string -> unit
-> entity_persona_configuration

val make_entity_configuration :
  entity_type:entity_type -> entity_id:string -> unit
-> entity_configuration

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
  unit -> document

val make_document_info :
  ?attributes:document_attribute list -> document_id:string -> unit
-> document_info

val make_disassociate_personas_from_entities_response :
  ?failed_entity_list:failed_entity list -> unit
-> disassociate_personas_from_entities_response

val make_disassociate_personas_from_entities_request :
  entity_ids:string list -> index_id:string -> id:string -> unit
-> disassociate_personas_from_entities_request

val make_disassociate_entities_from_experience_response :
  ?failed_entity_list:failed_entity list -> unit
-> disassociate_entities_from_experience_response

val make_disassociate_entities_from_experience_request :
  entity_list:entity_configuration list ->
  index_id:string ->
  id:string ->
  unit
-> disassociate_entities_from_experience_request

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
  unit -> describe_thesaurus_response

val make_describe_thesaurus_request : index_id:string -> id:string -> unit
-> describe_thesaurus_request

val make_attribute_suggestions_describe_config :
  ?attribute_suggestions_mode:attribute_suggestions_mode ->
  ?suggestable_config_list:suggestable_config list ->
  unit
-> attribute_suggestions_describe_config

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

val make_describe_query_suggestions_config_request : index_id:string -> unit
-> describe_query_suggestions_config_request

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

val make_describe_query_suggestions_block_list_request :
  id:string -> index_id:string -> unit
-> describe_query_suggestions_block_list_request

val make_describe_principal_mapping_response :
  ?group_ordering_id_summaries:group_ordering_id_summary list ->
  ?group_id:string ->
  ?data_source_id:string ->
  ?index_id:string ->
  unit
-> describe_principal_mapping_response

val make_describe_principal_mapping_request :
  ?data_source_id:string -> group_id:string -> index_id:string -> unit
-> describe_principal_mapping_request

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
  unit -> describe_index_response

val make_describe_index_request : id:string -> unit
-> describe_index_request

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

val make_describe_featured_results_set_request :
  featured_results_set_id:string -> index_id:string -> unit
-> describe_featured_results_set_request

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
  unit -> describe_faq_response

val make_describe_faq_request : index_id:string -> id:string -> unit
-> describe_faq_request

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
  unit -> describe_experience_response

val make_describe_experience_request : index_id:string -> id:string -> unit
-> describe_experience_request

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

val make_describe_data_source_request : index_id:string -> id:string -> unit
-> describe_data_source_request

val make_describe_access_control_configuration_response :
  ?hierarchical_access_control_list:hierarchical_principal list ->
  ?access_control_list:principal list ->
  ?error_message:string ->
  ?description:string ->
  name:string ->
  unit
-> describe_access_control_configuration_response

val make_describe_access_control_configuration_request :
  id:string -> index_id:string -> unit
-> describe_access_control_configuration_request

val make_delete_thesaurus_request : index_id:string -> id:string -> unit
-> delete_thesaurus_request

val make_delete_query_suggestions_block_list_request :
  id:string -> index_id:string -> unit
-> delete_query_suggestions_block_list_request

val make_delete_principal_mapping_request :
  ?ordering_id:int ->
  ?data_source_id:string ->
  group_id:string ->
  index_id:string ->
  unit -> delete_principal_mapping_request

val make_delete_index_request : id:string -> unit
-> delete_index_request

val make_delete_faq_request : index_id:string -> id:string -> unit
-> delete_faq_request

val make_delete_experience_response : unit
-> delete_experience_response

val make_delete_experience_request : index_id:string -> id:string -> unit
-> delete_experience_request

val make_delete_data_source_request : index_id:string -> id:string -> unit
-> delete_data_source_request

val make_delete_access_control_configuration_response : unit
-> delete_access_control_configuration_response

val make_delete_access_control_configuration_request :
  id:string -> index_id:string -> unit
-> delete_access_control_configuration_request

val make_data_source_sync_job_metric_target :
  ?data_source_sync_job_id:string -> data_source_id:string -> unit
-> data_source_sync_job_metric_target

val make_create_thesaurus_response : ?id:string -> unit
-> create_thesaurus_response

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

val make_create_query_suggestions_block_list_response : ?id:string -> unit
-> create_query_suggestions_block_list_response

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

val make_create_index_response : ?id:string -> unit
-> create_index_response

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
  unit -> create_index_request

val make_create_featured_results_set_response :
  ?featured_results_set:featured_results_set -> unit
-> create_featured_results_set_response

val make_create_featured_results_set_request :
  ?tags:tag list ->
  ?featured_documents:featured_document list ->
  ?query_texts:string list ->
  ?status:featured_results_set_status ->
  ?client_token:string ->
  ?description:string ->
  featured_results_set_name:string ->
  index_id:string ->
  unit -> create_featured_results_set_request

val make_create_faq_response : ?id:string -> unit
-> create_faq_response

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
  unit -> create_faq_request

val make_create_experience_response : id:string -> unit
-> create_experience_response

val make_create_experience_request :
  ?client_token:string ->
  ?description:string ->
  ?configuration:experience_configuration ->
  ?role_arn:string ->
  index_id:string ->
  name:string ->
  unit -> create_experience_request

val make_create_data_source_response : id:string -> unit
-> create_data_source_response

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

val make_create_access_control_configuration_response : id:string -> unit
-> create_access_control_configuration_response

val make_create_access_control_configuration_request :
  ?client_token:string ->
  ?hierarchical_access_control_list:hierarchical_principal list ->
  ?access_control_list:principal list ->
  ?description:string ->
  name:string ->
  index_id:string ->
  unit
-> create_access_control_configuration_request

val make_clear_query_suggestions_request : index_id:string -> unit
-> clear_query_suggestions_request

val make_batch_put_document_response_failed_document :
  ?error_message:string -> ?error_code:error_code -> ?id:string -> unit
-> batch_put_document_response_failed_document

val make_batch_put_document_response :
  ?failed_documents:batch_put_document_response_failed_document list -> unit
-> batch_put_document_response

val make_batch_put_document_request :
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration ->
  ?role_arn:string ->
  documents:document list ->
  index_id:string ->
  unit
-> batch_put_document_request

val make_batch_get_document_status_response_error :
  ?error_message:string ->
  ?error_code:error_code ->
  ?document_id:string ->
  unit
-> batch_get_document_status_response_error

val make_batch_get_document_status_response :
  ?document_status_list:status list ->
  ?errors:batch_get_document_status_response_error list ->
  unit
-> batch_get_document_status_response

val make_batch_get_document_status_request :
  document_info_list:document_info list -> index_id:string -> unit
-> batch_get_document_status_request

val make_batch_delete_featured_results_set_error :
  error_message:string -> error_code:error_code -> id:string -> unit
-> batch_delete_featured_results_set_error

val make_batch_delete_featured_results_set_response :
  errors:batch_delete_featured_results_set_error list -> unit
-> batch_delete_featured_results_set_response

val make_batch_delete_featured_results_set_request :
  featured_results_set_ids:string list -> index_id:string -> unit
-> batch_delete_featured_results_set_request

val make_batch_delete_document_response_failed_document :
  ?error_message:string -> ?error_code:error_code -> ?id:string -> unit
-> batch_delete_document_response_failed_document

val make_batch_delete_document_response :
  ?failed_documents:batch_delete_document_response_failed_document list ->
  unit
-> batch_delete_document_response

val make_batch_delete_document_request :
  ?data_source_sync_job_metric_target:data_source_sync_job_metric_target ->
  document_id_list:string list ->
  index_id:string ->
  unit
-> batch_delete_document_request

val make_associate_personas_to_entities_response :
  ?failed_entity_list:failed_entity list -> unit
-> associate_personas_to_entities_response

val make_associate_personas_to_entities_request :
  personas:entity_persona_configuration list ->
  index_id:string ->
  id:string ->
  unit
-> associate_personas_to_entities_request

val make_associate_entities_to_experience_response :
  ?failed_entity_list:failed_entity list -> unit
-> associate_entities_to_experience_response

val make_associate_entities_to_experience_request :
  entity_list:entity_configuration list ->
  index_id:string ->
  id:string ->
  unit
-> associate_entities_to_experience_request

module UpdateThesaurus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_thesaurus_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateQuerySuggestionsConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      update_query_suggestions_config_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateQuerySuggestionsBlockList : sig
  val request :
    Smaws_Lib.Context.t ->
      update_query_suggestions_block_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateIndex : sig
  val request :
    Smaws_Lib.Context.t ->
      update_index_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateFeaturedResultsSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_featured_results_set_request ->
        (update_featured_results_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `FeaturedResultsConflictException of featured_results_conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateExperience : sig
  val request :
    Smaws_Lib.Context.t ->
      update_experience_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateDataSource : sig
  val request :
    Smaws_Lib.Context.t ->
      update_data_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateAccessControlConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_access_control_configuration_request ->
        (update_access_control_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            | `ThrottlingException of throttling_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module SubmitFeedback : sig
  val request :
    Smaws_Lib.Context.t ->
      submit_feedback_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module StopDataSourceSyncJob : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_data_source_sync_job_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module StartDataSourceSyncJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_data_source_sync_job_request ->
        (start_data_source_sync_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module Retrieve : sig
  val request :
    Smaws_Lib.Context.t ->
      retrieve_request ->
        (retrieve_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module Query : sig
  val request :
    Smaws_Lib.Context.t ->
      query_request ->
        (query_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module PutPrincipalMapping : sig
  val request :
    Smaws_Lib.Context.t ->
      put_principal_mapping_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListThesauri : sig
  val request :
    Smaws_Lib.Context.t ->
      list_thesauri_request ->
        (list_thesauri_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListQuerySuggestionsBlockLists : sig
  val request :
    Smaws_Lib.Context.t ->
      list_query_suggestions_block_lists_request ->
        (list_query_suggestions_block_lists_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListIndices : sig
  val request :
    Smaws_Lib.Context.t ->
      list_indices_request ->
        (list_indices_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListGroupsOlderThanOrderingId : sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_older_than_ordering_id_request ->
        (list_groups_older_than_ordering_id_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListFeaturedResultsSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_featured_results_sets_request ->
        (list_featured_results_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListFaqs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_faqs_request ->
        (list_faqs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListExperiences : sig
  val request :
    Smaws_Lib.Context.t ->
      list_experiences_request ->
        (list_experiences_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListExperienceEntities : sig
  val request :
    Smaws_Lib.Context.t ->
      list_experience_entities_request ->
        (list_experience_entities_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListEntityPersonas : sig
  val request :
    Smaws_Lib.Context.t ->
      list_entity_personas_request ->
        (list_entity_personas_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListDataSources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_data_sources_request ->
        (list_data_sources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListDataSourceSyncJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_data_source_sync_jobs_request ->
        (list_data_source_sync_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListAccessControlConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_control_configurations_request ->
        (list_access_control_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_snapshots_request ->
        (get_snapshots_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetQuerySuggestions : sig
  val request :
    Smaws_Lib.Context.t ->
      get_query_suggestions_request ->
        (get_query_suggestions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DisassociatePersonasFromEntities : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_personas_from_entities_request ->
        (disassociate_personas_from_entities_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DisassociateEntitiesFromExperience : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_entities_from_experience_request ->
        (disassociate_entities_from_experience_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeThesaurus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_thesaurus_request ->
        (describe_thesaurus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeQuerySuggestionsConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_query_suggestions_config_request ->
        (describe_query_suggestions_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeQuerySuggestionsBlockList : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_query_suggestions_block_list_request ->
        (describe_query_suggestions_block_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribePrincipalMapping : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_principal_mapping_request ->
        (describe_principal_mapping_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeIndex : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_index_request ->
        (describe_index_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeFeaturedResultsSet : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_featured_results_set_request ->
        (describe_featured_results_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeFaq : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_faq_request ->
        (describe_faq_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeExperience : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_experience_request ->
        (describe_experience_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeDataSource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_data_source_request ->
        (describe_data_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DescribeAccessControlConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_access_control_configuration_request ->
        (describe_access_control_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteThesaurus : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_thesaurus_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteQuerySuggestionsBlockList : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_query_suggestions_block_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeletePrincipalMapping : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_principal_mapping_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteIndex : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_index_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteFaq : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_faq_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteExperience : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_experience_request ->
        (delete_experience_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteDataSource : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_data_source_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteAccessControlConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_control_configuration_request ->
        (delete_access_control_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateThesaurus : sig
  val request :
    Smaws_Lib.Context.t ->
      create_thesaurus_request ->
        (create_thesaurus_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateQuerySuggestionsBlockList : sig
  val request :
    Smaws_Lib.Context.t ->
      create_query_suggestions_block_list_request ->
        (create_query_suggestions_block_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateIndex : sig
  val request :
    Smaws_Lib.Context.t ->
      create_index_request ->
        (create_index_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceAlreadyExistException of resource_already_exist_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateFeaturedResultsSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_featured_results_set_request ->
        (create_featured_results_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `FeaturedResultsConflictException of featured_results_conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateFaq : sig
  val request :
    Smaws_Lib.Context.t ->
      create_faq_request ->
        (create_faq_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateExperience : sig
  val request :
    Smaws_Lib.Context.t ->
      create_experience_request ->
        (create_experience_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateDataSource : sig
  val request :
    Smaws_Lib.Context.t ->
      create_data_source_request ->
        (create_data_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceAlreadyExistException of resource_already_exist_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateAccessControlConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_access_control_configuration_request ->
        (create_access_control_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ClearQuerySuggestions : sig
  val request :
    Smaws_Lib.Context.t ->
      clear_query_suggestions_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchPutDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_put_document_request ->
        (batch_put_document_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchGetDocumentStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_document_status_request ->
        (batch_get_document_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchDeleteFeaturedResultsSet : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_delete_featured_results_set_request ->
        (batch_delete_featured_results_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchDeleteDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_delete_document_request ->
        (batch_delete_document_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module AssociatePersonasToEntities : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_personas_to_entities_request ->
        (associate_personas_to_entities_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceAlreadyExistException of resource_already_exist_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module AssociateEntitiesToExperience : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_entities_to_experience_request ->
        (associate_entities_to_experience_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `ResourceAlreadyExistException of resource_already_exist_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

