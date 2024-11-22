open Smaws_Lib
val service : Service.descriptor

type match_field_type = | ALL_QUERY_ARGS
  | SINGLE_QUERY_ARG
  | BODY
  | METHOD
  | HEADER
  | QUERY_STRING
  | URI

type field_to_match = {
  data: string option;
  type_: match_field_type
}

type text_transformation = | URL_DECODE
  | CMD_LINE
  | LOWERCASE
  | HTML_ENTITY_DECODE
  | COMPRESS_WHITE_SPACE
  | NONE

type xss_match_tuple = {
  text_transformation: text_transformation;
  field_to_match: field_to_match
}

type change_action = | DELETE
  | INSERT

type xss_match_set_update = {
  xss_match_tuple: xss_match_tuple;
  action: change_action
}

type xss_match_set_summary = {
  name: string;
  xss_match_set_id: string
}

type xss_match_set = {
  xss_match_tuples: xss_match_tuple list;
  name: string option;
  xss_match_set_id: string
}

type waf_action_type = | COUNT
  | ALLOW
  | BLOCK

type waf_action = {
  type_: waf_action_type
}

type waf_override_action_type = | COUNT
  | NONE

type waf_override_action = {
  type_: waf_override_action_type
}

type waf_rule_type = | GROUP
  | RATE_BASED
  | REGULAR

type excluded_rule = {
  rule_id: string
}

type activated_rule = {
  excluded_rules: excluded_rule list option;
  type_: waf_rule_type option;
  override_action: waf_override_action option;
  action: waf_action option;
  rule_id: string;
  priority: int
}

type web_acl_update = {
  activated_rule: activated_rule;
  action: change_action
}

type web_acl_summary = {
  name: string;
  web_acl_id: string
}

type web_ac_l = {
  web_acl_arn: string option;
  rules: activated_rule list;
  default_action: waf_action;
  metric_name: string option;
  name: string option;
  web_acl_id: string
}

type waf_tag_operation_internal_error_exception = {
  message: string option
}

type waf_tag_operation_exception = {
  message: string option
}

type waf_subscription_not_found_exception = {
  message: string option
}

type waf_stale_data_exception = {
  message: string option
}

type waf_service_linked_role_error_exception = {
  message: string option
}

type waf_referenced_item_exception = {
  message: string option
}

type waf_nonexistent_item_exception = {
  message: string option
}

type waf_nonexistent_container_exception = {
  message: string option
}

type waf_non_empty_entity_exception = {
  message: string option
}

type waf_limits_exceeded_exception = {
  message: string option
}

type waf_invalid_regex_pattern_exception = {
  message: string option
}

type waf_invalid_permission_policy_exception = {
  message: string option
}

type parameter_exception_field = | TAG_KEYS
  | TAGS
  | RESOURCE_ARN
  | NEXT_MARKER
  | RULE_TYPE
  | RATE_KEY
  | GEO_MATCH_LOCATION_VALUE
  | GEO_MATCH_LOCATION_TYPE
  | SIZE_CONSTRAINT_COMPARISON_OPERATOR
  | BYTE_MATCH_POSITIONAL_CONSTRAINT
  | BYTE_MATCH_TEXT_TRANSFORMATION
  | SQL_INJECTION_MATCH_FIELD_TYPE
  | BYTE_MATCH_FIELD_TYPE
  | IPSET_TYPE
  | PREDICATE_TYPE
  | WAF_OVERRIDE_ACTION
  | WAF_ACTION
  | CHANGE_ACTION

type parameter_exception_reason = | INVALID_TAG_KEY
  | ILLEGAL_ARGUMENT
  | ILLEGAL_COMBINATION
  | INVALID_OPTION

type waf_invalid_parameter_exception = {
  reason: parameter_exception_reason option;
  parameter: string option;
  field: parameter_exception_field option
}

type waf_invalid_operation_exception = {
  message: string option
}

type waf_invalid_account_exception = unit

type waf_internal_error_exception = {
  message: string option
}

type migration_error_type = | S3_INTERNAL_ERROR
  | S3_BUCKET_INVALID_REGION
  | S3_BUCKET_NOT_FOUND
  | S3_BUCKET_NOT_ACCESSIBLE
  | S3_BUCKET_NO_PERMISSION
  | ENTITY_NOT_FOUND
  | ENTITY_NOT_SUPPORTED

type waf_entity_migration_exception = {
  migration_error_reason: string option;
  migration_error_type: migration_error_type option;
  message: string option
}

type waf_disallowed_name_exception = {
  message: string option
}

type waf_bad_request_exception = {
  message: string option
}

type update_xss_match_set_response = {
  change_token: string option
}

type update_xss_match_set_request = {
  updates: xss_match_set_update list;
  change_token: string;
  xss_match_set_id: string
}

type update_web_acl_response = {
  change_token: string option
}

type update_web_acl_request = {
  default_action: waf_action option;
  updates: web_acl_update list option;
  change_token: string;
  web_acl_id: string
}

type update_sql_injection_match_set_response = {
  change_token: string option
}

type sql_injection_match_tuple = {
  text_transformation: text_transformation;
  field_to_match: field_to_match
}

type sql_injection_match_set_update = {
  sql_injection_match_tuple: sql_injection_match_tuple;
  action: change_action
}

type update_sql_injection_match_set_request = {
  updates: sql_injection_match_set_update list;
  change_token: string;
  sql_injection_match_set_id: string
}

type update_size_constraint_set_response = {
  change_token: string option
}

type comparison_operator = | GT
  | GE
  | LT
  | LE
  | NE
  | EQ

type size_constraint = {
  size: int;
  comparison_operator: comparison_operator;
  text_transformation: text_transformation;
  field_to_match: field_to_match
}

type size_constraint_set_update = {
  size_constraint: size_constraint;
  action: change_action
}

type update_size_constraint_set_request = {
  updates: size_constraint_set_update list;
  change_token: string;
  size_constraint_set_id: string
}

type update_rule_response = {
  change_token: string option
}

type predicate_type = | REGEX_MATCH
  | XSS_MATCH
  | SIZE_CONSTRAINT
  | GEO_MATCH
  | SQL_INJECTION_MATCH
  | BYTE_MATCH
  | IP_MATCH

type predicate = {
  data_id: string;
  type_: predicate_type;
  negated: bool
}

type rule_update = {
  predicate: predicate;
  action: change_action
}

type update_rule_request = {
  updates: rule_update list;
  change_token: string;
  rule_id: string
}

type update_rule_group_response = {
  change_token: string option
}

type rule_group_update = {
  activated_rule: activated_rule;
  action: change_action
}

type update_rule_group_request = {
  change_token: string;
  updates: rule_group_update list;
  rule_group_id: string
}

type update_regex_pattern_set_response = {
  change_token: string option
}

type regex_pattern_set_update = {
  regex_pattern_string: string;
  action: change_action
}

type update_regex_pattern_set_request = {
  change_token: string;
  updates: regex_pattern_set_update list;
  regex_pattern_set_id: string
}

type update_regex_match_set_response = {
  change_token: string option
}

type regex_match_tuple = {
  regex_pattern_set_id: string;
  text_transformation: text_transformation;
  field_to_match: field_to_match
}

type regex_match_set_update = {
  regex_match_tuple: regex_match_tuple;
  action: change_action
}

type update_regex_match_set_request = {
  change_token: string;
  updates: regex_match_set_update list;
  regex_match_set_id: string
}

type update_rate_based_rule_response = {
  change_token: string option
}

type update_rate_based_rule_request = {
  rate_limit: int;
  updates: rule_update list;
  change_token: string;
  rule_id: string
}

type update_ip_set_response = {
  change_token: string option
}

type ip_set_descriptor_type = | IPV6
  | IPV4

type ip_set_descriptor = {
  value: string;
  type_: ip_set_descriptor_type
}

type ip_set_update = {
  ip_set_descriptor: ip_set_descriptor;
  action: change_action
}

type update_ip_set_request = {
  updates: ip_set_update list;
  change_token: string;
  ip_set_id: string
}

type update_geo_match_set_response = {
  change_token: string option
}

type geo_match_constraint_type = | Country

type geo_match_constraint_value = | ZW
  | ZM
  | YE
  | EH
  | WF
  | VI
  | VG
  | VN
  | VE
  | VU
  | UZ
  | UY
  | UM
  | US
  | GB
  | AE
  | UA
  | UG
  | TV
  | TC
  | TM
  | TR
  | TN
  | TT
  | TO
  | TK
  | TG
  | TL
  | TH
  | TZ
  | TJ
  | TW
  | SY
  | CH
  | SE
  | SZ
  | SJ
  | SR
  | SD
  | LK
  | ES
  | SS
  | GS
  | ZA
  | SO
  | SB
  | SI
  | SK
  | SX
  | SG
  | SL
  | SC
  | RS
  | SN
  | SA
  | ST
  | SM
  | WS
  | VC
  | PM
  | MF
  | LC
  | KN
  | SH
  | BL
  | RW
  | RU
  | RO
  | RE
  | QA
  | PR
  | PT
  | PL
  | PN
  | PH
  | PE
  | PY
  | PG
  | PA
  | PS
  | PW
  | PK
  | OM
  | NO
  | MP
  | NF
  | NU
  | NG
  | NE
  | NI
  | NZ
  | NC
  | NL
  | NP
  | NR
  | NA
  | MM
  | MZ
  | MA
  | MS
  | ME
  | MN
  | MC
  | MD
  | FM
  | MX
  | YT
  | MU
  | MR
  | MQ
  | MH
  | MT
  | ML
  | MV
  | MY
  | MW
  | MG
  | MK
  | MO
  | LU
  | LT
  | LI
  | LY
  | LR
  | LS
  | LB
  | LV
  | LA
  | KG
  | KW
  | KR
  | KP
  | KI
  | KE
  | KZ
  | JO
  | JE
  | JP
  | JM
  | IT
  | IL
  | IM
  | IE
  | IQ
  | IR
  | ID
  | IN
  | IS
  | HU
  | HK
  | HN
  | VA
  | HM
  | HT
  | GY
  | GW
  | GN
  | GG
  | GT
  | GU
  | GP
  | GD
  | GL
  | GR
  | GI
  | GH
  | DE
  | GE
  | GM
  | GA
  | TF
  | PF
  | GF
  | FR
  | FI
  | FJ
  | FO
  | FK
  | ET
  | EE
  | ER
  | GQ
  | SV
  | EG
  | EC
  | DO
  | DM
  | DJ
  | DK
  | CZ
  | CY
  | CW
  | CU
  | HR
  | CI
  | CR
  | CK
  | CD
  | CG
  | KM
  | CO
  | CC
  | CX
  | CN
  | CL
  | TD
  | CF
  | KY
  | CV
  | CA
  | CM
  | KH
  | BI
  | BF
  | BG
  | BN
  | IO
  | BR
  | BV
  | BW
  | BA
  | BQ
  | BO
  | BT
  | BM
  | BJ
  | BZ
  | BE
  | BY
  | BB
  | BD
  | BH
  | BS
  | AZ
  | AT
  | AU
  | AW
  | AM
  | AR
  | AG
  | AQ
  | AI
  | AO
  | AD
  | AS
  | DZ
  | AL
  | AX
  | AF

type geo_match_constraint = {
  value: geo_match_constraint_value;
  type_: geo_match_constraint_type
}

type geo_match_set_update = {
  geo_match_constraint: geo_match_constraint;
  action: change_action
}

type update_geo_match_set_request = {
  updates: geo_match_set_update list;
  change_token: string;
  geo_match_set_id: string
}

type update_byte_match_set_response = {
  change_token: string option
}

type positional_constraint = | CONTAINS_WORD
  | CONTAINS
  | ENDS_WITH
  | STARTS_WITH
  | EXACTLY

type byte_match_tuple = {
  positional_constraint: positional_constraint;
  text_transformation: text_transformation;
  target_string: bytes;
  field_to_match: field_to_match
}

type byte_match_set_update = {
  byte_match_tuple: byte_match_tuple;
  action: change_action
}

type update_byte_match_set_request = {
  updates: byte_match_set_update list;
  change_token: string;
  byte_match_set_id: string
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  resource_ar_n: string
}

type time_window = {
  end_time: float;
  start_time: float
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

type tag_info_for_resource = {
  tag_list: tag list option;
  resource_ar_n: string option
}

type subscribed_rule_group_summary = {
  metric_name: string;
  name: string;
  rule_group_id: string
}

type sql_injection_match_set_summary = {
  name: string;
  sql_injection_match_set_id: string
}

type sql_injection_match_set = {
  sql_injection_match_tuples: sql_injection_match_tuple list;
  name: string option;
  sql_injection_match_set_id: string
}

type size_constraint_set_summary = {
  name: string;
  size_constraint_set_id: string
}

type size_constraint_set = {
  size_constraints: size_constraint list;
  name: string option;
  size_constraint_set_id: string
}

type http_header = {
  value: string option;
  name: string option
}

type http_request = {
  headers: http_header list option;
  http_version: string option;
  method_: string option;
  ur_i: string option;
  country: string option;
  client_i_p: string option
}

type sampled_http_request = {
  rule_within_rule_group: string option;
  action: string option;
  timestamp_: float option;
  weight: int;
  request: http_request
}

type rule_summary = {
  name: string;
  rule_id: string
}

type rule_group_summary = {
  name: string;
  rule_group_id: string
}

type rule_group = {
  metric_name: string option;
  name: string option;
  rule_group_id: string
}

type rule = {
  predicates: predicate list;
  metric_name: string option;
  name: string option;
  rule_id: string
}

type regex_pattern_set_summary = {
  name: string;
  regex_pattern_set_id: string
}

type regex_pattern_set = {
  regex_pattern_strings: string list;
  name: string option;
  regex_pattern_set_id: string
}

type regex_match_set_summary = {
  name: string;
  regex_match_set_id: string
}

type regex_match_set = {
  regex_match_tuples: regex_match_tuple list option;
  name: string option;
  regex_match_set_id: string option
}

type rate_key = | IP

type rate_based_rule = {
  rate_limit: int;
  rate_key: rate_key;
  match_predicates: predicate list;
  metric_name: string option;
  name: string option;
  rule_id: string
}

type put_permission_policy_response = unit

type put_permission_policy_request = {
  policy: string;
  resource_arn: string
}

type logging_configuration = {
  redacted_fields: field_to_match list option;
  log_destination_configs: string list;
  resource_arn: string
}

type put_logging_configuration_response = {
  logging_configuration: logging_configuration option
}

type put_logging_configuration_request = {
  logging_configuration: logging_configuration
}

type list_xss_match_sets_response = {
  xss_match_sets: xss_match_set_summary list option;
  next_marker: string option
}

type list_xss_match_sets_request = {
  limit: int option;
  next_marker: string option
}

type list_web_ac_ls_response = {
  web_ac_ls: web_acl_summary list option;
  next_marker: string option
}

type list_web_ac_ls_request = {
  limit: int option;
  next_marker: string option
}

type list_tags_for_resource_response = {
  tag_info_for_resource: tag_info_for_resource option;
  next_marker: string option
}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  limit: int option;
  next_marker: string option
}

type list_subscribed_rule_groups_response = {
  rule_groups: subscribed_rule_group_summary list option;
  next_marker: string option
}

type list_subscribed_rule_groups_request = {
  limit: int option;
  next_marker: string option
}

type list_sql_injection_match_sets_response = {
  sql_injection_match_sets: sql_injection_match_set_summary list option;
  next_marker: string option
}

type list_sql_injection_match_sets_request = {
  limit: int option;
  next_marker: string option
}

type list_size_constraint_sets_response = {
  size_constraint_sets: size_constraint_set_summary list option;
  next_marker: string option
}

type list_size_constraint_sets_request = {
  limit: int option;
  next_marker: string option
}

type list_rules_response = {
  rules: rule_summary list option;
  next_marker: string option
}

type list_rules_request = {
  limit: int option;
  next_marker: string option
}

type list_rule_groups_response = {
  rule_groups: rule_group_summary list option;
  next_marker: string option
}

type list_rule_groups_request = {
  limit: int option;
  next_marker: string option
}

type list_regex_pattern_sets_response = {
  regex_pattern_sets: regex_pattern_set_summary list option;
  next_marker: string option
}

type list_regex_pattern_sets_request = {
  limit: int option;
  next_marker: string option
}

type list_regex_match_sets_response = {
  regex_match_sets: regex_match_set_summary list option;
  next_marker: string option
}

type list_regex_match_sets_request = {
  limit: int option;
  next_marker: string option
}

type list_rate_based_rules_response = {
  rules: rule_summary list option;
  next_marker: string option
}

type list_rate_based_rules_request = {
  limit: int option;
  next_marker: string option
}

type list_logging_configurations_response = {
  next_marker: string option;
  logging_configurations: logging_configuration list option
}

type list_logging_configurations_request = {
  limit: int option;
  next_marker: string option
}

type ip_set_summary = {
  name: string;
  ip_set_id: string
}

type list_ip_sets_response = {
  ip_sets: ip_set_summary list option;
  next_marker: string option
}

type list_ip_sets_request = {
  limit: int option;
  next_marker: string option
}

type geo_match_set_summary = {
  name: string;
  geo_match_set_id: string
}

type list_geo_match_sets_response = {
  geo_match_sets: geo_match_set_summary list option;
  next_marker: string option
}

type list_geo_match_sets_request = {
  limit: int option;
  next_marker: string option
}

type byte_match_set_summary = {
  name: string;
  byte_match_set_id: string
}

type list_byte_match_sets_response = {
  byte_match_sets: byte_match_set_summary list option;
  next_marker: string option
}

type list_byte_match_sets_request = {
  limit: int option;
  next_marker: string option
}

type list_activated_rules_in_rule_group_response = {
  activated_rules: activated_rule list option;
  next_marker: string option
}

type list_activated_rules_in_rule_group_request = {
  limit: int option;
  next_marker: string option;
  rule_group_id: string option
}

type ip_set = {
  ip_set_descriptors: ip_set_descriptor list;
  name: string option;
  ip_set_id: string
}

type get_xss_match_set_response = {
  xss_match_set: xss_match_set option
}

type get_xss_match_set_request = {
  xss_match_set_id: string
}

type get_web_acl_response = {
  web_ac_l: web_ac_l option
}

type get_web_acl_request = {
  web_acl_id: string
}

type get_sql_injection_match_set_response = {
  sql_injection_match_set: sql_injection_match_set option
}

type get_sql_injection_match_set_request = {
  sql_injection_match_set_id: string
}

type get_size_constraint_set_response = {
  size_constraint_set: size_constraint_set option
}

type get_size_constraint_set_request = {
  size_constraint_set_id: string
}

type get_sampled_requests_response = {
  time_window: time_window option;
  population_size: int option;
  sampled_requests: sampled_http_request list option
}

type get_sampled_requests_request = {
  max_items: int;
  time_window: time_window;
  rule_id: string;
  web_acl_id: string
}

type get_rule_response = {
  rule: rule option
}

type get_rule_request = {
  rule_id: string
}

type get_rule_group_response = {
  rule_group: rule_group option
}

type get_rule_group_request = {
  rule_group_id: string
}

type get_regex_pattern_set_response = {
  regex_pattern_set: regex_pattern_set option
}

type get_regex_pattern_set_request = {
  regex_pattern_set_id: string
}

type get_regex_match_set_response = {
  regex_match_set: regex_match_set option
}

type get_regex_match_set_request = {
  regex_match_set_id: string
}

type get_rate_based_rule_response = {
  rule: rate_based_rule option
}

type get_rate_based_rule_request = {
  rule_id: string
}

type get_rate_based_rule_managed_keys_response = {
  next_marker: string option;
  managed_keys: string list option
}

type get_rate_based_rule_managed_keys_request = {
  next_marker: string option;
  rule_id: string
}

type get_permission_policy_response = {
  policy: string option
}

type get_permission_policy_request = {
  resource_arn: string
}

type get_logging_configuration_response = {
  logging_configuration: logging_configuration option
}

type get_logging_configuration_request = {
  resource_arn: string
}

type get_ip_set_response = {
  ip_set: ip_set option
}

type get_ip_set_request = {
  ip_set_id: string
}

type geo_match_set = {
  geo_match_constraints: geo_match_constraint list;
  name: string option;
  geo_match_set_id: string
}

type get_geo_match_set_response = {
  geo_match_set: geo_match_set option
}

type get_geo_match_set_request = {
  geo_match_set_id: string
}

type change_token_status = | INSYNC
  | PENDING
  | PROVISIONED

type get_change_token_status_response = {
  change_token_status: change_token_status option
}

type get_change_token_status_request = {
  change_token: string
}

type get_change_token_response = {
  change_token: string option
}

type get_change_token_request = unit

type byte_match_set = {
  byte_match_tuples: byte_match_tuple list;
  name: string option;
  byte_match_set_id: string
}

type get_byte_match_set_response = {
  byte_match_set: byte_match_set option
}

type get_byte_match_set_request = {
  byte_match_set_id: string
}

type delete_xss_match_set_response = {
  change_token: string option
}

type delete_xss_match_set_request = {
  change_token: string;
  xss_match_set_id: string
}

type delete_web_acl_response = {
  change_token: string option
}

type delete_web_acl_request = {
  change_token: string;
  web_acl_id: string
}

type delete_sql_injection_match_set_response = {
  change_token: string option
}

type delete_sql_injection_match_set_request = {
  change_token: string;
  sql_injection_match_set_id: string
}

type delete_size_constraint_set_response = {
  change_token: string option
}

type delete_size_constraint_set_request = {
  change_token: string;
  size_constraint_set_id: string
}

type delete_rule_response = {
  change_token: string option
}

type delete_rule_request = {
  change_token: string;
  rule_id: string
}

type delete_rule_group_response = {
  change_token: string option
}

type delete_rule_group_request = {
  change_token: string;
  rule_group_id: string
}

type delete_regex_pattern_set_response = {
  change_token: string option
}

type delete_regex_pattern_set_request = {
  change_token: string;
  regex_pattern_set_id: string
}

type delete_regex_match_set_response = {
  change_token: string option
}

type delete_regex_match_set_request = {
  change_token: string;
  regex_match_set_id: string
}

type delete_rate_based_rule_response = {
  change_token: string option
}

type delete_rate_based_rule_request = {
  change_token: string;
  rule_id: string
}

type delete_permission_policy_response = unit

type delete_permission_policy_request = {
  resource_arn: string
}

type delete_logging_configuration_response = unit

type delete_logging_configuration_request = {
  resource_arn: string
}

type delete_ip_set_response = {
  change_token: string option
}

type delete_ip_set_request = {
  change_token: string;
  ip_set_id: string
}

type delete_geo_match_set_response = {
  change_token: string option
}

type delete_geo_match_set_request = {
  change_token: string;
  geo_match_set_id: string
}

type delete_byte_match_set_response = {
  change_token: string option
}

type delete_byte_match_set_request = {
  change_token: string;
  byte_match_set_id: string
}

type create_xss_match_set_response = {
  change_token: string option;
  xss_match_set: xss_match_set option
}

type create_xss_match_set_request = {
  change_token: string;
  name: string
}

type create_web_acl_response = {
  change_token: string option;
  web_ac_l: web_ac_l option
}

type create_web_acl_request = {
  tags: tag list option;
  change_token: string;
  default_action: waf_action;
  metric_name: string;
  name: string
}

type create_web_acl_migration_stack_response = {
  s3_object_url: string
}

type create_web_acl_migration_stack_request = {
  ignore_unsupported_type: bool;
  s3_bucket_name: string;
  web_acl_id: string
}

type create_sql_injection_match_set_response = {
  change_token: string option;
  sql_injection_match_set: sql_injection_match_set option
}

type create_sql_injection_match_set_request = {
  change_token: string;
  name: string
}

type create_size_constraint_set_response = {
  change_token: string option;
  size_constraint_set: size_constraint_set option
}

type create_size_constraint_set_request = {
  change_token: string;
  name: string
}

type create_rule_response = {
  change_token: string option;
  rule: rule option
}

type create_rule_request = {
  tags: tag list option;
  change_token: string;
  metric_name: string;
  name: string
}

type create_rule_group_response = {
  change_token: string option;
  rule_group: rule_group option
}

type create_rule_group_request = {
  tags: tag list option;
  change_token: string;
  metric_name: string;
  name: string
}

type create_regex_pattern_set_response = {
  change_token: string option;
  regex_pattern_set: regex_pattern_set option
}

type create_regex_pattern_set_request = {
  change_token: string;
  name: string
}

type create_regex_match_set_response = {
  change_token: string option;
  regex_match_set: regex_match_set option
}

type create_regex_match_set_request = {
  change_token: string;
  name: string
}

type create_rate_based_rule_response = {
  change_token: string option;
  rule: rate_based_rule option
}

type create_rate_based_rule_request = {
  tags: tag list option;
  change_token: string;
  rate_limit: int;
  rate_key: rate_key;
  metric_name: string;
  name: string
}

type create_ip_set_response = {
  change_token: string option;
  ip_set: ip_set option
}

type create_ip_set_request = {
  change_token: string;
  name: string
}

type create_geo_match_set_response = {
  change_token: string option;
  geo_match_set: geo_match_set option
}

type create_geo_match_set_request = {
  change_token: string;
  name: string
}

type create_byte_match_set_response = {
  change_token: string option;
  byte_match_set: byte_match_set option
}

type create_byte_match_set_request = {
  change_token: string;
  name: string
}



type base_document = Json.t

val make_field_to_match :
  ?data:string -> type_:match_field_type -> unit
-> field_to_match

val make_xss_match_tuple :
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit -> xss_match_tuple

val make_xss_match_set_update :
  xss_match_tuple:xss_match_tuple -> action:change_action -> unit
-> xss_match_set_update

val make_xss_match_set_summary :
  name:string -> xss_match_set_id:string -> unit
-> xss_match_set_summary

val make_xss_match_set :
  ?name:string ->
  xss_match_tuples:xss_match_tuple list ->
  xss_match_set_id:string ->
  unit -> xss_match_set

val make_waf_action : type_:waf_action_type -> unit
-> waf_action

val make_waf_override_action : type_:waf_override_action_type -> unit
-> waf_override_action

val make_excluded_rule : rule_id:string -> unit
-> excluded_rule

val make_activated_rule :
  ?excluded_rules:excluded_rule list ->
  ?type_:waf_rule_type ->
  ?override_action:waf_override_action ->
  ?action:waf_action ->
  rule_id:string ->
  priority:int ->
  unit -> activated_rule

val make_web_acl_update :
  activated_rule:activated_rule -> action:change_action -> unit
-> web_acl_update

val make_web_acl_summary : name:string -> web_acl_id:string -> unit
-> web_acl_summary

val make_web_ac_l :
  ?web_acl_arn:string ->
  ?metric_name:string ->
  ?name:string ->
  rules:activated_rule list ->
  default_action:waf_action ->
  web_acl_id:string ->
  unit -> web_ac_l

val make_update_xss_match_set_response : ?change_token:string -> unit
-> update_xss_match_set_response

val make_update_xss_match_set_request :
  updates:xss_match_set_update list ->
  change_token:string ->
  xss_match_set_id:string ->
  unit -> update_xss_match_set_request

val make_update_web_acl_response : ?change_token:string -> unit
-> update_web_acl_response

val make_update_web_acl_request :
  ?default_action:waf_action ->
  ?updates:web_acl_update list ->
  change_token:string ->
  web_acl_id:string ->
  unit
-> update_web_acl_request

val make_update_sql_injection_match_set_response :
  ?change_token:string -> unit
-> update_sql_injection_match_set_response

val make_sql_injection_match_tuple :
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit -> sql_injection_match_tuple

val make_sql_injection_match_set_update :
  sql_injection_match_tuple:sql_injection_match_tuple ->
  action:change_action ->
  unit
-> sql_injection_match_set_update

val make_update_sql_injection_match_set_request :
  updates:sql_injection_match_set_update list ->
  change_token:string ->
  sql_injection_match_set_id:string ->
  unit
-> update_sql_injection_match_set_request

val make_update_size_constraint_set_response : ?change_token:string -> unit
-> update_size_constraint_set_response

val make_size_constraint :
  size:int ->
  comparison_operator:comparison_operator ->
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit -> size_constraint

val make_size_constraint_set_update :
  size_constraint:size_constraint -> action:change_action -> unit
-> size_constraint_set_update

val make_update_size_constraint_set_request :
  updates:size_constraint_set_update list ->
  change_token:string ->
  size_constraint_set_id:string ->
  unit -> update_size_constraint_set_request

val make_update_rule_response : ?change_token:string -> unit
-> update_rule_response

val make_predicate :
  data_id:string -> type_:predicate_type -> negated:bool -> unit
-> predicate

val make_rule_update : predicate:predicate -> action:change_action -> unit
-> rule_update

val make_update_rule_request :
  updates:rule_update list -> change_token:string -> rule_id:string -> unit
-> update_rule_request

val make_update_rule_group_response : ?change_token:string -> unit
-> update_rule_group_response

val make_rule_group_update :
  activated_rule:activated_rule -> action:change_action -> unit
-> rule_group_update

val make_update_rule_group_request :
  change_token:string ->
  updates:rule_group_update list ->
  rule_group_id:string ->
  unit
-> update_rule_group_request

val make_update_regex_pattern_set_response : ?change_token:string -> unit
-> update_regex_pattern_set_response

val make_regex_pattern_set_update :
  regex_pattern_string:string -> action:change_action -> unit
-> regex_pattern_set_update

val make_update_regex_pattern_set_request :
  change_token:string ->
  updates:regex_pattern_set_update list ->
  regex_pattern_set_id:string ->
  unit
-> update_regex_pattern_set_request

val make_update_regex_match_set_response : ?change_token:string -> unit
-> update_regex_match_set_response

val make_regex_match_tuple :
  regex_pattern_set_id:string ->
  text_transformation:text_transformation ->
  field_to_match:field_to_match ->
  unit -> regex_match_tuple

val make_regex_match_set_update :
  regex_match_tuple:regex_match_tuple -> action:change_action -> unit
-> regex_match_set_update

val make_update_regex_match_set_request :
  change_token:string ->
  updates:regex_match_set_update list ->
  regex_match_set_id:string ->
  unit
-> update_regex_match_set_request

val make_update_rate_based_rule_response : ?change_token:string -> unit
-> update_rate_based_rule_response

val make_update_rate_based_rule_request :
  rate_limit:int ->
  updates:rule_update list ->
  change_token:string ->
  rule_id:string ->
  unit -> update_rate_based_rule_request

val make_update_ip_set_response : ?change_token:string -> unit
-> update_ip_set_response

val make_ip_set_descriptor :
  value:string -> type_:ip_set_descriptor_type -> unit
-> ip_set_descriptor

val make_ip_set_update :
  ip_set_descriptor:ip_set_descriptor -> action:change_action -> unit
-> ip_set_update

val make_update_ip_set_request :
  updates:ip_set_update list ->
  change_token:string ->
  ip_set_id:string ->
  unit -> update_ip_set_request

val make_update_geo_match_set_response : ?change_token:string -> unit
-> update_geo_match_set_response

val make_geo_match_constraint :
  value:geo_match_constraint_value -> type_:geo_match_constraint_type -> unit
-> geo_match_constraint

val make_geo_match_set_update :
  geo_match_constraint:geo_match_constraint -> action:change_action -> unit
-> geo_match_set_update

val make_update_geo_match_set_request :
  updates:geo_match_set_update list ->
  change_token:string ->
  geo_match_set_id:string ->
  unit
-> update_geo_match_set_request

val make_update_byte_match_set_response : ?change_token:string -> unit
-> update_byte_match_set_response

val make_byte_match_tuple :
  positional_constraint:positional_constraint ->
  text_transformation:text_transformation ->
  target_string:bytes ->
  field_to_match:field_to_match ->
  unit -> byte_match_tuple

val make_byte_match_set_update :
  byte_match_tuple:byte_match_tuple -> action:change_action -> unit
-> byte_match_set_update

val make_update_byte_match_set_request :
  updates:byte_match_set_update list ->
  change_token:string ->
  byte_match_set_id:string ->
  unit -> update_byte_match_set_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request

val make_time_window : end_time:float -> start_time:float -> unit
-> time_window

val make_tag_resource_response : unit -> tag_resource_response

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request

val make_tag_info_for_resource :
  ?tag_list:tag list -> ?resource_ar_n:string -> unit
-> tag_info_for_resource

val make_subscribed_rule_group_summary :
  metric_name:string -> name:string -> rule_group_id:string -> unit
-> subscribed_rule_group_summary

val make_sql_injection_match_set_summary :
  name:string -> sql_injection_match_set_id:string -> unit
-> sql_injection_match_set_summary

val make_sql_injection_match_set :
  ?name:string ->
  sql_injection_match_tuples:sql_injection_match_tuple list ->
  sql_injection_match_set_id:string ->
  unit -> sql_injection_match_set

val make_size_constraint_set_summary :
  name:string -> size_constraint_set_id:string -> unit
-> size_constraint_set_summary

val make_size_constraint_set :
  ?name:string ->
  size_constraints:size_constraint list ->
  size_constraint_set_id:string ->
  unit -> size_constraint_set

val make_http_header : ?value:string -> ?name:string -> unit
-> http_header

val make_http_request :
  ?headers:http_header list ->
  ?http_version:string ->
  ?method_:string ->
  ?ur_i:string ->
  ?country:string ->
  ?client_i_p:string ->
  unit -> http_request

val make_sampled_http_request :
  ?rule_within_rule_group:string ->
  ?action:string ->
  ?timestamp_:float ->
  weight:int ->
  request:http_request ->
  unit -> sampled_http_request

val make_rule_summary : name:string -> rule_id:string -> unit
-> rule_summary

val make_rule_group_summary : name:string -> rule_group_id:string -> unit
-> rule_group_summary

val make_rule_group :
  ?metric_name:string -> ?name:string -> rule_group_id:string -> unit
-> rule_group

val make_rule :
  ?metric_name:string ->
  ?name:string ->
  predicates:predicate list ->
  rule_id:string ->
  unit -> rule

val make_regex_pattern_set_summary :
  name:string -> regex_pattern_set_id:string -> unit
-> regex_pattern_set_summary

val make_regex_pattern_set :
  ?name:string ->
  regex_pattern_strings:string list ->
  regex_pattern_set_id:string ->
  unit -> regex_pattern_set

val make_regex_match_set_summary :
  name:string -> regex_match_set_id:string -> unit
-> regex_match_set_summary

val make_regex_match_set :
  ?regex_match_tuples:regex_match_tuple list ->
  ?name:string ->
  ?regex_match_set_id:string ->
  unit -> regex_match_set

val make_rate_based_rule :
  ?metric_name:string ->
  ?name:string ->
  rate_limit:int ->
  rate_key:rate_key ->
  match_predicates:predicate list ->
  rule_id:string ->
  unit -> rate_based_rule

val make_put_permission_policy_response : unit
-> put_permission_policy_response

val make_put_permission_policy_request :
  policy:string -> resource_arn:string -> unit
-> put_permission_policy_request

val make_logging_configuration :
  ?redacted_fields:field_to_match list ->
  log_destination_configs:string list ->
  resource_arn:string ->
  unit -> logging_configuration

val make_put_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit
-> put_logging_configuration_response

val make_put_logging_configuration_request :
  logging_configuration:logging_configuration -> unit
-> put_logging_configuration_request

val make_list_xss_match_sets_response :
  ?xss_match_sets:xss_match_set_summary list -> ?next_marker:string -> unit
-> list_xss_match_sets_response

val make_list_xss_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_xss_match_sets_request

val make_list_web_ac_ls_response :
  ?web_ac_ls:web_acl_summary list -> ?next_marker:string -> unit
-> list_web_ac_ls_response

val make_list_web_ac_ls_request : ?limit:int -> ?next_marker:string -> unit
-> list_web_ac_ls_request

val make_list_tags_for_resource_response :
  ?tag_info_for_resource:tag_info_for_resource -> ?next_marker:string -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?limit:int -> ?next_marker:string -> resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_list_subscribed_rule_groups_response :
  ?rule_groups:subscribed_rule_group_summary list ->
  ?next_marker:string ->
  unit
-> list_subscribed_rule_groups_response

val make_list_subscribed_rule_groups_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_subscribed_rule_groups_request

val make_list_sql_injection_match_sets_response :
  ?sql_injection_match_sets:sql_injection_match_set_summary list ->
  ?next_marker:string ->
  unit
-> list_sql_injection_match_sets_response

val make_list_sql_injection_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_sql_injection_match_sets_request

val make_list_size_constraint_sets_response :
  ?size_constraint_sets:size_constraint_set_summary list ->
  ?next_marker:string ->
  unit
-> list_size_constraint_sets_response

val make_list_size_constraint_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_size_constraint_sets_request

val make_list_rules_response :
  ?rules:rule_summary list -> ?next_marker:string -> unit
-> list_rules_response

val make_list_rules_request : ?limit:int -> ?next_marker:string -> unit
-> list_rules_request

val make_list_rule_groups_response :
  ?rule_groups:rule_group_summary list -> ?next_marker:string -> unit
-> list_rule_groups_response

val make_list_rule_groups_request : ?limit:int -> ?next_marker:string -> unit
-> list_rule_groups_request

val make_list_regex_pattern_sets_response :
  ?regex_pattern_sets:regex_pattern_set_summary list ->
  ?next_marker:string ->
  unit
-> list_regex_pattern_sets_response

val make_list_regex_pattern_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_regex_pattern_sets_request

val make_list_regex_match_sets_response :
  ?regex_match_sets:regex_match_set_summary list ->
  ?next_marker:string ->
  unit
-> list_regex_match_sets_response

val make_list_regex_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_regex_match_sets_request

val make_list_rate_based_rules_response :
  ?rules:rule_summary list -> ?next_marker:string -> unit
-> list_rate_based_rules_response

val make_list_rate_based_rules_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_rate_based_rules_request

val make_list_logging_configurations_response :
  ?next_marker:string ->
  ?logging_configurations:logging_configuration list ->
  unit
-> list_logging_configurations_response

val make_list_logging_configurations_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_logging_configurations_request

val make_ip_set_summary : name:string -> ip_set_id:string -> unit
-> ip_set_summary

val make_list_ip_sets_response :
  ?ip_sets:ip_set_summary list -> ?next_marker:string -> unit
-> list_ip_sets_response

val make_list_ip_sets_request : ?limit:int -> ?next_marker:string -> unit
-> list_ip_sets_request

val make_geo_match_set_summary :
  name:string -> geo_match_set_id:string -> unit
-> geo_match_set_summary

val make_list_geo_match_sets_response :
  ?geo_match_sets:geo_match_set_summary list -> ?next_marker:string -> unit
-> list_geo_match_sets_response

val make_list_geo_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_geo_match_sets_request

val make_byte_match_set_summary :
  name:string -> byte_match_set_id:string -> unit
-> byte_match_set_summary

val make_list_byte_match_sets_response :
  ?byte_match_sets:byte_match_set_summary list -> ?next_marker:string -> unit
-> list_byte_match_sets_response

val make_list_byte_match_sets_request :
  ?limit:int -> ?next_marker:string -> unit
-> list_byte_match_sets_request

val make_list_activated_rules_in_rule_group_response :
  ?activated_rules:activated_rule list -> ?next_marker:string -> unit
-> list_activated_rules_in_rule_group_response

val make_list_activated_rules_in_rule_group_request :
  ?limit:int -> ?next_marker:string -> ?rule_group_id:string -> unit
-> list_activated_rules_in_rule_group_request

val make_ip_set :
  ?name:string ->
  ip_set_descriptors:ip_set_descriptor list ->
  ip_set_id:string ->
  unit -> ip_set

val make_get_xss_match_set_response : ?xss_match_set:xss_match_set -> unit
-> get_xss_match_set_response

val make_get_xss_match_set_request : xss_match_set_id:string -> unit
-> get_xss_match_set_request

val make_get_web_acl_response : ?web_ac_l:web_ac_l -> unit
-> get_web_acl_response

val make_get_web_acl_request : web_acl_id:string -> unit
-> get_web_acl_request

val make_get_sql_injection_match_set_response :
  ?sql_injection_match_set:sql_injection_match_set -> unit
-> get_sql_injection_match_set_response

val make_get_sql_injection_match_set_request :
  sql_injection_match_set_id:string -> unit
-> get_sql_injection_match_set_request

val make_get_size_constraint_set_response :
  ?size_constraint_set:size_constraint_set -> unit
-> get_size_constraint_set_response

val make_get_size_constraint_set_request :
  size_constraint_set_id:string -> unit
-> get_size_constraint_set_request

val make_get_sampled_requests_response :
  ?time_window:time_window ->
  ?population_size:int ->
  ?sampled_requests:sampled_http_request list ->
  unit
-> get_sampled_requests_response

val make_get_sampled_requests_request :
  max_items:int ->
  time_window:time_window ->
  rule_id:string ->
  web_acl_id:string ->
  unit -> get_sampled_requests_request

val make_get_rule_response : ?rule:rule -> unit
-> get_rule_response

val make_get_rule_request : rule_id:string -> unit
-> get_rule_request

val make_get_rule_group_response : ?rule_group:rule_group -> unit
-> get_rule_group_response

val make_get_rule_group_request : rule_group_id:string -> unit
-> get_rule_group_request

val make_get_regex_pattern_set_response :
  ?regex_pattern_set:regex_pattern_set -> unit
-> get_regex_pattern_set_response

val make_get_regex_pattern_set_request : regex_pattern_set_id:string -> unit
-> get_regex_pattern_set_request

val make_get_regex_match_set_response :
  ?regex_match_set:regex_match_set -> unit
-> get_regex_match_set_response

val make_get_regex_match_set_request : regex_match_set_id:string -> unit
-> get_regex_match_set_request

val make_get_rate_based_rule_response : ?rule:rate_based_rule -> unit
-> get_rate_based_rule_response

val make_get_rate_based_rule_request : rule_id:string -> unit
-> get_rate_based_rule_request

val make_get_rate_based_rule_managed_keys_response :
  ?next_marker:string -> ?managed_keys:string list -> unit
-> get_rate_based_rule_managed_keys_response

val make_get_rate_based_rule_managed_keys_request :
  ?next_marker:string -> rule_id:string -> unit
-> get_rate_based_rule_managed_keys_request

val make_get_permission_policy_response : ?policy:string -> unit
-> get_permission_policy_response

val make_get_permission_policy_request : resource_arn:string -> unit
-> get_permission_policy_request

val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit
-> get_logging_configuration_response

val make_get_logging_configuration_request : resource_arn:string -> unit
-> get_logging_configuration_request

val make_get_ip_set_response : ?ip_set:ip_set -> unit
-> get_ip_set_response

val make_get_ip_set_request : ip_set_id:string -> unit
-> get_ip_set_request

val make_geo_match_set :
  ?name:string ->
  geo_match_constraints:geo_match_constraint list ->
  geo_match_set_id:string ->
  unit -> geo_match_set

val make_get_geo_match_set_response : ?geo_match_set:geo_match_set -> unit
-> get_geo_match_set_response

val make_get_geo_match_set_request : geo_match_set_id:string -> unit
-> get_geo_match_set_request

val make_get_change_token_status_response :
  ?change_token_status:change_token_status -> unit
-> get_change_token_status_response

val make_get_change_token_status_request : change_token:string -> unit
-> get_change_token_status_request

val make_get_change_token_response : ?change_token:string -> unit
-> get_change_token_response

val make_get_change_token_request : unit
-> get_change_token_request

val make_byte_match_set :
  ?name:string ->
  byte_match_tuples:byte_match_tuple list ->
  byte_match_set_id:string ->
  unit -> byte_match_set

val make_get_byte_match_set_response : ?byte_match_set:byte_match_set -> unit
-> get_byte_match_set_response

val make_get_byte_match_set_request : byte_match_set_id:string -> unit
-> get_byte_match_set_request

val make_delete_xss_match_set_response : ?change_token:string -> unit
-> delete_xss_match_set_response

val make_delete_xss_match_set_request :
  change_token:string -> xss_match_set_id:string -> unit
-> delete_xss_match_set_request

val make_delete_web_acl_response : ?change_token:string -> unit
-> delete_web_acl_response

val make_delete_web_acl_request :
  change_token:string -> web_acl_id:string -> unit
-> delete_web_acl_request

val make_delete_sql_injection_match_set_response :
  ?change_token:string -> unit
-> delete_sql_injection_match_set_response

val make_delete_sql_injection_match_set_request :
  change_token:string -> sql_injection_match_set_id:string -> unit
-> delete_sql_injection_match_set_request

val make_delete_size_constraint_set_response : ?change_token:string -> unit
-> delete_size_constraint_set_response

val make_delete_size_constraint_set_request :
  change_token:string -> size_constraint_set_id:string -> unit
-> delete_size_constraint_set_request

val make_delete_rule_response : ?change_token:string -> unit
-> delete_rule_response

val make_delete_rule_request : change_token:string -> rule_id:string -> unit
-> delete_rule_request

val make_delete_rule_group_response : ?change_token:string -> unit
-> delete_rule_group_response

val make_delete_rule_group_request :
  change_token:string -> rule_group_id:string -> unit
-> delete_rule_group_request

val make_delete_regex_pattern_set_response : ?change_token:string -> unit
-> delete_regex_pattern_set_response

val make_delete_regex_pattern_set_request :
  change_token:string -> regex_pattern_set_id:string -> unit
-> delete_regex_pattern_set_request

val make_delete_regex_match_set_response : ?change_token:string -> unit
-> delete_regex_match_set_response

val make_delete_regex_match_set_request :
  change_token:string -> regex_match_set_id:string -> unit
-> delete_regex_match_set_request

val make_delete_rate_based_rule_response : ?change_token:string -> unit
-> delete_rate_based_rule_response

val make_delete_rate_based_rule_request :
  change_token:string -> rule_id:string -> unit
-> delete_rate_based_rule_request

val make_delete_permission_policy_response : unit
-> delete_permission_policy_response

val make_delete_permission_policy_request : resource_arn:string -> unit
-> delete_permission_policy_request

val make_delete_logging_configuration_response : unit
-> delete_logging_configuration_response

val make_delete_logging_configuration_request : resource_arn:string -> unit
-> delete_logging_configuration_request

val make_delete_ip_set_response : ?change_token:string -> unit
-> delete_ip_set_response

val make_delete_ip_set_request :
  change_token:string -> ip_set_id:string -> unit
-> delete_ip_set_request

val make_delete_geo_match_set_response : ?change_token:string -> unit
-> delete_geo_match_set_response

val make_delete_geo_match_set_request :
  change_token:string -> geo_match_set_id:string -> unit
-> delete_geo_match_set_request

val make_delete_byte_match_set_response : ?change_token:string -> unit
-> delete_byte_match_set_response

val make_delete_byte_match_set_request :
  change_token:string -> byte_match_set_id:string -> unit
-> delete_byte_match_set_request

val make_create_xss_match_set_response :
  ?change_token:string -> ?xss_match_set:xss_match_set -> unit
-> create_xss_match_set_response

val make_create_xss_match_set_request :
  change_token:string -> name:string -> unit
-> create_xss_match_set_request

val make_create_web_acl_response :
  ?change_token:string -> ?web_ac_l:web_ac_l -> unit
-> create_web_acl_response

val make_create_web_acl_request :
  ?tags:tag list ->
  change_token:string ->
  default_action:waf_action ->
  metric_name:string ->
  name:string ->
  unit
-> create_web_acl_request

val make_create_web_acl_migration_stack_response :
  s3_object_url:string -> unit
-> create_web_acl_migration_stack_response

val make_create_web_acl_migration_stack_request :
  ignore_unsupported_type:bool ->
  s3_bucket_name:string ->
  web_acl_id:string ->
  unit
-> create_web_acl_migration_stack_request

val make_create_sql_injection_match_set_response :
  ?change_token:string ->
  ?sql_injection_match_set:sql_injection_match_set ->
  unit
-> create_sql_injection_match_set_response

val make_create_sql_injection_match_set_request :
  change_token:string -> name:string -> unit
-> create_sql_injection_match_set_request

val make_create_size_constraint_set_response :
  ?change_token:string -> ?size_constraint_set:size_constraint_set -> unit
-> create_size_constraint_set_response

val make_create_size_constraint_set_request :
  change_token:string -> name:string -> unit
-> create_size_constraint_set_request

val make_create_rule_response : ?change_token:string -> ?rule:rule -> unit
-> create_rule_response

val make_create_rule_request :
  ?tags:tag list ->
  change_token:string ->
  metric_name:string ->
  name:string ->
  unit -> create_rule_request

val make_create_rule_group_response :
  ?change_token:string -> ?rule_group:rule_group -> unit
-> create_rule_group_response

val make_create_rule_group_request :
  ?tags:tag list ->
  change_token:string ->
  metric_name:string ->
  name:string ->
  unit
-> create_rule_group_request

val make_create_regex_pattern_set_response :
  ?change_token:string -> ?regex_pattern_set:regex_pattern_set -> unit
-> create_regex_pattern_set_response

val make_create_regex_pattern_set_request :
  change_token:string -> name:string -> unit
-> create_regex_pattern_set_request

val make_create_regex_match_set_response :
  ?change_token:string -> ?regex_match_set:regex_match_set -> unit
-> create_regex_match_set_response

val make_create_regex_match_set_request :
  change_token:string -> name:string -> unit
-> create_regex_match_set_request

val make_create_rate_based_rule_response :
  ?change_token:string -> ?rule:rate_based_rule -> unit
-> create_rate_based_rule_response

val make_create_rate_based_rule_request :
  ?tags:tag list ->
  change_token:string ->
  rate_limit:int ->
  rate_key:rate_key ->
  metric_name:string ->
  name:string ->
  unit -> create_rate_based_rule_request

val make_create_ip_set_response :
  ?change_token:string -> ?ip_set:ip_set -> unit
-> create_ip_set_response

val make_create_ip_set_request : change_token:string -> name:string -> unit
-> create_ip_set_request

val make_create_geo_match_set_response :
  ?change_token:string -> ?geo_match_set:geo_match_set -> unit
-> create_geo_match_set_response

val make_create_geo_match_set_request :
  change_token:string -> name:string -> unit
-> create_geo_match_set_request

val make_create_byte_match_set_response :
  ?change_token:string -> ?byte_match_set:byte_match_set -> unit
-> create_byte_match_set_response

val make_create_byte_match_set_request :
  change_token:string -> name:string -> unit
-> create_byte_match_set_request

module UpdateXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_xss_match_set_request ->
        (update_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      update_web_acl_request ->
        (update_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            
        ]
      ) result
end

module UpdateSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sql_injection_match_set_request ->
        (update_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_size_constraint_set_request ->
        (update_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_group_request ->
        (update_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_request ->
        (update_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_pattern_set_request ->
        (update_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidRegexPatternException of waf_invalid_regex_pattern_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_match_set_request ->
        (update_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rate_based_rule_request ->
        (update_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ip_set_request ->
        (update_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_geo_match_set_request ->
        (update_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UpdateByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_byte_match_set_request ->
        (update_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentContainerException of waf_nonexistent_container_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module PutPermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_policy_request ->
        (put_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidPermissionPolicyException of waf_invalid_permission_policy_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module PutLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_logging_configuration_request ->
        (put_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFServiceLinkedRoleErrorException of waf_service_linked_role_error_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module ListXssMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_xss_match_sets_request ->
        (list_xss_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListWebACLs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_web_ac_ls_request ->
        (list_web_ac_ls_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module ListSubscribedRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_subscribed_rule_groups_request ->
        (list_subscribed_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module ListSqlInjectionMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_sql_injection_match_sets_request ->
        (list_sql_injection_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListSizeConstraintSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_size_constraint_sets_request ->
        (list_size_constraint_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rules_request ->
        (list_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_groups_request ->
        (list_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            
        ]
      ) result
end

module ListRegexPatternSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_pattern_sets_request ->
        (list_regex_pattern_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListRegexMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_match_sets_request ->
        (list_regex_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListRateBasedRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_rate_based_rules_request ->
        (list_rate_based_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListLoggingConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_logging_configurations_request ->
        (list_logging_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module ListIPSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_sets_request ->
        (list_ip_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListGeoMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_geo_match_sets_request ->
        (list_geo_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListByteMatchSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_byte_match_sets_request ->
        (list_byte_match_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            
        ]
      ) result
end

module ListActivatedRulesInRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      list_activated_rules_in_rule_group_request ->
        (list_activated_rules_in_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_xss_match_set_request ->
        (get_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_request ->
        (get_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sql_injection_match_set_request ->
        (get_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_size_constraint_set_request ->
        (get_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetSampledRequests : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sampled_requests_request ->
        (get_sampled_requests_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_group_request ->
        (get_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_request ->
        (get_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_pattern_set_request ->
        (get_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_match_set_request ->
        (get_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRateBasedRuleManagedKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_rule_managed_keys_request ->
        (get_rate_based_rule_managed_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_rule_request ->
        (get_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetPermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_permission_policy_request ->
        (get_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      get_logging_configuration_request ->
        (get_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ip_set_request ->
        (get_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_geo_match_set_request ->
        (get_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetChangeTokenStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_change_token_status_request ->
        (get_change_token_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetChangeToken : sig
  val request :
    Smaws_Lib.Context.t ->
      get_change_token_request ->
        (get_change_token_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            
        ]
      ) result
end

module GetByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_byte_match_set_request ->
        (get_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module DeleteXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_xss_match_set_request ->
        (delete_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_web_acl_request ->
        (delete_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_sql_injection_match_set_request ->
        (delete_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_size_constraint_set_request ->
        (delete_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_group_request ->
        (delete_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_request ->
        (delete_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_pattern_set_request ->
        (delete_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_match_set_request ->
        (delete_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rate_based_rule_request ->
        (delete_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeletePermissionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_permission_policy_request ->
        (delete_permission_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteLoggingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_logging_configuration_request ->
        (delete_logging_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ip_set_request ->
        (delete_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_geo_match_set_request ->
        (delete_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module DeleteByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_byte_match_set_request ->
        (delete_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFNonEmptyEntityException of waf_non_empty_entity_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFReferencedItemException of waf_referenced_item_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateXssMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_xss_match_set_request ->
        (create_xss_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateWebACLMigrationStack : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_migration_stack_request ->
        (create_web_acl_migration_stack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFEntityMigrationException of waf_entity_migration_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module CreateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_request ->
        (create_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateSqlInjectionMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_sql_injection_match_set_request ->
        (create_sql_injection_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateSizeConstraintSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_size_constraint_set_request ->
        (create_size_constraint_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_group_request ->
        (create_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_request ->
        (create_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_pattern_set_request ->
        (create_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateRegexMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_match_set_request ->
        (create_regex_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateRateBasedRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rate_based_rule_request ->
        (create_rate_based_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFBadRequestException of waf_bad_request_exception
            | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_ip_set_request ->
        (create_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateGeoMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_geo_match_set_request ->
        (create_geo_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

module CreateByteMatchSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_byte_match_set_request ->
        (create_byte_match_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDisallowedNameException of waf_disallowed_name_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidAccountException of waf_invalid_account_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFStaleDataException of waf_stale_data_exception
            
        ]
      ) result
end

