open Smaws_Lib
let service =
  Service.{
    namespace = "kendra";
    endpointPrefix = "kendra";
    version = "2019-02-03";
    protocol = AwsJson_1_1
  };

(**{|
    Maps attributes or field names of the documents synced from the data
    source to Amazon Kendra index field names. You can set up field mappings
    for each data source when calling
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_CreateDataSource.html }CreateDataSource}
    or
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_UpdateDataSource.html }UpdateDataSource}
    API. To create custom fields, use the [UpdateIndex] API to first create
    an index field and then map to the data source field. For more
    information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}.|}*)
type data_source_to_index_field_mapping = {
  index_field_name: string;
   (**{|
    The name of the index field to map to the data source field. The index
    field type must match the data source field type.|}*)

  date_field_format: string option;
   (**{|
    The format for date fields in the data source. If the field specified in
    [DataSourceFieldName] is a date field, you must specify the date format.
    If the field is not a date field, an exception is thrown.|}*)

  data_source_field_name: string;
   (**{|
    The name of the field in the data source. You must first create the index
    field using the [UpdateIndex] API.|}*)

}

(**{|
    Provides the configuration information to connect to Amazon WorkDocs as
    your data source.
    
    Amazon WorkDocs connector is available in Oregon, North Virginia, Sydney,
    Singapore and Ireland regions.|}*)
type work_docs_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map Amazon
    WorkDocs data source attributes or field names to Amazon Kendra index
    field names. To create custom fields, use the [UpdateIndex] API before
    you map to Amazon WorkDocs fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Amazon WorkDocs data source field names must
    exist in your Amazon WorkDocs custom metadata.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain files in your
    Amazon WorkDocs site repository. Files that match the patterns are
    excluded from the index. Files that don’t match the patterns are
    included in the index. If a file matches both an inclusion and exclusion
    pattern, the exclusion pattern takes precedence and the file isn't
    included in the index.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain files in your
    Amazon WorkDocs site repository. Files that match the patterns are
    included in the index. Files that don't match the patterns are excluded
    from the index. If a file matches both an inclusion and exclusion
    pattern, the exclusion pattern takes precedence and the file isn't
    included in the index.|}*)

  use_change_log: bool option;
   (**{|
    [TRUE] to use the Amazon WorkDocs change log to determine which documents
    require updating in the index. Depending on the change log's size, it may
    take longer for Amazon Kendra to use the change log than to scan all of
    your documents in Amazon WorkDocs.|}*)

  crawl_comments: bool option;
   (**{|
    [TRUE] to include comments on documents in your index. Including comments
    in your index means each comment is a document that can be searched on.
    
    The default is set to [FALSE].|}*)

  organization_id: string;
   (**{|
    The identifier of the directory corresponding to your Amazon WorkDocs
    site repository.
    
    You can find the organization ID in the
    {{: https://console.aws.amazon.com/directoryservicev2/ }Directory
    Service} by going to {b Active Directory}, then {b Directories}. Your
    Amazon WorkDocs site directory has an ID, which is the organization ID.
    You can also set up a new Amazon WorkDocs directory in the Directory
    Service console and enable a Amazon WorkDocs site for the directory in
    the Amazon WorkDocs console.|}*)

}

type web_crawler_mode = | EVERYTHING
  | SUBDOMAINS
  | HOST_ONLY

(**{|
    Provides the configuration information for the seed or starting point
    URLs to crawl.
    
    {i When selecting websites to index, you must adhere to the
    {{: https://aws.amazon.com/aup/ }Amazon Acceptable Use Policy} and all
    other Amazon terms. Remember that you must only use Amazon Kendra Web
    Crawler to index your own web pages, or web pages that you have
    authorization to index.}|}*)
type seed_url_configuration = {
  web_crawler_mode: web_crawler_mode option;
   (**{|
    You can choose one of the following modes:
    
    {ol 
          {- [HOST_ONLY]—crawl only the website host names. For example, if
             the seed URL is "abc.example.com", then only URLs with host name
             "abc.example.com" are crawled.
             }
          
          {- [SUBDOMAINS]—crawl the website host names with subdomains. For
             example, if the seed URL is "abc.example.com", then
             "a.abc.example.com" and "b.abc.example.com" are also crawled.
             }
          
          {- [EVERYTHING]—crawl the website host names with subdomains and
             other domains that the web pages link to.
             }
          
    }
    
    The default mode is set to [HOST_ONLY].|}*)

  seed_urls: string list;
   (**{|
    The list of seed or starting point URLs of the websites you want to crawl.
    
    The list can include a maximum of 100 seed URLs.|}*)

}

(**{|
    Provides the configuration information for the sitemap URLs to crawl.
    
    {i When selecting websites to index, you must adhere to the
    {{: https://aws.amazon.com/aup/ }Amazon Acceptable Use Policy} and all
    other Amazon terms. Remember that you must only use Amazon Kendra Web
    Crawler to index your own web pages, or web pages that you have
    authorization to index.}|}*)
type site_maps_configuration = {
  site_maps: string list;
   (**{|
    The list of sitemap URLs of the websites you want to crawl.
    
    The list can include a maximum of three sitemap URLs.|}*)

}

(**{|
    Provides the configuration information of the URLs to crawl.
    
    You can only crawl websites that use the secure communication protocol,
    Hypertext Transfer Protocol Secure (HTTPS). If you receive an error when
    crawling a website, it could be that the website is blocked from
    crawling.
    
    {i When selecting websites to index, you must adhere to the
    {{: https://aws.amazon.com/aup/ }Amazon Acceptable Use Policy} and all
    other Amazon terms. Remember that you must only use Amazon Kendra Web
    Crawler to index your own web pages, or web pages that you have
    authorization to index.}|}*)
type urls = {
  site_maps_configuration: site_maps_configuration option;
   (**{|
    Configuration of the sitemap URLs of the websites you want to crawl.
    
    Only URLs belonging to the same website host names are crawled. You can
    list up to three sitemap URLs.|}*)

  seed_url_configuration: seed_url_configuration option;
   (**{|
    Configuration of the seed or starting point URLs of the websites you want
    to crawl.
    
    You can choose to crawl only the website host names, or the website host
    names with subdomains, or the website host names with subdomains and
    other domains that the web pages link to.
    
    You can list up to 100 seed URLs.|}*)

}

(**{|
    Provides the configuration information for a web proxy to connect to
    website hosts.|}*)
type proxy_configuration = {
  credentials: string option;
   (**{|
    Your secret ARN, which you can create in
    {{: https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html }Secrets
    Manager}
    
    The credentials are optional. You use a secret if web proxy credentials
    are required to connect to a website host. Amazon Kendra currently
    support basic authentication to connect to a web proxy server. The secret
    stores your credentials.|}*)

  port: int;
   (**{|
    The port number of the website host you want to connect to via a web
    proxy server.
    
    For example, the port for https://a.example.com/page1.html is 443, the
    standard port for HTTPS.|}*)

  host: string;
   (**{|
    The name of the website host you want to connect to via a web proxy
    server.
    
    For example, the host name of https://a.example.com/page1.html is
    "a.example.com".|}*)

}

(**{|
    Provides the configuration information to connect to websites that
    require basic user authentication.|}*)
type basic_authentication_configuration = {
  credentials: string;
   (**{|
    Your secret ARN, which you can create in
    {{: https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html }Secrets
    Manager}
    
    You use a secret if basic authentication credentials are required to
    connect to a website. The secret stores your credentials of user name and
    password.|}*)

  port: int;
   (**{|
    The port number of the website host you want to connect to using
    authentication credentials.
    
    For example, the port for https://a.example.com/page1.html is 443, the
    standard port for HTTPS.|}*)

  host: string;
   (**{|
    The name of the website host you want to connect to using authentication
    credentials.
    
    For example, the host name of https://a.example.com/page1.html is
    "a.example.com".|}*)

}

(**{|
    Provides the configuration information to connect to websites that
    require user authentication.|}*)
type authentication_configuration = {
  basic_authentication: basic_authentication_configuration list option;
   (**{|
    The list of configuration information that's required to connect to and
    crawl a website host using basic authentication credentials.
    
    The list includes the name and port number of the website host.|}*)

}

(**{|
    Provides the configuration information required for Amazon Kendra Web
    Crawler.|}*)
type web_crawler_configuration = {
  authentication_configuration: authentication_configuration option;
   (**{|
    Configuration information required to connect to websites using
    authentication.
    
    You can connect to websites using basic authentication of user name and
    password. You use a secret in
    {{: https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html }Secrets
    Manager} to store your authentication credentials.
    
    You must provide the website host name and port number. For example, the
    host name of https://a.example.com/page1.html is "a.example.com" and the
    port is 443, the standard port for HTTPS.|}*)

  proxy_configuration: proxy_configuration option;
   (**{|
    Configuration information required to connect to your internal websites
    via a web proxy.
    
    You must provide the website host name and port number. For example, the
    host name of https://a.example.com/page1.html is "a.example.com" and the
    port is 443, the standard port for HTTPS.
    
    Web proxy credentials are optional and you can use them to connect to a
    web proxy server that requires basic authentication. To store web proxy
    credentials, you use a secret in
    {{: https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html }Secrets
    Manager}.|}*)

  url_exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain URLs to crawl.
    URLs that match the patterns are excluded from the index. URLs that don't
    match the patterns are included in the index. If a URL matches both an
    inclusion and exclusion pattern, the exclusion pattern takes precedence
    and the URL file isn't included in the index.|}*)

  url_inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain URLs to crawl.
    URLs that match the patterns are included in the index. URLs that don't
    match the patterns are excluded from the index. If a URL matches both an
    inclusion and exclusion pattern, the exclusion pattern takes precedence
    and the URL file isn't included in the index.|}*)

  max_urls_per_minute_crawl_rate: int option;
   (**{|
    The maximum number of URLs crawled per website host per minute.
    
    A minimum of one URL is required.
    
    The default maximum number of URLs crawled per website host per minute is
    300.|}*)

  max_content_size_per_page_in_mega_bytes: float option;
   (**{|
    The maximum size (in MB) of a web page or attachment to crawl.
    
    Files larger than this size (in MB) are skipped/not crawled.
    
    The default maximum size of a web page or attachment is set to 50 MB.|}*)

  max_links_per_page: int option;
   (**{|
    The maximum number of URLs on a web page to include when crawling a
    website. This number is per web page.
    
    As a website’s web pages are crawled, any URLs the web pages link to
    are also crawled. URLs on a web page are crawled in order of appearance.
    
    The default maximum links per page is 100.|}*)

  crawl_depth: int option;
   (**{|
    The 'depth' or number of levels from the seed level to crawl. For
    example, the seed URL page is depth 1 and any hyperlinks on this page
    that are also crawled are depth 2.|}*)

  urls: urls;
   (**{|
    Specifies the seed or starting point URLs of the websites or the sitemap
    URLs of the websites you want to crawl.
    
    You can include website subdomains. You can list up to 100 seed URLs and
    up to three sitemap URLs.
    
    You can only crawl websites that use the secure communication protocol,
    Hypertext Transfer Protocol Secure (HTTPS). If you receive an error when
    crawling a website, it could be that the website is blocked from
    crawling.
    
    {i When selecting websites to index, you must adhere to the
    {{: https://aws.amazon.com/aup/ }Amazon Acceptable Use Policy} and all
    other Amazon terms. Remember that you must only use Amazon Kendra Web
    Crawler to index your own web pages, or web pages that you have
    authorization to index.}|}*)

}

type warning_code = | QUERY_LANGUAGE_INVALID_SYNTAX

(**{|
    The warning code and message that explains a problem with a query.|}*)
type warning = {
  code: warning_code option;
   (**{|
    The code used to show the type of warning for the query.|}*)

  message: string option;
   (**{|
    The message that explains the problem with the query.|}*)

}

(**{|
    The input fails to satisfy the constraints set by the Amazon Kendra
    service. Please provide the correct input and try again.|}*)
type validation_exception = {
  message: string option;
  
}

type key_location = | SECRET_MANAGER
  | URL

(**{|
    Provides the configuration information for the JWT token type.|}*)
type jwt_token_type_configuration = {
  claim_regex: string option;
   (**{|
    The regular expression that identifies the claim.|}*)

  issuer: string option;
   (**{|
    The issuer of the token.|}*)

  group_attribute_field: string option;
   (**{|
    The group attribute field.|}*)

  user_name_attribute_field: string option;
   (**{|
    The user name attribute field.|}*)

  secret_manager_arn: string option;
   (**{|
    The Amazon Resource Name (arn) of the secret.|}*)

  ur_l: string option;
   (**{|
    The signing key URL.|}*)

  key_location: key_location;
   (**{|
    The location of the key.|}*)

}

(**{|
    Provides the configuration information for the JSON token type.|}*)
type json_token_type_configuration = {
  group_attribute_field: string;
   (**{|
    The group attribute field.|}*)

  user_name_attribute_field: string;
   (**{|
    The user name attribute field.|}*)

}

(**{|
    Provides the configuration information for a token.|}*)
type user_token_configuration = {
  json_token_type_configuration: json_token_type_configuration option;
   (**{|
    Information about the JSON token type configuration.|}*)

  jwt_token_type_configuration: jwt_token_type_configuration option;
   (**{|
    Information about the JWT token type configuration.|}*)

}

(**{|
    Provides the configuration information for the identifiers of your users.|}*)
type user_identity_configuration = {
  identity_attribute_name: string option;
   (**{|
    The IAM Identity Center field name that contains the identifiers of your
    users, such as their emails. This is used for
    {{: https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html }user
    context filtering} and for granting access to your Amazon Kendra
    experience. You must set up IAM Identity Center with Amazon Kendra. You
    must include your users and groups in your Access Control List when you
    ingest documents into your index. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/getting-started-aws-sso.html }Getting
    started with an IAM Identity Center identity source}.|}*)

}

type user_group_resolution_mode = | NONE
  | AWS_SSO

(**{|
    Provides the configuration information to get users and groups from an
    IAM Identity Center identity source. This is useful for user context
    filtering, where search results are filtered based on the user or their
    group access to documents. You can also use the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_PutPrincipalMapping.html }PutPrincipalMapping}
    API to map users to their groups so that you only need to provide the
    user ID when you issue the query.
    
    To set up an IAM Identity Center identity source in the console to use
    with Amazon Kendra, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/getting-started-aws-sso.html }Getting
    started with an IAM Identity Center identity source}. You must also grant
    the required permissions to use IAM Identity Center with Amazon Kendra.
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html#iam-roles-aws-sso }IAM
    roles for IAM Identity Center}.
    
    Amazon Kendra currently does not support using
    [UserGroupResolutionConfiguration] with an Amazon Web Services
    organization member account for your IAM Identity Center identify source.
    You must create your index in the management account for the organization
    in order to use [UserGroupResolutionConfiguration].|}*)
type user_group_resolution_configuration = {
  user_group_resolution_mode: user_group_resolution_mode;
   (**{|
    The identity store provider (mode) you want to use to get users and
    groups. IAM Identity Center is currently the only available mode. Your
    users and groups must exist in an IAM Identity Center identity source in
    order to use this mode.|}*)

}

type user_context_policy = | USER_TOKEN
  | ATTRIBUTE_FILTER

(**{|
    Data source information for user context filtering.|}*)
type data_source_group = {
  data_source_id: string;
   (**{|
    The identifier of the data source group you want to add to your list of
    data source groups. This is for filtering search results based on the
    groups' access to documents in that data source.|}*)

  group_id: string;
   (**{|
    The identifier of the group you want to add to your list of groups. This
    is for filtering search results based on the groups' access to documents.|}*)

}

(**{|
    Provides information about the user context for an Amazon Kendra index.
    
    User context filtering is a kind of personalized search with the benefit
    of controlling access to documents. For example, not all teams that
    search the company portal for information should access top-secret
    company documents, nor are these documents relevant to all users. Only
    specific users or groups of teams given access to top-secret documents
    should see these documents in their search results.
    
    You provide one of the following:
    
    {ol 
          {- User token
             }
          
          {- User ID, the groups the user belongs to, and any data sources
             the groups can access.
             }
          
    }
    
    If you provide both, an exception is thrown.|}*)
type user_context = {
  data_source_groups: data_source_group list option;
   (**{|
    The list of data source groups you want to filter search results based on
    groups' access to documents in that data source.|}*)

  groups: string list option;
   (**{|
    The list of groups you want to filter search results based on the groups'
    access to documents.|}*)

  user_id: string option;
   (**{|
    The identifier of the user you want to filter search results based on
    their access to documents.|}*)

  token: string option;
   (**{|
    The user context token for filtering search results for a user. It must
    be a JWT or a JSON token.|}*)

}

(**{|
    Information required to find a specific file in an Amazon S3 bucket.|}*)
type s3_path = {
  key: string;
   (**{|
    The name of the file.|}*)

  bucket: string;
   (**{|
    The name of the S3 bucket that contains the file.|}*)

}

type update_thesaurus_request = {
  source_s3_path: s3_path option;
  
  role_arn: string option;
   (**{|
    An IAM role that gives Amazon Kendra permissions to access thesaurus file
    specified in [SourceS3Path].|}*)

  description: string option;
   (**{|
    A new description for the thesaurus.|}*)

  index_id: string;
   (**{|
    The identifier of the index for the thesaurus.|}*)

  name: string option;
   (**{|
    A new name for the thesaurus.|}*)

  id: string;
   (**{|
    The identifier of the thesaurus you want to update.|}*)

}

(**{|
    The request was denied due to request throttling. Please reduce the
    number of requests and try again.|}*)
type throttling_exception = {
  message: string option;
  
}

(**{|
    The resource you want to use doesn’t exist. Please check you have
    provided the correct resource and try again.|}*)
type resource_not_found_exception = {
  message: string option;
  
}

(**{|
    An issue occurred with the internal server used for your Amazon Kendra
    service. Please wait a few minutes and try again, or contact
    {{: http://aws.amazon.com/contact-us/ }Support} for help.|}*)
type internal_server_exception = {
  message: string option;
  
}

(**{|
    A conflict occurred with the request. Please fix any inconsistences with
    your resources and try again.|}*)
type conflict_exception = {
  message: string option;
  
}

(**{|
    You don't have sufficient access to perform this action. Please ensure
    you have the required permission policies and user accounts and try
    again.|}*)
type access_denied_exception = {
  message: string option;
  
}

type mode = | LEARN_ONLY
  | ENABLED

(**{|
    Provides the configuration information for a document field/attribute
    that you want to base query suggestions on.|}*)
type suggestable_config = {
  suggestable: bool option;
   (**{|
    [TRUE] means the document field/attribute is suggestible, so the contents
    within the field can be used for query suggestions.|}*)

  attribute_name: string option;
   (**{|
    The name of the document field/attribute.|}*)

}

type attribute_suggestions_mode = | INACTIVE
  | ACTIVE

(**{|
    Updates the configuration information for the document fields/attributes
    that you want to base query suggestions on.
    
    To deactivate using documents fields for query suggestions, set the mode
    to [INACTIVE]. You must also set [SuggestionTypes] as either [QUERY] or
    [DOCUMENT_ATTRIBUTES] and then call
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html }GetQuerySuggestions}.
    If you set to [QUERY], then Amazon Kendra uses the query history to base
    suggestions on. If you set to [DOCUMENT_ATTRIBUTES], then Amazon Kendra
    uses the contents of document fields to base suggestions on.|}*)
type attribute_suggestions_update_config = {
  attribute_suggestions_mode: attribute_suggestions_mode option;
   (**{|
    You can set the mode to [ACTIVE] or [INACTIVE]. You must also set
    [SuggestionTypes] as either [QUERY] or [DOCUMENT_ATTRIBUTES] and then
    call
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html }GetQuerySuggestions}.
    If [Mode] to use query history is set to [ENABLED] when calling
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html }UpdateQuerySuggestionsConfig}
    and [AttributeSuggestionsMode] to use fields/attributes is set to
    [ACTIVE], and you haven't set your [SuggestionTypes] preference to
    [DOCUMENT_ATTRIBUTES], then Amazon Kendra uses the query history.|}*)

  suggestable_config_list: suggestable_config list option;
   (**{|
    The list of fields/attributes that you want to set as suggestible for
    query suggestions.|}*)

}

type update_query_suggestions_config_request = {
  attribute_suggestions_config: attribute_suggestions_update_config option;
   (**{|
    Configuration information for the document fields/attributes that you
    want to base query suggestions on.|}*)

  minimum_query_count: int option;
   (**{|
    The the minimum number of times a query must be searched in order to be
    eligible to suggest to your users.
    
    Decreasing this number increases the number of suggestions. However, this
    affects the quality of suggestions as it sets a low bar for a query to be
    considered popular to suggest to users.
    
    How you tune this setting depends on your specific needs.|}*)

  minimum_number_of_querying_users: int option;
   (**{|
    The minimum number of unique users who must search a query in order for
    the query to be eligible to suggest to your users.
    
    Increasing this number might decrease the number of suggestions. However,
    this ensures a query is searched by many users and is truly popular to
    suggest to users.
    
    How you tune this setting depends on your specific needs.|}*)

  include_queries_without_user_information: bool option;
   (**{|
    [TRUE] to include queries without user information (i.e. all queries,
    irrespective of the user), otherwise [FALSE] to only include queries with
    user information.
    
    If you pass user information to Amazon Kendra along with the queries, you
    can set this flag to [FALSE] and instruct Amazon Kendra to only consider
    queries with user information.
    
    If you set to [FALSE], Amazon Kendra only considers queries searched at
    least [MinimumQueryCount] times across [MinimumNumberOfQueryingUsers]
    unique users for suggestions.
    
    If you set to [TRUE], Amazon Kendra ignores all user information and
    learns from all queries.|}*)

  query_log_look_back_window_in_days: int option;
   (**{|
    How recent your queries are in your query log time window.
    
    The time window is the number of days from current day to past days.
    
    By default, Amazon Kendra sets this to 180.|}*)

  mode: mode option;
   (**{|
    Set the mode to [ENABLED] or [LEARN_ONLY].
    
    By default, Amazon Kendra enables query suggestions. [LEARN_ONLY] mode
    allows you to turn off query suggestions. You can to update this at any
    time.
    
    In [LEARN_ONLY] mode, Amazon Kendra continues to learn from new queries
    to keep suggestions up to date for when you are ready to switch to
    ENABLED mode again.|}*)

  index_id: string;
   (**{|
    The identifier of the index with query suggestions you want to update.|}*)

}

type update_query_suggestions_block_list_request = {
  role_arn: string option;
   (**{|
    The IAM (Identity and Access Management) role used to access the block
    list text file in S3.|}*)

  source_s3_path: s3_path option;
   (**{|
    The S3 path where your block list text file sits in S3.
    
    If you update your block list and provide the same path to the block list
    text file in S3, then Amazon Kendra reloads the file to refresh the block
    list. Amazon Kendra does not automatically refresh your block list. You
    need to call the [UpdateQuerySuggestionsBlockList] API to refresh you
    block list.
    
    If you update your block list, then Amazon Kendra asynchronously
    refreshes all query suggestions with the latest content in the S3 file.
    This means changes might not take effect immediately.|}*)

  description: string option;
   (**{|
    A new description for the block list.|}*)

  name: string option;
   (**{|
    A new name for the block list.|}*)

  id: string;
   (**{|
    The identifier of the block list you want to update.|}*)

  index_id: string;
   (**{|
    The identifier of the index for the block list.|}*)

}

type document_attribute_value_type = | DATE_VALUE
  | LONG_VALUE
  | STRING_LIST_VALUE
  | STRING_VALUE

type order = | DESCENDING
  | ASCENDING

(**{|
    Provides information for tuning the relevance of a field in a search.
    When a query includes terms that match the field, the results are given a
    boost in the response based on these tuning parameters.|}*)
type relevance = {
  value_importance_map: (string * int) list option;
   (**{|
    A list of values that should be given a different boost when they appear
    in the result list. For example, if you are boosting a field called
    "department", query terms that match the department field are boosted in
    the result. However, you can add entries from the department field to
    boost documents with those values higher.
    
    For example, you can add entries to the map with names of departments. If
    you add "HR",5 and "Legal",3 those departments are given special
    attention when they appear in the metadata of a document. When those
    terms appear they are given the specified importance instead of the
    regular importance for the boost.|}*)

  rank_order: order option;
   (**{|
    Determines how values should be interpreted.
    
    When the [RankOrder] field is [ASCENDING], higher numbers are better. For
    example, a document with a rating score of 10 is higher ranking than a
    document with a rating score of 1.
    
    When the [RankOrder] field is [DESCENDING], lower numbers are better. For
    example, in a task tracking application, a priority 1 task is more
    important than a priority 5 task.
    
    Only applies to [LONG] fields.|}*)

  duration: string option;
   (**{|
    Specifies the time period that the boost applies to. For example, to make
    the boost apply to documents with the field value within the last month,
    you would use "2628000s". Once the field value is beyond the specified
    range, the effect of the boost drops off. The higher the importance, the
    faster the effect drops off. If you don't specify a value, the default is
    3 months. The value of the field is a numeric string followed by the
    character "s", for example "86400s" for one day, or "604800s" for one
    week.
    
    Only applies to [DATE] fields.|}*)

  importance: int option;
   (**{|
    The relative importance of the field in the search. Larger numbers
    provide more of a boost than smaller numbers.|}*)

  freshness: bool option;
   (**{|
    Indicates that this field determines how "fresh" a document is. For
    example, if document 1 was created on November 5, and document 2 was
    created on October 31, document 1 is "fresher" than document 2. Only
    applies to [DATE] fields.|}*)

}

(**{|
    Provides information about how a custom index field is used during a
    search.|}*)
type search = {
  sortable: bool option;
   (**{|
    Determines whether the field can be used to sort the results of a query.
    If you specify sorting on a field that does not have [Sortable] set to
    [true], Amazon Kendra returns an exception. The default is [false].|}*)

  displayable: bool option;
   (**{|
    Determines whether the field is returned in the query response. The
    default is [true].|}*)

  searchable: bool option;
   (**{|
    Determines whether the field is used in the search. If the [Searchable]
    field is [true], you can use relevance tuning to manually tune how Amazon
    Kendra weights the field in the search. The default is [true] for string
    fields and [false] for number and date fields.|}*)

  facetable: bool option;
   (**{|
    Indicates that the field can be used to create search facets, a count of
    results for each value in the field. The default is [false] .|}*)

}

(**{|
    Specifies the properties, such as relevance tuning and searchability, of
    an index field.|}*)
type document_metadata_configuration = {
  search: search option;
   (**{|
    Provides information about how the field is used during a search.|}*)

  relevance: relevance option;
   (**{|
    Provides tuning parameters to determine how the field affects the search
    results.|}*)

  type_: document_attribute_value_type;
   (**{|
    The data type of the index field.|}*)

  name: string;
   (**{|
    The name of the index field.|}*)

}

(**{|
    Specifies additional capacity units configured for your Enterprise
    Edition index. You can add and remove capacity units to fit your usage
    requirements.|}*)
type capacity_units_configuration = {
  query_capacity_units: int;
   (**{|
    The amount of extra query capacity for an index and
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html }GetQuerySuggestions}
    capacity.
    
    A single extra capacity unit for an index provides 0.1 queries per second
    or approximately 8,000 queries per day. You can add up to 100 extra
    capacity units.
    
    [GetQuerySuggestions] capacity is five times the provisioned query
    capacity for an index, or the base capacity of 2.5 calls per second,
    whichever is higher. For example, the base capacity for an index is 0.1
    queries per second, and [GetQuerySuggestions] capacity has a base of 2.5
    calls per second. If you add another 0.1 queries per second to total 0.2
    queries per second for an index, the [GetQuerySuggestions] capacity is
    2.5 calls per second (higher than five times 0.2 queries per second).|}*)

  storage_capacity_units: int;
   (**{|
    The amount of extra storage capacity for an index. A single capacity unit
    provides 30 GB of storage space or 100,000 documents, whichever is
    reached first. You can add up to 100 extra capacity units.|}*)

}

type update_index_request = {
  user_group_resolution_configuration: user_group_resolution_configuration option;
   (**{|
    Gets users and groups from IAM Identity Center identity source. To
    configure this, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UserGroupResolutionConfiguration.html }UserGroupResolutionConfiguration}.
    This is useful for user context filtering, where search results are
    filtered based on the user or their group access to documents.|}*)

  user_context_policy: user_context_policy option;
   (**{|
    The user context policy.|}*)

  user_token_configurations: user_token_configuration list option;
   (**{|
    The user token configuration.|}*)

  capacity_units: capacity_units_configuration option;
   (**{|
    Sets the number of additional document storage and query capacity units
    that should be used by the index. You can change the capacity of the
    index up to 5 times per day, or make 5 API calls.
    
    If you are using extra storage units, you can't reduce the storage
    capacity below what is required to meet the storage needs for your index.|}*)

  document_metadata_configuration_updates: document_metadata_configuration list option;
   (**{|
    The document metadata configuration you want to update for the index.
    Document metadata are fields or attributes associated with your
    documents. For example, the company department name associated with each
    document.|}*)

  description: string option;
   (**{|
    A new description for the index.|}*)

  role_arn: string option;
   (**{|
    An Identity and Access Management (IAM) role that gives Amazon Kendra
    permission to access Amazon CloudWatch logs and metrics.|}*)

  name: string option;
   (**{|
    A new name for the index.|}*)

  id: string;
   (**{|
    The identifier of the index you want to update.|}*)

}

(**{|
    You have exceeded the set limits for your Amazon Kendra service. Please
    see {{: https://docs.aws.amazon.com/kendra/latest/dg/quotas.html }Quotas}
    for more information, or contact
    {{: http://aws.amazon.com/contact-us/ }Support} to inquire about an
    increase of limits.|}*)
type service_quota_exceeded_exception = {
  message: string option;
  
}

type featured_results_set_status = | INACTIVE
  | ACTIVE

(**{|
    A featured document. This document is displayed at the top of the search
    results page, placed above all other results for certain queries. If
    there's an exact match of a query, then the document is featured in the
    search results.|}*)
type featured_document = {
  id: string option;
   (**{|
    The identifier of the document to feature in the search results. You can
    use the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_Query.html }Query}
    API to search for specific documents with their document IDs included in
    the result items, or you can use the console.|}*)

}

(**{|
    A set of featured results that are displayed at the top of your search
    results. Featured results are placed above all other results for certain
    queries. If there's an exact match of a query, then one or more specific
    documents are featured in the search results.|}*)
type featured_results_set = {
  creation_timestamp: int option;
   (**{|
    The Unix timestamp when the set of featured results was created.|}*)

  last_updated_timestamp: int option;
   (**{|
    The Unix timestamp when the set of featured results was last updated.|}*)

  featured_documents: featured_document list option;
   (**{|
    The list of document IDs for the documents you want to feature at the top
    of the search results page. You can use the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_Query.html }Query}
    API to search for specific documents with their document IDs included in
    the result items, or you can use the console.
    
    You can add up to four featured documents. You can request to increase
    this limit by contacting {{: http://aws.amazon.com/contact-us/ }Support}.
    
    Specific queries are mapped to specific documents for featuring in the
    results. If a query contains an exact match, then one or more specific
    documents are featured in the results. The exact match applies to the
    full query. For example, if you only specify 'Kendra', queries such as
    'How does kendra semantically rank results?' will not render the featured
    results. Featured results are designed for specific queries, rather than
    queries that are too broad in scope.|}*)

  query_texts: string list option;
   (**{|
    The list of queries for featuring results.
    
    Specific queries are mapped to specific documents for featuring in the
    results. If a query contains an exact match, then one or more specific
    documents are featured in the results. The exact match applies to the
    full query. For example, if you only specify 'Kendra', queries such as
    'How does kendra semantically rank results?' will not render the featured
    results. Featured results are designed for specific queries, rather than
    queries that are too broad in scope.|}*)

  status: featured_results_set_status option;
   (**{|
    The current status of the set of featured results. When the value is
    [ACTIVE], featured results are ready for use. You can still configure
    your settings before setting the status to [ACTIVE]. You can set the
    status to [ACTIVE] or [INACTIVE] using the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html }UpdateFeaturedResultsSet}
    API. The queries you specify for featured results must be unique per
    featured results set for each index, whether the status is [ACTIVE] or
    [INACTIVE].|}*)

  description: string option;
   (**{|
    The description for the set of featured results.|}*)

  featured_results_set_name: string option;
   (**{|
    The name for the set of featured results.|}*)

  featured_results_set_id: string option;
   (**{|
    The identifier of the set of featured results.|}*)

}

type update_featured_results_set_response = {
  featured_results_set: featured_results_set option;
   (**{|
    Information on the set of featured results. This includes the identifier
    of the featured results set, whether the featured results set is active
    or inactive, when the featured results set was last updated, and more.|}*)

}

type update_featured_results_set_request = {
  featured_documents: featured_document list option;
   (**{|
    A list of document IDs for the documents you want to feature at the top
    of the search results page. For more information on the list of featured
    documents, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html }FeaturedResultsSet}.
    |}*)

  query_texts: string list option;
   (**{|
    A list of queries for featuring results. For more information on the list
    of queries, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html }FeaturedResultsSet}.
    |}*)

  status: featured_results_set_status option;
   (**{|
    You can set the status to [ACTIVE] or [INACTIVE]. When the value is
    [ACTIVE], featured results are ready for use. You can still configure
    your settings before setting the status to [ACTIVE]. The queries you
    specify for featured results must be unique per featured results set for
    each index, whether the status is [ACTIVE] or [INACTIVE].|}*)

  description: string option;
   (**{|
    A new description for the set of featured results.|}*)

  featured_results_set_name: string option;
   (**{|
    A new name for the set of featured results.|}*)

  featured_results_set_id: string;
   (**{|
    The identifier of the set of featured results that you want to update.|}*)

  index_id: string;
   (**{|
    The identifier of the index used for featuring results.|}*)

}

(**{|
    Information about a conflicting query used across different sets of
    featured results. When you create a featured results set, you must check
    that the queries are unique per featured results set for each index.|}*)
type conflicting_item = {
  set_id: string option;
   (**{|
    The identifier of the set of featured results that the conflicting query
    belongs to.|}*)

  set_name: string option;
   (**{|
    The name for the set of featured results that the conflicting query
    belongs to.|}*)

  query_text: string option;
   (**{|
    The text of the conflicting query.|}*)

}

(**{|
    An error message with a list of conflicting queries used across different
    sets of featured results. This occurred with the request for a new
    featured results set. Check that the queries you specified for featured
    results are unique per featured results set for each index.|}*)
type featured_results_conflict_exception = {
  conflicting_items: conflicting_item list option;
   (**{|
    A list of the conflicting queries, including the query text, the name for
    the featured results set, and the identifier of the featured results set.|}*)

  message: string option;
   (**{|
    An explanation for the conflicting queries.|}*)

}

(**{|
    Provides the configuration information for your content sources, such as
    data sources, FAQs, and content indexed directly via
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html }BatchPutDocument}.
    |}*)
type content_source_configuration = {
  direct_put_content: bool option;
   (**{|
    [TRUE] to use documents you indexed directly using the [BatchPutDocument]
    API.|}*)

  faq_ids: string list option;
   (**{|
    The identifier of the FAQs that you want to use for your Amazon Kendra
    experience.|}*)

  data_source_ids: string list option;
   (**{|
    The identifier of the data sources you want to use for your Amazon Kendra
    experience.|}*)

}

(**{|
    Provides the configuration information for your Amazon Kendra experience.
    This includes the data source IDs and/or FAQ IDs, and user or group
    information to grant access to your Amazon Kendra experience.|}*)
type experience_configuration = {
  user_identity_configuration: user_identity_configuration option;
   (**{|
    The IAM Identity Center field name that contains the identifiers of your
    users, such as their emails.|}*)

  content_source_configuration: content_source_configuration option;
   (**{|
    The identifiers of your data sources and FAQs. Or, you can specify that
    you want to use documents indexed via the [BatchPutDocument] API. This is
    the content you want to use for your Amazon Kendra experience.|}*)

}

type update_experience_request = {
  description: string option;
   (**{|
    A new description for your Amazon Kendra experience.|}*)

  configuration: experience_configuration option;
   (**{|
    Configuration information you want to update for your Amazon Kendra
    experience.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of a role with permission to access
    [Query] API, [QuerySuggestions] API, [SubmitFeedback] API, and IAM
    Identity Center that stores your user and group information. For more
    information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    roles for Amazon Kendra}.|}*)

  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  name: string option;
   (**{|
    A new name for your Amazon Kendra experience.|}*)

  id: string;
   (**{|
    The identifier of your Amazon Kendra experience you want to update.|}*)

}

(**{|
    Document metadata files that contain information such as the document
    access control information, source URI, document author, and custom
    attributes. Each metadata file contains metadata about a single document.|}*)
type documents_metadata_configuration = {
  s3_prefix: string option;
   (**{|
    A prefix used to filter metadata configuration files in the Amazon Web
    Services S3 bucket. The S3 bucket might contain multiple metadata files.
    Use [S3Prefix] to include only the desired metadata files.|}*)

}

(**{|
    Access Control List files for the documents in a data source. For the
    format of the file, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html }Access
    control for S3 data sources}.|}*)
type access_control_list_configuration = {
  key_path: string option;
   (**{|
    Path to the Amazon S3 bucket that contains the ACL files.|}*)

}

(**{|
    Provides the configuration information to connect to an Amazon S3 bucket.
    
    Amazon Kendra now supports an upgraded Amazon S3 connector.
    
    You must now use the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    object instead of the [S3DataSourceConfiguration] object to configure
    your connector.
    
    Connectors configured using the older console and API architecture will
    continue to function as configured. However, you won't be able to edit or
    update them. If you want to edit or update your connector configuration,
    you must create a new connector.
    
    We recommended migrating your connector workflow to the upgraded version.
    Support for connectors configured using the older architecture is
    scheduled to end by June 2024.
    |}*)
type s3_data_source_configuration = {
  access_control_list_configuration: access_control_list_configuration option;
   (**{|
    Provides the path to the S3 bucket that contains the user context
    filtering files for the data source. For the format of the file, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html }Access
    control for S3 data sources}.|}*)

  documents_metadata_configuration: documents_metadata_configuration option;
  
  exclusion_patterns: string list option;
   (**{|
    A list of glob patterns (patterns that can expand a wildcard pattern into
    a list of path names that match the given pattern) for certain file names
    and file types to exclude from your index. If a document matches both an
    inclusion and exclusion prefix or pattern, the exclusion prefix takes
    precendence and the document is not indexed. Examples of glob patterns
    include:
    
    {ol 
          {- {i /myapp/config/*}—All files inside config directory.
             }
          
          {- {i **/*.png}—All .png files in all directories.
             }
          
          {- {i **/*.{png, ico, md}}—All .png, .ico or .md files in all
             directories.
             }
          
          {- {i /myapp/src/**/*.ts}—All .ts files inside src directory (and
             all its subdirectories).
             }
          
          {- {i **/!(*.module).ts}—All .ts files but not .module.ts
             }
          
          {- {i *.png , *.jpg}—All PNG and JPEG image files in a directory
             (files with the extensions .png and .jpg).
             }
          
          {- {i *internal*}—All files in a directory that contain
             'internal' in the file name, such as 'internal',
             'internal_only', 'company_internal'.
             }
          
          {- {i **/*internal*}—All internal-related files in a directory
             and its subdirectories.
             }
          
    }
    
    For more examples, see
    {{: https://docs.aws.amazon.com/cli/latest/reference/s3/#use-of-exclude-and-include-filters }Use
    of Exclude and Include Filters} in the Amazon Web Services CLI Command
    Reference.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of glob patterns (patterns that can expand a wildcard pattern into
    a list of path names that match the given pattern) for certain file names
    and file types to include in your index. If a document matches both an
    inclusion and exclusion prefix or pattern, the exclusion prefix takes
    precendence and the document is not indexed. Examples of glob patterns
    include:
    
    {ol 
          {- {i /myapp/config/*}—All files inside config directory.
             }
          
          {- {i **/*.png}—All .png files in all directories.
             }
          
          {- {i **/*.{png, ico, md}}—All .png, .ico or .md files in all
             directories.
             }
          
          {- {i /myapp/src/**/*.ts}—All .ts files inside src directory (and
             all its subdirectories).
             }
          
          {- {i **/!(*.module).ts}—All .ts files but not .module.ts
             }
          
          {- {i *.png , *.jpg}—All PNG and JPEG image files in a directory
             (files with the extensions .png and .jpg).
             }
          
          {- {i *internal*}—All files in a directory that contain
             'internal' in the file name, such as 'internal',
             'internal_only', 'company_internal'.
             }
          
          {- {i **/*internal*}—All internal-related files in a directory
             and its subdirectories.
             }
          
    }
    
    For more examples, see
    {{: https://docs.aws.amazon.com/cli/latest/reference/s3/#use-of-exclude-and-include-filters }Use
    of Exclude and Include Filters} in the Amazon Web Services CLI Command
    Reference.|}*)

  inclusion_prefixes: string list option;
   (**{|
    A list of S3 prefixes for the documents that should be included in the
    index.|}*)

  bucket_name: string;
   (**{|
    The name of the bucket that contains the documents.|}*)

}

type share_point_version = | SHAREPOINT_2019
  | SHAREPOINT_ONLINE
  | SHAREPOINT_2016
  | SHAREPOINT_2013

(**{|
    Provides the configuration information to connect to an Amazon VPC.|}*)
type data_source_vpc_configuration = {
  security_group_ids: string list;
   (**{|
    A list of identifiers of security groups within your Amazon VPC. The
    security groups should enable Amazon Kendra to connect to the data
    source.|}*)

  subnet_ids: string list;
   (**{|
    A list of identifiers for subnets within your Amazon VPC. The subnets
    should be able to connect to each other in the VPC, and they should have
    outgoing access to the Internet through a NAT device.|}*)

}

type share_point_online_authentication_type = | OAUTH2
  | HTTP_BASIC

(**{|
    Provides the configuration information to connect to Microsoft SharePoint
    as your data source.|}*)
type share_point_configuration = {
  proxy_configuration: proxy_configuration option;
   (**{|
    Configuration information to connect to your Microsoft SharePoint site
    URLs via instance via a web proxy. You can use this option for SharePoint
    Server.
    
    You must provide the website host name and port number. For example, the
    host name of {i https://a.example.com/page1.html} is "a.example.com" and
    the port is 443, the standard port for HTTPS.
    
    Web proxy credentials are optional and you can use them to connect to a
    web proxy server that requires basic authentication of user name and
    password. To store web proxy credentials, you use a secret in Secrets
    Manager.
    
    It is recommended that you follow best security practices when
    configuring your web proxy. This includes setting up throttling, setting
    up logging and monitoring, and applying security patches on a regular
    basis. If you use your web proxy with multiple data sources, sync jobs
    that occur at the same time could strain the load on your proxy. It is
    recommended you prepare your proxy beforehand for any security and load
    requirements.|}*)

  authentication_type: share_point_online_authentication_type option;
   (**{|
    Whether you want to connect to SharePoint Online using basic
    authentication of user name and password, or OAuth authentication of user
    name, password, client ID, and client secret, or AD App-only
    authentication of client secret.|}*)

  ssl_certificate_s3_path: s3_path option;
   (**{|
    The path to the SSL certificate stored in an Amazon S3 bucket. You use
    this to connect to SharePoint Server if you require a secure SSL
    connection.
    
    You can generate a self-signed X509 certificate on any computer using
    OpenSSL. For an example of using OpenSSL to create an X509 certificate,
    see
    {{: https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html }Create
    and sign an X509 certificate}.|}*)

  disable_local_groups: bool option;
   (**{|
    [TRUE] to disable local groups information.|}*)

  document_title_field_name: string option;
   (**{|
    The Microsoft SharePoint attribute field that contains the title of the
    document.|}*)

  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map SharePoint
    data source attributes or field names to Amazon Kendra index field names.
    To create custom fields, use the [UpdateIndex] API before you map to
    SharePoint fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The SharePoint data source field names must exist in
    your SharePoint custom metadata.|}*)

  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud to connect
    to your Microsoft SharePoint. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain documents in
    your SharePoint. Documents that match the patterns are excluded from the
    index. Documents that don't match the patterns are included in the index.
    If a document matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the document isn't included in the
    index.
    
    The regex applies to the display URL of the SharePoint document.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain documents in
    your SharePoint. Documents that match the patterns are included in the
    index. Documents that don't match the patterns are excluded from the
    index. If a document matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the document isn't included in the
    index.
    
    The regex applies to the display URL of the SharePoint document.|}*)

  use_change_log: bool option;
   (**{|
    [TRUE] to use the SharePoint change log to determine which documents
    require updating in the index. Depending on the change log's size, it may
    take longer for Amazon Kendra to use the change log than to scan all of
    your documents in SharePoint.|}*)

  crawl_attachments: bool option;
   (**{|
    [TRUE] to index document attachments.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
    the user name and password required to connect to the SharePoint
    instance. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-sharepoint.html }Microsoft
    SharePoint}.|}*)

  urls: string list;
   (**{|
    The Microsoft SharePoint site URLs for the documents you want to index.|}*)

  share_point_version: share_point_version;
   (**{|
    The version of Microsoft SharePoint that you use.|}*)

}

type database_engine_type = | RDS_POSTGRESQL
  | RDS_MYSQL
  | RDS_AURORA_POSTGRESQL
  | RDS_AURORA_MYSQL

(**{|
    Provides the configuration information that's required to connect to a
    database.|}*)
type connection_configuration = {
  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of credentials stored in Secrets Manager.
    The credentials should be a user/password pair. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html }Using
    a Database Data Source}. For more information about Secrets Manager, see
    {{: https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html }What
    Is Secrets Manager} in the {i Secrets Manager} user guide.|}*)

  table_name: string;
   (**{|
    The name of the table that contains the document data.|}*)

  database_name: string;
   (**{|
    The name of the database containing the document data.|}*)

  database_port: int;
   (**{|
    The port that the database uses for connections.|}*)

  database_host: string;
   (**{|
    The name of the host for the database. Can be either a string
    (host.subdomain.domain.tld) or an IPv4 or IPv6 address.|}*)

}

(**{|
    Provides information about how Amazon Kendra should use the columns of a
    database in an index.|}*)
type column_configuration = {
  change_detecting_columns: string list;
   (**{|
    One to five columns that indicate when a document in the database has
    changed.|}*)

  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    An array of objects that map database column names to the corresponding
    fields in an index. You must first create the fields in the index using
    the [UpdateIndex] API.|}*)

  document_title_column_name: string option;
   (**{|
    The column that contains the title of the document.|}*)

  document_data_column_name: string;
   (**{|
    The column that contains the contents of the document.|}*)

  document_id_column_name: string;
   (**{|
    The column that provides the document's identifier.|}*)

}

(**{|
    Provides information about the column that should be used for filtering
    the query response by groups.|}*)
type acl_configuration = {
  allowed_groups_column_name: string;
   (**{|
    A list of groups, separated by semi-colons, that filters a query response
    based on user context. The document is only returned to users that are in
    one of the groups specified in the [UserContext] field of the [Query]
    API.|}*)

}

type query_identifiers_enclosing_option = | NONE
  | DOUBLE_QUOTES

(**{|
    Provides the configuration information to use a SQL database.|}*)
type sql_configuration = {
  query_identifiers_enclosing_option: query_identifiers_enclosing_option option;
   (**{|
    Determines whether Amazon Kendra encloses SQL identifiers for tables and
    column names in double quotes (") when making a database query.
    
    By default, Amazon Kendra passes SQL identifiers the way that they are
    entered into the data source configuration. It does not change the case
    of identifiers or enclose them in quotes.
    
    PostgreSQL internally converts uppercase characters to lower case
    characters in identifiers unless they are quoted. Choosing this option
    encloses identifiers in quotes so that PostgreSQL does not convert the
    character's case.
    
    For MySQL databases, you must enable the [ansi_quotes] option when you
    set this field to [DOUBLE_QUOTES].|}*)

}

(**{|
    Provides the configuration information to an
    {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html }Amazon
    Kendra supported database}.|}*)
type database_configuration = {
  sql_configuration: sql_configuration option;
   (**{|
    Provides information about how Amazon Kendra uses quote marks around SQL
    identifiers when querying a database data source.|}*)

  acl_configuration: acl_configuration option;
   (**{|
    Information about the database column that provides information for user
    context filtering.|}*)

  column_configuration: column_configuration;
   (**{|
    Information about where the index should get the document information
    from the database.|}*)

  vpc_configuration: data_source_vpc_configuration option;
  
  connection_configuration: connection_configuration;
   (**{|
    Configuration information that's required to connect to a database.|}*)

  database_engine_type: database_engine_type;
   (**{|
    The type of database engine that runs the database.|}*)

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

(**{|
    Provides the configuration information for indexing a single standard
    object.|}*)
type salesforce_standard_object_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    Maps attributes or field names of the standard object to Amazon Kendra
    index field names. To create custom fields, use the [UpdateIndex] API
    before you map to Salesforce fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Salesforce data source field names must exist in
    your Salesforce custom metadata.|}*)

  document_title_field_name: string option;
   (**{|
    The name of the field in the standard object table that contains the
    document title.|}*)

  document_data_field_name: string;
   (**{|
    The name of the field in the standard object table that contains the
    document contents.|}*)

  name: salesforce_standard_object_name;
   (**{|
    The name of the standard object.|}*)

}

type salesforce_knowledge_article_state = | ARCHIVED
  | PUBLISHED
  | DRAFT

(**{|
    Provides the configuration information for standard Salesforce knowledge
    articles.|}*)
type salesforce_standard_knowledge_article_type_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    Maps attributes or field names of the knowledge article to Amazon Kendra
    index field names. To create custom fields, use the [UpdateIndex] API
    before you map to Salesforce fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Salesforce data source field names must exist in
    your Salesforce custom metadata.|}*)

  document_title_field_name: string option;
   (**{|
    The name of the field that contains the document title.|}*)

  document_data_field_name: string;
   (**{|
    The name of the field that contains the document data to index.|}*)

}

(**{|
    Provides the configuration information for indexing Salesforce custom
    articles.|}*)
type salesforce_custom_knowledge_article_type_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    Maps attributes or field names of the custom knowledge article to Amazon
    Kendra index field names. To create custom fields, use the [UpdateIndex]
    API before you map to Salesforce fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Salesforce data source field names must exist in
    your Salesforce custom metadata.|}*)

  document_title_field_name: string option;
   (**{|
    The name of the field in the custom knowledge article that contains the
    document title.|}*)

  document_data_field_name: string;
   (**{|
    The name of the field in the custom knowledge article that contains the
    document data to index.|}*)

  name: string;
   (**{|
    The name of the configuration.|}*)

}

(**{|
    Provides the configuration information for the knowledge article types
    that Amazon Kendra indexes. Amazon Kendra indexes standard knowledge
    articles and the standard fields of knowledge articles, or the custom
    fields of custom knowledge articles, but not both|}*)
type salesforce_knowledge_article_configuration = {
  custom_knowledge_article_type_configurations: salesforce_custom_knowledge_article_type_configuration list option;
   (**{|
    Configuration information for custom Salesforce knowledge articles.|}*)

  standard_knowledge_article_type_configuration: salesforce_standard_knowledge_article_type_configuration option;
   (**{|
    Configuration information for standard Salesforce knowledge articles.|}*)

  included_states: salesforce_knowledge_article_state list;
   (**{|
    Specifies the document states that should be included when Amazon Kendra
    indexes knowledge articles. You must specify at least one state.|}*)

}

type salesforce_chatter_feed_include_filter_type = | STANDARD_USER
  | ACTIVE_USER

(**{|
    The configuration information for syncing a Salesforce chatter feed. The
    contents of the object comes from the Salesforce FeedItem table.|}*)
type salesforce_chatter_feed_configuration = {
  include_filter_types: salesforce_chatter_feed_include_filter_type list option;
   (**{|
    Filters the documents in the feed based on status of the user. When you
    specify [ACTIVE_USERS] only documents from users who have an active
    account are indexed. When you specify [STANDARD_USER] only documents for
    Salesforce standard users are documented. You can specify both.|}*)

  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    Maps fields from a Salesforce chatter feed into Amazon Kendra index
    fields.|}*)

  document_title_field_name: string option;
   (**{|
    The name of the column in the Salesforce FeedItem table that contains the
    title of the document. This is typically the [Title] column.|}*)

  document_data_field_name: string;
   (**{|
    The name of the column in the Salesforce FeedItem table that contains the
    content to index. Typically this is the [Body] column.|}*)

}

(**{|
    Provides the configuration information for processing attachments to
    Salesforce standard objects.|}*)
type salesforce_standard_object_attachment_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    One or more objects that map fields in attachments to Amazon Kendra index
    fields.|}*)

  document_title_field_name: string option;
   (**{|
    The name of the field used for the document title.|}*)

}

(**{|
    Provides the configuration information to connect to Salesforce as your
    data source.|}*)
type salesforce_configuration = {
  exclude_attachment_file_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain documents in
    your Salesforce. Documents that match the patterns are excluded from the
    index. Documents that don't match the patterns are included in the index.
    If a document matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the document isn't included in the
    index.
    
    The pattern is applied to the name of the attached file.|}*)

  include_attachment_file_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain documents in
    your Salesforce. Documents that match the patterns are included in the
    index. Documents that don't match the patterns are excluded from the
    index. If a document matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the document isn't included in the
    index.
    
    The pattern is applied to the name of the attached file.|}*)

  standard_object_attachment_configuration: salesforce_standard_object_attachment_configuration option;
   (**{|
    Configuration information for processing attachments to Salesforce
    standard objects.|}*)

  crawl_attachments: bool option;
   (**{|
    Indicates whether Amazon Kendra should index attachments to Salesforce
    objects.|}*)

  chatter_feed_configuration: salesforce_chatter_feed_configuration option;
   (**{|
    Configuration information for Salesforce chatter feeds.|}*)

  knowledge_article_configuration: salesforce_knowledge_article_configuration option;
   (**{|
    Configuration information for the knowledge article types that Amazon
    Kendra indexes. Amazon Kendra indexes standard knowledge articles and the
    standard fields of knowledge articles, or the custom fields of custom
    knowledge articles, but not both.|}*)

  standard_object_configurations: salesforce_standard_object_configuration list option;
   (**{|
    Configuration of the Salesforce standard objects that Amazon Kendra
    indexes.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Managersecret that contains
    the key/value pairs required to connect to your Salesforce instance. The
    secret must contain a JSON structure with the following keys:
    
    {ol 
          {- authenticationUrl - The OAUTH endpoint that Amazon Kendra
             connects to get an OAUTH token.
             }
          
          {- consumerKey - The application public key generated when you
             created your Salesforce application.
             }
          
          {- consumerSecret - The application private key generated when you
             created your Salesforce application.
             }
          
          {- password - The password associated with the user logging in to
             the Salesforce instance.
             }
          
          {- securityToken - The token associated with the user logging in to
             the Salesforce instance.
             }
          
          {- username - The user name of the user logging in to the
             Salesforce instance.
             }
          
    }
    |}*)

  server_url: string;
   (**{|
    The instance URL for the Salesforce site that you want to index.|}*)

}

(**{|
    User accounts whose documents should be indexed.|}*)
type one_drive_users = {
  one_drive_user_s3_path: s3_path option;
   (**{|
    The S3 bucket location of a file containing a list of users whose
    documents should be indexed.|}*)

  one_drive_user_list: string list option;
   (**{|
    A list of users whose documents should be indexed. Specify the user names
    in email format, for example, [username@tenantdomain]. If you need to
    index the documents of more than 100 users, use the [OneDriveUserS3Path]
    field to specify the location of a file containing a list of users.|}*)

}

(**{|
    Provides the configuration information to connect to OneDrive as your
    data source.|}*)
type one_drive_configuration = {
  disable_local_groups: bool option;
   (**{|
    [TRUE] to disable local groups information.|}*)

  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map OneDrive data
    source attributes or field names to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to
    OneDrive fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The OneDrive data source field names must exist in
    your OneDrive custom metadata.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain documents in
    your OneDrive. Documents that match the patterns are excluded from the
    index. Documents that don't match the patterns are included in the index.
    If a document matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the document isn't included in the
    index.
    
    The pattern is applied to the file name.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain documents in
    your OneDrive. Documents that match the patterns are included in the
    index. Documents that don't match the patterns are excluded from the
    index. If a document matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the document isn't included in the
    index.
    
    The pattern is applied to the file name.|}*)

  one_drive_users: one_drive_users;
   (**{|
    A list of user accounts whose documents should be indexed.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Managersecret that contains
    the user name and password to connect to OneDrive. The user name should
    be the application ID for the OneDrive application, and the password is
    the application key for the OneDrive application.|}*)

  tenant_domain: string;
   (**{|
    The Azure Active Directory domain of the organization.|}*)

}

type service_now_build_version_type = | OTHERS
  | LONDON

(**{|
    Provides the configuration information for crawling knowledge articles in
    the ServiceNow site.|}*)
type service_now_knowledge_article_configuration = {
  filter_query: string option;
   (**{|
    A query that selects the knowledge articles to index. The query can
    return articles from multiple knowledge bases, and the knowledge bases
    can be public or private.
    
    The query string must be one generated by the ServiceNow console. For
    more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/servicenow-query.html }Specifying
    documents to index with a query}.|}*)

  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    Maps attributes or field names of knoweldge articles to Amazon Kendra
    index field names. To create custom fields, use the [UpdateIndex] API
    before you map to ServiceNow fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The ServiceNow data source field names must exist in
    your ServiceNow custom metadata.|}*)

  document_title_field_name: string option;
   (**{|
    The name of the ServiceNow field that is mapped to the index document
    title field.|}*)

  document_data_field_name: string;
   (**{|
    The name of the ServiceNow field that is mapped to the index document
    contents field in the Amazon Kendra index.|}*)

  exclude_attachment_file_patterns: string list option;
   (**{|
    A list of regular expression patterns applied to exclude certain
    knowledge article attachments. Attachments that match the patterns are
    excluded from the index. Items that don't match the patterns are included
    in the index. If an item matches both an inclusion and exclusion pattern,
    the exclusion pattern takes precedence and the item isn't included in the
    index.|}*)

  include_attachment_file_patterns: string list option;
   (**{|
    A list of regular expression patterns applied to include knowledge
    article attachments. Attachments that match the patterns are included in
    the index. Items that don't match the patterns are excluded from the
    index. If an item matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the item isn't included in the
    index.|}*)

  crawl_attachments: bool option;
   (**{|
    [TRUE] to index attachments to knowledge articles.|}*)

}

(**{|
    Provides the configuration information for crawling service catalog items
    in the ServiceNow site|}*)
type service_now_service_catalog_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    Maps attributes or field names of catalogs to Amazon Kendra index field
    names. To create custom fields, use the [UpdateIndex] API before you map
    to ServiceNow fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The ServiceNow data source field names must exist in
    your ServiceNow custom metadata.|}*)

  document_title_field_name: string option;
   (**{|
    The name of the ServiceNow field that is mapped to the index document
    title field.|}*)

  document_data_field_name: string;
   (**{|
    The name of the ServiceNow field that is mapped to the index document
    contents field in the Amazon Kendra index.|}*)

  exclude_attachment_file_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain attachments of
    catalogs in your ServiceNow. Item that match the patterns are excluded
    from the index. Items that don't match the patterns are included in the
    index. If an item matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the item isn't included in the
    index.
    
    The regex is applied to the file name of the attachment.|}*)

  include_attachment_file_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain attachments of
    catalogs in your ServiceNow. Item that match the patterns are included in
    the index. Items that don't match the patterns are excluded from the
    index. If an item matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the item isn't included in the
    index.
    
    The regex is applied to the file name of the attachment.|}*)

  crawl_attachments: bool option;
   (**{|
    [TRUE] to index attachments to service catalog items.|}*)

}

type service_now_authentication_type = | OAUTH2
  | HTTP_BASIC

(**{|
    Provides the configuration information to connect to ServiceNow as your
    data source.|}*)
type service_now_configuration = {
  authentication_type: service_now_authentication_type option;
   (**{|
    The type of authentication used to connect to the ServiceNow instance. If
    you choose [HTTP_BASIC], Amazon Kendra is authenticated using the user
    name and password provided in the Secrets Manager secret in the
    [SecretArn] field. If you choose [OAUTH2], Amazon Kendra is authenticated
    using the credentials of client ID, client secret, user name and
    password.
    
    When you use [OAUTH2] authentication, you must generate a token and a
    client secret using the ServiceNow console. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-servicenow.html }Using
    a ServiceNow data source}.|}*)

  service_catalog_configuration: service_now_service_catalog_configuration option;
   (**{|
    Configuration information for crawling service catalogs in the ServiceNow
    site.|}*)

  knowledge_article_configuration: service_now_knowledge_article_configuration option;
   (**{|
    Configuration information for crawling knowledge articles in the
    ServiceNow site.|}*)

  service_now_build_version: service_now_build_version_type;
   (**{|
    The identifier of the release that the ServiceNow host is running. If the
    host is not running the [LONDON] release, use [OTHERS].|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the Secrets Manager secret that
    contains the user name and password required to connect to the ServiceNow
    instance. You can also provide OAuth authentication credentials of user
    name, password, client ID, and client secret. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-servicenow.html }Using
    a ServiceNow data source}.|}*)

  host_url: string;
   (**{|
    The ServiceNow instance that the data source connects to. The host
    endpoint should look like the following: {i {instance}.service-now.com.}|}*)

}

type confluence_version = | SERVER
  | CLOUD

type confluence_space_field_name = | URL
  | SPACE_KEY
  | ITEM_TYPE
  | DISPLAY_URL

(**{|
    Maps attributes or field names of Confluence spaces to Amazon Kendra
    index field names. To create custom fields, use the [UpdateIndex] API
    before you map to Confluence fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Confluence data source field names must exist in
    your Confluence custom metadata.|}*)
type confluence_space_to_index_field_mapping = {
  index_field_name: string option;
   (**{|
    The name of the index field to map to the Confluence data source field.
    The index field type must match the Confluence field type.|}*)

  date_field_format: string option;
   (**{|
    The format for date fields in the data source. If the field specified in
    [DataSourceFieldName] is a date field you must specify the date format.
    If the field is not a date field, an exception is thrown.|}*)

  data_source_field_name: confluence_space_field_name option;
   (**{|
    The name of the field in the data source.|}*)

}

(**{|
    Configuration information for indexing Confluence spaces.|}*)
type confluence_space_configuration = {
  space_field_mappings: confluence_space_to_index_field_mapping list option;
   (**{|
    Maps attributes or field names of Confluence spaces to Amazon Kendra
    index field names. To create custom fields, use the [UpdateIndex] API
    before you map to Confluence fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Confluence data source field names must exist in
    your Confluence custom metadata.
    
    If you specify the [SpaceFieldMappings] parameter, you must specify at
    least one field mapping.|}*)

  exclude_spaces: string list option;
   (**{|
    A list of space keys of Confluence spaces. If you include a key, the
    blogs, documents, and attachments in the space are not indexed. If a
    space is in both the [ExcludeSpaces] and the [IncludeSpaces] list, the
    space is excluded.|}*)

  include_spaces: string list option;
   (**{|
    A list of space keys for Confluence spaces. If you include a key, the
    blogs, documents, and attachments in the space are indexed. Spaces that
    aren't in the list aren't indexed. A space in the list must exist.
    Otherwise, Amazon Kendra logs an error when the data source is
    synchronized. If a space is in both the [IncludeSpaces] and the
    [ExcludeSpaces] list, the space is excluded.|}*)

  crawl_archived_spaces: bool option;
   (**{|
    [TRUE] to index archived spaces.|}*)

  crawl_personal_spaces: bool option;
   (**{|
    [TRUE] to index personal spaces. You can add restrictions to items in
    personal spaces. If personal spaces are indexed, queries without user
    context information may return restricted items from a personal space in
    their results. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html }Filtering
    on user context}.|}*)

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

(**{|
    Maps attributes or field names of Confluence pages to Amazon Kendra index
    field names. To create custom fields, use the [UpdateIndex] API before
    you map to Confluence fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Confluence data source field names must exist in
    your Confluence custom metadata.|}*)
type confluence_page_to_index_field_mapping = {
  index_field_name: string option;
   (**{|
    The name of the index field to map to the Confluence data source field.
    The index field type must match the Confluence field type.|}*)

  date_field_format: string option;
   (**{|
    The format for date fields in the data source. If the field specified in
    [DataSourceFieldName] is a date field you must specify the date format.
    If the field is not a date field, an exception is thrown.|}*)

  data_source_field_name: confluence_page_field_name option;
   (**{|
    The name of the field in the data source.|}*)

}

(**{|
    Configuration of the page settings for the Confluence data source.|}*)
type confluence_page_configuration = {
  page_field_mappings: confluence_page_to_index_field_mapping list option;
   (**{|
    Maps attributes or field names of Confluence pages to Amazon Kendra index
    field names. To create custom fields, use the [UpdateIndex] API before
    you map to Confluence fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Confluence data source field names must exist in
    your Confluence custom metadata.
    
    If you specify the [PageFieldMappings] parameter, you must specify at
    least one field mapping.|}*)

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

(**{|
    Maps attributes or field names of Confluence blog to Amazon Kendra index
    field names. To create custom fields, use the [UpdateIndex] API before
    you map to Confluence fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Confluence data source field names must exist in
    your Confluence custom metadata.|}*)
type confluence_blog_to_index_field_mapping = {
  index_field_name: string option;
   (**{|
    The name of the index field to map to the Confluence data source field.
    The index field type must match the Confluence field type.|}*)

  date_field_format: string option;
   (**{|
    The format for date fields in the data source. If the field specified in
    [DataSourceFieldName] is a date field you must specify the date format.
    If the field is not a date field, an exception is thrown.|}*)

  data_source_field_name: confluence_blog_field_name option;
   (**{|
    The name of the field in the data source.|}*)

}

(**{|
    Configuration of blog settings for the Confluence data source. Blogs are
    always indexed unless filtered from the index by the [ExclusionPatterns]
    or [InclusionPatterns] fields in the [ConfluenceConfiguration] object.|}*)
type confluence_blog_configuration = {
  blog_field_mappings: confluence_blog_to_index_field_mapping list option;
   (**{|
    Maps attributes or field names of Confluence blogs to Amazon Kendra index
    field names. To create custom fields, use the [UpdateIndex] API before
    you map to Confluence fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Confluence data source field names must exist in
    your Confluence custom metadata.
    
    If you specify the [BlogFieldMappings] parameter, you must specify at
    least one field mapping.|}*)

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

(**{|
    Maps attributes or field names of Confluence attachments to Amazon Kendra
    index field names. To create custom fields, use the [UpdateIndex] API
    before you map to Confluence fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Confuence data source field names must exist in
    your Confluence custom metadata.|}*)
type confluence_attachment_to_index_field_mapping = {
  index_field_name: string option;
   (**{|
    The name of the index field to map to the Confluence data source field.
    The index field type must match the Confluence field type.|}*)

  date_field_format: string option;
   (**{|
    The format for date fields in the data source. If the field specified in
    [DataSourceFieldName] is a date field you must specify the date format.
    If the field is not a date field, an exception is thrown.|}*)

  data_source_field_name: confluence_attachment_field_name option;
   (**{|
    The name of the field in the data source.
    
    You must first create the index field using the [UpdateIndex] API.|}*)

}

(**{|
    Configuration of attachment settings for the Confluence data source.
    Attachment settings are optional, if you don't specify settings
    attachments, Amazon Kendra won't index them.|}*)
type confluence_attachment_configuration = {
  attachment_field_mappings: confluence_attachment_to_index_field_mapping list option;
   (**{|
    Maps attributes or field names of Confluence attachments to Amazon Kendra
    index field names. To create custom fields, use the [UpdateIndex] API
    before you map to Confluence fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Confluence data source field names must exist in
    your Confluence custom metadata.
    
    If you specify the [AttachentFieldMappings] parameter, you must specify
    at least one field mapping.|}*)

  crawl_attachments: bool option;
   (**{|
    [TRUE] to index attachments of pages and blogs in Confluence.|}*)

}

type confluence_authentication_type = | PAT
  | HTTP_BASIC

(**{|
    Provides the configuration information to connect to Confluence as your
    data source.|}*)
type confluence_configuration = {
  authentication_type: confluence_authentication_type option;
   (**{|
    Whether you want to connect to Confluence using basic authentication of
    user name and password, or a personal access token. You can use a
    personal access token for Confluence Server.|}*)

  proxy_configuration: proxy_configuration option;
   (**{|
    Configuration information to connect to your Confluence URL instance via
    a web proxy. You can use this option for Confluence Server.
    
    You must provide the website host name and port number. For example, the
    host name of {i https://a.example.com/page1.html} is "a.example.com" and
    the port is 443, the standard port for HTTPS.
    
    Web proxy credentials are optional and you can use them to connect to a
    web proxy server that requires basic authentication of user name and
    password. To store web proxy credentials, you use a secret in Secrets
    Manager.
    
    It is recommended that you follow best security practices when
    configuring your web proxy. This includes setting up throttling, setting
    up logging and monitoring, and applying security patches on a regular
    basis. If you use your web proxy with multiple data sources, sync jobs
    that occur at the same time could strain the load on your proxy. It is
    recommended you prepare your proxy beforehand for any security and load
    requirements.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain blog posts,
    pages, spaces, or attachments in your Confluence. Content that matches
    the patterns are excluded from the index. Content that doesn't match the
    patterns is included in the index. If content matches both an inclusion
    and exclusion pattern, the exclusion pattern takes precedence and the
    content isn't included in the index.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain blog posts,
    pages, spaces, or attachments in your Confluence. Content that matches
    the patterns are included in the index. Content that doesn't match the
    patterns is excluded from the index. If content matches both an inclusion
    and exclusion pattern, the exclusion pattern takes precedence and the
    content isn't included in the index.|}*)

  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud to connect
    to your Confluence. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  attachment_configuration: confluence_attachment_configuration option;
   (**{|
    Configuration information for indexing attachments to Confluence blogs
    and pages.|}*)

  blog_configuration: confluence_blog_configuration option;
   (**{|
    Configuration information for indexing Confluence blogs.|}*)

  page_configuration: confluence_page_configuration option;
   (**{|
    Configuration information for indexing Confluence pages.|}*)

  space_configuration: confluence_space_configuration option;
   (**{|
    Configuration information for indexing Confluence spaces.|}*)

  version: confluence_version;
   (**{|
    The version or the type of Confluence installation to connect to.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
    the user name and password required to connect to the Confluence
    instance. If you use Confluence Cloud, you use a generated API token as
    the password.
    
    You can also provide authentication credentials in the form of a personal
    access token. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-confluence.html }Using
    a Confluence data source}.|}*)

  server_url: string;
   (**{|
    The URL of your Confluence instance. Use the full URL of the server. For
    example, {i https://server.example.com:port/}. You can also use an IP
    address, for example, {i https://192.168.1.113/}.|}*)

}

(**{|
    Provides the configuration information to connect to Google Drive as your
    data source.|}*)
type google_drive_configuration = {
  exclude_shared_drives: string list option;
   (**{|
    A list of identifiers or shared drives to exclude from the index. All
    files and folders stored on the shared drive are excluded.|}*)

  exclude_user_accounts: string list option;
   (**{|
    A list of email addresses of the users. Documents owned by these users
    are excluded from the index. Documents shared with excluded users are
    indexed unless they are excluded in another way.|}*)

  exclude_mime_types: string list option;
   (**{|
    A list of MIME types to exclude from the index. All documents matching
    the specified MIME type are excluded.
    
    For a list of MIME types, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-google-drive.html }Using
    a Google Workspace Drive data source}.|}*)

  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    Maps Google Drive data source attributes or field names to Amazon Kendra
    index field names. To create custom fields, use the [UpdateIndex] API
    before you map to Google Drive fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Google Drive data source field names must exist
    in your Google Drive custom metadata.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain items in your
    Google Drive, including shared drives and users' My Drives. Items that
    match the patterns are excluded from the index. Items that don't match
    the patterns are included in the index. If an item matches both an
    inclusion and exclusion pattern, the exclusion pattern takes precedence
    and the item isn't included in the index.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain items in your
    Google Drive, including shared drives and users' My Drives. Items that
    match the patterns are included in the index. Items that don't match the
    patterns are excluded from the index. If an item matches both an
    inclusion and exclusion pattern, the exclusion pattern takes precedence
    and the item isn't included in the index.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of a Secrets Managersecret that contains
    the credentials required to connect to Google Drive. For more
    information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-google-drive.html }Using
    a Google Workspace Drive data source}.|}*)

}

type fsx_file_system_type = | WINDOWS

(**{|
    Provides the configuration information to connect to Amazon FSx as your
    data source.
    
    Amazon Kendra now supports an upgraded Amazon FSx Windows connector.
    
    You must now use the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    object instead of the [FsxConfiguration] object to configure your
    connector.
    
    Connectors configured using the older console and API architecture will
    continue to function as configured. However, you won't be able to edit or
    update them. If you want to edit or update your connector configuration,
    you must create a new connector.
    
    We recommended migrating your connector workflow to the upgraded version.
    Support for connectors configured using the older architecture is
    scheduled to end by June 2024.
    |}*)
type fsx_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map Amazon FSx
    data source attributes or field names to Amazon Kendra index field names.
    To create custom fields, use the [UpdateIndex] API before you map to
    Amazon FSx fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Amazon FSx data source field names must exist in
    your Amazon FSx custom metadata.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain files in your
    Amazon FSx file system. Files that match the patterns are excluded from
    the index. Files that don't match the patterns are included in the index.
    If a file matches both an inclusion and exclusion pattern, the exclusion
    pattern takes precedence and the file isn't included in the index.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain files in your
    Amazon FSx file system. Files that match the patterns are included in the
    index. Files that don't match the patterns are excluded from the index.
    If a file matches both an inclusion and exclusion pattern, the exclusion
    pattern takes precedence and the file isn't included in the index.|}*)

  secret_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
    the key-value pairs required to connect to your Amazon FSx file system.
    Windows is currently the only supported type. The secret must contain a
    JSON structure with the following keys:
    
    {ol 
          {- username—The Active Directory user name, along with the Domain
             Name System (DNS) domain name. For example,
             {i user@corp.example.com}. The Active Directory user account
             must have read and mounting access to the Amazon FSx file system
             for Windows.
             }
          
          {- password—The password of the Active Directory user account
             with read and mounting access to the Amazon FSx Windows file
             system.
             }
          
    }
    |}*)

  vpc_configuration: data_source_vpc_configuration;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud to connect
    to your Amazon FSx. Your Amazon FSx instance must reside inside your VPC.|}*)

  file_system_type: fsx_file_system_type;
   (**{|
    The Amazon FSx file system type. Windows is currently the only supported
    type.|}*)

  file_system_id: string;
   (**{|
    The identifier of the Amazon FSx file system.
    
    You can find your file system ID on the file system dashboard in the
    Amazon FSx console. For information on how to create a file system in
    Amazon FSx console, using Windows File Server as an example, see
    {{: https://docs.aws.amazon.com/fsx/latest/WindowsGuide/getting-started-step1.html }Amazon
    FSx Getting started guide}.|}*)

}

type slack_entity = | DIRECT_MESSAGE
  | GROUP_MESSAGE
  | PRIVATE_CHANNEL
  | PUBLIC_CHANNEL

(**{|
    Provides the configuration information to connect to Slack as your data
    source.
    
    Amazon Kendra now supports an upgraded Slack connector.
    
    You must now use the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    object instead of the [SlackConfiguration] object to configure your
    connector.
    
    Connectors configured using the older console and API architecture will
    continue to function as configured. However, you won’t be able to edit
    or update them. If you want to edit or update your connector
    configuration, you must create a new connector.
    
    We recommended migrating your connector workflow to the upgraded version.
    Support for connectors configured using the older architecture is
    scheduled to end by June 2024.
    |}*)
type slack_configuration = {
  field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map Slack data
    source attributes or field names to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to Slack
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Slack data source field names must exist in your
    Slack custom metadata.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain attached files
    in your Slack workspace team. Files that match the patterns are excluded
    from the index. Files that don’t match the patterns are included in the
    index. If a file matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the file isn't included in the
    index.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain attached files
    in your Slack workspace team. Files that match the patterns are included
    in the index. Files that don't match the patterns are excluded from the
    index. If a file matches both an inclusion and exclusion pattern, the
    exclusion pattern takes precedence and the file isn't included in the
    index.|}*)

  public_channel_filter: string list option;
   (**{|
    The list of public channel names to index from your Slack workspace team.
    You use this if you want to index specific public channels, not all
    public channels. You can also use regular expression patterns to filter
    public channels.|}*)

  private_channel_filter: string list option;
   (**{|
    The list of private channel names from your Slack workspace team. You use
    this if you want to index specific private channels, not all private
    channels. You can also use regular expression patterns to filter private
    channels.|}*)

  look_back_period: int option;
   (**{|
    The number of hours for change log to look back from when you last
    synchronized your data. You can look back up to 7 days or 168 hours.
    
    Change log updates your index only if new content was added since you
    last synced your data. Updated or deleted content from before you last
    synced does not get updated in your index. To capture updated or deleted
    content before you last synced, set the [LookBackPeriod] to the number of
    hours you want change log to look back.|}*)

  since_crawl_date: string;
   (**{|
    The date to start crawling your data from your Slack workspace team. The
    date must follow this format: [yyyy-mm-dd].|}*)

  exclude_archived: bool option;
   (**{|
    [TRUE] to exclude archived messages to index from your Slack workspace
    team.|}*)

  crawl_bot_message: bool option;
   (**{|
    [TRUE] to index bot messages from your Slack workspace team.|}*)

  use_change_log: bool option;
   (**{|
    [TRUE] to use the Slack change log to determine which documents require
    updating in the index. Depending on the Slack change log's size, it may
    take longer for Amazon Kendra to use the change log than to scan all of
    your documents in Slack.|}*)

  slack_entity_list: slack_entity list;
   (**{|
    Specify whether to index public channels, private channels, group
    messages, and direct messages. You can specify one or more of these
    options.|}*)

  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud to connect
    to your Slack. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
    the key-value pairs required to connect to your Slack workspace team. The
    secret must contain a JSON structure with the following keys:
    
    {ol 
          {- slackToken—The user or bot token created in Slack. For more
             information on creating a token in Slack, see
             {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-slack.html#slack-authentication }Authentication
             for a Slack data source}.
             }
          
    }
    |}*)

  team_id: string;
   (**{|
    The identifier of the team in the Slack workspace. For example,
    {i T0123456789}.
    
    You can find your team ID in the URL of the main page of your Slack
    workspace. When you log in to Slack via a browser, you are directed to
    the URL of the main page. For example,
    {i https://app.slack.com/client/{b T0123456789}/...}.|}*)

}

(**{|
    Provides the configuration information to connect to Box as your data
    source.|}*)
type box_configuration = {
  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon VPC to connect to your Box. For
    more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain files and
    folders from your Box platform. Files and folders that match the patterns
    are excluded from the index.Files and folders that don't match the
    patterns are included in the index. If a file or folder matches both an
    inclusion and exclusion pattern, the exclusion pattern takes precedence
    and the file or folder isn't included in the index.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain files and
    folders in your Box platform. Files and folders that match the patterns
    are included in the index. Files and folders that don't match the
    patterns are excluded from the index. If a file or folder matches both an
    inclusion and exclusion pattern, the exclusion pattern takes precedence
    and the file or folder isn't included in the index.|}*)

  web_link_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Box web links to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to Box
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Box field names must exist in your Box custom
    metadata.|}*)

  comment_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Box comments to Amazon Kendra index field names. To create
    custom fields, use the [UpdateIndex] API before you map to Box fields.
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Box field names must exist in your Box custom
    metadata.|}*)

  task_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Box tasks to Amazon Kendra index field names. To create
    custom fields, use the [UpdateIndex] API before you map to Box fields.
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Box field names must exist in your Box custom
    metadata.|}*)

  file_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Box files to Amazon Kendra index field names. To create
    custom fields, use the [UpdateIndex] API before you map to Box fields.
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Box field names must exist in your Box custom
    metadata.|}*)

  crawl_web_links: bool option;
   (**{|
    [TRUE] to index web links.|}*)

  crawl_tasks: bool option;
   (**{|
    [TRUE] to index the contents of tasks.|}*)

  crawl_comments: bool option;
   (**{|
    [TRUE] to index comments.|}*)

  use_change_log: bool option;
   (**{|
    [TRUE] to use the Slack change log to determine which documents require
    updating in the index. Depending on the data source change log's size, it
    may take longer for Amazon Kendra to use the change log than to scan all
    of your documents.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
    the key-value pairs required to connect to your Box platform. The secret
    must contain a JSON structure with the following keys:
    
    {ol 
          {- clientID—The identifier of the client OAuth 2.0 authentication
             application created in Box.
             }
          
          {- clientSecret—A set of characters known only to the OAuth 2.0
             authentication application created in Box.
             }
          
          {- publicKeyId—The identifier of the public key contained within
             an identity certificate.
             }
          
          {- privateKey—A set of characters that make up an encryption key.
             }
          
          {- passphrase—A set of characters that act like a password.
             }
          
    }
    
    You create an application in Box to generate the keys or credentials
    required for the secret. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-box.html }Using
    a Box data source}.|}*)

  enterprise_id: string;
   (**{|
    The identifier of the Box Enterprise platform. You can find the
    enterprise ID in the Box Developer Console settings or when you create an
    app in Box and download your authentication credentials. For example,
    {i 801234567}.|}*)

}

(**{|
    Provides the configuration information to connect to Quip as your data
    source.|}*)
type quip_configuration = {
  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud (VPC) to
    connect to your Quip. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain files in your
    Quip file system. Files that match the patterns are excluded from the
    index. Files that don’t match the patterns are included in the index.
    If a file matches both an inclusion pattern and an exclusion pattern, the
    exclusion pattern takes precedence, and the file isn't included in the
    index.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain files in your
    Quip file system. Files that match the patterns are included in the
    index. Files that don't match the patterns are excluded from the index.
    If a file matches both an inclusion pattern and an exclusion pattern, the
    exclusion pattern takes precedence, and the file isn't included in the
    index.|}*)

  attachment_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Quip attachments to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to Quip
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Quip field names must exist in your Quip custom
    metadata.|}*)

  message_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Quip messages to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to Quip
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Quip field names must exist in your Quip custom
    metadata.|}*)

  thread_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Quip threads to Amazon Kendra index field names. To create
    custom fields, use the [UpdateIndex] API before you map to Quip fields.
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Quip field names must exist in your Quip custom
    metadata.|}*)

  folder_ids: string list option;
   (**{|
    The identifiers of the Quip folders you want to index. You can find the
    folder ID in your browser URL when you access your folder in Quip. For
    example,
    {i https://quip-company.quipdomain.com/zlLuOVNSarTL/folder-name}. The
    folder ID in this example is "zlLuOVNSarTL".|}*)

  crawl_attachments: bool option;
   (**{|
    [TRUE] to index attachments.|}*)

  crawl_chat_rooms: bool option;
   (**{|
    [TRUE] to index the contents of chat rooms.|}*)

  crawl_file_comments: bool option;
   (**{|
    [TRUE] to index file comments.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
    the key-value pairs that are required to connect to your Quip. The secret
    must contain a JSON structure with the following keys:
    
    {ol 
          {- accessToken—The token created in Quip. For more information,
             see
             {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-slack.html }Using
             a Quip data source}.
             }
          
    }
    |}*)

  domain: string;
   (**{|
    The Quip site domain. For example,
    {i https://quip-company.quipdomain.com/browse}. The domain in this
    example is "quipdomain".|}*)

}

type issue_sub_entity = | WORKLOGS
  | ATTACHMENTS
  | COMMENTS

(**{|
    Provides the configuration information to connect to Jira as your data
    source.|}*)
type jira_configuration = {
  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud to connect
    to your Jira. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain file paths, file
    names, and file types in your Jira data source. Files that match the
    patterns are excluded from the index. Files that don’t match the
    patterns are included in the index. If a file matches both an inclusion
    pattern and an exclusion pattern, the exclusion pattern takes precedence
    and the file isn't included in the index.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain file paths, file
    names, and file types in your Jira data source. Files that match the
    patterns are included in the index. Files that don't match the patterns
    are excluded from the index. If a file matches both an inclusion pattern
    and an exclusion pattern, the exclusion pattern takes precedence and the
    file isn't included in the index.|}*)

  work_log_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Jira work logs to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to Jira
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Jira data source field names must exist in your
    Jira custom metadata.|}*)

  project_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Jira projects to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to Jira
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Jira data source field names must exist in your
    Jira custom metadata.|}*)

  issue_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Jira issues to Amazon Kendra index field names. To create
    custom fields, use the [UpdateIndex] API before you map to Jira fields.
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Jira data source field names must exist in your
    Jira custom metadata.|}*)

  comment_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Jira comments to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to Jira
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Jira data source field names must exist in your
    Jira custom metadata.|}*)

  attachment_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Jira attachments to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to Jira
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Jira data source field names must exist in your
    Jira custom metadata.|}*)

  issue_sub_entity_filter: issue_sub_entity list option;
   (**{|
    Specify whether to crawl comments, attachments, and work logs. You can
    specify one or more of these options.|}*)

  status: string list option;
   (**{|
    Specify which statuses to crawl in your Jira data source. You can specify
    one or more of these options to crawl.|}*)

  issue_type: string list option;
   (**{|
    Specify which issue types to crawl in your Jira data source. You can
    specify one or more of these options to crawl.|}*)

  project: string list option;
   (**{|
    Specify which projects to crawl in your Jira data source. You can specify
    one or more Jira project IDs.|}*)

  use_change_log: bool option;
   (**{|
    [TRUE] to use the Jira change log to determine which documents require
    updating in the index. Depending on the change log's size, it may take
    longer for Amazon Kendra to use the change log than to scan all of your
    documents in Jira.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of a secret in Secrets Manager contains
    the key-value pairs required to connect to your Jira data source. The
    secret must contain a JSON structure with the following keys:
    
    {ol 
          {- jiraId—The Jira user name or email.
             }
          
          {- jiraCredentials—The Jira API token. For more information, see
             {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-jira.html }Using
             a Jira data source}.
             }
          
    }
    |}*)

  jira_account_url: string;
   (**{|
    The URL of the Jira account. For example, {i company.atlassian.net}.|}*)

}

(**{|
    Provides the configuration information to connect to GitHub Enterprise
    Cloud (SaaS).|}*)
type saa_s_configuration = {
  host_url: string;
   (**{|
    The GitHub host URL or API endpoint URL. For example,
    {i https://api.github.com}.|}*)

  organization_name: string;
   (**{|
    The name of the organization of the GitHub Enterprise Cloud (SaaS)
    account you want to connect to. You can find your organization name by
    logging into GitHub desktop and selecting {b Your organizations} under
    your profile picture dropdown.|}*)

}

(**{|
    Provides the configuration information to connect to GitHub Enterprise
    Server (on premises).|}*)
type on_premise_configuration = {
  ssl_certificate_s3_path: s3_path;
   (**{|
    The path to the SSL certificate stored in an Amazon S3 bucket. You use
    this to connect to GitHub if you require a secure SSL connection.
    
    You can simply generate a self-signed X509 certificate on any computer
    using OpenSSL. For an example of using OpenSSL to create an X509
    certificate, see
    {{: https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html }Create
    and sign an X509 certificate}.|}*)

  organization_name: string;
   (**{|
    The name of the organization of the GitHub Enterprise Server
    (on-premises) account you want to connect to. You can find your
    organization name by logging into GitHub desktop and selecting {b Your
    organizations} under your profile picture dropdown.|}*)

  host_url: string;
   (**{|
    The GitHub host URL or API endpoint URL. For example,
    {i https://on-prem-host-url/api/v3/}|}*)

}

type type_ = | ON_PREMISE
  | SAAS

(**{|
    Provides the configuration information to include certain types of GitHub
    content. You can configure to index repository files only, or also
    include issues and pull requests, comments, and comment attachments.|}*)
type git_hub_document_crawl_properties = {
  crawl_pull_request_comment_attachment: bool option;
   (**{|
    [TRUE] to include all comment attachments for pull requests.|}*)

  crawl_pull_request_comment: bool option;
   (**{|
    [TRUE] to index all comments on pull requests.|}*)

  crawl_pull_request: bool option;
   (**{|
    [TRUE] to index all pull requests within a repository.|}*)

  crawl_issue_comment_attachment: bool option;
   (**{|
    [TRUE] to include all comment attachments for issues.|}*)

  crawl_issue_comment: bool option;
   (**{|
    [TRUE] to index all comments on issues.|}*)

  crawl_issue: bool option;
   (**{|
    [TRUE] to index all issues within a repository.|}*)

  crawl_repository_documents: bool option;
   (**{|
    [TRUE] to index all files with a repository.|}*)

}

(**{|
    Provides the configuration information to connect to GitHub as your data
    source.
    
    Amazon Kendra now supports an upgraded GitHub connector.
    
    You must now use the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    object instead of the [GitHubConfiguration] object to configure your
    connector.
    
    Connectors configured using the older console and API architecture will
    continue to function as configured. However, you won’t be able to edit
    or update them. If you want to edit or update your connector
    configuration, you must create a new connector.
    
    We recommended migrating your connector workflow to the upgraded version.
    Support for connectors configured using the older architecture is
    scheduled to end by June 2024.
    |}*)
type git_hub_configuration = {
  git_hub_pull_request_document_attachment_configuration_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of GitHub pull request attachments to Amazon Kendra index
    field names. To create custom fields, use the [UpdateIndex] API before
    you map to GitHub fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The GitHub data source field names must exist in
    your GitHub custom metadata.|}*)

  git_hub_pull_request_document_configuration_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of GitHub pull requests to Amazon Kendra index field names.
    To create custom fields, use the [UpdateIndex] API before you map to
    GitHub fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The GitHub data source field names must exist in
    your GitHub custom metadata.|}*)

  git_hub_pull_request_comment_configuration_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of GitHub pull request comments to Amazon Kendra index field
    names. To create custom fields, use the [UpdateIndex] API before you map
    to GitHub fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The GitHub data source field names must exist in
    your GitHub custom metadata.|}*)

  git_hub_issue_attachment_configuration_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of GitHub issue attachments to Amazon Kendra index field
    names. To create custom fields, use the [UpdateIndex] API before you map
    to GitHub fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The GitHub data source field names must exist in
    your GitHub custom metadata.|}*)

  git_hub_issue_comment_configuration_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of GitHub issue comments to Amazon Kendra index field names.
    To create custom fields, use the [UpdateIndex] API before you map to
    GitHub fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The GitHub data source field names must exist in
    your GitHub custom metadata.|}*)

  git_hub_issue_document_configuration_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of GitHub issues to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to GitHub
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The GitHub data source field names must exist in
    your GitHub custom metadata.|}*)

  git_hub_commit_configuration_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of GitHub commits to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to GitHub
    fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The GitHub data source field names must exist in
    your GitHub custom metadata.|}*)

  git_hub_repository_configuration_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map GitHub
    repository attributes or field names to Amazon Kendra index field names.
    To create custom fields, use the [UpdateIndex] API before you map to
    GitHub fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The GitHub data source field names must exist in
    your GitHub custom metadata.|}*)

  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information of an Amazon Virtual Private Cloud to connect
    to your GitHub. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  exclusion_file_name_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain file names in
    your GitHub repository or repositories. File names that match the
    patterns are excluded from the index. File names that don't match the
    patterns are included in the index. If a file matches both an exclusion
    and inclusion pattern, the exclusion pattern takes precedence and the
    file isn't included in the index.|}*)

  exclusion_file_type_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain file types in
    your GitHub repository or repositories. File types that match the
    patterns are excluded from the index. File types that don't match the
    patterns are included in the index. If a file matches both an exclusion
    and inclusion pattern, the exclusion pattern takes precedence and the
    file isn't included in the index.|}*)

  exclusion_folder_name_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain folder names in
    your GitHub repository or repositories. Folder names that match the
    patterns are excluded from the index. Folder names that don't match the
    patterns are included in the index. If a folder matches both an exclusion
    and inclusion pattern, the exclusion pattern takes precedence and the
    folder isn't included in the index.|}*)

  inclusion_file_name_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain file names in
    your GitHub repository or repositories. File names that match the
    patterns are included in the index. File names that don't match the
    patterns are excluded from the index. If a file matches both an inclusion
    and exclusion pattern, the exclusion pattern takes precedence and the
    file isn't included in the index.|}*)

  inclusion_file_type_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain file types in
    your GitHub repository or repositories. File types that match the
    patterns are included in the index. File types that don't match the
    patterns are excluded from the index. If a file matches both an inclusion
    and exclusion pattern, the exclusion pattern takes precedence and the
    file isn't included in the index.|}*)

  inclusion_folder_name_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain folder names in
    your GitHub repository or repositories. Folder names that match the
    patterns are included in the index. Folder names that don't match the
    patterns are excluded from the index. If a folder matches both an
    inclusion and exclusion pattern, the exclusion pattern takes precedence
    and the folder isn't included in the index.|}*)

  repository_filter: string list option;
   (**{|
    A list of names of the specific repositories you want to index.|}*)

  git_hub_document_crawl_properties: git_hub_document_crawl_properties option;
   (**{|
    Configuration information to include certain types of GitHub content. You
    can configure to index repository files only, or also include issues and
    pull requests, comments, and comment attachments.|}*)

  use_change_log: bool option;
   (**{|
    [TRUE] to use the GitHub change log to determine which documents require
    updating in the index. Depending on the GitHub change log's size, it may
    take longer for Amazon Kendra to use the change log than to scan all of
    your documents in GitHub.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
    the key-value pairs required to connect to your GitHub. The secret must
    contain a JSON structure with the following keys:
    
    {ol 
          {- personalToken—The access token created in GitHub. For more
             information on creating a token in GitHub, see
             {{: https://docs.aws.amazon.com/kendra/latest/dg/data-source-github.html }Using
             a GitHub data source}.
             }
          
    }
    |}*)

  type_: type_ option;
   (**{|
    The type of GitHub service you want to connect to—GitHub Enterprise
    Cloud (SaaS) or GitHub Enterprise Server (on premises).|}*)

  on_premise_configuration: on_premise_configuration option;
   (**{|
    Configuration information to connect to GitHub Enterprise Server (on
    premises).|}*)

  saa_s_configuration: saa_s_configuration option;
   (**{|
    Configuration information to connect to GitHub Enterprise Cloud (SaaS).|}*)

}

type alfresco_entity = | DocumentLibrary
  | Blog
  | Wiki

(**{|
    Provides the configuration information to connect to Alfresco as your
    data source.
    
    Support for [AlfrescoConfiguration] ended May 2023. We recommend
    migrating to or using the Alfresco data source template schema /
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    API.
    |}*)
type alfresco_configuration = {
  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud to connect
    to your Alfresco. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  exclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to exclude certain files in your
    Alfresco data source. Files that match the patterns are excluded from the
    index. Files that don't match the patterns are included in the index. If
    a file matches both an inclusion pattern and an exclusion pattern, the
    exclusion pattern takes precedence and the file isn't included in the
    index.|}*)

  inclusion_patterns: string list option;
   (**{|
    A list of regular expression patterns to include certain files in your
    Alfresco data source. Files that match the patterns are included in the
    index. Files that don't match the patterns are excluded from the index.
    If a file matches both an inclusion pattern and an exclusion pattern, the
    exclusion pattern takes precedence and the file isn't included in the
    index.|}*)

  wiki_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Alfresco wikis to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to
    Alfresco fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Alfresco data source field names must exist in
    your Alfresco custom metadata.|}*)

  blog_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Alfresco blogs to Amazon Kendra index field names. To
    create custom fields, use the [UpdateIndex] API before you map to
    Alfresco fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Alfresco data source field names must exist in
    your Alfresco custom metadata.|}*)

  document_library_field_mappings: data_source_to_index_field_mapping list option;
   (**{|
    A list of [DataSourceToIndexFieldMapping] objects that map attributes or
    field names of Alfresco document libraries to Amazon Kendra index field
    names. To create custom fields, use the [UpdateIndex] API before you map
    to Alfresco fields. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html }Mapping
    data source fields}. The Alfresco data source field names must exist in
    your Alfresco custom metadata.|}*)

  entity_filter: alfresco_entity list option;
   (**{|
    Specify whether to index document libraries, wikis, or blogs. You can
    specify one or more of these options.|}*)

  crawl_comments: bool option;
   (**{|
    [TRUE] to index comments of blogs and other content.|}*)

  crawl_system_folders: bool option;
   (**{|
    [TRUE] to index shared files.|}*)

  ssl_certificate_s3_path: s3_path;
   (**{|
    The path to the SSL certificate stored in an Amazon S3 bucket. You use
    this to connect to Alfresco if you require a secure SSL connection.
    
    You can simply generate a self-signed X509 certificate on any computer
    using OpenSSL. For an example of using OpenSSL to create an X509
    certificate, see
    {{: https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html }Create
    and sign an X509 certificate}.|}*)

  secret_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
    the key-value pairs required to connect to your Alfresco data source. The
    secret must contain a JSON structure with the following keys:
    
    {ol 
          {- username—The user name of the Alfresco account.
             }
          
          {- password—The password of the Alfresco account.
             }
          
    }
    |}*)

  site_id: string;
   (**{|
    The identifier of the Alfresco site. For example, {i my-site}.|}*)

  site_url: string;
   (**{|
    The URL of the Alfresco site. For example, {i https://hostname:8080}.|}*)

}

type template = Json.t

(**{|
    Provides a template for the configuration information to connect to your
    data source.|}*)
type template_configuration = {
  template: template option;
   (**{|
    The template schema used for the data source, where templates schemas are
    supported.
    
    See
    {{: https://docs.aws.amazon.com/kendra/latest/dg/ds-schemas.html }Data
    source template schemas}.|}*)

}

(**{|
    Provides the configuration information for an Amazon Kendra data source.|}*)
type data_source_configuration = {
  template_configuration: template_configuration option;
   (**{|
    Provides a template for the configuration information to connect to your
    data source.|}*)

  alfresco_configuration: alfresco_configuration option;
   (**{|
    Provides the configuration information to connect to Alfresco as your
    data source.
    
    Support for [AlfrescoConfiguration] ended May 2023. We recommend
    migrating to or using the Alfresco data source template schema /
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    API.
    |}*)

  git_hub_configuration: git_hub_configuration option;
   (**{|
    Provides the configuration information to connect to GitHub as your data
    source.
    
    Amazon Kendra now supports an upgraded GitHub connector.
    
    You must now use the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    object instead of the [GitHubConfiguration] object to configure your
    connector.
    
    Connectors configured using the older console and API architecture will
    continue to function as configured. However, you won’t be able to edit
    or update them. If you want to edit or update your connector
    configuration, you must create a new connector.
    
    We recommended migrating your connector workflow to the upgraded version.
    Support for connectors configured using the older architecture is
    scheduled to end by June 2024.
    |}*)

  jira_configuration: jira_configuration option;
   (**{|
    Provides the configuration information to connect to Jira as your data
    source.|}*)

  quip_configuration: quip_configuration option;
   (**{|
    Provides the configuration information to connect to Quip as your data
    source.|}*)

  box_configuration: box_configuration option;
   (**{|
    Provides the configuration information to connect to Box as your data
    source.|}*)

  slack_configuration: slack_configuration option;
   (**{|
    Provides the configuration information to connect to Slack as your data
    source.
    
    Amazon Kendra now supports an upgraded Slack connector.
    
    You must now use the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    object instead of the [SlackConfiguration] object to configure your
    connector.
    
    Connectors configured using the older console and API architecture will
    continue to function as configured. However, you won't be able to edit or
    update them. If you want to edit or update your connector configuration,
    you must create a new connector.
    
    We recommended migrating your connector workflow to the upgraded version.
    Support for connectors configured using the older architecture is
    scheduled to end by June 2024.
    |}*)

  fsx_configuration: fsx_configuration option;
   (**{|
    Provides the configuration information to connect to Amazon FSx as your
    data source.
    
    Amazon Kendra now supports an upgraded Amazon FSx Windows connector.
    
    You must now use the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    object instead of the [FsxConfiguration] object to configure your
    connector.
    
    Connectors configured using the older console and API architecture will
    continue to function as configured. However, you won't be able to edit or
    update them. If you want to edit or update your connector configuration,
    you must create a new connector.
    
    We recommended migrating your connector workflow to the upgraded version.
    Support for connectors configured using the older architecture is
    scheduled to end by June 2024.
    |}*)

  work_docs_configuration: work_docs_configuration option;
   (**{|
    Provides the configuration information to connect to Amazon WorkDocs as
    your data source.|}*)

  web_crawler_configuration: web_crawler_configuration option;
  
  google_drive_configuration: google_drive_configuration option;
   (**{|
    Provides the configuration information to connect to Google Drive as your
    data source.|}*)

  confluence_configuration: confluence_configuration option;
   (**{|
    Provides the configuration information to connect to Confluence as your
    data source.|}*)

  service_now_configuration: service_now_configuration option;
   (**{|
    Provides the configuration information to connect to ServiceNow as your
    data source.|}*)

  one_drive_configuration: one_drive_configuration option;
   (**{|
    Provides the configuration information to connect to Microsoft OneDrive
    as your data source.|}*)

  salesforce_configuration: salesforce_configuration option;
   (**{|
    Provides the configuration information to connect to Salesforce as your
    data source.|}*)

  database_configuration: database_configuration option;
   (**{|
    Provides the configuration information to connect to a database as your
    data source.|}*)

  share_point_configuration: share_point_configuration option;
   (**{|
    Provides the configuration information to connect to Microsoft SharePoint
    as your data source.|}*)

  s3_configuration: s3_data_source_configuration option;
   (**{|
    Provides the configuration information to connect to an Amazon S3 bucket
    as your data source.
    
    Amazon Kendra now supports an upgraded Amazon S3 connector.
    
    You must now use the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html }TemplateConfiguration}
    object instead of the [S3DataSourceConfiguration] object to configure
    your connector.
    
    Connectors configured using the older console and API architecture will
    continue to function as configured. However, you won't be able to edit or
    update them. If you want to edit or update your connector configuration,
    you must create a new connector.
    
    We recommended migrating your connector workflow to the upgraded version.
    Support for connectors configured using the older architecture is
    scheduled to end by June 2024.
    |}*)

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

(**{|
    The value of a document attribute. You can only provide one value for a
    document attribute.|}*)
type document_attribute_value = {
  date_value: float option;
   (**{|
    A date expressed as an ISO 8601 string.
    
    It is important for the time zone to be included in the ISO 8601
    date-time format. For example, 2012-03-25T12:30:10+01:00 is the ISO 8601
    date-time format for March 25th 2012 at 12:30PM (plus 10 seconds) in
    Central European Time.|}*)

  long_value: int option;
   (**{|
    A long integer value.|}*)

  string_list_value: string list option;
   (**{|
    A list of strings. The default maximum length or number of strings is 10.|}*)

  string_value: string option;
   (**{|
    A string, such as "department".|}*)

}

(**{|
    The condition used for the target document attribute or metadata field
    when ingesting documents into Amazon Kendra. You use this with
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_DocumentAttributeTarget.html }DocumentAttributeTarget
    to apply the condition}.
    
    For example, you can create the 'Department' target field and have it
    prefill department names associated with the documents based on
    information in the 'Source_URI' field. Set the condition that if the
    'Source_URI' field contains 'financial' in its URI value, then prefill
    the target field 'Department' with the target value 'Finance' for the
    document.
    
    Amazon Kendra cannot create a target field if it has not already been
    created as an index field. After you create your index field, you can
    create a document metadata field using [DocumentAttributeTarget]. Amazon
    Kendra then will map your newly created metadata field to your index
    field.|}*)
type document_attribute_condition = {
  condition_on_value: document_attribute_value option;
   (**{|
    The value used by the operator.
    
    For example, you can specify the value 'financial' for strings in the
    'Source_URI' field that partially match or contain this value.|}*)

  operator: condition_operator;
   (**{|
    The condition operator.
    
    For example, you can use 'Contains' to partially match a string.|}*)

  condition_document_attribute_key: string;
   (**{|
    The identifier of the document attribute used for the condition.
    
    For example, 'Source_URI' could be an identifier for the attribute or
    metadata field that contains source URIs associated with the documents.
    
    Amazon Kendra currently does not support [_document_body] as an attribute
    key used for the condition.|}*)

}

(**{|
    The target document attribute or metadata field you want to alter when
    ingesting documents into Amazon Kendra.
    
    For example, you can delete customer identification numbers associated
    with the documents, stored in the document metadata field called
    'Customer_ID'. You set the target key as 'Customer_ID' and the deletion
    flag to [TRUE]. This removes all customer ID values in the field
    'Customer_ID'. This would scrub personally identifiable information from
    each document's metadata.
    
    Amazon Kendra cannot create a target field if it has not already been
    created as an index field. After you create your index field, you can
    create a document metadata field using [DocumentAttributeTarget]. Amazon
    Kendra then will map your newly created metadata field to your index
    field.
    
    You can also use this with
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_DocumentAttributeCondition.html }DocumentAttributeCondition}.
    |}*)
type document_attribute_target = {
  target_document_attribute_value: document_attribute_value option;
   (**{|
    The target value you want to create for the target attribute.
    
    For example, 'Finance' could be the target value for the target attribute
    key 'Department'.|}*)

  target_document_attribute_value_deletion: bool option;
   (**{|
    [TRUE] to delete the existing target value for your specified target
    attribute key. You cannot create a target value and set this to [TRUE].
    To create a target value ([TargetDocumentAttributeValue]), set this to
    [FALSE].|}*)

  target_document_attribute_key: string option;
   (**{|
    The identifier of the target document attribute or metadata field.
    
    For example, 'Department' could be an identifier for the target attribute
    or metadata field that includes the department names associated with the
    documents.|}*)

}

(**{|
    Provides the configuration information for applying basic logic to alter
    document metadata and content when ingesting documents into Amazon
    Kendra. To apply advanced logic, to go beyond what you can do with basic
    logic, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_HookConfiguration.html }HookConfiguration}.
    
    
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html }Customizing
    document metadata during the ingestion process}.|}*)
type inline_custom_document_enrichment_configuration = {
  document_content_deletion: bool option;
   (**{|
    [TRUE] to delete content if the condition used for the target attribute
    is met.|}*)

  target: document_attribute_target option;
   (**{|
    Configuration of the target document attribute or metadata field when
    ingesting documents into Amazon Kendra. You can also include a value.|}*)

  condition: document_attribute_condition option;
   (**{|
    Configuration of the condition used for the target document attribute or
    metadata field when ingesting documents into Amazon Kendra.|}*)

}

(**{|
    Provides the configuration information for invoking a Lambda function in
    Lambda to alter document metadata and content when ingesting documents
    into Amazon Kendra. You can configure your Lambda function using
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_CustomDocumentEnrichmentConfiguration.html }PreExtractionHookConfiguration}
    if you want to apply advanced alterations on the original or raw
    documents. If you want to apply advanced alterations on the Amazon Kendra
    structured documents, you must configure your Lambda function using
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_CustomDocumentEnrichmentConfiguration.html }PostExtractionHookConfiguration}.
    You can only invoke one Lambda function. However, this function can
    invoke other functions it requires.
    
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html }Customizing
    document metadata during the ingestion process}.|}*)
type hook_configuration = {
  s3_bucket: string;
   (**{|
    Stores the original, raw documents or the structured, parsed documents
    before and after altering them. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html#cde-data-contracts-lambda }Data
    contracts for Lambda functions}.|}*)

  lambda_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of a role with permission to run a Lambda
    function during ingestion. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    roles for Amazon Kendra}.|}*)

  invocation_condition: document_attribute_condition option;
   (**{|
    The condition used for when a Lambda function should be invoked.
    
    For example, you can specify a condition that if there are empty
    date-time values, then Amazon Kendra should invoke a function that
    inserts the current date-time.|}*)

}

(**{|
    Provides the configuration information for altering document metadata and
    content during the document ingestion process.
    
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html }Customizing
    document metadata during the ingestion process}.|}*)
type custom_document_enrichment_configuration = {
  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of a role with permission to run
    [PreExtractionHookConfiguration] and [PostExtractionHookConfiguration]
    for altering document metadata and content during the document ingestion
    process. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    roles for Amazon Kendra}.|}*)

  post_extraction_hook_configuration: hook_configuration option;
   (**{|
    Configuration information for invoking a Lambda function in Lambda on the
    structured documents with their metadata and text extracted. You can use
    a Lambda function to apply advanced logic for creating, modifying, or
    deleting document metadata and content. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html#advanced-data-manipulation }Advanced
    data manipulation}.|}*)

  pre_extraction_hook_configuration: hook_configuration option;
   (**{|
    Configuration information for invoking a Lambda function in Lambda on the
    original or raw documents before extracting their metadata and text. You
    can use a Lambda function to apply advanced logic for creating,
    modifying, or deleting document metadata and content. For more
    information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html#advanced-data-manipulation }Advanced
    data manipulation}.|}*)

  inline_configurations: inline_custom_document_enrichment_configuration list option;
   (**{|
    Configuration information to alter document attributes or metadata fields
    and content when ingesting documents into Amazon Kendra.|}*)

}

type update_data_source_request = {
  custom_document_enrichment_configuration: custom_document_enrichment_configuration option;
   (**{|
    Configuration information you want to update for altering document
    metadata and content during the document ingestion process.
    
    For more information on how to create, modify and delete document
    metadata, or make other content alterations when you ingest documents
    into Amazon Kendra, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html }Customizing
    document metadata during the ingestion process}.|}*)

  language_code: string option;
   (**{|
    The code for a language you want to update for the data source connector.
    This allows you to support a language for all documents when updating the
    data source. English is supported by default. For more information on
    supported languages, including their codes, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html }Adding
    documents in languages other than English}.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of a role with permission to access the
    data source and required resources. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    roles for Amazon Kendra}.|}*)

  schedule: string option;
   (**{|
    The sync schedule you want to update for the data source connector.|}*)

  description: string option;
   (**{|
    A new description for the data source connector.|}*)

  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud to connect
    to your data source. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  configuration: data_source_configuration option;
   (**{|
    Configuration information you want to update for the data source
    connector.|}*)

  index_id: string;
   (**{|
    The identifier of the index used with the data source connector.|}*)

  name: string option;
   (**{|
    A new name for the data source connector.|}*)

  id: string;
   (**{|
    The identifier of the data source connector you want to update.|}*)

}

type update_access_control_configuration_response = unit

type principal_type = | GROUP
  | USER

type read_access_type = | DENY
  | ALLOW

(**{|
    Provides user and group information for
    {{: https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html }user
    context filtering}.|}*)
type principal = {
  data_source_id: string option;
   (**{|
    The identifier of the data source the principal should access documents
    from.|}*)

  access: read_access_type;
   (**{|
    Whether to allow or deny document access to the principal.|}*)

  type_: principal_type;
   (**{|
    The type of principal.|}*)

  name: string;
   (**{|
    The name of the user or group.|}*)

}

(**{|
    Information to define the hierarchy for which documents users should have
    access to.|}*)
type hierarchical_principal = {
  principal_list: principal list;
   (**{|
    A list of
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html }principal}
    lists that define the hierarchy for which documents users should have
    access to. Each hierarchical list specifies which user or group has allow
    or deny access for each document.|}*)

}

type update_access_control_configuration_request = {
  hierarchical_access_control_list: hierarchical_principal list option;
   (**{|
    The updated list of
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html }principal}
    lists that define the hierarchy for which documents users should have
    access to.|}*)

  access_control_list: principal list option;
   (**{|
    Information you want to update on principals (users and/or groups) and
    which documents they should have access to. This is useful for user
    context filtering, where search results are filtered based on the user or
    their group access to documents.|}*)

  description: string option;
   (**{|
    A new description for the access control configuration.|}*)

  name: string option;
   (**{|
    A new name for the access control configuration.|}*)

  id: string;
   (**{|
    The identifier of the access control configuration you want to update.|}*)

  index_id: string;
   (**{|
    The identifier of the index for an access control configuration.|}*)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
   (**{|
    A list of tag keys to remove from the index, FAQ, or data source. If a
    tag key does not exist on the resource, it is ignored.|}*)

  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the index, FAQ, or data source to
    remove the tag from.|}*)

}

(**{|
    The resource you want to use isn't available. Please check you have
    provided the correct resource and try again.|}*)
type resource_unavailable_exception = {
  message: string option;
  
}

(**{|
    Provides a range of time.|}*)
type time_range = {
  end_time: float option;
   (**{|
    The Unix timestamp for the end of the time range.|}*)

  start_time: float option;
   (**{|
    The Unix timestamp for the beginning of the time range.|}*)

}

type thesaurus_status = | FAILED
  | ACTIVE_BUT_UPDATE_FAILED
  | UPDATING
  | DELETING
  | ACTIVE
  | CREATING

(**{|
    An array of summary information for a thesaurus or multiple thesauri.|}*)
type thesaurus_summary = {
  updated_at: float option;
   (**{|
    The Unix timestamp when the thesaurus was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when the thesaurus was created.|}*)

  status: thesaurus_status option;
   (**{|
    The status of the thesaurus.|}*)

  name: string option;
   (**{|
    The name of the thesaurus.|}*)

  id: string option;
   (**{|
    The identifier of the thesaurus.|}*)

}

type highlight_type = | THESAURUS_SYNONYM
  | STANDARD

(**{|
    Provides information that you can use to highlight a search result so
    that your users can quickly identify terms in the response.|}*)
type highlight = {
  type_: highlight_type option;
   (**{|
    The highlight type.|}*)

  top_answer: bool option;
   (**{|
    Indicates whether the response is the best response. True if this is the
    best response; otherwise, false.|}*)

  end_offset: int;
   (**{|
    The zero-based location in the response string where the highlight ends.|}*)

  begin_offset: int;
   (**{|
    The zero-based location in the response string where the highlight starts.|}*)

}

(**{|
    Provides text and information about where to highlight the text.|}*)
type text_with_highlights = {
  highlights: highlight list option;
   (**{|
    The beginning and end of the text that should be highlighted.|}*)

  text: string option;
   (**{|
    The text to display to the user.|}*)

}

(**{|
    Provides information about text documents indexed in an index.|}*)
type text_document_statistics = {
  indexed_text_bytes: int;
   (**{|
    The total size, in bytes, of the indexed documents.|}*)

  indexed_text_documents_count: int;
   (**{|
    The number of text documents indexed.|}*)

}

type tag_resource_response = unit

(**{|
    A list of key/value pairs that identify an index, FAQ, or data source.
    Tag keys and values can consist of Unicode letters, digits, white space,
    and any of the following symbols: _ . : / = + - @.|}*)
type tag = {
  value: string;
   (**{|
    The value associated with the tag. The value may be an empty string but
    it can't be null.|}*)

  key: string;
   (**{|
    The key for the tag. Keys are not case sensitive and must be unique for
    the index, FAQ, or data source.|}*)

}

type tag_resource_request = {
  tags: tag list;
   (**{|
    A list of tag keys to add to the index, FAQ, or data source. If a tag
    already exists, the existing value is replaced with the new value.|}*)

  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the index, FAQ, or data source to tag.|}*)

}

(**{|
    Provides information about a table cell in a table excerpt.|}*)
type table_cell = {
  header: bool option;
   (**{|
    [TRUE] means that the table cell should be treated as a header.|}*)

  highlighted: bool option;
   (**{|
    [TRUE] means that the table cell has a high enough confidence and is
    relevant to the query, so the value or content should be highlighted.|}*)

  top_answer: bool option;
   (**{|
    [TRUE] if the response of the table cell is the top answer. This is the
    cell value or content with the highest confidence score or is the most
    relevant to the query.|}*)

  value: string option;
   (**{|
    The actual value or content within a table cell. A table cell could
    contain a date value of a year, or a string value of text, for example.|}*)

}

(**{|
    Information about a row in a table excerpt.|}*)
type table_row = {
  cells: table_cell list option;
   (**{|
    A list of table cells in a row.|}*)

}

(**{|
    An excerpt from a table within a document. The table excerpt displays up
    to five columns and three rows, depending on how many table cells are
    relevant to the query and how many columns are available in the original
    table. The top most relevant cell is displayed in the table excerpt,
    along with the next most relevant cells.|}*)
type table_excerpt = {
  total_number_of_rows: int option;
   (**{|
    A count of the number of rows in the original table within the document.|}*)

  rows: table_row list option;
   (**{|
    A list of rows in the table excerpt.|}*)

}

(**{|
    The text highlights for a single query suggestion.|}*)
type suggestion_highlight = {
  end_offset: int option;
   (**{|
    The zero-based location in the response string where the highlight ends.|}*)

  begin_offset: int option;
   (**{|
    The zero-based location in the response string where the highlight starts.|}*)

}

(**{|
    Provides text and information about where to highlight the query
    suggestion text.|}*)
type suggestion_text_with_highlights = {
  highlights: suggestion_highlight list option;
   (**{|
    The beginning and end of the query suggestion text that should be
    highlighted.|}*)

  text: string option;
   (**{|
    The query suggestion text to display to the user.|}*)

}

(**{|
    The [SuggestionTextWithHighlights] structure information.|}*)
type suggestion_value = {
  text: suggestion_text_with_highlights option;
   (**{|
    The [SuggestionTextWithHighlights] structure that contains the query
    suggestion text and highlights.|}*)

}

type suggestion_type = | DOCUMENT_ATTRIBUTES
  | QUERY

(**{|
    A document attribute or metadata field. To create custom document
    attributes, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-attributes.html }Custom
    attributes}.|}*)
type document_attribute = {
  value: document_attribute_value;
   (**{|
    The value of the attribute.|}*)

  key: string;
   (**{|
    The identifier for the attribute.|}*)

}

(**{|
    The document ID and its fields/attributes that are used for a query
    suggestion, if document fields set to use for query suggestions.|}*)
type source_document = {
  additional_attributes: document_attribute list option;
   (**{|
    The additional fields/attributes to include in the response. You can use
    additional fields to provide extra information in the response.
    Additional fields are not used to based suggestions on.|}*)

  suggestion_attributes: string list option;
   (**{|
    The document fields/attributes used for a query suggestion.|}*)

  document_id: string option;
   (**{|
    The identifier of the document used for a query suggestion.|}*)

}

(**{|
    A single query suggestion.|}*)
type suggestion = {
  source_documents: source_document list option;
   (**{|
    The list of document IDs and their fields/attributes that are used for a
    single query suggestion, if document fields set to use for query
    suggestions.|}*)

  value: suggestion_value option;
   (**{|
    The value for the UUID (universally unique identifier) of a single query
    suggestion.
    
    The value is the text string of a suggestion.|}*)

  id: string option;
   (**{|
    The UUID (universally unique identifier) of a single query suggestion.|}*)

}

(**{|
    Gathers information about when a particular result was clicked by a user.
    Your application uses the [SubmitFeedback] API to provide click
    information.|}*)
type click_feedback = {
  click_time: float;
   (**{|
    The Unix timestamp when the result was clicked.|}*)

  result_id: string;
   (**{|
    The identifier of the search result that was clicked.|}*)

}

type relevance_type = | NOT_RELEVANT
  | RELEVANT

(**{|
    Provides feedback on how relevant a document is to a search. Your
    application uses the [SubmitFeedback] API to provide relevance
    information.|}*)
type relevance_feedback = {
  relevance_value: relevance_type;
   (**{|
    Whether the document was relevant or not relevant to the search.|}*)

  result_id: string;
   (**{|
    The identifier of the search result that the user provided relevance
    feedback for.|}*)

}

type submit_feedback_request = {
  relevance_feedback_items: relevance_feedback list option;
   (**{|
    Provides Amazon Kendra with relevant or not relevant feedback for whether
    a particular item was relevant to the search.|}*)

  click_feedback_items: click_feedback list option;
   (**{|
    Tells Amazon Kendra that a particular search result link was chosen by
    the user.|}*)

  query_id: string;
   (**{|
    The identifier of the specific query for which you are submitting
    feedback. The query ID is returned in the response to the [Query] API.|}*)

  index_id: string;
   (**{|
    The identifier of the index that was queried.|}*)

}

type stop_data_source_sync_job_request = {
  index_id: string;
   (**{|
    The identifier of the index used with the data source connector.|}*)

  id: string;
   (**{|
    The identifier of the data source connector for which to stop the
    synchronization jobs.|}*)

}

type document_status = | UPDATE_FAILED
  | FAILED
  | UPDATED
  | INDEXED
  | PROCESSING
  | NOT_FOUND

(**{|
    Provides information about the status of documents submitted for indexing.|}*)
type status = {
  failure_reason: string option;
   (**{|
    Provides detailed information about why the document couldn't be indexed.
    Use this information to correct the error before you resubmit the
    document for indexing.|}*)

  failure_code: string option;
   (**{|
    Indicates the source of the error.|}*)

  document_status: document_status option;
   (**{|
    The current status of a document.
    
    If the document was submitted for deletion, the status is [NOT_FOUND]
    after the document is deleted.|}*)

  document_id: string option;
   (**{|
    The identifier of the document.|}*)

}

type start_data_source_sync_job_response = {
  execution_id: string option;
   (**{|
    Identifies a particular synchronization job.|}*)

}

type start_data_source_sync_job_request = {
  index_id: string;
   (**{|
    The identifier of the index used with the data source connector.|}*)

  id: string;
   (**{|
    The identifier of the data source connector to synchronize.|}*)

}

(**{|
    The resource you want to use is currently in use. Please check you have
    provided the correct resource and try again.|}*)
type resource_in_use_exception = {
  message: string option;
  
}

(**{|
    Provides the configuration information for suggested query spell
    corrections.
    
    Suggested spell corrections are based on words that appear in your
    indexed documents and how closely a corrected word matches a misspelled
    word.
    
    This feature is designed with certain defaults or limits. For information
    on the current limits and how to request more support for some limits,
    see the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/query-spell-check.html }Spell
    Checker documentation}.|}*)
type spell_correction_configuration = {
  include_query_spell_check_suggestions: bool;
   (**{|
    [TRUE] to suggest spell corrections for queries.|}*)

}

(**{|
    A corrected misspelled word in a query.|}*)
type correction = {
  corrected_term: string option;
   (**{|
    The string or text of a corrected misspelled word in a query.|}*)

  term: string option;
   (**{|
    The string or text of a misspelled word in a query.|}*)

  end_offset: int option;
   (**{|
    The zero-based location in the response string or text where the
    corrected word ends.|}*)

  begin_offset: int option;
   (**{|
    The zero-based location in the response string or text where the
    corrected word starts.|}*)

}

(**{|
    A query with suggested spell corrections.|}*)
type spell_corrected_query = {
  corrections: correction list option;
   (**{|
    The corrected misspelled word or words in a query.|}*)

  suggested_query_text: string option;
   (**{|
    The query with the suggested spell corrections.|}*)

}

type sort_order = | ASC
  | DESC

(**{|
    Specifies the document attribute to use to sort the response to a Amazon
    Kendra query. You can specify a single attribute for sorting. The
    attribute must have the [Sortable] flag set to [true], otherwise Amazon
    Kendra returns an exception.
    
    You can sort attributes of the following types.
    
    {ol 
          {- Date value
             }
          
          {- Long value
             }
          
          {- String value
             }
          
    }
    
    You can't sort attributes of the following type.
    
    {ol 
          {- String list value
             }
          
    }
    |}*)
type sorting_configuration = {
  sort_order: sort_order;
   (**{|
    The order that the results should be returned in. In case of ties, the
    relevance assigned to the result by Amazon Kendra is used as the
    tie-breaker.|}*)

  document_attribute_key: string;
   (**{|
    The name of the document attribute used to sort the response. You can use
    any field that has the [Sortable] flag set to true.
    
    You can also sort by any of the following built-in attributes:
    
    {ol 
          {- _category
             }
          
          {- _created_at
             }
          
          {- _last_updated_at
             }
          
          {- _version
             }
          
          {- _view_count
             }
          
    }
    |}*)

}

(**{|
    Provides the identifier of the KMS key used to encrypt data indexed by
    Amazon Kendra. Amazon Kendra doesn't support asymmetric keys.|}*)
type server_side_encryption_configuration = {
  kms_key_id: string option;
   (**{|
    The identifier of the KMS key. Amazon Kendra doesn't support asymmetric
    keys.|}*)

}

(**{|
    Enumeration
    for
    query
    score
    confidence.|}*)
type score_confidence = | NOT_AVAILABLE
  | LOW
  | MEDIUM
  | HIGH
  | VERY_HIGH

(**{|
    Provides a relative ranking that indicates how confident Amazon Kendra is
    that the response is relevant to the query.|}*)
type score_attributes = {
  score_confidence: score_confidence option;
   (**{|
    A relative ranking for how relevant the response is to the query.|}*)

}

(**{|
    A single retrieved relevant passage result.|}*)
type retrieve_result_item = {
  score_attributes: score_attributes option;
   (**{|
    The confidence score bucket for a retrieved passage result. The
    confidence bucket provides a relative ranking that indicates how
    confident Amazon Kendra is that the response is relevant to the query.|}*)

  document_attributes: document_attribute list option;
   (**{|
    An array of document fields/attributes assigned to a document in the
    search results. For example, the document author ([_author]) or the
    source URI ([_source_uri]) of the document.|}*)

  document_ur_i: string option;
   (**{|
    The URI of the original location of the document.|}*)

  content: string option;
   (**{|
    The contents of the relevant passage.|}*)

  document_title: string option;
   (**{|
    The title of the document.|}*)

  document_id: string option;
   (**{|
    The identifier of the document.|}*)

  id: string option;
   (**{|
    The identifier of the relevant passage result.|}*)

}

type retrieve_result = {
  result_items: retrieve_result_item list option;
   (**{|
    The results of the retrieved relevant passages for the search.|}*)

  query_id: string option;
   (**{|
    The identifier of query used for the search. You also use [QueryId] to
    identify the search when using the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_SubmitFeedback.html }Submitfeedback}
    API.|}*)

}

type attribute_filter = {
  less_than_or_equals: document_attribute option;
   (**{|
    Performs a less than or equals operation on document attributes/fields
    and their values. Use with the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html }document
    attribute type} [Date] or [Long].|}*)

  less_than: document_attribute option;
   (**{|
    Performs a less than operation on document attributes/fields and their
    values. Use with the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html }document
    attribute type} [Date] or [Long].|}*)

  greater_than_or_equals: document_attribute option;
   (**{|
    Performs a greater or equals than operation on document attributes/fields
    and their values. Use with the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html }document
    attribute type} [Date] or [Long].|}*)

  greater_than: document_attribute option;
   (**{|
    Performs a greater than operation on document attributes/fields and their
    values. Use with the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html }document
    attribute type} [Date] or [Long].|}*)

  contains_any: document_attribute option;
   (**{|
    Returns true when a document contains any of the specified document
    attributes/fields. This filter is only applicable to
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html }StringListValue}.
    |}*)

  contains_all: document_attribute option;
   (**{|
    Returns true when a document contains all of the specified document
    attributes/fields. This filter is only applicable to
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html }StringListValue}.
    |}*)

  equals_to: document_attribute option;
   (**{|
    Performs an equals operation on document attributes/fields and their
    values.|}*)

  not_filter: attribute_filter option;
   (**{|
    Performs a logical [NOT] operation on all filters that you specify.|}*)

  or_all_filters: attribute_filter list option;
   (**{|
    Performs a logical [OR] operation on all filters that you specify.|}*)

  and_all_filters: attribute_filter list option;
   (**{|
    Performs a logical [AND] operation on all filters that you specify.|}*)

}

(**{|
    Overrides the document relevance properties of a custom index field.|}*)
type document_relevance_configuration = {
  relevance: relevance;
   (**{|
    Provides information for tuning the relevance of a field in a search.
    When a query includes terms that match the field, the results are given a
    boost in the response based on these tuning parameters.|}*)

  name: string;
   (**{|
    The name of the index field.|}*)

}

type retrieve_request = {
  user_context: user_context option;
   (**{|
    The user context token or user and group information.|}*)

  page_size: int option;
   (**{|
    Sets the number of retrieved relevant passages that are returned in each
    page of results. The default page size is 10. The maximum number of
    results returned is 100. If you ask for more than 100 results, only 100
    are returned.|}*)

  page_number: int option;
   (**{|
    Retrieved relevant passages are returned in pages the size of the
    [PageSize] parameter. By default, Amazon Kendra returns the first page of
    results. Use this parameter to get result pages after the first one.|}*)

  document_relevance_override_configurations: document_relevance_configuration list option;
   (**{|
    Overrides relevance tuning configurations of fields/attributes set at the
    index level.
    
    If you use this API to override the relevance tuning configured at the
    index level, but there is no relevance tuning configured at the index
    level, then Amazon Kendra does not apply any relevance tuning.
    
    If there is relevance tuning configured for fields at the index level,
    and you use this API to override only some of these fields, then for the
    fields you did not override, the importance is set to 1.|}*)

  requested_document_attributes: string list option;
   (**{|
    A list of document fields/attributes to include in the response. You can
    limit the response to include certain document fields. By default, all
    document fields are included in the response.|}*)

  attribute_filter: attribute_filter option;
   (**{|
    Filters search results by document fields/attributes. You can only
    provide one attribute filter; however, the [AndAllFilters], [NotFilter],
    and [OrAllFilters] parameters contain a list of other filters.
    
    The [AttributeFilter] parameter means you can create a set of filtering
    rules that a document must satisfy to be included in the query results.|}*)

  query_text: string;
   (**{|
    The input query text to retrieve relevant passages for the search. Amazon
    Kendra truncates queries at 30 token words, which excludes punctuation
    and stop words. Truncation still applies if you use Boolean or more
    advanced, complex queries. For example, [Timeoff AND October AND
    Category:HR] is counted as 3 tokens: [timeoff], [october], [hr]. For more
    information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/searching-example.html#searching-index-query-syntax }Searching
    with advanced query syntax} in the Amazon Kendra Developer Guide.|}*)

  index_id: string;
   (**{|
    The identifier of the index to retrieve relevant passages for the search.|}*)

}

(**{|
    The resource you want to use already exists. Please check you have
    provided the correct resource and try again.|}*)
type resource_already_exist_exception = {
  message: string option;
  
}

type query_suggestions_status = | UPDATING
  | ACTIVE

type query_suggestions_block_list_status = | FAILED
  | ACTIVE_BUT_UPDATE_FAILED
  | UPDATING
  | DELETING
  | CREATING
  | ACTIVE

(**{|
    Summary information on a query suggestions block list.
    
    This includes information on the block list ID, block list name, when the
    block list was created, when the block list was last updated, and the
    count of block words/phrases in the block list.
    
    For information on the current quota limits for block lists, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/quotas.html }Quotas for
    Amazon Kendra}.|}*)
type query_suggestions_block_list_summary = {
  item_count: int option;
   (**{|
    The number of items in the block list file.|}*)

  updated_at: float option;
   (**{|
    The Unix timestamp when the block list was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when the block list was created.|}*)

  status: query_suggestions_block_list_status option;
   (**{|
    The status of the block list.|}*)

  name: string option;
   (**{|
    The name of the block list.|}*)

  id: string option;
   (**{|
    The identifier of a block list.|}*)

}

type query_result_type = | ANSWER
  | QUESTION_ANSWER
  | DOCUMENT

type query_result_format = | TEXT
  | TABLE

type additional_result_attribute_value_type = | TEXT_WITH_HIGHLIGHTS_VALUE

(**{|
    An attribute returned with a document from a search.|}*)
type additional_result_attribute_value = {
  text_with_highlights_value: text_with_highlights option;
   (**{|
    The text associated with the attribute and information about the
    highlight to apply to the text.|}*)

}

(**{|
    An attribute returned from an index query.|}*)
type additional_result_attribute = {
  value: additional_result_attribute_value;
   (**{|
    An object that contains the attribute value.|}*)

  value_type: additional_result_attribute_value_type;
   (**{|
    The data type of the [Value] property.|}*)

  key: string;
   (**{|
    The key that identifies the attribute.|}*)

}

(**{|
    A single expanded result in a collapsed group of search results.
    
    An expanded result item contains information about an expanded result
    document within a collapsed group of search results. This includes the
    original location of the document, a list of attributes assigned to the
    document, and relevant text from the document that satisfies the query.|}*)
type expanded_result_item = {
  document_attributes: document_attribute list option;
   (**{|
    An array of document attributes assigned to a document in the search
    results. For example, the document author ("_author") or the source URI
    ("_source_uri") of the document.|}*)

  document_ur_i: string option;
   (**{|
    The URI of the original location of the document.|}*)

  document_excerpt: text_with_highlights option;
  
  document_title: text_with_highlights option;
  
  document_id: string option;
   (**{|
    The idenitifier of the document.|}*)

  id: string option;
   (**{|
    The identifier for the expanded result.|}*)

}

(**{|
    Provides details about a collapsed group of search results.|}*)
type collapsed_result_detail = {
  expanded_results: expanded_result_item list option;
   (**{|
    A list of results in the collapsed group.|}*)

  document_attribute: document_attribute;
   (**{|
    The value of the document attribute that results are collapsed on.|}*)

}

(**{|
    A single query result.
    
    A query result contains information about a document returned by the
    query. This includes the original location of the document, a list of
    attributes assigned to the document, and relevant text from the document
    that satisfies the query.|}*)
type query_result_item = {
  collapsed_result_detail: collapsed_result_detail option;
   (**{|
    Provides details about a collapsed group of search results.|}*)

  table_excerpt: table_excerpt option;
   (**{|
    An excerpt from a table within a document.|}*)

  feedback_token: string option;
   (**{|
    A token that identifies a particular result from a particular query. Use
    this token to provide click-through feedback for the result. For more
    information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/submitting-feedback.html }Submitting
    feedback}.|}*)

  score_attributes: score_attributes option;
   (**{|
    Indicates the confidence level of Amazon Kendra providing a relevant
    result for the query. Each result is placed into a bin that indicates the
    confidence, [VERY_HIGH], [HIGH], [MEDIUM] and [LOW]. You can use the
    score to determine if a response meets the confidence needed for your
    application.
    
    The field is only set to [LOW] when the [Type] field is set to [DOCUMENT]
    and Amazon Kendra is not confident that the result is relevant to the
    query.|}*)

  document_attributes: document_attribute list option;
   (**{|
    An array of document fields/attributes assigned to a document in the
    search results. For example, the document author ([_author]) or the
    source URI ([_source_uri]) of the document.|}*)

  document_ur_i: string option;
   (**{|
    The URI of the original location of the document.|}*)

  document_excerpt: text_with_highlights option;
   (**{|
    An extract of the text in the document. Contains information about
    highlighting the relevant terms in the excerpt.|}*)

  document_title: text_with_highlights option;
   (**{|
    The title of the document. Contains the text of the title and information
    for highlighting the relevant terms in the title.|}*)

  document_id: string option;
   (**{|
    The identifier for the document.|}*)

  additional_attributes: additional_result_attribute list option;
   (**{|
    One or more additional fields/attributes associated with the query result.|}*)

  format: query_result_format option;
   (**{|
    If the [Type] of document within the response is [ANSWER], then it is
    either a [TABLE] answer or [TEXT] answer. If it's a table answer, a table
    excerpt is returned in [TableExcerpt]. If it's a text answer, a text
    excerpt is returned in [DocumentExcerpt].|}*)

  type_: query_result_type option;
   (**{|
    The type of document within the response. For example, a response could
    include a question-answer that's relevant to the query.|}*)

  id: string option;
   (**{|
    The unique identifier for the query result item id ([Id]) and the query
    result item document id ([DocumentId]) combined. The value of this field
    changes with every request, even when you have the same documents.|}*)

}

type document_attribute_value_count_pair = {
  facet_results: facet_result list option;
   (**{|
    Contains the results of a document attribute/field that is a nested
    facet. A [FacetResult] contains the counts for each facet nested within a
    facet.
    
    For example, the document attribute or facet "Department" includes a
    value called "Engineering". In addition, the document attribute or facet
    "SubDepartment" includes the values "Frontend" and "Backend" for
    documents assigned to "Engineering". You can display nested facets in the
    search results so that documents can be searched not only by department
    but also by a sub department within a department. The counts for
    documents that belong to "Frontend" and "Backend" within "Engineering"
    are returned for a query.
    
    
    
    |}*)

  count: int option;
   (**{|
    The number of documents in the response that have the attribute/field
    value for the key.|}*)

  document_attribute_value: document_attribute_value option;
   (**{|
    The value of the attribute/field. For example, "HR".|}*)

} and facet_result = {
  document_attribute_value_count_pairs: document_attribute_value_count_pair list option;
   (**{|
    An array of key/value pairs, where the key is the value of the attribute
    and the count is the number of documents that share the key value.|}*)

  document_attribute_value_type: document_attribute_value_type option;
   (**{|
    The data type of the facet value. This is the same as the type defined
    for the index field when it was created.|}*)

  document_attribute_key: string option;
   (**{|
    The key for the facet values. This is the same as the
    [DocumentAttributeKey] provided in the query.|}*)

}

(**{|
    A single featured result item. A featured result is displayed at the top
    of the search results page, placed above all other results for certain
    queries. If there's an exact match of a query, then certain documents are
    featured in the search results.|}*)
type featured_results_item = {
  feedback_token: string option;
   (**{|
    A token that identifies a particular featured result from a particular
    query. Use this token to provide click-through feedback for the result.
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/submitting-feedback.html }Submitting
    feedback}.|}*)

  document_attributes: document_attribute list option;
   (**{|
    An array of document attributes assigned to a featured document in the
    search results. For example, the document author ([_author]) or the
    source URI ([_source_uri]) of the document.|}*)

  document_ur_i: string option;
   (**{|
    The source URI location of the featured document.|}*)

  document_excerpt: text_with_highlights option;
  
  document_title: text_with_highlights option;
  
  document_id: string option;
   (**{|
    The identifier of the featured document.|}*)

  additional_attributes: additional_result_attribute list option;
   (**{|
    One or more additional attributes associated with the featured result.|}*)

  type_: query_result_type option;
   (**{|
    The type of document within the featured result response. For example, a
    response could include a question-answer type that's relevant to the
    query.|}*)

  id: string option;
   (**{|
    The identifier of the featured result.|}*)

}

type query_result = {
  featured_results_items: featured_results_item list option;
   (**{|
    The list of featured result items. Featured results are displayed at the
    top of the search results page, placed above all other results for
    certain queries. If there's an exact match of a query, then certain
    documents are featured in the search results.|}*)

  spell_corrected_queries: spell_corrected_query list option;
   (**{|
    A list of information related to suggested spell corrections for a query.|}*)

  warnings: warning list option;
   (**{|
    A list of warning codes and their messages on problems with your query.
    
    Amazon Kendra currently only supports one type of warning, which is a
    warning on invalid syntax used in the query. For examples of invalid
    query syntax, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/searching-example.html#searching-index-query-syntax }Searching
    with advanced query syntax}.|}*)

  total_number_of_results: int option;
   (**{|
    The total number of items found by the search. However, you can only
    retrieve up to 100 items. For example, if the search found 192 items, you
    can only retrieve the first 100 of the items.|}*)

  facet_results: facet_result list option;
   (**{|
    Contains the facet results. A [FacetResult] contains the counts for each
    field/attribute key that was specified in the [Facets] input parameter.|}*)

  result_items: query_result_item list option;
   (**{|
    The results of the search.|}*)

  query_id: string option;
   (**{|
    The identifier for the search. You also use [QueryId] to identify the
    search when using the
    {{: https://docs.aws.amazon.com/kendra/latest/APIReference/API_SubmitFeedback.html }SubmitFeedback}
    API.|}*)

}

type facet = {
  max_results: int option;
   (**{|
    Maximum number of facet values per facet. The default is 10. You can use
    this to limit the number of facet values to less than 10. If you want to
    increase the default, contact
    {{: http://aws.amazon.com/contact-us/ }Support}.|}*)

  facets: facet list option;
   (**{|
    An array of document attributes that are nested facets within a facet.
    
    For example, the document attribute or facet "Department" includes a
    value called "Engineering". In addition, the document attribute or facet
    "SubDepartment" includes the values "Frontend" and "Backend" for
    documents assigned to "Engineering". You can display nested facets in the
    search results so that documents can be searched not only by department
    but also by a sub department within a department. This helps your users
    further narrow their search.
    
    You can only have one nested facet within a facet. If you want to
    increase this limit, contact
    {{: http://aws.amazon.com/contact-us/ }Support}.|}*)

  document_attribute_key: string option;
   (**{|
    The unique key for the document attribute.|}*)

}

type missing_attribute_key_strategy = | EXPAND
  | COLLAPSE
  | IGNORE

(**{|
    Specifies the configuration information needed to customize how collapsed
    search result groups expand.|}*)
type expand_configuration = {
  max_expanded_results_per_item: int option;
   (**{|
    The number of expanded results to show per collapsed primary document.
    For instance, if you set this value to 3, then at most 3 results per
    collapsed group will be displayed.|}*)

  max_result_items_to_expand: int option;
   (**{|
    The number of collapsed search result groups to expand. If you set this
    value to 10, for example, only the first 10 out of 100 result groups will
    have expand functionality.|}*)

}

(**{|
    Specifies how to group results by document attribute value, and how to
    display them collapsed/expanded under a designated primary document for
    each group.|}*)
type collapse_configuration = {
  expand_configuration: expand_configuration option;
   (**{|
    Provides configuration information to customize expansion options for a
    collapsed group.|}*)

  expand: bool option;
   (**{|
    Specifies whether to expand the collapsed results.|}*)

  missing_attribute_key_strategy: missing_attribute_key_strategy option;
   (**{|
    Specifies the behavior for documents without a value for the collapse
    attribute.
    
    Amazon Kendra offers three customization options:
    
    {ol 
          {- Choose to [COLLAPSE] all documents with null or missing values
             in one group. This is the default configuration.
             }
          
          {- Choose to [IGNORE] documents with null or missing values.
             Ignored documents will not appear in query results.
             }
          
          {- Choose to [EXPAND] each document with a null or missing value
             into a group of its own.
             }
          
    }
    |}*)

  sorting_configurations: sorting_configuration list option;
   (**{|
    A prioritized list of document attributes/fields that determine the
    primary document among those in a collapsed group.|}*)

  document_attribute_key: string;
   (**{|
    The document attribute used to group search results. You can use any
    attribute that has the [Sortable] flag set to true. You can also sort by
    any of the following built-in attributes:"_category","_created_at",
    "_last_updated_at", "_version", "_view_count".|}*)

}

type query_request = {
  collapse_configuration: collapse_configuration option;
   (**{|
    Provides configuration to determine how to group results by document
    attribute value, and how to display them (collapsed or expanded) under a
    designated primary document for each group.|}*)

  spell_correction_configuration: spell_correction_configuration option;
   (**{|
    Enables suggested spell corrections for queries.|}*)

  visitor_id: string option;
   (**{|
    Provides an identifier for a specific user. The [VisitorId] should be a
    unique identifier, such as a GUID. Don't use personally identifiable
    information, such as the user's email address, as the [VisitorId].|}*)

  user_context: user_context option;
   (**{|
    The user context token or user and group information.|}*)

  sorting_configurations: sorting_configuration list option;
   (**{|
    Provides configuration information to determine how the results of a
    query are sorted.
    
    You can set upto 3 fields that Amazon Kendra should sort the results on,
    and specify whether the results should be sorted in ascending or
    descending order. The sort field quota can be increased.
    
    If you don't provide a sorting configuration, the results are sorted by
    the relevance that Amazon Kendra determines for the result. In the case
    of ties in sorting the results, the results are sorted by relevance.|}*)

  sorting_configuration: sorting_configuration option;
   (**{|
    Provides information that determines how the results of the query are
    sorted. You can set the field that Amazon Kendra should sort the results
    on, and specify whether the results should be sorted in ascending or
    descending order. In the case of ties in sorting the results, the results
    are sorted by relevance.
    
    If you don't provide sorting configuration, the results are sorted by the
    relevance that Amazon Kendra determines for the result.|}*)

  page_size: int option;
   (**{|
    Sets the number of results that are returned in each page of results. The
    default page size is 10. The maximum number of results returned is 100.
    If you ask for more than 100 results, only 100 are returned.|}*)

  page_number: int option;
   (**{|
    Query results are returned in pages the size of the [PageSize] parameter.
    By default, Amazon Kendra returns the first page of results. Use this
    parameter to get result pages after the first one.|}*)

  document_relevance_override_configurations: document_relevance_configuration list option;
   (**{|
    Overrides relevance tuning configurations of fields/attributes set at the
    index level.
    
    If you use this API to override the relevance tuning configured at the
    index level, but there is no relevance tuning configured at the index
    level, then Amazon Kendra does not apply any relevance tuning.
    
    If there is relevance tuning configured for fields at the index level,
    and you use this API to override only some of these fields, then for the
    fields you did not override, the importance is set to 1.|}*)

  query_result_type_filter: query_result_type option;
   (**{|
    Sets the type of query result or response. Only results for the specified
    type are returned.|}*)

  requested_document_attributes: string list option;
   (**{|
    An array of document fields/attributes to include in the response. You
    can limit the response to include certain document fields. By default,
    all document attributes are included in the response.|}*)

  facets: facet list option;
   (**{|
    An array of documents fields/attributes for faceted search. Amazon Kendra
    returns a count for each field key specified. This helps your users
    narrow their search.|}*)

  attribute_filter: attribute_filter option;
   (**{|
    Filters search results by document fields/attributes. You can only
    provide one attribute filter; however, the [AndAllFilters], [NotFilter],
    and [OrAllFilters] parameters contain a list of other filters.
    
    The [AttributeFilter] parameter means you can create a set of filtering
    rules that a document must satisfy to be included in the query results.|}*)

  query_text: string option;
   (**{|
    The input query text for the search. Amazon Kendra truncates queries at
    30 token words, which excludes punctuation and stop words. Truncation
    still applies if you use Boolean or more advanced, complex queries. For
    example, [Timeoff AND October AND Category:HR] is counted as 3 tokens:
    [timeoff], [october], [hr]. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/searching-example.html#searching-index-query-syntax }Searching
    with advanced query syntax} in the Amazon Kendra Developer Guide.|}*)

  index_id: string;
   (**{|
    The identifier of the index for the search.|}*)

}

(**{|
    The sub groups that belong to a group.|}*)
type member_group = {
  data_source_id: string option;
   (**{|
    The identifier of the data source for the sub group you want to map to a
    group.|}*)

  group_id: string;
   (**{|
    The identifier of the sub group you want to map to a group.|}*)

}

(**{|
    The users that belong to a group.|}*)
type member_user = {
  user_id: string;
   (**{|
    The identifier of the user you want to map to a group.|}*)

}

(**{|
    A list of users or sub groups that belong to a group. This is useful for
    user context filtering, where search results are filtered based on the
    user or their group access to documents.|}*)
type group_members = {
  s3_pathfor_group_members: s3_path option;
   (**{|
    If you have more than 1000 users and/or sub groups for a single group,
    you need to provide the path to the S3 file that lists your users and sub
    groups for a group. Your sub groups can contain more than 1000 users, but
    the list of sub groups that belong to a group (and/or users) must be no
    more than 1000.
    
    You can download this
    {{: https://docs.aws.amazon.com/kendra/latest/dg/samples/group_members.zip }example
    S3 file} that uses the correct format for listing group members. Note,
    [dataSourceId] is optional. The value of [type] for a group is always
    [GROUP] and for a user it is always [USER].|}*)

  member_users: member_user list option;
   (**{|
    A list of users that belong to a group. For example, a list of interns
    all belong to the "Interns" group.|}*)

  member_groups: member_group list option;
   (**{|
    A list of sub groups that belong to a group. For example, the sub groups
    "Research", "Engineering", and "Sales and Marketing" all belong to the
    group "Company".|}*)

}

type put_principal_mapping_request = {
  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of a role that has access to the S3 file
    that contains your list of users or sub groups that belong to a group.
    
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html#iam-roles-ds }IAM
    roles for Amazon Kendra}.|}*)

  ordering_id: int option;
   (**{|
    The timestamp identifier you specify to ensure Amazon Kendra does not
    override the latest [PUT] action with previous actions. The highest
    number ID, which is the ordering ID, is the latest action you want to
    process and apply on top of other actions with lower number IDs. This
    prevents previous actions with lower number IDs from possibly overriding
    the latest action.
    
    The ordering ID can be the Unix time of the last update you made to a
    group members list. You would then provide this list when calling
    [PutPrincipalMapping]. This ensures your [PUT] action for that updated
    group with the latest members list doesn't get overwritten by earlier
    [PUT] actions for the same group which are yet to be processed.
    
    The default ordering ID is the current Unix time in milliseconds that the
    action was received by Amazon Kendra.|}*)

  group_members: group_members;
   (**{|
    The list that contains your users or sub groups that belong the same
    group.
    
    For example, the group "Company" includes the user "CEO" and the sub
    groups "Research", "Engineering", and "Sales and Marketing".
    
    If you have more than 1000 users and/or sub groups for a single group,
    you need to provide the path to the S3 file that lists your users and sub
    groups for a group. Your sub groups can contain more than 1000 users, but
    the list of sub groups that belong to a group (and/or users) must be no
    more than 1000.|}*)

  group_id: string;
   (**{|
    The identifier of the group you want to map its users to.|}*)

  data_source_id: string option;
   (**{|
    The identifier of the data source you want to map users to their groups.
    
    This is useful if a group is tied to multiple data sources, but you only
    want the group to access documents of a certain data source. For example,
    the groups "Research", "Engineering", and "Sales and Marketing" are all
    tied to the company's documents stored in the data sources Confluence and
    Salesforce. However, "Sales and Marketing" team only needs access to
    customer-related documents stored in Salesforce.|}*)

  index_id: string;
   (**{|
    The identifier of the index you want to map users to their groups.|}*)

}

type principal_mapping_status = | DELETED
  | DELETING
  | PROCESSING
  | SUCCEEDED
  | FAILED

type persona = | VIEWER
  | OWNER

(**{|
    Summary information for users or groups in your IAM Identity Center
    identity source. This applies to users and groups with specific
    permissions that define their level of access to your Amazon Kendra
    experience. You can create an Amazon Kendra experience such as a search
    application. For more information on creating a search application
    experience, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html }Building
    a search experience with no code}.|}*)
type personas_summary = {
  updated_at: float option;
   (**{|
    The Unix timestamp when the summary information was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when the summary information was created.|}*)

  persona: persona option;
   (**{|
    The persona that defines the specific permissions of the user or group in
    your IAM Identity Center identity source. The available personas or
    access roles are [Owner] and [Viewer]. For more information on these
    personas, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html#access-search-experience }Providing
    access to your search page}.|}*)

  entity_id: string option;
   (**{|
    The identifier of a user or group in your IAM Identity Center identity
    source. For example, a user ID could be an email.|}*)

}

type metric_type = | TREND_QUERY_DOC_METRICS
  | AGG_QUERY_DOC_METRICS
  | DOCS_BY_CLICK_COUNT
  | QUERIES_BY_ZERO_RESULT_RATE
  | QUERIES_BY_ZERO_CLICK_RATE
  | QUERIES_BY_COUNT

type list_thesauri_response = {
  thesaurus_summary_items: thesaurus_summary list option;
   (**{|
    An array of summary information for a thesaurus or multiple thesauri.|}*)

  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token that you
    can use in the subsequent request to retrieve the next set of thesauri.|}*)

}

type list_thesauri_request = {
  max_results: int option;
   (**{|
    The maximum number of thesauri to return.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of thesauri
    ([ThesaurusSummaryItems]).|}*)

  index_id: string;
   (**{|
    The identifier of the index with one or more thesauri.|}*)

}

type list_tags_for_resource_response = {
  tags: tag list option;
   (**{|
    A list of tags associated with the index, FAQ, or data source.|}*)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
   (**{|
    The Amazon Resource Name (ARN) of the index, FAQ, or data source to get a
    list of tags for.|}*)

}

type list_query_suggestions_block_lists_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token that you
    can use in the subsequent request to retrieve the next set of block
    lists.|}*)

  block_list_summary_items: query_suggestions_block_list_summary list option;
   (**{|
    Summary items for a block list.
    
    This includes summary items on the block list ID, block list name, when
    the block list was created, when the block list was last updated, and the
    count of block words/phrases in the block list.
    
    For information on the current quota limits for block lists, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/quotas.html }Quotas for
    Amazon Kendra}.|}*)

}

type list_query_suggestions_block_lists_request = {
  max_results: int option;
   (**{|
    The maximum number of block lists to return.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of block lists
    ([BlockListSummaryItems]).|}*)

  index_id: string;
   (**{|
    The identifier of the index for a list of all block lists that exist for
    that index.
    
    For information on the current quota limits for block lists, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/quotas.html }Quotas for
    Amazon Kendra}.|}*)

}

(**{|
    Summary information for groups.|}*)
type group_summary = {
  ordering_id: int option;
   (**{|
    The timestamp identifier used for the latest [PUT] or [DELETE] action.|}*)

  group_id: string option;
   (**{|
    The identifier of the group you want group summary information on.|}*)

}

type index_edition = | ENTERPRISE_EDITION
  | DEVELOPER_EDITION

type index_status = | SYSTEM_UPDATING
  | UPDATING
  | FAILED
  | DELETING
  | ACTIVE
  | CREATING

(**{|
    Summary information on the configuration of an index.|}*)
type index_configuration_summary = {
  status: index_status;
   (**{|
    The current status of the index. When the status is [ACTIVE], the index
    is ready to search.|}*)

  updated_at: float;
   (**{|
    The Unix timestamp when the index was last updated.|}*)

  created_at: float;
   (**{|
    The Unix timestamp when the index was created.|}*)

  edition: index_edition option;
   (**{|
    Indicates whether the index is a Enterprise Edition index or a Developer
    Edition index.|}*)

  id: string option;
   (**{|
    A identifier for the index. Use this to identify the index when you are
    using APIs such as [Query], [DescribeIndex], [UpdateIndex], and
    [DeleteIndex].|}*)

  name: string option;
   (**{|
    The name of the index.|}*)

}

type list_indices_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token that you
    can use in the subsequent request to retrieve the next set of indexes.|}*)

  index_configuration_summary_items: index_configuration_summary list option;
   (**{|
    An array of summary information on the configuration of one or more
    indexes.|}*)

}

type list_indices_request = {
  max_results: int option;
   (**{|
    The maximum number of indices to return.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of indexes.|}*)

}

type list_groups_older_than_ordering_id_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token that you
    can use in the subsequent request to retrieve the next set of groups that
    are mapped to users before a given ordering or timestamp identifier.|}*)

  groups_summaries: group_summary list option;
   (**{|
    Summary information for list of groups that are mapped to users before a
    given ordering or timestamp identifier.|}*)

}

type list_groups_older_than_ordering_id_request = {
  max_results: int option;
   (**{|
    The maximum number of returned groups that are mapped to users before a
    given ordering or timestamp identifier.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of groups that are
    mapped to users before a given ordering or timestamp identifier.|}*)

  ordering_id: int;
   (**{|
    The timestamp identifier used for the latest [PUT] or [DELETE] action for
    mapping users to their groups.|}*)

  data_source_id: string option;
   (**{|
    The identifier of the data source for getting a list of groups mapped to
    users before a given ordering timestamp identifier.|}*)

  index_id: string;
   (**{|
    The identifier of the index for getting a list of groups mapped to users
    before a given ordering or timestamp identifier.|}*)

}

(**{|
    Summary information for a set of featured results. Featured results are
    placed above all other results for certain queries. If there's an exact
    match of a query, then one or more specific documents are featured in the
    search results.|}*)
type featured_results_set_summary = {
  creation_timestamp: int option;
   (**{|
    The Unix timestamp when the set of featured results was created.|}*)

  last_updated_timestamp: int option;
   (**{|
    The Unix timestamp when the set of featured results was last updated.|}*)

  status: featured_results_set_status option;
   (**{|
    The current status of the set of featured results. When the value is
    [ACTIVE], featured results are ready for use. You can still configure
    your settings before setting the status to [ACTIVE]. You can set the
    status to [ACTIVE] or [INACTIVE] using the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html }UpdateFeaturedResultsSet}
    API. The queries you specify for featured results must be unique per
    featured results set for each index, whether the status is [ACTIVE] or
    [INACTIVE].|}*)

  featured_results_set_name: string option;
   (**{|
    The name for the set of featured results.|}*)

  featured_results_set_id: string option;
   (**{|
    The identifier of the set of featured results.|}*)

}

type list_featured_results_sets_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns a pagination token in
    the response.|}*)

  featured_results_set_summary_items: featured_results_set_summary list option;
   (**{|
    An array of summary information for one or more featured results sets.|}*)

}

type list_featured_results_sets_request = {
  max_results: int option;
   (**{|
    The maximum number of featured results sets to return.|}*)

  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns a pagination token in
    the response. You can use this pagination token to retrieve the next set
    of featured results sets.|}*)

  index_id: string;
   (**{|
    The identifier of the index used for featuring results.|}*)

}

type faq_status = | FAILED
  | DELETING
  | ACTIVE
  | UPDATING
  | CREATING

type faq_file_format = | JSON
  | CSV_WITH_HEADER
  | CSV

(**{|
    Summary information for frequently asked questions and answers included
    in an index.|}*)
type faq_summary = {
  language_code: string option;
   (**{|
    The code for a language. This shows a supported language for the FAQ
    document as part of the summary information for FAQs. English is
    supported by default. For more information on supported languages,
    including their codes, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html }Adding
    documents in languages other than English}.|}*)

  file_format: faq_file_format option;
   (**{|
    The file type used to create the FAQ.|}*)

  updated_at: float option;
   (**{|
    The Unix timestamp when the FAQ was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when the FAQ was created.|}*)

  status: faq_status option;
   (**{|
    The current status of the FAQ. When the status is [ACTIVE] the FAQ is
    ready for use.|}*)

  name: string option;
   (**{|
    The name that you assigned the FAQ when you created or updated the FAQ.|}*)

  id: string option;
   (**{|
    The identifier of the FAQ.|}*)

}

type list_faqs_response = {
  faq_summary_items: faq_summary list option;
   (**{|
    information about the FAQs associated with the specified index.|}*)

  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token that you
    can use in the subsequent request to retrieve the next set of FAQs.|}*)

}

type list_faqs_request = {
  max_results: int option;
   (**{|
    The maximum number of FAQs to return in the response. If there are fewer
    results in the list, this response contains only the actual results.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of FAQs.|}*)

  index_id: string;
   (**{|
    The index that contains the FAQ lists.|}*)

}

type experience_status = | FAILED
  | DELETING
  | ACTIVE
  | CREATING

type endpoint_type = | HOME

(**{|
    Provides the configuration information for the endpoint for your Amazon
    Kendra experience.|}*)
type experience_endpoint = {
  endpoint: string option;
   (**{|
    The endpoint of your Amazon Kendra experience.|}*)

  endpoint_type: endpoint_type option;
   (**{|
    The type of endpoint for your Amazon Kendra experience. The type
    currently available is [HOME], which is a unique and fully hosted URL to
    the home page of your Amazon Kendra experience.|}*)

}

(**{|
    Summary information for your Amazon Kendra experience. You can create an
    Amazon Kendra experience such as a search application. For more
    information on creating a search application experience, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html }Building
    a search experience with no code}.|}*)
type experiences_summary = {
  endpoints: experience_endpoint list option;
   (**{|
    The endpoint URLs for your Amazon Kendra experiences. The URLs are unique
    and fully hosted by Amazon Web Services.|}*)

  status: experience_status option;
   (**{|
    The processing status of your Amazon Kendra experience.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when your Amazon Kendra experience was created.|}*)

  id: string option;
   (**{|
    The identifier of your Amazon Kendra experience.|}*)

  name: string option;
   (**{|
    The name of your Amazon Kendra experience.|}*)

}

type list_experiences_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token, which you
    can use in a later request to retrieve the next set of Amazon Kendra
    experiences.|}*)

  summary_items: experiences_summary list option;
   (**{|
    An array of summary information for one or more Amazon Kendra experiences.|}*)

}

type list_experiences_request = {
  max_results: int option;
   (**{|
    The maximum number of returned Amazon Kendra experiences.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of Amazon Kendra
    experiences.|}*)

  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

}

type entity_type = | GROUP
  | USER

(**{|
    Information about the user entity.|}*)
type entity_display_data = {
  last_name: string option;
   (**{|
    The last name of the user.|}*)

  first_name: string option;
   (**{|
    The first name of the user.|}*)

  identified_user_name: string option;
   (**{|
    The user name of the user.|}*)

  group_name: string option;
   (**{|
    The name of the group.|}*)

  user_name: string option;
   (**{|
    The name of the user.|}*)

}

(**{|
    Summary information for users or groups in your IAM Identity Center
    identity source with granted access to your Amazon Kendra experience. You
    can create an Amazon Kendra experience such as a search application. For
    more information on creating a search application experience, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html }Building
    a search experience with no code}.|}*)
type experience_entities_summary = {
  display_data: entity_display_data option;
   (**{|
    Information about the user entity.|}*)

  entity_type: entity_type option;
   (**{|
    Shows the type as [User] or [Group].|}*)

  entity_id: string option;
   (**{|
    The identifier of a user or group in your IAM Identity Center identity
    source. For example, a user ID could be an email.|}*)

}

type list_experience_entities_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token, which you
    can use in a later request to retrieve the next set of users or groups.|}*)

  summary_items: experience_entities_summary list option;
   (**{|
    An array of summary information for one or more users or groups.|}*)

}

type list_experience_entities_request = {
  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of users or
    groups.|}*)

  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  id: string;
   (**{|
    The identifier of your Amazon Kendra experience.|}*)

}

type list_entity_personas_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token, which you
    can use in a later request to retrieve the next set of users or groups.|}*)

  summary_items: personas_summary list option;
   (**{|
    An array of summary information for one or more users or groups.|}*)

}

type list_entity_personas_request = {
  max_results: int option;
   (**{|
    The maximum number of returned users or groups.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of users or
    groups.|}*)

  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  id: string;
   (**{|
    The identifier of your Amazon Kendra experience.|}*)

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

(**{|
    Summary information for a Amazon Kendra data source.|}*)
type data_source_summary = {
  language_code: string option;
   (**{|
    The code for a language. This shows a supported language for all
    documents in the data source. English is supported by default. For more
    information on supported languages, including their codes, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html }Adding
    documents in languages other than English}.|}*)

  status: data_source_status option;
   (**{|
    The status of the data source. When the status is [ACTIVE] the data
    source is ready to use.|}*)

  updated_at: float option;
   (**{|
    The Unix timestamp when the data source connector was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when the data source connector was created.|}*)

  type_: data_source_type option;
   (**{|
    The type of the data source.|}*)

  id: string option;
   (**{|
    The identifier for the data source.|}*)

  name: string option;
   (**{|
    The name of the data source.|}*)

}

type list_data_sources_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token that you
    can use in the subsequent request to retrieve the next set of data source
    connectors.|}*)

  summary_items: data_source_summary list option;
   (**{|
    An array of summary information for one or more data source connector.|}*)

}

type list_data_sources_request = {
  max_results: int option;
   (**{|
    The maximum number of data source connectors to return.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of data source
    connectors.|}*)

  index_id: string;
   (**{|
    The identifier of the index used with one or more data source connectors.|}*)

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

(**{|
    Maps a batch delete document request to a specific data source sync job.
    This is optional and should only be supplied when documents are deleted
    by a data source connector.|}*)
type data_source_sync_job_metrics = {
  documents_scanned: string option;
   (**{|
    The current number of documents crawled by the current sync job in the
    data source.|}*)

  documents_failed: string option;
   (**{|
    The number of documents that failed to sync from the data source up to
    now in the data source sync run.|}*)

  documents_deleted: string option;
   (**{|
    The number of documents deleted from the data source up to now in the
    data source sync run.|}*)

  documents_modified: string option;
   (**{|
    The number of documents modified in the data source up to now in the data
    source sync run.|}*)

  documents_added: string option;
   (**{|
    The number of documents added from the data source up to now in the data
    source sync.|}*)

}

(**{|
    Provides information about a data source synchronization job.|}*)
type data_source_sync_job = {
  metrics: data_source_sync_job_metrics option;
   (**{|
    Maps a batch delete document request to a specific data source sync job.
    This is optional and should only be supplied when documents are deleted
    by a data source connector.|}*)

  data_source_error_code: string option;
   (**{|
    If the reason that the synchronization failed is due to an error with the
    underlying data source, this field contains a code that identifies the
    error.|}*)

  error_code: error_code option;
   (**{|
    If the [Status] field is set to [FAILED], the [ErrorCode] field indicates
    the reason the synchronization failed.|}*)

  error_message: string option;
   (**{|
    If the [Status] field is set to [ERROR], the [ErrorMessage] field
    contains a description of the error that caused the synchronization to
    fail.|}*)

  status: data_source_sync_job_status option;
   (**{|
    The execution status of the synchronization job. When the [Status] field
    is set to [SUCCEEDED], the synchronization job is done. If the status
    code is set to [FAILED], the [ErrorCode] and [ErrorMessage] fields give
    you the reason for the failure.|}*)

  end_time: float option;
   (**{|
    The Unix timestamp when the synchronization job completed.|}*)

  start_time: float option;
   (**{|
    The Unix timestamp when the synchronization job started.|}*)

  execution_id: string option;
   (**{|
    A identifier for the synchronization job.|}*)

}

type list_data_source_sync_jobs_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token that you
    can use in the subsequent request to retrieve the next set of jobs.|}*)

  history: data_source_sync_job list option;
   (**{|
    A history of synchronization jobs for the data source connector.|}*)

}

type list_data_source_sync_jobs_request = {
  status_filter: data_source_sync_job_status option;
   (**{|
    Only returns synchronization jobs with the [Status] field equal to the
    specified status.|}*)

  start_time_filter: time_range option;
   (**{|
    When specified, the synchronization jobs returned in the list are limited
    to jobs between the specified dates.|}*)

  max_results: int option;
   (**{|
    The maximum number of synchronization jobs to return in the response. If
    there are fewer results in the list, this response contains only the
    actual results.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of jobs.|}*)

  index_id: string;
   (**{|
    The identifier of the index used with the data source connector.|}*)

  id: string;
   (**{|
    The identifier of the data source connector.|}*)

}

(**{|
    Summary information on an access control configuration that you created
    for your documents in an index.|}*)
type access_control_configuration_summary = {
  id: string;
   (**{|
    The identifier of the access control configuration.|}*)

}

type list_access_control_configurations_response = {
  access_control_configurations: access_control_configuration_summary list;
   (**{|
    The details of your access control configurations.|}*)

  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token, which you
    can use in the subsequent request to retrieve the next set of access
    control configurations.|}*)

}

type list_access_control_configurations_request = {
  max_results: int option;
   (**{|
    The maximum number of access control configurations to return.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there's more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of access control
    configurations.|}*)

  index_id: string;
   (**{|
    The identifier of the index for the access control configuration.|}*)

}

(**{|
    The input to the request is not valid. Please provide the correct input
    and try again.|}*)
type invalid_request_exception = {
  message: string option;
  
}

type interval = | TWO_MONTHS_AGO
  | ONE_MONTH_AGO
  | TWO_WEEKS_AGO
  | ONE_WEEK_AGO
  | THIS_WEEK
  | THIS_MONTH

(**{|
    Provides statistical information about the FAQ questions and answers
    contained in an index.|}*)
type faq_statistics = {
  indexed_question_answers_count: int;
   (**{|
    The total number of FAQ questions and answers contained in the index.|}*)

}

(**{|
    Provides information about the number of documents and the number of
    questions and answers in an index.|}*)
type index_statistics = {
  text_document_statistics: text_document_statistics;
   (**{|
    The number of text documents indexed.|}*)

  faq_statistics: faq_statistics;
   (**{|
    The number of question and answer topics in the index.|}*)

}

(**{|
    Summary information on the processing of [PUT] and [DELETE] actions for
    mapping users to their groups.|}*)
type group_ordering_id_summary = {
  failure_reason: string option;
   (**{|
    The reason an action could not be processed. An action can be a [PUT] or
    [DELETE] action for mapping users to their groups.|}*)

  ordering_id: int option;
   (**{|
    The order in which actions should complete processing. An action can be a
    [PUT] or [DELETE] action for mapping users to their groups.|}*)

  received_at: float option;
   (**{|
    The Unix timestamp when an action was received by Amazon Kendra. An
    action can be a [PUT] or [DELETE] action for mapping users to their
    groups.|}*)

  last_updated_at: float option;
   (**{|
    The Unix timestamp when an action was last updated. An action can be a
    [PUT] or [DELETE] action for mapping users to their groups.|}*)

  status: principal_mapping_status option;
   (**{|
    The current processing status of actions for mapping users to their
    groups. The status can be either [PROCESSING], [SUCCEEDED], [DELETING],
    [DELETED], or [FAILED].|}*)

}

type get_snapshots_response = {
  next_token: string option;
   (**{|
    If the response is truncated, Amazon Kendra returns this token, which you
    can use in a later request to retrieve the next set of search metrics
    data.|}*)

  snapshots_data: string list list option;
   (**{|
    The search metrics data. The data returned depends on the metric type you
    requested.|}*)

  snapshots_data_header: string list option;
   (**{|
    The column headers for the search metrics data.|}*)

  snap_shot_time_filter: time_range option;
   (**{|
    The Unix timestamp for the beginning and end of the time window for the
    search metrics data.|}*)

}

type get_snapshots_request = {
  max_results: int option;
   (**{|
    The maximum number of returned data for the metric.|}*)

  next_token: string option;
   (**{|
    If the previous response was incomplete (because there is more data to
    retrieve), Amazon Kendra returns a pagination token in the response. You
    can use this pagination token to retrieve the next set of search metrics
    data.|}*)

  metric_type: metric_type;
   (**{|
    The metric you want to retrieve. You can specify only one metric per call.
    
    For more information about the metrics you can view, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/search-analytics.html }Gaining
    insights with search analytics}.|}*)

  interval: interval;
   (**{|
    The time interval or time window to get search metrics data. The time
    interval uses the time zone of your index. You can view data in the
    following time windows:
    
    {ol 
          {- [THIS_WEEK]: The current week, starting on the Sunday and ending
             on the day before the current date.
             }
          
          {- [ONE_WEEK_AGO]: The previous week, starting on the Sunday and
             ending on the following Saturday.
             }
          
          {- [TWO_WEEKS_AGO]: The week before the previous week, starting on
             the Sunday and ending on the following Saturday.
             }
          
          {- [THIS_MONTH]: The current month, starting on the first day of
             the month and ending on the day before the current date.
             }
          
          {- [ONE_MONTH_AGO]: The previous month, starting on the first day
             of the month and ending on the last day of the month.
             }
          
          {- [TWO_MONTHS_AGO]: The month before the previous month, starting
             on the first day of the month and ending on last day of the
             month.
             }
          
    }
    |}*)

  index_id: string;
   (**{|
    The identifier of the index to get search metrics data.|}*)

}

type get_query_suggestions_response = {
  suggestions: suggestion list option;
   (**{|
    A list of query suggestions for an index.|}*)

  query_suggestions_id: string option;
   (**{|
    The identifier for a list of query suggestions for an index.|}*)

}

(**{|
    Provides the configuration information for the document fields/attributes
    that you want to base query suggestions on.|}*)
type attribute_suggestions_get_config = {
  user_context: user_context option;
   (**{|
    Applies user context filtering so that only users who are given access to
    certain documents see these document in their search results.|}*)

  attribute_filter: attribute_filter option;
   (**{|
    Filters the search results based on document fields/attributes.|}*)

  additional_response_attributes: string list option;
   (**{|
    The list of additional document field/attribute keys or field names to
    include in the response. You can use additional fields to provide extra
    information in the response. Additional fields are not used to based
    suggestions on.|}*)

  suggestion_attributes: string list option;
   (**{|
    The list of document field/attribute keys or field names to use for query
    suggestions. If the content within any of the fields match what your user
    starts typing as their query, then the field content is returned as a
    query suggestion.|}*)

}

type get_query_suggestions_request = {
  attribute_suggestions_config: attribute_suggestions_get_config option;
   (**{|
    Configuration information for the document fields/attributes that you
    want to base query suggestions on.|}*)

  suggestion_types: suggestion_type list option;
   (**{|
    The suggestions type to base query suggestions on. The suggestion types
    are query history or document fields/attributes. You can set one type or
    the other.
    
    If you set query history as your suggestions type, Amazon Kendra suggests
    queries relevant to your users based on popular queries in the query
    history.
    
    If you set document fields/attributes as your suggestions type, Amazon
    Kendra suggests queries relevant to your users based on the contents of
    document fields.|}*)

  max_suggestions_count: int option;
   (**{|
    The maximum number of query suggestions you want to show to your users.|}*)

  query_text: string;
   (**{|
    The text of a user's query to generate query suggestions.
    
    A query is suggested if the query prefix matches what a user starts to
    type as their query.
    
    Amazon Kendra does not show any suggestions if a user types fewer than
    two characters or more than 60 characters. A query must also have at
    least one search result and contain at least one word of more than four
    characters.|}*)

  index_id: string;
   (**{|
    The identifier of the index you want to get query suggestions from.|}*)

}

(**{|
    A featured document with its metadata information. This document is
    displayed at the top of the search results page, placed above all other
    results for certain queries. If there's an exact match of a query, then
    the document is featured in the search results.|}*)
type featured_document_with_metadata = {
  ur_i: string option;
   (**{|
    The source URI location of the featured document.|}*)

  title: string option;
   (**{|
    The main title of the featured document.|}*)

  id: string option;
   (**{|
    The identifier of the featured document with its metadata. You can use
    the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_Query.html }Query}
    API to search for specific documents with their document IDs included in
    the result items, or you can use the console.|}*)

}

(**{|
    A document ID doesn't exist but you have specified as a featured
    document. Amazon Kendra cannot feature the document if it doesn't exist
    in the index. You can check the status of a document and its ID or check
    for documents with status errors using the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_BatchGetDocumentStatus.html }BatchGetDocumentStatus}
    API.|}*)
type featured_document_missing = {
  id: string option;
   (**{|
    The identifier of the document that doesn't exist but you have specified
    as a featured document.|}*)

}

(**{|
    Information on the users or groups in your IAM Identity Center identity
    source that failed to properly configure with your Amazon Kendra
    experience.|}*)
type failed_entity = {
  error_message: string option;
   (**{|
    The reason the user or group in your IAM Identity Center identity source
    failed to properly configure with your Amazon Kendra experience.|}*)

  entity_id: string option;
   (**{|
    The identifier of the user or group in your IAM Identity Center identity
    source. For example, a user ID could be an email.|}*)

}

(**{|
    Provides the configuration information for users or groups in your IAM
    Identity Center identity source for access to your Amazon Kendra
    experience. Specific permissions are defined for each user or group once
    they are granted access to your Amazon Kendra experience.|}*)
type entity_persona_configuration = {
  persona: persona;
   (**{|
    The persona that defines the specific permissions of the user or group in
    your IAM Identity Center identity source. The available personas or
    access roles are [Owner] and [Viewer]. For more information on these
    personas, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html#access-search-experience }Providing
    access to your search page}.|}*)

  entity_id: string;
   (**{|
    The identifier of a user or group in your IAM Identity Center identity
    source. For example, a user ID could be an email.|}*)

}

(**{|
    Provides the configuration information for users or groups in your IAM
    Identity Center identity source to grant access your Amazon Kendra
    experience.|}*)
type entity_configuration = {
  entity_type: entity_type;
   (**{|
    Specifies whether you are configuring a [User] or a [Group].|}*)

  entity_id: string;
   (**{|
    The identifier of a user or group in your IAM Identity Center identity
    source. For example, a user ID could be an email.|}*)

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

(**{|
    A document in an index.|}*)
type document = {
  access_control_configuration_id: string option;
   (**{|
    The identifier of the access control configuration that you want to apply
    to the document.|}*)

  content_type: content_type option;
   (**{|
    The file type of the document in the [Blob] field.
    
    If you want to index snippets or subsets of HTML documents instead of the
    entirety of the HTML documents, you must add the [HTML] start and closing
    tags ([content]) around the content.|}*)

  hierarchical_access_control_list: hierarchical_principal list option;
   (**{|
    The list of
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html }principal}
    lists that define the hierarchy for which documents users should have
    access to.|}*)

  access_control_list: principal list option;
   (**{|
    Information on principals (users and/or groups) and which documents they
    should have access to. This is useful for user context filtering, where
    search results are filtered based on the user or their group access to
    documents.|}*)

  attributes: document_attribute list option;
   (**{|
    Custom attributes to apply to the document. Use the custom attributes to
    provide additional information for searching, to provide facets for
    refining searches, and to provide additional information in the query
    response.
    
    For example, 'DataSourceId' and 'DataSourceSyncJobId' are custom
    attributes that provide information on the synchronization of documents
    running on a data source. Note, 'DataSourceSyncJobId' could be an
    optional custom attribute as Amazon Kendra will use the ID of a running
    sync job.|}*)

  s3_path: s3_path option;
  
  blob: bytes option;
   (**{|
    The contents of the document.
    
    Documents passed to the [Blob] parameter must be base64 encoded. Your
    code might not need to encode the document file bytes if you're using an
    Amazon Web Services SDK to call Amazon Kendra APIs. If you are calling
    the Amazon Kendra endpoint directly using REST, you must base64 encode
    the contents before sending.|}*)

  title: string option;
   (**{|
    The title of the document.|}*)

  id: string;
   (**{|
    A identifier of the document in the index.
    
    Note, each document ID must be unique per index. You cannot create a data
    source to index your documents with their unique IDs and then use the
    [BatchPutDocument] API to index the same documents, or vice versa. You
    can delete a data source and then use the [BatchPutDocument] API to index
    the same documents, or vice versa.|}*)

}

(**{|
    Identifies a document for which to retrieve status information|}*)
type document_info = {
  attributes: document_attribute list option;
   (**{|
    Attributes that identify a specific version of a document to check.
    
    The only valid attributes are:
    
    {ol 
          {- version
             }
          
          {- datasourceId
             }
          
          {- jobExecutionId
             }
          
    }
    
    The attributes follow these rules:
    
    {ol 
          {- [dataSourceId] and [jobExecutionId] must be used together.
             }
          
          {- [version] is ignored if [dataSourceId] and [jobExecutionId] are
             not provided.
             }
          
          {- If [dataSourceId] and [jobExecutionId] are provided, but
             [version] is not, the version defaults to "0".
             }
          
    }
    |}*)

  document_id: string;
   (**{|
    The identifier of the document.|}*)

}

type disassociate_personas_from_entities_response = {
  failed_entity_list: failed_entity list option;
   (**{|
    Lists the users or groups in your IAM Identity Center identity source
    that failed to properly remove access to your Amazon Kendra experience.|}*)

}

type disassociate_personas_from_entities_request = {
  entity_ids: string list;
   (**{|
    The identifiers of users or groups in your IAM Identity Center identity
    source. For example, user IDs could be user emails.|}*)

  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  id: string;
   (**{|
    The identifier of your Amazon Kendra experience.|}*)

}

type disassociate_entities_from_experience_response = {
  failed_entity_list: failed_entity list option;
   (**{|
    Lists the users or groups in your IAM Identity Center identity source
    that failed to properly remove access to your Amazon Kendra experience.|}*)

}

type disassociate_entities_from_experience_request = {
  entity_list: entity_configuration list;
   (**{|
    Lists users or groups in your IAM Identity Center identity source.|}*)

  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  id: string;
   (**{|
    The identifier of your Amazon Kendra experience.|}*)

}

type describe_thesaurus_response = {
  synonym_rule_count: int option;
   (**{|
    The number of synonym rules in the thesaurus file.|}*)

  term_count: int option;
   (**{|
    The number of unique terms in the thesaurus file. For example, the
    synonyms [a,b,c] and [a=>d], the term count would be 4.|}*)

  file_size_bytes: int option;
   (**{|
    The size of the thesaurus file in bytes.|}*)

  source_s3_path: s3_path option;
  
  role_arn: string option;
   (**{|
    An IAM role that gives Amazon Kendra permissions to access thesaurus file
    specified in [SourceS3Path].|}*)

  updated_at: float option;
   (**{|
    The Unix timestamp when the thesaurus was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when the thesaurus was created.|}*)

  error_message: string option;
   (**{|
    When the [Status] field value is [FAILED], the [ErrorMessage] field
    provides more information.|}*)

  status: thesaurus_status option;
   (**{|
    The current status of the thesaurus. When the value is [ACTIVE], queries
    are able to use the thesaurus. If the [Status] field value is [FAILED],
    the [ErrorMessage] field provides more information.
    
    If the status is [ACTIVE_BUT_UPDATE_FAILED], it means that Amazon Kendra
    could not ingest the new thesaurus file. The old thesaurus file is still
    active.|}*)

  description: string option;
   (**{|
    The thesaurus description.|}*)

  name: string option;
   (**{|
    The thesaurus name.|}*)

  index_id: string option;
   (**{|
    The identifier of the index for the thesaurus.|}*)

  id: string option;
   (**{|
    The identifier of the thesaurus.|}*)

}

type describe_thesaurus_request = {
  index_id: string;
   (**{|
    The identifier of the index for the thesaurus.|}*)

  id: string;
   (**{|
    The identifier of the thesaurus you want to get information on.|}*)

}

(**{|
    Gets information on the configuration of document fields/attributes that
    you want to base query suggestions on. To change your configuration, use
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_AttributeSuggestionsUpdateConfig.html }AttributeSuggestionsUpdateConfig}
    and then call
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html }UpdateQuerySuggestionsConfig}.
    |}*)
type attribute_suggestions_describe_config = {
  attribute_suggestions_mode: attribute_suggestions_mode option;
   (**{|
    The mode is set to either [ACTIVE] or [INACTIVE]. If the [Mode] for query
    history is set to [ENABLED] when calling
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html }UpdateQuerySuggestionsConfig}
    and [AttributeSuggestionsMode] to use fields/attributes is set to
    [ACTIVE], and you haven't set your [SuggestionTypes] preference to
    [DOCUMENT_ATTRIBUTES], then Amazon Kendra uses the query history.|}*)

  suggestable_config_list: suggestable_config list option;
   (**{|
    The list of fields/attributes that you want to set as suggestible for
    query suggestions.|}*)

}

type describe_query_suggestions_config_response = {
  attribute_suggestions_config: attribute_suggestions_describe_config option;
   (**{|
    Configuration information for the document fields/attributes that you
    want to base query suggestions on.|}*)

  total_suggestions_count: int option;
   (**{|
    The current total count of query suggestions for an index.
    
    This count can change when you update your query suggestions settings, if
    you filter out certain queries from suggestions using a block list, and
    as the query log accumulates more queries for Amazon Kendra to learn
    from.
    
    If the count is much lower than you expected, it could be because Amazon
    Kendra needs more queries in the query history to learn from or your
    current query suggestions settings are too strict.|}*)

  last_clear_time: float option;
   (**{|
    The Unix timestamp when query suggestions for an index was last cleared.
    
    After you clear suggestions, Amazon Kendra learns new suggestions based
    on new queries added to the query log from the time you cleared
    suggestions. Amazon Kendra only considers re-occurences of a query from
    the time you cleared suggestions.|}*)

  last_suggestions_build_time: float option;
   (**{|
    The Unix timestamp when query suggestions for an index was last updated.
    
    Amazon Kendra automatically updates suggestions every 24 hours, after you
    change a setting or after you apply a
    {{: https://docs.aws.amazon.com/kendra/latest/dg/query-suggestions.html#query-suggestions-blocklist }block
    list}.|}*)

  minimum_query_count: int option;
   (**{|
    The minimum number of times a query must be searched in order for the
    query to be eligible to suggest to your users.|}*)

  minimum_number_of_querying_users: int option;
   (**{|
    The minimum number of unique users who must search a query in order for
    the query to be eligible to suggest to your users.|}*)

  include_queries_without_user_information: bool option;
   (**{|
    [TRUE] to use all queries, otherwise use only queries that include user
    information to generate the query suggestions.|}*)

  query_log_look_back_window_in_days: int option;
   (**{|
    How recent your queries are in your query log time window (in days).|}*)

  status: query_suggestions_status option;
   (**{|
    Whether the status of query suggestions settings is currently [ACTIVE] or
    [UPDATING].
    
    Active means the current settings apply and Updating means your changed
    settings are in the process of applying.|}*)

  mode: mode option;
   (**{|
    Whether query suggestions are currently in [ENABLED] mode or [LEARN_ONLY]
    mode.
    
    By default, Amazon Kendra enables query suggestions.[LEARN_ONLY] turns
    off query suggestions for your users. You can change the mode using the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html }UpdateQuerySuggestionsConfig}
    API.|}*)

}

type describe_query_suggestions_config_request = {
  index_id: string;
   (**{|
    The identifier of the index with query suggestions that you want to get
    information on.|}*)

}

type describe_query_suggestions_block_list_response = {
  role_arn: string option;
   (**{|
    The IAM (Identity and Access Management) role used by Amazon Kendra to
    access the block list text file in S3.
    
    The role needs S3 read permissions to your file in S3 and needs to give
    STS (Security Token Service) assume role permissions to Amazon Kendra.|}*)

  file_size_bytes: int option;
   (**{|
    The current size of the block list text file in S3.|}*)

  item_count: int option;
   (**{|
    The current number of valid, non-empty words or phrases in the block list
    text file.|}*)

  source_s3_path: s3_path option;
   (**{|
    Shows the current S3 path to your block list text file in your S3 bucket.
    
    Each block word or phrase should be on a separate line in a text file.
    
    For information on the current quota limits for block lists, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/quotas.html }Quotas for
    Amazon Kendra}.|}*)

  updated_at: float option;
   (**{|
    The Unix timestamp when a block list for query suggestions was last
    updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when a block list for query suggestions was created.|}*)

  error_message: string option;
   (**{|
    The error message containing details if there are issues processing the
    block list.|}*)

  status: query_suggestions_block_list_status option;
   (**{|
    The current status of the block list. When the value is [ACTIVE], the
    block list is ready for use.|}*)

  description: string option;
   (**{|
    The description for the block list.|}*)

  name: string option;
   (**{|
    The name of the block list.|}*)

  id: string option;
   (**{|
    The identifier of the block list.|}*)

  index_id: string option;
   (**{|
    The identifier of the index for the block list.|}*)

}

type describe_query_suggestions_block_list_request = {
  id: string;
   (**{|
    The identifier of the block list you want to get information on.|}*)

  index_id: string;
   (**{|
    The identifier of the index for the block list.|}*)

}

type describe_principal_mapping_response = {
  group_ordering_id_summaries: group_ordering_id_summary list option;
   (**{|
    Shows the following information on the processing of [PUT] and [DELETE]
    actions for mapping users to their groups:
    
    {ol 
          {- Status—the status can be either [PROCESSING], [SUCCEEDED],
             [DELETING], [DELETED], or [FAILED].
             }
          
          {- Last updated—the last date-time an action was updated.
             }
          
          {- Received—the last date-time an action was received or
             submitted.
             }
          
          {- Ordering ID—the latest action that should process and apply
             after other actions.
             }
          
          {- Failure reason—the reason an action could not be processed.
             }
          
    }
    |}*)

  group_id: string option;
   (**{|
    Shows the identifier of the group to see information on the processing of
    [PUT] and [DELETE] actions for mapping users to their groups.|}*)

  data_source_id: string option;
   (**{|
    Shows the identifier of the data source to see information on the
    processing of [PUT] and [DELETE] actions for mapping users to their
    groups.|}*)

  index_id: string option;
   (**{|
    Shows the identifier of the index to see information on the processing of
    [PUT] and [DELETE] actions for mapping users to their groups.|}*)

}

type describe_principal_mapping_request = {
  group_id: string;
   (**{|
    The identifier of the group required to check the processing of [PUT] and
    [DELETE] actions for mapping users to their groups.|}*)

  data_source_id: string option;
   (**{|
    The identifier of the data source to check the processing of [PUT] and
    [DELETE] actions for mapping users to their groups.|}*)

  index_id: string;
   (**{|
    The identifier of the index required to check the processing of [PUT] and
    [DELETE] actions for mapping users to their groups.|}*)

}

type describe_index_response = {
  user_group_resolution_configuration: user_group_resolution_configuration option;
   (**{|
    Whether you have enabled IAM Identity Center identity source for your
    users and groups. This is useful for user context filtering, where search
    results are filtered based on the user or their group access to
    documents.|}*)

  user_context_policy: user_context_policy option;
   (**{|
    The user context policy for the Amazon Kendra index.|}*)

  user_token_configurations: user_token_configuration list option;
   (**{|
    The user token configuration for the Amazon Kendra index.|}*)

  capacity_units: capacity_units_configuration option;
   (**{|
    For Enterprise Edition indexes, you can choose to use additional capacity
    to meet the needs of your application. This contains the capacity units
    used for the index. A query or document storage capacity of zero
    indicates that the index is using the default capacity. For more
    information on the default capacity for an index and adjusting this, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html }Adjusting
    capacity}.|}*)

  error_message: string option;
   (**{|
    When the [Status] field value is [FAILED], the [ErrorMessage] field
    contains a message that explains why.|}*)

  index_statistics: index_statistics option;
   (**{|
    Provides information about the number of FAQ questions and answers and
    the number of text documents indexed.|}*)

  document_metadata_configurations: document_metadata_configuration list option;
   (**{|
    Configuration information for document metadata or fields. Document
    metadata are fields or attributes associated with your documents. For
    example, the company department name associated with each document.|}*)

  updated_at: float option;
   (**{|
    The Unix timestamp when the index was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when the index was created.|}*)

  description: string option;
   (**{|
    The description for the index.|}*)

  status: index_status option;
   (**{|
    The current status of the index. When the value is [ACTIVE], the index is
    ready for use. If the [Status] field value is [FAILED], the
    [ErrorMessage] field contains a message that explains why.|}*)

  server_side_encryption_configuration: server_side_encryption_configuration option;
   (**{|
    The identifier of the KMS customer master key (CMK) that is used to
    encrypt your data. Amazon Kendra doesn't support asymmetric CMKs.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM role that gives Amazon Kendra
    permission to write to your Amazon CloudWatch logs.|}*)

  edition: index_edition option;
   (**{|
    The Amazon Kendra edition used for the index. You decide the edition when
    you create the index.|}*)

  id: string option;
   (**{|
    The identifier of the index.|}*)

  name: string option;
   (**{|
    The name of the index.|}*)

}

type describe_index_request = {
  id: string;
   (**{|
    The identifier of the index you want to get information on.|}*)

}

type describe_featured_results_set_response = {
  creation_timestamp: int option;
   (**{|
    The Unix timestamp when the set of the featured results was created.|}*)

  last_updated_timestamp: int option;
   (**{|
    The timestamp when the set of featured results was last updated.|}*)

  featured_documents_missing: featured_document_missing list option;
   (**{|
    The list of document IDs that don't exist but you have specified as
    featured documents. Amazon Kendra cannot feature these documents if they
    don't exist in the index. You can check the status of a document and its
    ID or check for documents with status errors using the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_BatchGetDocumentStatus.html }BatchGetDocumentStatus}
    API.|}*)

  featured_documents_with_metadata: featured_document_with_metadata list option;
   (**{|
    The list of document IDs for the documents you want to feature with their
    metadata information. For more information on the list of featured
    documents, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html }FeaturedResultsSet}.
    |}*)

  query_texts: string list option;
   (**{|
    The list of queries for featuring results. For more information on the
    list of queries, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html }FeaturedResultsSet}.
    |}*)

  status: featured_results_set_status option;
   (**{|
    The current status of the set of featured results. When the value is
    [ACTIVE], featured results are ready for use. You can still configure
    your settings before setting the status to [ACTIVE]. You can set the
    status to [ACTIVE] or [INACTIVE] using the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html }UpdateFeaturedResultsSet}
    API. The queries you specify for featured results must be unique per
    featured results set for each index, whether the status is [ACTIVE] or
    [INACTIVE].|}*)

  description: string option;
   (**{|
    The description for the set of featured results.|}*)

  featured_results_set_name: string option;
   (**{|
    The name for the set of featured results.|}*)

  featured_results_set_id: string option;
   (**{|
    The identifier of the set of featured results.|}*)

}

type describe_featured_results_set_request = {
  featured_results_set_id: string;
   (**{|
    The identifier of the set of featured results that you want to get
    information on.|}*)

  index_id: string;
   (**{|
    The identifier of the index used for featuring results.|}*)

}

type describe_faq_response = {
  language_code: string option;
   (**{|
    The code for a language. This shows a supported language for the FAQ
    document. English is supported by default. For more information on
    supported languages, including their codes, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html }Adding
    documents in languages other than English}.|}*)

  file_format: faq_file_format option;
   (**{|
    The file format used by the input files for the FAQ.|}*)

  error_message: string option;
   (**{|
    If the [Status] field is [FAILED], the [ErrorMessage] field contains the
    reason why the FAQ failed.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the role that provides access to the S3
    bucket containing the input files for the FAQ.|}*)

  status: faq_status option;
   (**{|
    The status of the FAQ. It is ready to use when the status is [ACTIVE].|}*)

  s3_path: s3_path option;
  
  updated_at: float option;
   (**{|
    The Unix timestamp when the FAQ was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when the FAQ was created.|}*)

  description: string option;
   (**{|
    The description of the FAQ that you provided when it was created.|}*)

  name: string option;
   (**{|
    The name that you gave the FAQ when it was created.|}*)

  index_id: string option;
   (**{|
    The identifier of the index for the FAQ.|}*)

  id: string option;
   (**{|
    The identifier of the FAQ.|}*)

}

type describe_faq_request = {
  index_id: string;
   (**{|
    The identifier of the index for the FAQ.|}*)

  id: string;
   (**{|
    The identifier of the FAQ you want to get information on.|}*)

}

type describe_experience_response = {
  error_message: string option;
   (**{|
    The reason your Amazon Kendra experience could not properly process.|}*)

  role_arn: string option;
   (**{|
    Shows the Amazon Resource Name (ARN) of a role with permission to access
    [Query] API, [QuerySuggestions] API, [SubmitFeedback] API, and IAM
    Identity Center that stores your user and group information.|}*)

  status: experience_status option;
   (**{|
    The current processing status of your Amazon Kendra experience. When the
    status is [ACTIVE], your Amazon Kendra experience is ready to use. When
    the status is [FAILED], the [ErrorMessage] field contains the reason that
    this failed.|}*)

  description: string option;
   (**{|
    Shows the description for your Amazon Kendra experience.|}*)

  updated_at: float option;
   (**{|
    The Unix timestamp when your Amazon Kendra experience was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when your Amazon Kendra experience was created.|}*)

  configuration: experience_configuration option;
   (**{|
    Shows the configuration information for your Amazon Kendra experience.
    This includes [ContentSourceConfiguration], which specifies the data
    source IDs and/or FAQ IDs, and [UserIdentityConfiguration], which
    specifies the user or group information to grant access to your Amazon
    Kendra experience.|}*)

  endpoints: experience_endpoint list option;
   (**{|
    Shows the endpoint URLs for your Amazon Kendra experiences. The URLs are
    unique and fully hosted by Amazon Web Services.|}*)

  name: string option;
   (**{|
    Shows the name of your Amazon Kendra experience.|}*)

  index_id: string option;
   (**{|
    Shows the identifier of the index for your Amazon Kendra experience.|}*)

  id: string option;
   (**{|
    Shows the identifier of your Amazon Kendra experience.|}*)

}

type describe_experience_request = {
  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  id: string;
   (**{|
    The identifier of your Amazon Kendra experience you want to get
    information on.|}*)

}

type describe_data_source_response = {
  custom_document_enrichment_configuration: custom_document_enrichment_configuration option;
   (**{|
    Configuration information for altering document metadata and content
    during the document ingestion process when you describe a data source.
    
    For more information on how to create, modify and delete document
    metadata, or make other content alterations when you ingest documents
    into Amazon Kendra, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html }Customizing
    document metadata during the ingestion process}.|}*)

  language_code: string option;
   (**{|
    The code for a language. This shows a supported language for all
    documents in the data source. English is supported by default. For more
    information on supported languages, including their codes, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html }Adding
    documents in languages other than English}.|}*)

  error_message: string option;
   (**{|
    When the [Status] field value is [FAILED], the [ErrorMessage] field
    contains a description of the error that caused the data source to fail.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the role with permission to access the
    data source and required resources.|}*)

  schedule: string option;
   (**{|
    The schedule for Amazon Kendra to update the index.|}*)

  status: data_source_status option;
   (**{|
    The current status of the data source connector. When the status is
    [ACTIVE] the data source is ready to use. When the status is [FAILED],
    the [ErrorMessage] field contains the reason that the data source failed.|}*)

  description: string option;
   (**{|
    The description for the data source connector.|}*)

  updated_at: float option;
   (**{|
    The Unix timestamp when the data source connector was last updated.|}*)

  created_at: float option;
   (**{|
    The Unix timestamp when the data source connector was created.|}*)

  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud to connect
    to your data source. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  configuration: data_source_configuration option;
   (**{|
    Configuration details for the data source connector. This shows how the
    data source is configured. The configuration options for a data source
    depend on the data source provider.|}*)

  type_: data_source_type option;
   (**{|
    The type of the data source. For example, [SHAREPOINT].|}*)

  name: string option;
   (**{|
    The name for the data source connector.|}*)

  index_id: string option;
   (**{|
    The identifier of the index used with the data source connector.|}*)

  id: string option;
   (**{|
    The identifier of the data source connector.|}*)

}

type describe_data_source_request = {
  index_id: string;
   (**{|
    The identifier of the index used with the data source connector.|}*)

  id: string;
   (**{|
    The identifier of the data source connector.|}*)

}

type describe_access_control_configuration_response = {
  hierarchical_access_control_list: hierarchical_principal list option;
   (**{|
    The list of
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html }principal}
    lists that define the hierarchy for which documents users should have
    access to.|}*)

  access_control_list: principal list option;
   (**{|
    Information on principals (users and/or groups) and which documents they
    should have access to. This is useful for user context filtering, where
    search results are filtered based on the user or their group access to
    documents.|}*)

  error_message: string option;
   (**{|
    The error message containing details if there are issues processing the
    access control configuration.|}*)

  description: string option;
   (**{|
    The description for the access control configuration.|}*)

  name: string;
   (**{|
    The name for the access control configuration.|}*)

}

type describe_access_control_configuration_request = {
  id: string;
   (**{|
    The identifier of the access control configuration you want to get
    information on.|}*)

  index_id: string;
   (**{|
    The identifier of the index for an access control configuration.|}*)

}

type delete_thesaurus_request = {
  index_id: string;
   (**{|
    The identifier of the index for the thesaurus.|}*)

  id: string;
   (**{|
    The identifier of the thesaurus you want to delete.|}*)

}

type delete_query_suggestions_block_list_request = {
  id: string;
   (**{|
    The identifier of the block list you want to delete.|}*)

  index_id: string;
   (**{|
    The identifier of the index for the block list.|}*)

}

type delete_principal_mapping_request = {
  ordering_id: int option;
   (**{|
    The timestamp identifier you specify to ensure Amazon Kendra does not
    override the latest [DELETE] action with previous actions. The highest
    number ID, which is the ordering ID, is the latest action you want to
    process and apply on top of other actions with lower number IDs. This
    prevents previous actions with lower number IDs from possibly overriding
    the latest action.
    
    The ordering ID can be the Unix time of the last update you made to a
    group members list. You would then provide this list when calling
    [PutPrincipalMapping]. This ensures your [DELETE] action for that updated
    group with the latest members list doesn't get overwritten by earlier
    [DELETE] actions for the same group which are yet to be processed.
    
    The default ordering ID is the current Unix time in milliseconds that the
    action was received by Amazon Kendra.|}*)

  group_id: string;
   (**{|
    The identifier of the group you want to delete.|}*)

  data_source_id: string option;
   (**{|
    The identifier of the data source you want to delete a group from.
    
    A group can be tied to multiple data sources. You can delete a group from
    accessing documents in a certain data source. For example, the groups
    "Research", "Engineering", and "Sales and Marketing" are all tied to the
    company's documents stored in the data sources Confluence and Salesforce.
    You want to delete "Research" and "Engineering" groups from Salesforce,
    so that these groups cannot access customer-related documents stored in
    Salesforce. Only "Sales and Marketing" should access documents in the
    Salesforce data source.|}*)

  index_id: string;
   (**{|
    The identifier of the index you want to delete a group from.|}*)

}

type delete_index_request = {
  id: string;
   (**{|
    The identifier of the index you want to delete.|}*)

}

type delete_faq_request = {
  index_id: string;
   (**{|
    The identifier of the index for the FAQ.|}*)

  id: string;
   (**{|
    The identifier of the FAQ you want to remove.|}*)

}

type delete_experience_response = unit

type delete_experience_request = {
  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  id: string;
   (**{|
    The identifier of your Amazon Kendra experience you want to delete.|}*)

}

type delete_data_source_request = {
  index_id: string;
   (**{|
    The identifier of the index used with the data source connector.|}*)

  id: string;
   (**{|
    The identifier of the data source connector you want to delete.|}*)

}

type delete_access_control_configuration_response = unit

type delete_access_control_configuration_request = {
  id: string;
   (**{|
    The identifier of the access control configuration you want to delete.|}*)

  index_id: string;
   (**{|
    The identifier of the index for an access control configuration.|}*)

}

(**{|
    Maps a particular data source sync job to a particular data source.|}*)
type data_source_sync_job_metric_target = {
  data_source_sync_job_id: string option;
   (**{|
    The ID of the sync job that is running on the data source.
    
    If the ID of a sync job is not provided and there is a sync job running,
    then the ID of this sync job is used and metrics are generated for this
    sync job.
    
    If the ID of a sync job is not provided and there is no sync job running,
    then no metrics are generated and documents are indexed/deleted at the
    index level without sync job metrics included.|}*)

  data_source_id: string;
   (**{|
    The ID of the data source that is running the sync job.|}*)

}

type create_thesaurus_response = {
  id: string option;
   (**{|
    The identifier of the thesaurus.|}*)

}

type create_thesaurus_request = {
  client_token: string option;
   (**{|
    A token that you provide to identify the request to create a thesaurus.
    Multiple calls to the [CreateThesaurus] API with the same client token
    will create only one thesaurus.|}*)

  source_s3_path: s3_path;
   (**{|
    The path to the thesaurus file in S3.|}*)

  tags: tag list option;
   (**{|
    A list of key-value pairs that identify or categorize the thesaurus. You
    can also use tags to help control access to the thesaurus. Tag keys and
    values can consist of Unicode letters, digits, white space, and any of
    the following symbols: _ . : / = + - @.|}*)

  role_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role with permission to access
    your S3 bucket that contains the thesaurus file. For more information,
    see {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    access roles for Amazon Kendra}.|}*)

  description: string option;
   (**{|
    A description for the thesaurus.|}*)

  name: string;
   (**{|
    A name for the thesaurus.|}*)

  index_id: string;
   (**{|
    The identifier of the index for the thesaurus.|}*)

}

type create_query_suggestions_block_list_response = {
  id: string option;
   (**{|
    The identifier of the block list.|}*)

}

type create_query_suggestions_block_list_request = {
  tags: tag list option;
   (**{|
    A list of key-value pairs that identify or categorize the block list. Tag
    keys and values can consist of Unicode letters, digits, white space, and
    any of the following symbols: _ . : / = + - @.|}*)

  role_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role with permission to access
    your S3 bucket that contains the block list text file. For more
    information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    access roles for Amazon Kendra}.|}*)

  client_token: string option;
   (**{|
    A token that you provide to identify the request to create a query
    suggestions block list.|}*)

  source_s3_path: s3_path;
   (**{|
    The S3 path to your block list text file in your S3 bucket.
    
    Each block word or phrase should be on a separate line in a text file.
    
    For information on the current quota limits for block lists, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/quotas.html }Quotas for
    Amazon Kendra}.|}*)

  description: string option;
   (**{|
    A description for the block list.
    
    For example, the description "List of all offensive words that can appear
    in user queries and need to be blocked from suggestions."|}*)

  name: string;
   (**{|
    A name for the block list.
    
    For example, the name 'offensive-words', which includes all offensive
    words that could appear in user queries and need to be blocked from
    suggestions.|}*)

  index_id: string;
   (**{|
    The identifier of the index you want to create a query suggestions block
    list for.|}*)

}

type create_index_response = {
  id: string option;
   (**{|
    The identifier of the index. Use this identifier when you query an index,
    set up a data source, or index a document.|}*)

}

type create_index_request = {
  user_group_resolution_configuration: user_group_resolution_configuration option;
   (**{|
    Gets users and groups from IAM Identity Center identity source. To
    configure this, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UserGroupResolutionConfiguration.html }UserGroupResolutionConfiguration}.
    This is useful for user context filtering, where search results are
    filtered based on the user or their group access to documents.|}*)

  user_context_policy: user_context_policy option;
   (**{|
    The user context policy.
    
    ATTRIBUTE_FILTER
    All indexed content is searchable and displayable for all users. If you
    want to filter search results on user context, you can use the attribute
    filters of [_user_id] and [_group_ids] or you can provide user and group
    information in [UserContext].
    
    USER_TOKEN
    Enables token-based user access control to filter search results on user
    context. All documents with no access control and all documents
    accessible to the user will be searchable and displayable.
    |}*)

  user_token_configurations: user_token_configuration list option;
   (**{|
    The user token configuration.|}*)

  tags: tag list option;
   (**{|
    A list of key-value pairs that identify or categorize the index. You can
    also use tags to help control access to the index. Tag keys and values
    can consist of Unicode letters, digits, white space, and any of the
    following symbols: _ . : / = + - @.|}*)

  client_token: string option;
   (**{|
    A token that you provide to identify the request to create an index.
    Multiple calls to the [CreateIndex] API with the same client token will
    create only one index.|}*)

  description: string option;
   (**{|
    A description for the index.|}*)

  server_side_encryption_configuration: server_side_encryption_configuration option;
   (**{|
    The identifier of the KMS customer managed key (CMK) that's used to
    encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support
    asymmetric CMKs.|}*)

  role_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role with permission to access
    your Amazon CloudWatch logs and metrics. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    access roles for Amazon Kendra}.|}*)

  edition: index_edition option;
   (**{|
    The Amazon Kendra edition to use for the index. Choose
    [DEVELOPER_EDITION] for indexes intended for development, testing, or
    proof of concept. Use [ENTERPRISE_EDITION] for production. Once you set
    the edition for an index, it can't be changed.
    
    The [Edition] parameter is optional. If you don't supply a value, the
    default is [ENTERPRISE_EDITION].
    
    For more information on quota limits for Enterprise and Developer
    editions, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/quotas.html }Quotas}.|}*)

  name: string;
   (**{|
    A name for the index.|}*)

}

type create_featured_results_set_response = {
  featured_results_set: featured_results_set option;
   (**{|
    Information on the set of featured results. This includes the identifier
    of the featured results set, whether the featured results set is active
    or inactive, when the featured results set was created, and more.|}*)

}

type create_featured_results_set_request = {
  tags: tag list option;
   (**{|
    A list of key-value pairs that identify or categorize the featured
    results set. You can also use tags to help control access to the featured
    results set. Tag keys and values can consist of Unicode letters, digits,
    white space, and any of the following symbols:_ . : / = + - @.|}*)

  featured_documents: featured_document list option;
   (**{|
    A list of document IDs for the documents you want to feature at the top
    of the search results page. For more information on the list of
    documents, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html }FeaturedResultsSet}.
    |}*)

  query_texts: string list option;
   (**{|
    A list of queries for featuring results. For more information on the list
    of queries, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html }FeaturedResultsSet}.
    |}*)

  status: featured_results_set_status option;
   (**{|
    The current status of the set of featured results. When the value is
    [ACTIVE], featured results are ready for use. You can still configure
    your settings before setting the status to [ACTIVE]. You can set the
    status to [ACTIVE] or [INACTIVE] using the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html }UpdateFeaturedResultsSet}
    API. The queries you specify for featured results must be unique per
    featured results set for each index, whether the status is [ACTIVE] or
    [INACTIVE].|}*)

  client_token: string option;
   (**{|
    A token that you provide to identify the request to create a set of
    featured results. Multiple calls to the [CreateFeaturedResultsSet] API
    with the same client token will create only one featured results set.|}*)

  description: string option;
   (**{|
    A description for the set of featured results.|}*)

  featured_results_set_name: string;
   (**{|
    A name for the set of featured results.|}*)

  index_id: string;
   (**{|
    The identifier of the index that you want to use for featuring results.|}*)

}

type create_faq_response = {
  id: string option;
   (**{|
    The identifier of the FAQ.|}*)

}

type create_faq_request = {
  language_code: string option;
   (**{|
    The code for a language. This allows you to support a language for the
    FAQ document. English is supported by default. For more information on
    supported languages, including their codes, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html }Adding
    documents in languages other than English}.|}*)

  client_token: string option;
   (**{|
    A token that you provide to identify the request to create a FAQ.
    Multiple calls to the [CreateFaqRequest] API with the same client token
    will create only one FAQ.|}*)

  file_format: faq_file_format option;
   (**{|
    The format of the FAQ input file. You can choose between a basic CSV
    format, a CSV format that includes customs attributes in a header, and a
    JSON format that includes custom attributes.
    
    The default format is CSV.
    
    The format must match the format of the file stored in the S3 bucket
    identified in the [S3Path] parameter.
    
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/in-creating-faq.html }Adding
    questions and answers}.|}*)

  tags: tag list option;
   (**{|
    A list of key-value pairs that identify the FAQ. You can use the tags to
    identify and organize your resources and to control access to resources.|}*)

  role_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role with permission to access
    the S3 bucket that contains the FAQs. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    access roles for Amazon Kendra}.|}*)

  s3_path: s3_path;
   (**{|
    The path to the FAQ file in S3.|}*)

  description: string option;
   (**{|
    A description for the FAQ.|}*)

  name: string;
   (**{|
    A name for the FAQ.|}*)

  index_id: string;
   (**{|
    The identifier of the index for the FAQ.|}*)

}

type create_experience_response = {
  id: string;
   (**{|
    The identifier of your Amazon Kendra experience.|}*)

}

type create_experience_request = {
  client_token: string option;
   (**{|
    A token that you provide to identify the request to create your Amazon
    Kendra experience. Multiple calls to the [CreateExperience] API with the
    same client token creates only one Amazon Kendra experience.|}*)

  description: string option;
   (**{|
    A description for your Amazon Kendra experience.|}*)

  configuration: experience_configuration option;
   (**{|
    Configuration information for your Amazon Kendra experience. This
    includes [ContentSourceConfiguration], which specifies the data source
    IDs and/or FAQ IDs, and [UserIdentityConfiguration], which specifies the
    user or group information to grant access to your Amazon Kendra
    experience.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role with permission to access
    [Query] API, [GetQuerySuggestions] API, and other required APIs. The role
    also must include permission to access IAM Identity Center that stores
    your user and group information. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    access roles for Amazon Kendra}.|}*)

  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  name: string;
   (**{|
    A name for your Amazon Kendra experience.|}*)

}

type create_data_source_response = {
  id: string;
   (**{|
    The identifier of the data source connector.|}*)

}

type create_data_source_request = {
  custom_document_enrichment_configuration: custom_document_enrichment_configuration option;
   (**{|
    Configuration information for altering document metadata and content
    during the document ingestion process.
    
    For more information on how to create, modify and delete document
    metadata, or make other content alterations when you ingest documents
    into Amazon Kendra, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html }Customizing
    document metadata during the ingestion process}.|}*)

  language_code: string option;
   (**{|
    The code for a language. This allows you to support a language for all
    documents when creating the data source connector. English is supported
    by default. For more information on supported languages, including their
    codes, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html }Adding
    documents in languages other than English}.|}*)

  client_token: string option;
   (**{|
    A token that you provide to identify the request to create a data source
    connector. Multiple calls to the [CreateDataSource] API with the same
    client token will create only one data source connector.|}*)

  tags: tag list option;
   (**{|
    A list of key-value pairs that identify or categorize the data source
    connector. You can also use tags to help control access to the data
    source connector. Tag keys and values can consist of Unicode letters,
    digits, white space, and any of the following symbols: _ . : / = + - @.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role with permission to access
    the data source and required resources. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    access roles for Amazon Kendra.}.
    
    You can't specify the [RoleArn] parameter when the [Type] parameter is
    set to [CUSTOM]. If you do, you receive a [ValidationException]
    exception.
    
    The [RoleArn] parameter is required for all other data sources.|}*)

  schedule: string option;
   (**{|
    Sets the frequency for Amazon Kendra to check the documents in your data
    source repository and update the index. If you don't set a schedule
    Amazon Kendra will not periodically update the index. You can call the
    [StartDataSourceSyncJob] API to update the index.
    
    Specify a [cron-] format schedule string or an empty string to indicate
    that the index is updated on demand.
    
    You can't specify the [Schedule] parameter when the [Type] parameter is
    set to [CUSTOM]. If you do, you receive a [ValidationException]
    exception.|}*)

  description: string option;
   (**{|
    A description for the data source connector.|}*)

  vpc_configuration: data_source_vpc_configuration option;
   (**{|
    Configuration information for an Amazon Virtual Private Cloud to connect
    to your data source. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html }Configuring
    a VPC}.|}*)

  configuration: data_source_configuration option;
   (**{|
    Configuration information to connect to your data source repository.
    
    You can't specify the [Configuration] parameter when the [Type] parameter
    is set to [CUSTOM]. If you do, you receive a [ValidationException]
    exception.
    
    The [Configuration] parameter is required for all other data sources.|}*)

  type_: data_source_type;
   (**{|
    The type of data source repository. For example, [SHAREPOINT].|}*)

  index_id: string;
   (**{|
    The identifier of the index you want to use with the data source
    connector.|}*)

  name: string;
   (**{|
    A name for the data source connector.|}*)

}

type create_access_control_configuration_response = {
  id: string;
   (**{|
    The identifier of the access control configuration for your documents in
    an index.|}*)

}

type create_access_control_configuration_request = {
  client_token: string option;
   (**{|
    A token that you provide to identify the request to create an access
    control configuration. Multiple calls to the
    [CreateAccessControlConfiguration] API with the same client token will
    create only one access control configuration.|}*)

  hierarchical_access_control_list: hierarchical_principal list option;
   (**{|
    The list of
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html }principal}
    lists that define the hierarchy for which documents users should have
    access to.|}*)

  access_control_list: principal list option;
   (**{|
    Information on principals (users and/or groups) and which documents they
    should have access to. This is useful for user context filtering, where
    search results are filtered based on the user or their group access to
    documents.|}*)

  description: string option;
   (**{|
    A description for the access control configuration.|}*)

  name: string;
   (**{|
    A name for the access control configuration.|}*)

  index_id: string;
   (**{|
    The identifier of the index to create an access control configuration for
    your documents.|}*)

}

type clear_query_suggestions_request = {
  index_id: string;
   (**{|
    The identifier of the index you want to clear query suggestions from.|}*)

}

(**{|
    Provides information about a document that could not be indexed.|}*)
type batch_put_document_response_failed_document = {
  error_message: string option;
   (**{|
    A description of the reason why the document could not be indexed.|}*)

  error_code: error_code option;
   (**{|
    The type of error that caused the document to fail to be indexed.|}*)

  id: string option;
   (**{|
    The identifier of the document.|}*)

}

type batch_put_document_response = {
  failed_documents: batch_put_document_response_failed_document list option;
   (**{|
    A list of documents that were not added to the index because the document
    failed a validation check. Each document contains an error message that
    indicates why the document couldn't be added to the index.
    
    If there was an error adding a document to an index the error is reported
    in your Amazon Web Services CloudWatch log. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/cloudwatch-logs.html }Monitoring
    Amazon Kendra with Amazon CloudWatch logs}.|}*)

}

type batch_put_document_request = {
  custom_document_enrichment_configuration: custom_document_enrichment_configuration option;
   (**{|
    Configuration information for altering your document metadata and content
    during the document ingestion process when you use the [BatchPutDocument]
    API.
    
    For more information on how to create, modify and delete document
    metadata, or make other content alterations when you ingest documents
    into Amazon Kendra, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html }Customizing
    document metadata during the ingestion process}.|}*)

  documents: document list;
   (**{|
    One or more documents to add to the index.
    
    Documents have the following file size limits.
    
    {ol 
          {- 50 MB total size for any file
             }
          
          {- 5 MB extracted text for any file
             }
          
    }
    
    For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/quotas.html }Quotas}.|}*)

  role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role with permission to access
    your S3 bucket. For more information, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html }IAM
    access roles for Amazon Kendra}.|}*)

  index_id: string;
   (**{|
    The identifier of the index to add the documents to. You need to create
    the index first using the [CreateIndex] API.|}*)

}

(**{|
    Provides a response when the status of a document could not be retrieved.|}*)
type batch_get_document_status_response_error = {
  error_message: string option;
   (**{|
    States that the API could not get the status of a document. This could be
    because the request is not valid or there is a system error.|}*)

  error_code: error_code option;
   (**{|
    Indicates the source of the error.|}*)

  document_id: string option;
   (**{|
    The identifier of the document whose status could not be retrieved.|}*)

}

type batch_get_document_status_response = {
  document_status_list: status list option;
   (**{|
    The status of documents. The status indicates if the document is waiting
    to be indexed, is in the process of indexing, has completed indexing, or
    failed indexing. If a document failed indexing, the status provides the
    reason why.|}*)

  errors: batch_get_document_status_response_error list option;
   (**{|
    A list of documents that Amazon Kendra couldn't get the status for. The
    list includes the ID of the document and the reason that the status
    couldn't be found.|}*)

}

type batch_get_document_status_request = {
  document_info_list: document_info list;
   (**{|
    A list of [DocumentInfo] objects that identify the documents for which to
    get the status. You identify the documents by their document ID and
    optional attributes.|}*)

  index_id: string;
   (**{|
    The identifier of the index to add documents to. The index ID is returned
    by the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_CreateIndex.html }CreateIndex}
    API.|}*)

}

(**{|
    Provides information about a set of featured results that couldn't be
    removed from an index by the
    {{: https://docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteFeaturedResultsSet.html }BatchDeleteFeaturedResultsSet}
    API.|}*)
type batch_delete_featured_results_set_error = {
  error_message: string;
   (**{|
    An explanation for why the set of featured results couldn't be removed
    from the index.|}*)

  error_code: error_code;
   (**{|
    The error code for why the set of featured results couldn't be removed
    from the index.|}*)

  id: string;
   (**{|
    The identifier of the set of featured results that couldn't be removed
    from the index.|}*)

}

type batch_delete_featured_results_set_response = {
  errors: batch_delete_featured_results_set_error list;
   (**{|
    The list of errors for the featured results set IDs, explaining why they
    couldn't be removed from the index.|}*)

}

type batch_delete_featured_results_set_request = {
  featured_results_set_ids: string list;
   (**{|
    The identifiers of the featured results sets that you want to delete.|}*)

  index_id: string;
   (**{|
    The identifier of the index used for featuring results.|}*)

}

(**{|
    Provides information about documents that could not be removed from an
    index by the [BatchDeleteDocument] API.|}*)
type batch_delete_document_response_failed_document = {
  error_message: string option;
   (**{|
    An explanation for why the document couldn't be removed from the index.|}*)

  error_code: error_code option;
   (**{|
    The error code for why the document couldn't be removed from the index.|}*)

  id: string option;
   (**{|
    The identifier of the document that couldn't be removed from the index.|}*)

}

type batch_delete_document_response = {
  failed_documents: batch_delete_document_response_failed_document list option;
   (**{|
    A list of documents that could not be removed from the index. Each entry
    contains an error message that indicates why the document couldn't be
    removed from the index.|}*)

}

type batch_delete_document_request = {
  data_source_sync_job_metric_target: data_source_sync_job_metric_target option;
  
  document_id_list: string list;
   (**{|
    One or more identifiers for documents to delete from the index.|}*)

  index_id: string;
   (**{|
    The identifier of the index that contains the documents to delete.|}*)

}

type associate_personas_to_entities_response = {
  failed_entity_list: failed_entity list option;
   (**{|
    Lists the users or groups in your IAM Identity Center identity source
    that failed to properly configure with your Amazon Kendra experience.|}*)

}

type associate_personas_to_entities_request = {
  personas: entity_persona_configuration list;
   (**{|
    The personas that define the specific permissions of users or groups in
    your IAM Identity Center identity source. The available personas or
    access roles are [Owner] and [Viewer]. For more information on these
    personas, see
    {{: https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html#access-search-experience }Providing
    access to your search page}.|}*)

  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  id: string;
   (**{|
    The identifier of your Amazon Kendra experience.|}*)

}

type associate_entities_to_experience_response = {
  failed_entity_list: failed_entity list option;
   (**{|
    Lists the users or groups in your IAM Identity Center identity source
    that failed to properly configure with your Amazon Kendra experience.|}*)

}

type associate_entities_to_experience_request = {
  entity_list: entity_configuration list;
   (**{|
    Lists users or groups in your IAM Identity Center identity source.|}*)

  index_id: string;
   (**{|
    The identifier of the index for your Amazon Kendra experience.|}*)

  id: string;
   (**{|
    The identifier of your Amazon Kendra experience.|}*)

}

(**{|
    Amazon Kendra is a service for indexing large document sets.|}*)


type base_document = Json.t

