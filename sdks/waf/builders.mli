open Types
val make_field_to_match : ?data:string -> type_:match_field_type -> unit
-> field_to_match
(** Create a {!type-field_to_match} type *)

val make_xss_match_tuple :
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit
-> xss_match_tuple
(** Create a {!type-xss_match_tuple} type *)

val make_xss_match_set_update :
  xss_match_tuple:xss_match_tuple -> action:change_action -> unit
-> xss_match_set_update
(** Create a {!type-xss_match_set_update} type *)

val make_xss_match_set_summary :
  name:string -> xss_match_set_id:string -> unit
-> xss_match_set_summary
(** Create a {!type-xss_match_set_summary} type *)

val make_xss_match_set :
  ?name:string ->
  xss_match_tuples:xss_match_tuple list ->
  xss_match_set_id:string ->
  unit
-> xss_match_set
(** Create a {!type-xss_match_set} type *)

val make_waf_action : type_:waf_action_type -> unit
-> waf_action
(** Create a {!type-waf_action} type *)

val make_waf_override_action : type_:waf_override_action_type -> unit
-> waf_override_action
(** Create a {!type-waf_override_action} type *)

val make_excluded_rule : rule_id:string -> unit
-> excluded_rule
(** Create a {!type-excluded_rule} type *)

val make_activated_rule :
  ?excluded_rules:excluded_rule list ->
  ?type_:waf_rule_type ->
  ?override_action:waf_override_action ->
  ?action:waf_action ->
  rule_id:string ->
  priority:int ->
  unit
-> activated_rule
(** Create a {!type-activated_rule} type *)

val make_web_acl_update :
  activated_rule:activated_rule -> action:change_action -> unit
-> web_acl_update
(** Create a {!type-web_acl_update} type *)

val make_web_acl_summary : name:string -> web_acl_id:string -> unit
-> web_acl_summary
(** Create a {!type-web_acl_summary} type *)

val make_web_ac_l :
  ?web_acl_arn:string ->
  ?metric_name:string ->
  ?name:string ->
  rules:activated_rule list ->
  default_action:waf_action ->
  web_acl_id:string ->
  unit
-> web_ac_l
(** Create a {!type-web_ac_l} type *)

val make_update_xss_match_set_response : ?change_token:string -> unit
-> update_xss_match_set_response
(** Create a {!type-update_xss_match_set_response} type *)

val make_update_xss_match_set_request :
  updates:xss_match_set_update list ->
  change_token:string ->
  xss_match_set_id:string ->
  unit
-> update_xss_match_set_request
(** Create a {!type-update_xss_match_set_request} type *)

val make_update_web_acl_response : ?change_token:string -> unit
-> update_web_acl_response
(** Create a {!type-update_web_acl_response} type *)

val make_update_web_acl_request :
  ?default_action:waf_action ->
  ?updates:web_acl_update list ->
  change_token:string ->
  web_acl_id:string ->
  unit
-> update_web_acl_request
(** Create a {!type-update_web_acl_request} type *)

val make_update_sql_injection_match_set_response :
  ?change_token:string -> unit
-> update_sql_injection_match_set_response
(** Create a {!type-update_sql_injection_match_set_response} type *)

val make_sql_injection_match_tuple :
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit
-> sql_injection_match_tuple
(** Create a {!type-sql_injection_match_tuple} type *)

val make_sql_injection_match_set_update :
  sql_injection_match_tuple:sql_injection_match_tuple ->
  action:change_action ->
  unit
-> sql_injection_match_set_update
(** Create a {!type-sql_injection_match_set_update} type *)

val make_update_sql_injection_match_set_request :
  updates:sql_injection_match_set_update list ->
  change_token:string ->
  sql_injection_match_set_id:string ->
  unit
-> update_sql_injection_match_set_request
(** Create a {!type-update_sql_injection_match_set_request} type *)

val make_update_size_constraint_set_response : ?change_token:string -> unit
-> update_size_constraint_set_response
(** Create a {!type-update_size_constraint_set_response} type *)

val make_size_constraint :
  size:int ->
  comparison_operator:comparison_operator ->
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit
-> size_constraint
(** Create a {!type-size_constraint} type *)

val make_size_constraint_set_update :
  size_constraint:size_constraint -> action:change_action -> unit
-> size_constraint_set_update
(** Create a {!type-size_constraint_set_update} type *)

val make_update_size_constraint_set_request :
  updates:size_constraint_set_update list ->
  change_token:string ->
  size_constraint_set_id:string ->
  unit
-> update_size_constraint_set_request
(** Create a {!type-update_size_constraint_set_request} type *)

val make_update_rule_response : ?change_token:string -> unit
-> update_rule_response
(** Create a {!type-update_rule_response} type *)

val make_predicate :
  data_id:string -> type_:predicate_type -> negated:bool -> unit
-> predicate
(** Create a {!type-predicate} type *)

val make_rule_update : predicate:predicate -> action:change_action -> unit
-> rule_update
(** Create a {!type-rule_update} type *)

val make_update_rule_request :
  updates:rule_update list -> change_token:string -> rule_id:string -> unit
-> update_rule_request
(** Create a {!type-update_rule_request} type *)

val make_update_rule_group_response : ?change_token:string -> unit
-> update_rule_group_response
(** Create a {!type-update_rule_group_response} type *)

val make_rule_group_update :
  activated_rule:activated_rule -> action:change_action -> unit
-> rule_group_update
(** Create a {!type-rule_group_update} type *)

val make_update_rule_group_request :
  change_token:string ->
  updates:rule_group_update list ->
  rule_group_id:string ->
  unit
-> update_rule_group_request
(** Create a {!type-update_rule_group_request} type *)

val make_update_regex_pattern_set_response : ?change_token:string -> unit
-> update_regex_pattern_set_response
(** Create a {!type-update_regex_pattern_set_response} type *)

val make_regex_pattern_set_update :
  regex_pattern_string:string -> action:change_action -> unit
-> regex_pattern_set_update
(** Create a {!type-regex_pattern_set_update} type *)

val make_update_regex_pattern_set_request :
  change_token:string ->
  updates:regex_pattern_set_update list ->
  regex_pattern_set_id:string ->
  unit
-> update_regex_pattern_set_request
(** Create a {!type-update_regex_pattern_set_request} type *)

val make_update_regex_match_set_response : ?change_token:string -> unit
-> update_regex_match_set_response
(** Create a {!type-update_regex_match_set_response} type *)

val make_regex_match_tuple :
  regex_pattern_set_id:string ->
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit
-> regex_match_tuple
(** Create a {!type-regex_match_tuple} type *)

val make_regex_match_set_update :
  regex_match_tuple:regex_match_tuple -> action:change_action -> unit
-> regex_match_set_update
(** Create a {!type-regex_match_set_update} type *)

val make_update_regex_match_set_request :
  change_token:string ->
  updates:regex_match_set_update list ->
  regex_match_set_id:string ->
  unit
-> update_regex_match_set_request
(** Create a {!type-update_regex_match_set_request} type *)

val make_update_rate_based_rule_response : ?change_token:string -> unit
-> update_rate_based_rule_response
(** Create a {!type-update_rate_based_rule_response} type *)

val make_update_rate_based_rule_request :
  rate_limit:int ->
  updates:rule_update list ->
  change_token:string ->
  rule_id:string ->
  unit
-> update_rate_based_rule_request
(** Create a {!type-update_rate_based_rule_request} type *)

val make_update_ip_set_response : ?change_token:string -> unit
-> update_ip_set_response
(** Create a {!type-update_ip_set_response} type *)

val make_ip_set_descriptor :
  value:string -> type_:ip_set_descriptor_type -> unit
-> ip_set_descriptor
(** Create a {!type-ip_set_descriptor} type *)

val make_ip_set_update :
  ip_set_descriptor:ip_set_descriptor -> action:change_action -> unit
-> ip_set_update
(** Create a {!type-ip_set_update} type *)

val make_update_ip_set_request :
  updates:ip_set_update list ->
  change_token:string ->
  ip_set_id:string ->
  unit
-> update_ip_set_request
(** Create a {!type-update_ip_set_request} type *)

val make_update_geo_match_set_response : ?change_token:string -> unit
-> update_geo_match_set_response
(** Create a {!type-update_geo_match_set_response} type *)

val make_geo_match_constraint :
  value:geo_match_constraint_value -> type_:geo_match_constraint_type -> unit
-> geo_match_constraint
(** Create a {!type-geo_match_constraint} type *)

val make_geo_match_set_update :
  geo_match_constraint:geo_match_constraint -> action:change_action -> unit
-> geo_match_set_update
(** Create a {!type-geo_match_set_update} type *)

val make_update_geo_match_set_request :
  updates:geo_match_set_update list ->
  change_token:string ->
  geo_match_set_id:string ->
  unit
-> update_geo_match_set_request
(** Create a {!type-update_geo_match_set_request} type *)

val make_update_byte_match_set_response : ?change_token:string -> unit
-> update_byte_match_set_response
(** Create a {!type-update_byte_match_set_response} type *)

val make_byte_match_tuple :
  positional_constraint:positional_constraint ->
  text_transformation:text_transformation ->
  target_string:bytes ->
  field_to_match:field_to_match ->
  unit
-> byte_match_tuple
(** Create a {!type-byte_match_tuple} type *)

val make_byte_match_set_update :
  byte_match_tuple:byte_match_tuple -> action:change_action -> unit
-> byte_match_set_update
(** Create a {!type-byte_match_set_update} type *)

val make_update_byte_match_set_request :
  updates:byte_match_set_update list ->
  change_token:string ->
  byte_match_set_id:string ->
  unit
-> update_byte_match_set_request
(** Create a {!type-update_byte_match_set_request} type *)

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

val make_subscribed_rule_group_summary :
  metric_name:string -> name:string -> rule_group_id:string -> unit
-> subscribed_rule_group_summary
(** Create a {!type-subscribed_rule_group_summary} type *)

val make_sql_injection_match_set_summary :
  name:string -> sql_injection_match_set_id:string -> unit
-> sql_injection_match_set_summary
(** Create a {!type-sql_injection_match_set_summary} type *)

val make_sql_injection_match_set :
  ?name:string ->
  sql_injection_match_tuples:sql_injection_match_tuple list ->
  sql_injection_match_set_id:string ->
  unit
-> sql_injection_match_set
(** Create a {!type-sql_injection_match_set} type *)

val make_size_constraint_set_summary :
  name:string -> size_constraint_set_id:string -> unit
-> size_constraint_set_summary
(** Create a {!type-size_constraint_set_summary} type *)

val make_size_constraint_set :
  ?name:string ->
  size_constraints:size_constraint list ->
  size_constraint_set_id:string ->
  unit
-> size_constraint_set
(** Create a {!type-size_constraint_set} type *)

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

val make_sampled_http_request :
  ?rule_within_rule_group:string ->
  ?action:string ->
  ?timestamp_:float ->
  weight:int ->
  request:http_request ->
  unit
-> sampled_http_request
(** Create a {!type-sampled_http_request} type *)

val make_rule_summary : name:string -> rule_id:string -> unit
-> rule_summary
(** Create a {!type-rule_summary} type *)

val make_rule_group_summary : name:string -> rule_group_id:string -> unit
-> rule_group_summary
(** Create a {!type-rule_group_summary} type *)

val make_rule_group :
  ?metric_name:string -> ?name:string -> rule_group_id:string -> unit
-> rule_group
(** Create a {!type-rule_group} type *)

val make_rule :
  ?metric_name:string ->
  ?name:string ->
  predicates:predicate list ->
  rule_id:string ->
  unit
-> rule
(** Create a {!type-rule} type *)

val make_regex_pattern_set_summary :
  name:string -> regex_pattern_set_id:string -> unit
-> regex_pattern_set_summary
(** Create a {!type-regex_pattern_set_summary} type *)

val make_regex_pattern_set :
  ?name:string ->
  regex_pattern_strings:string list ->
  regex_pattern_set_id:string ->
  unit
-> regex_pattern_set
(** Create a {!type-regex_pattern_set} type *)

val make_regex_match_set_summary :
  name:string -> regex_match_set_id:string -> unit
-> regex_match_set_summary
(** Create a {!type-regex_match_set_summary} type *)

val make_regex_match_set :
  ?regex_match_tuples:regex_match_tuple list ->
  ?name:string ->
  ?regex_match_set_id:string ->
  unit
-> regex_match_set
(** Create a {!type-regex_match_set} type *)

val make_rate_based_rule :
  ?metric_name:string ->
  ?name:string ->
  rate_limit:int ->
  rate_key:rate_key ->
  match_predicates:predicate list ->
  rule_id:string ->
  unit
-> rate_based_rule
(** Create a {!type-rate_based_rule} type *)

val make_put_permission_policy_response : unit
-> put_permission_policy_response
(** Create a {!type-put_permission_policy_response} type *)

val make_put_permission_policy_request :
  policy:string -> resource_arn:string -> unit
-> put_permission_policy_request
(** Create a {!type-put_permission_policy_request} type *)

val make_logging_configuration :
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

val make_list_xss_match_sets_response :
  ?xss_match_sets:xss_match_set_summary list -> ?next_marker:string -> unit
-> list_xss_match_sets_response
(** Create a {!type-list_xss_match_sets_response} type *)

val make_list_xss_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_xss_match_sets_request
(** Create a {!type-list_xss_match_sets_request} type *)

val make_list_web_ac_ls_response :
  ?web_ac_ls:web_acl_summary list -> ?next_marker:string -> unit
-> list_web_ac_ls_response
(** Create a {!type-list_web_ac_ls_response} type *)

val make_list_web_ac_ls_request : ?limit:int -> ?next_marker:string -> unit
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

val make_list_subscribed_rule_groups_response :
  ?rule_groups:subscribed_rule_group_summary list ->
  ?next_marker:string ->
  unit
-> list_subscribed_rule_groups_response
(** Create a {!type-list_subscribed_rule_groups_response} type *)

val make_list_subscribed_rule_groups_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_subscribed_rule_groups_request
(** Create a {!type-list_subscribed_rule_groups_request} type *)

val make_list_sql_injection_match_sets_response :
  ?sql_injection_match_sets:sql_injection_match_set_summary list ->
  ?next_marker:string ->
  unit
-> list_sql_injection_match_sets_response
(** Create a {!type-list_sql_injection_match_sets_response} type *)

val make_list_sql_injection_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_sql_injection_match_sets_request
(** Create a {!type-list_sql_injection_match_sets_request} type *)

val make_list_size_constraint_sets_response :
  ?size_constraint_sets:size_constraint_set_summary list ->
  ?next_marker:string ->
  unit
-> list_size_constraint_sets_response
(** Create a {!type-list_size_constraint_sets_response} type *)

val make_list_size_constraint_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_size_constraint_sets_request
(** Create a {!type-list_size_constraint_sets_request} type *)

val make_list_rules_response :
  ?rules:rule_summary list -> ?next_marker:string -> unit
-> list_rules_response
(** Create a {!type-list_rules_response} type *)

val make_list_rules_request : ?limit:int -> ?next_marker:string -> unit
-> list_rules_request
(** Create a {!type-list_rules_request} type *)

val make_list_rule_groups_response :
  ?rule_groups:rule_group_summary list -> ?next_marker:string -> unit
-> list_rule_groups_response
(** Create a {!type-list_rule_groups_response} type *)

val make_list_rule_groups_request : ?limit:int -> ?next_marker:string -> unit
-> list_rule_groups_request
(** Create a {!type-list_rule_groups_request} type *)

val make_list_regex_pattern_sets_response :
  ?regex_pattern_sets:regex_pattern_set_summary list ->
  ?next_marker:string ->
  unit
-> list_regex_pattern_sets_response
(** Create a {!type-list_regex_pattern_sets_response} type *)

val make_list_regex_pattern_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_regex_pattern_sets_request
(** Create a {!type-list_regex_pattern_sets_request} type *)

val make_list_regex_match_sets_response :
  ?regex_match_sets:regex_match_set_summary list ->
  ?next_marker:string ->
  unit
-> list_regex_match_sets_response
(** Create a {!type-list_regex_match_sets_response} type *)

val make_list_regex_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_regex_match_sets_request
(** Create a {!type-list_regex_match_sets_request} type *)

val make_list_rate_based_rules_response :
  ?rules:rule_summary list -> ?next_marker:string -> unit
-> list_rate_based_rules_response
(** Create a {!type-list_rate_based_rules_response} type *)

val make_list_rate_based_rules_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_rate_based_rules_request
(** Create a {!type-list_rate_based_rules_request} type *)

val make_list_logging_configurations_response :
  ?next_marker:string ->
  ?logging_configurations:logging_configuration list ->
  unit
-> list_logging_configurations_response
(** Create a {!type-list_logging_configurations_response} type *)

val make_list_logging_configurations_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_logging_configurations_request
(** Create a {!type-list_logging_configurations_request} type *)

val make_ip_set_summary : name:string -> ip_set_id:string -> unit
-> ip_set_summary
(** Create a {!type-ip_set_summary} type *)

val make_list_ip_sets_response :
  ?ip_sets:ip_set_summary list -> ?next_marker:string -> unit
-> list_ip_sets_response
(** Create a {!type-list_ip_sets_response} type *)

val make_list_ip_sets_request : ?limit:int -> ?next_marker:string -> unit
-> list_ip_sets_request
(** Create a {!type-list_ip_sets_request} type *)

val make_geo_match_set_summary :
  name:string -> geo_match_set_id:string -> unit
-> geo_match_set_summary
(** Create a {!type-geo_match_set_summary} type *)

val make_list_geo_match_sets_response :
  ?geo_match_sets:geo_match_set_summary list -> ?next_marker:string -> unit
-> list_geo_match_sets_response
(** Create a {!type-list_geo_match_sets_response} type *)

val make_list_geo_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_geo_match_sets_request
(** Create a {!type-list_geo_match_sets_request} type *)

val make_byte_match_set_summary :
  name:string -> byte_match_set_id:string -> unit
-> byte_match_set_summary
(** Create a {!type-byte_match_set_summary} type *)

val make_list_byte_match_sets_response :
  ?byte_match_sets:byte_match_set_summary list -> ?next_marker:string -> unit
-> list_byte_match_sets_response
(** Create a {!type-list_byte_match_sets_response} type *)

val make_list_byte_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_byte_match_sets_request
(** Create a {!type-list_byte_match_sets_request} type *)

val make_list_activated_rules_in_rule_group_response :
  ?activated_rules:activated_rule list -> ?next_marker:string -> unit
-> list_activated_rules_in_rule_group_response
(** Create a {!type-list_activated_rules_in_rule_group_response} type *)

val make_list_activated_rules_in_rule_group_request :
  ?limit:int -> ?next_marker:string -> ?rule_group_id:string -> unit
-> list_activated_rules_in_rule_group_request
(** Create a {!type-list_activated_rules_in_rule_group_request} type *)

val make_ip_set :
  ?name:string ->
  ip_set_descriptors:ip_set_descriptor list ->
  ip_set_id:string ->
  unit
-> ip_set
(** Create a {!type-ip_set} type *)

val make_get_xss_match_set_response : ?xss_match_set:xss_match_set -> unit
-> get_xss_match_set_response
(** Create a {!type-get_xss_match_set_response} type *)

val make_get_xss_match_set_request : xss_match_set_id:string -> unit
-> get_xss_match_set_request
(** Create a {!type-get_xss_match_set_request} type *)

val make_get_web_acl_response : ?web_ac_l:web_ac_l -> unit
-> get_web_acl_response
(** Create a {!type-get_web_acl_response} type *)

val make_get_web_acl_request : web_acl_id:string -> unit
-> get_web_acl_request
(** Create a {!type-get_web_acl_request} type *)

val make_get_sql_injection_match_set_response :
  ?sql_injection_match_set:sql_injection_match_set -> unit
-> get_sql_injection_match_set_response
(** Create a {!type-get_sql_injection_match_set_response} type *)

val make_get_sql_injection_match_set_request :
  sql_injection_match_set_id:string -> unit
-> get_sql_injection_match_set_request
(** Create a {!type-get_sql_injection_match_set_request} type *)

val make_get_size_constraint_set_response :
  ?size_constraint_set:size_constraint_set -> unit
-> get_size_constraint_set_response
(** Create a {!type-get_size_constraint_set_response} type *)

val make_get_size_constraint_set_request :
  size_constraint_set_id:string -> unit
-> get_size_constraint_set_request
(** Create a {!type-get_size_constraint_set_request} type *)

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
  rule_id:string ->
  web_acl_id:string ->
  unit
-> get_sampled_requests_request
(** Create a {!type-get_sampled_requests_request} type *)

val make_get_rule_response : ?rule:rule -> unit
-> get_rule_response
(** Create a {!type-get_rule_response} type *)

val make_get_rule_request : rule_id:string -> unit
-> get_rule_request
(** Create a {!type-get_rule_request} type *)

val make_get_rule_group_response : ?rule_group:rule_group -> unit
-> get_rule_group_response
(** Create a {!type-get_rule_group_response} type *)

val make_get_rule_group_request : rule_group_id:string -> unit
-> get_rule_group_request
(** Create a {!type-get_rule_group_request} type *)

val make_get_regex_pattern_set_response :
  ?regex_pattern_set:regex_pattern_set -> unit
-> get_regex_pattern_set_response
(** Create a {!type-get_regex_pattern_set_response} type *)

val make_get_regex_pattern_set_request : regex_pattern_set_id:string -> unit
-> get_regex_pattern_set_request
(** Create a {!type-get_regex_pattern_set_request} type *)

val make_get_regex_match_set_response :
  ?regex_match_set:regex_match_set -> unit
-> get_regex_match_set_response
(** Create a {!type-get_regex_match_set_response} type *)

val make_get_regex_match_set_request : regex_match_set_id:string -> unit
-> get_regex_match_set_request
(** Create a {!type-get_regex_match_set_request} type *)

val make_get_rate_based_rule_response : ?rule:rate_based_rule -> unit
-> get_rate_based_rule_response
(** Create a {!type-get_rate_based_rule_response} type *)

val make_get_rate_based_rule_request : rule_id:string -> unit
-> get_rate_based_rule_request
(** Create a {!type-get_rate_based_rule_request} type *)

val make_get_rate_based_rule_managed_keys_response :
  ?next_marker:string -> ?managed_keys:string list -> unit
-> get_rate_based_rule_managed_keys_response
(** Create a {!type-get_rate_based_rule_managed_keys_response} type *)

val make_get_rate_based_rule_managed_keys_request :
  ?next_marker:string -> rule_id:string -> unit
-> get_rate_based_rule_managed_keys_request
(** Create a {!type-get_rate_based_rule_managed_keys_request} type *)

val make_get_permission_policy_response : ?policy:string -> unit
-> get_permission_policy_response
(** Create a {!type-get_permission_policy_response} type *)

val make_get_permission_policy_request : resource_arn:string -> unit
-> get_permission_policy_request
(** Create a {!type-get_permission_policy_request} type *)

val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit
-> get_logging_configuration_response
(** Create a {!type-get_logging_configuration_response} type *)

val make_get_logging_configuration_request : resource_arn:string -> unit
-> get_logging_configuration_request
(** Create a {!type-get_logging_configuration_request} type *)

val make_get_ip_set_response : ?ip_set:ip_set -> unit
-> get_ip_set_response
(** Create a {!type-get_ip_set_response} type *)

val make_get_ip_set_request : ip_set_id:string -> unit
-> get_ip_set_request
(** Create a {!type-get_ip_set_request} type *)

val make_geo_match_set :
  ?name:string ->
  geo_match_constraints:geo_match_constraint list ->
  geo_match_set_id:string ->
  unit
-> geo_match_set
(** Create a {!type-geo_match_set} type *)

val make_get_geo_match_set_response : ?geo_match_set:geo_match_set -> unit
-> get_geo_match_set_response
(** Create a {!type-get_geo_match_set_response} type *)

val make_get_geo_match_set_request : geo_match_set_id:string -> unit
-> get_geo_match_set_request
(** Create a {!type-get_geo_match_set_request} type *)

val make_get_change_token_status_response :
  ?change_token_status:change_token_status -> unit
-> get_change_token_status_response
(** Create a {!type-get_change_token_status_response} type *)

val make_get_change_token_status_request : change_token:string -> unit
-> get_change_token_status_request
(** Create a {!type-get_change_token_status_request} type *)

val make_get_change_token_response : ?change_token:string -> unit
-> get_change_token_response
(** Create a {!type-get_change_token_response} type *)

val make_get_change_token_request : unit
-> get_change_token_request
(** Create a {!type-get_change_token_request} type *)

val make_byte_match_set :
  ?name:string ->
  byte_match_tuples:byte_match_tuple list ->
  byte_match_set_id:string ->
  unit
-> byte_match_set
(** Create a {!type-byte_match_set} type *)

val make_get_byte_match_set_response : ?byte_match_set:byte_match_set -> unit
-> get_byte_match_set_response
(** Create a {!type-get_byte_match_set_response} type *)

val make_get_byte_match_set_request : byte_match_set_id:string -> unit
-> get_byte_match_set_request
(** Create a {!type-get_byte_match_set_request} type *)

val make_delete_xss_match_set_response : ?change_token:string -> unit
-> delete_xss_match_set_response
(** Create a {!type-delete_xss_match_set_response} type *)

val make_delete_xss_match_set_request :
  change_token:string -> xss_match_set_id:string -> unit
-> delete_xss_match_set_request
(** Create a {!type-delete_xss_match_set_request} type *)

val make_delete_web_acl_response : ?change_token:string -> unit
-> delete_web_acl_response
(** Create a {!type-delete_web_acl_response} type *)

val make_delete_web_acl_request :
  change_token:string -> web_acl_id:string -> unit
-> delete_web_acl_request
(** Create a {!type-delete_web_acl_request} type *)

val make_delete_sql_injection_match_set_response :
  ?change_token:string -> unit
-> delete_sql_injection_match_set_response
(** Create a {!type-delete_sql_injection_match_set_response} type *)

val make_delete_sql_injection_match_set_request :
  change_token:string -> sql_injection_match_set_id:string -> unit
-> delete_sql_injection_match_set_request
(** Create a {!type-delete_sql_injection_match_set_request} type *)

val make_delete_size_constraint_set_response : ?change_token:string -> unit
-> delete_size_constraint_set_response
(** Create a {!type-delete_size_constraint_set_response} type *)

val make_delete_size_constraint_set_request :
  change_token:string -> size_constraint_set_id:string -> unit
-> delete_size_constraint_set_request
(** Create a {!type-delete_size_constraint_set_request} type *)

val make_delete_rule_response : ?change_token:string -> unit
-> delete_rule_response
(** Create a {!type-delete_rule_response} type *)

val make_delete_rule_request : change_token:string -> rule_id:string -> unit
-> delete_rule_request
(** Create a {!type-delete_rule_request} type *)

val make_delete_rule_group_response : ?change_token:string -> unit
-> delete_rule_group_response
(** Create a {!type-delete_rule_group_response} type *)

val make_delete_rule_group_request :
  change_token:string -> rule_group_id:string -> unit
-> delete_rule_group_request
(** Create a {!type-delete_rule_group_request} type *)

val make_delete_regex_pattern_set_response : ?change_token:string -> unit
-> delete_regex_pattern_set_response
(** Create a {!type-delete_regex_pattern_set_response} type *)

val make_delete_regex_pattern_set_request :
  change_token:string -> regex_pattern_set_id:string -> unit
-> delete_regex_pattern_set_request
(** Create a {!type-delete_regex_pattern_set_request} type *)

val make_delete_regex_match_set_response : ?change_token:string -> unit
-> delete_regex_match_set_response
(** Create a {!type-delete_regex_match_set_response} type *)

val make_delete_regex_match_set_request :
  change_token:string -> regex_match_set_id:string -> unit
-> delete_regex_match_set_request
(** Create a {!type-delete_regex_match_set_request} type *)

val make_delete_rate_based_rule_response : ?change_token:string -> unit
-> delete_rate_based_rule_response
(** Create a {!type-delete_rate_based_rule_response} type *)

val make_delete_rate_based_rule_request :
  change_token:string -> rule_id:string -> unit
-> delete_rate_based_rule_request
(** Create a {!type-delete_rate_based_rule_request} type *)

val make_delete_permission_policy_response : unit
-> delete_permission_policy_response
(** Create a {!type-delete_permission_policy_response} type *)

val make_delete_permission_policy_request : resource_arn:string -> unit
-> delete_permission_policy_request
(** Create a {!type-delete_permission_policy_request} type *)

val make_delete_logging_configuration_response : unit
-> delete_logging_configuration_response
(** Create a {!type-delete_logging_configuration_response} type *)

val make_delete_logging_configuration_request : resource_arn:string -> unit
-> delete_logging_configuration_request
(** Create a {!type-delete_logging_configuration_request} type *)

val make_delete_ip_set_response : ?change_token:string -> unit
-> delete_ip_set_response
(** Create a {!type-delete_ip_set_response} type *)

val make_delete_ip_set_request :
  change_token:string -> ip_set_id:string -> unit
-> delete_ip_set_request
(** Create a {!type-delete_ip_set_request} type *)

val make_delete_geo_match_set_response : ?change_token:string -> unit
-> delete_geo_match_set_response
(** Create a {!type-delete_geo_match_set_response} type *)

val make_delete_geo_match_set_request :
  change_token:string -> geo_match_set_id:string -> unit
-> delete_geo_match_set_request
(** Create a {!type-delete_geo_match_set_request} type *)

val make_delete_byte_match_set_response : ?change_token:string -> unit
-> delete_byte_match_set_response
(** Create a {!type-delete_byte_match_set_response} type *)

val make_delete_byte_match_set_request :
  change_token:string -> byte_match_set_id:string -> unit
-> delete_byte_match_set_request
(** Create a {!type-delete_byte_match_set_request} type *)

val make_create_xss_match_set_response :
  ?change_token:string -> ?xss_match_set:xss_match_set -> unit
-> create_xss_match_set_response
(** Create a {!type-create_xss_match_set_response} type *)

val make_create_xss_match_set_request :
  change_token:string -> name:string -> unit
-> create_xss_match_set_request
(** Create a {!type-create_xss_match_set_request} type *)

val make_create_web_acl_response :
  ?change_token:string -> ?web_ac_l:web_ac_l -> unit
-> create_web_acl_response
(** Create a {!type-create_web_acl_response} type *)

val make_create_web_acl_request :
  ?tags:tag list ->
  change_token:string ->
  default_action:waf_action ->
  metric_name:string ->
  name:string ->
  unit
-> create_web_acl_request
(** Create a {!type-create_web_acl_request} type *)

val make_create_web_acl_migration_stack_response :
  s3_object_url:string -> unit
-> create_web_acl_migration_stack_response
(** Create a {!type-create_web_acl_migration_stack_response} type *)

val make_create_web_acl_migration_stack_request :
  ignore_unsupported_type:bool ->
  s3_bucket_name:string ->
  web_acl_id:string ->
  unit
-> create_web_acl_migration_stack_request
(** Create a {!type-create_web_acl_migration_stack_request} type *)

val make_create_sql_injection_match_set_response :
  ?change_token:string ->
  ?sql_injection_match_set:sql_injection_match_set ->
  unit
-> create_sql_injection_match_set_response
(** Create a {!type-create_sql_injection_match_set_response} type *)

val make_create_sql_injection_match_set_request :
  change_token:string -> name:string -> unit
-> create_sql_injection_match_set_request
(** Create a {!type-create_sql_injection_match_set_request} type *)

val make_create_size_constraint_set_response :
  ?change_token:string -> ?size_constraint_set:size_constraint_set -> unit
-> create_size_constraint_set_response
(** Create a {!type-create_size_constraint_set_response} type *)

val make_create_size_constraint_set_request :
  change_token:string -> name:string -> unit
-> create_size_constraint_set_request
(** Create a {!type-create_size_constraint_set_request} type *)

val make_create_rule_response : ?change_token:string -> ?rule:rule -> unit
-> create_rule_response
(** Create a {!type-create_rule_response} type *)

val make_create_rule_request :
  ?tags:tag list ->
  change_token:string ->
  metric_name:string ->
  name:string ->
  unit
-> create_rule_request
(** Create a {!type-create_rule_request} type *)

val make_create_rule_group_response :
  ?change_token:string -> ?rule_group:rule_group -> unit
-> create_rule_group_response
(** Create a {!type-create_rule_group_response} type *)

val make_create_rule_group_request :
  ?tags:tag list ->
  change_token:string ->
  metric_name:string ->
  name:string ->
  unit
-> create_rule_group_request
(** Create a {!type-create_rule_group_request} type *)

val make_create_regex_pattern_set_response :
  ?change_token:string -> ?regex_pattern_set:regex_pattern_set -> unit
-> create_regex_pattern_set_response
(** Create a {!type-create_regex_pattern_set_response} type *)

val make_create_regex_pattern_set_request :
  change_token:string -> name:string -> unit
-> create_regex_pattern_set_request
(** Create a {!type-create_regex_pattern_set_request} type *)

val make_create_regex_match_set_response :
  ?change_token:string -> ?regex_match_set:regex_match_set -> unit
-> create_regex_match_set_response
(** Create a {!type-create_regex_match_set_response} type *)

val make_create_regex_match_set_request :
  change_token:string -> name:string -> unit
-> create_regex_match_set_request
(** Create a {!type-create_regex_match_set_request} type *)

val make_create_rate_based_rule_response :
  ?change_token:string -> ?rule:rate_based_rule -> unit
-> create_rate_based_rule_response
(** Create a {!type-create_rate_based_rule_response} type *)

val make_create_rate_based_rule_request :
  ?tags:tag list ->
  change_token:string ->
  rate_limit:int ->
  rate_key:rate_key ->
  metric_name:string ->
  name:string ->
  unit
-> create_rate_based_rule_request
(** Create a {!type-create_rate_based_rule_request} type *)

val make_create_ip_set_response :
  ?change_token:string -> ?ip_set:ip_set -> unit
-> create_ip_set_response
(** Create a {!type-create_ip_set_response} type *)

val make_create_ip_set_request : change_token:string -> name:string -> unit
-> create_ip_set_request
(** Create a {!type-create_ip_set_request} type *)

val make_create_geo_match_set_response :
  ?change_token:string -> ?geo_match_set:geo_match_set -> unit
-> create_geo_match_set_response
(** Create a {!type-create_geo_match_set_response} type *)

val make_create_geo_match_set_request :
  change_token:string -> name:string -> unit
-> create_geo_match_set_request
(** Create a {!type-create_geo_match_set_request} type *)

val make_create_byte_match_set_response :
  ?change_token:string -> ?byte_match_set:byte_match_set -> unit
-> create_byte_match_set_response
(** Create a {!type-create_byte_match_set_response} type *)

val make_create_byte_match_set_request :
  change_token:string -> name:string -> unit
-> create_byte_match_set_request
(** Create a {!type-create_byte_match_set_request} type *)

