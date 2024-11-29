open Types
val make_single_header : name:string -> unit
-> single_header
(** Create a {!type-single_header} type *)

val make_single_query_argument : name:string -> unit
-> single_query_argument
(** Create a {!type-single_query_argument} type *)

val make_all_query_arguments : unit
-> all_query_arguments
(** Create a {!type-all_query_arguments} type *)

val make_uri_path : unit
-> uri_path
(** Create a {!type-uri_path} type *)

val make_query_string : unit
-> query_string
(** Create a {!type-query_string} type *)

val make_body : ?oversize_handling:oversize_handling -> unit
-> body
(** Create a {!type-body} type *)

val make_method_ : unit
-> method_
(** Create a {!type-method_} type *)

val make_all : unit
-> all
(** Create a {!type-all} type *)

val make_json_match_pattern : ?included_paths:string list -> ?all:all -> unit
-> json_match_pattern
(** Create a {!type-json_match_pattern} type *)

val make_json_body :
  ?oversize_handling:oversize_handling ->
  ?invalid_fallback_behavior:body_parsing_fallback_behavior ->
  match_scope:json_match_scope ->
  match_pattern:json_match_pattern ->
  unit
-> json_body
(** Create a {!type-json_body} type *)

val make_header_match_pattern :
  ?excluded_headers:string list ->
  ?included_headers:string list ->
  ?all:all ->
  unit
-> header_match_pattern
(** Create a {!type-header_match_pattern} type *)

val make_headers :
  oversize_handling:oversize_handling ->
  match_scope:map_match_scope ->
  match_pattern:header_match_pattern ->
  unit
-> headers
(** Create a {!type-headers} type *)

val make_cookie_match_pattern :
  ?excluded_cookies:string list ->
  ?included_cookies:string list ->
  ?all:all ->
  unit
-> cookie_match_pattern
(** Create a {!type-cookie_match_pattern} type *)

val make_cookies :
  oversize_handling:oversize_handling ->
  match_scope:map_match_scope ->
  match_pattern:cookie_match_pattern ->
  unit -> cookies
(** Create a {!type-cookies} type *)

val make_header_order : oversize_handling:oversize_handling -> unit
-> header_order
(** Create a {!type-header_order} type *)

val make_ja3_fingerprint : fallback_behavior:fallback_behavior -> unit
-> ja3_fingerprint
(** Create a {!type-ja3_fingerprint} type *)

val make_field_to_match :
  ?ja3_fingerprint:ja3_fingerprint ->
  ?header_order:header_order ->
  ?cookies:cookies ->
  ?headers:headers ->
  ?json_body:json_body ->
  ?method_:method_ ->
  ?body:body ->
  ?query_string:query_string ->
  ?uri_path:uri_path ->
  ?all_query_arguments:all_query_arguments ->
  ?single_query_argument:single_query_argument ->
  ?single_header:single_header ->
  unit
-> field_to_match
(** Create a {!type-field_to_match} type *)

val make_text_transformation :
  type_:text_transformation_type -> priority:int -> unit
-> text_transformation
(** Create a {!type-text_transformation} type *)

val make_xss_match_statement :
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  unit
-> xss_match_statement
(** Create a {!type-xss_match_statement} type *)

val make_web_acl_summary :
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit
-> web_acl_summary
(** Create a {!type-web_acl_summary} type *)

val make_custom_http_header : value:string -> name:string -> unit
-> custom_http_header
(** Create a {!type-custom_http_header} type *)

val make_custom_response :
  ?response_headers:custom_http_header list ->
  ?custom_response_body_key:string ->
  response_code:int ->
  unit
-> custom_response
(** Create a {!type-custom_response} type *)

val make_block_action : ?custom_response:custom_response -> unit
-> block_action
(** Create a {!type-block_action} type *)

val make_custom_request_handling :
  insert_headers:custom_http_header list -> unit
-> custom_request_handling
(** Create a {!type-custom_request_handling} type *)

val make_allow_action :
  ?custom_request_handling:custom_request_handling -> unit
-> allow_action
(** Create a {!type-allow_action} type *)

val make_default_action : ?allow:allow_action -> ?block:block_action -> unit
-> default_action
(** Create a {!type-default_action} type *)

val make_byte_match_statement :
  positional_constraint:positional_constraint ->
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  search_string:bytes ->
  unit
-> byte_match_statement
(** Create a {!type-byte_match_statement} type *)

val make_sqli_match_statement :
  ?sensitivity_level:sensitivity_level ->
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  unit
-> sqli_match_statement
(** Create a {!type-sqli_match_statement} type *)

val make_size_constraint_statement :
  text_transformations:text_transformation list ->
  size:int ->
  comparison_operator:comparison_operator ->
  field_to_match:field_to_match ->
  unit
-> size_constraint_statement
(** Create a {!type-size_constraint_statement} type *)

val make_forwarded_ip_config :
  fallback_behavior:fallback_behavior -> header_name:string -> unit
-> forwarded_ip_config
(** Create a {!type-forwarded_ip_config} type *)

val make_geo_match_statement :
  ?forwarded_ip_config:forwarded_ip_config ->
  ?country_codes:country_code list ->
  unit
-> geo_match_statement
(** Create a {!type-geo_match_statement} type *)

val make_excluded_rule : name:string -> unit
-> excluded_rule
(** Create a {!type-excluded_rule} type *)

val make_count_action :
  ?custom_request_handling:custom_request_handling -> unit
-> count_action
(** Create a {!type-count_action} type *)

val make_captcha_action :
  ?custom_request_handling:custom_request_handling -> unit
-> captcha_action
(** Create a {!type-captcha_action} type *)

val make_challenge_action :
  ?custom_request_handling:custom_request_handling -> unit
-> challenge_action
(** Create a {!type-challenge_action} type *)

val make_rule_action :
  ?challenge:challenge_action ->
  ?captcha:captcha_action ->
  ?count:count_action ->
  ?allow:allow_action ->
  ?block:block_action ->
  unit
-> rule_action
(** Create a {!type-rule_action} type *)

val make_rule_action_override :
  action_to_use:rule_action -> name:string -> unit
-> rule_action_override
(** Create a {!type-rule_action_override} type *)

val make_rule_group_reference_statement :
  ?rule_action_overrides:rule_action_override list ->
  ?excluded_rules:excluded_rule list ->
  ar_n:string ->
  unit
-> rule_group_reference_statement
(** Create a {!type-rule_group_reference_statement} type *)

val make_ip_set_forwarded_ip_config :
  position:forwarded_ip_position ->
  fallback_behavior:fallback_behavior ->
  header_name:string ->
  unit
-> ip_set_forwarded_ip_config
(** Create a {!type-ip_set_forwarded_ip_config} type *)

val make_ip_set_reference_statement :
  ?ip_set_forwarded_ip_config:ip_set_forwarded_ip_config ->
  ar_n:string ->
  unit
-> ip_set_reference_statement
(** Create a {!type-ip_set_reference_statement} type *)

val make_regex_pattern_set_reference_statement :
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  ar_n:string ->
  unit
-> regex_pattern_set_reference_statement
(** Create a {!type-regex_pattern_set_reference_statement} type *)

val make_rate_limit_header :
  text_transformations:text_transformation list -> name:string -> unit
-> rate_limit_header
(** Create a {!type-rate_limit_header} type *)

val make_rate_limit_cookie :
  text_transformations:text_transformation list -> name:string -> unit
-> rate_limit_cookie
(** Create a {!type-rate_limit_cookie} type *)

val make_rate_limit_query_argument :
  text_transformations:text_transformation list -> name:string -> unit
-> rate_limit_query_argument
(** Create a {!type-rate_limit_query_argument} type *)

val make_rate_limit_query_string :
  text_transformations:text_transformation list -> unit
-> rate_limit_query_string
(** Create a {!type-rate_limit_query_string} type *)

val make_rate_limit_http_method : unit
-> rate_limit_http_method
(** Create a {!type-rate_limit_http_method} type *)

val make_rate_limit_forwarded_i_p : unit
-> rate_limit_forwarded_i_p
(** Create a {!type-rate_limit_forwarded_i_p} type *)

val make_rate_limit_i_p : unit
-> rate_limit_i_p
(** Create a {!type-rate_limit_i_p} type *)

val make_rate_limit_label_namespace : namespace:string -> unit
-> rate_limit_label_namespace
(** Create a {!type-rate_limit_label_namespace} type *)

val make_rate_limit_uri_path :
  text_transformations:text_transformation list -> unit
-> rate_limit_uri_path
(** Create a {!type-rate_limit_uri_path} type *)

val make_rate_based_statement_custom_key :
  ?uri_path:rate_limit_uri_path ->
  ?label_namespace:rate_limit_label_namespace ->
  ?i_p:rate_limit_i_p ->
  ?forwarded_i_p:rate_limit_forwarded_i_p ->
  ?http_method:rate_limit_http_method ->
  ?query_string:rate_limit_query_string ->
  ?query_argument:rate_limit_query_argument ->
  ?cookie:rate_limit_cookie ->
  ?header:rate_limit_header ->
  unit
-> rate_based_statement_custom_key
(** Create a {!type-rate_based_statement_custom_key} type *)

val make_username_field : identifier:string -> unit
-> username_field
(** Create a {!type-username_field} type *)

val make_password_field : identifier:string -> unit
-> password_field
(** Create a {!type-password_field} type *)

val make_aws_managed_rules_bot_control_rule_set :
  ?enable_machine_learning:bool -> inspection_level:inspection_level -> unit
-> aws_managed_rules_bot_control_rule_set
(** Create a {!type-aws_managed_rules_bot_control_rule_set} type *)

val make_request_inspection :
  password_field:password_field ->
  username_field:username_field ->
  payload_type:payload_type ->
  unit
-> request_inspection
(** Create a {!type-request_inspection} type *)

val make_response_inspection_status_code :
  failure_codes:int list -> success_codes:int list -> unit
-> response_inspection_status_code
(** Create a {!type-response_inspection_status_code} type *)

val make_response_inspection_header :
  failure_values:string list ->
  success_values:string list ->
  name:string ->
  unit
-> response_inspection_header
(** Create a {!type-response_inspection_header} type *)

val make_response_inspection_body_contains :
  failure_strings:string list -> success_strings:string list -> unit
-> response_inspection_body_contains
(** Create a {!type-response_inspection_body_contains} type *)

val make_response_inspection_json :
  failure_values:string list ->
  success_values:string list ->
  identifier:string ->
  unit
-> response_inspection_json
(** Create a {!type-response_inspection_json} type *)

val make_response_inspection :
  ?json:response_inspection_json ->
  ?body_contains:response_inspection_body_contains ->
  ?header:response_inspection_header ->
  ?status_code:response_inspection_status_code ->
  unit
-> response_inspection
(** Create a {!type-response_inspection} type *)

val make_aws_managed_rules_atp_rule_set :
  ?enable_regex_in_path:bool ->
  ?response_inspection:response_inspection ->
  ?request_inspection:request_inspection ->
  login_path:string ->
  unit
-> aws_managed_rules_atp_rule_set
(** Create a {!type-aws_managed_rules_atp_rule_set} type *)

val make_email_field : identifier:string -> unit
-> email_field
(** Create a {!type-email_field} type *)

val make_phone_number_field : identifier:string -> unit
-> phone_number_field
(** Create a {!type-phone_number_field} type *)

val make_address_field : identifier:string -> unit
-> address_field
(** Create a {!type-address_field} type *)

val make_request_inspection_acf_p :
  ?address_fields:address_field list ->
  ?phone_number_fields:phone_number_field list ->
  ?email_field:email_field ->
  ?password_field:password_field ->
  ?username_field:username_field ->
  payload_type:payload_type ->
  unit
-> request_inspection_acf_p
(** Create a {!type-request_inspection_acf_p} type *)

val make_aws_managed_rules_acfp_rule_set :
  ?enable_regex_in_path:bool ->
  ?response_inspection:response_inspection ->
  request_inspection:request_inspection_acf_p ->
  registration_page_path:string ->
  creation_path:string ->
  unit
-> aws_managed_rules_acfp_rule_set
(** Create a {!type-aws_managed_rules_acfp_rule_set} type *)

val make_managed_rule_group_config :
  ?aws_managed_rules_acfp_rule_set:aws_managed_rules_acfp_rule_set ->
  ?aws_managed_rules_atp_rule_set:aws_managed_rules_atp_rule_set ->
  ?aws_managed_rules_bot_control_rule_set:aws_managed_rules_bot_control_rule_set ->
  ?password_field:password_field ->
  ?username_field:username_field ->
  ?payload_type:payload_type ->
  ?login_path:string ->
  unit
-> managed_rule_group_config
(** Create a {!type-managed_rule_group_config} type *)

val make_label_match_statement :
  key:string -> scope:label_match_scope -> unit
-> label_match_statement
(** Create a {!type-label_match_statement} type *)

val make_regex_match_statement :
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  regex_string:string ->
  unit
-> regex_match_statement
(** Create a {!type-regex_match_statement} type *)

val make_and_statement : statements:statement list -> unit
-> and_statement
(** Create a {!type-and_statement} type *)

val make_managed_rule_group_statement :
  ?rule_action_overrides:rule_action_override list ->
  ?managed_rule_group_configs:managed_rule_group_config list ->
  ?scope_down_statement:statement ->
  ?excluded_rules:excluded_rule list ->
  ?version:string ->
  name:string ->
  vendor_name:string ->
  unit
-> managed_rule_group_statement
(** Create a {!type-managed_rule_group_statement} type *)

val make_not_statement : statement:statement -> unit
-> not_statement
(** Create a {!type-not_statement} type *)

val make_or_statement : statements:statement list -> unit
-> or_statement
(** Create a {!type-or_statement} type *)

val make_rate_based_statement :
  ?custom_keys:rate_based_statement_custom_key list ->
  ?forwarded_ip_config:forwarded_ip_config ->
  ?scope_down_statement:statement ->
  ?evaluation_window_sec:int ->
  aggregate_key_type:rate_based_statement_aggregate_key_type ->
  limit:int ->
  unit
-> rate_based_statement
(** Create a {!type-rate_based_statement} type *)

val make_statement :
  ?regex_match_statement:regex_match_statement ->
  ?label_match_statement:label_match_statement ->
  ?managed_rule_group_statement:managed_rule_group_statement ->
  ?not_statement:not_statement ->
  ?or_statement:or_statement ->
  ?and_statement:and_statement ->
  ?rate_based_statement:rate_based_statement ->
  ?regex_pattern_set_reference_statement:regex_pattern_set_reference_statement ->
  ?ip_set_reference_statement:ip_set_reference_statement ->
  ?rule_group_reference_statement:rule_group_reference_statement ->
  ?geo_match_statement:geo_match_statement ->
  ?size_constraint_statement:size_constraint_statement ->
  ?xss_match_statement:xss_match_statement ->
  ?sqli_match_statement:sqli_match_statement ->
  ?byte_match_statement:byte_match_statement ->
  unit
-> statement
(** Create a {!type-statement} type *)

val make_none_action : unit
-> none_action
(** Create a {!type-none_action} type *)

val make_override_action : ?none:none_action -> ?count:count_action -> unit
-> override_action
(** Create a {!type-override_action} type *)

val make_label : name:string -> unit
-> label
(** Create a {!type-label} type *)

val make_visibility_config :
  metric_name:string ->
  cloud_watch_metrics_enabled:bool ->
  sampled_requests_enabled:bool ->
  unit
-> visibility_config
(** Create a {!type-visibility_config} type *)

val make_immunity_time_property : immunity_time:int -> unit
-> immunity_time_property
(** Create a {!type-immunity_time_property} type *)

val make_captcha_config :
  ?immunity_time_property:immunity_time_property -> unit
-> captcha_config
(** Create a {!type-captcha_config} type *)

val make_challenge_config :
  ?immunity_time_property:immunity_time_property -> unit
-> challenge_config
(** Create a {!type-challenge_config} type *)

val make_rule :
  ?challenge_config:challenge_config ->
  ?captcha_config:captcha_config ->
  ?rule_labels:label list ->
  ?override_action:override_action ->
  ?action:rule_action ->
  visibility_config:visibility_config ->
  statement:statement ->
  priority:int ->
  name:string ->
  unit
-> rule
(** Create a {!type-rule} type *)

val make_firewall_manager_statement :
  ?rule_group_reference_statement:rule_group_reference_statement ->
  ?managed_rule_group_statement:managed_rule_group_statement ->
  unit
-> firewall_manager_statement
(** Create a {!type-firewall_manager_statement} type *)

val make_firewall_manager_rule_group :
  visibility_config:visibility_config ->
  override_action:override_action ->
  firewall_manager_statement:firewall_manager_statement ->
  priority:int ->
  name:string ->
  unit
-> firewall_manager_rule_group
(** Create a {!type-firewall_manager_rule_group} type *)

val make_custom_response_body :
  content:string -> content_type:response_content_type -> unit
-> custom_response_body
(** Create a {!type-custom_response_body} type *)

val make_request_body_associated_resource_type_config :
  default_size_inspection_limit:size_inspection_limit -> unit
-> request_body_associated_resource_type_config
(** Create a {!type-request_body_associated_resource_type_config} type *)

val make_association_config :
  ?request_body:(string * request_body_associated_resource_type_config) list ->
  unit
-> association_config
(** Create a {!type-association_config} type *)

val make_web_ac_l :
  ?association_config:association_config ->
  ?token_domains:string list ->
  ?challenge_config:challenge_config ->
  ?captcha_config:captcha_config ->
  ?custom_response_bodies:(string * custom_response_body) list ->
  ?label_namespace:string ->
  ?managed_by_firewall_manager:bool ->
  ?post_process_firewall_manager_rule_groups:firewall_manager_rule_group list ->
  ?pre_process_firewall_manager_rule_groups:firewall_manager_rule_group list ->
  ?capacity:int ->
  ?rules:rule list ->
  ?description:string ->
  visibility_config:visibility_config ->
  default_action:default_action ->
  ar_n:string ->
  id:string ->
  name:string ->
  unit
-> web_ac_l
(** Create a {!type-web_ac_l} type *)

val make_version_to_publish :
  ?forecasted_lifetime:int -> ?associated_rule_group_arn:string -> unit
-> version_to_publish
(** Create a {!type-version_to_publish} type *)

val make_update_web_acl_response : ?next_lock_token:string -> unit
-> update_web_acl_response
(** Create a {!type-update_web_acl_response} type *)

val make_update_web_acl_request :
  ?association_config:association_config ->
  ?token_domains:string list ->
  ?challenge_config:challenge_config ->
  ?captcha_config:captcha_config ->
  ?custom_response_bodies:(string * custom_response_body) list ->
  ?rules:rule list ->
  ?description:string ->
  lock_token:string ->
  visibility_config:visibility_config ->
  default_action:default_action ->
  id:string ->
  scope:scope ->
  name:string ->
  unit
-> update_web_acl_request
(** Create a {!type-update_web_acl_request} type *)

val make_update_rule_group_response : ?next_lock_token:string -> unit
-> update_rule_group_response
(** Create a {!type-update_rule_group_response} type *)

val make_update_rule_group_request :
  ?custom_response_bodies:(string * custom_response_body) list ->
  ?rules:rule list ->
  ?description:string ->
  lock_token:string ->
  visibility_config:visibility_config ->
  id:string ->
  scope:scope ->
  name:string ->
  unit
-> update_rule_group_request
(** Create a {!type-update_rule_group_request} type *)

val make_update_regex_pattern_set_response : ?next_lock_token:string -> unit
-> update_regex_pattern_set_response
(** Create a {!type-update_regex_pattern_set_response} type *)

val make_regex : ?regex_string:string -> unit
-> regex
(** Create a {!type-regex} type *)

val make_update_regex_pattern_set_request :
  ?description:string ->
  lock_token:string ->
  regular_expression_list:regex list ->
  id:string ->
  scope:scope ->
  name:string ->
  unit
-> update_regex_pattern_set_request
(** Create a {!type-update_regex_pattern_set_request} type *)

val make_update_managed_rule_set_version_expiry_date_response :
  ?next_lock_token:string ->
  ?expiry_timestamp:float ->
  ?expiring_version:string ->
  unit
-> update_managed_rule_set_version_expiry_date_response
(** Create a {!type-update_managed_rule_set_version_expiry_date_response} type *)

val make_update_managed_rule_set_version_expiry_date_request :
  expiry_timestamp:float ->
  version_to_expire:string ->
  lock_token:string ->
  id:string ->
  scope:scope ->
  name:string ->
  unit
-> update_managed_rule_set_version_expiry_date_request
(** Create a {!type-update_managed_rule_set_version_expiry_date_request} type *)

val make_update_ip_set_response : ?next_lock_token:string -> unit
-> update_ip_set_response
(** Create a {!type-update_ip_set_response} type *)

val make_update_ip_set_request :
  ?description:string ->
  lock_token:string ->
  addresses:string list ->
  id:string ->
  scope:scope ->
  name:string ->
  unit
-> update_ip_set_request
(** Create a {!type-update_ip_set_request} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_time_window : end_time:float -> start_time:float -> unit
-> time_window
(** Create a {!type-time_window} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_tag_info_for_resource :
  ?tag_list:tag list -> ?resource_ar_n:string -> unit
-> tag_info_for_resource
(** Create a {!type-tag_info_for_resource} type *)

val make_http_header : ?value:string -> ?name:string -> unit
-> http_header
(** Create a {!type-http_header} type *)

val make_http_request :
  ?headers:http_header list ->
  ?http_version:string ->
  ?method_:string ->
  ?ur_i:string ->
  ?country:string ->
  ?client_i_p:string ->
  unit
-> http_request
(** Create a {!type-http_request} type *)

val make_captcha_response :
  ?failure_reason:failure_reason ->
  ?solve_timestamp:int ->
  ?response_code:int ->
  unit
-> captcha_response
(** Create a {!type-captcha_response} type *)

val make_challenge_response :
  ?failure_reason:failure_reason ->
  ?solve_timestamp:int ->
  ?response_code:int ->
  unit
-> challenge_response
(** Create a {!type-challenge_response} type *)

val make_sampled_http_request :
  ?overridden_action:string ->
  ?challenge_response:challenge_response ->
  ?captcha_response:captcha_response ->
  ?labels:label list ->
  ?response_code_sent:int ->
  ?request_headers_inserted:http_header list ->
  ?rule_name_within_rule_group:string ->
  ?action:string ->
  ?timestamp_:float ->
  weight:int ->
  request:http_request ->
  unit
-> sampled_http_request
(** Create a {!type-sampled_http_request} type *)

val make_rule_summary : ?action:rule_action -> ?name:string -> unit
-> rule_summary
(** Create a {!type-rule_summary} type *)

val make_rule_group_summary :
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit
-> rule_group_summary
(** Create a {!type-rule_group_summary} type *)

val make_label_summary : ?name:string -> unit
-> label_summary
(** Create a {!type-label_summary} type *)

val make_rule_group :
  ?consumed_labels:label_summary list ->
  ?available_labels:label_summary list ->
  ?custom_response_bodies:(string * custom_response_body) list ->
  ?label_namespace:string ->
  ?rules:rule list ->
  ?description:string ->
  visibility_config:visibility_config ->
  ar_n:string ->
  capacity:int ->
  id:string ->
  name:string ->
  unit
-> rule_group
(** Create a {!type-rule_group} type *)

val make_release_summary :
  ?timestamp_:float -> ?release_version:string -> unit
-> release_summary
(** Create a {!type-release_summary} type *)

val make_regex_pattern_set_summary :
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit
-> regex_pattern_set_summary
(** Create a {!type-regex_pattern_set_summary} type *)

val make_regex_pattern_set :
  ?regular_expression_list:regex list ->
  ?description:string ->
  ?ar_n:string ->
  ?id:string ->
  ?name:string ->
  unit
-> regex_pattern_set
(** Create a {!type-regex_pattern_set} type *)

val make_rate_based_statement_managed_keys_ip_set :
  ?addresses:string list -> ?ip_address_version:ip_address_version -> unit
-> rate_based_statement_managed_keys_ip_set
(** Create a {!type-rate_based_statement_managed_keys_ip_set} type *)

val make_put_permission_policy_response : unit
-> put_permission_policy_response
(** Create a {!type-put_permission_policy_response} type *)

val make_put_permission_policy_request :
  policy:string -> resource_arn:string -> unit
-> put_permission_policy_request
(** Create a {!type-put_permission_policy_request} type *)

val make_put_managed_rule_set_versions_response :
  ?next_lock_token:string -> unit
-> put_managed_rule_set_versions_response
(** Create a {!type-put_managed_rule_set_versions_response} type *)

val make_put_managed_rule_set_versions_request :
  ?versions_to_publish:(string * version_to_publish) list ->
  ?recommended_version:string ->
  lock_token:string ->
  id:string ->
  scope:scope ->
  name:string ->
  unit
-> put_managed_rule_set_versions_request
(** Create a {!type-put_managed_rule_set_versions_request} type *)

val make_action_condition : action:action_value -> unit
-> action_condition
(** Create a {!type-action_condition} type *)

val make_label_name_condition : label_name:string -> unit
-> label_name_condition
(** Create a {!type-label_name_condition} type *)

val make_condition :
  ?label_name_condition:label_name_condition ->
  ?action_condition:action_condition ->
  unit -> condition
(** Create a {!type-condition} type *)

val make_filter :
  conditions:condition list ->
  requirement:filter_requirement ->
  behavior:filter_behavior ->
  unit -> filter
(** Create a {!type-filter} type *)

val make_logging_filter :
  default_behavior:filter_behavior -> filters:filter list -> unit
-> logging_filter
(** Create a {!type-logging_filter} type *)

val make_logging_configuration :
  ?log_scope:log_scope ->
  ?log_type:log_type ->
  ?logging_filter:logging_filter ->
  ?managed_by_firewall_manager:bool ->
  ?redacted_fields:field_to_match list ->
  log_destination_configs:string list ->
  resource_arn:string ->
  unit
-> logging_configuration
(** Create a {!type-logging_configuration} type *)

val make_put_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit
-> put_logging_configuration_response
(** Create a {!type-put_logging_configuration_response} type *)

val make_put_logging_configuration_request :
  logging_configuration:logging_configuration -> unit
-> put_logging_configuration_request
(** Create a {!type-put_logging_configuration_request} type *)

val make_managed_rule_set_version :
  ?expiry_timestamp:float ->
  ?last_update_timestamp:float ->
  ?publish_timestamp:float ->
  ?forecasted_lifetime:int ->
  ?capacity:int ->
  ?associated_rule_group_arn:string ->
  unit
-> managed_rule_set_version
(** Create a {!type-managed_rule_set_version} type *)

val make_mobile_sdk_release :
  ?tags:tag list ->
  ?release_notes:string ->
  ?timestamp_:float ->
  ?release_version:string ->
  unit
-> mobile_sdk_release
(** Create a {!type-mobile_sdk_release} type *)

val make_managed_rule_set_summary :
  ?label_namespace:string ->
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit
-> managed_rule_set_summary
(** Create a {!type-managed_rule_set_summary} type *)

val make_managed_rule_set :
  ?label_namespace:string ->
  ?recommended_version:string ->
  ?published_versions:(string * managed_rule_set_version) list ->
  ?description:string ->
  ar_n:string ->
  id:string ->
  name:string ->
  unit
-> managed_rule_set
(** Create a {!type-managed_rule_set} type *)

val make_managed_rule_group_version :
  ?last_update_timestamp:float -> ?name:string -> unit
-> managed_rule_group_version
(** Create a {!type-managed_rule_group_version} type *)

val make_managed_rule_group_summary :
  ?description:string ->
  ?versioning_supported:bool ->
  ?name:string ->
  ?vendor_name:string ->
  unit
-> managed_rule_group_summary
(** Create a {!type-managed_rule_group_summary} type *)

val make_managed_product_descriptor :
  ?is_advanced_managed_rule_set:bool ->
  ?is_versioning_supported:bool ->
  ?sns_topic_arn:string ->
  ?product_description:string ->
  ?product_title:string ->
  ?product_link:string ->
  ?product_id:string ->
  ?managed_rule_set_name:string ->
  ?vendor_name:string ->
  unit
-> managed_product_descriptor
(** Create a {!type-managed_product_descriptor} type *)

val make_list_web_ac_ls_response :
  ?web_ac_ls:web_acl_summary list -> ?next_marker:string -> unit
-> list_web_ac_ls_response
(** Create a {!type-list_web_ac_ls_response} type *)

val make_list_web_ac_ls_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_web_ac_ls_request
(** Create a {!type-list_web_ac_ls_request} type *)

val make_list_tags_for_resource_response :
  ?tag_info_for_resource:tag_info_for_resource -> ?next_marker:string -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request :
  ?limit:int -> ?next_marker:string -> resource_ar_n:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_list_rule_groups_response :
  ?rule_groups:rule_group_summary list -> ?next_marker:string -> unit
-> list_rule_groups_response
(** Create a {!type-list_rule_groups_response} type *)

val make_list_rule_groups_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_rule_groups_request
(** Create a {!type-list_rule_groups_request} type *)

val make_list_resources_for_web_acl_response :
  ?resource_arns:string list -> unit
-> list_resources_for_web_acl_response
(** Create a {!type-list_resources_for_web_acl_response} type *)

val make_list_resources_for_web_acl_request :
  ?resource_type:resource_type -> web_acl_arn:string -> unit
-> list_resources_for_web_acl_request
(** Create a {!type-list_resources_for_web_acl_request} type *)

val make_list_regex_pattern_sets_response :
  ?regex_pattern_sets:regex_pattern_set_summary list ->
  ?next_marker:string ->
  unit
-> list_regex_pattern_sets_response
(** Create a {!type-list_regex_pattern_sets_response} type *)

val make_list_regex_pattern_sets_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_regex_pattern_sets_request
(** Create a {!type-list_regex_pattern_sets_request} type *)

val make_list_mobile_sdk_releases_response :
  ?next_marker:string -> ?release_summaries:release_summary list -> unit
-> list_mobile_sdk_releases_response
(** Create a {!type-list_mobile_sdk_releases_response} type *)

val make_list_mobile_sdk_releases_request :
  ?limit:int -> ?next_marker:string -> platform:platform -> unit
-> list_mobile_sdk_releases_request
(** Create a {!type-list_mobile_sdk_releases_request} type *)

val make_list_managed_rule_sets_response :
  ?managed_rule_sets:managed_rule_set_summary list ->
  ?next_marker:string ->
  unit
-> list_managed_rule_sets_response
(** Create a {!type-list_managed_rule_sets_response} type *)

val make_list_managed_rule_sets_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_managed_rule_sets_request
(** Create a {!type-list_managed_rule_sets_request} type *)

val make_list_logging_configurations_response :
  ?next_marker:string ->
  ?logging_configurations:logging_configuration list ->
  unit
-> list_logging_configurations_response
(** Create a {!type-list_logging_configurations_response} type *)

val make_list_logging_configurations_request :
  ?log_scope:log_scope ->
  ?limit:int ->
  ?next_marker:string ->
  scope:scope ->
  unit
-> list_logging_configurations_request
(** Create a {!type-list_logging_configurations_request} type *)

val make_ip_set_summary :
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit
-> ip_set_summary
(** Create a {!type-ip_set_summary} type *)

val make_list_ip_sets_response :
  ?ip_sets:ip_set_summary list -> ?next_marker:string -> unit
-> list_ip_sets_response
(** Create a {!type-list_ip_sets_response} type *)

val make_list_ip_sets_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_ip_sets_request
(** Create a {!type-list_ip_sets_request} type *)

val make_list_available_managed_rule_groups_response :
  ?managed_rule_groups:managed_rule_group_summary list ->
  ?next_marker:string ->
  unit
-> list_available_managed_rule_groups_response
(** Create a {!type-list_available_managed_rule_groups_response} type *)

val make_list_available_managed_rule_groups_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_available_managed_rule_groups_request
(** Create a {!type-list_available_managed_rule_groups_request} type *)

val make_list_available_managed_rule_group_versions_response :
  ?current_default_version:string ->
  ?versions:managed_rule_group_version list ->
  ?next_marker:string ->
  unit
-> list_available_managed_rule_group_versions_response
(** Create a {!type-list_available_managed_rule_group_versions_response} type *)

val make_list_available_managed_rule_group_versions_request :
  ?limit:int ->
  ?next_marker:string ->
  scope:scope ->
  name:string ->
  vendor_name:string ->
  unit
-> list_available_managed_rule_group_versions_request
(** Create a {!type-list_available_managed_rule_group_versions_request} type *)

val make_api_key_summary :
  ?version:int ->
  ?creation_timestamp:float ->
  ?api_key:string ->
  ?token_domains:string list ->
  unit
-> api_key_summary
(** Create a {!type-api_key_summary} type *)

val make_list_api_keys_response :
  ?application_integration_ur_l:string ->
  ?api_key_summaries:api_key_summary list ->
  ?next_marker:string ->
  unit
-> list_api_keys_response
(** Create a {!type-list_api_keys_response} type *)

val make_list_api_keys_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_api_keys_request
(** Create a {!type-list_api_keys_request} type *)

val make_ip_set :
  ?description:string ->
  addresses:string list ->
  ip_address_version:ip_address_version ->
  ar_n:string ->
  id:string ->
  name:string ->
  unit
-> ip_set
(** Create a {!type-ip_set} type *)

val make_get_web_acl_response :
  ?application_integration_ur_l:string ->
  ?lock_token:string ->
  ?web_ac_l:web_ac_l ->
  unit
-> get_web_acl_response
(** Create a {!type-get_web_acl_response} type *)

val make_get_web_acl_request :
  id:string -> scope:scope -> name:string -> unit
-> get_web_acl_request
(** Create a {!type-get_web_acl_request} type *)

val make_get_web_acl_for_resource_response : ?web_ac_l:web_ac_l -> unit
-> get_web_acl_for_resource_response
(** Create a {!type-get_web_acl_for_resource_response} type *)

val make_get_web_acl_for_resource_request : resource_arn:string -> unit
-> get_web_acl_for_resource_request
(** Create a {!type-get_web_acl_for_resource_request} type *)

val make_get_sampled_requests_response :
  ?time_window:time_window ->
  ?population_size:int ->
  ?sampled_requests:sampled_http_request list ->
  unit
-> get_sampled_requests_response
(** Create a {!type-get_sampled_requests_response} type *)

val make_get_sampled_requests_request :
  max_items:int ->
  time_window:time_window ->
  scope:scope ->
  rule_metric_name:string ->
  web_acl_arn:string ->
  unit
-> get_sampled_requests_request
(** Create a {!type-get_sampled_requests_request} type *)

val make_get_rule_group_response :
  ?lock_token:string -> ?rule_group:rule_group -> unit
-> get_rule_group_response
(** Create a {!type-get_rule_group_response} type *)

val make_get_rule_group_request :
  ?ar_n:string -> ?id:string -> ?scope:scope -> ?name:string -> unit
-> get_rule_group_request
(** Create a {!type-get_rule_group_request} type *)

val make_get_regex_pattern_set_response :
  ?lock_token:string -> ?regex_pattern_set:regex_pattern_set -> unit
-> get_regex_pattern_set_response
(** Create a {!type-get_regex_pattern_set_response} type *)

val make_get_regex_pattern_set_request :
  id:string -> scope:scope -> name:string -> unit
-> get_regex_pattern_set_request
(** Create a {!type-get_regex_pattern_set_request} type *)

val make_get_rate_based_statement_managed_keys_response :
  ?managed_keys_ip_v6:rate_based_statement_managed_keys_ip_set ->
  ?managed_keys_ip_v4:rate_based_statement_managed_keys_ip_set ->
  unit
-> get_rate_based_statement_managed_keys_response
(** Create a {!type-get_rate_based_statement_managed_keys_response} type *)

val make_get_rate_based_statement_managed_keys_request :
  ?rule_group_rule_name:string ->
  rule_name:string ->
  web_acl_id:string ->
  web_acl_name:string ->
  scope:scope ->
  unit
-> get_rate_based_statement_managed_keys_request
(** Create a {!type-get_rate_based_statement_managed_keys_request} type *)

val make_get_permission_policy_response : ?policy:string -> unit
-> get_permission_policy_response
(** Create a {!type-get_permission_policy_response} type *)

val make_get_permission_policy_request : resource_arn:string -> unit
-> get_permission_policy_request
(** Create a {!type-get_permission_policy_request} type *)

val make_get_mobile_sdk_release_response :
  ?mobile_sdk_release:mobile_sdk_release -> unit
-> get_mobile_sdk_release_response
(** Create a {!type-get_mobile_sdk_release_response} type *)

val make_get_mobile_sdk_release_request :
  release_version:string -> platform:platform -> unit
-> get_mobile_sdk_release_request
(** Create a {!type-get_mobile_sdk_release_request} type *)

val make_get_managed_rule_set_response :
  ?lock_token:string -> ?managed_rule_set:managed_rule_set -> unit
-> get_managed_rule_set_response
(** Create a {!type-get_managed_rule_set_response} type *)

val make_get_managed_rule_set_request :
  id:string -> scope:scope -> name:string -> unit
-> get_managed_rule_set_request
(** Create a {!type-get_managed_rule_set_request} type *)

val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit
-> get_logging_configuration_response
(** Create a {!type-get_logging_configuration_response} type *)

val make_get_logging_configuration_request :
  ?log_scope:log_scope -> ?log_type:log_type -> resource_arn:string -> unit
-> get_logging_configuration_request
(** Create a {!type-get_logging_configuration_request} type *)

val make_get_ip_set_response : ?lock_token:string -> ?ip_set:ip_set -> unit
-> get_ip_set_response
(** Create a {!type-get_ip_set_response} type *)

val make_get_ip_set_request : id:string -> scope:scope -> name:string -> unit
-> get_ip_set_request
(** Create a {!type-get_ip_set_request} type *)

val make_get_decrypted_api_key_response :
  ?creation_timestamp:float -> ?token_domains:string list -> unit
-> get_decrypted_api_key_response
(** Create a {!type-get_decrypted_api_key_response} type *)

val make_get_decrypted_api_key_request :
  api_key:string -> scope:scope -> unit
-> get_decrypted_api_key_request
(** Create a {!type-get_decrypted_api_key_request} type *)

val make_generate_mobile_sdk_release_url_response : ?url:string -> unit
-> generate_mobile_sdk_release_url_response
(** Create a {!type-generate_mobile_sdk_release_url_response} type *)

val make_generate_mobile_sdk_release_url_request :
  release_version:string -> platform:platform -> unit
-> generate_mobile_sdk_release_url_request
(** Create a {!type-generate_mobile_sdk_release_url_request} type *)

val make_disassociate_web_acl_response : unit
-> disassociate_web_acl_response
(** Create a {!type-disassociate_web_acl_response} type *)

val make_disassociate_web_acl_request : resource_arn:string -> unit
-> disassociate_web_acl_request
(** Create a {!type-disassociate_web_acl_request} type *)

val make_describe_managed_rule_group_response :
  ?consumed_labels:label_summary list ->
  ?available_labels:label_summary list ->
  ?label_namespace:string ->
  ?rules:rule_summary list ->
  ?capacity:int ->
  ?sns_topic_arn:string ->
  ?version_name:string ->
  unit
-> describe_managed_rule_group_response
(** Create a {!type-describe_managed_rule_group_response} type *)

val make_describe_managed_rule_group_request :
  ?version_name:string ->
  scope:scope ->
  name:string ->
  vendor_name:string ->
  unit
-> describe_managed_rule_group_request
(** Create a {!type-describe_managed_rule_group_request} type *)

val make_describe_managed_products_by_vendor_response :
  ?managed_products:managed_product_descriptor list -> unit
-> describe_managed_products_by_vendor_response
(** Create a {!type-describe_managed_products_by_vendor_response} type *)

val make_describe_managed_products_by_vendor_request :
  scope:scope -> vendor_name:string -> unit
-> describe_managed_products_by_vendor_request
(** Create a {!type-describe_managed_products_by_vendor_request} type *)

val make_describe_all_managed_products_response :
  ?managed_products:managed_product_descriptor list -> unit
-> describe_all_managed_products_response
(** Create a {!type-describe_all_managed_products_response} type *)

val make_describe_all_managed_products_request : scope:scope -> unit
-> describe_all_managed_products_request
(** Create a {!type-describe_all_managed_products_request} type *)

val make_delete_web_acl_response : unit
-> delete_web_acl_response
(** Create a {!type-delete_web_acl_response} type *)

val make_delete_web_acl_request :
  lock_token:string -> id:string -> scope:scope -> name:string -> unit
-> delete_web_acl_request
(** Create a {!type-delete_web_acl_request} type *)

val make_delete_rule_group_response : unit
-> delete_rule_group_response
(** Create a {!type-delete_rule_group_response} type *)

val make_delete_rule_group_request :
  lock_token:string -> id:string -> scope:scope -> name:string -> unit
-> delete_rule_group_request
(** Create a {!type-delete_rule_group_request} type *)

val make_delete_regex_pattern_set_response : unit
-> delete_regex_pattern_set_response
(** Create a {!type-delete_regex_pattern_set_response} type *)

val make_delete_regex_pattern_set_request :
  lock_token:string -> id:string -> scope:scope -> name:string -> unit
-> delete_regex_pattern_set_request
(** Create a {!type-delete_regex_pattern_set_request} type *)

val make_delete_permission_policy_response : unit
-> delete_permission_policy_response
(** Create a {!type-delete_permission_policy_response} type *)

val make_delete_permission_policy_request : resource_arn:string -> unit
-> delete_permission_policy_request
(** Create a {!type-delete_permission_policy_request} type *)

val make_delete_logging_configuration_response : unit
-> delete_logging_configuration_response
(** Create a {!type-delete_logging_configuration_response} type *)

val make_delete_logging_configuration_request :
  ?log_scope:log_scope -> ?log_type:log_type -> resource_arn:string -> unit
-> delete_logging_configuration_request
(** Create a {!type-delete_logging_configuration_request} type *)

val make_delete_ip_set_response : unit
-> delete_ip_set_response
(** Create a {!type-delete_ip_set_response} type *)

val make_delete_ip_set_request :
  lock_token:string -> id:string -> scope:scope -> name:string -> unit
-> delete_ip_set_request
(** Create a {!type-delete_ip_set_request} type *)

val make_delete_firewall_manager_rule_groups_response :
  ?next_web_acl_lock_token:string -> unit
-> delete_firewall_manager_rule_groups_response
(** Create a {!type-delete_firewall_manager_rule_groups_response} type *)

val make_delete_firewall_manager_rule_groups_request :
  web_acl_lock_token:string -> web_acl_arn:string -> unit
-> delete_firewall_manager_rule_groups_request
(** Create a {!type-delete_firewall_manager_rule_groups_request} type *)

val make_delete_api_key_response : unit
-> delete_api_key_response
(** Create a {!type-delete_api_key_response} type *)

val make_delete_api_key_request : api_key:string -> scope:scope -> unit
-> delete_api_key_request
(** Create a {!type-delete_api_key_request} type *)

val make_create_web_acl_response : ?summary:web_acl_summary -> unit
-> create_web_acl_response
(** Create a {!type-create_web_acl_response} type *)

val make_create_web_acl_request :
  ?association_config:association_config ->
  ?token_domains:string list ->
  ?challenge_config:challenge_config ->
  ?captcha_config:captcha_config ->
  ?custom_response_bodies:(string * custom_response_body) list ->
  ?tags:tag list ->
  ?rules:rule list ->
  ?description:string ->
  visibility_config:visibility_config ->
  default_action:default_action ->
  scope:scope ->
  name:string ->
  unit
-> create_web_acl_request
(** Create a {!type-create_web_acl_request} type *)

val make_create_rule_group_response : ?summary:rule_group_summary -> unit
-> create_rule_group_response
(** Create a {!type-create_rule_group_response} type *)

val make_create_rule_group_request :
  ?custom_response_bodies:(string * custom_response_body) list ->
  ?tags:tag list ->
  ?rules:rule list ->
  ?description:string ->
  visibility_config:visibility_config ->
  capacity:int ->
  scope:scope ->
  name:string ->
  unit
-> create_rule_group_request
(** Create a {!type-create_rule_group_request} type *)

val make_create_regex_pattern_set_response :
  ?summary:regex_pattern_set_summary -> unit
-> create_regex_pattern_set_response
(** Create a {!type-create_regex_pattern_set_response} type *)

val make_create_regex_pattern_set_request :
  ?tags:tag list ->
  ?description:string ->
  regular_expression_list:regex list ->
  scope:scope ->
  name:string ->
  unit
-> create_regex_pattern_set_request
(** Create a {!type-create_regex_pattern_set_request} type *)

val make_create_ip_set_response : ?summary:ip_set_summary -> unit
-> create_ip_set_response
(** Create a {!type-create_ip_set_response} type *)

val make_create_ip_set_request :
  ?tags:tag list ->
  ?description:string ->
  addresses:string list ->
  ip_address_version:ip_address_version ->
  scope:scope ->
  name:string ->
  unit
-> create_ip_set_request
(** Create a {!type-create_ip_set_request} type *)

val make_create_api_key_response : ?api_key:string -> unit
-> create_api_key_response
(** Create a {!type-create_api_key_response} type *)

val make_create_api_key_request :
  token_domains:string list -> scope:scope -> unit
-> create_api_key_request
(** Create a {!type-create_api_key_request} type *)

val make_check_capacity_response : ?capacity:int -> unit
-> check_capacity_response
(** Create a {!type-check_capacity_response} type *)

val make_check_capacity_request : rules:rule list -> scope:scope -> unit
-> check_capacity_request
(** Create a {!type-check_capacity_request} type *)

val make_associate_web_acl_response : unit
-> associate_web_acl_response
(** Create a {!type-associate_web_acl_response} type *)

val make_associate_web_acl_request :
  resource_arn:string -> web_acl_arn:string -> unit
-> associate_web_acl_request
(** Create a {!type-associate_web_acl_request} type *)

