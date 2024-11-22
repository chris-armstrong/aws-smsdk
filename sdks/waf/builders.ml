[@@@warning "-39"]
open Types
let make_field_to_match 
  ?(data : string option) ~(type_ : match_field_type) () : field_to_match = {
  data; type_;  }

let make_xss_match_tuple 
  ~(text_transformation : text_transformation)
  ~(field_to_match : field_to_match)
  () : xss_match_tuple = { text_transformation; field_to_match; 
}

let make_xss_match_set_update 
  ~(xss_match_tuple : xss_match_tuple) ~(action : change_action) ()
: xss_match_set_update = { xss_match_tuple; action; 
}

let make_xss_match_set_summary 
  ~(name : string) ~(xss_match_set_id : string) () : xss_match_set_summary =
{ name; xss_match_set_id;  }

let make_xss_match_set 
  ?(name : string option)
  ~(xss_match_tuples : xss_match_tuple list)
  ~(xss_match_set_id : string)
  () : xss_match_set = { xss_match_tuples; name; xss_match_set_id; 
}

let make_waf_action  ~(type_ : waf_action_type) () : waf_action = { type_; 
}

let make_waf_override_action  ~(type_ : waf_override_action_type) ()
: waf_override_action = { type_;  }

let make_excluded_rule  ~(rule_id : string) () : excluded_rule = { rule_id; 
}

let make_activated_rule 
  ?(excluded_rules : excluded_rule list option)
  ?(type_ : waf_rule_type option)
  ?(override_action : waf_override_action option)
  ?(action : waf_action option)
  ~(rule_id : string)
  ~(priority : int)
  () : activated_rule = {
  excluded_rules; type_; override_action; action; rule_id; priority; 
}

let make_web_acl_update 
  ~(activated_rule : activated_rule) ~(action : change_action) ()
: web_acl_update = { activated_rule; action;  }

let make_web_acl_summary  ~(name : string) ~(web_acl_id : string) ()
: web_acl_summary = { name; web_acl_id;  }

let make_web_ac_l 
  ?(web_acl_arn : string option)
  ?(metric_name : string option)
  ?(name : string option)
  ~(rules : activated_rule list)
  ~(default_action : waf_action)
  ~(web_acl_id : string)
  () : web_ac_l = {
  web_acl_arn; rules; default_action; metric_name; name; web_acl_id; 
}

let make_update_xss_match_set_response  ?(change_token : string option) ()
: update_xss_match_set_response = { change_token; 
}

let make_update_xss_match_set_request 
  ~(updates : xss_match_set_update list)
  ~(change_token : string)
  ~(xss_match_set_id : string)
  () : update_xss_match_set_request = {
  updates; change_token; xss_match_set_id; 
}

let make_update_web_acl_response  ?(change_token : string option) ()
: update_web_acl_response = { change_token; 
}

let make_update_web_acl_request 
  ?(default_action : waf_action option)
  ?(updates : web_acl_update list option)
  ~(change_token : string)
  ~(web_acl_id : string)
  () : update_web_acl_request = {
  default_action; updates; change_token; web_acl_id; 
}

let make_update_sql_injection_match_set_response 
  ?(change_token : string option) ()
: update_sql_injection_match_set_response = { change_token; 
}

let make_sql_injection_match_tuple 
  ~(text_transformation : text_transformation)
  ~(field_to_match : field_to_match)
  () : sql_injection_match_tuple = { text_transformation; field_to_match; 
}

let make_sql_injection_match_set_update 
  ~(sql_injection_match_tuple : sql_injection_match_tuple)
  ~(action : change_action)
  () : sql_injection_match_set_update = { sql_injection_match_tuple; action; 
}

let make_update_sql_injection_match_set_request 
  ~(updates : sql_injection_match_set_update list)
  ~(change_token : string)
  ~(sql_injection_match_set_id : string)
  () : update_sql_injection_match_set_request = {
  updates; change_token; sql_injection_match_set_id; 
}

let make_update_size_constraint_set_response 
  ?(change_token : string option) () : update_size_constraint_set_response =
{ change_token;  }

let make_size_constraint 
  ~(size : int)
  ~(comparison_operator : comparison_operator)
  ~(text_transformation : text_transformation)
  ~(field_to_match : field_to_match)
  () : size_constraint = {
  size; comparison_operator; text_transformation; field_to_match; 
}

let make_size_constraint_set_update 
  ~(size_constraint : size_constraint) ~(action : change_action) ()
: size_constraint_set_update = { size_constraint; action; 
}

let make_update_size_constraint_set_request 
  ~(updates : size_constraint_set_update list)
  ~(change_token : string)
  ~(size_constraint_set_id : string)
  () : update_size_constraint_set_request = {
  updates; change_token; size_constraint_set_id; 
}

let make_update_rule_response  ?(change_token : string option) ()
: update_rule_response = { change_token;  }

let make_predicate 
  ~(data_id : string) ~(type_ : predicate_type) ~(negated : bool) ()
: predicate = { data_id; type_; negated;  }

let make_rule_update  ~(predicate : predicate) ~(action : change_action) ()
: rule_update = { predicate; action;  }

let make_update_rule_request 
  ~(updates : rule_update list)
  ~(change_token : string)
  ~(rule_id : string)
  () : update_rule_request = { updates; change_token; rule_id; 
}

let make_update_rule_group_response  ?(change_token : string option) ()
: update_rule_group_response = { change_token;  }

let make_rule_group_update 
  ~(activated_rule : activated_rule) ~(action : change_action) ()
: rule_group_update = { activated_rule; action; 
}

let make_update_rule_group_request 
  ~(change_token : string)
  ~(updates : rule_group_update list)
  ~(rule_group_id : string)
  () : update_rule_group_request = { change_token; updates; rule_group_id; 
}

let make_update_regex_pattern_set_response 
  ?(change_token : string option) () : update_regex_pattern_set_response = {
  change_token;  }

let make_regex_pattern_set_update 
  ~(regex_pattern_string : string) ~(action : change_action) ()
: regex_pattern_set_update = { regex_pattern_string; action; 
}

let make_update_regex_pattern_set_request 
  ~(change_token : string)
  ~(updates : regex_pattern_set_update list)
  ~(regex_pattern_set_id : string)
  () : update_regex_pattern_set_request = {
  change_token; updates; regex_pattern_set_id; 
}

let make_update_regex_match_set_response  ?(change_token : string option) ()
: update_regex_match_set_response = { change_token; 
}

let make_regex_match_tuple 
  ~(regex_pattern_set_id : string)
  ~(text_transformation : text_transformation)
  ~(field_to_match : field_to_match)
  () : regex_match_tuple = {
  regex_pattern_set_id; text_transformation; field_to_match; 
}

let make_regex_match_set_update 
  ~(regex_match_tuple : regex_match_tuple) ~(action : change_action) ()
: regex_match_set_update = { regex_match_tuple; action; 
}

let make_update_regex_match_set_request 
  ~(change_token : string)
  ~(updates : regex_match_set_update list)
  ~(regex_match_set_id : string)
  () : update_regex_match_set_request = {
  change_token; updates; regex_match_set_id; 
}

let make_update_rate_based_rule_response  ?(change_token : string option) ()
: update_rate_based_rule_response = { change_token; 
}

let make_update_rate_based_rule_request 
  ~(rate_limit : int)
  ~(updates : rule_update list)
  ~(change_token : string)
  ~(rule_id : string)
  () : update_rate_based_rule_request = {
  rate_limit; updates; change_token; rule_id; 
}

let make_update_ip_set_response  ?(change_token : string option) ()
: update_ip_set_response = { change_token;  }

let make_ip_set_descriptor 
  ~(value : string) ~(type_ : ip_set_descriptor_type) () : ip_set_descriptor
= { value; type_;  }

let make_ip_set_update 
  ~(ip_set_descriptor : ip_set_descriptor) ~(action : change_action) ()
: ip_set_update = { ip_set_descriptor; action; 
}

let make_update_ip_set_request 
  ~(updates : ip_set_update list)
  ~(change_token : string)
  ~(ip_set_id : string)
  () : update_ip_set_request = { updates; change_token; ip_set_id; 
}

let make_update_geo_match_set_response  ?(change_token : string option) ()
: update_geo_match_set_response = { change_token; 
}

let make_geo_match_constraint 
  ~(value : geo_match_constraint_value)
  ~(type_ : geo_match_constraint_type)
  () : geo_match_constraint = { value; type_; 
}

let make_geo_match_set_update 
  ~(geo_match_constraint : geo_match_constraint) ~(action : change_action) ()
: geo_match_set_update = { geo_match_constraint; action; 
}

let make_update_geo_match_set_request 
  ~(updates : geo_match_set_update list)
  ~(change_token : string)
  ~(geo_match_set_id : string)
  () : update_geo_match_set_request = {
  updates; change_token; geo_match_set_id; 
}

let make_update_byte_match_set_response  ?(change_token : string option) ()
: update_byte_match_set_response = { change_token; 
}

let make_byte_match_tuple 
  ~(positional_constraint : positional_constraint)
  ~(text_transformation : text_transformation)
  ~(target_string : bytes)
  ~(field_to_match : field_to_match)
  () : byte_match_tuple = {
  positional_constraint; text_transformation; target_string; field_to_match; 
}

let make_byte_match_set_update 
  ~(byte_match_tuple : byte_match_tuple) ~(action : change_action) ()
: byte_match_set_update = { byte_match_tuple; action; 
}

let make_update_byte_match_set_request 
  ~(updates : byte_match_set_update list)
  ~(change_token : string)
  ~(byte_match_set_id : string)
  () : update_byte_match_set_request = {
  updates; change_token; byte_match_set_id; 
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
: tag_info_for_resource = { tag_list; resource_ar_n; 
}

let make_subscribed_rule_group_summary 
  ~(metric_name : string) ~(name : string) ~(rule_group_id : string) ()
: subscribed_rule_group_summary = { metric_name; name; rule_group_id; 
}

let make_sql_injection_match_set_summary 
  ~(name : string) ~(sql_injection_match_set_id : string) ()
: sql_injection_match_set_summary = { name; sql_injection_match_set_id; 
}

let make_sql_injection_match_set 
  ?(name : string option)
  ~(sql_injection_match_tuples : sql_injection_match_tuple list)
  ~(sql_injection_match_set_id : string)
  () : sql_injection_match_set = {
  sql_injection_match_tuples; name; sql_injection_match_set_id; 
}

let make_size_constraint_set_summary 
  ~(name : string) ~(size_constraint_set_id : string) ()
: size_constraint_set_summary = { name; size_constraint_set_id; 
}

let make_size_constraint_set 
  ?(name : string option)
  ~(size_constraints : size_constraint list)
  ~(size_constraint_set_id : string)
  () : size_constraint_set = {
  size_constraints; name; size_constraint_set_id;  }

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

let make_sampled_http_request 
  ?(rule_within_rule_group : string option)
  ?(action : string option)
  ?(timestamp_ : float option)
  ~(weight : int)
  ~(request : http_request)
  () : sampled_http_request = {
  rule_within_rule_group; action; timestamp_; weight; request; 
}

let make_rule_summary  ~(name : string) ~(rule_id : string) () : rule_summary
= { name; rule_id;  }

let make_rule_group_summary  ~(name : string) ~(rule_group_id : string) ()
: rule_group_summary = { name; rule_group_id;  }

let make_rule_group 
  ?(metric_name : string option)
  ?(name : string option)
  ~(rule_group_id : string)
  () : rule_group = { metric_name; name; rule_group_id;  }

let make_rule 
  ?(metric_name : string option)
  ?(name : string option)
  ~(predicates : predicate list)
  ~(rule_id : string)
  () : rule = { predicates; metric_name; name; rule_id; 
}

let make_regex_pattern_set_summary 
  ~(name : string) ~(regex_pattern_set_id : string) ()
: regex_pattern_set_summary = { name; regex_pattern_set_id; 
}

let make_regex_pattern_set 
  ?(name : string option)
  ~(regex_pattern_strings : string list)
  ~(regex_pattern_set_id : string)
  () : regex_pattern_set = {
  regex_pattern_strings; name; regex_pattern_set_id; 
}

let make_regex_match_set_summary 
  ~(name : string) ~(regex_match_set_id : string) ()
: regex_match_set_summary = { name; regex_match_set_id; 
}

let make_regex_match_set 
  ?(regex_match_tuples : regex_match_tuple list option)
  ?(name : string option)
  ?(regex_match_set_id : string option)
  () : regex_match_set = { regex_match_tuples; name; regex_match_set_id; 
}

let make_rate_based_rule 
  ?(metric_name : string option)
  ?(name : string option)
  ~(rate_limit : int)
  ~(rate_key : rate_key)
  ~(match_predicates : predicate list)
  ~(rule_id : string)
  () : rate_based_rule = {
  rate_limit; rate_key; match_predicates; metric_name; name; rule_id; 
}

let make_put_permission_policy_response  () : put_permission_policy_response
= ()

let make_put_permission_policy_request 
  ~(policy : string) ~(resource_arn : string) ()
: put_permission_policy_request = { policy; resource_arn; 
}

let make_logging_configuration 
  ?(redacted_fields : field_to_match list option)
  ~(log_destination_configs : string list)
  ~(resource_arn : string)
  () : logging_configuration = {
  redacted_fields; log_destination_configs; resource_arn; 
}

let make_put_logging_configuration_response 
  ?(logging_configuration : logging_configuration option) ()
: put_logging_configuration_response = { logging_configuration; 
}

let make_put_logging_configuration_request 
  ~(logging_configuration : logging_configuration) ()
: put_logging_configuration_request = { logging_configuration; 
}

let make_list_xss_match_sets_response 
  ?(xss_match_sets : xss_match_set_summary list option)
  ?(next_marker : string option)
  () : list_xss_match_sets_response = { xss_match_sets; next_marker; 
}

let make_list_xss_match_sets_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_xss_match_sets_request = { limit; next_marker; 
}

let make_list_web_ac_ls_response 
  ?(web_ac_ls : web_acl_summary list option)
  ?(next_marker : string option)
  () : list_web_ac_ls_response = { web_ac_ls; next_marker; 
}

let make_list_web_ac_ls_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_web_ac_ls_request = { limit; next_marker; 
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

let make_list_subscribed_rule_groups_response 
  ?(rule_groups : subscribed_rule_group_summary list option)
  ?(next_marker : string option)
  () : list_subscribed_rule_groups_response = { rule_groups; next_marker; 
}

let make_list_subscribed_rule_groups_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_subscribed_rule_groups_request = { limit; next_marker; 
}

let make_list_sql_injection_match_sets_response 
  ?(sql_injection_match_sets : sql_injection_match_set_summary list option)
  ?(next_marker : string option)
  () : list_sql_injection_match_sets_response = {
  sql_injection_match_sets; next_marker; 
}

let make_list_sql_injection_match_sets_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_sql_injection_match_sets_request = { limit; next_marker; 
}

let make_list_size_constraint_sets_response 
  ?(size_constraint_sets : size_constraint_set_summary list option)
  ?(next_marker : string option)
  () : list_size_constraint_sets_response = {
  size_constraint_sets; next_marker; 
}

let make_list_size_constraint_sets_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_size_constraint_sets_request = { limit; next_marker; 
}

let make_list_rules_response 
  ?(rules : rule_summary list option) ?(next_marker : string option) ()
: list_rules_response = { rules; next_marker;  }

let make_list_rules_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_rules_request = { limit; next_marker; 
}

let make_list_rule_groups_response 
  ?(rule_groups : rule_group_summary list option)
  ?(next_marker : string option)
  () : list_rule_groups_response = { rule_groups; next_marker; 
}

let make_list_rule_groups_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_rule_groups_request = { limit; next_marker; 
}

let make_list_regex_pattern_sets_response 
  ?(regex_pattern_sets : regex_pattern_set_summary list option)
  ?(next_marker : string option)
  () : list_regex_pattern_sets_response = { regex_pattern_sets; next_marker; 
}

let make_list_regex_pattern_sets_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_regex_pattern_sets_request = { limit; next_marker; 
}

let make_list_regex_match_sets_response 
  ?(regex_match_sets : regex_match_set_summary list option)
  ?(next_marker : string option)
  () : list_regex_match_sets_response = { regex_match_sets; next_marker; 
}

let make_list_regex_match_sets_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_regex_match_sets_request = { limit; next_marker; 
}

let make_list_rate_based_rules_response 
  ?(rules : rule_summary list option) ?(next_marker : string option) ()
: list_rate_based_rules_response = { rules; next_marker; 
}

let make_list_rate_based_rules_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_rate_based_rules_request = { limit; next_marker; 
}

let make_list_logging_configurations_response 
  ?(next_marker : string option)
  ?(logging_configurations : logging_configuration list option)
  () : list_logging_configurations_response = {
  next_marker; logging_configurations; 
}

let make_list_logging_configurations_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_logging_configurations_request = { limit; next_marker; 
}

let make_ip_set_summary  ~(name : string) ~(ip_set_id : string) ()
: ip_set_summary = { name; ip_set_id;  }

let make_list_ip_sets_response 
  ?(ip_sets : ip_set_summary list option) ?(next_marker : string option) ()
: list_ip_sets_response = { ip_sets; next_marker; 
}

let make_list_ip_sets_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_ip_sets_request = { limit; next_marker; 
}

let make_geo_match_set_summary 
  ~(name : string) ~(geo_match_set_id : string) () : geo_match_set_summary =
{ name; geo_match_set_id;  }

let make_list_geo_match_sets_response 
  ?(geo_match_sets : geo_match_set_summary list option)
  ?(next_marker : string option)
  () : list_geo_match_sets_response = { geo_match_sets; next_marker; 
}

let make_list_geo_match_sets_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_geo_match_sets_request = { limit; next_marker; 
}

let make_byte_match_set_summary 
  ~(name : string) ~(byte_match_set_id : string) () : byte_match_set_summary
= { name; byte_match_set_id;  }

let make_list_byte_match_sets_response 
  ?(byte_match_sets : byte_match_set_summary list option)
  ?(next_marker : string option)
  () : list_byte_match_sets_response = { byte_match_sets; next_marker; 
}

let make_list_byte_match_sets_request 
  ?(limit : int option) ?(next_marker : string option) ()
: list_byte_match_sets_request = { limit; next_marker; 
}

let make_list_activated_rules_in_rule_group_response 
  ?(activated_rules : activated_rule list option)
  ?(next_marker : string option)
  () : list_activated_rules_in_rule_group_response = {
  activated_rules; next_marker; 
}

let make_list_activated_rules_in_rule_group_request 
  ?(limit : int option)
  ?(next_marker : string option)
  ?(rule_group_id : string option)
  () : list_activated_rules_in_rule_group_request = {
  limit; next_marker; rule_group_id;  }

let make_ip_set 
  ?(name : string option)
  ~(ip_set_descriptors : ip_set_descriptor list)
  ~(ip_set_id : string)
  () : ip_set = { ip_set_descriptors; name; ip_set_id; 
}

let make_get_xss_match_set_response 
  ?(xss_match_set : xss_match_set option) () : get_xss_match_set_response = {
  xss_match_set;  }

let make_get_xss_match_set_request  ~(xss_match_set_id : string) ()
: get_xss_match_set_request = { xss_match_set_id; 
}

let make_get_web_acl_response  ?(web_ac_l : web_ac_l option) ()
: get_web_acl_response = { web_ac_l;  }

let make_get_web_acl_request  ~(web_acl_id : string) () : get_web_acl_request
= { web_acl_id;  }

let make_get_sql_injection_match_set_response 
  ?(sql_injection_match_set : sql_injection_match_set option) ()
: get_sql_injection_match_set_response = { sql_injection_match_set; 
}

let make_get_sql_injection_match_set_request 
  ~(sql_injection_match_set_id : string) ()
: get_sql_injection_match_set_request = { sql_injection_match_set_id; 
}

let make_get_size_constraint_set_response 
  ?(size_constraint_set : size_constraint_set option) ()
: get_size_constraint_set_response = { size_constraint_set; 
}

let make_get_size_constraint_set_request 
  ~(size_constraint_set_id : string) () : get_size_constraint_set_request = {
  size_constraint_set_id;  }

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
  ~(rule_id : string)
  ~(web_acl_id : string)
  () : get_sampled_requests_request = {
  max_items; time_window; rule_id; web_acl_id;  }

let make_get_rule_response  ?(rule : rule option) () : get_rule_response = {
  rule;  }

let make_get_rule_request  ~(rule_id : string) () : get_rule_request = {
  rule_id;  }

let make_get_rule_group_response  ?(rule_group : rule_group option) ()
: get_rule_group_response = { rule_group;  }

let make_get_rule_group_request  ~(rule_group_id : string) ()
: get_rule_group_request = { rule_group_id; 
}

let make_get_regex_pattern_set_response 
  ?(regex_pattern_set : regex_pattern_set option) ()
: get_regex_pattern_set_response = { regex_pattern_set; 
}

let make_get_regex_pattern_set_request  ~(regex_pattern_set_id : string) ()
: get_regex_pattern_set_request = { regex_pattern_set_id; 
}

let make_get_regex_match_set_response 
  ?(regex_match_set : regex_match_set option) ()
: get_regex_match_set_response = { regex_match_set; 
}

let make_get_regex_match_set_request  ~(regex_match_set_id : string) ()
: get_regex_match_set_request = { regex_match_set_id; 
}

let make_get_rate_based_rule_response  ?(rule : rate_based_rule option) ()
: get_rate_based_rule_response = { rule; 
}

let make_get_rate_based_rule_request  ~(rule_id : string) ()
: get_rate_based_rule_request = { rule_id; 
}

let make_get_rate_based_rule_managed_keys_response 
  ?(next_marker : string option) ?(managed_keys : string list option) ()
: get_rate_based_rule_managed_keys_response = { next_marker; managed_keys; 
}

let make_get_rate_based_rule_managed_keys_request 
  ?(next_marker : string option) ~(rule_id : string) ()
: get_rate_based_rule_managed_keys_request = { next_marker; rule_id; 
}

let make_get_permission_policy_response  ?(policy : string option) ()
: get_permission_policy_response = { policy; 
}

let make_get_permission_policy_request  ~(resource_arn : string) ()
: get_permission_policy_request = { resource_arn; 
}

let make_get_logging_configuration_response 
  ?(logging_configuration : logging_configuration option) ()
: get_logging_configuration_response = { logging_configuration; 
}

let make_get_logging_configuration_request  ~(resource_arn : string) ()
: get_logging_configuration_request = { resource_arn; 
}

let make_get_ip_set_response  ?(ip_set : ip_set option) ()
: get_ip_set_response = { ip_set;  }

let make_get_ip_set_request  ~(ip_set_id : string) () : get_ip_set_request =
{ ip_set_id;  }

let make_geo_match_set 
  ?(name : string option)
  ~(geo_match_constraints : geo_match_constraint list)
  ~(geo_match_set_id : string)
  () : geo_match_set = { geo_match_constraints; name; geo_match_set_id; 
}

let make_get_geo_match_set_response 
  ?(geo_match_set : geo_match_set option) () : get_geo_match_set_response = {
  geo_match_set;  }

let make_get_geo_match_set_request  ~(geo_match_set_id : string) ()
: get_geo_match_set_request = { geo_match_set_id; 
}

let make_get_change_token_status_response 
  ?(change_token_status : change_token_status option) ()
: get_change_token_status_response = { change_token_status; 
}

let make_get_change_token_status_request  ~(change_token : string) ()
: get_change_token_status_request = { change_token; 
}

let make_get_change_token_response  ?(change_token : string option) ()
: get_change_token_response = { change_token; 
}

let make_get_change_token_request  () : get_change_token_request =
()

let make_byte_match_set 
  ?(name : string option)
  ~(byte_match_tuples : byte_match_tuple list)
  ~(byte_match_set_id : string)
  () : byte_match_set = { byte_match_tuples; name; byte_match_set_id; 
}

let make_get_byte_match_set_response 
  ?(byte_match_set : byte_match_set option) () : get_byte_match_set_response
= { byte_match_set;  }

let make_get_byte_match_set_request  ~(byte_match_set_id : string) ()
: get_byte_match_set_request = { byte_match_set_id; 
}

let make_delete_xss_match_set_response  ?(change_token : string option) ()
: delete_xss_match_set_response = { change_token; 
}

let make_delete_xss_match_set_request 
  ~(change_token : string) ~(xss_match_set_id : string) ()
: delete_xss_match_set_request = { change_token; xss_match_set_id; 
}

let make_delete_web_acl_response  ?(change_token : string option) ()
: delete_web_acl_response = { change_token; 
}

let make_delete_web_acl_request 
  ~(change_token : string) ~(web_acl_id : string) () : delete_web_acl_request
= { change_token; web_acl_id; 
}

let make_delete_sql_injection_match_set_response 
  ?(change_token : string option) ()
: delete_sql_injection_match_set_response = { change_token; 
}

let make_delete_sql_injection_match_set_request 
  ~(change_token : string) ~(sql_injection_match_set_id : string) ()
: delete_sql_injection_match_set_request = {
  change_token; sql_injection_match_set_id; 
}

let make_delete_size_constraint_set_response 
  ?(change_token : string option) () : delete_size_constraint_set_response =
{ change_token;  }

let make_delete_size_constraint_set_request 
  ~(change_token : string) ~(size_constraint_set_id : string) ()
: delete_size_constraint_set_request = {
  change_token; size_constraint_set_id;  }

let make_delete_rule_response  ?(change_token : string option) ()
: delete_rule_response = { change_token;  }

let make_delete_rule_request  ~(change_token : string) ~(rule_id : string) ()
: delete_rule_request = { change_token; rule_id; 
}

let make_delete_rule_group_response  ?(change_token : string option) ()
: delete_rule_group_response = { change_token; 
}

let make_delete_rule_group_request 
  ~(change_token : string) ~(rule_group_id : string) ()
: delete_rule_group_request = { change_token; rule_group_id; 
}

let make_delete_regex_pattern_set_response 
  ?(change_token : string option) () : delete_regex_pattern_set_response = {
  change_token;  }

let make_delete_regex_pattern_set_request 
  ~(change_token : string) ~(regex_pattern_set_id : string) ()
: delete_regex_pattern_set_request = { change_token; regex_pattern_set_id; 
}

let make_delete_regex_match_set_response  ?(change_token : string option) ()
: delete_regex_match_set_response = { change_token; 
}

let make_delete_regex_match_set_request 
  ~(change_token : string) ~(regex_match_set_id : string) ()
: delete_regex_match_set_request = { change_token; regex_match_set_id; 
}

let make_delete_rate_based_rule_response  ?(change_token : string option) ()
: delete_rate_based_rule_response = { change_token; 
}

let make_delete_rate_based_rule_request 
  ~(change_token : string) ~(rule_id : string) ()
: delete_rate_based_rule_request = { change_token; rule_id; 
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

let make_delete_logging_configuration_request  ~(resource_arn : string) ()
: delete_logging_configuration_request = { resource_arn; 
}

let make_delete_ip_set_response  ?(change_token : string option) ()
: delete_ip_set_response = { change_token;  }

let make_delete_ip_set_request 
  ~(change_token : string) ~(ip_set_id : string) () : delete_ip_set_request =
{ change_token; ip_set_id;  }

let make_delete_geo_match_set_response  ?(change_token : string option) ()
: delete_geo_match_set_response = { change_token; 
}

let make_delete_geo_match_set_request 
  ~(change_token : string) ~(geo_match_set_id : string) ()
: delete_geo_match_set_request = { change_token; geo_match_set_id; 
}

let make_delete_byte_match_set_response  ?(change_token : string option) ()
: delete_byte_match_set_response = { change_token; 
}

let make_delete_byte_match_set_request 
  ~(change_token : string) ~(byte_match_set_id : string) ()
: delete_byte_match_set_request = { change_token; byte_match_set_id; 
}

let make_create_xss_match_set_response 
  ?(change_token : string option) ?(xss_match_set : xss_match_set option) ()
: create_xss_match_set_response = { change_token; xss_match_set; 
}

let make_create_xss_match_set_request 
  ~(change_token : string) ~(name : string) () : create_xss_match_set_request
= { change_token; name;  }

let make_create_web_acl_response 
  ?(change_token : string option) ?(web_ac_l : web_ac_l option) ()
: create_web_acl_response = { change_token; web_ac_l; 
}

let make_create_web_acl_request 
  ?(tags : tag list option)
  ~(change_token : string)
  ~(default_action : waf_action)
  ~(metric_name : string)
  ~(name : string)
  () : create_web_acl_request = {
  tags; change_token; default_action; metric_name; name; 
}

let make_create_web_acl_migration_stack_response 
  ~(s3_object_url : string) () : create_web_acl_migration_stack_response = {
  s3_object_url;  }

let make_create_web_acl_migration_stack_request 
  ~(ignore_unsupported_type : bool)
  ~(s3_bucket_name : string)
  ~(web_acl_id : string)
  () : create_web_acl_migration_stack_request = {
  ignore_unsupported_type; s3_bucket_name; web_acl_id; 
}

let make_create_sql_injection_match_set_response 
  ?(change_token : string option)
  ?(sql_injection_match_set : sql_injection_match_set option)
  () : create_sql_injection_match_set_response = {
  change_token; sql_injection_match_set; 
}

let make_create_sql_injection_match_set_request 
  ~(change_token : string) ~(name : string) ()
: create_sql_injection_match_set_request = { change_token; name; 
}

let make_create_size_constraint_set_response 
  ?(change_token : string option)
  ?(size_constraint_set : size_constraint_set option)
  () : create_size_constraint_set_response = {
  change_token; size_constraint_set; 
}

let make_create_size_constraint_set_request 
  ~(change_token : string) ~(name : string) ()
: create_size_constraint_set_request = { change_token; name; 
}

let make_create_rule_response 
  ?(change_token : string option) ?(rule : rule option) ()
: create_rule_response = { change_token; rule; 
}

let make_create_rule_request 
  ?(tags : tag list option)
  ~(change_token : string)
  ~(metric_name : string)
  ~(name : string)
  () : create_rule_request = { tags; change_token; metric_name; name; 
}

let make_create_rule_group_response 
  ?(change_token : string option) ?(rule_group : rule_group option) ()
: create_rule_group_response = { change_token; rule_group; 
}

let make_create_rule_group_request 
  ?(tags : tag list option)
  ~(change_token : string)
  ~(metric_name : string)
  ~(name : string)
  () : create_rule_group_request = { tags; change_token; metric_name; name; 
}

let make_create_regex_pattern_set_response 
  ?(change_token : string option)
  ?(regex_pattern_set : regex_pattern_set option)
  () : create_regex_pattern_set_response = {
  change_token; regex_pattern_set; 
}

let make_create_regex_pattern_set_request 
  ~(change_token : string) ~(name : string) ()
: create_regex_pattern_set_request = { change_token; name; 
}

let make_create_regex_match_set_response 
  ?(change_token : string option)
  ?(regex_match_set : regex_match_set option)
  () : create_regex_match_set_response = { change_token; regex_match_set; 
}

let make_create_regex_match_set_request 
  ~(change_token : string) ~(name : string) ()
: create_regex_match_set_request = { change_token; name; 
}

let make_create_rate_based_rule_response 
  ?(change_token : string option) ?(rule : rate_based_rule option) ()
: create_rate_based_rule_response = { change_token; rule; 
}

let make_create_rate_based_rule_request 
  ?(tags : tag list option)
  ~(change_token : string)
  ~(rate_limit : int)
  ~(rate_key : rate_key)
  ~(metric_name : string)
  ~(name : string)
  () : create_rate_based_rule_request = {
  tags; change_token; rate_limit; rate_key; metric_name; name; 
}

let make_create_ip_set_response 
  ?(change_token : string option) ?(ip_set : ip_set option) ()
: create_ip_set_response = { change_token; ip_set; 
}

let make_create_ip_set_request  ~(change_token : string) ~(name : string) ()
: create_ip_set_request = { change_token; name; 
}

let make_create_geo_match_set_response 
  ?(change_token : string option) ?(geo_match_set : geo_match_set option) ()
: create_geo_match_set_response = { change_token; geo_match_set; 
}

let make_create_geo_match_set_request 
  ~(change_token : string) ~(name : string) () : create_geo_match_set_request
= { change_token; name;  }

let make_create_byte_match_set_response 
  ?(change_token : string option)
  ?(byte_match_set : byte_match_set option)
  () : create_byte_match_set_response = { change_token; byte_match_set; 
}

let make_create_byte_match_set_request 
  ~(change_token : string) ~(name : string) ()
: create_byte_match_set_request = { change_token; name; 
}

