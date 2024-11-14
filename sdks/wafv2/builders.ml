[@@@warning "-39"]
open Types
let make_single_header  ~(name : string) () : single_header = { name; 
}

let make_single_query_argument  ~(name : string) () : single_query_argument =
{ name;  }

let make_all_query_arguments  () : all_query_arguments = ()

let make_uri_path  () : uri_path = ()

let make_query_string  () : query_string = ()

let make_body  ?(oversize_handling : oversize_handling option) () : body = {
  oversize_handling;  }

let make_method_  () : method_ = ()

let make_all  () : all = ()

let make_json_match_pattern 
  ?(included_paths : string list option) ?(all : all option) ()
: json_match_pattern = { included_paths; all;  }

let make_json_body 
  ?(oversize_handling : oversize_handling option)
  ?(invalid_fallback_behavior : body_parsing_fallback_behavior option)
  ~(match_scope : json_match_scope)
  ~(match_pattern : json_match_pattern)
  () : json_body = {
  oversize_handling; invalid_fallback_behavior; match_scope; match_pattern; 
}

let make_header_match_pattern 
  ?(excluded_headers : string list option)
  ?(included_headers : string list option)
  ?(all : all option)
  () : header_match_pattern = { excluded_headers; included_headers; all; 
}

let make_headers 
  ~(oversize_handling : oversize_handling)
  ~(match_scope : map_match_scope)
  ~(match_pattern : header_match_pattern)
  () : headers = { oversize_handling; match_scope; match_pattern; 
}

let make_cookie_match_pattern 
  ?(excluded_cookies : string list option)
  ?(included_cookies : string list option)
  ?(all : all option)
  () : cookie_match_pattern = { excluded_cookies; included_cookies; all; 
}

let make_cookies 
  ~(oversize_handling : oversize_handling)
  ~(match_scope : map_match_scope)
  ~(match_pattern : cookie_match_pattern)
  () : cookies = { oversize_handling; match_scope; match_pattern; 
}

let make_header_order  ~(oversize_handling : oversize_handling) ()
: header_order = { oversize_handling;  }

let make_ja3_fingerprint  ~(fallback_behavior : fallback_behavior) ()
: ja3_fingerprint = { fallback_behavior;  }

let make_field_to_match 
  ?(ja3_fingerprint : ja3_fingerprint option)
  ?(header_order : header_order option)
  ?(cookies : cookies option)
  ?(headers : headers option)
  ?(json_body : json_body option)
  ?(method_ : method_ option)
  ?(body : body option)
  ?(query_string : query_string option)
  ?(uri_path : uri_path option)
  ?(all_query_arguments : all_query_arguments option)
  ?(single_query_argument : single_query_argument option)
  ?(single_header : single_header option)
  () : field_to_match = {
  ja3_fingerprint;
  header_order;
  cookies;
  headers;
  json_body;
  method_;
  body;
  query_string;
  uri_path;
  all_query_arguments;
  single_query_argument;
  single_header;
   }

let make_text_transformation 
  ~(type_ : text_transformation_type) ~(priority : int) ()
: text_transformation = { type_; priority;  }

let make_xss_match_statement 
  ~(text_transformations : text_transformation list)
  ~(field_to_match : field_to_match)
  () : xss_match_statement = { text_transformations; field_to_match; 
}

let make_web_acl_summary 
  ?(ar_n : string option)
  ?(lock_token : string option)
  ?(description : string option)
  ?(id : string option)
  ?(name : string option)
  () : web_acl_summary = { ar_n; lock_token; description; id; name; 
}

let make_custom_http_header  ~(value : string) ~(name : string) ()
: custom_http_header = { value; name;  }

let make_custom_response 
  ?(response_headers : custom_http_header list option)
  ?(custom_response_body_key : string option)
  ~(response_code : int)
  () : custom_response = {
  response_headers; custom_response_body_key; response_code; 
}

let make_block_action  ?(custom_response : custom_response option) ()
: block_action = { custom_response;  }

let make_custom_request_handling 
  ~(insert_headers : custom_http_header list) () : custom_request_handling =
{ insert_headers;  }

let make_allow_action 
  ?(custom_request_handling : custom_request_handling option) ()
: allow_action = { custom_request_handling;  }

let make_default_action 
  ?(allow : allow_action option) ?(block : block_action option) ()
: default_action = { allow; block;  }

let make_byte_match_statement 
  ~(positional_constraint : positional_constraint)
  ~(text_transformations : text_transformation list)
  ~(field_to_match : field_to_match)
  ~(search_string : bytes)
  () : byte_match_statement = {
  positional_constraint; text_transformations; field_to_match; search_string; 
}

let make_sqli_match_statement 
  ?(sensitivity_level : sensitivity_level option)
  ~(text_transformations : text_transformation list)
  ~(field_to_match : field_to_match)
  () : sqli_match_statement = {
  sensitivity_level; text_transformations; field_to_match; 
}

let make_size_constraint_statement 
  ~(text_transformations : text_transformation list)
  ~(size : int)
  ~(comparison_operator : comparison_operator)
  ~(field_to_match : field_to_match)
  () : size_constraint_statement = {
  text_transformations; size; comparison_operator; field_to_match; 
}

let make_forwarded_ip_config 
  ~(fallback_behavior : fallback_behavior) ~(header_name : string) ()
: forwarded_ip_config = { fallback_behavior; header_name; 
}

let make_geo_match_statement 
  ?(forwarded_ip_config : forwarded_ip_config option)
  ?(country_codes : country_code list option)
  () : geo_match_statement = { forwarded_ip_config; country_codes; 
}

let make_excluded_rule  ~(name : string) () : excluded_rule = { name; 
}

let make_count_action 
  ?(custom_request_handling : custom_request_handling option) ()
: count_action = { custom_request_handling;  }

let make_captcha_action 
  ?(custom_request_handling : custom_request_handling option) ()
: captcha_action = { custom_request_handling;  }

let make_challenge_action 
  ?(custom_request_handling : custom_request_handling option) ()
: challenge_action = { custom_request_handling;  }

let make_rule_action 
  ?(challenge : challenge_action option)
  ?(captcha : captcha_action option)
  ?(count : count_action option)
  ?(allow : allow_action option)
  ?(block : block_action option)
  () : rule_action = { challenge; captcha; count; allow; block; 
}

let make_rule_action_override 
  ~(action_to_use : rule_action) ~(name : string) () : rule_action_override =
{ action_to_use; name;  }

let make_rule_group_reference_statement 
  ?(rule_action_overrides : rule_action_override list option)
  ?(excluded_rules : excluded_rule list option)
  ~(ar_n : string)
  () : rule_group_reference_statement = {
  rule_action_overrides; excluded_rules; ar_n; 
}

let make_ip_set_forwarded_ip_config 
  ~(position : forwarded_ip_position)
  ~(fallback_behavior : fallback_behavior)
  ~(header_name : string)
  () : ip_set_forwarded_ip_config = {
  position; fallback_behavior; header_name; 
}

let make_ip_set_reference_statement 
  ?(ip_set_forwarded_ip_config : ip_set_forwarded_ip_config option)
  ~(ar_n : string)
  () : ip_set_reference_statement = { ip_set_forwarded_ip_config; ar_n; 
}

let make_regex_pattern_set_reference_statement 
  ~(text_transformations : text_transformation list)
  ~(field_to_match : field_to_match)
  ~(ar_n : string)
  () : regex_pattern_set_reference_statement = {
  text_transformations; field_to_match; ar_n;  }

let make_rate_limit_header 
  ~(text_transformations : text_transformation list) ~(name : string) ()
: rate_limit_header = { text_transformations; name; 
}

let make_rate_limit_cookie 
  ~(text_transformations : text_transformation list) ~(name : string) ()
: rate_limit_cookie = { text_transformations; name; 
}

let make_rate_limit_query_argument 
  ~(text_transformations : text_transformation list) ~(name : string) ()
: rate_limit_query_argument = { text_transformations; name; 
}

let make_rate_limit_query_string 
  ~(text_transformations : text_transformation list) ()
: rate_limit_query_string = { text_transformations; 
}

let make_rate_limit_http_method  () : rate_limit_http_method =
()

let make_rate_limit_forwarded_i_p  () : rate_limit_forwarded_i_p =
()

let make_rate_limit_i_p  () : rate_limit_i_p =
()

let make_rate_limit_label_namespace  ~(namespace : string) ()
: rate_limit_label_namespace = { namespace;  }

let make_rate_limit_uri_path 
  ~(text_transformations : text_transformation list) () : rate_limit_uri_path
= { text_transformations;  }

let make_rate_based_statement_custom_key 
  ?(uri_path : rate_limit_uri_path option)
  ?(label_namespace : rate_limit_label_namespace option)
  ?(i_p : rate_limit_i_p option)
  ?(forwarded_i_p : rate_limit_forwarded_i_p option)
  ?(http_method : rate_limit_http_method option)
  ?(query_string : rate_limit_query_string option)
  ?(query_argument : rate_limit_query_argument option)
  ?(cookie : rate_limit_cookie option)
  ?(header : rate_limit_header option)
  () : rate_based_statement_custom_key = {
  uri_path;
  label_namespace;
  i_p;
  forwarded_i_p;
  http_method;
  query_string;
  query_argument;
  cookie;
  header;
   }

let make_username_field  ~(identifier : string) () : username_field = {
  identifier;  }

let make_password_field  ~(identifier : string) () : password_field = {
  identifier;  }

let make_aws_managed_rules_bot_control_rule_set 
  ?(enable_machine_learning : bool option)
  ~(inspection_level : inspection_level)
  () : aws_managed_rules_bot_control_rule_set = {
  enable_machine_learning; inspection_level;  }

let make_request_inspection 
  ~(password_field : password_field)
  ~(username_field : username_field)
  ~(payload_type : payload_type)
  () : request_inspection = { password_field; username_field; payload_type; 
}

let make_response_inspection_status_code 
  ~(failure_codes : int list) ~(success_codes : int list) ()
: response_inspection_status_code = { failure_codes; success_codes; 
}

let make_response_inspection_header 
  ~(failure_values : string list)
  ~(success_values : string list)
  ~(name : string)
  () : response_inspection_header = { failure_values; success_values; name; 
}

let make_response_inspection_body_contains 
  ~(failure_strings : string list) ~(success_strings : string list) ()
: response_inspection_body_contains = { failure_strings; success_strings; 
}

let make_response_inspection_json 
  ~(failure_values : string list)
  ~(success_values : string list)
  ~(identifier : string)
  () : response_inspection_json = {
  failure_values; success_values; identifier;  }

let make_response_inspection 
  ?(json : response_inspection_json option)
  ?(body_contains : response_inspection_body_contains option)
  ?(header : response_inspection_header option)
  ?(status_code : response_inspection_status_code option)
  () : response_inspection = { json; body_contains; header; status_code; 
}

let make_aws_managed_rules_atp_rule_set 
  ?(enable_regex_in_path : bool option)
  ?(response_inspection : response_inspection option)
  ?(request_inspection : request_inspection option)
  ~(login_path : string)
  () : aws_managed_rules_atp_rule_set = {
  enable_regex_in_path; response_inspection; request_inspection; login_path; 
}

let make_email_field  ~(identifier : string) () : email_field = {
  identifier;  }

let make_phone_number_field  ~(identifier : string) () : phone_number_field =
{ identifier;  }

let make_address_field  ~(identifier : string) () : address_field = {
  identifier;  }

let make_request_inspection_acf_p 
  ?(address_fields : address_field list option)
  ?(phone_number_fields : phone_number_field list option)
  ?(email_field : email_field option)
  ?(password_field : password_field option)
  ?(username_field : username_field option)
  ~(payload_type : payload_type)
  () : request_inspection_acf_p = {
  address_fields;
  phone_number_fields;
  email_field;
  password_field;
  username_field;
  payload_type;
   }

let make_aws_managed_rules_acfp_rule_set 
  ?(enable_regex_in_path : bool option)
  ?(response_inspection : response_inspection option)
  ~(request_inspection : request_inspection_acf_p)
  ~(registration_page_path : string)
  ~(creation_path : string)
  () : aws_managed_rules_acfp_rule_set = {
  enable_regex_in_path;
  response_inspection;
  request_inspection;
  registration_page_path;
  creation_path;
   }

let make_managed_rule_group_config 
  ?(aws_managed_rules_acfp_rule_set : aws_managed_rules_acfp_rule_set option)
  ?(aws_managed_rules_atp_rule_set : aws_managed_rules_atp_rule_set option)
  ?(aws_managed_rules_bot_control_rule_set : aws_managed_rules_bot_control_rule_set option)
  ?(password_field : password_field option)
  ?(username_field : username_field option)
  ?(payload_type : payload_type option)
  ?(login_path : string option)
  () : managed_rule_group_config = {
  aws_managed_rules_acfp_rule_set;
  aws_managed_rules_atp_rule_set;
  aws_managed_rules_bot_control_rule_set;
  password_field;
  username_field;
  payload_type;
  login_path;
   }

let make_label_match_statement 
  ~(key : string) ~(scope : label_match_scope) () : label_match_statement = {
  key; scope;  }

let make_regex_match_statement 
  ~(text_transformations : text_transformation list)
  ~(field_to_match : field_to_match)
  ~(regex_string : string)
  () : regex_match_statement = {
  text_transformations; field_to_match; regex_string;  }

let rec
  make_and_statement  ~(statements : statement list) () : and_statement = {
    statements; 
  }
and
  make_managed_rule_group_statement 
    ?(rule_action_overrides : rule_action_override list option)
    ?(managed_rule_group_configs : managed_rule_group_config list option)
    ?(scope_down_statement : statement option)
    ?(excluded_rules : excluded_rule list option)
    ?(version : string option)
    ~(name : string)
    ~(vendor_name : string)
    ()
  : managed_rule_group_statement = {
    rule_action_overrides;
    managed_rule_group_configs;
    scope_down_statement;
    excluded_rules;
    version;
    name;
    vendor_name;
     }
and
  make_not_statement  ~(statement : statement) () : not_statement = {
    statement; 
  }
and
  make_or_statement  ~(statements : statement list) () : or_statement = {
    statements; 
  }
and
  make_rate_based_statement 
    ?(custom_keys : rate_based_statement_custom_key list option)
    ?(forwarded_ip_config : forwarded_ip_config option)
    ?(scope_down_statement : statement option)
    ?(evaluation_window_sec : int option)
    ~(aggregate_key_type : rate_based_statement_aggregate_key_type)
    ~(limit : int)
    ()
  : rate_based_statement = {
    custom_keys;
    forwarded_ip_config;
    scope_down_statement;
    aggregate_key_type;
    evaluation_window_sec;
    limit;
     }
and
  make_statement 
    ?(regex_match_statement : regex_match_statement option)
    ?(label_match_statement : label_match_statement option)
    ?(managed_rule_group_statement : managed_rule_group_statement option)
    ?(not_statement : not_statement option)
    ?(or_statement : or_statement option)
    ?(and_statement : and_statement option)
    ?(rate_based_statement : rate_based_statement option)
    ?(regex_pattern_set_reference_statement : regex_pattern_set_reference_statement option)
    ?(ip_set_reference_statement : ip_set_reference_statement option)
    ?(rule_group_reference_statement : rule_group_reference_statement option)
    ?(geo_match_statement : geo_match_statement option)
    ?(size_constraint_statement : size_constraint_statement option)
    ?(xss_match_statement : xss_match_statement option)
    ?(sqli_match_statement : sqli_match_statement option)
    ?(byte_match_statement : byte_match_statement option)
    ()
  : statement = {
    regex_match_statement;
    label_match_statement;
    managed_rule_group_statement;
    not_statement;
    or_statement;
    and_statement;
    rate_based_statement;
    regex_pattern_set_reference_statement;
    ip_set_reference_statement;
    rule_group_reference_statement;
    geo_match_statement;
    size_constraint_statement;
    xss_match_statement;
    sqli_match_statement;
    byte_match_statement;
     }

let make_none_action  () : none_action = ()

let make_override_action 
  ?(none : none_action option) ?(count : count_action option) ()
: override_action = { none; count;  }

let make_label  ~(name : string) () : label = { name; 
}

let make_visibility_config 
  ~(metric_name : string)
  ~(cloud_watch_metrics_enabled : bool)
  ~(sampled_requests_enabled : bool)
  () : visibility_config = {
  metric_name; cloud_watch_metrics_enabled; sampled_requests_enabled; 
}

let make_immunity_time_property  ~(immunity_time : int) ()
: immunity_time_property = { immunity_time;  }

let make_captcha_config 
  ?(immunity_time_property : immunity_time_property option) ()
: captcha_config = { immunity_time_property;  }

let make_challenge_config 
  ?(immunity_time_property : immunity_time_property option) ()
: challenge_config = { immunity_time_property;  }

let make_rule 
  ?(challenge_config : challenge_config option)
  ?(captcha_config : captcha_config option)
  ?(rule_labels : label list option)
  ?(override_action : override_action option)
  ?(action : rule_action option)
  ~(visibility_config : visibility_config)
  ~(statement : statement)
  ~(priority : int)
  ~(name : string)
  () : rule = {
  challenge_config;
  captcha_config;
  visibility_config;
  rule_labels;
  override_action;
  action;
  statement;
  priority;
  name;
   }

let make_firewall_manager_statement 
  ?(rule_group_reference_statement : rule_group_reference_statement option)
  ?(managed_rule_group_statement : managed_rule_group_statement option)
  () : firewall_manager_statement = {
  rule_group_reference_statement; managed_rule_group_statement; 
}

let make_firewall_manager_rule_group 
  ~(visibility_config : visibility_config)
  ~(override_action : override_action)
  ~(firewall_manager_statement : firewall_manager_statement)
  ~(priority : int)
  ~(name : string)
  () : firewall_manager_rule_group = {
  visibility_config;
  override_action;
  firewall_manager_statement;
  priority;
  name;
   }

let make_custom_response_body 
  ~(content : string) ~(content_type : response_content_type) ()
: custom_response_body = { content; content_type; 
}

let make_request_body_associated_resource_type_config 
  ~(default_size_inspection_limit : size_inspection_limit) ()
: request_body_associated_resource_type_config = {
  default_size_inspection_limit;  }

let make_association_config 
  ?(request_body : (string * request_body_associated_resource_type_config) list option)
  () : association_config = { request_body;  }

let make_web_ac_l 
  ?(association_config : association_config option)
  ?(token_domains : string list option)
  ?(challenge_config : challenge_config option)
  ?(captcha_config : captcha_config option)
  ?(custom_response_bodies : (string * custom_response_body) list option)
  ?(label_namespace : string option)
  ?(managed_by_firewall_manager : bool option)
  ?(post_process_firewall_manager_rule_groups : firewall_manager_rule_group list option)
  ?(pre_process_firewall_manager_rule_groups : firewall_manager_rule_group list option)
  ?(capacity : int option)
  ?(rules : rule list option)
  ?(description : string option)
  ~(visibility_config : visibility_config)
  ~(default_action : default_action)
  ~(ar_n : string)
  ~(id : string)
  ~(name : string)
  () : web_ac_l = {
  association_config;
  token_domains;
  challenge_config;
  captcha_config;
  custom_response_bodies;
  label_namespace;
  managed_by_firewall_manager;
  post_process_firewall_manager_rule_groups;
  pre_process_firewall_manager_rule_groups;
  capacity;
  visibility_config;
  rules;
  description;
  default_action;
  ar_n;
  id;
  name;
   }

let make_version_to_publish 
  ?(forecasted_lifetime : int option)
  ?(associated_rule_group_arn : string option)
  () : version_to_publish = {
  forecasted_lifetime; associated_rule_group_arn; 
}

let make_update_web_acl_response  ?(next_lock_token : string option) ()
: update_web_acl_response = { next_lock_token; 
}

let make_update_web_acl_request 
  ?(association_config : association_config option)
  ?(token_domains : string list option)
  ?(challenge_config : challenge_config option)
  ?(captcha_config : captcha_config option)
  ?(custom_response_bodies : (string * custom_response_body) list option)
  ?(rules : rule list option)
  ?(description : string option)
  ~(lock_token : string)
  ~(visibility_config : visibility_config)
  ~(default_action : default_action)
  ~(id : string)
  ~(scope : scope)
  ~(name : string)
  () : update_web_acl_request = {
  association_config;
  token_domains;
  challenge_config;
  captcha_config;
  custom_response_bodies;
  lock_token;
  visibility_config;
  rules;
  description;
  default_action;
  id;
  scope;
  name;
   }

let make_update_rule_group_response  ?(next_lock_token : string option) ()
: update_rule_group_response = { next_lock_token; 
}

let make_update_rule_group_request 
  ?(custom_response_bodies : (string * custom_response_body) list option)
  ?(rules : rule list option)
  ?(description : string option)
  ~(lock_token : string)
  ~(visibility_config : visibility_config)
  ~(id : string)
  ~(scope : scope)
  ~(name : string)
  () : update_rule_group_request = {
  custom_response_bodies;
  lock_token;
  visibility_config;
  rules;
  description;
  id;
  scope;
  name;
   }

let make_update_regex_pattern_set_response 
  ?(next_lock_token : string option) () : update_regex_pattern_set_response =
{ next_lock_token;  }

let make_regex  ?(regex_string : string option) () : regex = { regex_string; 
}

let make_update_regex_pattern_set_request 
  ?(description : string option)
  ~(lock_token : string)
  ~(regular_expression_list : regex list)
  ~(id : string)
  ~(scope : scope)
  ~(name : string)
  () : update_regex_pattern_set_request = {
  lock_token; regular_expression_list; description; id; scope; name; 
}

let make_update_managed_rule_set_version_expiry_date_response 
  ?(next_lock_token : string option)
  ?(expiry_timestamp : float option)
  ?(expiring_version : string option)
  () : update_managed_rule_set_version_expiry_date_response = {
  next_lock_token; expiry_timestamp; expiring_version; 
}

let make_update_managed_rule_set_version_expiry_date_request 
  ~(expiry_timestamp : float)
  ~(version_to_expire : string)
  ~(lock_token : string)
  ~(id : string)
  ~(scope : scope)
  ~(name : string)
  () : update_managed_rule_set_version_expiry_date_request = {
  expiry_timestamp; version_to_expire; lock_token; id; scope; name; 
}

let make_update_ip_set_response  ?(next_lock_token : string option) ()
: update_ip_set_response = { next_lock_token; 
}

let make_update_ip_set_request 
  ?(description : string option)
  ~(lock_token : string)
  ~(addresses : string list)
  ~(id : string)
  ~(scope : scope)
  ~(name : string)
  () : update_ip_set_request = {
  lock_token; addresses; description; id; scope; name; 
}

let make_untag_resource_response  () : untag_resource_response =
()

let make_untag_resource_request 
  ~(tag_keys : string list) ~(resource_ar_n : string) ()
: untag_resource_request = { tag_keys; resource_ar_n;  }

let make_time_window  ~(end_time : float) ~(start_time : float) ()
: time_window = { end_time; start_time;  }

let make_tag_resource_response  () : tag_resource_response = ()

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_request 
  ~(tags : tag list) ~(resource_ar_n : string) () : tag_resource_request = {
  tags; resource_ar_n;  }

let make_tag_info_for_resource 
  ?(tag_list : tag list option) ?(resource_ar_n : string option) ()
: tag_info_for_resource = { tag_list; resource_ar_n;  }

let make_http_header  ?(value : string option) ?(name : string option) ()
: http_header = { value; name;  }

let make_http_request 
  ?(headers : http_header list option)
  ?(http_version : string option)
  ?(method_ : string option)
  ?(ur_i : string option)
  ?(country : string option)
  ?(client_i_p : string option)
  () : http_request = {
  headers; http_version; method_; ur_i; country; client_i_p; 
}

let make_captcha_response 
  ?(failure_reason : failure_reason option)
  ?(solve_timestamp : int option)
  ?(response_code : int option)
  () : captcha_response = { failure_reason; solve_timestamp; response_code; 
}

let make_challenge_response 
  ?(failure_reason : failure_reason option)
  ?(solve_timestamp : int option)
  ?(response_code : int option)
  () : challenge_response = {
  failure_reason; solve_timestamp; response_code; 
}

let make_sampled_http_request 
  ?(overridden_action : string option)
  ?(challenge_response : challenge_response option)
  ?(captcha_response : captcha_response option)
  ?(labels : label list option)
  ?(response_code_sent : int option)
  ?(request_headers_inserted : http_header list option)
  ?(rule_name_within_rule_group : string option)
  ?(action : string option)
  ?(timestamp_ : float option)
  ~(weight : int)
  ~(request : http_request)
  () : sampled_http_request = {
  overridden_action;
  challenge_response;
  captcha_response;
  labels;
  response_code_sent;
  request_headers_inserted;
  rule_name_within_rule_group;
  action;
  timestamp_;
  weight;
  request;
   }

let make_rule_summary 
  ?(action : rule_action option) ?(name : string option) () : rule_summary =
{ action; name;  }

let make_rule_group_summary 
  ?(ar_n : string option)
  ?(lock_token : string option)
  ?(description : string option)
  ?(id : string option)
  ?(name : string option)
  () : rule_group_summary = { ar_n; lock_token; description; id; name; 
}

let make_label_summary  ?(name : string option) () : label_summary = { 
name;  }

let make_rule_group 
  ?(consumed_labels : label_summary list option)
  ?(available_labels : label_summary list option)
  ?(custom_response_bodies : (string * custom_response_body) list option)
  ?(label_namespace : string option)
  ?(rules : rule list option)
  ?(description : string option)
  ~(visibility_config : visibility_config)
  ~(ar_n : string)
  ~(capacity : int)
  ~(id : string)
  ~(name : string)
  () : rule_group = {
  consumed_labels;
  available_labels;
  custom_response_bodies;
  label_namespace;
  visibility_config;
  rules;
  description;
  ar_n;
  capacity;
  id;
  name;
   }

let make_release_summary 
  ?(timestamp_ : float option) ?(release_version : string option) ()
: release_summary = { timestamp_; release_version; 
}

let make_regex_pattern_set_summary 
  ?(ar_n : string option)
  ?(lock_token : string option)
  ?(description : string option)
  ?(id : string option)
  ?(name : string option)
  () : regex_pattern_set_summary = {
  ar_n; lock_token; description; id; name;  }

let make_regex_pattern_set 
  ?(regular_expression_list : regex list option)
  ?(description : string option)
  ?(ar_n : string option)
  ?(id : string option)
  ?(name : string option)
  () : regex_pattern_set = {
  regular_expression_list; description; ar_n; id; name; 
}

let make_rate_based_statement_managed_keys_ip_set 
  ?(addresses : string list option)
  ?(ip_address_version : ip_address_version option)
  () : rate_based_statement_managed_keys_ip_set = {
  addresses; ip_address_version;  }

let make_put_permission_policy_response  () : put_permission_policy_response
= ()

let make_put_permission_policy_request 
  ~(policy : string) ~(resource_arn : string) ()
: put_permission_policy_request = { policy; resource_arn; 
}

let make_put_managed_rule_set_versions_response 
  ?(next_lock_token : string option) ()
: put_managed_rule_set_versions_response = { next_lock_token; 
}

let make_put_managed_rule_set_versions_request 
  ?(versions_to_publish : (string * version_to_publish) list option)
  ?(recommended_version : string option)
  ~(lock_token : string)
  ~(id : string)
  ~(scope : scope)
  ~(name : string)
  () : put_managed_rule_set_versions_request = {
  versions_to_publish; recommended_version; lock_token; id; scope; name; 
}

let make_action_condition  ~(action : action_value) () : action_condition = {
  action;  }

let make_label_name_condition  ~(label_name : string) ()
: label_name_condition = { label_name;  }

let make_condition 
  ?(label_name_condition : label_name_condition option)
  ?(action_condition : action_condition option)
  () : condition = { label_name_condition; action_condition; 
}

let make_filter 
  ~(conditions : condition list)
  ~(requirement : filter_requirement)
  ~(behavior : filter_behavior)
  () : filter = { conditions; requirement; behavior; 
}

let make_logging_filter 
  ~(default_behavior : filter_behavior) ~(filters : filter list) ()
: logging_filter = { default_behavior; filters; 
}

let make_logging_configuration 
  ?(log_scope : log_scope option)
  ?(log_type : log_type option)
  ?(logging_filter : logging_filter option)
  ?(managed_by_firewall_manager : bool option)
  ?(redacted_fields : field_to_match list option)
  ~(log_destination_configs : string list)
  ~(resource_arn : string)
  () : logging_configuration = {
  log_scope;
  log_type;
  logging_filter;
  managed_by_firewall_manager;
  redacted_fields;
  log_destination_configs;
  resource_arn;
   }

let make_put_logging_configuration_response 
  ?(logging_configuration : logging_configuration option) ()
: put_logging_configuration_response = { logging_configuration; 
}

let make_put_logging_configuration_request 
  ~(logging_configuration : logging_configuration) ()
: put_logging_configuration_request = { logging_configuration; 
}

let make_managed_rule_set_version 
  ?(expiry_timestamp : float option)
  ?(last_update_timestamp : float option)
  ?(publish_timestamp : float option)
  ?(forecasted_lifetime : int option)
  ?(capacity : int option)
  ?(associated_rule_group_arn : string option)
  () : managed_rule_set_version = {
  expiry_timestamp;
  last_update_timestamp;
  publish_timestamp;
  forecasted_lifetime;
  capacity;
  associated_rule_group_arn;
   }

let make_mobile_sdk_release 
  ?(tags : tag list option)
  ?(release_notes : string option)
  ?(timestamp_ : float option)
  ?(release_version : string option)
  () : mobile_sdk_release = {
  tags; release_notes; timestamp_; release_version; 
}

let make_managed_rule_set_summary 
  ?(label_namespace : string option)
  ?(ar_n : string option)
  ?(lock_token : string option)
  ?(description : string option)
  ?(id : string option)
  ?(name : string option)
  () : managed_rule_set_summary = {
  label_namespace; ar_n; lock_token; description; id; name; 
}

let make_managed_rule_set 
  ?(label_namespace : string option)
  ?(recommended_version : string option)
  ?(published_versions : (string * managed_rule_set_version) list option)
  ?(description : string option)
  ~(ar_n : string)
  ~(id : string)
  ~(name : string)
  () : managed_rule_set = {
  label_namespace;
  recommended_version;
  published_versions;
  description;
  ar_n;
  id;
  name;
   }

let make_managed_rule_group_version 
  ?(last_update_timestamp : float option) ?(name : string option) ()
: managed_rule_group_version = { last_update_timestamp; name; 
}

let make_managed_rule_group_summary 
  ?(description : string option)
  ?(versioning_supported : bool option)
  ?(name : string option)
  ?(vendor_name : string option)
  () : managed_rule_group_summary = {
  description; versioning_supported; name; vendor_name; 
}

let make_managed_product_descriptor 
  ?(is_advanced_managed_rule_set : bool option)
  ?(is_versioning_supported : bool option)
  ?(sns_topic_arn : string option)
  ?(product_description : string option)
  ?(product_title : string option)
  ?(product_link : string option)
  ?(product_id : string option)
  ?(managed_rule_set_name : string option)
  ?(vendor_name : string option)
  () : managed_product_descriptor = {
  is_advanced_managed_rule_set;
  is_versioning_supported;
  sns_topic_arn;
  product_description;
  product_title;
  product_link;
  product_id;
  managed_rule_set_name;
  vendor_name;
   }

let make_list_web_ac_ls_response 
  ?(web_ac_ls : web_acl_summary list option)
  ?(next_marker : string option)
  () : list_web_ac_ls_response = { web_ac_ls; next_marker; 
}

let make_list_web_ac_ls_request 
  ?(limit : int option) ?(next_marker : string option) ~(scope : scope) ()
: list_web_ac_ls_request = { limit; next_marker; scope; 
}

let make_list_tags_for_resource_response 
  ?(tag_info_for_resource : tag_info_for_resource option)
  ?(next_marker : string option)
  () : list_tags_for_resource_response = {
  tag_info_for_resource; next_marker; 
}

let make_list_tags_for_resource_request 
  ?(limit : int option)
  ?(next_marker : string option)
  ~(resource_ar_n : string)
  () : list_tags_for_resource_request = { resource_ar_n; limit; next_marker; 
}

let make_list_rule_groups_response 
  ?(rule_groups : rule_group_summary list option)
  ?(next_marker : string option)
  () : list_rule_groups_response = { rule_groups; next_marker; 
}

let make_list_rule_groups_request 
  ?(limit : int option) ?(next_marker : string option) ~(scope : scope) ()
: list_rule_groups_request = { limit; next_marker; scope; 
}

let make_list_resources_for_web_acl_response 
  ?(resource_arns : string list option) ()
: list_resources_for_web_acl_response = { resource_arns; 
}

let make_list_resources_for_web_acl_request 
  ?(resource_type : resource_type option) ~(web_acl_arn : string) ()
: list_resources_for_web_acl_request = { resource_type; web_acl_arn; 
}

let make_list_regex_pattern_sets_response 
  ?(regex_pattern_sets : regex_pattern_set_summary list option)
  ?(next_marker : string option)
  () : list_regex_pattern_sets_response = { regex_pattern_sets; next_marker; 
}

let make_list_regex_pattern_sets_request 
  ?(limit : int option) ?(next_marker : string option) ~(scope : scope) ()
: list_regex_pattern_sets_request = { limit; next_marker; scope; 
}

let make_list_mobile_sdk_releases_response 
  ?(next_marker : string option)
  ?(release_summaries : release_summary list option)
  () : list_mobile_sdk_releases_response = { next_marker; release_summaries; 
}

let make_list_mobile_sdk_releases_request 
  ?(limit : int option)
  ?(next_marker : string option)
  ~(platform : platform)
  () : list_mobile_sdk_releases_request = { limit; next_marker; platform; 
}

let make_list_managed_rule_sets_response 
  ?(managed_rule_sets : managed_rule_set_summary list option)
  ?(next_marker : string option)
  () : list_managed_rule_sets_response = { managed_rule_sets; next_marker; 
}

let make_list_managed_rule_sets_request 
  ?(limit : int option) ?(next_marker : string option) ~(scope : scope) ()
: list_managed_rule_sets_request = { limit; next_marker; scope; 
}

let make_list_logging_configurations_response 
  ?(next_marker : string option)
  ?(logging_configurations : logging_configuration list option)
  () : list_logging_configurations_response = {
  next_marker; logging_configurations; 
}

let make_list_logging_configurations_request 
  ?(log_scope : log_scope option)
  ?(limit : int option)
  ?(next_marker : string option)
  ~(scope : scope)
  () : list_logging_configurations_request = {
  log_scope; limit; next_marker; scope;  }

let make_ip_set_summary 
  ?(ar_n : string option)
  ?(lock_token : string option)
  ?(description : string option)
  ?(id : string option)
  ?(name : string option)
  () : ip_set_summary = { ar_n; lock_token; description; id; name; 
}

let make_list_ip_sets_response 
  ?(ip_sets : ip_set_summary list option) ?(next_marker : string option) ()
: list_ip_sets_response = { ip_sets; next_marker; 
}

let make_list_ip_sets_request 
  ?(limit : int option) ?(next_marker : string option) ~(scope : scope) ()
: list_ip_sets_request = { limit; next_marker; scope; 
}

let make_list_available_managed_rule_groups_response 
  ?(managed_rule_groups : managed_rule_group_summary list option)
  ?(next_marker : string option)
  () : list_available_managed_rule_groups_response = {
  managed_rule_groups; next_marker; 
}

let make_list_available_managed_rule_groups_request 
  ?(limit : int option) ?(next_marker : string option) ~(scope : scope) ()
: list_available_managed_rule_groups_request = { limit; next_marker; scope; 
}

let make_list_available_managed_rule_group_versions_response 
  ?(current_default_version : string option)
  ?(versions : managed_rule_group_version list option)
  ?(next_marker : string option)
  () : list_available_managed_rule_group_versions_response = {
  current_default_version; versions; next_marker; 
}

let make_list_available_managed_rule_group_versions_request 
  ?(limit : int option)
  ?(next_marker : string option)
  ~(scope : scope)
  ~(name : string)
  ~(vendor_name : string)
  () : list_available_managed_rule_group_versions_request = {
  limit; next_marker; scope; name; vendor_name;  }

let make_api_key_summary 
  ?(version : int option)
  ?(creation_timestamp : float option)
  ?(api_key : string option)
  ?(token_domains : string list option)
  () : api_key_summary = {
  version; creation_timestamp; api_key; token_domains; 
}

let make_list_api_keys_response 
  ?(application_integration_ur_l : string option)
  ?(api_key_summaries : api_key_summary list option)
  ?(next_marker : string option)
  () : list_api_keys_response = {
  application_integration_ur_l; api_key_summaries; next_marker; 
}

let make_list_api_keys_request 
  ?(limit : int option) ?(next_marker : string option) ~(scope : scope) ()
: list_api_keys_request = { limit; next_marker; scope;  }

let make_ip_set 
  ?(description : string option)
  ~(addresses : string list)
  ~(ip_address_version : ip_address_version)
  ~(ar_n : string)
  ~(id : string)
  ~(name : string)
  () : ip_set = {
  addresses; ip_address_version; description; ar_n; id; name; 
}

let make_get_web_acl_response 
  ?(application_integration_ur_l : string option)
  ?(lock_token : string option)
  ?(web_ac_l : web_ac_l option)
  () : get_web_acl_response = {
  application_integration_ur_l; lock_token; web_ac_l; 
}

let make_get_web_acl_request 
  ~(id : string) ~(scope : scope) ~(name : string) () : get_web_acl_request =
{ id; scope; name;  }

let make_get_web_acl_for_resource_response  ?(web_ac_l : web_ac_l option) ()
: get_web_acl_for_resource_response = { web_ac_l; 
}

let make_get_web_acl_for_resource_request  ~(resource_arn : string) ()
: get_web_acl_for_resource_request = { resource_arn; 
}

let make_get_sampled_requests_response 
  ?(time_window : time_window option)
  ?(population_size : int option)
  ?(sampled_requests : sampled_http_request list option)
  () : get_sampled_requests_response = {
  time_window; population_size; sampled_requests; 
}

let make_get_sampled_requests_request 
  ~(max_items : int)
  ~(time_window : time_window)
  ~(scope : scope)
  ~(rule_metric_name : string)
  ~(web_acl_arn : string)
  () : get_sampled_requests_request = {
  max_items; time_window; scope; rule_metric_name; web_acl_arn; 
}

let make_get_rule_group_response 
  ?(lock_token : string option) ?(rule_group : rule_group option) ()
: get_rule_group_response = { lock_token; rule_group; 
}

let make_get_rule_group_request 
  ?(ar_n : string option)
  ?(id : string option)
  ?(scope : scope option)
  ?(name : string option)
  () : get_rule_group_request = { ar_n; id; scope; name; 
}

let make_get_regex_pattern_set_response 
  ?(lock_token : string option)
  ?(regex_pattern_set : regex_pattern_set option)
  () : get_regex_pattern_set_response = { lock_token; regex_pattern_set; 
}

let make_get_regex_pattern_set_request 
  ~(id : string) ~(scope : scope) ~(name : string) ()
: get_regex_pattern_set_request = { id; scope; name; 
}

let make_get_rate_based_statement_managed_keys_response 
  ?(managed_keys_ip_v6 : rate_based_statement_managed_keys_ip_set option)
  ?(managed_keys_ip_v4 : rate_based_statement_managed_keys_ip_set option)
  () : get_rate_based_statement_managed_keys_response = {
  managed_keys_ip_v6; managed_keys_ip_v4; 
}

let make_get_rate_based_statement_managed_keys_request 
  ?(rule_group_rule_name : string option)
  ~(rule_name : string)
  ~(web_acl_id : string)
  ~(web_acl_name : string)
  ~(scope : scope)
  () : get_rate_based_statement_managed_keys_request = {
  rule_name; rule_group_rule_name; web_acl_id; web_acl_name; scope; 
}

let make_get_permission_policy_response  ?(policy : string option) ()
: get_permission_policy_response = { policy; 
}

let make_get_permission_policy_request  ~(resource_arn : string) ()
: get_permission_policy_request = { resource_arn; 
}

let make_get_mobile_sdk_release_response 
  ?(mobile_sdk_release : mobile_sdk_release option) ()
: get_mobile_sdk_release_response = { mobile_sdk_release; 
}

let make_get_mobile_sdk_release_request 
  ~(release_version : string) ~(platform : platform) ()
: get_mobile_sdk_release_request = { release_version; platform; 
}

let make_get_managed_rule_set_response 
  ?(lock_token : string option)
  ?(managed_rule_set : managed_rule_set option)
  () : get_managed_rule_set_response = { lock_token; managed_rule_set; 
}

let make_get_managed_rule_set_request 
  ~(id : string) ~(scope : scope) ~(name : string) ()
: get_managed_rule_set_request = { id; scope; name; 
}

let make_get_logging_configuration_response 
  ?(logging_configuration : logging_configuration option) ()
: get_logging_configuration_response = { logging_configuration; 
}

let make_get_logging_configuration_request 
  ?(log_scope : log_scope option)
  ?(log_type : log_type option)
  ~(resource_arn : string)
  () : get_logging_configuration_request = {
  log_scope; log_type; resource_arn;  }

let make_get_ip_set_response 
  ?(lock_token : string option) ?(ip_set : ip_set option) ()
: get_ip_set_response = { lock_token; ip_set;  }

let make_get_ip_set_request 
  ~(id : string) ~(scope : scope) ~(name : string) () : get_ip_set_request =
{ id; scope; name;  }

let make_get_decrypted_api_key_response 
  ?(creation_timestamp : float option)
  ?(token_domains : string list option)
  () : get_decrypted_api_key_response = { creation_timestamp; token_domains; 
}

let make_get_decrypted_api_key_request 
  ~(api_key : string) ~(scope : scope) () : get_decrypted_api_key_request = {
  api_key; scope;  }

let make_generate_mobile_sdk_release_url_response  ?(url : string option) ()
: generate_mobile_sdk_release_url_response = { url; 
}

let make_generate_mobile_sdk_release_url_request 
  ~(release_version : string) ~(platform : platform) ()
: generate_mobile_sdk_release_url_request = { release_version; platform; 
}

let make_disassociate_web_acl_response  () : disassociate_web_acl_response =
()

let make_disassociate_web_acl_request  ~(resource_arn : string) ()
: disassociate_web_acl_request = { resource_arn; 
}

let make_describe_managed_rule_group_response 
  ?(consumed_labels : label_summary list option)
  ?(available_labels : label_summary list option)
  ?(label_namespace : string option)
  ?(rules : rule_summary list option)
  ?(capacity : int option)
  ?(sns_topic_arn : string option)
  ?(version_name : string option)
  () : describe_managed_rule_group_response = {
  consumed_labels;
  available_labels;
  label_namespace;
  rules;
  capacity;
  sns_topic_arn;
  version_name;
   }

let make_describe_managed_rule_group_request 
  ?(version_name : string option)
  ~(scope : scope)
  ~(name : string)
  ~(vendor_name : string)
  () : describe_managed_rule_group_request = {
  version_name; scope; name; vendor_name; 
}

let make_describe_managed_products_by_vendor_response 
  ?(managed_products : managed_product_descriptor list option) ()
: describe_managed_products_by_vendor_response = { managed_products; 
}

let make_describe_managed_products_by_vendor_request 
  ~(scope : scope) ~(vendor_name : string) ()
: describe_managed_products_by_vendor_request = { scope; vendor_name; 
}

let make_describe_all_managed_products_response 
  ?(managed_products : managed_product_descriptor list option) ()
: describe_all_managed_products_response = { managed_products; 
}

let make_describe_all_managed_products_request  ~(scope : scope) ()
: describe_all_managed_products_request = { scope; 
}

let make_delete_web_acl_response  () : delete_web_acl_response =
()

let make_delete_web_acl_request 
  ~(lock_token : string) ~(id : string) ~(scope : scope) ~(name : string) ()
: delete_web_acl_request = { lock_token; id; scope; name; 
}

let make_delete_rule_group_response  () : delete_rule_group_response =
()

let make_delete_rule_group_request 
  ~(lock_token : string) ~(id : string) ~(scope : scope) ~(name : string) ()
: delete_rule_group_request = { lock_token; id; scope; name; 
}

let make_delete_regex_pattern_set_response  ()
: delete_regex_pattern_set_response =
()

let make_delete_regex_pattern_set_request 
  ~(lock_token : string) ~(id : string) ~(scope : scope) ~(name : string) ()
: delete_regex_pattern_set_request = { lock_token; id; scope; name; 
}

let make_delete_permission_policy_response  ()
: delete_permission_policy_response =
()

let make_delete_permission_policy_request  ~(resource_arn : string) ()
: delete_permission_policy_request = { resource_arn; 
}

let make_delete_logging_configuration_response  ()
: delete_logging_configuration_response =
()

let make_delete_logging_configuration_request 
  ?(log_scope : log_scope option)
  ?(log_type : log_type option)
  ~(resource_arn : string)
  () : delete_logging_configuration_request = {
  log_scope; log_type; resource_arn;  }

let make_delete_ip_set_response  () : delete_ip_set_response =
()

let make_delete_ip_set_request 
  ~(lock_token : string) ~(id : string) ~(scope : scope) ~(name : string) ()
: delete_ip_set_request = { lock_token; id; scope; name; 
}

let make_delete_firewall_manager_rule_groups_response 
  ?(next_web_acl_lock_token : string option) ()
: delete_firewall_manager_rule_groups_response = { next_web_acl_lock_token; 
}

let make_delete_firewall_manager_rule_groups_request 
  ~(web_acl_lock_token : string) ~(web_acl_arn : string) ()
: delete_firewall_manager_rule_groups_request = {
  web_acl_lock_token; web_acl_arn;  }

let make_delete_api_key_response  () : delete_api_key_response =
()

let make_delete_api_key_request  ~(api_key : string) ~(scope : scope) ()
: delete_api_key_request = { api_key; scope; 
}

let make_create_web_acl_response  ?(summary : web_acl_summary option) ()
: create_web_acl_response = { summary;  }

let make_create_web_acl_request 
  ?(association_config : association_config option)
  ?(token_domains : string list option)
  ?(challenge_config : challenge_config option)
  ?(captcha_config : captcha_config option)
  ?(custom_response_bodies : (string * custom_response_body) list option)
  ?(tags : tag list option)
  ?(rules : rule list option)
  ?(description : string option)
  ~(visibility_config : visibility_config)
  ~(default_action : default_action)
  ~(scope : scope)
  ~(name : string)
  () : create_web_acl_request = {
  association_config;
  token_domains;
  challenge_config;
  captcha_config;
  custom_response_bodies;
  tags;
  visibility_config;
  rules;
  description;
  default_action;
  scope;
  name;
   }

let make_create_rule_group_response 
  ?(summary : rule_group_summary option) () : create_rule_group_response = {
  summary;  }

let make_create_rule_group_request 
  ?(custom_response_bodies : (string * custom_response_body) list option)
  ?(tags : tag list option)
  ?(rules : rule list option)
  ?(description : string option)
  ~(visibility_config : visibility_config)
  ~(capacity : int)
  ~(scope : scope)
  ~(name : string)
  () : create_rule_group_request = {
  custom_response_bodies;
  tags;
  visibility_config;
  rules;
  description;
  capacity;
  scope;
  name;
   }

let make_create_regex_pattern_set_response 
  ?(summary : regex_pattern_set_summary option) ()
: create_regex_pattern_set_response = { summary; 
}

let make_create_regex_pattern_set_request 
  ?(tags : tag list option)
  ?(description : string option)
  ~(regular_expression_list : regex list)
  ~(scope : scope)
  ~(name : string)
  () : create_regex_pattern_set_request = {
  tags; regular_expression_list; description; scope; name; 
}

let make_create_ip_set_response  ?(summary : ip_set_summary option) ()
: create_ip_set_response = { summary;  }

let make_create_ip_set_request 
  ?(tags : tag list option)
  ?(description : string option)
  ~(addresses : string list)
  ~(ip_address_version : ip_address_version)
  ~(scope : scope)
  ~(name : string)
  () : create_ip_set_request = {
  tags; addresses; ip_address_version; description; scope; name; 
}

let make_create_api_key_response  ?(api_key : string option) ()
: create_api_key_response = { api_key;  }

let make_create_api_key_request 
  ~(token_domains : string list) ~(scope : scope) () : create_api_key_request
= { token_domains; scope;  }

let make_check_capacity_response  ?(capacity : int option) ()
: check_capacity_response = { capacity;  }

let make_check_capacity_request  ~(rules : rule list) ~(scope : scope) ()
: check_capacity_request = { rules; scope; 
}

let make_associate_web_acl_response  () : associate_web_acl_response =
()

let make_associate_web_acl_request 
  ~(resource_arn : string) ~(web_acl_arn : string) ()
: associate_web_acl_request = { resource_arn; web_acl_arn; 
}

