open Smaws_Lib.Json.SerializeHelpers

open Types

let error_message_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let match_field_type_to_yojson = 
  fun (x: match_field_type) -> match x with 
 
| ALL_QUERY_ARGS -> `String "ALL_QUERY_ARGS"
  | SINGLE_QUERY_ARG -> `String "SINGLE_QUERY_ARG"
  | BODY -> `String "BODY"
  | METHOD -> `String "METHOD"
  | HEADER -> `String "HEADER"
  | QUERY_STRING -> `String "QUERY_STRING"
  | URI -> `String "URI"
   

let match_field_data_to_yojson = string_to_yojson

let field_to_match_to_yojson = 
  fun (x: field_to_match) -> assoc_to_yojson(
    [(
         "Data",
         (option_to_yojson match_field_data_to_yojson x.data));
       (
         "Type",
         (Some (match_field_type_to_yojson x.type_)));
       
  ])

let text_transformation_to_yojson = 
  fun (x: text_transformation) -> match x with 
 
| URL_DECODE -> `String "URL_DECODE"
  | CMD_LINE -> `String "CMD_LINE"
  | LOWERCASE -> `String "LOWERCASE"
  | HTML_ENTITY_DECODE -> `String "HTML_ENTITY_DECODE"
  | COMPRESS_WHITE_SPACE -> `String "COMPRESS_WHITE_SPACE"
  | NONE -> `String "NONE"
   

let xss_match_tuple_to_yojson = 
  fun (x: xss_match_tuple) -> assoc_to_yojson(
    [(
         "TextTransformation",
         (Some (text_transformation_to_yojson x.text_transformation)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       
  ])

let xss_match_tuples_to_yojson = 
  fun tree -> list_to_yojson xss_match_tuple_to_yojson tree

let change_action_to_yojson = 
  fun (x: change_action) -> match x with 
  | DELETE -> `String "DELETE"
    | INSERT -> `String "INSERT"
     

let xss_match_set_update_to_yojson = 
  fun (x: xss_match_set_update) -> assoc_to_yojson(
    [(
         "XssMatchTuple",
         (Some (xss_match_tuple_to_yojson x.xss_match_tuple)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let xss_match_set_updates_to_yojson = 
  fun tree -> list_to_yojson xss_match_set_update_to_yojson tree

let resource_id_to_yojson = string_to_yojson

let resource_name_to_yojson = string_to_yojson

let xss_match_set_summary_to_yojson = 
  fun (x: xss_match_set_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "XssMatchSetId",
         (Some (resource_id_to_yojson x.xss_match_set_id)));
       
  ])

let xss_match_set_summaries_to_yojson = 
  fun tree -> list_to_yojson xss_match_set_summary_to_yojson tree

let xss_match_set_to_yojson = 
  fun (x: xss_match_set) -> assoc_to_yojson(
    [(
         "XssMatchTuples",
         (Some (xss_match_tuples_to_yojson x.xss_match_tuples)));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "XssMatchSetId",
         (Some (resource_id_to_yojson x.xss_match_set_id)));
       
  ])

let rule_priority_to_yojson = int_to_yojson

let waf_action_type_to_yojson = 
  fun (x: waf_action_type) -> match x with 
 
| COUNT -> `String "COUNT"
  | ALLOW -> `String "ALLOW"
  | BLOCK -> `String "BLOCK"
   

let waf_action_to_yojson = 
  fun (x: waf_action) -> assoc_to_yojson(
    [(
         "Type",
         (Some (waf_action_type_to_yojson x.type_)));
       
  ])

let waf_override_action_type_to_yojson = 
  fun (x: waf_override_action_type) -> match x with 
  | COUNT -> `String "COUNT"
    | NONE -> `String "NONE"
     

let waf_override_action_to_yojson = 
  fun (x: waf_override_action) -> assoc_to_yojson(
    [(
         "Type",
         (Some (waf_override_action_type_to_yojson x.type_)));
       
  ])

let waf_rule_type_to_yojson = 
  fun (x: waf_rule_type) -> match x with 
 
| GROUP -> `String "GROUP"
  | RATE_BASED -> `String "RATE_BASED"
  | REGULAR -> `String "REGULAR"
   

let excluded_rule_to_yojson = 
  fun (x: excluded_rule) -> assoc_to_yojson(
    [(
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let excluded_rules_to_yojson = 
  fun tree -> list_to_yojson excluded_rule_to_yojson tree

let activated_rule_to_yojson = 
  fun (x: activated_rule) -> assoc_to_yojson(
    [(
         "ExcludedRules",
         (option_to_yojson excluded_rules_to_yojson x.excluded_rules));
       (
         "Type",
         (option_to_yojson waf_rule_type_to_yojson x.type_));
       (
         "OverrideAction",
         (option_to_yojson waf_override_action_to_yojson x.override_action));
       (
         "Action",
         (option_to_yojson waf_action_to_yojson x.action));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       (
         "Priority",
         (Some (rule_priority_to_yojson x.priority)));
       
  ])

let web_acl_update_to_yojson = 
  fun (x: web_acl_update) -> assoc_to_yojson(
    [(
         "ActivatedRule",
         (Some (activated_rule_to_yojson x.activated_rule)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let web_acl_updates_to_yojson = 
  fun tree -> list_to_yojson web_acl_update_to_yojson tree

let web_acl_summary_to_yojson = 
  fun (x: web_acl_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "WebACLId",
         (Some (resource_id_to_yojson x.web_acl_id)));
       
  ])

let web_acl_summaries_to_yojson = 
  fun tree -> list_to_yojson web_acl_summary_to_yojson tree

let metric_name_to_yojson = string_to_yojson

let activated_rules_to_yojson = 
  fun tree -> list_to_yojson activated_rule_to_yojson tree

let resource_arn_to_yojson = string_to_yojson

let web_ac_l_to_yojson = 
  fun (x: web_ac_l) -> assoc_to_yojson(
    [(
         "WebACLArn",
         (option_to_yojson resource_arn_to_yojson x.web_acl_arn));
       (
         "Rules",
         (Some (activated_rules_to_yojson x.rules)));
       (
         "DefaultAction",
         (Some (waf_action_to_yojson x.default_action)));
       (
         "MetricName",
         (option_to_yojson metric_name_to_yojson x.metric_name));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "WebACLId",
         (Some (resource_id_to_yojson x.web_acl_id)));
       
  ])

let waf_tag_operation_internal_error_exception_to_yojson = 
  fun (x: waf_tag_operation_internal_error_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_tag_operation_exception_to_yojson = 
  fun (x: waf_tag_operation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_subscription_not_found_exception_to_yojson = 
  fun (x: waf_subscription_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_stale_data_exception_to_yojson = 
  fun (x: waf_stale_data_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_service_linked_role_error_exception_to_yojson = 
  fun (x: waf_service_linked_role_error_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_referenced_item_exception_to_yojson = 
  fun (x: waf_referenced_item_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_nonexistent_item_exception_to_yojson = 
  fun (x: waf_nonexistent_item_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_nonexistent_container_exception_to_yojson = 
  fun (x: waf_nonexistent_container_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_non_empty_entity_exception_to_yojson = 
  fun (x: waf_non_empty_entity_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_limits_exceeded_exception_to_yojson = 
  fun (x: waf_limits_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_invalid_regex_pattern_exception_to_yojson = 
  fun (x: waf_invalid_regex_pattern_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_invalid_permission_policy_exception_to_yojson = 
  fun (x: waf_invalid_permission_policy_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let parameter_exception_field_to_yojson = 
  fun (x: parameter_exception_field) -> match x with 
 
| TAG_KEYS -> `String "TAG_KEYS"
  | TAGS -> `String "TAGS"
  | RESOURCE_ARN -> `String "RESOURCE_ARN"
  | NEXT_MARKER -> `String "NEXT_MARKER"
  | RULE_TYPE -> `String "RULE_TYPE"
  | RATE_KEY -> `String "RATE_KEY"
  | GEO_MATCH_LOCATION_VALUE -> `String "GEO_MATCH_LOCATION_VALUE"
  | GEO_MATCH_LOCATION_TYPE -> `String "GEO_MATCH_LOCATION_TYPE"
  | SIZE_CONSTRAINT_COMPARISON_OPERATOR -> `String "SIZE_CONSTRAINT_COMPARISON_OPERATOR"
  | BYTE_MATCH_POSITIONAL_CONSTRAINT -> `String "BYTE_MATCH_POSITIONAL_CONSTRAINT"
  | BYTE_MATCH_TEXT_TRANSFORMATION -> `String "BYTE_MATCH_TEXT_TRANSFORMATION"
  | SQL_INJECTION_MATCH_FIELD_TYPE -> `String "SQL_INJECTION_MATCH_FIELD_TYPE"
  | BYTE_MATCH_FIELD_TYPE -> `String "BYTE_MATCH_FIELD_TYPE"
  | IPSET_TYPE -> `String "IPSET_TYPE"
  | PREDICATE_TYPE -> `String "PREDICATE_TYPE"
  | WAF_OVERRIDE_ACTION -> `String "WAF_OVERRIDE_ACTION"
  | WAF_ACTION -> `String "WAF_ACTION"
  | CHANGE_ACTION -> `String "CHANGE_ACTION"
   

let parameter_exception_parameter_to_yojson = string_to_yojson

let parameter_exception_reason_to_yojson = 
  fun (x: parameter_exception_reason) -> match x with 
 
| INVALID_TAG_KEY -> `String "INVALID_TAG_KEY"
  | ILLEGAL_ARGUMENT -> `String "ILLEGAL_ARGUMENT"
  | ILLEGAL_COMBINATION -> `String "ILLEGAL_COMBINATION"
  | INVALID_OPTION -> `String "INVALID_OPTION"
   

let waf_invalid_parameter_exception_to_yojson = 
  fun (x: waf_invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "reason",
         (option_to_yojson parameter_exception_reason_to_yojson x.reason));
       (
         "parameter",
         (option_to_yojson parameter_exception_parameter_to_yojson x.parameter));
       (
         "field",
         (option_to_yojson parameter_exception_field_to_yojson x.field));
       
  ])

let waf_invalid_operation_exception_to_yojson = 
  fun (x: waf_invalid_operation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_invalid_account_exception_to_yojson = 
  fun (x: waf_invalid_account_exception) -> assoc_to_yojson(
    [
  ])

let waf_internal_error_exception_to_yojson = 
  fun (x: waf_internal_error_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let migration_error_type_to_yojson = 
  fun (x: migration_error_type) -> match x with 
 
| S3_INTERNAL_ERROR -> `String "S3_INTERNAL_ERROR"
  | S3_BUCKET_INVALID_REGION -> `String "S3_BUCKET_INVALID_REGION"
  | S3_BUCKET_NOT_FOUND -> `String "S3_BUCKET_NOT_FOUND"
  | S3_BUCKET_NOT_ACCESSIBLE -> `String "S3_BUCKET_NOT_ACCESSIBLE"
  | S3_BUCKET_NO_PERMISSION -> `String "S3_BUCKET_NO_PERMISSION"
  | ENTITY_NOT_FOUND -> `String "ENTITY_NOT_FOUND"
  | ENTITY_NOT_SUPPORTED -> `String "ENTITY_NOT_SUPPORTED"
   

let error_reason_to_yojson = string_to_yojson

let waf_entity_migration_exception_to_yojson = 
  fun (x: waf_entity_migration_exception) -> assoc_to_yojson(
    [(
         "MigrationErrorReason",
         (option_to_yojson error_reason_to_yojson x.migration_error_reason));
       (
         "MigrationErrorType",
         (option_to_yojson migration_error_type_to_yojson x.migration_error_type));
       (
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_disallowed_name_exception_to_yojson = 
  fun (x: waf_disallowed_name_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let waf_bad_request_exception_to_yojson = 
  fun (x: waf_bad_request_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let change_token_to_yojson = string_to_yojson

let update_xss_match_set_response_to_yojson = 
  fun (x: update_xss_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let update_xss_match_set_request_to_yojson = 
  fun (x: update_xss_match_set_request) -> assoc_to_yojson(
    [(
         "Updates",
         (Some (xss_match_set_updates_to_yojson x.updates)));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "XssMatchSetId",
         (Some (resource_id_to_yojson x.xss_match_set_id)));
       
  ])

let update_web_acl_response_to_yojson = 
  fun (x: update_web_acl_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let update_web_acl_request_to_yojson = 
  fun (x: update_web_acl_request) -> assoc_to_yojson(
    [(
         "DefaultAction",
         (option_to_yojson waf_action_to_yojson x.default_action));
       (
         "Updates",
         (option_to_yojson web_acl_updates_to_yojson x.updates));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "WebACLId",
         (Some (resource_id_to_yojson x.web_acl_id)));
       
  ])

let update_sql_injection_match_set_response_to_yojson = 
  fun (x: update_sql_injection_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let sql_injection_match_tuple_to_yojson = 
  fun (x: sql_injection_match_tuple) -> assoc_to_yojson(
    [(
         "TextTransformation",
         (Some (text_transformation_to_yojson x.text_transformation)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       
  ])

let sql_injection_match_set_update_to_yojson = 
  fun (x: sql_injection_match_set_update) -> assoc_to_yojson(
    [(
         "SqlInjectionMatchTuple",
         (Some (sql_injection_match_tuple_to_yojson x.sql_injection_match_tuple)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let sql_injection_match_set_updates_to_yojson = 
  fun tree -> list_to_yojson sql_injection_match_set_update_to_yojson tree

let update_sql_injection_match_set_request_to_yojson = 
  fun (x: update_sql_injection_match_set_request) -> assoc_to_yojson(
    [(
         "Updates",
         (Some (sql_injection_match_set_updates_to_yojson x.updates)));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "SqlInjectionMatchSetId",
         (Some (resource_id_to_yojson x.sql_injection_match_set_id)));
       
  ])

let update_size_constraint_set_response_to_yojson = 
  fun (x: update_size_constraint_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let comparison_operator_to_yojson = 
  fun (x: comparison_operator) -> match x with 
 
| GT -> `String "GT"
  | GE -> `String "GE"
  | LT -> `String "LT"
  | LE -> `String "LE"
  | NE -> `String "NE"
  | EQ -> `String "EQ"
   

let size_to_yojson = long_to_yojson

let size_constraint_to_yojson = 
  fun (x: size_constraint) -> assoc_to_yojson(
    [(
         "Size",
         (Some (size_to_yojson x.size)));
       (
         "ComparisonOperator",
         (Some (comparison_operator_to_yojson x.comparison_operator)));
       (
         "TextTransformation",
         (Some (text_transformation_to_yojson x.text_transformation)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       
  ])

let size_constraint_set_update_to_yojson = 
  fun (x: size_constraint_set_update) -> assoc_to_yojson(
    [(
         "SizeConstraint",
         (Some (size_constraint_to_yojson x.size_constraint)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let size_constraint_set_updates_to_yojson = 
  fun tree -> list_to_yojson size_constraint_set_update_to_yojson tree

let update_size_constraint_set_request_to_yojson = 
  fun (x: update_size_constraint_set_request) -> assoc_to_yojson(
    [(
         "Updates",
         (Some (size_constraint_set_updates_to_yojson x.updates)));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "SizeConstraintSetId",
         (Some (resource_id_to_yojson x.size_constraint_set_id)));
       
  ])

let update_rule_response_to_yojson = 
  fun (x: update_rule_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let negated_to_yojson = bool_to_yojson

let predicate_type_to_yojson = 
  fun (x: predicate_type) -> match x with 
 
| REGEX_MATCH -> `String "RegexMatch"
  | XSS_MATCH -> `String "XssMatch"
  | SIZE_CONSTRAINT -> `String "SizeConstraint"
  | GEO_MATCH -> `String "GeoMatch"
  | SQL_INJECTION_MATCH -> `String "SqlInjectionMatch"
  | BYTE_MATCH -> `String "ByteMatch"
  | IP_MATCH -> `String "IPMatch"
   

let predicate_to_yojson = 
  fun (x: predicate) -> assoc_to_yojson(
    [(
         "DataId",
         (Some (resource_id_to_yojson x.data_id)));
       (
         "Type",
         (Some (predicate_type_to_yojson x.type_)));
       (
         "Negated",
         (Some (negated_to_yojson x.negated)));
       
  ])

let rule_update_to_yojson = 
  fun (x: rule_update) -> assoc_to_yojson(
    [(
         "Predicate",
         (Some (predicate_to_yojson x.predicate)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let rule_updates_to_yojson = 
  fun tree -> list_to_yojson rule_update_to_yojson tree

let update_rule_request_to_yojson = 
  fun (x: update_rule_request) -> assoc_to_yojson(
    [(
         "Updates",
         (Some (rule_updates_to_yojson x.updates)));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let update_rule_group_response_to_yojson = 
  fun (x: update_rule_group_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let rule_group_update_to_yojson = 
  fun (x: rule_group_update) -> assoc_to_yojson(
    [(
         "ActivatedRule",
         (Some (activated_rule_to_yojson x.activated_rule)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let rule_group_updates_to_yojson = 
  fun tree -> list_to_yojson rule_group_update_to_yojson tree

let update_rule_group_request_to_yojson = 
  fun (x: update_rule_group_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Updates",
         (Some (rule_group_updates_to_yojson x.updates)));
       (
         "RuleGroupId",
         (Some (resource_id_to_yojson x.rule_group_id)));
       
  ])

let update_regex_pattern_set_response_to_yojson = 
  fun (x: update_regex_pattern_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let regex_pattern_string_to_yojson = string_to_yojson

let regex_pattern_set_update_to_yojson = 
  fun (x: regex_pattern_set_update) -> assoc_to_yojson(
    [(
         "RegexPatternString",
         (Some (regex_pattern_string_to_yojson x.regex_pattern_string)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let regex_pattern_set_updates_to_yojson = 
  fun tree -> list_to_yojson regex_pattern_set_update_to_yojson tree

let update_regex_pattern_set_request_to_yojson = 
  fun (x: update_regex_pattern_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Updates",
         (Some (regex_pattern_set_updates_to_yojson x.updates)));
       (
         "RegexPatternSetId",
         (Some (resource_id_to_yojson x.regex_pattern_set_id)));
       
  ])

let update_regex_match_set_response_to_yojson = 
  fun (x: update_regex_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let regex_match_tuple_to_yojson = 
  fun (x: regex_match_tuple) -> assoc_to_yojson(
    [(
         "RegexPatternSetId",
         (Some (resource_id_to_yojson x.regex_pattern_set_id)));
       (
         "TextTransformation",
         (Some (text_transformation_to_yojson x.text_transformation)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       
  ])

let regex_match_set_update_to_yojson = 
  fun (x: regex_match_set_update) -> assoc_to_yojson(
    [(
         "RegexMatchTuple",
         (Some (regex_match_tuple_to_yojson x.regex_match_tuple)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let regex_match_set_updates_to_yojson = 
  fun tree -> list_to_yojson regex_match_set_update_to_yojson tree

let update_regex_match_set_request_to_yojson = 
  fun (x: update_regex_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Updates",
         (Some (regex_match_set_updates_to_yojson x.updates)));
       (
         "RegexMatchSetId",
         (Some (resource_id_to_yojson x.regex_match_set_id)));
       
  ])

let update_rate_based_rule_response_to_yojson = 
  fun (x: update_rate_based_rule_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let rate_limit_to_yojson = long_to_yojson

let update_rate_based_rule_request_to_yojson = 
  fun (x: update_rate_based_rule_request) -> assoc_to_yojson(
    [(
         "RateLimit",
         (Some (rate_limit_to_yojson x.rate_limit)));
       (
         "Updates",
         (Some (rule_updates_to_yojson x.updates)));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let update_ip_set_response_to_yojson = 
  fun (x: update_ip_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let ip_set_descriptor_type_to_yojson = 
  fun (x: ip_set_descriptor_type) -> match x with 
  | IPV6 -> `String "IPV6"
    | IPV4 -> `String "IPV4"
     

let ip_set_descriptor_value_to_yojson = string_to_yojson

let ip_set_descriptor_to_yojson = 
  fun (x: ip_set_descriptor) -> assoc_to_yojson(
    [(
         "Value",
         (Some (ip_set_descriptor_value_to_yojson x.value)));
       (
         "Type",
         (Some (ip_set_descriptor_type_to_yojson x.type_)));
       
  ])

let ip_set_update_to_yojson = 
  fun (x: ip_set_update) -> assoc_to_yojson(
    [(
         "IPSetDescriptor",
         (Some (ip_set_descriptor_to_yojson x.ip_set_descriptor)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let ip_set_updates_to_yojson = 
  fun tree -> list_to_yojson ip_set_update_to_yojson tree

let update_ip_set_request_to_yojson = 
  fun (x: update_ip_set_request) -> assoc_to_yojson(
    [(
         "Updates",
         (Some (ip_set_updates_to_yojson x.updates)));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "IPSetId",
         (Some (resource_id_to_yojson x.ip_set_id)));
       
  ])

let update_geo_match_set_response_to_yojson = 
  fun (x: update_geo_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let geo_match_constraint_type_to_yojson = 
  fun (x: geo_match_constraint_type) -> match x with 
  | Country -> `String "Country"
     

let geo_match_constraint_value_to_yojson = 
  fun (x: geo_match_constraint_value) -> match x with 
 
| ZW -> `String "ZW"
  | ZM -> `String "ZM"
  | YE -> `String "YE"
  | EH -> `String "EH"
  | WF -> `String "WF"
  | VI -> `String "VI"
  | VG -> `String "VG"
  | VN -> `String "VN"
  | VE -> `String "VE"
  | VU -> `String "VU"
  | UZ -> `String "UZ"
  | UY -> `String "UY"
  | UM -> `String "UM"
  | US -> `String "US"
  | GB -> `String "GB"
  | AE -> `String "AE"
  | UA -> `String "UA"
  | UG -> `String "UG"
  | TV -> `String "TV"
  | TC -> `String "TC"
  | TM -> `String "TM"
  | TR -> `String "TR"
  | TN -> `String "TN"
  | TT -> `String "TT"
  | TO -> `String "TO"
  | TK -> `String "TK"
  | TG -> `String "TG"
  | TL -> `String "TL"
  | TH -> `String "TH"
  | TZ -> `String "TZ"
  | TJ -> `String "TJ"
  | TW -> `String "TW"
  | SY -> `String "SY"
  | CH -> `String "CH"
  | SE -> `String "SE"
  | SZ -> `String "SZ"
  | SJ -> `String "SJ"
  | SR -> `String "SR"
  | SD -> `String "SD"
  | LK -> `String "LK"
  | ES -> `String "ES"
  | SS -> `String "SS"
  | GS -> `String "GS"
  | ZA -> `String "ZA"
  | SO -> `String "SO"
  | SB -> `String "SB"
  | SI -> `String "SI"
  | SK -> `String "SK"
  | SX -> `String "SX"
  | SG -> `String "SG"
  | SL -> `String "SL"
  | SC -> `String "SC"
  | RS -> `String "RS"
  | SN -> `String "SN"
  | SA -> `String "SA"
  | ST -> `String "ST"
  | SM -> `String "SM"
  | WS -> `String "WS"
  | VC -> `String "VC"
  | PM -> `String "PM"
  | MF -> `String "MF"
  | LC -> `String "LC"
  | KN -> `String "KN"
  | SH -> `String "SH"
  | BL -> `String "BL"
  | RW -> `String "RW"
  | RU -> `String "RU"
  | RO -> `String "RO"
  | RE -> `String "RE"
  | QA -> `String "QA"
  | PR -> `String "PR"
  | PT -> `String "PT"
  | PL -> `String "PL"
  | PN -> `String "PN"
  | PH -> `String "PH"
  | PE -> `String "PE"
  | PY -> `String "PY"
  | PG -> `String "PG"
  | PA -> `String "PA"
  | PS -> `String "PS"
  | PW -> `String "PW"
  | PK -> `String "PK"
  | OM -> `String "OM"
  | NO -> `String "NO"
  | MP -> `String "MP"
  | NF -> `String "NF"
  | NU -> `String "NU"
  | NG -> `String "NG"
  | NE -> `String "NE"
  | NI -> `String "NI"
  | NZ -> `String "NZ"
  | NC -> `String "NC"
  | NL -> `String "NL"
  | NP -> `String "NP"
  | NR -> `String "NR"
  | NA -> `String "NA"
  | MM -> `String "MM"
  | MZ -> `String "MZ"
  | MA -> `String "MA"
  | MS -> `String "MS"
  | ME -> `String "ME"
  | MN -> `String "MN"
  | MC -> `String "MC"
  | MD -> `String "MD"
  | FM -> `String "FM"
  | MX -> `String "MX"
  | YT -> `String "YT"
  | MU -> `String "MU"
  | MR -> `String "MR"
  | MQ -> `String "MQ"
  | MH -> `String "MH"
  | MT -> `String "MT"
  | ML -> `String "ML"
  | MV -> `String "MV"
  | MY -> `String "MY"
  | MW -> `String "MW"
  | MG -> `String "MG"
  | MK -> `String "MK"
  | MO -> `String "MO"
  | LU -> `String "LU"
  | LT -> `String "LT"
  | LI -> `String "LI"
  | LY -> `String "LY"
  | LR -> `String "LR"
  | LS -> `String "LS"
  | LB -> `String "LB"
  | LV -> `String "LV"
  | LA -> `String "LA"
  | KG -> `String "KG"
  | KW -> `String "KW"
  | KR -> `String "KR"
  | KP -> `String "KP"
  | KI -> `String "KI"
  | KE -> `String "KE"
  | KZ -> `String "KZ"
  | JO -> `String "JO"
  | JE -> `String "JE"
  | JP -> `String "JP"
  | JM -> `String "JM"
  | IT -> `String "IT"
  | IL -> `String "IL"
  | IM -> `String "IM"
  | IE -> `String "IE"
  | IQ -> `String "IQ"
  | IR -> `String "IR"
  | ID -> `String "ID"
  | IN -> `String "IN"
  | IS -> `String "IS"
  | HU -> `String "HU"
  | HK -> `String "HK"
  | HN -> `String "HN"
  | VA -> `String "VA"
  | HM -> `String "HM"
  | HT -> `String "HT"
  | GY -> `String "GY"
  | GW -> `String "GW"
  | GN -> `String "GN"
  | GG -> `String "GG"
  | GT -> `String "GT"
  | GU -> `String "GU"
  | GP -> `String "GP"
  | GD -> `String "GD"
  | GL -> `String "GL"
  | GR -> `String "GR"
  | GI -> `String "GI"
  | GH -> `String "GH"
  | DE -> `String "DE"
  | GE -> `String "GE"
  | GM -> `String "GM"
  | GA -> `String "GA"
  | TF -> `String "TF"
  | PF -> `String "PF"
  | GF -> `String "GF"
  | FR -> `String "FR"
  | FI -> `String "FI"
  | FJ -> `String "FJ"
  | FO -> `String "FO"
  | FK -> `String "FK"
  | ET -> `String "ET"
  | EE -> `String "EE"
  | ER -> `String "ER"
  | GQ -> `String "GQ"
  | SV -> `String "SV"
  | EG -> `String "EG"
  | EC -> `String "EC"
  | DO -> `String "DO"
  | DM -> `String "DM"
  | DJ -> `String "DJ"
  | DK -> `String "DK"
  | CZ -> `String "CZ"
  | CY -> `String "CY"
  | CW -> `String "CW"
  | CU -> `String "CU"
  | HR -> `String "HR"
  | CI -> `String "CI"
  | CR -> `String "CR"
  | CK -> `String "CK"
  | CD -> `String "CD"
  | CG -> `String "CG"
  | KM -> `String "KM"
  | CO -> `String "CO"
  | CC -> `String "CC"
  | CX -> `String "CX"
  | CN -> `String "CN"
  | CL -> `String "CL"
  | TD -> `String "TD"
  | CF -> `String "CF"
  | KY -> `String "KY"
  | CV -> `String "CV"
  | CA -> `String "CA"
  | CM -> `String "CM"
  | KH -> `String "KH"
  | BI -> `String "BI"
  | BF -> `String "BF"
  | BG -> `String "BG"
  | BN -> `String "BN"
  | IO -> `String "IO"
  | BR -> `String "BR"
  | BV -> `String "BV"
  | BW -> `String "BW"
  | BA -> `String "BA"
  | BQ -> `String "BQ"
  | BO -> `String "BO"
  | BT -> `String "BT"
  | BM -> `String "BM"
  | BJ -> `String "BJ"
  | BZ -> `String "BZ"
  | BE -> `String "BE"
  | BY -> `String "BY"
  | BB -> `String "BB"
  | BD -> `String "BD"
  | BH -> `String "BH"
  | BS -> `String "BS"
  | AZ -> `String "AZ"
  | AT -> `String "AT"
  | AU -> `String "AU"
  | AW -> `String "AW"
  | AM -> `String "AM"
  | AR -> `String "AR"
  | AG -> `String "AG"
  | AQ -> `String "AQ"
  | AI -> `String "AI"
  | AO -> `String "AO"
  | AD -> `String "AD"
  | AS -> `String "AS"
  | DZ -> `String "DZ"
  | AL -> `String "AL"
  | AX -> `String "AX"
  | AF -> `String "AF"
   

let geo_match_constraint_to_yojson = 
  fun (x: geo_match_constraint) -> assoc_to_yojson(
    [(
         "Value",
         (Some (geo_match_constraint_value_to_yojson x.value)));
       (
         "Type",
         (Some (geo_match_constraint_type_to_yojson x.type_)));
       
  ])

let geo_match_set_update_to_yojson = 
  fun (x: geo_match_set_update) -> assoc_to_yojson(
    [(
         "GeoMatchConstraint",
         (Some (geo_match_constraint_to_yojson x.geo_match_constraint)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let geo_match_set_updates_to_yojson = 
  fun tree -> list_to_yojson geo_match_set_update_to_yojson tree

let update_geo_match_set_request_to_yojson = 
  fun (x: update_geo_match_set_request) -> assoc_to_yojson(
    [(
         "Updates",
         (Some (geo_match_set_updates_to_yojson x.updates)));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "GeoMatchSetId",
         (Some (resource_id_to_yojson x.geo_match_set_id)));
       
  ])

let update_byte_match_set_response_to_yojson = 
  fun (x: update_byte_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let byte_match_target_string_to_yojson = blob_to_yojson

let positional_constraint_to_yojson = 
  fun (x: positional_constraint) -> match x with 
 
| CONTAINS_WORD -> `String "CONTAINS_WORD"
  | CONTAINS -> `String "CONTAINS"
  | ENDS_WITH -> `String "ENDS_WITH"
  | STARTS_WITH -> `String "STARTS_WITH"
  | EXACTLY -> `String "EXACTLY"
   

let byte_match_tuple_to_yojson = 
  fun (x: byte_match_tuple) -> assoc_to_yojson(
    [(
         "PositionalConstraint",
         (Some (positional_constraint_to_yojson x.positional_constraint)));
       (
         "TextTransformation",
         (Some (text_transformation_to_yojson x.text_transformation)));
       (
         "TargetString",
         (Some (byte_match_target_string_to_yojson x.target_string)));
       (
         "FieldToMatch",
         (Some (field_to_match_to_yojson x.field_to_match)));
       
  ])

let byte_match_set_update_to_yojson = 
  fun (x: byte_match_set_update) -> assoc_to_yojson(
    [(
         "ByteMatchTuple",
         (Some (byte_match_tuple_to_yojson x.byte_match_tuple)));
       (
         "Action",
         (Some (change_action_to_yojson x.action)));
       
  ])

let byte_match_set_updates_to_yojson = 
  fun tree -> list_to_yojson byte_match_set_update_to_yojson tree

let update_byte_match_set_request_to_yojson = 
  fun (x: update_byte_match_set_request) -> assoc_to_yojson(
    [(
         "Updates",
         (Some (byte_match_set_updates_to_yojson x.updates)));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "ByteMatchSetId",
         (Some (resource_id_to_yojson x.byte_match_set_id)));
       
  ])

let untag_resource_response_to_yojson = 
  fun (x: untag_resource_response) -> assoc_to_yojson(
    [
  ])

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
         (Some (resource_arn_to_yojson x.resource_ar_n)));
       
  ])

let uri_string_to_yojson = string_to_yojson

let timestamp__to_yojson = timestamp_to_yojson

let time_window_to_yojson = 
  fun (x: time_window) -> assoc_to_yojson(
    [(
         "EndTime",
         (Some (timestamp__to_yojson x.end_time)));
       (
         "StartTime",
         (Some (timestamp__to_yojson x.start_time)));
       
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
         (Some (resource_arn_to_yojson x.resource_ar_n)));
       
  ])

let tag_info_for_resource_to_yojson = 
  fun (x: tag_info_for_resource) -> assoc_to_yojson(
    [(
         "TagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       (
         "ResourceARN",
         (option_to_yojson resource_arn_to_yojson x.resource_ar_n));
       
  ])

let subscribed_rule_group_summary_to_yojson = 
  fun (x: subscribed_rule_group_summary) -> assoc_to_yojson(
    [(
         "MetricName",
         (Some (metric_name_to_yojson x.metric_name)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "RuleGroupId",
         (Some (resource_id_to_yojson x.rule_group_id)));
       
  ])

let subscribed_rule_group_summaries_to_yojson = 
  fun tree -> list_to_yojson subscribed_rule_group_summary_to_yojson tree

let sql_injection_match_tuples_to_yojson = 
  fun tree -> list_to_yojson sql_injection_match_tuple_to_yojson tree

let sql_injection_match_set_summary_to_yojson = 
  fun (x: sql_injection_match_set_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "SqlInjectionMatchSetId",
         (Some (resource_id_to_yojson x.sql_injection_match_set_id)));
       
  ])

let sql_injection_match_set_summaries_to_yojson = 
  fun tree -> list_to_yojson sql_injection_match_set_summary_to_yojson tree

let sql_injection_match_set_to_yojson = 
  fun (x: sql_injection_match_set) -> assoc_to_yojson(
    [(
         "SqlInjectionMatchTuples",
         (Some (sql_injection_match_tuples_to_yojson x.sql_injection_match_tuples)));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "SqlInjectionMatchSetId",
         (Some (resource_id_to_yojson x.sql_injection_match_set_id)));
       
  ])

let size_constraints_to_yojson = 
  fun tree -> list_to_yojson size_constraint_to_yojson tree

let size_constraint_set_summary_to_yojson = 
  fun (x: size_constraint_set_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "SizeConstraintSetId",
         (Some (resource_id_to_yojson x.size_constraint_set_id)));
       
  ])

let size_constraint_set_summaries_to_yojson = 
  fun tree -> list_to_yojson size_constraint_set_summary_to_yojson tree

let size_constraint_set_to_yojson = 
  fun (x: size_constraint_set) -> assoc_to_yojson(
    [(
         "SizeConstraints",
         (Some (size_constraints_to_yojson x.size_constraints)));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "SizeConstraintSetId",
         (Some (resource_id_to_yojson x.size_constraint_set_id)));
       
  ])

let ip_string_to_yojson = string_to_yojson

let country_to_yojson = string_to_yojson

let http_method_to_yojson = string_to_yojson

let http_version_to_yojson = string_to_yojson

let header_name_to_yojson = string_to_yojson

let header_value_to_yojson = string_to_yojson

let http_header_to_yojson = 
  fun (x: http_header) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson header_value_to_yojson x.value));
       (
         "Name",
         (option_to_yojson header_name_to_yojson x.name));
       
  ])

let http_headers_to_yojson = 
  fun tree -> list_to_yojson http_header_to_yojson tree

let http_request_to_yojson = 
  fun (x: http_request) -> assoc_to_yojson(
    [(
         "Headers",
         (option_to_yojson http_headers_to_yojson x.headers));
       (
         "HTTPVersion",
         (option_to_yojson http_version_to_yojson x.http_version));
       (
         "Method",
         (option_to_yojson http_method_to_yojson x.method_));
       (
         "URI",
         (option_to_yojson uri_string_to_yojson x.ur_i));
       (
         "Country",
         (option_to_yojson country_to_yojson x.country));
       (
         "ClientIP",
         (option_to_yojson ip_string_to_yojson x.client_i_p));
       
  ])

let sample_weight_to_yojson = long_to_yojson

let action_to_yojson = string_to_yojson

let sampled_http_request_to_yojson = 
  fun (x: sampled_http_request) -> assoc_to_yojson(
    [(
         "RuleWithinRuleGroup",
         (option_to_yojson resource_id_to_yojson x.rule_within_rule_group));
       (
         "Action",
         (option_to_yojson action_to_yojson x.action));
       (
         "Timestamp",
         (option_to_yojson timestamp__to_yojson x.timestamp_));
       (
         "Weight",
         (Some (sample_weight_to_yojson x.weight)));
       (
         "Request",
         (Some (http_request_to_yojson x.request)));
       
  ])

let sampled_http_requests_to_yojson = 
  fun tree -> list_to_yojson sampled_http_request_to_yojson tree

let s3_object_url_to_yojson = string_to_yojson

let s3_bucket_name_to_yojson = string_to_yojson

let rule_summary_to_yojson = 
  fun (x: rule_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let rule_summaries_to_yojson = 
  fun tree -> list_to_yojson rule_summary_to_yojson tree

let rule_group_summary_to_yojson = 
  fun (x: rule_group_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "RuleGroupId",
         (Some (resource_id_to_yojson x.rule_group_id)));
       
  ])

let rule_group_summaries_to_yojson = 
  fun tree -> list_to_yojson rule_group_summary_to_yojson tree

let rule_group_to_yojson = 
  fun (x: rule_group) -> assoc_to_yojson(
    [(
         "MetricName",
         (option_to_yojson metric_name_to_yojson x.metric_name));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "RuleGroupId",
         (Some (resource_id_to_yojson x.rule_group_id)));
       
  ])

let predicates_to_yojson = 
  fun tree -> list_to_yojson predicate_to_yojson tree

let rule_to_yojson = 
  fun (x: rule) -> assoc_to_yojson(
    [(
         "Predicates",
         (Some (predicates_to_yojson x.predicates)));
       (
         "MetricName",
         (option_to_yojson metric_name_to_yojson x.metric_name));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let regex_pattern_strings_to_yojson = 
  fun tree -> list_to_yojson regex_pattern_string_to_yojson tree

let regex_pattern_set_summary_to_yojson = 
  fun (x: regex_pattern_set_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "RegexPatternSetId",
         (Some (resource_id_to_yojson x.regex_pattern_set_id)));
       
  ])

let regex_pattern_set_summaries_to_yojson = 
  fun tree -> list_to_yojson regex_pattern_set_summary_to_yojson tree

let regex_pattern_set_to_yojson = 
  fun (x: regex_pattern_set) -> assoc_to_yojson(
    [(
         "RegexPatternStrings",
         (Some (regex_pattern_strings_to_yojson x.regex_pattern_strings)));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "RegexPatternSetId",
         (Some (resource_id_to_yojson x.regex_pattern_set_id)));
       
  ])

let regex_match_tuples_to_yojson = 
  fun tree -> list_to_yojson regex_match_tuple_to_yojson tree

let regex_match_set_summary_to_yojson = 
  fun (x: regex_match_set_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "RegexMatchSetId",
         (Some (resource_id_to_yojson x.regex_match_set_id)));
       
  ])

let regex_match_set_summaries_to_yojson = 
  fun tree -> list_to_yojson regex_match_set_summary_to_yojson tree

let regex_match_set_to_yojson = 
  fun (x: regex_match_set) -> assoc_to_yojson(
    [(
         "RegexMatchTuples",
         (option_to_yojson regex_match_tuples_to_yojson x.regex_match_tuples));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "RegexMatchSetId",
         (option_to_yojson resource_id_to_yojson x.regex_match_set_id));
       
  ])

let redacted_fields_to_yojson = 
  fun tree -> list_to_yojson field_to_match_to_yojson tree

let rate_key_to_yojson = 
  fun (x: rate_key) -> match x with 
  | IP -> `String "IP"
     

let rate_based_rule_to_yojson = 
  fun (x: rate_based_rule) -> assoc_to_yojson(
    [(
         "RateLimit",
         (Some (rate_limit_to_yojson x.rate_limit)));
       (
         "RateKey",
         (Some (rate_key_to_yojson x.rate_key)));
       (
         "MatchPredicates",
         (Some (predicates_to_yojson x.match_predicates)));
       (
         "MetricName",
         (option_to_yojson metric_name_to_yojson x.metric_name));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let put_permission_policy_response_to_yojson = 
  fun (x: put_permission_policy_response) -> assoc_to_yojson(
    [
  ])

let policy_string_to_yojson = string_to_yojson

let put_permission_policy_request_to_yojson = 
  fun (x: put_permission_policy_request) -> assoc_to_yojson(
    [(
         "Policy",
         (Some (policy_string_to_yojson x.policy)));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let log_destination_configs_to_yojson = 
  fun tree -> list_to_yojson resource_arn_to_yojson tree

let logging_configuration_to_yojson = 
  fun (x: logging_configuration) -> assoc_to_yojson(
    [(
         "RedactedFields",
         (option_to_yojson redacted_fields_to_yojson x.redacted_fields));
       (
         "LogDestinationConfigs",
         (Some (log_destination_configs_to_yojson x.log_destination_configs)));
       (
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let put_logging_configuration_response_to_yojson = 
  fun (x: put_logging_configuration_response) -> assoc_to_yojson(
    [(
         "LoggingConfiguration",
         (option_to_yojson logging_configuration_to_yojson x.logging_configuration));
       
  ])

let put_logging_configuration_request_to_yojson = 
  fun (x: put_logging_configuration_request) -> assoc_to_yojson(
    [(
         "LoggingConfiguration",
         (Some (logging_configuration_to_yojson x.logging_configuration)));
       
  ])

let population_size_to_yojson = long_to_yojson

let pagination_limit_to_yojson = int_to_yojson

let next_marker_to_yojson = string_to_yojson

let managed_key_to_yojson = string_to_yojson

let managed_keys_to_yojson = 
  fun tree -> list_to_yojson managed_key_to_yojson tree

let logging_configurations_to_yojson = 
  fun tree -> list_to_yojson logging_configuration_to_yojson tree

let list_xss_match_sets_response_to_yojson = 
  fun (x: list_xss_match_sets_response) -> assoc_to_yojson(
    [(
         "XssMatchSets",
         (option_to_yojson xss_match_set_summaries_to_yojson x.xss_match_sets));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_xss_match_sets_request_to_yojson = 
  fun (x: list_xss_match_sets_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_web_ac_ls_response_to_yojson = 
  fun (x: list_web_ac_ls_response) -> assoc_to_yojson(
    [(
         "WebACLs",
         (option_to_yojson web_acl_summaries_to_yojson x.web_ac_ls));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_web_ac_ls_request_to_yojson = 
  fun (x: list_web_ac_ls_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "TagInfoForResource",
         (option_to_yojson tag_info_for_resource_to_yojson x.tag_info_for_resource));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceARN",
         (Some (resource_arn_to_yojson x.resource_ar_n)));
       (
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_subscribed_rule_groups_response_to_yojson = 
  fun (x: list_subscribed_rule_groups_response) -> assoc_to_yojson(
    [(
         "RuleGroups",
         (option_to_yojson subscribed_rule_group_summaries_to_yojson x.rule_groups));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_subscribed_rule_groups_request_to_yojson = 
  fun (x: list_subscribed_rule_groups_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_sql_injection_match_sets_response_to_yojson = 
  fun (x: list_sql_injection_match_sets_response) -> assoc_to_yojson(
    [(
         "SqlInjectionMatchSets",
         (option_to_yojson sql_injection_match_set_summaries_to_yojson x.sql_injection_match_sets));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_sql_injection_match_sets_request_to_yojson = 
  fun (x: list_sql_injection_match_sets_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_size_constraint_sets_response_to_yojson = 
  fun (x: list_size_constraint_sets_response) -> assoc_to_yojson(
    [(
         "SizeConstraintSets",
         (option_to_yojson size_constraint_set_summaries_to_yojson x.size_constraint_sets));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_size_constraint_sets_request_to_yojson = 
  fun (x: list_size_constraint_sets_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_rules_response_to_yojson = 
  fun (x: list_rules_response) -> assoc_to_yojson(
    [(
         "Rules",
         (option_to_yojson rule_summaries_to_yojson x.rules));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_rules_request_to_yojson = 
  fun (x: list_rules_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_rule_groups_response_to_yojson = 
  fun (x: list_rule_groups_response) -> assoc_to_yojson(
    [(
         "RuleGroups",
         (option_to_yojson rule_group_summaries_to_yojson x.rule_groups));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_rule_groups_request_to_yojson = 
  fun (x: list_rule_groups_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_regex_pattern_sets_response_to_yojson = 
  fun (x: list_regex_pattern_sets_response) -> assoc_to_yojson(
    [(
         "RegexPatternSets",
         (option_to_yojson regex_pattern_set_summaries_to_yojson x.regex_pattern_sets));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_regex_pattern_sets_request_to_yojson = 
  fun (x: list_regex_pattern_sets_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_regex_match_sets_response_to_yojson = 
  fun (x: list_regex_match_sets_response) -> assoc_to_yojson(
    [(
         "RegexMatchSets",
         (option_to_yojson regex_match_set_summaries_to_yojson x.regex_match_sets));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_regex_match_sets_request_to_yojson = 
  fun (x: list_regex_match_sets_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_rate_based_rules_response_to_yojson = 
  fun (x: list_rate_based_rules_response) -> assoc_to_yojson(
    [(
         "Rules",
         (option_to_yojson rule_summaries_to_yojson x.rules));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_rate_based_rules_request_to_yojson = 
  fun (x: list_rate_based_rules_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_logging_configurations_response_to_yojson = 
  fun (x: list_logging_configurations_response) -> assoc_to_yojson(
    [(
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "LoggingConfigurations",
         (option_to_yojson logging_configurations_to_yojson x.logging_configurations));
       
  ])

let list_logging_configurations_request_to_yojson = 
  fun (x: list_logging_configurations_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let ip_set_summary_to_yojson = 
  fun (x: ip_set_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "IPSetId",
         (Some (resource_id_to_yojson x.ip_set_id)));
       
  ])

let ip_set_summaries_to_yojson = 
  fun tree -> list_to_yojson ip_set_summary_to_yojson tree

let list_ip_sets_response_to_yojson = 
  fun (x: list_ip_sets_response) -> assoc_to_yojson(
    [(
         "IPSets",
         (option_to_yojson ip_set_summaries_to_yojson x.ip_sets));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_ip_sets_request_to_yojson = 
  fun (x: list_ip_sets_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let geo_match_set_summary_to_yojson = 
  fun (x: geo_match_set_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "GeoMatchSetId",
         (Some (resource_id_to_yojson x.geo_match_set_id)));
       
  ])

let geo_match_set_summaries_to_yojson = 
  fun tree -> list_to_yojson geo_match_set_summary_to_yojson tree

let list_geo_match_sets_response_to_yojson = 
  fun (x: list_geo_match_sets_response) -> assoc_to_yojson(
    [(
         "GeoMatchSets",
         (option_to_yojson geo_match_set_summaries_to_yojson x.geo_match_sets));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_geo_match_sets_request_to_yojson = 
  fun (x: list_geo_match_sets_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let byte_match_set_summary_to_yojson = 
  fun (x: byte_match_set_summary) -> assoc_to_yojson(
    [(
         "Name",
         (Some (resource_name_to_yojson x.name)));
       (
         "ByteMatchSetId",
         (Some (resource_id_to_yojson x.byte_match_set_id)));
       
  ])

let byte_match_set_summaries_to_yojson = 
  fun tree -> list_to_yojson byte_match_set_summary_to_yojson tree

let list_byte_match_sets_response_to_yojson = 
  fun (x: list_byte_match_sets_response) -> assoc_to_yojson(
    [(
         "ByteMatchSets",
         (option_to_yojson byte_match_set_summaries_to_yojson x.byte_match_sets));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_byte_match_sets_request_to_yojson = 
  fun (x: list_byte_match_sets_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_activated_rules_in_rule_group_response_to_yojson = 
  fun (x: list_activated_rules_in_rule_group_response) -> assoc_to_yojson(
    [(
         "ActivatedRules",
         (option_to_yojson activated_rules_to_yojson x.activated_rules));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       
  ])

let list_activated_rules_in_rule_group_request_to_yojson = 
  fun (x: list_activated_rules_in_rule_group_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson pagination_limit_to_yojson x.limit));
       (
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "RuleGroupId",
         (option_to_yojson resource_id_to_yojson x.rule_group_id));
       
  ])

let ignore_unsupported_type_to_yojson = bool_to_yojson

let ip_set_descriptors_to_yojson = 
  fun tree -> list_to_yojson ip_set_descriptor_to_yojson tree

let ip_set_to_yojson = 
  fun (x: ip_set) -> assoc_to_yojson(
    [(
         "IPSetDescriptors",
         (Some (ip_set_descriptors_to_yojson x.ip_set_descriptors)));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "IPSetId",
         (Some (resource_id_to_yojson x.ip_set_id)));
       
  ])

let get_xss_match_set_response_to_yojson = 
  fun (x: get_xss_match_set_response) -> assoc_to_yojson(
    [(
         "XssMatchSet",
         (option_to_yojson xss_match_set_to_yojson x.xss_match_set));
       
  ])

let get_xss_match_set_request_to_yojson = 
  fun (x: get_xss_match_set_request) -> assoc_to_yojson(
    [(
         "XssMatchSetId",
         (Some (resource_id_to_yojson x.xss_match_set_id)));
       
  ])

let get_web_acl_response_to_yojson = 
  fun (x: get_web_acl_response) -> assoc_to_yojson(
    [(
         "WebACL",
         (option_to_yojson web_ac_l_to_yojson x.web_ac_l));
       
  ])

let get_web_acl_request_to_yojson = 
  fun (x: get_web_acl_request) -> assoc_to_yojson(
    [(
         "WebACLId",
         (Some (resource_id_to_yojson x.web_acl_id)));
       
  ])

let get_sql_injection_match_set_response_to_yojson = 
  fun (x: get_sql_injection_match_set_response) -> assoc_to_yojson(
    [(
         "SqlInjectionMatchSet",
         (option_to_yojson sql_injection_match_set_to_yojson x.sql_injection_match_set));
       
  ])

let get_sql_injection_match_set_request_to_yojson = 
  fun (x: get_sql_injection_match_set_request) -> assoc_to_yojson(
    [(
         "SqlInjectionMatchSetId",
         (Some (resource_id_to_yojson x.sql_injection_match_set_id)));
       
  ])

let get_size_constraint_set_response_to_yojson = 
  fun (x: get_size_constraint_set_response) -> assoc_to_yojson(
    [(
         "SizeConstraintSet",
         (option_to_yojson size_constraint_set_to_yojson x.size_constraint_set));
       
  ])

let get_size_constraint_set_request_to_yojson = 
  fun (x: get_size_constraint_set_request) -> assoc_to_yojson(
    [(
         "SizeConstraintSetId",
         (Some (resource_id_to_yojson x.size_constraint_set_id)));
       
  ])

let get_sampled_requests_response_to_yojson = 
  fun (x: get_sampled_requests_response) -> assoc_to_yojson(
    [(
         "TimeWindow",
         (option_to_yojson time_window_to_yojson x.time_window));
       (
         "PopulationSize",
         (option_to_yojson population_size_to_yojson x.population_size));
       (
         "SampledRequests",
         (option_to_yojson sampled_http_requests_to_yojson x.sampled_requests));
       
  ])

let get_sampled_requests_max_items_to_yojson = long_to_yojson

let get_sampled_requests_request_to_yojson = 
  fun (x: get_sampled_requests_request) -> assoc_to_yojson(
    [(
         "MaxItems",
         (Some (get_sampled_requests_max_items_to_yojson x.max_items)));
       (
         "TimeWindow",
         (Some (time_window_to_yojson x.time_window)));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       (
         "WebAclId",
         (Some (resource_id_to_yojson x.web_acl_id)));
       
  ])

let get_rule_response_to_yojson = 
  fun (x: get_rule_response) -> assoc_to_yojson(
    [(
         "Rule",
         (option_to_yojson rule_to_yojson x.rule));
       
  ])

let get_rule_request_to_yojson = 
  fun (x: get_rule_request) -> assoc_to_yojson(
    [(
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let get_rule_group_response_to_yojson = 
  fun (x: get_rule_group_response) -> assoc_to_yojson(
    [(
         "RuleGroup",
         (option_to_yojson rule_group_to_yojson x.rule_group));
       
  ])

let get_rule_group_request_to_yojson = 
  fun (x: get_rule_group_request) -> assoc_to_yojson(
    [(
         "RuleGroupId",
         (Some (resource_id_to_yojson x.rule_group_id)));
       
  ])

let get_regex_pattern_set_response_to_yojson = 
  fun (x: get_regex_pattern_set_response) -> assoc_to_yojson(
    [(
         "RegexPatternSet",
         (option_to_yojson regex_pattern_set_to_yojson x.regex_pattern_set));
       
  ])

let get_regex_pattern_set_request_to_yojson = 
  fun (x: get_regex_pattern_set_request) -> assoc_to_yojson(
    [(
         "RegexPatternSetId",
         (Some (resource_id_to_yojson x.regex_pattern_set_id)));
       
  ])

let get_regex_match_set_response_to_yojson = 
  fun (x: get_regex_match_set_response) -> assoc_to_yojson(
    [(
         "RegexMatchSet",
         (option_to_yojson regex_match_set_to_yojson x.regex_match_set));
       
  ])

let get_regex_match_set_request_to_yojson = 
  fun (x: get_regex_match_set_request) -> assoc_to_yojson(
    [(
         "RegexMatchSetId",
         (Some (resource_id_to_yojson x.regex_match_set_id)));
       
  ])

let get_rate_based_rule_response_to_yojson = 
  fun (x: get_rate_based_rule_response) -> assoc_to_yojson(
    [(
         "Rule",
         (option_to_yojson rate_based_rule_to_yojson x.rule));
       
  ])

let get_rate_based_rule_request_to_yojson = 
  fun (x: get_rate_based_rule_request) -> assoc_to_yojson(
    [(
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let get_rate_based_rule_managed_keys_response_to_yojson = 
  fun (x: get_rate_based_rule_managed_keys_response) -> assoc_to_yojson(
    [(
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "ManagedKeys",
         (option_to_yojson managed_keys_to_yojson x.managed_keys));
       
  ])

let get_rate_based_rule_managed_keys_request_to_yojson = 
  fun (x: get_rate_based_rule_managed_keys_request) -> assoc_to_yojson(
    [(
         "NextMarker",
         (option_to_yojson next_marker_to_yojson x.next_marker));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let get_permission_policy_response_to_yojson = 
  fun (x: get_permission_policy_response) -> assoc_to_yojson(
    [(
         "Policy",
         (option_to_yojson policy_string_to_yojson x.policy));
       
  ])

let get_permission_policy_request_to_yojson = 
  fun (x: get_permission_policy_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let get_logging_configuration_response_to_yojson = 
  fun (x: get_logging_configuration_response) -> assoc_to_yojson(
    [(
         "LoggingConfiguration",
         (option_to_yojson logging_configuration_to_yojson x.logging_configuration));
       
  ])

let get_logging_configuration_request_to_yojson = 
  fun (x: get_logging_configuration_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let get_ip_set_response_to_yojson = 
  fun (x: get_ip_set_response) -> assoc_to_yojson(
    [(
         "IPSet",
         (option_to_yojson ip_set_to_yojson x.ip_set));
       
  ])

let get_ip_set_request_to_yojson = 
  fun (x: get_ip_set_request) -> assoc_to_yojson(
    [(
         "IPSetId",
         (Some (resource_id_to_yojson x.ip_set_id)));
       
  ])

let geo_match_constraints_to_yojson = 
  fun tree -> list_to_yojson geo_match_constraint_to_yojson tree

let geo_match_set_to_yojson = 
  fun (x: geo_match_set) -> assoc_to_yojson(
    [(
         "GeoMatchConstraints",
         (Some (geo_match_constraints_to_yojson x.geo_match_constraints)));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "GeoMatchSetId",
         (Some (resource_id_to_yojson x.geo_match_set_id)));
       
  ])

let get_geo_match_set_response_to_yojson = 
  fun (x: get_geo_match_set_response) -> assoc_to_yojson(
    [(
         "GeoMatchSet",
         (option_to_yojson geo_match_set_to_yojson x.geo_match_set));
       
  ])

let get_geo_match_set_request_to_yojson = 
  fun (x: get_geo_match_set_request) -> assoc_to_yojson(
    [(
         "GeoMatchSetId",
         (Some (resource_id_to_yojson x.geo_match_set_id)));
       
  ])

let change_token_status_to_yojson = 
  fun (x: change_token_status) -> match x with 
 
| INSYNC -> `String "INSYNC"
  | PENDING -> `String "PENDING"
  | PROVISIONED -> `String "PROVISIONED"
   

let get_change_token_status_response_to_yojson = 
  fun (x: get_change_token_status_response) -> assoc_to_yojson(
    [(
         "ChangeTokenStatus",
         (option_to_yojson change_token_status_to_yojson x.change_token_status));
       
  ])

let get_change_token_status_request_to_yojson = 
  fun (x: get_change_token_status_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       
  ])

let get_change_token_response_to_yojson = 
  fun (x: get_change_token_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let get_change_token_request_to_yojson = 
  fun (x: get_change_token_request) -> assoc_to_yojson(
    [
  ])

let byte_match_tuples_to_yojson = 
  fun tree -> list_to_yojson byte_match_tuple_to_yojson tree

let byte_match_set_to_yojson = 
  fun (x: byte_match_set) -> assoc_to_yojson(
    [(
         "ByteMatchTuples",
         (Some (byte_match_tuples_to_yojson x.byte_match_tuples)));
       (
         "Name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "ByteMatchSetId",
         (Some (resource_id_to_yojson x.byte_match_set_id)));
       
  ])

let get_byte_match_set_response_to_yojson = 
  fun (x: get_byte_match_set_response) -> assoc_to_yojson(
    [(
         "ByteMatchSet",
         (option_to_yojson byte_match_set_to_yojson x.byte_match_set));
       
  ])

let get_byte_match_set_request_to_yojson = 
  fun (x: get_byte_match_set_request) -> assoc_to_yojson(
    [(
         "ByteMatchSetId",
         (Some (resource_id_to_yojson x.byte_match_set_id)));
       
  ])

let delete_xss_match_set_response_to_yojson = 
  fun (x: delete_xss_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_xss_match_set_request_to_yojson = 
  fun (x: delete_xss_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "XssMatchSetId",
         (Some (resource_id_to_yojson x.xss_match_set_id)));
       
  ])

let delete_web_acl_response_to_yojson = 
  fun (x: delete_web_acl_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_web_acl_request_to_yojson = 
  fun (x: delete_web_acl_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "WebACLId",
         (Some (resource_id_to_yojson x.web_acl_id)));
       
  ])

let delete_sql_injection_match_set_response_to_yojson = 
  fun (x: delete_sql_injection_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_sql_injection_match_set_request_to_yojson = 
  fun (x: delete_sql_injection_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "SqlInjectionMatchSetId",
         (Some (resource_id_to_yojson x.sql_injection_match_set_id)));
       
  ])

let delete_size_constraint_set_response_to_yojson = 
  fun (x: delete_size_constraint_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_size_constraint_set_request_to_yojson = 
  fun (x: delete_size_constraint_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "SizeConstraintSetId",
         (Some (resource_id_to_yojson x.size_constraint_set_id)));
       
  ])

let delete_rule_response_to_yojson = 
  fun (x: delete_rule_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_rule_request_to_yojson = 
  fun (x: delete_rule_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let delete_rule_group_response_to_yojson = 
  fun (x: delete_rule_group_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_rule_group_request_to_yojson = 
  fun (x: delete_rule_group_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "RuleGroupId",
         (Some (resource_id_to_yojson x.rule_group_id)));
       
  ])

let delete_regex_pattern_set_response_to_yojson = 
  fun (x: delete_regex_pattern_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_regex_pattern_set_request_to_yojson = 
  fun (x: delete_regex_pattern_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "RegexPatternSetId",
         (Some (resource_id_to_yojson x.regex_pattern_set_id)));
       
  ])

let delete_regex_match_set_response_to_yojson = 
  fun (x: delete_regex_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_regex_match_set_request_to_yojson = 
  fun (x: delete_regex_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "RegexMatchSetId",
         (Some (resource_id_to_yojson x.regex_match_set_id)));
       
  ])

let delete_rate_based_rule_response_to_yojson = 
  fun (x: delete_rate_based_rule_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_rate_based_rule_request_to_yojson = 
  fun (x: delete_rate_based_rule_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "RuleId",
         (Some (resource_id_to_yojson x.rule_id)));
       
  ])

let delete_permission_policy_response_to_yojson = 
  fun (x: delete_permission_policy_response) -> assoc_to_yojson(
    [
  ])

let delete_permission_policy_request_to_yojson = 
  fun (x: delete_permission_policy_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let delete_logging_configuration_response_to_yojson = 
  fun (x: delete_logging_configuration_response) -> assoc_to_yojson(
    [
  ])

let delete_logging_configuration_request_to_yojson = 
  fun (x: delete_logging_configuration_request) -> assoc_to_yojson(
    [(
         "ResourceArn",
         (Some (resource_arn_to_yojson x.resource_arn)));
       
  ])

let delete_ip_set_response_to_yojson = 
  fun (x: delete_ip_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_ip_set_request_to_yojson = 
  fun (x: delete_ip_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "IPSetId",
         (Some (resource_id_to_yojson x.ip_set_id)));
       
  ])

let delete_geo_match_set_response_to_yojson = 
  fun (x: delete_geo_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_geo_match_set_request_to_yojson = 
  fun (x: delete_geo_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "GeoMatchSetId",
         (Some (resource_id_to_yojson x.geo_match_set_id)));
       
  ])

let delete_byte_match_set_response_to_yojson = 
  fun (x: delete_byte_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       
  ])

let delete_byte_match_set_request_to_yojson = 
  fun (x: delete_byte_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "ByteMatchSetId",
         (Some (resource_id_to_yojson x.byte_match_set_id)));
       
  ])

let create_xss_match_set_response_to_yojson = 
  fun (x: create_xss_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "XssMatchSet",
         (option_to_yojson xss_match_set_to_yojson x.xss_match_set));
       
  ])

let create_xss_match_set_request_to_yojson = 
  fun (x: create_xss_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_web_acl_response_to_yojson = 
  fun (x: create_web_acl_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "WebACL",
         (option_to_yojson web_ac_l_to_yojson x.web_ac_l));
       
  ])

let create_web_acl_request_to_yojson = 
  fun (x: create_web_acl_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "DefaultAction",
         (Some (waf_action_to_yojson x.default_action)));
       (
         "MetricName",
         (Some (metric_name_to_yojson x.metric_name)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_web_acl_migration_stack_response_to_yojson = 
  fun (x: create_web_acl_migration_stack_response) -> assoc_to_yojson(
    [(
         "S3ObjectUrl",
         (Some (s3_object_url_to_yojson x.s3_object_url)));
       
  ])

let create_web_acl_migration_stack_request_to_yojson = 
  fun (x: create_web_acl_migration_stack_request) -> assoc_to_yojson(
    [(
         "IgnoreUnsupportedType",
         (Some (ignore_unsupported_type_to_yojson x.ignore_unsupported_type)));
       (
         "S3BucketName",
         (Some (s3_bucket_name_to_yojson x.s3_bucket_name)));
       (
         "WebACLId",
         (Some (resource_id_to_yojson x.web_acl_id)));
       
  ])

let create_sql_injection_match_set_response_to_yojson = 
  fun (x: create_sql_injection_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "SqlInjectionMatchSet",
         (option_to_yojson sql_injection_match_set_to_yojson x.sql_injection_match_set));
       
  ])

let create_sql_injection_match_set_request_to_yojson = 
  fun (x: create_sql_injection_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_size_constraint_set_response_to_yojson = 
  fun (x: create_size_constraint_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "SizeConstraintSet",
         (option_to_yojson size_constraint_set_to_yojson x.size_constraint_set));
       
  ])

let create_size_constraint_set_request_to_yojson = 
  fun (x: create_size_constraint_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_rule_response_to_yojson = 
  fun (x: create_rule_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "Rule",
         (option_to_yojson rule_to_yojson x.rule));
       
  ])

let create_rule_request_to_yojson = 
  fun (x: create_rule_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "MetricName",
         (Some (metric_name_to_yojson x.metric_name)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_rule_group_response_to_yojson = 
  fun (x: create_rule_group_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "RuleGroup",
         (option_to_yojson rule_group_to_yojson x.rule_group));
       
  ])

let create_rule_group_request_to_yojson = 
  fun (x: create_rule_group_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "MetricName",
         (Some (metric_name_to_yojson x.metric_name)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_regex_pattern_set_response_to_yojson = 
  fun (x: create_regex_pattern_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "RegexPatternSet",
         (option_to_yojson regex_pattern_set_to_yojson x.regex_pattern_set));
       
  ])

let create_regex_pattern_set_request_to_yojson = 
  fun (x: create_regex_pattern_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_regex_match_set_response_to_yojson = 
  fun (x: create_regex_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "RegexMatchSet",
         (option_to_yojson regex_match_set_to_yojson x.regex_match_set));
       
  ])

let create_regex_match_set_request_to_yojson = 
  fun (x: create_regex_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_rate_based_rule_response_to_yojson = 
  fun (x: create_rate_based_rule_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "Rule",
         (option_to_yojson rate_based_rule_to_yojson x.rule));
       
  ])

let create_rate_based_rule_request_to_yojson = 
  fun (x: create_rate_based_rule_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "RateLimit",
         (Some (rate_limit_to_yojson x.rate_limit)));
       (
         "RateKey",
         (Some (rate_key_to_yojson x.rate_key)));
       (
         "MetricName",
         (Some (metric_name_to_yojson x.metric_name)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_ip_set_response_to_yojson = 
  fun (x: create_ip_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "IPSet",
         (option_to_yojson ip_set_to_yojson x.ip_set));
       
  ])

let create_ip_set_request_to_yojson = 
  fun (x: create_ip_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_geo_match_set_response_to_yojson = 
  fun (x: create_geo_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "GeoMatchSet",
         (option_to_yojson geo_match_set_to_yojson x.geo_match_set));
       
  ])

let create_geo_match_set_request_to_yojson = 
  fun (x: create_geo_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let create_byte_match_set_response_to_yojson = 
  fun (x: create_byte_match_set_response) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (option_to_yojson change_token_to_yojson x.change_token));
       (
         "ByteMatchSet",
         (option_to_yojson byte_match_set_to_yojson x.byte_match_set));
       
  ])

let create_byte_match_set_request_to_yojson = 
  fun (x: create_byte_match_set_request) -> assoc_to_yojson(
    [(
         "ChangeToken",
         (Some (change_token_to_yojson x.change_token)));
       (
         "Name",
         (Some (resource_name_to_yojson x.name)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

