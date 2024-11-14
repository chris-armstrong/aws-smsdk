open Smaws_Lib
val service : Service.descriptor

type single_header = {
  name: string
}

type single_query_argument = {
  name: string
}

type all_query_arguments = unit

type uri_path = unit

type query_string = unit

type oversize_handling = | NO_MATCH
  | MATCH
  | CONTINUE

type body = {
  oversize_handling: oversize_handling option
}

type method_ = unit

type all = unit

type json_match_pattern = {
  included_paths: string list option;
  all: all option
}

type json_match_scope = | VALUE
  | KEY
  | ALL

type body_parsing_fallback_behavior = | EVALUATE_AS_STRING
  | NO_MATCH
  | MATCH

type json_body = {
  oversize_handling: oversize_handling option;
  invalid_fallback_behavior: body_parsing_fallback_behavior option;
  match_scope: json_match_scope;
  match_pattern: json_match_pattern
}

type header_match_pattern = {
  excluded_headers: string list option;
  included_headers: string list option;
  all: all option
}

type map_match_scope = | VALUE
  | KEY
  | ALL

type headers = {
  oversize_handling: oversize_handling;
  match_scope: map_match_scope;
  match_pattern: header_match_pattern
}

type cookie_match_pattern = {
  excluded_cookies: string list option;
  included_cookies: string list option;
  all: all option
}

type cookies = {
  oversize_handling: oversize_handling;
  match_scope: map_match_scope;
  match_pattern: cookie_match_pattern
}

type header_order = {
  oversize_handling: oversize_handling
}

type fallback_behavior = | NO_MATCH
  | MATCH

type ja3_fingerprint = {
  fallback_behavior: fallback_behavior
}

type field_to_match = {
  ja3_fingerprint: ja3_fingerprint option;
  header_order: header_order option;
  cookies: cookies option;
  headers: headers option;
  json_body: json_body option;
  method_: method_ option;
  body: body option;
  query_string: query_string option;
  uri_path: uri_path option;
  all_query_arguments: all_query_arguments option;
  single_query_argument: single_query_argument option;
  single_header: single_header option
}

type text_transformation_type = | UTF8_TO_UNICODE
  | URL_DECODE_UNI
  | BASE64_DECODE_EXT
  | REPLACE_NULLS
  | REMOVE_NULLS
  | NORMALIZE_PATH_WIN
  | NORMALIZE_PATH
  | JS_DECODE
  | CSS_DECODE
  | SQL_HEX_DECODE
  | ESCAPE_SEQ_DECODE
  | REPLACE_COMMENTS
  | MD5
  | HEX_DECODE
  | BASE64_DECODE
  | URL_DECODE
  | CMD_LINE
  | LOWERCASE
  | HTML_ENTITY_DECODE
  | COMPRESS_WHITE_SPACE
  | NONE

type text_transformation = {
  type_: text_transformation_type;
  priority: int
}

type xss_match_statement = {
  text_transformations: text_transformation list;
  field_to_match: field_to_match
}

type web_acl_summary = {
  ar_n: string option;
  lock_token: string option;
  description: string option;
  id: string option;
  name: string option
}

type custom_http_header = {
  value: string;
  name: string
}

type custom_response = {
  response_headers: custom_http_header list option;
  custom_response_body_key: string option;
  response_code: int
}

type block_action = {
  custom_response: custom_response option
}

type custom_request_handling = {
  insert_headers: custom_http_header list
}

type allow_action = {
  custom_request_handling: custom_request_handling option
}

type default_action = {
  allow: allow_action option;
  block: block_action option
}

type positional_constraint = | CONTAINS_WORD
  | CONTAINS
  | ENDS_WITH
  | STARTS_WITH
  | EXACTLY

type byte_match_statement = {
  positional_constraint: positional_constraint;
  text_transformations: text_transformation list;
  field_to_match: field_to_match;
  search_string: bytes
}

type sensitivity_level = | HIGH
  | LOW

type sqli_match_statement = {
  sensitivity_level: sensitivity_level option;
  text_transformations: text_transformation list;
  field_to_match: field_to_match
}

type comparison_operator = | GT
  | GE
  | LT
  | LE
  | NE
  | EQ

type size_constraint_statement = {
  text_transformations: text_transformation list;
  size: int;
  comparison_operator: comparison_operator;
  field_to_match: field_to_match
}

type country_code = | XK
  | ZW
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

type forwarded_ip_config = {
  fallback_behavior: fallback_behavior;
  header_name: string
}

type geo_match_statement = {
  forwarded_ip_config: forwarded_ip_config option;
  country_codes: country_code list option
}

type excluded_rule = {
  name: string
}

type count_action = {
  custom_request_handling: custom_request_handling option
}

type captcha_action = {
  custom_request_handling: custom_request_handling option
}

type challenge_action = {
  custom_request_handling: custom_request_handling option
}

type rule_action = {
  challenge: challenge_action option;
  captcha: captcha_action option;
  count: count_action option;
  allow: allow_action option;
  block: block_action option
}

type rule_action_override = {
  action_to_use: rule_action;
  name: string
}

type rule_group_reference_statement = {
  rule_action_overrides: rule_action_override list option;
  excluded_rules: excluded_rule list option;
  ar_n: string
}

type forwarded_ip_position = | ANY
  | LAST
  | FIRST

type ip_set_forwarded_ip_config = {
  position: forwarded_ip_position;
  fallback_behavior: fallback_behavior;
  header_name: string
}

type ip_set_reference_statement = {
  ip_set_forwarded_ip_config: ip_set_forwarded_ip_config option;
  ar_n: string
}

type regex_pattern_set_reference_statement = {
  text_transformations: text_transformation list;
  field_to_match: field_to_match;
  ar_n: string
}

type rate_based_statement_aggregate_key_type = | CONSTANT
  | CUSTOM_KEYS
  | FORWARDED_IP
  | IP

type rate_limit_header = {
  text_transformations: text_transformation list;
  name: string
}

type rate_limit_cookie = {
  text_transformations: text_transformation list;
  name: string
}

type rate_limit_query_argument = {
  text_transformations: text_transformation list;
  name: string
}

type rate_limit_query_string = {
  text_transformations: text_transformation list
}

type rate_limit_http_method = unit

type rate_limit_forwarded_i_p = unit

type rate_limit_i_p = unit

type rate_limit_label_namespace = {
  namespace: string
}

type rate_limit_uri_path = {
  text_transformations: text_transformation list
}

type rate_based_statement_custom_key = {
  uri_path: rate_limit_uri_path option;
  label_namespace: rate_limit_label_namespace option;
  i_p: rate_limit_i_p option;
  forwarded_i_p: rate_limit_forwarded_i_p option;
  http_method: rate_limit_http_method option;
  query_string: rate_limit_query_string option;
  query_argument: rate_limit_query_argument option;
  cookie: rate_limit_cookie option;
  header: rate_limit_header option
}

type payload_type = | FORM_ENCODED
  | JSON

type username_field = {
  identifier: string
}

type password_field = {
  identifier: string
}

type inspection_level = | TARGETED
  | COMMON

type aws_managed_rules_bot_control_rule_set = {
  enable_machine_learning: bool option;
  inspection_level: inspection_level
}

type request_inspection = {
  password_field: password_field;
  username_field: username_field;
  payload_type: payload_type
}

type response_inspection_status_code = {
  failure_codes: int list;
  success_codes: int list
}

type response_inspection_header = {
  failure_values: string list;
  success_values: string list;
  name: string
}

type response_inspection_body_contains = {
  failure_strings: string list;
  success_strings: string list
}

type response_inspection_json = {
  failure_values: string list;
  success_values: string list;
  identifier: string
}

type response_inspection = {
  json: response_inspection_json option;
  body_contains: response_inspection_body_contains option;
  header: response_inspection_header option;
  status_code: response_inspection_status_code option
}

type aws_managed_rules_atp_rule_set = {
  enable_regex_in_path: bool option;
  response_inspection: response_inspection option;
  request_inspection: request_inspection option;
  login_path: string
}

type email_field = {
  identifier: string
}

type phone_number_field = {
  identifier: string
}

type address_field = {
  identifier: string
}

type request_inspection_acf_p = {
  address_fields: address_field list option;
  phone_number_fields: phone_number_field list option;
  email_field: email_field option;
  password_field: password_field option;
  username_field: username_field option;
  payload_type: payload_type
}

type aws_managed_rules_acfp_rule_set = {
  enable_regex_in_path: bool option;
  response_inspection: response_inspection option;
  request_inspection: request_inspection_acf_p;
  registration_page_path: string;
  creation_path: string
}

type managed_rule_group_config = {
  aws_managed_rules_acfp_rule_set: aws_managed_rules_acfp_rule_set option;
  aws_managed_rules_atp_rule_set: aws_managed_rules_atp_rule_set option;
  aws_managed_rules_bot_control_rule_set: aws_managed_rules_bot_control_rule_set option;
  password_field: password_field option;
  username_field: username_field option;
  payload_type: payload_type option;
  login_path: string option
}

type label_match_scope = | NAMESPACE
  | LABEL

type label_match_statement = {
  key: string;
  scope: label_match_scope
}

type regex_match_statement = {
  text_transformations: text_transformation list;
  field_to_match: field_to_match;
  regex_string: string
}

type and_statement = {
  statements: statement list
} and managed_rule_group_statement = {
  rule_action_overrides: rule_action_override list option;
  managed_rule_group_configs: managed_rule_group_config list option;
  scope_down_statement: statement option;
  excluded_rules: excluded_rule list option;
  version: string option;
  name: string;
  vendor_name: string
} and not_statement = {
  statement: statement
} and or_statement = {
  statements: statement list
} and rate_based_statement = {
  custom_keys: rate_based_statement_custom_key list option;
  forwarded_ip_config: forwarded_ip_config option;
  scope_down_statement: statement option;
  aggregate_key_type: rate_based_statement_aggregate_key_type;
  evaluation_window_sec: int option;
  limit: int
} and statement = {
  regex_match_statement: regex_match_statement option;
  label_match_statement: label_match_statement option;
  managed_rule_group_statement: managed_rule_group_statement option;
  not_statement: not_statement option;
  or_statement: or_statement option;
  and_statement: and_statement option;
  rate_based_statement: rate_based_statement option;
  regex_pattern_set_reference_statement: regex_pattern_set_reference_statement option;
  ip_set_reference_statement: ip_set_reference_statement option;
  rule_group_reference_statement: rule_group_reference_statement option;
  geo_match_statement: geo_match_statement option;
  size_constraint_statement: size_constraint_statement option;
  xss_match_statement: xss_match_statement option;
  sqli_match_statement: sqli_match_statement option;
  byte_match_statement: byte_match_statement option
}

type none_action = unit

type override_action = {
  none: none_action option;
  count: count_action option
}

type label = {
  name: string
}

type visibility_config = {
  metric_name: string;
  cloud_watch_metrics_enabled: bool;
  sampled_requests_enabled: bool
}

type immunity_time_property = {
  immunity_time: int
}

type captcha_config = {
  immunity_time_property: immunity_time_property option
}

type challenge_config = {
  immunity_time_property: immunity_time_property option
}

type rule = {
  challenge_config: challenge_config option;
  captcha_config: captcha_config option;
  visibility_config: visibility_config;
  rule_labels: label list option;
  override_action: override_action option;
  action: rule_action option;
  statement: statement;
  priority: int;
  name: string
}

type firewall_manager_statement = {
  rule_group_reference_statement: rule_group_reference_statement option;
  managed_rule_group_statement: managed_rule_group_statement option
}

type firewall_manager_rule_group = {
  visibility_config: visibility_config;
  override_action: override_action;
  firewall_manager_statement: firewall_manager_statement;
  priority: int;
  name: string
}

type response_content_type = | APPLICATION_JSON
  | TEXT_HTML
  | TEXT_PLAIN

type custom_response_body = {
  content: string;
  content_type: response_content_type
}

type size_inspection_limit = | KB_64
  | KB_48
  | KB_32
  | KB_16

type request_body_associated_resource_type_config = {
  default_size_inspection_limit: size_inspection_limit
}

type associated_resource_type = | VERIFIED_ACCESS_INSTANCE
  | APP_RUNNER_SERVICE
  | COGNITO_USER_POOL
  | API_GATEWAY
  | CLOUDFRONT

type association_config = {
  request_body: (string * request_body_associated_resource_type_config) list option
}

type web_ac_l = {
  association_config: association_config option;
  token_domains: string list option;
  challenge_config: challenge_config option;
  captcha_config: captcha_config option;
  custom_response_bodies: (string * custom_response_body) list option;
  label_namespace: string option;
  managed_by_firewall_manager: bool option;
  post_process_firewall_manager_rule_groups: firewall_manager_rule_group list option;
  pre_process_firewall_manager_rule_groups: firewall_manager_rule_group list option;
  capacity: int option;
  visibility_config: visibility_config;
  rules: rule list option;
  description: string option;
  default_action: default_action;
  ar_n: string;
  id: string;
  name: string
}

type waf_unsupported_aggregate_key_type_exception = {
  message: string option
}

type waf_unavailable_entity_exception = {
  message: string option
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

type waf_service_linked_role_error_exception = {
  message: string option
}

type waf_optimistic_lock_exception = {
  message: string option
}

type waf_nonexistent_item_exception = {
  message: string option
}

type waf_log_destination_permission_issue_exception = {
  message: string option
}

type waf_limits_exceeded_exception = {
  source_type: string option;
  message: string option
}

type waf_invalid_resource_exception = {
  message: string option
}

type waf_invalid_permission_policy_exception = {
  message: string option
}

type parameter_exception_field = | ACP_RULE_SET_RESPONSE_INSPECTION
  | CUSTOM_KEYS
  | SCOPE_DOWN
  | ASSOCIATED_RESOURCE_TYPE
  | ATP_RULE_SET_RESPONSE_INSPECTION
  | TOKEN_DOMAIN
  | CHALLENGE_CONFIG
  | OVERSIZE_HANDLING
  | MAP_MATCH_SCOPE
  | COOKIE_MATCH_PATTERN
  | HEADER_MATCH_PATTERN
  | PAYLOAD_TYPE
  | MANAGED_RULE_GROUP_CONFIG
  | LOG_DESTINATION
  | ASSOCIABLE_RESOURCE
  | CHANGE_PROPAGATION_STATUS
  | EXPIRE_TIMESTAMP
  | FILTER_CONDITION
  | LOGGING_FILTER
  | BODY_PARSING_FALLBACK_BEHAVIOR
  | JSON_MATCH_SCOPE
  | JSON_MATCH_PATTERN
  | CUSTOM_RESPONSE_BODY
  | CUSTOM_RESPONSE
  | RESPONSE_CONTENT_TYPE
  | CUSTOM_REQUEST_HANDLING
  | HEADER_NAME
  | IP_SET_FORWARDED_IP_CONFIG
  | FORWARDED_IP_CONFIG
  | POSITION
  | FALLBACK_BEHAVIOR
  | FIREWALL_MANAGER_STATEMENT
  | METRIC_NAME
  | TAG_KEYS
  | TAGS
  | RESOURCE_TYPE
  | RESOURCE_ARN
  | SCOPE_VALUE
  | OVERRIDE_ACTION
  | ENTITY_LIMIT
  | RULE_ACTION
  | DEFAULT_ACTION
  | SINGLE_HEADER
  | SINGLE_QUERY_ARGUMENT
  | TEXT_TRANSFORMATION
  | FIELD_TO_MATCH
  | IP_ADDRESS_VERSION
  | IP_ADDRESS
  | NOT_STATEMENT
  | OR_STATEMENT
  | AND_STATEMENT
  | LABEL_MATCH_STATEMENT
  | MANAGED_RULE_SET_STATEMENT
  | IP_SET_REFERENCE_STATEMENT
  | REGEX_PATTERN_REFERENCE_STATEMENT
  | RULE_GROUP_REFERENCE_STATEMENT
  | RATE_BASED_STATEMENT
  | GEO_MATCH_STATEMENT
  | SIZE_CONSTRAINT_STATEMENT
  | XSS_MATCH_STATEMENT
  | SQLI_MATCH_STATEMENT
  | BYTE_MATCH_STATEMENT
  | STATEMENT
  | EXCLUDED_RULE
  | RULE
  | MANAGED_RULE_SET
  | IP_SET
  | REGEX_PATTERN_SET
  | RULE_GROUP
  | WEB_ACL

type waf_invalid_parameter_exception = {
  reason: string option;
  parameter: string option;
  field: parameter_exception_field option;
  message: string option
}

type waf_invalid_operation_exception = {
  message: string option
}

type waf_internal_error_exception = {
  message: string option
}

type waf_expired_managed_rule_group_version_exception = {
  message: string option
}

type waf_duplicate_item_exception = {
  message: string option
}

type waf_configuration_warning_exception = {
  message: string option
}

type waf_associated_item_exception = {
  message: string option
}

type version_to_publish = {
  forecasted_lifetime: int option;
  associated_rule_group_arn: string option
}

type update_web_acl_response = {
  next_lock_token: string option
}

type scope = | REGIONAL
  | CLOUDFRONT

type update_web_acl_request = {
  association_config: association_config option;
  token_domains: string list option;
  challenge_config: challenge_config option;
  captcha_config: captcha_config option;
  custom_response_bodies: (string * custom_response_body) list option;
  lock_token: string;
  visibility_config: visibility_config;
  rules: rule list option;
  description: string option;
  default_action: default_action;
  id: string;
  scope: scope;
  name: string
}

type update_rule_group_response = {
  next_lock_token: string option
}

type update_rule_group_request = {
  custom_response_bodies: (string * custom_response_body) list option;
  lock_token: string;
  visibility_config: visibility_config;
  rules: rule list option;
  description: string option;
  id: string;
  scope: scope;
  name: string
}

type update_regex_pattern_set_response = {
  next_lock_token: string option
}

type regex = {
  regex_string: string option
}

type update_regex_pattern_set_request = {
  lock_token: string;
  regular_expression_list: regex list;
  description: string option;
  id: string;
  scope: scope;
  name: string
}

type update_managed_rule_set_version_expiry_date_response = {
  next_lock_token: string option;
  expiry_timestamp: float option;
  expiring_version: string option
}

type update_managed_rule_set_version_expiry_date_request = {
  expiry_timestamp: float;
  version_to_expire: string;
  lock_token: string;
  id: string;
  scope: scope;
  name: string
}

type update_ip_set_response = {
  next_lock_token: string option
}

type update_ip_set_request = {
  lock_token: string;
  addresses: string list;
  description: string option;
  id: string;
  scope: scope;
  name: string
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

type failure_reason = | TOKEN_DOMAIN_MISMATCH
  | TOKEN_INVALID
  | TOKEN_EXPIRED
  | TOKEN_MISSING

type captcha_response = {
  failure_reason: failure_reason option;
  solve_timestamp: int option;
  response_code: int option
}

type challenge_response = {
  failure_reason: failure_reason option;
  solve_timestamp: int option;
  response_code: int option
}

type sampled_http_request = {
  overridden_action: string option;
  challenge_response: challenge_response option;
  captcha_response: captcha_response option;
  labels: label list option;
  response_code_sent: int option;
  request_headers_inserted: http_header list option;
  rule_name_within_rule_group: string option;
  action: string option;
  timestamp_: float option;
  weight: int;
  request: http_request
}

type rule_summary = {
  action: rule_action option;
  name: string option
}

type rule_group_summary = {
  ar_n: string option;
  lock_token: string option;
  description: string option;
  id: string option;
  name: string option
}

type label_summary = {
  name: string option
}

type rule_group = {
  consumed_labels: label_summary list option;
  available_labels: label_summary list option;
  custom_response_bodies: (string * custom_response_body) list option;
  label_namespace: string option;
  visibility_config: visibility_config;
  rules: rule list option;
  description: string option;
  ar_n: string;
  capacity: int;
  id: string;
  name: string
}

type resource_type = | VERIFIED_ACCESS_INSTANCE
  | APP_RUNNER_SERVICE
  | COGNITIO_USER_POOL
  | APPSYNC
  | API_GATEWAY
  | APPLICATION_LOAD_BALANCER

type release_summary = {
  timestamp_: float option;
  release_version: string option
}

type regex_pattern_set_summary = {
  ar_n: string option;
  lock_token: string option;
  description: string option;
  id: string option;
  name: string option
}

type regex_pattern_set = {
  regular_expression_list: regex list option;
  description: string option;
  ar_n: string option;
  id: string option;
  name: string option
}

type ip_address_version = | IPV6
  | IPV4

type rate_based_statement_managed_keys_ip_set = {
  addresses: string list option;
  ip_address_version: ip_address_version option
}

type put_permission_policy_response = unit

type put_permission_policy_request = {
  policy: string;
  resource_arn: string
}

type put_managed_rule_set_versions_response = {
  next_lock_token: string option
}

type put_managed_rule_set_versions_request = {
  versions_to_publish: (string * version_to_publish) list option;
  recommended_version: string option;
  lock_token: string;
  id: string;
  scope: scope;
  name: string
}

type filter_behavior = | DROP
  | KEEP

type filter_requirement = | MEETS_ANY
  | MEETS_ALL

type action_value = | EXCLUDED_AS_COUNT
  | CHALLENGE
  | CAPTCHA
  | COUNT
  | BLOCK
  | ALLOW

type action_condition = {
  action: action_value
}

type label_name_condition = {
  label_name: string
}

type condition = {
  label_name_condition: label_name_condition option;
  action_condition: action_condition option
}

type filter = {
  conditions: condition list;
  requirement: filter_requirement;
  behavior: filter_behavior
}

type logging_filter = {
  default_behavior: filter_behavior;
  filters: filter list
}

type log_type = | WAF_LOGS

type log_scope = | SECURITY_LAKE
  | CUSTOMER

type logging_configuration = {
  log_scope: log_scope option;
  log_type: log_type option;
  logging_filter: logging_filter option;
  managed_by_firewall_manager: bool option;
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

type managed_rule_set_version = {
  expiry_timestamp: float option;
  last_update_timestamp: float option;
  publish_timestamp: float option;
  forecasted_lifetime: int option;
  capacity: int option;
  associated_rule_group_arn: string option
}

type platform = | ANDROID
  | IOS

type mobile_sdk_release = {
  tags: tag list option;
  release_notes: string option;
  timestamp_: float option;
  release_version: string option
}

type managed_rule_set_summary = {
  label_namespace: string option;
  ar_n: string option;
  lock_token: string option;
  description: string option;
  id: string option;
  name: string option
}

type managed_rule_set = {
  label_namespace: string option;
  recommended_version: string option;
  published_versions: (string * managed_rule_set_version) list option;
  description: string option;
  ar_n: string;
  id: string;
  name: string
}

type managed_rule_group_version = {
  last_update_timestamp: float option;
  name: string option
}

type managed_rule_group_summary = {
  description: string option;
  versioning_supported: bool option;
  name: string option;
  vendor_name: string option
}

type managed_product_descriptor = {
  is_advanced_managed_rule_set: bool option;
  is_versioning_supported: bool option;
  sns_topic_arn: string option;
  product_description: string option;
  product_title: string option;
  product_link: string option;
  product_id: string option;
  managed_rule_set_name: string option;
  vendor_name: string option
}

type list_web_ac_ls_response = {
  web_ac_ls: web_acl_summary list option;
  next_marker: string option
}

type list_web_ac_ls_request = {
  limit: int option;
  next_marker: string option;
  scope: scope
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

type list_rule_groups_response = {
  rule_groups: rule_group_summary list option;
  next_marker: string option
}

type list_rule_groups_request = {
  limit: int option;
  next_marker: string option;
  scope: scope
}

type list_resources_for_web_acl_response = {
  resource_arns: string list option
}

type list_resources_for_web_acl_request = {
  resource_type: resource_type option;
  web_acl_arn: string
}

type list_regex_pattern_sets_response = {
  regex_pattern_sets: regex_pattern_set_summary list option;
  next_marker: string option
}

type list_regex_pattern_sets_request = {
  limit: int option;
  next_marker: string option;
  scope: scope
}

type list_mobile_sdk_releases_response = {
  next_marker: string option;
  release_summaries: release_summary list option
}

type list_mobile_sdk_releases_request = {
  limit: int option;
  next_marker: string option;
  platform: platform
}

type list_managed_rule_sets_response = {
  managed_rule_sets: managed_rule_set_summary list option;
  next_marker: string option
}

type list_managed_rule_sets_request = {
  limit: int option;
  next_marker: string option;
  scope: scope
}

type list_logging_configurations_response = {
  next_marker: string option;
  logging_configurations: logging_configuration list option
}

type list_logging_configurations_request = {
  log_scope: log_scope option;
  limit: int option;
  next_marker: string option;
  scope: scope
}

type ip_set_summary = {
  ar_n: string option;
  lock_token: string option;
  description: string option;
  id: string option;
  name: string option
}

type list_ip_sets_response = {
  ip_sets: ip_set_summary list option;
  next_marker: string option
}

type list_ip_sets_request = {
  limit: int option;
  next_marker: string option;
  scope: scope
}

type list_available_managed_rule_groups_response = {
  managed_rule_groups: managed_rule_group_summary list option;
  next_marker: string option
}

type list_available_managed_rule_groups_request = {
  limit: int option;
  next_marker: string option;
  scope: scope
}

type list_available_managed_rule_group_versions_response = {
  current_default_version: string option;
  versions: managed_rule_group_version list option;
  next_marker: string option
}

type list_available_managed_rule_group_versions_request = {
  limit: int option;
  next_marker: string option;
  scope: scope;
  name: string;
  vendor_name: string
}

type api_key_summary = {
  version: int option;
  creation_timestamp: float option;
  api_key: string option;
  token_domains: string list option
}

type list_api_keys_response = {
  application_integration_ur_l: string option;
  api_key_summaries: api_key_summary list option;
  next_marker: string option
}

type list_api_keys_request = {
  limit: int option;
  next_marker: string option;
  scope: scope
}

type ip_set = {
  addresses: string list;
  ip_address_version: ip_address_version;
  description: string option;
  ar_n: string;
  id: string;
  name: string
}

type get_web_acl_response = {
  application_integration_ur_l: string option;
  lock_token: string option;
  web_ac_l: web_ac_l option
}

type get_web_acl_request = {
  id: string;
  scope: scope;
  name: string
}

type get_web_acl_for_resource_response = {
  web_ac_l: web_ac_l option
}

type get_web_acl_for_resource_request = {
  resource_arn: string
}

type get_sampled_requests_response = {
  time_window: time_window option;
  population_size: int option;
  sampled_requests: sampled_http_request list option
}

type get_sampled_requests_request = {
  max_items: int;
  time_window: time_window;
  scope: scope;
  rule_metric_name: string;
  web_acl_arn: string
}

type get_rule_group_response = {
  lock_token: string option;
  rule_group: rule_group option
}

type get_rule_group_request = {
  ar_n: string option;
  id: string option;
  scope: scope option;
  name: string option
}

type get_regex_pattern_set_response = {
  lock_token: string option;
  regex_pattern_set: regex_pattern_set option
}

type get_regex_pattern_set_request = {
  id: string;
  scope: scope;
  name: string
}

type get_rate_based_statement_managed_keys_response = {
  managed_keys_ip_v6: rate_based_statement_managed_keys_ip_set option;
  managed_keys_ip_v4: rate_based_statement_managed_keys_ip_set option
}

type get_rate_based_statement_managed_keys_request = {
  rule_name: string;
  rule_group_rule_name: string option;
  web_acl_id: string;
  web_acl_name: string;
  scope: scope
}

type get_permission_policy_response = {
  policy: string option
}

type get_permission_policy_request = {
  resource_arn: string
}

type get_mobile_sdk_release_response = {
  mobile_sdk_release: mobile_sdk_release option
}

type get_mobile_sdk_release_request = {
  release_version: string;
  platform: platform
}

type get_managed_rule_set_response = {
  lock_token: string option;
  managed_rule_set: managed_rule_set option
}

type get_managed_rule_set_request = {
  id: string;
  scope: scope;
  name: string
}

type get_logging_configuration_response = {
  logging_configuration: logging_configuration option
}

type get_logging_configuration_request = {
  log_scope: log_scope option;
  log_type: log_type option;
  resource_arn: string
}

type get_ip_set_response = {
  lock_token: string option;
  ip_set: ip_set option
}

type get_ip_set_request = {
  id: string;
  scope: scope;
  name: string
}

type get_decrypted_api_key_response = {
  creation_timestamp: float option;
  token_domains: string list option
}

type get_decrypted_api_key_request = {
  api_key: string;
  scope: scope
}

type generate_mobile_sdk_release_url_response = {
  url: string option
}

type generate_mobile_sdk_release_url_request = {
  release_version: string;
  platform: platform
}

type disassociate_web_acl_response = unit

type disassociate_web_acl_request = {
  resource_arn: string
}

type describe_managed_rule_group_response = {
  consumed_labels: label_summary list option;
  available_labels: label_summary list option;
  label_namespace: string option;
  rules: rule_summary list option;
  capacity: int option;
  sns_topic_arn: string option;
  version_name: string option
}

type describe_managed_rule_group_request = {
  version_name: string option;
  scope: scope;
  name: string;
  vendor_name: string
}

type describe_managed_products_by_vendor_response = {
  managed_products: managed_product_descriptor list option
}

type describe_managed_products_by_vendor_request = {
  scope: scope;
  vendor_name: string
}

type describe_all_managed_products_response = {
  managed_products: managed_product_descriptor list option
}

type describe_all_managed_products_request = {
  scope: scope
}

type delete_web_acl_response = unit

type delete_web_acl_request = {
  lock_token: string;
  id: string;
  scope: scope;
  name: string
}

type delete_rule_group_response = unit

type delete_rule_group_request = {
  lock_token: string;
  id: string;
  scope: scope;
  name: string
}

type delete_regex_pattern_set_response = unit

type delete_regex_pattern_set_request = {
  lock_token: string;
  id: string;
  scope: scope;
  name: string
}

type delete_permission_policy_response = unit

type delete_permission_policy_request = {
  resource_arn: string
}

type delete_logging_configuration_response = unit

type delete_logging_configuration_request = {
  log_scope: log_scope option;
  log_type: log_type option;
  resource_arn: string
}

type delete_ip_set_response = unit

type delete_ip_set_request = {
  lock_token: string;
  id: string;
  scope: scope;
  name: string
}

type delete_firewall_manager_rule_groups_response = {
  next_web_acl_lock_token: string option
}

type delete_firewall_manager_rule_groups_request = {
  web_acl_lock_token: string;
  web_acl_arn: string
}

type delete_api_key_response = unit

type delete_api_key_request = {
  api_key: string;
  scope: scope
}

type create_web_acl_response = {
  summary: web_acl_summary option
}

type create_web_acl_request = {
  association_config: association_config option;
  token_domains: string list option;
  challenge_config: challenge_config option;
  captcha_config: captcha_config option;
  custom_response_bodies: (string * custom_response_body) list option;
  tags: tag list option;
  visibility_config: visibility_config;
  rules: rule list option;
  description: string option;
  default_action: default_action;
  scope: scope;
  name: string
}

type create_rule_group_response = {
  summary: rule_group_summary option
}

type create_rule_group_request = {
  custom_response_bodies: (string * custom_response_body) list option;
  tags: tag list option;
  visibility_config: visibility_config;
  rules: rule list option;
  description: string option;
  capacity: int;
  scope: scope;
  name: string
}

type create_regex_pattern_set_response = {
  summary: regex_pattern_set_summary option
}

type create_regex_pattern_set_request = {
  tags: tag list option;
  regular_expression_list: regex list;
  description: string option;
  scope: scope;
  name: string
}

type create_ip_set_response = {
  summary: ip_set_summary option
}

type create_ip_set_request = {
  tags: tag list option;
  addresses: string list;
  ip_address_version: ip_address_version;
  description: string option;
  scope: scope;
  name: string
}

type create_api_key_response = {
  api_key: string option
}

type create_api_key_request = {
  token_domains: string list;
  scope: scope
}

type check_capacity_response = {
  capacity: int option
}

type check_capacity_request = {
  rules: rule list;
  scope: scope
}

type associate_web_acl_response = unit

type associate_web_acl_request = {
  resource_arn: string;
  web_acl_arn: string
}



type base_document = Json.t

val make_single_header :
  name:string -> unit -> single_header

val make_single_query_argument : name:string -> unit
-> single_query_argument

val make_all_query_arguments : unit -> all_query_arguments

val make_uri_path : unit -> uri_path

val make_query_string : unit -> query_string

val make_body : ?oversize_handling:oversize_handling -> unit
-> body

val make_method_ : unit -> method_

val make_all : unit -> all

val make_json_match_pattern : ?included_paths:string list -> ?all:all -> unit
-> json_match_pattern

val make_json_body :
  ?oversize_handling:oversize_handling ->
  ?invalid_fallback_behavior:body_parsing_fallback_behavior ->
  match_scope:json_match_scope ->
  match_pattern:json_match_pattern ->
  unit -> json_body

val make_header_match_pattern :
  ?excluded_headers:string list ->
  ?included_headers:string list ->
  ?all:all ->
  unit -> header_match_pattern

val make_headers :
  oversize_handling:oversize_handling ->
  match_scope:map_match_scope ->
  match_pattern:header_match_pattern ->
  unit -> headers

val make_cookie_match_pattern :
  ?excluded_cookies:string list ->
  ?included_cookies:string list ->
  ?all:all ->
  unit -> cookie_match_pattern

val make_cookies :
  oversize_handling:oversize_handling ->
  match_scope:map_match_scope ->
  match_pattern:cookie_match_pattern ->
  unit -> cookies

val make_header_order : oversize_handling:oversize_handling -> unit
-> header_order

val make_ja3_fingerprint : fallback_behavior:fallback_behavior -> unit
-> ja3_fingerprint

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
  unit -> field_to_match

val make_text_transformation :
  type_:text_transformation_type -> priority:int -> unit
-> text_transformation

val make_xss_match_statement :
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  unit -> xss_match_statement

val make_web_acl_summary :
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit -> web_acl_summary

val make_custom_http_header : value:string -> name:string -> unit
-> custom_http_header

val make_custom_response :
  ?response_headers:custom_http_header list ->
  ?custom_response_body_key:string ->
  response_code:int ->
  unit -> custom_response

val make_block_action : ?custom_response:custom_response -> unit
-> block_action

val make_custom_request_handling :
  insert_headers:custom_http_header list -> unit
-> custom_request_handling

val make_allow_action :
  ?custom_request_handling:custom_request_handling -> unit
-> allow_action

val make_default_action : ?allow:allow_action -> ?block:block_action -> unit
-> default_action

val make_byte_match_statement :
  positional_constraint:positional_constraint ->
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  search_string:bytes ->
  unit -> byte_match_statement

val make_sqli_match_statement :
  ?sensitivity_level:sensitivity_level ->
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  unit -> sqli_match_statement

val make_size_constraint_statement :
  text_transformations:text_transformation list ->
  size:int ->
  comparison_operator:comparison_operator ->
  field_to_match:field_to_match ->
  unit -> size_constraint_statement

val make_forwarded_ip_config :
  fallback_behavior:fallback_behavior -> header_name:string -> unit
-> forwarded_ip_config

val make_geo_match_statement :
  ?forwarded_ip_config:forwarded_ip_config ->
  ?country_codes:country_code list ->
  unit -> geo_match_statement

val make_excluded_rule : name:string -> unit
-> excluded_rule

val make_count_action :
  ?custom_request_handling:custom_request_handling -> unit
-> count_action

val make_captcha_action :
  ?custom_request_handling:custom_request_handling -> unit
-> captcha_action

val make_challenge_action :
  ?custom_request_handling:custom_request_handling -> unit
-> challenge_action

val make_rule_action :
  ?challenge:challenge_action ->
  ?captcha:captcha_action ->
  ?count:count_action ->
  ?allow:allow_action ->
  ?block:block_action ->
  unit -> rule_action

val make_rule_action_override :
  action_to_use:rule_action -> name:string -> unit
-> rule_action_override

val make_rule_group_reference_statement :
  ?rule_action_overrides:rule_action_override list ->
  ?excluded_rules:excluded_rule list ->
  ar_n:string ->
  unit -> rule_group_reference_statement

val make_ip_set_forwarded_ip_config :
  position:forwarded_ip_position ->
  fallback_behavior:fallback_behavior ->
  header_name:string ->
  unit -> ip_set_forwarded_ip_config

val make_ip_set_reference_statement :
  ?ip_set_forwarded_ip_config:ip_set_forwarded_ip_config ->
  ar_n:string ->
  unit
-> ip_set_reference_statement

val make_regex_pattern_set_reference_statement :
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  ar_n:string ->
  unit -> regex_pattern_set_reference_statement

val make_rate_limit_header :
  text_transformations:text_transformation list -> name:string -> unit
-> rate_limit_header

val make_rate_limit_cookie :
  text_transformations:text_transformation list -> name:string -> unit
-> rate_limit_cookie

val make_rate_limit_query_argument :
  text_transformations:text_transformation list -> name:string -> unit
-> rate_limit_query_argument

val make_rate_limit_query_string :
  text_transformations:text_transformation list -> unit
-> rate_limit_query_string

val make_rate_limit_http_method : unit
-> rate_limit_http_method

val make_rate_limit_forwarded_i_p : unit
-> rate_limit_forwarded_i_p

val make_rate_limit_i_p : unit
-> rate_limit_i_p

val make_rate_limit_label_namespace : namespace:string -> unit
-> rate_limit_label_namespace

val make_rate_limit_uri_path :
  text_transformations:text_transformation list -> unit
-> rate_limit_uri_path

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
  unit -> rate_based_statement_custom_key

val make_username_field : identifier:string -> unit
-> username_field

val make_password_field : identifier:string -> unit
-> password_field

val make_aws_managed_rules_bot_control_rule_set :
  ?enable_machine_learning:bool -> inspection_level:inspection_level -> unit
-> aws_managed_rules_bot_control_rule_set

val make_request_inspection :
  password_field:password_field ->
  username_field:username_field ->
  payload_type:payload_type ->
  unit -> request_inspection

val make_response_inspection_status_code :
  failure_codes:int list -> success_codes:int list -> unit
-> response_inspection_status_code

val make_response_inspection_header :
  failure_values:string list ->
  success_values:string list ->
  name:string ->
  unit
-> response_inspection_header

val make_response_inspection_body_contains :
  failure_strings:string list -> success_strings:string list -> unit
-> response_inspection_body_contains

val make_response_inspection_json :
  failure_values:string list ->
  success_values:string list ->
  identifier:string ->
  unit -> response_inspection_json

val make_response_inspection :
  ?json:response_inspection_json ->
  ?body_contains:response_inspection_body_contains ->
  ?header:response_inspection_header ->
  ?status_code:response_inspection_status_code ->
  unit -> response_inspection

val make_aws_managed_rules_atp_rule_set :
  ?enable_regex_in_path:bool ->
  ?response_inspection:response_inspection ->
  ?request_inspection:request_inspection ->
  login_path:string ->
  unit -> aws_managed_rules_atp_rule_set

val make_email_field : identifier:string -> unit
-> email_field

val make_phone_number_field : identifier:string -> unit
-> phone_number_field

val make_address_field : identifier:string -> unit
-> address_field

val make_request_inspection_acf_p :
  ?address_fields:address_field list ->
  ?phone_number_fields:phone_number_field list ->
  ?email_field:email_field ->
  ?password_field:password_field ->
  ?username_field:username_field ->
  payload_type:payload_type ->
  unit -> request_inspection_acf_p

val make_aws_managed_rules_acfp_rule_set :
  ?enable_regex_in_path:bool ->
  ?response_inspection:response_inspection ->
  request_inspection:request_inspection_acf_p ->
  registration_page_path:string ->
  creation_path:string ->
  unit -> aws_managed_rules_acfp_rule_set

val make_managed_rule_group_config :
  ?aws_managed_rules_acfp_rule_set:aws_managed_rules_acfp_rule_set ->
  ?aws_managed_rules_atp_rule_set:aws_managed_rules_atp_rule_set ->
  ?aws_managed_rules_bot_control_rule_set:aws_managed_rules_bot_control_rule_set ->
  ?password_field:password_field ->
  ?username_field:username_field ->
  ?payload_type:payload_type ->
  ?login_path:string ->
  unit -> managed_rule_group_config

val make_label_match_statement :
  key:string -> scope:label_match_scope -> unit
-> label_match_statement

val make_regex_match_statement :
  text_transformations:text_transformation list ->
  field_to_match:field_to_match ->
  regex_string:string ->
  unit -> regex_match_statement

val make_and_statement : statements:statement list -> unit
-> and_statement

val make_managed_rule_group_statement :
  ?rule_action_overrides:rule_action_override list ->
  ?managed_rule_group_configs:managed_rule_group_config list ->
  ?scope_down_statement:statement ->
  ?excluded_rules:excluded_rule list ->
  ?version:string ->
  name:string ->
  vendor_name:string ->
  unit -> managed_rule_group_statement

val make_not_statement : statement:statement -> unit
-> not_statement

val make_or_statement : statements:statement list -> unit
-> or_statement

val make_rate_based_statement :
  ?custom_keys:rate_based_statement_custom_key list ->
  ?forwarded_ip_config:forwarded_ip_config ->
  ?scope_down_statement:statement ->
  ?evaluation_window_sec:int ->
  aggregate_key_type:rate_based_statement_aggregate_key_type ->
  limit:int ->
  unit -> rate_based_statement

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
  unit -> statement

val make_none_action : unit -> none_action

val make_override_action : ?none:none_action -> ?count:count_action -> unit
-> override_action

val make_label : name:string -> unit -> label

val make_visibility_config :
  metric_name:string ->
  cloud_watch_metrics_enabled:bool ->
  sampled_requests_enabled:bool ->
  unit -> visibility_config

val make_immunity_time_property : immunity_time:int -> unit
-> immunity_time_property

val make_captcha_config :
  ?immunity_time_property:immunity_time_property -> unit
-> captcha_config

val make_challenge_config :
  ?immunity_time_property:immunity_time_property -> unit
-> challenge_config

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
  unit -> rule

val make_firewall_manager_statement :
  ?rule_group_reference_statement:rule_group_reference_statement ->
  ?managed_rule_group_statement:managed_rule_group_statement ->
  unit -> firewall_manager_statement

val make_firewall_manager_rule_group :
  visibility_config:visibility_config ->
  override_action:override_action ->
  firewall_manager_statement:firewall_manager_statement ->
  priority:int ->
  name:string ->
  unit -> firewall_manager_rule_group

val make_custom_response_body :
  content:string -> content_type:response_content_type -> unit
-> custom_response_body

val make_request_body_associated_resource_type_config :
  default_size_inspection_limit:size_inspection_limit -> unit
-> request_body_associated_resource_type_config

val make_association_config :
  ?request_body:(string * request_body_associated_resource_type_config) list ->
  unit -> association_config

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
  unit -> web_ac_l

val make_version_to_publish :
  ?forecasted_lifetime:int -> ?associated_rule_group_arn:string -> unit
-> version_to_publish

val make_update_web_acl_response : ?next_lock_token:string -> unit
-> update_web_acl_response

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
  unit -> update_web_acl_request

val make_update_rule_group_response : ?next_lock_token:string -> unit
-> update_rule_group_response

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

val make_update_regex_pattern_set_response : ?next_lock_token:string -> unit
-> update_regex_pattern_set_response

val make_regex : ?regex_string:string -> unit
-> regex

val make_update_regex_pattern_set_request :
  ?description:string ->
  lock_token:string ->
  regular_expression_list:regex list ->
  id:string ->
  scope:scope ->
  name:string ->
  unit
-> update_regex_pattern_set_request

val make_update_managed_rule_set_version_expiry_date_response :
  ?next_lock_token:string ->
  ?expiry_timestamp:float ->
  ?expiring_version:string ->
  unit
-> update_managed_rule_set_version_expiry_date_response

val make_update_managed_rule_set_version_expiry_date_request :
  expiry_timestamp:float ->
  version_to_expire:string ->
  lock_token:string ->
  id:string ->
  scope:scope ->
  name:string ->
  unit
-> update_managed_rule_set_version_expiry_date_request

val make_update_ip_set_response : ?next_lock_token:string -> unit
-> update_ip_set_response

val make_update_ip_set_request :
  ?description:string ->
  lock_token:string ->
  addresses:string list ->
  id:string ->
  scope:scope ->
  name:string ->
  unit -> update_ip_set_request

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

val make_captcha_response :
  ?failure_reason:failure_reason ->
  ?solve_timestamp:int ->
  ?response_code:int ->
  unit -> captcha_response

val make_challenge_response :
  ?failure_reason:failure_reason ->
  ?solve_timestamp:int ->
  ?response_code:int ->
  unit -> challenge_response

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
  unit -> sampled_http_request

val make_rule_summary : ?action:rule_action -> ?name:string -> unit
-> rule_summary

val make_rule_group_summary :
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit -> rule_group_summary

val make_label_summary : ?name:string -> unit
-> label_summary

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
  unit -> rule_group

val make_release_summary :
  ?timestamp_:float -> ?release_version:string -> unit
-> release_summary

val make_regex_pattern_set_summary :
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit -> regex_pattern_set_summary

val make_regex_pattern_set :
  ?regular_expression_list:regex list ->
  ?description:string ->
  ?ar_n:string ->
  ?id:string ->
  ?name:string ->
  unit
-> regex_pattern_set

val make_rate_based_statement_managed_keys_ip_set :
  ?addresses:string list -> ?ip_address_version:ip_address_version -> unit
-> rate_based_statement_managed_keys_ip_set

val make_put_permission_policy_response : unit
-> put_permission_policy_response

val make_put_permission_policy_request :
  policy:string -> resource_arn:string -> unit
-> put_permission_policy_request

val make_put_managed_rule_set_versions_response :
  ?next_lock_token:string -> unit
-> put_managed_rule_set_versions_response

val make_put_managed_rule_set_versions_request :
  ?versions_to_publish:(string * version_to_publish) list ->
  ?recommended_version:string ->
  lock_token:string ->
  id:string ->
  scope:scope ->
  name:string ->
  unit -> put_managed_rule_set_versions_request

val make_action_condition : action:action_value -> unit
-> action_condition

val make_label_name_condition : label_name:string -> unit
-> label_name_condition

val make_condition :
  ?label_name_condition:label_name_condition ->
  ?action_condition:action_condition ->
  unit -> condition

val make_filter :
  conditions:condition list ->
  requirement:filter_requirement ->
  behavior:filter_behavior ->
  unit -> filter

val make_logging_filter :
  default_behavior:filter_behavior -> filters:filter list -> unit
-> logging_filter

val make_logging_configuration :
  ?log_scope:log_scope ->
  ?log_type:log_type ->
  ?logging_filter:logging_filter ->
  ?managed_by_firewall_manager:bool ->
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

val make_managed_rule_set_version :
  ?expiry_timestamp:float ->
  ?last_update_timestamp:float ->
  ?publish_timestamp:float ->
  ?forecasted_lifetime:int ->
  ?capacity:int ->
  ?associated_rule_group_arn:string ->
  unit -> managed_rule_set_version

val make_mobile_sdk_release :
  ?tags:tag list ->
  ?release_notes:string ->
  ?timestamp_:float ->
  ?release_version:string ->
  unit -> mobile_sdk_release

val make_managed_rule_set_summary :
  ?label_namespace:string ->
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit -> managed_rule_set_summary

val make_managed_rule_set :
  ?label_namespace:string ->
  ?recommended_version:string ->
  ?published_versions:(string * managed_rule_set_version) list ->
  ?description:string ->
  ar_n:string ->
  id:string ->
  name:string ->
  unit -> managed_rule_set

val make_managed_rule_group_version :
  ?last_update_timestamp:float -> ?name:string -> unit
-> managed_rule_group_version

val make_managed_rule_group_summary :
  ?description:string ->
  ?versioning_supported:bool ->
  ?name:string ->
  ?vendor_name:string ->
  unit -> managed_rule_group_summary

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
  unit -> managed_product_descriptor

val make_list_web_ac_ls_response :
  ?web_ac_ls:web_acl_summary list -> ?next_marker:string -> unit
-> list_web_ac_ls_response

val make_list_web_ac_ls_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_web_ac_ls_request

val make_list_tags_for_resource_response :
  ?tag_info_for_resource:tag_info_for_resource -> ?next_marker:string -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?limit:int -> ?next_marker:string -> resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_list_rule_groups_response :
  ?rule_groups:rule_group_summary list -> ?next_marker:string -> unit
-> list_rule_groups_response

val make_list_rule_groups_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_rule_groups_request

val make_list_resources_for_web_acl_response :
  ?resource_arns:string list -> unit
-> list_resources_for_web_acl_response

val make_list_resources_for_web_acl_request :
  ?resource_type:resource_type -> web_acl_arn:string -> unit
-> list_resources_for_web_acl_request

val make_list_regex_pattern_sets_response :
  ?regex_pattern_sets:regex_pattern_set_summary list ->
  ?next_marker:string ->
  unit
-> list_regex_pattern_sets_response

val make_list_regex_pattern_sets_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_regex_pattern_sets_request

val make_list_mobile_sdk_releases_response :
  ?next_marker:string -> ?release_summaries:release_summary list -> unit
-> list_mobile_sdk_releases_response

val make_list_mobile_sdk_releases_request :
  ?limit:int -> ?next_marker:string -> platform:platform -> unit
-> list_mobile_sdk_releases_request

val make_list_managed_rule_sets_response :
  ?managed_rule_sets:managed_rule_set_summary list ->
  ?next_marker:string ->
  unit
-> list_managed_rule_sets_response

val make_list_managed_rule_sets_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_managed_rule_sets_request

val make_list_logging_configurations_response :
  ?next_marker:string ->
  ?logging_configurations:logging_configuration list ->
  unit
-> list_logging_configurations_response

val make_list_logging_configurations_request :
  ?log_scope:log_scope ->
  ?limit:int ->
  ?next_marker:string ->
  scope:scope ->
  unit -> list_logging_configurations_request

val make_ip_set_summary :
  ?ar_n:string ->
  ?lock_token:string ->
  ?description:string ->
  ?id:string ->
  ?name:string ->
  unit -> ip_set_summary

val make_list_ip_sets_response :
  ?ip_sets:ip_set_summary list -> ?next_marker:string -> unit
-> list_ip_sets_response

val make_list_ip_sets_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_ip_sets_request

val make_list_available_managed_rule_groups_response :
  ?managed_rule_groups:managed_rule_group_summary list ->
  ?next_marker:string ->
  unit
-> list_available_managed_rule_groups_response

val make_list_available_managed_rule_groups_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_available_managed_rule_groups_request

val make_list_available_managed_rule_group_versions_response :
  ?current_default_version:string ->
  ?versions:managed_rule_group_version list ->
  ?next_marker:string ->
  unit
-> list_available_managed_rule_group_versions_response

val make_list_available_managed_rule_group_versions_request :
  ?limit:int ->
  ?next_marker:string ->
  scope:scope ->
  name:string ->
  vendor_name:string ->
  unit
-> list_available_managed_rule_group_versions_request

val make_api_key_summary :
  ?version:int ->
  ?creation_timestamp:float ->
  ?api_key:string ->
  ?token_domains:string list ->
  unit -> api_key_summary

val make_list_api_keys_response :
  ?application_integration_ur_l:string ->
  ?api_key_summaries:api_key_summary list ->
  ?next_marker:string ->
  unit -> list_api_keys_response

val make_list_api_keys_request :
  ?limit:int -> ?next_marker:string -> scope:scope -> unit
-> list_api_keys_request

val make_ip_set :
  ?description:string ->
  addresses:string list ->
  ip_address_version:ip_address_version ->
  ar_n:string ->
  id:string ->
  name:string ->
  unit -> ip_set

val make_get_web_acl_response :
  ?application_integration_ur_l:string ->
  ?lock_token:string ->
  ?web_ac_l:web_ac_l ->
  unit -> get_web_acl_response

val make_get_web_acl_request :
  id:string -> scope:scope -> name:string -> unit
-> get_web_acl_request

val make_get_web_acl_for_resource_response : ?web_ac_l:web_ac_l -> unit
-> get_web_acl_for_resource_response

val make_get_web_acl_for_resource_request : resource_arn:string -> unit
-> get_web_acl_for_resource_request

val make_get_sampled_requests_response :
  ?time_window:time_window ->
  ?population_size:int ->
  ?sampled_requests:sampled_http_request list ->
  unit
-> get_sampled_requests_response

val make_get_sampled_requests_request :
  max_items:int ->
  time_window:time_window ->
  scope:scope ->
  rule_metric_name:string ->
  web_acl_arn:string ->
  unit -> get_sampled_requests_request

val make_get_rule_group_response :
  ?lock_token:string -> ?rule_group:rule_group -> unit
-> get_rule_group_response

val make_get_rule_group_request :
  ?ar_n:string -> ?id:string -> ?scope:scope -> ?name:string -> unit
-> get_rule_group_request

val make_get_regex_pattern_set_response :
  ?lock_token:string -> ?regex_pattern_set:regex_pattern_set -> unit
-> get_regex_pattern_set_response

val make_get_regex_pattern_set_request :
  id:string -> scope:scope -> name:string -> unit
-> get_regex_pattern_set_request

val make_get_rate_based_statement_managed_keys_response :
  ?managed_keys_ip_v6:rate_based_statement_managed_keys_ip_set ->
  ?managed_keys_ip_v4:rate_based_statement_managed_keys_ip_set ->
  unit
-> get_rate_based_statement_managed_keys_response

val make_get_rate_based_statement_managed_keys_request :
  ?rule_group_rule_name:string ->
  rule_name:string ->
  web_acl_id:string ->
  web_acl_name:string ->
  scope:scope ->
  unit
-> get_rate_based_statement_managed_keys_request

val make_get_permission_policy_response : ?policy:string -> unit
-> get_permission_policy_response

val make_get_permission_policy_request : resource_arn:string -> unit
-> get_permission_policy_request

val make_get_mobile_sdk_release_response :
  ?mobile_sdk_release:mobile_sdk_release -> unit
-> get_mobile_sdk_release_response

val make_get_mobile_sdk_release_request :
  release_version:string -> platform:platform -> unit
-> get_mobile_sdk_release_request

val make_get_managed_rule_set_response :
  ?lock_token:string -> ?managed_rule_set:managed_rule_set -> unit
-> get_managed_rule_set_response

val make_get_managed_rule_set_request :
  id:string -> scope:scope -> name:string -> unit
-> get_managed_rule_set_request

val make_get_logging_configuration_response :
  ?logging_configuration:logging_configuration -> unit
-> get_logging_configuration_response

val make_get_logging_configuration_request :
  ?log_scope:log_scope -> ?log_type:log_type -> resource_arn:string -> unit
-> get_logging_configuration_request

val make_get_ip_set_response : ?lock_token:string -> ?ip_set:ip_set -> unit
-> get_ip_set_response

val make_get_ip_set_request : id:string -> scope:scope -> name:string -> unit
-> get_ip_set_request

val make_get_decrypted_api_key_response :
  ?creation_timestamp:float -> ?token_domains:string list -> unit
-> get_decrypted_api_key_response

val make_get_decrypted_api_key_request :
  api_key:string -> scope:scope -> unit
-> get_decrypted_api_key_request

val make_generate_mobile_sdk_release_url_response : ?url:string -> unit
-> generate_mobile_sdk_release_url_response

val make_generate_mobile_sdk_release_url_request :
  release_version:string -> platform:platform -> unit
-> generate_mobile_sdk_release_url_request

val make_disassociate_web_acl_response : unit
-> disassociate_web_acl_response

val make_disassociate_web_acl_request : resource_arn:string -> unit
-> disassociate_web_acl_request

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

val make_describe_managed_rule_group_request :
  ?version_name:string ->
  scope:scope ->
  name:string ->
  vendor_name:string ->
  unit
-> describe_managed_rule_group_request

val make_describe_managed_products_by_vendor_response :
  ?managed_products:managed_product_descriptor list -> unit
-> describe_managed_products_by_vendor_response

val make_describe_managed_products_by_vendor_request :
  scope:scope -> vendor_name:string -> unit
-> describe_managed_products_by_vendor_request

val make_describe_all_managed_products_response :
  ?managed_products:managed_product_descriptor list -> unit
-> describe_all_managed_products_response

val make_describe_all_managed_products_request : scope:scope -> unit
-> describe_all_managed_products_request

val make_delete_web_acl_response : unit
-> delete_web_acl_response

val make_delete_web_acl_request :
  lock_token:string -> id:string -> scope:scope -> name:string -> unit
-> delete_web_acl_request

val make_delete_rule_group_response : unit
-> delete_rule_group_response

val make_delete_rule_group_request :
  lock_token:string -> id:string -> scope:scope -> name:string -> unit
-> delete_rule_group_request

val make_delete_regex_pattern_set_response : unit
-> delete_regex_pattern_set_response

val make_delete_regex_pattern_set_request :
  lock_token:string -> id:string -> scope:scope -> name:string -> unit
-> delete_regex_pattern_set_request

val make_delete_permission_policy_response : unit
-> delete_permission_policy_response

val make_delete_permission_policy_request : resource_arn:string -> unit
-> delete_permission_policy_request

val make_delete_logging_configuration_response : unit
-> delete_logging_configuration_response

val make_delete_logging_configuration_request :
  ?log_scope:log_scope -> ?log_type:log_type -> resource_arn:string -> unit
-> delete_logging_configuration_request

val make_delete_ip_set_response : unit
-> delete_ip_set_response

val make_delete_ip_set_request :
  lock_token:string -> id:string -> scope:scope -> name:string -> unit
-> delete_ip_set_request

val make_delete_firewall_manager_rule_groups_response :
  ?next_web_acl_lock_token:string -> unit
-> delete_firewall_manager_rule_groups_response

val make_delete_firewall_manager_rule_groups_request :
  web_acl_lock_token:string -> web_acl_arn:string -> unit
-> delete_firewall_manager_rule_groups_request

val make_delete_api_key_response : unit
-> delete_api_key_response

val make_delete_api_key_request : api_key:string -> scope:scope -> unit
-> delete_api_key_request

val make_create_web_acl_response : ?summary:web_acl_summary -> unit
-> create_web_acl_response

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
  unit -> create_web_acl_request

val make_create_rule_group_response : ?summary:rule_group_summary -> unit
-> create_rule_group_response

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

val make_create_regex_pattern_set_response :
  ?summary:regex_pattern_set_summary -> unit
-> create_regex_pattern_set_response

val make_create_regex_pattern_set_request :
  ?tags:tag list ->
  ?description:string ->
  regular_expression_list:regex list ->
  scope:scope ->
  name:string ->
  unit -> create_regex_pattern_set_request

val make_create_ip_set_response : ?summary:ip_set_summary -> unit
-> create_ip_set_response

val make_create_ip_set_request :
  ?tags:tag list ->
  ?description:string ->
  addresses:string list ->
  ip_address_version:ip_address_version ->
  scope:scope ->
  name:string ->
  unit -> create_ip_set_request

val make_create_api_key_response : ?api_key:string -> unit
-> create_api_key_response

val make_create_api_key_request :
  token_domains:string list -> scope:scope -> unit
-> create_api_key_request

val make_check_capacity_response : ?capacity:int -> unit
-> check_capacity_response

val make_check_capacity_request : rules:rule list -> scope:scope -> unit
-> check_capacity_request

val make_associate_web_acl_response : unit
-> associate_web_acl_response

val make_associate_web_acl_request :
  resource_arn:string -> web_acl_arn:string -> unit
-> associate_web_acl_request

module UpdateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      update_web_acl_request ->
        (update_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFConfigurationWarningException of waf_configuration_warning_exception
            | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFExpiredManagedRuleGroupVersionException of waf_expired_managed_rule_group_version_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module UpdateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_group_request ->
        (update_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFConfigurationWarningException of waf_configuration_warning_exception
            | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module UpdateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_pattern_set_request ->
        (update_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module UpdateManagedRuleSetVersionExpiryDate : sig
  val request :
    Smaws_Lib.Context.t ->
      update_managed_rule_set_version_expiry_date_request ->
        (update_managed_rule_set_version_expiry_date_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module UpdateIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ip_set_request ->
        (update_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
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
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidPermissionPolicyException of waf_invalid_permission_policy_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module PutManagedRuleSetVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      put_managed_rule_set_versions_request ->
        (put_managed_rule_set_versions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFLogDestinationPermissionIssueException of waf_log_destination_permission_issue_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFServiceLinkedRoleErrorException of waf_service_linked_role_error_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListResourcesForWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_for_web_acl_request ->
        (list_resources_for_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListMobileSdkReleases : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_sdk_releases_request ->
        (list_mobile_sdk_releases_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListManagedRuleSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_managed_rule_sets_request ->
        (list_managed_rule_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListAvailableManagedRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_managed_rule_groups_request ->
        (list_available_managed_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module ListAvailableManagedRuleGroupVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_managed_rule_group_versions_request ->
        (list_available_managed_rule_group_versions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module ListAPIKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      list_api_keys_request ->
        (list_api_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            
        ]
      ) result
end

module GetWebACLForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_for_resource_request ->
        (get_web_acl_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetRateBasedStatementManagedKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_statement_managed_keys_request ->
        (get_rate_based_statement_managed_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFUnsupportedAggregateKeyTypeException of waf_unsupported_aggregate_key_type_exception
            
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
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetMobileSdkRelease : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_sdk_release_request ->
        (get_mobile_sdk_release_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetManagedRuleSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_managed_rule_set_request ->
        (get_managed_rule_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GetDecryptedAPIKey : sig
  val request :
    Smaws_Lib.Context.t ->
      get_decrypted_api_key_request ->
        (get_decrypted_api_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module GenerateMobileSdkReleaseUrl : sig
  val request :
    Smaws_Lib.Context.t ->
      generate_mobile_sdk_release_url_request ->
        (generate_mobile_sdk_release_url_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module DisassociateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_web_acl_request ->
        (disassociate_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module DescribeManagedRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_managed_rule_group_request ->
        (describe_managed_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFExpiredManagedRuleGroupVersionException of waf_expired_managed_rule_group_version_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
        ]
      ) result
end

module DescribeManagedProductsByVendor : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_managed_products_by_vendor_request ->
        (describe_managed_products_by_vendor_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module DescribeAllManagedProducts : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_all_managed_products_request ->
        (describe_all_managed_products_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            
        ]
      ) result
end

module DeleteWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_web_acl_request ->
        (delete_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFAssociatedItemException of waf_associated_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_group_request ->
        (delete_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFAssociatedItemException of waf_associated_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `WAFAssociatedItemException of waf_associated_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
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
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            
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
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module DeleteIPSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ip_set_request ->
        (delete_ip_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFAssociatedItemException of waf_associated_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module DeleteFirewallManagerRuleGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_firewall_manager_rule_groups_request ->
        (delete_firewall_manager_rule_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module DeleteAPIKey : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_api_key_request ->
        (delete_api_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            
        ]
      ) result
end

module CreateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_request ->
        (create_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFConfigurationWarningException of waf_configuration_warning_exception
            | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFExpiredManagedRuleGroupVersionException of waf_expired_managed_rule_group_version_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module CreateRuleGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_group_request ->
        (create_rule_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module CreateRegexPatternSet : sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_pattern_set_request ->
        (create_regex_pattern_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
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
            | Smaws_Lib.Protocols.AwsJson.error | `WAFDuplicateItemException of waf_duplicate_item_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFOptimisticLockException of waf_optimistic_lock_exception
            | `WAFTagOperationException of waf_tag_operation_exception
            | `WAFTagOperationInternalErrorException of waf_tag_operation_internal_error_exception
            
        ]
      ) result
end

module CreateAPIKey : sig
  val request :
    Smaws_Lib.Context.t ->
      create_api_key_request ->
        (create_api_key_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            
        ]
      ) result
end

module CheckCapacity : sig
  val request :
    Smaws_Lib.Context.t ->
      check_capacity_request ->
        (check_capacity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFExpiredManagedRuleGroupVersionException of waf_expired_managed_rule_group_version_exception
            | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFInvalidResourceException of waf_invalid_resource_exception
            | `WAFLimitsExceededException of waf_limits_exceeded_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFSubscriptionNotFoundException of waf_subscription_not_found_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

module AssociateWebACL : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_web_acl_request ->
        (associate_web_acl_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `WAFInternalErrorException of waf_internal_error_exception
            | `WAFInvalidOperationException of waf_invalid_operation_exception
            | `WAFInvalidParameterException of waf_invalid_parameter_exception
            | `WAFNonexistentItemException of waf_nonexistent_item_exception
            | `WAFUnavailableEntityException of waf_unavailable_entity_exception
            
        ]
      ) result
end

